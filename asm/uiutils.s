	.include "macro.inc"
	.syntax unified

	thumb_func_start ApplyUiWindowFramePal
ApplyUiWindowFramePal: @ 0x0804A27C
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _0804A286
	movs r3, #1
_0804A286:
	ldr r2, _0804A2A4 @ =0x08C09B84
	ldr r1, _0804A2A8 @ =gPlaySt
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r3, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0804A2A4: .4byte 0x08C09B84
_0804A2A8: .4byte gPlaySt

	thumb_func_start sub_0804A2AC
sub_0804A2AC: @ 0x0804A2AC
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _0804A2B8
	movs r3, #0xc0
	lsls r3, r3, #0x13
_0804A2B8:
	ldr r2, _0804A2D4 @ =0x08C09B94
	ldr r1, _0804A2D8 @ =gPlaySt
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r3, #0
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_0804A2D4: .4byte 0x08C09B94
_0804A2D8: .4byte gPlaySt

	thumb_func_start sub_0804A2DC
sub_0804A2DC: @ 0x0804A2DC
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _0804A2E6
	movs r3, #6
_0804A2E6:
	ldr r2, _0804A304 @ =0x08C09BA4
	ldr r1, _0804A308 @ =gPlaySt
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r3, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0804A304: .4byte 0x08C09BA4
_0804A308: .4byte gPlaySt

	thumb_func_start sub_0804A30C
sub_0804A30C: @ 0x0804A30C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	cmp r5, #0
	bge _0804A31E
	ldr r0, _0804A354 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1e
_0804A31E:
	ldr r0, _0804A358 @ =0x08C09B94
	lsls r5, r5, #2
	adds r5, r5, r0
	ldr r0, [r5]
	bl sub_080136C8
	adds r6, r0, #0
	ldr r4, _0804A35C @ =gFadeComponentStep
	subs r4, r4, r6
	ldr r0, [r5]
	adds r1, r4, #0
	bl Decompress
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r6, #0
	bl RegisterDataMove
	movs r0, #1
	rsbs r0, r0, #0
	bl ApplyUiWindowFramePal
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A354: .4byte gPlaySt
_0804A358: .4byte 0x08C09B94
_0804A35C: .4byte gFadeComponentStep

	thumb_func_start sub_0804A360
