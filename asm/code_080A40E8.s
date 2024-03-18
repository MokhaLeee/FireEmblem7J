	.include "macro.inc"
	.syntax unified

	thumb_func_start LoadSaveMenuHelpText
LoadSaveMenuHelpText: @ 0x080A40E8
	push {r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A40FC
	movs r0, #0
	b _080A418E
_080A40FC:
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r1, sp
	adds r1, #0x2b
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	bne _080A412C
	ldr r1, _080A4128 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	movs r0, #1
	b _080A418E
	.align 2, 0
_080A4128: .4byte gPlaySt
_080A412C:
	ldr r2, _080A414C @ =gPlaySt
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r5, [r1]
	orrs r0, r5
	strb r0, [r1]
	add r0, sp, #0x20
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A4150
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	b _080A4154
	.align 2, 0
_080A414C: .4byte gPlaySt
_080A4150:
	bl SetTacticianName
_080A4154:
	ldr r3, _080A4198 @ =gPlaySt
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #0x1f
	adds r2, r3, #0
	adds r2, #0x2c
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r5, [r2]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r4]
	adds r3, #0x2b
	movs r1, #0xe
	ands r1, r2
	movs r0, #0xf
	rsbs r0, r0, #0
	ldrb r4, [r3]
	ands r0, r4
	orrs r0, r1
	lsrs r2, r2, #4
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	movs r0, #2
_080A418E:
	add sp, #0x48
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A4198: .4byte gPlaySt

	thumb_func_start SaveMenuPostChapterHandleHelpBox
SaveMenuPostChapterHandleHelpBox: @ 0x080A419C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #8
	adds r5, r6, #0
	adds r5, #0x40
	ldrb r0, [r5]
	cmp r0, #8
	bne _080A41CC
	ldr r0, _080A41C8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf9
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A4228
	bl CloseHelpBox
	movs r0, #7
	strb r0, [r5]
	b _080A4228
	.align 2, 0
_080A41C8: .4byte gpKeySt
_080A41CC:
	ldr r0, _080A4200 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A4228
	adds r4, r6, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	bl LoadSaveMenuHelpText
	cmp r0, #0
	bne _080A4208
	ldr r0, _080A4204 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4228
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A4228
	.align 2, 0
_080A4200: .4byte gpKeySt
_080A4204: .4byte gPlaySt
_080A4208:
	cmp r0, #0
	blt _080A4228
	cmp r0, #2
	bgt _080A4228
	ldr r0, _080A4244 @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldrb r4, [r4]
	lsls r1, r4, #5
	adds r1, #0x2c
	ldr r2, _080A4248 @ =0x0000FFFF
	movs r0, #0x50
	bl StartItemHelpBox
	strb r7, [r5]
_080A4228:
	adds r1, r6, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A4240
	cmp r0, r7
	bge _080A423A
	subs r0, #1
	strb r0, [r1]
_080A423A:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A424C
_080A4240:
	movs r0, #0
	b _080A424E
	.align 2, 0
_080A4244: .4byte 0x06013800
_080A4248: .4byte 0x0000FFFF
_080A424C:
	movs r0, #1
_080A424E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80A4254
sub_80A4254: @ 0x080A4254
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_8082E6C
	movs r4, #0
	ldr r6, _080A4284 @ =0x0001FFFF
	movs r5, #0xb4
	lsls r5, r5, #9
_080A4268:
	adds r0, r7, #0
	adds r0, #0x37
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A4288
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	ldrb r1, [r1]
	bl sub_8082E2C
	b _080A4296
	.align 2, 0
