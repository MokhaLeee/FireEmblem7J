	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80AFE38
sub_80AFE38: @ 0x080AFE38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #1
	ldr r2, _080AFE94 @ =gPal
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, _080AFE98 @ =0x0000021E
	adds r6, r2, r1
	adds r0, r4, r0
	lsls r1, r7, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r3, r0, #2
	ldr r0, _080AFE9C @ =0x00000222
	adds r1, r1, r0
	adds r1, r1, r2
_080AFE84:
	adds r0, r5, r4
	cmp r0, #0xf
	ble _080AFEA0
	ldrh r0, [r6]
	strh r0, [r1]
	adds r2, r7, #1
	mov sb, r2
	b _080AFEA8
	.align 2, 0
_080AFE94: .4byte gPal
_080AFE98: .4byte 0x0000021E
_080AFE9C: .4byte 0x00000222
_080AFEA0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r0, r7, #1
	mov sb, r0
_080AFEA8:
	adds r1, #2
	adds r3, #2
	adds r5, #1
	cmp r5, #0xf
	ble _080AFE84
	bl EnablePalSync
	mov r1, sl
	cmp r1, #7
	bhi _080AFEC0
	movs r2, #8
	mov sl, r2
_080AFEC0:
	mov r4, r8
	cmp r4, #7
	bhi _080AFECA
	movs r0, #8
	mov r8, r0
