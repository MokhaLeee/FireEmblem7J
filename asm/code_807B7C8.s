	.include "macro.inc"
	.syntax unified

	thumb_func_start SetFlag_145
SetFlag_145: @ 0x0807B8CC
	push {lr}
	movs r0, #0x91
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start ClearFlag_145
ClearFlag_145: @ 0x0807B8D8
	push {lr}
	movs r0, #0x91
	bl ClearFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807B8E4
sub_807B8E4: @ 0x0807B8E4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #8
	movs r3, #3
	bl sub_8077714
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #3
	bl GetBgXOffset
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #8
	movs r3, #3
	bl sub_8077794
	bl SwapScanlineBufs
	adds r4, #0x64
	ldrh r4, [r4]
	movs r0, #3
	bl GetBgXOffset
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807B94C
sub_807B94C: @ 0x0807B94C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, #0x4c
	strh r1, [r0]
	movs r0, #1
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0807B9F0 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _0807B9F4 @ =gUnk_081BF61C
	ldr r1, _0807B9F8 @ =0x06004000
	bl Decompress
	ldr r0, _0807B9FC @ =gBg2Tm
	ldr r1, _0807BA00 @ =gUnk_081C0A90
	movs r2, #0xc4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r5, _0807BA04 @ =gUnk_081C0A50
	adds r0, r5, #0
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl EnableBgSync
	ldr r1, _0807BA08 @ =gUnk_081C0A70
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #6
	bl StartMixPalette
	bl InitScanlineEffect
	ldr r0, _0807BA0C @ =sub_80783DC
	bl SetOnHBlankA
	ldr r0, _0807BA10 @ =sub_807B8E4
	adds r1, r4, #0
	bl StartParallelWorker
	adds r4, #0x64
	movs r0, #2
	strh r0, [r4]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9F0: .4byte gDispIo
_0807B9F4: .4byte gUnk_081BF61C
_0807B9F8: .4byte 0x06004000
_0807B9FC: .4byte gBg2Tm
_0807BA00: .4byte gUnk_081C0A90
_0807BA04: .4byte gUnk_081C0A50
_0807BA08: .4byte gUnk_081C0A70
_0807BA0C: .4byte sub_80783DC
_0807BA10: .4byte sub_807B8E4

	thumb_func_start sub_807BA14
