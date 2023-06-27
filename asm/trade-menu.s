	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B064
sub_0802B064: @ 0x0802B064
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0x90
	lsls r1, r1, #7
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl sub_080AAA50
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_080AAAD0
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl sub_080AAAD0
	ldr r3, _0802B14C @ =gDispIo
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
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	movs r6, #6
	strb r6, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0802B150 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0802B154 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	mov r1, r8
	ldr r0, [r1, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl sub_080054CC
	movs r4, #0x30
	subs r0, r4, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r3, r0, #1
	ldr r5, _0802B158 @ =gBg0Tm
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_08005998
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl sub_080054CC
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r3, r4, #1
	adds r5, #0x30
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_08005998
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B14C: .4byte gDispIo
_0802B150: .4byte 0x0000FFE0
_0802B154: .4byte 0x0000E0FF
_0802B158: .4byte gBg0Tm

	thumb_func_start sub_0802B15C
sub_0802B15C: @ 0x0802B15C
	adds r0, #0x41
	movs r1, #0xff
	strb r1, [r0]
	bx lr

	thumb_func_start sub_0802B164
sub_0802B164: @ 0x0802B164
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x14]
	ldr r0, [r3, #0x40]
	ldr r2, _0802B1D8 @ =0x00FFFF00
	ands r0, r2
	ldr r1, [r4, #0x40]
	ands r1, r2
	cmp r0, r1
	beq _0802B1D0
	adds r5, r3, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r7, r3, #0
	adds r7, #0x42
	cmp r0, #0xff
	beq _0802B1A4
	ldr r0, _0802B1DC @ =0x08C03574
	ldrb r2, [r5]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r2, [r7]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl sub_0804A8B0
_0802B1A4:
	ldr r0, _0802B1DC @ =0x08C03574
	adds r6, r4, #0
	adds r6, #0x42
	adds r4, #0x41
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r2, [r6]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl sub_0804A84C
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r6]
	strb r0, [r7]
_0802B1D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B1D8: .4byte 0x00FFFF00
_0802B1DC: .4byte 0x08C03574

	thumb_func_start sub_0802B1E0
sub_0802B1E0: @ 0x0802B1E0
	push {r4, lr}
	adds r3, r2, #0
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r4, r2, #1
	adds r1, r3, r4
	adds r2, r0, #0
	adds r2, #0x34
	adds r1, r2, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802B212
	cmp r3, #0
	blt _0802B212
	adds r0, r4, r2
	adds r1, r3, r0
_0802B202:
	subs r1, #1
	subs r3, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802B212
	cmp r3, #0
	bge _0802B202
_0802B212:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802B21C
sub_0802B21C: @ 0x0802B21C
	push {r4, r5, r6, r7, lr}
	movs r1, #0
	ldr r7, _0802B24C @ =0x0200278C
_0802B222:
	movs r5, #0
	lsls r0, r1, #2
	adds r6, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r7, r0
_0802B22E:
	adds r0, r4, #0
	movs r1, #7
	bl sub_0800536C
	adds r4, #8
	adds r5, #1
	cmp r5, #4
	ble _0802B22E
	adds r1, r6, #0
	cmp r1, #1
	ble _0802B222
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B24C: .4byte 0x0200278C

	thumb_func_start sub_0802B250
sub_0802B250: @ 0x0802B250
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _0802B31C @ =0x081C94C8
	mov r0, sp
	movs r2, #2
	bl memcpy
	add r4, sp, #4
	ldr r1, _0802B320 @ =0x081C94CA
	adds r0, r4, #0
	movs r2, #2
	bl memcpy
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, _0802B324 @ =0x02022EA0
	ldr r2, _0802B328 @ =0x010000B0
	bl CpuFastSet
	movs r0, #0
	mov r8, r0
	adds r5, #0x2c
	str r5, [sp, #0xc]
_0802B28A:
	movs r7, #0
	mov r1, r8
	lsls r0, r1, #2
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	mov sb, r1
	add r0, r8
	lsls r0, r0, #3
	mov sl, r0
_0802B2A0:
	mov r1, sb
	ldr r0, [r1]
	lsls r4, r7, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r0, r7, #3
	ldr r1, _0802B32C @ =0x0200278C
	adds r0, r0, r1
	mov r1, sl
	adds r6, r1, r0
	adds r0, r6, #0
	bl sub_080053B0
	cmp r5, #0
	beq _0802B2F6
	mov r1, sb
	ldr r0, [r1]
	adds r1, r5, #0
	bl sub_08016F04
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r0, sp
	add r0, r8
	adds r0, #4
	ldrb r0, [r0]
	adds r3, r0, r4
	adds r3, #1
	lsls r3, r3, #5
	adds r3, #1
	mov r0, sp
	add r0, r8
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #1
	ldr r0, _0802B330 @ =gBg0Tm
	adds r3, r3, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080168EC
_0802B2F6:
	adds r7, #1
	cmp r7, #4
	ble _0802B2A0
	ldr r0, [sp, #0x10]
	mov r8, r0
	cmp r0, #1
	ble _0802B28A
	movs r0, #1
	bl EnableBgSync
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B31C: .4byte 0x081C94C8
_0802B320: .4byte 0x081C94CA
_0802B324: .4byte 0x02022EA0
_0802B328: .4byte 0x010000B0
_0802B32C: .4byte 0x0200278C
_0802B330: .4byte gBg0Tm

	thumb_func_start sub_0802B334
sub_0802B334: @ 0x0802B334
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #0
	adds r7, r0, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r6, #0x34
	movs r1, #0x39
	adds r1, r1, r0
	mov r8, r1
	adds r0, #0x3f
	mov ip, r0
_0802B34E:
	movs r3, #0
	lsls r1, r2, #2
	lsls r0, r2, #1
	adds r5, r2, #1
	adds r4, r7, r1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r2, r0, r6
_0802B35E:
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	adds r2, #1
	adds r3, #1
	cmp r3, #4
	ble _0802B35E
	adds r2, r5, #0
	cmp r2, #1
	ble _0802B34E
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0802B390
sub_0802B390: @ 0x0802B390
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r0, _0802B4CC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0802B3DC
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #1
	bne _0802B3DC
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl sub_0802B1E0
	adds r1, r0, #0
	cmp r1, #0
	bge _0802B3C4
	b _0802B4C4
_0802B3C4:
	strb r7, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802B4D0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B3DC
	ldr r0, _0802B4D4 @ =0x00000387
	bl m4aSongNumStart
_0802B3DC:
	ldr r0, _0802B4CC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0802B422
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #0
	bne _0802B422
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_0802B1E0
	adds r1, r0, #0
	cmp r1, #0
	blt _0802B4C4
	movs r0, #1
	strb r0, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802B4D0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B422
	ldr r0, _0802B4D4 @ =0x00000387
	bl m4aSongNumStart
_0802B422:
	ldr r0, _0802B4CC @ =gpKeySt
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802B46C
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802B452
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0802B4C4
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl sub_0802B1E0
	adds r0, #1
	strb r0, [r4]
_0802B452:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r7, #1
	ldr r0, _0802B4D0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B46C
	ldr r0, _0802B4D8 @ =0x00000386
	bl m4aSongNumStart
_0802B46C:
	ldr r0, _0802B4CC @ =gpKeySt
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	mov ip, r1
	movs r0, #0x80
	mov r6, ip
	ands r0, r6
	cmp r0, #0
	beq _0802B4C4
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r3, [r2]
	adds r1, r5, #0
	adds r1, #0x41
	ldrb r6, [r1]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r3, r0
	subs r1, #0xd
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802B4AA
	ldrh r4, [r4, #8]
	cmp ip, r4
	bne _0802B4C4
	movs r0, #0xff
	strb r0, [r2]
_0802B4AA:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r7, #1
	ldr r0, _0802B4D0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B4C4
	ldr r0, _0802B4D8 @ =0x00000386
	bl m4aSongNumStart
_0802B4C4:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B4CC: .4byte gpKeySt
_0802B4D0: .4byte gPlaySt
_0802B4D4: .4byte 0x00000387
_0802B4D8: .4byte 0x00000386

	thumb_func_start sub_0802B4DC
sub_0802B4DC: @ 0x0802B4DC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r3, r4, #0
	adds r3, #0x2c
	adds r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r2, [r1]
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r3, r3, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r1, [r3]
	adds r1, r1, r0
	ldrh r3, [r2]
	ldrh r0, [r1]
	strh r0, [r2]
	strh r3, [r1]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802B540 @ =gActionSt
	movs r0, #0x18
	strb r0, [r1, #0x11]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, [r4, #0x30]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl sub_0802B250
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B540: .4byte gActionSt

	thumb_func_start sub_0802B544
sub_0802B544: @ 0x0802B544
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_0804A4CC
	str r4, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_0804A4CC
	bl sub_08005308
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl sub_0802B21C
	adds r0, r5, #0
	bl sub_0802B250
	ldr r0, [r5, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	subs r4, #4
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl sub_08006AC4
	ldr r0, [r5, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb0
	adds r3, r4, #0
	bl sub_08006AC4
	movs r0, #0
	movs r1, #5
	bl sub_080078F4
	movs r0, #1
	movs r1, #5
	bl sub_080078F4
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802B5D0
sub_0802B5D0: @ 0x0802B5D0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802B334
	adds r4, #0x45
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802B5E4
sub_0802B5E4: @ 0x0802B5E4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0802BD6C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B620
	ldr r2, _0802B61C @ =0x08C03574
	adds r3, r4, #0
	adds r3, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r4, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r5, #0
	ldrsh r0, [r1, r5]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_0804A740
	b _0802B6C6
	.align 2, 0
_0802B61C: .4byte 0x08C03574
_0802B620:
	adds r0, r4, #0
	bl sub_0802B390
	ldr r0, _0802B678 @ =0x08C03574
	adds r3, r4, #0
	adds r3, #0x42
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r5, [r2]
	lsls r1, r5, #2
	adds r1, r1, r5
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r5, #2
	ldrsh r1, [r1, r5]
	lsls r1, r1, #3
	bl sub_0804A740
	ldr r0, _0802B67C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B688
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0802B680 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B6C6
	ldr r0, _0802B684 @ =0x0000038A
	bl m4aSongNumStart
	b _0802B6C6
	.align 2, 0
_0802B678: .4byte 0x08C03574
_0802B67C: .4byte gpKeySt
_0802B680: .4byte gPlaySt
_0802B684: .4byte 0x0000038A
_0802B688:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B6B4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0802B6AC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B6C6
	ldr r0, _0802B6B0 @ =0x0000038B
	bl m4aSongNumStart
	b _0802B6C6
	.align 2, 0
_0802B6AC: .4byte gPlaySt
_0802B6B0: .4byte 0x0000038B
_0802B6B4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B6C6
	ldr r0, _0802B6CC @ =0x08C0366C
	adds r1, r4, #0
	bl Proc_StartBlocking
_0802B6C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B6CC: .4byte 0x08C0366C

	thumb_func_start sub_0802B6D0
sub_0802B6D0: @ 0x0802B6D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x42
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #1
	ldrb r1, [r5]
	eors r0, r1
	strb r0, [r5]
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #4
	bl sub_0802B1E0
	cmp r0, #4
	beq _0802B730
	adds r0, #1
	strb r0, [r6]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r1, [r6]
	adds r0, r1, r0
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x45
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, #1
	strb r0, [r1]
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x47
	strb r1, [r0]
_0802B730:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802B738
sub_0802B738: @ 0x0802B738
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0802BD6C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B79C
	ldr r4, _0802B798 @ =0x08C03574
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A740
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A7EC
	b _0802B862
	.align 2, 0
_0802B798: .4byte 0x08C03574
_0802B79C:
	adds r0, r5, #0
	bl sub_0802B390
	ldr r4, _0802B814 @ =0x08C03574
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A740
	adds r0, r5, #0
	adds r0, #0x44
	adds r2, r5, #0
	adds r2, #0x43
	ldrb r3, [r2]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A7EC
	ldr r0, _0802B818 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B824
	adds r0, r5, #0
	bl sub_0802B4DC
	ldr r0, _0802B81C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B83E
	ldr r0, _0802B820 @ =0x0000038A
	b _0802B83A
	.align 2, 0
_0802B814: .4byte 0x08C03574
_0802B818: .4byte gpKeySt
_0802B81C: .4byte gPlaySt
_0802B820: .4byte 0x0000038A
_0802B824:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B850
	ldr r0, _0802B848 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B83E
	ldr r0, _0802B84C @ =0x0000038B
_0802B83A:
	bl m4aSongNumStart
_0802B83E:
	adds r0, r5, #0
	bl Proc_Break
	b _0802B862
	.align 2, 0
_0802B848: .4byte gPlaySt
_0802B84C: .4byte 0x0000038B
_0802B850:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B862
	ldr r0, _0802B868 @ =0x08C0366C
	adds r1, r5, #0
	bl Proc_StartBlocking
_0802B862:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B868: .4byte 0x08C0366C

	thumb_func_start sub_0802B86C
sub_0802B86C: @ 0x0802B86C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x43
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	adds r6, r4, #0
	adds r6, #0x42
	strb r0, [r6]
	adds r0, r4, #0
	bl sub_0802B334
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802B8AA
	movs r0, #1
	eors r2, r0
	strb r2, [r5]
_0802B8AA:
	ldrb r1, [r5]
	ldrb r2, [r6]
	adds r0, r4, #0
	bl sub_0802B1E0
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0802B8BC
sub_0802B8BC: @ 0x0802B8BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802B8FC @ =gBmSt
	adds r5, r0, #0
	adds r5, #0x3f
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	blt _0802B900
	movs r1, #5
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x41
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #5
	bl __modsi3
	adds r1, r4, #0
	adds r1, #0x42
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_0802B334
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0802B902
	.align 2, 0
_0802B8FC: .4byte gBmSt
_0802B900:
	movs r0, #1
_0802B902:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0802B908
sub_0802B908: @ 0x0802B908
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802B91C
sub_0802B91C: @ 0x0802B91C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x14]
	adds r4, r3, #0
	adds r4, #0x41
	ldrb r0, [r4]
	lsls r1, r0, #2
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r5, r3, #0
	adds r5, #0x42
	ldrb r6, [r5]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r6, #0
	bne _0802B94C
	adds r0, r2, #0
	bl Proc_End
	b _0802B9B2
_0802B94C:
	adds r0, r3, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802B97A
	adds r2, r3, #0
	adds r2, #0x47
	adds r1, r3, #0
	adds r1, #0x46
	ldrb r7, [r1]
	lsls r0, r7, #1
	adds r1, r7, #0
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r1, r3, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0802B97A:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08082F74
	ldr r0, _0802B9B8 @ =0x08C03574
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r5, [r5]
	adds r1, r5, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r7, #0
	ldrsh r0, [r1, r7]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	adds r2, r6, #0
	bl sub_080826EC
	ldr r0, _0802B9BC @ =gpKeySt
	ldr r1, [r0]
	ldr r0, _0802B9C0 @ =0x0000FEFD
	ldrh r6, [r1, #8]
	ands r0, r6
	strh r0, [r1, #8]
_0802B9B2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B9B8: .4byte 0x08C03574
_0802B9BC: .4byte gpKeySt
_0802B9C0: .4byte 0x0000FEFD

	thumb_func_start sub_0802B9C4
sub_0802B9C4: @ 0x0802B9C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_0802B390
	adds r6, r4, #0
	adds r6, #0x41
	ldrb r7, [r6]
	lsls r5, r7, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r5
	ldr r1, [r1]
	movs r2, #0x42
	adds r2, r2, r4
	mov r8, r2
	ldrb r3, [r2]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802BA16
	ldr r0, _0802BA90 @ =0x08C03574
	adds r1, r5, r7
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_080826EC
_0802BA16:
	ldr r0, _0802BA94 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802BA2C
	mov r0, sb
	bl Proc_Break
_0802BA2C:
	ldr r5, _0802BA90 @ =0x08C03574
	ldrb r0, [r6]
	lsls r1, r0, #2
	adds r1, r1, r0
	mov r2, r8
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_0804A740
	adds r0, r4, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802BA82
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A7EC
_0802BA82:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BA90: .4byte 0x08C03574
_0802BA94: .4byte gpKeySt

	thumb_func_start sub_0802BA98
sub_0802BA98: @ 0x0802BA98
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x14]
	adds r5, r4, #0
	adds r5, #0x45
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802BAC4
	adds r2, r4, #0
	adds r2, #0x47
	adds r1, r4, #0
	adds r1, #0x46
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r2, r0
	subs r1, #0x12
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_0802BAC4:
	bl sub_080828A4
	ldr r6, _0802BB24 @ =0x08C03574
	adds r2, r4, #0
	adds r2, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A740
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802BB1E
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A7EC
_0802BB1E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802BB24: .4byte 0x08C03574

	thumb_func_start sub_0802BB28
sub_0802BB28: @ 0x0802BB28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0802BB80 @ =0x08C035B4
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r4, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r5, r2, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r1, #2
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x48
	strb r0, [r4]
	ldr r0, _0802BB84 @ =0x0203A510
	str r2, [r0]
	bl sub_0807A22C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802BB6C
	movs r0, #0xc9
	bl SetkeyStIgnoredMask
	movs r0, #1
	strb r0, [r4]
_0802BB6C:
	adds r0, r6, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _0802BB7A
	movs r0, #1
	strb r0, [r5]
_0802BB7A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802BB80: .4byte 0x08C035B4
_0802BB84: .4byte 0x0203A510

	thumb_func_start sub_0802BB88
sub_0802BB88: @ 0x0802BB88
	ldr r0, _0802BB94 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BB94: .4byte 0x0203A510

	thumb_func_start sub_0802BB98
sub_0802BB98: @ 0x0802BB98
	ldr r0, _0802BBA4 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BBA4: .4byte 0x0203A510

	thumb_func_start sub_0802BBA8
sub_0802BBA8: @ 0x0802BBA8
	ldr r0, _0802BBB4 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BBB4: .4byte 0x0203A510

	thumb_func_start sub_0802BBB8
sub_0802BBB8: @ 0x0802BBB8
	ldr r0, _0802BBC4 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #5
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BBC4: .4byte 0x0203A510

	thumb_func_start sub_0802BBC8
sub_0802BBC8: @ 0x0802BBC8
	ldr r0, _0802BBD4 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #6
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BBD4: .4byte 0x0203A510

	thumb_func_start sub_0802BBD8
sub_0802BBD8: @ 0x0802BBD8
	ldr r0, _0802BBE4 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #7
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BBE4: .4byte 0x0203A510

	thumb_func_start sub_0802BBE8
sub_0802BBE8: @ 0x0802BBE8
	ldr r0, _0802BBF4 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #8
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BBF4: .4byte 0x0203A510

	thumb_func_start sub_0802BBF8
sub_0802BBF8: @ 0x0802BBF8
	push {r4, lr}
	ldr r0, _0802BC2C @ =0x0203A510
	ldr r0, [r0]
	ldr r2, _0802BC30 @ =0x08C03574
	adds r3, r0, #0
	adds r3, #0x42
	adds r0, #0x41
	ldrb r4, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r4, #2
	ldrsh r1, [r1, r4]
	lsls r1, r1, #3
	bl sub_0804A7EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BC2C: .4byte 0x0203A510
_0802BC30: .4byte 0x08C03574

	thumb_func_start sub_0802BC34
sub_0802BC34: @ 0x0802BC34
	push {r4, r5, lr}
	ldr r0, _0802BC90 @ =0x0203A510
	ldr r5, [r0]
	ldr r4, _0802BC94 @ =0x08C03574
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A7EC
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_0804A7EC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BC90: .4byte 0x0203A510
_0802BC94: .4byte 0x08C03574

	thumb_func_start sub_0802BC98
sub_0802BC98: @ 0x0802BC98
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802BCA8 @ =0x08C0368C
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802BCA8: .4byte 0x08C0368C

	thumb_func_start sub_0802BCAC
sub_0802BCAC: @ 0x0802BCAC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802BCBC @ =0x08C036A4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802BCBC: .4byte 0x08C036A4

	thumb_func_start sub_0802BCC0
sub_0802BCC0: @ 0x0802BCC0
	adds r0, #0x4c
	movs r1, #0x14
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0802BCC8
sub_0802BCC8: @ 0x0802BCC8
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802BCE2
	adds r0, r2, #0
	bl Proc_Break
_0802BCE2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802BCE8
sub_0802BCE8: @ 0x0802BCE8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802BD0C @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #3
	beq _0802BD06
	cmp r0, #5
	beq _0802BD06
	cmp r0, #8
	beq _0802BD06
	ldr r0, _0802BD10 @ =0x08C036BC
	bl Proc_StartBlocking
_0802BD06:
	pop {r0}
	bx r0
	.align 2, 0
_0802BD0C: .4byte 0x0203A510
_0802BD10: .4byte 0x08C036BC

	thumb_func_start sub_0802BD14
sub_0802BD14: @ 0x0802BD14
	push {lr}
	adds r1, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802BD26
	ldr r0, _0802BD2C @ =0x08C036D4
	bl sub_0800AEB0
_0802BD26:
	pop {r0}
	bx r0
	.align 2, 0
_0802BD2C: .4byte 0x08C036D4

	thumb_func_start sub_0802BD30
sub_0802BD30: @ 0x0802BD30
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802BD40 @ =0x08C03728
	bl sub_0800AEB0
	pop {r0}
	bx r0
	.align 2, 0
_0802BD40: .4byte 0x08C03728

	thumb_func_start sub_0802BD44
sub_0802BD44: @ 0x0802BD44
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802BD54 @ =0x08C03784
	bl sub_0800AEB0
	pop {r0}
	bx r0
	.align 2, 0
_0802BD54: .4byte 0x08C03784

	thumb_func_start sub_0802BD58
sub_0802BD58: @ 0x0802BD58
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802BD68 @ =0x08C037D8
	bl sub_0800AEB0
	pop {r0}
	bx r0
	.align 2, 0
_0802BD68: .4byte 0x08C037D8

	thumb_func_start sub_0802BD6C
sub_0802BD6C: @ 0x0802BD6C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #4
	beq _0802BD84
	ldr r0, _0802BDA0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	bne _0802BD84
	b _0802BF00
_0802BD84:
	ldr r0, _0802BDA4 @ =0x0203A510
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #6
	bls _0802BD94
	b _0802BF00
_0802BD94:
	lsls r0, r0, #2
	ldr r1, _0802BDA8 @ =_0802BDAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802BDA0: .4byte gpKeySt
_0802BDA4: .4byte 0x0203A510
_0802BDA8: .4byte _0802BDAC
_0802BDAC: @ jump table
	.4byte _0802BDC8 @ case 0
	.4byte _0802BE0C @ case 1
	.4byte _0802BEB0 @ case 2
	.4byte _0802BE80 @ case 3
	.4byte _0802BF00 @ case 4
	.4byte _0802BF00 @ case 5
	.4byte _0802BEC0 @ case 6
_0802BDC8:
	ldr r0, _0802BDE4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802BDE8
	movs r0, #0xc8
	bl SetkeyStIgnoredMask
	adds r0, r4, #0
	bl sub_0802BD30
	b _0802BF00
	.align 2, 0
_0802BDE4: .4byte gpKeySt
_0802BDE8:
	ldr r0, _0802BE08 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802BDFC
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802BDFC:
	adds r0, r4, #0
	movs r1, #0x65
	bl Proc_Goto
	movs r0, #1
	b _0802BF02
	.align 2, 0
_0802BE08: .4byte gPlaySt
_0802BE0C:
	ldr r0, _0802BE58 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x91
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802BE5C
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802BF00
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x6b
	bne _0802BE5C
	movs r0, #0xc8
	bl SetkeyStIgnoredMask
	adds r0, r4, #0
	bl sub_0802BBA8
	b _0802BF00
	.align 2, 0
_0802BE58: .4byte gpKeySt
_0802BE5C:
	ldr r0, _0802BE7C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802BE70
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802BE70:
	adds r0, r4, #0
	bl sub_0802BD30
	movs r0, #1
	b _0802BF02
	.align 2, 0
_0802BE7C: .4byte gPlaySt
_0802BE80:
	ldr r0, _0802BE98 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802BE9C
	adds r0, r4, #0
	bl sub_0802BD58
	b _0802BF00
	.align 2, 0
_0802BE98: .4byte gpKeySt
_0802BE9C:
	ldr r0, _0802BEBC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802BEB0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802BEB0:
	adds r0, r4, #0
	bl sub_0802BD44
	movs r0, #1
	b _0802BF02
	.align 2, 0
_0802BEBC: .4byte gPlaySt
_0802BEC0:
	ldr r0, _0802BED8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802BEDC
	movs r0, #0
	bl SetkeyStIgnoredMask
	b _0802BF00
	.align 2, 0
_0802BED8: .4byte gpKeySt
_0802BEDC:
	ldr r0, _0802BEFC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802BEF0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802BEF0:
	adds r0, r4, #0
	bl sub_0802BD58
	movs r0, #1
	b _0802BF02
	.align 2, 0
_0802BEFC: .4byte gPlaySt
_0802BF00:
	movs r0, #0
_0802BF02:
	pop {r4}
	pop {r1}
	bx r1
