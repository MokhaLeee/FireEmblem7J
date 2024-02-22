	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80647C8
sub_80647C8: @ 0x080647C8
	ldr r0, _080647D4 @ =0x0203E0CC
	movs r1, #0
	str r1, [r0]
	ldr r0, _080647D8 @ =0x0203E0D0
	str r1, [r0]
	bx lr
	.align 2, 0
_080647D4: .4byte 0x0203E0CC
_080647D8: .4byte 0x0203E0D0

	thumb_func_start sub_80647DC
sub_80647DC: @ 0x080647DC
	push {r4, lr}
	ldr r4, _080647F4 @ =0x0203E0CC
	ldr r0, [r4]
	cmp r0, #0
	beq _080647EE
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_080647EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080647F4: .4byte 0x0203E0CC

	thumb_func_start sub_80647F8
sub_80647F8: @ 0x080647F8
	push {r4, lr}
	ldr r4, _08064810 @ =0x0203E0D0
	ldr r0, [r4]
	cmp r0, #0
	beq _0806480A
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0806480A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064810: .4byte 0x0203E0D0

	thumb_func_start sub_8064814
sub_8064814: @ 0x08064814
	ldr r1, _0806481C @ =0x0203E0CC
	str r0, [r1]
	bx lr
	.align 2, 0
_0806481C: .4byte 0x0203E0CC

	thumb_func_start sub_8064820
sub_8064820: @ 0x08064820
	ldr r1, _08064828 @ =0x0203E0D0
	str r0, [r1]
	bx lr
	.align 2, 0
_08064828: .4byte 0x0203E0D0

	thumb_func_start sub_806482C
