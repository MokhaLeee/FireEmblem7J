	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_8011B4C
sub_8011B4C: @ 0x08011B4C
	push {r4, lr}
	movs r3, #0
	str r3, [r0, #0x30]
	ldr r0, _08011BC8 @ =gDispIo
	mov ip, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r4, ip
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r4, [r4, #0x14]
	ands r1, r4
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _08011BCC @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _08011BD0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r4, ip
	strh r0, [r4, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011BC8: .4byte gDispIo
_08011BCC: .4byte 0x0000FFE0
_08011BD0: .4byte 0x0000E0FF

	thumb_func_start sub_8011BD4
sub_8011BD4: @ 0x08011BD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	movs r2, #0x80
	lsls r2, r2, #1
	subs r2, r2, r0
	ldr r3, _08011C04 @ =0xFFFFBFFF
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x30]
	cmp r0, #0x40
	bne _08011BFE
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011BFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011C04: .4byte 0xFFFFBFFF

	thumb_func_start sub_8011C08
sub_8011C08: @ 0x08011C08
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r0, r2, #1
	str r0, [r4, #0x30]
	adds r2, #0xc1
	ldr r3, _08011C34 @ =0xFFFFBFFF
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x30]
	cmp r0, #0x40
	bne _08011C2E
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011C2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011C34: .4byte 0xFFFFBFFF

	thumb_func_start sub_8011C38
sub_8011C38: @ 0x08011C38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	movs r1, #0xfa
	lsls r1, r1, #2
	cmp r0, r1
	bne _08011C56
	movs r0, #0
	bl BmBgfxSetLoopEN
	adds r0, r4, #0
	bl Proc_Break
_08011C56:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8011C5C
sub_8011C5C: @ 0x08011C5C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _08011CA8 @ =gUnk_081AC808
	ldr r1, _08011CAC @ =0x06010800
	bl Decompress
	ldr r0, _08011CB0 @ =gUnk_081ACA20
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
_08011C78:
	movs r5, #0
	str r5, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _08011CB4 @ =gUnk_081ACA40
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0
	ldr r3, _08011CB8 @ =0x00005040
	bl StartSpriteAnimProc
	lsls r2, r4, #2
	adds r1, r6, #0
	adds r1, #0x44
	adds r1, r1, r2
	str r0, [r1]
	adds r4, #1
	cmp r4, #7
	ble _08011C78
	str r5, [r6, #0x30]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011CA8: .4byte gUnk_081AC808
_08011CAC: .4byte 0x06010800
_08011CB0: .4byte gUnk_081ACA20
_08011CB4: .4byte gUnk_081ACA40
_08011CB8: .4byte 0x00005040

	thumb_func_start sub_8011CBC
sub_8011CBC: @ 0x08011CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, [r6, #0x30]
	adds r4, #1
	str r4, [r6, #0x30]
	ldr r0, [r6, #0x3c]
	lsls r0, r0, #4
	ldr r2, _08011DC4 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r0, #8
	str r0, [sp, #8]
	ldr r0, _08011DC8 @ =0x000001FF
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	ldr r0, [r6, #0x40]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r0, #8
	mov sl, r0
	movs r0, #0xff
	mov r1, sl
	ands r1, r0
	mov sl, r1
	movs r2, #0xa0
	subs r4, r2, r4
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #3
	muls r0, r4, r0
	movs r5, #0xc8
	lsls r5, r5, #7
	adds r1, r5, #0
	bl __divsi3
	adds r7, r0, #0
	lsls r0, r4, #8
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	movs r1, #0x88
	lsls r1, r1, #1
	movs r5, #0
	ldr r3, _08011DCC @ =gSinLut
	mov sb, r3
	movs r2, #0xff
	mov r8, r2
	subs r4, r1, r0
_08011D30:
	adds r2, r4, #0
	mov r3, r8
	ands r2, r3
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r7, r0
	asrs r0, r0, #0xc
	movs r1, #0x78
	subs r1, r1, r0
	lsls r2, r2, #1
	add r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	muls r0, r7, r0
	asrs r0, r0, #0xc
	movs r2, #0x50
	subs r2, r2, r0
	lsls r3, r5, #2
	adds r0, r6, #0
	adds r0, #0x44
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _08011DC8 @ =0x000001FF
	ands r1, r3
	mov r3, r8
	ands r2, r3
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #1
	rsbs r3, r3, #0
	bl SetSpriteAnimProcParameters
	adds r4, #0x20
	adds r5, #1
	cmp r5, #7
	ble _08011D30
	movs r0, #0xa0
	movs r1, #3
	bl __divsi3
	ldr r1, [r6, #0x30]
	cmp r1, r0
	bne _08011DA8
	ldr r0, _08011DD0 @ =gUnk_081ACA40
	movs r2, #0x80
	lsls r2, r2, #3
	add r2, sl
	ldr r3, _08011DD4 @ =0x00005040
	movs r1, #1
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	bl StartSpriteAnimProc
_08011DA8:
	ldr r0, [r6, #0x30]
	cmp r0, #0xa0
	bne _08011DB4
	adds r0, r6, #0
	bl Proc_Break
_08011DB4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011DC4: .4byte gBmSt
_08011DC8: .4byte 0x000001FF
_08011DCC: .4byte gSinLut
_08011DD0: .4byte gUnk_081ACA40
_08011DD4: .4byte 0x00005040

	thumb_func_start sub_8011DD8
sub_8011DD8: @ 0x08011DD8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r5, #0x44
	movs r4, #7
_08011DE0:
	ldm r5!, {r0}
	bl EndSpriteAnimProc
	subs r4, #1
	cmp r4, #0
	bge _08011DE0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8011DF4
sub_8011DF4: @ 0x08011DF4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r2, [r5, #0x3c]
	lsls r2, r2, #4
	ldr r4, _08011E40 @ =gBmSt
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	subs r2, r2, r0
	subs r2, #0x28
	movs r1, #0xff
	ands r2, r1
	ldr r3, [r5, #0x40]
	lsls r3, r3, #4
	movs r6, #0xe
	ldrsh r0, [r4, r6]
	subs r3, r3, r0
	subs r3, #0x28
	ands r3, r1
	ldr r0, _08011E44 @ =gUnk_08C013F0
	movs r4, #0
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	bl StartBmBgfx
	str r4, [r5, #0x30]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011E40: .4byte gBmSt
_08011E44: .4byte gUnk_08C013F0

	thumb_func_start sub_8011E48
sub_8011E48: @ 0x08011E48
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	movs r5, #0
	cmp r0, #0x14
	bne _08011E70
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x40]
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xdc
	movs r1, #0x40
	bl sub_80123C8
_08011E70:
	ldr r0, [r4, #0x30]
	cmp r0, #0x28
	bne _08011E84
	str r5, [r4, #0x30]
	movs r0, #0
	bl BmBgfxSetLoopEN
	adds r0, r4, #0
	bl Proc_Break
_08011E84:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8011E8C
sub_8011E8C: @ 0x08011E8C
	push {lr}
	ldr r2, _08011EBC @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_08011EBC: .4byte gDispIo

	thumb_func_start sub_8011EC0
sub_8011EC0: @ 0x08011EC0
	push {r4, r5, lr}
	sub sp, #0x10
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _08011EEC
	ldr r0, _08011EE8 @ =gUnk_08C015DC
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	str r5, [r0, #0x40]
	movs r0, #2
	b _08011F06
	.align 2, 0
_08011EE8: .4byte gUnk_08C015DC
_08011EEC:
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xdc
	movs r1, #0x54
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80123C8
	movs r0, #0
_08011F06:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8011F10
sub_8011F10: @ 0x08011F10
	push {lr}
	movs r1, #0
	str r1, [r0, #0x3c]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8011F20
sub_8011F20: @ 0x08011F20
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	adds r2, r1, r0
	str r2, [r4, #0x3c]
	cmp r2, #0xff
	bgt _08011F5C
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r2
	lsls r3, r0, #8
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r0, r3, r0
	cmp r0, #0
	bge _08011F44
	adds r0, #0xff
_08011F44:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r1, r3, r0
	cmp r1, #0
	bge _08011F52
	adds r1, #0xff
_08011F52:
	asrs r1, r1, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r3, r0
	b _08011F8C
_08011F5C:
	movs r0, #0x80
	lsls r0, r0, #2
	subs r3, r0, r2
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r5, _08011FBC @ =0xFFFFFF00
	adds r0, r2, r5
	lsls r2, r0, #8
	adds r0, r1, r2
	cmp r0, #0
	bge _08011F76
	adds r0, #0xff
_08011F76:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r3, r0
	adds r0, r0, r2
	cmp r0, #0
	bge _08011F84
	adds r0, #0xff
_08011F84:
	asrs r1, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r3, r0
	adds r0, r0, r2
_08011F8C:
	cmp r0, #0
	bge _08011F92
	adds r0, #0xff
_08011F92:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _08011FC0
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #0
	bgt _08011FCC
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	bl Proc_Break
	b _08011FCC
	.align 2, 0
_08011FBC: .4byte 0xFFFFFF00
_08011FC0:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _08011FCC
	movs r0, #0
	str r0, [r4, #0x3c]
_08011FCC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8011FD4
sub_8011FD4: @ 0x08011FD4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r2, r7, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	cmp r0, #0
	bge _08011FF4
	adds r0, #0xff
_08011FF4:
	asrs r6, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _08012002
	adds r0, #0xff
_08012002:
	asrs r5, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _08012010
	adds r0, #0xff
_08012010:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _08012028
	adds r0, r4, #0
	bl Proc_Break
_08012028:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8012030
sub_8012030: @ 0x08012030
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, _08012068 @ =gUnk_08C0162C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012068: .4byte gUnk_08C0162C

	thumb_func_start sub_801206C
sub_801206C: @ 0x0801206C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	ldr r1, [r0, #4]
	mov ip, r1
	ldr r1, [r0, #8]
	mov r8, r1
	ldr r1, [r0, #0xc]
	movs r2, #0xff
	adds r6, r1, #0
	ands r6, r2
	lsrs r5, r1, #0x10
	ands r5, r2
	ldr r0, [r0, #0x10]
	ldr r1, _080120C4 @ =0x000003FF
	adds r4, r0, #0
	ands r4, r1
	lsrs r3, r0, #0xa
	ands r3, r1
	lsrs r2, r0, #0x14
	ands r2, r1
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080120C8
	str r4, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r7, [sp, #0xc]
	mov r0, ip
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_8012030
	movs r0, #2
	b _080120CA
	.align 2, 0
_080120C4: .4byte 0x000003FF
_080120C8:
	movs r0, #0
_080120CA:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80120D8
sub_80120D8: @ 0x080120D8
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start sub_80120E0
sub_80120E0: @ 0x080120E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	adds r0, r0, r1
	str r0, [r4, #0x38]
	cmp r0, #0xff
	ble _080120FC
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r4, #0x38]
_080120FC:
	ldr r2, [r4, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	subs r3, r0, r2
	ldr r0, [r4, #0x3c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08012116
	adds r0, #0xff
_08012116:
	asrs r6, r0, #8
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x4c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0801212A
	adds r1, #0xff
_0801212A:
	asrs r5, r1, #8
	ldr r0, [r4, #0x44]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x50]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _0801213E
	adds r0, #0xff
_0801213E:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8012150
sub_8012150: @ 0x08012150
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x1c]
	ldr r0, _080121A0 @ =gUnk_08C01654
	bl Proc_StartBlocking
	adds r5, r0, #0
	movs r0, #0xff
	ands r0, r4
	cmp r0, #0x80
	bne _08012174
	movs r0, #0x80
	lsls r0, r0, #1
_08012174:
	str r0, [r5, #0x34]
	bl sub_8013BA0
	str r0, [r5, #0x3c]
	bl sub_8013BAC
	str r0, [r5, #0x40]
	bl sub_8013BBC
	str r0, [r5, #0x44]
	mov r0, r8
	str r0, [r5, #0x30]
	str r6, [r5, #0x48]
	str r7, [r5, #0x4c]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080121A0: .4byte gUnk_08C01654

	thumb_func_start EventE5
EventE5: @ 0x080121A4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	ldr r0, [r0, #0xc]
	ldr r1, _080121E0 @ =0x000003FF
	adds r4, r0, #0
	ands r4, r1
	lsrs r3, r0, #0xa
	ands r3, r1
	lsrs r2, r0, #0x14
	ands r2, r1
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080121E4
	str r2, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_8012150
	movs r0, #2
	b _080121E6
	.align 2, 0
_080121E0: .4byte 0x000003FF
_080121E4:
	movs r0, #0
_080121E6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80121F0
sub_80121F0: @ 0x080121F0
	push {lr}
	bl ArchiveCurrentPalettes
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start sub_80121FC
sub_80121FC: @ 0x080121FC
	push {lr}
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	movs r0, #2
	pop {r1}
	bx r1