sub_0804A360: @ 0x0804A360
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r2, [sp, #0x34]
	ldr r6, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	ldr r1, _0804A4C8 @ =0x08C09B78
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r0, [sp]
	adds r3, r0, r3
	subs r3, #1
	mov r8, r3
	ldr r1, [sp, #4]
	adds r2, r1, r2
	subs r2, #1
	mov sl, r2
	adds r4, r1, #0
	adds r4, #1
	cmp r4, sl
	bge _0804A3E2
_0804A398:
	ldr r3, [sp]
	adds r3, #1
	adds r2, r4, #2
	str r2, [sp, #0x10]
	cmp r3, r8
	bge _0804A3DC
	lsls r1, r3, #0x10
	lsls r0, r4, #0x15
	adds r4, r1, r0
	movs r7, #0x80
	lsls r7, r7, #0xa
	mov ip, r7
_0804A3B0:
	lsrs r0, r4, #0x10
	lsls r0, r0, #1
	add r0, sb
	ldrh r2, [r5, #0xa]
	adds r1, r2, r6
	strh r1, [r0]
	ldrh r7, [r5, #0xc]
	adds r1, r7, r6
	strh r1, [r0, #2]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r7, [r5, #0x12]
	adds r1, r7, r6
	strh r1, [r2]
	adds r0, #0x42
	ldrh r2, [r5, #0x14]
	adds r1, r2, r6
	strh r1, [r0]
	add r4, ip
	adds r3, #2
	cmp r3, r8
	blt _0804A3B0
_0804A3DC:
	ldr r4, [sp, #0x10]
	cmp r4, sl
	blt _0804A398
_0804A3E2:
	ldr r3, [sp]
	adds r3, #1
	ldr r2, [sp, #4]
	adds r2, #1
	ldr r4, [sp, #4]
	lsls r4, r4, #5
	str r4, [sp, #8]
	mov r7, sl
	lsls r7, r7, #5
	str r7, [sp, #0xc]
	cmp r3, r8
	bge _0804A42E
	lsls r0, r3, #1
	mov r4, sl
	lsls r1, r4, #6
	add r1, sb
	adds r4, r0, r1
	ldr r7, [sp, #4]
	lsls r1, r7, #6
	add r1, sb
	adds r1, r0, r1
_0804A40C:
	ldrh r7, [r5, #2]
	adds r0, r7, r6
	strh r0, [r1]
	ldrh r7, [r5, #4]
	adds r0, r7, r6
	strh r0, [r1, #2]
	ldrh r7, [r5, #0x1a]
	adds r0, r7, r6
	strh r0, [r4]
	ldrh r7, [r5, #0x1c]
	adds r0, r7, r6
	strh r0, [r4, #2]
	adds r4, #4
	adds r1, #4
	adds r3, #2
	cmp r3, r8
	blt _0804A40C
_0804A42E:
	adds r4, r2, #0
	cmp r4, sl
	bge _0804A47E
	lsls r3, r4, #6
	mov r0, r8
	lsls r2, r0, #1
	mov r0, sb
	adds r0, #0x40
	adds r1, r2, r0
	adds r1, r1, r3
	mov ip, r1
	ldr r7, [sp]
	lsls r1, r7, #1
	adds r0, r1, r0
	adds r7, r3, r0
	add r2, sb
	adds r2, r3, r2
	add r1, sb
	adds r3, r3, r1
_0804A454:
	ldrh r1, [r5, #8]
	adds r0, r1, r6
	strh r0, [r3]
	ldrh r1, [r5, #0xe]
	adds r0, r1, r6
	strh r0, [r2]
	ldrh r1, [r5, #0x10]
	adds r0, r1, r6
	strh r0, [r7]
	ldrh r1, [r5, #0x16]
	adds r0, r1, r6
	mov r1, ip
	strh r0, [r1]
	movs r0, #0x80
	add ip, r0
	adds r7, #0x80
	adds r2, #0x80
	adds r3, #0x80
	adds r4, #2
	cmp r4, sl
	blt _0804A454
_0804A47E:
	ldr r1, [sp, #8]
	ldr r2, [sp]
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r4, [r5]
	adds r1, r4, r6
	strh r1, [r0]
	ldr r0, [sp, #8]
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	ldrh r7, [r5, #6]
	adds r1, r7, r6
	strh r1, [r0]
	ldr r1, [sp, #0xc]
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r2, [r5, #0x18]
	adds r1, r2, r6
	strh r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	ldrh r5, [r5, #0x1e]
	adds r1, r5, r6
	strh r1, [r0]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A4C8: .4byte 0x08C09B78

	thumb_func_start sub_0804A4CC
sub_0804A4CC: @ 0x0804A4CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r0, [sp]
	mov sb, r1
	ldr r0, [sp, #0x50]
	ldr r1, _0804A734 @ =0x08C09B78
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r0, [sp]
	adds r2, r0, r2
	subs r2, #1
	str r2, [sp, #4]
	add r3, sb
	subs r3, #1
	str r3, [sp, #8]
	mov r4, sb
	adds r4, #1
	cmp r4, r3
	bge _0804A576
	ldr r1, _0804A738 @ =gBg1Tm
	mov sl, r1
_0804A500:
	ldr r7, [sp]
	adds r7, #1
	adds r2, r4, #2
	mov r8, r2
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _0804A56E
	ldr r1, _0804A73C @ =gBg0Tm
	mov ip, r1
	movs r5, #0
	mov r3, sl
_0804A516:
	lsls r0, r4, #5
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0xa]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0xc]
	strh r1, [r2]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0x12]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	mov r2, ip
	adds r1, r0, r2
	strh r5, [r1]
	adds r0, r0, r3
	ldrh r1, [r6, #0x14]
	strh r1, [r0]
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804A516
_0804A56E:
	mov r4, r8
	ldr r1, [sp, #8]
	cmp r4, r1
	blt _0804A500
_0804A576:
	ldr r7, [sp]
	adds r7, #1
	mov r2, sb
	adds r2, #1
	str r2, [sp, #0xc]
	mov r4, sb
	lsls r4, r4, #5
	str r4, [sp, #0x10]
	ldr r0, [sp, #8]
	lsls r0, r0, #5
	str r0, [sp, #0x14]
	ldr r1, [sp, #4]
	cmp r7, r1
	bge _0804A626
	adds r5, r4, #0
	adds r5, #1
	adds r3, r0, #0
	adds r3, #1
	lsls r2, r7, #1
	ldr r4, [sp, #8]
	lsls r0, r4, #6
	ldr r4, _0804A738 @ =gBg1Tm
	adds r1, r0, r4
	adds r1, r2, r1
	str r1, [sp, #0x1c]
	ldr r1, _0804A73C @ =gBg0Tm
	adds r0, r0, r1
	adds r0, r0, r2
	mov sl, r0
	mov r4, sb
	lsls r0, r4, #6
	ldr r4, _0804A738 @ =gBg1Tm
	adds r1, r0, r4
	adds r1, r1, r2
	mov sb, r1
	ldr r1, _0804A73C @ =gBg0Tm
	adds r0, r0, r1
	adds r0, r0, r2
	mov r8, r0
	lsls r3, r3, #1
	adds r0, r3, r4
	adds r0, r0, r2
	mov ip, r0
	adds r3, r3, r1
	adds r1, r2, r3
	lsls r5, r5, #1
	adds r4, r5, r4
	str r4, [sp, #0x24]
	adds r3, r2, r4
	ldr r0, _0804A73C @ =gBg0Tm
	adds r5, r5, r0
	adds r2, r2, r5
_0804A5DE:
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r6, #2]
	mov r4, sb
	strh r0, [r4]
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r6, #4]
	strh r0, [r3]
	movs r0, #0
	mov r4, sl
	strh r0, [r4]
	ldrh r0, [r6, #0x1a]
	ldr r4, [sp, #0x1c]
	strh r0, [r4]
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #0x1c]
	mov r4, ip
	strh r0, [r4]
	ldr r0, [sp, #0x1c]
	adds r0, #4
	str r0, [sp, #0x1c]
	movs r4, #4
	add sl, r4
	add sb, r4
	add r8, r4
	add ip, r4
	adds r1, #4
	adds r3, #4
	adds r2, #4
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804A5DE
_0804A626:
	ldr r4, [sp, #0xc]
	ldr r1, [sp, #8]
	cmp r4, r1
	bge _0804A6BC
	movs r2, #0
	mov sl, r2
	ldr r5, _0804A738 @ =gBg1Tm
	lsls r2, r4, #5
	adds r2, #0x20
	ldr r7, [sp, #4]
	adds r7, r2, r7
	str r7, [sp, #0x18]
	ldr r0, [sp]
	adds r2, r2, r0
	lsls r3, r4, #6
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	adds r1, r0, r5
	adds r1, r1, r3
	mov sb, r1
	ldr r7, _0804A73C @ =gBg0Tm
	adds r0, r0, r7
	adds r0, r0, r3
	mov r8, r0
	ldr r1, [sp]
	lsls r0, r1, #1
	adds r1, r0, r5
	adds r1, r1, r3
	mov ip, r1
	adds r0, r0, r7
	adds r3, r3, r0
	lsls r2, r2, #1
	adds r7, r2, r5
	str r7, [sp, #0x2c]
	ldr r0, _0804A73C @ =gBg0Tm
	adds r2, r2, r0
	ldr r1, [sp, #0x18]
	lsls r1, r1, #1
	str r1, [sp, #0x20]
	adds r5, r1, r5
	adds r1, r1, r0
_0804A678:
	mov r7, sl
	strh r7, [r3]
	ldrh r0, [r6, #8]
	mov r7, ip
	strh r0, [r7]
	mov r7, sl
	mov r0, r8
	strh r7, [r0]
	ldrh r0, [r6, #0xe]
	mov r7, sb
	strh r0, [r7]
	mov r0, sl
	strh r0, [r2]
	ldrh r0, [r6, #0x10]
	ldr r7, [sp, #0x2c]
	strh r0, [r7]
	mov r0, sl
	strh r0, [r1]
	ldrh r0, [r6, #0x16]
	strh r0, [r5]
	adds r5, #0x80
	adds r1, #0x80
	adds r7, #0x80
	str r7, [sp, #0x2c]
	adds r2, #0x80
	movs r0, #0x80
	add sb, r0
	add r8, r0
	add ip, r0
	adds r3, #0x80
	adds r4, #2
	ldr r7, [sp, #8]
	cmp r4, r7
	blt _0804A678
_0804A6BC:
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	adds r5, r0, r1
	lsls r5, r5, #1
	ldr r2, _0804A73C @ =gBg0Tm
	adds r0, r5, r2
	movs r7, #0
	strh r7, [r0]
	ldr r4, [sp, #0x10]
	ldr r0, [sp, #4]
	adds r3, r4, r0
	lsls r3, r3, #1
	adds r0, r3, r2
	strh r7, [r0]
	ldr r4, [sp, #0x14]
	adds r2, r4, r1
	lsls r2, r2, #1
	ldr r1, _0804A73C @ =gBg0Tm
	adds r0, r2, r1
	strh r7, [r0]
	ldr r0, [sp, #4]
	adds r1, r4, r0
	lsls r1, r1, #1
	ldr r4, _0804A73C @ =gBg0Tm
	adds r0, r1, r4
	strh r7, [r0]
	ldr r7, _0804A738 @ =gBg1Tm
	adds r5, r5, r7
	ldrh r0, [r6]
	strh r0, [r5]
	adds r3, r3, r7
	ldrh r0, [r6, #6]
	strh r0, [r3]
	adds r2, r2, r7
	ldrh r0, [r6, #0x18]
	strh r0, [r2]
	adds r1, r1, r7
	ldrh r0, [r6, #0x1e]
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	bl EnableBgSync
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A734: .4byte 0x08C09B78
_0804A738: .4byte gBg1Tm
_0804A73C: .4byte gBg0Tm

	thumb_func_start sub_0804A740
sub_0804A740: @ 0x0804A740
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetGameTime
	subs r0, #1
	ldr r7, _0804A7A0 @ =0x0203DCC8
	ldr r1, [r7]
	cmp r0, r1
	bne _0804A768
	ldr r0, _0804A7A4 @ =0x0203DCC4
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r6, r0
	asrs r6, r0, #1
_0804A768:
	ldr r0, _0804A7A4 @ =0x0203DCC4
	movs r4, #0
	strh r5, [r0]
	strh r6, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	bl GetGameTime
	adds r3, r5, #0
	subs r3, #0xe
	ldr r2, _0804A7A8 @ =0x08C09BBC
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r5, r1, r3
	ldr r3, _0804A7AC @ =0x08C09BB4
	str r4, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08006884
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A7A0: .4byte 0x0203DCC8
_0804A7A4: .4byte 0x0203DCC4
_0804A7A8: .4byte 0x08C09BBC
_0804A7AC: .4byte 0x08C09BB4

	thumb_func_start sub_0804A7B0
sub_0804A7B0: @ 0x0804A7B0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetGameTime
	adds r3, r5, #0
	subs r3, #0xe
	ldr r2, _0804A7E4 @ =0x08C09BBC
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r5, r1, r3
	ldr r3, _0804A7E8 @ =0x08C09BB4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_08006884
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A7E4: .4byte 0x08C09BBC
_0804A7E8: .4byte 0x08C09BB4

	thumb_func_start sub_0804A7EC
sub_0804A7EC: @ 0x0804A7EC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	subs r4, #0xc
	ldr r3, _0804A80C @ =0x08C09BB4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	adds r1, r4, #0
	bl sub_08006884
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A80C: .4byte 0x08C09BB4

	thumb_func_start sub_0804A810
sub_0804A810: @ 0x0804A810
	ldr r0, _0804A818 @ =0x0203DCC4
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804A818: .4byte 0x0203DCC4

	thumb_func_start sub_0804A81C
sub_0804A81C: @ 0x0804A81C
	ldr r0, _0804A824 @ =0x0203DCC4
	movs r1, #2
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804A824: .4byte 0x0203DCC4

	thumb_func_start ClearBg0Bg1
ClearBg0Bg1: @ 0x0804A828
	push {lr}
	ldr r0, _0804A844 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0804A848 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0804A844: .4byte gBg0Tm
_0804A848: .4byte gBg1Tm

	thumb_func_start sub_0804A84C
sub_0804A84C: @ 0x0804A84C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r2, r3, r2
	subs r5, r2, #1
	adds r4, #1
	ldr r2, _0804A8A0 @ =gBg1Tm
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _0804A8A4 @ =0x0000106A
	strh r1, [r0]
	adds r3, #1
	adds r6, r2, #0
	cmp r3, r5
	bge _0804A886
	ldr r2, _0804A8A8 @ =0x00001076
	lsls r1, r3, #1
	lsls r0, r4, #6
	adds r0, r0, r6
	adds r1, r1, r0
	subs r3, r5, r3
_0804A87A:
	strh r2, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _0804A87A
	adds r3, r5, #0
_0804A886:
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, _0804A8AC @ =0x0000106B
	strh r1, [r0]
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A8A0: .4byte gBg1Tm
_0804A8A4: .4byte 0x0000106A
_0804A8A8: .4byte 0x00001076
_0804A8AC: .4byte 0x0000106B

	thumb_func_start sub_0804A8B0
sub_0804A8B0: @ 0x0804A8B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r3, r0, #0
	adds r4, r1, #0
	mov sb, r2
	adds r0, r3, r2
	subs r5, r0, #1
	adds r4, #1
	ldr r0, _0804A910 @ =gBg1Tm
	mov r8, r0
	ldr r1, _0804A914 @ =0x081DB490
	mov ip, r1
	cmp r3, r5
	bge _0804A8F4
	lsls r0, r4, #5
	ldrh r7, [r1, #0xc]
	adds r0, #1
	ldrh r6, [r1, #0xe]
	lsls r2, r3, #1
	lsls r1, r4, #6
	add r1, r8
	adds r1, r2, r1
	lsls r0, r0, #1
	add r0, r8
	adds r2, r2, r0
_0804A8E6:
	strh r7, [r1]
	strh r6, [r2]
	adds r1, #4
	adds r2, #4
	adds r3, #2
	cmp r3, r5
	blt _0804A8E6
_0804A8F4:
	lsls r0, r4, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r0, r2
	movs r0, #1
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0804A918
	mov r2, ip
	ldrh r0, [r2, #0xc]
	b _0804A91C
	.align 2, 0
_0804A910: .4byte gBg1Tm
_0804A914: .4byte 0x081DB490
_0804A918:
	mov r2, ip
	ldrh r0, [r2, #0xe]
_0804A91C:
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0804A930
sub_0804A930: @ 0x0804A930
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0804A954 @ =0x081DD7F4
	adds r1, r3, #0
	bl Decompress
	ldr r0, _0804A958 @ =0x081DDA48
	lsls r4, r4, #5
	lsls r5, r5, #5
	adds r1, r4, #0
	adds r2, r5, #0
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A954: .4byte 0x081DD7F4
_0804A958: .4byte 0x081DDA48

	thumb_func_start sub_0804A95C
sub_0804A95C: @ 0x0804A95C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl GetGameTime
	subs r0, #1
	ldr r6, _0804A9C0 @ =0x0203DCC8
	ldr r1, [r6]
	cmp r0, r1
	bne _0804A986
	ldr r0, _0804A9C4 @ =0x0203DCC4
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r4, r1
	asrs r4, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r5, r0
	asrs r5, r0, #1
_0804A986:
	ldr r0, _0804A9C4 @ =0x0203DCC4
	strh r4, [r0]
	strh r5, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	bl GetGameTime
	adds r3, r4, #0
	subs r3, #0xe
	ldr r2, _0804A9C8 @ =0x08C09BBC
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r4, r1, r3
	ldr r3, _0804A9CC @ =0x08C09BB4
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08006884
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A9C0: .4byte 0x0203DCC8
_0804A9C4: .4byte 0x0203DCC4
_0804A9C8: .4byte 0x08C09BBC
_0804A9CC: .4byte 0x08C09BB4

	thumb_func_start sub_0804A9D0
sub_0804A9D0: @ 0x0804A9D0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	subs r4, #0xc
	ldr r3, _0804A9F4 @ =0x08C09BB4
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	str r2, [sp]
	movs r0, #3
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08006884
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A9F4: .4byte 0x08C09BB4

	thumb_func_start sub_0804A9F8
sub_0804A9F8: @ 0x0804A9F8
	push {lr}
	movs r0, #0
	bl sub_0804A2AC
	movs r0, #1
	rsbs r0, r0, #0
	bl ApplyUiWindowFramePal
	pop {r0}
	bx r0