sub_806482C: @ 0x0806482C
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start sub_8064834
sub_8064834: @ 0x08064834
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064850
	ldr r0, _0806484C @ =gUnk_081DE20D
	ldrh r1, [r4, #2]
	ldrb r0, [r0]
	subs r0, r1, r0
	b _08064858
	.align 2, 0
_0806484C: .4byte gUnk_081DE20D
_08064850:
	ldr r0, _08064888 @ =gUnk_081DE212
	ldrb r0, [r0]
	ldrh r3, [r4, #2]
	subs r0, r0, r3
_08064858:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x58
	ldrh r4, [r4, #4]
	subs r2, r2, r4
	ldrh r0, [r5, #0x12]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r5, [r5, #4]
	subs r2, r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064888: .4byte gUnk_081DE212

	thumb_func_start sub_806488C
sub_806488C: @ 0x0806488C
	push {r4, lr}
	sub sp, #4
	bl sub_806482C
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x14]
	ldr r2, _080648B8 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080648B8: .4byte 0x01000200

	thumb_func_start sub_80648BC
sub_80648BC: @ 0x080648BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_806482C
	mov r8, r0
	cmp r4, #0
	bne _080648DC
	adds r0, r7, #0
	b _080648DE
_080648DC:
	adds r0, r6, #0
_080648DE:
	movs r1, #0x78
	bl AnimCreate
	adds r2, r0, #0
	mov r1, r8
	ldrh r1, [r1, #0x10]
	lsls r0, r1, #0xc
	mov r3, r8
	ldrh r3, [r3, #0xe]
	orrs r0, r3
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8064910
sub_8064910: @ 0x08064910
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r5, r3, #0
	bl sub_806482C
	adds r4, r0, #0
	cmp r5, #1
	bne _08064932
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	bl LZ77UnCompWram
_08064932:
	adds r2, r6, #0
	cmp r5, #1
	bne _0806493A
	ldr r2, [r4, #0x1c]
_0806493A:
	cmp r7, #0
	bne _08064954
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08064968
_08064954:
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08064968:
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806497C
sub_806497C: @ 0x0806497C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_806482C
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	lsls r5, r0, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r5, r0
	ldr r1, [r4, #0x18]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x18]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80649AC
sub_80649AC: @ 0x080649AC
	push {r4, lr}
	adds r4, r1, #0
	bl sub_806482C
	ldrh r0, [r0, #0xc]
	lsls r1, r0, #5
	ldr r0, _080649D0 @ =gPal
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080649D0: .4byte gPal

	thumb_func_start sub_80649D4
sub_80649D4: @ 0x080649D4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_806482C
	adds r4, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r5, r0, #5
	ldr r0, _08064A00 @ =0x06010000
	adds r5, r5, r0
	ldr r1, [r4, #0x20]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064A00: .4byte 0x06010000

	thumb_func_start sub_8064A04
sub_8064A04: @ 0x08064A04
	push {r4, lr}
	adds r4, r1, #0
	bl sub_806482C
	ldrh r0, [r0, #0x10]
	lsls r1, r0, #5
	ldr r0, _08064A28 @ =gPal + 0x200
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064A28: .4byte gPal + 0x200

	thumb_func_start sub_8064A2C
sub_8064A2C: @ 0x08064A2C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_806482C
	ldr r1, _08064A4C @ =gUnk_08C13B24
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064A4C: .4byte gUnk_08C13B24

	thumb_func_start nullsub_52
nullsub_52: @ 0x08064A50
	bx lr
	.align 2, 0

	thumb_func_start sub_8064A54
sub_8064A54: @ 0x08064A54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064A70 @ =gUnk_08C13B44
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl sub_8064814
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064A70: .4byte gUnk_08C13B44

	thumb_func_start sub_8064A74
sub_8064A74: @ 0x08064A74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8064A94
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8064B40
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8064A94
sub_8064A94: @ 0x08064A94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806482C
	adds r6, r0, #0
	ldr r0, _08064AE0 @ =gUnk_08C13B6C
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064AE4 @ =gUnk_081EF4AC
	str r0, [r4, #0x48]
	ldr r0, _08064AE8 @ =gUnk_08C13B84
	str r0, [r4, #0x4c]
	ldr r1, _08064AEC @ =gUnk_08202F40
	adds r0, r5, #0
	bl sub_80649AC
	ldr r0, [r4, #0x5c]
	ldr r1, _08064AF0 @ =gUnk_08202348
	bl sub_806497C
	ldr r0, [r6, #0x24]
	bl _call_via_r0

	thumb_func_start sub_8064AD0
sub_8064AD0: @ 0x08064AD0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064AE0: .4byte gUnk_08C13B6C
_08064AE4: .4byte gUnk_081EF4AC
_08064AE8: .4byte gUnk_08C13B84
_08064AEC: .4byte gUnk_08202F40
_08064AF0: .4byte gUnk_08202348

	thumb_func_start sub_8064AF4
sub_8064AF4: @ 0x08064AF4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064B20
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_8064910
	b _08064B38
_08064B20:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064B38
	ldr r0, [r4, #0x5c]
	bl sub_806488C
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064B38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8064B40
sub_8064B40: @ 0x08064B40
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806482C
	adds r7, r0, #0
	ldr r0, _08064B7C @ =gUnk_08C13BB4
	adds r1, r4, #0
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08064B80 @ =gUnk_08C23A1C
	ldr r3, _08064B84 @ =gUnk_08C23694
	adds r0, r5, #0
	movs r1, #1
	bl sub_80648BC
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064B88
	ldrh r0, [r5, #2]
	subs r0, #8
	b _08064B8C
	.align 2, 0
_08064B7C: .4byte gUnk_08C13BB4
_08064B80: .4byte gUnk_08C23A1C
_08064B84: .4byte gUnk_08C23694
_08064B88:
	ldrh r0, [r5, #2]
	adds r0, #8
_08064B8C:
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	adds r0, #8
	strh r0, [r4, #4]
	ldrh r2, [r4, #2]
	ldrh r3, [r7, #6]
	adds r1, r2, r3
	strh r1, [r4, #2]
	ldrh r7, [r7, #8]
	adds r0, r7, r0
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _08064BB8 @ =gUnk_08204A74
	bl sub_8064A04
	ldr r0, [r6, #0x5c]
	ldr r1, _08064BBC @ =gUnk_08204478
	bl sub_80649D4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064BB8: .4byte gUnk_08204A74
_08064BBC: .4byte gUnk_08204478

	thumb_func_start sub_8064BC0
sub_8064BC0: @ 0x08064BC0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08064BDE
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08064BDE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8064BE4
sub_8064BE4: @ 0x08064BE4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064C00 @ =gUnk_08C13BCC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl sub_8064814
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064C00: .4byte gUnk_08C13BCC

	thumb_func_start sub_8064C04
sub_8064C04: @ 0x08064C04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8064C2C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8064D0C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8064D80
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8064C2C
sub_8064C2C: @ 0x08064C2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_806482C
	adds r6, r0, #0
	ldr r0, _08064C74 @ =gUnk_08C13BF4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064C78 @ =gUnk_081EF4DE
	str r0, [r4, #0x48]
	ldr r0, _08064C7C @ =gUnk_08C13C0C
	str r0, [r4, #0x4c]
	ldr r1, _08064C80 @ =gUnk_082019E4
	adds r0, r5, #0
	bl sub_80649AC
	ldr r0, [r4, #0x5c]
	ldr r1, _08064C84 @ =gUnk_08201128
	bl sub_806497C
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064C74: .4byte gUnk_08C13BF4
_08064C78: .4byte gUnk_081EF4DE
_08064C7C: .4byte gUnk_08C13C0C
_08064C80: .4byte gUnk_082019E4
_08064C84: .4byte gUnk_08201128

	thumb_func_start sub_8064C88
sub_8064C88: @ 0x08064C88
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	ldr r0, [r4, #0x5c]
	bl sub_806482C
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08064CEA
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	movs r3, #1
	bl sub_8064910
	cmp r5, #0
	bne _08064CCC
	ldrh r0, [r6, #0xa]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08064CCC:
	cmp r5, #1
	bne _08064CD8
	ldrh r0, [r6, #0xa]
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08064CD8:
	ldr r0, [r6, #0x14]
	adds r0, #0x3c
	ldrh r3, [r6, #0xc]
	str r7, [sp]
	movs r1, #2
	movs r2, #0x14
	bl FillBGRect
	b _08064D02
_08064CEA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08064D02
	ldr r0, [r4, #0x5c]
	bl sub_806488C
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064D02:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8064D0C
sub_8064D0C: @ 0x08064D0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064D34 @ =gUnk_08C13C14
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_8064820
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064D38 @ =gUnk_081EF4E8
	str r0, [r4, #0x48]
	ldr r0, _08064D3C @ =gUnk_082019E4
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064D34: .4byte gUnk_08C13C14
_08064D38: .4byte gUnk_081EF4E8
_08064D3C: .4byte gUnk_082019E4

	thumb_func_start sub_8064D40
sub_8064D40: @ 0x08064D40
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08064D66
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_80649AC
	b _08064D78
_08064D66:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08064D78
	bl sub_80647F8
	adds r0, r4, #0
	bl Proc_Break
_08064D78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8064D80
sub_8064D80: @ 0x08064D80
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_806482C
	adds r7, r0, #0
	ldr r0, _08064DBC @ =gUnk_08C13C34
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08064DC0 @ =gUnk_08C2327C
	ldr r3, _08064DC4 @ =gUnk_08C22750
	adds r0, r5, #0
	movs r1, #1
	bl sub_80648BC
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064DC8
	ldrh r0, [r5, #2]
	adds r0, #0x38
	b _08064DCC
	.align 2, 0
_08064DBC: .4byte gUnk_08C13C34
_08064DC0: .4byte gUnk_08C2327C
_08064DC4: .4byte gUnk_08C22750
_08064DC8:
	ldrh r0, [r5, #2]
	subs r0, #0x38
_08064DCC:
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r2, [r7, #6]
	adds r0, r1, r2
	strh r0, [r4, #2]
	ldrh r1, [r4, #4]
	ldrh r7, [r7, #8]
	adds r0, r1, r7
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _08064DF4 @ =gUnk_082022A8
	bl sub_8064A04
	ldr r0, [r6, #0x5c]
	ldr r1, _08064DF8 @ =gUnk_08201E10
	bl sub_80649D4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064DF4: .4byte gUnk_082022A8
_08064DF8: .4byte gUnk_08201E10

	thumb_func_start sub_8064DFC
sub_8064DFC: @ 0x08064DFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08064E1A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08064E1A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8064E20
sub_8064E20: @ 0x08064E20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08064E38 @ =gUnk_08C13C4C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E38: .4byte gUnk_08C13C4C

	thumb_func_start sub_8064E3C
sub_8064E3C: @ 0x08064E3C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8065094
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8064EB0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8064F50
	ldr r3, _08064EAC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_8064FC4
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_8064FC4
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064EAC: .4byte gDispIo

	thumb_func_start sub_8064EB0
sub_8064EB0: @ 0x08064EB0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_806482C
	adds r6, r0, #0
	ldr r0, _08064EF4 @ =gUnk_08C13C74
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_8064814
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064EF8 @ =gUnk_081EF52A
	str r0, [r4, #0x48]
	ldr r0, _08064EFC @ =gUnk_08C13C8C
	str r0, [r4, #0x4c]
	ldr r1, _08064F00 @ =gUnk_0826F96C
	adds r0, r5, #0
	bl sub_806497C
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064EF4: .4byte gUnk_08C13C74
_08064EF8: .4byte gUnk_081EF52A
_08064EFC: .4byte gUnk_08C13C8C
_08064F00: .4byte gUnk_0826F96C

	thumb_func_start sub_8064F04
sub_8064F04: @ 0x08064F04
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064F30
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #0
	bl sub_8064910
	b _08064F48
_08064F30:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064F48
	ldr r0, [r4, #0x5c]
	bl sub_806488C
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064F48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8064F50
sub_8064F50: @ 0x08064F50
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064F78 @ =gUnk_08C13C90
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_8064820
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064F7C @ =gUnk_081EF530
	str r0, [r4, #0x48]
	ldr r0, _08064F80 @ =gUnk_0827045C
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064F78: .4byte gUnk_08C13C90
_08064F7C: .4byte gUnk_081EF530
_08064F80: .4byte gUnk_0827045C

	thumb_func_start sub_8064F84
sub_8064F84: @ 0x08064F84
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08064FAA
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_80649AC
	b _08064FBC
_08064FAA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08064FBC
	bl sub_80647F8
	adds r0, r4, #0
	bl Proc_Break
_08064FBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8064FC4
sub_8064FC4: @ 0x08064FC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08064FF0 @ =gUnk_08C13CB0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064FF0: .4byte gUnk_08C13CB0

	thumb_func_start sub_8064FF4
sub_8064FF4: @ 0x08064FF4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806500A
	adds r0, r1, #0
	bl Proc_Break
_0806500A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8065010
sub_8065010: @ 0x08065010
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0806502A
	adds r0, r4, #0
	bl Proc_Break
	b _08065088
_0806502A:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08065046
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b _08065056
_08065046:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
_08065056:
	bl Interpolate
	adds r5, r0, #0
	ldr r3, _08065090 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r5, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_08065088:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065090: .4byte gDispIo

	thumb_func_start sub_8065094
sub_8065094: @ 0x08065094
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_806482C
	adds r6, r0, #0
	ldr r0, _080650E8 @ =gUnk_08C13CD0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _080650EC @ =gUnk_08C2D9FC
	adds r0, r5, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_80648BC
	str r0, [r4, #0x60]
	ldrh r2, [r0, #2]
	ldrh r3, [r6, #6]
	adds r1, r2, r3
	strh r1, [r0, #2]
	ldrh r2, [r0, #4]
	ldrh r6, [r6, #8]
	adds r1, r2, r6
	strh r1, [r0, #4]
	ldr r0, [r4, #0x5c]
	ldr r1, _080650F0 @ =gUnk_082708B0
	bl sub_8064A04
	ldr r0, [r4, #0x5c]
	ldr r1, _080650F4 @ =gUnk_0827065C
	bl sub_80649D4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080650E8: .4byte gUnk_08C13CD0
_080650EC: .4byte gUnk_08C2D9FC
_080650F0: .4byte gUnk_082708B0
_080650F4: .4byte gUnk_0827065C

	thumb_func_start sub_80650F8
sub_80650F8: @ 0x080650F8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08065118
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08065118:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8065120
sub_8065120: @ 0x08065120
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806513C @ =gUnk_08C13CE8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl sub_8064814
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806513C: .4byte gUnk_08C13CE8

	thumb_func_start sub_8065140
sub_8065140: @ 0x08065140
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8065158
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8065158
sub_8065158: @ 0x08065158
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806482C
	adds r6, r0, #0
	ldr r0, _0806519C @ =gUnk_08C13D10
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080651A0 @ =gUnk_081EF572
	str r0, [r4, #0x48]
	ldr r0, _080651A4 @ =gUnk_08C13E30
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _080651A8 @ =gUnk_08C13D28
	str r0, [r4, #0x54]
	ldr r0, _080651AC @ =gUnk_08C13DAC
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806519C: .4byte gUnk_08C13D10
_080651A0: .4byte gUnk_081EF572
_080651A4: .4byte gUnk_08C13E30
_080651A8: .4byte gUnk_08C13D28
_080651AC: .4byte gUnk_08C13DAC

	thumb_func_start sub_80651B0
sub_80651B0: @ 0x080651B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _080651F4
	ldr r6, [r7, #0x4c]
	ldr r1, [r7, #0x54]
	ldr r5, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl sub_806497C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	bl sub_80649AC
	ldr r0, [r7, #0x5c]
	adds r4, r4, r6
	ldr r2, [r4]
	movs r1, #0
	movs r3, #1
	bl sub_8064910
	b _0806520C
_080651F4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0806520C
	ldr r0, [r7, #0x5c]
	bl sub_806488C
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0806520C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
