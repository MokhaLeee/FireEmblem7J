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
	ldr r0, _080A44FC @ =Pal_SaveMenuBackground
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
	ldr r1, _080A4508 @ =Tsa_SaveMenuBackground
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _080A450C @ =Pal_SaveMenuWindow
	movs r1, #0x88
	lsls r1, r1, #2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r2, r5, #0
	bl ApplyPaletteExt
	ldr r0, _080A4510 @ =Pal_Unk_08432694
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
	ldr r0, _080A4520 @ =Img_SaveMenuSprits
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
	ldr r4, _080A453C @ =Img_SpinRotation
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A4540 @ =gBg3Tm
	ldr r1, _080A4544 @ =TsaDirect_SpinRotation
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
	bl StartSaveDraw
	mov r2, r8
	str r0, [r2, #0x58]
	mov r0, r8
	bl StartSpinRotation
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
_080A44FC: .4byte Pal_SaveMenuBackground
_080A4500: .4byte Img_MuralBackground
_080A4504: .4byte gBg0Tm
_080A4508: .4byte Tsa_SaveMenuBackground
_080A450C: .4byte Pal_SaveMenuWindow
_080A4510: .4byte Pal_Unk_08432694
_080A4514: .4byte gUnk_08432AE8
_080A4518: .4byte 0x02000004
_080A451C: .4byte gDispIo
_080A4520: .4byte Img_SaveMenuSprits
_080A4524: .4byte 0x06010800
_080A4528: .4byte gSinLut
_080A452C: .4byte gCosLut
_080A4530: .4byte gAnims
_080A4534: .4byte 0x02000001
_080A4538: .4byte SaveMenuOnHBlank
_080A453C: .4byte Img_SpinRotation
_080A4540: .4byte gBg3Tm
_080A4544: .4byte TsaDirect_SpinRotation
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
	ldr r0, _080A5A24 @ =Pal_SaveMenuWindow
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080A5A28 @ =Img_SaveMenuSprits
	ldr r1, _080A5A2C @ =0x06010800
	bl Decompress
	ldr r0, _080A5A30 @ =gBg0Tm
	ldr r1, _080A5A34 @ =Tsa_SaveMenuBackground
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
_080A5A24: .4byte Pal_SaveMenuWindow
_080A5A28: .4byte Img_SaveMenuSprits
_080A5A2C: .4byte 0x06010800
_080A5A30: .4byte gBg0Tm
_080A5A34: .4byte Tsa_SaveMenuBackground
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

	thumb_func_start StartMainMenu
StartMainMenu: @ 0x080A5AA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5AD0 @ =ProcScr_SaveMenu
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
_080A5AD0: .4byte ProcScr_SaveMenu
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
	ldr r0, _080A5B40 @ =ProcScr_SaveMenu
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
_080A5B40: .4byte ProcScr_SaveMenu
