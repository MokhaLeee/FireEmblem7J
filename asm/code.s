	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_806BFD0
sub_806BFD0: @ 0x0806BFD0
	push {lr}
	ldr r0, _0806BFE0 @ =gUnk_08C4C100
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806BFE0: .4byte gUnk_08C4C100

	thumb_func_start sub_806BFE4
sub_806BFE4: @ 0x0806BFE4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitOam
	bl sub_804D738
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _0806C038 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_806B800
	ldr r4, _0806C03C @ =gPal
	ldr r1, _0806C040 @ =gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C038: .4byte 0x0203DFE2
_0806C03C: .4byte gPal
_0806C040: .4byte gEfxPal

	thumb_func_start sub_806C044
sub_806C044: @ 0x0806C044
	push {r4, lr}
	adds r4, r0, #0
	bl EkrGauge_0804CC48
	bl EkrDispUP_0804D5A4
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_806C064
sub_806C064: @ 0x0806C064
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0806C0C0 @ =gEfxPal
	ldr r4, _0806C0C4 @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _0806C0B8
	adds r0, r6, #0
	bl Proc_Break
_0806C0B8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C0C0: .4byte gEfxPal
_0806C0C4: .4byte gPal

	thumb_func_start sub_806C0C8
sub_806C0C8: @ 0x0806C0C8
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C0D4
sub_806C0D4: @ 0x0806C0D4
	push {lr}
	ldr r0, _0806C0E4 @ =gUnk_08C4C130
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806C0E4: .4byte gUnk_08C4C130

	thumb_func_start sub_806C0E8
sub_806C0E8: @ 0x0806C0E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806C10C @ =gPal
	ldr r1, _0806C110 @ =gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C10C: .4byte gPal
_0806C110: .4byte gEfxPal

	thumb_func_start sub_806C114
sub_806C114: @ 0x0806C114
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0806C170 @ =gEfxPal
	ldr r4, _0806C174 @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _0806C168
	adds r0, r6, #0
	bl Proc_Break
_0806C168:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C170: .4byte gEfxPal
_0806C174: .4byte gPal

	thumb_func_start sub_806C178
sub_806C178: @ 0x0806C178
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, _0806C19C @ =OnMain
	bl SetMainFunc
	ldr r0, _0806C1A0 @ =OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C19C: .4byte OnMain
_0806C1A0: .4byte OnVBlank

	thumb_func_start sub_806C1A4
sub_806C1A4: @ 0x0806C1A4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0806C1D0 @ =gUnk_08D61678
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	ldr r2, _0806C1D4 @ =0x0000FFFF
	cmp r1, r2
	beq _0806C1C8
_0806C1BC:
	cmp r1, r0
	beq _0806C1C8
	adds r4, #0x10
	ldrh r1, [r4]
	cmp r1, r2
	bne _0806C1BC
_0806C1C8:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C1D0: .4byte gUnk_08D61678
_0806C1D4: .4byte 0x0000FFFF

	thumb_func_start sub_806C1D8