_080A4284: .4byte 0x0001FFFF
_080A4288:
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_8082E2C
_080A4296:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #2
	ble _080A4268
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SaveMenu_Init
SaveMenu_Init: @ 0x080A42A8
	push {lr}
	ldr r0, _080A4318 @ =gUnk_08DAD33C
	bl InitBgs
	ldr r2, _080A431C @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
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
	movs r0, #3
	ldrb r3, [r2, #0xc]
	orrs r0, r3
	strb r0, [r2, #0xc]
	adds r1, #0x1d
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	strb r0, [r2, #0x10]
	adds r0, r1, #0
	ldrb r3, [r2, #0x14]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_080A4318: .4byte gUnk_08DAD33C
_080A431C: .4byte gDispIo

	thumb_func_start ProcSaveMenu_InitScreen
ProcSaveMenu_InitScreen: @ 0x080A4320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A44FC @ =gUnk_0842D800
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r4, _080A4500 @ =Img_MuralBackground
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A4504 @ =gBg0Tm
	ldr r1, _080A4508 @ =gUnk_0842D860
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _080A450C @ =gUnk_08432594
	movs r1, #0x88
	lsls r1, r1, #2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r2, r5, #0
	bl ApplyPaletteExt
	ldr r0, _080A4510 @ =gUnk_08432694
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A4514 @ =gUnk_08432AE8
	ldr r1, _080A4518 @ =0x02000004
	movs r2, #2
	bl sub_80A5E18
	movs r0, #0xf
	bl EnableBgSync
	mov r0, r8
	adds r0, #0x29
	movs r4, #0
	strb r4, [r0]
	ldr r2, _080A451C @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x35
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A4520 @ =gUnk_0842FF00
	ldr r1, _080A4524 @ =0x06010800
	bl Decompress
	mov r0, r8
	adds r0, #0x36
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3d
	strb r4, [r0]
	bl sub_80A6C74
	movs r7, #0
	ldr r2, _080A4528 @ =gSinLut
	mov sl, r2
	mov sb, r5
_080A43D2:
	ldr r1, _080A452C @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080A452C @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r7, #1
	cmp r7, #3
	ble _080A43D2
	mov r1, r8
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #5
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3e
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	ldr r1, _080A4530 @ =gAnims
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A4534 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A4538 @ =SaveMenuOnHBlank
	bl SetOnHBlankA
	ldr r4, _080A453C @ =gUnk_0842DD14
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A4540 @ =gBg3Tm
	ldr r1, _080A4544 @ =gUnk_0842FD94
	movs r2, #0
	movs r3, #5
	bl sub_8001F14
	movs r0, #8
	bl EnableBgSync
	movs r7, #0
	mov r4, r8
	adds r4, #0x2c
_080A4492:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	bl sub_80A7058
	adds r7, #1
	cmp r7, #3
	ble _080A4492
	ldrb r0, [r4]
	bl sub_80A715C
	bl sub_80A6BB0
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080A451C @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080A4548 @ =gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	mov r0, r8
	bl sub_80A4254
	mov r0, r8
	bl sub_80A6908
	mov r2, r8
	str r0, [r2, #0x58]
	mov r0, r8
	bl sub_80A69A0
	mov r1, r8
	str r0, [r1, #0x5c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A44FC: .4byte gUnk_0842D800
_080A4500: .4byte Img_MuralBackground
_080A4504: .4byte gBg0Tm
_080A4508: .4byte gUnk_0842D860
_080A450C: .4byte gUnk_08432594
_080A4510: .4byte gUnk_08432694
_080A4514: .4byte gUnk_08432AE8
_080A4518: .4byte 0x02000004
_080A451C: .4byte gDispIo
_080A4520: .4byte gUnk_0842FF00
_080A4524: .4byte 0x06010800
_080A4528: .4byte gSinLut
_080A452C: .4byte gCosLut
_080A4530: .4byte gAnims
_080A4534: .4byte 0x02000001
_080A4538: .4byte SaveMenuOnHBlank
_080A453C: .4byte gUnk_0842DD14
_080A4540: .4byte gBg3Tm
_080A4544: .4byte gUnk_0842FD94
_080A4548: .4byte gPal

	thumb_func_start SaveMenu_LoadExtraMenuGraphics
SaveMenu_LoadExtraMenuGraphics: @ 0x080A454C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080A457C @ =gUnk_0843165C
	ldr r1, _080A4580 @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl sub_80A6CD0
	adds r6, r5, #0
	adds r6, #0x42
	ldrh r0, [r6]
	cmp r0, #0x20
	bne _080A4584
	movs r0, #0x20
	adds r1, r5, #0
	bl SaveMenuGetValidMenuAmt
	adds r1, r5, #0
	adds r1, #0x2b
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x2e
	b _080A45B2
	.align 2, 0
_080A457C: .4byte gUnk_0843165C
_080A4580: .4byte 0x06013800
_080A4584:
	adds r4, r5, #0
	adds r4, #0x2e
	movs r1, #0
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0x2b
	strb r1, [r2]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x16
	ldrb r0, [r0]
	ldrb r1, [r2]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
_080A45B2:
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A45C0
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
_080A45C0:
	ldrb r4, [r4]
	cmp r4, #5
	bne _080A45CE
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
_080A45CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SaveMenuInit
SaveMenuInit: @ 0x080A45D4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl ReadLastGameSaveId
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SaveMenuInitUnused
SaveMenuInitUnused: @ 0x080A4618
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl ReadLastGameSaveId
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SaveMenu_080A465C
SaveMenu_080A465C: @ 0x080A465C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start Loop6C_savemenu
Loop6C_savemenu: @ 0x080A466C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080A469C @ =gpKeySt
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080A46B4
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A46A0
	subs r0, #1
	b _080A46D2
	.align 2, 0
_080A469C: .4byte gpKeySt
_080A46A0:
	adds r0, r2, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A470E
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	b _080A46D2
_080A46B4:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A470E
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A46F0
	adds r0, r2, #1
_080A46D2:
	strb r0, [r1]
	ldr r0, _080A46E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A470E
	ldr r0, _080A46EC @ =0x00000386
	bl m4aSongNumStart
	b _080A470E
	.align 2, 0
_080A46E8: .4byte gPlaySt
_080A46EC: .4byte 0x00000386
_080A46F0:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A470E
	strb r4, [r1]
	ldr r0, _080A4768 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A470E
	ldr r0, _080A476C @ =0x00000386
	bl m4aSongNumStart
_080A470E:
	ldr r0, _080A4770 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A471E
	b _080A48B0
_080A471E:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x42
	strh r0, [r4]
	ldr r0, _080A4768 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A474A
	ldr r0, _080A4774 @ =0x0000038A
	bl m4aSongNumStart
_080A474A:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bls _080A475C
	b _080A48DC
_080A475C:
	lsls r0, r0, #2
	ldr r1, _080A4778 @ =_080A477C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A4768: .4byte gPlaySt
_080A476C: .4byte 0x00000386
_080A4770: .4byte gpKeySt
_080A4774: .4byte 0x0000038A
_080A4778: .4byte _080A477C
_080A477C: @ jump table
	.4byte _080A47FC @ case 0
	.4byte _080A4808 @ case 1
	.4byte _080A48DC @ case 2
	.4byte _080A4820 @ case 3
	.4byte _080A48DC @ case 4
	.4byte _080A48DC @ case 5
	.4byte _080A48DC @ case 6
	.4byte _080A4838 @ case 7
	.4byte _080A48DC @ case 8
	.4byte _080A48DC @ case 9
	.4byte _080A48DC @ case 10
	.4byte _080A48DC @ case 11
	.4byte _080A48DC @ case 12
	.4byte _080A48DC @ case 13
	.4byte _080A48DC @ case 14
	.4byte _080A4850 @ case 15
	.4byte _080A48DC @ case 16
	.4byte _080A48DC @ case 17
	.4byte _080A48DC @ case 18
	.4byte _080A48DC @ case 19
	.4byte _080A48DC @ case 20
	.4byte _080A48DC @ case 21
	.4byte _080A48DC @ case 22
	.4byte _080A48DC @ case 23
	.4byte _080A48DC @ case 24
	.4byte _080A48DC @ case 25
	.4byte _080A48DC @ case 26
	.4byte _080A48DC @ case 27
	.4byte _080A48DC @ case 28
	.4byte _080A48DC @ case 29
	.4byte _080A48DC @ case 30
	.4byte _080A4892 @ case 31
_080A47FC:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	subs r0, #0x13
	strb r1, [r0]
	b _080A4870
_080A4808:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80A6DD4
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A4870
_080A4820:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80A6DD4
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A4870
_080A4838:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80A6DD4
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A4870
_080A4850:
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #1
	bl sub_80A6DD4
	strb r0, [r4]
	bl sub_809F40C
	cmp r0, #0
	bne _080A487A
	movs r0, #0
	movs r1, #0
	bl sub_80A5B20
_080A4870:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080A48DC
_080A487A:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A48DC
_080A4892:
	adds r1, r5, #0
	adds r1, #0x34
	adds r0, r5, #0
	adds r0, #0x33
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r2, r0
	blo _080A48A6
	movs r0, #0
	strb r0, [r1]
_080A48A6:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080A48DC
_080A48B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A48DC
	ldr r0, _080A48E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A48CA
	ldr r0, _080A48E8 @ =0x0000038B
	bl m4aSongNumStart
_080A48CA:
	adds r0, r5, #0
	movs r1, #0x12
	bl Proc_Goto
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_080A48DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A48E4: .4byte gPlaySt
_080A48E8: .4byte 0x0000038B

	thumb_func_start SaveMenuWriteNewGame
SaveMenuWriteNewGame: @ 0x080A48EC
	push {r4, lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r4, [r1]
	rsbs r0, r4, #0
	orrs r0, r4
	lsrs r1, r0, #0x1f
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A4908
	movs r2, #1
_080A4908:
	cmp r0, #1
	bne _080A490E
	movs r2, #2
_080A490E:
	cmp r0, #2
	bne _080A4914
	movs r2, #3
_080A4914:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl WriteNewGameSave
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A4924
sub_80A4924: @ 0x080A4924
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A49D4
	ldr r0, _080A495C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4944
	ldr r0, _080A4960 @ =0x0000038A
	bl m4aSongNumStart
_080A4944:
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A49AA
	cmp r0, #8
	bgt _080A4964
	cmp r0, #2
	beq _080A49BC
	cmp r0, #4
	beq _080A4978
	b _080A49CC
	.align 2, 0
_080A495C: .4byte gPlaySt
_080A4960: .4byte 0x0000038A
_080A4964:
	cmp r0, #0x20
	beq _080A49BC
	cmp r0, #0x20
	bgt _080A4972
	cmp r0, #0x10
	beq _080A49BC
	b _080A49CC
_080A4972:
	cmp r0, #0x40
	beq _080A49AE
	b _080A49CC
_080A4978:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080A4994
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A6E44
	b _080A4B00
_080A4994:
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	bl CopyGameSave
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080A4B00
_080A49AA:
	movs r0, #2
	b _080A49B0
_080A49AE:
	movs r0, #1
_080A49B0:
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A6C3C
	b _080A49CC
_080A49BC:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A6C3C
_080A49CC:
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
	b _080A4B00
_080A49D4:
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r0, [r5]
	cmp r0, #0x10
	beq _080A4A40
	cmp r0, #0x10
	bgt _080A49EC
	cmp r0, #2
	beq _080A4A12
	cmp r0, #8
	beq _080A4A4C
	b _080A4AF2
_080A49EC:
	cmp r0, #0x20
	beq _080A49F6
	cmp r0, #0x40
	beq _080A4A9C
	b _080A4AF2
_080A49F6:
	cmp r1, #1
	bne _080A4A80
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl ReadGameSave
	adds r0, r4, #0
	movs r1, #0xe
	b _080A4A5E
_080A4A12:
	cmp r1, #1
	bne _080A4A80
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _080A4A38 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4A30
	ldr r0, _080A4A3C @ =0x0000038A
	bl m4aSongNumStart
_080A4A30:
	adds r0, r4, #0
	bl sub_80A3FC8
	b _080A4AF2
	.align 2, 0
_080A4A38: .4byte gPlaySt
_080A4A3C: .4byte 0x0000038A
_080A4A40:
	cmp r1, #1
	bne _080A4A80
	adds r0, r4, #0
	bl SaveMenuWriteNewGame
	b _080A4AAA
_080A4A4C:
	cmp r1, #1
	bne _080A4A80
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_80A0FA8
	adds r0, r4, #0
	movs r1, #6
_080A4A5E:
	bl Proc_Goto
	ldr r0, _080A4A78 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4AF2
	ldr r0, _080A4A7C @ =0x0000038A
	bl m4aSongNumStart
	b _080A4AF2
	.align 2, 0
_080A4A78: .4byte gPlaySt
_080A4A7C: .4byte 0x0000038A
_080A4A80:
	ldr r0, _080A4A94 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4AF2
	ldr r0, _080A4A98 @ =0x0000038B
	bl m4aSongNumStart
	b _080A4AF2
	.align 2, 0
_080A4A94: .4byte gPlaySt
_080A4A98: .4byte 0x0000038B
_080A4A9C:
	cmp r1, #1
	bne _080A4ACC
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl WriteGameSave
_080A4AAA:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A4AC8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4AF2
	movs r0, #0xe0
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A4AF2
	.align 2, 0
_080A4AC8: .4byte gPlaySt
_080A4ACC:
	adds r0, r4, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080A4B08 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4AF2
	ldr r0, _080A4B0C @ =0x0000038B
	bl m4aSongNumStart
_080A4AF2:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80A6C3C
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
_080A4B00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B08: .4byte gPlaySt
_080A4B0C: .4byte 0x0000038B

	thumb_func_start sub_80A4B10
sub_80A4B10: @ 0x080A4B10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r0, r5, #0
	bl SaveMenuPostChapterHandleHelpBox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4B2A
	b _080A4D5C
_080A4B2A:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080A4B84
	ldr r0, _080A4B4C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A4B50
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	b _080A4B5C
	.align 2, 0
_080A4B4C: .4byte gpKeySt
_080A4B50:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A4BE8
	adds r0, r5, #0
	movs r1, #1
_080A4B5C:
	bl sub_80A6E44
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4BE8
	ldr r0, _080A4B7C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4BE8
	ldr r0, _080A4B80 @ =0x00000386
	bl m4aSongNumStart
	b _080A4BE8
	.align 2, 0
_080A4B7C: .4byte gPlaySt
_080A4B80: .4byte 0x00000386
_080A4B84:
	ldr r0, _080A4BB4 @ =gpKeySt
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A4BC0
	cmp r1, #1
	beq _080A4BE8
	movs r0, #1
	strb r0, [r4]
	ldr r0, _080A4BB8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4BAC
	ldr r0, _080A4BBC @ =0x00000387
	bl m4aSongNumStart
_080A4BAC:
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
	b _080A4BE8
	.align 2, 0
_080A4BB4: .4byte gpKeySt
_080A4BB8: .4byte gPlaySt
_080A4BBC: .4byte 0x00000387
_080A4BC0:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A4BE8
	cmp r1, #2
	beq _080A4BE8
	movs r0, #2
	strb r0, [r4]
	ldr r0, _080A4C1C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4BE2
	ldr r0, _080A4C20 @ =0x00000387
	bl m4aSongNumStart
_080A4BE2:
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
_080A4BE8:
	ldr r0, _080A4C24 @ =gpKeySt
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A4CD8
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A4CA0
	cmp r0, #8
	bgt _080A4C2E
	cmp r0, #2
	beq _080A4C42
	cmp r0, #2
	bgt _080A4C28
	cmp r0, #1
	beq _080A4C60
	b _080A4D5C
	.align 2, 0
_080A4C1C: .4byte gPlaySt
_080A4C20: .4byte 0x00000387
_080A4C24: .4byte gpKeySt
_080A4C28:
	cmp r0, #4
	beq _080A4CA0
	b _080A4D5C
_080A4C2E:
	cmp r0, #0x40
	beq _080A4CA0
	cmp r0, #0x40
	bgt _080A4C3C
	cmp r0, #0x10
	beq _080A4C84
	b _080A4D5C
_080A4C3C:
	cmp r0, #0x80
	beq _080A4C4E
	b _080A4D5C
_080A4C42:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A4CA0
	b _080A4C60
_080A4C4E:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4C60
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
_080A4C60:
	ldr r0, _080A4C7C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4C72
	ldr r0, _080A4C80 @ =0x0000038A
	bl m4aSongNumStart
_080A4C72:
	adds r0, r5, #0
	bl sub_80A3FC8
	b _080A4D5C
	.align 2, 0
_080A4C7C: .4byte gPlaySt
_080A4C80: .4byte 0x0000038A
_080A4C84:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4CB0
	ldr r0, _080A4CA8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4CA0
	ldr r0, _080A4CAC @ =0x0000038A
	bl m4aSongNumStart
_080A4CA0:
	adds r0, r5, #0
	bl sub_80A4924
	b _080A4D5C
	.align 2, 0
_080A4CA8: .4byte gPlaySt
_080A4CAC: .4byte 0x0000038A
_080A4CB0:
	adds r0, r5, #0
	bl SaveMenuWriteNewGame
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A4CD4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4D5C
	movs r0, #0xe0
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A4D5C
	.align 2, 0
_080A4CD4: .4byte gPlaySt
_080A4CD8:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A4D5C
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	ldr r0, _080A4D10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4CF8
	ldr r0, _080A4D14 @ =0x0000038B
	bl m4aSongNumStart
_080A4CF8:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A4D18
	adds r0, r5, #0
	movs r1, #0
	bl sub_80A6C3C
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
	b _080A4D5C
	.align 2, 0
_080A4D10: .4byte gPlaySt
_080A4D14: .4byte 0x0000038B
_080A4D18:
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A4D30
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A4D5C
_080A4D30:
	adds r4, r5, #0
	adds r4, #0x42
	movs r0, #0xc0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080A4D54
	adds r0, r5, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	b _080A4D5C
_080A4D54:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080A4D5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A4D64
sub_80A4D64: @ 0x080A4D64
	push {lr}
	bl sub_80A4924
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A4D70
sub_80A4D70: @ 0x080A4D70
	adds r3, r0, #0
	adds r3, #0x2e
	movs r2, #0
	movs r1, #6
	strb r1, [r3]
	adds r0, #0x29
	strb r2, [r0]
	bx lr

	thumb_func_start sub_80A4D80
sub_80A4D80: @ 0x080A4D80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	cmp r0, #8
	bne _080A4DF8
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_80A7058
	movs r0, #4
	adds r1, r7, #0
	bl sub_80A7058
	ldrb r1, [r4]
	adds r0, r7, #0
	adds r0, #0x37
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080A4DD4
	lsls r0, r1, #0xb
	movs r1, #0xb4
	lsls r1, r1, #9
	adds r0, r0, r1
	ldr r1, _080A4DD0 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	ldrb r1, [r2]
	bl sub_8082E2C
	b _080A4DEA
	.align 2, 0
_080A4DD0: .4byte 0x0001FFFF
_080A4DD4:
	lsls r0, r1, #0xb
	movs r2, #0xb4
	lsls r2, r2, #9
	adds r0, r0, r2
	ldr r1, _080A4DF4 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_8082E2C
_080A4DEA:
	ldrb r0, [r4]
	bl sub_80A715C
	b _080A4EC0
	.align 2, 0
_080A4DF4: .4byte 0x0001FFFF
_080A4DF8:
	cmp r0, #0x20
	bne _080A4E6E
	adds r0, r7, #0
	bl sub_80A6CD0
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _080A4E22
	adds r0, r7, #0
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A4EC0
_080A4E22:
	cmp r0, #0x40
	bne _080A4E30
	adds r0, r7, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080A4EC0
_080A4E30:
	adds r0, r7, #0
	bl sub_80A6EE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4EC0
	adds r2, r7, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A4E54
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A4E64
_080A4E54:
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #1
	bl sub_80A6DD4
	strb r0, [r4]
_080A4E64:
	adds r0, r7, #0
	movs r1, #5
	bl Proc_Goto
	b _080A4EC0
_080A4E6E:
	cmp r0, #0x30
	bne _080A4EC0
	adds r0, r7, #0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x2d
	movs r0, #0xff
	strb r0, [r2]
	strb r1, [r3]
	adds r0, r7, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, #5
	ldrb r0, [r0]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, _080A4EB8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4EAE
	ldr r0, _080A4EBC @ =0x0000038B
	bl m4aSongNumStart
_080A4EAE:
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _080A5044
	.align 2, 0
_080A4EB8: .4byte gPlaySt
_080A4EBC: .4byte 0x0000038B
_080A4EC0:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0x10
	bne _080A4F38
	ldr r4, _080A4F34 @ =gSinLut
	movs r3, #0x80
	adds r3, r3, r4
	mov sb, r3
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	b _080A4FB0
	.align 2, 0
_080A4F34: .4byte gSinLut
_080A4F38:
	cmp r1, #7
	bhi _080A4FC0
	ldr r4, _080A4FBC @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, r6, r1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	adds r1, r6, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r6, r6, r1
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
_080A4FB0:
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _080A503C
	.align 2, 0
_080A4FBC: .4byte gSinLut
_080A4FC0:
	cmp r1, #0xf
	bhi _080A503C
	ldr r4, _080A5054 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, #0xe0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
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
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r1, #0xe0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_080A503C:
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A5044:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5054: .4byte gSinLut

	thumb_func_start sub_80A5058
sub_80A5058: @ 0x080A5058
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0x24
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A509A
	adds r0, r5, #0
	bl Proc_Break
_080A509A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80A50A0
sub_80A50A0: @ 0x080A50A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #4
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A50E2
	ldr r0, _080A50E8 @ =gUnk_0843165C
	ldr r1, _080A50EC @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl Proc_Break
_080A50E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A50E8: .4byte gUnk_0843165C
_080A50EC: .4byte 0x06013800

	thumb_func_start sub_80A50F0
sub_80A50F0: @ 0x080A50F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r1, #0xdc
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A5130
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A5130:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A5138
sub_80A5138: @ 0x080A5138
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A5174
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080A5174:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A517C
sub_80A517C: @ 0x080A517C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xc
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	adds r1, #0x24
	subs r0, #0x17
	strb r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A51C6
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_080A51C6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80A51CC
sub_80A51CC: @ 0x080A51CC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xd
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r0, #0xdc
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, #0x24
	subs r1, #0x17
	strb r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A5210
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A5210:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A5218
sub_80A5218: @ 0x080A5218
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r7, [r2]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A525C @ =gpKeySt
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A5260
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A5256
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A528A
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
_080A5256:
	subs r0, #1
	strb r0, [r2]
	b _080A528A
	.align 2, 0
_080A525C: .4byte gpKeySt
_080A5260:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A528A
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A527E
	adds r0, r1, #1
	strb r0, [r2]
	b _080A528A
_080A527E:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A528A
	strb r5, [r2]
_080A528A:
	adds r0, r4, #0
	adds r0, #0x34
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r7, r0
	beq _080A52A8
	ldr r0, _080A52F8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A52A8
	ldr r0, _080A52FC @ =0x00000386
	bl m4aSongNumStart
_080A52A8:
	ldr r0, _080A5300 @ =gpKeySt
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A538A
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	ldrb r1, [r5]
	bl SaveMenuIndexToValidBitfile
	adds r5, r4, #0
	adds r5, #0x35
	movs r6, #0
	strb r0, [r5]
	ldr r0, _080A52F8 @ =gPlaySt
	adds r7, r0, #0
	adds r7, #0x41
	ldrb r1, [r7]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _080A52DE
	ldr r0, _080A5304 @ =0x0000038A
	bl m4aSongNumStart
_080A52DE:
	adds r0, r4, #0
	adds r0, #0x29
	strb r6, [r0]
	ldrb r0, [r5]
	cmp r0, #8
	beq _080A5356
	cmp r0, #8
	bgt _080A5308
	cmp r0, #2
	beq _080A534C
	cmp r0, #4
	beq _080A5360
	b _080A537A
	.align 2, 0
_080A52F8: .4byte gPlaySt
_080A52FC: .4byte 0x00000386
_080A5300: .4byte gpKeySt
_080A5304: .4byte 0x0000038A
_080A5308:
	cmp r0, #0x20
	beq _080A5310
	cmp r0, #0x40
	bne _080A537A
_080A5310:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80A6DD4
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_80A53C4
	ldrb r7, [r7]
	lsls r0, r7, #0x1e
	cmp r0, #0
	blt _080A533C
	ldr r0, _080A5348 @ =0x0000038A
	bl m4aSongNumStart
_080A533C:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080A53B2
	.align 2, 0
_080A5348: .4byte 0x0000038A
_080A534C:
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	b _080A536A
_080A5356:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x29
	b _080A5368
_080A5360:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x30
_080A5368:
	movs r1, #0xc0
_080A536A:
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A53B2
_080A537A:
	adds r0, r4, #0
	bl sub_80A3FC8
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080A53B2
_080A538A:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A53B2
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r0, _080A53BC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A53B2
	ldr r0, _080A53C0 @ =0x0000038B
	bl m4aSongNumStart
_080A53B2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A53BC: .4byte gPlaySt
_080A53C0: .4byte 0x0000038B

	thumb_func_start sub_80A53C4
sub_80A53C4: @ 0x080A53C4
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r4, [r2]
	cmp r4, #2
	bls _080A53D6
	movs r0, #0
	strb r0, [r2]
_080A53D6:
	cmp r1, #0
	bne _080A53DE
_080A53DA:
	movs r0, #1
	b _080A5426
_080A53DE:
	cmp r1, #0
	ble _080A53F0
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080A53EC
	adds r0, #1
	b _080A53FC
_080A53EC:
	movs r0, #0
	b _080A53FC
_080A53F0:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A53FA
	movs r0, #2
	b _080A53FC
_080A53FA:
	subs r0, #1
_080A53FC:
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r4, r0
	beq _080A5424
	ldr r0, _080A541C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A53DA
	ldr r0, _080A5420 @ =0x00000386
	bl m4aSongNumStart
	b _080A53DA
	.align 2, 0
_080A541C: .4byte gPlaySt
_080A5420: .4byte 0x00000386
_080A5424:
	movs r0, #0
_080A5426:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80A542C
sub_80A542C: @ 0x080A542C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A545C @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBoxExt_Unk
	ldr r0, _080A5460 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5456
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080A5456:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A545C: .4byte 0x06013800
_080A5460: .4byte gPlaySt

	thumb_func_start sub_80A5464
sub_80A5464: @ 0x080A5464
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A5498 @ =gpKeySt
	ldr r1, [r0]
	ldr r0, _080A549C @ =0x00000103
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A5492
	ldr r0, _080A54A0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5488
	ldr r0, _080A54A4 @ =0x00000391
	bl m4aSongNumStart
_080A5488:
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_080A5492:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5498: .4byte gpKeySt
_080A549C: .4byte 0x00000103
_080A54A0: .4byte gPlaySt
_080A54A4: .4byte 0x00000391

	thumb_func_start sub_80A54A8
sub_80A54A8: @ 0x080A54A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080A54C4 @ =gUnk_08DAD354
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A54C4: .4byte gUnk_08DAD354

	thumb_func_start sub_80A54C8
sub_80A54C8: @ 0x080A54C8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x36
	ldrb r1, [r3]
	cmp r1, #0
	bne _080A550E
	ldr r0, _080A54F8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A54FC
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_80A53C4
	b _080A5566
	.align 2, 0
_080A54F8: .4byte gpKeySt
_080A54FC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A5566
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A53C4
	b _080A5566
_080A550E:
	ldr r0, _080A5538 @ =gpKeySt
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A5544
	cmp r1, #1
	beq _080A5566
	movs r0, #1
	strb r0, [r3]
	ldr r0, _080A553C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5566
	ldr r0, _080A5540 @ =0x00000387
	bl m4aSongNumStart
	b _080A5566
	.align 2, 0
_080A5538: .4byte gpKeySt
_080A553C: .4byte gPlaySt
_080A5540: .4byte 0x00000387
_080A5544:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A5566
	cmp r1, #2
	beq _080A5566
	movs r0, #2
	strb r0, [r3]
	ldr r0, _080A55A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5566
	ldr r0, _080A55AC @ =0x00000387
	bl m4aSongNumStart
_080A5566:
	ldr r0, _080A55B0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A5628
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _080A55C0
	cmp r0, #0x40
	beq _080A5586
	b _080A567A
_080A5586:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	adds r0, r3, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A55B4
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A55E0
	b _080A560C
	.align 2, 0
_080A55A8: .4byte gPlaySt
_080A55AC: .4byte 0x00000387
_080A55B0: .4byte gpKeySt
_080A55B4:
	ldr r2, _080A55BC @ =0x00000734
	movs r0, #0x40
	movs r1, #0x30
	b _080A561A
	.align 2, 0
_080A55BC: .4byte 0x00000734
_080A55C0:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A5614
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A560C
_080A55E0:
	adds r0, r2, #0
	bl ReadGameSave
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	ldr r0, _080A5604 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A567A
	ldr r0, _080A5608 @ =0x0000038A
	bl m4aSongNumStart
	b _080A567A
	.align 2, 0
_080A5604: .4byte gPlaySt
_080A5608: .4byte 0x0000038A
_080A560C:
	adds r0, r4, #0
	bl sub_80A4924
	b _080A567A
_080A5614:
	ldr r2, _080A5624 @ =0x00000733
	movs r0, #0x2e
	movs r1, #0x38
_080A561A:
	adds r3, r4, #0
	bl sub_80A54A8
	b _080A567A
	.align 2, 0
_080A5624: .4byte 0x00000733
_080A5628:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A567A
	ldr r0, _080A565C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5642
	ldr r0, _080A5660 @ =0x0000038B
	bl m4aSongNumStart
_080A5642:
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r5, [r0]
	cmp r5, #0
	beq _080A5664
	adds r0, r4, #0
	movs r1, #0
	bl sub_80A6C3C
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
	b _080A567A
	.align 2, 0
_080A565C: .4byte gPlaySt
_080A5660: .4byte 0x0000038B
_080A5664:
	ldr r0, _080A5680 @ =gUnk_0843165C
	ldr r1, _080A5684 @ =0x06013800
	bl Decompress
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_080A567A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5680: .4byte gUnk_0843165C
_080A5684: .4byte 0x06013800

	thumb_func_start sub_80A5688
sub_80A5688: @ 0x080A5688
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	movs r2, #2
	bl sub_80A6FF4
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SaveMenu_Finish
SaveMenu_Finish: @ 0x080A56A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A56AE
	bl EndSpriteAnimProc
_080A56AE:
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r2, [r5]
	cmp r2, #0x20
	bne _080A56E8
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A56E0
	cmp r0, #0x10
	bne _080A575E
	movs r0, #7
	bl SetNextGameAction
	b _080A575E
_080A56E0:
	movs r0, #6
	bl SetNextGameAction
	b _080A575E
_080A56E8:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080A575E
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080A5720
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _080A5718
	movs r0, #0xb
	bl SetNextGameAction
	b _080A575E
_080A5718:
	movs r0, #5
	bl SetNextGameAction
	b _080A575E
_080A5720:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A5736
	movs r0, #3
	bl ReadSuspendSave
	movs r0, #4
	bl SetNextGameAction
	b _080A575E
_080A5736:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0
	beq _080A5750
	adds r4, #0x2c
	ldrb r0, [r4]
	bl ReadGameSave
	ldrb r0, [r4]
	adds r0, #1
	bl SetNextGameAction
	b _080A575E
_080A5750:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A575E
	movs r0, #0
	bl SetNextGameAction
_080A575E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80A5764
sub_80A5764: @ 0x080A5764
	push {lr}
	sub sp, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_80A577C
sub_80A577C: @ 0x080A577C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #8
	bl SetNextGameAction
	ldr r4, _080A57A4 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl ReadExtraMapInfo
	movs r0, #0x30
	strb r0, [r4, #0xe]
	ldr r0, [r5, #0x14]
	bl Proc_End
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A57A4: .4byte gPlaySt

	thumb_func_start sub_80A57A8
sub_80A57A8: @ 0x080A57A8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A57B8 @ =gUnk_08DAD384
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A57B8: .4byte gUnk_08DAD384

	thumb_func_start sub_80A57BC
sub_80A57BC: @ 0x080A57BC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0x20
	strh r0, [r1]
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A57E4
	bl EndSpriteAnimProc
_080A57E4:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #8
	beq _080A5824
	cmp r0, #8
	bgt _080A57FC
	cmp r0, #2
	beq _080A5814
	cmp r0, #4
	beq _080A581C
	b _080A582C
_080A57FC:
	cmp r0, #0x20
	beq _080A580C
	cmp r0, #0x40
	bne _080A582C
	adds r0, r4, #0
	bl sub_80A57A8
	b _080A582C
_080A580C:
	adds r0, r4, #0
	bl sub_80AEA10
	b _080A582C
_080A5814:
	adds r0, r4, #0
	bl sub_80AD190
	b _080A582C
_080A581C:
	adds r0, r4, #0
	bl sub_809C820
	b _080A582C
_080A5824:
	ldr r0, _080A5834 @ =gUnk_08D8D744
	adds r1, r4, #0
	bl Proc_StartBlocking
_080A582C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5834: .4byte gUnk_08D8D744

	thumb_func_start sub_80A5838
sub_80A5838: @ 0x080A5838
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #4
	beq _080A585E
	cmp r1, #4
	bgt _080A584E
	cmp r1, #2
	beq _080A585E
	b _080A5864
_080A584E:
	cmp r1, #8
	beq _080A585E
	cmp r1, #0x20
	bne _080A5864
	movs r1, #0xb
	bl Proc_Goto
	b _080A5864
_080A585E:
	movs r1, #0xa
	bl Proc_Goto
_080A5864:
	pop {r0}
	bx r0

	thumb_func_start sub_80A5868
sub_80A5868: @ 0x080A5868
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r2, _080A58C0 @ =gDispIo
	movs r0, #0x20
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x36
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
	bx lr
	.align 2, 0
_080A58C0: .4byte gDispIo

	thumb_func_start sub_80A58C4
sub_80A58C4: @ 0x080A58C4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r4, [r0]
	adds r4, #1
	strb r4, [r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080A58E2
	adds r0, #0xff
_080A58E2:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080A591C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x50
	subs r0, r0, r2
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r2, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080A5916
	adds r0, r5, #0
	bl Proc_Break
_080A5916:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A591C: .4byte gDispIo

	thumb_func_start sub_80A5920
sub_80A5920: @ 0x080A5920
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r4, [r0]
	adds r4, #1
	strb r4, [r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080A593E
	adds r0, #0xff
_080A593E:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080A597C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080A5976
	adds r0, r5, #0
	bl Proc_Break
_080A5976:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A597C: .4byte gDispIo

	thumb_func_start sub_80A5980
sub_80A5980: @ 0x080A5980
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080A5A18 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A5A1C @ =gUnk_0843165C
	ldr r1, _080A5A20 @ =0x06013800
	bl Decompress
	ldr r0, _080A5A24 @ =gUnk_08432594
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080A5A28 @ =gUnk_0842FF00
	ldr r1, _080A5A2C @ =0x06010800
	bl Decompress
	ldr r0, _080A5A30 @ =gBg0Tm
	ldr r1, _080A5A34 @ =gUnk_0842D860
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r1, _080A5A38 @ =gAnims
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A5A3C @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	bl sub_80A6BB0
	adds r0, r4, #0
	bl sub_80A4254
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_80A715C
	movs r0, #0xc
	bl Proc_UnblockEachMarked
	movs r0, #0xd
	bl Proc_UnblockEachMarked
	movs r0, #3
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	beq _080A5A10
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xdc
	strb r0, [r1]
_080A5A10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5A18: .4byte gBg1Tm
_080A5A1C: .4byte gUnk_0843165C
_080A5A20: .4byte 0x06013800
_080A5A24: .4byte gUnk_08432594
_080A5A28: .4byte gUnk_0842FF00
_080A5A2C: .4byte 0x06010800
_080A5A30: .4byte gBg0Tm
_080A5A34: .4byte gUnk_0842D860
_080A5A38: .4byte gAnims
_080A5A3C: .4byte 0x02000001

	thumb_func_start sub_80A5A40
sub_80A5A40: @ 0x080A5A40
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	cmp r1, #3
	bne _080A5A54
	movs r1, #2
	bl Proc_Goto
	b _080A5A5A
_080A5A54:
	movs r1, #5
	bl Proc_Goto
_080A5A5A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A5A60
sub_80A5A60: @ 0x080A5A60
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A5A7A
	movs r0, #0xc0
	movs r1, #8
	bl StartHelpPromptSprite
_080A5A7A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A5A80
sub_80A5A80: @ 0x080A5A80
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #0x20
	bne _080A5A90
	bl sub_80A5E04
_080A5A90:
	pop {r0}
	bx r0

	thumb_func_start sub_80A5A94
sub_80A5A94: @ 0x080A5A94
	push {lr}
	bl EndHelpPromptSprite
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A5AA0
sub_80A5AA0: @ 0x080A5AA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5AD0 @ =gUnk_08DAD3A4
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x42
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	adds r0, #0x35
	strb r2, [r0]
	ldr r2, _080A5AD4 @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080A5AD0: .4byte gUnk_08DAD3A4
_080A5AD4: .4byte gPlaySt

	thumb_func_start sub_80A5AD8
sub_80A5AD8: @ 0x080A5AD8
	push {lr}
	adds r2, r0, #0
	ldr r1, _080A5AF4 @ =gBmSt
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A5AF0
	adds r0, r2, #0
	movs r1, #0x14
	bl Proc_Goto
_080A5AF0:
	pop {r0}
	bx r0
	.align 2, 0
_080A5AF4: .4byte gBmSt

	thumb_func_start sub_80A5AF8
sub_80A5AF8: @ 0x080A5AF8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5B08 @ =gUnk_08DAD674
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A5B08: .4byte gUnk_08DAD674

	thumb_func_start sub_80A5B0C
sub_80A5B0C: @ 0x080A5B0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5B1C @ =gUnk_08DAD784
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A5B1C: .4byte gUnk_08DAD784

	thumb_func_start sub_80A5B20
sub_80A5B20: @ 0x080A5B20
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080A5B40 @ =gUnk_08DAD3A4
	bl Proc_Find
	cmp r0, #0
	beq _080A5B3A
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	adds r0, #0x3d
	strb r5, [r0]
_080A5B3A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5B40: .4byte gUnk_08DAD3A4

	thumb_func_start sub_80A5B44
sub_80A5B44: @ 0x080A5B44
	push {r4, r5, lr}
	ldr r0, _080A5C2C @ =gUnk_08DAD33C
	bl InitBgs
	ldr r4, _080A5C30 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x3f
	ldrb r2, [r4, #0x15]
	ands r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #0x15]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	orrs r0, r1
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
	bl EndAllMus
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	ldr r1, _080A5C34 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	ldr r1, _080A5C38 @ =gAnims
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _080A5C3C @ =SaveMenuOnHBlank
	bl SetOnHBlankA
	ldr r0, _080A5C40 @ =gUnk_08432594
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080A5C44 @ =gUnk_0842D800
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r4, _080A5C48 @ =Img_MuralBackground
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A5C4C @ =gBg0Tm
	ldr r1, _080A5C50 @ =gUnk_0842D860
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r4, _080A5C54 @ =gUnk_0842DD14
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A5C58 @ =gBg3Tm
	ldr r1, _080A5C5C @ =gUnk_0842FD94
	movs r2, #0
	movs r3, #5
	bl sub_8001F14
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5C2C: .4byte gUnk_08DAD33C
_080A5C30: .4byte gDispIo
_080A5C34: .4byte 0x02000001
_080A5C38: .4byte gAnims
_080A5C3C: .4byte SaveMenuOnHBlank
_080A5C40: .4byte gUnk_08432594
_080A5C44: .4byte gUnk_0842D800
_080A5C48: .4byte Img_MuralBackground
_080A5C4C: .4byte gBg0Tm
_080A5C50: .4byte gUnk_0842D860
_080A5C54: .4byte gUnk_0842DD14
_080A5C58: .4byte gBg3Tm
_080A5C5C: .4byte gUnk_0842FD94

	thumb_func_start sub_80A5C60
sub_80A5C60: @ 0x080A5C60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080A5D00 @ =gUnk_08DAD844
	ldr r1, [r4]
	ldr r2, _080A5D04 @ =0x01000142
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	bl sub_809FB70
	cmp r0, #0
	beq _080A5CF6
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov sb, r0
	movs r7, #0x1f
_080A5C98:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	movs r4, #3
	ldrb r2, [r1]
	ands r4, r2
	cmp r4, #1
	bne _080A5CE2
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _080A5CC2
	str r4, [r5, #0x58]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x75
	bl sub_80A0184
_080A5CC2:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	ldrb r2, [r1, #1]
	cmp r2, #4
	bne _080A5CE2
	str r4, [r5, #0x5c]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x76
	bl sub_80A0184
_080A5CE2:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080A5C98
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080A5D08
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080A5D08
_080A5CF6:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080A5D10
	.align 2, 0
_080A5D00: .4byte gUnk_08DAD844
_080A5D04: .4byte 0x01000142
_080A5D08:
	ldr r0, _080A5D20 @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
_080A5D10:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D20: .4byte 0x06013800

	thumb_func_start sub_80A5D24
sub_80A5D24: @ 0x080A5D24
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080A5D60
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A5D54 @ =0x00000731
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A5D58 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5D68
	ldr r0, _080A5D5C @ =0x0000037B
	bl m4aSongNumStart
	b _080A5D68
	.align 2, 0
_080A5D54: .4byte 0x00000731
_080A5D58: .4byte gPlaySt
_080A5D5C: .4byte 0x0000037B
_080A5D60:
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_080A5D68:
	pop {r0}
	bx r0

	thumb_func_start sub_80A5D6C
sub_80A5D6C: @ 0x080A5D6C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080A5DA8
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A5D9C @ =0x00000732
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A5DA0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5DB0
	ldr r0, _080A5DA4 @ =0x0000037B
	bl m4aSongNumStart
	b _080A5DB0
	.align 2, 0
_080A5D9C: .4byte 0x00000732
_080A5DA0: .4byte gPlaySt
_080A5DA4: .4byte 0x0000037B
_080A5DA8:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A5DB0:
	pop {r0}
	bx r0

	thumb_func_start sub_80A5DB4
sub_80A5DB4: @ 0x080A5DB4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080A5DE4
	ldr r0, _080A5DE0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A5DE8
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _080A5DE8
	.align 2, 0
_080A5DE0: .4byte gpKeySt
_080A5DE4:
	adds r0, r2, #1
	strh r0, [r1]
_080A5DE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A5DF0
sub_80A5DF0: @ 0x080A5DF0
	push {lr}
	ldr r0, _080A5E00 @ =gUnk_08DAD844
	ldr r0, [r0]
	bl SaveBonusContentData
	pop {r0}
	bx r0
	.align 2, 0
_080A5E00: .4byte gUnk_08DAD844

	thumb_func_start sub_80A5E04
sub_80A5E04: @ 0x080A5E04
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5E14 @ =gUnk_08DAD848
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A5E14: .4byte gUnk_08DAD848

	thumb_func_start sub_80A5E18
sub_80A5E18: @ 0x080A5E18
	lsls r2, r2, #4
	cmp r2, #0
	ble _080A5E2E
	adds r3, r0, #0
_080A5E20:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080A5E20
_080A5E2E:
	bx lr

	thumb_func_start sub_80A5E30
sub_80A5E30: @ 0x080A5E30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	movs r0, #0x3f
	ands r5, r0
	movs r1, #0x20
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080A5E50
	movs r0, #0x1f
	ands r0, r5
	subs r5, r1, r0
_080A5E50:
	movs r0, #1
	mov ip, r0
	ldr r0, _080A5EF4 @ =0x02000004
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	subs r6, r1, r5
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r0, #0x22
	mov r8, r0
	movs r4, #0x1f
	mov sl, r4
_080A5E6A:
	mov r0, ip
	subs r0, #8
	cmp r0, #2
	bls _080A5ED4
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _080A5EF8 @ =gPal
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r2, r8
	ldrh r4, [r2]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	adds r3, r0, #0
	muls r3, r6, r3
	adds r0, r4, #0
	ands r0, r2
	muls r0, r5, r0
	adds r3, r3, r0
	asrs r3, r3, #5
	ands r3, r2
	adds r0, r1, #0
	ands r0, r7
	adds r2, r0, #0
	muls r2, r6, r2
	adds r0, r4, #0
	ands r0, r7
	muls r0, r5, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r7
	mov r0, sl
	ands r1, r0
	muls r1, r6, r1
	ands r4, r0
	adds r0, r4, #0
	muls r0, r5, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	movs r4, #0x1f
	ands r1, r4
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r4, _080A5EF8 @ =gPal
	adds r0, r0, r4
	orrs r3, r2
	orrs r1, r3
	strh r1, [r0]
_080A5ED4:
	movs r0, #2
	add r8, r0
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #0xf
	ble _080A5E6A
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5EF4: .4byte 0x02000004
_080A5EF8: .4byte gPal

	thumb_func_start sub_80A5EFC
sub_80A5EFC: @ 0x080A5EFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r7, r1, #0x18
	movs r1, #0x8f
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5F48
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	b _080A5F68
_080A5F48:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
_080A5F68:
	mov r1, sb
	adds r1, #8
	adds r2, r7, #0
	subs r2, #0xe
	ldr r3, _080A60F8 @ =gUnk_08DAD90C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x10
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _080A60FC @ =gUnk_08DAD9D6
	movs r0, #0xc0
	lsls r0, r0, #7
	mov r8, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	add r0, sp, #4
	adds r6, r7, #0
	subs r6, #8
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _080A5FE6
	mov r5, sb
	adds r5, #0x12
	ldr r4, _080A6100 @ =gUnk_08DADA10
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0x64
	mov sl, r1
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	subs r4, r4, r0
	strh r4, [r5]
_080A5FE6:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080A6014
	mov r5, sb
	adds r5, #0x1a
	ldr r4, _080A6100 @ =gUnk_08DADA10
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
_080A6014:
	mov r5, sb
	adds r5, #0x22
	ldr r4, _080A6100 @ =gUnk_08DADA10
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r1, r8
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x2a
	subs r2, r7, #7
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x42
	adds r2, r7, #1
	ldr r4, _080A6104 @ =gUnk_08DAD9E4
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A60F8: .4byte gUnk_08DAD90C
_080A60FC: .4byte gUnk_08DAD9D6
_080A6100: .4byte gUnk_08DADA10
_080A6104: .4byte gUnk_08DAD9E4

	thumb_func_start sub_80A6108
sub_80A6108: @ 0x080A6108
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	movs r7, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x3b
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_80A6B9C
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080A6178
	str r7, [r1, #0x60]
	b _080A6196
_080A6178:
	ldr r0, _080A61AC @ =gUnk_08432B28
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xb0
	lsls r3, r3, #1
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080A6196:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	strb r1, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A61AC: .4byte gUnk_08432B28

	thumb_func_start sub_80A61B0
sub_80A61B0: @ 0x080A61B0
	push {lr}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A61DC
	ldr r2, _080A61D8 @ =gPal
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080A61EA
	.align 2, 0
_080A61D8: .4byte gPal
_080A61DC:
	ldr r0, _080A61F4 @ =gPal
	ldr r2, _080A61F8 @ =0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080A61EA:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080A61F4: .4byte gPal
_080A61F8: .4byte 0x0000033A

	thumb_func_start sub_80A61FC
sub_80A61FC: @ 0x080A61FC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A626C @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A6270 @ =gUnk_08DAD8A8
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080A6274 @ =gUnk_08DADD50
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A626C: .4byte 0x000001FF
_080A6270: .4byte gUnk_08DAD8A8
_080A6274: .4byte gUnk_08DADD50

	thumb_func_start sub_80A6278
sub_80A6278: @ 0x080A6278
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A62E8 @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A62EC @ =gUnk_08DAD8A8
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080A62F0 @ =gUnk_08DADD34
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A62E8: .4byte 0x000001FF
_080A62EC: .4byte gUnk_08DAD8A8
_080A62F0: .4byte gUnk_08DADD34

	thumb_func_start sub_80A62F4
sub_80A62F4: @ 0x080A62F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x3c
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r1, [r4]
	ldrb r2, [r0]
	cmp r1, r2
	beq _080A631E
	ldrb r0, [r0]
	bl sub_80A715C
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4]
_080A631E:
	ldrh r0, [r7, #0x2a]
	ldrb r1, [r4]
	bl sub_80A71EC
	ldr r2, _080A636C @ =gPal
	ldr r3, _080A6370 @ =0x02000004
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r7, #0x14]
	adds r4, r1, #0
	adds r4, #0x3f
	ldrb r3, [r4]
	adds r0, r3, #0
	cmp r0, #0xff
	beq _080A6412
	adds r5, r1, #0
	adds r5, #0x44
	ldrh r2, [r5]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080A6412
	cmp r1, #0xf
	bhi _080A6374
	movs r0, #0xff
	strb r0, [r4]
	b _080A6408
	.align 2, 0
_080A636C: .4byte gPal
_080A6370: .4byte 0x02000004
_080A6374:
	ldr r0, _080A642C @ =gSinLut
	mov sb, r0
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r5]
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	ands r4, r0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
_080A6408:
	ldr r0, [r7, #0x14]
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #0x10
	strh r1, [r0]
_080A6412:
	ldrh r0, [r7, #0x2a]
	bl sub_80A5E30
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A642C: .4byte gSinLut

	thumb_func_start sub_80A6430
sub_80A6430: @ 0x080A6430
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	adds r1, #0x2f
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r5, r0, r1
	ldr r2, _080A6498 @ =0x000001FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _080A649C @ =gUnk_08DAD8A8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	adds r2, r5, #0
	bl PutSpriteExt
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A64A4
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_80A4054
	adds r2, r5, #0
	adds r2, #8
	ldr r0, _080A6498 @ =0x000001FF
	ands r2, r0
	ldr r0, _080A64A0 @ =gUnk_08DADD50
	ldr r3, [r0, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
	b _080A64CE
	.align 2, 0
_080A6498: .4byte 0x000001FF
_080A649C: .4byte gUnk_08DAD8A8
_080A64A0: .4byte gUnk_08DADD50
_080A64A4:
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_80A4054
	lsls r0, r0, #0x18
	adds r2, r5, #0
	adds r2, #8
	ldr r1, _080A64D8 @ =0x000001FF
	ands r2, r1
	ldr r1, _080A64DC @ =gUnk_08DADD50
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
_080A64CE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A64D8: .4byte 0x000001FF
_080A64DC: .4byte gUnk_08DADD50

	thumb_func_start sub_80A64E0
sub_80A64E0: @ 0x080A64E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080A6512
	cmp r1, #0x20
	bne _080A650C
	adds r0, #0x35
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x33
	strb r0, [r1]
	b _080A6512
_080A650C:
	mov r0, r8
	adds r0, #0x33
	strb r2, [r0]
_080A6512:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x2f
	adds r1, r2, #0
	adds r1, #0x46
	ldrh r1, [r1]
	ldrb r0, [r0]
	adds r5, r1, r0
	cmp r5, #0xdb
	bgt _080A65D2
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	movs r1, #0x44
	subs r6, r1, r0
	cmp r6, #1
	bgt _080A653E
	movs r6, #2
_080A653E:
	movs r7, #0
	cmp r7, r3
	bge _080A65AA
	adds r4, r6, #0
	movs r1, #0x38
	mov sb, r1
_080A654A:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A4054
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A6586
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_80A61FC
	b _080A659A
_080A6586:
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_80A61FC
_080A659A:
	adds r4, #0x18
	adds r7, #1
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r7, r0
	blt _080A654A
_080A65AA:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #2
	bne _080A65D2
	adds r0, #0x2b
	ldrb r1, [r0]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r6, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_80A6B4C
_080A65D2:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x46
	ldrh r1, [r1]
	subs r1, #1
	lsls r1, r1, #0x10
	movs r2, #0xdb
	lsls r2, r2, #0x11
	adds r3, r0, #0
	cmp r1, r2
	bhi _080A66B4
	adds r1, r3, #0
	adds r1, #0x33
	ldrb r0, [r1]
	cmp r0, #7
	bne _080A65FA
	movs r5, #2
	movs r6, #0x15
	b _080A660E
_080A65FA:
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	movs r1, #0x44
	subs r5, r1, r0
	cmp r5, #1
	bgt _080A660C
	movs r5, #2
_080A660C:
	movs r6, #0x18
_080A660E:
	movs r7, #0
	adds r0, r3, #0
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	bge _080A668E
	adds r4, r5, #0
_080A661E:
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A4054
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A6660
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_80A6278
	b _080A667C
_080A6660:
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_80A6278
_080A667C:
	adds r4, r4, r6
	adds r7, #1
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	blt _080A661E
_080A668E:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0xa
	bne _080A66B4
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r5, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_80A6B4C
_080A66B4:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A66C2
	b _080A683C
_080A66C2:
	mov r0, r8
	bl sub_80A5EFC
	mov r0, r8
	bl sub_80A6430
	movs r7, #0
	movs r2, #0xf
	mov sl, r2
	movs r0, #0xa
	mov sb, r0
_080A66D8:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	movs r2, #0
	ldrb r1, [r1]
	cmp r1, #6
	bne _080A66F4
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080A66F4
	movs r2, #0x80
	lsls r2, r2, #1
_080A66F4:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xe8
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r0, _080A67AC @ =0x000001FF
	ands r1, r0
	lsls r5, r7, #5
	adds r5, #0x20
	adds r5, r2, r5
	ldr r0, _080A67B0 @ =gUnk_08DADD84
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r3, [r0]
	lsls r4, r7, #1
	mov r0, sb
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xf4
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A67AC @ =0x000001FF
	ands r1, r2
	adds r5, #8
	ldr r0, _080A67B4 @ =gUnk_08DADD78
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r0, sl
	ands r4, r0
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	movs r1, #2
	add sb, r1
	adds r7, #1
	cmp r7, #2
	ble _080A66D8
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080A683C
	adds r1, r2, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	beq _080A67DC
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080A6788
	bl EndSpriteAnimProc
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080A6788:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A67BC
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A67B8 @ =gUnk_08DAD904
	movs r0, #0
	b _080A67CC
	.align 2, 0
_080A67AC: .4byte 0x000001FF
_080A67B0: .4byte gUnk_08DADD84
_080A67B4: .4byte gUnk_08DADD78
_080A67B8: .4byte gUnk_08DAD904
_080A67BC:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A67D8 @ =gUnk_08DAD904
	movs r0, #0xc0
	lsls r0, r0, #7
_080A67CC:
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl PutSpriteExt
	b _080A683C
	.align 2, 0
_080A67D8: .4byte gUnk_08DAD904
_080A67DC:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A6802
	ldr r0, [r2, #0x60]
	adds r2, #0x2f
	movs r1, #0xda
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	b _080A683C
_080A6802:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	adds r2, #0x2f
	movs r1, #0xd3
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A68AC @ =gUnk_08DAD904
	movs r0, #0xc0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080A683C:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080A68F2
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A68B4
	ldr r3, _080A68B0 @ =gUnk_08DAD8C2
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x80
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x34
	movs r1, #0x88
	bl PutUiHand
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80A6B4C
	b _080A68D2
	.align 2, 0
_080A68AC: .4byte gUnk_08DAD904
_080A68B0: .4byte gUnk_08DAD8C2
_080A68B4:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A68D2
	ldrb r1, [r1]
	lsls r2, r1, #0x1d
	movs r1, #0x80
	lsls r1, r1, #0x16
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80A6B4C
_080A68D2:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A68F2
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_80A6B6C
_080A68F2:
	mov r0, r8
	bl sub_80A62F4
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80A6908
sub_80A6908: @ 0x080A6908
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6918 @ =gUnk_08DADA3C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A6918: .4byte gUnk_08DADA3C

	thumb_func_start sub_80A691C
sub_80A691C: @ 0x080A691C
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x35
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_80A6950
sub_80A6950: @ 0x080A6950
	push {lr}
	sub sp, #8
	ldrh r1, [r0, #0x2a]
	adds r1, #1
	strh r1, [r0, #0x2a]
	ldr r1, [r0, #0x2c]
	subs r1, #4
	str r1, [r0, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_80AACB0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	bl sub_80AAD44
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r1, #0x78
	movs r2, #0xa0
	movs r3, #0x4c
	bl sub_80AAD94
	bl SyncDispIo
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A69A0
sub_80A69A0: @ 0x080A69A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A69B4 @ =gUnk_08DADA64
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A69B4: .4byte gUnk_08DADA64

	thumb_func_start sub_80A69B8
sub_80A69B8: @ 0x080A69B8
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x2d
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_80A69EC
sub_80A69EC: @ 0x080A69EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _080A6A64 @ =gUnk_084392DC
	add r0, sp, #4
	movs r2, #8
	bl memcpy
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	cmp r0, #3
	bhi _080A6A18
	adds r0, #1
	strb r0, [r2]
_080A6A18:
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0
	beq _080A6AF4
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	mov sb, r1
	mov ip, r0
	adds r4, r7, #0
	adds r4, #0x30
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r2, [r2]
	cmp r2, #3
	bhi _080A6A52
	ldrb r0, [r4]
	add r0, r8
	lsrs r0, r0, #1
	mov r8, r0
	ldrb r1, [r5]
	adds r0, r1, r3
	lsrs r3, r0, #1
_080A6A52:
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A6A68
	adds r0, r3, #0
	adds r0, #0x86
	b _080A6A6C
	.align 2, 0
_080A6A64: .4byte gUnk_084392DC
_080A6A68:
	adds r0, r3, #0
	adds r0, #0xb0
_080A6A6C:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	strb r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	strb r0, [r5]
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A6AC8
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r5, #7
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r0, _080A6AC4 @ =gUnk_08DAD8FC
	mov sb, r0
	movs r4, #0x80
	lsls r4, r4, #5
	str r4, [sp]
	movs r0, #4
	adds r1, r3, #0
	mov r3, sb
	bl PutSpriteExt
	orrs r6, r4
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #3
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r3, sb
	bl PutSpriteExt
	b _080A6AE8
	.align 2, 0
_080A6AC4: .4byte gUnk_08DAD8FC
_080A6AC8:
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r1, #7
	ands r0, r1
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r3, _080A6AF0 @ =gUnk_08DAD8FC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	bl PutSpriteExt
_080A6AE8:
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	b _080A6AFE
	.align 2, 0
_080A6AF0: .4byte gUnk_08DAD8FC
_080A6AF4:
	ldrb r2, [r2]
	cmp r2, #4
	bne _080A6B00
	movs r0, #0
	mov r1, sl
_080A6AFE:
	strb r0, [r1]
_080A6B00:
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A6B20
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r2, [r0]
	ldr r3, _080A6B48 @ =gUnk_08DAD8FC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	bl PutSpriteExt
_080A6B20:
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A6B2E
	movs r0, #0
	strb r0, [r4]
_080A6B2E:
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	movs r0, #1
	strb r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6B48: .4byte gUnk_08DAD8FC

	thumb_func_start sub_80A6B4C
sub_80A6B4C: @ 0x080A6B4C
	push {r4, lr}
	ldr r3, [r3, #0x34]
	movs r4, #0x2f
	strb r2, [r4, r3]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	adds r2, #4
	movs r1, #1
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A6B6C
sub_80A6B6C: @ 0x080A6B6C
	push {r4, lr}
	ldr r3, [r2, #0x34]
	movs r2, #0x32
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r4, ip
	strb r1, [r4]
	movs r1, #0x33
	adds r1, r1, r3
	mov ip, r1
	movs r1, #1
	mov r4, ip
	strb r1, [r4]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A6B9C
sub_80A6B9C: @ 0x080A6B9C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6BAC @ =gUnk_08DADA8C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A6BAC: .4byte gUnk_08DADA8C

	thumb_func_start sub_80A6BB0
sub_80A6BB0: @ 0x080A6BB0
	push {lr}
	ldr r0, _080A6BCC @ =0x02000044
	ldr r1, _080A6BD0 @ =0x0600C020
	movs r2, #1
	movs r3, #4
	bl InitTextFont
	ldr r0, _080A6BD4 @ =gpBanimModesLeft
	movs r1, #0xa
	bl InitText
	pop {r0}
	bx r0
	.align 2, 0
_080A6BCC: .4byte 0x02000044
_080A6BD0: .4byte 0x0600C020
_080A6BD4: .4byte gpBanimModesLeft

	thumb_func_start sub_80A6BD8
sub_80A6BD8: @ 0x080A6BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080A6C20
	ldr r0, _080A6C14 @ =0x02000044
	bl SetTextFont
	ldr r4, _080A6C18 @ =gpBanimModesLeft
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r1, _080A6C1C @ =gBg1Tm + 0x44e
	adds r0, r4, #0
	bl PutText
	b _080A6C2C
	.align 2, 0
_080A6C14: .4byte 0x02000044
_080A6C18: .4byte gpBanimModesLeft
_080A6C1C: .4byte gBg1Tm + 0x44e
_080A6C20:
	ldr r0, _080A6C38 @ =gBg1Tm + 0x44e
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
_080A6C2C:
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C38: .4byte gBg1Tm + 0x44e

	thumb_func_start sub_80A6C3C
sub_80A6C3C: @ 0x080A6C3C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080A6C70 @ =gUnk_08DADAAC
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_80A4054
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r4, #0
	bl sub_80A6BD8
	cmp r4, #0
	bne _080A6C6A
	adds r0, r6, #0
	adds r0, #0x36
	strb r4, [r0]
_080A6C6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C70: .4byte gUnk_08DADAAC

	thumb_func_start sub_80A6C74
sub_80A6C74: @ 0x080A6C74
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r1, _080A6C9C @ =0x06008000
	ldr r5, _080A6CA0 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080A6CA4 @ =0x0600C000
	adds r2, r5, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C9C: .4byte 0x06008000
_080A6CA0: .4byte 0x01000200
_080A6CA4: .4byte 0x0600C000

	thumb_func_start sub_80A6CA8
sub_80A6CA8: @ 0x080A6CA8
	adds r2, r0, #0
	adds r2, #0x30
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x31
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80A6CBC
sub_80A6CBC: @ 0x080A6CBC
	adds r2, r0, #0
	adds r2, #0x32
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x33
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80A6CD0
sub_80A6CD0: @ 0x080A6CD0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x31
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	adds r6, r4, #0
	adds r6, #0x32
	strb r5, [r6]
	adds r0, #3
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080A6CFE
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A6CA8
_080A6CFE:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x37
_080A6D04:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A6D0E
	adds r5, #1
_080A6D0E:
	adds r1, #1
	cmp r1, #2
	ble _080A6D04
	cmp r5, #0
	ble _080A6D34
	adds r0, r4, #0
	movs r1, #2
	bl sub_80A6CA8
	cmp r5, #2
	bgt _080A6D2C
	adds r0, r4, #0
	movs r1, #4
	bl sub_80A6CA8
_080A6D2C:
	adds r0, r4, #0
	movs r1, #8
	bl sub_80A6CA8
_080A6D34:
	cmp r5, #2
	bgt _080A6D40
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_80A6CA8
_080A6D40:
	bl sub_809F490
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6D52
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A6CBC
_080A6D52:
	bl sub_809F4C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6D64
	adds r0, r4, #0
	movs r1, #2
	bl sub_80A6CBC
_080A6D64:
	bl sub_809F4F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6D76
	adds r0, r4, #0
	movs r1, #4
	bl sub_80A6CBC
_080A6D76:
	bl sub_809F50C
	cmp r0, #0
	beq _080A6D86
	adds r0, r4, #0
	movs r1, #8
	bl sub_80A6CBC
_080A6D86:
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_80A6CBC
	bl sub_809F5B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6DA0
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80A6CBC
_080A6DA0:
	bl sub_809F588
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6DB2
	adds r0, r4, #0
	movs r1, #0x40
	bl sub_80A6CBC
_080A6DB2:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080A6DCC
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A6DCC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A6DD4
sub_80A6DD4: @ 0x080A6DD4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	cmp r2, #0
	ble _080A6E12
	movs r5, #0
	lsls r6, r1, #0x18
_080A6DE8:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A6E0E
	cmp r4, #2
	bne _080A6DFC
	movs r4, #0
	b _080A6E02
_080A6DFC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6E02:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6DE8
	b _080A6E3A
_080A6E0E:
	adds r0, r4, #0
	b _080A6E3C
_080A6E12:
	movs r5, #0
	lsls r6, r1, #0x18
_080A6E16:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A6E0E
	cmp r4, #0
	bne _080A6E2A
	movs r4, #2
	b _080A6E30
_080A6E2A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6E30:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6E16
_080A6E3A:
	movs r0, #0xff
_080A6E3C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A6E44
sub_80A6E44: @ 0x080A6E44
	push {r4, r5, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	adds r0, #0x16
	ldrh r0, [r0]
	cmp r0, #4
	beq _080A6E7C
	cmp r0, #4
	bgt _080A6E68
	cmp r0, #1
	beq _080A6ED8
	cmp r0, #2
	beq _080A6E86
	b _080A6E88
_080A6E68:
	cmp r0, #0x10
	beq _080A6E88
	cmp r0, #0x10
	bgt _080A6E76
	cmp r0, #8
	beq _080A6E86
	b _080A6E88
_080A6E76:
	cmp r0, #0x80
	bne _080A6E88
	b _080A6E86
_080A6E7C:
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A6E88
_080A6E86:
	movs r1, #1
_080A6E88:
	lsls r0, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	ble _080A6EA4
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #2
	bne _080A6EA0
	movs r0, #0
	b _080A6EB6
_080A6EA0:
	adds r0, r3, #1
	b _080A6EB6
_080A6EA4:
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #0
	bne _080A6EB4
	movs r0, #2
	b _080A6EB6
_080A6EB4:
	subs r0, r3, #1
_080A6EB6:
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A6ED4
	ldrb r0, [r4]
	asrs r2, r2, #0x18
	bl sub_80A6DD4
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080A6ED8
_080A6ED4:
	movs r0, #1
	b _080A6EDA
_080A6ED8:
	movs r0, #0
_080A6EDA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80A6EE0
sub_80A6EE0: @ 0x080A6EE0
	adds r1, r0, #0
	adds r1, #0x42
	adds r0, #0x30
	ldrb r0, [r0]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A6EF4
	movs r0, #0
	b _080A6EF6
_080A6EF4:
	movs r0, #1
_080A6EF6:
	bx lr

	thumb_func_start sub_80A6EF8
sub_80A6EF8: @ 0x080A6EF8
	push {r4, lr}
	mov ip, r0
	mov r2, ip
	adds r2, #0x29
	adds r0, #0x2b
	ldrb r1, [r2]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r2]
	ldr r3, _080A6F68 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080A6F6C
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r1, #4
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r1, r4, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldrb r2, [r2]
	lsls r1, r2, #1
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x32
	b _080A6FA0
	.align 2, 0
_080A6F68: .4byte gDispIo
_080A6F6C:
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r1, #0x78
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #1
	movs r0, #0x50
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x33
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x78
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, #0x50
	adds r1, #4
_080A6FA0:
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r4, [r2]
	orrs r0, r4
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
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _080A6FEC
	mov r0, ip
	bl Proc_Break
_080A6FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A6FF4
sub_80A6FF4: @ 0x080A6FF4
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080A7024 @ =gUnk_08DADAC8
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x2a
	movs r1, #0
	strb r4, [r2]
	adds r2, #1
	strb r5, [r2]
	adds r0, #0x29
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7024: .4byte gUnk_08DADAC8

	thumb_func_start sub_80A7028
sub_80A7028: @ 0x080A7028
	push {lr}
	ldr r0, _080A703C @ =gBg2Tm
	ldr r1, _080A7040 @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	pop {r0}
	bx r0
	.align 2, 0
_080A703C: .4byte gBg2Tm
_080A7040: .4byte 0x06007000

	thumb_func_start sub_80A7044
sub_80A7044: @ 0x080A7044
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7054 @ =gUnk_08DADAE8
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A7054: .4byte gUnk_08DADAE8

	thumb_func_start sub_80A7058
sub_80A7058: @ 0x080A7058
	push {r4, r5, r6, lr}
	sub sp, #0x48
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #2
	bhi _080A711C
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080A70E8
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl sub_8082F30
	adds r1, r5, #0
	adds r1, #0x37
	adds r1, r1, r4
	movs r2, #0
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r1, [sp]
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r5, r0, r4
	strb r2, [r5]
	adds r0, r4, #0
	bl sub_80A1398
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A70B6
	movs r0, #1
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A70B6:
	mov r0, sp
	bl sub_80A1384
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A70CA
	movs r0, #2
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A70CA:
	ldr r0, _080A70E0 @ =0x02000064
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x14]
	strb r1, [r0]
	ldr r0, _080A70E4 @ =0x02000068
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x1b]
	strb r1, [r0]
	b _080A7152
	.align 2, 0
_080A70E0: .4byte 0x02000064
_080A70E4: .4byte 0x02000068
_080A70E8:
	adds r0, r5, #0
	adds r0, #0x37
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r0, r0, r6
	strb r2, [r0]
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	str r2, [r0]
	ldr r0, _080A7114 @ =0x02000064
	adds r0, r6, r0
	strb r2, [r0]
	ldr r0, _080A7118 @ =0x02000068
	adds r0, r6, r0
	strb r2, [r0]
	b _080A7152
	.align 2, 0
_080A7114: .4byte 0x02000064
_080A7118: .4byte 0x02000068
_080A711C:
	adds r4, r5, #0
	adds r4, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r4]
	cmp r1, r0
	bne _080A7152
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A714E
	movs r0, #3
	mov r1, sp
	bl ReadSuspendSavePlaySt
	mov r0, sp
	ldrb r0, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r0, [sp]
	str r0, [r5, #0x54]
	b _080A7152
_080A714E:
	movs r0, #0xf0
	strh r0, [r4]
_080A7152:
	add sp, #0x48
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A715C
sub_80A715C: @ 0x080A715C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	movs r7, #0x1b
	movs r6, #0x1a
_080A716E:
	ldr r1, _080A71E4 @ =0x02000064
	adds r1, r5, r1
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldr r0, _080A71E8 @ =0x02000068
	adds r0, r5, r0
	ldrb r1, [r0]
	cmp r1, #1
	bne _080A7192
	movs r0, #0x10
	orrs r4, r0
_080A7192:
	cmp r1, #2
	bne _080A719E
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A719E:
	cmp r1, #3
	bne _080A71AA
	movs r0, #0x40
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A71AA:
	cmp r5, r8
	beq _080A71B6
	movs r0, #2
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A71B6:
	movs r1, #1
	adds r0, r4, #0
	orrs r0, r1
	adds r1, r6, #0
	bl sub_8082DB8
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_8082DB8
	adds r7, #2
	adds r6, #2
	adds r5, #1
	cmp r5, #2
	ble _080A716E
	bl EnablePalSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A71E4: .4byte 0x02000064
_080A71E8: .4byte 0x02000068

	thumb_func_start sub_80A71EC
sub_80A71EC: @ 0x080A71EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0x10
	ble _080A720E
	movs r0, #0xf
	ands r0, r5
	movs r1, #0x10
	subs r5, r1, r0
_080A720E:
	movs r2, #0
_080A7210:
	ldr r0, _080A7240 @ =0x02000064
	adds r1, r2, r0
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	adds r1, r2, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _080A72D2
	lsls r0, r2, #6
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080A7244 @ =gPal + 0x212
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [sp]
	cmp r2, r0
	bne _080A7250
	ldr r1, _080A7248 @ =gUnk_08404DA2
	mov ip, r1
	ldr r6, _080A724C @ =gUnk_08404EA2
	b _080A7256
	.align 2, 0
_080A7240: .4byte 0x02000064
_080A7244: .4byte gPal + 0x212
_080A7248: .4byte gUnk_08404DA2
_080A724C: .4byte gUnk_08404EA2
_080A7250:
	ldr r0, _080A72EC @ =gUnk_08404DC2
	mov ip, r0
	ldr r6, _080A72F0 @ =gUnk_08404EC2
_080A7256:
	adds r2, #1
	str r2, [sp, #4]
	movs r0, #0x10
	subs r7, r0, r5
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	movs r0, #6
	mov sb, r0
_080A7268:
	mov r1, ip
	ldrh r4, [r1]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r6]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r6, #2
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r0, sb
	cmp r0, #0
	bge _080A7268
_080A72D2:
	ldr r2, [sp, #4]
	cmp r2, #2
	ble _080A7210
	bl EnablePalSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A72EC: .4byte gUnk_08404DC2
_080A72F0: .4byte gUnk_08404EC2

	thumb_func_start SaveMenuGetValidMenuAmt
SaveMenuGetValidMenuAmt: @ 0x080A72F4
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	movs r2, #1
	cmp r2, r3
	bge _080A731A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
_080A730A:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A7314
	adds r1, #1
_080A7314:
	lsls r2, r2, #1
	cmp r2, r3
	blt _080A730A
_080A731A:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start nullsub_84
nullsub_84: @ 0x080A7324
	bx lr
	.align 2, 0

	thumb_func_start sub_80A7328
sub_80A7328: @ 0x080A7328
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A7344
	ldr r0, _080A7368 @ =0x06016000
	movs r1, #0xd
	bl LoadHelpBoxGfx
	movs r0, #1
	strb r0, [r4]
_080A7344:
	ldr r2, _080A736C @ =gUnk_08DADD90
	ldr r3, [r5, #0x2c]
	lsls r1, r3, #3
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r2, _080A7370 @ =gUnk_08DADDB0
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl StartHelpBox
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7368: .4byte 0x06016000
_080A736C: .4byte gUnk_08DADD90
_080A7370: .4byte gUnk_08DADDB0

	thumb_func_start sub_80A7374
sub_80A7374: @ 0x080A7374
	push {r4, lr}
	adds r4, r0, #0
	bl CloseHelpBox
	adds r4, #0x30
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A7388
sub_80A7388: @ 0x080A7388
	push {lr}
	bl sub_8032CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7398
	bl sub_8032CCC
_080A7398:
	pop {r0}
	bx r0

	thumb_func_start sub_80A739C
sub_80A739C: @ 0x080A739C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8032CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A73B8
	ldr r0, _080A73C0 @ =0x0000079C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8032CF4
_080A73B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A73C0: .4byte 0x0000079C

	thumb_func_start sub_80A73C4
sub_80A73C4: @ 0x080A73C4
	push {r4, r5, lr}
	sub sp, #0x10
	mov r2, sp
	ldr r1, _080A73FC @ =gUnk_08439338
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	ldr r1, _080A7400 @ =gUnk_08DADD90
	lsls r2, r0, #3
	adds r3, r2, r1
	ldr r4, [r3]
	adds r1, #4
	adds r2, r2, r1
	ldr r1, [r2]
	lsls r0, r0, #2
	add r0, sp
	ldr r2, [r0]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r0, r4, #0
	bl ShowSysHandCursor
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A73FC: .4byte gUnk_08439338
_080A7400: .4byte gUnk_08DADD90

	thumb_func_start sub_80A7404
sub_80A7404: @ 0x080A7404
	push {lr}
	ldr r2, _080A7420 @ =gUnk_08DADD90
	lsls r0, r0, #3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r2, #4
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0
	movs r3, #0
	bl sub_80A98DC
	pop {r0}
	bx r0
	.align 2, 0
_080A7420: .4byte gUnk_08DADD90

	thumb_func_start sub_80A7424
sub_80A7424: @ 0x080A7424
	push {r4, r5, r6, lr}
	ldr r4, _080A74F8 @ =gpProcEkrDispUP
	ldr r1, _080A74FC @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xf
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	movs r5, #2
_080A7442:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A7442
	ldr r0, _080A7500 @ =gUnk_08190268
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _080A7504 @ =0x02000084
	bl sub_802EBB0
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl Text_InsertDrawString
	ldr r4, _080A7508 @ =gPlaySt
	adds r6, r4, #0
	adds r6, #0x2b
	ldrb r1, [r6]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	bl sub_80A7AA8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #4
	bl Text_InsertDrawString
	ldrb r1, [r6]
	lsrs r0, r1, #4
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x60
	movs r2, #4
	bl Text_InsertDrawString
	adds r4, #0x2c
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #4
	bl Text_InsertDrawString
	ldr r0, _080A750C @ =gBg0Tm + 0x15c
	ldr r3, _080A7510 @ =Unk_081C8FCC
	ldrb r2, [r6]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	lsrs r2, r2, #4
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A74F8: .4byte gpProcEkrDispUP
_080A74FC: .4byte 0x06011000
_080A7500: .4byte gUnk_08190268
_080A7504: .4byte 0x02000084
_080A7508: .4byte gPlaySt
_080A750C: .4byte gBg0Tm + 0x15c
_080A7510: .4byte Unk_081C8FCC

	thumb_func_start sub_80A7514
sub_80A7514: @ 0x080A7514
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080A7570 @ =0x0000F880
	movs r5, #0x80
	movs r4, #1
_080A751E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x28
	ldr r3, _080A7574 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A751E
	ldr r4, _080A7574 @ =Sprite_32x16
	ldr r0, _080A7578 @ =0x0000F888
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080A757C @ =0x0000F88C
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080A7580 @ =0x0000F890
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7570: .4byte 0x0000F880
_080A7574: .4byte Sprite_32x16
_080A7578: .4byte 0x0000F888
_080A757C: .4byte 0x0000F88C
_080A7580: .4byte 0x0000F890

	thumb_func_start sub_80A7584
sub_80A7584: @ 0x080A7584
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r0, #0x30
	strb r1, [r0]
	ldr r0, _080A75BC @ =0x0000079D
	bl DecodeMsg
	bl SetTacticianName
	ldr r2, _080A75C0 @ =gPlaySt
	adds r3, r2, #0
	adds r3, #0x2b
	movs r0, #0xf
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r3]
	adds r2, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080A75BC: .4byte 0x0000079D
_080A75C0: .4byte gPlaySt

	thumb_func_start sub_80A75C4
sub_80A75C4: @ 0x080A75C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r7, _080A76A0 @ =gDispIo
	adds r6, r7, #0
	adds r6, #0x3c
	movs r4, #0x3f
	adds r0, r4, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	movs r5, #0
	movs r0, #0x10
	ldr r2, _080A76A4 @ =0x030027D4
	strb r0, [r2]
	movs r1, #0x45
	adds r1, r1, r7
	mov r8, r1
	strb r5, [r1]
	movs r2, #0x46
	adds r2, r2, r7
	mov sl, r2
	strb r5, [r2]
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldrb r2, [r6]
	ands r4, r2
	strb r4, [r6]
	movs r1, #0x10
	ldr r0, _080A76A4 @ =0x030027D4
	strb r1, [r0]
	mov r2, r8
	strb r5, [r2]
	mov r0, sl
	strb r5, [r0]
	ldr r0, _080A76A8 @ =gUnk_084364A0
	ldr r1, _080A76AC @ =0x06001000
	bl Decompress
	ldr r0, _080A76B0 @ =gUnk_08436480
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A76B4 @ =gBg2Tm
	ldr r1, _080A76B8 @ =gUnk_08438954
	ldr r2, _080A76BC @ =0x0000F080
	bl TmApplyTsa_thm
	mov r0, sb
	bl sub_80A98C8
	ldr r1, _080A76C0 @ =0x06008000
	movs r0, #0
	movs r2, #0xa
	movs r3, #1
	bl StartMuralBackgroundExt
	bl sub_80A7424
	ldr r0, _080A76C4 @ =sub_80A7514
	mov r1, sb
	bl StartParallelWorker
	movs r0, #0xb4
	movs r1, #0x10
	mov r2, sb
	bl StartHelpPromptSprite
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A76A0: .4byte gDispIo
_080A76A4: .4byte 0x030027D4
_080A76A8: .4byte gUnk_084364A0
_080A76AC: .4byte 0x06001000
_080A76B0: .4byte gUnk_08436480
_080A76B4: .4byte gBg2Tm
_080A76B8: .4byte gUnk_08438954
_080A76BC: .4byte 0x0000F080
_080A76C0: .4byte 0x06008000
_080A76C4: .4byte sub_80A7514

	thumb_func_start sub_80A76C8
sub_80A76C8: @ 0x080A76C8
	push {r4, lr}
	adds r4, r0, #0
	bl EndSysHandCursor
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0
	bl sub_80A998C
	adds r0, r4, #0
	bl sub_80A739C
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl sub_80A73C4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A76FC
sub_80A76FC: @ 0x080A76FC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl sub_809F9D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A772C
	bl EndSysHandCursor
	bl sub_80A7388
	ldr r2, _080A7734 @ =0x0000079E
	ldr r3, _080A7738 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x30
	movs r1, #0x5a
	bl sub_8084068
	movs r0, #0x70
	bl sub_8083B9C
_080A772C:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7734: .4byte 0x0000079E
_080A7738: .4byte 0x06016000

	thumb_func_start sub_80A773C
sub_80A773C: @ 0x080A773C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl EndSysHandCursor
	bl sub_80A7388
	ldr r2, _080A7770 @ =0x0000079F
	ldr r3, _080A7774 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x70
	movs r1, #0x5a
	bl sub_8084068
	movs r0, #0x70
	bl sub_8083B9C
	movs r0, #1
	bl sub_8009E6C
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7770: .4byte 0x0000079F
_080A7774: .4byte 0x06016000

	thumb_func_start sub_80A7778
sub_80A7778: @ 0x080A7778
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009E60
	cmp r0, #1
	bne _080A778C
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A778C:
	bl sub_8009E60
	cmp r0, #2
	beq _080A779C
	bl sub_8009E60
	cmp r0, #0
	bne _080A77A4
_080A779C:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A77A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A77AC
sub_80A77AC: @ 0x080A77AC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl EndSysHandCursor
	bl sub_80A7388
	movs r2, #0xf4
	lsls r2, r2, #3
	ldr r3, _080A77E4 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x60
	movs r1, #0x5a
	bl sub_8084068
	movs r0, #0xf0
	bl sub_8083B9C
	movs r0, #1
	bl sub_8009E6C
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A77E4: .4byte 0x06016000

	thumb_func_start sub_80A77E8
sub_80A77E8: @ 0x080A77E8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009E60
	cmp r0, #2
	beq _080A77FC
	bl sub_8009E60
	cmp r0, #0
	bne _080A7804
_080A77FC:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A7804:
	bl sub_8009E60
	cmp r0, #1
	bne _080A7814
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A7814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A781C
sub_80A781C: @ 0x080A781C
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	bl EndMuralBackground_
	adds r0, r4, #0
	bl EndAllProcChildren
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A7834
sub_80A7834: @ 0x080A7834
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A78FE
	ldr r0, _080A7878 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A78BE
	ldr r0, _080A787C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7866
	ldr r0, _080A7880 @ =0x0000038A
	bl m4aSongNumStart
_080A7866:
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	beq _080A7898
	cmp r0, #1
	bgt _080A7884
	cmp r0, #0
	beq _080A788E
	b _080A79A4
	.align 2, 0
_080A7878: .4byte gpKeySt
_080A787C: .4byte gPlaySt
_080A7880: .4byte 0x0000038A
_080A7884:
	cmp r0, #2
	beq _080A78A0
	cmp r0, #3
	beq _080A78A8
	b _080A79A4
_080A788E:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080A79A4
_080A7898:
	adds r0, r4, #0
	bl sub_80A7D88
	b _080A78AE
_080A78A0:
	adds r0, r4, #0
	bl sub_80A80A4
	b _080A78AE
_080A78A8:
	adds r0, r4, #0
	bl sub_80A82F0
_080A78AE:
	ldr r0, [r4, #0x2c]
	bl sub_80A7404
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080A79A4
_080A78BE:
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080A78EC
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A78E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A79A4
	ldr r0, _080A78E8 @ =0x0000038A
	bl m4aSongNumStart
	b _080A79A4
	.align 2, 0
_080A78E4: .4byte gPlaySt
_080A78E8: .4byte 0x0000038A
_080A78EC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A7914
	adds r0, r4, #0
	bl sub_80A7328
	b _080A79A4
_080A78FE:
	ldr r0, _080A79AC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A7914
	adds r0, r4, #0
	bl sub_80A7374
_080A7914:
	ldr r2, _080A79AC @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A792C
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080A792C
	movs r0, #2
	str r0, [r4, #0x2c]
_080A792C:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7942
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080A7942
	movs r0, #0
	str r0, [r4, #0x2c]
_080A7942:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7958
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	ble _080A7958
	subs r0, #1
	str r0, [r4, #0x2c]
_080A7958:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7970
	ldr r1, [r4, #0x2c]
	subs r0, r1, #1
	cmp r0, #1
	bhi _080A7970
	adds r0, r1, #1
	str r0, [r4, #0x2c]
_080A7970:
	ldr r0, [r4, #0x2c]
	cmp r5, r0
	beq _080A79A4
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A798A
	adds r0, r4, #0
	bl sub_80A7328
_080A798A:
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl sub_80A73C4
	ldr r0, _080A79B0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A79A4
	ldr r0, _080A79B4 @ =0x00000385
	bl m4aSongNumStart
_080A79A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A79AC: .4byte gpKeySt
_080A79B0: .4byte gPlaySt
_080A79B4: .4byte 0x00000385

	thumb_func_start sub_80A79B8
sub_80A79B8: @ 0x080A79B8
	push {lr}
	bl ReadLastGameSaveId
	bl WriteGameSave
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A79C8
sub_80A79C8: @ 0x080A79C8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _080A79E0 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080A79E4
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080A7A4A
	.align 2, 0
_080A79E0: .4byte gPlaySt
_080A79E4:
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r0, _080A7A54 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r3, #0x10
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #1
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r3
	mov r2, ip
	strb r0, [r2, #1]
	ldr r2, _080A7A58 @ =0x000007A1
	ldr r3, _080A7A5C @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x38
	movs r1, #0x20
	bl sub_8084068
	movs r0, #0xf0
	bl sub_8083B9C
	movs r0, #2
	bl sub_8009E6C
_080A7A4A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A54: .4byte gDispIo
_080A7A58: .4byte 0x000007A1
_080A7A5C: .4byte 0x06016000

	thumb_func_start sub_80A7A60
sub_80A7A60: @ 0x080A7A60
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009E60
	cmp r0, #2
	beq _080A7A74
	bl sub_8009E60
	cmp r0, #0
	bne _080A7A8A
_080A7A74:
	ldr r1, _080A7A90 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080A7A8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A90: .4byte gPlaySt

	thumb_func_start GC_SelectMark
GC_SelectMark: @ 0x080A7A94
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7AA4 @ =gUnk_08DADDC0
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A7AA4: .4byte gUnk_08DADDC0

	thumb_func_start sub_80A7AA8
sub_80A7AA8: @ 0x080A7AA8
	ldr r1, _080A7AB4 @ =gUnk_08DADF00
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AB4: .4byte gUnk_08DADF00

	thumb_func_start sub_80A7AB8
sub_80A7AB8: @ 0x080A7AB8
	ldr r1, _080A7AC4 @ =gUnk_08DADF10
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AC4: .4byte gUnk_08DADF10

	thumb_func_start sub_80A7AC8
sub_80A7AC8: @ 0x080A7AC8
	ldr r1, _080A7AD4 @ =gUnk_08DADF40
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AD4: .4byte gUnk_08DADF40

	thumb_func_start sub_80A7AD8
sub_80A7AD8: @ 0x080A7AD8
	ldr r1, _080A7AE4 @ =gUnk_08DADF48
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AE4: .4byte gUnk_08DADF48

	thumb_func_start sub_80A7AE8
sub_80A7AE8: @ 0x080A7AE8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	movs r6, #0
	str r6, [sp]
	lsls r1, r1, #5
	adds r5, r5, r1
	lsls r4, r4, #3
	ldr r0, _080A7B28 @ =0x001FFFFF
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r4, r0
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	str r6, [sp, #4]
	add r0, sp, #4
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r5, r1
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B28: .4byte 0x001FFFFF

	thumb_func_start sub_80A7B2C
sub_80A7B2C: @ 0x080A7B2C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A7BA8 @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r1, #0xb
	movs r2, #0xe
	movs r3, #4
	bl sub_804A4CC
	movs r0, #2
	bl EnableBgSync
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x22
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #2
	bl ShowSysHandCursor
	ldr r0, _080A7BAC @ =gpProcEkrDispUP
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A7B7A:
	adds r0, r4, #0
	bl sub_80A7AA8
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080A7BB0 @ =0x0200008C
	adds r1, r5, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _080A7B7A
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BA8: .4byte gPlaySt
_080A7BAC: .4byte gpProcEkrDispUP
_080A7BB0: .4byte 0x0200008C

	thumb_func_start sub_80A7BB4
sub_80A7BB4: @ 0x080A7BB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r6, _080A7C78 @ =0x0000F4C0
	movs r5, #0x26
	movs r4, #2
_080A7BC8:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A7C7C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A7BC8
	ldr r1, _080A7C80 @ =gpKeySt
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A7C9C
	ldr r5, _080A7C84 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7C02
	ldr r0, _080A7C88 @ =0x0000038A
	bl m4aSongNumStart
_080A7C02:
	ldr r1, [r7, #0x2c]
	adds r5, #0x2b
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	movs r2, #0xf
	rsbs r2, r2, #0
	ldrb r3, [r5]
	ands r2, r3
	orrs r2, r1
	strb r2, [r5]
	ldr r0, _080A7C8C @ =gBg0Tm + 0x15c
	ldr r3, _080A7C90 @ =Unk_081C8FCC
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	lsrs r2, r2, #4
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	ldr r4, _080A7C94 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A7C98 @ =0x06011000
	movs r1, #8
	movs r2, #4
	bl sub_80A7AE8
	adds r4, #0x18
	ldrb r5, [r5]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1d
	bl sub_80A7AA8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #4
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A7CB6
	.align 2, 0
_080A7C78: .4byte 0x0000F4C0
_080A7C7C: .4byte Sprite_32x16
_080A7C80: .4byte gpKeySt
_080A7C84: .4byte gPlaySt
_080A7C88: .4byte 0x0000038A
_080A7C8C: .4byte gBg0Tm + 0x15c
_080A7C90: .4byte Unk_081C8FCC
_080A7C94: .4byte gpProcEkrDispUP
_080A7C98: .4byte 0x06011000
_080A7C9C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A7CC8
	ldr r0, _080A7CC0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7CB6
	ldr r0, _080A7CC4 @ =0x0000038B
	bl m4aSongNumStart
_080A7CB6:
	adds r0, r7, #0
	bl Proc_Break
	b _080A7D3C
	.align 2, 0
_080A7CC0: .4byte gPlaySt
_080A7CC4: .4byte 0x0000038B
_080A7CC8:
	movs r4, #0x20
	adds r0, r4, #0
	ldrh r3, [r3, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A7CEA
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	ble _080A7CDE
	subs r0, #1
	b _080A7CE8
_080A7CDE:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A7CEA
	movs r0, #3
_080A7CE8:
	str r0, [r7, #0x2c]
_080A7CEA:
	ldr r1, [r1]
	movs r2, #0x10
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A7D10
	ldr r0, [r7, #0x2c]
	cmp r0, #2
	bgt _080A7D02
	adds r0, #1
	b _080A7D0E
_080A7D02:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A7D10
	movs r0, #0
_080A7D0E:
	str r0, [r7, #0x2c]
_080A7D10:
	ldr r1, [r7, #0x2c]
	cmp r1, r8
	beq _080A7D3C
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x22
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #2
	bl ShowSysHandCursor
	ldr r0, _080A7D48 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7D3C
	ldr r0, _080A7D4C @ =0x00000385
	bl m4aSongNumStart
_080A7D3C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D48: .4byte gPlaySt
_080A7D4C: .4byte 0x00000385

	thumb_func_start sub_80A7D50
sub_80A7D50: @ 0x080A7D50
	push {r4, lr}
	ldr r0, _080A7D80 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080A7D84 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D80: .4byte gBg1Tm
_080A7D84: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A7D88
sub_80A7D88: @ 0x080A7D88
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7D98 @ =gUnk_08DADF68
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A7D98: .4byte gUnk_08DADF68

	thumb_func_start sub_80A7D9C
sub_80A7D9C: @ 0x080A7D9C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A7E44 @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	lsrs r0, r0, #4
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #0x1a
	movs r3, #6
	bl sub_804A4CC
	movs r0, #2
	bl EnableBgSync
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #1
	bl ShowSysHandCursor
	ldr r4, _080A7E48 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r5, #0
	adds r6, r4, #0
	adds r6, #0x20
_080A7E00:
	lsls r4, r5, #5
	adds r0, r5, #0
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #6
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r0, #8
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #1
	cmp r5, #5
	ble _080A7E00
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7E44: .4byte gPlaySt
_080A7E48: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A7E4C
sub_80A7E4C: @ 0x080A7E4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sb, r0
	ldr r6, _080A7F0C @ =0x0000F4C0
	movs r5, #0x1e
	movs r4, #2
_080A7E62:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A7F10 @ =Sprite_64x32
	bl PutSpriteExt
	adds r6, #8
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A7E62
	ldr r1, _080A7F14 @ =gpKeySt
	ldr r2, [r1]
	ldrh r5, [r2, #8]
	movs r0, #1
	ands r0, r5
	mov r8, r1
	cmp r0, #0
	beq _080A7F30
	ldr r5, _080A7F18 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7E9E
	ldr r0, _080A7F1C @ =0x0000038A
	bl m4aSongNumStart
_080A7E9E:
	ldr r0, [r7, #0x2c]
	adds r5, #0x2b
	lsls r0, r0, #4
	movs r2, #0xf
	ldrb r1, [r5]
	ands r2, r1
	orrs r2, r0
	strb r2, [r5]
	ldr r0, _080A7F20 @ =gBg0Tm + 0x15c
	ldr r4, _080A7F24 @ =Unk_081C8FCC
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	movs r3, #0xf0
	ands r2, r3
	adds r1, r1, r2
	adds r1, r1, r4
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	ldr r4, _080A7F28 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A7F2C @ =0x06011000
	movs r1, #0xc
	movs r2, #4
	bl sub_80A7AE8
	adds r4, #0x18
	ldrb r5, [r5]
	lsrs r0, r5, #4
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #4
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A7F4A
	.align 2, 0
_080A7F0C: .4byte 0x0000F4C0
_080A7F10: .4byte Sprite_64x32
_080A7F14: .4byte gpKeySt
_080A7F18: .4byte gPlaySt
_080A7F1C: .4byte 0x0000038A
_080A7F20: .4byte gBg0Tm + 0x15c
_080A7F24: .4byte Unk_081C8FCC
_080A7F28: .4byte gpProcEkrDispUP
_080A7F2C: .4byte 0x06011000
_080A7F30:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080A7F5C
	ldr r0, _080A7F54 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7F4A
	ldr r0, _080A7F58 @ =0x0000038B
	bl m4aSongNumStart
_080A7F4A:
	adds r0, r7, #0
	bl Proc_Break
	b _080A8054
	.align 2, 0
_080A7F54: .4byte gPlaySt
_080A7F58: .4byte 0x0000038B
_080A7F5C:
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r2, #6]
	ands r0, r2
	cmp r0, #0
	beq _080A7F86
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	ble _080A7F7A
	subs r0, r4, #6
	b _080A7F84
_080A7F7A:
	adds r0, r6, #0
	ands r0, r5
	cmp r0, #0
	beq _080A7F86
	adds r0, r4, #6
_080A7F84:
	str r0, [r7, #0x2c]
_080A7F86:
	mov r0, r8
	ldr r5, [r0]
	movs r0, #0x80
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7FB4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	bgt _080A7FA6
	adds r0, r4, #6
	b _080A7FB2
_080A7FA6:
	movs r0, #0x40
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A7FB4
	subs r0, r4, #6
_080A7FB2:
	str r0, [r7, #0x2c]
_080A7FB4:
	mov r0, r8
	ldr r5, [r0]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7FE4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #0
	ble _080A7FD6
	subs r0, r4, #1
	b _080A7FE2
_080A7FD6:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A7FE4
	adds r0, r4, #5
_080A7FE2:
	str r0, [r7, #0x2c]
_080A7FE4:
	mov r0, r8
	ldr r5, [r0]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A8014
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #4
	bgt _080A8006
	adds r0, r4, #1
	b _080A8012
_080A8006:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A8014
	subs r0, r4, #5
_080A8012:
	str r0, [r7, #0x2c]
_080A8014:
	ldr r5, [r7, #0x2c]
	cmp r5, sb
	beq _080A8054
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _080A8064 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8054
	ldr r0, _080A8068 @ =0x00000385
	bl m4aSongNumStart
_080A8054:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8064: .4byte gPlaySt
_080A8068: .4byte 0x00000385

	thumb_func_start sub_80A806C
sub_80A806C: @ 0x080A806C
	push {r4, lr}
	ldr r0, _080A809C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080A80A0 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A809C: .4byte gBg1Tm
_080A80A0: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A80A4
sub_80A80A4: @ 0x080A80A4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A80B4 @ =gUnk_08DADF98
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A80B4: .4byte gUnk_08DADF98

	thumb_func_start sub_80A80B8
sub_80A80B8: @ 0x080A80B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A8134 @ =gPlaySt
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x15
	movs r1, #0xb
	movs r2, #7
	movs r3, #4
	bl sub_804A4CC
	movs r0, #2
	bl EnableBgSync
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _080A8138 @ =gpProcEkrDispUP
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A8106:
	adds r0, r4, #0
	bl sub_80A7AC8
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080A813C @ =0x0200008C
	adds r1, r5, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #0x18
	adds r4, #1
	cmp r4, #1
	ble _080A8106
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8134: .4byte gPlaySt
_080A8138: .4byte gpProcEkrDispUP
_080A813C: .4byte 0x0200008C

	thumb_func_start sub_80A8140
sub_80A8140: @ 0x080A8140
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r6, _080A81E8 @ =0x0000F4C0
	movs r5, #0xb4
	movs r4, #2
_080A8154:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A81EC @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A8154
	ldr r1, _080A81F0 @ =gpKeySt
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _080A8204
	ldr r5, _080A81F4 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8190
	ldr r0, _080A81F8 @ =0x0000038A
	bl m4aSongNumStart
_080A8190:
	ldr r1, [r7, #0x2c]
	adds r5, #0x2c
	movs r0, #1
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r5]
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r4, _080A81FC @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A8200 @ =0x06011000
	movs r1, #0x10
	movs r2, #4
	bl sub_80A7AE8
	adds r4, #0x18
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #4
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A821E
	.align 2, 0
_080A81E8: .4byte 0x0000F4C0
_080A81EC: .4byte Sprite_32x16
_080A81F0: .4byte gpKeySt
_080A81F4: .4byte gPlaySt
_080A81F8: .4byte 0x0000038A
_080A81FC: .4byte gpProcEkrDispUP
_080A8200: .4byte 0x06011000
_080A8204:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A8230
	ldr r0, _080A8228 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A821E
	ldr r0, _080A822C @ =0x0000038B
	bl m4aSongNumStart
_080A821E:
	adds r0, r7, #0
	bl Proc_Break
	b _080A82A4
	.align 2, 0
_080A8228: .4byte gPlaySt
_080A822C: .4byte 0x0000038B
_080A8230:
	movs r4, #0x20
	adds r0, r4, #0
	ldrh r3, [r3, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A8252
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	ble _080A8248
	subs r0, #1
	str r0, [r7, #0x2c]
	b _080A8252
_080A8248:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A8252
	str r5, [r7, #0x2c]
_080A8252:
	ldr r1, [r1]
	movs r2, #0x10
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A8278
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	bgt _080A826A
	adds r0, #1
	b _080A8276
_080A826A:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A8278
	movs r0, #0
_080A8276:
	str r0, [r7, #0x2c]
_080A8278:
	ldr r1, [r7, #0x2c]
	cmp r1, r8
	beq _080A82A4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _080A82B0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82A4
	ldr r0, _080A82B4 @ =0x00000385
	bl m4aSongNumStart
_080A82A4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A82B0: .4byte gPlaySt
_080A82B4: .4byte 0x00000385

	thumb_func_start sub_80A82B8
sub_80A82B8: @ 0x080A82B8
	push {r4, lr}
	ldr r0, _080A82E8 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080A82EC @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A82E8: .4byte gBg1Tm
_080A82EC: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A82F0
sub_80A82F0: @ 0x080A82F0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8300 @ =gUnk_08DADFC8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A8300: .4byte gUnk_08DADFC8

	thumb_func_start sub_80A8304
sub_80A8304: @ 0x080A8304
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _080A8324 @ =gPal + 0x37a
	mov ip, r0
	ldr r0, _080A8328 @ =gUnk_08434460
	ldrh r4, [r0]
	ldrh r7, [r0, #2]
	movs r0, #0x3f
	ands r2, r0
	cmp r2, #0x1f
	bgt _080A832C
	movs r0, #0x20
	subs r5, r0, r2
	adds r6, r2, #0
	b _080A8334
	.align 2, 0
_080A8324: .4byte gPal + 0x37a
_080A8328: .4byte gUnk_08434460
_080A832C:
	adds r5, r2, #0
	subs r5, #0x20
	movs r0, #0x40
	subs r6, r0, r2
_080A8334:
	movs r3, #0x1f
	movs r1, #0x1f
	adds r0, r4, #0
	ands r0, r1
	adds r2, r0, #0
	muls r2, r5, r2
	adds r0, r7, #0
	ands r0, r1
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r4, #0
	ands r0, r3
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r7, #0
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	ands r1, r3
	adds r2, r2, r1
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r4, r3
	adds r0, r4, #0
	muls r0, r5, r0
	ands r7, r3
	adds r1, r7, #0
	muls r1, r6, r1
	adds r0, r0, r1
	asrs r0, r0, #5
	ands r0, r3
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0]
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80A838C
sub_80A838C: @ 0x080A838C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, sp
	ldr r0, _080A84B8 @ =gUnk_08439348
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0xc]
	cmp sb, r1
	bge _080A84A8
	ldr r2, _080A84BC @ =0x0201E8D4
	mov r8, r2
	movs r5, #0
	mov sl, r5
	mov r6, r8
	adds r6, #4
	mov r3, r8
	movs r4, #0
	str r4, [sp, #0x14]
	ldr r7, _080A84C0 @ =0x0201E97C
	adds r4, r7, #0
_080A83C4:
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r3, #2]
	movs r0, #0x58
	strh r0, [r6]
	ldr r0, [sp, #0x10]
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r6, #2]
	movs r0, #6
	strh r0, [r6, #6]
	movs r0, #0
	strb r0, [r3, #1]
	movs r0, #1
	strh r0, [r6, #8]
	mov r1, sb
	lsls r0, r1, #0xd
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r0, r2
	asrs r0, r0, #5
	strh r0, [r6, #0xa]
	mov r0, sb
	adds r0, #0xd
	strh r0, [r6, #0xc]
	mov r1, r8
	adds r1, #0x1c
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, _080A84C4 @ =gUnk_08DADFF8
	mov r1, sb
	lsls r2, r1, #2
	adds r0, r2, r0
	ldr r0, [r0]
	mov r1, ip
	str r0, [r1]
	mov r1, r8
	adds r1, #0x24
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A84C8 @ =gUnk_08DAE004
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r8
	adds r1, #0x20
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A84CC @ =gUnk_08DAE010
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r8
	adds r1, #0x28
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A84D0 @ =gUnk_08DAE01C
	adds r2, r2, r0
	ldr r0, [r2]
	str r0, [r1]
	ldr r0, _080A84D4 @ =0x0000FFFF
	strh r0, [r6, #4]
	mov r1, sl
	adds r0, r1, r7
	str r0, [r6, #0x2c]
	strh r5, [r4]
	strh r5, [r4, #2]
	strh r5, [r4, #4]
	strh r5, [r4, #6]
	strh r5, [r4, #8]
	strh r5, [r4, #0xe]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0x12]
	adds r0, r7, #0
	adds r0, #0x14
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x18
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x1c
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	add r0, sl
	str r5, [r0]
	str r5, [r4, #0x24]
	adds r0, r3, #0
	str r3, [sp, #0x18]
	bl sub_80556B0
	adds r4, #0x28
	movs r2, #0x28
	add sl, r2
	adds r6, #0x38
	ldr r3, [sp, #0x18]
	adds r3, #0x38
	ldr r0, [sp, #0x14]
	adds r0, #0x38
	str r0, [sp, #0x14]
	movs r1, #1
	add sb, r1
	ldr r2, [sp, #0xc]
	cmp sb, r2
	blt _080A83C4
_080A84A8:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A84B8: .4byte gUnk_08439348
_080A84BC: .4byte 0x0201E8D4
_080A84C0: .4byte 0x0201E97C
_080A84C4: .4byte gUnk_08DADFF8
_080A84C8: .4byte gUnk_08DAE004
_080A84CC: .4byte gUnk_08DAE010
_080A84D0: .4byte gUnk_08DAE01C
_080A84D4: .4byte 0x0000FFFF

	thumb_func_start sub_80A84D8
sub_80A84D8: @ 0x080A84D8
	push {r4, r5, lr}
	cmp r0, #0
	ble _080A84F0
	ldr r5, _080A84F8 @ =0x0201E8D4
	adds r4, r0, #0
_080A84E2:
	adds r0, r5, #0
	bl sub_80556D8
	adds r5, #0x38
	subs r4, #1
	cmp r4, #0
	bne _080A84E2
_080A84F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A84F8: .4byte 0x0201E8D4

	thumb_func_start sub_80A84FC
sub_80A84FC: @ 0x080A84FC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	ldr r4, _080A8560 @ =0x020000E4
	adds r0, r4, #0
	bl ClearText
	movs r0, #8
	adds r0, r0, r4
	mov sb, r0
	bl ClearText
	ldr r5, _080A8564 @ =gBg1Tm + 0x29c
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	ldr r6, _080A8568 @ =gUnk_08DAE0AC
	ldr r0, [r6, #0x24]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r0, r8
	str r0, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	mov r0, sb
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8560: .4byte 0x020000E4
_080A8564: .4byte gBg1Tm + 0x29c
_080A8568: .4byte gUnk_08DAE0AC

	thumb_func_start sub_80A856C
sub_80A856C: @ 0x080A856C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r5, _080A8608 @ =0x020000CC
	adds r0, r5, #0
	bl ClearText
	adds r7, r5, #0
	adds r7, #8
	adds r0, r7, #0
	bl ClearText
	ldr r0, _080A860C @ =0x020000DC
	bl ClearText
	ldr r0, _080A8610 @ =gBg1Tm + 0x2a4
	mov r8, r0
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	ldr r6, _080A8614 @ =gUnk_08DAE0AC
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	lsls r4, r4, #2
	adds r0, r4, r6
	ldr r0, [r0]
	str r0, [sp, #4]
	adds r0, r5, #0
	mov r1, r8
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	adds r1, #0x78
	mov r0, sb
	str r0, [sp]
	adds r0, r6, #4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp, #4]
	adds r0, r7, #0
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	movs r0, #0x81
	lsls r0, r0, #1
	add r8, r0
	mov r0, sb
	str r0, [sp]
	adds r6, #8
	adds r4, r4, r6
	ldr r0, [r4]
	str r0, [sp, #4]
	ldr r0, _080A860C @ =0x020000DC
	mov r1, r8
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8608: .4byte 0x020000CC
_080A860C: .4byte 0x020000DC
_080A8610: .4byte gBg1Tm + 0x2a4
_080A8614: .4byte gUnk_08DAE0AC

	thumb_func_start sub_80A8618
sub_80A8618: @ 0x080A8618
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x41
	adds r0, #0x43
	ldrb r1, [r6]
	adds r0, r1, r0
	ldrb r7, [r0]
	ldr r5, _080A8674 @ =0x020000BC
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #8
	bl ClearText
	ldr r1, _080A8678 @ =gBg1Tm + 0x19e
	movs r2, #1
	cmp r7, #0
	bne _080A8644
	movs r2, #3
_080A8644:
	movs r0, #0
	str r0, [sp]
	ldr r0, _080A867C @ =gUnk_084393C4
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x49
	ldrb r6, [r6]
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A868E
	cmp r0, #1
	bgt _080A8680
	cmp r0, #0
	beq _080A8686
	b _080A86A4
	.align 2, 0
_080A8674: .4byte 0x020000BC
_080A8678: .4byte gBg1Tm + 0x19e
_080A867C: .4byte gUnk_084393C4
_080A8680:
	cmp r0, #2
	beq _080A8696
	b _080A86A4
_080A8686:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	b _080A869C
_080A868E:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	b _080A869C
_080A8696:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
_080A869C:
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A86C0
_080A86A4:
	ldr r3, _080A86C8 @ =0x020000C4
	ldr r1, _080A86CC @ =gBg1Tm + 0x21e
	movs r2, #1
	cmp r7, #1
	bne _080A86B0
	movs r2, #3
_080A86B0:
	movs r0, #0
	str r0, [sp]
	ldr r0, _080A86D0 @ =gUnk_084393D0
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0
	bl PutDrawText
_080A86C0:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A86C8: .4byte 0x020000C4
_080A86CC: .4byte gBg1Tm + 0x21e
_080A86D0: .4byte gUnk_084393D0

	thumb_func_start sub_80A86D4
sub_80A86D4: @ 0x080A86D4
	push {r4, r5, lr}
	sub sp, #0x10
	add r2, sp, #4
	ldr r1, _080A8708 @ =gUnk_084393D8
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r1, [r0]
	movs r0, #0x42
	str r0, [sp]
	movs r0, #0
	movs r2, #0xcc
	movs r3, #0x48
	bl StartBmFace
	adds r4, r0, #0
	bl StartFaceFadeIn
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A8708: .4byte gUnk_084393D8

	thumb_func_start sub_80A870C
sub_80A870C: @ 0x080A870C
	push {r4, r5, lr}
	sub sp, #0x30
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _080A8760 @ =gUnk_084393E4
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	lsls r4, r4, #4
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r1, _080A8764 @ =0x060102C0
	bl Decompress
	add r0, sp, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A8768 @ =0x060106C0
	bl Decompress
	add r0, sp, #8
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A876C @ =0x06010AC0
	bl Decompress
	add r0, sp, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A8770 @ =0x06010EC0
	bl Decompress
	add sp, #0x30
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8760: .4byte gUnk_084393E4
_080A8764: .4byte 0x060102C0
_080A8768: .4byte 0x060106C0
_080A876C: .4byte 0x06010AC0
_080A8770: .4byte 0x06010EC0

	thumb_func_start sub_80A8774
sub_80A8774: @ 0x080A8774
	adds r1, r0, #0
	adds r1, #0xd
	lsls r1, r1, #5
	ldr r2, _080A879C @ =gPal + 0x202
	adds r3, r1, r2
	ldr r2, _080A87A0 @ =0x0201E9F4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0xe
_080A878A:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080A878A
	bx lr
	.align 2, 0
_080A879C: .4byte gPal + 0x202
_080A87A0: .4byte 0x0201E9F4

	thumb_func_start sub_80A87A4
sub_80A87A4: @ 0x080A87A4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r0, #0xd
	lsls r0, r0, #5
	ldr r1, _080A87EC @ =gPal + 0x202
	adds r5, r0, r1
	cmp r4, #0x40
	ble _080A87B8
	movs r4, #0x40
_080A87B8:
	ldr r0, _080A87F0 @ =0x02000001
	ldrb r0, [r0]
	subs r0, #0xa
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r0, r2, #4
	ldr r1, _080A87F4 @ =0x0201E9F4
	subs r0, r0, r2
	movs r2, #0x1f
	mov ip, r2
	lsls r0, r0, #1
	adds r3, r0, r1
	movs r6, #0xe
_080A87D2:
	mov r0, ip
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, #0x1f
	bgt _080A87F8
	cmp r0, #0
	bge _080A87E6
	movs r0, #0
_080A87E6:
	mov r1, ip
	ands r1, r0
	b _080A87FA
	.align 2, 0
_080A87EC: .4byte gPal + 0x202
_080A87F0: .4byte 0x02000001
_080A87F4: .4byte 0x0201E9F4
_080A87F8:
	movs r1, #0x1f
_080A87FA:
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A8818
	cmp r0, #0
	bge _080A8812
	movs r0, #0
_080A8812:
	ands r0, r2
	adds r1, r1, r0
	b _080A881A
_080A8818:
	adds r1, r1, r2
_080A881A:
	movs r2, #0xf8
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A8838
	cmp r0, #0
	bge _080A8832
	movs r0, #0
_080A8832:
	ands r0, r2
	adds r0, r1, r0
	b _080A883A
_080A8838:
	adds r0, r1, r2
_080A883A:
	strh r0, [r5]
	adds r5, #2
	adds r3, #2
	subs r6, #1
	cmp r6, #0
	bge _080A87D2
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80A8850
sub_80A8850: @ 0x080A8850
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0xff
	ands r2, r0
	cmp r2, #0x80
	ble _080A8864
	adds r1, r2, #0
	subs r1, #0x80
	b _080A8868
_080A8864:
	movs r1, #0x80
	subs r1, r1, r2
_080A8868:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	asrs r0, r0, #7
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r3, #0
	bl sub_80A87A4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A8880
sub_80A8880: @ 0x080A8880
	push {r4, lr}
	mov ip, r0
	movs r1, #0
	str r1, [r0, #0x30]
	movs r2, #0
	strh r1, [r0, #0x3e]
	mov r3, ip
	adds r3, #0x3c
	strb r2, [r3]
	movs r0, #0x78
	mov r4, ip
	str r0, [r4, #0x34]
	movs r0, #0xa0
	str r0, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	strb r2, [r3]
	str r1, [r4, #0x48]
	mov r0, ip
	adds r0, #0x4c
	strb r2, [r0]
	str r1, [r4, #0x2c]
	adds r0, #2
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A88B8
sub_80A88B8: @ 0x080A88B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A893E
	movs r4, #0
	ldr r0, [r5, #0x40]
	cmp r4, r0
	bge _080A893E
	ldr r0, _080A89A4 @ =gSinLut
	mov r8, r0
	movs r6, #0
_080A88D8:
	ldrh r7, [r5, #0x3e]
	lsrs r3, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r3, r3, r0
	adds r3, #0x28
	ldr r1, [r5, #0x34]
	lsls r1, r1, #0xc
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #1
	add r0, r8
	movs r7, #0
	ldrsh r2, [r0, r7]
	movs r0, #0x46
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r2, [r5, #0x38]
	lsls r2, r2, #0xc
	adds r3, #0x40
	lsls r3, r3, #1
	add r3, r8
	movs r0, #0
	ldrsh r3, [r3, r0]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r2, r2, r0
	asrs r2, r2, #0xc
	subs r2, #0x10
	ldr r0, _080A89A8 @ =0x0201E8D4
	adds r0, r6, r0
	lsls r1, r1, #4
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_80555F8
	ldrh r7, [r5, #0x3e]
	lsrs r1, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_80A8850
	adds r6, #0x38
	adds r4, #1
	ldr r0, [r5, #0x40]
	cmp r4, r0
	blt _080A88D8
_080A893E:
	movs r0, #0x3e
	ldrsh r1, [r5, r0]
	movs r0, #0xb0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_80AACB0
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	bl sub_80AAD44
	movs r7, #0x34
	ldrsh r1, [r5, r7]
	movs r0, #0x38
	ldrsh r2, [r5, r0]
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r3, #0x4c
	bl sub_80AAD94
	ldr r4, _080A89AC @ =0x02000001
	ldr r0, [r5, #0x48]
	str r0, [sp]
	movs r0, #8
	movs r1, #8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_80A95B4
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4c
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A89B4
	ldr r0, [r5, #0x48]
	adds r0, #8
	str r0, [r5, #0x48]
	ldr r1, _080A89B0 @ =0x000003FF
	cmp r0, r1
	ble _080A89C2
	movs r0, #1
	b _080A89C0
	.align 2, 0
_080A89A4: .4byte gSinLut
_080A89A8: .4byte 0x0201E8D4
_080A89AC: .4byte 0x02000001
_080A89B0: .4byte 0x000003FF
_080A89B4:
	ldr r0, [r5, #0x48]
	subs r0, #8
	str r0, [r5, #0x48]
	cmp r0, #0
	bgt _080A89C2
	movs r0, #0
_080A89C0:
	strb r0, [r2]
_080A89C2:
	adds r1, r5, #0
	adds r1, #0x4e
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A89EA
	adds r0, r5, #0
	adds r0, #0x4d
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	lsls r1, r1, #4
	adds r1, #0x38
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl sub_804A9D0
	b _080A89FE
_080A89EA:
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl sub_804A95C
_080A89FE:
	ldr r3, _080A8A7C @ =gUnk_08DAE028
	movs r4, #0xb0
	lsls r4, r4, #8
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0
	movs r2, #8
	bl PutSpriteExt
	ldr r3, _080A8A80 @ =gUnk_08DAE042
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x14
	movs r2, #0x1c
	bl PutSpriteExt
	ldr r3, _080A8A84 @ =gUnk_08DAE088
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x28
	movs r2, #0x40
	bl PutSpriteExt
	ldr r0, [r5, #0x2c]
	asrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A8A46
	ldr r3, _080A8A88 @ =gUnk_08DAE068
	str r4, [sp]
	movs r0, #0xd
	movs r1, #8
	movs r2, #0x82
	bl PutSpriteExt
_080A8A46:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _080A8A50
	adds r0, #1
	str r0, [r5, #0x2c]
_080A8A50:
	ldr r3, _080A8A8C @ =gUnk_08DAE090
	movs r0, #0xa0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xd
	movs r1, #0x6c
	movs r2, #0x18
	bl PutSpriteExt
	ldr r0, [r5, #0x30]
	bl sub_80A8304
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A7C: .4byte gUnk_08DAE028
_080A8A80: .4byte gUnk_08DAE042
_080A8A84: .4byte gUnk_08DAE088
_080A8A88: .4byte gUnk_08DAE068
_080A8A8C: .4byte gUnk_08DAE090

	thumb_func_start sub_80A8A90
sub_80A8A90: @ 0x080A8A90
	push {lr}
	ldr r0, _080A8AA8 @ =gUnk_08DAE0DC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A8AA2
	movs r0, #1
	str r0, [r1, #0x2c]
_080A8AA2:
	pop {r0}
	bx r0
	.align 2, 0
_080A8AA8: .4byte gUnk_08DAE0DC

	thumb_func_start sub_80A8AAC
sub_80A8AAC: @ 0x080A8AAC
	push {lr}
	ldr r0, _080A8AC4 @ =gUnk_08DAE0DC
	bl Proc_Find
	cmp r0, #0
	beq _080A8AC0
	adds r1, r0, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
_080A8AC0:
	pop {r0}
	bx r0
	.align 2, 0
_080A8AC4: .4byte gUnk_08DAE0DC

	thumb_func_start sub_80A8AC8
sub_80A8AC8: @ 0x080A8AC8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080A8AEC @ =gUnk_08DAE0DC
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A8AE6
	str r5, [r4, #0x40]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, #0
	bl __divsi3
	str r0, [r4, #0x44]
_080A8AE6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8AEC: .4byte gUnk_08DAE0DC

	thumb_func_start sub_80A8AF0
sub_80A8AF0: @ 0x080A8AF0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080A8B14 @ =gUnk_08DAE0DC
	bl Proc_Find
	cmp r0, #0
	beq _080A8B04
	str r5, [r0, #0x34]
	str r4, [r0, #0x38]
_080A8B04:
	ldr r1, _080A8B18 @ =gAnims
	adds r0, r4, #0
	subs r0, #0x3c
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8B14: .4byte gUnk_08DAE0DC
_080A8B18: .4byte gAnims

	thumb_func_start sub_80A8B1C
sub_80A8B1C: @ 0x080A8B1C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080A8B34 @ =gUnk_08DAE0DC
	bl Proc_Find
	cmp r0, #0
	beq _080A8B2E
	strh r4, [r0, #0x3e]
_080A8B2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8B34: .4byte gUnk_08DAE0DC

	thumb_func_start sub_80A8B38
sub_80A8B38: @ 0x080A8B38
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080A8B5C @ =gUnk_08DAE0DC
	bl Proc_Find
	cmp r0, #0
	beq _080A8B56
	adds r1, r0, #0
	adds r1, #0x4d
	strb r4, [r1]
	adds r0, #0x4e
	strb r5, [r0]
_080A8B56:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8B5C: .4byte gUnk_08DAE0DC

	thumb_func_start sub_80A8B60
sub_80A8B60: @ 0x080A8B60
	push {lr}
	ldr r0, _080A8B70 @ =gUnk_08DAE0DC
	bl Proc_Find
	ldr r0, [r0, #0x44]
	pop {r1}
	bx r1
	.align 2, 0
_080A8B70: .4byte gUnk_08DAE0DC

	thumb_func_start sub_80A8B74
sub_80A8B74: @ 0x080A8B74
	cmp r0, #0
	beq _080A8B7C
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
_080A8B7C:
	bx lr
	.align 2, 0

	thumb_func_start sub_80A8B80
sub_80A8B80: @ 0x080A8B80
	push {lr}
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080A8B92
	bl sub_80A5B44
_080A8B92:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A8B98
sub_80A8B98: @ 0x080A8B98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	bl ApplySystemObjectsGraphics
	ldr r2, _080A8CC8 @ =0x0000FFF8
	movs r0, #1
	movs r1, #8
	bl SetBgOffset
	movs r0, #0xc
	bl sub_80046C4
	movs r0, #0xd
	bl sub_80046C4
	ldr r1, _080A8CCC @ =gAnims
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _080A8CD0 @ =gUnk_08DAE0FC
	bl SetFaceConfig
	ldr r0, _080A8CD4 @ =gUnk_084352DC
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080A8CD8 @ =gUnk_08434DD0
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A8CDC @ =gBg0Tm
	ldr r1, _080A8CE0 @ =gUnk_08434468
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _080A8CE4 @ =gBg1Tm
	ldr r1, _080A8CE8 @ =gUnk_084352FC
	movs r2, #0xf0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080A8CEC @ =gUnk_08434448
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A8CF0 @ =gUnk_08433CC8
	ldr r1, _080A8CF4 @ =0x06010000
	bl Decompress
	ldr r0, _080A8CF8 @ =gUnk_08436460
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_8055670
	bl sub_80647C8
	ldr r0, _080A8CFC @ =gUnk_08DAE0DC
	adds r1, r6, #0
	bl Proc_Start
	str r0, [r6, #0x38]
	movs r0, #0
	movs r1, #0x70
	bl sub_80A8AF0
	movs r1, #0x41
	adds r1, r1, r6
	mov sl, r1
	movs r0, #0
	strb r0, [r1]
	adds r5, r6, #0
	adds r5, #0x4c
	strb r0, [r5]
	bl sub_809F40C
	adds r2, r6, #0
	adds r2, #0x40
	strb r0, [r2]
	adds r3, r6, #0
	adds r3, #0x42
	movs r4, #1
	adds r0, r4, #0
	ldrb r7, [r3]
	ands r0, r7
	cmp r0, #0
	beq _080A8D08
	ldr r0, _080A8D00 @ =gUnk_08439414
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #2
	strb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x49
	strb r4, [r1]
	adds r2, #0xa
	strb r0, [r2]
	movs r4, #0
	str r3, [sp, #0xc]
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r0, [r5]
	cmp r4, r0
	bge _080A8D68
	adds r2, r7, #0
_080A8C92:
	ldr r1, _080A8D04 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080A8CB8
	adds r1, r6, #0
	adds r1, #0x40
	lsls r0, r4, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A8CB8
	movs r0, #1
_080A8CB8:
	strb r0, [r2]
	adds r2, #1
	adds r4, #1
	ldrb r1, [r5]
	cmp r4, r1
	blt _080A8C92
	b _080A8D68
	.align 2, 0
_080A8CC8: .4byte 0x0000FFF8
_080A8CCC: .4byte gAnims
_080A8CD0: .4byte gUnk_08DAE0FC
_080A8CD4: .4byte gUnk_084352DC
_080A8CD8: .4byte gUnk_08434DD0
_080A8CDC: .4byte gBg0Tm
_080A8CE0: .4byte gUnk_08434468
_080A8CE4: .4byte gBg1Tm
_080A8CE8: .4byte gUnk_084352FC
_080A8CEC: .4byte gUnk_08434448
_080A8CF0: .4byte gUnk_08433CC8
_080A8CF4: .4byte 0x06010000
_080A8CF8: .4byte gUnk_08436460
_080A8CFC: .4byte gUnk_08DAE0DC
_080A8D00: .4byte gUnk_08439414
_080A8D04: .4byte gPlaySt
_080A8D08:
	adds r1, r6, #0
	adds r1, #0x49
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r7, #2
	mov sb, r7
	mov r0, sb
	ldrb r7, [r2]
	ands r0, r7
	mov r8, r1
	cmp r0, #0
	beq _080A8D30
	ldrb r0, [r5]
	add r0, r8
	strb r4, [r0]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080A8D30:
	movs r0, #8
	ldrb r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080A8D48
	ldrb r0, [r5]
	add r0, r8
	mov r1, sb
	strb r1, [r0]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080A8D48:
	movs r4, #0
	str r3, [sp, #0xc]
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r2, [r5]
	cmp r4, r2
	bge _080A8D68
	adds r2, r7, #0
	movs r3, #0
	adds r1, r5, #0
_080A8D5C:
	adds r0, r2, r4
	strb r3, [r0]
	adds r4, #1
	ldrb r0, [r1]
	cmp r4, r0
	blt _080A8D5C
_080A8D68:
	ldrb r0, [r5]
	bl sub_80A8AC8
	ldrb r0, [r5]
	mov r1, r8
	bl sub_80A838C
	movs r4, #0
	ldrb r1, [r5]
	cmp r4, r1
	bge _080A8D8C
_080A8D7E:
	adds r0, r4, #0
	bl sub_80A8774
	adds r4, #1
	ldrb r2, [r5]
	cmp r4, r2
	blt _080A8D7E
_080A8D8C:
	bl sub_80A8AAC
	adds r0, r6, #0
	bl sub_80A9BE8
	movs r4, #0xd2
	lsls r4, r4, #4
	movs r0, #0
	adds r1, r4, #0
	movs r2, #9
	bl sub_80A9BFC
	movs r0, #0
	adds r1, r4, #0
	movs r2, #9
	bl sub_80A9BFC
	movs r0, #0x1e
	movs r1, #0x3d
	movs r2, #0x44
	movs r3, #0x3d
	bl sub_80A9C84
	movs r0, #3
	bl sub_80A9C68
	ldr r4, _080A8F58 @ =0x020000A4
	ldr r1, _080A8F5C @ =0x0600E000
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r4, #0
	mov r2, sb
	movs r3, #0xe
	bl InitTextFont
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #9
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #8
	bl InitText
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #5
	bl InitText
	bl sub_80A8B60
	mov r1, sl
	ldrb r1, [r1]
	muls r0, r1, r0
	lsls r0, r0, #4
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x30]
	mov r2, sl
	ldrb r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	bl sub_80A86D4
	str r0, [r6, #0x3c]
	bl sub_80A84FC
	mov r1, sl
	ldrb r0, [r1]
	add r0, r8
	ldrb r0, [r0]
	bl sub_80A856C
	adds r0, r6, #0
	bl sub_80A8618
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r7
	ldrb r0, [r0]
	ldr r7, [sp, #0xc]
	ldrb r1, [r7]
	bl sub_80A8B38
	ldrh r0, [r6, #0x30]
	bl sub_80A8B1C
	movs r0, #3
	bl EnableBgSync
	str r4, [r6, #0x2c]
	str r4, [r6, #0x50]
	ldr r3, _080A8F60 @ =gDispIo
	movs r0, #0x20
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #1
	ldrb r7, [r2]
	orrs r0, r7
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	movs r2, #0x50
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x36
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
	mov r2, sl
	ldrb r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	bl sub_80A870C
	ldr r4, _080A8F64 @ =gSinLut
	movs r7, #0x80
	adds r7, r7, r4
	mov r8, r7
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r7, #0
	ldrsh r0, [r4, r7]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8F58: .4byte 0x020000A4
_080A8F5C: .4byte 0x0600E000
_080A8F60: .4byte gDispIo
_080A8F64: .4byte gSinLut

	thumb_func_start sub_80A8F68
sub_80A8F68: @ 0x080A8F68
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	ldr r3, _080A8FD4 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080A8F9E
	adds r0, #0xff
_080A8F9E:
	asrs r0, r0, #8
	movs r1, #0x48
	subs r1, r1, r0
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x50
	subs r0, r0, r1
	adds r2, #4
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	cmp r4, #0x10
	bne _080A8FCC
	adds r0, r5, #0
	bl Proc_Break
_080A8FCC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8FD4: .4byte gDispIo

	thumb_func_start sub_80A8FD8
sub_80A8FD8: @ 0x080A8FD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080A8FF4
	adds r0, #0xff
_080A8FF4:
	asrs r0, r0, #8
	movs r2, #0x48
	subs r2, r2, r0
	ldr r3, _080A9030 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #8
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x68
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	cmp r4, #0x10
	bne _080A902A
	adds r0, r5, #0
	bl Proc_Break
_080A902A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9030: .4byte gDispIo

	thumb_func_start sub_80A9034
sub_80A9034: @ 0x080A9034
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A9056
	ldr r5, _080A9060 @ =0x0201E8D4
	adds r6, r0, #0
_080A9046:
	adds r0, r5, #0
	bl sub_8055644
	adds r5, #0x38
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A9046
_080A9056:
	movs r0, #0
	str r0, [r7, #0x50]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9060: .4byte 0x0201E8D4

	thumb_func_start sub_80A9064
sub_80A9064: @ 0x080A9064
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_80A8618
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r4, #0x42
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_80A8B38
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80A9090
sub_80A9090: @ 0x080A9090
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, _080A90D0 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A90DC
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A90DC
	ldr r0, _080A90D4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A90C6
	ldr r0, _080A90D8 @ =0x00000386
	bl m4aSongNumStart
_080A90C6:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80A9064
	b _080A9322
	.align 2, 0
_080A90D0: .4byte gpKeySt
_080A90D4: .4byte gPlaySt
_080A90D8: .4byte 0x00000386
_080A90DC:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A9188
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x43
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _080A9188
	adds r0, #8
	adds r1, r0, r3
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A9116
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A9146
_080A9116:
	ldrb r1, [r5]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A912E
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A9146
_080A912E:
	ldrb r5, [r5]
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _080A9164
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A9164
_080A9146:
	ldr r0, _080A9160 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A9154
	b _080A9322
_080A9154:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A9322
	.align 2, 0
_080A9160: .4byte gPlaySt
_080A9164:
	ldr r0, _080A9180 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9176
	ldr r0, _080A9184 @ =0x00000386
	bl m4aSongNumStart
_080A9176:
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A9064
	b _080A9322
	.align 2, 0
_080A9180: .4byte gPlaySt
_080A9184: .4byte 0x00000386
_080A9188:
	ldr r1, [r2]
	ldrh r3, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A91A2
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _080A91B6
_080A91A2:
	movs r7, #0x88
	lsls r7, r7, #1
	ands r7, r3
	cmp r7, #0
	beq _080A91DC
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #1
_080A91B6:
	bl sub_80A9CAC
	ldr r0, _080A91D4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A91CC
	ldr r0, _080A91D8 @ =0x00000387
	bl m4aSongNumStart
_080A91CC:
	adds r0, r4, #0
	bl sub_80A9034
	b _080A9322
	.align 2, 0
_080A91D4: .4byte gPlaySt
_080A91D8: .4byte 0x00000387
_080A91DC:
	ldrh r1, [r1, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080A929C
	str r7, [r4, #0x2c]
	ldr r6, _080A925C @ =gPlaySt
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A91FC
	ldr r0, _080A9260 @ =0x0000038A
	bl m4aSongNumStart
_080A91FC:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r1, _080A9264 @ =0x0201E8D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #0xa]
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	bl sub_8055474
	adds r7, r4, #0
	adds r7, #0x42
	movs r0, #1
	ldrb r1, [r7]
	ands r0, r1
	cmp r0, #0
	beq _080A9272
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A923C
	movs r0, #2
	strb r0, [r6, #0x1b]
_080A923C:
	cmp r1, #1
	bne _080A9244
	movs r0, #3
	strb r0, [r6, #0x1b]
_080A9244:
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r5, [r5]
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A9268
	movs r0, #0x40
	ldrb r2, [r6, #0x14]
	orrs r0, r2
	strb r0, [r6, #0x14]
	b _080A9296
	.align 2, 0
_080A925C: .4byte gPlaySt
_080A9260: .4byte 0x0000038A
_080A9264: .4byte 0x0201E8D4
_080A9268:
	movs r0, #0xbf
	ldrb r1, [r6, #0x14]
	ands r0, r1
	strb r0, [r6, #0x14]
	b _080A9296
_080A9272:
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x49
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, #0x43
	adds r1, r4, r1
	ldrb r1, [r1]
	bl sub_80A5B20
	ldrb r5, [r5]
	adds r4, r5, r4
	ldrb r0, [r4]
	movs r1, #2
	ldrb r7, [r7]
	orrs r1, r7
	bl sub_80A8B38
_080A9296:
	bl sub_80A8A90
	b _080A9322
_080A929C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A92D6
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080A92D6
	str r1, [r4, #0x2c]
	ldr r0, _080A9328 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A92C6
	ldr r0, _080A932C @ =0x0000038B
	bl m4aSongNumStart
_080A92C6:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	movs r0, #3
	movs r1, #0
	bl sub_80A5B20
_080A92D6:
	ldr r0, [r4, #0x50]
	adds r0, #1
	str r0, [r4, #0x50]
	ldr r5, _080A9330 @ =0x000001FF
	ands r0, r5
	cmp r0, #0x20
	bne _080A9306
	ldr r2, _080A9334 @ =0x0201E8D4
	adds r3, r4, #0
	adds r3, #0x41
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #0xa]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	bl sub_8055474
_080A9306:
	ldr r0, [r4, #0x50]
	ands r0, r5
	cmp r0, #0x80
	bne _080A9322
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080A9334 @ =0x0201E8D4
	adds r0, r0, r1
	bl sub_8055644
_080A9322:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9328: .4byte gPlaySt
_080A932C: .4byte 0x0000038B
_080A9330: .4byte 0x000001FF
_080A9334: .4byte 0x0201E8D4

	thumb_func_start sub_80A9338
sub_80A9338: @ 0x080A9338
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A935C
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
_080A935C:
	subs r0, #1
	strb r0, [r1]
	bl sub_80A8B60
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r3, [r2]
	adds r1, r3, #0
	muls r1, r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_80A9064
	ldrh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	cmp r0, r1
	bhs _080A939A
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x32]
_080A939A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A93A0
sub_80A93A0: @ 0x080A93A0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	str r0, [r4, #0x34]
	movs r5, #0
	str r5, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A93CA
	adds r0, r2, #1
	strb r0, [r1]
	b _080A93CC
_080A93CA:
	strb r5, [r1]
_080A93CC:
	bl sub_80A8B60
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r3, [r2]
	adds r1, r3, #0
	muls r1, r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_80A9064
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x32]
	cmp r1, r0
	bls _080A9406
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x30]
_080A9406:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80A940C
sub_80A940C: @ 0x080A940C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x30]
	subs r0, r1, r2
	mov r3, r8
	ldr r6, [r3, #0x34]
	adds r4, r0, #0
	muls r4, r6, r4
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldr r5, [r3, #0x2c]
	adds r5, #1
	str r5, [r3, #0x2c]
	asrs r4, r4, #2
	movs r0, #0x1e
	subs r0, r0, r5
	adds r1, r4, #0
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xe1
	lsls r1, r1, #2
	bl __divsi3
	subs r4, r4, r0
	lsls r4, r4, #2
	adds r0, r6, #0
	muls r0, r4, r0
	mov r1, r8
	ldrh r1, [r1, #0x30]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r5, #0xd
	bne _080A946E
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_80A870C
_080A946E:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0xe
	bne _080A948C
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_80A86D4
	mov r3, r8
	str r0, [r3, #0x3c]
_080A948C:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	cmp r0, #0x14
	bne _080A94A4
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_80A856C
_080A94A4:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0x1e
	bne _080A94BC
	ldr r0, _080A9530 @ =0x00000FFF
	ldrh r3, [r2, #0x32]
	ands r0, r3
	adds r7, r0, #0
	strh r7, [r2, #0x30]
	mov r0, r8
	bl Proc_Break
_080A94BC:
	ldr r4, _080A9534 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r0, r7, #0
	bl sub_80A8B1C
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9530: .4byte 0x00000FFF
_080A9534: .4byte gSinLut

	thumb_func_start sub_80A9538
sub_80A9538: @ 0x080A9538
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	bl sub_80A84D8
	bl sub_8055690
	movs r0, #0
	bl EndFaceById
	adds r4, #0x42
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080A956A
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A9570
_080A956A:
	movs r0, #0
	bl SetOnHBlankA
_080A9570:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A9578
sub_80A9578: @ 0x080A9578
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A958C @ =gUnk_08DAE11C
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A958C: .4byte gUnk_08DAE11C

	thumb_func_start sub_80A9590
sub_80A9590: @ 0x080A9590
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809F40C
	cmp r0, #7
	ble _080A95AA
	ldr r0, _080A95B0 @ =gUnk_08DAE11C
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
_080A95AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A95B0: .4byte gUnk_08DAE11C

	thumb_func_start sub_80A95B4
sub_80A95B4: @ 0x080A95B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	mov sb, r2
	mov sl, r3
	ldr r3, [sp, #0x40]
	ldr r0, _080A9688 @ =0xFFFFFC00
	adds r0, r0, r3
	mov r8, r0
	mov r1, r8
	muls r1, r0, r1
	lsls r5, r3, #1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r5, r6
	muls r0, r1, r0
	asrs r1, r0, #0x1f
	adds r4, r3, #0
	muls r4, r3, r4
	movs r2, #0xc0
	lsls r2, r2, #4
	subs r2, r2, r5
	muls r4, r2, r4
	asrs r5, r4, #0x1f
	subs r6, r6, r3
	adds r2, r6, #0
	muls r2, r6, r2
	muls r2, r3, r2
	str r2, [sp, #0x18]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x1c]
	mov r2, r8
	muls r2, r3, r2
	muls r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r2, sb
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sb
	ldr r6, [sp]
	subs r3, r3, r6
	mov sb, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sb
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	ldr r6, [sp, #4]
	subs r3, r3, r6
	mov sl, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sl
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #2
	lsrs r2, r0, #0x1e
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9688: .4byte 0xFFFFFC00

	thumb_func_start sub_80A968C
sub_80A968C: @ 0x080A968C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	mov sb, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r2, [sp, #0x38]
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r0, r3, #1
	adds r4, r2, #0
	muls r4, r0, r4
	lsls r5, r3, #0xb
	subs r0, r4, r5
	asrs r1, r0, #0x1f
	subs r4, r5, r4
	str r4, [sp]
	asrs r4, r4, #0x1f
	str r4, [sp, #4]
	muls r3, r2, r3
	lsls r4, r2, #0xc
	subs r4, r3, r4
	movs r5, #0x80
	lsls r5, r5, #0xd
	adds r4, r4, r5
	asrs r5, r4, #0x1f
	lsls r2, r2, #0xb
	subs r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	mov r2, sb
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	subs r6, r6, r3
	asrs r0, r6, #1
	adds r2, r0, #0
	asrs r3, r6, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, r8
	mov r5, sb
	subs r3, r3, r5
	mov r8, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r7, r8
	asrs r3, r7, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80A974C
sub_80A974C: @ 0x080A974C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x24]
	mov r8, r0
	ldr r7, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	mov sb, r1
	movs r0, #3
	ands r0, r3
	bl GetBgTilemap
	str r0, [sp]
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	add sl, r4
	mov r2, r8
	cmp r2, #0
	bge _080A978E
	add sb, r8
	lsls r0, r2, #1
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r2, #0
	mov r8, r2
_080A978E:
	cmp r7, #0
	bge _080A97A2
	ldr r0, [sp, #0x30]
	adds r0, r0, r7
	str r0, [sp, #0x30]
	lsls r0, r7, #6
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r7, #0
_080A97A2:
	movs r1, #0
	cmp r7, #0x1f
	bgt _080A97FC
	ldr r2, [sp, #0x30]
	cmp r1, r2
	bge _080A97FC
_080A97AE:
	movs r5, #0
	adds r4, r1, #1
	mov r0, r8
	cmp r0, #0x1f
	bgt _080A97EE
	cmp r5, sb
	bge _080A97EE
	adds r0, r7, r1
	movs r2, #0x1f
	mov ip, r2
	ands r0, r2
	lsls r6, r0, #5
	mov r2, r8
	lsls r0, r1, #6
	mov r1, sl
	adds r3, r0, r1
_080A97CE:
	adds r0, r2, #0
	mov r1, ip
	ands r0, r1
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r0, r0, r1
	ldrh r1, [r3]
	strh r1, [r0]
	adds r2, #1
	adds r3, #2
	adds r5, #1
	cmp r2, #0x1f
	bgt _080A97EE
	cmp r5, sb
	blt _080A97CE
_080A97EE:
	adds r1, r4, #0
	adds r0, r7, r4
	cmp r0, #0x1f
	bgt _080A97FC
	ldr r2, [sp, #0x30]
	cmp r4, r2
	blt _080A97AE
_080A97FC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80A980C
sub_80A980C: @ 0x080A980C
	push {r4, r5, r6, lr}
	movs r2, #0
	adds r4, r0, #0
	adds r4, #0x3c
	movs r3, #0
	movs r6, #0xf0
	adds r1, r0, #0
	adds r1, #0x2c
	movs r5, #0xa0
_080A981E:
	adds r0, r4, r2
	strb r3, [r0]
	strb r3, [r1]
	strb r3, [r1, #1]
	strb r6, [r1, #2]
	strb r5, [r1, #3]
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080A981E
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80A9838
sub_80A9838: @ 0x080A9838
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	adds r4, r6, #0
	adds r4, #0x2c
_080A9844:
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r7
	ldrb r5, [r0]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080A98B2
	lsls r0, r7, #1
	adds r1, r6, #0
	adds r1, #0x40
	adds r1, r1, r0
	movs r2, #0
	ldrsh r3, [r1, r2]
	adds r1, r6, #0
	adds r1, #0x48
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r0, [r4]
	cmp r3, r0
	blt _080A98B2
	ldrb r0, [r4, #2]
	cmp r3, r0
	bge _080A98B2
	ldrb r0, [r4, #1]
	cmp r2, r0
	blt _080A98B2
	ldrb r0, [r4, #3]
	cmp r2, r0
	bge _080A98B2
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080A98A4
	adds r1, r3, #0
	subs r1, #0xc
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	ldr r3, _080A98A0 @ =gUnk_08DAE1DC
	bl PutSprite
	b _080A98B2
	.align 2, 0
_080A98A0: .4byte gUnk_08DAE1DC
_080A98A4:
	adds r1, r3, #0
	subs r1, #0xc
	str r0, [sp]
	movs r0, #3
	ldr r3, _080A98C4 @ =gUnk_08DAE1D4
	bl PutSprite
_080A98B2:
	adds r4, #4
	adds r7, #1
	cmp r7, #3
	ble _080A9844
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A98C4: .4byte gUnk_08DAE1D4

	thumb_func_start sub_80A98C8
sub_80A98C8: @ 0x080A98C8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A98D8 @ =gUnk_08DAE1E4
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A98D8: .4byte gUnk_08DAE1E4

	thumb_func_start sub_80A98DC
sub_80A98DC: @ 0x080A98DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _080A9940 @ =gUnk_08DAE1E4
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A9936
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r1, r5
	movs r3, #1
	movs r0, #1
	strb r0, [r1]
	lsls r2, r5, #1
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r2
	mov r2, r8
	strh r2, [r0]
	adds r0, r6, #0
	orrs r0, r3
	strb r0, [r1]
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _080A9936
	ldr r0, _080A9944 @ =gUnk_0818FEB0
	ldr r1, _080A9948 @ =0x060100C0
	bl Decompress
	ldr r0, _080A994C @ =gUnk_0818FEEC
	ldr r1, _080A9950 @ =0x060104C0
	bl Decompress
_080A9936:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9940: .4byte gUnk_08DAE1E4
_080A9944: .4byte gUnk_0818FEB0
_080A9948: .4byte 0x060100C0
_080A994C: .4byte gUnk_0818FEEC
_080A9950: .4byte 0x060104C0

	thumb_func_start sub_80A9954
sub_80A9954: @ 0x080A9954
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A9988 @ =gUnk_08DAE1E4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9982
	lsls r0, r4, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r1, #0x2f
	ldr r0, [sp, #0x14]
	strb r0, [r1]
_080A9982:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9988: .4byte gUnk_08DAE1E4

	thumb_func_start sub_80A998C
sub_80A998C: @ 0x080A998C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A99A8 @ =gUnk_08DAE1E4
	bl Proc_Find
	cmp r0, #0
	beq _080A99A2
	adds r0, #0x3c
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080A99A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A99A8: .4byte gUnk_08DAE1E4

	thumb_func_start sub_80A99AC
sub_80A99AC: @ 0x080A99AC
	push {lr}
	ldr r0, _080A99CC @ =gUnk_08DAE1E4
	bl Proc_Find
	cmp r0, #0
	beq _080A99C8
	adds r1, r0, #0
	adds r1, #0x3c
	movs r2, #0
	adds r0, #0x43
_080A99C0:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A99C0
_080A99C8:
	pop {r0}
	bx r0
	.align 2, 0
_080A99CC: .4byte gUnk_08DAE1E4

	thumb_func_start sub_80A99D0
sub_80A99D0: @ 0x080A99D0
	push {lr}
	ldr r0, _080A99E8 @ =gUnk_08DAE1E4
	bl Proc_Find
	cmp r0, #0
	beq _080A99E2
	movs r1, #1
	bl Proc_Goto
_080A99E2:
	pop {r0}
	bx r0
	.align 2, 0
_080A99E8: .4byte gUnk_08DAE1E4

	thumb_func_start sub_80A99EC
sub_80A99EC: @ 0x080A99EC
	push {lr}
	ldr r0, _080A9A04 @ =gUnk_08DAE1E4
	bl Proc_Find
	cmp r0, #0
	beq _080A99FE
	movs r1, #0
	bl Proc_Goto
_080A99FE:
	pop {r0}
	bx r0
	.align 2, 0
_080A9A04: .4byte gUnk_08DAE1E4

	thumb_func_start sub_80A9A08
sub_80A9A08: @ 0x080A9A08
	push {lr}
	ldr r0, _080A9A18 @ =gUnk_08DAE1E4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9A18: .4byte gUnk_08DAE1E4

	thumb_func_start sub_80A9A1C
sub_80A9A1C: @ 0x080A9A1C
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x54
	strh r1, [r2]
	str r1, [r0, #0x4c]
	str r1, [r0, #0x44]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x50]
	str r1, [r0, #0x48]
	str r1, [r0, #0x40]
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start sub_80A9A3C
sub_80A9A3C: @ 0x080A9A3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x34]
	ldr r0, [r5, #0x3c]
	mov r8, r0
	ldr r1, [r5, #0x38]
	mov sb, r1
	ldr r2, [r5, #0x40]
	mov sl, r2
	ldr r0, [r5, #0x44]
	adds r0, #1
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	movs r6, #0
_080A9A66:
	lsls r3, r6, #2
	adds r0, r5, #0
	adds r0, #0x4c
	adds r2, r0, r3
	ldr r0, [r2]
	adds r4, r5, #0
	adds r4, #0x44
	cmp r0, #0
	beq _080A9A86
	adds r0, r4, r3
	ldr r1, [r0]
	adds r1, #3
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_080A9A86:
	adds r1, r4, r3
	ldr r0, [r1]
	asrs r0, r0, #3
	cmp r0, #5
	ble _080A9A94
	movs r0, #0
	str r0, [r1]
_080A9A94:
	adds r6, #1
	cmp r6, #1
	ble _080A9A66
	ldr r3, [r5, #0x2c]
	cmp r3, #0
	bne _080A9B28
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A9AB4
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x34]
	adds r7, r0, r1
	cmp r2, #4
	bne _080A9AB4
	str r3, [r5, #0x4c]
_080A9AB4:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A9ACC
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	mov sb, r0
	cmp r2, #4
	bne _080A9ACC
	movs r0, #0
	str r0, [r5, #0x50]
_080A9ACC:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A9AF6
	ldr r1, _080A9BDC @ =0x000001FF
	ands r1, r7
	movs r2, #0xff
	mov r0, r8
	ands r2, r0
	ldr r3, _080A9BE0 @ =gUnk_08DAE214
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A9AF6:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A9B28
	ldr r1, _080A9BDC @ =0x000001FF
	mov r2, sb
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r2, #0xff
	mov r0, sl
	ands r2, r0
	ldr r3, _080A9BE0 @ =gUnk_08DAE214
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A9B28:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _080A9BCA
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A9B46
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	mov r8, r0
	cmp r2, #4
	bne _080A9B46
	movs r0, #0
	str r0, [r5, #0x4c]
_080A9B46:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A9B5E
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	mov sl, r0
	cmp r2, #4
	bne _080A9B5E
	movs r0, #0
	str r0, [r5, #0x50]
_080A9B5E:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A9B90
	ldr r0, _080A9BDC @ =0x000001FF
	ands r7, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r3, _080A9BE4 @ =gUnk_08DAE222
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0xd
	adds r1, r7, #0
	mov r2, r8
	bl PutSpriteExt
_080A9B90:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A9BCA
	ldr r0, _080A9BDC @ =0x000001FF
	mov r2, sb
	ands r2, r0
	mov sb, r2
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, sb
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	mov sl, r2
	ldr r3, _080A9BE4 @ =gUnk_08DAE222
	adds r2, r5, #0
	adds r2, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r2, r0
	str r0, [sp]
	movs r0, #0xd
	mov r2, sl
	bl PutSpriteExt
_080A9BCA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9BDC: .4byte 0x000001FF
_080A9BE0: .4byte gUnk_08DAE214
_080A9BE4: .4byte gUnk_08DAE222

	thumb_func_start sub_80A9BE8
sub_80A9BE8: @ 0x080A9BE8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A9BF8 @ =gUnk_08DAE22C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A9BF8: .4byte gUnk_08DAE22C

	thumb_func_start sub_80A9BFC
sub_80A9BFC: @ 0x080A9BFC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, _080A9C54 @ =gUnk_08DAE22C
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080A9C4C
	ldr r0, _080A9C58 @ =gUnk_08428A40
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r6, #0
	bne _080A9C2C
	ldr r0, _080A9C5C @ =gUnk_08427A48
	ldr r2, _080A9C60 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A9C2C:
	cmp r6, #1
	bne _080A9C3A
	ldr r0, _080A9C64 @ =gUnk_08427974
	ldr r2, _080A9C60 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A9C3A:
	asrs r0, r4, #5
	movs r1, #0xf
	ands r1, r7
	lsls r1, r1, #0xc
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	str r6, [r5, #0x2c]
_080A9C4C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9C54: .4byte gUnk_08DAE22C
_080A9C58: .4byte gUnk_08428A40
_080A9C5C: .4byte gUnk_08427A48
_080A9C60: .4byte 0x06010000
_080A9C64: .4byte gUnk_08427974

	thumb_func_start sub_80A9C68
sub_80A9C68: @ 0x080A9C68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9C80 @ =gUnk_08DAE22C
	bl Proc_Find
	cmp r0, #0
	beq _080A9C78
	str r4, [r0, #0x30]
_080A9C78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C80: .4byte gUnk_08DAE22C

	thumb_func_start sub_80A9C84
sub_80A9C84: @ 0x080A9C84
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A9CA8 @ =gUnk_08DAE22C
	bl Proc_Find
	cmp r0, #0
	beq _080A9CA0
	str r4, [r0, #0x34]
	str r5, [r0, #0x3c]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
_080A9CA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9CA8: .4byte gUnk_08DAE22C

	thumb_func_start sub_80A9CAC
sub_80A9CAC: @ 0x080A9CAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9CE0 @ =gUnk_08DAE22C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9CDA
	cmp r4, #0
	bne _080A9CC4
	movs r0, #1
	str r0, [r1, #0x4c]
_080A9CC4:
	cmp r4, #1
	bne _080A9CCA
	str r4, [r1, #0x50]
_080A9CCA:
	cmp r4, #2
	bne _080A9CD2
	movs r0, #1
	str r0, [r1, #0x4c]
_080A9CD2:
	cmp r4, #3
	bne _080A9CDA
	movs r0, #1
	str r0, [r1, #0x50]
_080A9CDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9CE0: .4byte gUnk_08DAE22C

	thumb_func_start sub_80A9CE4
sub_80A9CE4: @ 0x080A9CE4
	push {lr}
	ldr r0, _080A9CF4 @ =gUnk_08DAE22C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9CF4: .4byte gUnk_08DAE22C