sub_807BA14: @ 0x0807BA14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0807BAC0 @ =sub_80785B8
	bl SetOnHBlankA
	ldr r3, _0807BAC4 @ =gDispIo
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
	movs r5, #0
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r2, [r3, #0x10]
	orrs r2, r0
	strb r2, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldr r0, _0807BAC8 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0807BACC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807BAD0 @ =gUnk_081C1068
	ldr r1, _0807BAD4 @ =0x06003000
	bl Decompress
	ldr r0, _0807BAD8 @ =gBg1Tm
	ldr r1, _0807BADC @ =gUnk_081C1EA4
	movs r2, #0xe3
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r0, _0807BAE0 @ =gUnk_081C1CA4
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x4c
	strh r5, [r0]
	ldr r0, [r4, #0x14]
	bl TryLockProc
	adds r4, #0x64
	movs r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BAC0: .4byte sub_80785B8
_0807BAC4: .4byte gDispIo
_0807BAC8: .4byte 0x0000FFE0
_0807BACC: .4byte 0x0000E0FF
_0807BAD0: .4byte gUnk_081C1068
_0807BAD4: .4byte 0x06003000
_0807BAD8: .4byte gBg1Tm
_0807BADC: .4byte gUnk_081C1EA4
_0807BAE0: .4byte gUnk_081C1CA4

	thumb_func_start sub_807BAE4
sub_807BAE4: @ 0x0807BAE4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807BB40 @ =gDispIo
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
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807BB38
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _0807BB44 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0807BB38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB40: .4byte gDispIo
_0807BB44: .4byte gBg2Tm

	thumb_func_start sub_807BB48
sub_807BB48: @ 0x0807BB48
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807BBD4 @ =gDispIo
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0807BBD8 @ =0x06003000
	ldr r1, _0807BBDC @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuFastSet
	ldr r0, _0807BBE0 @ =gBg2Tm
	ldr r1, _0807BBE4 @ =gUnk_081C1EA4
	movs r2, #0xe4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0807BBE8 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl EnableBgSync
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r5, #0xc]
	ands r0, r1
	strb r0, [r5, #0xc]
	adds r0, r2, #0
	ldrb r1, [r5, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x10]
	movs r0, #3
	ldrb r1, [r5, #0x14]
	orrs r0, r1
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r5, #0x18]
	ldr r0, [r4, #0x14]
	bl TryUnlockProc
	adds r4, #0x64
	movs r0, #2
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBD4: .4byte gDispIo
_0807BBD8: .4byte 0x06003000
_0807BBDC: .4byte 0x06004000
_0807BBE0: .4byte gBg2Tm
_0807BBE4: .4byte gUnk_081C1EA4
_0807BBE8: .4byte gBg1Tm

	thumb_func_start sub_807BBEC
sub_807BBEC: @ 0x0807BBEC
	push {lr}
	ldr r0, _0807BBF8 @ =sub_80783DC
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF8: .4byte sub_80783DC

	thumb_func_start sub_807BBFC
sub_807BBFC: @ 0x0807BBFC
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0807BC48 @ =0x06003000
	ldr r2, _0807BC4C @ =0x01000C00
	mov r0, sp
	bl CpuFastSet
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _0807BC50 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807BC48: .4byte 0x06003000
_0807BC4C: .4byte 0x01000C00
_0807BC50: .4byte gDispIo

	thumb_func_start sub_807BC54
sub_807BC54: @ 0x0807BC54
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807BC64 @ =gUnk_08D6F854
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807BC64: .4byte gUnk_08D6F854

	thumb_func_start sub_807BC68
sub_807BC68: @ 0x0807BC68
	push {lr}
	ldr r0, _0807BC7C @ =gUnk_08D6F854
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807BC7C: .4byte gUnk_08D6F854

	thumb_func_start sub_807BC80
sub_807BC80: @ 0x0807BC80
	push {lr}
	ldr r0, _0807BC90 @ =gUnk_08D6F854
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807BC90: .4byte gUnk_08D6F854

	thumb_func_start sub_807BC94
sub_807BC94: @ 0x0807BC94
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_807BC9C
sub_807BC9C: @ 0x0807BC9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r2, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	cmp r2, #0
	beq _0807BCD2
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _0807BCD2
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807BCD2
	eors r1, r3
	str r1, [r2, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_0807BCD2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807BCD8
sub_807BCD8: @ 0x0807BCD8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807BCE8 @ =gUnk_08D6F8AC
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807BCE8: .4byte gUnk_08D6F8AC

	thumb_func_start sub_807BCEC
sub_807BCEC: @ 0x0807BCEC
	push {lr}
	ldr r0, _0807BCFC @ =gUnk_08D6F8AC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807BCFC: .4byte gUnk_08D6F8AC

	thumb_func_start sub_807BD00
sub_807BD00: @ 0x0807BD00
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0807BD54 @ =gBmSt
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r4, r0, r4
	movs r1, #0xff
	ands r4, r1
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	subs r5, r0, r5
	ands r5, r1
	ldr r0, _0807BD58 @ =gUnk_081BD514
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807BD5C @ =gUnk_081BD14C
	ldr r1, _0807BD60 @ =0x06000800
	bl Decompress
	ldr r0, _0807BD64 @ =gBg0Tm
	ldr r1, _0807BD68 @ =gUnk_081BD534
	movs r2, #0x40
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	adds r1, r4, #0
	adds r2, r5, #0
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD54: .4byte gBmSt
_0807BD58: .4byte gUnk_081BD514
_0807BD5C: .4byte gUnk_081BD14C
_0807BD60: .4byte 0x06000800
_0807BD64: .4byte gBg0Tm
_0807BD68: .4byte gUnk_081BD534

	thumb_func_start sub_807BD6C
sub_807BD6C: @ 0x0807BD6C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r3, r0, #0
	ldr r2, _0807BDB4 @ =gBmSt
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r3, r3, r0
	ldr r5, _0807BDB8 @ =0x000001FF
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r1, r1, r0
	movs r4, #0xff
	ldr r0, _0807BDBC @ =gUnk_0819381C
	ldr r6, _0807BDC0 @ =gUnk_08193CB8
	ldr r2, _0807BDC4 @ =gUnk_0819438C
	ands r3, r5
	ands r1, r4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	movs r1, #0xd0
	lsls r1, r1, #3
	str r1, [sp, #0x10]
	movs r1, #4
	str r1, [sp, #0x14]
	adds r1, r6, #0
	bl StartSpriteAnimfx
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDB4: .4byte gBmSt
_0807BDB8: .4byte 0x000001FF
_0807BDBC: .4byte gUnk_0819381C
_0807BDC0: .4byte gUnk_08193CB8
_0807BDC4: .4byte gUnk_0819438C

	thumb_func_start sub_807BDC8
sub_807BDC8: @ 0x0807BDC8
	push {lr}
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0807BDF4
	movs r0, #0x1f
	ands r1, r0
	cmp r1, #0
	bne _0807BDF4
	ldr r0, _0807BDF8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807BDF4
	movs r0, #0xf8
	bl m4aSongNumStart
_0807BDF4:
	pop {r0}
	bx r0
	.align 2, 0
_0807BDF8: .4byte gPlaySt

	thumb_func_start sub_807BDFC
sub_807BDFC: @ 0x0807BDFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl EndMixPalette
	bl ArchiveCurrentPalettes
	adds r6, r4, #0
	adds r6, #0x4c
	movs r3, #0
	movs r5, #0
	strh r5, [r6]
	ldr r7, _0807BEF0 @ =gDispIo
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r3, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0807BEF4 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807BEF8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_80780E0
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807BEFC @ =HBlank_Scanline_8078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #7
	bl EnableBgSync
	strh r5, [r6]
	ldr r0, _0807BF00 @ =BmBgfxConf_FireRing
	movs r1, #0x80
	lsls r1, r1, #7
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0x80
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x90
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8013EF8
	str r5, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
	ldr r0, _0807BF04 @ =sub_807BDC8
	adds r1, r4, #0
	bl StartParallelWorker
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BEF0: .4byte gDispIo
_0807BEF4: .4byte 0x0000FFE0
_0807BEF8: .4byte 0x0000E0FF
_0807BEFC: .4byte HBlank_Scanline_8078098
_0807BF00: .4byte BmBgfxConf_FireRing
_0807BF04: .4byte sub_807BDC8

	thumb_func_start sub_807BF08
sub_807BF08: @ 0x0807BF08
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r2, [r5]
	adds r2, #1
	movs r4, #0
	strh r2, [r5]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807BF58 @ =gDispIo
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
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807BF52
	movs r0, #0
	strh r0, [r5]
	adds r0, r6, #0
	bl Proc_Break
_0807BF52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BF58: .4byte gDispIo

	thumb_func_start sub_807BF5C
sub_807BF5C: @ 0x0807BF5C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r0, #0x4c
	movs r5, #0
	strh r5, [r0]
	movs r0, #0
	bl BmBgfxSetLoopEN
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	adds r4, #0x64
	strh r5, [r4]
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807BF9C
sub_807BF9C: @ 0x0807BF9C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807BFE8 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807BFE2
	adds r0, r5, #0
	bl Proc_Break
_0807BFE2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BFE8: .4byte gDispIo

	thumb_func_start sub_807BFEC
sub_807BFEC: @ 0x0807BFEC
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r3, _0807C070 @ =gDispIo
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
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0807C074 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807C078 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C07C @ =ProcScr_EventSpriteAnim
	bl Proc_Find
	bl Proc_End
	movs r0, #0x70
	movs r1, #0x20
	bl sub_807BD00
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C070: .4byte gDispIo
_0807C074: .4byte 0x0000FFE0
_0807C078: .4byte 0x0000E0FF
_0807C07C: .4byte ProcScr_EventSpriteAnim

	thumb_func_start sub_807C080
sub_807C080: @ 0x0807C080
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _0807C100 @ =gPal + 0x3a0
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0x1b
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r6, #0x80
	lsls r6, r6, #0x14
	str r6, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	movs r0, #0xda
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807C0D2
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807C0D2:
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807C0E6
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807C0E6:
	ldr r0, _0807C104 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C0F8
	movs r0, #0xd6
	bl m4aSongNumStart
_0807C0F8:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C100: .4byte gPal + 0x3a0
_0807C104: .4byte gPlaySt

	thumb_func_start sub_807C108
sub_807C108: @ 0x0807C108
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807C126
	adds r0, r5, #0
	bl sub_807C080
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_807BD6C
_0807C126:
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	ldr r0, _0807C16C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807C166
	adds r0, r5, #0
	bl Proc_Break
_0807C166:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C16C: .4byte gDispIo

	thumb_func_start sub_807C170
sub_807C170: @ 0x0807C170
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807C1DC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0807C1E0 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #5
	bl EnableBgSync
	ldr r3, _0807C1E4 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C1DC: .4byte gBg2Tm
_0807C1E0: .4byte gBg0Tm
_0807C1E4: .4byte gDispIo

	thumb_func_start sub_807C1E8
sub_807C1E8: @ 0x0807C1E8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C1F8 @ =gUnk_08D6F8BC
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807C1F8: .4byte gUnk_08D6F8BC

	thumb_func_start sub_807C1FC
sub_807C1FC: @ 0x0807C1FC
	push {lr}
	ldr r0, _0807C20C @ =gUnk_08D6F8BC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807C20C: .4byte gUnk_08D6F8BC

	thumb_func_start sub_807C210
sub_807C210: @ 0x0807C210
	push {lr}
	ldr r0, _0807C224 @ =gUnk_08D6F8BC
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C224: .4byte gUnk_08D6F8BC

	thumb_func_start sub_807C228
sub_807C228: @ 0x0807C228
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807C25C
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0807C25C
	ldr r0, _0807C288 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C250
	movs r0, #0xe5
	bl m4aSongNumStart
_0807C250:
	movs r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl Proc_Goto
_0807C25C:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0807C27E
	ldr r0, [r4, #0x50]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0807C27E
	ldr r0, _0807C288 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C27E
	movs r0, #0xf8
	bl m4aSongNumStart
_0807C27E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807C288: .4byte gPlaySt

	thumb_func_start sub_807C28C
sub_807C28C: @ 0x0807C28C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ArchiveCurrentPalettes
	adds r6, r5, #0
	adds r6, #0x4c
	movs r3, #0
	movs r4, #0
	strh r4, [r6]
	ldr r7, _0807C36C @ =gDispIo
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r3, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0807C370 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807C374 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_80780E0
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807C378 @ =HBlank_Scanline_8078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #7
	bl EnableBgSync
	strh r4, [r6]
	ldr r0, _0807C37C @ =BmBgfxConf_08DBA258
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	str r4, [sp, #8]
	ldr r1, _0807C380 @ =sub_807C228
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0x80
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x82
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C36C: .4byte gDispIo
_0807C370: .4byte 0x0000FFE0
_0807C374: .4byte 0x0000E0FF
_0807C378: .4byte HBlank_Scanline_8078098
_0807C37C: .4byte BmBgfxConf_08DBA258
_0807C380: .4byte sub_807C228

	thumb_func_start sub_807C384
sub_807C384: @ 0x0807C384
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x12
	ldr r2, _0807C3BC @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r3, r2, #0
	cmp r4, #6
	bgt _0807C3C0
	movs r0, #0x10
	subs r1, r0, r4
	b _0807C3C2
	.align 2, 0
_0807C3BC: .4byte gDispIo
_0807C3C0:
	movs r1, #0xa
_0807C3C2:
	adds r0, r3, #0
	adds r0, #0x45
	movs r3, #0
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x46
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807C3E0
	adds r0, r5, #0
	adds r0, #0x4c
	strh r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807C3E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C3E8
sub_807C3E8: @ 0x0807C3E8
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r6, r2, #0x13
	ldr r0, _0807C460 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x50
	bne _0807C44C
	movs r0, #0x80
	lsls r0, r0, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #0x80
	movs r2, #0x80
	bl sub_8013EF8
_0807C44C:
	cmp r6, #0x10
	bne _0807C456
	adds r0, r5, #0
	bl Proc_Break
_0807C456:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C460: .4byte gDispIo

	thumb_func_start sub_807C464
sub_807C464: @ 0x0807C464
	push {r4, lr}
	movs r4, #0x41
_0807C468:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807C482
	ldr r1, [r0]
	cmp r1, #0
	beq _0807C482
	ldrb r1, [r1, #4]
	cmp r1, #0x86
	beq _0807C482
	bl ClearUnit
_0807C482:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807C468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C490
sub_807C490: @ 0x0807C490
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	ldr r0, _0807C574 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807C578 @ =gDispIo
	mov ip, r0
	mov r5, ip
	adds r5, #0x3c
	movs r3, #0x3f
	ldrb r1, [r5]
	ands r3, r1
	mov r6, ip
	adds r6, #0x44
	movs r2, #0
	mov r8, r2
	movs r7, #0x45
	add r7, ip
	mov sl, r7
	movs r4, #0x10
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r7, ip
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r7, [r7, #0x14]
	ands r1, r7
	movs r0, #2
	orrs r1, r0
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	movs r0, #0x40
	orrs r3, r0
	strb r3, [r5]
	strb r4, [r6]
	mov r7, sl
	strb r4, [r7]
	mov r1, r8
	ldr r0, _0807C57C @ =0x030027D6
	strb r1, [r0]
	ldr r0, _0807C580 @ =0x0000FFE0
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807C584 @ =0x0000E0FF
	ands r0, r1
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x70
	movs r1, #0x20
	bl sub_807BD00
	bl sub_807C464
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _0807C588 @ =0xFFDFFFFE
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	mov r7, sb
	str r7, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C574: .4byte gBg2Tm
_0807C578: .4byte gDispIo
_0807C57C: .4byte 0x030027D6
_0807C580: .4byte 0x0000FFE0
_0807C584: .4byte 0x0000E0FF
_0807C588: .4byte 0xFFDFFFFE

	thumb_func_start sub_807C58C
sub_807C58C: @ 0x0807C58C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_807BD6C
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807C5A4
sub_807C5A4: @ 0x0807C5A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r2, r0, #1
	strh r2, [r4]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x13
	ldr r0, _0807C64C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #8
	bne _0807C5F6
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r1, r5, #0
	bl StartUnitTornOut
_0807C5F6:
	ldrh r4, [r4]
	cmp r4, #0x10
	bne _0807C60E
	ldr r0, _0807C650 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C60E
	movs r0, #0xd6
	bl m4aSongNumStart
_0807C60E:
	cmp r6, #0x10
	bne _0807C644
	ldr r0, _0807C654 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r2, _0807C64C @ =gDispIo
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
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807C644:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C64C: .4byte gDispIo
_0807C650: .4byte gPlaySt
_0807C654: .4byte gBg0Tm

	thumb_func_start sub_807C658
sub_807C658: @ 0x0807C658
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C668 @ =gUnk_08D6F95C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807C668: .4byte gUnk_08D6F95C

	thumb_func_start sub_807C66C
sub_807C66C: @ 0x0807C66C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetText
	ldr r1, _0807C6E0 @ =0x06009000
	mov r0, sp
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	mov r0, sp
	bl SetTextFont
	movs r4, #0
	str r4, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0807C6E4 @ =0x01000008
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _0807C6E8 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	add r4, sp, #0x20
	adds r0, r4, #0
	movs r1, #0x14
	bl InitText
	ldr r1, _0807C6EC @ =gBg3Tm + 0x24a
	adds r0, r4, #0
	bl PutText
	movs r0, #0xa0
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C6E0: .4byte 0x06009000
_0807C6E4: .4byte 0x01000008
_0807C6E8: .4byte 0x06008000
_0807C6EC: .4byte gBg3Tm + 0x24a

	thumb_func_start sub_807C6F0
sub_807C6F0: @ 0x0807C6F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #2
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r6, #0x1e
	str r6, [sp, #4]
	movs r5, #8
	str r5, [sp, #8]
	movs r2, #7
	movs r3, #7
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x11
	asrs r1, r1, #0x10
	mov r2, r8
	str r2, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #3
	movs r3, #0xf
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C754
sub_807C754: @ 0x0807C754
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0807C7B4 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0807C7B8 @ =gUnk_08452D90
	ldr r1, _0807C7BC @ =0x06000800
	bl Decompress
	ldr r1, _0807C7C0 @ =gUnk_08452E90
	ldr r2, _0807C7C4 @ =0x00007040
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _0807C7C8 @ =gUnk_08452E70
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	bl InitScanlineEffect
	ldr r0, _0807C7CC @ =sub_8078130
	bl SetOnHBlankA
	ldr r0, _0807C7D0 @ =sub_807C6F0
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _0807C7D4 @ =gUnk_0857E570
	ldr r1, _0807C7D8 @ =gUnk_08453438
	movs r2, #7
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl StartMixPalette
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C7B4: .4byte gBg1Tm
_0807C7B8: .4byte gUnk_08452D90
_0807C7BC: .4byte 0x06000800
_0807C7C0: .4byte gUnk_08452E90
_0807C7C4: .4byte 0x00007040
_0807C7C8: .4byte gUnk_08452E70
_0807C7CC: .4byte sub_8078130
_0807C7D0: .4byte sub_807C6F0
_0807C7D4: .4byte gUnk_0857E570
_0807C7D8: .4byte gUnk_08453438

	thumb_func_start sub_807C7DC
sub_807C7DC: @ 0x0807C7DC
	push {lr}
	bl EndMixPalette
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C7E8
sub_807C7E8: @ 0x0807C7E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl EndMixPalette
	ldr r3, _0807C894 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
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
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r6, [r2]
	ands r0, r6
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
	ldr r0, _0807C898 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0807C89C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C8A0 @ =0x06008000
	ldr r1, _0807C8A4 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _0807C8A8 @ =gPal + 0x100
	ldr r6, _0807C8AC @ =0xFFFFFF00
	adds r1, r0, r6
	movs r2, #0x38
	bl CpuFastSet
	ldr r0, _0807C8B0 @ =0x00008080
	adds r3, r0, #0
	ldr r2, _0807C8B4 @ =gBg3Tm
	ldr r1, _0807C8B8 @ =gBg2Tm
	movs r4, #0x80
	lsls r4, r4, #3
_0807C86C:
	ldrh r6, [r2]
	adds r0, r3, r6
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0807C86C
	bl EnablePalSync
	movs r0, #4
	bl EnableBgSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C894: .4byte gDispIo
_0807C898: .4byte 0x0000FFE0
_0807C89C: .4byte 0x0000E0FF
_0807C8A0: .4byte 0x06008000
_0807C8A4: .4byte 0x06001000
_0807C8A8: .4byte gPal + 0x100
_0807C8AC: .4byte 0xFFFFFF00
_0807C8B0: .4byte 0x00008080
_0807C8B4: .4byte gBg3Tm
_0807C8B8: .4byte gBg2Tm

	thumb_func_start sub_807C8BC
sub_807C8BC: @ 0x0807C8BC
	ldr r2, _0807C8D8 @ =gDispIo
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
_0807C8D8: .4byte gDispIo

	thumb_func_start sub_807C8DC
sub_807C8DC: @ 0x0807C8DC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807C944 @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x37
	str r2, [sp]
	movs r2, #8
	movs r3, #8
	bl sub_80B7980
	movs r0, #8
	bl EnableBgSync
	ldr r3, _0807C948 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _0807C94C @ =gUnk_08583EE4
	ldr r1, _0807C950 @ =gUnk_08453538
	movs r2, #7
	str r2, [sp]
	ldr r2, [r4, #0x14]
	str r2, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl StartMixPalette
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C944: .4byte gBg3Tm
_0807C948: .4byte gDispIo
_0807C94C: .4byte gUnk_08583EE4
_0807C950: .4byte gUnk_08453538

	thumb_func_start sub_807C954
sub_807C954: @ 0x0807C954
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807C9A0 @ =gDispIo
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
	movs r1, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807C99A
	adds r0, r4, #0
	bl Proc_Break
_0807C99A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C9A0: .4byte gDispIo

	thumb_func_start sub_807C9A4
sub_807C9A4: @ 0x0807C9A4
	push {lr}
	ldr r0, _0807CA10 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0807CA14 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #6
	bl EnableBgSync
	ldr r3, _0807CA18 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl EndAllParallelWorkers
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807CA10: .4byte gBg1Tm
_0807CA14: .4byte gBg2Tm
_0807CA18: .4byte gDispIo

	thumb_func_start sub_807CA1C
sub_807CA1C: @ 0x0807CA1C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807CA2C @ =gUnk_08D6F9D4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807CA2C: .4byte gUnk_08D6F9D4