sub_806C1D8: @ 0x0806C1D8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_806C1A4
	ldrb r0, [r0, #2]
	pop {r1}
	bx r1

	thumb_func_start sub_806C1E8
sub_806C1E8: @ 0x0806C1E8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_806C1A4
	ldrh r0, [r0, #4]
	pop {r1}
	bx r1

	thumb_func_start sub_806C1F8
sub_806C1F8: @ 0x0806C1F8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_806C1A4
	ldr r0, [r0, #8]
	pop {r1}
	bx r1

	thumb_func_start sub_806C208
sub_806C208: @ 0x0806C208
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_806C1A4
	ldrb r0, [r0, #0xc]
	pop {r1}
	bx r1

	thumb_func_start sub_806C218
sub_806C218: @ 0x0806C218
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_806C1A4
	ldrb r0, [r0, #0xd]
	pop {r1}
	bx r1

	thumb_func_start sub_806C228
sub_806C228: @ 0x0806C228
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_806C1A4
	ldrb r0, [r0, #0xe]
	pop {r1}
	bx r1

	thumb_func_start MU_Init
MU_Init: @ 0x0806C238
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806C242:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806C24A
	b _0806C26C
_0806C24A:
	ldr r0, _0806C268 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806C242
	.align 2, 0
_0806C268: .4byte 0x030014E8
_0806C26C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C274
sub_806C274: @ 0x0806C274
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl sub_806C4A0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C2D2
_0806C2D2:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartMu
StartMu: @ 0x0806C2DC
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldrb r0, [r1, #4]
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806C330
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetTrap
	adds r1, r0, #0
	ldrb r0, [r1, #3]
	cmp r0, #0x35
	beq _0806C324
	cmp r0, #0x35
	bgt _0806C318
	cmp r0, #0x34
	beq _0806C31E
	b _0806C330
_0806C318:
	cmp r0, #0x36
	beq _0806C32A
	b _0806C330
_0806C31E:
	movs r0, #0x5b
	str r0, [r7, #8]
	b _0806C330
_0806C324:
	movs r0, #0x5c
	str r0, [r7, #8]
	b _0806C330
_0806C32A:
	movs r0, #0x5d
	str r0, [r7, #8]
	b _0806C330
_0806C330:
	ldr r0, [r7]
	bl sub_8025B80
	ldr r1, [r7]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r2, [r7]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	ldr r4, [r7, #8]
	adds r3, r4, #0
	lsls r4, r3, #0x10
	lsrs r3, r4, #0x10
	movs r4, #1
	rsbs r4, r4, #0
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r4, #0
	bl sub_806C4A0
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _0806C38E
_0806C38E:
	add sp, #0x10
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806C398
sub_806C398: @ 0x0806C398
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806D3F8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C3B0
sub_806C3B0: @ 0x0806C3B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C3D8
sub_806C3D8: @ 0x0806C3D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C3F8
sub_806C3F8: @ 0x0806C3F8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	bl StartMu
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C416
	movs r0, #0
	b _0806C46C
_0806C416:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C46C
_0806C46C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C474
sub_806C474: @ 0x0806C474
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassSMSId
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3c
	ldrb r1, [r2]
	bl UseUnitSprite
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C4A0
sub_806C4A0: @ 0x0806C4A0
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x1a
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	movs r1, #1
	cmn r0, r1
	bne _0806C4E6
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl sub_806D6A0
	str r0, [r7, #0x14]
	b _0806C4F2
_0806C4E6:
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl sub_806D744
	str r0, [r7, #0x14]
_0806C4F2:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bne _0806C4FC
	movs r0, #0
	b _0806C730
_0806C4FC:
	ldr r1, _0806C528 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _0806C510
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0xfe
	strh r1, [r0]
_0806C510:
	ldr r1, _0806C528 @ =gUnk_08D64F4C
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C52C
	movs r0, #0
	b _0806C730
	.align 2, 0
_0806C528: .4byte gUnk_08D64F4C
_0806C52C:
	ldr r0, [r7, #0xc]
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #2
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x18
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x43
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0xc]
	adds r0, r7, #4
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	lsls r1, r2, #5
	ldr r3, _0806C72C @ =0x06010000
	adds r2, r1, r3
	str r2, [r0, #0x38]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x1a
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x46
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x28]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_806DD6C
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xa
	bl StartSpriteAnim
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	bl sub_806DD40
	adds r4, r0, #0
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_806DD10
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_806DD10
	ldr r1, [r7, #0x10]
	str r0, [r1, #0x24]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #0x14]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	str r0, [r1, #0x48]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C730
	.align 2, 0
_0806C72C: .4byte 0x06010000
_0806C730:
	add sp, #0x1c
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C738
sub_806C738: @ 0x0806C738
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x42
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #4]
	cmp r0, #0xf
	bne _0806C774
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl sub_8025AE0
	b _0806C786
_0806C774:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl SetSpriteAnimId
_0806C786:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C790
sub_806C790: @ 0x0806C790
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806C7BC
	ldr r0, [r7]
	movs r1, #1
	bl sub_806C738
	b _0806C7C4
_0806C7BC:
	ldr r0, [r7]
	movs r1, #2
	bl sub_806C738
_0806C7C4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C7CC
sub_806C7CC: @ 0x0806C7CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _0806C7E4 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _0806C7E8
	b _0806C7EE
	.align 2, 0
_0806C7E4: .4byte gUnk_08D64F4C
_0806C7E8:
	ldr r0, [r7]
	bl sub_806C790
_0806C7EE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C7F8
sub_806C7F8: @ 0x0806C7F8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806C814 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806C818
	b _0806C822
	.align 2, 0
_0806C814: .4byte gUnk_08D64F4C
_0806C818:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	ldr r1, [r7]
	bl sub_806C8F0
_0806C822:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C82C
sub_806C82C: @ 0x0806C82C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806C844 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806C842
	movs r0, #1
_0806C842:
	b _0806C848
	.align 2, 0
_0806C844: .4byte gUnk_08D64F4C
_0806C848:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806C850
sub_806C850: @ 0x0806C850
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	movs r0, #0
	str r0, [r7, #4]
_0806C85A:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C862
	b _0806C8A2
_0806C862:
	ldr r0, _0806C890 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806C89A
	ldr r0, _0806C890 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C894
	b _0806C896
	.align 2, 0
_0806C890: .4byte 0x030014E8
_0806C894:
	b _0806C89A
_0806C896:
	movs r0, #1
	b _0806C8B0
_0806C89A:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806C85A
_0806C8A2:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C8AC
	movs r0, #0
	b _0806C8B0
_0806C8AC:
	movs r0, #1
	b _0806C8B0
_0806C8B0:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C8B8
sub_806C8B8: @ 0x0806C8B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806C8CE
	movs r0, #0
	b _0806C8E8
_0806C8CE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C8DC
	b _0806C8E0
_0806C8DC:
	movs r0, #0
	b _0806C8E8
_0806C8E0:
	movs r0, #1
	b _0806C8E8
_0806C8E4:
	movs r0, #0
	b _0806C8E8
_0806C8E8:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C8F0
sub_806C8F0: @ 0x0806C8F0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806C8FE:
	ldr r0, [r7, #8]
	cmp r0, #0x3f
	ble _0806C906
	b _0806C930
_0806C906:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	adds r0, r1, #5
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806C8FE
_0806C930:
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_806CAD0
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C964
sub_806C964: @ 0x0806C964
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	adds r2, r7, #2
	ldrh r1, [r2]
	adds r3, r7, #4
	ldrh r2, [r3]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl sub_806C4A0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C9A2
	movs r0, #0
	b _0806C9B2
_0806C9A2:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl sub_806C8F0
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C9B2
_0806C9B2:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806C9BC
sub_806C9BC: @ 0x0806C9BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x58]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C9F8
sub_806C9F8: @ 0x0806C9F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x58]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_80151FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CA1C
sub_806CA1C: @ 0x0806CA1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	beq _0806CA3E
	ldr r1, [r7]
	ldr r0, [r1, #0x5c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_80151FC
_0806CA3E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CA48
sub_806CA48: @ 0x0806CA48
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0806CA98 @ =gUnk_08D64DB0
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806CA70
	ldr r1, _0806CA98 @ =gUnk_08D64DB0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
_0806CA70:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x58]
	cmp r1, #0
	bne _0806CA9C
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x58]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	b _0806CAC6
	.align 2, 0
_0806CA98: .4byte gUnk_08D64DB0
_0806CA9C:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x60]
	cmp r1, #0
	bne _0806CAC6
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r1, r1, r2
	str r1, [r0, #0x5c]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806CAC6:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CAD0
sub_806CAD0: @ 0x0806CAD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806D2E4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CAE8
sub_806CAE8: @ 0x0806CAE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806CAF8
sub_806CAF8: @ 0x0806CAF8
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
_0806CB00:
	b _0806CB04
_0806CB02:
	b _0806CD22
_0806CB04:
	adds r0, r7, #4
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	bls _0806CB38
	b _0806CD1E
_0806CB38:
	lsls r1, r0, #2
	ldr r2, _0806CB44 @ =_0806CB48
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806CB44: .4byte _0806CB48
_0806CB48: @ jump table
	.4byte _0806CC38 @ case 0
	.4byte _0806CC46 @ case 1
	.4byte _0806CC46 @ case 2
	.4byte _0806CC46 @ case 3
	.4byte _0806CC46 @ case 4
	.4byte _0806CC30 @ case 5
	.4byte _0806CC96 @ case 6
	.4byte _0806CC96 @ case 7
	.4byte _0806CC96 @ case 8
	.4byte _0806CC96 @ case 9
	.4byte _0806CB88 @ case 10
	.4byte _0806CBD4 @ case 11
	.4byte _0806CD1E @ case 12
	.4byte _0806CCDA @ case 13
	.4byte _0806CD0E @ case 14
	.4byte _0806CD16 @ case 15
_0806CB88:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0806CD22
_0806CBD4:
	ldr r0, [r7]
	bl sub_806CAE8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	ldr r1, _0806CC2C @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r4, #0
	ldrsh r1, [r2, r4]
	asrs r2, r1, #4
	adds r1, r2, #0
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	ldr r2, _0806CC2C @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_806CD2C
	b _0806CD22
	.align 2, 0
_0806CC2C: .4byte gBmSt
_0806CC30:
	ldr r0, [r7]
	bl sub_806D4EC
	b _0806CD22
_0806CC38:
	ldr r0, [r7]
	bl sub_806CAE8
	ldr r0, [r7]
	bl sub_806D4BC
	b _0806CD22
_0806CC46:
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806CC94
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD6C
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r7]
	bl sub_806C738
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806CC94:
	b _0806CD22
_0806CC96:
	adds r0, r7, #4
	adds r1, r7, #4
	ldrh r2, [r1]
	subs r1, r2, #5
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806CCD8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD6C
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	bl sub_806C738
_0806CCD8:
	b _0806CB00
_0806CCDA:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0806CB00
_0806CD0E:
	ldr r0, [r7]
	bl sub_806C3B0
	b _0806CB00
_0806CD16:
	ldr r0, [r7]
	bl sub_806C3D8
	b _0806CB00
_0806CD1E:
	b _0806CD20
_0806CD20:
	b _0806CB00
_0806CD22:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CD2C
sub_806CD2C: @ 0x0806CD2C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806CD98 @ =gUnk_083FB1AC
	ldr r1, _0806CD9C @ =0x06013000
	bl Decompress
	ldr r1, _0806CDA0 @ =gUnk_083F641C
	adds r0, r1, #0
	movs r1, #2
	bl StartSpriteAnim
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0x22]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x8c
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x22]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	bl SetSpriteAnimId
	ldr r1, _0806CDA4 @ =gUnk_08D64DE0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x50]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #8
	str r2, [r0, #0x2c]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	subs r2, r1, #4
	str r2, [r0, #0x30]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD98: .4byte gUnk_083FB1AC
_0806CD9C: .4byte 0x06013000
_0806CDA0: .4byte gUnk_083F641C
_0806CDA4: .4byte gUnk_08D64DE0

	thumb_func_start sub_806CDA8
sub_806CDA8: @ 0x0806CDA8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, _0806CE5C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806CDC8
	ldr r1, _0806CE60 @ =0x00000397
	adds r0, r1, #0
	bl m4aSongNumStart
_0806CDC8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _0806CE64 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806CE64 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806CE64 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	movs r1, #0x80
	lsls r1, r1, #2
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806CE64 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CE5C: .4byte gPlaySt
_0806CE60: .4byte 0x00000397
_0806CE64: .4byte gSinLut

	thumb_func_start sub_806CE68
sub_806CE68: @ 0x0806CE68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #7
	ble _0806CE8C
	ldr r0, [r7]
	bl Proc_Break
_0806CE8C:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7]
	adds r0, r3, #0
	adds r4, r3, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, _0806CF48 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806CF48 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806CF48 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806CF48 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	adds r2, r3, #0
	subs r2, #8
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl DisplaySpriteAnim
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF48: .4byte gSinLut

	thumb_func_start sub_806CF4C
sub_806CF4C: @ 0x0806CF4C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x27
	ble _0806CF70
	ldr r0, [r7]
	bl Proc_Break
_0806CF70:
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r2, [r7]
	ldr r1, [r2, #0x2c]
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r3, #0
	orrs r2, r4
	bl DisplaySpriteAnim
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806CF90
sub_806CF90: @ 0x0806CF90
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806CFA8 @ =gUnk_08D64DE0
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806CFA6
	movs r0, #1
_0806CFA6:
	b _0806CFAC
	.align 2, 0
_0806CFA8: .4byte gUnk_08D64DE0
_0806CFAC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806CFB4
sub_806CFB4: @ 0x0806CFB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_806CF90
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806CFE0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806CFE0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806CFE8
sub_806CFE8: @ 0x0806CFE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D010
sub_806D010: @ 0x0806D010
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806D03E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0806D064
_0806D03E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D064:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D06C
sub_806D06C: @ 0x0806D06C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D07C
sub_806D07C: @ 0x0806D07C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D08C
sub_806D08C: @ 0x0806D08C
	push {r4, r5, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806DB6C
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x48
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r2, _0806D2D8 @ =gUnk_08D64E00
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #2
	adds r2, r2, r3
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r2, _0806D2D8 @ =gUnk_08D64E00
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r4, r3, #1
	adds r3, r4, #0
	lsls r4, r3, #1
	adds r2, r2, r4
	movs r5, #0
	ldrsh r3, [r2, r5]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	lsrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xf
	bhi _0806D158
	b _0806D254
_0806D158:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	ldr r2, _0806D2DC @ =0xFFFFFF00
	adds r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806D2D8 @ =gUnk_08D64E00
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806D2D8 @ =gUnk_08D64E00
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #1
	adds r5, r4, #1
	adds r4, r5, #0
	lsls r5, r4, #1
	adds r3, r3, r5
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D254:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D2B4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl sub_8015D10
	adds r1, r0, #0
	ldr r0, _0806D2E0 @ =gBmSt
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl sub_8015D54
	adds r1, r0, #0
	ldr r0, _0806D2E0 @ =gBmSt
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
_0806D2B4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bne _0806D2D0
	ldr r0, [r7]
	bl sub_806D2E4
_0806D2D0:
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D2D8: .4byte gUnk_08D64E00
_0806D2DC: .4byte 0xFFFFFF00
_0806D2E0: .4byte gBmSt

	thumb_func_start sub_806D2E4
sub_806D2E4: @ 0x0806D2E4
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806D346
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x32
	blt _0806D338
	cmp r0, #0x33
	ble _0806D320
	cmp r0, #0x37
	bgt _0806D338
	b _0806D32C
_0806D320:
	ldr r0, _0806D328 @ =gUnk_08D64ED2
	str r0, [r7, #8]
	b _0806D344
	.align 2, 0
_0806D328: .4byte gUnk_08D64ED2
_0806D32C:
	ldr r0, _0806D334 @ =gUnk_08D64EA6
	str r0, [r7, #8]
	b _0806D344
	.align 2, 0
_0806D334: .4byte gUnk_08D64EA6
_0806D338:
	ldr r0, _0806D340 @ =gUnk_08D64E78
	str r0, [r7, #8]
	b _0806D344
	.align 2, 0
_0806D340: .4byte gUnk_08D64E78
_0806D344:
	b _0806D394
_0806D346:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x46
	beq _0806D37C
	cmp r0, #0x46
	bgt _0806D360
	cmp r0, #0x17
	bgt _0806D388
	cmp r0, #0x14
	blt _0806D388
	b _0806D372
_0806D360:
	cmp r0, #0x55
	beq _0806D372
	cmp r0, #0x55
	blt _0806D388
	cmp r0, #0x5d
	bgt _0806D388
	cmp r0, #0x5b
	blt _0806D388
	b _0806D372
_0806D372:
	ldr r0, _0806D378 @ =gUnk_08D64E34
	str r0, [r7, #8]
	b _0806D394
	.align 2, 0
_0806D378: .4byte gUnk_08D64E34
_0806D37C:
	ldr r0, _0806D384 @ =gUnk_08D64EFE
	str r0, [r7, #8]
	b _0806D394
	.align 2, 0
_0806D384: .4byte gUnk_08D64EFE
_0806D388:
	ldr r0, _0806D390 @ =gUnk_08D64E10
	str r0, [r7, #8]
	b _0806D394
	.align 2, 0
_0806D390: .4byte gUnk_08D64E10
_0806D394:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x43
	ldrb r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strb r3, [r0]
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	adds r1, r2, #0
	bl DivRem
	str r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, [r7]
	bl sub_806D7E8
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806D3EE
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	ldr r1, [r7, #8]
	adds r2, r1, #2
	ldrh r1, [r2]
	adds r3, r7, #0
	adds r3, #0x10
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl sub_806CA48
_0806D3EE:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D3F8
sub_806D3F8: @ 0x0806D3F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D450
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806D438
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #3
	beq _0806D432
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806D432
	b _0806D438
_0806D432:
	ldr r0, [r7]
	bl sub_806CAF8
_0806D438:
	ldr r0, _0806D468 @ =gUnk_08D64F2C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3f
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7]
	bl _call_via_r1
_0806D450:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xf
	bne _0806D46C
	ldr r0, [r7]
	bl sub_806D934
	b _0806D472
	.align 2, 0
_0806D468: .4byte gUnk_08D64F2C
_0806D46C:
	ldr r0, [r7]
	bl sub_806DA3C
_0806D472:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D47C
sub_806D47C: @ 0x0806D47C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	bl EndSpriteAnim
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start MU_EndAll
MU_EndAll: @ 0x0806D4A4
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806D4B8 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4B8: .4byte gUnk_08D64F4C

	thumb_func_start sub_806D4BC
sub_806D4BC: @ 0x0806D4BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806D4D4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D4D4
sub_806D4D4: @ 0x0806D4D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl Proc_End
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D4EC
sub_806D4EC: @ 0x0806D4EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806CAE8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D51C
sub_806D51C: @ 0x0806D51C
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl sub_80046C4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D52C
sub_806D52C: @ 0x0806D52C
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl Proc_UnblockEachMarked
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D53C
sub_806D53C: @ 0x0806D53C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_0806D548:
	b _0806D54C
_0806D54A:
	b _0806D5E2
_0806D54C:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r0]
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, #1
	str r2, [r0]
	cmp r1, #0xa
	bhi _0806D5DE
	adds r0, r1, #0
	lsls r1, r0, #2
	ldr r2, _0806D56C @ =_0806D570
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806D56C: .4byte _0806D570
_0806D570: @ jump table
	.4byte _0806D59C @ case 0
	.4byte _0806D59E @ case 1
	.4byte _0806D5AC @ case 2
	.4byte _0806D5C8 @ case 3
	.4byte _0806D5BA @ case 4
	.4byte _0806D59C @ case 5
	.4byte _0806D5DE @ case 6
	.4byte _0806D5DE @ case 7
	.4byte _0806D5DE @ case 8
	.4byte _0806D5DE @ case 9
	.4byte _0806D5D6 @ case 10
_0806D59C:
	b _0806D5E2
_0806D59E:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5AC:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5BA:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5C8:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5D6:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D5E0
_0806D5DE:
	b _0806D5E0
_0806D5E0:
	b _0806D548
_0806D5E2:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D5EC
sub_806D5EC: @ 0x0806D5EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806D5F6:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806D5FE
	b _0806D620
_0806D5FE:
	ldr r0, _0806D614 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D618
	movs r0, #1
	b _0806D624
	.align 2, 0
_0806D614: .4byte 0x030014E8
_0806D618:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806D5F6
_0806D620:
	movs r0, #0
	b _0806D624
_0806D624:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806D62C
sub_806D62C: @ 0x0806D62C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806D636:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806D63E
	b _0806D698
_0806D63E:
	ldr r0, _0806D694 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806D68C
	ldr r0, _0806D694 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806D694 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
_0806D68C:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806D636
	.align 2, 0
_0806D694: .4byte 0x030014E8
_0806D698:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D6A0
sub_806D6A0: @ 0x0806D6A0
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806D6AE:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806D6B6
	b _0806D738
_0806D6B6:
	ldr r0, _0806D728 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D730
	ldr r0, _0806D728 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, [r7, #8]
	adds r2, r1, #0
	adds r1, r2, #1
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806D728 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r2, _0806D72C @ =gUnk_08D64F6C
	ldr r3, [r7, #8]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	adds r1, r1, r3
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x4c
	muls r0, r1, r0
	ldr r2, _0806D728 @ =0x030014E8
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806D73C
	.align 2, 0
_0806D728: .4byte 0x030014E8
_0806D72C: .4byte gUnk_08D64F6C
_0806D730:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D6AE
_0806D738:
	movs r0, #0
	b _0806D73C
_0806D73C:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806D744
sub_806D744: @ 0x0806D744
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806D752:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806D75A
	b _0806D7DC
_0806D75A:
	ldr r0, _0806D7CC @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D7D4
	ldr r0, _0806D7CC @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, [r7, #8]
	adds r2, r1, #0
	adds r1, r2, #1
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806D7CC @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r2, _0806D7D0 @ =gUnk_08D64F74
	ldr r3, [r7, #8]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	adds r1, r1, r3
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x4c
	muls r0, r1, r0
	ldr r2, _0806D7CC @ =0x030014E8
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806D7E0
	.align 2, 0
_0806D7CC: .4byte 0x030014E8
_0806D7D0: .4byte gUnk_08D64F74
_0806D7D4:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D752
_0806D7DC:
	movs r0, #0
	b _0806D7E0
_0806D7E0:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806D7E8
sub_806D7E8: @ 0x0806D7E8
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806D800
	b _0806D858
_0806D800:
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	movs r0, #1
	b _0806D92C
_0806D858:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D920 @ =gBmSt
	ldrh r1, [r1, #0xc]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D920 @ =gBmSt
	ldrh r1, [r1, #0xe]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D924
	adds r0, r7, #0
	adds r0, #8
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0806D924
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D924
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0xb0
	bgt _0806D924
	b _0806D928
	.align 2, 0
_0806D920: .4byte gBmSt
_0806D924:
	movs r0, #0
	b _0806D92C
_0806D928:
	movs r0, #1
	b _0806D92C
_0806D92C:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806D934
sub_806D934: @ 0x0806D934
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D94A
	b _0806DA30
_0806D94A:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_806D7E8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806D95C
	b _0806DA30
_0806D95C:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806D9B8
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D9B8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl sub_8025A6C
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	ldrh r0, [r1, #0x1e]
	adds r1, r7, #4
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	subs r1, #8
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, [r7]
	ldr r4, [r3, #0x38]
	ldr r5, _0806DA38 @ =0xF9FF0000
	adds r3, r4, r5
	lsls r5, r3, #0xf
	lsrs r4, r5, #0xf
	lsrs r3, r4, #5
	ldr r4, [r7]
	ldr r5, [r4, #0x34]
	ldrb r4, [r5, #1]
	movs r5, #0xf
	ands r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x18
	lsrs r4, r5, #0x18
	adds r5, r4, #0
	lsls r4, r5, #0xc
	adds r3, r3, r4
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x46
	ldrh r4, [r5]
	adds r3, r3, r4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x41
	ldrb r4, [r5]
	str r4, [sp]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x3c
	ldrb r4, [r5]
	str r4, [sp, #4]
	bl sub_8026794
_0806DA30:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA38: .4byte 0xF9FF0000

	thumb_func_start sub_806DA3C
sub_806DA3C: @ 0x0806DA3C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806DA52
	b _0806DB64
_0806DA52:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_806D7E8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806DA64
	b _0806DB64
_0806DA64:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806DAA6
	b _0806DAA8
_0806DAA6:
	b _0806DB28
_0806DAA8:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _0806DAB2
	b _0806DB28
_0806DAB2:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0806DAC4
	b _0806DB28
_0806DAC4:
	ldr r0, _0806DB20 @ =gPlaySt
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _0806DB28
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x52
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r1, r0, #4
	adds r0, r1, #0
	adds r0, #8
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #2
	ldr r2, _0806DB24 @ =0x0202E3E8
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	adds r1, r2, #0
	adds r1, #8
	asrs r2, r1, #4
	ldr r1, [r0]
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806DB28
	b _0806DB64
	.align 2, 0
_0806DB20: .4byte gPlaySt
_0806DB24: .4byte 0x0202E3E8
_0806DB28:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806DB50
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806DB50:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	adds r2, r7, #4
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r3, r7, #6
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl DisplaySpriteAnim
_0806DB64:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806DB6C
sub_806DB6C: @ 0x0806DB6C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806DB92
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x80
	str r1, [r7, #4]
_0806DB92:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x44
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806DBA4
	movs r0, #0x80
	lsls r0, r0, #1
	b _0806DCAE
_0806DBA4:
	ldr r0, [r7, #4]
	cmp r0, #0x40
	bne _0806DBD4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, _0806DBD0 @ =gUnk_08D64F7C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806DCAE
	.align 2, 0
_0806DBD0: .4byte gUnk_08D64F7C
_0806DBD4:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806DC44
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806DBF2
	ldr r0, [r7, #8]
	movs r1, #0x40
	eors r0, r1
	str r0, [r7, #8]
	b _0806DC2E
_0806DBF2:
	ldr r1, _0806DC20 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806DC28
	ldr r1, _0806DC24 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806DC1E
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806DC1E:
	b _0806DC2E
	.align 2, 0
_0806DC20: .4byte gPlaySt
_0806DC24: .4byte gpKeySt
_0806DC28:
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806DC2E:
	ldr r0, [r7, #8]
	cmp r0, #0x80
	ble _0806DC38
	movs r0, #0x80
	str r0, [r7, #8]
_0806DC38:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _0806DCAE
_0806DC44:
	bl IsFirstPlaythrough
	cmp r0, #0
	bne _0806DC6C
	ldr r1, _0806DC68 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806DC6C
	movs r0, #0x80
	b _0806DCAE
	.align 2, 0
_0806DC68: .4byte gpKeySt
_0806DC6C:
	ldr r1, _0806DCA0 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806DCAA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, _0806DCA4 @ =gUnk_08D64F7C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806DCAE
	.align 2, 0
_0806DCA0: .4byte gPlaySt
_0806DCA4: .4byte gUnk_08D64F7C
_0806DCA8:
	b _0806DCAE
_0806DCAA:
	movs r0, #0x40
	b _0806DCAE
_0806DCAE:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806DCB8
sub_806DCB8: @ 0x0806DCB8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r1, #0
	adds r1, r7, #4
	strh r0, [r1]
	adds r0, r7, #4
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0806DCEE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0806DD08
_0806DCEE:
	ldr r0, [r7]
	adds r1, r7, #4
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806DD08:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806DD10
sub_806DD10: @ 0x0806DD10
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806DD30 @ =gUnk_08D64F7E
	ldr r1, [r7]
	adds r2, r0, r1
	ldrb r0, [r2]
	adds r2, r0, #0
	lsls r1, r2, #4
	adds r1, r1, r0
	lsls r0, r1, #9
	ldr r2, _0806DD34 @ =0x020040F0
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806DD38
	.align 2, 0
_0806DD30: .4byte gUnk_08D64F7E
_0806DD34: .4byte 0x020040F0
_0806DD38:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806DD40
sub_806DD40: @ 0x0806DD40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806DD60 @ =gUnk_08D650B4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x41
	ldrb r1, [r2]
	subs r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r1, #0
	b _0806DD64
	.align 2, 0
_0806DD60: .4byte gUnk_08D650B4
_0806DD64:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806DD6C
sub_806DD6C: @ 0x0806DD6C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r0, _0806DD8C @ =gUnk_08D650B4
	adds r1, r7, #0
	ldrh r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806DD90
	.align 2, 0
_0806DD8C: .4byte gUnk_08D650B4
_0806DD90:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806DD98
sub_806DD98: @ 0x0806DD98
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806DEB8 @ =gUnk_08D64F84
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, [r7]
	movs r1, #0
	bl sub_806E840
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1e]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r1, _0806DEC0 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806DE8C
	movs r0, #0xd6
	bl m4aSongNumStart
_0806DE8C:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0806DEB0
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl sub_8034C80
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl HideUnitSprite
_0806DEB0:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEB8: .4byte gUnk_08D64F84
_0806DEBC: .4byte gDispIo
_0806DEC0: .4byte gPlaySt

	thumb_func_start sub_806DEC4
sub_806DEC4: @ 0x0806DEC4
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806DF54 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DF54 @ =gDispIo
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DF54 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DF54 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806DF4C
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_806D4BC
	ldr r0, [r7]
	bl Proc_Break
_0806DF4C:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF54: .4byte gDispIo

	thumb_func_start sub_806DF58
sub_806DF58: @ 0x0806DF58
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	ldrh r2, [r3]
	movs r3, #7
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	cmp r2, #3
	bgt _0806DF82
	movs r0, #1
_0806DF82:
	adds r2, r1, #0
	adds r1, #0x40
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0806DFE6
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806DFE6:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806DFF0
sub_806DFF0: @ 0x0806DFF0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806E074 @ =gUnk_08D64F9C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, _0806E078 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806E06C
	movs r0, #0xd6
	bl m4aSongNumStart
_0806E06C:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E074: .4byte gUnk_08D64F9C
_0806E078: .4byte gPlaySt

	thumb_func_start sub_806E07C
sub_806E07C: @ 0x0806E07C
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806E0E4 @ =gUnk_08D64FAC
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x10]
	ldr r0, _0806E0E4 @ =gUnk_08D64FAC
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, #3
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x14]
	ldr r0, _0806E0E8 @ =0x030014E0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
	ldr r0, _0806E0EC @ =0x030014E4
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #2
	movs r2, #0xf
	adds r3, r2, #0
	lsls r3, r1
	adds r1, r3, #0
	str r1, [r0]
	ldr r0, _0806E0E8 @ =0x030014E0
	ldr r1, _0806E0E8 @ =0x030014E0
	ldr r2, _0806E0EC @ =0x030014E4
	ldr r3, [r2]
	mvns r2, r3
	ldr r1, [r1]
	ands r2, r1
	str r2, [r0]
	movs r0, #0
	str r0, [r7, #8]
_0806E0DC:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806E0F0
	b _0806E14A
	.align 2, 0
_0806E0E4: .4byte gUnk_08D64FAC
_0806E0E8: .4byte 0x030014E0
_0806E0EC: .4byte 0x030014E4
_0806E0F0:
	movs r0, #0
	str r0, [r7, #0xc]
_0806E0F4:
	ldr r0, [r7, #0xc]
	cmp r0, #3
	ble _0806E0FC
	b _0806E138
_0806E0FC:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0x18]
	ldr r0, _0806E134 @ =0x030014E0
	ldr r1, [r7, #0x18]
	ldr r0, [r0]
	ands r1, r0
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r7, #0x18]
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806E0F4
	.align 2, 0
_0806E134: .4byte 0x030014E0
_0806E138:
	ldr r0, [r7]
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806E0DC
_0806E14A:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806E154
sub_806E154: @ 0x0806E154
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD10
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_806E07C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806E1FC @ =0x020040F0
	ldr r1, _0806E200 @ =0x06017000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterDataMove
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806E1F4
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_806D4BC
	ldr r0, [r7]
	bl Proc_Break
_0806E1F4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E1FC: .4byte 0x020040F0
_0806E200: .4byte 0x06017000

	thumb_func_start sub_806E204
sub_806E204: @ 0x0806E204
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806E298 @ =gUnk_08D64FEC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
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
	strh r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, _0806E29C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806E290
	movs r0, #0xd6
	bl m4aSongNumStart
_0806E290:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E298: .4byte gUnk_08D64FEC
_0806E29C: .4byte gPlaySt

	thumb_func_start sub_806E2A0
sub_806E2A0: @ 0x0806E2A0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E2C8
sub_806E2C8: @ 0x0806E2C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E2E8
sub_806E2E8: @ 0x0806E2E8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E334
sub_806E334: @ 0x0806E334
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x50
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E380
sub_806E380: @ 0x0806E380
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806E3F8 @ =gPal
	adds r0, r0, r1
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806E3FC @ =gUnk_08D64D98
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E3F8: .4byte gPal
_0806E3FC: .4byte gUnk_08D64D98

	thumb_func_start sub_806E400
sub_806E400: @ 0x0806E400
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _0806E448 @ =gPal
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	ldr r1, _0806E44C @ =gUnk_08D64FFC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E448: .4byte gPal
_0806E44C: .4byte gUnk_08D64FFC

	thumb_func_start sub_806E450
sub_806E450: @ 0x0806E450
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r1, #0x30]
	ldr r2, [r7, #4]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	ldr r3, [r2, #0x34]
	ldrb r2, [r3, #1]
	movs r3, #0xf
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E4A0
sub_806E4A0: @ 0x0806E4A0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806E4F0 @ =sub_806E4F4
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x1e
	bl sub_8014FCC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E4F0: .4byte sub_806E4F4

	thumb_func_start sub_806E4F4
sub_806E4F4: @ 0x0806E4F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E51C
sub_806E51C: @ 0x0806E51C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806E560 @ =sub_806E564
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x1e
	bl sub_8014FCC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E560: .4byte sub_806E564

	thumb_func_start sub_806E564
sub_806E564: @ 0x0806E564
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E5BC @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r4, [r1]
	ldr r1, _0806E5BC @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	movs r1, #1
	subs r5, r1, r0
	ldr r0, _0806E5BC @ =0x0203E0D4
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C218
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_806F404
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E5BC: .4byte 0x0203E0D4

	thumb_func_start sub_806E5C0
sub_806E5C0: @ 0x0806E5C0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806E604 @ =sub_806E608
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x14
	bl sub_8014FCC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E604: .4byte sub_806E608

	thumb_func_start sub_806E608
sub_806E608: @ 0x0806E608
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E630
sub_806E630: @ 0x0806E630
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806E670 @ =gUnk_08D64D98
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _0806E674 @ =gUnk_08D65014
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E670: .4byte gUnk_08D64D98
_0806E674: .4byte gUnk_08D65014

	thumb_func_start sub_806E678
sub_806E678: @ 0x0806E678
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E698
sub_806E698: @ 0x0806E698
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806E6DC
sub_806E6DC: @ 0x0806E6DC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E730
sub_806E730: @ 0x0806E730
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #1]
	adds r0, r1, #0
	adds r0, #0x10
	adds r1, r0, #0
	lsls r0, r1, #5
	asrs r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r0, _0806E768 @ =gPal
	adds r1, r1, r0
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #0x14
	ldr r3, [r7]
	bl StartPalFade
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E768: .4byte gPal

	thumb_func_start sub_806E76C
sub_806E76C: @ 0x0806E76C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r2, #1
	ands r1, r2
	adds r3, r1, #0
	lsls r2, r3, #0x18
	lsrs r1, r2, #0x18
	cmp r1, #0
	beq _0806E7B8
	movs r1, #2
	b _0806E7BC
_0806E7B8:
	movs r1, #2
	rsbs r1, r1, #0
_0806E7BC:
	movs r2, #0
	bl sub_806E334
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0xb
	bls _0806E7E2
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_806E334
	ldr r0, [r7]
	bl Proc_Break
_0806E7E2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806E7EC
sub_806E7EC: @ 0x0806E7EC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E840
sub_806E840: @ 0x0806E840
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806E8D0 @ =gUnk_08D64D98
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _0806E8D4 @ =gPal
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #0x14
	ldr r3, [r7]
	bl StartPalFade
	ldr r1, _0806E8D8 @ =gUnk_08D6509C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8D0: .4byte gUnk_08D64D98
_0806E8D4: .4byte gPal
_0806E8D8: .4byte gUnk_08D6509C

	thumb_func_start sub_806E8DC
sub_806E8DC: @ 0x0806E8DC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E930
sub_806E930: @ 0x0806E930
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806E944 @ =gUnk_08D64F4C
	ldr r1, _0806E948 @ =sub_806E94C
	bl Proc_ForEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E944: .4byte gUnk_08D64F4C
_0806E948: .4byte sub_806E94C

	thumb_func_start sub_806E94C
sub_806E94C: @ 0x0806E94C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E974
sub_806E974: @ 0x0806E974
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	ldr r4, [r0, #0x30]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD6C
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetSpriteAnimInfo
	ldr r0, [r7]
	bl sub_806DD40
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD10
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #8]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldrb r1, [r2, #1]
	adds r2, r1, #0
	adds r2, #0x10
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EA0C
sub_806EA0C: @ 0x0806EA0C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	movs r3, #0xf
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806EA64
sub_806EA64: @ 0x0806EA64
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806EA80 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806EA84
	movs r0, #0
	b _0806EA9C
	.align 2, 0
_0806EA80: .4byte 0x030014E8
_0806EA84:
	ldr r0, _0806EA98 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806EA9C
	.align 2, 0
_0806EA98: .4byte 0x030014E8
_0806EA9C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806EAA4
sub_806EAA4: @ 0x0806EAA4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_0806EAB0:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806EAB8
	b _0806EADA
_0806EAB8:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_806EA64
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r0, #0x2c]
	ldr r0, [r7]
	cmp r1, r0
	bne _0806EAD2
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _0806EADE
_0806EAD2:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806EAB0
_0806EADA:
	movs r0, #0
	b _0806EADE
_0806EADE:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806EAE8
sub_806EAE8: @ 0x0806EAE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EB00 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EB04
	b _0806EB06
	.align 2, 0
_0806EB00: .4byte 0x0203E0D4
_0806EB04:
	b _0806EB08
_0806EB06:
	b _0806EB1A
_0806EB08:
	ldr r0, _0806EB24 @ =0x0203E0D4
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_800EE00
_0806EB1A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB24: .4byte 0x0203E0D4

	thumb_func_start sub_806EB28
sub_806EB28: @ 0x0806EB28
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EB7C @ =gBattleActor
	adds r0, r1, #0
	bl sub_806EB84
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EB48
	ldr r0, _0806EB7C @ =gBattleActor
	str r0, [r7, #4]
_0806EB48:
	ldr r1, _0806EB80 @ =gBattleTarget
	adds r0, r1, #0
	bl sub_806EB84
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EB5C
	ldr r0, _0806EB80 @ =gBattleTarget
	str r0, [r7, #4]
_0806EB5C:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806EB72
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_800ECEC
_0806EB72:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB7C: .4byte gBattleActor
_0806EB80: .4byte gBattleTarget

	thumb_func_start sub_806EB84
sub_806EB84: @ 0x0806EB84
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806EBAA
	ldr r0, [r7]
	bl DidBattleUnitBreakWeapon
	lsls r2, r0, #0x18
	asrs r1, r2, #0x18
	adds r0, r1, #0
	b _0806EBAE
_0806EBAA:
	movs r0, #0
	b _0806EBAE
_0806EBAE:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806EBB8
sub_806EBB8: @ 0x0806EBB8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EC0C @ =gBattleActor
	adds r0, r1, #0
	bl sub_806EC14
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EBD8
	ldr r0, _0806EC0C @ =gBattleActor
	str r0, [r7, #4]
_0806EBD8:
	ldr r1, _0806EC10 @ =gBattleTarget
	adds r0, r1, #0
	bl sub_806EC14
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EBEC
	ldr r0, _0806EC10 @ =gBattleTarget
	str r0, [r7, #4]
_0806EBEC:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806EC02
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_800ED34
_0806EC02:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC0C: .4byte gBattleActor
_0806EC10: .4byte gBattleTarget

	thumb_func_start sub_806EC14
sub_806EC14: @ 0x0806EC14
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806EC3E
	ldr r0, [r7]
	bl HasBattleUnitGainedWeaponLevel
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EC3E
	movs r0, #1
	b _0806EC42
_0806EC3E:
	movs r0, #0
	b _0806EC42
_0806EC42:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806EC4C
sub_806EC4C: @ 0x0806EC4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetText
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806EC60
sub_806EC60: @ 0x0806EC60
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_806D62C
	bl ResetTextFont
	bl sub_806FF58
	bl InitBmBgLayers
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl IsEventRunning
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EC90
	bl MU_EndAll
_0806EC90:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806EC98
sub_806EC98: @ 0x0806EC98
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806ED74 @ =0x0203E0D4
	ldr r1, _0806ED74 @ =0x0203E0D4
	ldr r2, [r1, #0x50]
	ldrb r1, [r2, #2]
	lsrs r2, r1, #3
	adds r1, r2, #0
	movs r2, #1
	ands r1, r2
	adds r2, r0, #0
	adds r0, #0x58
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806ED74 @ =0x0203E0D4
	ldr r2, _0806ED74 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x59
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806ED74 @ =0x0203E0D4
	ldr r2, _0806ED74 @ =0x0203E0D4
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806ED74 @ =0x0203E0D4
	ldr r2, _0806ED74 @ =0x0203E0D4
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806ED74 @ =0x0203E0D4
	ldr r2, _0806ED74 @ =0x0203E0D4
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5d
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #3]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _0806ED74 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806ED62
	ldr r0, _0806ED74 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806ED74 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0806ED62:
	ldr r1, _0806ED74 @ =0x0203E0D4
	ldr r0, _0806ED74 @ =0x0203E0D4
	ldr r1, _0806ED74 @ =0x0203E0D4
	ldr r2, [r1, #0x50]
	adds r1, r2, #4
	str r1, [r0, #0x50]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED74: .4byte 0x0203E0D4

	thumb_func_start sub_806ED78
sub_806ED78: @ 0x0806ED78
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806EDA4 @ =0x0203E0D4
	ldr r1, [r0, #0x50]
	ldrb r0, [r1, #2]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EDAC
	ldr r0, [r7]
	bl Proc_Break
	ldr r1, _0806EDA8 @ =gUnk_08D6561C
	ldr r0, [r7]
	bl sub_8004634
	b _0806EDB6
	.align 2, 0
_0806EDA4: .4byte 0x0203E0D4
_0806EDA8: .4byte gUnk_08D6561C
_0806EDAC:
	bl sub_806EC98
	ldr r0, [r7]
	bl Proc_Break
_0806EDB6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EDC0
sub_806EDC0: @ 0x0806EDC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8075E08
	adds r1, r0, #0
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EDE0
sub_806EDE0: @ 0x0806EDE0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EE2C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x40
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806EE22
	ldr r0, _0806EE2C @ =0x0203E0D4
	ldr r2, _0806EE2C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071DF8
	ldr r0, [r7]
	movs r1, #0x64
	bl sub_80149B4
_0806EE22:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE2C: .4byte 0x0203E0D4

	thumb_func_start sub_806EE30
sub_806EE30: @ 0x0806EE30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806EE58 @ =0x0203E0D4
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806EE58 @ =0x0203E0D4
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE58: .4byte 0x0203E0D4

	thumb_func_start sub_806EE5C
sub_806EE5C: @ 0x0806EE5C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EE74 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806EE78
	b _0806EE8E
	.align 2, 0
_0806EE74: .4byte 0x0203E0D4
_0806EE78:
	ldr r0, _0806EE98 @ =0x0203E0D4
	ldr r2, [r0, #0x14]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806EE98 @ =0x0203E0D4
	ldr r3, [r0, #0x14]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
_0806EE8E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE98: .4byte 0x0203E0D4

	thumb_func_start sub_806EE9C
sub_806EE9C: @ 0x0806EE9C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EEBC @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EED0
	cmp r0, #2
	beq _0806EEC0
	b _0806EEE4
	.align 2, 0
_0806EEBC: .4byte 0x0203E0D4
_0806EEC0:
	ldr r1, _0806EEE0 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806EED0
	movs r0, #1
	str r0, [r7, #4]
_0806EED0:
	ldr r0, _0806EEE0 @ =0x0203E0D4
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806EEDC
	movs r0, #0
	str r0, [r7, #4]
_0806EEDC:
	b _0806EEE4
	.align 2, 0
_0806EEE0: .4byte 0x0203E0D4
_0806EEE4:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806EF2E
	ldr r0, _0806EF38 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrb r1, [r0, #4]
	str r1, [r7, #8]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl sub_8079CE4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EF2E
	bl sub_806FF58
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl sub_8079DF4
	bl sub_800AD60
_0806EF2E:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF38: .4byte 0x0203E0D4

	thumb_func_start sub_806EF3C
sub_806EF3C: @ 0x0806EF3C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EF5C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EF70
	cmp r0, #2
	beq _0806EF60
	b _0806EF84
	.align 2, 0
_0806EF5C: .4byte 0x0203E0D4
_0806EF60:
	ldr r1, _0806EF80 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806EF70
	movs r0, #1
	str r0, [r7, #4]
_0806EF70:
	ldr r0, _0806EF80 @ =0x0203E0D4
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806EF7C
	movs r0, #0
	str r0, [r7, #4]
_0806EF7C:
	b _0806EF84
	.align 2, 0
_0806EF80: .4byte 0x0203E0D4
_0806EF84:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806EFA4
	ldr r0, _0806EFAC @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806DD98
_0806EFA4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EFAC: .4byte 0x0203E0D4

	thumb_func_start sub_806EFB0
sub_806EFB0: @ 0x0806EFB0
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #8]
	ldr r1, _0806EFD0 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EFE8
	cmp r0, #2
	beq _0806EFD4
	b _0806F004
	.align 2, 0
_0806EFD0: .4byte 0x0203E0D4
_0806EFD4:
	ldr r0, _0806F000 @ =0x0203E0D4
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806EFE8
	movs r0, #1
	str r0, [r7, #8]
_0806EFE8:
	ldr r0, _0806F000 @ =0x0203E0D4
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806EFFC
	movs r0, #0
	str r0, [r7, #8]
_0806EFFC:
	b _0806F004
	.align 2, 0
_0806F000: .4byte 0x0203E0D4
_0806F004:
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _0806F0B4
	ldr r1, _0806F0BC @ =gUnk_08D65760
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _0806F0C0 @ =0x0203E0D4
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, _0806F0C0 @ =0x0203E0D4
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	ldr r2, _0806F0C0 @ =0x0203E0D4
	ldr r3, [r7, #8]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, #4
	adds r3, r2, r3
	ldr r4, [r3]
	adds r2, r4, #0
	adds r3, r4, #0
	adds r3, #0x6e
	movs r4, #0
	ldrsb r4, [r3, r4]
	adds r2, r4, #0
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806F0B4:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0BC: .4byte gUnk_08D65760
_0806F0C0: .4byte 0x0203E0D4

	thumb_func_start sub_806F0C4
sub_806F0C4: @ 0x0806F0C4
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806F12C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #2
	bgt _0806F132
	cmp r0, #1
	blt _0806F132
	b _0806F130
	.align 2, 0
_0806F128: .4byte gDispIo
_0806F12C: .4byte 0x0203E0D4
_0806F130:
	b _0806F276
_0806F132:
	b _0806F134
_0806F134:
	ldr r0, _0806F150 @ =0x0203E0D4
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C208
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0806F154
	b _0806F276
	.align 2, 0
_0806F150: .4byte 0x0203E0D4
_0806F154:
	ldr r1, _0806F184 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806F196
	ldr r0, _0806F184 @ =0x0203E0D4
	ldr r1, [r0]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	lsls r0, r2, #4
	ldr r1, _0806F188 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0x6f
	ble _0806F18C
	ldr r0, [r7, #4]
	adds r1, r0, #0
	subs r1, #0x28
	str r1, [r7, #4]
	b _0806F194
	.align 2, 0
_0806F184: .4byte 0x0203E0D4
_0806F188: .4byte gBmSt
_0806F18C:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x18
	str r1, [r7, #4]
_0806F194:
	b _0806F262
_0806F196:
	movs r0, #0
	str r0, [r7, #0x10]
_0806F19A:
	ldr r1, _0806F1AC @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0x10]
	cmp r1, r0
	blt _0806F1B0
	b _0806F1EC
	.align 2, 0
_0806F1AC: .4byte 0x0203E0D4
_0806F1B0:
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, _0806F1E4 @ =0x0203E0D4
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	lsls r1, r3, #4
	ldr r2, _0806F1E8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _0806F19A
	.align 2, 0
_0806F1E4: .4byte 0x0203E0D4
_0806F1E8: .4byte gBmSt
_0806F1EC:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	blt _0806F202
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806F20E
	b _0806F214
_0806F202:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806F20E
	b _0806F214
_0806F20E:
	movs r0, #0x40
	str r0, [r7, #4]
	b _0806F262
_0806F214:
	movs r0, #0
	ldr r1, [r7, #8]
	ldr r2, [r7, #0xc]
	cmp r1, r2
	bgt _0806F220
	movs r0, #1
_0806F220:
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	cmp r1, #0x6f
	ble _0806F24E
	movs r0, #1
	ldr r1, [r7, #0x14]
	subs r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	subs r0, #0x28
	str r0, [r7, #4]
	b _0806F262
_0806F24E:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r7, #4]
_0806F262:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	cmp r0, #0
	bge _0806F26C
	adds r0, #7
_0806F26C:
	asrs r1, r0, #3
	movs r0, #0xf
	ldr r2, [r7]
	bl sub_806FF70
_0806F276:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806F280
sub_806F280: @ 0x0806F280
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806F298 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806F29C
	b _0806F2B8
	.align 2, 0
_0806F298: .4byte 0x0203E0D4
_0806F29C:
	ldr r0, _0806F2B4 @ =0x0203E0D4
	ldr r1, [r0]
	ldr r2, [r1]
	ldrb r0, [r2, #4]
	ldr r1, _0806F2B4 @ =0x0203E0D4
	ldr r2, [r1, #0x14]
	ldr r1, [r2]
	ldrb r2, [r1, #4]
	adds r1, r2, #0
	bl StartBattleTalk
	b _0806F2BA
	.align 2, 0
_0806F2B4: .4byte 0x0203E0D4
_0806F2B8:
	b _0806F2BA
_0806F2BA:
	bl sub_800AD60
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806F2C8
sub_806F2C8: @ 0x0806F2C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F2D8
sub_806F2D8: @ 0x0806F2D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806F2F4 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806F2FE
	cmp r0, #2
	beq _0806F2F8
	b _0806F304
	.align 2, 0
_0806F2F4: .4byte 0x0203E0D4
_0806F2F8:
	movs r0, #1
	bl sub_806F2C8
_0806F2FE:
	movs r0, #0
	bl sub_806F2C8
_0806F304:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F30C
sub_806F30C: @ 0x0806F30C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806F32C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806F326
	movs r0, #0xa0
	bl m4aSongNumStart
_0806F326:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F32C: .4byte gPlaySt

	thumb_func_start sub_806F330
sub_806F330: @ 0x0806F330
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806F344
	b _0806F3F8
_0806F344:
	ldr r0, _0806F3DC @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #8]
	str r1, [r0]
	ldr r0, _0806F3DC @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r0, [r7, #4]
	str r0, [r1]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl StartMu
	ldr r1, _0806F3DC @ =0x0203E0D4
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #8
	adds r2, r1, r2
	str r0, [r2]
	ldr r0, _0806F3DC @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806F3DC @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x1b
	beq _0806F3E0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x33
	beq _0806F3E0
	b _0806F3F8
	.align 2, 0
_0806F3DC: .4byte 0x0203E0D4
_0806F3E0:
	ldr r0, _0806F400 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E2A0
_0806F3F8:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F400: .4byte 0x0203E0D4

	thumb_func_start sub_806F404
sub_806F404: @ 0x0806F404
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #1
	beq _0806F49C
	cmp r0, #1
	bgt _0806F420
	cmp r0, #0
	beq _0806F426
	b _0806F506
_0806F420:
	cmp r0, #2
	beq _0806F4BC
	b _0806F506
_0806F426:
	ldr r0, _0806F498 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806F498 @ =0x0203E0D4
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _0806F498 @ =0x0203E0D4
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r3, _0806F498 @ =0x0203E0D4
	ldr r4, [r7, #4]
	adds r6, r4, #0
	lsls r5, r6, #2
	adds r5, r5, r4
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl sub_806FC64
	str r0, [r7, #0xc]
	ldr r0, _0806F498 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl sub_806C738
	b _0806F506
	.align 2, 0
_0806F498: .4byte 0x0203E0D4
_0806F49C:
	ldr r0, _0806F4B8 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806C790
	b _0806F506
	.align 2, 0
_0806F4B8: .4byte 0x0203E0D4
_0806F4BC:
	ldr r0, _0806F510 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806F510 @ =0x0203E0D4
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0
	movs r3, #0
	bl sub_806FC64
	str r0, [r7, #0xc]
	ldr r0, _0806F510 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl sub_806C738
_0806F506:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F510: .4byte 0x0203E0D4

	thumb_func_start sub_806F514
sub_806F514: @ 0x0806F514
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _0806F548 @ =0x0203E0D4
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C218
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7]
	bl sub_806F598
	ldr r1, _0806F548 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806F580
	cmp r0, #2
	beq _0806F54C
	b _0806F590
	.align 2, 0
_0806F548: .4byte 0x0203E0D4
_0806F54C:
	ldr r0, _0806F58C @ =gBattleHitArray
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F576
	movs r0, #2
	movs r1, #1
	ldr r2, [r7]
	bl sub_806F404
	movs r0, #3
	movs r1, #1
	ldr r2, [r7]
	bl sub_806F404
_0806F576:
	movs r0, #1
	movs r1, #0
	ldr r2, [r7]
	bl sub_806F404
_0806F580:
	movs r0, #0
	movs r1, #1
	ldr r2, [r7]
	bl sub_806F404
	b _0806F590
	.align 2, 0
_0806F58C: .4byte gBattleHitArray
_0806F590:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F598
sub_806F598: @ 0x0806F598
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	ldr r1, _0806F5BC @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	str r0, [r7, #0x14]
	ldr r1, _0806F5BC @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806F5E4
	cmp r0, #2
	beq _0806F5C0
	b _0806F5E6
	.align 2, 0
_0806F5BC: .4byte 0x0203E0D4
_0806F5C0:
	ldr r0, _0806F5E0 @ =gBattleHitArray
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F5DC
	ldr r0, [r7, #0x14]
	adds r1, r0, #2
	str r1, [r7, #0x14]
_0806F5DC:
	b _0806F5E6
	.align 2, 0
_0806F5E0: .4byte gBattleHitArray
_0806F5E4:
	b _0806F5E6
_0806F5E6:
	movs r0, #0
	str r0, [r7, #8]
_0806F5EA:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806F5F4
	b _0806F614
_0806F5F4:
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806F5EA
_0806F614:
	movs r0, #0
	str r0, [r7, #8]
_0806F618:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #8]
	cmp r1, r0
	blt _0806F624
	b _0806F758
_0806F624:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #0xc]
_0806F62A:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806F634
	b _0806F750
_0806F634:
	movs r0, #0
	str r0, [r7, #0x10]
	ldr r0, _0806F6B4 @ =0x0203E0D4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806F6B4 @ =0x0203E0D4
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0806F6B8
	ldr r0, _0806F6B4 @ =0x0203E0D4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806F6B4 @ =0x0203E0D4
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806F6B2
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806F6B2:
	b _0806F6F8
	.align 2, 0
_0806F6B4: .4byte 0x0203E0D4
_0806F6B8:
	ldr r0, _0806F74C @ =0x0203E0D4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806F74C @ =0x0203E0D4
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806F6F8
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806F6F8:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _0806F742
	adds r0, r7, #4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	ldr r2, [r7, #0xc]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	adds r1, r7, #4
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0806F742:
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806F62A
	.align 2, 0
_0806F74C: .4byte 0x0203E0D4
_0806F750:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806F618
_0806F758:
	movs r0, #0
	str r0, [r7, #8]
_0806F75C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806F766
	b _0806F7A8
_0806F766:
	ldr r0, _0806F7A0 @ =0x0203E0D4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldr r1, _0806F7A4 @ =gUnk_08402BF0
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806F75C
	.align 2, 0
_0806F7A0: .4byte 0x0203E0D4
_0806F7A4: .4byte gUnk_08402BF0
_0806F7A8:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F7B0
sub_806F7B0: @ 0x0806F7B0
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F828 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x6b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F82C @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F82C @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F82C @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F82C @ =0x0203E0D4
	ldr r1, _0806F830 @ =gBattleHitArray
	str r1, [r0, #0x50]
	bl sub_806EC98
	ldr r0, _0806F828 @ =gBattleActor
	ldr r1, _0806F834 @ =gBattleTarget
	ldr r2, _0806F830 @ =gBattleHitArray
	bl sub_806FAF8
	ldr r1, _0806F838 @ =gUnk_08D653CC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F828: .4byte gBattleActor
_0806F82C: .4byte 0x0203E0D4
_0806F830: .4byte gBattleHitArray
_0806F834: .4byte gBattleTarget
_0806F838: .4byte gUnk_08D653CC

	thumb_func_start sub_806F83C
sub_806F83C: @ 0x0806F83C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F8B4 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x6b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F8B8 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F8B8 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F8B8 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F8B8 @ =0x0203E0D4
	ldr r1, _0806F8BC @ =gBattleHitArray
	str r1, [r0, #0x50]
	bl sub_806EC98
	ldr r0, _0806F8B4 @ =gBattleActor
	ldr r1, _0806F8C0 @ =gBattleTarget
	ldr r2, _0806F8BC @ =gBattleHitArray
	bl sub_806FAF8
	ldr r1, _0806F8C4 @ =gUnk_08D6540C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F8B4: .4byte gBattleActor
_0806F8B8: .4byte 0x0203E0D4
_0806F8BC: .4byte gBattleHitArray
_0806F8C0: .4byte gBattleTarget
_0806F8C4: .4byte gUnk_08D6540C

	thumb_func_start sub_806F8C8
sub_806F8C8: @ 0x0806F8C8
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F968 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F96C @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F96C @ =0x0203E0D4
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
	ldr r0, _0806F96C @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F96C @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F96C @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F968 @ =gBattleActor
	ldr r1, _0806F970 @ =gBattleTarget
	ldr r2, _0806F974 @ =gBattleHitArray
	bl sub_806FAF8
	ldr r1, _0806F978 @ =gUnk_08D6544C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F968: .4byte gBattleActor
_0806F96C: .4byte 0x0203E0D4
_0806F970: .4byte gBattleTarget
_0806F974: .4byte gBattleHitArray
_0806F978: .4byte gUnk_08D6544C

	thumb_func_start sub_806F97C
sub_806F97C: @ 0x0806F97C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806FA14 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x4e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806FA18 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA14 @ =gBattleActor
	ldr r1, _0806FA1C @ =gBattleTarget
	ldr r2, _0806FA20 @ =gBattleHitArray
	bl sub_806FAF8
	ldr r1, _0806FA24 @ =gUnk_08D6551C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA14: .4byte gBattleActor
_0806FA18: .4byte 0x0203E0D4
_0806FA1C: .4byte gBattleTarget
_0806FA20: .4byte gBattleHitArray
_0806FA24: .4byte gUnk_08D6551C

	thumb_func_start BeginBattleMapAnims
BeginBattleMapAnims: @ 0x0806FA28
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806FA48 @ =gBattleStats
	ldrh r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806FA4C
	bl sub_806F97C
	b _0806FA8A
	.align 2, 0
_0806FA48: .4byte gBattleStats
_0806FA4C:
	ldr r0, _0806FA90 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA90 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA94 @ =gBattleActor
	ldr r1, _0806FA98 @ =gBattleTarget
	ldr r2, _0806FA9C @ =gBattleHitArray
	bl sub_806FAA4
	ldr r0, _0806FA94 @ =gBattleActor
	ldr r1, _0806FA98 @ =gBattleTarget
	ldr r2, _0806FA9C @ =gBattleHitArray
	bl sub_806FAF8
	ldr r1, _0806FAA0 @ =gUnk_08D65574
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_0806FA8A:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA90: .4byte 0x0203E0D4
_0806FA94: .4byte gBattleActor
_0806FA98: .4byte gBattleTarget
_0806FA9C: .4byte gBattleHitArray
_0806FAA0: .4byte gUnk_08D65574

	thumb_func_start sub_806FAA4
sub_806FAA4: @ 0x0806FAA4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C1D8
	ldr r1, _0806FAF4 @ =0x0203E0D4
	adds r2, r1, #0
	adds r1, #0x5e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _0806FAF4 @ =0x0203E0D4
	ldr r1, [r7, #8]
	str r1, [r0, #0x50]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C1F8
	ldr r1, _0806FAF4 @ =0x0203E0D4
	str r0, [r1, #0x54]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FAF4: .4byte 0x0203E0D4

	thumb_func_start sub_806FAF8
sub_806FAF8: @ 0x0806FAF8
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #0
	ldr r1, [r7]
	ldr r2, [r7]
	bl sub_806F330
	ldr r1, _0806FB88 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bls _0806FB2C
	ldr r1, _0806FB8C @ =gBattleTarget
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r1, [r7, #4]
	ldr r2, [r7, #4]
	movs r0, #1
	bl sub_806F330
_0806FB2C:
	ldr r0, _0806FB90 @ =gBattleHitArray
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806FB6E
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r2, [r0, #0x10]
	movs r0, #2
	ldr r1, [r7]
	bl sub_806F330
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r2, [r0, #0x14]
	movs r0, #3
	ldr r1, [r7]
	bl sub_806F330
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r1, [r0, #0x10]
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	bl HideUnitSprite
_0806FB6E:
	bl sub_806F514
	movs r0, #0
	str r0, [r7, #0xc]
_0806FB76:
	ldr r1, _0806FB88 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _0806FB98
	b _0806FC10
	.align 2, 0
_0806FB88: .4byte 0x0203E0D4
_0806FB8C: .4byte gBattleTarget
_0806FB90: .4byte gBattleHitArray
_0806FB94: .4byte gBattleStats
_0806FB98:
	ldr r0, _0806FC0C @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _0806FC0C @ =0x0203E0D4
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r1, [r2]
	adds r2, r1, #0
	adds r1, #0x72
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
	ldr r0, _0806FC0C @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl GetUnitMaxHp
	ldr r1, _0806FC0C @ =0x0203E0D4
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806FB76
	.align 2, 0
_0806FC0C: .4byte 0x0203E0D4
_0806FC10:
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FC60: .4byte gDispIo

	thumb_func_start sub_806FC64
sub_806FC64: @ 0x0806FC64
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806FC8A
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
	b _0806FC96
_0806FC8A:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
_0806FC96:
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806FCAC
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806FCB8
	b _0806FCCC
_0806FCAC:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806FCB8
	b _0806FCCC
_0806FCB8:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	cmp r0, r2
	bge _0806FCC6
	movs r0, #2
	b _0806FCDE
_0806FCC4:
	b _0806FCCA
_0806FCC6:
	movs r0, #3
	b _0806FCDE
_0806FCCA:
	b _0806FCDE
_0806FCCC:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	cmp r0, r2
	bge _0806FCDA
	movs r0, #1
	b _0806FCDE
_0806FCD8:
	b _0806FCDE
_0806FCDA:
	movs r0, #0
	b _0806FCDE
_0806FCDE:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806FCE8
sub_806FCE8: @ 0x0806FCE8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r4, _0806FD18 @ =gUnk_083FAA20
	movs r0, #0
	bl GetBgChrOffset
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r2, r3
	adds r2, r0, r1
	adds r0, r4, #0
	adds r1, r2, #0
	bl Decompress
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD18: .4byte gUnk_083FAA20

	thumb_func_start sub_806FD1C
sub_806FD1C: @ 0x0806FD1C
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x30]
	adds r1, r7, #0
	adds r1, #0x10
	strh r0, [r1]
	movs r0, #7
	str r0, [r7, #0x1c]
_0806FD36:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bge _0806FD3E
	b _0806FDB2
_0806FD3E:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x1c]
	adds r4, r0, r1
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r1, [r4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806FDAA
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x20]
_0806FD7E:
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _0806FD86
	b _0806FDA8
_0806FD86:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x20]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x20]
	subs r1, r0, #1
	str r1, [r7, #0x20]
	b _0806FD7E
_0806FDA8:
	b _0806FDB2
_0806FDAA:
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806FD36
_0806FDB2:
	adds r0, r7, #0
	adds r0, #0x14
	adds r1, r0, #7
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	bl sub_8013870
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
_0806FDC8:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bgt _0806FDD0
	b _0806FDFE
_0806FDD0:
	adds r0, r7, #0
	adds r0, #0x14
	movs r1, #7
	ldr r2, [r7, #0x1c]
	subs r1, r1, r2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0x20
	beq _0806FDE4
	b _0806FDFE
_0806FDE4:
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	subs r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806FDC8
_0806FDFE:
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806FE08
sub_806FE08: @ 0x0806FE08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x20
	bl sub_806FCE8
	ldr r1, _0806FE34 @ =0x06000540
	ldr r0, [r7]
	bl Decompress
	ldr r1, _0806FE38 @ =gUnk_08400BA8
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE34: .4byte 0x06000540
_0806FE38: .4byte gUnk_08400BA8

	thumb_func_start sub_806FE3C
sub_806FE3C: @ 0x0806FE3C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	ble _0806FE5A
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	b _0806FE60
_0806FE5A:
	ldr r0, [r7, #4]
	ldr r1, [r0]
	str r1, [r7, #0x10]
_0806FE60:
	ldr r0, [r7]
	ldr r2, [r7, #0x1c]
	adds r1, r2, #0
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #8]
	adds r2, r3, #0
	lsls r3, r2, #0xc
	adds r2, r3, #0
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	ldr r2, [r7, #0xc]
	subs r1, r1, r2
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _0806FE96
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_0806FE96:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806FEA0
sub_806FEA0: @ 0x0806FEA0
	push {r4, r7, lr}
	sub sp, #0x20
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806FEB6:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806FEC0
	b _0806FED4
_0806FEC0:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #0x18]
	ldrh r2, [r1]
	adds r0, r0, r2
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806FEB6
_0806FED4:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _0806FEE8
	ldr r0, [r7, #0x14]
	str r0, [r7, #0x10]
	b _0806FEFC
_0806FEE8:
	ldr r0, [r7, #0x14]
	lsls r1, r0, #8
	adds r0, r1, #0
	ldr r1, [r7, #4]
	bl __divsi3
	ldr r1, [r7, #8]
	muls r0, r1, r0
	asrs r1, r0, #8
	str r1, [r7, #0x10]
_0806FEFC:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0806FF0E
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _0806FF0E
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806FF0E:
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806FF12:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806FF1C
	b _0806FF50
_0806FF1C:
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, _0806FF4C @ =gUnk_08D656D0
	ldr r2, [r7, #0xc]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r7, #0x18]
	ldrh r3, [r0]
	ldr r4, [r7, #0x18]
	adds r0, r4, #2
	ldrh r4, [r0]
	str r4, [sp]
	ldr r0, [r7]
	bl sub_806FE3C
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806FF12
	.align 2, 0
_0806FF4C: .4byte gUnk_08D656D0
_0806FF50:
	add sp, #0x20
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806FF58
sub_806FF58: @ 0x0806FF58
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806FF6C @ =gUnk_08D656F0
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF6C: .4byte gUnk_08D656F0

	thumb_func_start sub_806FF70
sub_806FF70: @ 0x0806FF70
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0806FFC8 @ =gUnk_08D656F0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x30]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FFC8: .4byte gUnk_08D656F0

	thumb_func_start sub_806FFCC
sub_806FFCC: @ 0x0806FFCC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetOnHBlankA
	bl ClearBg0Bg1
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806FFE8
sub_806FFE8: @ 0x0806FFE8
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08070030 @ =gUnk_083FAAE4
	movs r0, #1
	bl GetBgChrOffset
	ldr r2, _08070034 @ =0x06000020
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08070038 @ =gUnk_084009F0
	adds r0, r1, #0
	bl sub_806FE08
	ldr r1, _0807003C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _08070040
	cmp r0, #2
	beq _0807004E
	b _080700B4
	.align 2, 0
_08070030: .4byte gUnk_083FAAE4
_08070034: .4byte 0x06000020
_08070038: .4byte gUnk_084009F0
_0807003C: .4byte 0x0203E0D4
_08070040:
	movs r2, #5
	rsbs r2, r2, #0
	ldr r0, [r7]
	movs r1, #0
	bl sub_8070390
	b _080700B4
_0807004E:
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _08070070 @ =0x0203E0D4
	ldr r0, [r1]
	ldr r1, _08070070 @ =0x0203E0D4
	ldr r2, [r1, #0x14]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r0, r1
	ble _08070074
	movs r0, #1
	str r0, [r7, #4]
	b _08070094
	.align 2, 0
_08070070: .4byte 0x0203E0D4
_08070074:
	ldr r0, _080700B0 @ =0x0203E0D4
	ldr r1, [r0]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, _080700B0 @ =0x0203E0D4
	ldr r2, [r1, #0x14]
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r2, #0xc0
	ands r1, r2
	cmp r0, r1
	ble _08070094
	movs r0, #1
	str r0, [r7, #4]
_08070094:
	ldr r1, [r7, #4]
	movs r2, #0xa
	rsbs r2, r2, #0
	ldr r0, [r7]
	bl sub_8070390
	movs r0, #1
	ldr r2, [r7, #4]
	subs r1, r0, r2
	ldr r0, [r7]
	movs r2, #0
	bl sub_8070390
	b _080700B4
	.align 2, 0
_080700B0: .4byte 0x0203E0D4
_080700B4:
	bl InitScanlineEffect
	ldr r0, _080700F4 @ =0x0203E0D4
	ldrb r1, [r0, #0x11]
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, _080700F4 @ =0x0203E0D4
	ldrb r2, [r1, #0x11]
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #0x20
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r3, _080700F8 @ =gPal
	ldrh r2, [r3, #0x22]
	ldr r4, _080700F8 @ =gPal
	adds r3, r4, #0
	adds r4, #0x42
	ldrh r3, [r4]
	bl sub_8077420
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080700F4: .4byte 0x0203E0D4
_080700F8: .4byte gPal

	thumb_func_start sub_80700FC
sub_80700FC: @ 0x080700FC
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #4]
_08070110:
	ldr r1, _08070120 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _08070124
	b _08070224
	.align 2, 0
_08070120: .4byte 0x0203E0D4
_08070124:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08070218 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _08070218 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	ble _08070168
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #0
	subs r1, #0x10
	adds r2, r1, #0
	strh r2, [r0]
_08070168:
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _08070218 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	bge _080701C2
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #4
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080701C2
	ldr r1, _0807021C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080701C2
	ldr r1, _08070220 @ =0x00000395
	adds r0, r1, #0
	bl m4aSongNumStart
_080701C2:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08070218 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1, #0xe]
	cmp r0, r1
	beq _08070210
	ldr r0, _08070218 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8070258
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #1
	strb r1, [r0]
_08070210:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08070110
	.align 2, 0
_08070218: .4byte 0x0203E0D4
_0807021C: .4byte gPlaySt
_08070220: .4byte 0x00000395
_08070224:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0807024C
	ldr r1, _08070254 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807024C
	ldr r0, _08070254 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0807024C:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070254: .4byte 0x0203E0D4

	thumb_func_start sub_8070258
sub_8070258: @ 0x08070258
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08070328 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, _08070328 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807032C @ =gBg0Tm
	adds r0, r0, r1
	ldr r1, _08070328 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	lsrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	ldr r2, _08070330 @ =0x00005020
	movs r3, #0
	str r3, [sp]
	movs r3, #3
	bl sub_806FD1C
	ldr r0, _08070328 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, _08070328 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807032C @ =gBg0Tm
	adds r0, r0, r1
	ldr r1, _08070328 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r3, r1, r2
	ldrb r1, [r3, #0xc]
	ldr r2, _08070328 @ =0x0203E0D4
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldrh r3, [r2, #0xe]
	lsrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, _08070334 @ =gUnk_08D656B4
	str r3, [sp]
	movs r3, #0
	bl sub_806FEA0
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070328: .4byte 0x0203E0D4
_0807032C: .4byte gBg0Tm
_08070330: .4byte 0x00005020
_08070334: .4byte gUnk_08D656B4

	thumb_func_start sub_8070338
sub_8070338: @ 0x08070338
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0x40
	beq _08070374
	cmp r0, #0x40
	bgt _0807035A
	cmp r0, #0
	beq _08070364
	b _08070384
_0807035A:
	cmp r0, #0x80
	beq _0807036C
	cmp r0, #0xc0
	beq _0807037C
	b _08070384
_08070364:
	ldr r0, _08070368 @ =gUnk_083FAC48
	b _08070388
	.align 2, 0
_08070368: .4byte gUnk_083FAC48
_0807036C:
	ldr r0, _08070370 @ =gUnk_083FAC68
	b _08070388
	.align 2, 0
_08070370: .4byte gUnk_083FAC68
_08070374:
	ldr r0, _08070378 @ =gUnk_083FAC88
	b _08070388
	.align 2, 0
_08070378: .4byte gUnk_083FAC88
_0807037C:
	ldr r0, _08070380 @ =gUnk_083FACA8
	b _08070388
	.align 2, 0
_08070380: .4byte gUnk_083FACA8
_08070384:
	movs r0, #0
	b _08070388
_08070388:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8070390
sub_8070390: @ 0x08070390
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08070520 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x2e
	ldr r3, [r7, #8]
	adds r2, r3, #0
	ldrb r3, [r1]
	adds r1, r2, r3
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x10]
	ldr r0, _08070520 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x2f
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x11]
	ldr r0, _08070520 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8070338
	ldr r2, [r7, #4]
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08070524 @ =gUnk_08D656D8
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	ldr r3, _08070520 @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x5e
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _08070528 @ =gBuf
	adds r0, r1, #0
	adds r1, r2, #0
	bl Decompress
	ldr r0, _08070520 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	lsls r0, r1, #5
	ldr r1, _08070520 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807052C @ =gBg1Tm
	adds r0, r0, r1
	ldr r1, _08070528 @ =gBuf
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #0xc
	adds r2, r3, #0
	movs r3, #1
	orrs r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl TmApplyTsa_thm
	movs r0, #2
	bl EnableBgSync
	ldr r0, _08070520 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	lsls r2, r1, #5
	adds r0, r2, #1
	ldr r1, _08070520 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08070530 @ =gBg0Tm
	adds r4, r0, r1
	ldr r0, _08070520 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl sub_8014AB0
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08070520 @ =0x0203E0D4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08070520 @ =0x0203E0D4
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r3, [r1, #0xd]
	adds r2, r3, #0
	lsls r1, r2, #4
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8070258
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070520: .4byte 0x0203E0D4
_08070524: .4byte gUnk_08D656D8
_08070528: .4byte gBuf
_0807052C: .4byte gBg1Tm
_08070530: .4byte gBg0Tm

	thumb_func_start sub_8070534
sub_8070534: @ 0x08070534
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x2a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7]
	bl sub_8070620
	ldr r0, _0807061C @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807061C @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807061C @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807061C: .4byte gDispIo

	thumb_func_start sub_8070620
sub_8070620: @ 0x08070620
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08070700 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070700 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08070700 @ =gDispIo
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
	ldr r0, _08070700 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x2a]
	adds r1, r2, #2
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x2a]
	ldr r0, [r7]
	movs r2, #0x2a
	ldrsh r1, [r0, r2]
	cmp r1, #0x10
	ble _080706F8
	ldr r0, _08070700 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070700 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070700 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	bl Proc_Break
_080706F8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070700: .4byte gDispIo

	thumb_func_start sub_8070704
sub_8070704: @ 0x08070704
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08070764 @ =gBg0Tm
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r2, _08070768 @ =0x0000521F
	ldr r3, _0807076C @ =0x00005229
	str r3, [sp]
	movs r3, #2
	bl sub_806FD1C
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08070764 @ =gBg0Tm
	adds r0, r0, r1
	ldr r2, [r7, #8]
	ldr r1, _08070770 @ =gUnk_08D65728
	str r1, [sp]
	movs r1, #0x63
	movs r3, #0
	bl sub_806FEA0
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070764: .4byte gBg0Tm
_08070768: .4byte 0x0000521F
_0807076C: .4byte 0x00005229
_08070770: .4byte gUnk_08D65728

	thumb_func_start sub_8070774
sub_8070774: @ 0x08070774
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08070804 @ =gUnk_081DF464
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070808 @ =0x06004000
	adds r1, r0, r2
	adds r0, r4, #0
	movs r2, #0xe0
	bl RegisterDataMove
	ldr r4, _0807080C @ =gUnk_081DF764
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070810 @ =0x060040E0
	adds r1, r0, r2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r4, _08070814 @ =gUnk_081DFA64
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070818 @ =0x060043E0
	adds r1, r0, r2
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r1, _0807081C @ =gUnk_081DFC30
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08070820 @ =gBg0Tm + 0x20c
	ldr r1, _08070824 @ =gUnk_083FA9B8
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_8070704
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070804: .4byte gUnk_081DF464
_08070808: .4byte 0x06004000
_0807080C: .4byte gUnk_081DF764
_08070810: .4byte 0x060040E0
_08070814: .4byte gUnk_081DFA64
_08070818: .4byte 0x060043E0
_0807081C: .4byte gUnk_081DFC30
_08070820: .4byte gBg0Tm + 0x20c
_08070824: .4byte gUnk_083FA9B8

	thumb_func_start sub_8070828
sub_8070828: @ 0x08070828
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08070854 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807084A
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStart
_0807084A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070854: .4byte gPlaySt

	thumb_func_start sub_8070858
sub_8070858: @ 0x08070858
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	ble _080708A4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_080708A4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_8070704
	ldr r1, [r7]
	adds r0, r1, #0
	adds r4, r1, #0
	adds r4, #0x64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	movs r1, #0x64
	bl __modsi3
	adds r1, r0, #0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	bne _080708EE
	ldr r0, [r7]
	bl Proc_Break
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStop
_080708EE:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80708F8
sub_80708F8: @ 0x080708F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl sub_80709E8
	ldr r0, _080709E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080709E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080709E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080709E4: .4byte gDispIo

	thumb_func_start sub_80709E8
sub_80709E8: @ 0x080709E8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08070AC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070AC0 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r3, [r2]
	adds r1, r3, #0
	movs r2, #0x4c
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08070AC0 @ =gDispIo
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
	ldr r0, _08070AC0 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r1, [r2]
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x6a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6a
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc
	ble _08070AB8
	ldr r0, _08070AC0 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070AC0 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070AC0 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	bl Proc_Break
_08070AB8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070AC0: .4byte gDispIo

	thumb_func_start sub_8070AC4
sub_8070AC4: @ 0x08070AC4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	bgt _08070ADC
	b _08070AEE
_08070ADC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_8075098
_08070AEE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070AF8
sub_8070AF8: @ 0x08070AF8
	push {r7, lr}
	mov r7, sp
	ldr r1, _08070B0C @ =gUnk_08D6587C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070B0C: .4byte gUnk_08D6587C

	thumb_func_start sub_8070B10
sub_8070B10: @ 0x08070B10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x30
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetCharacterData
	str r0, [r7, #0xc]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r4, #0xe
	ldrsh r1, [r0, r4]
	adds r0, r1, #0
	bl GetClassData
	str r0, [r7, #0x10]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r5, #8
	ldrsh r1, [r0, r5]
	str r1, [r7, #0x14]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0xe
	ldrsh r1, [r0, r6]
	str r1, [r7, #0x18]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x1c]
	ldr r0, [r7, #4]
	cmp r0, #9
	bls _08070B8E
	b _08070F64
_08070B8E:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08070BA0 @ =_08070BA4
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08070B9C: .4byte gUnk_08D65878
_08070BA0: .4byte _08070BA4
_08070BA4: @ jump table
	.4byte _08070BCC @ case 0
	.4byte _08070C54 @ case 1
	.4byte _08070CD0 @ case 2
	.4byte _08070D4C @ case 3
	.4byte _08070DD4 @ case 4
	.4byte _08070E68 @ case 5
	.4byte _08070E68 @ case 6
	.4byte _08070E68 @ case 7
	.4byte _08070E68 @ case 8
	.4byte _08070E68 @ case 9
_08070BCC:
	ldr r0, _08070C4C @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x14
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070C4C @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x14
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x14]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0xc]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	ldr r1, _08070C4C @ =gUnk_08D65878
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x14
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070C50 @ =gBg0Tm + 0xc
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070C4C: .4byte gUnk_08D65878
_08070C50: .4byte gBg0Tm + 0xc
_08070C54:
	ldr r0, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x1c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r2, [r7, #8]
	ldr r3, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r4, #0xa
	ldrsh r3, [r1, r4]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _08070CCC @ =gBg0Tm + 0x8e
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070CC8: .4byte gUnk_08D65878
_08070CCC: .4byte gBg0Tm + 0x8e
_08070CD0:
	ldr r0, _08070D44 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x24
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070D44 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r2, [r7, #8]
	ldr r3, _08070D44 @ =gUnk_08D65878
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r5, #0xc
	ldrsh r3, [r1, r5]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070D44 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _08070D48 @ =gBg0Tm + 0x94
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070D44: .4byte gUnk_08D65878
_08070D48: .4byte gBg0Tm + 0x94
_08070D4C:
	ldr r0, _08070DCC @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x2c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070DCC @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x2c
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x18]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0x10]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	ldr r1, _08070DCC @ =gUnk_08D65878
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x2c
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070DD0 @ =gBg0Tm + 0x10c
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070DCC: .4byte gUnk_08D65878
_08070DD0: .4byte gBg0Tm + 0x10c
_08070DD4:
	ldr r0, _08070E60 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x34
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070E60 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x34
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x1c]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r1, _08070E60 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0x10
	ldrsh r1, [r0, r6]
	adds r0, r1, #0
	bl GetItemName
	ldr r1, _08070E60 @ =gUnk_08D65878
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x34
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070E64 @ =gBg0Tm + 0x18c
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070E60: .4byte gUnk_08D65878
_08070E64: .4byte gBg0Tm + 0x18c
_08070E68:
	ldr r0, _08070F58 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070F58 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #8]
	ldr r3, _08070F58 @ =gUnk_08D65878
	ldr r1, [r3]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	ldr r4, [r7]
	movs r5, #0x64
	muls r4, r5, r4
	adds r3, r3, r4
	adds r1, #8
	adds r4, r1, r3
	movs r1, #0
	ldrsh r3, [r4, r1]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070F58 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #4]
	subs r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #0
	adds r2, #8
	lsls r3, r2, #5
	adds r1, r3, #7
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, _08070F5C @ =gBg0Tm
	adds r1, r1, r2
	ldr r2, [r7, #8]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08070F60 @ =gUnk_08D657D8
	ldr r5, _08070F58 @ =gUnk_08D65878
	ldr r4, [r5]
	ldr r5, [r7, #4]
	adds r6, r5, #0
	lsls r5, r6, #1
	str r5, [r7, #0x20]
	ldr r6, [r7]
	str r6, [r7, #0x24]
	movs r5, #0x64
	mov r8, r5
	ldr r5, [r7, #0x24]
	mov r6, r8
	muls r6, r5, r6
	str r6, [r7, #0x24]
	ldr r6, [r7, #0x20]
	ldr r5, [r7, #0x24]
	adds r6, r6, r5
	str r6, [r7, #0x20]
	adds r4, #8
	ldr r6, [r7, #0x20]
	adds r5, r4, r6
	movs r6, #0
	ldrsh r4, [r5, r6]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	str r4, [sp, #4]
	movs r3, #0x10
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070F58: .4byte gUnk_08D65878
_08070F5C: .4byte gBg0Tm
_08070F60: .4byte gUnk_08D657D8
_08070F64:
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8070F70
sub_8070F70: @ 0x08070F70
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071164 @ =gUnk_08C025F8
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x10]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x10]
	ldr r1, _08071168 @ =gUnk_08D65878
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
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0xc]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x72
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x6c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x6e
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x70
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x16]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x78
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7e
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071164: .4byte gUnk_08C025F8
_08071168: .4byte gUnk_08D65878

	thumb_func_start sub_807116C
sub_807116C: @ 0x0807116C
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	bl MU_EndAll
	bl ResetText
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08071268 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _0807126C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08071260 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08071260 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_804A4CC
	movs r0, #0
	str r0, [r7, #4]
_0807124E:
	ldr r0, _08071270 @ =gUnk_08D65850
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	bne _08071274
	b _080712A8
	.align 2, 0
_08071260: .4byte gDispIo
_08071264: .4byte 0x030027CC
_08071268: .4byte 0x0000FFE0
_0807126C: .4byte 0x0000E0FF
_08071270: .4byte gUnk_08D65850
_08071274:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r2, _080712A0 @ =gBg0Tm + 0x2
	adds r0, r1, r2
	ldr r1, _080712A4 @ =gUnk_08D65850
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	bl sub_8014B14
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807124E
	.align 2, 0
_080712A0: .4byte gBg0Tm + 0x2
_080712A4: .4byte gUnk_08D65850
_080712A8:
	movs r0, #0
	str r0, [r7, #4]
_080712AC:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _080712B4
	b _0807133E
_080712B4:
	movs r0, #0
	str r0, [r7, #8]
_080712B8:
	ldr r0, [r7, #8]
	cmp r0, #1
	ble _080712C0
	b _08071336
_080712C0:
	ldr r0, _0807131C @ =gUnk_08D65878
	ldr r1, [r7, #8]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r1, _08071320 @ =gUnk_08D65800
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	bl sub_800536C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #8]
	cmp r1, r0
	bne _08071324
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #4]
	cmp r1, r0
	bne _08071324
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #0
	bl sub_8070B10
	b _0807132E
	.align 2, 0
_0807131C: .4byte gUnk_08D65878
_08071320: .4byte gUnk_08D65800
_08071324:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #1
	bl sub_8070B10
_0807132E:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080712B8
_08071336:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080712AC
_0807133E:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807134C
sub_807134C: @ 0x0807134C
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r0, [r1, r3]
	str r0, [r7, #8]
	ldr r1, _08071390 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0807139A
	bl sub_8071960
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _08071394
	b _08071860
	.align 2, 0
_08071390: .4byte gpKeySt
_08071394:
	ldr r0, [r7]
	bl Proc_Break
_0807139A:
	ldr r1, _080713B8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080713BC
	movs r0, #0xa
	str r0, [r7, #0xc]
	b _080713C0
	.align 2, 0
_080713B8: .4byte gpKeySt
_080713BC:
	movs r0, #1
	str r0, [r7, #0xc]
_080713C0:
	ldr r1, _080714D8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080713D8
	b _08071534
_080713D8:
	ldr r1, _080714DC @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r5, #0
	ldrsh r2, [r3, r5]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _080714DC @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _080714DC @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _080714E0 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #6]
	cmp r0, r2
	blt _08071534
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _080714E4
	ldr r1, _080714DC @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _080714E0 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08071534
	.align 2, 0
_080714D8: .4byte gpKeySt
_080714DC: .4byte gUnk_08D65878
_080714E0: .4byte gUnk_08D65800
_080714E4:
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08071654 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08071534:
	ldr r1, _08071658 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0807154C
	b _080716A8
_0807154C:
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _08071650 @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _08071654 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	cmp r0, r2
	bge _080716A8
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _0807165C
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08071654 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080716A8
	.align 2, 0
_08071650: .4byte gUnk_08D65878
_08071654: .4byte gUnk_08D65800
_08071658: .4byte gpKeySt
_0807165C:
	ldr r1, _08071868 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080716A8:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0807171A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _080716EE
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080716EE:
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #3
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_0807171A:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0807178C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #1
	beq _08071760
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08071760:
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #4
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_0807178C:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080717CE
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #1
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080717CE:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071810
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #2
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08071810:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071830
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	movs r2, #1
	bl sub_8070B10
_08071830:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071860
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	bl sub_8070B10
_08071860:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071868: .4byte gUnk_08D65878
_0807186C: .4byte gUnk_08D65800
_08071870: .4byte gpKeySt

	thumb_func_start sub_8071874
sub_8071874: @ 0x08071874
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x72
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x3c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x12]
	ldr r1, _0807195C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7, #4]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetCharacterData
	ldr r1, [r7]
	str r0, [r1]
	ldr r1, _0807195C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7, #4]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetClassData
	ldr r1, [r7]
	str r0, [r1, #4]
	ldr r0, [r7]
	ldr r2, _0807195C @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, [r7]
	ldr r2, _0807195C @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r1, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r0, [r7]
	ldr r2, _0807195C @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807195C: .4byte gUnk_08D65878

	thumb_func_start sub_8071960
sub_8071960: @ 0x08071960
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	ldr r0, _08071994 @ =gBattleHitArray
	str r0, [r7, #0xc]
	ldr r1, _08071998 @ =gBattleActor
	adds r0, r1, #0
	movs r1, #0
	bl sub_8071874
	ldr r1, _0807199C @ =gBattleTarget
	adds r0, r1, #0
	movs r1, #1
	bl sub_8071874
	bl ClearBattleHits
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7]
_0807198A:
	ldr r0, [r7]
	cmp r0, #4
	ble _080719A0
	b _080719F0
	.align 2, 0
_08071994: .4byte gBattleHitArray
_08071998: .4byte gBattleActor
_0807199C: .4byte gBattleTarget
_080719A0:
	movs r0, #0
	str r0, [r7, #4]
_080719A4:
	ldr r0, [r7, #4]
	cmp r0, #1
	ble _080719AC
	b _080719E0
_080719AC:
	ldr r1, _080719D4 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080719D8
	movs r0, #1
	str r0, [r7, #0x10]
	b _080719E0
	.align 2, 0
_080719D4: .4byte gUnk_08D65878
_080719D8:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080719A4
_080719E0:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080719E8
	b _080719F0
_080719E8:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0807198A
_080719F0:
	ldr r0, [r7]
	cmp r0, #5
	bne _08071A00
	ldr r0, [r7, #4]
	cmp r0, #2
	bne _08071A00
	movs r0, #0
	b _08071BCE
_08071A00:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #8]
_08071A0C:
	ldr r0, [r7, #8]
	cmp r0, #9
	ble _08071A14
	b _08071BAE
_08071A14:
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	str r0, [r7]
	ldr r0, [r7, #8]
	movs r1, #1
	ands r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _08071A70 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	cmp r0, #8
	bhi _08071B02
	lsls r1, r0, #2
	ldr r2, _08071A74 @ =_08071A78
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071A70: .4byte gUnk_08D65878
_08071A74: .4byte _08071A78
_08071A78: @ jump table
	.4byte _08071ACE @ case 0
	.4byte _08071ACE @ case 1
	.4byte _08071ACE @ case 2
	.4byte _08071ACE @ case 3
	.4byte _08071A9C @ case 4
	.4byte _08071A9C @ case 5
	.4byte _08071A9C @ case 6
	.4byte _08071A9C @ case 7
	.4byte _08071AE4 @ case 8
_08071A9C:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071B02
_08071ACE:
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071B02
_08071AE4:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B02
_08071B02:
	ldr r1, [r7, #0x10]
	subs r0, r1, #2
	cmp r0, #6
	bhi _08071B96
	lsls r1, r0, #2
	ldr r2, _08071B14 @ =_08071B18
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071B14: .4byte _08071B18
_08071B18: @ jump table
	.4byte _08071B34 @ case 0
	.4byte _08071B54 @ case 1
	.4byte _08071B76 @ case 2
	.4byte _08071B96 @ case 3
	.4byte _08071B34 @ case 4
	.4byte _08071B54 @ case 5
	.4byte _08071B76 @ case 6
_08071B34:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B96
_08071B52:
	b _08071B96
_08071B54:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B96
_08071B74:
	b _08071B96
_08071B76:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B96
_08071B94:
	b _08071B96
_08071B96:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08071B9E
	b _08071BA0
_08071B9E:
	b _08071BA6
_08071BA0:
	ldr r0, [r7, #0xc]
	adds r1, r0, #4
	str r1, [r7, #0xc]
_08071BA6:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08071A0C
_08071BAE:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #2]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	movs r0, #1
	b _08071BCE
_08071BCE:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8071BD8
sub_8071BD8: @ 0x08071BD8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071C08 @ =gBg0Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _08071C0C @ =gBg1Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	bl BeginBattleMapAnims
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071C08: .4byte gBg0Tm
_08071C0C: .4byte gBg1Tm

	thumb_func_start sub_8071C10
sub_8071C10: @ 0x08071C10
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071C7C @ =gUnk_083F95C8
	ldr r1, _08071C80 @ =0x06013000
	bl Decompress
	ldr r0, _08071C84 @ =gUnk_083F96B8
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071C88 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	ldr r3, [r7]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08071C88 @ =gBmSt
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #3
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071C7C: .4byte gUnk_083F95C8
_08071C80: .4byte 0x06013000
_08071C84: .4byte gUnk_083F96B8
_08071C88: .4byte gBmSt

	thumb_func_start sub_8071C8C
sub_8071C8C: @ 0x08071C8C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071CF8 @ =gUnk_083F9820
	ldr r1, _08071CFC @ =0x06013000
	bl Decompress
	ldr r0, _08071D00 @ =gUnk_083F9964
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071D04 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	ldr r3, [r7]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08071D04 @ =gBmSt
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #3
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071CF8: .4byte gUnk_083F9820
_08071CFC: .4byte 0x06013000
_08071D00: .4byte gUnk_083F9964
_08071D04: .4byte gBmSt

	thumb_func_start sub_8071D08
sub_8071D08: @ 0x08071D08
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _08071D94 @ =gUnk_08D658DC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071D98 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071D98 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	subs r1, #8
	str r1, [r0, #0x34]
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	movs r2, #1
	eors r1, r2
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071D94: .4byte gUnk_08D658DC
_08071D98: .4byte gBmSt

	thumb_func_start sub_8071D9C
sub_8071D9C: @ 0x08071D9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071DE8 @ =gUnk_083FAEE0
	ldr r1, _08071DEC @ =0x06013000
	bl Decompress
	ldr r0, _08071DF0 @ =gUnk_083FB16C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08071DF4 @ =gUnk_083F44FC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc6
	lsls r3, r3, #6
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x48
	movs r6, #0
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071DE8: .4byte gUnk_083FAEE0
_08071DEC: .4byte 0x06013000
_08071DF0: .4byte gUnk_083FB16C
_08071DF4: .4byte gUnk_083F44FC

	thumb_func_start sub_8071DF8
sub_8071DF8: @ 0x08071DF8
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071E60 @ =gUnk_08D658FC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071E64 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071E64 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071E60: .4byte gUnk_08D658FC
_08071E64: .4byte gBmSt

	thumb_func_start sub_8071E68
sub_8071E68: @ 0x08071E68
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xb7
	bl sub_80151FC
	ldr r0, _08071EB8 @ =gUnk_083FB310
	ldr r1, _08071EBC @ =0x06013800
	bl Decompress
	ldr r0, _08071EC0 @ =gUnk_083FB664
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08071EC4 @ =gUnk_083F4464
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #8
	ldr r3, _08071EC8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071EB8: .4byte gUnk_083FB310
_08071EBC: .4byte 0x06013800
_08071EC0: .4byte gUnk_083FB664
_08071EC4: .4byte gUnk_083F4464
_08071EC8: .4byte 0x000041C0

	thumb_func_start sub_8071ECC
sub_8071ECC: @ 0x08071ECC
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071F34 @ =gUnk_08D6591C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071F38 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071F38 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071F34: .4byte gUnk_08D6591C
_08071F38: .4byte gBmSt

	thumb_func_start sub_8071F3C
sub_8071F3C: @ 0x08071F3C
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	bl sub_807456C
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08072058 @ =gUnk_083FCDB0
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _0807205C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072068 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _0807206C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072070 @ =gUnk_083FD3D8
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl sub_8014BA4
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072058: .4byte gUnk_083FCDB0
_0807205C: .4byte 0x06002800
_08072060: .4byte gDispIo
_08072064: .4byte 0x030027CC
_08072068: .4byte 0x0000FFE0
_0807206C: .4byte 0x0000E0FF
_08072070: .4byte gUnk_083FD3D8

	thumb_func_start sub_8072074
sub_8072074: @ 0x08072074
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #2
	bls _080720FC
	bl sub_8014B58
	ldr r0, _080720F0 @ =gUnk_083FD3D8
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_8014BBC
	ldr r4, _080720F4 @ =gUnk_083FD418
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080720F8 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _080720BA
	adds r0, #7
_080720BA:
	asrs r1, r0, #3
	subs r0, r1, #4
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _080720CA
	adds r1, #7
_080720CA:
	asrs r2, r1, #3
	subs r1, r2, #4
	movs r2, #0
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #8
	movs r3, #0x3c
	bl sub_8072320
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8c
	bl sub_80151FC
	b _08072196
	.align 2, 0
_080720F0: .4byte gUnk_083FD3D8
_080720F4: .4byte gUnk_083FD418
_080720F8: .4byte 0x06002800
_080720FC:
	ldr r0, _080721A0 @ =gUnk_08D65954
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #4]
	ldr r0, _080721A0 @ =gUnk_08D65954
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _0807213A
	adds r0, #7
_0807213A:
	asrs r0, r0, #3
	ldr r2, [r7, #4]
	adds r1, r0, r2
	subs r0, r1, #3
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _0807214E
	adds r1, #7
_0807214E:
	asrs r1, r1, #3
	ldr r3, [r7, #8]
	adds r2, r1, r3
	subs r1, r2, #3
	movs r2, #8
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #6
	movs r3, #0xa
	bl sub_8072320
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x89
	bl sub_80151FC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08072196:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080721A0: .4byte gUnk_08D65954

	thumb_func_start sub_80721A4
sub_80721A4: @ 0x080721A4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080721C4 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080721C4: .4byte gBg2Tm

	thumb_func_start sub_80721C8
sub_80721C8: @ 0x080721C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8014B58
	ldr r1, _0807223C @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072240 @ =0x030027CC
	ldr r1, _08072240 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072244 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072240 @ =0x030027CC
	ldr r1, _08072240 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0x1f
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072248 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl sub_807224C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807223C: .4byte gBg2Tm
_08072240: .4byte 0x030027CC
_08072244: .4byte 0x0000FFE0
_08072248: .4byte gDispIo

	thumb_func_start sub_807224C
sub_807224C: @ 0x0807224C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	asrs r2, r1, #2
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x46
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08072312
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08072312:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807231C: .4byte gDispIo

	thumb_func_start sub_8072320
sub_8072320: @ 0x08072320
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08072370 @ =gUnk_08D6597C
	ldr r1, [r7, #0x20]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x58]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072370: .4byte gUnk_08D6597C

	thumb_func_start sub_8072374
sub_8072374: @ 0x08072374
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08072394 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072394: .4byte gBg2Tm

	thumb_func_start sub_8072398
sub_8072398: @ 0x08072398
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080723B8 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080723B8: .4byte gBg2Tm

	thumb_func_start sub_80723BC
sub_80723BC: @ 0x080723BC
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08072450 @ =gBg2Tm
	ldr r2, [r7]
	ldr r1, [r2, #0x2c]
	ldr r3, [r7]
	ldr r2, [r3, #0x30]
	ldr r3, _08072454 @ =0x00004140
	ldr r4, [r7]
	ldr r5, [r4, #0x54]
	str r5, [sp]
	ldr r4, [r7]
	ldr r5, [r4, #0x54]
	str r5, [sp, #4]
	bl sub_8014C38
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072450: .4byte gBg2Tm
_08072454: .4byte 0x00004140
_08072458: .4byte gDispIo

	thumb_func_start sub_807245C
sub_807245C: @ 0x0807245C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072510 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072510 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072510 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072510 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #7
	ble _08072506
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08072506:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072510: .4byte gDispIo

	thumb_func_start sub_8072514
sub_8072514: @ 0x08072514
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x44
	ldr r1, [r7]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x44
	ldrh r3, [r2]
	subs r0, r3, #1
	adds r2, r1, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r0, #0
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	movs r1, #1
	cmn r0, r1
	bne _08072554
	ldr r0, [r7]
	bl Proc_Break
_08072554:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807255C
sub_807255C: @ 0x0807255C
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	cmp r1, #0
	bne _08072574
	ldr r0, [r7]
	bl Proc_Break
	b _08072628
_08072574:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	str r1, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, _08072630 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072630 @ =gDispIo
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072630 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072630 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	cmp r0, r2
	blt _08072628
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _08072634 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7]
	bl Proc_Break
_08072628:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072630: .4byte gDispIo
_08072634: .4byte gBg2Tm

	thumb_func_start sub_8072638
sub_8072638: @ 0x08072638
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _080726B0 @ =gUnk_08D659BC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080726B4 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080726B4 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #0x50]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080726B0: .4byte gUnk_08D659BC
_080726B4: .4byte gBmSt

	thumb_func_start sub_80726B8
sub_80726B8: @ 0x080726B8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xb6
	bl sub_80151FC
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldr r4, [r0, #0x50]
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080727B8 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_807456C
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080727B4: .4byte gDispIo
_080727B8: .4byte 0x06002800

	thumb_func_start sub_80727BC
sub_80727BC: @ 0x080727BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08072874 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080727D6
	adds r1, #7
_080727D6:
	asrs r2, r1, #3
	subs r1, r2, #3
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _080727E6
	adds r2, #7
_080727E6:
	asrs r3, r2, #3
	subs r2, r3, #3
	ldr r3, _08072878 @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0807287C @ =gUnk_083FC770
	str r4, [sp, #8]
	ldr r4, _08072880 @ =gUnk_08D659EC
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014D78
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072880 @ =gUnk_08D659EC
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08072866
	ldr r0, [r7]
	bl Proc_Break
_08072866:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072874: .4byte gBg2Tm
_08072878: .4byte 0x00004140
_0807287C: .4byte gUnk_083FC770
_08072880: .4byte gUnk_08D659EC

	thumb_func_start sub_8072884
sub_8072884: @ 0x08072884
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080728E8 @ =gUnk_08D65A04
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080728EC @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080728EC @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080728E8: .4byte gUnk_08D65A04
_080728EC: .4byte gBmSt

	thumb_func_start sub_80728F0
sub_80728F0: @ 0x080728F0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807290C @ =0x0000010F
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	bl sub_80151FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807290C: .4byte 0x0000010F

	thumb_func_start sub_8072910
sub_8072910: @ 0x08072910
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	adds r0, r3, #0
	adds r1, r7, #0
	adds r1, #0xc
	strh r0, [r1]
	ldr r1, _08072968 @ =gUnk_08D65A24
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	str r1, [r0, #0x50]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0xc
	adds r2, r0, #0
	adds r0, #0x58
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072968: .4byte gUnk_08D65A24

	thumb_func_start sub_807296C
sub_807296C: @ 0x0807296C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldr r4, [r0, #0x50]
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08072A9C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08072AA0 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072AA4 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08072AA4 @ =gBmSt
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	subs r2, r3, #2
	ldr r3, _08072AA8 @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	bl sub_8014C38
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	ldr r0, [r1, #0x54]
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_8014BBC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x58
	ldrh r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072AA4 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	bl sub_80151FC
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072A98: .4byte gDispIo
_08072A9C: .4byte 0x06002800
_08072AA0: .4byte gBg2Tm
_08072AA4: .4byte gBmSt
_08072AA8: .4byte 0x00004140

	thumb_func_start sub_8072AAC
sub_8072AAC: @ 0x08072AAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x10
	bne _08072AEC
	ldr r0, [r7]
	bl Proc_Break
_08072AEC:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r1, [r2]
	movs r2, #0x16
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #0x10
	bls _08072B32
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08072B32:
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072C00 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08072C00 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072C08 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072C0C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072C00: .4byte gDispIo
_08072C04: .4byte 0x030027CC
_08072C08: .4byte 0x0000FFE0
_08072C0C: .4byte 0x0000E0FF

	thumb_func_start sub_8072C10
sub_8072C10: @ 0x08072C10
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0
	bne _08072C50
	ldr r0, [r7]
	bl Proc_Break
_08072C50:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r1, [r2]
	movs r2, #0x16
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #0x10
	bls _08072C96
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08072C96:
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072D64 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08072D64 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072D6C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072D70 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072D64: .4byte gDispIo
_08072D68: .4byte 0x030027CC
_08072D6C: .4byte 0x0000FFE0
_08072D70: .4byte 0x0000E0FF

	thumb_func_start sub_8072D74
sub_8072D74: @ 0x08072D74
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8014B58
	ldr r1, _08072E04 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072E08 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072E08 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072E04: .4byte gBg2Tm
_08072E08: .4byte gDispIo

	thumb_func_start sub_8072E0C
sub_8072E0C: @ 0x08072E0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetOnHBlankA
	bl sub_8014B58
	ldr r1, _08072EA4 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072EA8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072EA8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072EA4: .4byte gBg2Tm
_08072EA8: .4byte gDispIo

	thumb_func_start sub_8072EAC
sub_8072EAC: @ 0x08072EAC
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08072F10 @ =gUnk_08D65A5C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072F14 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08072F14 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x34]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072F10: .4byte gUnk_08D65A5C
_08072F14: .4byte gBmSt

	thumb_func_start sub_8072F18
sub_8072F18: @ 0x08072F18
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08072F64 @ =gUnk_083FB684
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08072F68 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08072F6C @ =gUnk_083FB8E4
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_8075A98
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072F64: .4byte gUnk_083FB684
_08072F68: .4byte 0x06002800
_08072F6C: .4byte gUnk_083FB8E4

	thumb_func_start sub_8072F70
sub_8072F70: @ 0x08072F70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08073070 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	subs r1, r2, #1
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	subs r2, r3, #3
	ldr r3, _08073074 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _08073078 @ =gUnk_083FB904
	str r4, [sp, #8]
	ldr r4, _0807307C @ =gUnk_08D65A8C
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014D78
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0807307C @ =gUnk_08D65A8C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08073006
	ldr r0, [r7]
	bl Proc_Break
_08073006:
	bl sub_807456C
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073070: .4byte gBg2Tm
_08073074: .4byte 0x00004140
_08073078: .4byte gUnk_083FB904
_0807307C: .4byte gUnk_08D65A8C
_08073080: .4byte gDispIo

	thumb_func_start sub_8073084
sub_8073084: @ 0x08073084
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080730D0 @ =gUnk_08D65AA4
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r1, _080730D4 @ =gActionSt
	ldrb r2, [r1, #0x13]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080730D8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r1, _080730D4 @ =gActionSt
	ldrb r2, [r1, #0x14]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080730D8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730D0: .4byte gUnk_08D65AA4
_080730D4: .4byte gActionSt
_080730D8: .4byte gBmSt

	thumb_func_start sub_80730DC
sub_80730DC: @ 0x080730DC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r1, _080731D8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080730FA
	movs r0, #0xb3
	bl m4aSongNumStart
_080730FA:
	ldr r0, _080731DC @ =gUnk_083FD7F4
	ldr r1, _080731E0 @ =0x06013800
	bl Decompress
	ldr r0, _080731E4 @ =gUnk_083FDAAC
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl sub_801419C
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080731E8 @ =0x06002800
	adds r1, r0, r2
	ldr r2, _080731EC @ =0x0000FFFF
	adds r0, r1, #0
	movs r1, #0x10
	bl sub_8015010
	ldr r0, _080731F0 @ =gBg2Tm
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _080731F4 @ =0x00004140
	bl sub_8015010
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080731F8 @ =gUnk_083F371C
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #4
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080731FC @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	bl InitScanlineEffect
	bl sub_807706C
	bl sub_807456C
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080731D8: .4byte gPlaySt
_080731DC: .4byte gUnk_083FD7F4
_080731E0: .4byte 0x06013800
_080731E4: .4byte gUnk_083FDAAC
_080731E8: .4byte 0x06002800
_080731EC: .4byte 0x0000FFFF
_080731F0: .4byte gBg2Tm
_080731F4: .4byte 0x00004140
_080731F8: .4byte gUnk_083F371C
_080731FC: .4byte 0x000041C0
_08073200: .4byte gDispIo

	thumb_func_start sub_8073204
sub_8073204: @ 0x08073204
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r3, [r1]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	adds r1, #8
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r1, r0, #0
	lsls r2, r1, #4
	adds r0, r2, #0
	movs r1, #0x28
	bl __divsi3
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08073280
	movs r0, #0x10
	str r0, [r7, #8]
_08073280:
	ldr r0, _080732F8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080732F8 @ =gDispIo
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _080732F8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080732F8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x27
	bls _080732EE
	ldr r0, [r7]
	bl Proc_Break
	bl EndEachSpriteAnimProc
_080732EE:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080732F8: .4byte gDispIo

	thumb_func_start sub_80732FC
sub_80732FC: @ 0x080732FC
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r3, [r1]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	adds r1, #8
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r1, r0, #0
	subs r1, #0x28
	adds r0, r1, #0
	lsls r1, r0, #4
	adds r0, r1, #0
	movs r1, #0x1e
	bl __divsi3
	movs r1, #0x10
	subs r0, r1, r0
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bgt _08073380
	movs r0, #0
	str r0, [r7, #8]
_08073380:
	ldr r0, _080733F4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080733F4 @ =gDispIo
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _080733F4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080733F4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x45
	bls _080733EA
	ldr r0, [r7]
	bl Proc_Break
_080733EA:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080733F4: .4byte gDispIo

	thumb_func_start sub_80733F8
sub_80733F8: @ 0x080733F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_80771D0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807340C
sub_807340C: @ 0x0807340C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073474 @ =gUnk_08D65AEC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073478 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073478 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073474: .4byte gUnk_08D65AEC
_08073478: .4byte gBmSt

	thumb_func_start sub_807347C
sub_807347C: @ 0x0807347C
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x87
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _080734E8 @ =gUnk_083FF230
	ldr r1, _080734EC @ =0x06013800
	bl Decompress
	ldr r0, _080734F0 @ =gUnk_083FF508
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080734F4 @ =gUnk_083FF528
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080734F8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080734E8: .4byte gUnk_083FF230
_080734EC: .4byte 0x06013800
_080734F0: .4byte gUnk_083FF508
_080734F4: .4byte gUnk_083FF528
_080734F8: .4byte 0x000041C0

	thumb_func_start sub_80734FC
sub_80734FC: @ 0x080734FC
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073560 @ =gUnk_08D65B14
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073564 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073564 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073560: .4byte gUnk_08D65B14
_08073564: .4byte gBmSt

	thumb_func_start sub_8073568
sub_8073568: @ 0x08073568
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x86
	bl sub_80151FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073584
sub_8073584: @ 0x08073584
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r4, _0807363C @ =gUnk_083FDEF0
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08073640 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08073644 @ =gUnk_08278A30
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073638: .4byte gDispIo
_0807363C: .4byte gUnk_083FDEF0
_08073640: .4byte 0x06002800
_08073644: .4byte gUnk_08278A30

	thumb_func_start sub_8073648
sub_8073648: @ 0x08073648
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _080736DC @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08073664
	adds r1, #7
_08073664:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08073674
	adds r2, #7
_08073674:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #9
	ldr r3, _080736E0 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xb
	str r4, [sp, #4]
	ldr r4, _080736E4 @ =gUnk_083FEBC4
	str r4, [sp, #8]
	ldr r4, _080736E8 @ =gUnk_08402F68
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _080736E8 @ =gUnk_08402F68
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _080736CE
	ldr r0, [r7]
	bl Proc_Break
_080736CE:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080736DC: .4byte gBg2Tm
_080736E0: .4byte 0x00004140
_080736E4: .4byte gUnk_083FEBC4
_080736E8: .4byte gUnk_08402F68

	thumb_func_start sub_80736EC
sub_80736EC: @ 0x080736EC
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _080737A4 @ =gUnk_08402F84
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x13
	bl memcpy
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r7, #4
	ldr r2, [r7]
	adds r3, r2, #0
	adds r2, #0x4a
	ldrh r3, [r2]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r2]
	lsls r3, r3, #0x10
	asrs r2, r3, #0x10
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4a
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _0807379C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_0807379C:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080737A4: .4byte gUnk_08402F84
_080737A8: .4byte gDispIo

	thumb_func_start sub_80737AC
sub_80737AC: @ 0x080737AC
	push {r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _08073848 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _08073848 @ =gDispIo
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _08073848 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073848 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1e
	ble _0807383E
	ldr r0, [r7]
	bl Proc_Break
_0807383E:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073848: .4byte gDispIo

	thumb_func_start sub_807384C
sub_807384C: @ 0x0807384C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080738AC @ =gUnk_08D65B54
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080738B0 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080738B0 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080738AC: .4byte gUnk_08D65B54
_080738B0: .4byte gBmSt

	thumb_func_start sub_80738B4
sub_80738B4: @ 0x080738B4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	bl sub_80151FC
	ldr r1, _080738DC @ =gUnk_08275ECC
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080738DC: .4byte gUnk_08275ECC

	thumb_func_start sub_80738E0
sub_80738E0: @ 0x080738E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08073974 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080738FC
	adds r1, #7
_080738FC:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _0807390C
	adds r2, #7
_0807390C:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #9
	ldr r3, _08073978 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xb
	str r4, [sp, #4]
	ldr r4, _0807397C @ =gUnk_083FDC84
	str r4, [sp, #8]
	ldr r4, _08073980 @ =gUnk_08402FB0
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073980 @ =gUnk_08402FB0
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08073966
	ldr r0, [r7]
	bl Proc_Break
_08073966:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073974: .4byte gBg2Tm
_08073978: .4byte 0x00004140
_0807397C: .4byte gUnk_083FDC84
_08073980: .4byte gUnk_08402FB0

	thumb_func_start sub_8073984
sub_8073984: @ 0x08073984
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080739E4 @ =gUnk_08D65B94
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080739E8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080739E8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080739E4: .4byte gUnk_08D65B94
_080739E8: .4byte gBmSt

	thumb_func_start sub_80739EC
sub_80739EC: @ 0x080739EC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _08073A44 @ =gUnk_0827BC24
	ldr r1, _08073A48 @ =0x06013800
	bl Decompress
	ldr r0, _08073A4C @ =gUnk_0827BE0C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073A50 @ =gUnk_083FEE30
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, _08073A54 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073A44: .4byte gUnk_0827BC24
_08073A48: .4byte 0x06013800
_08073A4C: .4byte gUnk_0827BE0C
_08073A50: .4byte gUnk_083FEE30
_08073A54: .4byte 0x000041C0

	thumb_func_start sub_8073A58
sub_8073A58: @ 0x08073A58
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl sub_80151FC
	ldr r0, _08073A90 @ =gUnk_083FEE30
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	subs r2, #8
	ldr r3, _08073A94 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073A90: .4byte gUnk_083FEE30
_08073A94: .4byte 0x000041C0

	thumb_func_start sub_8073A98
sub_8073A98: @ 0x08073A98
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl sub_80151FC
	ldr r0, _08073ACC @ =gUnk_083FEE30
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08073AD0 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073ACC: .4byte gUnk_083FEE30
_08073AD0: .4byte 0x000041C0

	thumb_func_start sub_8073AD4
sub_8073AD4: @ 0x08073AD4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073B38 @ =gUnk_08D65BD4
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073B3C @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073B3C @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #0x12
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073B38: .4byte gUnk_08D65BD4
_08073B3C: .4byte gBmSt

	thumb_func_start sub_8073B40
sub_8073B40: @ 0x08073B40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xfd
	bl sub_80151FC
	bl InitScanlineEffect
	bl sub_807706C
	ldr r1, _08073C0C @ =sub_8077248
	adds r0, r1, #0
	bl SetOnHBlankA
	bl sub_807456C
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C14 @ =gBg2Tm
	ldr r1, _08073C18 @ =gBuf
	ldr r2, _08073C1C @ =0x00004140
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #1
	ldr r3, [r7]
	bl sub_80746E0
	ldr r1, _08073C20 @ =gUnk_08D668CC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073C0C: .4byte sub_8077248
_08073C10: .4byte gDispIo
_08073C14: .4byte gBg2Tm
_08073C18: .4byte gBuf
_08073C1C: .4byte 0x00004140
_08073C20: .4byte gUnk_08D668CC

	thumb_func_start sub_8073C24
sub_8073C24: @ 0x08073C24
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xb
	ble _08073C66
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08073C66:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldr r3, [r7]
	ldr r4, [r7]
	adds r2, r4, #0
	adds r4, #0x48
	ldrh r5, [r4]
	adds r2, r5, #1
	adds r4, r3, #0
	adds r3, #0x48
	ldrh r4, [r3]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r2, #0
	orrs r5, r4
	adds r4, r5, #0
	strh r4, [r3]
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _08073CAC @ =gUnk_08D65C1C
	str r3, [sp]
	movs r3, #0xc
	bl sub_807755C
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073CAC: .4byte gUnk_08D65C1C

	thumb_func_start sub_8073CB0
sub_8073CB0: @ 0x08073CB0
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bgt _08073CF2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08073CF2:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldr r3, [r7]
	ldr r4, [r7]
	adds r2, r4, #0
	adds r4, #0x48
	ldrh r5, [r4]
	subs r2, r5, #1
	adds r4, r3, #0
	adds r3, #0x48
	ldrh r4, [r3]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r2, #0
	orrs r5, r4
	adds r4, r5, #0
	strh r4, [r3]
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _08073D38 @ =gUnk_08D65C1C
	str r3, [sp]
	movs r3, #0xc
	bl sub_807755C
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D38: .4byte gUnk_08D65C1C

	thumb_func_start sub_8073D3C
sub_8073D3C: @ 0x08073D3C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073D9C @ =gUnk_08D65C24
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073DA0 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073DA0 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D9C: .4byte gUnk_08D65C24
_08073DA0: .4byte gBmSt

	thumb_func_start sub_8073DA4
sub_8073DA4: @ 0x08073DA4
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x83
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r4, _08073EB0 @ =gUnk_083FFA38
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08073EB4 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08073EB8 @ =gUnk_083FF5F8
	ldr r1, _08073EBC @ =0x06013800
	bl Decompress
	ldr r1, _08073EC0 @ =gUnk_083FFB48
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073EC0 @ =gUnk_083FFB48
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073EC4 @ =gUnk_083FFB68
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, _08073EC8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073ECC @ =0x030027CC
	ldr r1, _08073ECC @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08073ED0 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073ECC @ =0x030027CC
	ldr r1, _08073ECC @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073EB0: .4byte gUnk_083FFA38
_08073EB4: .4byte 0x06002800
_08073EB8: .4byte gUnk_083FF5F8
_08073EBC: .4byte 0x06013800
_08073EC0: .4byte gUnk_083FFB48
_08073EC4: .4byte gUnk_083FFB68
_08073EC8: .4byte 0x000041C0
_08073ECC: .4byte 0x030027CC
_08073ED0: .4byte 0x0000FFE0
_08073ED4: .4byte gDispIo

	thumb_func_start sub_8073ED8
sub_8073ED8: @ 0x08073ED8
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x84
	bl sub_80151FC
	ldr r0, _08073FB0 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08073EF8
	adds r1, #7
_08073EF8:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08073F08
	adds r2, #7
_08073F08:
	asrs r3, r2, #3
	subs r2, r3, #2
	ldr r3, _08073FB4 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_8014C38
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073FB8 @ =0x030027CC
	ldr r1, _08073FB8 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08073FBC @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073FB8 @ =0x030027CC
	ldr r1, _08073FB8 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073FB0: .4byte gBg2Tm
_08073FB4: .4byte 0x00004140
_08073FB8: .4byte 0x030027CC
_08073FBC: .4byte 0x0000FFE0
_08073FC0: .4byte gDispIo

	thumb_func_start sub_8073FC4
sub_8073FC4: @ 0x08073FC4
	push {r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _08074060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _08074060 @ =gDispIo
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _08074060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _08074056
	ldr r0, [r7]
	bl Proc_Break
_08074056:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074060: .4byte gDispIo

	thumb_func_start sub_8074064
sub_8074064: @ 0x08074064
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080740C4 @ =gUnk_08D65C64
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080740C8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080740C8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080740C4: .4byte gUnk_08D65C64
_080740C8: .4byte gBmSt

	thumb_func_start sub_80740CC
sub_80740CC: @ 0x080740CC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x88
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r4, _08074190 @ =gUnk_083FFCA0
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08074194 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08074198 @ =gUnk_0827D0F0
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807418C: .4byte gDispIo
_08074190: .4byte gUnk_083FFCA0
_08074194: .4byte 0x06002800
_08074198: .4byte gUnk_0827D0F0

	thumb_func_start sub_807419C
sub_807419C: @ 0x0807419C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08074230 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080741B8
	adds r1, #7
_080741B8:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _080741C8
	adds r2, #7
_080741C8:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #8
	ldr r3, _08074234 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	ldr r4, _08074238 @ =gUnk_0840085C
	str r4, [sp, #8]
	ldr r4, _0807423C @ =gUnk_08403050
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0807423C @ =gUnk_08403050
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08074222
	ldr r0, [r7]
	bl Proc_Break
_08074222:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074230: .4byte gBg2Tm
_08074234: .4byte 0x00004140
_08074238: .4byte gUnk_0840085C
_0807423C: .4byte gUnk_08403050

	thumb_func_start sub_8074240
sub_8074240: @ 0x08074240
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _080742A0 @ =gUnk_08D65C8C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _080742A4 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	ldr r2, [r7]
	subs r1, r2, r1
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r1, _080742A4 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	ldr r2, [r7, #4]
	subs r1, r2, r1
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080742A0: .4byte gUnk_08D65C8C
_080742A4: .4byte gBmSt

	thumb_func_start sub_80742A8
sub_80742A8: @ 0x080742A8
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080742D8 @ =gActionSt
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r1, _080742D8 @ =gActionSt
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	ldr r1, _080742D8 @ =gActionSt
	movs r2, #0x14
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	bl sub_8079710
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080742D8: .4byte gActionSt

	thumb_func_start sub_80742DC
sub_80742DC: @ 0x080742DC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080742FC @ =gActionSt
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	bics r0, r1
	str r0, [r4, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080742FC: .4byte gActionSt

	thumb_func_start sub_8074300
sub_8074300: @ 0x08074300
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8d
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08074414 @ =gUnk_083FDB40
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08074418 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807441C @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _0807433C
	adds r1, #7
_0807433C:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _0807434C
	adds r2, #7
_0807434C:
	asrs r3, r2, #3
	subs r2, r3, #2
	ldr r3, _08074420 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	ldr r4, _08074424 @ =gUnk_083FDC60
	str r4, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08074428 @ =gUnk_083FDACC
	ldr r1, _0807442C @ =0x06013800
	bl Decompress
	ldr r0, _08074430 @ =gUnk_083FDB20
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074434 @ =gUnk_083FDC40
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_8014BA4
	bl InitScanlineEffect
	bl sub_807706C
	bl sub_807456C
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074414: .4byte gUnk_083FDB40
_08074418: .4byte 0x06002800
_0807441C: .4byte gBg2Tm
_08074420: .4byte 0x00004140
_08074424: .4byte gUnk_083FDC60
_08074428: .4byte gUnk_083FDACC
_0807442C: .4byte 0x06013800
_08074430: .4byte gUnk_083FDB20
_08074434: .4byte gUnk_083FDC40
_08074438: .4byte gDispIo

	thumb_func_start sub_807443C
sub_807443C: @ 0x0807443C
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0x10
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _080744E6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _080744F0 @ =gUnk_083F3778
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080744F4 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _080744F0 @ =gUnk_083F3778
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080744F4 @ =0x000041C0
	movs r4, #1
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
_080744E6:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080744F0: .4byte gUnk_083F3778
_080744F4: .4byte 0x000041C0

	thumb_func_start sub_80744F8
sub_80744F8: @ 0x080744F8
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _08074562
	ldr r0, [r7]
	bl Proc_Break
_08074562:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807456C
sub_807456C: @ 0x0807456C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080746D8 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080746DC @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080746D0: .4byte gDispIo
_080746D4: .4byte 0x030027CC
_080746D8: .4byte 0x0000FFE0
_080746DC: .4byte 0x0000E0FF

	thumb_func_start sub_80746E0
sub_80746E0: @ 0x080746E0
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08074758 @ =gUnk_08D65CE4
	ldr r1, [r7, #0xc]
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x58]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074758: .4byte gUnk_08D65CE4

	thumb_func_start sub_807475C
sub_807475C: @ 0x0807475C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08074770 @ =gUnk_08D65CE4
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074770: .4byte gUnk_08D65CE4

	thumb_func_start sub_8074774
sub_8074774: @ 0x08074774
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x68
	ldrh r2, [r3]
	bl SetBgOffset
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	ldrh r1, [r1]
	ldrh r2, [r3]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x68
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x6a
	ldrh r1, [r1]
	ldrh r2, [r3]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80747F4
sub_80747F4: @ 0x080747F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08074894 @ =gBg1Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r5, _08074898 @ =gUnk_081E0C60
	movs r0, #1
	bl GetBgChrOffset
	ldr r2, _0807489C @ =0x06004000
	adds r1, r0, r2
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080748A0 @ =gUnk_081E0EAC
	ldr r1, _080748A4 @ =gBuf
	bl Decompress
	ldr r0, _080748A4 @ =gBuf
	ldr r1, _08074894 @ =gBg1Tm
	movs r2, #0xe0
	lsls r2, r2, #2
	movs r3, #0xa4
	lsls r3, r3, #7
	bl sub_80150CC
	ldr r1, _080748A8 @ =gUnk_081E0FA8
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r7, #8]
	lsls r0, r1, #5
	adds r1, r0, #1
	ldr r2, [r7, #4]
	adds r0, r1, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080748AC @ =gBg0Tm
	adds r5, r0, r1
	ldr r0, _080748B0 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_8014B14
	movs r0, #0
	str r0, [r7, #0xc]
_0807487E:
	ldr r0, _080748B4 @ =gUnk_08D65CF4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _080748B8
	b _08074954
	.align 2, 0
_08074894: .4byte gBg1Tm
_08074898: .4byte gUnk_081E0C60
_0807489C: .4byte 0x06004000
_080748A0: .4byte gUnk_081E0EAC
_080748A4: .4byte gBuf
_080748A8: .4byte gUnk_081E0FA8
_080748AC: .4byte gBg0Tm
_080748B0: .4byte 0x0203E0D4
_080748B4: .4byte gUnk_08D65CF4
_080748B8:
	ldr r0, _08074928 @ =gUnk_08D65CF4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldr r0, [r7, #8]
	adds r1, r1, r0
	lsls r0, r1, #5
	ldr r1, _08074928 @ =gUnk_08D65CF4
	ldr r2, [r7, #0xc]
	adds r5, r2, #0
	lsls r3, r5, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	ldr r3, [r7, #4]
	adds r1, r2, r3
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807492C @ =gBg0Tm
	adds r5, r0, r1
	ldr r0, _08074930 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl UnitHasMagicRank
	strb r0, [r7, #0x10]
	bl GetLang
	ldr r1, _08074928 @ =gUnk_08D65CF4
	ldr r2, [r7, #0xc]
	mov r8, r2
	mov r6, r8
	lsls r3, r6, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r4, r2, #0
	ldrb r2, [r7, #0x10]
	lsls r3, r2, #0x18
	asrs r2, r3, #0x18
	cmp r2, #1
	bne _08074934
	adds r2, r4, #4
	b _08074936
	.align 2, 0
_08074928: .4byte gUnk_08D65CF4
_0807492C: .4byte gBg0Tm
_08074930: .4byte 0x0203E0D4
_08074934:
	adds r2, r4, #0
_08074936:
	adds r3, r1, #4
	adds r1, r3, r2
	lsls r2, r0, #2
	ldr r1, [r1]
	adds r0, r2, r1
	ldr r3, [r0]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #3
	bl sub_8014AB0
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0807487E
_08074954:
	movs r0, #3
	bl EnableBgSync
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8074968
sub_8074968: @ 0x08074968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x28]
	adds r1, r7, #0
	adds r1, #0x10
	strb r0, [r1]
	ldr r0, _080749E8 @ =gUnk_08D65CF4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldr r2, [r7, #8]
	adds r0, r1, r2
	lsls r1, r0, #5
	adds r0, r1, #4
	ldr r1, _080749E8 @ =gUnk_08D65CF4
	ldr r2, [r7, #0xc]
	adds r5, r2, #0
	lsls r3, r5, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	ldr r3, [r7, #4]
	adds r1, r2, r3
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080749EC @ =gBg0Tm
	adds r5, r0, r1
	ldr r1, [r7, #0xc]
	ldr r0, [r7]
	bl sub_8074B68
	adds r4, r0, #0
	adds r6, r4, #0
	adds r0, r7, #0
	adds r0, #0x10
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080749D6
	ldr r1, [r7, #0xc]
	ldr r0, [r7]
	bl sub_80749F0
	adds r6, r6, r0
_080749D6:
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080749E8: .4byte gUnk_08D65CF4
_080749EC: .4byte gBg0Tm

	thumb_func_start sub_80749F0
sub_80749F0: @ 0x080749F0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #8
	bls _08074A02
	b _08074B5C
_08074A02:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08074A10 @ =_08074A14
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08074A10: .4byte _08074A14
_08074A14: @ jump table
	.4byte _08074A38 @ case 0
	.4byte _08074A3C @ case 1
	.4byte _08074A60 @ case 2
	.4byte _08074A84 @ case 3
	.4byte _08074AA8 @ case 4
	.4byte _08074ACC @ case 5
	.4byte _08074AF0 @ case 6
	.4byte _08074B14 @ case 7
	.4byte _08074B38 @ case 8
_08074A38:
	movs r0, #1
	b _08074B60
_08074A3C:
	ldr r0, _08074A5C @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x73
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074A5C: .4byte 0x0203E0D4
_08074A60:
	ldr r0, _08074A80 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x74
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074A80: .4byte 0x0203E0D4
_08074A84:
	ldr r0, _08074AA4 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x75
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074AA4: .4byte 0x0203E0D4
_08074AA8:
	ldr r0, _08074AC8 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x76
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074AC8: .4byte 0x0203E0D4
_08074ACC:
	ldr r0, _08074AEC @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x79
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074AEC: .4byte 0x0203E0D4
_08074AF0:
	ldr r0, _08074B10 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x77
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074B10: .4byte 0x0203E0D4
_08074B14:
	ldr r0, _08074B34 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x78
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074B34: .4byte 0x0203E0D4
_08074B38:
	ldr r0, _08074B58 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x7a
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074B58: .4byte 0x0203E0D4
_08074B5C:
	movs r0, #0
	b _08074B60
_08074B60:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8074B68
sub_8074B68: @ 0x08074B68
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08074BA4 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl GetUnit
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #8
	bhi _08074C50
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08074BA8 @ =_08074BAC
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08074BA4: .4byte 0x0203E0D4
_08074BA8: .4byte _08074BAC
_08074BAC: @ jump table
	.4byte _08074BD0 @ case 0
	.4byte _08074BF4 @ case 1
	.4byte _08074BFE @ case 2
	.4byte _08074C08 @ case 3
	.4byte _08074C12 @ case 4
	.4byte _08074C1C @ case 5
	.4byte _08074C26 @ case 6
	.4byte _08074C30 @ case 7
	.4byte _08074C3A @ case 8
_08074BD0:
	ldr r0, _08074BF0 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x70
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074C54
	.align 2, 0
_08074BF0: .4byte 0x0203E0D4
_08074BF4:
	ldr r0, [r7, #8]
	movs r1, #0x12
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074BFE:
	ldr r0, [r7, #8]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C08:
	ldr r0, [r7, #8]
	movs r1, #0x15
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C12:
	ldr r0, [r7, #8]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C1C:
	ldr r0, [r7, #8]
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C26:
	ldr r0, [r7, #8]
	movs r1, #0x17
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C30:
	ldr r0, [r7, #8]
	movs r1, #0x18
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C3A:
	ldr r0, [r7, #8]
	ldr r2, [r0, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r7, #8]
	ldr r2, [r0]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
	adds r0, r1, #0
	b _08074C54
_08074C50:
	movs r0, #0
	b _08074C54
_08074C54:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8074C5C
sub_8074C5C: @ 0x08074C5C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8074C70
sub_8074C70: @ 0x08074C70
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08074D24 @ =gUnk_08D65D6C
	ldr r1, [r7, #0xc]
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	ldr r0, _08074D28 @ =gUnk_083F9F2C
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074D2C @ =0x06010000
	adds r1, r2, r3
	bl Decompress
	ldr r0, _08074D30 @ =gUnk_083F9ECC
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074D30 @ =gUnk_083F9ECC
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x11
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074D34 @ =gUnk_08D65D7C
	ldr r1, [r7, #0x10]
	bl Proc_Start
	str r0, [r7, #0x14]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D24: .4byte gUnk_08D65D6C
_08074D28: .4byte gUnk_083F9F2C
_08074D2C: .4byte 0x06010000
_08074D30: .4byte gUnk_083F9ECC
_08074D34: .4byte gUnk_08D65D7C

	thumb_func_start sub_8074D38
sub_8074D38: @ 0x08074D38
	push {r7, lr}
	mov r7, sp
	ldr r1, _08074D4C @ =gUnk_08D65D6C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D4C: .4byte gUnk_08D65D6C

	thumb_func_start sub_8074D50
sub_8074D50: @ 0x08074D50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08074DD0 @ =gUnk_083FA1B8
	str r0, [r7, #0x20]
	ldr r1, _08074DD4 @ =gUnk_08D65D6C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldrh r1, [r0, #0x2a]
	str r1, [r7, #0x14]
	ldr r1, [r7, #0x1c]
	ldrh r0, [r1, #0x2a]
	ldr r2, [r7, #8]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _08074DDC
	ldr r0, _08074DD8 @ =gUnk_083F28D0
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x14]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	b _08074F30
	.align 2, 0
_08074DD0: .4byte gUnk_083FA1B8
_08074DD4: .4byte gUnk_08D65D6C
_08074DD8: .4byte gUnk_083F28D0
_08074DDC:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08074DE8
	movs r0, #0
	str r0, [r7, #0x10]
	b _08074DEC
_08074DE8:
	movs r0, #1
	str r0, [r7, #0x10]
_08074DEC:
	ldr r0, _08074F38 @ =gUnk_083F28D0
	ldr r2, [r7, #4]
	ldr r1, [r7, #0x1c]
	ldrh r3, [r1, #0x2c]
	ldr r4, [r7, #0x10]
	adds r1, r3, r4
	movs r3, #0xf
	ands r1, r3
	adds r3, r1, #0
	lsls r1, r3, #0xc
	ldr r3, [r7, #0x14]
	adds r1, r1, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2e]
	movs r5, #3
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r5, r4, #0xa
	adds r3, r1, r5
	ldr r1, [r7, #0x10]
	adds r4, r1, #1
	str r4, [sp]
	movs r1, #2
	str r1, [sp, #4]
	ldr r1, [r7]
	bl StartSpriteAnimProc
	ldr r0, _08074F38 @ =gUnk_083F28D0
	ldr r2, [r7]
	subs r1, r2, #3
	ldr r2, [r7, #4]
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x18]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	ldr r4, [r7, #0x10]
	adds r5, r4, #3
	str r5, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08074EBA
	ldr r0, _08074F38 @ =gUnk_083F28D0
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x14]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
_08074EBA:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08074EDE
	ldr r1, [r7, #0x20]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x4c
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074F3C @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
_08074EDE:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08074EE6
	rsbs r0, r0, #0
_08074EE6:
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x20]
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x2d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074F3C @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08074F0E
	rsbs r0, r0, #0
_08074F0E:
	adds r0, #0x20
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x20]
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x4d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074F3C @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
_08074F30:
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074F38: .4byte gUnk_083F28D0
_08074F3C: .4byte 0x06010000

	thumb_func_start sub_8074F40
sub_8074F40: @ 0x08074F40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08075088 @ =gUnk_083FA1B8
	str r0, [r7, #0x18]
	ldr r1, _0807508C @ =gUnk_08D65D6C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	ldrh r1, [r0, #0x2a]
	str r1, [r7, #0xc]
	ldr r1, [r7, #0x14]
	ldrh r0, [r1, #0x2a]
	ldr r2, [r7, #8]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08075090 @ =gUnk_083F28D0
	ldr r2, [r7, #4]
	ldr r1, [r7, #0x14]
	ldrh r3, [r1, #0x2c]
	movs r4, #0xf
	adds r1, r3, #0
	ands r1, r4
	adds r4, r1, #0
	lsls r3, r4, #0x10
	lsrs r1, r3, #0x10
	adds r3, r1, #0
	lsls r1, r3, #0xc
	ldr r3, [r7, #0xc]
	adds r1, r1, r3
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2e]
	movs r5, #3
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r5, r4, #0xa
	adds r3, r1, r5
	movs r1, #5
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	ldr r1, [r7]
	bl StartSpriteAnimProc
	ldr r0, _08075090 @ =gUnk_083F28D0
	ldr r2, [r7]
	subs r1, r2, #3
	ldr r2, [r7, #4]
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x10]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #3
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _08075090 @ =gUnk_083F28D0
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0xc]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7, #8]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x2d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08075094 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0x20
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x4d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08075094 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075088: .4byte gUnk_083FA1B8
_0807508C: .4byte gUnk_08D65D6C
_08075090: .4byte gUnk_083F28D0
_08075094: .4byte 0x06010000

	thumb_func_start sub_8075098
sub_8075098: @ 0x08075098
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080750C8 @ =gUnk_08D65D94
	ldr r1, [r7, #4]
	bl Proc_StartBlocking
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080750C8: .4byte gUnk_08D65D94

	thumb_func_start sub_80750CC
sub_80750CC: @ 0x080750CC
	push {r7, lr}
	mov r7, sp
	ldr r0, _080751EC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080751EC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080751EC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
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
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x30
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080751EC: .4byte gDispIo

	thumb_func_start sub_80751F0
sub_80751F0: @ 0x080751F0
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075220 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08075220 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08075220 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075220: .4byte gDispIo

	thumb_func_start sub_8075224
sub_8075224: @ 0x08075224
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	bl ResetTextFont
	ldr r1, _08075258 @ =gBg0Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	movs r1, #1
	movs r2, #1
	bl sub_80747F4
	movs r0, #0
	str r0, [r7, #4]
_0807524E:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _0807525C
	b _08075278
	.align 2, 0
_08075258: .4byte gBg0Tm
_0807525C:
	ldr r1, [r7]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #4]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	movs r2, #1
	bl sub_8074968
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807524E
_08075278:
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrh r1, [r0, #0x32]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _080753E0 @ =0x0000FF70
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x32]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080753E8 @ =0x0203E0D4
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r0, [r7]
	movs r3, #0x32
	ldrsh r2, [r0, r3]
	movs r0, #0x20
	subs r3, r0, r2
	ldr r0, _080753EC @ =0x00001042
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	bl StartFace
	ldr r1, _080753F0 @ =gFaces
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #3
	movs r2, #1
	ldr r3, [r7]
	bl sub_8074C70
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753E0: .4byte 0x0000FF70
_080753E4: .4byte gDispIo
_080753E8: .4byte 0x0203E0D4
_080753EC: .4byte 0x00001042
_080753F0: .4byte gFaces

	thumb_func_start sub_80753F4
sub_80753F4: @ 0x080753F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x54]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807540C
sub_807540C: @ 0x0807540C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075434 @ =gUnk_083F9AF0
	str r0, [r7, #8]
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x54]
	adds r1, r2, #1
	str r1, [r0, #0x54]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	movs r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08075438
	b _08075494
	.align 2, 0
_08075434: .4byte gUnk_083F9AF0
_08075438:
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	asrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	adds r2, #0x10
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	adds r1, #0x12
	movs r2, #0xe
	bl ApplyPaletteExt
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, [r7, #8]
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x40
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	adds r2, #0x11
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	adds r1, #0x12
	movs r2, #0xe
	bl ApplyPaletteExt
_08075494:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807549C
sub_807549C: @ 0x0807549C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	adds r1, r2, #0
	adds r1, #8
	ldrh r2, [r0, #0x32]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x32]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r1, _0807550C @ =gFaces
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	ldr r0, [r7]
	movs r2, #0x32
	ldrsh r1, [r0, r2]
	movs r0, #0x30
	cmn r1, r0
	blt _08075504
	ldr r0, [r7]
	bl Proc_Break
_08075504:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807550C: .4byte gFaces

	thumb_func_start sub_8075510
sub_8075510: @ 0x08075510
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	adds r1, r2, #0
	subs r1, #8
	ldrh r2, [r0, #0x32]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x32]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r1, _08075580 @ =gFaces
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	ldr r0, [r7]
	movs r2, #0x32
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	cmn r1, r0
	bgt _08075578
	ldr r0, [r7]
	bl Proc_Break
_08075578:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075580: .4byte gFaces

	thumb_func_start sub_8075584
sub_8075584: @ 0x08075584
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0
	beq _080755C0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x31
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x31
	ldrb r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080756BA
_080755C0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	str r0, [r7, #4]
_080755CA:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _080755D2
	b _080755F0
_080755D2:
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_80749F0
	cmp r0, #0
	beq _080755E8
	b _080755F0
_080755E8:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080755CA
_080755F0:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _080755FE
	ldr r0, [r7]
	bl Proc_Break
	b _080756BA
_080755FE:
	ldr r1, [r7]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #4]
	movs r1, #1
	str r1, [sp]
	movs r1, #1
	movs r2, #1
	bl sub_8074968
	movs r0, #1
	bl EnableBgSync
	ldr r0, _080756C4 @ =gUnk_08D65CF4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r4, r1, #0
	adds r4, #0x3e
	ldr r0, _080756C4 @ =gUnk_08D65CF4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	adds r2, r1, #0
	lsls r0, r2, #3
	ldr r1, [r7]
	movs r3, #0x32
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	subs r1, #0x17
	subs r5, r0, r1
	ldr r6, [r7, #4]
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_80749F0
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8074D50
	ldr r1, _080756C8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08075686
	ldr r1, _080756CC @ =0x00000396
	adds r0, r1, #0
	bl m4aSongNumStart
_08075686:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	adds r1, r2, #1
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080756BA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080756C4: .4byte gUnk_08D65CF4
_080756C8: .4byte gPlaySt
_080756CC: .4byte 0x00000396

	thumb_func_start sub_80756D0
sub_80756D0: @ 0x080756D0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x10
	ldr r3, [r7]
	bl StartBgmVolumeChange
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80756F0
sub_80756F0: @ 0x080756F0
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08075844 @ =gUnk_083F9CB8
	ldr r1, _08075848 @ =0x06013800
	bl Decompress
	ldr r0, _0807584C @ =gUnk_083F9ECC
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _08075850 @ =0x0203E0D4
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x10
	str r0, [r7, #4]
	ldr r0, _08075850 @ =0x0203E0D4
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	subs r0, #8
	str r0, [r7, #8]
	ldr r0, _08075850 @ =0x0203E0D4
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #3
	bgt _080757AA
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7, #8]
_080757AA:
	ldr r0, _08075850 @ =0x0203E0D4
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #3
	bgt _080757DC
	movs r0, #0x30
	str r0, [r7, #4]
_080757DC:
	ldr r0, _08075850 @ =0x0203E0D4
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #0x19
	ble _0807580E
	movs r0, #0xd0
	str r0, [r7, #4]
_0807580E:
	ldr r0, _08075858 @ =gUnk_083F2F90
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	movs r3, #0xc7
	lsls r3, r3, #6
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, _0807585C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807583C
	ldr r1, _08075860 @ =0x0000037B
	adds r0, r1, #0
	bl m4aSongNumStart
_0807583C:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075844: .4byte gUnk_083F9CB8
_08075848: .4byte 0x06013800
_0807584C: .4byte gUnk_083F9ECC
_08075850: .4byte 0x0203E0D4
_08075854: .4byte gBmSt
_08075858: .4byte gUnk_083F2F90
_0807585C: .4byte gPlaySt
_08075860: .4byte 0x0000037B

	thumb_func_start sub_8075864
sub_8075864: @ 0x08075864
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075878
sub_8075878: @ 0x08075878
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	ldr r3, [r7]
	bl StartBgmVolumeChange
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075898
sub_8075898: @ 0x08075898
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_800EC08
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80758AC
sub_80758AC: @ 0x080758AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080758CC
	ldr r1, _080758C8 @ =gUnk_08D65E54
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _080758D6
	.align 2, 0
_080758C8: .4byte gUnk_08D65E54
_080758CC:
	ldr r1, _080758E0 @ =gUnk_08D65E54
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_080758D6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080758E0: .4byte gUnk_08D65E54

	thumb_func_start sub_80758E4
sub_80758E4: @ 0x080758E4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075904 @ =gPal + 0xc0
	ldr r1, _08075908 @ =0x030048B0
	movs r2, #0x50
	bl CpuFastSet
	movs r0, #0
	str r0, [r7, #4]
_080758FA:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _0807590C
	b _08075930
	.align 2, 0
_08075904: .4byte gPal + 0xc0
_08075908: .4byte 0x030048B0
_0807590C:
	ldr r0, _0807592C @ =gUnk_08C01CEC
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0x3c
	ldr r3, [r7]
	bl StartPalFade
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xf
	bl sub_8014090
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080758FA
	.align 2, 0
_0807592C: .4byte gUnk_08C01CEC
_08075930:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075938
sub_8075938: @ 0x08075938
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _08075958
	ldr r1, _08075954 @ =gUnk_08D65E6C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _08075962
	.align 2, 0
_08075954: .4byte gUnk_08D65E6C
_08075958:
	ldr r1, _0807596C @ =gUnk_08D65E6C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_08075962:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807596C: .4byte gUnk_08D65E6C

	thumb_func_start sub_8075970
sub_8075970: @ 0x08075970
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_0807597C:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _08075984
	b _080759A8
_08075984:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #5
	ldr r1, _080759A4 @ =0x030048B0
	adds r0, r0, r1
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0xf
	ldr r3, [r7]
	bl StartPalFade
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807597C
	.align 2, 0
_080759A4: .4byte 0x030048B0
_080759A8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80759B0
sub_80759B0: @ 0x080759B0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080759C4 @ =gUnk_08D65E84
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080759C4: .4byte gUnk_08D65E84

	thumb_func_start sub_80759C8
sub_80759C8: @ 0x080759C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80759E8
sub_80759E8: @ 0x080759E8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl SetBgOffset
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	ble _08075A90
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	bl Proc_Break
_08075A90:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075A98
sub_8075A98: @ 0x08075A98
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075AB8 @ =gUnk_083FBC04
	ldr r1, _08075ABC @ =0x06013800
	bl Decompress
	ldr r0, _08075AC0 @ =gUnk_083FBC24
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075AB8: .4byte gUnk_083FBC04
_08075ABC: .4byte 0x06013800
_08075AC0: .4byte gUnk_083FBC24

	thumb_func_start sub_8075AC4
sub_8075AC4: @ 0x08075AC4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	movs r1, #4
	cmn r0, r1
	bge _08075AD8
	b _08075B0A
_08075AD8:
	ldr r0, [r7]
	cmp r0, #0xeb
	ble _08075AE0
	b _08075B0A
_08075AE0:
	ldr r0, [r7, #4]
	movs r1, #4
	cmn r0, r1
	bge _08075AEA
	b _08075B0A
_08075AEA:
	ldr r0, [r7, #4]
	cmp r0, #0x9b
	ble _08075AF2
	b _08075B0A
_08075AF2:
	ldr r1, [r7]
	subs r0, r1, #4
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	ldr r2, [r7, #4]
	subs r1, r2, #4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08075B14 @ =Sprite_8x8
	ldr r3, _08075B18 @ =0x000041C0
	bl PutOamHiRam
_08075B0A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075B14: .4byte Sprite_8x8
_08075B18: .4byte 0x000041C0

	thumb_func_start sub_8075B1C
sub_8075B1C: @ 0x08075B1C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08075B78 @ =gSinLut
	ldr r1, [r7, #0xc]
	movs r2, #0xff
	ands r1, r2
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r1, r0, #0xc
	ldr r2, [r7]
	adds r0, r1, r2
	ldr r1, _08075B78 @ =gSinLut
	ldr r2, [r7, #0xc]
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	adds r3, #0x40
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	asrs r2, r1, #0xc
	ldr r3, [r7, #4]
	adds r1, r2, r3
	bl sub_8075AC4
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075B78: .4byte gSinLut

	thumb_func_start sub_8075B7C
sub_8075B7C: @ 0x08075B7C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl sub_8075A98
	movs r0, #0
	str r0, [r7, #4]
_08075B8C:
	ldr r0, [r7, #4]
	cmp r0, #0xf
	ble _08075B94
	b _08075BE0
_08075B94:
	ldr r0, _08075BDC @ =0x03004830
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08075BDC @ =0x03004830
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	lsls r1, r2, #4
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08075B8C
	.align 2, 0
_08075BDC: .4byte 0x03004830
_08075BE0:
	ldr r0, [r7]
	ldrh r1, [r0, #0x36]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x36]
	ldr r0, [r7]
	ldrh r1, [r0, #0x38]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x38]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0x3a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0x3c]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x3a]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075C18
sub_8075C18: @ 0x08075C18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	movs r3, #0x30
	ldrsh r2, [r0, r3]
	ldr r0, [r7]
	ldrh r3, [r0, #0x3a]
	ldr r0, [r7]
	ldrh r4, [r0, #0x3e]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	lsls r1, r0, #4
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x36]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	asrs r2, r1, #0x1f
	lsrs r3, r2, #0x1f
	adds r2, r1, r3
	asrs r1, r2, #1
	ldrh r2, [r0, #0x38]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x38]
	movs r0, #0
	str r0, [r7, #4]
_08075C74:
	ldr r0, [r7, #4]
	cmp r0, #0xf
	ble _08075C7C
	b _08075CC0
_08075C7C:
	ldr r1, [r7]
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	ldrh r2, [r3, #0x36]
	ldr r3, _08075CBC @ =0x03004830
	ldr r4, [r7, #4]
	adds r5, r4, #0
	lsls r4, r5, #3
	adds r3, r3, r4
	ldrh r4, [r3]
	adds r3, r2, r4
	asrs r2, r3, #4
	ldr r4, [r7]
	ldrh r3, [r4, #0x38]
	ldr r4, _08075CBC @ =0x03004830
	ldr r5, [r7, #4]
	adds r6, r5, #0
	lsls r5, r6, #3
	adds r4, r4, r5
	ldrh r5, [r4, #2]
	adds r4, r3, r5
	asrs r3, r4, #4
	bl sub_8075B1C
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08075C74
	.align 2, 0
_08075CBC: .4byte 0x03004830
_08075CC0:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x3a]
	adds r1, r2, #1
	ldrh r2, [r0, #0x3a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x3a]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r0, [r0, #0x3a]
	ldrh r1, [r2]
	cmp r0, r1
	bls _08075CF0
	ldr r0, [r7]
	bl Proc_Break
_08075CF0:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075CF8
sub_8075CF8: @ 0x08075CF8
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, _08075DAC @ =gUnk_08D65E9C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrh r2, [r0, #0x30]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x1c]
	adds r1, r2, #0
	ldrh r2, [r0, #0x3c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x3c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x20]
	adds r1, r2, #0
	ldrh r2, [r0, #0x3e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x3e]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x24]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075DAC: .4byte gUnk_08D65E9C

	thumb_func_start sub_8075DB0
sub_8075DB0: @ 0x08075DB0
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0x28
	str r0, [sp, #8]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0xc8
	bl sub_8075CF8
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075DDC
sub_8075DDC: @ 0x08075DDC
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0x37
	str r0, [sp, #8]
	ldr r0, [r7]
	movs r2, #0xc8
	movs r3, #1
	bl sub_8075CF8
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075E08
sub_8075E08: @ 0x08075E08
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075E18 @ =0x0203E0D4
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _08075E20
	ldr r0, _08075E1C @ =gUnk_08D65ECC
	b _08075E2C
	.align 2, 0
_08075E18: .4byte 0x0203E0D4
_08075E1C: .4byte gUnk_08D65ECC
_08075E20:
	ldr r0, _08075E28 @ =0x0203E0D4
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	b _08075E2C
	.align 2, 0
_08075E28: .4byte 0x0203E0D4
_08075E2C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8075E34
sub_8075E34: @ 0x08075E34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075E64 @ =0x0203E0D4
	ldr r2, _08075E64 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E4A0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075E64: .4byte 0x0203E0D4

	thumb_func_start sub_8075E68
sub_8075E68: @ 0x08075E68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075E98 @ =0x0203E0D4
	ldr r2, _08075E98 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E51C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075E98: .4byte 0x0203E0D4

	thumb_func_start sub_8075E9C
sub_8075E9C: @ 0x08075E9C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075ED0 @ =0x0203E0D4
	ldr r2, _08075ED0 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r1, [r0, #4]
	cmp r1, #0x40
	bne _08075ED8
	ldr r1, _08075ED4 @ =sub_8075F68
	adds r0, r1, #0
	movs r1, #9
	bl sub_8014FB0
	b _08075EE2
	.align 2, 0
_08075ED0: .4byte 0x0203E0D4
_08075ED4: .4byte sub_8075F68
_08075ED8:
	ldr r1, _08075F60 @ =sub_8075FAC
	adds r0, r1, #0
	movs r1, #0xc
	bl sub_8014FB0
_08075EE2:
	ldr r0, _08075F64 @ =0x0203E0D4
	ldr r2, _08075F64 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _08075F64 @ =0x0203E0D4
	ldr r2, _08075F64 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _08075F64 @ =0x0203E0D4
	ldr r2, _08075F64 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #5
	bl SetSpriteAnimId
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075F60: .4byte sub_8075FAC
_08075F64: .4byte 0x0203E0D4

	thumb_func_start sub_8075F68
sub_8075F68: @ 0x08075F68
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08075FA0 @ =0x000002D5
	ldr r1, _08075FA4 @ =0x0203E0D4
	ldr r3, _08075FA4 @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075FA8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FA0: .4byte 0x000002D5
_08075FA4: .4byte 0x0203E0D4
_08075FA8: .4byte gBmSt

	thumb_func_start sub_8075FAC
sub_8075FAC: @ 0x08075FAC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08075FE4 @ =0x000002D6
	ldr r1, _08075FE8 @ =0x0203E0D4
	ldr r3, _08075FE8 @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075FEC @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FE4: .4byte 0x000002D6
_08075FE8: .4byte 0x0203E0D4
_08075FEC: .4byte gBmSt

	thumb_func_start sub_8075FF0
sub_8075FF0: @ 0x08075FF0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076048 @ =0x0203E0D4
	ldr r2, _08076048 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _08076048 @ =0x0203E0D4
	ldr r2, _08076048 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076048: .4byte 0x0203E0D4

	thumb_func_start sub_807604C
sub_807604C: @ 0x0807604C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807607C @ =0x0203E0D4
	ldr r2, _0807607C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E5C0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807607C: .4byte 0x0203E0D4

	thumb_func_start sub_8076080
sub_8076080: @ 0x08076080
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r4, [r7, #4]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _080760DA
	adds r3, r0, #0
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4c
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _080760D8
	subs r3, #0x10
_080760D8:
	b _080760E0
_080760DA:
	adds r4, r0, #0
	adds r4, #0x10
	adds r3, r4, #0
_080760E0:
	adds r4, r2, #0
	adds r2, #0x4c
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r3, #0
	ldrsh r1, [r4, r3]
	ldr r4, [r7, #4]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _08076142
	adds r3, r1, #0
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4e
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08076140
	subs r3, #0x10
_08076140:
	b _08076148
_08076142:
	adds r4, r1, #0
	adds r4, #0x10
	adds r3, r4, #0
_08076148:
	adds r4, r2, #0
	adds r2, #0x4e
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076164
sub_8076164: @ 0x08076164
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _080761BE
	adds r3, r0, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4c
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _080761BC
	subs r3, #0x10
_080761BC:
	b _080761C4
_080761BE:
	adds r4, r0, #0
	adds r4, #0x10
	adds r3, r4, #0
_080761C4:
	adds r4, r2, #0
	adds r2, #0x4c
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r3, #0
	ldrsh r1, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _08076226
	adds r3, r1, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4e
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08076224
	subs r3, #0x10
_08076224:
	b _0807622C
_08076226:
	adds r4, r1, #0
	adds r4, #0x10
	adds r3, r4, #0
_0807622C:
	adds r4, r2, #0
	adds r2, #0x4e
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076248
sub_8076248: @ 0x08076248
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _080762C8 @ =0x0203E0D4
	ldr r2, _080762C8 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #4]
	ldr r0, _080762C8 @ =0x0203E0D4
	ldr r2, _080762C8 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076080
	ldr r1, _080762C8 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080762C0
	ldr r0, _080762C8 @ =0x0203E0D4
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076080
	ldr r0, _080762C8 @ =0x0203E0D4
	ldr r1, [r0, #0x44]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076080
_080762C0:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080762C8: .4byte 0x0203E0D4

	thumb_func_start sub_80762CC
sub_80762CC: @ 0x080762CC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807634C @ =0x0203E0D4
	ldr r2, _0807634C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #4]
	ldr r0, _0807634C @ =0x0203E0D4
	ldr r2, _0807634C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076164
	ldr r1, _0807634C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08076344
	ldr r0, _0807634C @ =0x0203E0D4
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076164
	ldr r0, _0807634C @ =0x0203E0D4
	ldr r1, [r0, #0x44]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076164
_08076344:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807634C: .4byte 0x0203E0D4

	thumb_func_start sub_8076350
sub_8076350: @ 0x08076350
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807639C @ =0x0203E0D4
	ldr r2, _0807639C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0807639C @ =0x0203E0D4
	ldr r3, _0807639C @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807639C: .4byte 0x0203E0D4

	thumb_func_start sub_80763A0
sub_80763A0: @ 0x080763A0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080763EC @ =0x0203E0D4
	ldr r2, _080763EC @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _080763EC @ =0x0203E0D4
	ldr r3, _080763EC @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080763EC: .4byte 0x0203E0D4

	thumb_func_start sub_80763F0
sub_80763F0: @ 0x080763F0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076458 @ =0x0203E0D4
	ldr r1, _0807645C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076458 @ =0x0203E0D4
	ldr r1, _0807645C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x74
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
	ldr r1, _08076458 @ =0x0203E0D4
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r2, _08076458 @ =0x0203E0D4
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x61
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076458: .4byte 0x0203E0D4
_0807645C: .4byte gBattleTarget

	thumb_func_start sub_8076460
sub_8076460: @ 0x08076460
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076494 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #8]
	ldr r1, _08076494 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08076498
	ldr r1, _08076494 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #0xc]
	b _080764A2
	.align 2, 0
_08076494: .4byte 0x0203E0D4
_08076498:
	ldr r1, _080764F8 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x59
	ldrb r0, [r1]
	str r0, [r7, #0xc]
_080764A2:
	ldr r0, _080764F8 @ =0x0203E0D4
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C208
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080764FC
	ldr r1, _080764F8 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080764F6
	ldr r0, _080764F8 @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071C10
_080764F6:
	b _0807680E
	.align 2, 0
_080764F8: .4byte 0x0203E0D4
_080764FC:
	ldr r0, _08076560 @ =0x0203E0D4
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, _08076560 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl sub_8076820
	ldr r1, _08076560 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08076550
	ldr r0, [r7, #8]
	ldr r2, _08076560 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r2, r1, #0
	adds r1, r2, #0
	bl sub_8076820
_08076550:
	ldr r1, _08076560 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08076564
	b _0807680E
	.align 2, 0
_08076560: .4byte 0x0203E0D4
_08076564:
	ldr r1, _080765B8 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080765C0
	ldr r0, _080765B8 @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _080765BC @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xc8
	bl sub_80151FC
	ldr r0, _080765B8 @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071C10
	b _0807680E
	.align 2, 0
_080765B8: .4byte 0x0203E0D4
_080765BC: .4byte gBmSt
_080765C0:
	ldr r1, _0807660C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08076618
	ldr r0, _08076610 @ =0x000002CE
	ldr r1, _0807660C @ =0x0203E0D4
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08076614 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	ldr r0, _0807660C @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071C8C
	b _0807680E
	.align 2, 0
_0807660C: .4byte 0x0203E0D4
_08076610: .4byte 0x000002CE
_08076614: .4byte gBmSt
_08076618:
	movs r0, #0
	ldr r1, _08076658 @ =0x0203E0D4
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x1b
	beq _0807665C
	ldr r1, _08076658 @ =0x0203E0D4
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x33
	beq _0807665C
	b _0807665E
	.align 2, 0
_08076658: .4byte 0x0203E0D4
_0807665C:
	movs r0, #1
_0807665E:
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080766C4
	ldr r1, _0807669C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080766A0
	movs r0, #0xaf
	str r0, [r7, #4]
	ldr r0, _0807669C @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #1
	bl sub_8071D08
	b _080766BC
	.align 2, 0
_0807669C: .4byte 0x0203E0D4
_080766A0:
	movs r0, #0xb0
	str r0, [r7, #4]
	ldr r0, _080766C0 @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8071D08
_080766BC:
	b _080766E8
	.align 2, 0
_080766C0: .4byte 0x0203E0D4
_080766C4:
	ldr r1, _080766E0 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080766E4
	movs r0, #0xd5
	str r0, [r7, #4]
	b _080766E8
	.align 2, 0
_080766E0: .4byte 0x0203E0D4
_080766E4:
	movs r0, #0xd2
	str r0, [r7, #4]
_080766E8:
	ldr r1, _080767A4 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080767AC
	ldr r0, [r7, #4]
	ldr r1, _080767A4 @ =0x0203E0D4
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _080767A8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	ldr r0, _080767A4 @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _080767A4 @ =0x0203E0D4
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C228
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl sub_806E630
	bl sub_80759B0
	ldr r0, _080767A4 @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _080767A8 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xd8
	bl sub_80151FC
	ldr r0, _080767A4 @ =0x0203E0D4
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E5C0
	b _0807680E
	.align 2, 0
_080767A4: .4byte 0x0203E0D4
_080767A8: .4byte gBmSt
_080767AC:
	ldr r0, [r7, #4]
	ldr r1, _08076818 @ =0x0203E0D4
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _0807681C @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	ldr r0, _08076818 @ =0x0203E0D4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _08076818 @ =0x0203E0D4
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C228
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl sub_806E840
_0807680E:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076818: .4byte 0x0203E0D4
_0807681C: .4byte gBmSt

	thumb_func_start sub_8076820
sub_8076820: @ 0x08076820
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0807685C @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xd]
	ldr r0, [r7, #4]
	cmp r1, r0
	bgt _08076860
	ldr r0, _0807685C @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xd]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xd]
	b _08076894
	.align 2, 0
_0807685C: .4byte 0x0203E0D4
_08076860:
	ldr r0, _080768F0 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080768F0 @ =0x0203E0D4
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrb r3, [r1, #0xd]
	subs r1, r3, r2
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
_08076894:
	ldr r0, _080768F0 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080768F0 @ =0x0203E0D4
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r0, [r0, #0xd]
	ldrb r1, [r1, #0xc]
	cmp r0, r1
	bls _080768E6
	ldr r0, _080768F0 @ =0x0203E0D4
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080768F0 @ =0x0203E0D4
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #0xc]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
_080768E6:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080768F0: .4byte 0x0203E0D4

	thumb_func_start sub_80768F4
sub_80768F4: @ 0x080768F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0807690C @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08076910
	b _08076916
	.align 2, 0
_0807690C: .4byte 0x0203E0D4
_08076910:
	ldr r0, [r7]
	bl Proc_Break
_08076916:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076920
sub_8076920: @ 0x08076920
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807694C @ =0x0203E0D4
	ldr r2, _0807694C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071DF8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807694C: .4byte 0x0203E0D4

	thumb_func_start sub_8076950
sub_8076950: @ 0x08076950
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807697C @ =0x0203E0D4
	ldr r2, _0807697C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8073D3C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807697C: .4byte 0x0203E0D4

	thumb_func_start sub_8076980
sub_8076980: @ 0x08076980
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080769AC @ =0x0203E0D4
	ldr r2, _080769AC @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8074064
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769AC: .4byte 0x0203E0D4

	thumb_func_start sub_80769B0
sub_80769B0: @ 0x080769B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080769DC @ =0x0203E0D4
	ldr r2, _080769DC @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071ECC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769DC: .4byte 0x0203E0D4

	thumb_func_start sub_80769E0
sub_80769E0: @ 0x080769E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076A10 @ =0x0203E0D4
	ldr r2, _08076A10 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076A14 @ =gUnk_083FBC64
	ldr r2, _08076A18 @ =gUnk_083FCD90
	bl sub_8072638
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A10: .4byte 0x0203E0D4
_08076A14: .4byte gUnk_083FBC64
_08076A18: .4byte gUnk_083FCD90

	thumb_func_start sub_8076A1C
sub_8076A1C: @ 0x08076A1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076A4C @ =0x0203E0D4
	ldr r2, _08076A4C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076A50 @ =gUnk_083FBC64
	ldr r2, _08076A54 @ =gUnk_083FCD70
	bl sub_8072638
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A4C: .4byte 0x0203E0D4
_08076A50: .4byte gUnk_083FBC64
_08076A54: .4byte gUnk_083FCD70

	thumb_func_start sub_8076A58
sub_8076A58: @ 0x08076A58
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076A88 @ =0x0203E0D4
	ldr r2, _08076A88 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076A8C @ =gUnk_083FD11C
	ldr r2, _08076A90 @ =gUnk_083FD3D8
	movs r3, #0x8b
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A88: .4byte 0x0203E0D4
_08076A8C: .4byte gUnk_083FD11C
_08076A90: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076A94
sub_8076A94: @ 0x08076A94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076AC4 @ =0x0203E0D4
	ldr r2, _08076AC4 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076AC8 @ =gUnk_083FCDB0
	ldr r2, _08076ACC @ =gUnk_083FD3D8
	movs r3, #0x89
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076AC4: .4byte 0x0203E0D4
_08076AC8: .4byte gUnk_083FCDB0
_08076ACC: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076AD0
sub_8076AD0: @ 0x08076AD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076B00 @ =0x0203E0D4
	ldr r2, _08076B00 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076B04 @ =gUnk_083FCF24
	ldr r2, _08076B08 @ =gUnk_083FD3D8
	movs r3, #0x8a
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B00: .4byte 0x0203E0D4
_08076B04: .4byte gUnk_083FCF24
_08076B08: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076B0C
sub_8076B0C: @ 0x08076B0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076B3C @ =0x0203E0D4
	ldr r2, _08076B3C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076B40 @ =gUnk_083FD11C
	ldr r2, _08076B44 @ =gUnk_083FD3D8
	movs r3, #0x8b
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B3C: .4byte 0x0203E0D4
_08076B40: .4byte gUnk_083FD11C
_08076B44: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076B48
sub_8076B48: @ 0x08076B48
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076B78 @ =0x0203E0D4
	ldr r2, _08076B78 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076B7C @ =gUnk_083FCDB0
	ldr r2, _08076B80 @ =gUnk_083FD3D8
	movs r3, #0x89
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B78: .4byte 0x0203E0D4
_08076B7C: .4byte gUnk_083FCDB0
_08076B80: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076B84
sub_8076B84: @ 0x08076B84
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076C34 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08076BA2
	movs r0, #0xb4
	bl m4aSongNumStart
_08076BA2:
	ldr r0, _08076C38 @ =0x0203E0D4
	ldr r1, _08076C3C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076C38 @ =0x0203E0D4
	ldr r1, _08076C3C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x74
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
	ldr r0, _08076C38 @ =0x0203E0D4
	ldr r2, _08076C38 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076C38 @ =0x0203E0D4
	ldr r3, _08076C38 @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08076C38 @ =0x0203E0D4
	ldr r4, _08076C38 @ =0x0203E0D4
	adds r3, r4, #0
	adds r4, #0x59
	ldrb r3, [r4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	bl sub_8072EAC
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076C34: .4byte gPlaySt
_08076C38: .4byte 0x0203E0D4
_08076C3C: .4byte gBattleTarget

	thumb_func_start sub_8076C40
sub_8076C40: @ 0x08076C40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076C7C @ =0x0203E0D4
	ldr r2, _08076C7C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r2, _08076C7C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r3, _08076C7C @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x61
	ldrb r2, [r3]
	bl sub_8072EAC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076C7C: .4byte 0x0203E0D4

	thumb_func_start sub_8076C80
sub_8076C80: @ 0x08076C80
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076CAC @ =0x0203E0D4
	ldr r2, _08076CAC @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8073084
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076CAC: .4byte 0x0203E0D4

	thumb_func_start sub_8076CB0
sub_8076CB0: @ 0x08076CB0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076CD4 @ =0x0203E0D4
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	ldr r2, _08076CD4 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	bl sub_8074240
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076CD4: .4byte 0x0203E0D4

	thumb_func_start sub_8076CD8
sub_8076CD8: @ 0x08076CD8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D04 @ =0x0203E0D4
	ldr r2, _08076D04 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_807340C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D04: .4byte 0x0203E0D4

	thumb_func_start sub_8076D08
sub_8076D08: @ 0x08076D08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D34 @ =0x0203E0D4
	ldr r2, _08076D34 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_807384C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D34: .4byte 0x0203E0D4

	thumb_func_start sub_8076D38
sub_8076D38: @ 0x08076D38
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D64 @ =0x0203E0D4
	ldr r2, _08076D64 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8073984
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D64: .4byte 0x0203E0D4

	thumb_func_start sub_8076D68
sub_8076D68: @ 0x08076D68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D94 @ =0x0203E0D4
	ldr r2, _08076D94 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80734FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D94: .4byte 0x0203E0D4

	thumb_func_start sub_8076D98
sub_8076D98: @ 0x08076D98
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076DC8 @ =0x0203E0D4
	ldr r2, _08076DC8 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	movs r1, #0
	bl sub_806E380
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076DC8: .4byte 0x0203E0D4

	thumb_func_start sub_8076DCC
sub_8076DCC: @ 0x08076DCC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076DFC @ =0x0203E0D4
	ldr r2, _08076DFC @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E400
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076DFC: .4byte 0x0203E0D4

	thumb_func_start sub_8076E00
sub_8076E00: @ 0x08076E00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076E30 @ =0x0203E0D4
	ldr r2, _08076E30 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E2A0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076E30: .4byte 0x0203E0D4

	thumb_func_start sub_8076E34
sub_8076E34: @ 0x08076E34
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076EA0 @ =0x0203E0D4
	ldr r2, _08076EA0 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08076EA4 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08076EA0 @ =0x0203E0D4
	ldr r3, _08076EA0 @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08076EA4 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	bl sub_8075DB0
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076EA0: .4byte 0x0203E0D4
_08076EA4: .4byte gBmSt

	thumb_func_start sub_8076EA8
sub_8076EA8: @ 0x08076EA8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076F28 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08076EC6
	movs r0, #0xb5
	bl m4aSongNumStart
_08076EC6:
	ldr r0, _08076F2C @ =0x0203E0D4
	ldr r2, _08076F2C @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08076F30 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08076F2C @ =0x0203E0D4
	ldr r3, _08076F2C @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08076F30 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	bl sub_8075DDC
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076F28: .4byte gPlaySt
_08076F2C: .4byte 0x0203E0D4
_08076F30: .4byte gBmSt

	thumb_func_start sub_8076F34
sub_8076F34: @ 0x08076F34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076F64 @ =0x0203E0D4
	ldr r2, _08076F64 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E2C8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076F64: .4byte 0x0203E0D4

	thumb_func_start sub_8076F68
sub_8076F68: @ 0x08076F68
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076FF8 @ =0x0203E0D4
	ldr r2, _08076FF8 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, _08076FF8 @ =0x0203E0D4
	ldr r2, _08076FF8 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r2, _08076FF8 @ =0x0203E0D4
	adds r1, r2, #0
	adds r2, #0x60
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r3, _08076FF8 @ =0x0203E0D4
	adds r2, r3, #0
	adds r3, #0x61
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #4
	bl sub_806E2E8
	ldr r0, [r7, #4]
	ldr r1, _08076FF8 @ =0x0203E0D4
	adds r2, r1, #0
	adds r1, #0x60
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x10]
	ldr r0, [r7, #4]
	ldr r1, _08076FF8 @ =0x0203E0D4
	adds r2, r1, #0
	adds r1, #0x61
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x11]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076FF8: .4byte 0x0203E0D4

	thumb_func_start sub_8076FFC
sub_8076FFC: @ 0x08076FFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_80758AC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8077014
sub_8077014: @ 0x08077014
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8075938
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start InitScanlineEffect
InitScanlineEffect: @ 0x0807702C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0807705C @ =0x0203E138
	adds r0, r1, #0
	bl sub_80778C0
	ldr r1, _08077060 @ =0x0203E3B8
	adds r0, r1, #0
	bl sub_80778C0
	ldr r0, _08077064 @ =0x0203E638
	ldr r1, _0807705C @ =0x0203E138
	str r1, [r0]
	ldr r0, _08077064 @ =0x0203E638
	ldr r1, _08077060 @ =0x0203E3B8
	str r1, [r0, #4]
	ldr r0, _08077068 @ =0x0203E640
	ldr r1, _08077064 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807705C: .4byte 0x0203E138
_08077060: .4byte 0x0203E3B8
_08077064: .4byte 0x0203E638
_08077068: .4byte 0x0203E640

	thumb_func_start sub_807706C
sub_807706C: @ 0x0807706C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08077194 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08077194 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08077194 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
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
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xf7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08077194 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08077198 @ =sub_80771E0
	adds r0, r1, #0
	bl SetOnHBlankA
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077194: .4byte gDispIo
_08077198: .4byte sub_80771E0

	thumb_func_start sub_807719C
sub_807719C: @ 0x0807719C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080771CC @ =0x0203E638
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl sub_80778C0
	ldr r1, _080771CC @ =0x0203E638
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl sub_807798C
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080771CC: .4byte 0x0203E638

	thumb_func_start sub_80771D0
sub_80771D0: @ 0x080771D0
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl SetOnHBlankA
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80771E0
sub_80771E0: @ 0x080771E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077208 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077214
	ldr r0, _0807720C @ =0x0203E640
	ldr r1, _08077210 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077222
	.align 2, 0
_08077208: .4byte 0x04000006
_0807720C: .4byte 0x0203E640
_08077210: .4byte 0x0203E638
_08077214:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077222:
	ldr r0, _08077240 @ =0x04000040
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077244 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077240: .4byte 0x04000040
_08077244: .4byte 0x0203E640

	thumb_func_start sub_8077248
sub_8077248: @ 0x08077248
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077270 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _0807727C
	ldr r0, _08077274 @ =0x0203E640
	ldr r1, _08077278 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807728A
	.align 2, 0
_08077270: .4byte 0x04000006
_08077274: .4byte 0x0203E640
_08077278: .4byte 0x0203E638
_0807727C:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_0807728A:
	ldr r0, _080772C0 @ =0x04000040
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080772C4 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080772C8 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080772C4 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080772C0: .4byte 0x04000040
_080772C4: .4byte 0x0203E640
_080772C8: .4byte 0x04000018

	thumb_func_start sub_80772CC
sub_80772CC: @ 0x080772CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _080772F4 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077300
	ldr r0, _080772F8 @ =0x0203E640
	ldr r1, _080772FC @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807730E
	.align 2, 0
_080772F4: .4byte 0x04000006
_080772F8: .4byte 0x0203E640
_080772FC: .4byte 0x0203E638
_08077300:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_0807730E:
	ldr r0, _08077344 @ =0x05000022
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077348 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _0807734C @ =0x05000042
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077348 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077344: .4byte 0x05000022
_08077348: .4byte 0x0203E640
_0807734C: .4byte 0x05000042

	thumb_func_start sub_8077350
sub_8077350: @ 0x08077350
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077378 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077384
	ldr r0, _0807737C @ =0x0203E640
	ldr r1, _08077380 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077392
	.align 2, 0
_08077378: .4byte 0x04000006
_0807737C: .4byte 0x0203E640
_08077380: .4byte 0x0203E638
_08077384:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077392:
	ldr r0, _080773B0 @ =0x04000052
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080773B4 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080773B0: .4byte 0x04000052
_080773B4: .4byte 0x0203E640

	thumb_func_start sub_80773B8
sub_80773B8: @ 0x080773B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _080773E0 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _080773EC
	ldr r0, _080773E4 @ =0x0203E640
	ldr r1, _080773E8 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080773FA
	.align 2, 0
_080773E0: .4byte 0x04000006
_080773E4: .4byte 0x0203E640
_080773E8: .4byte 0x0203E638
_080773EC:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_080773FA:
	ldr r0, _08077418 @ =0x04000054
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807741C @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077418: .4byte 0x04000054
_0807741C: .4byte 0x0203E640

	thumb_func_start sub_8077420
sub_8077420: @ 0x08077420
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	add r7, sp, #4
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
	ldr r1, _08077554 @ =0x0203E638
	ldr r0, [r1, #4]
	adds r2, r7, #0
	ldrh r1, [r2]
	adds r3, r7, #2
	ldrh r2, [r3]
	adds r4, r7, #4
	ldrh r3, [r4]
	adds r4, r7, #4
	ldrh r5, [r4]
	movs r6, #0x1f
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	lsrs r5, r4, #1
	adds r4, r5, #0
	movs r5, #0x1f
	ands r4, r5
	adds r5, r7, #4
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #2
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r5, r6
	orrs r4, r5
	adds r5, r7, #4
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #7
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #7
	ands r5, r6
	orrs r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	str r4, [sp]
	bl sub_8077A70
	ldr r0, _08077554 @ =0x0203E638
	ldr r1, [r0, #4]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r2, r7, #0
	ldrh r1, [r2]
	adds r3, r7, #2
	ldrh r2, [r3]
	adds r4, r7, #6
	ldrh r3, [r4]
	adds r4, r7, #6
	ldrh r5, [r4]
	movs r6, #0x1f
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	lsrs r5, r4, #1
	adds r4, r5, #0
	movs r5, #0x1f
	ands r4, r5
	adds r5, r7, #6
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #2
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r5, r6
	orrs r4, r5
	adds r5, r7, #6
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #7
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #7
	ands r5, r6
	orrs r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	str r4, [sp]
	bl sub_8077A70
	bl SwapScanlineBufs
	ldr r1, _08077558 @ =sub_80772CC
	adds r0, r1, #0
	bl SetOnHBlankA
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077554: .4byte 0x0203E638
_08077558: .4byte sub_80772CC

	thumb_func_start sub_807755C
sub_807755C: @ 0x0807755C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08077584 @ =0x0203E638
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl sub_80778C0
_08077574:
	ldr r0, [r7, #0x1c]
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _08077588
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0807758A
	b _08077588
	.align 2, 0
_08077584: .4byte 0x0203E638
_08077588:
	b _080775D8
_0807758A:
	ldr r0, [r7, #0x1c]
	ldrb r1, [r0]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	ldr r1, [r7, #0xc]
	bl Div
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	ble _080775CA
	ldr r1, _080775D4 @ =0x0203E638
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl sub_8077944
	ldr r1, _080775D4 @ =0x0203E638
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl sub_80778FC
_080775CA:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08077574
	.align 2, 0
_080775D4: .4byte 0x0203E638
_080775D8:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	ble _08077614
_080775DE:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080775E6
	b _08077614
_080775E6:
	ldr r1, _08077610 @ =0x0203E638
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl sub_8077944
	ldr r1, _08077610 @ =0x0203E638
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl sub_80778FC
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080775DE
	.align 2, 0
_08077610: .4byte 0x0203E638
_08077614:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807761C
sub_807761C: @ 0x0807761C
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	movs r0, #0
	str r0, [r7, #0xc]
_0807763E:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08077646
	b _0807768C
_08077646:
	ldr r0, [r7]
	ldr r1, _08077688 @ =gSinLut
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0807763E
	.align 2, 0
_08077688: .4byte gSinLut
_0807768C:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077694
sub_8077694: @ 0x08077694
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	movs r0, #0
	str r0, [r7, #0xc]
_080776B6:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _080776BE
	b _0807770C
_080776BE:
	ldr r0, [r7]
	ldr r1, _08077708 @ =gSinLut
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	ldr r3, [r7, #0x20]
	adds r2, r3, #0
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _080776B6
	.align 2, 0
_08077708: .4byte gSinLut
_0807770C:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077714
sub_8077714: @ 0x08077714
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	movs r0, #1
	str r0, [r7, #0xc]
_0807773C:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08077744
	b _0807778C
_08077744:
	ldr r0, [r7]
	ldr r1, _08077788 @ =gSinLut
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #4
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	b _0807773C
	.align 2, 0
_08077788: .4byte gSinLut
_0807778C:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077794
sub_8077794: @ 0x08077794
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	movs r0, #1
	str r0, [r7, #0xc]
_080777BC:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _080777C4
	b _08077814
_080777C4:
	ldr r0, [r7]
	ldr r1, _08077810 @ =gSinLut
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r2, r1, #0
	muls r2, r3, r2
	asrs r1, r2, #0xc
	ldr r3, [r7, #0x20]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #4
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	b _080777BC
	.align 2, 0
_08077810: .4byte gSinLut
_08077814:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807781C
sub_807781C: @ 0x0807781C
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	ldr r0, [r7, #0x20]
	str r0, [r7, #0xc]
_0807783E:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x24]
	cmp r0, r1
	blt _08077848
	b _08077890
_08077848:
	ldr r0, [r7]
	ldr r1, _0807788C @ =gSinLut
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0807783E
	.align 2, 0
_0807788C: .4byte gSinLut
_08077890:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start SwapScanlineBufs
SwapScanlineBufs: @ 0x08077898
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080778BC @ =0x0203E638
	ldr r1, [r0]
	str r1, [r7]
	ldr r0, _080778BC @ =0x0203E638
	ldr r1, _080778BC @ =0x0203E638
	ldr r2, [r1, #4]
	str r2, [r0]
	ldr r0, _080778BC @ =0x0203E638
	ldr r1, [r7]
	str r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080778BC: .4byte 0x0203E638

	thumb_func_start sub_80778C0
sub_80778C0: @ 0x080778C0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #4]
_080778D0:
	ldr r0, [r7, #4]
	cmp r0, #0x9f
	ble _080778D8
	b _080778F4
_080778D8:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r3, _080778F0 @ =0x0000F0F0
	adds r2, r3, #0
	strh r2, [r1]
	adds r1, #2
	str r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080778D0
	.align 2, 0
_080778F0: .4byte 0x0000F0F0
_080778F4:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80778FC
sub_80778FC: @ 0x080778FC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _08077916
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	bgt _08077916
	b _08077918
_08077916:
	b _0807793C
_08077918:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08077922
	movs r0, #0
	str r0, [r7, #4]
_08077922:
	ldr r0, [r7, #4]
	cmp r0, #0xf0
	ble _0807792C
	movs r0, #0xf0
	str r0, [r7, #4]
_0807792C:
	ldr r1, [r7, #8]
	lsls r0, r1, #1
	ldr r2, [r7]
	adds r1, r0, r2
	adds r0, r1, #1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	strb r2, [r0]
_0807793C:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077944
sub_8077944: @ 0x08077944
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _0807795E
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	bgt _0807795E
	b _08077960
_0807795E:
	b _08077982
_08077960:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0807796A
	movs r0, #0
	str r0, [r7, #4]
_0807796A:
	ldr r0, [r7, #4]
	cmp r0, #0xf0
	ble _08077974
	movs r0, #0xf0
	str r0, [r7, #4]
_08077974:
	ldr r1, [r7, #8]
	lsls r0, r1, #1
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	strb r2, [r0]
_08077982:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807798C
sub_807798C: @ 0x0807798C
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_080779A2:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _080779AC
	b _08077A68
_080779AC:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r1, [r7, #0xc]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08077A60
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0xc]
	adds r1, r0, r1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_08077A60:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _080779A2
_08077A68:
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077A70
sub_8077A70: @ 0x08077A70
	push {r4, r7, lr}
	sub sp, #0x28
	add r7, sp, #4
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r3, #0
	ldr r0, [r7, #0x30]
	adds r3, r7, #4
	strh r4, [r3]
	adds r3, r7, #6
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #8
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xa
	strh r0, [r1]
	adds r1, r7, #6
	ldrh r0, [r1]
	adds r1, r7, #4
	ldrh r2, [r1]
	subs r0, r0, r2
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0xc]
_08077AA6:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08077AAE
	b _08077BB8
_08077AAE:
	adds r0, r7, #4
	ldrh r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r0, r1
	bge _08077AC8
	ldr r0, [r7]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	b _08077BB0
_08077AC8:
	adds r0, r7, #6
	ldrh r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r0, r1
	ble _08077AE2
	ldr r0, [r7]
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	b _08077BB0
_08077AE2:
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0xa
	ldrh r2, [r0]
	movs r3, #0x1f
	adds r0, r2, #0
	ands r0, r3
	adds r2, r0, #0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [r7, #0x10]
	ldr r0, [r7, #0x20]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0xa
	ldrh r2, [r0]
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r2, #0
	ands r0, r3
	adds r2, r0, #0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [r7, #0x10]
	ldr r0, [r7, #0x20]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf8
	lsls r2, r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0xa
	ldrh r2, [r0]
	movs r3, #0xf8
	lsls r3, r3, #7
	adds r0, r2, #0
	ands r0, r3
	adds r2, r0, #0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [r7, #0x10]
	ldr r0, [r7, #0x20]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x1c]
	ldr r0, [r7]
	ldr r2, [r7, #0x14]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldr r3, [r7, #0x18]
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r2, r3
	orrs r1, r2
	ldr r3, [r7, #0x1c]
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r2, r3
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_08077BB0:
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08077AA6
_08077BB8:
	add sp, #0x28
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077BC0
sub_8077BC0: @ 0x08077BC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077BE0
sub_8077BE0: @ 0x08077BE0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08077C18 @ =0x0203E638
	ldr r1, [r0, #4]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	movs r2, #0x10
	movs r3, #8
	bl sub_807761C
	bl SwapScanlineBufs
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C18: .4byte 0x0203E638

	thumb_func_start sub_8077C1C
sub_8077C1C: @ 0x08077C1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_08077C26:
	ldr r0, [r7]
	cmp r0, #0x9f
	ble _08077C2E
	b _08077C50
_08077C2E:
	ldr r0, _08077C4C @ =0x0203E638
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08077C26
	.align 2, 0
_08077C4C: .4byte 0x0203E638
_08077C50:
	movs r0, #8
	str r0, [r7]
_08077C54:
	ldr r0, [r7]
	cmp r0, #0x97
	ble _08077C5C
	b _08077C78
_08077C5C:
	ldr r0, _08077C74 @ =0x0203E638
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0]
	adds r0, r1, r2
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08077C54
	.align 2, 0
_08077C74: .4byte 0x0203E638
_08077C78:
	movs r0, #0
	str r0, [r7]
_08077C7C:
	ldr r0, [r7]
	cmp r0, #0x20
	ble _08077C84
	b _08077CE4
_08077C84:
	ldr r0, _08077CDC @ =0x0203E638
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	ldr r2, [r7]
	asrs r1, r2, #1
	adds r2, r1, #0
	movs r3, #0x10
	subs r1, r3, r2
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7]
	asrs r2, r3, #1
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08077CDC @ =0x0203E638
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, _08077CE0 @ =0xFFFFFED0
	adds r2, r1, r3
	ldr r1, [r0]
	subs r0, r1, r2
	ldr r2, [r7]
	asrs r1, r2, #1
	adds r2, r1, #0
	movs r3, #0x10
	subs r1, r3, r2
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7]
	asrs r2, r3, #1
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08077C7C
	.align 2, 0
_08077CDC: .4byte 0x0203E638
_08077CE0: .4byte 0xFFFFFED0
_08077CE4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077CEC
sub_8077CEC: @ 0x08077CEC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08077D10 @ =0x0203E638
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r1, #0
	b _08077D14
	.align 2, 0
_08077D10: .4byte 0x0203E638
_08077D14:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8077D1C
sub_8077D1C: @ 0x08077D1C
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_08077D32:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _08077D3C
	b _08077E14
_08077D3C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	adds r0, r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08077D92
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
_08077D92:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x10]
	adds r0, r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08077DE8
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
_08077DE8:
	ldr r1, [r7, #0xc]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08077E0C
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0xc]
	adds r1, r0, r1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_08077E0C:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08077D32
_08077E14:
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077E1C
sub_8077E1C: @ 0x08077E1C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08077E4C @ =0x0203E638
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl sub_80778C0
	ldr r1, _08077E4C @ =0x0203E638
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl sub_8077D1C
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077E4C: .4byte 0x0203E638

	thumb_func_start sub_8077E50
sub_8077E50: @ 0x08077E50
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x70
	ble _08077E62
	movs r0, #0x70
	str r0, [r7]
_08077E62:
	movs r0, #0x50
	ldr r1, [r7]
	subs r0, r0, r1
	str r0, [r7, #8]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x50
	str r1, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #4]
_08077E76:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _08077E80
	b _08077EA0
_08077E80:
	ldr r0, _08077E9C @ =0x0203E638
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077E76
	.align 2, 0
_08077E9C: .4byte 0x0203E638
_08077EA0:
	ldr r0, [r7, #0xc]
	str r0, [r7, #4]
_08077EA4:
	ldr r0, [r7, #4]
	cmp r0, #0x9f
	ble _08077EAC
	b _08077ECC
_08077EAC:
	ldr r0, _08077EC8 @ =0x0203E638
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077EA4
	.align 2, 0
_08077EC8: .4byte 0x0203E638
_08077ECC:
	ldr r0, [r7, #8]
	str r0, [r7, #4]
_08077ED0:
	ldr r0, [r7, #4]
	cmp r0, #0x4f
	bgt _08077EE4
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _08077EE6
	b _08077EE4
_08077EE4:
	b _08077F20
_08077EE6:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	subs r0, r0, r1
	asrs r1, r0, #1
	str r1, [r7, #0x10]
	ldr r0, _08077F1C @ =0x0203E638
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	movs r2, #0x10
	subs r1, r2, r1
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077ED0
	.align 2, 0
_08077F1C: .4byte 0x0203E638
_08077F20:
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #4]
_08077F26:
	ldr r0, [r7, #4]
	cmp r0, #0x4f
	ble _08077F3A
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	subs r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	bge _08077F3C
	b _08077F3A
_08077F3A:
	b _08077F74
_08077F3C:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	asrs r1, r0, #1
	str r1, [r7, #0x10]
	ldr r0, _08077F70 @ =0x0203E638
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	movs r2, #0x10
	subs r1, r2, r1
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08077F26
	.align 2, 0
_08077F70: .4byte 0x0203E638
_08077F74:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7, #4]
_08077F7C:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	subs r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _08077F8A
	b _08077FA8
_08077F8A:
	ldr r0, _08077FA4 @ =0x0203E638
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077F7C
	.align 2, 0
_08077FA4: .4byte 0x0203E638
_08077FA8:
	bl SwapScanlineBufs
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8077FB4
sub_8077FB4: @ 0x08077FB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077FDC @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9e
	bls _08077FE8
	ldr r0, _08077FE0 @ =0x0203E640
	ldr r1, _08077FE4 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077FF6
	.align 2, 0
_08077FDC: .4byte 0x04000006
_08077FE0: .4byte 0x0203E640
_08077FE4: .4byte 0x0203E638
_08077FE8:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077FF6:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0807801E
	ldr r0, _08078028 @ =0x04000040
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807802C @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_0807801E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078028: .4byte 0x04000040
_0807802C: .4byte 0x0203E640

	thumb_func_start sub_8078030
sub_8078030: @ 0x08078030
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08078058 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9e
	bls _08078064
	ldr r0, _0807805C @ =0x0203E640
	ldr r1, _08078060 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08078072
	.align 2, 0
_08078058: .4byte 0x04000006
_0807805C: .4byte 0x0203E640
_08078060: .4byte 0x0203E638
_08078064:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08078072:
	ldr r0, _08078090 @ =0x04000052
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078094 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078090: .4byte 0x04000052
_08078094: .4byte 0x0203E640

	thumb_func_start sub_8078098
sub_8078098: @ 0x08078098
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _080780D4 @ =0x04000006
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _080780B8
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
_080780B8:
	ldr r0, _080780D8 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080780DC @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080780D4: .4byte 0x04000006
_080780D8: .4byte 0x0400001A
_080780DC: .4byte 0x0203E640

	thumb_func_start sub_80780E0
sub_80780E0: @ 0x080780E0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_080780EE:
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	ble _080780F6
	b _08078124
_080780F6:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _08078120 @ =0x0203E640
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	movs r2, #1
	ands r1, r2
	ldr r3, [r7, #8]
	asrs r2, r3, #1
	adds r1, r1, r2
	adds r2, r1, #0
	rsbs r1, r2, #0
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080780EE
	.align 2, 0
_08078120: .4byte 0x0203E640
_08078124:
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8078130
sub_8078130: @ 0x08078130
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08078158 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08078164
	ldr r0, _0807815C @ =0x0203E640
	ldr r1, _08078160 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08078172
	.align 2, 0
_08078158: .4byte 0x04000006
_0807815C: .4byte 0x0203E640
_08078160: .4byte 0x0203E638
_08078164:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08078172:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080781B4
	ldr r0, _080781BC @ =0x04000014
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080781C0 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _080781C4 @ =0x04000016
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080781C0 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_080781B4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080781BC: .4byte 0x04000014
_080781C0: .4byte 0x0203E640
_080781C4: .4byte 0x04000016

	thumb_func_start sub_80781C8
sub_80781C8: @ 0x080781C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r2, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	adds r6, r7, #4
	strh r5, [r6]
	adds r5, r7, #6
	strh r4, [r5]
	adds r4, r7, #0
	adds r4, #8
	strh r3, [r4]
	adds r3, r7, #0
	adds r3, #0xa
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #0xc
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xe
	strh r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #2
	str r2, [r7]
	movs r1, #1
	str r1, [r7, #0x10]
_08078204:
	ldr r1, [r7, #0x10]
	cmp r1, #0x9f
	ble _0807820C
	b _080782A2
_0807820C:
	ldr r1, _08078268 @ =gSinLut
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0x10]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	str r1, [r7, #0x14]
	adds r1, r7, #0
	adds r1, #0xe
	movs r5, #0
	ldrsh r0, [r1, r5]
	adds r1, r7, #0
	adds r1, #0xc
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #0x10]
	subs r1, r3, r2
	cmp r1, #0
	blt _0807826C
	adds r1, r7, #0
	adds r1, #0xc
	movs r4, #0
	ldrsh r2, [r1, r4]
	ldr r3, [r7, #0x10]
	subs r1, r3, r2
	ldr r2, [r7, #0x14]
	muls r1, r2, r1
	muls r1, r0, r1
	b _08078280
	.align 2, 0
_08078268: .4byte gSinLut
_0807826C:
	adds r2, r7, #0
	adds r2, #0xc
	movs r5, #0
	ldrsh r3, [r2, r5]
	ldr r4, [r7, #0x10]
	subs r2, r3, r4
	ldr r3, [r7, #0x14]
	adds r1, r2, #0
	muls r1, r3, r1
	muls r1, r0, r1
_08078280:
	str r1, [r7, #0x14]
	ldr r1, [r7]
	ldr r3, [r7, #0x14]
	asrs r2, r3, #0x14
	adds r3, r7, #0
	adds r3, #0xa
	ldrh r3, [r3]
	adds r2, r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, [r7]
	adds r2, r1, #4
	str r2, [r7]
	ldr r1, [r7, #0x10]
	adds r2, r1, #2
	str r2, [r7, #0x10]
	b _08078204
_080782A2:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80782AC
sub_80782AC: @ 0x080782AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _080782D4 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _080782E0
	ldr r0, _080782D8 @ =0x0203E640
	ldr r1, _080782DC @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080782EE
	.align 2, 0
_080782D4: .4byte 0x04000006
_080782D8: .4byte 0x0203E640
_080782DC: .4byte 0x0203E638
_080782E0:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_080782EE:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08078330
	ldr r0, _08078338 @ =0x04000010
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807833C @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08078340 @ =0x04000012
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807833C @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08078330:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078338: .4byte 0x04000010
_0807833C: .4byte 0x0203E640
_08078340: .4byte 0x04000012

	thumb_func_start sub_8078344
sub_8078344: @ 0x08078344
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _0807836C @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08078378
	ldr r0, _08078370 @ =0x0203E640
	ldr r1, _08078374 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08078386
	.align 2, 0
_0807836C: .4byte 0x04000006
_08078370: .4byte 0x0203E640
_08078374: .4byte 0x0203E638
_08078378:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08078386:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080783C8
	ldr r0, _080783D0 @ =0x04000014
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080783D4 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _080783D8 @ =0x04000016
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080783D4 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_080783C8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080783D0: .4byte 0x04000014
_080783D4: .4byte 0x0203E640
_080783D8: .4byte 0x04000016

	thumb_func_start sub_80783DC
sub_80783DC: @ 0x080783DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08078404 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08078410
	ldr r0, _08078408 @ =0x0203E640
	ldr r1, _0807840C @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807841E
	.align 2, 0
_08078404: .4byte 0x04000006
_08078408: .4byte 0x0203E640
_0807840C: .4byte 0x0203E638
_08078410:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_0807841E:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08078460
	ldr r0, _08078468 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807846C @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08078470 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807846C @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08078460:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078468: .4byte 0x04000018
_0807846C: .4byte 0x0203E640
_08078470: .4byte 0x0400001A

	thumb_func_start sub_8078474
sub_8078474: @ 0x08078474
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _0807849C @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _080784A8
	ldr r0, _080784A0 @ =0x0203E640
	ldr r1, _080784A4 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080784B6
	.align 2, 0
_0807849C: .4byte 0x04000006
_080784A0: .4byte 0x0203E640
_080784A4: .4byte 0x0203E638
_080784A8:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_080784B6:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080784F8
	ldr r0, _08078500 @ =0x0400001C
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078504 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08078508 @ =0x0400001E
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078504 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_080784F8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078500: .4byte 0x0400001C
_08078504: .4byte 0x0203E640
_08078508: .4byte 0x0400001E

	thumb_func_start QuintessenceFx_OnHBlank
QuintessenceFx_OnHBlank: @ 0x0807850C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08078534 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08078540
	ldr r0, _08078538 @ =0x0203E640
	ldr r1, _0807853C @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807854E
	.align 2, 0
_08078534: .4byte 0x04000006
_08078538: .4byte 0x0203E640
_0807853C: .4byte 0x0203E638
_08078540:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_0807854E:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080785A0
	ldr r0, _080785A8 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080785AC @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldr r1, _080785B0 @ =gDispIo
	ldrh r2, [r2]
	ldrh r1, [r1, #0x24]
	adds r2, r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080785B4 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080785AC @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldr r2, _080785B0 @ =gDispIo
	ldrh r1, [r1]
	ldrh r2, [r2, #0x26]
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_080785A0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080785A8: .4byte 0x04000018
_080785AC: .4byte 0x0203E640
_080785B0: .4byte gDispIo
_080785B4: .4byte 0x0400001A

	thumb_func_start sub_80785B8
sub_80785B8: @ 0x080785B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _080785E0 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _080785EC
	ldr r0, _080785E4 @ =0x0203E640
	ldr r1, _080785E8 @ =0x0203E638
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080785FA
	.align 2, 0
_080785E0: .4byte 0x04000006
_080785E4: .4byte 0x0203E640
_080785E8: .4byte 0x0203E638
_080785EC:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_080785FA:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0807866A
	ldr r0, _08078674 @ =0x04000014
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078678 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _0807867C @ =0x04000016
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078678 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08078680 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078678 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08078684 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078678 @ =0x0203E640
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_0807866A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078674: .4byte 0x04000014
_08078678: .4byte 0x0203E640
_0807867C: .4byte 0x04000016
_08078680: .4byte 0x04000018
_08078684: .4byte 0x0400001A

	thumb_func_start sub_8078688
sub_8078688: @ 0x08078688
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x2c]
	cmp r0, r1
	bgt _080786A0
	b _08078796
_080786A0:
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x20]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_080786AA:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _080786B4
	b _08078794
_080786B4:
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x2c]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0xc]
	bl __divsi3
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x2c]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0xc]
	bl __divsi3
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r1, [r7, #0x20]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _0807878C
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0x20]
	adds r1, r0, r1
	str r1, [r7, #0x20]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_0807878C:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _080786AA
_08078794:
	b _0807888A
_08078796:
	ldr r0, [r7, #0x2c]
	str r0, [r7, #0x20]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_080787A0:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _080787AA
	b _0807888A
_080787AA:
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0x2c]
	bl __divsi3
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0x2c]
	bl __divsi3
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_8077944
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl sub_80778FC
	ldr r1, [r7, #0x20]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _08078882
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0x20]
	adds r1, r0, r1
	str r1, [r7, #0x20]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_08078882:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _080787A0
_0807888A:
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8078894
sub_8078894: @ 0x08078894
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080788CC @ =0x0203E638
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl sub_80778C0
	ldr r1, _080788CC @ =0x0203E638
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7, #0xc]
	str r1, [sp]
	ldr r1, [r7]
	bl sub_8078688
	bl SwapScanlineBufs
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080788CC: .4byte 0x0203E638

	thumb_func_start sub_80788D0
sub_80788D0: @ 0x080788D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080788EA
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _080788EA
	bl StartEvent
_080788EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80788F0
sub_80788F0: @ 0x080788F0
	push {lr}
	ldr r0, [r0, #8]
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_80788FC
sub_80788FC: @ 0x080788FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldr r6, _0807890C @ =gUnk_08D668E4
	adds r7, r6, #4
	b _0807891E
	.align 2, 0
_0807890C: .4byte gUnk_08D668E4
_08078910:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
_0807891E:
	ldr r0, [r4]
	ldrh r5, [r0]
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078910
	lsls r0, r5, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	cmp r0, #1
	bne _08078910
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _08078948
	movs r0, #0
	b _0807894A
_08078948:
	adds r0, r4, #0
_0807894A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078950
sub_8078950: @ 0x08078950
	push {r4, lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _0807895C
	movs r0, #0
	b _08078976
_0807895C:
	ldr r2, [r3]
	ldr r0, _0807897C @ =gUnk_08D668E4
	ldrh r4, [r2]
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r3, #0
	bl sub_80788FC
_08078976:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807897C: .4byte gUnk_08D668E4

	thumb_func_start sub_8078980
sub_8078980: @ 0x08078980
	movs r0, #1
	bx lr

	thumb_func_start sub_8078984
sub_8078984: @ 0x08078984
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807899A
	movs r0, #0
	b _080789A6
_0807899A:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_080789A6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80789AC
sub_80789AC: @ 0x080789AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _080789E0 @ =0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080789E4
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080789E4
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _080789E6
	.align 2, 0
_080789E0: .4byte 0xFFFF0000
_080789E4:
	movs r0, #0
_080789E6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80789EC
sub_80789EC: @ 0x080789EC
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r1, _08078A10 @ =gBmSt
	ldrb r5, [r1, #0x14]
	ldrb r4, [r1, #0x16]
	adds r6, r4, #0
	ldr r0, [r0]
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _08078A6C
	ldrh r0, [r0]
	cmp r0, #0xf
	beq _08078A14
	cmp r0, #0x10
	beq _08078A3C
_08078A0A:
	movs r0, #1
	b _08078A82
	.align 2, 0
_08078A10: .4byte gBmSt
_08078A14:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08078A80
_08078A1A:
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	cmp r5, r1
	bne _08078A2A
	ldrb r0, [r0, #1]
	cmp r6, r0
	beq _08078A0A
_08078A2A:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08078A1A
	b _08078A80
_08078A3C:
	ldr r0, _08078A68 @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _08078A80
	ldrb r0, [r2]
	cmp r5, r0
	blo _08078A80
	ldrb r1, [r2, #1]
	cmp r4, r1
	blo _08078A80
	ldrb r0, [r2, #4]
	cmp r5, r0
	bhi _08078A80
	ldrb r2, [r2, #5]
	cmp r4, r2
	bhi _08078A80
	b _08078A0A
	.align 2, 0
_08078A68: .4byte gBmMapMovement
_08078A6C:
	ldr r0, _08078A88 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r5, r0
	bne _08078A80
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r6, r0
	beq _08078A0A
_08078A80:
	movs r0, #0
_08078A82:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08078A88: .4byte gActiveUnit

	thumb_func_start sub_8078A8C
sub_8078A8C: @ 0x08078A8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _08078AC0 @ =0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078AC4
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078AC4
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _08078AC6
	.align 2, 0
_08078AC0: .4byte 0xFFFF0000
_08078AC4:
	movs r0, #0
_08078AC6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8078ACC
sub_8078ACC: @ 0x08078ACC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	ldrb r6, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	ldr r0, [r2, #0xc]
	subs r0, #1
	cmp r0, #4
	bhi _08078B80
	lsls r0, r0, #2
	ldr r1, _08078AF8 @ =_08078AFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078AF8: .4byte _08078AFC
_08078AFC: @ jump table
	.4byte _08078B10 @ case 0
	.4byte _08078B20 @ case 1
	.4byte _08078B38 @ case 2
	.4byte _08078B50 @ case 3
	.4byte _08078B68 @ case 4
_08078B10:
	ldr r1, _08078B1C @ =gPlaySt
	ldrb r0, [r1, #0x1b]
	cmp r0, #2
	bne _08078BBC
	b _08078B28
	.align 2, 0
_08078B1C: .4byte gPlaySt
_08078B20:
	ldr r1, _08078B34 @ =gPlaySt
	ldrb r2, [r1, #0x1b]
	cmp r2, #3
	bne _08078BBC
_08078B28:
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08078B74
	b _08078BBC
	.align 2, 0
_08078B34: .4byte gPlaySt
_08078B38:
	ldr r1, _08078B4C @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08078BBC
	ldrb r1, [r1, #0x1b]
	cmp r1, #2
	beq _08078B74
	b _08078BBC
	.align 2, 0
_08078B4C: .4byte gPlaySt
_08078B50:
	ldr r1, _08078B64 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08078BBC
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	beq _08078B74
	b _08078BBC
	.align 2, 0
_08078B64: .4byte gPlaySt
_08078B68:
	ldr r1, _08078B94 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08078BBC
_08078B74:
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078BBC
_08078B80:
	cmp r5, #0
	bne _08078B98
	ldr r0, _08078B94 @ =gPlaySt
	ldrh r1, [r0, #0x10]
	cmp r1, r6
	bne _08078BBC
	ldrb r0, [r0, #0xf]
	cmp r0, r7
	bne _08078BBC
	b _08078BAA
	.align 2, 0
_08078B94: .4byte gPlaySt
_08078B98:
	ldr r1, _08078BB8 @ =gPlaySt
	ldrh r0, [r1, #0x10]
	cmp r0, r6
	blt _08078BBC
	cmp r0, r5
	bgt _08078BBC
	ldrb r1, [r1, #0xf]
	cmp r1, r7
	bne _08078BBC
_08078BAA:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078BBE
	.align 2, 0
_08078BB8: .4byte gPlaySt
_08078BBC:
	movs r0, #0
_08078BBE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078BC4
sub_8078BC4: @ 0x08078BC4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r3, #0xff
	adds r5, r1, #0
	ands r5, r3
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	lsrs r6, r1, #8
	ldr r0, [r2, #0xc]
	adds r1, r0, #0
	ands r1, r3
	cmp r1, #2
	beq _08078C04
	cmp r1, #2
	bhi _08078BEE
	cmp r1, #1
	beq _08078BF4
	b _08078C20
_08078BEE:
	cmp r1, #3
	beq _08078C14
	b _08078C20
_08078BF4:
	ldr r0, _08078C00 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08078C20
	b _08078C3E
	.align 2, 0
_08078C00: .4byte gPlaySt
_08078C04:
	ldr r0, _08078C10 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _08078C20
	b _08078C3E
	.align 2, 0
_08078C10: .4byte gPlaySt
_08078C14:
	lsrs r0, r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078C3E
_08078C20:
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _08078C2A
	cmp r5, #0
	bne _08078C3E
_08078C2A:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _08078C3E
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078C40
_08078C3E:
	movs r0, #0
_08078C40:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078C48
sub_8078C48: @ 0x08078C48
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r2, #8]
	ldrb r5, [r2, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r6, r0, #8
	ldr r1, [r2, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078C86
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _08078C72
	cmp r5, #0
	bne _08078C86
_08078C72:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _08078C86
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078C88
_08078C86:
	movs r0, #0
_08078C88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078C90
sub_8078C90: @ 0x08078C90
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r1, r1, #0x10
	movs r6, #0
	str r6, [r3, #0x10]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _08078CD2
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _08078CD2
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldrh r0, [r4, #2]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	cmp r1, #0x12
	bne _08078CCE
	str r6, [r3, #0x14]
_08078CCE:
	movs r0, #1
	b _08078CD4
_08078CD2:
	movs r0, #0
_08078CD4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078CDC
sub_8078CDC: @ 0x08078CDC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8078C90
	movs r1, #3
	str r1, [r4, #0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078CF0
sub_8078CF0: @ 0x08078CF0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _08078D32
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _08078D32
	movs r0, #1
	str r0, [r2, #4]
	ldrh r0, [r3, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	ldrh r0, [r3, #4]
	str r0, [r2, #0x14]
	ldrh r0, [r3, #6]
	str r0, [r2, #0x10]
	movs r0, #1
	b _08078D34
_08078D32:
	movs r0, #0
_08078D34:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078D3C
sub_8078D3C: @ 0x08078D3C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _08078D78
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _08078D78
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r0, #1
	b _08078D7A
_08078D78:
	movs r0, #0
_08078D7A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8078D80
sub_8078D80: @ 0x08078D80
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _08078DBC
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _08078DBC
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r0, #1
	b _08078DBE
_08078DBC:
	movs r0, #0
_08078DBE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8078DC4
sub_8078DC4: @ 0x08078DC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r3, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	ldrb r2, [r2, #8]
	ldrb r0, [r4, #0x18]
	cmp r2, r0
	bne _08078E18
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r3, r0
	bne _08078E18
	cmp r5, #0x15
	bne _08078E02
	ldr r0, _08078E14 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x71
	bl GetUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08078E18
_08078E02:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	movs r0, #1
	b _08078E1A
	.align 2, 0
_08078E14: .4byte gActiveUnit
_08078E18:
	movs r0, #0
_08078E1A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8078E20
sub_8078E20: @ 0x08078E20
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08078E78 @ =gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x11]
	mov ip, r0
	ldr r3, [r5]
	ldr r1, [r3, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r4, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r7, r0, #0x10
	lsrs r6, r1, #0x18
	movs r0, #8
	ldrsb r0, [r3, r0]
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r0, r2
	bgt _08078E7C
	lsls r1, r4, #0x18
	mov r4, ip
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
	cmp r1, r0
	bgt _08078E7C
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	blt _08078E7C
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	blt _08078E7C
	ldr r0, [r3, #4]
	str r0, [r5, #4]
	ldrh r0, [r3, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _08078E7E
	.align 2, 0
_08078E78: .4byte gActiveUnit
_08078E7C:
	movs r0, #0
_08078E7E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078E84
sub_8078E84: @ 0x08078E84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078EA4 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _08078EA8
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078EA8
	adds r0, r4, #0
	bl sub_8078E20
	b _08078EAA
	.align 2, 0
_08078EA4: .4byte gPlaySt
_08078EA8:
	movs r0, #0
_08078EAA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8078EB0
sub_8078EB0: @ 0x08078EB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078ED0 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08078ED4
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078ED4
	adds r0, r4, #0
	bl sub_8078E20
	b _08078ED6
	.align 2, 0
_08078ED0: .4byte gPlaySt
_08078ED4:
	movs r0, #0
_08078ED6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8078EDC
sub_8078EDC: @ 0x08078EDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078EF4
	movs r0, #0
	b _08078F00
_08078EF4:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_08078F00:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078F08
sub_8078F08: @ 0x08078F08
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r3, #0x1a]
	cmp r0, r1
	bne _08078F2C
	ldrb r0, [r3, #0x1b]
	cmp r0, r2
	bne _08078F2C
	ldr r0, [r3]
	ldr r1, [r0, #4]
	str r1, [r3, #4]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	movs r0, #1
	b _08078F2E
_08078F2C:
	movs r0, #0
_08078F2E:
	bx lr

	thumb_func_start sub_8078F30
sub_8078F30: @ 0x08078F30
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, _08078F58 @ =gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r1, r0
	blt _08078F5C
	cmp r1, r4
	bgt _08078F5C
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r1, r5
	blt _08078F5C
	cmp r1, r3
	bgt _08078F5C
	movs r0, #1
	b _08078F5E
	.align 2, 0
_08078F58: .4byte gActiveUnit
_08078F5C:
	movs r0, #0
_08078F5E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8078F64
sub_8078F64: @ 0x08078F64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #1
_08078F74:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08078FB0
	ldr r0, [r2]
	cmp r0, #0
	beq _08078FB0
	ldr r0, [r2, #0xc]
	ldr r1, _08078FAC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08078FB0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _08078FB0
	cmp r0, r6
	bgt _08078FB0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _08078FB0
	cmp r0, r5
	bgt _08078FB0
	movs r0, #1
	b _08078FB8
	.align 2, 0
_08078FAC: .4byte 0x00010004
_08078FB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _08078F74
	movs r0, #0
_08078FB8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078FC4
sub_8078FC4: @ 0x08078FC4
	push {lr}
	ldr r0, _08078FE4 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078FE8
	movs r0, #0
	movs r1, #0xf
	movs r2, #0x19
	movs r3, #0x17
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078FE8
	movs r0, #1
	b _08078FEA
	.align 2, 0
_08078FE4: .4byte gPlaySt
_08078FE8:
	movs r0, #0
_08078FEA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078FF0
sub_8078FF0: @ 0x08078FF0
	push {lr}
	ldr r0, _08079034 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08079030
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x1b
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079038
	movs r0, #0
	movs r1, #0x15
	movs r2, #2
	movs r3, #0x17
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079038
	movs r0, #3
	movs r1, #0x14
	movs r2, #5
	movs r3, #0x16
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079038
_08079030:
	movs r0, #0
	b _0807903A
	.align 2, 0
_08079034: .4byte gPlaySt
_08079038:
	movs r0, #1
_0807903A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079040
sub_8079040: @ 0x08079040
	push {lr}
	movs r0, #0xc
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x18
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079058
sub_8079058: @ 0x08079058
	push {lr}
	ldr r0, _08079074 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08079078
	movs r0, #0x11
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x23
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807907A
	.align 2, 0
_08079074: .4byte gPlaySt
_08079078:
	movs r0, #0
_0807907A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079080
sub_8079080: @ 0x08079080
	push {lr}
	ldr r0, _0807909C @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080790A0
	movs r0, #0
	movs r1, #0xf
	movs r2, #8
	movs r3, #0x12
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080790A2
	.align 2, 0
_0807909C: .4byte gPlaySt
_080790A0:
	movs r0, #0
_080790A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80790A8
sub_80790A8: @ 0x080790A8
	push {lr}
	ldr r0, _080790C4 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080790C8
	movs r0, #0
	movs r1, #0x18
	movs r2, #0xc
	movs r3, #0x1b
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080790CA
	.align 2, 0
_080790C4: .4byte gPlaySt
_080790C8:
	movs r0, #0
_080790CA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80790D0
sub_80790D0: @ 0x080790D0
	push {lr}
	ldr r0, _080790EC @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080790F0
	movs r0, #0x15
	movs r1, #0
	movs r2, #0x1e
	movs r3, #6
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080790F2
	.align 2, 0
_080790EC: .4byte gPlaySt
_080790F0:
	movs r0, #0
_080790F2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80790F8
sub_80790F8: @ 0x080790F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #0x81
_08079108:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08079144
	ldr r0, [r2]
	cmp r0, #0
	beq _08079144
	ldr r0, [r2, #0xc]
	ldr r1, _08079140 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08079144
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _08079144
	cmp r0, r6
	bgt _08079144
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _08079144
	cmp r0, r5
	bgt _08079144
	movs r0, #1
	b _0807914C
	.align 2, 0
_08079140: .4byte 0x00010004
_08079144:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079108
	movs r0, #0
_0807914C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAvailableTurnEvent
CheckAvailableTurnEvent: @ 0x08079158
	push {lr}
	sub sp, #0x1c
	ldr r0, _0807917C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	bne _08079180
	movs r0, #0
	b _08079182
	.align 2, 0
_0807917C: .4byte gPlaySt
_08079180:
	movs r0, #1
_08079182:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start StartAvailableTurnEvents
StartAvailableTurnEvents: @ 0x08079188
	push {lr}
	sub sp, #0x1c
	ldr r0, _080791B0 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _080791C4
	mov r0, sp
	bl sub_80788D0
	b _080791BA
	.align 2, 0
_080791B0: .4byte gPlaySt
_080791B4:
	mov r0, sp
	bl sub_80788D0
_080791BA:
	mov r0, sp
	bl sub_8078950
	cmp r0, #0
	bne _080791B4
_080791C4:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80791CC
sub_80791CC: @ 0x080791CC
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08079200 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_80788FC
	cmp r0, #0
	bne _08079204
	movs r0, #0
	b _08079206
	.align 2, 0
_08079200: .4byte gPlaySt
_08079204:
	movs r0, #1
_08079206:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079210
sub_8079210: @ 0x08079210
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0807924C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_80788FC
	cmp r0, #0
	beq _08079244
	mov r0, sp
	bl sub_80788D0
_08079244:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807924C: .4byte gPlaySt

	thumb_func_start sub_8079250
sub_8079250: @ 0x08079250
	push {r4, r5, r6, r7, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	ldr r0, _08079264 @ =gUnk_08D67934
	b _08079292
	.align 2, 0
_08079264: .4byte gUnk_08D67934
_08079268:
	adds r2, r1, #0
	ldrb r1, [r0, #1]
	cmp r2, r7
	bne _08079274
	cmp r1, r6
	beq _0807927C
_08079274:
	cmp r1, r7
	bne _08079290
	cmp r2, r6
	bne _08079290
_0807927C:
	cmp r4, #1
	bne _08079282
	ldr r5, [r0, #4]
_08079282:
	cmp r4, #2
	bne _08079288
	ldr r5, [r0, #8]
_08079288:
	cmp r4, #3
	bne _08079298
	ldr r5, [r0, #0xc]
	b _08079298
_08079290:
	adds r0, #0x14
_08079292:
	ldrb r1, [r0]
	cmp r1, #0
	bne _08079268
_08079298:
	cmp r5, #0
	beq _080792BC
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_807931C
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_800EC9C
	bl sub_800AD60
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_809F88C
_080792BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80792C4
sub_80792C4: @ 0x080792C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r5, #0
	ldr r1, _080792D4 @ =gUnk_08D67934
	b _08079302
	.align 2, 0
_080792D4: .4byte gUnk_08D67934
_080792D8:
	adds r0, r3, #0
	ldrb r3, [r1, #1]
	cmp r0, r6
	bne _080792E4
	cmp r3, r4
	beq _080792EC
_080792E4:
	cmp r3, r6
	bne _08079300
	cmp r0, r4
	bne _08079300
_080792EC:
	cmp r2, #1
	bne _080792F2
	ldr r5, [r1, #4]
_080792F2:
	cmp r2, #2
	bne _080792F8
	ldr r5, [r1, #8]
_080792F8:
	cmp r2, #3
	bne _08079308
	ldr r5, [r1, #0xc]
	b _08079308
_08079300:
	adds r1, #0x14
_08079302:
	ldrb r3, [r1]
	cmp r3, #0
	bne _080792D8
_08079308:
	cmp r5, #0
	beq _08079316
	adds r0, r5, #0
	bl sub_800ECD4
	bl sub_800AD60
_08079316:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_807931C
sub_807931C: @ 0x0807931C
	push {r4, r5, lr}
	adds r5, r3, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	bne _08079352
	ldr r2, _08079334 @ =gUnk_08D67934
	b _0807933A
	.align 2, 0
_08079334: .4byte gUnk_08D67934
_08079338:
	adds r2, #0x14
_0807933A:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08079352
	ldrb r1, [r2, #1]
	cmp r0, r4
	bne _0807934A
	cmp r1, r3
	beq _08079352
_0807934A:
	cmp r1, r4
	bne _08079338
	cmp r0, r3
	bne _08079338
_08079352:
	ldr r1, [r2, #0x10]
	cmp r1, #0
	beq _08079398
	subs r0, r5, #1
	lsls r0, r0, #3
	adds r3, r1, #0
	lsrs r3, r0
	movs r0, #0xff
	ands r3, r0
	cmp r3, #4
	bhi _08079398
	lsls r0, r3, #2
	ldr r1, _08079374 @ =_08079378
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079374: .4byte _08079378
_08079378: @ jump table
	.4byte _08079398 @ case 0
	.4byte _0807938C @ case 1
	.4byte _08079390 @ case 2
	.4byte _08079394 @ case 3
	.4byte _08079394 @ case 4
_0807938C:
	movs r0, #0x41
	b _0807939A
_08079390:
	movs r0, #0x4c
	b _0807939A
_08079394:
	movs r0, #0x6a
	b _0807939A
_08079398:
	movs r0, #0
_0807939A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80793A0
sub_80793A0: @ 0x080793A0
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080793D4 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_80788FC
	cmp r0, #0
	beq _080793D8
	ldr r0, [sp, #0xc]
	b _080793DA
	.align 2, 0
_080793D4: .4byte gPlaySt
_080793D8:
	movs r0, #0
_080793DA:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80793E4
sub_80793E4: @ 0x080793E4
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08079428 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_80788FC
	cmp r0, #0
	bne _08079414
	b _080795C2
_08079414:
	ldr r0, [sp, #0xc]
	cmp r0, #0x1d
	bls _0807941C
	b _080795C2
_0807941C:
	lsls r0, r0, #2
	ldr r1, _0807942C @ =_08079430
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079428: .4byte gPlaySt
_0807942C: .4byte _08079430
_08079430: @ jump table
	.4byte _080795C0 @ case 0
	.4byte _080795C2 @ case 1
	.4byte _080795C2 @ case 2
	.4byte _080795C2 @ case 3
	.4byte _080795C2 @ case 4
	.4byte _080795C2 @ case 5
	.4byte _080795C2 @ case 6
	.4byte _080795C2 @ case 7
	.4byte _080795C2 @ case 8
	.4byte _080795C2 @ case 9
	.4byte _080795C2 @ case 10
	.4byte _080795C2 @ case 11
	.4byte _080795C2 @ case 12
	.4byte _080795C2 @ case 13
	.4byte _080794A8 @ case 14
	.4byte _080794A8 @ case 15
	.4byte _080794D8 @ case 16
	.4byte _080794D8 @ case 17
	.4byte _0807950A @ case 18
	.4byte _0807958C @ case 19
	.4byte _0807959C @ case 20
	.4byte _080795AC @ case 21
	.4byte _080795BC @ case 22
	.4byte _080795C2 @ case 23
	.4byte _080795C2 @ case 24
	.4byte _080795C2 @ case 25
	.4byte _080795C2 @ case 26
	.4byte _080795C2 @ case 27
	.4byte _080795C2 @ case 28
	.4byte _080794B6 @ case 29
_080794A8:
	mov r0, sp
	bl sub_80788D0
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _080794B6
	b _080795C2
_080794B6:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_800EF34
_080794D2:
	bl sub_800AD60
	b _080795C2
_080794D8:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _08079502
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_800EF34
	ldr r0, [sp, #8]
	bl SetFlag
	b _080794D2
_08079502:
	mov r0, sp
	bl sub_80788D0
	b _080794D2
_0807950A:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	bne _08079534
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_800EF34
	mov r0, sp
	bl sub_80788D0
	b _08079580
_08079534:
	cmp r4, #0x76
	beq _0807955E
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_800EF50
	b _08079580
_0807955E:
	ldr r4, [sp, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_800EF78
_08079580:
	bl sub_800AD60
	ldr r0, [sp, #8]
	bl SetFlag
	b _080795C2
_0807958C:
	ldr r0, _08079598 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B11FC
	b _080795C2
	.align 2, 0
_08079598: .4byte gActiveUnit
_0807959C:
	ldr r0, _080795A8 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B121C
	b _080795C2
	.align 2, 0
_080795A8: .4byte gActiveUnit
_080795AC:
	ldr r0, _080795B8 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B123C
	b _080795C2
	.align 2, 0
_080795B8: .4byte gActiveUnit
_080795BC:
	mov r8, r8
	b _080795C2
_080795C0:
	mov r8, r8
_080795C2:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80795CC
sub_80795CC: @ 0x080795CC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793E4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80795E0
sub_80795E0: @ 0x080795E0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0xe
	beq _080795F6
	movs r0, #0
	b _080795F8
_080795F6:
	movs r0, #1
_080795F8:
	pop {r1}
	bx r1

	thumb_func_start sub_80795FC
sub_80795FC: @ 0x080795FC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80795E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807961C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_0807961C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079624
sub_8079624: @ 0x08079624
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r0, #0x18
	asrs r5, r0, #0x18
	lsrs r7, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793A0
	cmp r0, #0x13
	beq _08079680
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793A0
	cmp r0, #0x14
	beq _08079680
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793A0
	cmp r0, #0x15
	bne _08079668
	ldr r0, _0807967C @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x71
	bl GetUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08079680
_08079668:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x16
	beq _08079680
	movs r0, #0
	b _08079682
	.align 2, 0
_0807967C: .4byte gActiveUnit
_08079680:
	movs r0, #1
_08079682:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8079688
sub_8079688: @ 0x08079688
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8079624
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080796A8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_080796A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80796B0
sub_80796B0: @ 0x080796B0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x12
	beq _080796C6
	movs r0, #0
	b _080796C8
_080796C6:
	movs r0, #1
_080796C8:
	pop {r1}
	bx r1

	thumb_func_start sub_80796CC
sub_80796CC: @ 0x080796CC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80796B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080796EC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_080796EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80796F4
sub_80796F4: @ 0x080796F4
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x10
	beq _0807970A
	movs r0, #0
	b _0807970C
_0807970A:
	movs r0, #1
_0807970C:
	pop {r1}
	bx r1

	thumb_func_start sub_8079710
sub_8079710: @ 0x08079710
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80796F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079730
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_08079730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079738
sub_8079738: @ 0x08079738
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x11
	beq _0807974E
	movs r0, #0
	b _08079750
_0807974E:
	movs r0, #1
_08079750:
	pop {r1}
	bx r1

	thumb_func_start sub_8079754
sub_8079754: @ 0x08079754
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8079738
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079774
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_08079774:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807977C
sub_807977C: @ 0x0807977C
	push {lr}
	bl sub_8079990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807978C
sub_807978C: @ 0x0807978C
	push {lr}
	bl sub_80799A0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079798
sub_8079798: @ 0x08079798
	push {lr}
	sub sp, #0x1c
	ldr r0, _080797CC @ =gPlaySt
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080797D0 @ =gUnk_08D6696C
	lsls r0, r1, #4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp]
	cmp r1, #0xb
	bhi _080797C4
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _080797C4
	mov r0, sp
	bl sub_80788D0
_080797C4:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_080797CC: .4byte gPlaySt
_080797D0: .4byte gUnk_08D6696C

	thumb_func_start sub_80797D4
sub_80797D4: @ 0x080797D4
	push {r4, lr}
	sub sp, #0x1c
	ldr r0, _08079818 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0807981C @ =gUnk_08D6696C
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r4, #0xb
	bhi _08079820
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _08079820
	mov r0, sp
	bl sub_80788D0
	cmp r4, #1
	bne _08079820
	bl sub_807D97C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079820
	movs r0, #1
	b _08079822
	.align 2, 0
_08079818: .4byte gPlaySt
_0807981C: .4byte gUnk_08D6696C
_08079820:
	movs r0, #0
_08079822:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807982C
sub_807982C: @ 0x0807982C
	push {lr}
	sub sp, #0x1c
	ldr r0, _0807986C @ =gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079870 @ =gUnk_08D6696C
	lsls r1, r2, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _0807987A
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _0807987A
	mov r0, sp
	bl sub_80789EC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08079874
	mov r0, sp
	bl sub_80788D0
	movs r0, #1
	b _0807987C
	.align 2, 0
_0807986C: .4byte gPlaySt
_08079870: .4byte gUnk_08D6696C
_08079874:
	mov r0, sp
	bl sub_80788F0
_0807987A:
	movs r0, #0
_0807987C:
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079884
sub_8079884: @ 0x08079884
	movs r0, #0
	bx lr

	thumb_func_start sub_8079888
sub_8079888: @ 0x08079888
	movs r0, #0
	bx lr

	thumb_func_start sub_807988C
sub_807988C: @ 0x0807988C
	movs r0, #0
	bx lr

	thumb_func_start sub_8079890
sub_8079890: @ 0x08079890
	movs r0, #0
	bx lr

	thumb_func_start sub_8079894
sub_8079894: @ 0x08079894
	push {lr}
	sub sp, #0x1c
	ldr r0, _080798CC @ =gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080798D0 @ =gUnk_08D6696C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _080798C2
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _080798C2
	mov r0, sp
	bl sub_80788D0
_080798C2:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_080798CC: .4byte gPlaySt
_080798D0: .4byte gUnk_08D6696C

	thumb_func_start sub_80798D4
sub_80798D4: @ 0x080798D4
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079900 @ =gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079904 @ =gUnk_08D6696C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _08079908
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _08079908
	movs r0, #1
	b _0807990A
	.align 2, 0
_08079900: .4byte gPlaySt
_08079904: .4byte gUnk_08D6696C
_08079908:
	movs r0, #0
_0807990A:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start sub_8079910
sub_8079910: @ 0x08079910
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079940 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _08079944 @ =gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	bne _08079948
	movs r0, #0
	b _0807994A
	.align 2, 0
_08079940: .4byte gPlaySt
_08079944: .4byte gActiveUnit
_08079948:
	movs r0, #1
_0807994A:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start sub_8079950
sub_8079950: @ 0x08079950
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079988 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _0807998C @ =gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _08079982
	mov r0, sp
	bl sub_80788D0
_08079982:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
_08079988: .4byte gPlaySt
_0807998C: .4byte gActiveUnit

	thumb_func_start sub_8079990
sub_8079990: @ 0x08079990
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_80799A0
sub_80799A0: @ 0x080799A0
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080799BC
	bl sub_807977C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080799BC
	bl sub_807A208
_080799BC:
	pop {r0}
	bx r0

	thumb_func_start sub_80799C0
sub_80799C0: @ 0x080799C0
	push {r4, lr}
	ldr r4, _080799D8 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	beq _080799DC
	ldr r0, [r0, #0x10]
	b _080799DE
	.align 2, 0
_080799D8: .4byte gPlaySt
_080799DC:
	ldr r0, [r0, #0x14]
_080799DE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80799E4
sub_80799E4: @ 0x080799E4
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _08079A18 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventInfo
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	cmp r0, #0x27
	bne _08079A02
	bl sub_807E514
_08079A02:
	ldrb r0, [r5, #0x1b]
	cmp r0, #3
	bne _08079A20
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _08079A1C
	ldr r0, [r4, #0x24]
	b _08079A2C
	.align 2, 0
_08079A18: .4byte gPlaySt
_08079A1C:
	ldr r0, [r4, #0x20]
	b _08079A2C
_08079A20:
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _08079A34
	ldr r0, [r4, #0x1c]
_08079A2C:
	str r0, [sp, #4]
	bl LoadUnits
	b _08079A3C
_08079A34:
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	bl LoadUnits
_08079A3C:
	bl sub_807A198
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8079A50
sub_8079A50: @ 0x08079A50
	push {r4, lr}
	ldr r4, _08079A74 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	adds r1, r0, #0
	ldrb r0, [r4, #0x1b]
	cmp r0, #3
	bne _08079A7C
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	beq _08079A78
	ldr r0, [r1, #0x34]
	b _08079A8C
	.align 2, 0
_08079A74: .4byte gPlaySt
_08079A78:
	ldr r0, [r1, #0x30]
	b _08079A8C
_08079A7C:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _08079A8A
	ldr r0, [r1, #0x28]
	b _08079A8C
_08079A8A:
	ldr r0, [r1, #0x2c]
_08079A8C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079A94
sub_8079A94: @ 0x08079A94
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _08079AB0 @ =gUnk_08D66CE0
	ldr r1, _08079AB4 @ =gPlaySt
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08079AE0
	b _08079AE6
	.align 2, 0
_08079AB0: .4byte gUnk_08D66CE0
_08079AB4: .4byte gPlaySt
_08079AB8:
	adds r0, r3, #0
	b _08079AE8
_08079ABC:
	ldrb r2, [r3]
	cmp r5, r2
	bne _08079AC6
	cmp r4, r0
	beq _08079AD0
_08079AC6:
	ldrb r0, [r3, #1]
	cmp r5, r0
	bne _08079ADE
	cmp r4, r2
	bne _08079ADE
_08079AD0:
	ldrb r2, [r3, #2]
	cmp r2, #0x45
	beq _08079AB8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	cmp r0, r2
	beq _08079AB8
_08079ADE:
	adds r3, #0x10
_08079AE0:
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _08079ABC
_08079AE6:
	movs r0, #0
_08079AE8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079AF0
sub_8079AF0: @ 0x08079AF0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08079B2A
_08079AFA:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079B28
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079B28
	ldrb r1, [r4, #1]
	cmp r1, #0x45
	beq _08079B20
	ldr r0, _08079B24 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079B28
_08079B20:
	adds r0, r4, #0
	b _08079B32
	.align 2, 0
_08079B24: .4byte gPlaySt
_08079B28:
	adds r4, #0xc
_08079B2A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079AFA
	movs r0, #0
_08079B32:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8079B38
sub_8079B38: @ 0x08079B38
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08079B72
_08079B42:
	ldr r0, [r4, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079B70
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079B70
	ldrb r1, [r4, #1]
	cmp r1, #0x45
	beq _08079B68
	ldr r0, _08079B6C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079B70
_08079B68:
	adds r0, r4, #0
	b _08079B7A
	.align 2, 0
_08079B6C: .4byte gPlaySt
_08079B70:
	adds r4, #0x10
_08079B72:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079B42
	movs r0, #0
_08079B7A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8079B80
sub_8079B80: @ 0x08079B80
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08079BBA
_08079B8A:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079BB8
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079BB8
	ldrb r1, [r4, #1]
	cmp r1, #0x45
	beq _08079BB0
	ldr r0, _08079BB4 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079BB8
_08079BB0:
	adds r0, r4, #0
	b _08079BC2
	.align 2, 0
_08079BB4: .4byte gPlaySt
_08079BB8:
	adds r4, #0xc
_08079BBA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079B8A
	movs r0, #0
_08079BC2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CheckBattleTalk
CheckBattleTalk: @ 0x08079BC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	adds r0, r4, #0
	bl sub_8079A94
	cmp r0, #0
	beq _08079BEE
	ldr r0, [r0, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079C2C
	b _08079C1E
_08079BEE:
	ldr r6, _08079C24 @ =gUnk_08D66A34
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8079AF0
	cmp r0, #0
	bne _08079C1E
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8079AF0
	cmp r0, #0
	bne _08079C1E
	ldr r1, _08079C28 @ =gUnk_08D67070
	adds r0, r7, #0
	bl sub_8079AF0
	cmp r0, #0
	beq _08079C2C
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079C2C
_08079C1E:
	movs r0, #1
	b _08079C2E
	.align 2, 0
_08079C24: .4byte gUnk_08D66A34
_08079C28: .4byte gUnk_08D67070
_08079C2C:
	movs r0, #0
_08079C2E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start StartBattleTalk
StartBattleTalk: @ 0x08079C34
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r1, #0
	adds r0, r4, #0
	bl sub_8079A94
	adds r5, r0, #0
	cmp r5, #0
	beq _08079C78
	ldr r0, [r5, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079CD8
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _08079C66
	bl sub_800EC84
	b _08079C6C
_08079C66:
	ldr r0, [r5, #8]
	bl StartEvent
_08079C6C:
	bl sub_800AD60
	ldr r0, [r5, #0xc]
	bl SetFlag
	b _08079CD8
_08079C78:
	ldr r5, _08079CAC @ =gUnk_08D66A34
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8079AF0
	adds r4, r0, #0
	cmp r4, #0
	bne _08079C96
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8079AF0
	adds r4, r0, #0
	cmp r4, #0
	beq _08079CB0
_08079C96:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08079CA4
	bl sub_800EC84
	bl sub_800AD60
_08079CA4:
	ldr r0, [r4, #8]
	bl SetFlag
	b _08079CD8
	.align 2, 0
_08079CAC: .4byte gUnk_08D66A34
_08079CB0:
	ldr r1, _08079CE0 @ =gUnk_08D67070
	adds r0, r7, #0
	bl sub_8079AF0
	adds r4, r0, #0
	cmp r4, #0
	beq _08079CD8
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079CD8
	ldr r0, [r4, #4]
	bl sub_800EC84
	bl sub_800AD60
	ldr r0, [r4, #8]
	bl SetFlag
_08079CD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079CE0: .4byte gUnk_08D67070

	thumb_func_start sub_8079CE4
sub_8079CE4: @ 0x08079CE4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r1, _08079D20 @ =gUnk_08D6722C
	adds r0, r4, #0
	bl sub_8079B38
	cmp r0, #0
	bne _08079D1C
	ldr r6, _08079D24 @ =gPlaySt
	ldr r1, _08079D28 @ =gUnk_08D6716C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079D04
	ldr r1, _08079D2C @ =gUnk_08D670AC
_08079D04:
	adds r0, r4, #0
	bl sub_8079B80
	cmp r0, #0
	bne _08079D1C
	ldrb r6, [r6, #0x1b]
	cmp r6, #1
	beq _08079D30
	cmp r5, #0xf
	beq _08079D1C
	cmp r5, #0x15
	bne _08079D30
_08079D1C:
	movs r0, #1
	b _08079D32
	.align 2, 0
_08079D20: .4byte gUnk_08D6722C
_08079D24: .4byte gPlaySt
_08079D28: .4byte gUnk_08D6716C
_08079D2C: .4byte gUnk_08D670AC
_08079D30:
	movs r0, #0
_08079D32:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8079D38
sub_8079D38: @ 0x08079D38
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
_08079D42:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08079DE4
	ldr r0, [r4]
	cmp r0, #0
	beq _08079DE4
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _08079DE4
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079DE4
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #7
	bl sub_80A08B4
	adds r0, r4, #0
	bl UnitKill
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _08079DDC @ =gBattleActor
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _08079D90
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_08079D90:
	ldr r0, _08079DE0 @ =gBattleTarget
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _08079DA2
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_08079DA2:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08079DBA
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_08079DBA:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08079DEA
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _08079DEA
	.align 2, 0
_08079DDC: .4byte gBattleActor
_08079DE0: .4byte gBattleTarget
_08079DE4:
	adds r5, #1
	cmp r5, #0x3f
	ble _08079D42
_08079DEA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079DF4
sub_8079DF4: @ 0x08079DF4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08079E44 @ =gPlaySt
	ldr r1, _08079E48 @ =gUnk_08D6716C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079E06
	ldr r1, _08079E4C @ =gUnk_08D670AC
_08079E06:
	adds r0, r5, #0
	bl sub_8079B80
	adds r4, r0, #0
	cmp r4, #0
	beq _08079E6A
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08079E1C
	bl StartEvent
_08079E1C:
	bl sub_800AD60
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #8]
	cmp r0, #0x65
	bne _08079E50
	movs r0, #0x2b
	movs r1, #0
	bl sub_800376C
	adds r1, r6, #0
	adds r1, #0x41
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	b _08079ECC
	.align 2, 0
_08079E44: .4byte gPlaySt
_08079E48: .4byte gUnk_08D6716C
_08079E4C: .4byte gUnk_08D670AC
_08079E50:
	adds r0, r5, #0
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08079ECC
	movs r0, #0x2c
	movs r1, #0
	bl sub_800376C
	b _08079ECC
_08079E6A:
	ldr r1, _08079E84 @ =gUnk_08D6722C
	adds r0, r5, #0
	bl sub_8079B38
	adds r4, r0, #0
	cmp r4, #0
	beq _08079EB4
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08079E88
	bl sub_800EC84
	b _08079E92
	.align 2, 0
_08079E84: .4byte gUnk_08D6722C
_08079E88:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08079E92
	bl StartEvent
_08079E92:
	bl sub_800AD60
	ldr r0, [r4, #0xc]
	bl SetFlag
	adds r0, r5, #0
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08079EB4
	movs r0, #0x2c
	movs r1, #0
	bl sub_800376C
_08079EB4:
	cmp r5, #0xf
	beq _08079EBE
	cmp r5, #0x15
	beq _08079EC6
	b _08079ECC
_08079EBE:
	movs r0, #0x15
	bl sub_8079D38
	b _08079ECC
_08079EC6:
	movs r0, #0xf
	bl sub_8079D38
_08079ECC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079ED4
sub_8079ED4: @ 0x08079ED4
	push {lr}
	movs r0, #0x65
	bl SetFlag
	movs r0, #0x2b
	movs r1, #0
	bl sub_800376C
	ldr r0, _08079EFC @ =gPlaySt
	adds r0, #0x41
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08079F00 @ =gUnk_08D6F71C
	bl StartEvent
	pop {r0}
	bx r0
	.align 2, 0
_08079EFC: .4byte gPlaySt
_08079F00: .4byte gUnk_08D6F71C

	thumb_func_start sub_8079F04
sub_8079F04: @ 0x08079F04
	movs r0, #0
	bx lr

	thumb_func_start nullsub_61
nullsub_61: @ 0x08079F08
	bx lr
	.align 2, 0

	thumb_func_start nullsub_62
nullsub_62: @ 0x08079F0C
	bx lr
	.align 2, 0

	thumb_func_start sub_8079F10
sub_8079F10: @ 0x08079F10
	movs r0, #0
	bx lr

	thumb_func_start nullsub_63
nullsub_63: @ 0x08079F14
	bx lr
	.align 2, 0

	thumb_func_start sub_8079F18
sub_8079F18: @ 0x08079F18
	movs r0, #0
	bx lr

	thumb_func_start sub_8079F1C
sub_8079F1C: @ 0x08079F1C
	movs r0, #0
	bx lr

	thumb_func_start nullsub_64
nullsub_64: @ 0x08079F20
	bx lr
	.align 2, 0

	thumb_func_start nullsub_65
nullsub_65: @ 0x08079F24
	bx lr
	.align 2, 0

	thumb_func_start nullsub_66
nullsub_66: @ 0x08079F28
	bx lr
	.align 2, 0

	thumb_func_start nullsub_67
nullsub_67: @ 0x08079F2C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_68
nullsub_68: @ 0x08079F30
	bx lr
	.align 2, 0

	thumb_func_start SetChapterFlag
SetChapterFlag: @ 0x08079F34
	adds r3, r0, #0
	cmp r3, #0
	beq _08079F5C
	subs r3, #1
	ldr r1, _08079F60 @ =0x030049F8
	adds r0, r3, #0
	cmp r3, #0
	bge _08079F46
	adds r0, r3, #7
_08079F46:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079F64 @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_08079F5C:
	bx lr
	.align 2, 0
_08079F60: .4byte 0x030049F8
_08079F64: .4byte gUnk_08D66A2C

	thumb_func_start CheckPermanentFlag
CheckPermanentFlag: @ 0x08079F68
	adds r3, r0, #0
	cmp r3, #0
	beq _08079F92
	subs r3, #1
	ldr r1, _08079F98 @ =0x030049F8
	adds r0, r3, #0
	cmp r3, #0
	bge _08079F7A
	adds r0, r3, #7
_08079F7A:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079F9C @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _08079FA0
_08079F92:
	movs r0, #0
	b _08079FA2
	.align 2, 0
_08079F98: .4byte 0x030049F8
_08079F9C: .4byte gUnk_08D66A2C
_08079FA0:
	movs r0, #1
_08079FA2:
	bx lr

	thumb_func_start ClearChapterFlag
ClearChapterFlag: @ 0x08079FA4
	adds r2, r0, #0
	cmp r2, #0
	beq _08079FD2
	subs r2, #1
	ldr r3, _08079FD4 @ =gUnk_08D66A2C
	adds r1, r2, #0
	cmp r2, #0
	bge _08079FB6
	adds r1, r2, #7
_08079FB6:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08079FD8 @ =0x030049F8
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_08079FD2:
	bx lr
	.align 2, 0
_08079FD4: .4byte gUnk_08D66A2C
_08079FD8: .4byte 0x030049F8

	thumb_func_start sub_8079FDC
sub_8079FDC: @ 0x08079FDC
	ldr r1, _08079FEC @ =0x030049F8
	movs r2, #0
	adds r0, r1, #5
_08079FE2:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08079FE2
	bx lr
	.align 2, 0
_08079FEC: .4byte 0x030049F8

	thumb_func_start SetPermanentFlag
SetPermanentFlag: @ 0x08079FF0
	adds r3, r0, #0
	cmp r3, #0x63
	ble _0807A01C
	cmp r3, #0x64
	beq _0807A01C
	subs r3, #0x65
	ldr r1, _0807A020 @ =0x030049F0
	adds r0, r3, #0
	cmp r3, #0
	bge _0807A006
	adds r0, r3, #7
_0807A006:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _0807A024 @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_0807A01C:
	bx lr
	.align 2, 0
_0807A020: .4byte 0x030049F0
_0807A024: .4byte gUnk_08D66A2C

	thumb_func_start CheckChapterFlag
CheckChapterFlag: @ 0x0807A028
	adds r3, r0, #0
	cmp r3, #0x64
	ble _0807A052
	subs r3, #0x65
	ldr r1, _0807A058 @ =0x030049F0
	adds r0, r3, #0
	cmp r3, #0
	bge _0807A03A
	adds r0, r3, #7
_0807A03A:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _0807A05C @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _0807A060
_0807A052:
	movs r0, #0
	b _0807A062
	.align 2, 0
_0807A058: .4byte 0x030049F0
_0807A05C: .4byte gUnk_08D66A2C
_0807A060:
	movs r0, #1
_0807A062:
	bx lr

	thumb_func_start ClearPermanentFlag
ClearPermanentFlag: @ 0x0807A064
	adds r2, r0, #0
	cmp r2, #0x63
	ble _0807A096
	cmp r2, #0x64
	beq _0807A096
	subs r2, #0x65
	ldr r3, _0807A098 @ =gUnk_08D66A2C
	adds r1, r2, #0
	cmp r2, #0
	bge _0807A07A
	adds r1, r2, #7
_0807A07A:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0807A09C @ =0x030049F0
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0807A096:
	bx lr
	.align 2, 0
_0807A098: .4byte gUnk_08D66A2C
_0807A09C: .4byte 0x030049F0

	thumb_func_start sub_807A0A0
sub_807A0A0: @ 0x0807A0A0
	ldr r1, _0807A0B0 @ =0x030049F0
	movs r2, #0
	adds r0, r1, #7
_0807A0A6:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0807A0A6
	bx lr
	.align 2, 0
_0807A0B0: .4byte 0x030049F0

	thumb_func_start SetFlag
SetFlag: @ 0x0807A0B4
	push {lr}
	cmp r0, #0x63
	bgt _0807A0C0
	bl SetChapterFlag
	b _0807A0C4
_0807A0C0:
	bl SetPermanentFlag
_0807A0C4:
	pop {r0}
	bx r0

	thumb_func_start CheckFlag
CheckFlag: @ 0x0807A0C8
	push {lr}
	cmp r0, #0x63
	ble _0807A0D4
	bl CheckChapterFlag
	b _0807A0D8
_0807A0D4:
	bl CheckPermanentFlag
_0807A0D8:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start ClearFlag
ClearFlag: @ 0x0807A0E0
	push {lr}
	cmp r0, #0x63
	bgt _0807A0EC
	bl ClearChapterFlag
	b _0807A0F0
_0807A0EC:
	bl ClearPermanentFlag
_0807A0F0:
	pop {r0}
	bx r0

	thumb_func_start GetPermanentFlagBits
GetPermanentFlagBits: @ 0x0807A0F4
	ldr r0, _0807A0F8 @ =0x030049F0
	bx lr
	.align 2, 0
_0807A0F8: .4byte 0x030049F0

	thumb_func_start sub_807A0FC
sub_807A0FC: @ 0x0807A0FC
	movs r0, #8
	bx lr

	thumb_func_start sub_807A100
sub_807A100: @ 0x0807A100
	ldr r0, _0807A104 @ =0x030049F8
	bx lr
	.align 2, 0
_0807A104: .4byte 0x030049F8

	thumb_func_start sub_807A108
sub_807A108: @ 0x0807A108
	movs r0, #6
	bx lr

	thumb_func_start sub_807A10C
sub_807A10C: @ 0x0807A10C
	ldr r1, _0807A11C @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807A120
	movs r0, #0
	b _0807A122
	.align 2, 0
_0807A11C: .4byte gPlaySt
_0807A120:
	movs r0, #1
_0807A122:
	bx lr

	thumb_func_start sub_807A124
sub_807A124: @ 0x0807A124
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, _0807A14C @ =gUnk_08D68388
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807A158
	ldr r0, [r2]
	ldrb r3, [r0, #4]
	movs r4, #0x80
	lsls r4, r4, #9
_0807A138:
	ldrb r0, [r1, #1]
	cmp r3, r0
	bne _0807A150
	ldr r0, [r2, #0xc]
	ands r0, r4
	cmp r0, #0
	beq _0807A150
	movs r0, #1
	b _0807A15A
	.align 2, 0
_0807A14C: .4byte gUnk_08D68388
_0807A150:
	adds r1, #8
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807A138
_0807A158:
	movs r0, #0
_0807A15A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807A160
sub_807A160: @ 0x0807A160
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0807A16C @ =gUnk_08D6792C
	b _0807A17A
	.align 2, 0
_0807A16C: .4byte gUnk_08D6792C
_0807A170:
	cmp r1, r0
	bne _0807A178
	ldr r0, [r2, #4]
	b _0807A18E
_0807A178:
	adds r2, #8
_0807A17A:
	ldrb r1, [r2]
	cmp r1, #0
	bne _0807A170
	ldr r0, _0807A194 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x14]
_0807A18E:
	pop {r1}
	bx r1
	.align 2, 0
_0807A194: .4byte gPlaySt

	thumb_func_start sub_807A198
sub_807A198: @ 0x0807A198
	push {r4, r5, lr}
	ldr r1, _0807A1E0 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0807A1D8
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0807A1D8
	movs r5, #0x81
_0807A1AE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807A1D2
	ldr r0, [r4]
	cmp r0, #0
	beq _0807A1D2
	ldrb r0, [r0, #4]
	bl sub_807A160
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A1D2
	adds r0, r4, #0
	bl UnitApplyBonusLevels
_0807A1D2:
	adds r5, #1
	cmp r5, #0xbf
	ble _0807A1AE
_0807A1D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A1E0: .4byte gPlaySt

	thumb_func_start sub_807A1E4
sub_807A1E4: @ 0x0807A1E4
	ldr r1, _0807A1EC @ =gUnk_08D68478
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	b _0807A1FC
	.align 2, 0
_0807A1EC: .4byte gUnk_08D68478
_0807A1F0:
	ldrb r0, [r1]
	cmp r0, r2
	bne _0807A1FA
	movs r0, #1
	b _0807A204
_0807A1FA:
	adds r1, #1
_0807A1FC:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807A1F0
	movs r0, #0
_0807A204:
	bx lr
	.align 2, 0

	thumb_func_start sub_807A208
sub_807A208: @ 0x0807A208
	push {lr}
	ldr r0, _0807A228 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x3c]
	bl StartEvent
	movs r0, #0x91
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
_0807A228: .4byte gPlaySt

	thumb_func_start sub_807A22C
sub_807A22C: @ 0x0807A22C
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A25C @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807A254
	bl sub_807AE5C
	cmp r0, #0
	bne _0807A254
	movs r0, #0x9c
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
_0807A254:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A25C: .4byte gPlaySt

	thumb_func_start sub_807A260
sub_807A260: @ 0x0807A260
	push {lr}
	movs r0, #0x8f
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807A26C
sub_807A26C: @ 0x0807A26C
	push {lr}
	movs r0, #0x8f
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A27E
	movs r0, #0
	b _0807A280
_0807A27E:
	movs r0, #1
_0807A280:
	pop {r1}
	bx r1

	thumb_func_start sub_807A284
sub_807A284: @ 0x0807A284
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _0807A2D4 @ =gUnk_08D68480
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A2B8
	adds r4, r1, #0
	adds r4, #0xc
_0807A298:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807A2AE
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0807A2AE:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _0807A298
_0807A2B8:
	cmp r5, #0
	beq _0807A2D8
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _0807A2DA
	.align 2, 0
_0807A2D4: .4byte gUnk_08D68480
_0807A2D8:
	movs r0, #0xff
_0807A2DA:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A2E4
sub_807A2E4: @ 0x0807A2E4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _0807A334 @ =gUnk_08D68498
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A318
	adds r4, r1, #0
	adds r4, #0xc
_0807A2F8:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807A30E
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0807A30E:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _0807A2F8
_0807A318:
	cmp r5, #0
	beq _0807A338
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _0807A33A
	.align 2, 0
_0807A334: .4byte gUnk_08D68498
_0807A338:
	movs r0, #0xff
_0807A33A:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A344
sub_807A344: @ 0x0807A344
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _0807A394 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A378
	adds r4, r1, #0
	adds r4, #0xc
_0807A358:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807A36E
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0807A36E:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _0807A358
_0807A378:
	cmp r5, #0
	beq _0807A398
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _0807A39A
	.align 2, 0
_0807A394: .4byte gUnk_08D684B0
_0807A398:
	movs r0, #0xff
_0807A39A:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A3A4
sub_807A3A4: @ 0x0807A3A4
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A3D8 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A3BC
	adds r1, #0xc
_0807A3B2:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _0807A3B2
_0807A3BC:
	bl GetGameTime
	movs r1, #0xf
	ands r1, r0
	adds r0, r1, #0
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A3D8: .4byte gUnk_08D684B0

	thumb_func_start sub_807A3DC
sub_807A3DC: @ 0x0807A3DC
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A410 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A3F4
	adds r1, #0xc
_0807A3EA:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _0807A3EA
_0807A3F4:
	bl GetGameTime
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A410: .4byte gUnk_08D684B0

	thumb_func_start sub_807A414
sub_807A414: @ 0x0807A414
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A448 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A42C
	adds r1, #0xc
_0807A422:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _0807A422
_0807A42C:
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A448: .4byte gUnk_08D684B0

	thumb_func_start sub_807A44C
sub_807A44C: @ 0x0807A44C
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #1
_0807A452:
	adds r0, r5, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A47A
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A47A
	ldr r0, [r0, #0xc]
	ldr r1, _0807A488 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0807A47A
	ldrb r0, [r2, #4]
	cmp r0, #0x14
	bne _0807A474
	adds r4, #1
_0807A474:
	cmp r0, #0x24
	bne _0807A47A
	adds r4, #1
_0807A47A:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807A452
	cmp r4, #2
	beq _0807A48C
	movs r0, #0
	b _0807A48E
	.align 2, 0
_0807A488: .4byte 0x00010004
_0807A48C:
	movs r0, #1
_0807A48E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A494
sub_807A494: @ 0x0807A494
	push {r4, lr}
	movs r4, #1
_0807A498:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A4C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A4C0
	ldr r0, [r0, #0xc]
	ldr r1, _0807A4BC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0807A4C0
	ldrb r2, [r2, #4]
	cmp r2, #5
	bne _0807A4C0
	movs r0, #1
	b _0807A4C8
	.align 2, 0
_0807A4BC: .4byte 0x00010004
_0807A4C0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A498
	movs r0, #0
_0807A4C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A4D0
sub_807A4D0: @ 0x0807A4D0
	movs r0, #1
	bx lr

	thumb_func_start sub_807A4D4
sub_807A4D4: @ 0x0807A4D4
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4D8
sub_807A4D8: @ 0x0807A4D8
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4DC
sub_807A4DC: @ 0x0807A4DC
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4E0
sub_807A4E0: @ 0x0807A4E0
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4E4
sub_807A4E4: @ 0x0807A4E4
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4E8
sub_807A4E8: @ 0x0807A4E8
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4EC
sub_807A4EC: @ 0x0807A4EC
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4F0
sub_807A4F0: @ 0x0807A4F0
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4F4
sub_807A4F4: @ 0x0807A4F4
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4F8
sub_807A4F8: @ 0x0807A4F8
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4FC
sub_807A4FC: @ 0x0807A4FC
	movs r0, #0
	bx lr

	thumb_func_start sub_807A500
sub_807A500: @ 0x0807A500
	movs r0, #0
	bx lr

	thumb_func_start sub_807A504
sub_807A504: @ 0x0807A504
	movs r0, #0
	bx lr

	thumb_func_start sub_807A508
sub_807A508: @ 0x0807A508
	movs r0, #0
	bx lr

	thumb_func_start sub_807A50C
sub_807A50C: @ 0x0807A50C
	movs r0, #0
	bx lr

	thumb_func_start sub_807A510
sub_807A510: @ 0x0807A510
	movs r0, #0
	bx lr

	thumb_func_start sub_807A514
sub_807A514: @ 0x0807A514
	movs r0, #0
	bx lr

	thumb_func_start sub_807A518
sub_807A518: @ 0x0807A518
	movs r0, #0
	bx lr

	thumb_func_start sub_807A51C
sub_807A51C: @ 0x0807A51C
	movs r0, #0
	bx lr

	thumb_func_start sub_807A520
sub_807A520: @ 0x0807A520
	movs r0, #0
	bx lr

	thumb_func_start sub_807A524
sub_807A524: @ 0x0807A524
	movs r0, #0
	bx lr

	thumb_func_start sub_807A528
sub_807A528: @ 0x0807A528
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_0807A52E:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A54C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A54C
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A54C
	adds r5, #1
_0807A54C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A52E
	cmp r5, #3
	ble _0807A55A
	movs r0, #0
	b _0807A55C
_0807A55A:
	movs r0, #1
_0807A55C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A564
sub_807A564: @ 0x0807A564
	movs r0, #0
	bx lr

	thumb_func_start sub_807A568
sub_807A568: @ 0x0807A568
	push {lr}
	bl sub_808667C
	ldr r0, _0807A58C @ =gPlaySt
	movs r1, #2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _0807A57A
	movs r1, #1
_0807A57A:
	adds r0, r1, #0
	bl GetUnitFromCharId
	movs r1, #0
	bl sub_802D148
	pop {r0}
	bx r0
	.align 2, 0
_0807A58C: .4byte gPlaySt

	thumb_func_start sub_807A590
sub_807A590: @ 0x0807A590
	push {r4, lr}
	movs r4, #1
_0807A594:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A5C2
	ldr r3, [r2]
	cmp r3, #0
	beq _0807A5C2
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A5C2
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _0807A5C2
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #0x13
	ble _0807A5C8
	movs r0, #1
	b _0807A5CA
_0807A5C2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A594
_0807A5C8:
	movs r0, #0
_0807A5CA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807A5D0
sub_807A5D0: @ 0x0807A5D0
	push {r4, lr}
	bl sub_807A620
	movs r4, #1
_0807A5D8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A614
	ldr r3, [r2]
	cmp r3, #0
	beq _0807A614
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A614
	ldr r0, _0807A610 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807A614
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _0807A614
	adds r0, r2, #0
	bl UnitLevelUp
	movs r0, #0x90
	bl SetFlag
	b _0807A61A
	.align 2, 0
_0807A610: .4byte 0x0001000C
_0807A614:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A5D8
_0807A61A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807A620
sub_807A620: @ 0x0807A620
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _0807A63A
_0807A62C:
	cmp r0, #0xc
	bne _0807A638
	adds r0, r4, #0
	bl sub_802C6DC
	subs r4, #8
_0807A638:
	adds r4, #8
_0807A63A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0807A62C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807A648
sub_807A648: @ 0x0807A648
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	thumb_func_start sub_807A654
sub_807A654: @ 0x0807A654
	ldr r0, _0807A668 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807A66C
	movs r0, #1
	b _0807A66E
	.align 2, 0
_0807A668: .4byte gpKeySt
_0807A66C:
	movs r0, #0
_0807A66E:
	bx lr

	thumb_func_start sub_807A670
sub_807A670: @ 0x0807A670
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	thumb_func_start sub_807A67C
sub_807A67C: @ 0x0807A67C
	ldr r0, _0807A690 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807A694
	movs r0, #0
	b _0807A696
	.align 2, 0
_0807A690: .4byte gpKeySt
_0807A694:
	movs r0, #1
_0807A696:
	bx lr

	thumb_func_start sub_807A698
sub_807A698: @ 0x0807A698
	push {lr}
	movs r0, #0
	bl sub_801DEFC
	pop {r0}
	bx r0

	thumb_func_start sub_807A6A4
sub_807A6A4: @ 0x0807A6A4
	push {lr}
	bl GetGold
	ldr r1, _0807A6B8 @ =0x00001388
	adds r0, r0, r1
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_0807A6B8: .4byte 0x00001388

	thumb_func_start sub_807A6BC
sub_807A6BC: @ 0x0807A6BC
	push {r4, lr}
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _0807A6D2
	bl GetGold
	subs r0, r0, r4
	bl SetGold
_0807A6D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807A6D8
sub_807A6D8: @ 0x0807A6D8
	adds r1, r0, #0
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A6E8
	subs r0, r2, #1
	strb r0, [r1, #0x12]
_0807A6E8:
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A6F6
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_0807A6F6:
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A704
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_0807A704:
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A712
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_0807A712:
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A720
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_0807A720:
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A72E
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_0807A72E:
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A73C
	subs r0, r2, #1
	strb r0, [r1, #0x19]
_0807A73C:
	bx lr
	.align 2, 0

	thumb_func_start sub_807A740
sub_807A740: @ 0x0807A740
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitFromCharId
	bl sub_807A6D8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807A754
sub_807A754: @ 0x0807A754
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0807A75C:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A784
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A784
	ldr r0, [r0, #0xc]
	ldr r1, _0807A780 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807A784
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807A784
	movs r0, #1
	b _0807A78C
	.align 2, 0
_0807A780: .4byte 0x0001000C
_0807A784:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A75C
	movs r0, #0
_0807A78C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A794
sub_807A794: @ 0x0807A794
	push {lr}
	movs r0, #9
	bl sub_807A754
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A7A4
sub_807A7A4: @ 0x0807A7A4
	push {lr}
	movs r0, #0x28
	bl sub_807A754
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A7B4
sub_807A7B4: @ 0x0807A7B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0807A7BC:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A7E0
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A7E0
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A7E0
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807A7E0
	movs r0, #1
	b _0807A7E8
_0807A7E0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A7BC
	movs r0, #0
_0807A7E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A7F0
sub_807A7F0: @ 0x0807A7F0
	push {lr}
	movs r0, #0x1a
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A800
sub_807A800: @ 0x0807A800
	push {lr}
	movs r0, #0xe
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A810
sub_807A810: @ 0x0807A810
	push {lr}
	movs r0, #0x28
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A820
sub_807A820: @ 0x0807A820
	push {lr}
	movs r0, #0x25
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A830
sub_807A830: @ 0x0807A830
	push {lr}
	movs r0, #0x23
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A840
sub_807A840: @ 0x0807A840
	push {lr}
	movs r0, #0x14
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A850
sub_807A850: @ 0x0807A850
	push {lr}
	movs r0, #0x24
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A860
sub_807A860: @ 0x0807A860
	push {lr}
	movs r0, #0x1b
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A870
sub_807A870: @ 0x0807A870
	push {lr}
	movs r0, #8
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A880
sub_807A880: @ 0x0807A880
	push {lr}
	movs r0, #0x11
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A890
sub_807A890: @ 0x0807A890
	push {lr}
	movs r0, #0x13
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8A0
sub_807A8A0: @ 0x0807A8A0
	push {lr}
	movs r0, #0x1c
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8B0
sub_807A8B0: @ 0x0807A8B0
	push {lr}
	movs r0, #0x17
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8C0
sub_807A8C0: @ 0x0807A8C0
	push {lr}
	movs r0, #0x2f
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8D0
sub_807A8D0: @ 0x0807A8D0
	push {lr}
	movs r0, #0x18
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8E0
sub_807A8E0: @ 0x0807A8E0
	push {lr}
	movs r0, #0x30
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8F0
sub_807A8F0: @ 0x0807A8F0
	push {lr}
	movs r0, #0xd
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A900
sub_807A900: @ 0x0807A900
	push {lr}
	movs r0, #0x2e
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A910
sub_807A910: @ 0x0807A910
	push {lr}
	movs r0, #0x1d
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A920
sub_807A920: @ 0x0807A920
	push {lr}
	movs r0, #0x31
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A930
sub_807A930: @ 0x0807A930
	push {lr}
	movs r0, #0x33
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A940
sub_807A940: @ 0x0807A940
	push {lr}
	movs r0, #0x15
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A950
sub_807A950: @ 0x0807A950
	push {lr}
	movs r0, #0xf
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A960
sub_807A960: @ 0x0807A960
	push {lr}
	movs r0, #0x36
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A970
sub_807A970: @ 0x0807A970
	push {lr}
	movs r0, #0x22
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A980
sub_807A980: @ 0x0807A980
	push {lr}
	movs r0, #0x27
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A990
sub_807A990: @ 0x0807A990
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0807A998:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A9B2
	ldr r0, [r0]
	cmp r0, #0
	beq _0807A9B2
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0807A9B2
	movs r0, #1
	b _0807A9BA
_0807A9B2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A998
	movs r0, #0
_0807A9BA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A9C0
sub_807A9C0: @ 0x0807A9C0
	push {lr}
	movs r0, #0x11
	bl sub_807A990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A9D0
sub_807A9D0: @ 0x0807A9D0
	push {lr}
	movs r0, #0x13
	bl sub_807A990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A9E0
sub_807A9E0: @ 0x0807A9E0
	push {lr}
	movs r0, #0x1b
	bl sub_807A990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A9F0
sub_807A9F0: @ 0x0807A9F0
	push {r4, lr}
	movs r4, #0x81
_0807A9F4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AA14
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AA14
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AA14
	movs r0, #1
	b _0807AA1C
_0807AA14:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A9F4
	movs r0, #0
_0807AA1C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA24
sub_807AA24: @ 0x0807AA24
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_0807AA2A:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AA4C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AA4C
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AA4C
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807AA4C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807AA2A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA5C
sub_807AA5C: @ 0x0807AA5C
	push {lr}
	bl sub_807A9F0
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807AA6C
	movs r1, #1
_0807AA6C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA74
sub_807AA74: @ 0x0807AA74
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x41
_0807AA7C:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807AAA0
	ldr r2, [r0]
	cmp r2, #0
	beq _0807AAA0
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AAA0
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807AAA0
	movs r0, #1
	b _0807AAA8
_0807AAA0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807AA7C
	movs r0, #0
_0807AAA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AAB0
sub_807AAB0: @ 0x0807AAB0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807AAB6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AADC
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AADC
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807AADC
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0807AADC
	adds r5, #1
_0807AADC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807AAB6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AAEC
sub_807AAEC: @ 0x0807AAEC
	push {r4, lr}
	movs r4, #0x41
_0807AAF0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AB10
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AB10
	ldr r0, [r1, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0807AB10
	movs r0, #0
	b _0807AB18
_0807AB10:
	adds r4, #1
	cmp r4, #0x7f
	ble _0807AAF0
	movs r0, #1
_0807AB18:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AB20
sub_807AB20: @ 0x0807AB20
	push {lr}
	movs r0, #0x45
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB30
sub_807AB30: @ 0x0807AB30
	push {lr}
	movs r0, #0x3b
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB40
sub_807AB40: @ 0x0807AB40
	push {lr}
	movs r0, #0x7f
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB50
sub_807AB50: @ 0x0807AB50
	push {lr}
	movs r0, #0x80
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB60
sub_807AB60: @ 0x0807AB60
	push {lr}
	movs r0, #0x81
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB70
sub_807AB70: @ 0x0807AB70
	push {lr}
	movs r0, #0x82
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB80
sub_807AB80: @ 0x0807AB80
	push {lr}
	movs r0, #0x24
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB90
sub_807AB90: @ 0x0807AB90
	push {lr}
	movs r0, #0x20
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABA0
sub_807ABA0: @ 0x0807ABA0
	push {lr}
	movs r0, #0x2b
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABB0
sub_807ABB0: @ 0x0807ABB0
	push {lr}
	movs r0, #0x37
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABC0
sub_807ABC0: @ 0x0807ABC0
	push {lr}
	movs r0, #0x11
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABD0
sub_807ABD0: @ 0x0807ABD0
	push {lr}
	movs r0, #0x13
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABE0
sub_807ABE0: @ 0x0807ABE0
	push {lr}
	movs r0, #8
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABF0
sub_807ABF0: @ 0x0807ABF0
	push {lr}
	movs r0, #0x4c
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC00
sub_807AC00: @ 0x0807AC00
	push {lr}
	movs r0, #0x65
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC10
sub_807AC10: @ 0x0807AC10
	push {lr}
	movs r0, #0x66
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC20
sub_807AC20: @ 0x0807AC20
	push {lr}
	movs r0, #0xa3
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC30
sub_807AC30: @ 0x0807AC30
	push {lr}
	movs r0, #1
	movs r1, #0x2d
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC44
sub_807AC44: @ 0x0807AC44
	push {lr}
	movs r0, #1
	movs r1, #0x25
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC58
sub_807AC58: @ 0x0807AC58
	push {lr}
	movs r0, #1
	movs r1, #0x1e
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC6C
sub_807AC6C: @ 0x0807AC6C
	push {lr}
	movs r0, #2
	movs r1, #0x2d
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC80
sub_807AC80: @ 0x0807AC80
	push {lr}
	movs r0, #2
	movs r1, #0x31
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC94
sub_807AC94: @ 0x0807AC94
	push {lr}
	movs r0, #2
	movs r1, #0x1f
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807ACA8
sub_807ACA8: @ 0x0807ACA8
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	adds r4, r5, #1
	b _0807ACDA
_0807ACB6:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807ACD8
	ldr r2, [r0]
	cmp r2, #0
	beq _0807ACD8
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807ACD8
	ldrb r2, [r2, #4]
	cmp r2, r7
	bne _0807ACD8
	adds r6, #1
_0807ACD8:
	adds r4, #1
_0807ACDA:
	adds r0, r5, #0
	adds r0, #0x40
	cmp r4, r0
	blt _0807ACB6
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807ACEC
sub_807ACEC: @ 0x0807ACEC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _0807AD18
_0807ACF6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AD14
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AD14
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AD14
	adds r6, #1
_0807AD14:
	adds r4, #1
	adds r0, r5, #0
_0807AD18:
	adds r0, #0x40
	cmp r4, r0
	blt _0807ACF6
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AD28
sub_807AD28: @ 0x0807AD28
	movs r1, #0
	ldr r0, _0807AD38 @ =gPlaySt
	ldrh r0, [r0, #0x10]
	cmp r0, #0x14
	bls _0807AD34
	movs r1, #1
_0807AD34:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD38: .4byte gPlaySt

	thumb_func_start sub_807AD3C
sub_807AD3C: @ 0x0807AD3C
	movs r1, #0
	ldr r0, _0807AD4C @ =gPlaySt
	ldrh r0, [r0, #0x10]
	cmp r0, #0x19
	bls _0807AD48
	movs r1, #1
_0807AD48:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD4C: .4byte gPlaySt

	thumb_func_start sub_807AD50
sub_807AD50: @ 0x0807AD50
	movs r1, #0
	ldr r0, _0807AD60 @ =gPlaySt
	ldrh r0, [r0, #0x10]
	cmp r0, #0x1e
	bls _0807AD5C
	movs r1, #1
_0807AD5C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD60: .4byte gPlaySt

	thumb_func_start sub_807AD64
sub_807AD64: @ 0x0807AD64
	movs r1, #0
	ldr r0, _0807AD74 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807AD70
	movs r1, #1
_0807AD70:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD74: .4byte gPlaySt

	thumb_func_start sub_807AD78
sub_807AD78: @ 0x0807AD78
	movs r1, #0
	ldr r0, _0807AD88 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _0807AD84
	movs r1, #1
_0807AD84:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD88: .4byte gPlaySt

	thumb_func_start sub_807AD8C
sub_807AD8C: @ 0x0807AD8C
	ldr r0, _0807ADA4 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	lsrs r1, r1, #0xe
	movs r0, #1
	bics r0, r1
	bx lr
	.align 2, 0
_0807ADA4: .4byte gActiveUnit

	thumb_func_start sub_807ADA8
sub_807ADA8: @ 0x0807ADA8
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807ADC0 @ =0x0000270F
	cmp r0, r1
	ble _0807ADB8
	movs r2, #1
_0807ADB8:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807ADC0: .4byte 0x0000270F

	thumb_func_start sub_807ADC4
sub_807ADC4: @ 0x0807ADC4
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807ADDC @ =0x00001F3F
	cmp r0, r1
	ble _0807ADD4
	movs r2, #1
_0807ADD4:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807ADDC: .4byte 0x00001F3F

	thumb_func_start sub_807ADE0
sub_807ADE0: @ 0x0807ADE0
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807ADF8 @ =0x0000176F
	cmp r0, r1
	ble _0807ADF0
	movs r2, #1
_0807ADF0:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807ADF8: .4byte 0x0000176F

	thumb_func_start sub_807ADFC
sub_807ADFC: @ 0x0807ADFC
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807AE14 @ =0x00001387
	cmp r0, r1
	ble _0807AE0C
	movs r2, #1
_0807AE0C:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807AE14: .4byte 0x00001387

	thumb_func_start sub_807AE18
sub_807AE18: @ 0x0807AE18
	push {lr}
	bl sub_8009E60
	movs r1, #0
	cmp r0, #1
	bne _0807AE26
	movs r1, #1
_0807AE26:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807AE2C
sub_807AE2C: @ 0x0807AE2C
	ldr r0, _0807AE38 @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807AE38: .4byte gPlaySt

	thumb_func_start sub_807AE3C
sub_807AE3C: @ 0x0807AE3C
	ldr r0, _0807AE48 @ =gPlaySt
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807AE48: .4byte gPlaySt

	thumb_func_start sub_807AE4C
sub_807AE4C: @ 0x0807AE4C
	push {lr}
	movs r0, #0x9b
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AE5C
sub_807AE5C: @ 0x0807AE5C
	ldr r0, _0807AE68 @ =gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807AE68: .4byte gPlaySt

	thumb_func_start sub_807AE6C
sub_807AE6C: @ 0x0807AE6C
	push {lr}
	bl sub_809F9F8
	cmp r0, #0
	beq _0807AE78
	movs r0, #1
_0807AE78:
	pop {r1}
	bx r1

	thumb_func_start sub_807AE7C
sub_807AE7C: @ 0x0807AE7C
	push {lr}
	bl sub_807AA24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _0807AE8E
	movs r0, #0
	b _0807AE90
_0807AE8E:
	movs r0, #1
_0807AE90:
	pop {r1}
	bx r1

	thumb_func_start sub_807AE94
sub_807AE94: @ 0x0807AE94
	movs r1, #0
	ldr r0, _0807AEA4 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807AEA0
	movs r1, #1
_0807AEA0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AEA4: .4byte gPlaySt

	thumb_func_start sub_807AEA8
sub_807AEA8: @ 0x0807AEA8
	push {lr}
	ldr r0, _0807AEC0 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807AEBA
	movs r1, #1
_0807AEBA:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807AEC0: .4byte gActiveUnit

	thumb_func_start sub_807AEC4
sub_807AEC4: @ 0x0807AEC4
	movs r0, #0
	bx lr

	thumb_func_start sub_807AEC8
sub_807AEC8: @ 0x0807AEC8
	push {lr}
	ldr r1, _0807AEEC @ =gPlaySt
	movs r0, #8
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0807AEE2
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0807AEE8
_0807AEE2:
	movs r0, #4
	bl FadeBgmOut
_0807AEE8:
	pop {r0}
	bx r0
	.align 2, 0
_0807AEEC: .4byte gPlaySt

	thumb_func_start sub_807AEF0
sub_807AEF0: @ 0x0807AEF0
	ldr r0, _0807AF08 @ =gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807AF0C
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807AF0C
	movs r0, #0
	b _0807AF0E
	.align 2, 0
_0807AF08: .4byte gPlaySt
_0807AF0C:
	movs r0, #1
_0807AF0E:
	bx lr

	thumb_func_start sub_807AF10
sub_807AF10: @ 0x0807AF10
	movs r1, #0
	ldr r0, _0807AF20 @ =gActionSt
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	bne _0807AF1C
	movs r1, #1
_0807AF1C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AF20: .4byte gActionSt

	thumb_func_start sub_807AF24
sub_807AF24: @ 0x0807AF24
	push {lr}
	movs r0, #0
	bl SetkeyStIgnoredMask
	pop {r0}
	bx r0

	thumb_func_start sub_807AF30
sub_807AF30: @ 0x0807AF30
	push {lr}
	movs r0, #2
	bl NewKeyStSetter
	pop {r0}
	bx r0

	thumb_func_start sub_807AF3C
sub_807AF3C: @ 0x0807AF3C
	push {lr}
	ldr r0, _0807AF4C @ =gUnk_08D6F770
	movs r1, #4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807AF4C: .4byte gUnk_08D6F770

	thumb_func_start sub_807AF50
sub_807AF50: @ 0x0807AF50
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807AF94 @ =gUnk_0843F164
	ldr r4, _0807AF98 @ =gPal + 0x240
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0807AF9C @ =0xFFFFFDC0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AF94: .4byte gUnk_0843F164
_0807AF98: .4byte gPal + 0x240
_0807AF9C: .4byte 0xFFFFFDC0

	thumb_func_start sub_807AFA0
sub_807AFA0: @ 0x0807AFA0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r0, _0807AFC4 @ =gUnk_08D6F7D4
	bl Proc_EndEach
	ldr r0, _0807AFC8 @ =gUnk_0843F164
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0807AFC4: .4byte gUnk_08D6F7D4
_0807AFC8: .4byte gUnk_0843F164

	thumb_func_start sub_807AFCC
sub_807AFCC: @ 0x0807AFCC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _0807B044
	movs r5, #0
	ldr r0, _0807B030 @ =0x0203E644
	ldrb r0, [r0]
	cmp r5, r0
	bge _0807B0D6
	ldr r6, _0807B034 @ =gBmSt
_0807AFE8:
	adds r0, r5, #0
	bl sub_804B95C
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	movs r3, #0xc
	ldrsh r2, [r6, r3]
	subs r4, r1, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807B038 @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807B03C @ =gUnk_08D6F798
	ldr r3, _0807B040 @ =0x00002822
	bl PutOamHiRam
	adds r5, #1
	ldr r0, _0807B030 @ =0x0203E644
	ldrb r0, [r0]
	cmp r5, r0
	blt _0807AFE8
	b _0807B0D6
	.align 2, 0
_0807B030: .4byte 0x0203E644
_0807B034: .4byte gBmSt
_0807B038: .4byte 0x000001FF
_0807B03C: .4byte gUnk_08D6F798
_0807B040: .4byte 0x00002822
_0807B044:
	cmp r1, #1
	bne _0807B094
	ldr r0, _0807B084 @ =gActiveUnit
	ldr r3, [r0]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	ldr r2, _0807B088 @ =gBmSt
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r4, r0, r1
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #1
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807B08C @ =gUnk_08D6F798
	ldr r3, _0807B090 @ =0x00002822
	bl PutOamHiRam
	b _0807B0D6
	.align 2, 0
_0807B084: .4byte gActiveUnit
_0807B088: .4byte gBmSt
_0807B08C: .4byte gUnk_08D6F798
_0807B090: .4byte 0x00002822
_0807B094:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0807B0D6
	ldr r6, _0807B118 @ =gBmSt
	adds r5, r1, #0
_0807B09E:
	ldrb r4, [r5]
	lsls r1, r4, #4
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	subs r4, r1, r0
	ldrb r3, [r5, #1]
	lsls r1, r3, #4
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r2, r1, r0
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807B11C @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807B120 @ =gUnk_08D6F798
	ldr r3, _0807B124 @ =0x00002822
	bl PutOamHiRam
	adds r5, #4
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0807B09E
_0807B0D6:
	bl GetGameTime
	adds r5, r0, #0
	movs r0, #1
	mov sb, r0
	ands r5, r0
	cmp r5, #0
	bne _0807B14C
	mov r6, r8
	adds r6, #0x66
	movs r1, #0
	ldrsh r7, [r6, r1]
	cmp r7, #0
	beq _0807B128
	mov r4, r8
	adds r4, #0x64
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r0, #0x10
	movs r1, #0
	bl sub_807AF50
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807B14C
	strh r5, [r4]
	strh r5, [r6]
	b _0807B14C
	.align 2, 0
_0807B118: .4byte gBmSt
_0807B11C: .4byte 0x000001FF
_0807B120: .4byte gUnk_08D6F798
_0807B124: .4byte 0x00002822
_0807B128:
	mov r4, r8
	adds r4, #0x64
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #0
	movs r1, #0x10
	bl sub_807AF50
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807B14C
	strh r7, [r4]
	mov r1, sb
	strh r1, [r6]
_0807B14C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807B158
sub_807B158: @ 0x0807B158
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0807B1A8 @ =gActiveUnit
	ldr r0, [r6]
	bl sub_8031994
	ldr r4, _0807B1AC @ =0x0203E644
	bl sub_804B950
	strb r0, [r4]
	cmp r5, #0
	bne _0807B1B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807B1CE
	ldr r0, _0807B1B0 @ =gUnk_08D6F7B4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x54]
	movs r0, #0
	bl sub_804B95C
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl sub_801615C
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	b _0807B1CE
	.align 2, 0
_0807B1A8: .4byte gActiveUnit
_0807B1AC: .4byte 0x0203E644
_0807B1B0: .4byte gUnk_08D6F7B4
_0807B1B4:
	ldr r0, _0807B1D4 @ =gUnk_08D6F7B4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x54]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
_0807B1CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B1D4: .4byte gUnk_08D6F7B4

	thumb_func_start sub_807B1D8
sub_807B1D8: @ 0x0807B1D8
	adds r0, #0x64
	movs r1, #0xf
	strh r1, [r0]
	bx lr

	thumb_func_start sub_807B1E0
sub_807B1E0: @ 0x0807B1E0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807B20E
	bl sub_8083B80
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807B21A
	ldr r0, _0807B220 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0807B21A
_0807B20E:
	ldr r0, _0807B224 @ =gUnk_08D6F7B4
	bl Proc_EndEach
	adds r0, r4, #0
	bl Proc_Break
_0807B21A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B220: .4byte gpKeySt
_0807B224: .4byte gUnk_08D6F7B4

	thumb_func_start sub_807B228
sub_807B228: @ 0x0807B228
	push {r4, lr}
	bl sub_8083B80
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0807B23E
	ldr r0, _0807B248 @ =gUnk_08D6F7D4
	movs r1, #3
	bl Proc_Start
_0807B23E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807B248: .4byte gUnk_08D6F7D4

	thumb_func_start sub_807B24C
sub_807B24C: @ 0x0807B24C
	push {r4, r5, r6, r7, lr}
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r5, r0, #0
	movs r7, #0x10
	ldrsb r7, [r5, r7]
	movs r6, #0x11
	ldrsb r6, [r5, r6]
	movs r4, #1
_0807B262:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807B298
	ldr r0, [r2]
	cmp r0, #0
	beq _0807B298
	cmp r2, r5
	beq _0807B298
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _0807B298
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0807B298
	ldr r1, [r2, #0xc]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0807B298
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807B298:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807B262
	bl RefreshUnitSprites
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807B2A8
sub_807B2A8: @ 0x0807B2A8
	push {r4, lr}
	movs r4, #1
_0807B2AC:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807B2CE
	ldr r0, [r2]
	cmp r0, #0
	beq _0807B2CE
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807B2CE
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0807B2CE:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807B2AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B2DC
sub_807B2DC: @ 0x0807B2DC
	push {r4, lr}
	movs r4, #0x41
_0807B2E0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807B2F8
	ldr r0, [r1]
	cmp r0, #0
	beq _0807B2F8
	adds r0, r1, #0
	bl ClearUnit
_0807B2F8:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B2E0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807B304
sub_807B304: @ 0x0807B304
	push {r4, lr}
	movs r4, #0x81
_0807B308:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807B320
	ldr r0, [r1]
	cmp r0, #0
	beq _0807B320
	adds r0, r1, #0
	bl ClearUnit
_0807B320:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B308
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807B32C
sub_807B32C: @ 0x0807B32C
	push {r4, r5, r6, lr}
	movs r4, #0x41
_0807B330:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807B348
	ldr r0, [r1]
	cmp r0, #0
	beq _0807B348
	adds r0, r1, #0
	bl ClearUnit
_0807B348:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B330
	movs r5, #1
	movs r6, #0
_0807B352:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807B392
	ldr r0, [r4]
	cmp r0, #0
	beq _0807B392
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	ldr r0, _0807B3A8 @ =0x0671E00C
	ands r1, r0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0xc]
	strb r6, [r4, #0x1b]
_0807B392:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807B352
	bl RefreshEntityMaps
	bl MU_EndAll
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B3A8: .4byte 0x0671E00C

	thumb_func_start sub_807B3AC
sub_807B3AC: @ 0x0807B3AC
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807B3CA
	bl sub_802D874
	bl sub_806D51C
	movs r0, #0
	strb r0, [r4]
_0807B3CA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807B3D0
sub_807B3D0: @ 0x0807B3D0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807B3F6
	movs r0, #0xff
	strb r0, [r2]
	bl sub_802E834
	bl sub_802D8A8
	bl sub_806D52C
	b _0807B3FA
_0807B3F6:
	bl sub_802E834
_0807B3FA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B400
sub_807B400: @ 0x0807B400
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807B426
	movs r0, #0xff
	strb r0, [r2]
	bl sub_802E804
	bl sub_802D8A8
	bl sub_806D52C
	b _0807B42A
_0807B426:
	bl sub_802E804
_0807B42A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TryLockParentProc
TryLockParentProc: @ 0x0807B430
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryLockProc
	pop {r0}
	bx r0

	thumb_func_start TryUnlockParentProc
TryUnlockParentProc: @ 0x0807B43C
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryUnlockProc
	pop {r0}
	bx r0

	thumb_func_start sub_807B448
sub_807B448: @ 0x0807B448
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r2, _0807B474 @ =gDispIo
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
	pop {r0}
	bx r0
	.align 2, 0
_0807B474: .4byte gDispIo

	thumb_func_start sub_807B478
sub_807B478: @ 0x0807B478
	push {r4, lr}
	movs r0, #0x26
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x25
	bl GetUnitFromCharId
	adds r1, r0, #0
	adds r0, r4, #0
	bl SwapUnitStats
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B498
sub_807B498: @ 0x0807B498
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl sub_8012030
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B4C0
sub_807B4C0: @ 0x0807B4C0
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0x80
	lsls r1, r1, #2
	str r1, [sp]
	subs r1, #0xc0
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl sub_8012030
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start sub_807B4E8
sub_807B4E8: @ 0x0807B4E8
	adds r0, #0x4d
	movs r3, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807B52C @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807B530 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #0x1f
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r3, [r2]
	orrs r0, r3
	strb r0, [r2]
	bx lr
	.align 2, 0
_0807B52C: .4byte gDispIo
_0807B530: .4byte 0x0000FFE0

	thumb_func_start sub_807B534
sub_807B534: @ 0x0807B534
	ldr r2, _0807B554 @ =gDispIo
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
	bx lr
	.align 2, 0
_0807B554: .4byte gDispIo

	thumb_func_start sub_807B558
sub_807B558: @ 0x0807B558
	ldr r2, _0807B574 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_0807B574: .4byte gDispIo

	.align 2, 0