_080AFECA:
	ldr r4, _080AFF64 @ =gSinLut
	ldr r1, _080AFF68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080AFF68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _080AFF6C @ =0x000001FF
	ldr r4, [sp, #8]
	ands r4, r0
	lsls r1, r7, #9
	adds r1, r4, r1
	ldr r2, [sp, #0xc]
	ands r2, r0
	str r2, [sp, #0xc]
	ldr r3, _080AFF70 @ =gUnk_08DAF6B4
	ldr r4, [sp, #4]
	adds r0, r4, r7
	lsls r0, r0, #2
	movs r2, #0xf
	mov r4, sb
	ands r4, r2
	lsls r2, r4, #0xc
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #0xc]
	bl PutSpriteExt
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFF64: .4byte gSinLut
_080AFF68: .4byte gCosLut
_080AFF6C: .4byte 0x000001FF
_080AFF70: .4byte gUnk_08DAF6B4

	thumb_func_start sub_80AFF74
sub_80AFF74: @ 0x080AFF74
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _080B0030 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r5, #0x2a]
	movs r2, #0
	movs r1, #9
	adds r0, r5, #0
	adds r0, #0x58
_080AFFB8:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _080AFFB8
	movs r0, #0
	str r0, [r5, #0x5c]
	ldr r0, [r5, #0x64]
	ldr r0, [r0, #8]
	ldr r1, _080B0034 @ =0x06010000
	bl Decompress
	ldr r0, _080B0038 @ =gUnk_0844186C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080B003C @ =gUnk_0843FB60
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B0040 @ =gUnk_0843F1A4
	ldr r1, _080B0044 @ =0x06016000
	bl Decompress
	ldr r0, [r5, #0x64]
	ldrb r2, [r0, #0xd]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0x10
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_80B03B4
	str r0, [r5, #0x34]
	ldr r0, [r5, #0x64]
	ldrb r1, [r0, #0xf]
	adds r0, r5, #0
	bl sub_80B0694
	str r0, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0030: .4byte gDispIo
_080B0034: .4byte 0x06010000
_080B0038: .4byte gUnk_0844186C
_080B003C: .4byte gUnk_0843FB60
_080B0040: .4byte gUnk_0843F1A4
_080B0044: .4byte 0x06016000

	thumb_func_start sub_80B0048
sub_80B0048: @ 0x080B0048
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B009C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r2, #0x3f
	ldrb r0, [r3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldrh r0, [r4, #0x2a]
	lsrs r1, r0, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x46
	strb r0, [r1]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r3]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _080B0094
	strh r5, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080B0094:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B009C: .4byte gDispIo

	thumb_func_start sub_80B00A0
sub_80B00A0: @ 0x080B00A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls _080B00B4
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b _080B00F6
_080B00B4:
	cmp r0, #0xf
	bls _080B00F2
	ldrh r1, [r4, #0x2a]
	adds r6, r1, #0
	subs r6, #0x10
	movs r0, #3
	ands r0, r6
	cmp r0, #0
	bne _080B00F2
	adds r0, r6, #0
	cmp r6, #0
	bge _080B00D0
	adds r0, r1, #0
	subs r0, #0xd
_080B00D0:
	asrs r0, r0, #2
	adds r5, r0, #1
	ldr r0, [r4, #0x64]
	ldrb r0, [r0, #0xd]
	cmp r5, r0
	bge _080B00F2
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_80B03B4
	adds r2, r0, #0
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
_080B00F2:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B00F6:
	strh r0, [r4, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B0100
sub_80B0100: @ 0x080B0100
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x14
	bne _080B0112
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl Proc_Goto
_080B0112:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x4f
	bls _080B0122
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b _080B0158
_080B0122:
	ldrh r5, [r4, #0x2a]
	adds r0, r5, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B0154
	adds r0, r5, #0
	movs r1, #6
	bl __udivsi3
	ldr r1, [r4, #0x64]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0xd]
	cmp r0, r1
	bhs _080B0154
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl Proc_Break
_080B0154:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B0158:
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0160
sub_80B0160: @ 0x080B0160
	push {lr}
	bl EndAllProcChildren
	movs r0, #3
	bl SetLordSelectState
	pop {r0}
	bx r0

	thumb_func_start sub_80B0170
sub_80B0170: @ 0x080B0170
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B0188 @ =gUnk_08DAF6BC
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x60]
	str r5, [r0, #0x64]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B0188: .4byte gUnk_08DAF6BC

	thumb_func_start sub_80B018C
sub_80B018C: @ 0x080B018C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, [r3, #0x14]
	ldr r0, [r0, #0x64]
	ldrb r1, [r0, #0xc]
	adds r0, r3, #0
	adds r0, #0x2c
	strb r1, [r0]
	ldr r1, [r3, #0x14]
	adds r2, r3, #0
	adds r2, #0x2d
	ldrb r4, [r2]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldrh r1, [r1, #0x2c]
	adds r0, r1, r0
	strh r0, [r3, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B01BC
sub_80B01BC: @ 0x080B01BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #0x2d
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	str r1, [sp, #0xc]
	cmp r1, #0
	bne _080B029C
	ldr r3, _080B0294 @ =gSinLut
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r1, #0
	ldrsh r4, [r0, r1]
	asrs r4, r4, #6
	mov sl, r4
	adds r0, r3, #0
	adds r0, #0xc0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #1
	adds r5, r5, r0
	asrs r5, r5, #9
	ldrh r0, [r7, #0x2a]
	movs r2, #0xc0
	subs r2, r2, r0
	movs r1, #0xff
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	asrs r6, r1, #6
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r1, #0
	ldrsh r2, [r2, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	asrs r3, r1, #9
	lsls r0, r0, #8
	movs r1, #0x60
	str r3, [sp, #0x14]
	bl __divsi3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	mov r8, r0
	mov r4, sb
	ldrb r4, [r4]
	mov sb, r4
	movs r0, #0x2e
	ldrsh r4, [r7, r0]
	adds r4, r4, r6
	mov r2, sl
	subs r4, r4, r2
	ldr r0, _080B0298 @ =0x000001FF
	ands r4, r0
	subs r5, #0x18
	ldr r3, [sp, #0x14]
	subs r5, r3, r5
	ands r5, r0
	str r1, [sp]
	str r1, [sp, #4]
	ldrh r0, [r7, #0x2a]
	movs r1, #0xc
	bl __divsi3
	movs r1, #8
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80AFE38
	ldrh r0, [r7, #0x2a]
	adds r0, #4
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x60
	bne _080B02F0
	mov r4, sp
	ldrh r4, [r4, #0xc]
	strh r4, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080B02F0
	.align 2, 0
_080B0294: .4byte gSinLut
_080B0298: .4byte 0x000001FF
_080B029C:
	ldrh r1, [r7, #0x2a]
	adds r0, r1, #0
	adds r2, r1, #0
	asrs r4, r0, #4
	movs r0, #0x10
	subs r6, r0, r4
	adds r3, r6, #0
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	mov r0, sb
	ldrb r6, [r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	subs r2, r0, r3
	movs r0, #0x18
	subs r3, r0, r3
	str r1, [sp]
	adds r0, #0xe8
	mov r8, r0
	str r0, [sp, #4]
	movs r0, #0x10
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80AFE38
	ldrh r0, [r7, #0x2a]
	adds r0, #0x10
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r8
	bne _080B02F0
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
_080B02F0:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0300
sub_80B0300: @ 0x080B0300
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	movs r3, #0x2e
	ldrsh r2, [r5, r3]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r3, #0x18
	bl sub_80AFE38
	strh r4, [r5, #0x2a]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0330
sub_80B0330: @ 0x080B0330
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r1, [r6, #0x2a]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r2, r1, r7
	subs r3, r7, r1
	movs r0, #0x2e
	ldrsh r4, [r6, r0]
	adds r5, r4, #0
	subs r5, #0x58
	adds r0, r5, #0
	muls r0, r1, r0
	muls r0, r1, r0
	asrs r5, r0, #0xf
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	mov ip, r0
	movs r0, #0x2d
	adds r0, r0, r6
	mov r8, r0
	ldrb r1, [r0]
	adds r4, r4, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	ldrh r0, [r6, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, ip
	adds r2, r4, #0
	movs r3, #0x18
	bl sub_80AFE38
	ldrh r2, [r6, #0x2a]
	cmp r2, r7
	bne _080B03A2
	ldr r0, [r6, #0x14]
	mov r3, r8
	ldrb r3, [r3]
	lsls r1, r3, #2
	adds r0, #0x34
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r6, #0
	bl Proc_Break
_080B03A2:
	ldrh r0, [r6, #0x2a]
	adds r0, #8
	strh r0, [r6, #0x2a]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B03B4
sub_80B03B4: @ 0x080B03B4
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B03D0 @ =gUnk_08DAF70C
	adds r1, r2, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2d
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B03D0: .4byte gUnk_08DAF70C

	thumb_func_start sub_80B03D4
sub_80B03D4: @ 0x080B03D4
	push {lr}
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B03E0
sub_80B03E0: @ 0x080B03E0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, _080B0444 @ =gPal
	movs r1, #0
	movs r4, #0xf
	ldr r2, _080B0448 @ =0x000003FE
	adds r0, r0, r2
_080B03F2:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080B03F2
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r5, r2, #0
_080B0414:
	ldrb r0, [r7]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B0434
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080B0434:
	adds r4, #1
	cmp r4, #7
	ble _080B0414
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0444: .4byte gPal
_080B0448: .4byte 0x000003FE

	thumb_func_start sub_80B044C
sub_80B044C: @ 0x080B044C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	movs r7, #0xe0
	lsls r7, r7, #8
	cmp r1, #0
	beq _080B046A
	movs r7, #0xf0
	lsls r7, r7, #8
_080B046A:
	ldr r4, _080B04AC @ =gUnk_08DAF900
	str r7, [sp]
	movs r0, #4
	movs r1, #0x74
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0
	cmp r5, r8
	bge _080B04D6
	mov sb, r4
	movs r6, #0x74
	movs r4, #0x74
_080B0486:
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	bge _080B04B0
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	b _080B04CC
	.align 2, 0
_080B04AC: .4byte gUnk_08DAF900
_080B04B0:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	ldr r3, _080B04E4 @ =gUnk_08DAF8F8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	ldr r3, _080B04E8 @ =gUnk_08DAF908
	bl PutSpriteExt
_080B04CC:
	adds r6, #8
	subs r4, #8
	adds r5, #1
	cmp r5, r8
	blt _080B0486
_080B04D6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B04E4: .4byte gUnk_08DAF8F8
_080B04E8: .4byte gUnk_08DAF908

	thumb_func_start sub_80B04EC
sub_80B04EC: @ 0x080B04EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r0, #0xe0
	lsls r0, r0, #8
	mov sl, r0
	cmp r5, #0
	beq _080B0518
	movs r1, #0xf0
	lsls r1, r1, #8
	mov sl, r1
_080B0518:
	movs r4, #0
	ldr r6, _080B05A8 @ =gPal
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r3, r6, r7
	lsls r2, r5, #0x10
	movs r0, #0xf0
	lsls r0, r0, #1
	mov ip, r0
_080B052A:
	adds r0, r5, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt _080B0534
	lsrs r1, r2, #0x10
_080B0534:
	mov r7, ip
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r4, #1
	cmp r4, #0xf
	ble _080B052A
	bl EnablePalSync
	movs r4, #0
	mov r1, r8
	lsls r0, r1, #5
	subs r0, #0x88
	ldr r6, _080B05AC @ =gUnk_08DAF8C4
	rsbs r5, r0, #0
_080B055E:
	mov r0, sb
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B0580
	ldr r1, _080B05B0 @ =0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	adds r5, #0x20
_080B0580:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble _080B055E
	ldr r3, _080B05B4 @ =gUnk_08DAF8E4
	mov r7, sl
	str r7, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x50
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B05A8: .4byte gPal
_080B05AC: .4byte gUnk_08DAF8C4
_080B05B0: .4byte 0x000001FF
_080B05B4: .4byte gUnk_08DAF8E4

	thumb_func_start sub_80B05B8
sub_80B05B8: @ 0x080B05B8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi _080B05D8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_80B044C
	b _080B05EA
_080B05D8:
	movs r0, #0xe
	movs r1, #0
	bl sub_80B044C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080B05EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B05F0
sub_80B05F0: @ 0x080B05F0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _080B060E
	movs r5, #0
	adds r0, r4, #0
	bl Proc_Break
	b _080B0616
_080B060E:
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080B0616:
	movs r0, #0xe
	movs r1, #0
	bl sub_80B044C
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	adds r0, r5, #0
	bl sub_80B04EC
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0634
sub_80B0634: @ 0x080B0634
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	movs r1, #0
	bl sub_80B044C
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80B04EC
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B065C
sub_80B065C: @ 0x080B065C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0x10
	bls _080B0676
	adds r0, r2, #0
	bl Proc_Break
	b _080B0690
_080B0676:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, #0x2e
	ldrb r2, [r2]
	bl sub_80B04EC
	movs r0, #0xe
	movs r1, #1
	bl sub_80B044C
_080B0690:
	pop {r0}
	bx r0

	thumb_func_start sub_80B0694
sub_80B0694: @ 0x080B0694
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B06B0 @ =gUnk_08DAF744
	adds r1, r2, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B06B0: .4byte gUnk_08DAF744

	thumb_func_start sub_80B06B4
sub_80B06B4: @ 0x080B06B4
	ldr r0, _080B06DC @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _080B06EC
	ldr r3, _080B06E0 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080B06E4 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #2
	strh r0, [r3]
	ldr r2, _080B06E8 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #2
	b _080B0702
	.align 2, 0
_080B06DC: .4byte 0x04000006
_080B06E0: .4byte 0x04000008
_080B06E4: .4byte 0x0000FFFC
_080B06E8: .4byte 0x0400000C
_080B06EC:
	ldr r3, _080B0708 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080B070C @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080B0710 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
_080B0702:
	strh r1, [r2]
	bx lr
	.align 2, 0
_080B0708: .4byte 0x04000008
_080B070C: .4byte 0x0000FFFC
_080B0710: .4byte 0x0400000C

	thumb_func_start sub_80B0714
sub_80B0714: @ 0x080B0714
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080B07E0 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080B07E4 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080B07E8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B07E0: .4byte gDispIo
_080B07E4: .4byte 0x0000FFE0
_080B07E8: .4byte 0x0000E0FF

	thumb_func_start sub_80B07EC
sub_80B07EC: @ 0x080B07EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0x1c]
	add r1, sp, #4
	ldr r0, _080B0818 @ =gUnk_0844BCB8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldr r0, [r0, #0x1c]
	str r0, [r1, #0x38]
	movs r7, #4
	b _080B081E
	.align 2, 0
_080B0818: .4byte gUnk_0844BCB8
_080B081C:
	adds r7, #1
_080B081E:
	cmp r7, #7
	bgt _080B083A
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B081C
	movs r3, #1
	str r3, [sp, #0x1c]
_080B083A:
	movs r4, #0
	movs r0, #0
	mov r1, sb
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x2c]
	adds r1, #0x46
	movs r0, #0xfa
	strb r0, [r1]
	ldr r6, _080B0A18 @ =gBg0Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080B0A1C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r2, _080B0A20 @ =gBg2Tm
	mov r8, r2
	mov r0, r8
	movs r1, #0
	bl TmFill
	ldr r5, _080B0A24 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r5, #1]
	ands r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	bl ResetTextFont
	bl ResetText
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r5, #0xc]
	ands r0, r3
	movs r2, #2
	orrs r0, r2
	strb r0, [r5, #0xc]
	adds r0, r1, #0
	ldrb r4, [r5, #0x10]
	ands r0, r4
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080B0A28 @ =Img_PrepMuralBackground
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B0A2C @ =gUnk_08440300
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B0A30 @ =gBg3Tm
	ldr r1, _080B0A34 @ =gUnk_08440320
	movs r2, #0xa0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, _080B0A38 @ =gUnk_0843FBE0
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B0A3C @ =gUnk_0843FDC8
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080B0A40 @ =gUnk_0843FDE8
	movs r2, #0x90
	lsls r2, r2, #8
	mov r0, r8
	bl TmApplyTsa_thm
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xb]
	mov r4, sb
	adds r4, #0x40
	strb r0, [r4]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xc]
	mov r1, sb
	adds r1, #0x41
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xd]
	mov r1, sb
	adds r1, #0x42
	strb r0, [r1]
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xe]
	mov r1, sb
	adds r1, #0x43
	strb r0, [r1]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r1, [r0, #0xf]
	mov r0, sb
	adds r0, #0x44
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0x10]
	mov r1, sb
	adds r1, #0x45
	strb r0, [r1]
	movs r7, #0
	str r4, [sp, #0x20]
	ldr r2, _080B0A44 @ =0x0200FB28
	mov r8, r2
	movs r3, #0x4a
	adds r3, r3, r6
	mov sl, r3
	adds r6, #0x42
	mov r5, r8
	add r4, sp, #4
_080B09E2:
	adds r0, r5, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _080B0A4C
	cmp r7, #1
	bne _080B0A4C
	mov r0, r8
	adds r0, #8
	ldr r1, _080B0A48 @ =gUnk_0844BCD0
	bl Text_DrawString
	b _080B0A54
	.align 2, 0
_080B0A18: .4byte gBg0Tm
_080B0A1C: .4byte gBg1Tm
_080B0A20: .4byte gBg2Tm
_080B0A24: .4byte gDispIo
_080B0A28: .4byte Img_PrepMuralBackground
_080B0A2C: .4byte gUnk_08440300
_080B0A30: .4byte gBg3Tm
_080B0A34: .4byte gUnk_08440320
_080B0A38: .4byte gUnk_0843FBE0
_080B0A3C: .4byte gUnk_0843FDC8
_080B0A40: .4byte gUnk_0843FDE8
_080B0A44: .4byte 0x0200FB28
_080B0A48: .4byte gUnk_0844BCD0
_080B0A4C:
	ldr r1, [r4]
	adds r0, r5, #0
	bl Text_DrawString
_080B0A54:
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutText
	ldr r1, [sp, #0x20]
	adds r0, r1, r7
	ldrb r2, [r0]
	mov r0, sl
	movs r1, #0
	bl PutNumber
	movs r2, #0x80
	add sl, r2
	adds r6, #0x80
	adds r5, #8
	adds r4, #4
	adds r7, #1
	cmp r7, #5
	ble _080B09E2
	movs r5, #0
	mov r0, sb
	bl sub_80B10B8
	mov r3, sb
	str r0, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl sub_8007DF4
	bl sub_800968C
	bl EndTalk
	mov r4, sb
	ldr r0, [r4, #0x34]
	ldr r2, [r0, #4]
	movs r0, #2
	movs r1, #0xf
	bl StartTalkMsg
	movs r0, #0
	bl sub_8007F84
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #8
	bl SetTalkFlag
	movs r0, #0x40
	bl SetTalkFlag
	movs r0, #4
	bl sub_8007F68
	ldr r0, _080B0BB4 @ =gAnims
	ldr r3, [r4, #0x34]
	movs r1, #0xe
	ldrsb r1, [r3, r1]
	strh r1, [r0, #8]
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldrb r1, [r3, #0x11]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #0xa]
	ldrb r1, [r3, #0x10]
	strb r1, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xe]
	movs r1, #2
	strh r1, [r0, #0x10]
	ldr r1, _080B0BB8 @ =gEkrBg0QuakeVec
	str r1, [r0, #0x1c]
	ldr r1, _080B0BBC @ =0x02002038
	str r1, [r0, #0x24]
	ldr r1, _080B0BC0 @ =0x02007838
	str r1, [r0, #0x20]
	ldr r1, _080B0BC4 @ =0x020078D8
	str r1, [r0, #0x28]
	ldr r1, _080B0BC8 @ =0x0200A2D8
	str r1, [r0, #0x30]
	ldrb r2, [r3, #0x12]
	strh r2, [r1]
	ldrb r2, [r3, #0x13]
	strh r2, [r1, #2]
	ldrb r2, [r3, #0x14]
	strh r2, [r1, #4]
	ldrb r2, [r3, #0x15]
	strh r2, [r1, #6]
	ldrb r2, [r3, #0x16]
	strh r2, [r1, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	strh r2, [r1, #0xe]
	movs r3, #0xf
	strh r3, [r1, #0x10]
	subs r2, #0x80
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r4, [r1, #0x12]
	ldr r2, _080B0BCC @ =gBg1Tm
	str r2, [r1, #0x14]
	ldr r2, _080B0BD0 @ =0x0200A300
	str r2, [r1, #0x18]
	ldr r2, _080B0BD4 @ =0x0200C300
	str r2, [r1, #0x1c]
	ldr r2, _080B0BD8 @ =0x0200CB00
	str r2, [r1, #0x20]
	ldr r2, _080B0BDC @ =sub_80B0714
	str r2, [r1, #0x24]
	bl NewEkrUnitMainMini
	ldr r4, _080B0BE0 @ =0x0200DB00
	mov r0, sb
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #0x17]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #0x18]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, _080B0BE4 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080B0BE8 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080B0BEC @ =0x0200DB28
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_8055718
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl sub_8055AF0
	ldr r0, _080B0BF0 @ =sub_80B06B4
	bl SetOnHBlankA
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0BB4: .4byte gAnims
_080B0BB8: .4byte gEkrBg0QuakeVec
_080B0BBC: .4byte 0x02002038
_080B0BC0: .4byte 0x02007838
_080B0BC4: .4byte 0x020078D8
_080B0BC8: .4byte 0x0200A2D8
_080B0BCC: .4byte gBg1Tm
_080B0BD0: .4byte 0x0200A300
_080B0BD4: .4byte 0x0200C300
_080B0BD8: .4byte 0x0200CB00
_080B0BDC: .4byte sub_80B0714
_080B0BE0: .4byte 0x0200DB00
_080B0BE4: .4byte 0x0000FFFF
_080B0BE8: .4byte 0x06010000
_080B0BEC: .4byte 0x0200DB28
_080B0BF0: .4byte sub_80B06B4

	thumb_func_start sub_80B0BF4
sub_80B0BF4: @ 0x080B0BF4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	bne _080B0C24
	bl sub_80AFDAC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0C1C
	movs r0, #0x3c
	bl FadeBgmOut
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080B0C24
_080B0C1C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080B0C24:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0C30
sub_80B0C30: @ 0x080B0C30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x46
	adds r0, r0, r7
	mov sb, r0
	movs r0, #0x50
	ldrh r1, [r7, #0x2a]
	subs r0, r0, r1
	movs r1, #0xe
	bl __divsi3
	adds r0, #1
	mov r2, sb
	ldrb r2, [r2]
	subs r0, r2, r0
	mov r1, sb
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	bhi _080B0C68
	movs r0, #0xb4
	strb r0, [r1]
_080B0C68:
	ldr r2, _080B0D18 @ =gDispIo
	mov ip, r2
	movs r2, #1
	mov r1, ip
	ldrb r0, [r1, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #4
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	ldrh r6, [r7, #0x2a]
	adds r1, r6, #0
	movs r0, #0x50
	subs r0, r0, r1
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r1, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #4
	ldrb r1, [r0]
	orrs r2, r1
	mov r1, r8
	orrs r2, r1
	mov r1, sl
	orrs r2, r1
	orrs r2, r5
	orrs r2, r4
	strb r2, [r0]
	mov r2, ip
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
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bne _080B0D20
	movs r0, #0xb4
	mov r2, sb
	strb r0, [r2]
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, _080B0D1C @ =sub_80B0BF4
	adds r1, r7, #0
	bl StartParallelWorker
	b _080B0D24
	.align 2, 0
_080B0D18: .4byte gDispIo
_080B0D1C: .4byte sub_80B0BF4
_080B0D20:
	adds r0, r6, #4
	strh r0, [r7, #0x2a]
_080B0D24:
	ldr r0, _080B0D5C @ =gAnims
	adds r4, r7, #0
	adds r4, #0x46
	ldrb r1, [r4]
	movs r2, #0x58
	bl sub_80555F8
	ldr r0, _080B0D60 @ =0x0200DB00
	ldrb r3, [r4]
	adds r1, r3, #0
	subs r1, #0x30
	adds r3, #0x30
	movs r2, #0x68
	str r2, [sp]
	bl sub_8055AF0
	ldr r0, [r7, #0x3c]
	movs r1, #0x78
	bl sub_80B10CC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D5C: .4byte gAnims
_080B0D60: .4byte 0x0200DB00

	thumb_func_start sub_80B0D64
sub_80B0D64: @ 0x080B0D64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080B0DEA
	lsls r0, r0, #2
	ldr r1, _080B0D7C @ =_080B0D80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0D7C: .4byte _080B0D80
_080B0D80: @ jump table
	.4byte _080B0DA4 @ case 0
	.4byte _080B0DAE @ case 1
	.4byte _080B0DB8 @ case 2
	.4byte _080B0DC4 @ case 3
	.4byte _080B0DD0 @ case 4
	.4byte _080B0DEA @ case 5
	.4byte _080B0DE0 @ case 6
	.4byte _080B0DC4 @ case 7
	.4byte _080B0DEA @ case 8
_080B0DA4:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080B0DEA
_080B0DAE:
	ldr r0, _080B0DB4 @ =gAnims
	movs r1, #0
	b _080B0DD4
	.align 2, 0
_080B0DB4: .4byte gAnims
_080B0DB8:
	ldr r0, _080B0DC0 @ =gAnims
	movs r1, #1
	b _080B0DD4
	.align 2, 0
_080B0DC0: .4byte gAnims
_080B0DC4:
	ldr r0, _080B0DCC @ =gAnims
	bl sub_8055644
	b _080B0DEA
	.align 2, 0
_080B0DCC: .4byte gAnims
_080B0DD0:
	ldr r0, _080B0DDC @ =gAnims
	movs r1, #2
_080B0DD4:
	strh r1, [r0, #0xa]
	bl sub_8055474
	b _080B0DEA
	.align 2, 0
_080B0DDC: .4byte gAnims
_080B0DE0:
	ldr r0, _080B0DF4 @ =gAnims
	movs r1, #4
	strh r1, [r0, #0xa]
	bl sub_8055474
_080B0DEA:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0DF4: .4byte gAnims

	thumb_func_start sub_80B0DF8
sub_80B0DF8: @ 0x080B0DF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _080B0E70
	lsls r0, r0, #2
	ldr r1, _080B0E10 @ =_080B0E14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0E10: .4byte _080B0E14
_080B0E14: @ jump table
	.4byte _080B0E34 @ case 0
	.4byte _080B0E34 @ case 1
	.4byte _080B0E34 @ case 2
	.4byte _080B0E34 @ case 3
	.4byte _080B0E3A @ case 4
	.4byte _080B0E34 @ case 5
	.4byte _080B0E34 @ case 6
	.4byte _080B0E58 @ case 7
_080B0E34:
	ldr r0, [r4, #0x38]
	adds r0, #2
	b _080B0E4E
_080B0E3A:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	ldr r1, [r4, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1, #1]
	cmp r0, r2
	blo _080B0E70
	adds r0, r1, #2
_080B0E4E:
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _080B0E70
_080B0E58:
	ldr r0, _080B0E78 @ =gAnims
	bl sub_8055624
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0E70
	ldr r0, [r4, #0x38]
	adds r0, #2
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080B0E70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0E78: .4byte gAnims

	thumb_func_start sub_80B0E7C
sub_80B0E7C: @ 0x080B0E7C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	bl EndTalk
	bl sub_80647F8
	ldr r0, _080B0EB4 @ =0x0200DB00
	bl sub_8055AC4
	bl sub_80647DC
	ldr r0, _080B0EB8 @ =gAnims
	bl sub_80556D8
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B0EA8
	bl Proc_End
_080B0EA8:
	movs r0, #2
	bl SetLordSelectState
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0EB4: .4byte 0x0200DB00
_080B0EB8: .4byte gAnims

	thumb_func_start sub_80B0EBC
sub_80B0EBC: @ 0x080B0EBC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B0ED8 @ =gUnk_08DAF78C
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B0ED8: .4byte gUnk_08DAF78C

	thumb_func_start sub_80B0EDC
sub_80B0EDC: @ 0x080B0EDC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x30]
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r2, r4, #0
	adds r2, #0x34
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0xfa
	strb r0, [r1]
	movs r5, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B0F36
	adds r6, r2, #0
_080B0F08:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl sub_80B1110
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	subs r0, r1, r2
	ldrb r1, [r6]
	adds r0, r1, r0
	strb r0, [r6]
	adds r5, #1
	cmp r5, #0xd
	bgt _080B0F36
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B0F08
_080B0F36:
	ldr r0, _080B0F50 @ =gUnk_08440838
	ldr r1, _080B0F54 @ =0x06010000
	bl Decompress
	ldr r0, _080B0F58 @ =gUnk_0844182C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0F50: .4byte gUnk_08440838
_080B0F54: .4byte 0x06010000
_080B0F58: .4byte gUnk_0844182C

	thumb_func_start sub_80B0F5C
sub_80B0F5C: @ 0x080B0F5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	movs r0, #0
	mov sb, r0
_080B0F6E:
	mov r1, sl
	ldr r0, [r1, #0x30]
	adds r0, #0x40
	add r0, sb
	ldrb r5, [r0]
	cmp r5, #0x1d
	bls _080B0F7E
	movs r5, #0x1e
_080B0F7E:
	movs r2, #0
	mov r8, r2
	lsrs r0, r5, #2
	mov r3, sb
	adds r3, #1
	str r3, [sp, #0xc]
	mov r1, sl
	adds r1, #0x34
	str r1, [sp, #4]
	mov r2, sl
	adds r2, #0x35
	str r2, [sp, #8]
	cmp r8, r0
	bge _080B0FCA
	adds r7, r0, #0
	movs r4, #0x30
	mov r3, sb
	lsls r6, r3, #4
	mov r8, r7
_080B0FA4:
	ldr r0, _080B1020 @ =gUnk_08DAF874
	ldr r3, [r0, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	adds r2, #0x10
	bl PutSpriteExt
	adds r4, #8
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bne _080B0FA4
	mov r8, r7
_080B0FCA:
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _080B0FF4
	mov r3, r8
	lsls r1, r3, #3
	adds r1, #0x30
	mov r3, sb
	lsls r2, r3, #4
	adds r2, #0x10
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, _080B1020 @ =gUnk_08DAF874
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080B0FF4:
	ldr r0, [sp, #0xc]
	mov sb, r0
	cmp r0, #5
	ble _080B0F6E
	movs r0, #0x78
	ldr r1, [sp, #4]
	ldrb r1, [r1]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r2, [sp, #8]
	ldrb r3, [r2]
	adds r3, r3, r0
	mov r8, r3
	movs r0, #0
	mov sb, r0
	mov r2, sl
	ldr r1, [r2, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	b _080B1094
	.align 2, 0
_080B1020: .4byte gUnk_08DAF874
_080B1024:
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	bl sub_80B1110
	adds r4, r0, #0
	ldr r3, [r4]
	cmp r3, #0
	beq _080B1080
	movs r1, #4
	ldrsb r1, [r4, r1]
	mov r0, r8
	subs r1, r0, r1
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #8
	subs r2, r2, r0
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r1, #4
	ldrsb r1, [r4, r1]
	mov r2, r8
	subs r1, r2, r1
	subs r1, #2
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #6
	subs r2, r2, r0
	ldr r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	add r8, r0
_080B1080:
	movs r3, #1
	add sb, r3
	mov r0, sb
	cmp r0, #0xd
	bgt _080B109A
	mov r2, sl
	ldr r1, [r2, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
_080B1094:
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B1024
_080B109A:
	mov r3, sl
	ldrh r0, [r3, #0x2a]
	cmp r0, #0xfe
	bhi _080B10A6
	adds r0, #1
	strh r0, [r3, #0x2a]
_080B10A6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B10B8
sub_80B10B8: @ 0x080B10B8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B10C8 @ =gUnk_08DAF82C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B10C8: .4byte gUnk_08DAF82C

	thumb_func_start sub_80B10CC
sub_80B10CC: @ 0x080B10CC
	adds r0, #0x35
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_80B10D4
sub_80B10D4: @ 0x080B10D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B1104 @ =gUnk_08DB0454
	lsls r4, r4, #2
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _080B1108
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	b _080B110A
	.align 2, 0
_080B1104: .4byte gUnk_08DB0454
_080B1108:
	movs r0, #0
_080B110A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80B1110
sub_80B1110: @ 0x080B1110
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080B112C
	lsls r0, r1, #3
	ldr r1, _080B1128 @ =gUnk_08DB02D4
	b _080B1140
	.align 2, 0
_080B1128: .4byte gUnk_08DB02D4
_080B112C:
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bls _080B113C
	movs r0, #0
	b _080B1142
_080B113C:
	lsls r0, r2, #3
	ldr r1, _080B1144 @ =gUnk_08DB04A4
_080B1140:
	adds r0, r0, r1
_080B1142:
	bx lr
	.align 2, 0
_080B1144: .4byte gUnk_08DB04A4

	thumb_func_start sub_80B1148
sub_80B1148: @ 0x080B1148
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1168 @ =gUnk_08DB0798
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _080B116C
	.align 2, 0
_080B1168: .4byte gUnk_08DB0798
_080B116C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B1174
sub_80B1174: @ 0x080B1174
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080B11D8 @ =gUnk_08DB078C
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r7, #8]
	bl sub_8007DF4
	bl sub_800968C
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl StartTalkExt
	movs r0, #0
	bl sub_8007F84
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl sub_8008CB8
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B11D8: .4byte gUnk_08DB078C

	thumb_func_start sub_80B11DC
sub_80B11DC: @ 0x080B11DC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r3, [r7, #4]
	ldr r0, [r7]
	movs r1, #0
	movs r2, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B11FC
sub_80B11FC: @ 0x080B11FC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B121C
sub_80B121C: @ 0x080B121C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B123C
sub_80B123C: @ 0x080B123C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #2
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B125C
sub_80B125C: @ 0x080B125C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B127C
sub_80B127C: @ 0x080B127C
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	str r3, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	bl EndPlayerPhaseSideWindows
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _080B12AC
	ldr r0, _080B12A8 @ =gUnk_08DB081C
	ldr r1, [r7, #0xc]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	b _080B12B8
	.align 2, 0
_080B12A8: .4byte gUnk_08DB081C
_080B12AC:
	ldr r1, _080B12E8 @ =gUnk_08DB081C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_080B12B8:
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #8
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _080B12EC
	ldr r0, [r7, #4]
	str r0, [r7, #0x14]
	b _080B12F0
	.align 2, 0
_080B12E8: .4byte gUnk_08DB081C
_080B12EC:
	ldr r0, _080B12FC @ =gUnk_08DB077C
	str r0, [r7, #0x14]
_080B12F0:
	movs r0, #0
	str r0, [r7, #0x18]
_080B12F4:
	ldr r0, [r7, #0x18]
	cmp r0, #0x14
	ble _080B1300
	b _080B1338
	.align 2, 0
_080B12FC: .4byte gUnk_08DB077C
_080B1300:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	adds r0, r2, #0
	bl MakeNewItem
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x18]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, #0
	adds r3, #0x30
	adds r1, r3, r2
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _080B12F4
_080B1338:
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	bl sub_80B1348
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1348
sub_80B1348: @ 0x080B1348
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_080B1354:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	bne _080B1368
	b _080B1370
_080B1368:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1354
_080B1370:
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x5a
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl GetUnitItemCount
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5b
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B13B0
sub_80B13B0: @ 0x080B13B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B13D0 @ =gUnk_08DB081C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B13D4
	b _080B13DA
	.align 2, 0
_080B13D0: .4byte gUnk_08DB081C
_080B13D4:
	ldr r0, [r7]
	bl sub_80B2714
_080B13DA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B13E4
sub_80B13E4: @ 0x080B13E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B1404 @ =gUnk_08DB081C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #1
	bne _080B1408
	b _080B140E
	.align 2, 0
_080B1404: .4byte gUnk_08DB081C
_080B1408:
	ldr r0, [r7]
	bl sub_80B2904
_080B140E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1418
sub_80B1418: @ 0x080B1418
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1428
sub_80B1428: @ 0x080B1428
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B1442
	ldr r0, [r7]
	movs r1, #0xd
	bl Proc_Goto
	b _080B144A
_080B1442:
	movs r0, #9
	ldr r1, [r7]
	bl sub_80B1174
_080B144A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1454
sub_80B1454: @ 0x080B1454
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B147E
	cmp r0, #1
	bgt _080B146E
	cmp r0, #0
	beq _080B1474
	b _080B1474
_080B146E:
	cmp r0, #2
	beq _080B1488
	b _080B1474
_080B1474:
	ldr r0, [r7]
	movs r1, #0xc
	bl Proc_Goto
	b _080B14B0
_080B147E:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B14B0
_080B1488:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _080B14A8
	movs r0, #0x1b
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B14B0
_080B14A8:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
_080B14B0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B14B8
sub_80B14B8: @ 0x080B14B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x12
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B14D0
sub_80B14D0: @ 0x080B14D0
	push {r4, r5, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	str r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B1524 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _080B1528
	b _080B1550
	.align 2, 0
_080B1524: .4byte 0x0203EE48
_080B1528:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B1558 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #8]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B155C @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2A9C
_080B1550:
	add sp, #0x14
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1558: .4byte 0x0203EE48
_080B155C: .4byte gBg2Tm + 0xe

	thumb_func_start sub_80B1560
sub_80B1560: @ 0x080B1560
	push {r4, r5, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	str r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B15B4 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _080B15B8
	b _080B15E0
	.align 2, 0
_080B15B4: .4byte 0x0203EE48
_080B15B8:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B15E8 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #8]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B15EC @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2AF8
_080B15E0:
	add sp, #0x14
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B15E8: .4byte 0x0203EE48
_080B15EC: .4byte gBg2Tm + 0xe

	thumb_func_start sub_80B15F0
sub_80B15F0: @ 0x080B15F0
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5a
	ldrb r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x5f
	ldrb r3, [r4]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B162C @ =sub_80B14D0
	str r2, [sp, #4]
	ldr r2, [r7]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_80B30E0
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B162C: .4byte sub_80B14D0

	thumb_func_start sub_80B1630
sub_80B1630: @ 0x080B1630
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_80B31DC
	bl sub_80B332C
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_80B3310
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B1674
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B1674:
	bl sub_80B3310
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_80B3350
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	adds r2, r0, #0
	adds r0, #0x5e
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	adds r2, r0, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl PutUiHand
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1756
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B1756
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl StartItemHelpBox
_080B1756:
	bl sub_80B2D50
	bl sub_80B33C4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1768
	b _080B18CC
_080B1768:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B17AA
	ldr r1, _080B17A4 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B17A0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl CloseHelpBox
_080B17A0:
	b _080B18CC
	.align 2, 0
_080B17A4: .4byte gpKeySt
_080B17A8:
	b _080B1818
_080B17AA:
	ldr r1, _080B1814 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1818
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl StartItemHelpBox
	b _080B18CC
	.align 2, 0
_080B1814: .4byte gpKeySt
_080B1818:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_80B2B64
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #8]
	ldr r1, _080B186C @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1888
	bl GetGold
	ldr r1, [r7, #8]
	cmp r1, r0
	ble _080B1870
	movs r0, #0x21
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B1886
	.align 2, 0
_080B186C: .4byte gpKeySt
_080B1870:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl SetTalkNumber
	movs r0, #0x24
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	bl Proc_Break
_080B1886:
	b _080B18CC
_080B1888:
	ldr r1, _080B18C0 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B18CC
	ldr r1, _080B18C4 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B18B6
	ldr r1, _080B18C8 @ =0x0000038B
	adds r0, r1, #0
	bl m4aSongNumStart
_080B18B6:
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B18CC
	.align 2, 0
_080B18C0: .4byte gpKeySt
_080B18C4: .4byte gPlaySt
_080B18C8: .4byte 0x0000038B
_080B18CC:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B18D4
sub_80B18D4: @ 0x080B18D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B18F4
	cmp r0, #1
	bgt _080B18EE
	cmp r0, #0
	beq _080B18F6
	b _080B18F6
_080B18EE:
	cmp r0, #2
	beq _080B18F6
	b _080B18F6
_080B18F4:
	b _080B1900
_080B18F6:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B1900
_080B1900:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1908
sub_80B1908: @ 0x080B1908
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #4
	bls _080B1944
	bl sub_802ECE4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1932
	movs r0, #0x2d
	ldr r1, [r7]
	bl sub_80B1174
	b _080B1942
_080B1932:
	movs r0, #0x30
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
_080B1942:
	b _080B196E
_080B1944:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl UnitAddItem
	ldr r0, [r7]
	bl sub_80B2E44
	ldr r0, [r7]
	movs r1, #3
	bl Proc_Goto
_080B196E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1978
sub_80B1978: @ 0x080B1978
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B1998
	cmp r0, #1
	bgt _080B1992
	cmp r0, #0
	beq _080B199A
	b _080B199A
_080B1992:
	cmp r0, #2
	beq _080B199A
	b _080B199A
_080B1998:
	b _080B19A4
_080B199A:
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
	b _080B19A4
_080B19A4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B19AC
sub_80B19AC: @ 0x080B19AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802ECE4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B19CA
	movs r0, #0x36
	ldr r1, [r7]
	bl sub_80B1174
	b _080B19D2
_080B19CA:
	movs r0, #0x39
	ldr r1, [r7]
	bl sub_80B1174
_080B19D2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B19DC
sub_80B19DC: @ 0x080B19DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl AddItemToConvoy
	ldr r0, [r7]
	bl sub_80B2E44
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A0C
sub_80B1A0C: @ 0x080B1A0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x33
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A24
sub_80B1A24: @ 0x080B1A24
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetConvoyItemCount
	cmp r0, #0x63
	bgt _080B1A3C
	ldr r0, [r7]
	movs r1, #0xa
	bl Proc_Goto
_080B1A3C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A44
sub_80B1A44: @ 0x080B1A44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x3c
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A5C
sub_80B1A5C: @ 0x080B1A5C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x15
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A74
sub_80B1A74: @ 0x080B1A74
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x18
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A8C
sub_80B1A8C: @ 0x080B1A8C
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5b
	ldrb r1, [r2]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B1AC0 @ =sub_80B1560
	str r2, [sp, #4]
	ldr r2, [r7]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl sub_80B30E0
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1AC0: .4byte sub_80B1560

	thumb_func_start sub_80B1AC4
sub_80B1AC4: @ 0x080B1AC4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_80B31DC
	bl sub_80B332C
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_80B3310
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B1B08
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B1B08:
	bl sub_80B3310
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_80B3350
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl PutUiHand
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1BB0
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B1BB0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r2, [r7]
	ldr r0, [r2, #0x2c]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x1e
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl StartItemHelpBox
_080B1BB0:
	bl sub_80B33C4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1BBE
	b _080B1D3C
_080B1BBE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1BFE
	ldr r1, _080B1BF8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1BF6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl CloseHelpBox
_080B1BF6:
	b _080B1D3C
	.align 2, 0
_080B1BF8: .4byte gpKeySt
_080B1BFC:
	b _080B1C70
_080B1BFE:
	ldr r1, _080B1C6C @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1C70
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r2, [r7]
	ldr r0, [r2, #0x2c]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x1e
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl StartItemHelpBox
	b _080B1D3C
	.align 2, 0
_080B1C6C: .4byte gpKeySt
_080B1C70:
	ldr r1, _080B1CBC @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1CF6
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_80B2BDC
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _080B1CC0
	movs r0, #0x2a
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
	b _080B1CF4
	.align 2, 0
_080B1CBC: .4byte gpKeySt
_080B1CC0:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_80B2BB4
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl SetTalkNumber
	movs r0, #0x24
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	bl Proc_Break
_080B1CF4:
	b _080B1D3C
_080B1CF6:
	ldr r1, _080B1D30 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1D3C
	ldr r1, _080B1D34 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B1D24
	ldr r1, _080B1D38 @ =0x0000038B
	adds r0, r1, #0
	bl m4aSongNumStart
_080B1D24:
	ldr r0, [r7]
	movs r1, #8
	bl Proc_Goto
	b _080B1D3C
	.align 2, 0
_080B1D30: .4byte gpKeySt
_080B1D34: .4byte gPlaySt
_080B1D38: .4byte 0x0000038B
_080B1D3C:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1D44
sub_80B1D44: @ 0x080B1D44
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B1D64
	cmp r0, #1
	bgt _080B1D5E
	cmp r0, #0
	beq _080B1DFA
	b _080B1DFA
_080B1D5E:
	cmp r0, #2
	beq _080B1DFA
	b _080B1DFA
_080B1D64:
	movs r0, #0xb9
	movs r1, #8
	bl sub_801525C
	ldr r0, _080B1DF0 @ =gActionSt
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	bl GetGold
	str r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_80B2BB4
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	bl UnitRemoveItem
	ldr r0, [r7]
	bl sub_80B1348
	ldr r0, [r7]
	bl sub_80B2904
	ldr r1, _080B1DF4 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B1DF8
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B1E04
	.align 2, 0
_080B1DF0: .4byte gActionSt
_080B1DF4: .4byte gBg0Tm + 0x1b6
_080B1DF8:
	b _080B1E04
_080B1DFA:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
	b _080B1E04
_080B1E04:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E0C
sub_80B1E0C: @ 0x080B1E0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x1e
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E24
sub_80B1E24: @ 0x080B1E24
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0xc
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E4C
sub_80B1E4C: @ 0x080B1E4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0xf
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E64
sub_80B1E64: @ 0x080B1E64
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B1E7E
	movs r0, #7
	ldr r1, [r7]
	bl sub_80B1174
	b _080B1E86
_080B1E7E:
	movs r0, #0x27
	ldr r1, [r7]
	bl sub_80B1174
_080B1E86:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1E90
sub_80B1E90: @ 0x080B1E90
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B1EB0 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B1EB4 @ =gUnk_08D64F4C
	ldr r1, _080B1EB8 @ =sub_806E2C8
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1EB0: .4byte gUnk_08DB0ADC
_080B1EB4: .4byte gUnk_08D64F4C
_080B1EB8: .4byte sub_806E2C8

	thumb_func_start sub_80B1EBC
sub_80B1EBC: @ 0x080B1EBC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #5
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1ED4
sub_80B1ED4: @ 0x080B1ED4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_80B31DC
	bl sub_80B332C
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_80B3310
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B1F18
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B1F18:
	bl sub_80B3310
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_80B3350
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	adds r2, r0, #0
	adds r0, #0x5e
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	adds r2, r0, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl PutUiHand
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1FFA
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B1FFA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl StartItemHelpBox
_080B1FFA:
	bl sub_80B2D50
	bl sub_80B33C4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B200C
	b _080B2100
_080B200C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B204E
	ldr r1, _080B2048 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2044
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl CloseHelpBox
_080B2044:
	b _080B2100
	.align 2, 0
_080B2048: .4byte gpKeySt
_080B204C:
	b _080B20BC
_080B204E:
	ldr r1, _080B20B8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B20BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl StartItemHelpBox
	b _080B2100
	.align 2, 0
_080B20B8: .4byte gpKeySt
_080B20BC:
	ldr r1, _080B20F4 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2100
	ldr r1, _080B20F8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B20EA
	ldr r1, _080B20FC @ =0x0000038B
	adds r0, r1, #0
	bl m4aSongNumStart
_080B20EA:
	ldr r0, [r7]
	movs r1, #0xc
	bl Proc_Goto
	b _080B2100
	.align 2, 0
_080B20F4: .4byte gpKeySt
_080B20F8: .4byte gPlaySt
_080B20FC: .4byte 0x0000038B
_080B2100:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B2108
sub_80B2108: @ 0x080B2108
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2138 @ =gBmSt
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B212E
	ldr r1, _080B213C @ =gUnk_08DB07A4
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
_080B212E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2138: .4byte gBmSt
_080B213C: .4byte gUnk_08DB07A4

	thumb_func_start sub_80B2140
sub_80B2140: @ 0x080B2140
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2168 @ =gBmSt
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B2170
	ldr r1, _080B216C @ =gUnk_08DB07DC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _080B2174
	.align 2, 0
_080B2168: .4byte gBmSt
_080B216C: .4byte gUnk_08DB07DC
_080B2170:
	bl ClearTalk
_080B2174:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B217C
sub_80B217C: @ 0x080B217C
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x61
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B219A
	movs r0, #0x4d
	movs r1, #0
	bl StartBgm
	b _080B21A2
_080B219A:
	movs r0, #0x46
	movs r1, #0
	bl StartBgm
_080B21A2:
	ldr r0, _080B22B4 @ =gUnk_08D64F4C
	ldr r1, _080B22B8 @ =sub_806E2A0
	bl Proc_ForEach
	bl sub_80B2C4C
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #3
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl InitFaces
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #3
	bl sub_80B2D90
	ldr r0, [r7]
	bl sub_80B1148
	movs r1, #1
	str r1, [sp]
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_8008DA8
	ldr r0, _080B22C0 @ =gUnk_083FAD4C
	ldr r1, _080B22C4 @ =gBuf
	bl Decompress
	ldr r0, _080B22C8 @ =gBg1Tm
	ldr r1, _080B22C4 @ =gBuf
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	movs r1, #8
	movs r2, #0x14
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r7]
	bl sub_80B25C8
	movs r0, #0
	str r0, [r7, #4]
_080B22AC:
	ldr r0, [r7, #4]
	cmp r0, #5
	ble _080B22CC
	b _080B22EC
	.align 2, 0
_080B22B4: .4byte gUnk_08D64F4C
_080B22B8: .4byte sub_806E2A0
_080B22BC: .4byte gDispIo
_080B22C0: .4byte gUnk_083FAD4C
_080B22C4: .4byte gBuf
_080B22C8: .4byte gBg1Tm
_080B22CC:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B22E8 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x14
	bl InitText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B22AC
	.align 2, 0
_080B22E8: .4byte 0x0203EE48
_080B22EC:
	ldr r0, [r7]
	bl sub_80B27D8
	ldr r0, _080B25A8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B25A8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B25A8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x48
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x98
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B25B0 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B25B4 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r4, _080B25B8 @ =Img_MuralBackground
	movs r0, #3
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B25BC @ =gBg3Tm
	ldr r1, _080B25C0 @ =Tsa_SaveMenuBackground
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080B25C4 @ =gUnk_0843F144
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B25A8: .4byte gDispIo
_080B25AC: .4byte 0x030027CC
_080B25B0: .4byte 0x0000FFE0
_080B25B4: .4byte 0x0000E0FF
_080B25B8: .4byte Img_MuralBackground
_080B25BC: .4byte gBg3Tm
_080B25C0: .4byte Tsa_SaveMenuBackground
_080B25C4: .4byte gUnk_0843F144

	thumb_func_start sub_80B25C8
sub_80B25C8: @ 0x080B25C8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2650 @ =gUnk_083FAE28
	ldr r1, _080B2654 @ =0x06014C00
	bl Decompress
	ldr r1, _080B2658 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xac
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x2c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _080B265C @ =0x00004260
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B2660 @ =Pal_UiWindowFrame1
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080B2664 @ =gBg0Tm + 0x1b8
	adds r0, r1, #0
	bl sub_80B266C
	ldr r1, _080B2668 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2650: .4byte gUnk_083FAE28
_080B2654: .4byte 0x06014C00
_080B2658: .4byte gUnk_08DB0ADC
_080B265C: .4byte 0x00004260
_080B2660: .4byte Pal_UiWindowFrame1
_080B2664: .4byte gBg0Tm + 0x1b8
_080B2668: .4byte gBg0Tm + 0x1b6

	thumb_func_start sub_80B266C
sub_80B266C: @ 0x080B266C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, _080B269C @ =0x03001618
	adds r0, r1, #0
	movs r1, #1
	bl InitText
	ldr r2, _080B26A0 @ =gUnk_0844BF6C
	ldr r0, [r7]
	movs r1, #3
	bl sub_8014B14
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B269C: .4byte 0x03001618
_080B26A0: .4byte gUnk_0844BF6C

	thumb_func_start sub_80B26A4
sub_80B26A4: @ 0x080B26A4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
_080B26AE:
	ldr r0, [r7, #4]
	cmp r0, #0
	bgt _080B26B6
	b _080B26D4
_080B26B6:
	ldr r0, [r7]
	movs r1, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r7]
	subs r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080B26AE
_080B26D4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B26DC
sub_80B26DC: @ 0x080B26DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, [r7]
	movs r1, #6
	bl sub_80B26A4
	bl GetGold
	adds r2, r0, #0
	ldr r0, [r7]
	movs r1, #2
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2714
sub_80B2714: @ 0x080B2714
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080B2764 @ =gUnk_08DB0A84
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B2752:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B2768
	b _080B27A8
	.align 2, 0
_080B2764: .4byte gUnk_08DB0A84
_080B2768:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B27A0 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r2, r1, #5
	adds r1, r2, #0
	lsls r2, r1, #1
	ldr r3, _080B27A4 @ =gBg2Tm + 0xe
	adds r1, r2, r3
	bl PutBlankText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B2752
	.align 2, 0
_080B27A0: .4byte 0x0203EE48
_080B27A4: .4byte gBg2Tm + 0xe
_080B27A8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r1, r0, #0
	adds r0, r1, #0
	subs r0, #0x48
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B27D8
sub_80B27D8: @ 0x080B27D8
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B27F4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B2806
	b _080B2830
_080B2806:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B282C @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B27F4
	.align 2, 0
_080B282C: .4byte 0x0203EE48
_080B2830:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B283A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B284C
	b _080B28A8
_080B284C:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080B2870
	b _080B28A8
_080B2870:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B28A0 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B28A4 @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2A9C
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B283A
	.align 2, 0
_080B28A0: .4byte 0x0203EE48
_080B28A4: .4byte gBg2Tm + 0xe
_080B28A8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r1, r0, #0
	adds r0, r1, #0
	subs r0, #0x48
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B28D8
sub_80B28D8: @ 0x080B28D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B15F0
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B27D8
	ldr r0, [r7]
	bl Proc_Break
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2904
sub_80B2904: @ 0x080B2904
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080B294C @ =gUnk_08DB0A94
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #0
	str r0, [r7, #4]
_080B2944:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B2950
	b _080B2990
	.align 2, 0
_080B294C: .4byte gUnk_08DB0A94
_080B2950:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B2988 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r2, r1, #5
	adds r1, r2, #0
	lsls r2, r1, #1
	ldr r3, _080B298C @ =gBg2Tm + 0xe
	adds r1, r2, r3
	bl PutBlankText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B2944
	.align 2, 0
_080B2988: .4byte 0x0203EE48
_080B298C: .4byte gBg2Tm + 0xe
_080B2990:
	ldr r2, _080B29A8 @ =0x0000FFB8
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B29A8: .4byte 0x0000FFB8

	thumb_func_start sub_80B29AC
sub_80B29AC: @ 0x080B29AC
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #0
	str r0, [r7, #4]
_080B29C2:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B29CA
	b _080B29F4
_080B29CA:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B29F0 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B29C2
	.align 2, 0
_080B29F0: .4byte 0x0203EE48
_080B29F4:
	movs r0, #0
	str r0, [r7, #4]
_080B29F8:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B2A00
	b _080B2A60
_080B2A00:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080B2A26
	b _080B2A60
_080B2A26:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B2A58 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B2A5C @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2AF8
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B29F8
	.align 2, 0
_080B2A58: .4byte 0x0203EE48
_080B2A5C: .4byte gBg2Tm + 0xe
_080B2A60:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2A70
sub_80B2A70: @ 0x080B2A70
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B1A8C
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B29AC
	ldr r0, [r7]
	bl Proc_Break
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2A9C
sub_80B2A9C: @ 0x080B2A9C
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl sub_80B2B64
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #0x10]
	ldr r4, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl IsItemDisplayUsable
	lsls r1, r0, #0x18
	asrs r2, r1, #0x18
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_80168EC
	ldr r0, [r7, #0xc]
	adds r4, r0, #0
	adds r4, #0x22
	bl GetGold
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _080B2AE4
	movs r1, #2
	b _080B2AE6
_080B2AE4:
	movs r1, #1
_080B2AE6:
	ldr r2, [r7, #0x10]
	adds r0, r4, #0
	bl PutNumber
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2AF8
sub_80B2AF8: @ 0x080B2AF8
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r4, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl IsItemDisplayUsable
	lsls r1, r0, #0x18
	asrs r2, r1, #0x18
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_80168EC
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_80B2BDC
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2B4A
	ldr r0, [r7, #0xc]
	adds r4, r0, #0
	adds r4, #0x22
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_80B2BB4
	lsls r1, r0, #0x10
	lsrs r2, r1, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	b _080B2B56
_080B2B4A:
	ldr r3, _080B2B60 @ =gUnk_0844BFA0
	ldr r0, [r7]
	movs r1, #0x5c
	movs r2, #2
	bl Text_InsertDrawString
_080B2B56:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2B60: .4byte gUnk_0844BFA0

	thumb_func_start sub_80B2B64
sub_80B2B64: @ 0x080B2B64
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_8017748
	str r0, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x72
	bl UnitHasItem
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2B9E
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B2BAA
_080B2B9C:
	b _080B2BAA
_080B2B9E:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _080B2BAA
_080B2BAA:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B2BB4
sub_80B2BB4: @ 0x080B2BB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8017748
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B2BD4
_080B2BD4:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B2BDC
sub_80B2BDC: @ 0x080B2BDC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl GetItemAttributes
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B2BF6
	movs r0, #0
	b _080B2C0C
_080B2BF6:
	ldr r0, [r7]
	bl sub_80B2BB4
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080B2C08
	movs r0, #0
	b _080B2C0C
_080B2C08:
	movs r0, #1
	b _080B2C0C
_080B2C0C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B2C14
sub_80B2C14: @ 0x080B2C14
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r2, _080B2C48 @ =gUnk_08DB0AA4
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x68
	movs r5, #0
	ldrsh r3, [r4, r5]
	bl PutOamHiRam
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C48: .4byte gUnk_08DB0AA4

	thumb_func_start sub_80B2C4C
sub_80B2C4C: @ 0x080B2C4C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _080B2D2C @ =gBg0Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B2D30 @ =gBg1Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B2D34 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B2D38 @ =gBg3Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2D28: .4byte gDispIo
_080B2D2C: .4byte gBg0Tm
_080B2D30: .4byte gBg1Tm
_080B2D34: .4byte gBg2Tm
_080B2D38: .4byte gBg3Tm

	thumb_func_start sub_80B2D3C
sub_80B2D3C: @ 0x080B2D3C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_80B2D50
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B2D50
sub_80B2D50: @ 0x080B2D50
	push {r7, lr}
	mov r7, sp
	bl sub_80B33F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2D6E
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x40
	movs r3, #1
	bl sub_80B2DD4
_080B2D6E:
	bl sub_80B3418
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2D88
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x98
	movs r3, #0
	bl sub_80B2DD4
_080B2D88:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2D90
sub_80B2D90: @ 0x080B2D90
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080B2DC8 @ =gUnk_08427974
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _080B2DCC @ =0x06010000
	adds r1, r2, r3
	bl Decompress
	ldr r0, _080B2DD0 @ =gUnk_0841E45C
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2DC8: .4byte gUnk_08427974
_080B2DCC: .4byte 0x06010000
_080B2DD0: .4byte gUnk_0841E45C

	thumb_func_start sub_80B2DD4
sub_80B2DD4: @ 0x080B2DD4
	push {r4, r7, lr}
	sub sp, #0x1c
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	str r3, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	bl GetGameTime
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x28
	bl DivRem
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	movs r1, #8
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #1
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _080B2E16
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x14]
	b _080B2E1A
_080B2E16:
	movs r0, #0
	str r0, [r7, #0x14]
_080B2E1A:
	ldr r0, [r7]
	ldr r2, [r7, #0x14]
	adds r1, r0, #0
	orrs r1, r2
	ldr r2, [r7, #4]
	ldr r3, _080B2E40 @ =Sprite_16x8
	adds r0, r7, #0
	adds r0, #8
	ldrh r4, [r0]
	ldr r0, [r7, #0x10]
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E40: .4byte Sprite_16x8

	thumb_func_start sub_80B2E44
sub_80B2E44: @ 0x080B2E44
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0xb9
	movs r1, #8
	bl sub_801525C
	ldr r0, _080B2EB8 @ =gActionSt
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	bl GetGold
	str r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_80B2B64
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r0, [r7]
	bl sub_80B1348
	ldr r0, [r7]
	bl sub_80B27D8
	ldr r1, _080B2EBC @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2EB8: .4byte gActionSt
_080B2EBC: .4byte gBg0Tm + 0x1b6

	thumb_func_start sub_80B2EC0
sub_80B2EC0: @ 0x080B2EC0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	ldr r0, [r7]
	cmp r0, #0
	bge _080B2EDC
	movs r0, #0
	str r0, [r7]
_080B2EDC:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _080B2EEA
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B2EEA:
	ldr r0, [r7]
	str r0, [r7, #0xc]
	ldr r1, _080B2F34 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F40
	ldr r0, [r7]
	cmp r0, #0
	bne _080B2F38
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B2F32
	ldr r1, _080B2F34 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F32
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B2F32:
	b _080B2F3E
	.align 2, 0
_080B2F34: .4byte gpKeySt
_080B2F38:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
_080B2F3E:
	b _080B2F92
_080B2F40:
	ldr r1, _080B2F88 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F92
	ldr r1, [r7, #4]
	subs r0, r1, #1
	ldr r1, [r7]
	cmp r1, r0
	bne _080B2F8C
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B2F86
	ldr r1, _080B2F88 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F86
	movs r0, #0
	str r0, [r7]
_080B2F86:
	b _080B2F92
	.align 2, 0
_080B2F88: .4byte gpKeySt
_080B2F8C:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_080B2F92:
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	cmp r0, r1
	beq _080B2FB2
	ldr r1, _080B2FB8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2FB2
	ldr r1, _080B2FBC @ =0x00000386
	adds r0, r1, #0
	bl m4aSongNumStart
_080B2FB2:
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B2FC0
	.align 2, 0
_080B2FB8: .4byte gPlaySt
_080B2FBC: .4byte 0x00000386
_080B2FC0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B2FC8
sub_80B2FC8: @ 0x080B2FC8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2FE0 @ =0x0203EE94
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2FE0: .4byte 0x0203EE94

	thumb_func_start sub_80B2FE4
sub_80B2FE4: @ 0x080B2FE4
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080B300C @ =0x0203EE94
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, _080B300C @ =0x0203EE94
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bne _080B3010
	movs r0, #0
	b _080B3066
	.align 2, 0
_080B300C: .4byte 0x0203EE94
_080B3010:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	cmp r0, r1
	ble _080B301C
	movs r0, #0
	b _080B3066
_080B301C:
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bge _080B3040
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _080B302E
	movs r0, #0
	b _080B3066
_080B302E:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B303E
	movs r0, #1
	rsbs r0, r0, #0
	b _080B3066
_080B303E:
	b _080B3062
_080B3040:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	cmp r0, r1
	bne _080B3050
	movs r0, #0
	b _080B3066
_080B3050:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	ldr r2, [r7, #8]
	subs r1, r2, #1
	cmp r0, r1
	blt _080B3062
	movs r0, #1
	b _080B3066
_080B3062:
	movs r0, #0
	b _080B3066
_080B3066:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3070
sub_80B3070: @ 0x080B3070
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	cmp r0, #0
	blt _080B3094
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B30A2
	b _080B30A8
_080B3094:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B30A2
	b _080B30A8
_080B30A2:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _080B30D6
_080B30A8:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B30C8
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	subs r1, r1, r2
	cmp r1, #0
	bge _080B30C6
	ldr r1, [r7, #8]
	adds r2, r1, #0
	rsbs r1, r2, #0
	adds r0, r0, r1
_080B30C6:
	b _080B30CE
_080B30C8:
	ldr r1, [r7]
	ldr r2, [r7, #8]
	adds r0, r1, r2
_080B30CE:
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B30D6
_080B30D6:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B30E0
sub_80B30E0: @ 0x080B30E0
	push {r4, r5, r7, lr}
	sub sp, #8
	mov r7, sp
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	strh r3, [r2]
	adds r2, r7, #2
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #4
	strh r1, [r2]
	adds r1, r7, #6
	strh r0, [r1]
	adds r0, r7, #0
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_80B2FC8
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #2
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #4
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #6
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x14]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, [r7, #0x20]
	str r1, [r0, #0x18]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, [r7, #0x18]
	rsbs r2, r1, #0
	str r2, [r0, #0x10]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #6
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B31D8: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B31DC
sub_80B31DC: @ 0x080B31DC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080B3238 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r2, _080B3238 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	adds r1, r2, #0
	movs r2, #0
	bl sub_80B2EC0
	adds r1, r0, #0
	ldr r2, _080B3238 @ =gUnk_08DB0AF4
	ldr r0, [r2]
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080B3238 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r1, _080B3238 @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldrh r1, [r2, #2]
	ldr r2, _080B3238 @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #4]
	ldr r3, _080B3238 @ =gUnk_08DB0AF4
	ldr r4, [r3]
	ldrh r3, [r4, #6]
	bl sub_80B2FE4
	cmp r0, #0
	beq _080B3242
	cmp r0, #0
	bgt _080B323C
	movs r1, #1
	cmn r0, r1
	beq _080B3290
	b _080B3242
	.align 2, 0
_080B3238: .4byte gUnk_08DB0AF4
_080B323C:
	cmp r0, #1
	beq _080B3244
	b _080B3242
_080B3242:
	b _080B32D0
_080B3244:
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, _080B328C @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B328C @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r4, _080B328C @ =gUnk_08DB0AF4
	ldr r3, [r4]
	ldrh r4, [r3, #4]
	adds r3, r2, r4
	subs r2, r3, #1
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B32D0
	.align 2, 0
_080B328C: .4byte gUnk_08DB0AF4
_080B3290:
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, _080B32CC @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	subs r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B32CC @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B32D0
	.align 2, 0
_080B32CC: .4byte gUnk_08DB0AF4
_080B32D0:
	ldr r0, _080B330C @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B330C @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B330C @ =gUnk_08DB0AF4
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	ldr r2, _080B330C @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #0xa]
	bl sub_80B3070
	adds r1, r0, #0
	ldr r2, _080B330C @ =gUnk_08DB0AF4
	ldr r0, [r2]
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B330C: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B3310
sub_80B3310: @ 0x080B3310
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3320 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	b _080B3324
	.align 2, 0
_080B3320: .4byte gUnk_08DB0AF4
_080B3324:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B332C
sub_80B332C: @ 0x080B332C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3344 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, _080B3344 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #0xc]
	ldr r0, [r0, #0x10]
	adds r1, r2, r0
	adds r0, r1, #0
	b _080B3348
	.align 2, 0
_080B3344: .4byte gUnk_08DB0AF4
_080B3348:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3350
sub_80B3350: @ 0x080B3350
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3360 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	adds r0, r1, #0
	b _080B3364
	.align 2, 0
_080B3360: .4byte gUnk_08DB0AF4
_080B3364:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B336C
sub_80B336C: @ 0x080B336C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B3394 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3394: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B3398
sub_80B3398: @ 0x080B3398
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B33C0 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B33C0: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B33C4
sub_80B33C4: @ 0x080B33C4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B33E4 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B33E4 @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B33E4 @ =gUnk_08DB0AF4
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	cmp r0, r1
	beq _080B33E8
	movs r0, #1
	b _080B33EC
	.align 2, 0
_080B33E4: .4byte gUnk_08DB0AF4
_080B33E8:
	movs r0, #0
	b _080B33EC
_080B33EC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B33F4
sub_80B33F4: @ 0x080B33F4
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3408 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	cmp r1, #0
	beq _080B340C
	movs r0, #1
	b _080B3410
	.align 2, 0
_080B3408: .4byte gUnk_08DB0AF4
_080B340C:
	movs r0, #0
	b _080B3410
_080B3410:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3418
sub_80B3418: @ 0x080B3418
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B3438 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldr r2, _080B3438 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	ldr r2, _080B3438 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	cmp r0, r2
	bge _080B343C
	movs r0, #1
	b _080B3440
	.align 2, 0
_080B3438: .4byte gUnk_08DB0AF4
_080B343C:
	movs r0, #0
	b _080B3440
_080B3440:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3448
sub_80B3448: @ 0x080B3448
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B3488 @ =gUnk_086EA858
	ldr r2, _080B348C @ =gUnk_086EA8D0
	adds r1, r2, #0
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	cmp r0, #0
	bne _080B3492
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsrs r2, r1, #0x1f
	lsls r0, r2, #0x1f
	cmp r0, #0
	bne _080B3492
	movs r0, #0
	b _080B3496
	.align 2, 0
_080B3488: .4byte gUnk_086EA858
_080B348C: .4byte gUnk_086EA8D0
_080B3490:
	b _080B3496
_080B3492:
	movs r0, #1
	b _080B3496
_080B3496:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B34A0
sub_80B34A0: @ 0x080B34A0
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B34C0 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_802EF4C
	ldr r1, _080B34C4 @ =gUnk_08DB0AF8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B34C0: .4byte gActiveUnit
_080B34C4: .4byte gUnk_08DB0AF8

	thumb_func_start sub_80B34C8
sub_80B34C8: @ 0x080B34C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B34E4 @ =gUnk_08DB0C58
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B34E4: .4byte gUnk_08DB0C58

	thumb_func_start sub_80B34E8
sub_80B34E8: @ 0x080B34E8
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _080B383C @ =gUnk_08D64F4C
	ldr r1, _080B3840 @ =sub_806E2A0
	bl Proc_ForEach
	bl sub_80B2C4C
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #3
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl InitFaces
	movs r0, #1
	str r0, [sp]
	movs r0, #0xe2
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_8008DA8
	ldr r0, _080B3848 @ =gUnk_083FAD4C
	ldr r1, _080B384C @ =gBuf
	bl Decompress
	ldr r0, _080B3850 @ =gBg1Tm
	ldr r1, _080B384C @ =gBuf
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r1, _080B3854 @ =gBg1Tm + 0x200
	adds r0, r1, #0
	movs r1, #0x1e
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r7]
	bl sub_80B25C8
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x58
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x48
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x98
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B385C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B3860 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r4, _080B3864 @ =gUnk_083F64B8
	movs r0, #3
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B3868 @ =gBg3Tm
	ldr r1, _080B386C @ =gUnk_083F9094
	movs r2, #0xc0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080B3870 @ =gUnk_083F9548
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B383C: .4byte gUnk_08D64F4C
_080B3840: .4byte sub_806E2A0
_080B3844: .4byte gDispIo
_080B3848: .4byte gUnk_083FAD4C
_080B384C: .4byte gBuf
_080B3850: .4byte gBg1Tm
_080B3854: .4byte gBg1Tm + 0x200
_080B3858: .4byte 0x030027CC
_080B385C: .4byte 0x0000FFE0
_080B3860: .4byte 0x0000E0FF
_080B3864: .4byte gUnk_083F64B8
_080B3868: .4byte gBg3Tm
_080B386C: .4byte gUnk_083F9094
_080B3870: .4byte gUnk_083F9548

	thumb_func_start sub_80B3874
sub_80B3874: @ 0x080B3874
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B38A0 @ =gArenaSt
	ldr r1, [r0]
	ldr r2, _080B38A4 @ =gBattleActor
	adds r0, r1, #0
	adds r1, r2, #0
	bl UpdateUnitFromBattle
	ldr r0, _080B38A8 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B38A0: .4byte gArenaSt
_080B38A4: .4byte gBattleActor
_080B38A8: .4byte gActiveUnit

	thumb_func_start sub_80B38AC
sub_80B38AC: @ 0x080B38AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B38D0 @ =gArenaSt
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	lsrs r0, r2, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _080B38D4
	movs r0, #0x3f
	ldr r1, [r7]
	bl sub_80B3BD0
	b _080B38DC
	.align 2, 0
_080B38D0: .4byte gArenaSt
_080B38D4:
	movs r0, #0x40
	ldr r1, [r7]
	bl sub_80B3BD0
_080B38DC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B38E4
sub_80B38E4: @ 0x080B38E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802F5A0
	adds r1, r0, #0
	adds r0, r1, #0
	bl SetTalkNumber
	movs r0, #0x41
	ldr r1, [r7]
	bl sub_80B3BD0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3908
sub_80B3908: @ 0x080B3908
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B393A
	cmp r0, #1
	bgt _080B3922
	cmp r0, #0
	beq _080B3928
	b _080B3928
_080B3922:
	cmp r0, #2
	beq _080B3928
	b _080B3928
_080B3928:
	movs r0, #0x43
	ldr r1, [r7]
	bl sub_80B3BD0
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b _080B395E
_080B393A:
	bl sub_802F5A0
	adds r4, r0, #0
	bl GetGold
	cmp r4, r0
	bgt _080B394C
	b _080B395E
_080B394A:
	b _080B395C
_080B394C:
	movs r0, #0x49
	ldr r1, [r7]
	bl sub_80B3BD0
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
_080B395C:
	b _080B395E
_080B395E:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3968
sub_80B3968: @ 0x080B3968
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl sub_802F5A0
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, _080B39B4 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B399E
	movs r0, #0xb9
	bl m4aSongNumStart
_080B399E:
	ldr r1, _080B39B8 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	ldr r0, [r7]
	bl sub_80B3C1C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B39B4: .4byte gPlaySt
_080B39B8: .4byte gBg0Tm + 0x1b6

	thumb_func_start sub_80B39BC
sub_80B39BC: @ 0x080B39BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x44
	ldr r1, [r7]
	bl sub_80B3BD0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B39D4
sub_80B39D4: @ 0x080B39D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x42
	ldr r1, [r7]
	bl sub_80B3BD0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B39EC
sub_80B39EC: @ 0x080B39EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl FadeBgmOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3A08
sub_80B3A08: @ 0x080B3A08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #7
	bl sub_800463C
	bl ClearTalk
	ldr r1, _080B3A78 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B3A7C @ =gActionSt
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x16
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r1, _080B3A80 @ =gActiveUnit
	ldr r0, [r1]
	ldr r2, _080B3A80 @ =gActiveUnit
	ldr r1, [r2]
	ldr r2, [r1, #0xc]
	movs r1, #0x40
	orrs r2, r1
	str r2, [r0, #0xc]
	ldr r0, _080B3A80 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl PidStatsAddBattleAmt
	bl EndAllMus
	ldr r0, _080B3A7C @ =gActionSt
	ldrb r1, [r0, #0x15]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x15]
	ldr r0, _080B3A80 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl BattleGenerateArena
	bl BeginBattleAnimations
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3A78: .4byte gUnk_08DB0ADC
_080B3A7C: .4byte gActionSt
_080B3A80: .4byte gActiveUnit

	thumb_func_start sub_80B3A84
sub_80B3A84: @ 0x080B3A84
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8015020
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3A9C
sub_80B3A9C: @ 0x080B3A9C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_80B34E8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3AB4
sub_80B3AB4: @ 0x080B3AB4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl sub_802F5AC
	cmp r0, #2
	beq _080B3B0C
	cmp r0, #2
	bgt _080B3AD4
	cmp r0, #1
	beq _080B3ADE
	b _080B3B3C
_080B3AD4:
	cmp r0, #3
	beq _080B3B16
	cmp r0, #4
	beq _080B3B32
	b _080B3B3C
_080B3ADE:
	bl sub_802F5A0
	adds r1, r0, #0
	lsls r2, r1, #1
	adds r0, r2, #0
	bl SetTalkNumber
	movs r0, #0x45
	ldr r1, [r7]
	bl sub_80B3BD0
	bl sub_802F5A0
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B3B3C
_080B3B0C:
	movs r0, #0x46
	ldr r1, [r7]
	bl sub_80B3BD0
	b _080B3B3C
_080B3B16:
	movs r0, #0x48
	ldr r1, [r7]
	bl sub_80B3BD0
	bl sub_802F5A0
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B3B3C
_080B3B32:
	movs r0, #0x47
	ldr r1, [r7]
	bl sub_80B3BD0
	b _080B3B3C
_080B3B3C:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3B44
sub_80B3B44: @ 0x080B3B44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802F5AC
	cmp r0, #2
	beq _080B3B98
	cmp r0, #2
	bgt _080B3B5E
	cmp r0, #1
	beq _080B3B68
	b _080B3B9C
_080B3B5E:
	cmp r0, #3
	beq _080B3B68
	cmp r0, #4
	beq _080B3B9A
	b _080B3B9C
_080B3B68:
	ldr r1, _080B3B90 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	ldr r1, _080B3B94 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B3B86
	movs r0, #0xb9
	bl m4aSongNumStart
_080B3B86:
	ldr r0, [r7]
	movs r1, #0x3c
	bl sub_80149B4
	b _080B3B9C
	.align 2, 0
_080B3B90: .4byte gBg0Tm + 0x1b6
_080B3B94: .4byte gPlaySt
_080B3B98:
	b _080B3B9C
_080B3B9A:
	b _080B3B9C
_080B3B9C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3BA4
sub_80B3BA4: @ 0x080B3BA4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B3BC4 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B3BC8 @ =gUnk_08D64F4C
	ldr r1, _080B3BCC @ =sub_806E2C8
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BC4: .4byte gUnk_08DB0ADC
_080B3BC8: .4byte gUnk_08D64F4C
_080B3BCC: .4byte sub_806E2C8

	thumb_func_start sub_80B3BD0
sub_80B3BD0: @ 0x080B3BD0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	bl sub_8007DF4
	bl sub_800968C
	ldr r0, [r7]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl StartTalkExt
	movs r0, #0
	bl sub_8007F84
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl sub_8008CB8
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3C1C
sub_80B3C1C: @ 0x080B3C1C
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #9
	movs r2, #0x10
	movs r3, #6
	bl DrawUiFrame2
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, _080B3CB8 @ =gBg0Tm + 0x290
	ldr r5, _080B3CBC @ =gUnk_08D8AC98
	bl GetLang
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r5, r0
	ldr r2, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	ldr r0, _080B3CC0 @ =gBg0Tm + 0x298
	ldr r1, _080B3CC4 @ =gArenaSt
	ldr r3, [r1, #4]
	movs r2, #8
	ldrsb r2, [r3, r2]
	movs r1, #2
	bl PutNumber
	ldr r4, _080B3CC8 @ =gBg0Tm + 0x310
	ldr r0, _080B3CC4 @ =gArenaSt
	ldr r1, [r0, #4]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	ldr r4, _080B3CCC @ =gBg0Tm + 0x29e
	ldr r0, _080B3CC4 @ =gArenaSt
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	ldr r4, _080B3CD0 @ =gBg0Tm + 0x31e
	ldr r0, _080B3CC4 @ =gArenaSt
	ldrh r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetItemName
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3CB8: .4byte gBg0Tm + 0x290
_080B3CBC: .4byte gUnk_08D8AC98
_080B3CC0: .4byte gBg0Tm + 0x298
_080B3CC4: .4byte gArenaSt
_080B3CC8: .4byte gBg0Tm + 0x310
_080B3CCC: .4byte gBg0Tm + 0x29e
_080B3CD0: .4byte gBg0Tm + 0x31e

	thumb_func_start sub_80B3CD4
sub_80B3CD4: @ 0x080B3CD4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802F5AC
	cmp r0, #1
	beq _080B3CE6
	b _080B3D04
_080B3CE6:
	ldr r1, _080B3D00 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B3CFE
	movs r0, #0x2d
	movs r1, #0
	bl sub_8003684
_080B3CFE:
	b _080B3D28
	.align 2, 0
_080B3D00: .4byte gPlaySt
_080B3D04:
	ldr r1, _080B3D24 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B3D1C
	movs r0, #0x47
	movs r1, #0
	bl sub_8003684
_080B3D1C:
	ldr r0, [r7]
	bl Proc_End
	b _080B3D28
	.align 2, 0
_080B3D24: .4byte gPlaySt
_080B3D28:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3D30
sub_80B3D30: @ 0x080B3D30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x47
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3D4C
sub_80B3D4C: @ 0x080B3D4C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3D60 @ =gUnk_08DB0D68
	adds r0, r1, #0
	bl StartEvent
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D60: .4byte gUnk_08DB0D68

	thumb_func_start sub_80B3D64
sub_80B3D64: @ 0x080B3D64
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B3D84
	cmp r0, #1
	bgt _080B3D7E
	cmp r0, #0
	beq _080B3D8C
	b _080B3D8C
_080B3D7E:
	cmp r0, #2
	beq _080B3D88
	b _080B3D8C
_080B3D84:
	movs r0, #1
	b _080B3D90
_080B3D88:
	movs r0, #0
	b _080B3D90
_080B3D8C:
	movs r0, #0
	b _080B3D90
_080B3D90:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B3D98
sub_80B3D98: @ 0x080B3D98
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B3DB4 @ =gActionSt
	ldrb r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3DB4: .4byte gActionSt

	thumb_func_start sub_80B3DB8
sub_80B3DB8: @ 0x080B3DB8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetNextGameAction
	ldr r0, [r7]
	bl sub_800E43C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3DD4
sub_80B3DD4: @ 0x080B3DD4
	ldr r0, _080B3DE0 @ =gAnims
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080B3DE0: .4byte gAnims

	thumb_func_start sub_80B3DE4
sub_80B3DE4: @ 0x080B3DE4
	ldr r1, _080B3DEC @ =gAnims
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_080B3DEC: .4byte gAnims

	thumb_func_start sub_80B3DF0
sub_80B3DF0: @ 0x080B3DF0
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r4, _080B3E48 @ =0x0200000C
	ldr r2, _080B3E4C @ =0x01000200
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r5, #0
	str r5, [sp, #4]
	add r0, sp, #4
	ldr r1, _080B3E50 @ =0x06001000
	ldr r2, _080B3E54 @ =0x01001400
	bl CpuFastSet
	ldr r0, _080B3E58 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	strh r5, [r0]
	adds r1, #2
	adds r0, r4, r1
	strh r5, [r0]
	ldr r0, _080B3E5C @ =0x00000804
	adds r4, r4, r0
	strh r5, [r4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E48: .4byte 0x0200000C
_080B3E4C: .4byte 0x01000200
_080B3E50: .4byte 0x06001000
_080B3E54: .4byte 0x01001400
_080B3E58: .4byte gBg2Tm
_080B3E5C: .4byte 0x00000804

	thumb_func_start sub_80B3E60
sub_80B3E60: @ 0x080B3E60
	push {r4, lr}
	ldr r2, _080B3E88 @ =0x0200000C
	ldr r4, _080B3E8C @ =0x00000802
	adds r3, r2, r4
	ldrh r4, [r3]
	adds r0, r4, r0
	strh r0, [r3]
	ldr r0, _080B3E90 @ =0x00000804
	adds r2, r2, r0
	ldrh r4, [r2]
	adds r1, r4, r1
	strh r1, [r2]
	ldrh r1, [r3]
	ldrh r2, [r2]
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E88: .4byte 0x0200000C
_080B3E8C: .4byte 0x00000802
_080B3E90: .4byte 0x00000804

	thumb_func_start sub_80B3E94
sub_80B3E94: @ 0x080B3E94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r2, _080B3F30 @ =0x0200000C
	ldr r1, _080B3F34 @ =0x00000802
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	add r8, r0
	adds r1, #2
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r7, r7, r0
	mov r0, r8
	asrs r5, r0, #3
	asrs r4, r7, #3
	cmp r5, #0x1f
	bhi _080B3F24
	cmp r4, #0x1f
	bhi _080B3F24
	lsls r0, r5, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	adds r6, r0, r2
	ldr r0, _080B3F38 @ =0x0000FFFF
	ldrh r1, [r6]
	cmp r1, r0
	bne _080B3F00
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	ldrh r1, [r2]
	strh r1, [r6]
	ldr r3, _080B3F3C @ =gBg2Tm
	lsls r0, r4, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080B3F40 @ =0x0000A080
	adds r1, r1, r3
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	movs r0, #4
	bl EnableBgSync
_080B3F00:
	ldrh r6, [r6]
	lsls r0, r6, #5
	ldr r1, _080B3F44 @ =0x06001000
	adds r0, r0, r1
	movs r2, #7
	ands r7, r2
	lsls r1, r7, #2
	adds r1, r1, r0
	movs r0, #0xf
	mov r3, sb
	ands r3, r0
	mov r0, r8
	ands r0, r2
	lsls r0, r0, #2
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_080B3F24:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3F30: .4byte 0x0200000C
_080B3F34: .4byte 0x00000802
_080B3F38: .4byte 0x0000FFFF
_080B3F3C: .4byte gBg2Tm
_080B3F40: .4byte 0x0000A080
_080B3F44: .4byte 0x06001000

	thumb_func_start sub_80B3F48
sub_80B3F48: @ 0x080B3F48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	mov sb, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x50]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp sb, r3
	ble _080B3F6A
	adds r1, r3, #0
_080B3F6A:
	ldr r0, [sp, #0x44]
	cmp r1, r0
	ble _080B3F72
	adds r1, r0, #0
_080B3F72:
	ldr r0, [sp, #0x4c]
	cmp r1, r0
	ble _080B3F7A
	adds r1, r0, #0
_080B3F7A:
	mov r7, sb
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bge _080B3F84
	adds r7, r0, #0
_080B3F84:
	ldr r0, [sp, #0x44]
	cmp r7, r0
	bge _080B3F8C
	adds r7, r0, #0
_080B3F8C:
	ldr r0, [sp, #0x4c]
	cmp r7, r0
	bge _080B3F94
	adds r7, r0, #0
_080B3F94:
	mov r8, sl
	ldr r0, [sp, #0x10]
	cmp sl, r0
	ble _080B3F9E
	mov r8, r0
_080B3F9E:
	ldr r0, [sp, #0x40]
	cmp r8, r0
	ble _080B3FA6
	mov r8, r0
_080B3FA6:
	ldr r0, [sp, #0x48]
	cmp r8, r0
	ble _080B3FAE
	mov r8, r0
_080B3FAE:
	mov r6, sl
	ldr r0, [sp, #0x10]
	cmp r6, r0
	bge _080B3FB8
	adds r6, r0, #0
_080B3FB8:
	ldr r0, [sp, #0x40]
	cmp r6, r0
	bge _080B3FC0
	adds r6, r0, #0
_080B3FC0:
	ldr r0, [sp, #0x48]
	cmp r6, r0
	bge _080B3FC8
	adds r6, r0, #0
_080B3FC8:
	adds r5, r1, #0
	cmp r5, r7
	bgt _080B403E
_080B3FCE:
	mov r4, r8
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	cmp r4, r6
	bgt _080B4038
_080B3FD8:
	ldr r0, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl sub_80ABBB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4006
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_80B3E94
	b _080B4032
_080B4006:
	ldr r0, [sp, #0x40]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	str r0, [sp, #8]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl sub_80ABBB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4032
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_80B3E94
_080B4032:
	adds r4, #1
	cmp r4, r6
	ble _080B3FD8
_080B4038:
	ldr r5, [sp, #0x1c]
	cmp r5, r7
	ble _080B3FCE
_080B403E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B4050
sub_80B4050: @ 0x080B4050
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B40A4 @ =gAnims
	movs r3, #0
	strb r0, [r1]
	adds r2, r1, #0
	cmp r0, #1
	bne _080B40A8
	strh r4, [r2, #8]
	strh r5, [r2, #0xa]
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _080B4072
	strh r3, [r2, #8]
_080B4072:
	movs r1, #8
	ldrsh r0, [r2, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B4080
	strh r1, [r2, #8]
_080B4080:
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _080B408A
	strh r3, [r2, #0xa]
_080B408A:
	movs r1, #0xa
	ldrsh r0, [r2, r1]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B4098
	strh r1, [r2, #0xa]
_080B4098:
	ldrh r0, [r2, #8]
	strh r0, [r2, #4]
	ldrh r0, [r2, #0xa]
	strh r0, [r2, #6]
	b _080B40B0
	.align 2, 0
_080B40A4: .4byte gAnims
_080B40A8:
	strh r3, [r2, #4]
	strh r3, [r2, #8]
	strh r3, [r2, #6]
	strh r3, [r2, #0xa]
_080B40B0:
	adds r0, r2, #0
	ldrb r3, [r0]
	movs r4, #4
	ldrsh r1, [r0, r4]
	cmp r1, #0
	bge _080B40BE
	adds r1, #7
_080B40BE:
	asrs r1, r1, #3
	movs r4, #6
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _080B40CA
	adds r0, #7
_080B40CA:
	asrs r2, r0, #3
	adds r0, r3, #0
	bl sub_80B6BBC
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B40D8
sub_80B40D8: @ 0x080B40D8
	push {lr}
	ldr r2, _080B4100 @ =gAnims
	ldrb r0, [r2]
	movs r3, #4
	ldrsh r1, [r2, r3]
	cmp r1, #0
	bge _080B40E8
	adds r1, #7
_080B40E8:
	asrs r1, r1, #3
	movs r3, #6
	ldrsh r2, [r2, r3]
	cmp r2, #0
	bge _080B40F4
	adds r2, #7
_080B40F4:
	asrs r2, r2, #3
	bl sub_80B6C8C
	pop {r0}
	bx r0
	.align 2, 0
_080B4100: .4byte gAnims

	thumb_func_start sub_80B4104
sub_80B4104: @ 0x080B4104
	push {r4, r5, lr}
	adds r3, r1, #0
	ldr r2, _080B416C @ =gAnims
	ldrb r1, [r2]
	cmp r1, #1
	bne _080B4164
	ldrh r4, [r2, #8]
	adds r1, r4, r0
	movs r4, #0
	strh r1, [r2, #8]
	ldrh r5, [r2, #0xa]
	adds r0, r5, r3
	strh r0, [r2, #0xa]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080B4126
	strh r4, [r2, #8]
_080B4126:
	movs r1, #8
	ldrsh r0, [r2, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B4134
	strh r1, [r2, #8]
_080B4134:
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _080B413E
	strh r4, [r2, #0xa]
_080B413E:
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B414C
	strh r1, [r2, #0xa]
_080B414C:
	movs r5, #8
	ldrsh r0, [r2, r5]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	movs r5, #6
	ldrsh r2, [r2, r5]
	subs r1, r1, r2
	bl sub_80B3E60
_080B4164:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B416C: .4byte gAnims

	thumb_func_start sub_80B4170
sub_80B4170: @ 0x080B4170
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _080B41EC @ =gAnims
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _080B41E6
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080B418E
	cmp r1, r0
	beq _080B418E
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
_080B418E:
	adds r3, r4, #0
	ldr r1, [r3, #8]
	ldr r0, [r3, #4]
	cmp r1, r0
	beq _080B41E6
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080B41A2
	adds r0, #7
_080B41A2:
	asrs r0, r0, #3
	movs r2, #6
	ldrsh r1, [r3, r2]
	cmp r1, #0
	bge _080B41AE
	adds r1, #7
_080B41AE:
	asrs r1, r1, #3
	movs r5, #8
	ldrsh r2, [r3, r5]
	cmp r2, #0
	bge _080B41BA
	adds r2, #7
_080B41BA:
	asrs r2, r2, #3
	movs r5, #0xa
	ldrsh r3, [r3, r5]
	cmp r3, #0
	bge _080B41C6
	adds r3, #7
_080B41C6:
	asrs r3, r3, #3
	bl sub_80B6A1C
	movs r2, #0xff
	adds r1, r2, #0
	ldrh r0, [r4, #8]
	ands r1, r0
	ldrh r5, [r4, #0xa]
	ands r2, r5
	movs r0, #3
	bl SetBgOffset
	ldrh r0, [r4, #8]
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #6]
_080B41E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B41EC: .4byte gAnims

	thumb_func_start sub_80B41F0
sub_80B41F0: @ 0x080B41F0
	ldr r0, _080B41F8 @ =gAnims
	movs r1, #4
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B41F8: .4byte gAnims

	thumb_func_start sub_80B41FC
sub_80B41FC: @ 0x080B41FC
	ldr r0, _080B4204 @ =gAnims
	movs r1, #6
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B4204: .4byte gAnims

	thumb_func_start sub_80B4208
sub_80B4208: @ 0x080B4208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	cmp r2, #7
	bgt _080B4226
	b _080B44A2
_080B4226:
	cmp r3, #7
	bgt _080B422C
	b _080B44A2
_080B422C:
	ldr r5, [sp, #4]
	adds r5, #8
	ldr r0, [sp, #4]
	adds r1, r0, r2
	adds r0, r1, #0
	subs r0, #0x28
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	adds r1, r1, r3
	mov sb, r1
	ldr r2, [sp, #8]
	adds r2, #8
	str r2, [sp, #0x10]
	cmp r5, r0
	bge _080B4296
	movs r3, #0xff
	mov r8, r3
	ldr r7, _080B44B4 @ =Sprite_32x8
	ldr r0, [sp, #0xc]
	ldr r1, _080B44B8 @ =0x00000806
	adds r6, r0, r1
	movs r2, #8
	rsbs r2, r2, #0
	add r2, sb
	mov sl, r2
_080B425E:
	ldr r4, _080B44BC @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0x20
	ldr r0, [sp, #0x14]
	subs r0, #0x28
	cmp r5, r0
	blt _080B425E
_080B4296:
	ldr r0, [sp, #0x14]
	subs r0, #0x18
	cmp r5, r0
	bge _080B42EA
	movs r0, #0xff
	mov r8, r0
	ldr r7, _080B44C0 @ =Sprite_16x8
	ldr r1, [sp, #0xc]
	ldr r2, _080B44B8 @ =0x00000806
	adds r6, r1, r2
	movs r3, #8
	rsbs r3, r3, #0
	add r3, sb
	mov sl, r3
_080B42B2:
	ldr r4, _080B44BC @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0x10
	ldr r0, [sp, #0x14]
	subs r0, #0x18
	cmp r5, r0
	blt _080B42B2
_080B42EA:
	ldr r0, [sp, #0x14]
	subs r0, #8
	cmp r5, r0
	bge _080B433E
	movs r0, #0xff
	mov r8, r0
	ldr r7, _080B44C4 @ =Sprite_8x8
	ldr r1, [sp, #0xc]
	ldr r2, _080B44B8 @ =0x00000806
	adds r6, r1, r2
	movs r3, #8
	rsbs r3, r3, #0
	add r3, sb
	mov sl, r3
_080B4306:
	ldr r4, _080B44BC @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #8
	ldr r0, [sp, #0x14]
	subs r0, #8
	cmp r5, r0
	blt _080B4306
_080B433E:
	ldr r5, [sp, #0x10]
	mov r0, sb
	subs r0, #0x28
	cmp r5, r0
	bge _080B438E
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	ldr r1, _080B44C8 @ =Sprite_8x32
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B44CC @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B435C:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r5, #0x20
	mov r0, sb
	subs r0, #0x28
	cmp r5, r0
	blt _080B435C
_080B438E:
	mov r0, sb
	subs r0, #0x18
	cmp r5, r0
	bge _080B43DC
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	ldr r1, _080B44D0 @ =Sprite_8x16
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B44CC @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B43AA:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r5, #0x10
	mov r0, sb
	subs r0, #0x18
	cmp r5, r0
	blt _080B43AA
_080B43DC:
	mov r0, sb
	subs r0, #8
	cmp r5, r0
	bge _080B442A
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	ldr r1, _080B44C4 @ =Sprite_8x8
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B44CC @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B43F8:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r5, #8
	mov r0, sb
	subs r0, #8
	cmp r5, r0
	blt _080B43F8
_080B442A:
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	mov r6, sl
	ldr r1, [sp, #4]
	ands r6, r1
	movs r4, #0xff
	ldr r2, [sp, #8]
	ands r4, r2
	ldr r7, _080B44C4 @ =Sprite_8x8
	ldr r3, [sp, #0xc]
	ldr r0, _080B44D4 @ =0x00000805
	adds r3, r3, r0
	mov r8, r3
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	ldr r5, [sp, #0x14]
	subs r5, #8
	mov r1, sl
	ands r5, r1
	movs r1, #0x80
	lsls r1, r1, #5
	adds r1, r5, r1
	mov r2, r8
	str r2, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r4, sb
	subs r4, #8
	movs r3, #0xff
	ands r4, r3
	mov r0, r8
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r5, r5, r0
	mov r1, r8
	str r1, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
_080B44A2:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B44B4: .4byte Sprite_32x8
_080B44B8: .4byte 0x00000806
_080B44BC: .4byte 0x000001FF
_080B44C0: .4byte Sprite_16x8
_080B44C4: .4byte Sprite_8x8
_080B44C8: .4byte Sprite_8x32
_080B44CC: .4byte 0x00000804
_080B44D0: .4byte Sprite_8x16
_080B44D4: .4byte 0x00000805

	thumb_func_start sub_80B44D8
sub_80B44D8: @ 0x080B44D8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80B40D8
	ldr r3, _080B4528 @ =gDispIo
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _080B452C @ =0x0000FFE0
	ldrh r5, [r3, #0x3c]
	ands r0, r5
	movs r1, #4
	orrs r0, r1
	ldr r1, _080B4530 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	str r2, [r4, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4528: .4byte gDispIo
_080B452C: .4byte 0x0000FFE0
_080B4530: .4byte 0x0000E0FF

	thumb_func_start sub_80B4534
sub_80B4534: @ 0x080B4534
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080B454C
	ldr r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x38]
	bl sub_80B4050
_080B454C:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B4558
sub_80B4558: @ 0x080B4558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	asrs r4, r0, #2
	ldr r2, _080B45D8 @ =gDispIo
	adds r6, r2, #0
	adds r6, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r1, [r6]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r6]
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #0x44
	adds r1, r1, r2
	mov sb, r1
	movs r5, #0
	strb r0, [r1]
	movs r0, #0x45
	adds r0, r0, r2
	mov r8, r0
	strb r4, [r0]
	adds r7, r2, #0
	adds r7, #0x46
	strb r5, [r7]
	cmp r4, #0x10
	bne _080B45CA
	adds r0, r3, #0
	bl Proc_Break
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	mov r0, sl
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	mov r0, sb
	strb r4, [r0]
	mov r1, r8
	strb r5, [r1]
	strb r5, [r7]
_080B45CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B45D8: .4byte gDispIo

	thumb_func_start sub_80B45DC
sub_80B45DC: @ 0x080B45DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B45F8 @ =gUnk_08DB0DC4
	bl Proc_StartBlocking
	str r4, [r0, #0x34]
	str r5, [r0, #0x38]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B45F8: .4byte gUnk_08DB0DC4

	thumb_func_start sub_80B45FC
sub_80B45FC: @ 0x080B45FC
	push {r4, lr}
	ldr r0, _080B4670 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B460E
	movs r3, #0
_080B460E:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B4668
	ldr r1, _080B4674 @ =0x02000814
	movs r0, #2
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _080B463C
	ldr r1, _080B4678 @ =gManimActiveScanlineBuf
	cmp r3, #0
	bne _080B4630
	ldr r0, _080B467C @ =gManimScanlineBufs
	ldr r0, [r0]
	str r0, [r1]
_080B4630:
	ldr r2, _080B4680 @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B463C:
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _080B4668
	ldr r0, _080B4684 @ =0x02000815
	ldrb r1, [r0]
	cmp r3, r1
	blo _080B4668
	adds r0, r1, #0
	adds r0, #0x28
	cmp r3, r0
	bge _080B4668
	subs r0, r3, r1
	lsls r0, r0, #1
	ldr r1, _080B4688 @ =gPal + 0x280
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080B468C @ =0x05000268
	strh r1, [r0]
	subs r0, #0x20
	strh r1, [r0]
_080B4668:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4670: .4byte 0x04000006
_080B4674: .4byte 0x02000814
_080B4678: .4byte gManimActiveScanlineBuf
_080B467C: .4byte gManimScanlineBufs
_080B4680: .4byte 0x04000040
_080B4684: .4byte 0x02000815
_080B4688: .4byte gPal + 0x280
_080B468C: .4byte 0x05000268

	thumb_func_start sub_80B4690
sub_80B4690: @ 0x080B4690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	movs r2, #0
	cmp r2, r7
	bge _080B473E
	movs r0, #0x1f
	mov r1, sl
	ands r1, r0
	str r1, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	mov r8, r4
	ldr r1, [sp]
	mov sb, r1
	mov r3, sb
	ands r3, r0
	mov sb, r3
_080B46CA:
	subs r6, r7, r2
	mov r0, sb
	muls r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	str r2, [sp, #0xc]
	bl __divsi3
	adds r4, r0, #0
	movs r3, #0x1f
	ands r4, r3
	ldr r0, [sp]
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	muls r0, r6, r0
	mov r1, sl
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r1, r3
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	adds r4, r4, r0
	movs r5, #0xf8
	lsls r5, r5, #7
	ldr r0, [sp]
	ands r0, r5
	muls r0, r6, r0
	mov r1, sl
	ands r1, r5
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	ands r0, r5
	adds r4, r4, r0
	mov r3, r8
	strh r4, [r3]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r3, #2
	add r8, r3
	ldr r2, [sp, #0xc]
	adds r2, #1
	cmp r2, r7
	blt _080B46CA
_080B473E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B4750
sub_80B4750: @ 0x080B4750
	adds r2, r0, #0
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	strh r1, [r2, #0x2e]
	movs r3, #0
	movs r1, #3
	adds r0, #0x1f
_080B476C:
	str r3, [r0]
	subs r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080B476C
	bx lr

	thumb_func_start sub_80B4778
sub_80B4778: @ 0x080B4778
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4806
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r3, [r0]
	cmp r3, #0
	beq _080B47A4
	adds r0, #1
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080B479E
	bl sub_80B49A8
	b _080B47DE
_080B479E:
	subs r0, r1, #1
	strb r0, [r4]
	b _080B47DE
_080B47A4:
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #0x10
	bne _080B47B8
	strb r3, [r1]
_080B47B8:
	ldrb r1, [r1]
	lsrs r1, r1, #3
	movs r0, #0xf
	ands r0, r1
	cmp r0, #7
	bls _080B47CE
	movs r0, #7
	ands r1, r0
	movs r0, #0xa
	subs r0, r0, r1
	b _080B47D4
_080B47CE:
	movs r0, #7
	ands r1, r0
	adds r0, r1, #2
_080B47D4:
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r4, r0, #0
_080B47DE:
	ldr r3, _080B480C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldrb r4, [r4]
	lsrs r1, r4, #2
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
_080B4806:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B480C: .4byte gDispIo

	thumb_func_start sub_80B4810
sub_80B4810: @ 0x080B4810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	mov r8, r1
	ldr r0, _080B4914 @ =gUnk_08DB0E8C
	bl Proc_Find
	adds r7, r0, #0
	cmp r4, #3
	bhi _080B4902
	cmp r7, #0
	beq _080B4902
	lsls r4, r4, #3
	mov sl, r4
	adds r0, #0x30
	add r0, sl
	mov sb, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _080B4902
	ldr r5, _080B4918 @ =gUnk_08622B38
	mov r0, r8
	lsls r4, r0, #2
	add r4, r8
	lsls r4, r4, #2
	adds r6, r4, r5
	ldr r0, [r6]
	ldr r1, _080B491C @ =0x06010000
	ldrh r2, [r7, #0x2e]
	orrs r1, r2
	bl Decompress
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	ldr r3, _080B4920 @ =gAnims
	movs r2, #4
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	mov ip, r0
	movs r2, #6
	ldrsh r0, [r3, r2]
	mov r3, ip
	subs r2, r3, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r0, r0, r2
	mov ip, r0
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldrh r2, [r7, #0x2e]
	lsrs r2, r2, #5
	str r2, [sp, #8]
	movs r3, #0x9c
	lsls r3, r3, #8
	adds r3, r2, r3
	str r3, [sp, #8]
	adds r5, #8
	adds r4, r4, r5
	ldr r4, [r4]
	str r4, [sp]
	movs r4, #0xd
	str r4, [sp, #4]
	mov r2, ip
	bl StartSpriteAnimProc
	mov r5, sb
	str r0, [r5]
	mov r1, sl
	adds r0, r7, r1
	ldrh r1, [r7, #0x2e]
	movs r4, #0
	strh r1, [r0, #0x36]
	adds r0, #0x34
	mov r2, r8
	strb r2, [r0]
	ldrh r3, [r7, #0x2e]
	ldrh r6, [r6, #0xc]
	adds r0, r3, r6
	strh r0, [r7, #0x2e]
	adds r3, r7, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0
	bne _080B48E6
	ldr r2, _080B4924 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, #9
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x46
	strb r4, [r0]
_080B48E6:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r2, _080B4928 @ =0x030027CC
	ldr r0, _080B492C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _080B4930 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_080B4902:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4914: .4byte gUnk_08DB0E8C
_080B4918: .4byte gUnk_08622B38
_080B491C: .4byte 0x06010000
_080B4920: .4byte gAnims
_080B4924: .4byte gDispIo
_080B4928: .4byte 0x030027CC
_080B492C: .4byte 0x0000FFE0
_080B4930: .4byte 0x0000E0FF

	thumb_func_start sub_80B4934
sub_80B4934: @ 0x080B4934
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080B497C @ =gUnk_08DB0E8C
	bl Proc_Find
	adds r4, r0, #0
	cmp r5, #3
	bhi _080B499E
	cmp r4, #0
	beq _080B499E
	lsls r6, r5, #3
	adds r0, #0x30
	adds r5, r0, r6
	ldr r0, [r5]
	cmp r0, #0
	beq _080B499E
	bl EndSpriteAnimProc
	movs r0, #0
	str r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080B4980
	movs r1, #0
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _080B499E
	.align 2, 0
_080B497C: .4byte gUnk_08DB0E8C
_080B4980:
	ldrh r3, [r4, #0x2e]
	adds r1, r4, r6
	ldrh r5, [r1, #0x36]
	ldr r2, _080B49A4 @ =gUnk_08622B38
	adds r1, #0x34
	ldrb r6, [r1]
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0xc]
	adds r0, r0, r5
	cmp r3, r0
	bne _080B499E
	strh r5, [r4, #0x2e]
_080B499E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B49A4: .4byte gUnk_08622B38

	thumb_func_start sub_80B49A8
sub_80B49A8: @ 0x080B49A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080B4A1C @ =gUnk_08DB0E8C
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B4A0A
	movs r0, #0x2b
	adds r0, r0, r5
	mov sl, r0
	adds r0, r5, #0
	adds r0, #0x2c
	str r0, [sp]
	movs r0, #0x2a
	adds r0, r0, r5
	mov sb, r0
	movs r0, #0x29
	adds r0, r0, r5
	mov r8, r0
	movs r7, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r6, #3
_080B49E0:
	ldr r0, [r4]
	cmp r0, #0
	beq _080B49EC
	bl EndSpriteAnimProc
	str r7, [r4]
_080B49EC:
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _080B49E0
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2e]
	mov r0, sl
	strb r1, [r0]
	ldr r0, [sp]
	strb r1, [r0]
	mov r0, sb
	strb r1, [r0]
	mov r0, r8
	strb r1, [r0]
_080B4A0A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4A1C: .4byte gUnk_08DB0E8C

	thumb_func_start sub_80B4A20
sub_80B4A20: @ 0x080B4A20
	push {lr}
	ldr r0, _080B4A38 @ =gUnk_08DB0E8C
	bl Proc_Find
	cmp r0, #0
	beq _080B4A34
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080B4A34:
	pop {r0}
	bx r0
	.align 2, 0
_080B4A38: .4byte gUnk_08DB0E8C

	thumb_func_start sub_80B4A3C
sub_80B4A3C: @ 0x080B4A3C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4A4C @ =gUnk_08DB0E8C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B4A4C: .4byte gUnk_08DB0E8C

	thumb_func_start sub_80B4A50
sub_80B4A50: @ 0x080B4A50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080B4A88 @ =gUnk_08DB0E8C
	bl Proc_Find
	cmp r0, #0
	beq _080B4A80
	lsls r1, r4, #3
	adds r0, #0x30
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _080B4A80
	ldr r0, _080B4A8C @ =gAnims
	movs r3, #4
	ldrsh r1, [r0, r3]
	subs r1, r5, r1
	str r1, [r2, #0x54]
	movs r1, #6
	ldrsh r0, [r0, r1]
	subs r0, r6, r0
	str r0, [r2, #0x58]
_080B4A80:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4A88: .4byte gUnk_08DB0E8C
_080B4A8C: .4byte gAnims

	thumb_func_start sub_80B4A90
sub_80B4A90: @ 0x080B4A90
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080B4ABC @ =0x44444444
	ldr r5, _080B4AC0 @ =0x06014000
	movs r4, #3
_080B4A9A:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080B4AC4 @ =0x010000D8
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080B4A9A
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4ABC: .4byte 0x44444444
_080B4AC0: .4byte 0x06014000
_080B4AC4: .4byte 0x010000D8

	thumb_func_start sub_80B4AC8
sub_80B4AC8: @ 0x080B4AC8
	push {r4, lr}
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	movs r4, #1
	movs r1, #1
	strb r1, [r3]
	adds r0, #0x2a
	strb r2, [r0]
	bl sub_80B4A90
	ldr r0, _080B4AF8 @ =0x02000814
	ldrb r1, [r0]
	eors r4, r1
	strb r4, [r0]
	ldr r0, _080B4AFC @ =gPal + 0x280
	ldr r2, _080B4B00 @ =0x000044C3
	ldr r3, _080B4B04 @ =0x00007247
	movs r1, #0x28
	bl sub_80B4690
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4AF8: .4byte 0x02000814
_080B4AFC: .4byte gPal + 0x280
_080B4B00: .4byte 0x000044C3
_080B4B04: .4byte 0x00007247

	thumb_func_start sub_80B4B08
sub_80B4B08: @ 0x080B4B08
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4B48
	movs r4, #0
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B4B24
	movs r4, #0x70
_080B4B24:
	ldr r3, _080B4B50 @ =gUnk_08DB0DFC
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl PutSpriteExt
	ldr r3, _080B4B54 @ =gUnk_08DB0E6A
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl PutSpriteExt
_080B4B48:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B50: .4byte gUnk_08DB0DFC
_080B4B54: .4byte gUnk_08DB0E6A

	thumb_func_start sub_80B4B58
sub_80B4B58: @ 0x080B4B58
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r0, _080B4BA4 @ =gUnk_08DB0EAC
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B4B9C
	bl sub_80B4A90
	cmp r4, #0
	bne _080B4B7A
	ldr r1, _080B4BA8 @ =0x02000815
	movs r0, #4
	strb r0, [r1]
_080B4B7A:
	cmp r4, #1
	bne _080B4B84
	ldr r1, _080B4BA8 @ =0x02000815
	movs r0, #0x74
	strb r0, [r1]
_080B4B84:
	ldr r1, _080B4BAC @ =0x02000814
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_080B4B9C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4BA4: .4byte gUnk_08DB0EAC
_080B4BA8: .4byte 0x02000815
_080B4BAC: .4byte 0x02000814

	thumb_func_start sub_80B4BB0
sub_80B4BB0: @ 0x080B4BB0
	push {lr}
	ldr r0, _080B4BD4 @ =gUnk_08DB0EAC
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080B4BD0
	ldr r1, _080B4BD8 @ =0x02000814
	movs r0, #1
	ldrb r3, [r1]
	eors r0, r3
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_080B4BD0:
	pop {r0}
	bx r0
	.align 2, 0
_080B4BD4: .4byte gUnk_08DB0EAC
_080B4BD8: .4byte 0x02000814

	thumb_func_start sub_80B4BDC
sub_80B4BDC: @ 0x080B4BDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4BEC @ =gUnk_08DB0EAC
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B4BEC: .4byte gUnk_08DB0EAC

	thumb_func_start sub_80B4BF0
sub_80B4BF0: @ 0x080B4BF0
	push {r4, lr}
	sub sp, #0xc
	movs r2, #0x2a
	ldrsh r1, [r0, r2]
	ldr r3, _080B4C2C @ =gAnims
	movs r4, #4
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	subs r1, #4
	movs r4, #0x2c
	ldrsh r2, [r0, r4]
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	subs r2, #4
	ldr r3, _080B4C30 @ =gUnk_08DB0DF4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp, #8]
	movs r0, #0xb
	bl sub_80B4C58
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C2C: .4byte gAnims
_080B4C30: .4byte gUnk_08DB0DF4

	thumb_func_start sub_80B4C34
sub_80B4C34: @ 0x080B4C34
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B4C54 @ =gUnk_08DB0ECC
	bl Proc_Start
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x29
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C54: .4byte gUnk_08DB0ECC

	thumb_func_start sub_80B4C58
sub_80B4C58: @ 0x080B4C58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r4, r1
	blt _080B4CA2
	cmp r5, r1
	blt _080B4CA2
	cmp r4, #0xef
	bgt _080B4CA2
	cmp r5, #0x9f
	bgt _080B4CA2
	ldr r1, _080B4CAC @ =0x000001FF
	ands r1, r4
	adds r1, r1, r2
	movs r2, #0xff
	ands r2, r5
	adds r2, r2, r0
	str r3, [sp]
	adds r0, r6, #0
	adds r3, r7, #0
	bl PutSpriteExt
_080B4CA2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4CAC: .4byte 0x000001FF

	thumb_func_start sub_80B4CB0
sub_80B4CB0: @ 0x080B4CB0
	adds r2, r0, #0
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	str r1, [r2, #0x50]
	adds r0, #0x36
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	str r1, [r2, #0x5c]
	adds r1, r2, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_80B4CD0
sub_80B4CD0: @ 0x080B4CD0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r3, [r2]
	cmp r1, r3
	beq _080B4CE6
	strb r1, [r2]
	ldr r0, [r0, #0x58]
	ldrb r1, [r2]
	bl SetMuFacing
_080B4CE6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B4CEC
sub_80B4CEC: @ 0x080B4CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	lsrs r1, r0, #0x14
	str r1, [sp, #4]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	str r0, [sp, #8]
	adds r1, r4, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B4D12
	b _080B50D0
_080B4D12:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	mov sl, r0
	ldrb r1, [r1]
	subs r1, #1
	ldr r2, [sp, #4]
	cmp r2, r1
	blt _080B4D26
	b _080B5010
_080B4D26:
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r1, [r0]
	str r0, [sp, #0x20]
	adds r2, r4, #0
	adds r2, #0x60
	ldr r3, [sp, #4]
	cmp r1, r3
	beq _080B4D48
	ldr r0, [r4, #0x54]
	lsrs r0, r0, #0x15
	movs r1, #3
	ands r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	strb r1, [r2]
_080B4D48:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4D6C
	subs r0, #1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x4a
	movs r6, #0
	ldrsh r5, [r1, r6]
	str r5, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r7, [r0, r2]
	str r7, [sp, #0x10]
	mov sb, r1
	adds r6, r0, #0
	b _080B5098
_080B4D6C:
	ldr r3, [sp, #4]
	cmp r3, #0
	ble _080B4D8C
	adds r0, r3, #0
	subs r0, #1
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x2e
	adds r0, r1, r0
	movs r6, #0
	ldrsh r5, [r0, r6]
	str r5, [sp, #0x14]
	adds r3, r1, #0
	ldr r7, [sp, #4]
	lsls r5, r7, #1
	b _080B4DA0
_080B4D8C:
	ldr r0, [sp, #4]
	lsls r2, r0, #1
	adds r1, r4, #0
	adds r1, #0x2e
	adds r0, r1, r2
	movs r5, #0
	ldrsh r3, [r0, r5]
	str r3, [sp, #0x14]
	adds r3, r1, #0
	adds r5, r2, #0
_080B4DA0:
	adds r0, r3, r5
	movs r7, #0
	ldrsh r6, [r0, r7]
	str r6, [sp, #0x18]
	ldr r2, [sp, #4]
	adds r2, #1
	lsls r0, r2, #1
	adds r0, r3, r0
	movs r6, #0
	ldrsh r1, [r0, r6]
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	subs r1, #2
	mov ip, r0
	ldr r7, [sp, #4]
	cmp r7, r1
	bge _080B4DD6
	adds r0, r7, #0
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r8, r1
	b _080B4DD8
_080B4DD6:
	mov r8, sb
_080B4DD8:
	ldr r6, [sp, #4]
	cmp r6, #0
	ble _080B4DF0
	adds r0, r6, #0
	subs r0, #1
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x3c
	adds r0, r1, r0
	movs r3, #0
	ldrsh r7, [r0, r3]
	b _080B4DFA
_080B4DF0:
	adds r1, r4, #0
	adds r1, #0x3c
	adds r0, r1, r5
	movs r6, #0
	ldrsh r7, [r0, r6]
_080B4DFA:
	adds r0, r1, r5
	movs r5, #0
	ldrsh r3, [r0, r5]
	str r3, [sp, #0x1c]
	lsls r0, r2, #1
	adds r0, r1, r0
	movs r2, #0
	ldrsh r6, [r0, r2]
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #2
	ldr r5, [sp, #4]
	cmp r5, r0
	bge _080B4E24
	adds r0, r5, #0
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	b _080B4E26
_080B4E24:
	adds r5, r6, #0
_080B4E26:
	ldr r2, [sp, #8]
	str r2, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, sb
	mov r3, r8
	bl sub_80A95B4
	str r0, [sp, #0xc]
	ldr r3, [sp, #8]
	str r3, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_80A95B4
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, sb
	mov r3, r8
	bl sub_80A968C
	mov r8, r0
	ldr r1, [sp, #8]
	str r1, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_80A968C
	adds r6, r0, #0
	mov r2, r8
	mov r0, r8
	muls r0, r2, r0
	adds r1, r6, #0
	muls r1, r6, r1
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, [r4, #0x5c]
	adds r2, r3, r5
	str r2, [r4, #0x5c]
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _080B4EA8
	lsrs r1, r2, #0xc
	lsrs r0, r3, #0xc
	cmp r1, r0
	bls _080B4EA8
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	movs r2, #0
	adds r3, r4, #0
	bl sub_80B4C34
_080B4EA8:
	adds r1, r5, #1
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl __divsi3
	adds r1, r0, #0
	ldr r0, _080B4F38 @ =0x000001FF
	cmp r1, r0
	bgt _080B4EBE
	movs r1, #0x80
	lsls r1, r1, #2
_080B4EBE:
	ldr r2, [r4, #0x54]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	beq _080B4ECC
	lsls r1, r1, #1
_080B4ECC:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r2, r0
	cmp r2, #0
	beq _080B4ED8
	asrs r1, r1, #1
_080B4ED8:
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4F3C
	adds r0, r1, #0
	subs r0, #0x21
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbf
	bls _080B4F0A
	movs r5, #1
	mov sl, r5
_080B4F0A:
	cmp r0, #0x3f
	bhi _080B4F12
	movs r6, #2
	mov sl, r6
_080B4F12:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _080B4F22
	movs r7, #0
	mov sl, r7
_080B4F22:
	adds r0, r1, #0
	adds r0, #0x5f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _080B4F32
	movs r0, #3
	mov sl, r0
_080B4F32:
	movs r0, #0
	strb r0, [r2]
	b _080B4F7C
	.align 2, 0
_080B4F38: .4byte 0x000001FF
_080B4F3C:
	adds r0, r1, #0
	subs r0, #0x1d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc7
	bls _080B4F4C
	movs r2, #1
	mov sl, r2
_080B4F4C:
	adds r0, r1, #0
	subs r0, #0x25
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4F5C
	movs r3, #2
	mov sl, r3
_080B4F5C:
	adds r0, r1, #0
	subs r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4F6C
	movs r5, #0
	mov sl, r5
_080B4F6C:
	adds r0, r1, #0
	adds r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4F7C
	movs r6, #3
	mov sl, r6
_080B4F7C:
	adds r0, r4, #0
	mov r1, sl
	bl sub_80B4CD0
	ldr r1, [r4, #0x54]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	movs r7, #0x4a
	adds r7, r7, r4
	mov sb, r7
	adds r6, r4, #0
	adds r6, #0x4c
	cmp r1, #0
	beq _080B4FF8
	ldr r1, _080B500C @ =gAnims
	movs r0, #4
	ldrsh r2, [r1, r0]
	ldr r3, [sp, #0xc]
	subs r0, r3, r2
	adds r5, r0, #0
	subs r5, #8
	movs r7, #6
	ldrsh r1, [r1, r7]
	ldr r3, [sp, #0x10]
	subs r0, r3, r1
	adds r3, r0, #0
	subs r3, #0xc
	mov r7, sb
	movs r0, #0
	ldrsh r7, [r7, r0]
	subs r2, r7, r2
	subs r2, #8
	movs r0, #0
	ldrsh r7, [r6, r0]
	subs r1, r7, r1
	subs r1, #0xc
	cmp r5, #0x6f
	bgt _080B4FCE
	cmp r5, r2
	blt _080B4FE6
_080B4FCE:
	cmp r5, #0x80
	ble _080B4FD6
	cmp r5, r2
	bgt _080B4FE6
_080B4FD6:
	cmp r3, #0x5f
	bgt _080B4FDE
	cmp r3, r1
	blt _080B4FE6
_080B4FDE:
	cmp r3, #0x40
	ble _080B4FF8
	cmp r3, r1
	ble _080B4FF8
_080B4FE6:
	subs r0, r5, r2
	subs r1, r3, r1
	bl sub_80B4104
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl sub_80B4170
_080B4FF8:
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B5098
	movs r0, #1
	bl sub_80B3DE4
	b _080B5098
	.align 2, 0
_080B500C: .4byte gAnims
_080B5010:
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x2e
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x3c
	adds r0, r0, r1
	movs r6, #0
	ldrsh r5, [r0, r6]
	str r5, [sp, #0x10]
	ldr r1, [r4, #0x54]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B505E
	cmp r1, r0
	bhi _080B5044
	cmp r1, #0
	beq _080B5066
	b _080B5076
_080B5044:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _080B5076
	adds r1, r4, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #4
	bl sub_80B4CD0
	b _080B5076
_080B505E:
	ldr r0, [r4, #0x58]
	bl sub_806E2C8
	b _080B5076
_080B5066:
	adds r1, r4, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_80B4CD0
_080B5076:
	ldr r1, [r4, #0x54]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	adds r7, r4, #0
	adds r7, #0x61
	str r7, [sp, #0x20]
	movs r0, #0x4a
	adds r0, r0, r4
	mov sb, r0
	adds r6, r4, #0
	adds r6, #0x4c
	cmp r1, #0
	beq _080B5098
	movs r0, #0
	bl sub_80B3DE4
_080B5098:
	mov r1, sp
	ldrh r2, [r1, #0xc]
	mov r1, sb
	strh r2, [r1]
	mov r3, sp
	ldrh r3, [r3, #0x10]
	strh r3, [r6]
	ldr r0, [r4, #0x58]
	ldr r2, _080B50CC @ =gAnims
	movs r5, #4
	ldrsh r1, [r2, r5]
	ldr r6, [sp, #0xc]
	subs r1, r6, r1
	subs r1, #8
	movs r7, #6
	ldrsh r2, [r2, r7]
	ldr r3, [sp, #0x10]
	subs r2, r3, r2
	subs r2, #0xc
	bl SetMuScreenPosition
	ldr r0, [r4, #0x58]
	bl sub_806E2C8
	b _080B50DA
	.align 2, 0
_080B50CC: .4byte gAnims
_080B50D0:
	ldr r0, [r4, #0x58]
	bl sub_806E2A0
	adds r4, #0x61
	str r4, [sp, #0x20]
_080B50DA:
	mov r5, sp
	ldrb r6, [r5, #4]
	ldr r5, [sp, #0x20]
	strb r6, [r5]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B50F4
sub_80B50F4: @ 0x080B50F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _080B5102
	bl EndMu
_080B5102:
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B5114
	movs r0, #0
	bl sub_80B3DE4
_080B5114:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B511C
sub_80B511C: @ 0x080B511C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B512C @ =gUnk_08DB0EE4
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B512C: .4byte gUnk_08DB0EE4

	thumb_func_start sub_80B5130
sub_80B5130: @ 0x080B5130
	movs r1, #0
	adds r0, #0x2c
	movs r2, #4
_080B5136:
	str r1, [r0, #4]
	strb r1, [r0, #8]
	strh r1, [r0, #2]
	strh r1, [r0]
	adds r0, #0xc
	subs r2, #1
	cmp r2, #0
	bge _080B5136
	bx lr

	thumb_func_start sub_80B5148
sub_80B5148: @ 0x080B5148
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	ldr r5, _080B5198 @ =gUnk_08DB0F0C
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x34]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x38]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #2
	strb r6, [r0]
	adds r4, #0x48
	strb r6, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5198: .4byte gUnk_08DB0F0C

	thumb_func_start sub_80B519C
sub_80B519C: @ 0x080B519C
	push {r4, r5, lr}
	adds r3, r1, #0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B5206
	adds r5, r0, #0
	adds r3, r3, r1
	movs r0, #0x2c
	ldrsh r1, [r3, r0]
	ldr r2, _080B51F4 @ =gAnims
	movs r4, #4
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	movs r3, #6
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x1f
	movs r0, #0x97
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080B51FC
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r3, r0
	ble _080B51FC
	cmp r3, #0xbf
	bgt _080B51FC
	ldr r0, _080B51F8 @ =0x000001FF
	ands r4, r0
	str r4, [r5, #0x54]
	movs r0, #0xff
	ands r3, r0
	str r3, [r5, #0x58]
	b _080B5206
	.align 2, 0
_080B51F4: .4byte gAnims
_080B51F8: .4byte 0x000001FF
_080B51FC:
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r5, #0x54]
	movs r0, #0
	str r0, [r5, #0x58]
_080B5206:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B520C
sub_80B520C: @ 0x080B520C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, [r0, #0x40]
	mov sb, r0
	movs r0, #0xff
	mov r8, r0
	movs r1, #0x10
	mov ip, r1
	mov r6, sb
	adds r6, #0x2e
	mov r7, sb
	adds r7, #0x2c
	movs r0, #0
	str r0, [sp]
	movs r1, #3
	mov sl, r1
_080B5234:
	mov r0, sb
	adds r0, #0x30
	ldr r1, [sp]
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B530A
	adds r5, r0, #0
	movs r0, #0
	ldrsh r4, [r7, r0]
	adds r3, r6, #0
	ldrh r2, [r6]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080B52A6
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B52A6
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B527C
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B5276
	adds r0, #0xff
_080B5276:
	asrs r0, r0, #8
	adds r0, r4, r0
	strh r0, [r5, #0x34]
_080B527C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B52A0
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B529A
	adds r0, #0xff
_080B529A:
	asrs r0, r0, #8
	subs r0, r4, r0
	strh r0, [r5, #0x34]
_080B52A0:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B52A6:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	beq _080B530A
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B530A
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B52DC
	adds r2, r4, #0
	subs r2, #0x20
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B52D6
	adds r0, #0xff
_080B52D6:
	asrs r0, r0, #8
	adds r0, r2, r0
	strh r0, [r5, #0x34]
_080B52DC:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B5304
	adds r2, r4, #0
	adds r2, #0x20
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B52FE
	adds r0, #0xff
_080B52FE:
	asrs r0, r0, #8
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_080B5304:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B530A:
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [sp]
	adds r0, #0xc
	str r0, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	add sl, r1
	mov r0, sl
	cmp r0, #0
	bge _080B5234
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B5330
sub_80B5330: @ 0x080B5330
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r4, _080B5428 @ =gDispIo
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x45
	ldrb r1, [r5]
	lsrs r2, r1, #1
	adds r0, r4, #0
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x45
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r2, [r0]
	adds r1, r2, r1
	strb r1, [r5]
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _080B53C6
	movs r6, #0
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	movs r4, #0
	movs r5, #0
_080B5386:
	ldr r1, [r7, #0x40]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080B53B8
	adds r0, r1, r4
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	bne _080B53B8
	adds r0, r6, #0
	bl EndFaceById
	ldr r0, [r7, #0x40]
	adds r0, r0, r4
	adds r0, #0x34
	strb r5, [r0]
	ldr r0, [r7, #0x40]
	adds r0, #0x30
	adds r0, r0, r4
	str r5, [r0]
_080B53B8:
	adds r4, #0xc
	adds r6, #1
	cmp r6, #3
	ble _080B5386
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080B53C6:
	adds r0, r7, #0
	adds r0, #0x45
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080B541A
	movs r2, #0x44
	adds r2, r2, r7
	mov r8, r2
	movs r5, #0
	movs r6, #3
_080B53DA:
	ldr r1, [r7, #0x40]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r4, [r0]
	cmp r4, #0
	beq _080B540C
	adds r0, r1, r5
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B540C
	adds r0, r4, #0
	bl GetFaceDisp
	ldr r1, _080B542C @ =0xFFFFFBFF
	ands r1, r0
	adds r0, r4, #0
	bl SetFaceDisp
	ldr r0, [r7, #0x40]
	adds r0, r0, r5
	adds r0, #0x34
	movs r1, #0
	strb r1, [r0]
_080B540C:
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bge _080B53DA
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080B541A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5428: .4byte gDispIo
_080B542C: .4byte 0xFFFFFBFF

	thumb_func_start sub_80B5430
sub_80B5430: @ 0x080B5430
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r0, #0x1f
	mov r8, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov ip, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov sb, r7
	movs r6, #0xf
_080B5452:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r0, r8
	ands r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, ip
	ands r0, r7
	adds r1, r1, r0
	mov r0, sb
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, sb
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _080B5452
	bl EnablePalSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B549C
sub_80B549C: @ 0x080B549C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x48
	adds r5, r6, #0
	adds r5, #0x47
	ldrb r1, [r4]
	ldrb r2, [r5]
	adds r0, r1, r2
	strb r0, [r4]
	ldr r0, _080B5550 @ =gPal + 0x340
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	lsls r1, r1, #5
	ldr r3, _080B5554 @ =0xFFFFFEC0
	adds r2, r0, r3
	adds r1, r1, r2
	ldrb r2, [r4]
	bl sub_80B5430
	ldrb r0, [r4]
	cmp r0, #0
	bne _080B550A
	movs r4, #0
	adds r7, r5, #0
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	movs r5, #0
_080B54DC:
	ldr r1, [r6, #0x34]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B54FE
	adds r0, r1, r5
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080B54FE
	adds r0, r4, #0
	bl sub_80B58FC
_080B54FE:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B54DC
	movs r0, #0
	strb r0, [r7]
_080B550A:
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080B5544
	adds r7, r6, #0
	adds r7, #0x47
	movs r5, #0x2c
	movs r4, #3
_080B551C:
	ldr r0, [r6, #0x34]
	adds r1, r0, r5
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _080B5538
	ldrb r3, [r1, #8]
	cmp r3, #1
	bne _080B5538
	movs r0, #0
	strb r0, [r1, #8]
	ldr r0, [r2, #0x58]
	ldrb r1, [r1, #9]
	bl sub_806EA0C
_080B5538:
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _080B551C
	movs r0, #0
	strb r0, [r7]
_080B5544:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5550: .4byte gPal + 0x340
_080B5554: .4byte 0xFFFFFEC0

	thumb_func_start sub_80B5558
sub_80B5558: @ 0x080B5558
	push {r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r1, _080B55F4 @ =gUnk_08622BEC
	mov r0, sp
	movs r2, #0x37
	bl memcpy
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080B557A
	movs r0, #0
	strh r0, [r5, #0x30]
_080B557A:
	ldrh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	lsls r4, r0, #5
	ldr r0, _080B55F8 @ =gUnk_0844F64C
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B55FC @ =gUnk_0844F5CC
	adds r4, r4, r0
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	adds r6, r5, #0
	adds r6, #0x44
	adds r7, r5, #0
	adds r7, #0x47
_080B55AA:
	ldr r1, [r5, #0x38]
	adds r0, r4, #0
	bl sub_80B519C
	adds r4, #1
	cmp r4, #3
	ble _080B55AA
	movs r4, #0
_080B55BA:
	ldr r1, [r5, #0x3c]
	adds r0, r4, #0
	bl sub_80B519C
	adds r4, #1
	cmp r4, #4
	ble _080B55BA
	adds r0, r5, #0
	bl sub_80B520C
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _080B55DC
	adds r0, r5, #0
	bl sub_80B5330
_080B55DC:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _080B55EA
	adds r0, r5, #0
	bl sub_80B549C
_080B55EA:
	add sp, #0x38
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B55F4: .4byte gUnk_08622BEC
_080B55F8: .4byte gUnk_0844F64C
_080B55FC: .4byte gUnk_0844F5CC

	thumb_func_start sub_80B5600
sub_80B5600: @ 0x080B5600
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #0
_080B5608:
	ldr r0, [r6, #0x38]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B561A
	adds r0, r4, #0
	bl sub_80B5A48
_080B561A:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B5608
	movs r4, #0
	movs r5, #0
_080B5626:
	ldr r0, [r6, #0x3c]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B5638
	adds r0, r4, #0
	bl sub_80B5B34
_080B5638:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #4
	ble _080B5626
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B5648
sub_80B5648: @ 0x080B5648
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080B56A4 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r6, r1, r0
	cmp r5, #0
	beq _080B569C
	ldr r7, [r6, #4]
	cmp r7, #0
	beq _080B569C
	movs r4, #0
	str r4, [sp]
	ldr r1, _080B56A8 @ =gPal + 0x340
	ldr r2, _080B56AC @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r7, #0x58]
	movs r1, #0xa
	bl sub_806EA0C
	movs r1, #1
	strb r1, [r6, #8]
	ldrb r0, [r6, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
_080B569C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B56A4: .4byte gUnk_08DB0F24
_080B56A8: .4byte gPal + 0x340
_080B56AC: .4byte 0x01000008

	thumb_func_start sub_80B56B0
sub_80B56B0: @ 0x080B56B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080B571C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r4, r1, r0
	cmp r5, #0
	beq _080B5714
	ldr r6, [r4, #4]
	cmp r6, #0
	beq _080B5714
	ldrb r1, [r4, #9]
	lsls r0, r1, #5
	ldr r1, _080B5720 @ =gPal + 0x200
	adds r0, r0, r1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x58]
	movs r1, #0xa
	bl sub_806EA0C
	movs r1, #0xff
	ldrb r0, [r4, #8]
	orrs r0, r1
	strb r0, [r4, #8]
	ldrb r0, [r4, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0x20
	strb r0, [r1]
_080B5714:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B571C: .4byte gUnk_08DB0F24
_080B5720: .4byte gPal + 0x200

	thumb_func_start sub_80B5724
sub_80B5724: @ 0x080B5724
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	mov sl, r3
	ldr r0, _080B577C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r4, r0, #0
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r4, #0x34]
	adds r1, r1, r0
	str r1, [sp, #4]
	movs r1, #0xf0
	lsls r1, r1, #0xc
	mov r2, sl
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57CC
	cmp r1, r0
	bhi _080B578A
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	beq _080B57BA
	cmp r1, r0
	bhi _080B5780
	movs r0, #0x80
	lsls r0, r0, #9
	cmp r1, r0
	beq _080B57B2
	b _080B57EA
	.align 2, 0
_080B577C: .4byte gUnk_08DB0F24
_080B5780:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	cmp r1, r0
	beq _080B57C2
	b _080B57EA
_080B578A:
	movs r0, #0xc0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57DE
	cmp r1, r0
	bhi _080B57A0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57D6
	b _080B57EA
_080B57A0:
	movs r0, #0xe0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57E4
	movs r0, #0x80
	lsls r0, r0, #0xc
	cmp r1, r0
	beq _080B57E8
	b _080B57EA
_080B57B2:
	subs r7, #8
	movs r0, #8
	add r8, r0
	b _080B57EA
_080B57BA:
	adds r7, #8
	movs r1, #8
	add r8, r1
	b _080B57EA
_080B57C2:
	subs r7, #8
	movs r2, #8
	rsbs r2, r2, #0
	add r8, r2
	b _080B57EA
_080B57CC:
	adds r7, #8
	movs r0, #8
	rsbs r0, r0, #0
	add r8, r0
	b _080B57EA
_080B57D6:
	movs r1, #0xe
	rsbs r1, r1, #0
	add r8, r1
	b _080B57EA
_080B57DE:
	movs r2, #0xe
	add r8, r2
	b _080B57EA
_080B57E4:
	subs r7, #0xe
	b _080B57EA
_080B57E8:
	adds r7, #0xe
_080B57EA:
	ldr r1, [sp, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _080B58A4
	ldr r0, _080B58A0 @ =gUnk_08DB0EE4
	adds r1, r4, #0
	bl Proc_Start
	adds r6, r0, #0
	ldr r1, [r4, #0x34]
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	str r6, [r1]
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	movs r3, #0xa0
	lsls r3, r3, #2
	mov r0, sl
	lsrs r4, r0, #0xd
	movs r0, #3
	ands r0, r4
	adds r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl StartMuInternal
	str r0, [r6, #0x58]
	bl sub_806E2A0
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	ldr r0, [r6, #0x58]
	movs r1, #2
	bl SetMuFacing
	ldr r0, [r6, #0x58]
	bl sub_806C474
	adds r0, r6, #0
	adds r0, #0x2b
	mov r1, sl
	strb r1, [r0]
	movs r0, #3
	ands r4, r0
	adds r4, #0xc
	adds r5, r6, #0
	adds r5, #0x2c
	strb r4, [r5]
	ldr r0, [r6, #0x58]
	adds r0, #0x46
	movs r2, #0
	mov ip, r2
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r0]
	ldr r1, [r6, #0x58]
	ldr r3, [r1, #0x30]
	ldr r2, [r1, #0x34]
	movs r0, #0xf
	ldrb r4, [r2, #1]
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r2, [r2, #2]
	adds r0, r2, r0
	adds r1, #0x46
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r3, #0x22]
	adds r0, r6, #0
	adds r0, #0x4a
	strh r7, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	ldrb r0, [r5]
	ldr r2, [sp, #4]
	strb r0, [r2, #9]
	mov r4, ip
	strb r4, [r2, #8]
	mov r0, sb
	bl sub_80B5648
	b _080B58B4
	.align 2, 0
_080B58A0: .4byte gUnk_08DB0EE4
_080B58A4:
	ldr r1, [r4, #0x34]
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r6, [r1]
_080B58B4:
	ldr r0, [r6, #0x58]
	ldr r2, [r0, #0x30]
	mov r4, sl
	lsrs r0, r4, #0xa
	movs r1, #3
	ands r0, r1
	adds r0, #6
	strh r0, [r2, #0x1e]
	str r4, [r6, #0x54]
	adds r2, r6, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	lsls r1, r0, #1
	adds r0, r6, #0
	adds r0, #0x2e
	adds r0, r0, r1
	strh r7, [r0]
	ldrb r4, [r2]
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B58FC
sub_80B58FC: @ 0x080B58FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5930 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5928
	bl Proc_End
	ldr r0, [r5, #0x34]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080B5928:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5930: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5934
sub_80B5934: @ 0x080B5934
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B596C @ =gUnk_08DB0F24
	bl Proc_Find
	cmp r0, #0
	beq _080B5964
	ldr r1, [r0, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5964
	ldr r0, [r0, #0x58]
	ldr r1, [r0, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1, #0x22]
	orrs r0, r2
	strh r0, [r1, #0x22]
_080B5964:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B596C: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5970
sub_80B5970: @ 0x080B5970
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B59A8 @ =gUnk_08DB0F24
	bl Proc_Find
	cmp r0, #0
	beq _080B59A0
	ldr r1, [r0, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B59A0
	ldr r0, [r0, #0x58]
	ldr r1, [r0, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1, #0x22]
	orrs r0, r2
	strh r0, [r1, #0x22]
_080B59A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B59A8: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B59AC
sub_80B59AC: @ 0x080B59AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	ldr r0, _080B5A3C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r6, r0, #0
	ldr r1, [r6, #0x38]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
	adds r1, r1, r5
	strh r7, [r1, #0x2c]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x2e]
	ldr r0, [r6, #0x38]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	bne _080B5A2C
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080B5A40 @ =gAnims
	movs r2, #4
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, _080B5A44 @ =gUnk_0844C5A0
	movs r3, #0xf
	mov r4, sb
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #1
	str r4, [sp]
	movs r4, #7
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x38]
	adds r1, #0x30
	adds r1, r1, r5
	str r0, [r1]
_080B5A2C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5A3C: .4byte gUnk_08DB0F24
_080B5A40: .4byte gAnims
_080B5A44: .4byte gUnk_0844C5A0

	thumb_func_start sub_80B5A48
sub_80B5A48: @ 0x080B5A48
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5A7C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5A6A
	bl EndSpriteAnimProc
_080B5A6A:
	ldr r0, [r5, #0x38]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5A7C: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5A80
sub_80B5A80: @ 0x080B5A80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _080B5B28 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r6, r0, #0
	ldr r1, [r6, #0x3c]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
	adds r1, r1, r5
	mov r0, r8
	strh r0, [r1, #0x2c]
	ldr r0, [r6, #0x3c]
	adds r0, r0, r5
	mov r1, sb
	strh r1, [r0, #0x2e]
	ldr r0, [r6, #0x3c]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r7, [r0]
	cmp r7, #0
	bne _080B5B16
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080B5B2C @ =gAnims
	movs r4, #4
	ldrsh r0, [r3, r4]
	subs r1, r1, r0
	mov r0, sb
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, _080B5B30 @ =gUnk_0844C5A0
	movs r3, #0xf
	mov r4, sl
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r3, r3, r4
	str r7, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x3c]
	adds r1, #0x30
	adds r1, r1, r5
	str r0, [r1]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x2c]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r2, sb
	strh r2, [r0, #0x2e]
_080B5B16:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B28: .4byte gUnk_08DB0F24
_080B5B2C: .4byte gAnims
_080B5B30: .4byte gUnk_0844C5A0

	thumb_func_start sub_80B5B34
sub_80B5B34: @ 0x080B5B34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5B68 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x3c]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5B56
	bl EndSpriteAnimProc
_080B5B56:
	ldr r0, [r5, #0x3c]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B68: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5B6C
sub_80B5B6C: @ 0x080B5B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	adds r6, r4, #0
	ldr r0, _080B5C08 @ =gUnk_08DB0F24
	bl Proc_Find
	mov r8, r0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x2c
	mov r2, r8
	ldr r1, [r2, #0x40]
	adds r5, r1, r0
	ldr r2, _080B5C0C @ =0x030027CC
	ldr r0, _080B5C10 @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	ldr r1, _080B5C14 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _080B5C96
	movs r0, #0xff
	ands r0, r4
	strh r0, [r5]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r4
	adds r0, r0, r1
	strh r0, [r5, #2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	ldr r1, _080B5C18 @ =0x00000442
	cmp r0, #0
	beq _080B5BD4
	adds r1, #1
_080B5BD4:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _080B5BE4
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_080B5BE4:
	str r1, [sp]
	adds r0, r7, #0
	mov r1, sb
	movs r3, #0x28
	bl StartBmFace
	adds r2, r0, #0
	str r2, [r5, #4]
	movs r1, #0xc0
	lsls r1, r1, #7
	adds r0, r4, #0
	ands r0, r1
	cmp r0, r1
	bne _080B5C1C
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #6
	b _080B5C46
	.align 2, 0
_080B5C08: .4byte gUnk_08DB0F24
_080B5C0C: .4byte 0x030027CC
_080B5C10: .4byte 0x0000FFE0
_080B5C14: .4byte 0x0000E0FF
_080B5C18: .4byte 0x00000442
_080B5C1C:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _080B5C2E
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #5
	b _080B5C46
_080B5C2E:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r6, r0
	cmp r6, #0
	beq _080B5C40
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #4
	b _080B5C46
_080B5C40:
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #3
_080B5C46:
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r6, #0
	movs r0, #1
	strb r0, [r5, #8]
	mov r1, r8
	adds r1, #0x44
	movs r0, #2
	strb r0, [r1]
	mov r4, r8
	adds r4, #0x45
	ldrb r1, [r4]
	cmp r1, #0x20
	bne _080B5C96
	strb r6, [r4]
	ldr r3, _080B5CA4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #0x10
	ldrb r4, [r4]
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_080B5C96:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5CA4: .4byte gDispIo

	thumb_func_start sub_80B5CA8
sub_80B5CA8: @ 0x080B5CA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _080B5D54 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r7, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r7, #0x40]
	adds r5, r1, r0
	ldr r6, _080B5D58 @ =0x030027CC
	ldr r0, _080B5D5C @ =0x0000FFE0
	ldrh r1, [r6]
	ands r0, r1
	ldr r1, _080B5D60 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6]
	ldr r4, [r5, #4]
	cmp r4, #0
	beq _080B5D48
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	ldrh r1, [r5, #2]
	ands r0, r1
	cmp r0, #0
	bne _080B5D48
	adds r0, r4, #0
	bl GetFaceDisp
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r0
	adds r0, r4, #0
	bl SetFaceDisp
	movs r0, #0xff
	lsls r0, r0, #8
	mov r2, sb
	ands r0, r2
	add r0, r8
	strh r0, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #8]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0xfe
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B5D48
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #0x3f
	ldrb r2, [r6]
	ands r0, r2
	strb r0, [r6]
	ldrb r2, [r1]
	lsrs r0, r2, #1
	strb r0, [r6, #8]
	ldrb r1, [r1]
	lsrs r1, r1, #1
	movs r0, #0x10
	subs r0, r0, r1
	strb r0, [r6, #9]
	movs r0, #0
	strb r0, [r6, #0xa]
_080B5D48:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D54: .4byte gUnk_08DB0F24
_080B5D58: .4byte 0x030027CC
_080B5D5C: .4byte 0x0000FFE0
_080B5D60: .4byte 0x0000E0FF

	thumb_func_start sub_80B5D64
sub_80B5D64: @ 0x080B5D64
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B5D74 @ =gUnk_08DB0F24
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B5D74: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5D78
sub_80B5D78: @ 0x080B5D78
	push {lr}
	ldr r0, _080B5D84 @ =gUnk_08DB0F24
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B5D84: .4byte gUnk_08DB0F24

	thumb_func_start nullsub_5
nullsub_5: @ 0x080B5D88
	bx lr
	.align 2, 0

	thumb_func_start nullsub_6
nullsub_6: @ 0x080B5D8C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_4
nullsub_4: @ 0x080B5D90
	bx lr
	.align 2, 0

	thumb_func_start nullsub_3
nullsub_3: @ 0x080B5D94
	bx lr
	.align 2, 0

	thumb_func_start sub_80B5D98
sub_80B5D98: @ 0x080B5D98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080B5DB8 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_80B45DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DB8: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B5DBC
sub_80B5DBC: @ 0x080B5DBC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r0, _080B5E00 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080B5DF8
	bl sub_80B41F0
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	bl sub_80B41FC
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x50
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	strh r7, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080B5DF8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E00: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B5E04
sub_80B5E04: @ 0x080B5E04
	push {r4, lr}
	adds r4, r0, #0
	bl EndTalk
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #2
	bl InitSpriteTalk
	ldr r0, _080B5E4C @ =0x02000815
	ldrb r0, [r0]
	lsrs r1, r0, #3
	adds r1, #1
	movs r0, #1
	adds r2, r4, #0
	bl StartTalkMsg
	movs r0, #4
	bl sub_8007F68
	movs r0, #0x20
	bl SetTalkFlag
	movs r0, #0x80
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetTalkFlag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E4C: .4byte 0x02000815

	thumb_func_start sub_80B5E50
sub_80B5E50: @ 0x080B5E50
	push {r4, lr}
	sub sp, #0x20
	mov r1, sp
	ldr r0, _080B5ED8 @ =gUnk_08622C24
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0
	bl InitBgs
	ldr r4, _080B5EDC @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	bl InitFaces
	mov r0, sp
	bl SetFaceConfig
	bl ResetUnitSprites
	bl MU_Init
	bl ApplyUnitSpritePalettes
	ldr r1, _080B5EE0 @ =gBmSt
	movs r0, #0
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	subs r0, #2
	ldrb r2, [r4, #1]
	ands r0, r2
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
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5ED8: .4byte gUnk_08622C24
_080B5EDC: .4byte gDispIo
_080B5EE0: .4byte gBmSt

	thumb_func_start sub_80B5EE4
sub_80B5EE4: @ 0x080B5EE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r0, #0x40
	movs r5, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #0xc
	strb r5, [r0]
	ldr r7, _080B6050 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #4
	orrs r0, r2
	subs r1, #6
	ands r0, r1
	movs r3, #0x10
	mov sb, r3
	mov r1, sb
	orrs r0, r1
	strb r0, [r7, #1]
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	bl sub_80B4050
	movs r0, #0x3c
	adds r0, r0, r7
	mov r8, r0
	movs r6, #0x3f
	adds r0, r6, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, _080B6054 @ =0x030027D4
	strb r0, [r3]
	ldr r0, _080B6058 @ =0x030027D5
	strb r5, [r0]
	movs r1, #0x46
	adds r1, r1, r7
	mov sl, r1
	strb r5, [r1]
	ldr r0, _080B605C @ =gUnk_0844C614
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B6060 @ =gUnk_0844F1E8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B6064 @ =Pal_MiscUiGraphics
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B6068 @ =gUnk_0844C9E8
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B606C @ =gUnk_0844C0B8
	ldr r1, _080B6070 @ =0x06015000
	bl Decompress
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r7, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r3, #0x36
	adds r3, r3, r7
	mov ip, r3
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r2, #4
	orrs r0, r2
	movs r1, #8
	orrs r0, r1
	mov r3, sb
	orrs r0, r3
	adds r3, r7, #0
	adds r3, #0x34
	movs r2, #0x20
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	adds r3, #1
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	orrs r0, r2
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBlankBgColor
	mov r2, r8
	ldrb r2, [r2]
	ands r6, r2
	mov r3, r8
	strb r6, [r3]
	ldr r0, _080B6054 @ =0x030027D4
	strb r5, [r0]
	ldr r1, _080B6058 @ =0x030027D5
	strb r5, [r1]
	mov r2, sl
	strb r5, [r2]
	ldr r0, _080B6074 @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	ldr r1, _080B6078 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, _080B607C @ =0x02000814
	strb r5, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B6080 @ =sub_80B45FC
	bl SetOnHBlankA
	adds r0, r4, #0
	bl sub_80B4A3C
	adds r0, r4, #0
	bl sub_80B4BDC
	adds r0, r4, #0
	bl sub_80B5D64
	ldr r1, [r4, #0x2c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B608C
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080B6084
	movs r0, #1
	movs r1, #0
	bl NewFadeIn
	b _080B608C
	.align 2, 0
_080B6050: .4byte gDispIo
_080B6054: .4byte 0x030027D4
_080B6058: .4byte 0x030027D5
_080B605C: .4byte gUnk_0844C614
_080B6060: .4byte gUnk_0844F1E8
_080B6064: .4byte Pal_MiscUiGraphics
_080B6068: .4byte gUnk_0844C9E8
_080B606C: .4byte gUnk_0844C0B8
_080B6070: .4byte 0x06015000
_080B6074: .4byte 0x0000FFE0
_080B6078: .4byte 0x0000E0FF
_080B607C: .4byte 0x02000814
_080B6080: .4byte sub_80B45FC
_080B6084:
	movs r0, #2
	movs r1, #0
	bl NewFadeIn
_080B608C:
	movs r0, #0
	bl sub_80B3DE4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B60A0
sub_80B60A0: @ 0x080B60A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankB
	movs r0, #0
	bl SetOnHBlankA
	bl EndTalk
	bl sub_800968C
	bl ResetUnitSprites
	ldr r2, _080B60E8 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, #0x46
	movs r0, #0x10
	strb r0, [r2]
	adds r4, #0x54
	strb r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B60E8: .4byte gDispIo

	thumb_func_start nullsub_89
nullsub_89: @ 0x080B60EC
	bx lr
	.align 2, 0

	thumb_func_start sub_80B60F0
sub_80B60F0: @ 0x080B60F0
	push {lr}
	ldr r0, [r0, #0x2c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080B615A
	bl InitScanlineEffect
	ldr r0, _080B6160 @ =sub_8078030
	bl SetOnHBlankB
	movs r0, #0
	bl sub_8077E50
	ldr r0, _080B6164 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080B6168 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080B616C @ =0x0000E0FF
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080B615A:
	pop {r0}
	bx r0
	.align 2, 0
_080B6160: .4byte sub_8078030
_080B6164: .4byte gDispIo
_080B6168: .4byte 0x0000FFE0
_080B616C: .4byte 0x0000E0FF

	thumb_func_start sub_80B6170
sub_80B6170: @ 0x080B6170
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0x30
	ldr r0, [r5, #0x2c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B618A
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #2
	b _080B6192
_080B618A:
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #1
_080B6192:
	strh r1, [r0]
	adds r2, r0, #0
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B61A6
	ldrh r2, [r2]
	lsrs r4, r2, #1
	b _080B61A8
_080B61A6:
	ldrh r4, [r2]
_080B61A8:
	movs r7, #8
	ands r1, r7
	cmp r1, #0
	beq _080B61CC
	subs r1, r6, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r1, r6, #0
	muls r1, r6, r1
	bl __divsi3
	adds r1, r0, #0
	movs r0, #0x70
	subs r0, r0, r1
	bl sub_8077E50
_080B61CC:
	cmp r4, r6
	bne _080B622C
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, [r5, #0x2c]
	ands r0, r7
	cmp r0, #0
	beq _080B622C
	movs r0, #0
	bl SetOnHBlankB
	ldr r3, _080B6234 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _080B6238 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _080B623C @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
_080B622C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6234: .4byte gDispIo
_080B6238: .4byte 0x0000FFE0
_080B623C: .4byte 0x0000E0FF

	thumb_func_start sub_80B6240
sub_80B6240: @ 0x080B6240
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x54
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80B6250
sub_80B6250: @ 0x080B6250
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	bl sub_80B41F0
	mov r8, r0
	bl sub_80B41FC
	adds r7, r0, #0
	mov r5, r8
	adds r3, r7, #0
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bgt _080B62F8
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	ldr r6, _080B6310 @ =0x0000FFFF
_080B627C:
	ldrh r2, [r1]
	ldrh r3, [r4, #0x34]
	adds r0, r2, r3
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, ip
	subs r1, r3, r0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r3, [r0, r2]
	subs r0, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge _080B62A2
	subs r2, r0, r3
_080B62A2:
	adds r0, r2, #0
	muls r0, r1, r0
	muls r0, r1, r0
	cmp r0, #0
	bge _080B62AE
	adds r0, r0, r6
_080B62AE:
	asrs r0, r0, #0x10
	subs r5, r2, r0
	adds r0, r4, #0
	adds r0, #0x40
	movs r3, #0
	ldrsh r0, [r0, r3]
	mov r1, ip
	subs r2, r1, r0
	adds r0, r4, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r3, [r0, r1]
	subs r0, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r1, r3, r0
	cmp r1, #0
	bge _080B62D4
	subs r1, r0, r3
_080B62D4:
	adds r0, r1, #0
	muls r0, r2, r0
	muls r0, r2, r0
	cmp r0, #0
	bge _080B62E0
	adds r0, r0, r6
_080B62E0:
	asrs r0, r0, #0x10
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bgt _080B62F8
	cmp r5, r8
	bne _080B62F8
	cmp r3, r7
	beq _080B627C
_080B62F8:
	adds r0, r4, #0
	adds r0, #0x50
	adds r2, r4, #0
	adds r2, #0x4c
	movs r6, #0
	ldrsh r1, [r0, r6]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	ble _080B6314
	adds r5, r5, r0
	b _080B631A
	.align 2, 0
_080B6310: .4byte 0x0000FFFF
_080B6314:
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r5, r0, r5
_080B631A:
	adds r0, r4, #0
	adds r0, #0x52
	adds r2, r4, #0
	adds r2, #0x4e
	movs r6, #0
	ldrsh r1, [r0, r6]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	ble _080B6332
	adds r3, r3, r0
	b _080B6338
_080B6332:
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r3, r0, r3
_080B6338:
	mov r1, r8
	subs r0, r5, r1
	subs r1, r3, r7
	bl sub_80B4104
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl sub_80B4170
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080B6368
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
_080B6368:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B6374
sub_80B6374: @ 0x080B6374
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B63A8 @ =gUnk_08DB0F44
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x4a
	strb r4, [r1]
	strh r5, [r0, #0x30]
	strh r6, [r0, #0x32]
	mov r1, r8
	str r1, [r0, #0x2c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B63A8: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B63AC
sub_80B63AC: @ 0x080B63AC
	push {lr}
	ldr r0, _080B63D4 @ =ProcScr_BmFadeIN
	bl Proc_Find
	bl Proc_End
	ldr r0, _080B63D8 @ =gUnk_08DB0F44
	bl Proc_Find
	bl Proc_End
	bl ClearTalk
	bl EndEachSpriteAnimProc
	movs r0, #0
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
_080B63D4: .4byte ProcScr_BmFadeIN
_080B63D8: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B63DC
sub_80B63DC: @ 0x080B63DC
	push {lr}
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080B63FA
	ldr r0, _080B6400 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrh r0, [r0, #0x26]
	movs r1, #0
	bl StartBgm
_080B63FA:
	pop {r0}
	bx r0
	.align 2, 0
_080B6400: .4byte gPlaySt

	thumb_func_start StartWorldMapEvent
StartWorldMapEvent: @ 0x080B6404
	push {r4, r5, lr}
	ldr r5, _080B643C @ =gWorldMapEvents
	ldr r4, _080B6440 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B6436
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl StartEvent
_080B6436:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B643C: .4byte gWorldMapEvents
_080B6440: .4byte gPlaySt

	thumb_func_start sub_80B6444
sub_80B6444: @ 0x080B6444
	push {lr}
	movs r0, #4
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_80B6450
sub_80B6450: @ 0x080B6450
	push {lr}
	bl sub_8004110
	bl sub_80B5D78
	movs r0, #0
	bl sub_80B3DE4
	pop {r0}
	bx r0

	thumb_func_start sub_80B6464
sub_80B6464: @ 0x080B6464
	push {lr}
	ldr r0, _080B6478 @ =gUnk_08DB0F44
	bl Proc_Find
	cmp r0, #0
	beq _080B6472
	movs r0, #1
_080B6472:
	pop {r1}
	bx r1
	.align 2, 0
_080B6478: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B647C
sub_80B647C: @ 0x080B647C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080B648C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _080B657A
_080B648C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _080B6574
	lsls r0, r0, #2
	ldr r1, _080B64A0 @ =_080B64A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B64A0: .4byte _080B64A4
_080B64A4: @ jump table
	.4byte _080B64D8 @ case 0
	.4byte _080B64E6 @ case 1
	.4byte _080B64EE @ case 2
	.4byte _080B64F8 @ case 3
	.4byte _080B6500 @ case 4
	.4byte _080B6516 @ case 5
	.4byte _080B652C @ case 6
	.4byte _080B653C @ case 7
	.4byte _080B654A @ case 8
	.4byte _080B655E @ case 9
	.4byte _080B6556 @ case 10
	.4byte _080B656E @ case 11
	.4byte _080B6566 @ case 12
_080B64D8:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x44]
	bl sub_80B5724
	b _080B6574
_080B64E6:
	ldr r0, [r4, #0x34]
	bl sub_80B58FC
	b _080B6574
_080B64EE:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	bl sub_80B4810
	b _080B6574
_080B64F8:
	ldr r0, [r4, #0x34]
	bl sub_80B4934
	b _080B6574
_080B6500:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl sub_80B59AC
	b _080B6574
_080B6516:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl sub_80B5A80
	b _080B6574
_080B652C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_80B5B6C
	b _080B6574
_080B653C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_80B5CA8
	b _080B6574
_080B654A:
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	bl sub_80B5DBC
	b _080B6574
_080B6556:
	ldr r0, [r4, #0x44]
	bl sub_80B6664
	b _080B6574
_080B655E:
	ldr r0, [r4, #0x44]
	bl sub_80B6754
	b _080B6574
_080B6566:
	ldr r0, [r4, #0x44]
	bl sub_80B56B0
	b _080B6574
_080B656E:
	ldr r0, [r4, #0x44]
	bl sub_80B5648
_080B6574:
	adds r0, r4, #0
	bl Proc_Break
_080B657A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B6580
sub_80B6580: @ 0x080B6580
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B65C4 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B65C8 @ =gUnk_08DB1004
	bl Proc_Start
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r4, [r1]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x38]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B65C4: .4byte gUnk_08DB0F44
_080B65C8: .4byte gUnk_08DB1004

	thumb_func_start sub_80B65CC
sub_80B65CC: @ 0x080B65CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080B6660 @ =gPal + 0x2
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov sb, r1
	movs r1, #0x20
	subs r3, r1, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080B6602:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	rsbs r7, r7, #0
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080B6602
	bl EnablePalSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080B6650
	adds r0, r6, #0
	bl Proc_Break
_080B6650:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6660: .4byte gPal + 0x2

	thumb_func_start sub_80B6664
sub_80B6664: @ 0x080B6664
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B66B0 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B66B4 @ =gUnk_08DB101C
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080B66B8 @ =Pal_UnitSprites
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _080B66BC @ =gPal
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080B669A:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080B669A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B66B0: .4byte gUnk_08DB0F44
_080B66B4: .4byte gUnk_08DB101C
_080B66B8: .4byte Pal_UnitSprites
_080B66BC: .4byte gPal

	thumb_func_start sub_80B66C0
sub_80B66C0: @ 0x080B66C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080B6750 @ =gPal + 0x2
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov sb, r1
	adds r3, r0, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080B66F4:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	rsbs r7, r7, #0
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080B66F4
	bl EnablePalSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080B6742
	adds r0, r6, #0
	bl Proc_Break
_080B6742:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6750: .4byte gPal + 0x2

	thumb_func_start sub_80B6754
sub_80B6754: @ 0x080B6754
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B67A0 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B67A4 @ =gUnk_08DB1034
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080B67A8 @ =Pal_UnitSprites
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _080B67AC @ =gPal
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080B678A:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080B678A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B67A0: .4byte gUnk_08DB0F44
_080B67A4: .4byte gUnk_08DB1034
_080B67A8: .4byte Pal_UnitSprites
_080B67AC: .4byte gPal

	thumb_func_start sub_80B67B0
sub_80B67B0: @ 0x080B67B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	mov sb, r1
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _080B6898 @ =0x030027CC
	mov ip, r2
	ldr r0, _080B689C @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	movs r1, #0xf
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	mov r5, sb
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r6, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	add r0, ip
	mov sl, r0
	ldrb r0, [r0]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r7]
	ands r0, r3
	strb r0, [r7]
	movs r1, #1
	mov r5, sl
	ldrb r0, [r5]
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	mov r8, r3
	mov r5, r8
	orrs r0, r5
	movs r3, #8
	orrs r0, r3
	movs r3, #0x10
	orrs r0, r3
	mov r5, sl
	strb r0, [r5]
	ldrb r0, [r7]
	orrs r1, r0
	orrs r1, r4
	mov r5, r8
	orrs r1, r5
	movs r0, #8
	orrs r1, r0
	orrs r1, r3
	strb r1, [r7]
	mov r1, sl
	ldrb r1, [r1]
	orrs r6, r1
	mov r3, sl
	strb r6, [r3]
	ldrb r5, [r7]
	ands r2, r5
	strb r2, [r7]
	movs r0, #0x3f
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	strb r0, [r2]
	mov r3, sb
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strb r3, [r2, #0xa]
	bl sub_8077C1C
	ldr r0, _080B68A0 @ =0x02000814
	ldrb r5, [r0]
	orrs r4, r5
	strb r4, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6898: .4byte 0x030027CC
_080B689C: .4byte 0x0000FFE0
_080B68A0: .4byte 0x02000814

	thumb_func_start sub_80B68A4
sub_80B68A4: @ 0x080B68A4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x18
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r5, #0xe1
	lsls r5, r5, #4
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	ldr r0, [r7, #0x30]
	ldr r2, _080B6918 @ =gAnims
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	ldr r1, [r7, #0x34]
	subs r1, #1
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_8077E1C
	ldr r3, _080B691C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x3c
	blt _080B6912
	str r1, [r7, #0x2c]
_080B6912:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6918: .4byte gAnims
_080B691C: .4byte gDispIo

	thumb_func_start sub_80B6920
sub_80B6920: @ 0x080B6920
	ldr r1, _080B695C @ =0x02000814
	movs r0, #0xfd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r2, _080B6960 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	subs r0, #0x21
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080B695C: .4byte 0x02000814
_080B6960: .4byte gDispIo

	thumb_func_start sub_80B6964
sub_80B6964: @ 0x080B6964
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _080B6984 @ =gUnk_08DB104C
	ldr r0, _080B6988 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r4, #0
	bl Proc_Start
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6984: .4byte gUnk_08DB104C
_080B6988: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B698C
sub_80B698C: @ 0x080B698C
	push {lr}
	ldr r0, _080B699C @ =gUnk_08DB104C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B699C: .4byte gUnk_08DB104C

	thumb_func_start sub_80B69A0
sub_80B69A0: @ 0x080B69A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	blt _080B6A04
	cmp r5, #0
	blt _080B6A04
	cmp r6, #0x7f
	bgt _080B6A04
	cmp r5, #0x55
	bgt _080B6A04
	ldr r1, _080B6A0C @ =gUnk_08DB10A4
	asrs r3, r6, #5
	lsls r3, r3, #2
	asrs r0, r5, #5
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r1, r3, r1
	ldr r4, [r1]
	movs r2, #0x1f
	adds r1, r2, #0
	ands r1, r5
	subs r0, r2, r1
	lsls r0, r0, #6
	adds r0, #2
	adds r4, r4, r0
	ands r2, r6
	lsls r0, r2, #1
	adds r4, r4, r0
	ldr r5, _080B6A10 @ =gBg3Tm
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r4]
	strh r2, [r0]
	ldr r0, _080B6A14 @ =gUnk_08DB1074
	adds r3, r3, r0
	ldr r0, [r3]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r2, _080B6A18 @ =0x06008000
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	bl EnableBgSync
_080B6A04:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6A0C: .4byte gUnk_08DB10A4
_080B6A10: .4byte gBg3Tm
_080B6A14: .4byte gUnk_08DB1074
_080B6A18: .4byte 0x06008000

	thumb_func_start sub_80B6A1C
sub_80B6A1C: @ 0x080B6A1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	str r3, [sp]
	cmp r0, #0
	bge _080B6A5A
	cmp r7, #0
	bge _080B6A5A
	movs r5, #0
_080B6A3A:
	movs r4, #0
	ldr r0, [sp]
	adds r7, r0, r5
	adds r6, r5, #1
_080B6A42:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r7, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, #0x1e
	ble _080B6A42
	adds r5, r6, #0
	cmp r5, #0x14
	ble _080B6A3A
	b _080B6B4E
_080B6A5A:
	ldr r0, [sp]
	cmp r0, r7
	bge _080B6AD0
	adds r5, r0, #0
	movs r1, #0x15
	adds r1, r1, r5
	mov sl, r1
_080B6A68:
	movs r4, #0
	adds r6, r5, #1
_080B6A6C:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, #0x1e
	ble _080B6A6C
	adds r5, r6, #0
	cmp r5, r7
	blt _080B6A68
	adds r5, r7, #0
	cmp r5, sl
	bge _080B6AA4
_080B6A88:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B6A9E
_080B6A90:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, sb
	blt _080B6A90
_080B6A9E:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B6A88
_080B6AA4:
	adds r5, r7, #0
	cmp r5, sl
	bge _080B6B4E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B6AB0:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B6AC8
_080B6ABA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, r7
	blt _080B6ABA
_080B6AC8:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B6AB0
	b _080B6B4E
_080B6AD0:
	adds r5, r7, #0
	adds r5, #0x15
	ldr r0, [sp]
	adds r0, #0x15
	mov sl, r0
	str r5, [sp, #4]
	cmp r5, sl
	bge _080B6AFA
_080B6AE0:
	movs r4, #0
	adds r6, r5, #1
_080B6AE4:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, #0x1e
	ble _080B6AE4
	adds r5, r6, #0
	cmp r5, sl
	blt _080B6AE0
_080B6AFA:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B6B20
_080B6B02:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B6B18
_080B6B0A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, sb
	blt _080B6B0A
_080B6B18:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B6B02
_080B6B20:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B6B4E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B6B2E:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B6B46
_080B6B38:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, r7
	blt _080B6B38
_080B6B46:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B6B2E
_080B6B4E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B6B60
sub_80B6B60: @ 0x080B6B60
	push {r4, r5, r6, lr}
	bl sub_80B7968
	adds r6, r0, #0
	ldr r0, [r6, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r4, #0
	ldr r5, _080B6BB4 @ =0x06008000
_080B6B82:
	ldr r0, [r6]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r5, #0
	bl Decompress
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #9
	ble _080B6B82
	ldr r0, _080B6BB8 @ =gBg3Tm
	ldr r1, [r6, #4]
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6BB4: .4byte 0x06008000
_080B6BB8: .4byte gBg3Tm

	thumb_func_start sub_80B6BBC
sub_80B6BBC: @ 0x080B6BBC
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r0, #1
	beq _080B6BD6
	cmp r0, #1
	bgt _080B6BD0
	cmp r0, #0
	beq _080B6C04
	b _080B6C80
_080B6BD0:
	cmp r0, #2
	beq _080B6C3C
	b _080B6C80
_080B6BD6:
	ldr r0, _080B6C00 @ =gUnk_085AE7BC
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	lsls r1, r4, #3
	movs r0, #0xff
	ands r1, r0
	lsls r2, r5, #3
	ands r2, r0
	movs r0, #3
	bl SetBgOffset
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80B6A1C
	b _080B6C86
	.align 2, 0
_080B6C00: .4byte gUnk_085AE7BC
_080B6C04:
	ldr r0, _080B6C28 @ =gUnk_0860A86C
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B6C2C @ =gUnk_0860A8EC
	ldr r1, _080B6C30 @ =0x06008000
	bl Decompress
	ldr r0, _080B6C34 @ =gBg3Tm
	ldr r1, _080B6C38 @ =gUnk_0860F964
	b _080B6C5C
	.align 2, 0
_080B6C28: .4byte gUnk_0860A86C
_080B6C2C: .4byte gUnk_0860A8EC
_080B6C30: .4byte 0x06008000
_080B6C34: .4byte gBg3Tm
_080B6C38: .4byte gUnk_0860F964
_080B6C3C:
	ldr r0, _080B6C6C @ =gUnk_0860FE18
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B6C70 @ =gUnk_0860FE98
	ldr r1, _080B6C74 @ =0x06008000
	bl Decompress
	ldr r0, _080B6C78 @ =gBg3Tm
	ldr r1, _080B6C7C @ =gUnk_086151B8
_080B6C5C:
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	b _080B6C86
	.align 2, 0
_080B6C6C: .4byte gUnk_0860FE18
_080B6C70: .4byte gUnk_0860FE98
_080B6C74: .4byte 0x06008000
_080B6C78: .4byte gBg3Tm
_080B6C7C: .4byte gUnk_086151B8
_080B6C80:
	subs r0, #3
	bl sub_80B6B60
_080B6C86:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B6C8C
sub_80B6C8C: @ 0x080B6C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	ldr r0, _080B6D4C @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r2, #0x20
	bl CpuFastSet
	cmp r4, #1
	bne _080B6D64
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
	movs r3, #0
_080B6CB8:
	mov r0, sl
	adds r6, r0, r7
	mov r1, r8
	ands r6, r1
	movs r5, #0
	ldr r2, _080B6D50 @ =0x06001000
	adds r4, r3, r2
_080B6CC6:
	mov r1, sb
	adds r0, r1, r5
	mov r2, r8
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _080B6D54 @ =0x06008000
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #8
	str r3, [sp]
	bl CpuFastSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp]
	cmp r5, #0x1d
	ble _080B6CC6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r3, r3, r2
	adds r7, #1
	cmp r7, #0x13
	ble _080B6CB8
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
_080B6CFE:
	mov r1, sl
	adds r0, r1, r7
	mov r2, r8
	ands r0, r2
	movs r5, #0
	adds r4, r7, #1
	lsls r1, r7, #5
	mov ip, r1
	lsls r6, r0, #5
	lsls r0, r7, #6
	ldr r2, _080B6D58 @ =gBg2Tm
	adds r3, r0, r2
_080B6D16:
	mov r7, sb
	adds r0, r7, r5
	mov r1, r8
	ands r0, r1
	mov r7, ip
	adds r2, r7, r5
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, _080B6D5C @ =gBg3Tm
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	adds r1, #0x80
	adds r2, r2, r1
	ldr r7, _080B6D60 @ =0xFFFF8000
	adds r2, r2, r7
	strh r2, [r3]
	adds r3, #2
	adds r5, #1
	cmp r5, #0x1d
	ble _080B6D16
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B6CFE
	b _080B6D9E
	.align 2, 0
_080B6D4C: .4byte gPal
_080B6D50: .4byte 0x06001000
_080B6D54: .4byte 0x06008000
_080B6D58: .4byte gBg2Tm
_080B6D5C: .4byte gBg3Tm
_080B6D60: .4byte 0xFFFF8000
_080B6D64:
	ldr r0, _080B6DB8 @ =0x06008000
	ldr r1, _080B6DBC @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	movs r7, #0
	ldr r0, _080B6DC0 @ =gBg2Tm
	mov r8, r0
	ldr r6, _080B6DC4 @ =gBg3Tm
	ldr r1, _080B6DC8 @ =0x00008080
	adds r3, r1, #0
_080B6D7C:
	adds r4, r7, #1
	lsls r0, r7, #6
	adds r2, r0, r6
	mov r5, r8
	adds r1, r0, r5
	movs r5, #0x1d
_080B6D88:
	ldrh r7, [r2]
	adds r0, r3, r7
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bge _080B6D88
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B6D7C
_080B6D9E:
	bl EnablePalSync
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6DB8: .4byte 0x06008000
_080B6DBC: .4byte 0x06001000
_080B6DC0: .4byte gBg2Tm
_080B6DC4: .4byte gBg3Tm
_080B6DC8: .4byte 0x00008080

	thumb_func_start sub_80B6DCC
sub_80B6DCC: @ 0x080B6DCC
	push {lr}
	ldr r0, _080B6DDC @ =gUnk_08DB0F44
	bl Proc_Find
	cmp r0, #0
	bne _080B6DE0
	movs r0, #0
	b _080B6DE8
	.align 2, 0
_080B6DDC: .4byte gUnk_08DB0F44
_080B6DE0:
	adds r0, #0x54
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080B6DE8:
	pop {r1}
	bx r1

	thumb_func_start sub_80B6DEC
sub_80B6DEC: @ 0x080B6DEC
	ldr r0, _080B6E2C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B6DFC
	movs r3, #0
_080B6DFC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B6E28
	ldr r1, _080B6E30 @ =0x02000814
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B6E28
	ldr r1, _080B6E34 @ =gManimActiveScanlineBuf
	cmp r3, #0
	bne _080B6E1C
	ldr r0, _080B6E38 @ =gManimScanlineBufs
	ldr r0, [r0]
	str r0, [r1]
_080B6E1C:
	ldr r2, _080B6E3C @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B6E28:
	bx lr
	.align 2, 0
_080B6E2C: .4byte 0x04000006
_080B6E30: .4byte 0x02000814
_080B6E34: .4byte gManimActiveScanlineBuf
_080B6E38: .4byte gManimScanlineBufs
_080B6E3C: .4byte 0x04000040

	thumb_func_start sub_80B6E40
sub_80B6E40: @ 0x080B6E40
	push {r4, lr}
	adds r4, r0, #0
	bl ClearTalk
	ldr r0, _080B6E84 @ =gUnk_0860A86C
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B6E88 @ =gUnk_0860A8EC
	ldr r1, _080B6E8C @ =0x06008000
	bl Decompress
	ldr r0, _080B6E90 @ =gBg3Tm
	ldr r1, _080B6E94 @ =gUnk_0860F964
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0xb4
	str r0, [r4, #0x30]
	movs r0, #0x60
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E84: .4byte gUnk_0860A86C
_080B6E88: .4byte gUnk_0860A8EC
_080B6E8C: .4byte 0x06008000
_080B6E90: .4byte gBg3Tm
_080B6E94: .4byte gUnk_0860F964

	thumb_func_start WorldFlushInit
WorldFlushInit: @ 0x080B6E98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _080B6F84 @ =0x030027CC
	mov ip, r2
	ldr r0, _080B6F88 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	mov r8, r0
	mov r0, r8
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #8
	rsbs r2, r2, #0
	add r2, ip
	mov sb, r2
	mov r1, r8
	ldrb r0, [r2]
	orrs r1, r0
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	mov sl, r2
	mov r0, sl
	ldrb r2, [r7]
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r3, #2
	orrs r1, r3
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r3
	orrs r0, r5
	orrs r0, r4
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, sl
	ands r0, r1
	strb r0, [r7]
	movs r0, #0x3f
	mov r2, ip
	ldrb r2, [r2]
	ands r0, r2
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _080B6F8C @ =0x02000814
	ldrb r1, [r0]
	orrs r3, r1
	strb r3, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B6F90 @ =sub_80B6DEC
	bl SetOnHBlankA
	ldr r0, _080B6F94 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B6F74
	ldr r0, _080B6F98 @ =0x00000269
	bl m4aSongNumStart
_080B6F74:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6F84: .4byte 0x030027CC
_080B6F88: .4byte 0x0000FFE0
_080B6F8C: .4byte 0x02000814
_080B6F90: .4byte sub_80B6DEC
_080B6F94: .4byte gPlaySt
_080B6F98: .4byte 0x00000269

	thumb_func_start WorldFlushOut
WorldFlushOut: @ 0x080B6F9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0x96
	lsls r0, r0, #1
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #3
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x34]
	mov r2, r8
	bl sub_8077E1C
	ldr r3, _080B7014 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r4, #8
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _080B700A
	adds r0, r7, #0
	bl Proc_Break
_080B700A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7014: .4byte gDispIo

	thumb_func_start sub_80B7018
sub_80B7018: @ 0x080B7018
	push {lr}
	bl EndEachSpriteAnimProc
	ldr r3, _080B706C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080B706C: .4byte gDispIo

	thumb_func_start sub_80B7070
sub_80B7070: @ 0x080B7070
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B7080 @ =gUnk_08DB10D4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B7080: .4byte gUnk_08DB10D4

	thumb_func_start sub_80B7084
sub_80B7084: @ 0x080B7084
	ldr r1, _080B7090 @ =gAnims
	movs r2, #4
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B7090: .4byte gAnims

	thumb_func_start sub_80B7094
sub_80B7094: @ 0x080B7094
	ldr r1, _080B70A0 @ =gAnims
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B70A0: .4byte gAnims

	thumb_func_start sub_80B70A4
sub_80B70A4: @ 0x080B70A4
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B70CC @ =gUnk_08DB1074
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #5
	ands r3, r2
	adds r1, r1, r3
	lsls r1, r1, #5
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B70CC: .4byte gUnk_08DB1074

	thumb_func_start sub_80B70D0
sub_80B70D0: @ 0x080B70D0
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B70FC @ =gUnk_08DB10A4
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r4, #0x1f
	adds r2, r4, #0
	bics r2, r1
	lsls r2, r2, #6
	adds r2, #2
	adds r0, r0, r2
	ands r3, r4
	lsls r3, r3, #1
	adds r0, r0, r3
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B70FC: .4byte gUnk_08DB10A4

	thumb_func_start sub_80B7100
sub_80B7100: @ 0x080B7100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl sub_80A06BC
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080B7116:
	str r1, [r0]
	subs r0, #4
	cmp r0, r13
	bge _080B7116
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080B71CE
	ldr r6, _080B71F4 @ =gUnk_08D62110
	movs r7, #0x94
	movs r0, #0x2d
	adds r0, r0, r6
	mov sl, r0
_080B7134:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B71C8
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x39
	adds r0, r0, r1
	ldr r1, [sp]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x35
	adds r0, r0, r1
	ldr r1, [sp, #4]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x31
	adds r0, r0, r1
	ldr r1, [sp, #8]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldr r1, [sp, #0xc]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #0xc]
_080B71C8:
	adds r5, #1
	cmp r5, r8
	blt _080B7134
_080B71CE:
	movs r5, #0
	mov r1, sp
_080B71D2:
	ldr r0, [r1]
	cmp sb, r0
	bgt _080B71E0
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080B71D2
_080B71E0:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B71F4: .4byte gUnk_08D62110

	thumb_func_start sub_80B71F8
sub_80B71F8: @ 0x080B71F8
	push {lr}
	sub sp, #4
	ldr r1, _080B722C @ =gUnk_08622C44
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B75A4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B7210:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080B7224
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080B7210
_080B7224:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B722C: .4byte gUnk_08622C44

	thumb_func_start sub_80B7230
sub_80B7230: @ 0x080B7230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl sub_80A0B88
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080B7246:
	str r1, [r0]
	subs r0, #4
	cmp r0, r13
	bge _080B7246
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080B72FE
	ldr r6, _080B7324 @ =gUnk_08D62110
	movs r7, #0x94
	movs r0, #0x3e
	adds r0, r0, r6
	mov sl, r0
_080B7264:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B72F8
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldr r1, [sp]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldr r1, [sp, #4]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldr r1, [sp, #0xc]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #0xc]
_080B72F8:
	adds r5, #1
	cmp r5, r8
	blt _080B7264
_080B72FE:
	movs r5, #0
	mov r1, sp
_080B7302:
	ldr r0, [r1]
	cmp sb, r0
	blt _080B7310
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080B7302
_080B7310:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B7324: .4byte gUnk_08D62110

	thumb_func_start sub_80B7328
sub_80B7328: @ 0x080B7328
	push {lr}
	sub sp, #4
	ldr r1, _080B7358 @ =gUnk_08622C48
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B75DC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B7340:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080B7350
	adds r1, #1
	cmp r1, #3
	ble _080B7340
_080B7350:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B7358: .4byte gUnk_08622C48

	thumb_func_start sub_80B735C
sub_80B735C: @ 0x080B735C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl sub_8017574
	mov r8, r0
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r7, r0, #0
	movs r5, #0
	cmp r6, r7
	bge _080B73B4
	ldr r0, _080B73C8 @ =gUnk_08D62170
	mov sb, r0
_080B737C:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B73AE
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x94
	muls r1, r2, r1
	adds r0, r0, r1
	add r0, sb
	ldr r0, [r0]
	adds r6, r6, r0
_080B73AE:
	adds r5, #1
	cmp r5, r7
	blt _080B737C
_080B73B4:
	movs r0, #0x64
	mov r1, r8
	muls r1, r0, r1
	lsls r0, r6, #2
	adds r2, r0, r6
	lsls r0, r2, #4
	cmp r1, r0
	blo _080B73CC
	movs r0, #4
	b _080B73F0
	.align 2, 0
_080B73C8: .4byte gUnk_08D62170
_080B73CC:
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	cmp r1, r0
	blo _080B73DA
	movs r0, #3
	b _080B73F0
_080B73DA:
	lsls r0, r2, #3
	cmp r1, r0
	blo _080B73E4
	movs r0, #2
	b _080B73F0
_080B73E4:
	lsls r0, r2, #2
	cmp r1, r0
	bhs _080B73EE
	movs r0, #0
	b _080B73F0
_080B73EE:
	movs r0, #1
_080B73F0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B73FC
sub_80B73FC: @ 0x080B73FC
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r4, _080B7440 @ =gUnk_08DB6EBC
	adds r0, r0, r4
	adds r5, r4, #5
	adds r1, r1, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r1, r0, r1
	adds r0, r4, #0
	adds r0, #0xa
	adds r2, r2, r0
	ldrb r2, [r2]
	adds r1, r2, r1
	adds r0, #5
	adds r3, r3, r0
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r4, #0x14
	adds r6, r6, r4
	ldrb r6, [r6]
	adds r1, r6, r1
	movs r0, #0
	ldr r2, _080B7444 @ =gUnk_08DB6ED6
_080B742C:
	ldrh r3, [r2]
	cmp r1, r3
	blo _080B743A
	adds r2, #2
	adds r0, #1
	cmp r0, #4
	ble _080B742C
_080B743A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B7440: .4byte gUnk_08DB6EBC
_080B7444: .4byte gUnk_08DB6ED6

	thumb_func_start sub_80B7448
sub_80B7448: @ 0x080B7448
	push {r4, lr}
	ldr r3, _080B7478 @ =gUnk_08DB6EE2
	adds r0, r0, r3
	adds r4, r3, #5
	adds r1, r1, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r4, r0, r1
	adds r3, #0xa
	adds r2, r2, r3
	ldrb r2, [r2]
	adds r4, r2, r4
	movs r0, #0
	ldr r1, _080B747C @ =gUnk_08DB6EF2
_080B7464:
	ldrh r2, [r1]
	cmp r4, r2
	blo _080B7472
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B7464
_080B7472:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B7478: .4byte gUnk_08DB6EE2
_080B747C: .4byte gUnk_08DB6EF2

	thumb_func_start sub_80B7480
sub_80B7480: @ 0x080B7480
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	bl sub_80B7100
	mov r8, r0
	bl sub_80B71F8
	adds r6, r0, #0
	bl sub_80B735C
	adds r5, r0, #0
	bl sub_80B7230
	adds r4, r0, #0
	bl sub_80B7328
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_80B73FC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B74C0
sub_80B74C0: @ 0x080B74C0
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r0, _080B7538 @ =gPlaySt
	ldrh r5, [r0, #0x10]
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	movs r0, #0x94
	muls r1, r0, r1
	ldr r0, _080B753C @ =gUnk_08D62110
	adds r4, r1, r0
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x39
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x35
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x31
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x2d
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B7520:
	ldr r0, [r1]
	cmp r5, r0
	bgt _080B752E
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B7520
_080B752E:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7538: .4byte gPlaySt
_080B753C: .4byte gUnk_08D62110

	thumb_func_start sub_80B7540
sub_80B7540: @ 0x080B7540
	push {lr}
	sub sp, #4
	ldr r1, _080B7574 @ =gUnk_08622C4C
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B75FC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B7558:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080B756C
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080B7558
_080B756C:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B7574: .4byte gUnk_08622C4C

	thumb_func_start sub_80B7578
sub_80B7578: @ 0x080B7578
	ldr r2, _080B759C @ =gUnk_08DB6EFE
	adds r0, r0, r2
	adds r2, #5
	adds r1, r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r2, r0, r1
	movs r0, #0
	ldr r1, _080B75A0 @ =gUnk_08DB6F08
_080B758A:
	ldrh r3, [r1]
	cmp r2, r3
	blo _080B7598
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B758A
_080B7598:
	bx lr
	.align 2, 0
_080B759C: .4byte gUnk_08DB6EFE
_080B75A0: .4byte gUnk_08DB6F08

	thumb_func_start sub_80B75A4
sub_80B75A4: @ 0x080B75A4
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B75AA:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080B75C8
	ldr r0, [r1]
	cmp r0, #0
	beq _080B75C8
	ldr r0, [r1, #0xc]
	ldr r1, _080B75D8 @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B75C8
	adds r5, #1
_080B75C8:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B75AA
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B75D8: .4byte 0x00010004

	thumb_func_start sub_80B75DC
sub_80B75DC: @ 0x080B75DC
	push {r4, lr}
	bl sub_80A0AF0
	adds r4, r0, #0
	bl sub_80A0B14
	movs r1, #0x64
	muls r0, r1, r0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80B75FC
sub_80B75FC: @ 0x080B75FC
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B7602:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080B7636
	ldr r2, [r0]
	cmp r2, #0
	beq _080B7636
	ldr r0, [r0, #0xc]
	ldr r1, _080B7648 @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B7636
	ldrb r0, [r2, #4]
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r1, r0, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, _080B764C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080B7636
	adds r5, #1
_080B7636:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B7602
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7648: .4byte 0x00010004
_080B764C: .4byte gPlaySt

	thumb_func_start nullsub_90
nullsub_90: @ 0x080B7650
	bx lr
	.align 2, 0

	thumb_func_start sub_80B7654
sub_80B7654: @ 0x080B7654
	push {r4, r5, r6, lr}
	bl sub_8017574
	ldr r1, _080B769C @ =gPlaySt
	ldr r5, [r1, #0x30]
	subs r5, r0, r5
	str r0, [r1, #0x30]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r6, r0, #0
	ldr r4, _080B76A0 @ =gUnk_08D62110
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x94
	muls r1, r2, r1
	adds r0, r0, r1
	adds r4, #0x60
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #0x64
	muls r5, r0, r5
	lsls r0, r1, #2
	adds r2, r0, r1
	lsls r0, r2, #4
	cmp r5, r0
	blt _080B76A4
	movs r0, #4
	b _080B76C8
	.align 2, 0
_080B769C: .4byte gPlaySt
_080B76A0: .4byte gUnk_08D62110
_080B76A4:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	cmp r5, r0
	blt _080B76B2
	movs r0, #3
	b _080B76C8
_080B76B2:
	lsls r0, r2, #3
	cmp r5, r0
	blt _080B76BC
	movs r0, #2
	b _080B76C8
_080B76BC:
	lsls r0, r2, #2
	cmp r5, r0
	bge _080B76C6
	movs r0, #0
	b _080B76C8
_080B76C6:
	movs r0, #1
_080B76C8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B76D0
sub_80B76D0: @ 0x080B76D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl sub_80A0AF0
	adds r4, r0, #0
	bl sub_80A0B14
	adds r5, r0, #0
	ldr r7, _080B7704 @ =0x000FFFFF
	cmp r4, r7
	ble _080B76EC
	adds r4, r7, #0
_080B76EC:
	cmp r5, r7
	ble _080B76F2
	adds r5, r7, #0
_080B76F2:
	ldr r6, _080B7708 @ =gPlaySt
	ldr r0, [r6, #0x34]
	mov r8, r0
	lsls r0, r0, #0xc
	lsrs r2, r0, #0xc
	cmp r4, r2
	bne _080B770C
	movs r0, #0x28
	b _080B7758
	.align 2, 0
_080B7704: .4byte 0x000FFFFF
_080B7708: .4byte gPlaySt
_080B770C:
	ldrh r1, [r6, #0x36]
	lsrs r1, r1, #4
	mov ip, r1
	movs r3, #0x38
	adds r3, r3, r6
	mov sb, r3
	ldrb r1, [r3]
	lsls r0, r1, #0xc
	mov r3, ip
	orrs r0, r3
	subs r0, r5, r0
	movs r1, #0x64
	muls r0, r1, r0
	subs r1, r4, r2
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x64
	ble _080B7734
	movs r2, #0x64
_080B7734:
	ands r4, r7
	ldr r0, _080B7764 @ =0xFFF00000
	mov r1, r8
	ands r0, r1
	orrs r0, r4
	str r0, [r6, #0x34]
	ldr r1, _080B7768 @ =0x00000FFF
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0xf
	ldrh r3, [r6, #0x36]
	ands r0, r3
	orrs r0, r1
	strh r0, [r6, #0x36]
	lsrs r0, r5, #0xc
	mov r1, sb
	strb r0, [r1]
	adds r0, r2, #0
_080B7758:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B7764: .4byte 0xFFF00000
_080B7768: .4byte 0x00000FFF

	thumb_func_start sub_80B776C
sub_80B776C: @ 0x080B776C
	push {lr}
	sub sp, #4
	ldr r1, _080B779C @ =gUnk_08622C48
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B76D0
	adds r2, r0, #0
	movs r1, #0
_080B7782:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080B7792
	adds r1, #1
	cmp r1, #3
	ble _080B7782
_080B7792:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B779C: .4byte gUnk_08622C48

	thumb_func_start sub_80B77A0
sub_80B77A0: @ 0x080B77A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0
	add r0, sp, #0xc
_080B77A8:
	str r1, [r0]
	subs r0, #4
	cmp r0, r13
	bge _080B77A8
	bl sub_80A0B88
	adds r1, r0, #0
	ldr r4, _080B7870 @ =0x000FFFFF
	cmp r1, r4
	ble _080B77BE
	adds r1, r4, #0
_080B77BE:
	ldr r3, _080B7874 @ =gPlaySt
	ldr r2, [r3, #0x38]
	lsls r0, r2, #4
	lsrs r0, r0, #0xc
	subs r7, r1, r0
	ands r1, r4
	lsls r1, r1, #8
	ldr r0, _080B7878 @ =0xF00000FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x38]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r5, r0, #0
	bl sub_8031B54
	ldr r6, _080B787C @ =gUnk_08D62110
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r4, #0x94
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x3e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B7858:
	ldr r0, [r1]
	cmp r7, r0
	blt _080B7866
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B7858
_080B7866:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B7870: .4byte 0x000FFFFF
_080B7874: .4byte gPlaySt
_080B7878: .4byte 0xF00000FF
_080B787C: .4byte gUnk_08D62110

	thumb_func_start sub_80B7880
sub_80B7880: @ 0x080B7880
	push {r4, r5, r6, lr}
	sub sp, #4
	bl GetNextChapterStatsSlot
	cmp r0, #0
	ble _080B794A
	ldr r6, _080B7954 @ =gPlaySt
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bgt _080B7902
	cmp r0, #1
	blt _080B7902
	bl sub_80B74C0
	adds r5, r6, #0
	adds r5, #0x3e
	movs r4, #7
	ands r0, r4
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r2, [r5]
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	bl sub_80B7540
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r0
	strb r1, [r5]
	bl sub_80B7654
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [r6, #0x3c]
	ldr r2, _080B7958 @ =0xFFFC7FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #0x3c]
	bl sub_80B776C
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _080B795C @ =0xFFFFFE3F
	ldrh r2, [r6, #0x3c]
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x3c]
	bl sub_80B77A0
	adds r2, r6, #0
	adds r2, #0x3d
	ands r0, r4
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r3, [r2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
_080B7902:
	ldr r5, _080B7954 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	lsrs r1, r1, #5
	ldr r2, [r5, #0x3c]
	lsls r2, r2, #0xe
	lsrs r2, r2, #0x1d
	adds r3, r5, #0
	adds r3, #0x3d
	ldrb r3, [r3]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1d
	ldrh r6, [r5, #0x3c]
	lsls r4, r6, #0x17
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl sub_80B73FC
	ldrh r2, [r5, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	adds r1, r1, r0
	cmp r1, #0xff
	ble _080B793A
	movs r1, #0xff
_080B793A:
	ldr r3, _080B7960 @ =0x000001FF
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080B7964 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2c]
_080B794A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7954: .4byte gPlaySt
_080B7958: .4byte 0xFFFC7FFF
_080B795C: .4byte 0xFFFFFE3F
_080B7960: .4byte 0x000001FF
_080B7964: .4byte 0xFFFFE00F

	thumb_func_start sub_80B7968
sub_80B7968: @ 0x080B7968
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7978 @ =gUnk_08DB793C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080B7978: .4byte gUnk_08DB793C

	thumb_func_start nullsub_91
nullsub_91: @ 0x080B797C
	bx lr
	.align 2, 0

	thumb_func_start sub_80B7980
sub_80B7980: @ 0x080B7980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	mov sl, r3
	ldr r0, [sp, #0x20]
	bl sub_80B7968
	adds r6, r0, #0
	movs r5, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r7, r0
_080B79A2:
	ldr r0, [r6]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #4
	adds r4, r4, r2
	adds r5, #1
	cmp r5, #9
	ble _080B79A2
	ldr r1, [r6, #4]
	mov r3, r8
	lsls r2, r3, #0xc
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r0, sb
	bl TmApplyTsa_thm
	ldr r0, [r6, #8]
	mov r2, r8
	lsls r1, r2, #5
	mov r3, sl
	lsls r2, r3, #5
	bl ApplyPaletteExt
	ldr r0, [sp, #0x20]
	cmp r0, #0x7f
	bgt _080B79EE
	movs r0, #0
	ldr r1, [sp, #0x20]
	bl sub_80A02A8
_080B79EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B79FC
sub_80B79FC: @ 0x080B79FC
	push {r4, lr}
	ldr r0, _080B7A68 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B7A0E
	movs r3, #0
_080B7A0E:
	cmp r3, #0x1f
	bhi _080B7A2A
	lsrs r2, r3, #1
	ldr r1, _080B7A6C @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, r0, r2
	strh r0, [r1]
_080B7A2A:
	cmp r3, #0x80
	bls _080B7A4A
	movs r1, #0xa0
	subs r1, r1, r3
	asrs r1, r1, #1
	ldr r2, _080B7A6C @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r2]
	adds r2, #2
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r0, r0, r1
	strh r0, [r2]
_080B7A4A:
	cmp r3, #0x20
	bne _080B7A62
	ldr r2, _080B7A6C @ =0x04000050
	ldr r1, _080B7A70 @ =0x030027CC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_080B7A62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7A68: .4byte 0x04000006
_080B7A6C: .4byte 0x04000050
_080B7A70: .4byte 0x030027CC

	thumb_func_start sub_80B7A74
sub_80B7A74: @ 0x080B7A74
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _080B7AA8 @ =gUnk_08DB7D14
	ldr r0, _080B7AAC @ =gUnk_08DB7DCC
	ldr r4, [r0]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080B7AB0 @ =0x0100005A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _080B7AB4 @ =0x02000888
	movs r0, #0
	str r0, [r1]
	ldr r0, [r5]
	cmp r0, #0
	beq _080B7B26
	adds r7, r1, #0
_080B7A9C:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B7AB8
	str r5, [r4, #8]
	b _080B7B16
	.align 2, 0
_080B7AA8: .4byte gUnk_08DB7D14
_080B7AAC: .4byte gUnk_08DB7DCC
_080B7AB0: .4byte 0x0100005A
_080B7AB4: .4byte 0x02000888
_080B7AB8:
	bl GetUnitFromCharId
	adds r6, r0, #0
	cmp r6, #0
	beq _080B7B1E
	ldrb r0, [r5]
	bl GetPidStats
	adds r2, r0, #0
	str r5, [r4, #8]
	movs r1, #3
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	ble _080B7AE0
	movs r0, #0xff
_080B7AE0:
	strb r0, [r4, #2]
	ldrb r0, [r2]
	strb r0, [r4, #3]
	adds r0, r1, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	bgt _080B7AFC
	ldrh r1, [r2, #0xc]
	lsrs r0, r1, #2
	b _080B7AFE
_080B7AFC:
	movs r0, #0xff
_080B7AFE:
	strb r0, [r4, #1]
	ldr r0, [r6, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B7B12
	ldrb r2, [r2, #5]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	b _080B7B14
_080B7B12:
	movs r0, #0xff
_080B7B14:
	strb r0, [r4]
_080B7B16:
	adds r4, #0xc
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
_080B7B1E:
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #0
	bne _080B7A9C
_080B7B26:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7B30
sub_80B7B30: @ 0x080B7B30
	movs r2, #0
_080B7B32:
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B7B46
	cmp r1, #1
	bne _080B7B42
	adds r0, #1
	adds r2, #1
	b _080B7B32
_080B7B42:
	adds r0, #2
	b _080B7B32
_080B7B46:
	adds r0, r2, #3
	bx lr
	.align 2, 0

	thumb_func_start sub_80B7B4C
sub_80B7B4C: @ 0x080B7B4C
	push {r4, r5, lr}
	ldr r0, _080B7B74 @ =gUnk_08DB7DCC
	ldr r4, [r0]
	ldr r1, _080B7B78 @ =0x02000884
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _080B7BAA
	adds r5, r1, #0
_080B7B60:
	ldr r2, [r4, #8]
	ldr r0, [r2]
	cmp r0, #0xcd
	bne _080B7B7C
	movs r0, #9
	strb r0, [r4, #4]
	ldr r0, [r5]
	adds r0, #9
	str r0, [r5]
	b _080B7BA2
	.align 2, 0
_080B7B74: .4byte gUnk_08DB7DCC
_080B7B78: .4byte 0x02000884
_080B7B7C:
	cmp r0, #3
	beq _080B7BA2
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B7B8C
	ldr r0, [r2, #8]
	b _080B7B8E
_080B7B8C:
	ldr r0, [r2, #4]
_080B7B8E:
	bl DecodeMsg
	bl sub_80B7B30
	strb r0, [r4, #4]
	ldr r0, [r5]
	ldrb r1, [r4, #4]
	adds r0, r1, r0
	str r0, [r5]
	ldr r1, _080B7BB8 @ =0x02000884
_080B7BA2:
	adds r4, #0xc
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _080B7B60
_080B7BAA:
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7BB8: .4byte 0x02000884

	thumb_func_start sub_80B7BBC
sub_80B7BBC: @ 0x080B7BBC
	push {lr}
	bl sub_80B7A74
	bl sub_80B7B4C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7BCC
sub_80B7BCC: @ 0x080B7BCC
	push {r4, r5, lr}
	ldr r4, _080B7C08 @ =0x02000818
	ldr r1, _080B7C0C @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xa
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x18
	movs r5, #9
_080B7BE4:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B7BE4
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C08: .4byte 0x02000818
_080B7C0C: .4byte 0x06011000

	thumb_func_start sub_80B7C10
sub_80B7C10: @ 0x080B7C10
	push {r4, r5, lr}
	ldr r4, _080B7C3C @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	adds r5, r4, #0
	adds r5, #0x18
	movs r4, #9
_080B7C20:
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B7C20
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C3C: .4byte 0x02000818

	thumb_func_start sub_80B7C40
sub_80B7C40: @ 0x080B7C40
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080B7C68 @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	lsls r5, r5, #3
	adds r4, #0x18
	adds r5, r5, r4
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C68: .4byte 0x02000818

	thumb_func_start sub_80B7C6C
sub_80B7C6C: @ 0x080B7C6C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
_080B7C76:
	ldrb r0, [r1]
	cmp r0, #0
	blt _080B7C88
	cmp r0, #1
	ble _080B7C98
	cmp r0, #4
	bne _080B7C88
	adds r1, #1
	b _080B7C76
_080B7C88:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	ldr r0, [sp]
	adds r4, r4, r0
	b _080B7C76
_080B7C98:
	movs r1, #0xe0
	subs r1, r1, r4
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r5, #0
	bl Text_SetCursor
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B7CB0
sub_80B7CB0: @ 0x080B7CB0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	movs r1, #2
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0x50
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #0x58
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r1, _080B7D58 @ =gUnk_08622C50
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0x70
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #0x78
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r1, _080B7D5C @ =gUnk_08622C54
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0x90
	bl Text_SetCursor
	adds r0, r4, #0
	mov r1, r8
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #0x98
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r1, _080B7D60 @ =gUnk_08622C58
	adds r0, r4, #0
	bl Text_DrawString
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7D58: .4byte gUnk_08622C50
_080B7D5C: .4byte gUnk_08622C54
_080B7D60: .4byte gUnk_08622C58

	thumb_func_start sub_80B7D64
sub_80B7D64: @ 0x080B7D64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x88
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sb, r0
	add r2, sp, #0x80
	str r1, [r2]
	ldr r0, _080B7DF8 @ =gUnk_08DB7DC8
	ldr r0, [r0]
	add r1, sp, #0x84
	str r0, [r1]
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r4, #0
_080B7D88:
	ldr r0, [r6]
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B7E04
	cmp r1, #1
	bne _080B7E18
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #2
	bne _080B7D88
	adds r0, r7, #0
	ldr r1, [r4]
	movs r2, #1
	bl sub_80AB970
	str r0, [r5]
	adds r0, r7, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B7DFC @ =gPlaySt
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B7DD0
	movs r1, #2
_080B7DD0:
	adds r0, r2, #0
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r4]
	bl AppendString
	str r0, [r5]
	ldr r0, _080B7E00 @ =0x00001182
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r5]
	bl AppendString
	str r0, [r5]
	b _080B7D88
	.align 2, 0
_080B7DF8: .4byte gUnk_08DB7DC8
_080B7DFC: .4byte gPlaySt
_080B7E00: .4byte 0x00001182
_080B7E04:
	ldr r0, [r4]
	strb r1, [r0]
	mov r0, r8
	str r0, [r6]
	ldr r0, _080B7E14 @ =gUnk_08DB7DC8
	ldr r0, [r0]
	str r0, [r5]
	b _080B7E22
	.align 2, 0
_080B7E14: .4byte gUnk_08DB7DC8
_080B7E18:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80ABAAC
	b _080B7D88
_080B7E22:
	ldr r1, [r4]
	ldrb r2, [r1]
	cmp r2, #0
	beq _080B7E48
	cmp r2, #1
	bne _080B7E3E
	ldr r0, [r6]
	strb r2, [r0]
	adds r1, #1
	str r1, [r4]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	b _080B7E22
_080B7E3E:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_80ABAAC
	b _080B7E22
_080B7E48:
	ldr r0, [r6]
	ldr r1, [r4]
	ldrb r1, [r1]
	strb r1, [r0]
	add sp, #0x88
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7E60
sub_80B7E60: @ 0x080B7E60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r2
	adds r6, r3, #0
	ldr r3, _080B7EA8 @ =gUnk_08DB7DCC
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, [r3]
	adds r4, r0, r2
	ldr r5, [r4, #8]
	lsls r1, r1, #3
	ldr r0, _080B7EAC @ =0x02000830
	adds r7, r1, r0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r0, r7, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r7, #0
	movs r1, #1
	bl Text_SetColor
	mov r0, r8
	cmp r0, #0
	beq _080B7EB0
	cmp r0, #1
	beq _080B7EF8
	b _080B7F1E
	.align 2, 0
_080B7EA8: .4byte gUnk_08DB7DCC
_080B7EAC: .4byte 0x02000830
_080B7EB0:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B7ECC
	ldr r0, _080B7EC8 @ =gPlaySt
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080B7EE8
	ldr r0, [r5, #8]
	b _080B7EEA
	.align 2, 0
_080B7EC8: .4byte gPlaySt
_080B7ECC:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B7EE8
	ldr r0, [r5, #8]
	bl DecodeMsg
	adds r1, r0, #0
	str r1, [r6]
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_80B7D64
	b _080B7EF0
_080B7EE8:
	ldr r0, [r5, #4]
_080B7EEA:
	bl DecodeMsg
	str r0, [r6]
_080B7EF0:
	bl sub_8013374
	str r0, [r6]
	b _080B7F1E
_080B7EF8:
	ldr r0, [r5]
	cmp r0, #0xcd
	beq _080B7F1E
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _080B7F1E
	movs r0, #0
	bl SetTextFontGlyphs
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	adds r0, r7, #0
	bl sub_80B7CB0
	movs r0, #1
	bl SetTextFontGlyphs
_080B7F1E:
	ldr r1, [r6]
	adds r0, r7, #0
	bl sub_80B7C6C
_080B7F26:
	ldr r0, [r6]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	beq _080B7F42
	cmp r2, #1
	beq _080B7F3E
	adds r0, r7, #0
	bl Text_DrawCharacter
	str r0, [r6]
	b _080B7F26
_080B7F3E:
	adds r0, #1
	str r0, [r6]
_080B7F42:
	movs r0, #0
	bl SetTextFont
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7F54
sub_80B7F54: @ 0x080B7F54
	push {r4, r5, r6, r7, lr}
	ldr r3, _080B7F9C @ =gPal
	movs r0, #0x1f
	mov ip, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	movs r5, #0xf8
	lsls r5, r5, #7
	movs r4, #0x7f
	movs r7, #0x1f
_080B7F68:
	ldrh r2, [r3]
	adds r1, r7, #0
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, ip
	ands r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	adds r0, r5, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r5
	adds r1, r1, r0
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080B7F68
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F9C: .4byte gPal

	thumb_func_start sub_80B7FA0
sub_80B7FA0: @ 0x080B7FA0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080B7FC4 @ =gPal
	lsls r1, r1, #4
	cmp r1, #0
	ble _080B7FBA
_080B7FAC:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _080B7FAC
_080B7FBA:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080B7FC4: .4byte gPal

	thumb_func_start sub_80B7FC8
sub_80B7FC8: @ 0x080B7FC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_80B7968
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	movs r3, #0x20
	bl sub_80010CC
	ldr r0, _080B800C @ =gBg3Tm
	ldr r1, [r4, #4]
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	strh r0, [r5, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B800C: .4byte gBg3Tm

	thumb_func_start sub_80B8010
sub_80B8010: @ 0x080B8010
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_80B7968
	movs r2, #0x3e
	ldrsh r1, [r4, r2]
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r1, #0xb
	ldr r2, _080B8050 @ =0x06008000
	adds r1, r1, r2
	bl Decompress
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080B8048
	adds r0, r4, #0
	bl Proc_Break
_080B8048:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8050: .4byte 0x06008000

	thumb_func_start sub_80B8054
sub_80B8054: @ 0x080B8054
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _080B8078 @ =gUnk_08DB7DD0
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _080B807C
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x40
	strh r6, [r1]
	b _080B807E
	.align 2, 0
_080B8078: .4byte gUnk_08DB7DD0
_080B807C:
	movs r0, #0
_080B807E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80B8084
sub_80B8084: @ 0x080B8084
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	lsls r4, r4, #1
	cmp r4, #0x1f
	ble _080B809C
	ldr r5, _080B8098 @ =0x0000FE80
	b _080B80A4
	.align 2, 0
_080B8098: .4byte 0x0000FE80
_080B809C:
	cmp r4, #0x13
	ble _080B80A4
	movs r5, #0xa0
	lsls r5, r5, #2
_080B80A4:
	lsls r1, r4, #0xa
	ldr r0, _080B80D4 @ =0x00007FFF
	ands r1, r0
	ldr r0, _080B80D8 @ =0x06008000
	adds r1, r1, r0
	adds r0, r3, #0
	bl Decompress
	movs r0, #0x1f
	ands r0, r4
	lsls r0, r0, #6
	ldr r1, _080B80DC @ =gBg3Tm
	adds r0, r0, r1
	adds r2, r5, #0
	adds r1, r6, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B80D4: .4byte 0x00007FFF
_080B80D8: .4byte 0x06008000
_080B80DC: .4byte gBg3Tm

	thumb_func_start sub_80B80E0
sub_80B80E0: @ 0x080B80E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0
	strh r0, [r1]
	adds r1, #6
	ldr r0, _080B8128 @ =0x0000FFFF
	strh r0, [r1]
	ldr r0, [r4, #0x38]
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	movs r3, #0x20
	bl sub_80010CC
	ldr r0, [r4, #0x38]
	adds r0, #4
	str r0, [r4, #0x38]
	movs r5, #0
_080B810A:
	ldr r0, [r4, #0x38]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	adds r0, r5, #0
	bl sub_80B8084
	ldr r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r5, #1
	cmp r5, #9
	ble _080B810A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8128: .4byte 0x0000FFFF

	thumb_func_start sub_80B812C
sub_80B812C: @ 0x080B812C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x44
	ldrh r1, [r6]
	lsls r0, r1, #0x10
	adds r5, r4, #0
	adds r5, #0x4a
	asrs r3, r0, #0x17
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	beq _080B8174
	ldr r2, [r4, #0x38]
	ldr r1, [r2]
	cmp r1, #0
	bne _080B8156
	adds r0, r4, #0
	bl Proc_Break
	b _080B8190
_080B8156:
	adds r0, r3, #0
	adds r0, #0xa
	ldr r2, [r2, #4]
	bl sub_80B8084
	ldr r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x38]
	movs r0, #8
	bl EnableBgSync
	ldrh r6, [r6]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x17
	strh r0, [r5]
_080B8174:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	ldrh r4, [r4, #0x3c]
	adds r2, r1, r4
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
_080B8190:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B8198
sub_80B8198: @ 0x080B8198
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B81B0 @ =gUnk_08DB7E28
	bl Proc_Start
	str r4, [r0, #0x38]
	strh r5, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B81B0: .4byte gUnk_08DB7E28

	thumb_func_start sub_80B81B4
sub_80B81B4: @ 0x080B81B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0xf0
	mov sb, r0
	movs r5, #0
_080B81C8:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x46
	movs r2, #0
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	adds r4, r0, #0
	adds r4, #0xa0
	cmp r4, #0
	bge _080B81FA
	rsbs r0, r4, #0
	mov r1, sb
	bl __modsi3
	adds r2, r0, #0
	cmp r2, #0x17
	bgt _080B81F6
	movs r0, #0x80
	lsls r0, r0, #1
	subs r4, r0, r2
	b _080B81FA
_080B81F6:
	mov r3, sb
	subs r4, r3, r2
_080B81FA:
	movs r0, #0xff
	ands r4, r0
	cmp r4, #0x9f
	ble _080B820A
	adds r0, r5, #1
	mov r8, r0
	cmp r4, #0xe8
	ble _080B8242
_080B820A:
	lsls r0, r5, #0xb
	adds r5, #1
	mov r8, r5
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080B8258 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r2, #0xa4
	lsls r2, r2, #8
	adds r5, r0, r2
	movs r7, #8
	movs r6, #6
_080B8226:
	str r5, [sp]
	movs r0, #4
	adds r1, r7, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B825C @ =Sprite_32x16
	bl PutSpriteExt
	adds r5, #4
	adds r7, #0x20
	subs r6, #1
	cmp r6, #0
	bge _080B8226
_080B8242:
	mov r5, r8
	cmp r5, #9
	ble _080B81C8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8258: .4byte 0x0001FFFF
_080B825C: .4byte Sprite_32x16

	thumb_func_start sub_80B8260
sub_80B8260: @ 0x080B8260
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r1, #0
	ldr r0, _080B82D4 @ =0x0001FFFF
	mov sl, r0
_080B8272:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, #0
	adds r4, #0x18
	lsls r0, r1, #0xb
	adds r1, #1
	mov sb, r1
	movs r1, #0xff
	ands r4, r1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	movs r7, #0xa4
	lsls r7, r7, #8
	movs r6, #8
	mov r1, sl
	ands r0, r1
	lsrs r0, r0, #5
	mov r8, r0
	movs r5, #6
_080B829C:
	mov r3, r8
	adds r0, r3, r7
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B82D8 @ =Sprite_32x16
	bl PutSpriteExt
	adds r7, #4
	adds r6, #0x20
	subs r5, #1
	cmp r5, #0
	bge _080B829C
	mov r1, sb
	cmp r1, #7
	ble _080B8272
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B82D4: .4byte 0x0001FFFF
_080B82D8: .4byte Sprite_32x16

	thumb_func_start sub_80B82DC
sub_80B82DC: @ 0x080B82DC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80B7C10
	ldr r0, _080B836C @ =Pal_08190268
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r1, [r0]
	adds r0, #2
	movs r5, #0
	strh r1, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl sub_8013374
	str r0, [r4, #0x2c]
	ldr r0, _080B8370 @ =0x02000830
	str r0, [r4, #0x30]
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	bl sub_80B7C6C
	ldr r2, _080B8374 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080B8378 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B837C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080B8380 @ =sub_80B8260
	adds r1, r4, #0
	bl StartParallelWorker
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B836C: .4byte Pal_08190268
_080B8370: .4byte 0x02000830
_080B8374: .4byte gDispIo
_080B8378: .4byte 0x0000FFE0
_080B837C: .4byte 0x0000E0FF
_080B8380: .4byte sub_80B8260

	thumb_func_start sub_80B8384
sub_80B8384: @ 0x080B8384
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r0, _080B83C0 @ =0x02000818
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B840A
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, [r5, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _080B83CA
	cmp r1, #1
	bgt _080B83C4
	cmp r1, #0
	beq _080B83E2
	b _080B83F8
	.align 2, 0
_080B83C0: .4byte 0x02000818
_080B83C4:
	cmp r1, #4
	beq _080B83EC
	b _080B83F8
_080B83CA:
	ldrh r1, [r4]
	lsls r0, r1, #1
	strh r0, [r4]
	ldr r1, [r5, #0x2c]
	adds r1, #1
	str r1, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	adds r0, #8
	str r0, [r5, #0x30]
	bl sub_80B7C6C
	b _080B840A
_080B83E2:
	strh r1, [r4]
	adds r0, r5, #0
	bl Proc_Break
	b _080B840A
_080B83EC:
	adds r0, #1
	str r0, [r5, #0x2c]
	ldrh r1, [r4]
	lsls r0, r1, #3
	strh r0, [r4]
	b _080B840A
_080B83F8:
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x2c]
	bl Text_DrawCharacter
	str r0, [r5, #0x2c]
_080B840A:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B8418
sub_80B8418: @ 0x080B8418
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	ldr r0, _080B8460 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r3, r2, #0x11
	movs r0, #0x10
	subs r0, r0, r3
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x20
	bne _080B8458
	adds r0, r5, #0
	bl Proc_Break
_080B8458:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8460: .4byte gDispIo

	thumb_func_start sub_80B8464
sub_80B8464: @ 0x080B8464
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	ldr r0, [r4, #0x34]
	ldm r0!, {r1}
	str r0, [r4, #0x34]
	cmp r1, #0
	beq _080B847E
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B847E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B8484
sub_80B8484: @ 0x080B8484
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B84A0 @ =gUnk_08DB7E70
	bl Proc_Start
	str r4, [r0, #0x34]
	adds r1, r0, #0
	adds r1, #0x42
	strh r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B84A0: .4byte gUnk_08DB7E70

	thumb_func_start sub_80B84A4
sub_80B84A4: @ 0x080B84A4
	push {lr}
	ldr r0, _080B84B4 @ =gUnk_08DB7E70
	bl Proc_Find
	cmp r0, #0
	bne _080B84B8
	movs r0, #0
	b _080B84BA
	.align 2, 0
_080B84B4: .4byte gUnk_08DB7E70
_080B84B8:
	movs r0, #1
_080B84BA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B84C0
sub_80B84C0: @ 0x080B84C0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	movs r4, #0
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080B8578 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r6, _080B857C @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r0, [r6, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080B8580 @ =gPal
	ldr r2, _080B8584 @ =0x01000100
	bl CpuFastSet
	bl sub_80B7BCC
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	adds r5, #0x4e
	strh r4, [r5]
	bl sub_80B7BBC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8578: .4byte 0x01000008
_080B857C: .4byte gDispIo
_080B8580: .4byte gPal
_080B8584: .4byte 0x01000100

	thumb_func_start sub_80B8588
sub_80B8588: @ 0x080B8588
	push {lr}
	adds r2, r0, #0
	ldr r3, _080B85B8 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	ldr r0, _080B85BC @ =gUnk_08DB7CFC
	movs r1, #8
	bl sub_80B8484
	pop {r0}
	bx r0
	.align 2, 0
_080B85B8: .4byte gDispIo
_080B85BC: .4byte gUnk_08DB7CFC

	thumb_func_start sub_80B85C0
sub_80B85C0: @ 0x080B85C0
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080B85EA
	ldr r0, _080B85F0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B85EA
	movs r0, #0
	strb r0, [r2]
	adds r0, r3, #0
	movs r1, #0x32
	bl Proc_Goto
_080B85EA:
	pop {r0}
	bx r0
	.align 2, 0
_080B85F0: .4byte gpKeySt

	thumb_func_start sub_80B85F4
sub_80B85F4: @ 0x080B85F4
	push {r4, r5, r6, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r0, #0x44
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	subs r0, #6
	strh r1, [r0]
	strh r1, [r5, #0x3e]
	ldr r0, _080B86A4 @ =Pal_08190268
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B86A8 @ =sub_80B79FC
	bl SetOnHBlankA
	ldr r2, _080B86AC @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B86B0 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B86B4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_80B7C10
	ldr r0, _080B86B8 @ =sub_80B81B4
	adds r1, r5, #0
	bl StartParallelWorker
	adds r6, r5, #0
	adds r6, #0x51
	strb r4, [r6]
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B868A
	mov r1, sp
	movs r0, #3
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _080B868A
	movs r0, #1
	strb r0, [r6]
_080B868A:
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080B86BC @ =sub_80B85C0
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #0x64
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B86A4: .4byte Pal_08190268
_080B86A8: .4byte sub_80B79FC
_080B86AC: .4byte gDispIo
_080B86B0: .4byte 0x0000FFE0
_080B86B4: .4byte 0x0000E0FF
_080B86B8: .4byte sub_80B81B4
_080B86BC: .4byte sub_80B85C0

	thumb_func_start sub_80B86C0
sub_80B86C0: @ 0x080B86C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	movs r0, #0
	ldrsh r6, [r4, r0]
	ldr r0, _080B86F0 @ =0x02000884
	ldr r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	cmp r6, r0
	blt _080B86F4
	adds r0, r5, #0
	bl Proc_Break
	mov r8, r4
	adds r5, #0x46
	mov sb, r5
	b _080B87CC
	.align 2, 0
_080B86F0: .4byte 0x02000884
_080B86F4:
	movs r1, #0x3e
	ldrsh r4, [r5, r1]
	cmp r4, #9
	bgt _080B8732
	movs r1, #0xa
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	bl __divsi3
	adds r1, r4, #0
	cmp r0, r1
	blt _080B8732
	cmp r4, #0
	bne _080B8724
	movs r0, #0
	adds r1, r5, #0
	bl sub_80B8054
	movs r1, #0
	bl Proc_Goto
	b _080B872C
_080B8724:
	adds r0, r1, #0
	adds r1, r5, #0
	bl sub_80B8054
_080B872C:
	ldrh r0, [r5, #0x3e]
	adds r0, #1
	strh r0, [r5, #0x3e]
_080B8732:
	adds r4, r5, #0
	adds r4, #0x44
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x48
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	mov r8, r4
	movs r2, #0x46
	adds r2, r2, r5
	mov sb, r2
	cmp r0, #0
	bne _080B87CC
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x4c
	movs r2, #0
	ldrsh r7, [r6, r2]
	ldr r0, _080B87B8 @ =0x02000888
	ldr r0, [r0]
	subs r0, #1
	cmp r7, r0
	bge _080B87C0
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	adds r4, #0xa
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r3, r5, #0
	adds r3, #0x2c
	adds r0, r7, #0
	bl sub_80B7E60
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r2, #0
	ldrsh r1, [r6, r2]
	ldr r0, _080B87BC @ =gUnk_08DB7DCC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B87CC
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	mov r0, sl
	strh r0, [r4]
	b _080B87CC
	.align 2, 0
_080B87B8: .4byte 0x02000888
_080B87BC: .4byte gUnk_08DB7DCC
_080B87C0:
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	bl sub_80B7C40
_080B87CC:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	mov r1, sb
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B87F0
sub_80B87F0: @ 0x080B87F0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x44
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x46
	strh r2, [r0]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_80B8808
sub_80B8808: @ 0x080B8808
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0x48
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B884C
	adds r0, r6, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080B8874 @ =0x02000888
	ldr r4, [r1]
	subs r4, #1
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r3, r6, #0
	adds r3, #0x2c
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_80B7E60
_080B884C:
	ldr r0, _080B8878 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080B887C
	movs r3, #0
	ldrsh r0, [r5, r3]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B887C
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	adds r4, r5, #0
	b _080B8888
	.align 2, 0
_080B8874: .4byte 0x02000888
_080B8878: .4byte gpKeySt
_080B887C:
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r4, r0, #0
_080B8888:
	movs r5, #0
	ldrsh r0, [r4, r5]
	movs r1, #3
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x46
	movs r3, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd8
	bne _080B88EA
	ldr r2, _080B88F0 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080B88F4 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B88F8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r5, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4]
_080B88EA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B88F0: .4byte gDispIo
_080B88F4: .4byte 0x0000FFE0
_080B88F8: .4byte 0x0000E0FF

	thumb_func_start sub_80B88FC
sub_80B88FC: @ 0x080B88FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r3, #0
	strh r2, [r0]
	ldr r0, _080B8950 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _080B8948
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _080B8954 @ =sub_80B85C0
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl Proc_Break
_080B8948:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8950: .4byte gDispIo
_080B8954: .4byte sub_80B85C0

	thumb_func_start sub_80B8958
sub_80B8958: @ 0x080B8958
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B89A4 @ =gUnk_08DB7C54
	movs r1, #2
	adds r2, r4, #0
	bl sub_80B8198
	movs r1, #0
	bl Proc_Goto
	bl sub_80B7C10
	adds r4, #0x44
	movs r2, #0
	movs r3, #0
	ldr r0, _080B89A8 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r3, [r4]
	movs r0, #0
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B89A4: .4byte gUnk_08DB7C54
_080B89A8: .4byte gDispIo

	thumb_func_start sub_80B89AC
sub_80B89AC: @ 0x080B89AC
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B89BC @ =gUnk_08DB7D0C
	movs r1, #0xc
	bl sub_80B8484
	pop {r0}
	bx r0
	.align 2, 0
_080B89BC: .4byte gUnk_08DB7D0C

	thumb_func_start sub_80B89C0
sub_80B89C0: @ 0x080B89C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r3, [r4]
	adds r3, #1
	strh r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B89EA
	ldr r0, _080B8A08 @ =gUnk_08DB7C54
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x11
	adds r3, #0x20
	movs r1, #0
	bl sub_80010CC
_080B89EA:
	ldrh r4, [r4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x20
	bne _080B8A02
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080B8A02:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A08: .4byte gUnk_08DB7C54

	thumb_func_start sub_80B8A0C
sub_80B8A0C: @ 0x080B8A0C
	push {lr}
	bl EndAllProcChildren
	movs r0, #0
	bl SetOnHBlankA
	bl WipeAllPalette
	pop {r0}
	bx r0

	thumb_func_start sub_80B8A20
sub_80B8A20: @ 0x080B8A20
	adds r1, r0, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B8A34
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
_080B8A34:
	bx lr
	.align 2, 0

	thumb_func_start sub_80B8A38
sub_80B8A38: @ 0x080B8A38
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80B8A40
sub_80B8A40: @ 0x080B8A40
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _080B8A98 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B8A9C @ =gUnk_081C8610
	ldr r1, _080B8AA0 @ =0x06000800
	bl Decompress
	ldr r0, _080B8AA4 @ =gUnk_081C8AF8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B8AA8 @ =gBg0Tm
	ldr r1, _080B8AAC @ =gUnk_081C8B18
	ldr r2, _080B8AB0 @ =0x00005040
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	adds r5, #0x44
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A98: .4byte gDispIo
_080B8A9C: .4byte gUnk_081C8610
_080B8AA0: .4byte 0x06000800
_080B8AA4: .4byte gUnk_081C8AF8
_080B8AA8: .4byte gBg0Tm
_080B8AAC: .4byte gUnk_081C8B18
_080B8AB0: .4byte 0x00005040

	thumb_func_start sub_80B8AB4
sub_80B8AB4: @ 0x080B8AB4
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _080B8AD2
	adds r0, r2, #0
	bl Proc_Break
	b _080B8AE6
_080B8AD2:
	ldr r0, _080B8AEC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B8AE6
	adds r0, r2, #0
	bl Proc_Break
_080B8AE6:
	pop {r0}
	bx r0
	.align 2, 0
_080B8AEC: .4byte gpKeySt

	thumb_func_start sub_80B8AF0
sub_80B8AF0: @ 0x080B8AF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xc
	bl SetNextGameAction
	movs r0, #0
	bl InitBgs
	ldr r6, _080B8B60 @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	movs r2, #0xa1
	lsls r2, r2, #4
	movs r0, #0x34
	movs r1, #0x20
	adds r3, r5, #0
	bl StartBoxDialogueSimple
	movs r0, #0x90
	bl SetDialogueBoxConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B60: .4byte gDispIo

	thumb_func_start sub_80B8B64
sub_80B8B64: @ 0x080B8B64
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	bne _080B8B7A
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B8B82
_080B8B7A:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B8B82:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B8B88
sub_80B8B88: @ 0x080B8B88
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r6, _080B8BF0 @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	ldr r2, _080B8BF4 @ =0x00000A11
	movs r0, #0x40
	movs r1, #0x20
	adds r3, r5, #0
	bl StartBoxDialogueSimple
	movs r0, #0x90
	bl SetDialogueBoxConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8BF0: .4byte gDispIo
_080B8BF4: .4byte 0x00000A11

	thumb_func_start sub_80B8BF8
sub_80B8BF8: @ 0x080B8BF8
	push {lr}
	bl GetTalkChoiceResult
	cmp r0, #2
	bne _080B8C0A
	movs r0, #5
	bl SetNextGameAction
	b _080B8C10
_080B8C0A:
	movs r0, #0xc
	bl SetNextGameAction
_080B8C10:
	pop {r0}
	bx r0

	thumb_func_start sub_80B8C14
sub_80B8C14: @ 0x080B8C14
	adds r2, r0, #0
	ldr r1, _080B8C1C @ =gUnk_08DB85F4
	b _080B8C2C
	.align 2, 0
_080B8C1C: .4byte gUnk_08DB85F4
_080B8C20:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B8C2A
	ldr r0, [r1, #4]
	b _080B8C34
_080B8C2A:
	adds r1, #8
_080B8C2C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B8C20
	movs r0, #0
_080B8C34:
	bx lr
	.align 2, 0

	thumb_func_start sub_80B8C38
sub_80B8C38: @ 0x080B8C38
	adds r2, r0, #0
	ldr r1, _080B8C40 @ =gUnk_08DB875C
	b _080B8C50
	.align 2, 0
_080B8C40: .4byte gUnk_08DB875C
_080B8C44:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B8C4E
	ldrb r0, [r1, #1]
	b _080B8C58
_080B8C4E:
	adds r1, #4
_080B8C50:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B8C44
	movs r0, #0
_080B8C58:
	bx lr
	.align 2, 0

	thumb_func_start sub_80B8C5C
sub_80B8C5C: @ 0x080B8C5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _080B8CDC @ =gUnk_08DB8118
	ldr r4, [r0]
	adds r0, r5, #0
	bl sub_80B8C38
	adds r7, r0, #0
	cmp r7, #4
	bne _080B8C80
	movs r0, #0x7d
	bl CheckChapterFlag
	lsls r0, r0, #0x18
	movs r5, #0xf
	cmp r0, #0
	beq _080B8C80
	movs r5, #0x15
_080B8C80:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x1a
	lsrs r6, r0, #0x1a
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_80AB970
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B8CE0 @ =gPlaySt
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B8CAE
	movs r1, #2
_080B8CAE:
	adds r0, r2, #0
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	movs r0, #1
	adds r1, r4, #0
	bl AppendCharacter
	adds r4, r0, #0
	cmp r7, #5
	bhi _080B8D54
	lsls r0, r7, #2
	ldr r1, _080B8CE4 @ =_080B8CE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8CDC: .4byte gUnk_08DB8118
_080B8CE0: .4byte gPlaySt
_080B8CE4: .4byte _080B8CE8
_080B8CE8: @ jump table
	.4byte _080B8D00 @ case 0
	.4byte _080B8D08 @ case 1
	.4byte _080B8D10 @ case 2
	.4byte _080B8D18 @ case 3
	.4byte _080B8D30 @ case 4
	.4byte _080B8D50 @ case 5
_080B8D00:
	ldr r0, _080B8D04 @ =0x0000100F
	b _080B8D3E
	.align 2, 0
_080B8D04: .4byte 0x0000100F
_080B8D08:
	ldr r0, _080B8D0C @ =0x00001010
	b _080B8D3E
	.align 2, 0
_080B8D0C: .4byte 0x00001010
_080B8D10:
	ldr r0, _080B8D14 @ =0x00001011
	b _080B8D3E
	.align 2, 0
_080B8D14: .4byte 0x00001011
_080B8D18:
	adds r0, r6, #0
	subs r0, #0x1d
	cmp r0, #1
	bhi _080B8D28
	ldr r0, _080B8D24 @ =0x00001011
	b _080B8D3E
	.align 2, 0
_080B8D24: .4byte 0x00001011
_080B8D28:
	ldr r0, _080B8D2C @ =0x0000100F
	b _080B8D3E
	.align 2, 0
_080B8D2C: .4byte 0x0000100F
_080B8D30:
	cmp r5, #0x15
	bne _080B8D3C
	ldr r0, _080B8D38 @ =0x00001086
	b _080B8D3E
	.align 2, 0
_080B8D38: .4byte 0x00001086
_080B8D3C:
	ldr r0, _080B8D4C @ =0x00001087
_080B8D3E:
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	b _080B8D54
	.align 2, 0
_080B8D4C: .4byte 0x00001087
_080B8D50:
	movs r0, #0
	b _080B8D58
_080B8D54:
	ldr r0, _080B8D60 @ =gUnk_08DB8118
	ldr r0, [r0]
_080B8D58:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B8D60: .4byte gUnk_08DB8118

	thumb_func_start sub_80B8D64
sub_80B8D64: @ 0x080B8D64
	push {lr}
	ldr r0, _080B8D7C @ =gUnk_08615F80
	ldr r1, _080B8D80 @ =0x06005000
	bl Decompress
	ldr r0, _080B8D84 @ =Img_PrepMuralBackground
	ldr r1, _080B8D88 @ =0x06008000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080B8D7C: .4byte gUnk_08615F80
_080B8D80: .4byte 0x06005000
_080B8D84: .4byte Img_PrepMuralBackground
_080B8D88: .4byte 0x06008000

	thumb_func_start sub_80B8D8C
sub_80B8D8C: @ 0x080B8D8C
	push {r4, r5, lr}
	ldr r0, _080B8DDC @ =gUnk_08615F40
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8DE0 @ =gUnk_08615F00
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8DE4 @ =gBg3Tm
	ldr r1, _080B8DE8 @ =gUnk_08615A4C
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, _080B8DEC @ =gBg2Tm
	ldr r1, _080B8DF0 @ =gUnk_086167D0
	ldr r5, _080B8DF4 @ =0x0000C280
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0x90
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _080B8DF8 @ =gUnk_0861684C
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0xc
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8DDC: .4byte gUnk_08615F40
_080B8DE0: .4byte gUnk_08615F00
_080B8DE4: .4byte gBg3Tm
_080B8DE8: .4byte gUnk_08615A4C
_080B8DEC: .4byte gBg2Tm
_080B8DF0: .4byte gUnk_086167D0
_080B8DF4: .4byte 0x0000C280
_080B8DF8: .4byte gUnk_0861684C

	thumb_func_start sub_80B8DFC
sub_80B8DFC: @ 0x080B8DFC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	ldr r0, _080B8E78 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r5, _080B8E7C @ =gUnk_08DB8814
	ldr r0, [r5, #8]
	str r6, [sp]
	movs r1, #2
	add r1, sb
	mov r8, r1
	str r1, [sp, #4]
	movs r4, #0x1e
	str r4, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #2
	bl sub_80A974C
	ldr r0, [r5, #4]
	str r6, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x12
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_80A974C
	ldr r0, [r5]
	str r6, [sp]
	mov r1, sb
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x14
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_80A974C
	movs r0, #7
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8E78: .4byte gBg1Tm
_080B8E7C: .4byte gUnk_08DB8814

	thumb_func_start sub_80B8E80
sub_80B8E80: @ 0x080B8E80
	push {r4, r5, r6, r7, lr}
	bl ResetText
	ldr r7, _080B8EC8 @ =gUnk_08DB8824
	movs r6, #0x38
	movs r5, #0x28
	movs r4, #1
_080B8E8E:
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #0xf
	bl InitText
	ldr r0, [r7]
	adds r0, r0, r6
	movs r1, #0xa
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B8E8E
	movs r4, #0
	ldr r5, _080B8EC8 @ =gUnk_08DB8824
_080B8EB0:
	lsls r1, r4, #3
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0x19
	bl InitText
	adds r4, #1
	cmp r4, #4
	ble _080B8EB0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8EC8: .4byte gUnk_08DB8824

	thumb_func_start sub_80B8ECC
sub_80B8ECC: @ 0x080B8ECC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl sub_80B8D64
	ldr r3, _080B8F20 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r4, #0x2e]
	mov r0, sp
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r2, _080B8F24 @ =0x01000010
	bl CpuSet
	ldr r0, _080B8F28 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B8F30
	ldr r0, _080B8F2C @ =gUnk_08DB85EC
	ldr r0, [r0, #4]
	b _080B8F34
	.align 2, 0
_080B8F20: .4byte gDispIo
_080B8F24: .4byte 0x01000010
_080B8F28: .4byte gPlaySt
_080B8F2C: .4byte gUnk_08DB85EC
_080B8F30:
	ldr r0, _080B8F44 @ =gUnk_08DB85EC
	ldr r0, [r0]
_080B8F34:
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F44: .4byte gUnk_08DB85EC

	thumb_func_start sub_80B8F48
sub_80B8F48: @ 0x080B8F48
	push {lr}
	ldr r0, _080B8F78 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080B8F7C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080B8F80 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	bl ClearTalk
	bl sub_80B99F8
	bl sub_80B8D8C
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B8F78: .4byte gBg0Tm
_080B8F7C: .4byte gBg1Tm
_080B8F80: .4byte gBg2Tm

	thumb_func_start sub_80B8F84
sub_80B8F84: @ 0x080B8F84
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080B8F8A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B8FB2
	ldr r0, [r2]
	cmp r0, #0
	beq _080B8FB2
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080B8FB2
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _080B8FB8
	adds r0, r2, #0
	b _080B8FBA
_080B8FB2:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B8F8A
_080B8FB8:
	movs r0, #0
_080B8FBA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80B8FC0
sub_80B8FC0: @ 0x080B8FC0
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r5, #0
	bne _080B8FD8
	b _080B8FEC
_080B8FCA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B8FEE
_080B8FD8:
	movs r4, #0
_080B8FDA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportLevel
	cmp r0, #3
	beq _080B8FCA
	adds r4, #1
	cmp r4, #6
	ble _080B8FDA
_080B8FEC:
	movs r0, #0
_080B8FEE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80B8FF4
sub_80B8FF4: @ 0x080B8FF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	ldr r1, [r0]
	ldrb r5, [r1, #4]
	bl sub_80B8FC0
	adds r2, r0, #0
	cmp r2, #0
	bne _080B9028
	b _080B902E
_080B900A:
	movs r0, #1
	b _080B9030
_080B900E:
	ldrb r0, [r4, #1]
	adds r1, r0, #0
	cmp r1, r5
	bne _080B901C
	ldrb r0, [r4, #2]
	cmp r0, r2
	beq _080B900A
_080B901C:
	cmp r1, r2
	bne _080B9026
	ldrb r0, [r4, #2]
	cmp r0, r5
	beq _080B900A
_080B9026:
	adds r4, #8
_080B9028:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080B900E
_080B902E:
	movs r0, #0
_080B9030:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B9038
sub_80B9038: @ 0x080B9038
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_080B9042:
	ldr r5, [r4, #0x30]
	ldrb r0, [r5]
	cmp r0, #0
	bne _080B9054
	adds r0, r4, #0
	movs r1, #0x64
	bl Proc_Goto
	b _080B9166
_080B9054:
	ldrb r0, [r5, #1]
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	mov ip, r2
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r7, #0x1f
	adds r2, r7, #0
	ands r2, r0
	ldr r3, [r1, #0x40]
	lsrs r3, r2
	movs r6, #1
	ands r3, r6
	cmp r3, #0
	bne _080B915E
	ldrb r2, [r5, #2]
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _080B9090
	lsrs r0, r0, #0x1d
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r7, #0
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	ands r0, r6
	cmp r0, #0
	bne _080B915E
_080B9090:
	mov r0, ip
	cmp r0, #0xcd
	bne _080B90AC
	ldr r1, _080B90A8 @ =gPlaySt
	adds r1, #0x2b
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B915E
	str r3, [r4, #0x38]
	b _080B9124
	.align 2, 0
_080B90A8: .4byte gPlaySt
_080B90AC:
	ldrb r0, [r5, #1]
	bl sub_80B8F84
	adds r1, r0, #0
	str r1, [r4, #0x38]
	cmp r1, #0
	beq _080B915E
	ldr r2, [r4, #0x30]
	ldrb r0, [r2]
	cmp r0, #2
	beq _080B90E4
	cmp r0, #2
	bgt _080B90CC
	cmp r0, #1
	beq _080B90D6
	b _080B9124
_080B90CC:
	cmp r0, #3
	beq _080B9100
	cmp r0, #4
	beq _080B9118
	b _080B9124
_080B90D6:
	ldr r0, [r4, #0x34]
	bl sub_80B8FF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B915E
	b _080B9124
_080B90E4:
	ldrb r0, [r2, #2]
	bl sub_80B8F84
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B915E
	ldr r0, [r4, #0x38]
	bl sub_80B8FC0
	ldr r1, [r4, #0x30]
	ldrb r1, [r1, #2]
	cmp r0, r1
	bne _080B915E
	b _080B9124
_080B9100:
	movs r0, #1
	bl GetUnitFromCharId
	bl sub_80B8FC0
	cmp r0, #0x25
	beq _080B915E
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #2]
	bl sub_80B8F84
	b _080B911E
_080B9118:
	movs r0, #0xf
	bl GetUnitFromCharId
_080B911E:
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B915E
_080B9124:
	ldr r3, [r4, #0x30]
	ldrb r1, [r3, #1]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r6, #0x1f
	adds r0, r6, #0
	ands r0, r1
	movs r5, #1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r1, [r3, #2]
	lsls r2, r1, #0x18
	cmp r2, #0
	beq _080B9166
	lsrs r2, r2, #0x1d
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r0, r6, #0
	ands r0, r1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	b _080B9166
_080B915E:
	ldr r0, [r4, #0x30]
	adds r0, #8
	str r0, [r4, #0x30]
	b _080B9042
_080B9166:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B916C
sub_80B916C: @ 0x080B916C
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _080B91BE
	lsls r0, r0, #2
	ldr r1, _080B9184 @ =_080B9188
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B9184: .4byte _080B9188
_080B9188: @ jump table
	.4byte _080B919C @ case 0
	.4byte _080B91A8 @ case 1
	.4byte _080B91A8 @ case 2
	.4byte _080B91B4 @ case 3
	.4byte _080B919C @ case 4
_080B919C:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	adds r2, r3, #0
	bl sub_80B94EC
	b _080B91BE
_080B91A8:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80B97EC
	b _080B91BE
_080B91B4:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80B97EC
_080B91BE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B91C4
sub_80B91C4: @ 0x080B91C4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80B99D8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B91D8
sub_80B91D8: @ 0x080B91D8
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ClearTalk
	bl sub_80B99F8
	ldr r3, _080B9238 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080B923C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _080B9240 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080B9238: .4byte gDispIo
_080B923C: .4byte 0x0000FFE0
_080B9240: .4byte 0x0000E0FF

	thumb_func_start sub_80B9244
sub_80B9244: @ 0x080B9244
	push {lr}
	movs r0, #0xb
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_80B9250
sub_80B9250: @ 0x080B9250
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r2, #0x30]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080B926A
	adds r0, r2, #0
	movs r1, #0x64
	bl Proc_Goto
_080B926A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B9270
sub_80B9270: @ 0x080B9270
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9280 @ =gUnk_08DB8828
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9280: .4byte gUnk_08DB8828

	thumb_func_start sub_80B9284
sub_80B9284: @ 0x080B9284
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
_080B928A:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B92D8
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetPidStats
	adds r2, r0, #0
	lsls r3, r6, #1
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r1, r3
	ldrh r5, [r2, #0xc]
	lsls r0, r5, #0x12
	lsrs r0, r0, #0x14
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x40
	adds r5, r0, r3
	movs r0, #3
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r0, r0, #8
	ldrb r1, [r2, #0xb]
	orrs r0, r1
	ldr r1, _080B92E4 @ =0x000003E7
	cmp r0, r1
	ble _080B92CC
	adds r0, r1, #0
_080B92CC:
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r3
	ldrb r1, [r2]
	strh r1, [r0]
_080B92D8:
	adds r6, #1
	cmp r6, #1
	ble _080B928A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B92E4: .4byte 0x000003E7

	thumb_func_start sub_80B92E8
sub_80B92E8: @ 0x080B92E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	bl sub_80B8E80
	mov r0, r8
	bl sub_80B9284
	ldr r7, _080B9348 @ =gUnk_08DB8814
	ldr r0, [r7]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	ldr r1, _080B934C @ =gUnk_08616D7C
	ldr r4, _080B9350 @ =0x0000C280
	adds r2, r4, #0
	bl TmApplyTsa_thm
	ldr r0, [r7, #4]
	ldr r1, _080B9354 @ =gUnk_086168C8
	adds r2, r4, #0
	bl TmApplyTsa_thm
	mov r1, r8
	ldr r0, [r1, #0x38]
	ldrb r4, [r0, #1]
	cmp r4, #0xcd
	bne _080B93A8
	bl sub_80B7480
	cmp r0, #3
	ble _080B935C
	ldr r0, _080B9358 @ =0x00001069
	bl DecodeMsg
	b _080B9372
	.align 2, 0
_080B9348: .4byte gUnk_08DB8814
_080B934C: .4byte gUnk_08616D7C
_080B9350: .4byte 0x0000C280
_080B9354: .4byte gUnk_086168C8
_080B9358: .4byte 0x00001069
_080B935C:
	cmp r0, #1
	ble _080B936C
	ldr r0, _080B9368 @ =0x0000106B
	bl DecodeMsg
	b _080B9372
	.align 2, 0
_080B9368: .4byte 0x0000106B
_080B936C:
	ldr r0, _080B939C @ =0x0000106D
	bl DecodeMsg
_080B9372:
	bl sub_8013374
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, _080B93A0 @ =gUnk_08DB8824
	ldr r0, [r0]
	adds r0, #0x28
	ldr r1, _080B93A4 @ =gUnk_08DB8814
	ldr r1, [r1]
	adds r1, #0xc2
	movs r2, #0
	str r2, [sp]
	str r6, [sp, #4]
	bl PutDrawText
	b _080B945A
	.align 2, 0
_080B939C: .4byte 0x0000106D
_080B93A0: .4byte gUnk_08DB8824
_080B93A4: .4byte gUnk_08DB8814
_080B93A8:
	ldrb r0, [r0, #1]
	bl sub_80B8C14
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r5, _080B948C @ =gUnk_08DB8824
	ldr r0, [r5]
	adds r0, #0x28
	ldr r1, [r7]
	adds r1, #0xc2
	movs r4, #0
	str r4, [sp]
	str r6, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x68
	str r4, [sp]
	ldr r2, _080B9490 @ =gUnk_08622C5C
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, [r7]
	adds r0, #0x66
	mov r1, r8
	ldrh r2, [r1, #0x3c]
	movs r1, #2
	bl PutNumber
	ldr r0, [r7]
	adds r0, #0x6e
	mov r1, r8
	adds r1, #0x40
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r0, [r7]
	adds r0, #0x76
	mov r1, r8
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r2, _080B9494 @ =gCharacterData
	mov r4, r8
	ldr r0, [r4, #0x38]
	ldrb r1, [r0, #1]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B9498 @ =0x00000502
	str r0, [sp]
	movs r0, #0
	movs r3, #0x38
	bl StartBmFace
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B945A
	movs r0, #0x16
	bl ArchivePalette
	movs r3, #0x80
	lsls r3, r3, #0xf
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
_080B945A:
	movs r2, #0
	mov r0, r8
	str r2, [r0, #0x34]
	ldr r3, _080B949C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B948C: .4byte gUnk_08DB8824
_080B9490: .4byte gUnk_08622C5C
_080B9494: .4byte gCharacterData
_080B9498: .4byte 0x00000502
_080B949C: .4byte gDispIo

	thumb_func_start sub_80B94A0
sub_80B94A0: @ 0x080B94A0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0x1e
	ldr r0, _080B94E4 @ =gUnk_08DB88D8
	ldr r1, [r5, #0x34]
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r1, #1
	str r1, [r5, #0x34]
	ldr r0, [r5, #0x38]
	ldrb r0, [r0, #1]
	cmp r0, #0xcd
	beq _080B94CC
	subs r1, r6, r4
	lsls r1, r1, #3
	adds r1, #0xb0
	ldr r0, _080B94E8 @ =0x000001FF
	ands r1, r0
	movs r0, #0
	movs r2, #0x38
	bl sub_8007B80
_080B94CC:
	subs r0, r6, r4
	movs r1, #0
	bl sub_80B8DFC
	cmp r4, #0x1e
	bne _080B94DE
	adds r0, r5, #0
	bl Proc_Break
_080B94DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B94E4: .4byte gUnk_08DB88D8
_080B94E8: .4byte 0x000001FF

	thumb_func_start sub_80B94EC
sub_80B94EC: @ 0x080B94EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080B9508 @ =gUnk_08DB88EC
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x38]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9508: .4byte gUnk_08DB88EC

	thumb_func_start sub_80B950C
sub_80B950C: @ 0x080B950C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	bl sub_80B8E80
	mov r0, sb
	bl sub_80B9284
	ldr r4, _080B96B4 @ =gUnk_08DB8814
	ldr r0, [r4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	ldr r1, _080B96B8 @ =gUnk_08617B20
	ldr r5, _080B96BC @ =0x0000C280
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r0, [r4, #4]
	ldr r1, _080B96C0 @ =gUnk_0861766C
	adds r2, r5, #0
	bl TmApplyTsa_thm
	mov r1, sb
	ldr r0, [r1, #0x38]
	ldrb r0, [r0, #1]
	bl sub_80B8C14
	bl DecodeMsg
	adds r7, r0, #0
	movs r0, #0x78
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r6, _080B96C4 @ =gUnk_08DB8824
	ldr r0, [r6]
	adds r0, #0x28
	ldr r1, [r4]
	adds r1, #0xc2
	movs r5, #0
	str r5, [sp]
	str r7, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	ldr r2, _080B96C8 @ =0x00000446
	adds r1, r1, r2
	str r5, [sp]
	ldr r3, _080B96CC @ =gUnk_08622C5C
	mov r8, r3
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, [r4]
	ldr r1, _080B96D0 @ =0x00000444
	adds r0, r0, r1
	mov r3, sb
	ldrh r2, [r3, #0x3c]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	ldr r1, _080B96D4 @ =0x0000044C
	adds r0, r0, r1
	mov r1, sb
	adds r1, #0x40
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	ldr r2, _080B96D8 @ =0x00000454
	adds r0, r0, r2
	mov r1, sb
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	mov r3, sb
	ldr r0, [r3, #0x38]
	ldrb r0, [r0, #2]
	bl sub_80B8C14
	bl DecodeMsg
	adds r7, r0, #0
	movs r0, #0x78
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, [r6]
	adds r0, #0x30
	ldr r1, [r4]
	ldr r2, _080B96DC @ =0x0000045C
	adds r1, r1, r2
	str r5, [sp]
	str r7, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x68
	str r5, [sp]
	mov r3, r8
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, [r4]
	adds r0, #0x66
	mov r1, sb
	ldrh r2, [r1, #0x3e]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	adds r0, #0x6e
	mov r1, sb
	adds r1, #0x42
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	adds r0, #0x76
	mov r1, sb
	adds r1, #0x46
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	mov r2, sb
	str r5, [r2, #0x34]
	ldr r2, _080B96E0 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r5, _080B96E4 @ =gCharacterData
	mov r1, sb
	ldr r0, [r1, #0x38]
	ldrb r0, [r0, #1]
	subs r0, #1
	movs r4, #0x34
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	ldr r0, _080B96E8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r3, #0x30
	bl StartBmFace
	mov r2, sb
	ldr r0, [r2, #0x38]
	ldrb r0, [r0, #2]
	subs r0, #1
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B96EC @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r3, #0x30
	bl StartBmFace
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B96B4: .4byte gUnk_08DB8814
_080B96B8: .4byte gUnk_08617B20
_080B96BC: .4byte 0x0000C280
_080B96C0: .4byte gUnk_0861766C
_080B96C4: .4byte gUnk_08DB8824
_080B96C8: .4byte 0x00000446
_080B96CC: .4byte gUnk_08622C5C
_080B96D0: .4byte 0x00000444
_080B96D4: .4byte 0x0000044C
_080B96D8: .4byte 0x00000454
_080B96DC: .4byte 0x0000045C
_080B96E0: .4byte gDispIo
_080B96E4: .4byte gCharacterData
_080B96E8: .4byte 0x00000503
_080B96EC: .4byte 0x00000502

	thumb_func_start sub_80B96F0
sub_80B96F0: @ 0x080B96F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x1e
	ldr r0, _080B9748 @ =gUnk_08DB88D8
	ldr r1, [r7, #0x34]
	adds r0, r1, r0
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #1
	str r1, [r7, #0x34]
	subs r5, r5, r0
	lsls r4, r5, #3
	adds r1, r4, #0
	adds r1, #0x40
	ldr r6, _080B974C @ =0x000001FF
	ands r1, r6
	movs r0, #0
	movs r2, #0x30
	bl sub_8007B80
	adds r4, #0xb0
	ands r4, r6
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x30
	bl sub_8007B80
	adds r0, r5, #0
	movs r1, #0
	bl sub_80B8DFC
	mov r0, r8
	cmp r0, #0x1e
	bne _080B973E
	adds r0, r7, #0
	bl Proc_Break
_080B973E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9748: .4byte gUnk_08DB88D8
_080B974C: .4byte 0x000001FF

	thumb_func_start sub_80B9750
sub_80B9750: @ 0x080B9750
	movs r3, #0
	str r3, [r0, #0x34]
	ldr r0, _080B9794 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080B9798 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	ldr r1, _080B979C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_080B9794: .4byte gDispIo
_080B9798: .4byte 0x0000FFE0
_080B979C: .4byte 0x0000E0FF

	thumb_func_start sub_80B97A0
sub_80B97A0: @ 0x080B97A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	asrs r3, r0, #2
	adds r0, #1
	str r0, [r4, #0x34]
	ldr r0, _080B97E8 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	cmp r3, #8
	bne _080B97E0
	adds r0, r4, #0
	bl Proc_Break
_080B97E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B97E8: .4byte gDispIo

	thumb_func_start sub_80B97EC
sub_80B97EC: @ 0x080B97EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B9808 @ =gUnk_08DB890C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9808: .4byte gUnk_08DB890C

	thumb_func_start sub_80B980C
sub_80B980C: @ 0x080B980C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _080B9870 @ =gUnk_08DB8824
	ldr r0, [r4]
	str r0, [r6, #0x48]
	movs r1, #4
	str r1, [r6, #0x40]
	str r1, [r6, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r6, #0x48]
	movs r1, #0
	bl Text_SetColor
	movs r5, #0
	mov r8, r4
	movs r7, #0xc0
	lsls r7, r7, #1
_080B9836:
	lsls r4, r5, #3
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldr r1, _080B9874 @ =gBg0Tm + 0x4
	adds r1, r7, r1
	bl PutText
	adds r7, #0x80
	adds r5, #1
	cmp r5, #4
	ble _080B9836
	movs r0, #1
	bl EnableBgSync
	ldr r2, [r6, #0x2c]
	ldrb r1, [r2]
	cmp r1, #4
	beq _080B98A8
	cmp r1, #4
	bgt _080B9878
	cmp r1, #3
	beq _080B98A4
	b _080B98CA
	.align 2, 0
_080B9870: .4byte gUnk_08DB8824
_080B9874: .4byte gBg0Tm + 0x4
_080B9878:
	cmp r1, #5
	bne _080B98CA
	bl sub_80B7480
	adds r5, r0, #0
	cmp r5, #3
	ble _080B9890
	ldr r0, _080B988C @ =0x0000106A
	b _080B98E8
	.align 2, 0
_080B988C: .4byte 0x0000106A
_080B9890:
	cmp r5, #1
	ble _080B989C
	ldr r0, _080B9898 @ =0x0000106C
	b _080B98E8
	.align 2, 0
_080B9898: .4byte 0x0000106C
_080B989C:
	ldr r0, _080B98A0 @ =0x0000106E
	b _080B98E8
	.align 2, 0
_080B98A0: .4byte 0x0000106E
_080B98A4:
	ldr r0, [r2, #4]
	b _080B98E8
_080B98A8:
	ldr r3, [r6, #0x30]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080B98BC
	ldr r0, [r6, #0x34]
	ldr r0, [r0, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080B98C6
_080B98BC:
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	bl sub_80B8C5C
	b _080B98EC
_080B98C6:
	ldr r0, [r2, #4]
	b _080B98E8
_080B98CA:
	ldr r2, [r6, #0x30]
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B98E4
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_80B8C5C
	str r0, [r6, #0x44]
	cmp r0, #0
	bne _080B98EE
_080B98E4:
	ldr r0, [r6, #0x2c]
	ldr r0, [r0, #4]
_080B98E8:
	bl DecodeMsg
_080B98EC:
	str r0, [r6, #0x44]
_080B98EE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B98F8
sub_80B98F8: @ 0x080B98F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9924 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B9928
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9928
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #0x64
	bl Proc_Goto
	b _080B99D0
	.align 2, 0
_080B9924: .4byte gpKeySt
_080B9928:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B9932
	subs r0, #1
	b _080B99CE
_080B9932:
	movs r0, #0
	bl SetTextFont
	ldr r0, [r4, #0x44]
	ldrb r0, [r0]
	cmp r0, #7
	bhi _080B99C2
	lsls r0, r0, #2
	ldr r1, _080B994C @ =_080B9950
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B994C: .4byte _080B9950
_080B9950: @ jump table
	.4byte _080B9970 @ case 0
	.4byte _080B9978 @ case 1
	.4byte _080B99C2 @ case 2
	.4byte _080B99C2 @ case 3
	.4byte _080B999A @ case 4
	.4byte _080B99A4 @ case 5
	.4byte _080B99AE @ case 6
	.4byte _080B99B8 @ case 7
_080B9970:
	adds r0, r4, #0
	bl Proc_Break
	b _080B99CC
_080B9978:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #8
	str r0, [r4, #0x48]
	ldr r1, [r4, #0x3c]
	adds r1, #0x10
	str r1, [r4, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl Text_SetColor
	b _080B99CC
_080B999A:
	movs r0, #8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99A4:
	movs r0, #0x10
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99AE:
	movs r0, #0x20
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99B8:
	movs r0, #0x40
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99C2:
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x44]
	bl Text_DrawCharacter
_080B99CA:
	str r0, [r4, #0x44]
_080B99CC:
	ldr r0, [r4, #0x40]
_080B99CE:
	str r0, [r4, #0x3c]
_080B99D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B99D8
sub_80B99D8: @ 0x080B99D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B99F4 @ =gUnk_08DB8944
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B99F4: .4byte gUnk_08DB8944

	thumb_func_start sub_80B99F8
sub_80B99F8: @ 0x080B99F8
	push {lr}
	ldr r0, _080B9A04 @ =gUnk_08DB8944
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B9A04: .4byte gUnk_08DB8944

	thumb_func_start DrawFinImage
DrawFinImage: @ 0x080B9A08
	push {lr}
	ldr r0, _080B9A34 @ =gUnk_08618410
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9A38 @ =gUnk_08618430
	ldr r1, _080B9A3C @ =0x06001000
	bl Decompress
	ldr r0, _080B9A40 @ =gBg2Tm
	ldr r1, _080B9A44 @ =gUnk_0861882C
	ldr r2, _080B9A48 @ =0x0000E080
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B9A34: .4byte gUnk_08618410
_080B9A38: .4byte gUnk_08618430
_080B9A3C: .4byte 0x06001000
_080B9A40: .4byte gBg2Tm
_080B9A44: .4byte gUnk_0861882C
_080B9A48: .4byte 0x0000E080

	thumb_func_start sub_80B9A4C
sub_80B9A4C: @ 0x080B9A4C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x58]
	bl InitBgs
	movs r0, #0x86
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9A94
	ldr r0, _080B9A90 @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x40
	str r2, [sp]
	movs r2, #1
	movs r3, #7
	bl sub_80B7980
	movs r0, #8
	bl EnableBgSync
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B9A98
	.align 2, 0
_080B9A90: .4byte gBg3Tm
_080B9A94:
	bl DrawFinImage
_080B9A98:
	ldr r3, _080B9AC0 @ =gDispIo
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
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9AC0: .4byte gDispIo

	thumb_func_start sub_80B9AC4
sub_80B9AC4: @ 0x080B9AC4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	adds r0, #1
	str r0, [r2, #0x58]
	ldr r0, _080B9AE4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #9
	ldrh r3, [r1, #8]
	ands r0, r3
	cmp r0, #0
	beq _080B9AE8
	adds r0, r2, #0
	bl Proc_Break
	b _080B9B18
	.align 2, 0
_080B9AE4: .4byte gpKeySt
_080B9AE8:
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080B9B12
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _080B9B18
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _080B9B18
_080B9B12:
	adds r0, r2, #0
	adds r0, #0x4c
	strh r1, [r0]
_080B9B18:
	pop {r0}
	bx r0

	thumb_func_start sub_80B9B1C
sub_80B9B1C: @ 0x080B9B1C
	push {r4, lr}
	ldr r1, _080B9B74 @ =gDispIo
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r3, [r1]
	mov r2, ip
	adds r2, #0x45
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x46
	strb r3, [r1]
	ldr r1, _080B9B78 @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #4
	orrs r1, r2
	ldr r2, _080B9B7C @ =0x0000E0FF
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r0, #0x4c
	strh r3, [r0]
	bl DrawFinImage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B74: .4byte gDispIo
_080B9B78: .4byte 0x0000FFE0
_080B9B7C: .4byte 0x0000E0FF

	thumb_func_start sub_80B9B80
sub_80B9B80: @ 0x080B9B80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _080B9BD0 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r5, [r0]
	cmp r2, #0x10
	bne _080B9BC8
	adds r0, r6, #0
	bl Proc_Break
	strh r5, [r4]
_080B9BC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9BD0: .4byte gDispIo

	thumb_func_start sub_80B9BD4
sub_80B9BD4: @ 0x080B9BD4
	ldr r2, _080B9C04 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080B9C08 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	bx lr
	.align 2, 0
_080B9C04: .4byte gDispIo
_080B9C08: .4byte 0x0000FFE0

	thumb_func_start sub_80B9C0C
sub_80B9C0C: @ 0x080B9C0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9C1C @ =gUnk_08DB8964
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9C1C: .4byte gUnk_08DB8964

	thumb_func_start sub_80B9C20
sub_80B9C20: @ 0x080B9C20
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080B9C70 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080B9C74 @ =Pal_ChapterIntroFog
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9C78 @ =Img_ChapterIntroFog
	ldr r1, _080B9C7C @ =0x06004000
	bl Decompress
	ldr r0, _080B9C80 @ =gBg2Tm
	ldr r1, _080B9C84 @ =Tsa_QuintessenceFx
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9C70: .4byte gDispIo
_080B9C74: .4byte Pal_ChapterIntroFog
_080B9C78: .4byte Img_ChapterIntroFog
_080B9C7C: .4byte 0x06004000
_080B9C80: .4byte gBg2Tm
_080B9C84: .4byte Tsa_QuintessenceFx

	thumb_func_start sub_80B9C88
sub_80B9C88: @ 0x080B9C88
	push {lr}
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	cmp r0, #0
	bge _080B9CA0
	adds r0, #7
_080B9CA0:
	lsls r0, r0, #0xd
	lsrs r1, r0, #0x10
	adds r0, r2, #0
	cmp r0, #0
	bge _080B9CAC
	adds r0, #3
_080B9CAC:
	lsls r2, r0, #0xe
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B9CBC
sub_80B9CBC: @ 0x080B9CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x30]
	movs r0, #0x20
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
	str r5, [r4, #0x2c]
	bl GetNextChapterStatsSlot
	adds r4, #0x38
	strb r0, [r4]
	ldr r7, _080B9D94 @ =gDispIo
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r2, #3
	rsbs r2, r2, #0
	mov sl, r2
	ands r0, r2
	movs r1, #5
	rsbs r1, r1, #0
	mov sb, r1
	ands r0, r1
	subs r2, #6
	mov r8, r2
	ands r0, r2
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r7, #1]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	ldrb r0, [r7, #1]
	ands r4, r0
	mov r1, sl
	ands r4, r1
	mov r2, sb
	ands r4, r2
	mov r0, r8
	ands r4, r0
	ands r4, r6
	strb r4, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	bl ResetText
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	ldr r0, _080B9D98 @ =gUnk_0861A420
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B9D9C @ =Img_TitleBg
	ldr r1, _080B9DA0 @ =0x06008000
	bl Decompress
	ldr r0, _080B9DA4 @ =gBg3Tm
	ldr r1, _080B9DA8 @ =gUnk_0861A460
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9D94: .4byte gDispIo
_080B9D98: .4byte gUnk_0861A420
_080B9D9C: .4byte Img_TitleBg
_080B9DA0: .4byte 0x06008000
_080B9DA4: .4byte gBg3Tm
_080B9DA8: .4byte gUnk_0861A460

	thumb_func_start sub_80B9DAC
sub_80B9DAC: @ 0x080B9DAC
	push {r4, r5, r6, lr}
	ldr r2, _080B9E8C @ =0x0000FF78
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080B9E90 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	movs r4, #0
	ldr r6, _080B9E94 @ =gUnk_08DB8B60
	movs r5, #0x48
_080B9E24:
	lsls r1, r4, #3
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #3
	bl InitText
	ldr r0, [r6]
	adds r0, r0, r5
	movs r1, #9
	bl InitText
	adds r5, #8
	adds r4, #1
	cmp r4, #8
	ble _080B9E24
	ldr r5, _080B9E94 @ =gUnk_08DB8B60
	ldr r0, [r5]
	adds r0, #0x90
	movs r1, #3
	bl InitText
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #2
	bl InitText
	ldr r4, [r5]
	adds r4, #0x90
	ldr r0, _080B9E98 @ =0x00001181
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #3
	bl Text_SetColor
	ldr r4, [r5]
	adds r4, #0x98
	ldr r0, _080B9E9C @ =0x0000117A
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E8C: .4byte 0x0000FF78
_080B9E90: .4byte gDispIo
_080B9E94: .4byte gUnk_08DB8B60
_080B9E98: .4byte 0x00001181
_080B9E9C: .4byte 0x0000117A

	thumb_func_start sub_80B9EA0
sub_80B9EA0: @ 0x080B9EA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #9
	bl __modsi3
	str r0, [sp, #0xc]
	lsls r7, r4, #1
	movs r0, #0x1f
	ands r7, r0
	lsls r6, r7, #5
	lsls r0, r7, #6
	ldr r1, _080B9F50 @ =gBg1Tm
	mov sl, r1
	add r0, sl
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080B9F54 @ =gUnk_08DB8B60
	mov sb, r2
	ldr r3, [sp, #0xc]
	lsls r4, r3, #3
	ldr r0, [r2]
	adds r0, r0, r4
	bl ClearText
	adds r5, r4, #0
	adds r5, #0x48
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #8]
	cmp r2, r0
	bne _080B9F5C
	bl sub_80A0628
	adds r4, r0, #0
	mov r3, sb
	ldr r0, [r3]
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0xb
	lsls r1, r1, #1
	add r1, sl
	ldr r2, [sp, #0x10]
	str r2, [sp]
	ldr r2, _080B9F58 @ =gUnk_08622C70
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r0, #0x15
	lsls r0, r0, #1
	add r0, sl
	movs r1, #2
	adds r2, r4, #0
	bl PutNumber
	mov r3, sb
	ldr r0, [r3]
	adds r0, #0x90
	adds r1, r6, #0
	adds r1, #0x16
	lsls r1, r1, #1
	add r1, sl
	bl PutText
	movs r0, #0
	b _080BA140
	.align 2, 0
_080B9F50: .4byte gBg1Tm
_080B9F54: .4byte gUnk_08DB8B60
_080B9F58: .4byte gUnk_08622C70
_080B9F5C:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _080B9F64
	b _080BA13E
_080B9F64:
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r8, r0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080B9F98 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B9F7E
	movs r2, #1
_080B9F7E:
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r2, r0, #1
	mov r1, r8
	cmp r1, #0x19
	beq _080B9FE8
	cmp r1, #0x19
	bgt _080B9F9C
	cmp r1, #0
	beq _080B9FC8
	b _080BA012
	.align 2, 0
_080B9F98: .4byte gPlaySt
_080B9F9C:
	mov r3, r8
	cmp r3, #0x2f
	bgt _080BA012
	cmp r3, #0x2e
	blt _080BA012
	ldr r0, _080B9FC4 @ =0x0000117D
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r6, #5
	lsls r1, r1, #1
	add r1, sl
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	b _080BA068
	.align 2, 0
_080B9FC4: .4byte 0x0000117D
_080B9FC8:
	ldr r0, _080B9FE4 @ =0x0000117E
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r6, #5
	lsls r1, r1, #1
	add r1, sl
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	b _080BA068
	.align 2, 0
_080B9FE4: .4byte 0x0000117E
_080B9FE8:
	adds r0, r6, #5
	lsls r0, r0, #1
	add r0, sl
	movs r1, #2
	bl PutNumber
	movs r0, #0x8c
	lsls r0, r0, #5
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r6, #6
	lsls r1, r1, #1
	add r1, sl
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	b _080BA068
_080BA012:
	lsls r4, r7, #5
	subs r0, r4, #1
	adds r0, #6
	lsls r0, r0, #1
	ldr r7, _080BA074 @ =gBg1Tm
	adds r0, r0, r7
	movs r1, #2
	bl PutNumber
	mov r0, r8
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080BA078 @ =gPlaySt
	adds r6, r4, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080BA03A
	movs r2, #1
_080BA03A:
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	movs r5, #1
	ldrb r0, [r0]
	ands r5, r0
	cmp r5, #0
	beq _080BA084
	ldr r0, _080BA07C @ =0x0000117F
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080BA080 @ =gUnk_08DB8B60
	ldr r1, [sp, #0xc]
	lsls r4, r1, #3
	ldr r0, [r0]
	adds r0, r0, r4
	adds r1, r6, #6
	lsls r1, r1, #1
	adds r1, r1, r7
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
_080BA068:
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _080BA0A8
	.align 2, 0
_080BA074: .4byte gBg1Tm
_080BA078: .4byte gPlaySt
_080BA07C: .4byte 0x0000117F
_080BA080: .4byte gUnk_08DB8B60
_080BA084:
	ldr r0, _080BA0C8 @ =0x0000117B
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, _080BA0CC @ =gUnk_08DB8B60
	ldr r3, [sp, #0xc]
	lsls r4, r3, #3
	ldr r0, [r0]
	adds r0, r0, r4
	adds r1, r6, #6
	lsls r1, r1, #1
	adds r1, r1, r7
	str r5, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
_080BA0A8:
	mov r0, r8
	cmp r0, #0x2f
	bgt _080BA0D0
	cmp r0, #0x2e
	blt _080BA0D0
	ldr r1, [sp, #8]
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
	ldr r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
	movs r2, #1
	str r2, [sp, #0x10]
	b _080BA0D8
	.align 2, 0
_080BA0C8: .4byte 0x0000117B
_080BA0CC: .4byte gUnk_08DB8B60
_080BA0D0:
	ldr r3, [sp, #8]
	ldr r0, [r3]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
_080BA0D8:
	mov r0, r8
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080BA150 @ =gPlaySt
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080BA0EC
	movs r1, #2
_080BA0EC:
	adds r0, r2, #0
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r5, _080BA154 @ =gUnk_08DB8B60
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, [r5]
	adds r0, r0, r1
	adds r1, r6, #4
	adds r1, #6
	lsls r1, r1, #1
	ldr r4, _080BA158 @ =gBg1Tm
	adds r1, r1, r4
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r0, #0xf
	adds r0, #6
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #2
	adds r2, r7, #0
	bl PutNumber
	ldr r0, [r5]
	adds r0, #0x90
	adds r1, r6, #0
	adds r1, #0x10
	adds r1, #6
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
_080BA13E:
	ldr r0, [sp, #0x10]
_080BA140:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BA150: .4byte gPlaySt
_080BA154: .4byte gUnk_08DB8B60
_080BA158: .4byte gBg1Tm

	thumb_func_start sub_80BA15C
sub_80BA15C: @ 0x080BA15C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	asrs r5, r0, #6
	adds r2, r5, #0
	subs r2, #0x88
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ands r0, r5
	cmp r0, #0
	bne _080BA1DE
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	adds r2, r5, #0
	adds r5, r0, #0
	cmp r2, #0
	bge _080BA18C
	adds r2, #0xf
_080BA18C:
	asrs r0, r2, #4
	cmp r1, r0
	bne _080BA1DE
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r2, [r0]
	ldr r0, [r4, #0x2c]
	cmp r0, r2
	blt _080BA1C2
	subs r0, r0, r2
	cmp r0, #1
	bne _080BA1AE
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80B9EA0
	b _080BA1D2
_080BA1AE:
	cmp r0, #2
	ble _080BA1BA
	adds r0, r4, #0
	bl Proc_Break
	b _080BA1D2
_080BA1BA:
	movs r0, #0
	bl sub_80B9EA0
	b _080BA1D2
_080BA1C2:
	bl GetChapterStats
	ldrb r1, [r5]
	bl sub_80B9EA0
	ldr r1, [r4, #0x2c]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
_080BA1D2:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080BA1DE:
	ldr r0, _080BA200 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	ldr r1, [r4, #0x34]
	cmp r0, #0
	beq _080BA1F4
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_080BA1F4:
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA200: .4byte gpKeySt

	thumb_func_start sub_80BA204
sub_80BA204: @ 0x080BA204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	ldr r3, _080BA3F4 @ =gUnk_08DB8A2C
	ldr r0, _080BA3F8 @ =0x00009480
	str r0, [sp]
	movs r0, #2
	movs r1, #0x18
	movs r2, #0x14
	bl PutSpriteExt
	ldr r3, _080BA3FC @ =gUnk_08DB8AA0
	movs r0, #0xc9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x80
	bl PutSpriteExt
	ldr r1, _080BA400 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080BA242
	b _080BA42C
_080BA242:
	ldr r3, _080BA404 @ =gUnk_08DB8A4C
	ldr r4, _080BA408 @ =0x00008480
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x38
	bl PutSpriteExt
	ldr r3, _080BA40C @ =gUnk_08DB8A5A
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x38
	bl PutSpriteExt
	ldr r3, _080BA410 @ =gUnk_08DB8A76
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x58
	bl PutSpriteExt
	ldr r3, _080BA414 @ =gUnk_08DB8A92
	movs r0, #0xe9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x58
	bl PutSpriteExt
	movs r7, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	mov sl, r0
	ldr r1, _080BA418 @ =gSinLut
	mov sb, r1
	mov r8, sl
_080BA28E:
	mov r2, r8
	ldrh r2, [r2]
	cmp r2, #0x10
	bls _080BA33C
	ldr r4, _080BA41C @ =gCosLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r4, r8
	ldrh r1, [r4]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080BA41C @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r2, r7, #1
	lsls r2, r2, #5
	movs r4, #0x98
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA420 @ =gUnk_08DB8B10
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x90
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080BA33C:
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #2
	ble _080BA28E
	lsls r0, r7, #1
	add sl, r0
	mov r1, sl
	ldrh r1, [r1]
	cmp r1, #0x10
	bhi _080BA354
	b _080BA5FE
_080BA354:
	ldr r4, _080BA418 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r2, r7, #1
	lsls r2, r2, #5
	movs r4, #0x98
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA424 @ =gUnk_08DB8B28
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080BA428 @ =0x0000F480
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	b _080BA5FE
	.align 2, 0
_080BA3F4: .4byte gUnk_08DB8A2C
_080BA3F8: .4byte 0x00009480
_080BA3FC: .4byte gUnk_08DB8AA0
_080BA400: .4byte gPlaySt
_080BA404: .4byte gUnk_08DB8A4C
_080BA408: .4byte 0x00008480
_080BA40C: .4byte gUnk_08DB8A5A
_080BA410: .4byte gUnk_08DB8A76
_080BA414: .4byte gUnk_08DB8A92
_080BA418: .4byte gSinLut
_080BA41C: .4byte gCosLut
_080BA420: .4byte gUnk_08DB8B10
_080BA424: .4byte gUnk_08DB8B28
_080BA428: .4byte 0x0000F480
_080BA42C:
	ldr r3, _080BA610 @ =gUnk_08DB8A4C
	ldr r4, _080BA614 @ =0x00008480
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x30
	bl PutSpriteExt
	ldr r3, _080BA618 @ =gUnk_08DB8A5A
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x30
	bl PutSpriteExt
	ldr r3, _080BA61C @ =gUnk_08DB8A84
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _080BA620 @ =gUnk_08DB8A68
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _080BA624 @ =gUnk_08DB8A76
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x60
	bl PutSpriteExt
	ldr r3, _080BA628 @ =gUnk_08DB8A92
	movs r0, #0xe9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x60
	bl PutSpriteExt
	movs r7, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	mov sl, r0
	ldr r1, _080BA62C @ =gSinLut
	mov sb, r1
	mov r8, sl
_080BA494:
	mov r2, r8
	ldrh r2, [r2]
	cmp r2, #0x10
	bls _080BA546
	ldr r4, _080BA630 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r4, r8
	ldrh r1, [r4]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080BA630 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r0, r7, #1
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	movs r4, #0x94
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA634 @ =gUnk_08DB8B10
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x90
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080BA546:
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #4
	ble _080BA494
	lsls r0, r7, #1
	add sl, r0
	mov r1, sl
	ldrh r1, [r1]
	cmp r1, #0x10
	bls _080BA5FE
	ldr r4, _080BA62C @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r0, r7, #1
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	movs r4, #0x94
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA638 @ =gUnk_08DB8B28
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080BA63C @ =0x0000F480
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080BA5FE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA610: .4byte gUnk_08DB8A4C
_080BA614: .4byte 0x00008480
_080BA618: .4byte gUnk_08DB8A5A
_080BA61C: .4byte gUnk_08DB8A84
_080BA620: .4byte gUnk_08DB8A68
_080BA624: .4byte gUnk_08DB8A76
_080BA628: .4byte gUnk_08DB8A92
_080BA62C: .4byte gSinLut
_080BA630: .4byte gCosLut
_080BA634: .4byte gUnk_08DB8B10
_080BA638: .4byte gUnk_08DB8B28
_080BA63C: .4byte 0x0000F480

	thumb_func_start sub_80BA640
sub_80BA640: @ 0x080BA640
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x30]
	str r0, [r5, #0x2c]
	bl UnpackUiWindowFrameGraphics
	ldr r0, _080BA71C @ =gBg1Tm
	ldr r1, _080BA720 @ =gUnk_0861A914
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _080BA724 @ =gUnk_08618CE0
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080BA728 @ =gUnk_08618D20
	ldr r1, _080BA72C @ =0x06011000
	bl Decompress
	movs r4, #0
	movs r0, #0xa
	add r0, sp
	mov sb, r0
	add r1, sp, #0xc
	mov sl, r1
_080BA684:
	adds r1, r4, #0
	adds r1, #0x1a
	lsls r1, r1, #5
	ldr r0, _080BA730 @ =gUnk_0861A360
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080BA684
	ldr r0, _080BA734 @ =gUnk_0861A3E0
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA738 @ =gUnk_0861A380
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA73C @ =gUnk_0861A3A0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0xf
	bl EnableBgSync
	ldr r4, _080BA740 @ =gPlaySt
	movs r0, #0x80
	ldrb r6, [r4, #0x14]
	ands r0, r6
	cmp r0, #0
	beq _080BA744
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_80B74C0
	adds r6, r5, #0
	adds r6, #0x3a
	strb r0, [r6]
	bl sub_80B7540
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	bl sub_80B776C
	adds r2, r5, #0
	adds r2, #0x3c
	strb r0, [r2]
	ldrb r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r2]
	bl sub_80B7448
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl StartBgm
	b _080BA7AA
	.align 2, 0
_080BA71C: .4byte gBg1Tm
_080BA720: .4byte gUnk_0861A914
_080BA724: .4byte gUnk_08618CE0
_080BA728: .4byte gUnk_08618D20
_080BA72C: .4byte 0x06011000
_080BA730: .4byte gUnk_0861A360
_080BA734: .4byte gUnk_0861A3E0
_080BA738: .4byte gUnk_0861A380
_080BA73C: .4byte gUnk_0861A3A0
_080BA740: .4byte gPlaySt
_080BA744:
	bl sub_80A05FC
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_80B7100
	movs r7, #0x3a
	adds r7, r7, r5
	mov r8, r7
	strb r0, [r7]
	bl sub_80B71F8
	adds r7, r5, #0
	adds r7, #0x3b
	strb r0, [r7]
	bl sub_80B735C
	adds r4, r5, #0
	adds r4, #0x3c
	strb r0, [r4]
	bl sub_80B7230
	adds r6, r5, #0
	adds r6, #0x3d
	strb r0, [r6]
	bl sub_80B7328
	movs r1, #0x3e
	adds r1, r1, r5
	mov ip, r1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r7]
	ldrb r2, [r4]
	ldrb r3, [r6]
	mov r6, ip
	ldrb r4, [r6]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl StartBgm
_080BA7AA:
	ldr r4, _080BA850 @ =gBg0Tm + 0x440
	adds r0, r4, #0
	adds r0, #0xa
	add r1, sp, #8
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x10
	mov r7, sb
	ldrh r2, [r7]
	movs r1, #2
	bl sub_800625C
	adds r0, r4, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x16
	mov r1, sl
	ldrh r2, [r1]
	movs r1, #2
	bl sub_800625C
	movs r4, #0
	adds r3, r5, #0
	adds r3, #0x4c
	movs r6, #0
	mov r8, r6
	movs r7, #0
	mov sb, r7
	adds r2, r5, #0
	adds r2, #0x46
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_080BA806:
	lsls r0, r4, #1
	adds r0, r3, r0
	mov r7, sb
	strh r7, [r0]
	adds r0, r2, r4
	strb r6, [r0]
	adds r0, r1, r4
	mov r7, r8
	strb r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _080BA806
	ldr r0, _080BA854 @ =sub_80BA204
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _080BA858 @ =gUnk_0861A3A0
	adds r1, r0, #0
	adds r1, #0x20
	movs r2, #1
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #0x17
	bl StartMixPalette
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA850: .4byte gBg0Tm + 0x440
_080BA854: .4byte sub_80BA204
_080BA858: .4byte gUnk_0861A3A0

	thumb_func_start sub_80BA85C
sub_80BA85C: @ 0x080BA85C
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, _080BA8CC @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r2, [r3]
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r3]
	mov r2, ip
	adds r2, #0x44
	movs r3, #0
	movs r5, #8
	movs r0, #8
	strb r0, [r2]
	adds r2, #1
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080BA8D0 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r2, #4
	orrs r0, r2
	ldr r2, _080BA8D4 @ =0x0000E0FF
	ands r0, r2
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r2, r3, #0
	orrs r0, r2
	mov r2, ip
	strh r0, [r2, #0x3c]
	movs r0, #1
	ldrb r3, [r2, #1]
	orrs r0, r3
	movs r2, #2
	orrs r0, r2
	movs r2, #4
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	mov r2, ip
	strb r0, [r2, #1]
	ldr r0, _080BA8D8 @ =gUnk_08DB8B40
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA8CC: .4byte gDispIo
_080BA8D0: .4byte 0x0000FFE0
_080BA8D4: .4byte 0x0000E0FF
_080BA8D8: .4byte gUnk_08DB8B40

	thumb_func_start sub_80BA8DC
sub_80BA8DC: @ 0x080BA8DC
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #0x10
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, [r4, #0x58]
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BA918
sub_80BA918: @ 0x080BA918
	push {r4, lr}
	sub sp, #0x14
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r4, [r0, #0x58]
	adds r4, #0x10
	movs r1, #1
	lsls r1, r4
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80BA948
sub_80BA948: @ 0x080BA948
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BA95C @ =gUnk_08DB8B64
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA95C: .4byte gUnk_08DB8B64

	thumb_func_start sub_80BA960
sub_80BA960: @ 0x080BA960
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r2, r3, #0
	adds r2, #0x20
	str r2, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x4c
	adds r5, r1, r0
	adds r0, r2, #0
	cmp r2, #0
	bge _080BA980
	ldr r1, _080BA9A4 @ =0x0000021F
	adds r0, r3, r1
_080BA980:
	asrs r0, r0, #9
	lsls r0, r0, #9
	subs r0, r2, r0
	cmp r0, #0xff
	ble _080BA9AC
	adds r0, r2, #0
	cmp r2, #0
	bge _080BA994
	ldr r1, _080BA9A8 @ =0x0000011F
	adds r0, r3, r1
_080BA994:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	b _080BA9BC
	.align 2, 0
_080BA9A4: .4byte 0x0000021F
_080BA9A8: .4byte 0x0000011F
_080BA9AC:
	adds r0, r2, #0
	cmp r2, #0
	bge _080BA9B6
	ldr r1, _080BAA18 @ =0x0000011F
	adds r0, r3, r1
_080BA9B6:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r1, r2, r0
_080BA9BC:
	strh r1, [r5]
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	adds r2, r4, #0
	adds r2, #0x40
	cmp r0, #0
	bne _080BA9DA
	adds r1, r2, r1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080BA9DA:
	ldr r3, [r4, #0x2c]
	adds r1, r2, r3
	adds r0, r4, #0
	adds r0, #0x3a
	adds r0, r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080BAA48
	lsls r0, r3, #1
	adds r0, r5, r0
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0]
	cmp r0, r1
	bne _080BAA48
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r1, _080BAA1C @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080BAA20
	cmp r3, #3
	bne _080BAA20
	movs r0, #0xf
	adds r1, r4, #0
	bl sub_80BA948
	b _080BAA2A
	.align 2, 0
_080BAA18: .4byte 0x0000011F
_080BAA1C: .4byte gPlaySt
_080BAA20:
	ldr r0, [r4, #0x2c]
	adds r0, #0xa
	adds r1, r4, #0
	bl sub_80BA948
_080BAA2A:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldr r0, _080BAA50 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BAA42
	movs r0, #0x85
	bl m4aSongNumStart
_080BAA42:
	adds r0, r4, #0
	bl Proc_Break
_080BAA48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA50: .4byte gPlaySt

	thumb_func_start sub_80BAA54
sub_80BAA54: @ 0x080BAA54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BAA7C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BAA74
	movs r0, #1
	rsbs r0, r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
_080BAA74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA7C: .4byte gpKeySt

	thumb_func_start sub_80BAA80
sub_80BAA80: @ 0x080BAA80
	push {lr}
	movs r0, #3
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_80BAA8C
sub_80BAA8C: @ 0x080BAA8C
	push {lr}
	adds r2, r0, #0
	ldr r1, _080BAAA8 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080BAAAC
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _080BAAB4
	.align 2, 0
_080BAAA8: .4byte gPlaySt
_080BAAAC:
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080BAAB4:
	pop {r0}
	bx r0

	thumb_func_start sub_80BAAB8
sub_80BAAB8: @ 0x080BAAB8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAAC8 @ =gUnk_08DB8B94
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BAAC8: .4byte gUnk_08DB8B94

	thumb_func_start sub_80BAACC
sub_80BAACC: @ 0x080BAACC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAADC @ =gUnk_08DB8CBC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BAADC: .4byte gUnk_08DB8CBC

	thumb_func_start sub_80BAAE0
sub_80BAAE0: @ 0x080BAAE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	str r1, [r5, #0x2c]
	movs r0, #0x18
	str r0, [r5, #0x3c]
	movs r4, #0
	strh r1, [r5, #0x38]
	ldr r0, _080BABF8 @ =gUnk_08DB8D1C
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x34
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	bl ResetText
	ldr r2, _080BABFC @ =gDispIo
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
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BAC00 @ =gUnk_0861AB70
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	ldr r6, _080BAC04 @ =0x06008000
_080BAB5C:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BAB7A
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #0xc
	adds r1, r1, r6
	bl Decompress
_080BAB7A:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _080BAB5C
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #8
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0x60
	bl SetBgOffset
	movs r0, #0x2a
	movs r1, #0
	bl StartBgm
	ldr r3, _080BABFC @ =gDispIo
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
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BAC08 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BAC0C @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_80BAE6C
	ldr r0, _080BAC10 @ =sub_80BAEA8
	bl SetOnHBlankA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BABF8: .4byte gUnk_08DB8D1C
_080BABFC: .4byte gDispIo
_080BAC00: .4byte gUnk_0861AB70
_080BAC04: .4byte 0x06008000
_080BAC08: .4byte 0x0000FFE0
_080BAC0C: .4byte 0x0000E0FF
_080BAC10: .4byte sub_80BAEA8

	thumb_func_start sub_80BAC14
sub_80BAC14: @ 0x080BAC14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	lsrs r7, r0, #3
	movs r0, #0x1f
	ands r7, r0
	ldr r0, [r4, #0x2c]
	asrs r2, r0, #6
	strh r2, [r4, #0x38]
	lsls r1, r2, #0x10
	ldr r0, _080BAC48 @ =0x061F0000
	cmp r1, r0
	bls _080BAC4C
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
	b _080BAD54
	.align 2, 0
_080BAC48: .4byte 0x061F0000
_080BAC4C:
	subs r2, #0xa0
	movs r0, #0xff
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x34
	mov r8, r0
	ldrb r1, [r0]
	cmp r1, #5
	bhi _080BACAA
	ldr r0, [r4, #0x30]
	mov r5, r8
	ldrb r2, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r5, [r1]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #0xc
	lsls r2, r2, #0xb
	ldr r1, _080BAC94 @ =0x06008000
	adds r2, r2, r1
	adds r1, r0, r2
	cmp r3, #0
	beq _080BAC98
	adds r0, r3, #0
	bl Decompress
	b _080BACA2
	.align 2, 0
_080BAC94: .4byte 0x06008000
_080BAC98:
	str r3, [sp]
	ldr r2, _080BAD40 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
_080BACA2:
	mov r5, r8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080BACAA:
	movs r0, #7
	mov sb, r0
	mov r1, sb
	ands r1, r7
	mov sb, r1
	cmp r1, #0
	bne _080BAD1E
	ldr r0, [r4, #0x30]
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r2, [r6]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r7, #0
	asrs r0, r0, #3
	cmp r2, r0
	bne _080BAD1E
	cmp r3, #0
	beq _080BAD54
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x17
	movs r1, #0xa0
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x10
	lsls r0, r7, #6
	ldr r1, _080BAD44 @ =gBg3Tm
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080BAD1E
	mov r0, sb
	strb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	movs r0, #1
	ldrb r1, [r5]
	subs r0, r0, r1
	strb r0, [r5]
	ldr r0, [r4, #0x30]
	adds r0, #0x28
	str r0, [r4, #0x30]
_080BAD1E:
	ldr r0, _080BAD48 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BAD4C
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BAD54
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080BAD54
	.align 2, 0
_080BAD40: .4byte 0x01000200
_080BAD44: .4byte gBg3Tm
_080BAD48: .4byte gpKeySt
_080BAD4C:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #0x2c]
_080BAD54:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BAD64
sub_80BAD64: @ 0x080BAD64
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080BAE04 @ =gUnk_08DB8DE4
	str r0, [r5, #0x30]
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080BAE08 @ =gUnk_0861AB70
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	ldr r0, _080BAE0C @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r4, #0
	ldr r6, _080BAE10 @ =0x06008000
_080BAD96:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BADB4
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #0xc
	adds r1, r1, r6
	bl Decompress
_080BADB4:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _080BAD96
	movs r4, #1
_080BADC2:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r3, #0
	beq _080BADF0
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #0x17
	movs r0, #0xa0
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	lsls r0, r4, #9
	ldr r1, _080BAE0C @ =gBg3Tm
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
_080BADF0:
	adds r4, #1
	cmp r4, #3
	ble _080BADC2
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE04: .4byte gUnk_08DB8DE4
_080BAE08: .4byte gUnk_0861AB70
_080BAE0C: .4byte gBg3Tm
_080BAE10: .4byte 0x06008000

	thumb_func_start sub_80BAE14
sub_80BAE14: @ 0x080BAE14
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r2, _080BAE50 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080BAE54 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
_080BAE50: .4byte gDispIo
_080BAE54: .4byte 0x0000FFE0

	thumb_func_start sub_80BAE58
sub_80BAE58: @ 0x080BAE58
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAE68 @ =gUnk_08DB8E34
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BAE68: .4byte gUnk_08DB8E34

	thumb_func_start sub_80BAE6C
sub_80BAE6C: @ 0x080BAE6C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r3, _080BAEA4 @ =gUnk_08DB8ED4
	adds r6, r3, #0
	movs r5, #0x10
	movs r0, #0x60
	rsbs r0, r0, #0
	adds r4, r0, #0
_080BAE7C:
	ldr r0, [r3]
	adds r0, r0, r2
	strb r5, [r0]
	cmp r2, #0xf
	bgt _080BAE8C
	ldr r0, [r6]
	adds r0, r0, r2
	strb r2, [r0]
_080BAE8C:
	cmp r2, #0x90
	ble _080BAE98
	ldr r0, [r3]
	adds r0, r0, r2
	subs r1, r4, r2
	strb r1, [r0]
_080BAE98:
	adds r2, #1
	cmp r2, #0xa0
	ble _080BAE7C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAEA4: .4byte gUnk_08DB8ED4

	thumb_func_start sub_80BAEA8
sub_80BAEA8: @ 0x080BAEA8
	ldr r0, _080BAEC8 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080BAEB8
	movs r2, #0
_080BAEB8:
	ldr r1, _080BAECC @ =0x04000052
	ldr r0, _080BAED0 @ =gUnk_08DB8ED4
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BAEC8: .4byte 0x04000006
_080BAECC: .4byte 0x04000052
_080BAED0: .4byte gUnk_08DB8ED4
