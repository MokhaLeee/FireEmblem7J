	.include "macro.inc"
	.syntax unified

	thumb_func_start EkrDragon_080655A0
EkrDragon_080655A0: @ 0x080655A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _0806563C @ =gDispIo
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
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldr r0, _08065640 @ =gUnk_082E445C
	ldr r1, _08065644 @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _08065648 @ =gUnk_082E6D40
	ldr r1, _0806564C @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	ldr r0, _08065650 @ =Pal_EkrDragon_082E6C60
	ldr r1, _08065654 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08065658 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _0806565C @ =gBg3Tm
	movs r1, #0x1f
	bl TmFill
	movs r0, #0
	movs r1, #0x78
	bl EkrDragonTmCpyHFlip
	movs r0, #0xf8
	rsbs r0, r0, #0
	movs r1, #0
	bl EkrDragonTmCpyExt
	bl EnablePalSync
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0x78
	movs r2, #0x60
	movs r3, #2
	bl sub_080664CC
	str r0, [r4, #0x64]
	movs r0, #0x78
	movs r1, #0
	bl sub_080665B8
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806563C: .4byte gDispIo
_08065640: .4byte gUnk_082E445C
_08065644: .4byte 0x06008000
_08065648: .4byte gUnk_082E6D40
_0806564C: .4byte gEkrTsaBuffer
_08065650: .4byte Pal_EkrDragon_082E6C60
_08065654: .4byte 0x02022920
_08065658: .4byte 0x001F001F
_0806565C: .4byte gBg3Tm

	thumb_func_start EkrDragon_08065660
EkrDragon_08065660: @ 0x08065660
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0xf8
	rsbs r1, r1, #0
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl EkrDragonTmCpyExt
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _080656BC
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_080656BC:
	ldrh r5, [r5, #0x2c]
	cmp r5, #0xf
	bne _080656D0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xe6
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_080656D0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EkrDragon_080656D8
EkrDragon_080656D8: @ 0x080656D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08065740
	ldr r5, _080656FC @ =gEkrDistanceType
	ldrh r0, [r5]
	cmp r0, #2
	bne _08065700
	adds r0, r4, #0
	bl Proc_Break
	b _08065740
	.align 2, 0
_080656FC: .4byte gEkrDistanceType
_08065700:
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	bl sub_08065EAC
	adds r2, r0, #0
	str r2, [r4, #0x64]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0806571C
	cmp r0, #1
	beq _0806572C
	b _08065734
_0806571C:
	ldr r1, _08065728 @ =gEkrBgPosition
	movs r0, #0x38
	ldrh r1, [r1]
	subs r0, r0, r1
	b _08065732
	.align 2, 0
_08065728: .4byte gEkrBgPosition
_0806572C:
	ldr r0, _08065748 @ =gEkrBgPosition
	ldrh r0, [r0]
	rsbs r0, r0, #0
_08065732:
	strh r0, [r2, #0x34]
_08065734:
	ldr r1, [r4, #0x64]
	movs r0, #0x4c
	strh r0, [r1, #0x3c]
	adds r0, r4, #0
	bl Proc_Break
_08065740:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065748: .4byte gEkrBgPosition

	thumb_func_start EkrDragon_0806574C
EkrDragon_0806574C: @ 0x0806574C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x64]
	ldr r0, _08065770 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #2
	bne _08065774
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_0804F7B8
	adds r0, r5, #0
	bl Proc_Break
	b _080657CA
	.align 2, 0
_08065770: .4byte gEkrDistanceType
_08065774:
	movs r0, #0x34
	ldrsh r2, [r6, r0]
	adds r1, r2, #0
	subs r1, #0x30
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x10
	str r4, [sp]
	movs r0, #1
	bl Interpolate
	strh r0, [r6, #0x32]
	movs r0, #0x3c
	ldrsh r2, [r6, r0]
	adds r1, r2, #0
	subs r1, #0x80
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #1
	bl Interpolate
	strh r0, [r6, #0x3a]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _080657CA
	ldr r0, [r5, #0x64]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_0804F7B8
	adds r0, r5, #0
	bl Proc_Break
_080657CA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrDragon_080657D4
EkrDragon_080657D4: @ 0x080657D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08065810 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #2
	bne _08065814
	ldr r0, [r6, #0x5c]
	bl sub_080660F4
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl sub_08066200
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl sub_08066414
	str r0, [r6, #0x4c]
	bl sub_08066380
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x5c]
	bl sub_080662F4
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	b _080658D6
	.align 2, 0
_08065810: .4byte gEkrDistanceType
_08065814:
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080658D6
	strh r1, [r6, #0x2c]
	movs r0, #0x80
	strh r0, [r6, #0x2e]
	movs r0, #0x20
	strh r0, [r6, #0x3a]
	strh r1, [r6, #0x3c]
	ldr r0, [r6, #0x5c]
	bl sub_08065F38
	str r0, [r6, #0x64]
	ldr r1, [r6, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x32]
	ldr r1, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r2, [r6, #0x3a]
	subs r0, r0, r2
	strh r0, [r1, #0x3a]
	movs r0, #8
	movs r1, #0
	bl sub_0804EF18
	str r0, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	movs r1, #0x9d
	lsls r1, r1, #1
	bl sub_08066CAC
	ldr r0, _080658E0 @ =gUnk_082E6E8C
	ldr r4, _080658E4 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r5, _080658E8 @ =0x001F001F
	str r5, [sp]
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r2, _080658EC @ =0x05000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r5, #0
	bl EfxTmFill
	ldr r0, _080658F0 @ =gBg3Tm
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _080658F4 @ =gEkrBgPosition
	ldr r0, [r0]
	movs r2, #0x3a
	ldrsh r1, [r6, r2]
	bl EkrDragonTmCpyExt
	ldr r0, [r6, #0x5c]
	bl sub_080660F4
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl sub_08066200
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl sub_08066414
	str r0, [r6, #0x4c]
	bl sub_08066380
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x5c]
	bl sub_080662F4
	str r0, [r6, #0x48]
	movs r0, #0xbc
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r6, #0
	bl Proc_Break
_080658D6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080658E0: .4byte gUnk_082E6E8C
_080658E4: .4byte gEkrTsaBuffer
_080658E8: .4byte 0x001F001F
_080658EC: .4byte 0x05000020
_080658F0: .4byte gBg3Tm
_080658F4: .4byte gEkrBgPosition

	thumb_func_start EkrDragon_080658F8
EkrDragon_080658F8: @ 0x080658F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08065918 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #2
	bne _0806591C
	adds r0, r5, #0
	bl Proc_Break
	b _08065A8C
	.align 2, 0
_08065918: .4byte gEkrDistanceType
_0806591C:
	movs r0, #0x3a
	ldrsh r1, [r5, r0]
	movs r3, #0x3c
	ldrsh r2, [r5, r3]
	movs r4, #0x2c
	ldrsh r3, [r5, r4]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r7, r0, #0
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r7
	strh r0, [r1, #0x3a]
	ldr r1, [r5, #0x64]
	ldr r4, _08065A9C @ =0x02017760
	ldrh r2, [r1, #0x32]
	ldrh r3, [r4]
	subs r0, r2, r3
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldrh r6, [r1, #0x3a]
	ldrh r2, [r4, #2]
	subs r0, r6, r2
	strh r0, [r1, #0x3a]
	ldr r3, _08065AA0 @ =0x02000028
	mov sl, r3
	ldrh r6, [r3, #2]
	ldrh r0, [r4]
	adds r1, r6, r0
	ldr r2, _08065AA4 @ =gEkrBgPosition
	mov r8, r2
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r3, _08065AA8 @ =0x0200002C
	mov sb, r3
	ldrh r6, [r3, #2]
	ldrh r0, [r4, #2]
	subs r2, r6, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	movs r2, #0
	ldrsh r1, [r4, r2]
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	adds r1, r7, r1
	bl EkrDragonTmCpyExt
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _08065AAC @ =0x02000038
	ldrh r0, [r4]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r4]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r4, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	adds r0, #1
	cmp r1, r0
	bne _08065A8C
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r7
	strh r0, [r1, #0x3a]
	mov r4, r8
	ldr r1, [r4]
	mov r0, sl
	ldrh r0, [r0, #2]
	subs r1, r0, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, sb
	movs r4, #2
	ldrsh r2, [r3, r4]
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r1, r8
	ldr r0, [r1]
	adds r1, r7, #0
	bl EkrDragonTmCpyExt
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r2, [r6]
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r6, #2]
	rsbs r1, r3, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r4, [r6]
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	ldr r0, [r5, #0x54]
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_08065A8C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065A9C: .4byte 0x02017760
_08065AA0: .4byte 0x02000028
_08065AA4: .4byte gEkrBgPosition
_08065AA8: .4byte 0x0200002C
_08065AAC: .4byte 0x02000038

	thumb_func_start EkrDragon_08065AB0
EkrDragon_08065AB0: @ 0x08065AB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065AF4 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #2
	bne _08065B0C
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, _08065AF8 @ =gUnk_082E6E8C
	ldr r1, _08065AFC @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	ldr r0, _08065B00 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _08065B04 @ =gBg3Tm
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065B08 @ =gEkrBgPosition
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	adds r0, r4, #0
	bl Proc_Break
	b _08065B78
	.align 2, 0
_08065AF4: .4byte gEkrDistanceType
_08065AF8: .4byte gUnk_082E6E8C
_08065AFC: .4byte gEkrTsaBuffer
_08065B00: .4byte 0x001F001F
_08065B04: .4byte gBg3Tm
_08065B08: .4byte gEkrBgPosition
_08065B0C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldr r1, _08065B80 @ =0x010D0000
	cmp r0, r1
	bne _08065B32
	ldr r0, [r4, #0x64]
	movs r1, #0x3c
	movs r2, #9
	bl sub_08066DA0
	ldr r0, _08065B84 @ =0x000002F1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08065B32:
	ldr r0, _08065B88 @ =0x00000195
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	bne _08065B78
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, _08065B8C @ =gUnk_082E6E8C
	ldr r1, _08065B90 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	ldr r0, _08065B94 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _08065B98 @ =gBg3Tm
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065B9C @ =gEkrBgPosition
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	adds r0, r4, #0
	bl Proc_Break
_08065B78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065B80: .4byte 0x010D0000
_08065B84: .4byte 0x000002F1
_08065B88: .4byte 0x00000195
_08065B8C: .4byte gUnk_082E6E8C
_08065B90: .4byte gEkrTsaBuffer
_08065B94: .4byte 0x001F001F
_08065B98: .4byte gBg3Tm
_08065B9C: .4byte gEkrBgPosition

	thumb_func_start EkrDragon_08065BA0
EkrDragon_08065BA0: @ 0x08065BA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080666A4
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EkrDragon_08065BC0
EkrDragon_08065BC0: @ 0x08065BC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08065C0E
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x68]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	ldr r0, [r4, #0x50]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonDead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08065C00
	ldr r0, [r4, #0x5c]
	bl sub_08066804
	b _08065C06
_08065C00:
	ldr r0, [r4, #0x5c]
	bl sub_080669A4
_08065C06:
	str r0, [r4, #0x50]
	adds r0, r4, #0
	bl Proc_Break
_08065C0E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EkrDragon_08065C14
EkrDragon_08065C14: @ 0x08065C14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	bne _08065C2E
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08065C2E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EkrDragon_08065C34
EkrDragon_08065C34: @ 0x08065C34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl Proc_End
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x48]
	bl Proc_End
	ldr r3, _08065CB8 @ =gDispIo
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
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _08065CBC @ =0x0203DFE8
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	bl sub_08065DD0
	ldr r0, _08065CC0 @ =gBg3Tm
	ldr r1, _08065CC4 @ =0x0000601F
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	movs r0, #0x10
	bl EfxChapterMapFadeOUT
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065CB8: .4byte gDispIo
_08065CBC: .4byte 0x0203DFE8
_08065CC0: .4byte gBg3Tm
_08065CC4: .4byte 0x0000601F

	thumb_func_start EkrDragon_08065CC8
EkrDragon_08065CC8: @ 0x08065CC8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08065CE6
	ldr r0, _08065D1C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080195BC
	bl RenderMap
_08065CE6:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08065D14
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08065D14:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065D1C: .4byte gPlaySt

	thumb_func_start EkrDragon_08065D20
EkrDragon_08065D20: @ 0x08065D20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08065D38
sub_08065D38: @ 0x08065D38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065D58 @ =gUnk_08C486EC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065D58: .4byte gUnk_08C486EC

	thumb_func_start sub_08065D5C
sub_08065D5C: @ 0x08065D5C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08065DBC @ =0x02020060
	ldr r4, _08065DC0 @ =0x020228E0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08065DB4
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08065DB4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065DBC: .4byte 0x02020060
_08065DC0: .4byte 0x020228E0

	thumb_func_start sub_08065DC4
sub_08065DC4: @ 0x08065DC4
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08065DD0
sub_08065DD0: @ 0x08065DD0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08065E24 @ =gUnk_08C4870C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r5, #0x2c]
	ldr r0, _08065E28 @ =gBg2Tm
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl FillBGRect
	ldr r0, _08065E2C @ =0x0201FAD0
	bl sub_08055718
	ldr r4, _08065E30 @ =0x020228E0
	ldr r1, _08065E34 @ =0x02020060
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	movs r3, #0x10
	bl EfxPalBlackInOut
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065E24: .4byte gUnk_08C4870C
_08065E28: .4byte gBg2Tm
_08065E2C: .4byte 0x0201FAD0
_08065E30: .4byte 0x020228E0
_08065E34: .4byte 0x02020060

	thumb_func_start sub_08065E38
sub_08065E38: @ 0x08065E38
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08065E98 @ =0x02020060
	ldr r4, _08065E9C @ =0x020228E0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08065E90
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08065E90:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065E98: .4byte 0x02020060
_08065E9C: .4byte 0x020228E0

	thumb_func_start sub_08065EA0
sub_08065EA0: @ 0x08065EA0
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08065EAC
sub_08065EAC: @ 0x08065EAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08065EFC @ =gUnk_08C4872C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r0, _08065F00 @ =gUnk_082E76A4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, _08065F04 @ =gUnk_082E9CD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08065F08 @ =gUnk_08C49FA4
	movs r1, #0x14
	bl AnimCreate
	movs r2, #0
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r4, #0x32]
	strh r1, [r0, #2]
	strh r1, [r4, #0x3a]
	strh r1, [r0, #4]
	str r0, [r4, #0x60]
	adds r0, r4, #0
	adds r0, #0x29
	strb r2, [r0]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065EFC: .4byte gUnk_08C4872C
_08065F00: .4byte gUnk_082E76A4
_08065F04: .4byte gUnk_082E9CD8
_08065F08: .4byte gUnk_08C49FA4

	thumb_func_start sub_08065F0C
sub_08065F0C: @ 0x08065F0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x3a]
	strh r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08065F30
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08065F30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08065F38
sub_08065F38: @ 0x08065F38
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08065F7C @ =gUnk_08C48744
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r4, _08065F80 @ =gUnk_08C49EEC
	ldr r0, _08065F84 @ =gUnk_082E9CD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08065F88 @ =gUnk_082E76A4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065F7C: .4byte gUnk_08C48744
_08065F80: .4byte gUnk_08C49EEC
_08065F84: .4byte gUnk_082E9CD8
_08065F88: .4byte gUnk_082E76A4

	thumb_func_start sub_08065F8C
sub_08065F8C: @ 0x08065F8C
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

	thumb_func_start sub_08065F98
sub_08065F98: @ 0x08065F98
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	movs r3, #0
	strh r0, [r2, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0x86
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _08065FDA
	strh r3, [r4, #0x2c]
	ldr r0, _08065FE0 @ =gUnk_08C49FAC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	ldr r0, _08065FE4 @ =gUnk_082E9CD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08065FE8 @ =gUnk_082E8584
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
_08065FDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065FE0: .4byte gUnk_08C49FAC
_08065FE4: .4byte gUnk_082E9CD8
_08065FE8: .4byte gUnk_082E8584

	thumb_func_start sub_08065FEC
sub_08065FEC: @ 0x08065FEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2e
	bne _08066020
	ldr r0, _08066028 @ =gUnk_082E9CD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806602C @ =gUnk_082E76A4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
_08066020:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066028: .4byte gUnk_082E9CD8
_0806602C: .4byte gUnk_082E76A4

	thumb_func_start sub_08066030
sub_08066030: @ 0x08066030
	ldr r2, [r0, #0x60]
	ldrh r1, [r0, #0x32]
	strh r1, [r2, #2]
	ldrh r0, [r0, #0x3a]
	strh r0, [r2, #4]
	bx lr

	thumb_func_start sub_0806603C
sub_0806603C: @ 0x0806603C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08066080 @ =gUnk_08C48774
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r4, _08066084 @ =gUnk_08C49FFC
	ldr r0, _08066088 @ =gUnk_082E9CD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806608C @ =gUnk_082E9240
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066080: .4byte gUnk_08C48774
_08066084: .4byte gUnk_08C49FFC
_08066088: .4byte gUnk_082E9CD8
_0806608C: .4byte gUnk_082E9240

	thumb_func_start sub_08066090
sub_08066090: @ 0x08066090
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

	thumb_func_start sub_0806609C
sub_0806609C: @ 0x0806609C
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	bne _080660C2
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_080660C2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080660C8
sub_080660C8: @ 0x080660C8
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x32]
	movs r3, #0
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x3a]
	strh r0, [r2, #4]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080660EE
	strh r3, [r1, #0x2c]
	ldr r0, _080660F0 @ =gUnk_08C49FFC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
_080660EE:
	bx lr
	.align 2, 0
_080660F0: .4byte gUnk_08C49FFC

	thumb_func_start sub_080660F4
sub_080660F4: @ 0x080660F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08066114 @ =gUnk_08C4879C
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x5c]
	ldrb r1, [r4, #0x12]
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066114: .4byte gUnk_08C4879C

	thumb_func_start sub_08066118
sub_08066118: @ 0x08066118
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08066134
	ldr r0, [r4, #0x5c]
	bl sub_0805001C
	cmp r0, #0
	bne _080661FA
_08066134:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08066146
	cmp r1, #1
	beq _08066160
	b _0806617C
_08066146:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _08066158 @ =gUnk_082E420C
	str r0, [r4, #0x48]
	ldr r0, _0806615C @ =Pal_EkrDragon_082E6C60
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	b _0806617C
	.align 2, 0
_08066158: .4byte gUnk_082E420C
_0806615C: .4byte Pal_EkrDragon_082E6C60
_08066160:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080661A8 @ =gUnk_082E421E
	str r0, [r4, #0x48]
	ldr r0, _080661AC @ =Pal_EkrDragon_082E6C60
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	ldr r0, [r4, #0x5c]
	movs r1, #0x3c
	movs r2, #0xa
	bl sub_080569B8
_0806617C:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080661B4
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080661B0 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _080661D8
	.align 2, 0
_080661A8: .4byte gUnk_082E421E
_080661AC: .4byte Pal_EkrDragon_082E6C60
_080661B0: .4byte 0x02022920
_080661B4:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080661C2
	movs r0, #0
	strb r0, [r5]
	b _080661D8
_080661C2:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080661D8
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl sub_0804F7B8
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080661D8:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _080661F4
	adds r0, r1, #0
	cmp r0, #1
	beq _080661EC
	cmp r0, #3
	bne _080661F0
_080661EC:
	movs r0, #1
	b _080661F2
_080661F0:
	movs r0, #0
_080661F2:
	strb r0, [r5]
_080661F4:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_080661FA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08066200
sub_08066200: @ 0x08066200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08066220 @ =gUnk_08C487B4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x5c]
	ldrb r1, [r4, #0x12]
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066220: .4byte gUnk_08C487B4

	thumb_func_start sub_08066224
sub_08066224: @ 0x08066224
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08066240
	ldr r0, [r4, #0x5c]
	bl sub_0805001C
	cmp r0, #0
	bne _080662EE
_08066240:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08066252
	cmp r1, #1
	beq _08066260
	b _08066272
_08066252:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _0806625C @ =gUnk_082E4318
	b _08066268
	.align 2, 0
_0806625C: .4byte gUnk_082E4318
_08066260:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806629C @ =gUnk_082E431E
_08066268:
	str r0, [r4, #0x48]
	ldr r0, _080662A0 @ =gUnk_082E9CF8
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
_08066272:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080662A8
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080662A4 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _080662CC
	.align 2, 0
_0806629C: .4byte gUnk_082E431E
_080662A0: .4byte gUnk_082E9CF8
_080662A4: .4byte 0x02022B40
_080662A8:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080662B6
	movs r0, #0
	strb r0, [r5]
	b _080662CC
_080662B6:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080662CC
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl sub_0804F7B8
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080662CC:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _080662E8
	adds r0, r1, #0
	cmp r0, #1
	beq _080662E0
	cmp r0, #3
	bne _080662E4
_080662E0:
	movs r0, #1
	b _080662E6
_080662E4:
	movs r0, #0
_080662E6:
	strb r0, [r5]
_080662E8:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_080662EE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080662F4
sub_080662F4: @ 0x080662F4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08066358 @ =gUnk_08C487CC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, _0806635C @ =gUnk_082EA9A4
	ldr r1, _08066360 @ =0x06005000
	bl LZ77UnCompVram
	ldr r0, _08066364 @ =gUnk_082EB530
	ldr r6, _08066368 @ =gEkrTsaBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r0, _0806636C @ =Pal_EkrDragon_082EB510
	ldr r1, _08066370 @ =0x020228E0
	movs r2, #8
	bl CpuFastSet
	ldr r4, _08066374 @ =gBg2Tm
	adds r0, r4, #0
	movs r1, #0x1f
	bl TmFill
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #4
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08066358: .4byte gUnk_08C487CC
_0806635C: .4byte gUnk_082EA9A4
_08066360: .4byte 0x06005000
_08066364: .4byte gUnk_082EB530
_08066368: .4byte gEkrTsaBuffer
_0806636C: .4byte Pal_EkrDragon_082EB510
_08066370: .4byte 0x020228E0
_08066374: .4byte gBg2Tm

	thumb_func_start nullsub_53
nullsub_53: @ 0x08066378
	bx lr
	.align 2, 0

	thumb_func_start nullsub_54
nullsub_54: @ 0x0806637C
	bx lr
	.align 2, 0

	thumb_func_start sub_08066380
sub_08066380: @ 0x08066380
	push {lr}
	ldr r0, _08066394 @ =gUnk_08C487EC
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r1}
	bx r1
	.align 2, 0
_08066394: .4byte gUnk_08C487EC

	thumb_func_start sub_08066398
sub_08066398: @ 0x08066398
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _080663DC @ =0x0201FB20
	ldr r0, [r0]
	ldr r3, _080663E0 @ =0x0201FB2C
	cmp r0, #0
	bne _080663A8
	ldr r3, _080663E4 @ =0x0201FC6C
_080663A8:
	movs r2, #0
	ldr r6, _080663E8 @ =gSinLut
	movs r5, #0xff
_080663AE:
	lsls r0, r2, #1
	movs r7, #0x2c
	ldrsh r1, [r4, r7]
	adds r0, r0, r1
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #0xa
	adds r0, #4
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _080663AE
	ldrh r0, [r4, #0x2c]
	adds r0, #2
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080663DC: .4byte 0x0201FB20
_080663E0: .4byte 0x0201FB2C
_080663E4: .4byte 0x0201FC6C
_080663E8: .4byte gSinLut

	thumb_func_start sub_080663EC
sub_080663EC: @ 0x080663EC
	ldr r0, _08066408 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08066406
	ldr r3, _0806640C @ =0x0400001A
	ldr r2, _08066410 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08066406:
	bx lr
	.align 2, 0
_08066408: .4byte 0x04000004
_0806640C: .4byte 0x0400001A
_08066410: .4byte 0x0201FB28

	thumb_func_start sub_08066414
sub_08066414: @ 0x08066414
	push {r4, r5, r6, r7, lr}
	ldr r2, _08066464 @ =0x0201FB2C
	movs r1, #0
	adds r0, r2, #0
	ldr r4, _08066468 @ =0x0201FC6C
	ldr r5, _0806646C @ =0x0201FB20
	ldr r6, _08066470 @ =0x0201FB24
	ldr r7, _08066474 @ =0x0201FB28
	ldr r3, _08066478 @ =sub_080663EC
	mov ip, r3
	movs r3, #0
_0806642A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806642A
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_0806643A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806643A
	movs r4, #0
	str r4, [r5]
	str r0, [r6]
	str r0, [r7]
	mov r0, ip
	bl SetOnHBlankA
	ldr r0, _0806647C @ =gUnk_08C48804
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08066464: .4byte 0x0201FB2C
_08066468: .4byte 0x0201FC6C
_0806646C: .4byte 0x0201FB20
_08066470: .4byte 0x0201FB24
_08066474: .4byte 0x0201FB28
_08066478: .4byte sub_080663EC
_0806647C: .4byte gUnk_08C48804

	thumb_func_start sub_08066480
sub_08066480: @ 0x08066480
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_0806648C
sub_0806648C: @ 0x0806648C
	ldr r1, _080664A0 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _080664AC
	movs r0, #0
	str r0, [r1]
	ldr r1, _080664A4 @ =0x0201FB24
	ldr r0, _080664A8 @ =0x0201FB2C
	b _080664B4
	.align 2, 0
_080664A0: .4byte 0x0201FB20
_080664A4: .4byte 0x0201FB24
_080664A8: .4byte 0x0201FB2C
_080664AC:
	movs r0, #1
	str r0, [r1]
	ldr r1, _080664C0 @ =0x0201FB24
	ldr r0, _080664C4 @ =0x0201FC6C
_080664B4:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _080664C8 @ =0x0201FB28
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_080664C0: .4byte 0x0201FB24
_080664C4: .4byte 0x0201FC6C
_080664C8: .4byte 0x0201FB28

	thumb_func_start sub_080664CC
sub_080664CC: @ 0x080664CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080664FC @ =gUnk_08C48824
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080664FC: .4byte gUnk_08C48824

	thumb_func_start sub_08066500
sub_08066500: @ 0x08066500
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldr r0, _0806657C @ =0x0201FDAC
	ldr r0, [r0]
	ldr r2, _08066580 @ =0x0201FDB8
	cmp r0, #0
	bne _08066518
	ldr r2, _08066584 @ =0x0201FEF8
_08066518:
	ldr r0, [r1, #0x50]
	ldrh r3, [r1, #0x2e]
	adds r0, r3, r0
	strh r0, [r1, #0x2e]
	movs r4, #0
	movs r3, #0
	ldr r6, [r1, #0x44]
	mov r8, r6
	ldr r7, [r1, #0x48]
	mov sl, r7
	ldr r0, _08066588 @ =gUnk_08C4A008
	mov ip, r0
	ldr r5, [r1, #0x4c]
	ldr r6, _0806658C @ =gDispIo
	mov sb, r6
_08066536:
	add r4, sl
	lsrs r0, r4, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, #4
	mov r6, sb
	ldrh r6, [r6, #0x28]
	adds r0, r6, r0
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x77
	bls _08066536
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _0806656E
	adds r0, r1, #0
	bl Proc_End
_0806656E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806657C: .4byte 0x0201FDAC
_08066580: .4byte 0x0201FDB8
_08066584: .4byte 0x0201FEF8
_08066588: .4byte gUnk_08C4A008
_0806658C: .4byte gDispIo

	thumb_func_start sub_08066590
sub_08066590: @ 0x08066590
	ldr r0, _080665AC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080665AA
	ldr r3, _080665B0 @ =0x0400001C
	ldr r2, _080665B4 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_080665AA:
	bx lr
	.align 2, 0
_080665AC: .4byte 0x04000004
_080665B0: .4byte 0x0400001C
_080665B4: .4byte 0x0201FDB4

	thumb_func_start sub_080665B8
sub_080665B8: @ 0x080665B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08066618 @ =0x0201FDB8
	movs r2, #0
	adds r0, r3, #0
	ldr r4, _0806661C @ =0x0201FEF8
	ldr r7, _08066620 @ =0x0201FDAC
	ldr r5, _08066624 @ =0x0201FDB0
	mov ip, r5
	ldr r5, _08066628 @ =0x0201FDB4
	ldr r6, _0806662C @ =sub_08066590
_080665D6:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _080665D6
	adds r3, r4, #0
	movs r2, #0
_080665E4:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _080665E4
	movs r4, #0
	str r4, [r7]
	mov r1, ip
	str r0, [r1]
	str r0, [r5]
	adds r0, r6, #0
	bl SetOnHBlankA
	ldr r0, _08066630 @ =gUnk_08C4883C
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	mov r5, r8
	str r5, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066618: .4byte 0x0201FDB8
_0806661C: .4byte 0x0201FEF8
_08066620: .4byte 0x0201FDAC
_08066624: .4byte 0x0201FDB0
_08066628: .4byte 0x0201FDB4
_0806662C: .4byte sub_08066590
_08066630: .4byte gUnk_08C4883C

	thumb_func_start sub_08066634
sub_08066634: @ 0x08066634
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08066640
sub_08066640: @ 0x08066640
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08066658 @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08066664
	movs r0, #0
	str r0, [r1]
	ldr r1, _0806665C @ =0x0201FDB0
	ldr r0, _08066660 @ =0x0201FDB8
	b _0806666C
	.align 2, 0
_08066658: .4byte 0x0201FDAC
_0806665C: .4byte 0x0201FDB0
_08066660: .4byte 0x0201FDB8
_08066664:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08066698 @ =0x0201FDB0
	ldr r0, _0806669C @ =0x0201FEF8
_0806666C:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _080666A0 @ =0x0201FDB4
	ldr r0, [r0]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _08066692
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_08066692:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066698: .4byte 0x0201FDB0
_0806669C: .4byte 0x0201FEF8
_080666A0: .4byte 0x0201FDB4

	thumb_func_start sub_080666A4
sub_080666A4: @ 0x080666A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080666CC @ =gUnk_08C4885C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r1, _080666D0 @ =gUnk_08C48874
	str r1, [r0, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080666CC: .4byte gUnk_08C4885C
_080666D0: .4byte gUnk_08C48874

	thumb_func_start sub_080666D4
sub_080666D4: @ 0x080666D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r0, r1
	beq _08066744
	str r1, [r4, #0x54]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	cmp r1, #9
	bhi _08066744
	lsls r0, r1, #2
	ldr r1, _080666FC @ =_08066700
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080666FC: .4byte _08066700
_08066700: @ jump table
	.4byte _08066728 @ case 0
	.4byte _08066730 @ case 1
	.4byte _08066728 @ case 2
	.4byte _08066730 @ case 3
	.4byte _08066738 @ case 4
	.4byte _08066738 @ case 5
	.4byte _08066740 @ case 6
	.4byte _08066740 @ case 7
	.4byte _08066740 @ case 8
	.4byte _08066728 @ case 9
_08066728:
	ldr r0, _0806672C @ =gUnk_082E441E
	b _08066742
	.align 2, 0
_0806672C: .4byte gUnk_082E441E
_08066730:
	ldr r0, _08066734 @ =gUnk_082E4430
	b _08066742
	.align 2, 0
_08066734: .4byte gUnk_082E4430
_08066738:
	ldr r0, _0806673C @ =gUnk_082E4442
	b _08066742
	.align 2, 0
_0806673C: .4byte gUnk_082E4442
_08066740:
	ldr r0, _08066778 @ =gUnk_082E4418
_08066742:
	str r0, [r4, #0x48]
_08066744:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08066784
	ldr r1, [r4, #0x4c]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0806677C @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08066780 @ =gEkrBgPosition
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	b _080667F8
	.align 2, 0
_08066778: .4byte gUnk_082E4418
_0806677C: .4byte gEkrTsaBuffer
_08066780: .4byte gEkrBgPosition
_08066784:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080667B2
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080667A8
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _080667F8
	b _080667C2
_080667A8:
	bl sub_0804DD50
	cmp r0, #1
	bne _080667F8
	b _080667EC
_080667B2:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080667D6
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080667C8
_080667C2:
	movs r0, #1
	strh r0, [r4, #0x2e]
	b _080667F8
_080667C8:
	ldr r1, [r4, #0x5c]
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _080667F8
	b _080667EC
_080667D6:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080667F8
	ldr r0, _08066800 @ =0x000002F2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_080667EC:
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080667F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066800: .4byte 0x000002F2

	thumb_func_start sub_08066804
sub_08066804: @ 0x08066804
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08066824 @ =gUnk_08C4887C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x29
	strb r2, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066824: .4byte gUnk_08C4887C

	thumb_func_start sub_08066828
sub_08066828: @ 0x08066828
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _080668A8 @ =Pal_EkrDragon_082E6C60
	ldr r4, _080668AC @ =0x02022920
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _080668B0 @ =0x02000054
	ldr r0, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #8
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	adds r0, r5, #0
	bl EkrDragonUpdatePal_08065510
	bl EnablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0806689E
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0806689E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080668A8: .4byte Pal_EkrDragon_082E6C60
_080668AC: .4byte 0x02022920
_080668B0: .4byte 0x02000054

	thumb_func_start nullsub_55
nullsub_55: @ 0x080668B4
	bx lr
	.align 2, 0

	thumb_func_start sub_080668B8
sub_080668B8: @ 0x080668B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	asrs r5, r5, #3
	asrs r4, r4, #3
	ldr r0, _08066944 @ =gUnk_082E7418
	ldr r6, _08066948 @ =gEkrTsaBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	lsls r5, r5, #1
	lsls r2, r4, #5
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r7, _0806694C @ =gEfxFrameTmap
	adds r2, r2, r7
	adds r2, r5, r2
	movs r1, #0x20
	mov sl, r1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #6
	mov sb, r1
	str r1, [sp, #8]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0xc]
	subs r1, #1
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
	adds r4, #2
	lsls r0, r4, #5
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r5, r5, r0
	mov r0, sl
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r5, #0
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066944: .4byte gUnk_082E7418
_08066948: .4byte gEkrTsaBuffer
_0806694C: .4byte gEfxFrameTmap

	thumb_func_start sub_08066950
sub_08066950: @ 0x08066950
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl SetBgOffset
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _0806699C @ =gEfxFrameTmap
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _080669A0 @ =gBg3Tm
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806699C: .4byte gEfxFrameTmap
_080669A0: .4byte gBg3Tm

	thumb_func_start sub_080669A4
sub_080669A4: @ 0x080669A4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080669DC @ =gUnk_08C4889C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	ldr r0, _080669E0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080669CA
	ldr r0, _080669E4 @ =0x0000FFE0
_080669CA:
	strh r0, [r5, #0x32]
	movs r0, #1
	bl sub_080034C8
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080669DC: .4byte gUnk_08C4889C
_080669E0: .4byte gEkrDistanceType
_080669E4: .4byte 0x0000FFE0

	thumb_func_start sub_080669E8
sub_080669E8: @ 0x080669E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08066A14
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066F80
	ldr r0, _08066ACC @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066A14:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x23
	bne _08066A32
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066F80
	ldr r0, _08066ACC @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066A32:
	ldrh r1, [r5, #0x2c]
	cmp r1, #0x32
	bne _08066A50
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066F80
	ldr r0, _08066ACC @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066A50:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x36
	bne _08066AAE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r5, #0x3a]
	strh r6, [r5, #0x3c]
	ldr r0, [r5, #0x5c]
	bl sub_0806603C
	str r0, [r5, #0x64]
	ldr r1, [r5, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, #0x16
	strh r1, [r0, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r2, [r5, #0x3a]
	subs r0, r0, r2
	adds r0, #0xd8
	strh r0, [r1, #0x3a]
	ldr r0, _08066AD0 @ =gUnk_082E6E8C
	ldr r1, _08066AD4 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	ldr r0, _08066AD8 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _08066ADC @ =gBg3Tm
	movs r1, #0x1f
	bl TmFill
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r1, #0xf0
	bl sub_080668B8
	movs r0, #0
	adds r1, r4, #0
	bl sub_08066950
_08066AAE:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x64
	bne _08066AC4
	strh r6, [r5, #0x2c]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x2e]
	strh r6, [r5, #0x30]
	adds r0, r5, #0
	bl Proc_Break
_08066AC4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066ACC: .4byte 0x00000147
_08066AD0: .4byte gUnk_082E6E8C
_08066AD4: .4byte gEkrTsaBuffer
_08066AD8: .4byte 0x001F001F
_08066ADC: .4byte gBg3Tm

	thumb_func_start sub_08066AE0
sub_08066AE0: @ 0x08066AE0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r1, r0, #0
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x16
	movs r7, #0
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r1
	adds r0, #0xd8
	strh r0, [r2, #0x3a]
	ldr r2, [r4, #0x64]
	ldr r5, _08066C9C @ =0x02017760
	ldrh r3, [r2, #0x32]
	ldrh r6, [r5]
	subs r0, r3, r6
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldrh r3, [r2, #0x3a]
	ldrh r6, [r5, #2]
	subs r0, r3, r6
	strh r0, [r2, #0x3a]
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	bl sub_08066950
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _08066CA0 @ =0x02000038
	ldrh r0, [r5]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r5]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	ldrh r3, [r6, #2]
	adds r1, r2, r3
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	ldrh r1, [r4, #0x2c]
	adds r1, #1
	strh r1, [r4, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, #1
	cmp r1, r0
	bne _08066BB2
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
_08066BB2:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08066BD8
	movs r0, #8
	movs r1, #0
	bl sub_0804EF18
	str r0, [r4, #0x54]
	ldr r0, _08066CA4 @ =0x000002F3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066BD8:
	ldrh r3, [r4, #0x30]
	cmp r3, #0x3c
	bne _08066BEE
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #9
	movs r1, #0
	bl sub_0804EF18
	str r0, [r4, #0x54]
_08066BEE:
	ldrh r0, [r4, #0x30]
	cmp r0, #0x5a
	bne _08066C04
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xa
	movs r1, #0
	bl sub_0804EF18
	str r0, [r4, #0x54]
_08066C04:
	ldrh r1, [r4, #0x30]
	cmp r1, #0x87
	bne _08066C14
	movs r0, #0x3c
	movs r1, #0x1e
	movs r2, #0x78
	bl sub_08066F80
_08066C14:
	ldrh r2, [r4, #0x30]
	cmp r2, #0xc8
	bne _08066C7A
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x54]
	bl Proc_End
	strh r7, [r5]
	strh r7, [r5, #2]
	movs r3, #0x3c
	ldrsh r1, [r4, r3]
	movs r0, #0
	bl sub_08066950
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r6]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	movs r0, #0x10
	bl EkrDragonUpdatePal_08065510
_08066C7A:
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r5, [r4, #0x30]
	cmp r5, r0
	bne _08066C92
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08066C92:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066C9C: .4byte 0x02017760
_08066CA0: .4byte 0x02000038
_08066CA4: .4byte 0x000002F3

	thumb_func_start nullsub_56
nullsub_56: @ 0x08066CA8
	bx lr
	.align 2, 0

	thumb_func_start sub_08066CAC
sub_08066CAC: @ 0x08066CAC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08066D18 @ =gUnk_08C488C4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _08066D1C @ =gUnk_082E9DD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08066D20 @ =gUnk_082EA7C8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08066D24 @ =gUnk_082EA7E8
	ldr r4, _08066D28 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08066D2C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08066D18: .4byte gUnk_08C488C4
_08066D1C: .4byte gUnk_082E9DD8
_08066D20: .4byte gUnk_082EA7C8
_08066D24: .4byte gUnk_082EA7E8
_08066D28: .4byte gEkrTsaBuffer
_08066D2C: .4byte gBg1Tm

	thumb_func_start sub_08066D30
sub_08066D30: @ 0x08066D30
	push {lr}
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08066D40
sub_08066D40: @ 0x08066D40
	push {r4, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2, #0x44]
	ldr r1, _08066D80 @ =gDispIo
	asrs r0, r0, #8
	movs r3, #0
	strh r0, [r1, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	beq _08066D98
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _08066D84
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_080566F0
	b _08066D98
	.align 2, 0
_08066D80: .4byte gDispIo
_08066D84:
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	adds r0, #0x1e
	cmp r1, r0
	bne _08066D98
	adds r0, r2, #0
	bl Proc_Break
_08066D98:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08066DA0
sub_08066DA0: @ 0x08066DA0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r0, _08066DD4 @ =gUnk_08C488E4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_0804EF18
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066DD4: .4byte gUnk_08C488E4

	thumb_func_start sub_08066DD8
sub_08066DD8: @ 0x08066DD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, [r0, #0x5c]
	str r0, [sp]
	ldr r4, _08066F6C @ =0x02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r7, _08066F70 @ =0x02000038
	ldrh r2, [r4]
	ldrh r3, [r7]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r6, [r4, #2]
	ldrh r0, [r7, #2]
	adds r2, r6, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #3
	bl SetBgOffset
	ldrh r5, [r4]
	ldr r0, _08066F74 @ =0x02000028
	ldrh r0, [r0]
	subs r1, r0, r5
	ldr r2, _08066F78 @ =gEkrBgPosition
	ldr r0, [r2]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08066F7C @ =0x0200002C
	mov sl, r3
	ldrh r4, [r4, #2]
	ldrh r6, [r3]
	subs r2, r6, r4
	lsls r2, r2, #0x10
	ldr r3, _08066F74 @ =0x02000028
	ldrh r3, [r3, #2]
	adds r5, r5, r3
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r6, sl
	ldrh r6, [r6, #2]
	subs r4, r6, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r0, r1, #0x10
	mov r8, r0
	asrs r1, r1, #0x10
	lsrs r6, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r6, [r3, #0x2e]
	lsls r1, r6, #0x10
	cmp r0, r1
	ble _08066F5C
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r7]
	ldrh r2, [r7, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r7]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r7, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r7]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r7, [r7, #2]
	rsbs r1, r7, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r6, _08066F78 @ =gEkrBgPosition
	ldr r4, [r6]
	ldr r0, _08066F74 @ =0x02000028
	ldrh r0, [r0]
	subs r1, r0, r4
	lsls r1, r1, #0x10
	ldr r2, _08066F74 @ =0x02000028
	ldrh r2, [r2, #2]
	subs r4, r2, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r3, sl
	ldrh r5, [r3, #2]
	lsrs r6, r1, #0x10
	mov r8, r6
	asrs r1, r1, #0x10
	ldrh r6, [r3]
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldr r0, [r3, #0x60]
	bl Proc_End
	mov r0, sb
	bl Proc_Break
_08066F5C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066F6C: .4byte 0x02017760
_08066F70: .4byte 0x02000038
_08066F74: .4byte 0x02000028
_08066F78: .4byte gEkrBgPosition
_08066F7C: .4byte 0x0200002C

	thumb_func_start sub_08066F80
sub_08066F80: @ 0x08066F80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08066FB8 @ =gUnk_08C488FC
	movs r1, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _08066FBC @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	subs r1, #0x21
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066FB8: .4byte gUnk_08C488FC
_08066FBC: .4byte gDispIo

	thumb_func_start sub_08066FC0
sub_08066FC0: @ 0x08066FC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08067028 @ =gPal
	ldr r4, _0806702C @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08067020
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08067020:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067028: .4byte gPal
_0806702C: .4byte 0x020165C8

	thumb_func_start sub_08067030
sub_08067030: @ 0x08067030
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08067080 @ =gPal
	ldr r4, _08067084 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _0806707A
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0806707A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067080: .4byte gPal
_08067084: .4byte 0x020165C8

	thumb_func_start sub_08067088
sub_08067088: @ 0x08067088
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _080670F0 @ =gPal
	ldr r4, _080670F4 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x4c]
	cmp r0, r1
	ble _080670E8
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_080670E8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080670F0: .4byte gPal
_080670F4: .4byte 0x020165C8

	thumb_func_start sub_080670F8
sub_080670F8: @ 0x080670F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08067124 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x3d
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067124: .4byte gDispIo

	thumb_func_start sub_08067128
sub_08067128: @ 0x08067128
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x1c]
	mov r8, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _0806718E
	movs r0, #0x20
	mov r3, ip
	subs r0, r0, r3
	lsls r0, r0, #0x10
	mov sb, r0
_08067150:
	mov r3, ip
	subs r5, r2, #1
	cmp r3, #0
	beq _08067182
	movs r2, #1
	rsbs r2, r2, #0
	ldr r7, _0806719C @ =0x00000FFF
	lsls r4, r6, #0xc
_08067160:
	ldrh r0, [r1]
	cmp r6, r2
	beq _0806716E
	ands r0, r7
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0806716E:
	cmp r8, r2
	beq _08067178
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08067178:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08067160
_08067182:
	mov r2, sb
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08067150
_0806718E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806719C: .4byte 0x00000FFF

	thumb_func_start FillBGRect
FillBGRect: @ 0x080671A0
	push {r4, r5, r6, r7, lr}
	adds r5, r3, #0
	ldr r7, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080671D8
	movs r0, #0x20
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0xf
	lsls r5, r5, #0xc
_080671BE:
	adds r0, r4, #0
	subs r2, #1
	cmp r0, #0
	beq _080671D2
	adds r1, r7, r5
_080671C8:
	strh r1, [r3]
	adds r3, #2
	subs r0, #1
	cmp r0, #0
	bne _080671C8
_080671D2:
	adds r3, r3, r6
	cmp r2, #0
	bne _080671BE
_080671D8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080671E0
sub_080671E0: @ 0x080671E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x18]
	mov ip, r3
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _0806723C
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	mov r8, r0
_08067202:
	adds r3, r7, #0
	subs r5, r2, #1
	cmp r3, #0
	beq _08067230
	movs r2, #1
	rsbs r2, r2, #0
	lsls r4, r6, #0xc
_08067210:
	ldrh r0, [r1]
	cmp r6, r2
	beq _0806721C
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0806721C:
	cmp ip, r2
	beq _08067226
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08067226:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08067210
_08067230:
	mov r2, r8
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08067202
_0806723C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxTmModifyPal
EfxTmModifyPal: @ 0x08067248
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080672A4
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	mov r8, r0
	ldr r0, _080672B0 @ =gUnk_08C4A288
	mov sb, r0
_0806726C:
	mov r4, ip
	subs r2, #1
	cmp r4, #0
	beq _0806729A
	ldr r7, _080672B4 @ =0x00000FFF
	mov r6, sb
	movs r5, #0xf
_0806727A:
	ldrh r0, [r3]
	adds r1, r0, #0
	lsrs r0, r0, #0xc
	ands r0, r5
	subs r0, #6
	lsls r0, r0, #0x10
	ands r1, r7
	lsrs r0, r0, #0xf
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r1, r0, r1
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _0806727A
_0806729A:
	mov r1, r8
	lsrs r0, r1, #0xf
	adds r3, r3, r0
	cmp r2, #0
	bne _0806726C
_080672A4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080672B0: .4byte gUnk_08C4A288
_080672B4: .4byte 0x00000FFF

	thumb_func_start EfxTmCpyBG
EfxTmCpyBG: @ 0x080672B8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	adds r2, r6, #0
	movs r3, #0x20
	bl EfxTmCpyExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxTmCpyBgHFlip
EfxTmCpyBgHFlip: @ 0x080672E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	adds r2, r6, #0
	movs r3, #0x20
	bl EfxTmCpyExtHFlip
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxTmCpyExt
EfxTmCpyExt: @ 0x08067318
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	mov r8, r6
	ldr r6, [sp, #0x34]
	mov ip, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080673B4
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	subs r0, r6, r7
	lsls r0, r0, #0x10
	mov sl, r0
	subs r0, r3, r7
	lsls r0, r0, #0x10
	mov sb, r0
_08067360:
	adds r1, r7, #0
	subs r6, r2, #1
	cmp r1, #0
	beq _08067392
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, r8
	lsls r3, r0, #0xc
_08067370:
	ldrh r0, [r5]
	cmp r8, r2
	beq _0806737C
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0806737C:
	cmp ip, r2
	beq _08067386
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08067386:
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08067370
_08067392:
	ldr r2, _080673C4 @ =0xFFFF0000
	asrs r1, r2, #0x10
	ldr r0, [sp]
	cmp r0, r1
	beq _080673A2
	mov r2, sl
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_080673A2:
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _080673AE
	mov r1, sb
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_080673AE:
	adds r2, r6, #0
	cmp r2, #0
	bne _08067360
_080673B4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080673C4: .4byte 0xFFFF0000

	thumb_func_start EfxTmCpyExtHFlip
EfxTmCpyExtHFlip: @ 0x080673C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r6, [sp, #0x34]
	mov sb, r6
	ldr r6, [sp, #0x38]
	mov r8, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r2, r2, #0x10
	lsls r0, r0, #1
	subs r0, #2
	adds r4, r4, r0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08067476
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #8]
	mov r1, ip
	subs r0, r6, r1
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	mov sl, r0
_0806741A:
	mov r1, ip
	subs r7, r2, #1
	cmp r1, #0
	beq _08067454
	movs r2, #1
	rsbs r2, r2, #0
	mov r6, sb
	lsls r3, r6, #0xc
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r0, #0
_08067430:
	ldrh r0, [r5]
	cmp sb, r2
	beq _0806743C
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0806743C:
	cmp r8, r2
	beq _08067446
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08067446:
	eors r0, r6
	strh r0, [r4]
	adds r5, #2
	subs r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08067430
_08067454:
	ldr r2, _08067488 @ =0xFFFF0000
	asrs r1, r2, #0x10
	ldr r6, [sp]
	cmp r6, r1
	beq _08067464
	ldr r2, [sp, #4]
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08067464:
	ldr r6, [sp, #8]
	cmp r6, r1
	beq _08067470
	mov r1, sl
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_08067470:
	adds r2, r7, #0
	cmp r2, #0
	bne _0806741A
_08067476:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067488: .4byte 0xFFFF0000

	thumb_func_start sub_0806748C
sub_0806748C: @ 0x0806748C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r0, #0
	mov ip, r0
	cmp r7, #0
	beq _0806755C
	movs r2, #0
_0806749E:
	cmp r7, r2
	bgt _080674B4
	mov r1, ip
	cmp r1, #0
	bne _080674B0
	movs r0, #1
	mov ip, r0
	movs r0, #0xe
	b _08067514
_080674B0:
	movs r0, #0xff
	b _08067514
_080674B4:
	adds r0, r2, #1
	cmp r7, r0
	bne _080674D0
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _080674C6
	movs r0, #0xd
	b _08067514
_080674C6:
	adds r1, r2, #4
	cmp r6, r0
	bne _08067556
	movs r0, #0xc
	b _08067552
_080674D0:
	adds r4, r2, #2
	cmp r7, r4
	bne _080674F4
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _080674E2
	movs r0, #0xb
	b _08067514
_080674E2:
	cmp r6, r0
	bne _080674EA
	movs r0, #0xa
	b _08067514
_080674EA:
	adds r1, r2, #4
	cmp r6, r4
	bne _08067556
	movs r0, #9
	b _08067552
_080674F4:
	adds r5, r2, #3
	cmp r7, r5
	bne _08067526
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _08067506
	movs r0, #8
	b _08067514
_08067506:
	cmp r6, r0
	bne _0806750E
	movs r0, #7
	b _08067514
_0806750E:
	cmp r6, r4
	bne _0806751C
	movs r0, #6
_08067514:
	strh r0, [r3]
	adds r3, #2
	adds r1, r2, #4
	b _08067556
_0806751C:
	adds r1, r2, #4
	cmp r6, r5
	bne _08067556
	movs r0, #5
	b _08067552
_08067526:
	adds r1, r2, #4
	cmp r7, r1
	blt _08067556
	cmp r6, r2
	bgt _08067534
	movs r0, #4
	b _08067552
_08067534:
	cmp r6, r0
	bne _0806753C
	movs r0, #3
	b _08067552
_0806753C:
	cmp r6, r4
	bne _08067544
	movs r0, #2
	b _08067552
_08067544:
	cmp r6, r5
	bne _0806754C
	movs r0, #1
	b _08067552
_0806754C:
	cmp r6, r1
	blt _08067556
	movs r0, #0
_08067552:
	strh r0, [r3]
	adds r3, #2
_08067556:
	adds r2, r1, #0
	cmp r2, #0x28
	ble _0806749E
_0806755C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrModifyBarfx
EkrModifyBarfx: @ 0x08067564
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r3, #5
	ble _08067572
	movs r0, #6
	b _0806757A
_08067572:
	ldr r0, _08067594 @ =gUnk_082EB740
	lsls r1, r3, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_0806757A:
	strh r0, [r2]
	adds r2, #2
	movs r1, #0
	movs r7, #0x10
	ldr r6, _08067598 @ =gUnk_082EB74E
	subs r4, r3, #6
	movs r5, #7
_08067588:
	adds r0, r1, #0
	adds r0, #0xe
	cmp r3, r0
	blt _0806759C
	strh r7, [r2]
	b _080675B0
	.align 2, 0
_08067594: .4byte gUnk_082EB740
_08067598: .4byte gUnk_082EB74E
_0806759C:
	adds r0, r1, #6
	cmp r3, r0
	blt _080675AE
	subs r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	b _080675B0
_080675AE:
	strh r5, [r2]
_080675B0:
	adds r2, #2
	adds r1, #8
	cmp r1, #0x57
	ble _08067588
	cmp r3, #0x62
	ble _080675C0
	movs r0, #0x17
	b _080675DA
_080675C0:
	cmp r3, #0x5d
	ble _080675D8
	ldr r0, _080675D4 @ =gUnk_082EB760
	adds r1, r3, #0
	subs r1, #0x5e
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _080675DA
	.align 2, 0
_080675D4: .4byte gUnk_082EB760
_080675D8:
	movs r0, #0x11
_080675DA:
	strh r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrPalModifyUnused
EkrPalModifyUnused: @ 0x080675E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	cmp r3, #0
	beq _080676B4
	str r3, [sp, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0806761A:
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	mov r3, sb
	ands r3, r0
	mov sb, r3
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	str r7, [sp]
	movs r0, #0
	mov r3, sl
	bl Interpolate
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r7, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	mov r3, sl
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r7, [sp]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	mov r3, sl
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r2, [sp, #4]
	adds r2, #2
	str r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r3, #2
	str r3, [sp, #8]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x18]
	subs r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0
	bne _0806761A
_080676B4:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	cmp r1, r2
	beq _080676C0
	movs r0, #0
	b _080676C2
_080676C0:
	movs r0, #1
_080676C2:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EfxPalBlackInOut
EfxPalBlackInOut: @ 0x080676D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r3, #5
	movs r1, #0x10
	bl Div
	adds r6, r0, #0
	adds r0, r4, r5
	cmp r4, r0
	bge _08067744
	mov r8, r0
	movs r0, #0x1f
	mov ip, r0
_080676F8:
	lsls r0, r4, #5
	adds r7, r4, #1
	mov r1, sb
	adds r5, r1, r0
	movs r4, #0xf
_08067702:
	ldrh r1, [r5]
	movs r2, #0x1f
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r0, ip
	ands r3, r0
	lsrs r1, r1, #0x1a
	ands r1, r0
	adds r0, r2, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r3, r3, r0
	adds r0, r1, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r5]
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _08067702
	adds r4, r7, #0
	cmp r4, r8
	blt _080676F8
_08067744:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxPalWhiteInOut
EfxPalWhiteInOut: @ 0x08067750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r3, #5
	movs r1, #0x10
	bl Div
	adds r6, r0, #0
	adds r0, r4, r5
	cmp r4, r0
	bge _080677C6
	mov sb, r0
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0x1f
_08067778:
	lsls r0, r4, #5
	adds r4, #1
	mov ip, r4
	mov r1, sl
	adds r5, r1, r0
	movs r4, #0xf
_08067784:
	ldrh r1, [r5]
	adds r2, r7, #0
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r0, r8
	ands r3, r0
	lsrs r1, r1, #0x1a
	ands r1, r0
	subs r0, r7, r2
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r2, r2, r0
	subs r0, r7, r3
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r3, r3, r0
	subs r0, r7, r1
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r5]
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _08067784
	mov r4, ip
	cmp r4, sb
	blt _08067778
_080677C6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxPalGrayInOut
EfxPalGrayInOut: @ 0x080677D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	adds r6, r1, #0
	mov r8, r2
	adds r0, r3, #0
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #5
	movs r1, #0x10
	bl Div
	mov sl, r0
	lsls r4, r4, #5
	adds r0, r4, #0
	movs r1, #0x10
	bl Div
	mov sb, r0
	lsls r5, r5, #5
	adds r0, r5, #0
	movs r1, #0x10
	bl Div
	mov ip, r0
	mov r1, r8
	adds r0, r6, r1
	cmp r6, r0
	bge _0806787A
	str r0, [sp, #4]
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0x1f
_0806781E:
	lsls r0, r6, #5
	adds r6, #1
	str r6, [sp, #8]
	ldr r1, [sp]
	adds r4, r1, r0
	movs r5, #0xf
_0806782A:
	ldrh r1, [r4]
	adds r2, r7, #0
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r6, r8
	ands r3, r6
	lsrs r1, r1, #0x1a
	ands r1, r6
	subs r0, r7, r2
	mov r6, sl
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r2, r2, r0
	subs r0, r7, r3
	mov r6, sb
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r3, r3, r0
	subs r0, r7, r1
	mov r6, ip
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _0806782A
	ldr r6, [sp, #8]
	ldr r0, [sp, #4]
	cmp r6, r0
	blt _0806781E
_0806787A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxPalModifyPetrifyEffect
EfxPalModifyPetrifyEffect: @ 0x0806788C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, r1, r2
	cmp r1, r0
	bge _080678F2
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
_080678A4:
	movs r5, #0
	lsls r6, r1, #5
	adds r7, r1, #1
_080678AA:
	mov r1, sb
	adds r4, r1, r6
	lsls r0, r5, #1
	adds r4, r4, r0
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x15
	mov r1, r8
	ands r3, r1
	lsrs r2, r2, #0x1a
	ands r2, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r0, r1, #0
	movs r1, #0xa
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #5
	orrs r0, r1
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r4]
	adds r5, #1
	cmp r5, #0xf
	ble _080678AA
	adds r1, r7, #0
	cmp r1, sl
	blt _080678A4
_080678F2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxSplitColor
EfxSplitColor: @ 0x08067900
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	cmp r5, r6
	bhs _08067938
	movs r7, #0x1f
	movs r0, #0x1f
	mov ip, r0
_08067914:
	ldrh r0, [r4]
	adds r4, #2
	adds r1, r0, #0
	mov r2, ip
	ands r1, r2
	lsrs r2, r0, #5
	ands r2, r7
	lsrs r0, r0, #0xa
	ands r0, r7
	strb r1, [r3]
	adds r3, #1
	strb r2, [r3]
	adds r3, #1
	strb r0, [r3]
	adds r3, #1
	adds r5, #1
	cmp r5, r6
	blo _08067914
_08067938:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxSplitColorPetrify
EfxSplitColorPetrify: @ 0x08067940
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	movs r6, #0
	cmp r6, r7
	bhs _0806798E
	movs r0, #0x1f
	mov r8, r0
_08067956:
	ldrh r2, [r5]
	adds r5, #2
	movs r1, #0x1f
	ands r1, r2
	lsrs r3, r2, #5
	mov r0, r8
	ands r3, r0
	lsrs r2, r2, #0xa
	ands r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0xa
	bl Div
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	adds r6, #1
	cmp r6, r7
	blo _08067956
_0806798E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08067998
sub_08067998: @ 0x08067998
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	mov sb, r0
	movs r7, #0
	cmp r7, r8
	bhs _08067A0C
_080679B2:
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	adds r7, #1
	cmp r7, r8
	blo _080679B2
_08067A0C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxDecodeSplitedPalette
EfxDecodeSplitedPalette: @ 0x08067A18
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x1c]
	mov sb, r0
	ldr r7, [sp, #0x20]
	movs r0, #0
	mov r8, r0
	cmp r8, sb
	bhs _08067AA4
_08067A36:
	ldr r0, [sp, #0x24]
	cmp r7, r0
	beq _08067A7A
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r4, #2
	movs r0, #0
	ldrsh r3, [r4, r0]
	adds r4, #2
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r4, #2
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r1, r0, #8
	adds r0, r3, #0
	muls r0, r7, r0
	asrs r3, r0, #8
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r2, r0, #8
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r1, r1, r0
	adds r6, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r3, r3, r0
	adds r6, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r2, r2, r0
	adds r6, #1
	b _08067A8C
_08067A7A:
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r5, #1
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r5, #1
	movs r2, #0
	ldrsb r2, [r5, r2]
	adds r5, #1
_08067A8C:
	lsls r0, r3, #5
	orrs r1, r0
	lsls r0, r2, #0xa
	orrs r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	movs r0, #1
	add r8, r0
	cmp r8, sb
	blo _08067A36
_08067AA4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxChapterMapFadeOUT
EfxChapterMapFadeOUT: @ 0x08067AB0
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackChapterMapPalette
	ldr r0, _08067AD0 @ =gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067AD0: .4byte gPal

	thumb_func_start sub_08067AD4
sub_08067AD4: @ 0x08067AD4
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	adds r4, #1
	adds r1, r4, #0
	bl DivRem
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewEkrsubAnimeEmulator
NewEkrsubAnimeEmulator: @ 0x08067AEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r0, _08067B34 @ =gUnk_08C4A29C
	bl Proc_Start
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r3, r0, #0
	adds r3, #0x29
	strb r4, [r3]
	adds r3, #1
	strb r2, [r3]
	strh r5, [r0, #0x32]
	strh r6, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	mov r2, r8
	str r2, [r0, #0x44]
	str r1, [r0, #0x48]
	str r7, [r0, #0x4c]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067B34: .4byte gUnk_08C4A29C

	thumb_func_start EkrsubAnimeEmulatorMain
EkrsubAnimeEmulatorMain: @ 0x08067B38
	push {r4, r5, lr}
	sub sp, #0x48
	adds r2, r0, #0
	ldr r1, [r2, #0x44]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _08067BB0
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r1, #0x3f
	ldrb r0, [r0, #3]
	ands r1, r0
	cmp r1, #0
	bne _08067B8E
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08067B7E
	cmp r0, #1
	bgt _08067B70
	cmp r0, #0
	beq _08067B76
	b _08067BB0
_08067B70:
	cmp r0, #2
	beq _08067B84
	b _08067BB0
_08067B76:
	adds r0, r2, #0
	bl Proc_Break
	b _08067BEA
_08067B7E:
	strh r0, [r2, #0x2c]
	strh r1, [r2, #0x2e]
	b _08067BB0
_08067B84:
	movs r0, #1
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	b _08067BAE
_08067B8E:
	cmp r1, #4
	bne _08067B96
	strh r3, [r2, #0x2c]
	b _08067BAA
_08067B96:
	ldr r0, _08067BF4 @ =0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x48]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
	strh r0, [r2, #0x2c]
_08067BAA:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
_08067BAE:
	strh r0, [r2, #0x2e]
_08067BB0:
	ldrh r0, [r2, #0x2c]
	subs r0, #1
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r3, [r0]
	cmp r3, #0
	bne _08067BEA
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _08067BEA
	str r0, [sp, #0x3c]
	mov r1, sp
	ldr r0, [r2, #0x4c]
	strh r0, [r1, #8]
	ldr r0, [r2, #0x50]
	str r0, [sp, #0x1c]
	ldrh r5, [r2, #0x32]
	ldrh r4, [r2, #0x34]
	adds r0, r5, r4
	strh r0, [r1, #2]
	ldrh r5, [r2, #0x3a]
	ldrh r4, [r2, #0x3c]
	adds r0, r5, r4
	strh r0, [r1, #4]
	mov r0, sp
	strh r3, [r0, #0xc]
	bl AnimDisplay
_08067BEA:
	add sp, #0x48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067BF4: .4byte 0x0FFFFFFC

	thumb_func_start GetAnimSpriteRotScaleX
GetAnimSpriteRotScaleX: @ 0x08067BF8
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08067C10 @ =gUnk_082EB76C
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_08067C10: .4byte gUnk_082EB76C

	thumb_func_start GetAnimSpriteRotScaleY
GetAnimSpriteRotScaleY: @ 0x08067C14
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08067C2C @ =gUnk_082EB78C
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_08067C2C: .4byte gUnk_082EB78C

	thumb_func_start BanimUpdateSpriteRotScale
BanimUpdateSpriteRotScale: @ 0x08067C30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r7, r0, #0
	ldr r1, _08067DA8 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	str r0, [sp, #4]
	lsls r3, r3, #0x10
	mov sb, r3
	mov r0, r8
	orrs r0, r3
	str r0, [sp]
	ldr r4, _08067DAC @ =0xFFFF0004
	adds r1, r6, #0
	stm r1!, {r4}
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	adds r5, r6, #0
	adds r5, #0xc
	str r4, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x10
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r1, [r5, #4]
	rsbs r0, r1, #0
	strh r0, [r5, #4]
	ldrh r2, [r5, #6]
	rsbs r0, r2, #0
	strh r0, [r5, #6]
	adds r5, #0xc
	str r4, [r6, #0x18]
	adds r1, r6, #0
	adds r1, #0x1c
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r3, [r5, #8]
	rsbs r0, r3, #0
	strh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	rsbs r0, r1, #0
	strh r0, [r5, #0xa]
	adds r5, #0xc
	str r4, [r6, #0x24]
	adds r1, r6, #0
	adds r1, #0x28
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r2, [r5, #4]
	rsbs r0, r2, #0
	strh r0, [r5, #4]
	ldrh r3, [r5, #6]
	rsbs r0, r3, #0
	strh r0, [r5, #6]
	ldrh r1, [r5, #8]
	rsbs r0, r1, #0
	strh r0, [r5, #8]
	ldrh r2, [r5, #0xa]
	rsbs r0, r2, #0
	strh r0, [r5, #0xa]
	adds r6, #0x30
	ldr r0, [r7]
	cmp r0, #1
	beq _08067D88
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r0, sb
	asrs r5, r0, #0x10
_08067CE2:
	ldr r2, [r7]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r2
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r2
	cmp r0, #0
	beq _08067D04
	movs r3, #0x80
	lsls r3, r3, #0x13
	adds r1, r1, r3
_08067D04:
	ldr r0, _08067DB0 @ =0xC1FFFFFF
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r0, r0, r1
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	adds r0, r2, #0
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	subs r1, r4, r0
	movs r2, #6
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	adds r1, r0, #0
	movs r3, #6
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #6]
	ldr r0, [r7]
	bl GetAnimSpriteRotScaleY
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	subs r1, r4, r0
	movs r2, #8
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	adds r1, r0, #0
	movs r3, #8
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #8]
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [r7]
	cmp r0, #1
	bne _08067CE2
_08067D88:
	ldr r0, [r7]
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #6]
	strh r0, [r6, #6]
	ldrh r0, [r7, #8]
	strh r0, [r6, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067DA8: .4byte 0xFFFF0000
_08067DAC: .4byte 0xFFFF0004
_08067DB0: .4byte 0xC1FFFFFF

	thumb_func_start EfxPlaySE
EfxPlaySE: @ 0x08067DB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _08067DF4 @ =gBmSt
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08067E0A
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08067DFC
	bl RegisterEfxSoundSeExist
	adds r0, r5, #0
	bl sub_080033EC
	ldr r0, _08067DF8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08067E0A
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _08067E0A
	.align 2, 0
_08067DF4: .4byte gBmSt
_08067DF8: .4byte gPlaySt
_08067DFC:
	ldr r0, _08067E10 @ =gUnk_08C4A2B4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	strh r4, [r0, #0x2c]
_08067E0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067E10: .4byte gUnk_08C4A2B4

	thumb_func_start Loop6C_efxSoundSE
Loop6C_efxSoundSE: @ 0x08067E14
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08067E2E
	adds r0, r4, #0
	bl Proc_Break
	b _08067E5C
_08067E2E:
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08067E5C
	bl RegisterEfxSoundSeExist
	ldr r0, [r4, #0x44]
	bl sub_080033EC
	ldr r0, _08067E64 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08067E56
	ldr r0, [r4, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08067E56:
	adds r0, r4, #0
	bl Proc_Break
_08067E5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067E64: .4byte gPlaySt

	thumb_func_start DoM4aSongNumStop
DoM4aSongNumStop: @ 0x08067E68
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxOverrideBgm
EfxOverrideBgm: @ 0x08067E78
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r1, _08067E9C @ =gBmSt
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08067E96
	adds r0, r2, #0
	bl SetBgmVolume
	adds r0, r4, #0
	bl sub_0800394C
_08067E96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067E9C: .4byte gBmSt

	thumb_func_start StopBGM1
StopBGM1: @ 0x08067EA0
	push {lr}
	ldr r0, _08067EAC @ =0x03005A30
	bl MPlayStop_rev01
	pop {r0}
	bx r0
	.align 2, 0
_08067EAC: .4byte 0x03005A30

	thumb_func_start UnregisterEfxSoundSeExist
UnregisterEfxSoundSeExist: @ 0x08067EB0
	ldr r1, _08067EB8 @ =0x020200A4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08067EB8: .4byte 0x020200A4

	thumb_func_start RegisterEfxSoundSeExist
RegisterEfxSoundSeExist: @ 0x08067EBC
	ldr r1, _08067EC4 @ =0x020200A4
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08067EC4: .4byte 0x020200A4

	thumb_func_start CheckEfxSoundSeExist
CheckEfxSoundSeExist: @ 0x08067EC8
	ldr r0, _08067ED0 @ =0x020200A4
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08067ED0: .4byte 0x020200A4

	thumb_func_start M4aPlayWithPostionCtrl
M4aPlayWithPostionCtrl: @ 0x08067ED4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _08067F00 @ =gBmSt
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08067F7C
	cmp r2, #0
	beq _08067F4C
	cmp r6, #0x77
	bgt _08067F04
	adds r0, r6, #0
	muls r0, r6, r0
	movs r1, #0x78
	bl Div
	adds r5, r0, #0
	subs r5, #0x78
	b _08067F18
	.align 2, 0
_08067F00: .4byte gBmSt
_08067F04:
	movs r0, #0xf0
	subs r0, r0, r6
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x78
	bl Div
	movs r1, #0x78
	subs r5, r1, r0
_08067F18:
	ldr r2, _08067F40 @ =gUnk_086EA858
	ldr r0, _08067F44 @ =gUnk_086EA8D0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r1, _08067F48 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl MPlayPanpotControl
	b _08067F7C
	.align 2, 0
_08067F40: .4byte gUnk_086EA858
_08067F44: .4byte gUnk_086EA8D0
_08067F48: .4byte 0x0000FFFF
_08067F4C:
	ldr r2, _08067F84 @ =gUnk_086EA858
	ldr r0, _08067F88 @ =gUnk_086EA8D0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08067F8C @ =0x0000FFFF
	adds r0, r6, #0
	bl sub_080151D4
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayPanpotControl
_08067F7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067F84: .4byte gUnk_086EA858
_08067F88: .4byte gUnk_086EA8D0
_08067F8C: .4byte 0x0000FFFF

	thumb_func_start EfxPlaySEwithCmdCtrl
EfxPlaySEwithCmdCtrl: @ 0x08067F90
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	bl GetAnimAnotherSide
	adds r6, r0, #0
	mov r0, r8
	bl GetAISLayerId
	cmp r0, #1
	bne _08067FB0
	b _080682FC
_08067FB0:
	mov r0, r8
	bl GetAnimPosition
	adds r5, r0, #0
	cmp r5, #0
	bne _08067FC8
	ldr r0, _08067FC4 @ =0x0203E0B0
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _08067FCE
	.align 2, 0
_08067FC4: .4byte 0x0203E0B0
_08067FC8:
	ldr r0, _08067FF8 @ =0x0203E0B0
	movs r3, #2
	ldrsh r4, [r0, r3]
_08067FCE:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType1FromTerrain
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0x14
	bne _08067FEA
	mov r0, r8
	bl IsAnimSoundInPositionMaybe
	cmp r0, #0
	bne _08067FEA
	movs r7, #2
_08067FEA:
	cmp r5, #0
	bne _08068000
	ldr r0, _08067FFC @ =0x0203E0B4
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08068006
	.align 2, 0
_08067FF8: .4byte 0x0203E0B0
_08067FFC: .4byte 0x0203E0B4
_08068000:
	ldr r0, _08068044 @ =0x0203E0B4
	movs r3, #2
	ldrsh r0, [r0, r3]
_08068006:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType2FromBaseCon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _08068048 @ =0x0000FFFF
	mov r0, r8
	str r2, [sp]
	bl GetProperAnimSoundLocation
	mov r1, r8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	subs r0, #0x19
	ldr r2, [sp]
	cmp r0, #0x37
	bls _08068038
	b _080682D6
_08068038:
	lsls r0, r0, #2
	ldr r1, _0806804C @ =_08068050
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068044: .4byte 0x0203E0B4
_08068048: .4byte 0x0000FFFF
_0806804C: .4byte _08068050
_08068050: @ jump table
	.4byte _08068130 @ case 0
	.4byte _080682D6 @ case 1
	.4byte _0806820A @ case 2
	.4byte _08068134 @ case 3
	.4byte _0806813C @ case 4
	.4byte _08068144 @ case 5
	.4byte _0806814C @ case 6
	.4byte _0806816C @ case 7
	.4byte _0806818C @ case 8
	.4byte _080681D0 @ case 9
	.4byte _080681D4 @ case 10
	.4byte _080681D8 @ case 11
	.4byte _080681DC @ case 12
	.4byte _080682D6 @ case 13
	.4byte _080682D6 @ case 14
	.4byte _080681E4 @ case 15
	.4byte _080681E8 @ case 16
	.4byte _080681F0 @ case 17
	.4byte _080681F6 @ case 18
	.4byte _080682D6 @ case 19
	.4byte _080682D6 @ case 20
	.4byte _080682D6 @ case 21
	.4byte _08068200 @ case 22
	.4byte _080682D6 @ case 23
	.4byte _080682D6 @ case 24
	.4byte _080682D6 @ case 25
	.4byte _08068206 @ case 26
	.4byte _0806820A @ case 27
	.4byte _08068224 @ case 28
	.4byte _08068234 @ case 29
	.4byte _08068238 @ case 30
	.4byte _0806823C @ case 31
	.4byte _080682D6 @ case 32
	.4byte _08068240 @ case 33
	.4byte _08068248 @ case 34
	.4byte _0806824E @ case 35
	.4byte _080682D6 @ case 36
	.4byte _08068260 @ case 37
	.4byte _08068264 @ case 38
	.4byte _0806826A @ case 39
	.4byte _08068274 @ case 40
	.4byte _08068278 @ case 41
	.4byte _0806827C @ case 42
	.4byte _08068284 @ case 43
	.4byte _0806828A @ case 44
	.4byte _08068294 @ case 45
	.4byte _080682D6 @ case 46
	.4byte _0806829C @ case 47
	.4byte _080682A0 @ case 48
	.4byte _080682A8 @ case 49
	.4byte _080682AE @ case 50
	.4byte _080682B8 @ case 51
	.4byte _080682C0 @ case 52
	.4byte _080682D6 @ case 53
	.4byte _080682C8 @ case 54
	.4byte _080682D0 @ case 55
_08068130:
	movs r4, #0xd1
	b _080682D8
_08068134:
	ldr r1, _08068138 @ =gUnk_08C4A690
	b _0806820C
	.align 2, 0
_08068138: .4byte gUnk_08C4A690
_0806813C:
	ldr r1, _08068140 @ =gUnk_08C4A6AC
	b _0806820C
	.align 2, 0
_08068140: .4byte gUnk_08C4A6AC
_08068144:
	ldr r1, _08068148 @ =gUnk_08C4A6C8
	b _0806820C
	.align 2, 0
_08068148: .4byte gUnk_08C4A6C8
_0806814C:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080681B4
	cmp r0, #1
	bgt _080681AA
	cmp r0, #0
	bne _080681BA
	movs r4, #0xd2
	b _080681BA
_0806816C:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080681B4
	cmp r0, #1
	bgt _080681AA
	cmp r0, #0
	bne _080681BA
	movs r4, #0xd3
	b _080681BA
_0806818C:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080681B4
	cmp r0, #1
	bgt _080681AA
	cmp r0, #0
	beq _080681B0
	b _080681BA
_080681AA:
	cmp r0, #2
	beq _080681B8
	b _080681BA
_080681B0:
	movs r4, #0xd4
	b _080681BA
_080681B4:
	movs r4, #0xd5
	b _080681BA
_080681B8:
	ldr r4, _080681CC @ =0x000002CE
_080681BA:
	adds r0, r6, #0
	bl GetProperAnimSoundLocation
	ldrh r6, [r6, #2]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _080682D8
	.align 2, 0
_080681CC: .4byte 0x000002CE
_080681D0:
	movs r4, #0xc9
	b _080682D8
_080681D4:
	movs r4, #0xc8
	b _080682D8
_080681D8:
	movs r4, #0xca
	b _080682D8
_080681DC:
	ldr r4, _080681E0 @ =0x00000263
	b _08068226
	.align 2, 0
_080681E0: .4byte 0x00000263
_080681E4:
	movs r4, #0xf6
	b _080682D8
_080681E8:
	ldr r4, _080681EC @ =0x00000141
	b _080682D8
	.align 2, 0
_080681EC: .4byte 0x00000141
_080681F0:
	movs r4, #0xa1
	lsls r4, r4, #1
	b _080682D8
_080681F6:
	ldr r4, _080681FC @ =0x00000267
	b _08068226
	.align 2, 0
_080681FC: .4byte 0x00000267
_08068200:
	movs r4, #0xbe
	lsls r4, r4, #2
	b _080682D8
_08068206:
	movs r4, #0xe7
	b _080682D8
_0806820A:
	ldr r1, _08068220 @ =gUnk_08C4A674
_0806820C:
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	b _080682D8
	.align 2, 0
_08068220: .4byte gUnk_08C4A674
_08068224:
	ldr r4, _08068230 @ =0x00000265
_08068226:
	cmp r5, #0
	bne _080682D8
	subs r4, #1
	b _080682D8
	.align 2, 0
_08068230: .4byte 0x00000265
_08068234:
	movs r4, #0xce
	b _080682D8
_08068238:
	movs r4, #0xcf
	b _080682D8
_0806823C:
	movs r4, #0xcb
	b _080682D8
_08068240:
	ldr r4, _08068244 @ =0x000002D3
	b _080682D8
	.align 2, 0
_08068244: .4byte 0x000002D3
_08068248:
	movs r4, #0xb5
	lsls r4, r4, #2
	b _080682D8
_0806824E:
	ldr r4, _0806825C @ =0x00000263
	cmp r5, #0
	bne _08068256
	subs r4, #1
_08068256:
	movs r1, #0x80
	mov r8, r1
	b _080682D8
	.align 2, 0
_0806825C: .4byte 0x00000263
_08068260:
	movs r4, #0xf1
	b _080682D8
_08068264:
	movs r4, #0x9b
	lsls r4, r4, #1
	b _080682D8
_0806826A:
	ldr r4, _08068270 @ =0x00000117
	b _080682D8
	.align 2, 0
_08068270: .4byte 0x00000117
_08068274:
	movs r4, #0xeb
	b _080682D8
_08068278:
	movs r4, #0xea
	b _080682D8
_0806827C:
	ldr r4, _08068280 @ =0x000002CF
	b _080682D8
	.align 2, 0
_08068280: .4byte 0x000002CF
_08068284:
	movs r4, #0xb4
	lsls r4, r4, #2
	b _080682D8
_0806828A:
	ldr r4, _08068290 @ =0x000002D1
	b _080682D8
	.align 2, 0
_08068290: .4byte 0x000002D1
_08068294:
	ldr r4, _08068298 @ =0x000002D2
	b _080682D8
	.align 2, 0
_08068298: .4byte 0x000002D2
_0806829C:
	movs r4, #0xed
	b _080682D8
_080682A0:
	ldr r4, _080682A4 @ =0x00000135
	b _080682D8
	.align 2, 0
_080682A4: .4byte 0x00000135
_080682A8:
	movs r4, #0x9a
	lsls r4, r4, #1
	b _080682D8
_080682AE:
	ldr r4, _080682B4 @ =0x000002DD
	b _080682D8
	.align 2, 0
_080682B4: .4byte 0x000002DD
_080682B8:
	ldr r4, _080682BC @ =0x000002DE
	b _080682D8
	.align 2, 0
_080682BC: .4byte 0x000002DE
_080682C0:
	ldr r4, _080682C4 @ =0x000002DF
	b _080682D8
	.align 2, 0
_080682C4: .4byte 0x000002DF
_080682C8:
	ldr r4, _080682CC @ =0x000002F7
	b _080682D8
	.align 2, 0
_080682CC: .4byte 0x000002F7
_080682D0:
	movs r4, #0xba
	lsls r4, r4, #2
	b _080682D8
_080682D6:
	movs r4, #0
_080682D8:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080682FC
	mov r1, r8
	adds r0, r4, #0
	str r3, [sp, #4]
	bl EfxPlaySE
	ldr r3, [sp, #4]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	adds r0, r4, #0
	bl M4aPlayWithPostionCtrl
_080682FC:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetEfxSoundType1FromTerrain
GetEfxSoundType1FromTerrain: @ 0x0806830C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _0806831E
_0806831A:
	movs r0, #0
	b _08068452
_0806831E:
	cmp r4, #0x40
	bls _08068324
	b _08068450
_08068324:
	lsls r0, r4, #2
	ldr r1, _08068330 @ =_08068334
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068330: .4byte _08068334
_08068334: @ jump table
	.4byte _08068450 @ case 0
	.4byte _0806831A @ case 1
	.4byte _0806831A @ case 2
	.4byte _0806831A @ case 3
	.4byte _0806831A @ case 4
	.4byte _0806831A @ case 5
	.4byte _0806844C @ case 6
	.4byte _0806844C @ case 7
	.4byte _0806844C @ case 8
	.4byte _0806844C @ case 9
	.4byte _0806831A @ case 10
	.4byte _0806844C @ case 11
	.4byte _08068438 @ case 12
	.4byte _08068438 @ case 13
	.4byte _08068444 @ case 14
	.4byte _08068444 @ case 15
	.4byte _0806843C @ case 16
	.4byte _0806831A @ case 17
	.4byte _08068440 @ case 18
	.4byte _08068448 @ case 19
	.4byte _08068448 @ case 20
	.4byte _0806843C @ case 21
	.4byte _0806843C @ case 22
	.4byte _0806844C @ case 23
	.4byte _0806844C @ case 24
	.4byte _0806831A @ case 25
	.4byte _0806831A @ case 26
	.4byte _0806831A @ case 27
	.4byte _0806831A @ case 28
	.4byte _0806844C @ case 29
	.4byte _0806844C @ case 30
	.4byte _0806844C @ case 31
	.4byte _0806844C @ case 32
	.4byte _0806844C @ case 33
	.4byte _0806831A @ case 34
	.4byte _0806831A @ case 35
	.4byte _0806844C @ case 36
	.4byte _0806831A @ case 37
	.4byte _08068440 @ case 38
	.4byte _0806831A @ case 39
	.4byte _0806831A @ case 40
	.4byte _0806831A @ case 41
	.4byte _08068440 @ case 42
	.4byte _0806831A @ case 43
	.4byte _08068450 @ case 44
	.4byte _0806844C @ case 45
	.4byte _08068450 @ case 46
	.4byte _0806831A @ case 47
	.4byte _0806844C @ case 48
	.4byte _0806844C @ case 49
	.4byte _0806844C @ case 50
	.4byte _0806831A @ case 51
	.4byte _08068450 @ case 52
	.4byte _08068450 @ case 53
	.4byte _0806843C @ case 54
	.4byte _0806844C @ case 55
	.4byte _0806831A @ case 56
	.4byte _0806831A @ case 57
	.4byte _08068440 @ case 58
	.4byte _08068440 @ case 59
	.4byte _0806843C @ case 60
	.4byte _08068440 @ case 61
	.4byte _0806844C @ case 62
	.4byte _0806831A @ case 63
	.4byte _0806831A @ case 64
_08068438:
	movs r0, #1
	b _08068452
_0806843C:
	movs r0, #2
	b _08068452
_08068440:
	movs r0, #3
	b _08068452
_08068444:
	movs r0, #4
	b _08068452
_08068448:
	movs r0, #5
	b _08068452
_0806844C:
	movs r0, #6
	b _08068452
_08068450:
	movs r0, #0
_08068452:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start IsAnimSoundInPositionMaybe
IsAnimSoundInPositionMaybe: @ 0x08068458
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetProperAnimSoundLocation
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r5, r0, r1
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08068476
	cmp r5, #0x58
	bgt _0806847E
	b _0806847A
_08068476:
	cmp r5, #0x97
	ble _0806847E
_0806847A:
	movs r0, #1
	b _08068480
_0806847E:
	movs r0, #0
_08068480:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetEfxSoundType2FromBaseCon
GetEfxSoundType2FromBaseCon: @ 0x08068488
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #4
	bls _080684AA
	cmp r0, #8
	bhi _0806849C
	movs r1, #1
	b _080684AA
_0806849C:
	cmp r0, #0xb
	bhi _080684A4
	movs r1, #2
	b _080684AA
_080684A4:
	cmp r2, #0xf
	bhi _080684AA
	movs r1, #3
_080684AA:
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_080684B0
sub_080684B0: @ 0x080684B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080684F0 @ =gEfxPairHpBufOffset
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r1, r6, #1
	adds r6, r1, r0
	adds r0, r6, #0
	bl GetEfxHp
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #2
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, r0
	beq _080684F8
	cmp r0, #0
	beq _080684F4
	movs r0, #0
	b _080684FA
	.align 2, 0
_080684F0: .4byte gEfxPairHpBufOffset
_080684F4:
	movs r0, #1
	b _080684FA
_080684F8:
	movs r0, #2
_080684FA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start EfxPlayHittedSFX
EfxPlayHittedSFX: @ 0x08068500
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08068524 @ =0x0000FFFF
	bl EfxPlayCriticalHittedSFX
	adds r0, r5, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08068532
	cmp r0, #1
	bgt _08068528
	cmp r0, #0
	beq _0806852E
	b _08068538
	.align 2, 0
_08068524: .4byte 0x0000FFFF
_08068528:
	cmp r0, #2
	beq _08068536
	b _08068538
_0806852E:
	movs r4, #0xd4
	b _08068538
_08068532:
	movs r4, #0xd5
	b _08068538
_08068536:
	ldr r4, _08068560 @ =0x000002CE
_08068538:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0806855A
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_0806855A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068560: .4byte 0x000002CE

	thumb_func_start EfxPlayCriticalHittedSFX
EfxPlayCriticalHittedSFX: @ 0x08068564
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _080685A0
	cmp r0, #0
	blt _080685A0
	adds r0, r5, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _080685A0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd8
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xd8
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_080685A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxCheckRetaliation
EfxCheckRetaliation: @ 0x080685A8
	ldr r2, _080685C0 @ =gBattleHitArray
	movs r1, #8
	ldrb r2, [r2, #2]
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	rsbs r1, r1, #0
	lsrs r1, r1, #0x1f
	cmp r0, r1
	beq _080685C4
	movs r0, #0
	b _080685C6
	.align 2, 0
_080685C0: .4byte gBattleHitArray
_080685C4:
	movs r0, #1
_080685C6:
	bx lr

	thumb_func_start GetEfxHpChangeType
GetEfxHpChangeType: @ 0x080685C8
	push {lr}
	cmp r0, #0
	beq _0806862C
	bl GetItemIndex
	subs r0, #0x4a
	cmp r0, #0xe
	bhi _0806862C
	lsls r0, r0, #2
	ldr r1, _080685E4 @ =_080685E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080685E4: .4byte _080685E8
_080685E8: @ jump table
	.4byte _08068624 @ case 0
	.4byte _08068624 @ case 1
	.4byte _08068624 @ case 2
	.4byte _08068624 @ case 3
	.4byte _08068624 @ case 4
	.4byte _08068624 @ case 5
	.4byte _08068628 @ case 6
	.4byte _08068628 @ case 7
	.4byte _08068628 @ case 8
	.4byte _0806862C @ case 9
	.4byte _0806862C @ case 10
	.4byte _0806862C @ case 11
	.4byte _08068624 @ case 12
	.4byte _0806862C @ case 13
	.4byte _08068624 @ case 14
_08068624:
	movs r0, #2
	b _0806862E
_08068628:
	movs r0, #1
	b _0806862E
_0806862C:
	movs r0, #0
_0806862E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EkrPlayMainBGM
EkrPlayMainBGM: @ 0x08068634
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08068680 @ =gpEkrBattleUnitLeft
	ldr r1, _08068684 @ =gpEkrBattleUnitRight
	ldr r5, [r0]
	ldr r6, [r1]
	ldr r1, _08068688 @ =gBmSt
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08068650
	b _080688B4
_08068650:
	ldr r1, _0806868C @ =0x020200A0
	movs r0, #1
	str r0, [r1]
	ldr r1, _08068690 @ =0x0203DFF8
	ldr r0, _08068694 @ =gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0x20
	mov r8, r1
	ldrh r0, [r0]
	cmp r0, #1
	beq _08068670
	movs r2, #0x1f
	mov r8, r2
_08068670:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08068698
	bl sub_08003E48
	b _080686A0
	.align 2, 0
_08068680: .4byte gpEkrBattleUnitLeft
_08068684: .4byte gpEkrBattleUnitRight
_08068688: .4byte gBmSt
_0806868C: .4byte 0x020200A0
_08068690: .4byte 0x0203DFF8
_08068694: .4byte gEkrInitialHitSide
_08068698:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _080686AC
_080686A0:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x48
	bl EfxOverrideBgm
	b _080688BA
_080686AC:
	ldr r0, _080686C0 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _080686C4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1b
	bl EfxOverrideBgm
	b _080688BA
	.align 2, 0
_080686C0: .4byte gEkrDistanceType
_080686C4:
	ldr r7, _08068740 @ =0x0203DFE8
	movs r1, #0
	ldrsh r0, [r7, r1]
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldr r0, _08068744 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x3f
	beq _080686DA
	movs r4, #0
_080686DA:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	beq _080686E4
	movs r4, #0
_080686E4:
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	cmp r0, #0x27
	beq _080686EE
	movs r4, #0
_080686EE:
	cmp r4, #1
	beq _08068734
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsWeaponLegency
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08068708
	movs r4, #1
_08068708:
	movs r0, #1
	bl EkrCheckAttackRound
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08068716
	movs r4, #0
_08068716:
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bne _08068720
	movs r4, #0
_08068720:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	bne _0806872A
	movs r4, #0
_0806872A:
	cmp r0, #0x86
	bne _08068730
	movs r4, #0
_08068730:
	cmp r4, #1
	bne _08068748
_08068734:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1c
	bl EfxOverrideBgm
	b _080688BA
	.align 2, 0
_08068740: .4byte 0x0203DFE8
_08068744: .4byte gPlaySt
_08068748:
	cmp r0, #0x86
	bne _08068768
	bl sub_0807A26C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08068764
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x6f
	bl EfxOverrideBgm
	b _080688BA
_08068764:
	bl sub_0807A260
_08068768:
	adds r0, r5, #0
	bl GetBanimBossBGM
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08068786
	movs r4, #1
	rsbs r4, r4, #0
_08068786:
	ldr r0, _080687A8 @ =0x0203DFE8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08068794
	movs r4, #1
	rsbs r4, r4, #0
_08068794:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080687AC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxOverrideBgm
	b _080688BA
	.align 2, 0
_080687A8: .4byte 0x0203DFE8
_080687AC:
	movs r4, #0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080687D6
	ldr r0, _080687E8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x2e
	bne _080687D0
	movs r4, #1
_080687D0:
	cmp r0, #0x2f
	bne _080687D6
	movs r4, #1
_080687D6:
	cmp r4, #1
	bne _080687EC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x14
	bl EfxOverrideBgm
	b _080688BA
	.align 2, 0
_080687E8: .4byte gPlaySt
_080687EC:
	movs r4, #0
	ldr r0, [r6, #4]
	ldrb r1, [r0, #4]
	adds r3, r0, #0
	cmp r1, #0x40
	bne _08068810
	ldr r0, _08068820 @ =gBattleStats
	ldrh r2, [r0]
	ands r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08068810
	movs r4, #1
_08068810:
	cmp r4, #1
	bne _08068824
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1d
	bl EfxOverrideBgm
	b _080688BA
	.align 2, 0
_08068820: .4byte gBattleStats
_08068824:
	movs r4, #0
	ldrb r3, [r3, #4]
	cmp r3, #0x41
	bne _08068848
	ldr r0, _08068858 @ =gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08068848
	movs r4, #1
_08068848:
	cmp r4, #1
	bne _0806885C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1e
	bl EfxOverrideBgm
	b _080688BA
	.align 2, 0
_08068858: .4byte gBattleStats
_0806885C:
	movs r0, #0
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _08068870
	ldr r0, _0806886C @ =gBattleActor
	b _0806887C
	.align 2, 0
_0806886C: .4byte gBattleActor
_08068870:
	movs r0, #1
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _0806888C
	ldr r0, _08068888 @ =gBattleTarget
_0806887C:
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetEfxHpChangeType
	b _0806888E
	.align 2, 0
_08068888: .4byte gBattleTarget
_0806888C:
	movs r0, #0
_0806888E:
	cmp r0, #1
	beq _0806889C
	cmp r0, #2
	bne _080688A0
	movs r2, #0x1a
	mov r8, r2
	b _080688A0
_0806889C:
	movs r0, #0x19
	mov r8, r0
_080688A0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _080688B4
	movs r1, #0x80
	lsls r1, r1, #1
	mov r0, r8
	bl EfxOverrideBgm
	b _080688BA
_080688B4:
	ldr r1, _080688C4 @ =0x020200A0
	movs r0, #0
	str r0, [r1]
_080688BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080688C4: .4byte 0x020200A0

	thumb_func_start EkrRestoreBGM
EkrRestoreBGM: @ 0x080688C8
	push {lr}
	bl sub_0806BF78
	cmp r0, #1
	beq _080688E6
	ldr r1, _080688EC @ =gBmSt
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080688E6
	ldr r0, _080688F0 @ =0x020200A0
	ldr r0, [r0]
	cmp r0, #0
	bne _080688F4
_080688E6:
	bl MakeBgmOverridePersist
	b _080688F8
	.align 2, 0
_080688EC: .4byte gBmSt
_080688F0: .4byte 0x020200A0
_080688F4:
	bl RestoreBgm
_080688F8:
	pop {r0}
	bx r0

	thumb_func_start GetBanimBossBGM
GetBanimBossBGM: @ 0x080688FC
	push {r4, r5, lr}
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	movs r3, #0
	ldr r0, _08068934 @ =gUnk_08C4A2CC
	ldr r1, [r0]
	movs r4, #1
	rsbs r4, r4, #0
	adds r5, r0, #0
	cmp r1, r4
	beq _08068926
	cmp r2, r1
	beq _08068926
	adds r1, r5, #0
_08068918:
	adds r1, #8
	adds r3, #2
	ldr r0, [r1]
	cmp r0, r4
	beq _08068926
	cmp r2, r0
	bne _08068918
_08068926:
	adds r0, r3, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08068934: .4byte gUnk_08C4A2CC

	thumb_func_start GetProperAnimSoundLocation
GetProperAnimSoundLocation: @ 0x08068938
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, [r0, #0x3c]
	ldr r3, [r2]
	ldr r1, _08068968 @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _0806895C
	ldr r7, _0806896C @ =0x0000FFFF
	ands r7, r3
	cmp r7, #0
	beq _0806895C
_08068954:
	subs r7, #1
	adds r2, #0xc
	cmp r7, #0
	bne _08068954
_0806895C:
	adds r6, r2, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	b _080689A4
	.align 2, 0
_08068968: .4byte 0xFFFF0000
_0806896C: .4byte 0x0000FFFF
_08068970:
	movs r0, #6
	ldrsh r5, [r6, r0]
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r5, r5, r0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleY
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	muls r0, r5, r0
	add r8, r0
	adds r7, r7, r1
	adds r6, #0xc
_080689A4:
	ldr r0, [r6]
	cmp r0, #1
	bne _08068970
	cmp r7, #0
	bne _080689B8
	ldr r0, _080689B4 @ =0x7FFFFFFF
	b _080689C0
	.align 2, 0
_080689B4: .4byte 0x7FFFFFFF
_080689B8:
	mov r0, r8
	adds r1, r7, #0
	bl Div
_080689C0:
	mov r8, r0
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PlaySFX
PlaySFX: @ 0x080689D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl EfxPlaySE
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl M4aPlayWithPostionCtrl
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start PlaySfxAutomatically
PlaySfxAutomatically: @ 0x080689EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl EfxPlaySE
	adds r0, r4, #0
	bl GetProperAnimSoundLocation
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08068A0C
sub_08068A0C: @ 0x08068A0C
	ldr r0, _08068A1C @ =0x020200A8
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08068A20
	movs r0, #0
	b _08068A22
	.align 2, 0
_08068A1C: .4byte 0x020200A8
_08068A20:
	movs r0, #1
_08068A22:
	bx lr

	thumb_func_start sub_08068A24
sub_08068A24: @ 0x08068A24
	push {lr}
	ldr r0, _08068A34 @ =0x020200A8
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08068A34: .4byte 0x020200A8

	thumb_func_start sub_08068A38
sub_08068A38: @ 0x08068A38
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08050348
	ldr r4, _08068A60 @ =0x020200A8
	ldr r0, _08068A64 @ =gUnk_08C4A6E4
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068A60: .4byte 0x020200A8
_08068A64: .4byte gUnk_08C4A6E4

	thumb_func_start sub_08068A68
sub_08068A68: @ 0x08068A68
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _08068AC4
	ldr r0, [r4, #0x5c]
	bl sub_0804FFAC
	adds r0, r5, #0
	bl sub_0804FFAC
	adds r0, r5, #0
	bl sub_08068D2C
	adds r0, r5, #0
	bl sub_08068E24
	ldr r2, _08068AC0 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r3, [r2, #1]
	ands r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	b _08068D16
	.align 2, 0
_08068AC0: .4byte gDispIo
_08068AC4:
	cmp r1, #0x5f
	bne _08068AF4
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_0804F7B8
	ldr r0, _08068AF0 @ =0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	b _08068D16
	.align 2, 0
_08068AF0: .4byte 0x0000013B
_08068AF4:
	cmp r1, #0x6a
	bne _08068B18
	ldr r1, [r4, #0x5c]
	ldr r0, _08068B14 @ =0x0000F3FF
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	ldr r1, [r4, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r2, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	b _08068D16
	.align 2, 0
_08068B14: .4byte 0x0000F3FF
_08068B18:
	cmp r1, #0x74
	bne _08068B28
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #0
	bl sub_08069180
	b _08068D16
_08068B28:
	cmp r1, #0x78
	bne _08068B34
	ldr r0, [r4, #0x5c]
	bl sub_08068F28
	b _08068D16
_08068B34:
	cmp r1, #0x80
	bne _08068B40
	movs r0, #1
	bl SetAnimStateHidden
	b _08068D16
_08068B40:
	cmp r1, #0x7e
	bne _08068B84
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x38
	movs r2, #7
	movs r3, #0
	bl sub_080560A4
	adds r2, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #0x40
	str r1, [sp]
	adds r1, r2, #0
	movs r2, #0x38
	movs r3, #0
	bl sub_0806925C
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	movs r2, #0
	bl sub_080565FC
	ldr r0, [r4, #0x5c]
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0x10
	bl sub_080566F0
	b _08068D16
_08068B84:
	cmp r1, #0xf2
	bne _08068C1C
	ldr r0, [r4, #0x5c]
	bl sub_08068D70
	ldr r0, [r4, #0x5c]
	bl sub_08068EA8
	ldr r6, _08068C18 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x38
	movs r2, #7
	movs r3, #0x40
	bl sub_080560A4
	adds r2, r0, #0
	ldr r0, [r4, #0x5c]
	mov r3, r8
	str r3, [sp]
	adds r1, r2, #0
	movs r2, #0x38
	movs r3, #0x40
	bl sub_0806925C
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	movs r2, #0
	bl sub_080565FC
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	ldr r0, [r4, #0x5c]
	str r1, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0
	bl sub_080566F0
	movs r0, #0x9e
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	b _08068CFA
	.align 2, 0
_08068C18: .4byte gDispIo
_08068C1C:
	movs r0, #0x9c
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068C4C
	movs r0, #0
	bl SetAnimStateUnHidden
	ldr r0, _08068C48 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #1
	bl sub_08069180
	b _08068D16
	.align 2, 0
_08068C48: .4byte 0x0000F3FF
_08068C4C:
	movs r0, #0x9f
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068C6E
	adds r0, r5, #0
	bl sub_08068F28
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_0804F7B8
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _08068D16
_08068C6E:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	movs r0, #0xa5
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068C90
	ldr r0, _08068C8C @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	b _08068D16
	.align 2, 0
_08068C8C: .4byte 0x0000F3FF
_08068C90:
	movs r0, #0xad
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068CA8
	bl sub_080503A0
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x46
	bl sub_0804F8D8
	b _08068D16
_08068CA8:
	movs r0, #0xb2
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068D08
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_08068F8C
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_080690F8
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x5a
	movs r2, #0x28
	movs r3, #0xe
	bl sub_080566F0
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_080560A4
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0
	bl sub_080565FC
	ldr r0, _08068D04 @ =0x0000013D
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r4, #0
_08068CFA:
	movs r3, #1
	bl PlaySFX
	b _08068D16
	.align 2, 0
_08068D04: .4byte 0x0000013D
_08068D08:
	movs r0, #0x94
	lsls r0, r0, #2
	cmp r1, r0
	bne _08068D16
	adds r0, r4, #0
	bl Proc_Break
_08068D16:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08068D24
sub_08068D24: @ 0x08068D24
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_08068D2C
sub_08068D2C: @ 0x08068D2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08068D5C @ =gUnk_08C4A704
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08068D60 @ =gUnk_082EB7AC
	str r1, [r0, #0x48]
	ldr r1, _08068D64 @ =gUnk_08C4A71C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08068D68 @ =gUnk_08C4A778
	str r1, [r0, #0x54]
	ldr r1, _08068D6C @ =gUnk_08C4A7D4
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068D5C: .4byte gUnk_08C4A704
_08068D60: .4byte gUnk_082EB7AC
_08068D64: .4byte gUnk_08C4A71C
_08068D68: .4byte gUnk_08C4A778
_08068D6C: .4byte gUnk_08C4A7D4

	thumb_func_start sub_08068D70
sub_08068D70: @ 0x08068D70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08068DA0 @ =gUnk_08C4A704
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08068DA4 @ =gUnk_082EB81E
	str r1, [r0, #0x48]
	ldr r1, _08068DA8 @ =gUnk_08C4A71C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08068DAC @ =gUnk_08C4A778
	str r1, [r0, #0x54]
	ldr r1, _08068DB0 @ =gUnk_08C4A7D4
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068DA0: .4byte gUnk_08C4A704
_08068DA4: .4byte gUnk_082EB81E
_08068DA8: .4byte gUnk_08C4A71C
_08068DAC: .4byte gUnk_08C4A778
_08068DB0: .4byte gUnk_08C4A7D4

	thumb_func_start sub_08068DB4
sub_08068DB4: @ 0x08068DB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08068E02
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	b _08068E18
_08068E02:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08068E18
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
_08068E18:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08068E24
sub_08068E24: @ 0x08068E24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08068E3C @ =gUnk_08C4A830
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068E3C: .4byte gUnk_08C4A830

	thumb_func_start sub_08068E40
sub_08068E40: @ 0x08068E40
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08068E82
	cmp r0, #0x11
	beq _08068E82
	cmp r0, #0x22
	beq _08068E82
	cmp r0, #0x28
	beq _08068E82
	cmp r0, #0x2e
	beq _08068E82
	cmp r0, #0x34
	beq _08068E82
	cmp r0, #0x3a
	beq _08068E82
	cmp r0, #0x3e
	beq _08068E82
	cmp r0, #0x42
	beq _08068E82
	cmp r0, #0x44
	beq _08068E82
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	beq _08068E82
	cmp r0, #0x48
	bne _08068E98
_08068E82:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r2, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08068EA2
_08068E98:
	cmp r0, #0x50
	bne _08068EA2
	adds r0, r2, #0
	bl Proc_Break
_08068EA2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08068EA8
sub_08068EA8: @ 0x08068EA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08068EC0 @ =gUnk_08C4A848
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068EC0: .4byte gUnk_08C4A848

	thumb_func_start sub_08068EC4
sub_08068EC4: @ 0x08068EC4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x56
	beq _08068F02
	cmp r0, #0x58
	beq _08068F02
	cmp r0, #0x5a
	beq _08068F02
	cmp r0, #0x5c
	beq _08068F02
	cmp r0, #0x5e
	beq _08068F02
	cmp r0, #0x60
	beq _08068F02
	cmp r0, #0x62
	beq _08068F02
	cmp r0, #0x64
	beq _08068F02
	cmp r0, #0x66
	beq _08068F02
	cmp r0, #0x68
	beq _08068F02
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x6a
	bne _08068F18
_08068F02:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r2, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08068F22
_08068F18:
	cmp r0, #0x6e
	bne _08068F22
	adds r0, r2, #0
	bl Proc_Break
_08068F22:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08068F28
sub_08068F28: @ 0x08068F28
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08068F64 @ =gUnk_08C4A860
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08068F68 @ =gUnk_08C265CC
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	ldr r0, _08068F6C @ =gUnk_082022A8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08068F70 @ =gUnk_08201E10
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068F64: .4byte gUnk_08C4A860
_08068F68: .4byte gUnk_08C265CC
_08068F6C: .4byte gUnk_082022A8
_08068F70: .4byte gUnk_08201E10

	thumb_func_start sub_08068F74
sub_08068F74: @ 0x08068F74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08068F8C
sub_08068F8C: @ 0x08068F8C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0806907C @ =gUnk_08C4A880
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _08069080 @ =gUnk_081FC214
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08069084 @ =gUnk_08279658
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08069088 @ =gUnk_08279758
	ldr r1, _0806908C @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08069090 @ =gDispIo
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r4, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
	mov r6, ip
	adds r6, #0x37
	movs r3, #0x20
	ldrb r1, [r6]
	orrs r1, r3
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r7, ip
	strb r0, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6]
	ldr r0, _08069094 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08069098 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, ip
	adds r0, #0x3d
	ldrb r7, [r0]
	orrs r3, r7
	strb r3, [r0]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _0806909C @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806907C: .4byte gUnk_08C4A880
_08069080: .4byte gUnk_081FC214
_08069084: .4byte gUnk_08279658
_08069088: .4byte gUnk_08279758
_0806908C: .4byte gBg1Tm
_08069090: .4byte gDispIo
_08069094: .4byte 0x0000FFE0
_08069098: .4byte 0x0000E0FF
_0806909C: .4byte 0x0000F3FF

	thumb_func_start sub_080690A0
sub_080690A0: @ 0x080690A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _080690EC @ =gDispIo
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _080690E4
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r0, [r5, #0x1c]
	ldr r1, _080690F0 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _080690F4 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl Proc_Break
_080690E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080690EC: .4byte gDispIo
_080690F0: .4byte 0xFFFFF7FF
_080690F4: .4byte 0x0000F3FF

	thumb_func_start sub_080690F8
sub_080690F8: @ 0x080690F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08069114 @ =gUnk_08C4A898
	movs r1, #4
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069114: .4byte gUnk_08C4A898

	thumb_func_start sub_08069118
sub_08069118: @ 0x08069118
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _08069174 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _08069178 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0806916A
	adds r0, r4, #0
	bl Proc_Break
_0806916A:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069174: .4byte 0xFFFFF7FF
_08069178: .4byte 0x0000F3FF

	thumb_func_start nullsub_57
nullsub_57: @ 0x0806917C
	bx lr
	.align 2, 0

	thumb_func_start sub_08069180
sub_08069180: @ 0x08069180
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080691A8 @ =gUnk_08C4A8B8
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r2, #0
	strh r2, [r1, #0x2c]
	strh r5, [r1, #0x2e]
	cmp r6, #0
	bne _080691AC
	strh r2, [r1, #0x32]
	movs r0, #0x10
	strh r0, [r1, #0x34]
	b _080691B2
	.align 2, 0
_080691A8: .4byte gUnk_08C4A8B8
_080691AC:
	movs r0, #0x10
	strh r0, [r1, #0x32]
	strh r2, [r1, #0x34]
_080691B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080691B8
sub_080691B8: @ 0x080691B8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r4, #0x34
	ldrsh r2, [r5, r4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069210
	ldr r0, _08069204 @ =0x02000054
	ldr r0, [r0]
	ldr r4, _08069208 @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0806920C @ =0xFFFFFD20
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r6, #0
	bl EfxPalBlackInOut
	b _0806922E
	.align 2, 0
_08069204: .4byte 0x02000054
_08069208: .4byte 0x02022B40
_0806920C: .4byte 0xFFFFFD20
_08069210:
	ldr r0, _08069250 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r4, _08069254 @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r2, _08069258 @ =0xFFFFFCE0
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r6, #0
	bl EfxPalBlackInOut
_0806922E:
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r4, [r5, #0x2e]
	lsls r1, r4, #0x10
	cmp r0, r1
	ble _08069248
	adds r0, r5, #0
	bl Proc_Break
_08069248:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069250: .4byte 0x02000054
_08069254: .4byte 0x02022B80
_08069258: .4byte 0xFFFFFCE0

	thumb_func_start sub_0806925C
sub_0806925C: @ 0x0806925C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, _08069298 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806929C @ =gUnk_08C4A8D0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x44]
	str r7, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069298: .4byte 0x0201774C
_0806929C: .4byte gUnk_08C4A8D0

	thumb_func_start sub_080692A0
sub_080692A0: @ 0x080692A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080692DC
	ldr r1, _080692E4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080692DC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080692E4: .4byte 0x0201774C

	thumb_func_start CheckEkrLvupDone
CheckEkrLvupDone: @ 0x080692E8
	ldr r0, _080692F8 @ =0x020200AC
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080692FC
	movs r0, #0
	b _080692FE
	.align 2, 0
_080692F8: .4byte 0x020200AC
_080692FC:
	movs r0, #1
_080692FE:
	bx lr

	thumb_func_start EndEkrLevelUp
EndEkrLevelUp: @ 0x08069300
	push {lr}
	ldr r0, _08069310 @ =0x020200AC
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08069310: .4byte 0x020200AC

	thumb_func_start sub_08069314
sub_08069314: @ 0x08069314
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, [r2, #0x5c]
	cmp r0, #0
	bne _0806933C
	ldr r0, _08069330 @ =gpEkrBattleUnitLeft
	ldr r4, [r0]
	ldr r0, _08069334 @ =0x02020100
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08069338 @ =gpEkrBattleUnitRight
	b _08069348
	.align 2, 0
_08069330: .4byte gpEkrBattleUnitLeft
_08069334: .4byte 0x02020100
_08069338: .4byte gpEkrBattleUnitRight
_0806933C:
	ldr r0, _08069458 @ =gpEkrBattleUnitRight
	ldr r4, [r0]
	ldr r0, _0806945C @ =0x02020100
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08069460 @ =gpEkrBattleUnitLeft
_08069348:
	ldr r1, _08069464 @ =0x02020104
	ldr r3, [r0]
	str r3, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806935A
	b _08069478
_0806935A:
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08069468 @ =0x02020108
	adds r3, r4, #0
	adds r3, #0x70
	movs r0, #0
	ldrsb r0, [r3, r0]
	strh r0, [r1]
	ldr r2, _0806946C @ =0x0202010C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08069470 @ =0x0202010A
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08069474 @ =0x0202011C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x73
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x74
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x75
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x79
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x76
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x77
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x78
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r0, [r6]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08069502
	.align 2, 0
_08069458: .4byte gpEkrBattleUnitRight
_0806945C: .4byte 0x02020100
_08069460: .4byte gpEkrBattleUnitLeft
_08069464: .4byte 0x02020104
_08069468: .4byte 0x02020108
_0806946C: .4byte 0x0202010C
_08069470: .4byte 0x0202010A
_08069474: .4byte 0x0202011C
_08069478:
	ldr r1, _0806952C @ =0x02020108
	movs r0, #8
	ldrsb r0, [r6, r0]
	strh r0, [r1]
	ldr r2, _08069530 @ =0x0202010C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08069534 @ =0x0202010A
	movs r0, #1
	strh r0, [r1]
	ldr r2, _08069538 @ =0x0202011C
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r3, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r3, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r3, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r3]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
_08069502:
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _0806953C @ =0x02017648
	ldr r1, _08069540 @ =0x06002400
	movs r2, #0x90
	lsls r2, r2, #1
	movs r3, #0
	bl InitTextFont
	movs r7, #0
	movs r0, #0
	mov r8, r0
_0806951A:
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08069548
	ldr r0, _08069544 @ =gUnk_082EB864
	b _0806954A
	.align 2, 0
_0806952C: .4byte 0x02020108
_08069530: .4byte 0x0202010C
_08069534: .4byte 0x0202010A
_08069538: .4byte 0x0202011C
_0806953C: .4byte 0x02017648
_08069540: .4byte 0x06002400
_08069544: .4byte gUnk_082EB864
_08069548:
	ldr r0, _08069678 @ =gUnk_082EB88C
_0806954A:
	mov r1, r8
	adds r5, r1, r0
	lsls r1, r7, #3
	ldr r0, _0806967C @ =0x02017660
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x10
	subs r0, r0, r1
	asrs r1, r0, #1
	cmp r1, #0
	bge _08069570
	movs r1, #0
_08069570:
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r1, _08069680 @ =gUnk_082EB8B4
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	ldr r0, _08069684 @ =gBg2Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #5
	add r8, r0
	adds r7, #1
	cmp r7, #7
	ble _0806951A
	movs r7, #0
_080695A6:
	lsls r5, r7, #3
	ldr r1, _08069688 @ =0x020176A0
	mov r8, r1
	add r5, r8
	adds r0, r5, #0
	movs r1, #2
	bl InitText
	adds r0, r5, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _0806968C @ =0x0202010C
	lsls r4, r7, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl Text_DrawNumber
	ldr r0, _08069680 @ =gUnk_082EB8B4
	adds r4, r4, r0
	ldrh r4, [r4]
	lsls r1, r4, #1
	ldr r6, _08069690 @ =0x02023C66
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r7, #1
	cmp r7, #7
	ble _080695A6
	mov r4, r8
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	ldr r0, _08069694 @ =0x02020100
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r0, #0xdf
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r1, _08069698 @ =gUnk_082EB8C4
	adds r0, r4, #0
	bl Text_DrawString
	movs r0, #0xe7
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _0806969C @ =0x02020108
	ldrh r1, [r0]
	adds r0, r4, #0
	bl Text_DrawNumber
	movs r0, #0xea
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069678: .4byte gUnk_082EB88C
_0806967C: .4byte 0x02017660
_08069680: .4byte gUnk_082EB8B4
_08069684: .4byte gBg2Tm
_08069688: .4byte 0x020176A0
_0806968C: .4byte 0x0202010C
_08069690: .4byte 0x02023C66
_08069694: .4byte 0x02020100
_08069698: .4byte gUnk_082EB8C4
_0806969C: .4byte 0x02020108

	thumb_func_start sub_080696A0
sub_080696A0: @ 0x080696A0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r5, r4, #3
	ldr r0, _080696E8 @ =0x020176A0
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _080696EC @ =0x0202010C
	lsls r4, r4, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl Text_DrawNumber
	ldr r0, _080696F0 @ =gUnk_082EB8B4
	adds r4, r4, r0
	ldrh r4, [r4]
	lsls r1, r4, #1
	ldr r0, _080696F4 @ =0x02023C66
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696E8: .4byte 0x020176A0
_080696EC: .4byte 0x0202010C
_080696F0: .4byte gUnk_082EB8B4
_080696F4: .4byte 0x02023C66

	thumb_func_start sub_080696F8
sub_080696F8: @ 0x080696F8
	push {r4, lr}
	ldr r4, _08069724 @ =0x020176E0
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08069728 @ =0x02020100
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0806972C @ =0x02023E24
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069724: .4byte 0x020176E0
_08069728: .4byte 0x02020100
_0806972C: .4byte 0x02023E24

	thumb_func_start sub_08069730
sub_08069730: @ 0x08069730
	push {r4, lr}
	ldr r4, _08069764 @ =0x020176F0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08069768 @ =0x02020108
	ldrh r1, [r0]
	adds r0, r4, #0
	bl Text_DrawNumber
	ldr r1, _0806976C @ =0x02023E3A
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069764: .4byte 0x020176F0
_08069768: .4byte 0x02020108
_0806976C: .4byte 0x02023E3A

	thumb_func_start NewEkrLevelup
NewEkrLevelup: @ 0x08069770
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0806979C @ =0x020200AC
	ldr r0, _080697A0 @ =gUnk_08C4A908
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r6, [r5]
	str r4, [r6, #0x5c]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x60]
	ldr r0, _080697A4 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	beq _080697A8
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #0
	b _080697AE
	.align 2, 0
_0806979C: .4byte 0x020200AC
_080697A0: .4byte gUnk_08C4A908
_080697A4: .4byte gEkrDistanceType
_080697A8:
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #1
_080697AE:
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	strh r1, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080697C4
sub_080697C4: @ 0x080697C4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	cmp r1, #0
	beq _080697D8
	adds r0, r4, #0
	bl Proc_Break
	b _0806982A
_080697D8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080697F6
	bl sub_08050348
	ldr r0, [r4, #0x5c]
	movs r1, #0x78
	movs r2, #0x58
	bl sub_0806A740
	b _0806982A
_080697F6:
	cmp r0, #0x19
	bne _08069808
	ldr r0, [r4, #0x5c]
	bl sub_0806A6B0
	ldr r0, [r4, #0x5c]
	bl sub_0806A7AC
	b _0806982A
_08069808:
	cmp r0, #0x3b
	bne _08069814
	ldr r0, [r4, #0x5c]
	bl sub_0806A610
	b _0806982A
_08069814:
	cmp r0, #0x49
	bne _0806981E
	bl sub_080503A0
	b _0806982A
_0806981E:
	cmp r0, #0x53
	bne _0806982A
	strh r1, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0806982A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08069830
sub_08069830: @ 0x08069830
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _080698E0 @ =0x020200D8
	movs r4, #0
	str r4, [sp]
	ldr r5, _080698E4 @ =gBg1Tm
	ldr r0, _080698E8 @ =0x01000200
	mov r8, r0
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r6, _080698EC @ =gBg2Tm
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, _080698F0 @ =0x06006800
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _080698F4 @ =0x06007000
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _080698F8 @ =0x06005000
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _080698FC @ =0x06005800
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08069900 @ =0x0203E000
	ldrh r4, [r1]
	strh r4, [r7]
	movs r0, #3
	strh r0, [r7, #2]
	adds r0, #0xfd
	strh r0, [r7, #4]
	ldrh r3, [r1, #2]
	strh r3, [r7, #6]
	movs r0, #4
	strh r0, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r0, _08069904 @ =gEkrDistanceType
	ldrh r1, [r0]
	strh r1, [r7, #0xc]
	ldr r0, _08069908 @ =0x0000FFFF
	adds r2, r0, #0
	ldrh r0, [r7, #0xe]
	orrs r0, r2
	strh r0, [r7, #0xe]
	ldr r0, _0806990C @ =0x06010000
	str r0, [r7, #0x1c]
	ldr r0, _08069910 @ =0x020145C8
	str r0, [r7, #0x20]
	ldr r0, _08069914 @ =0x0203DFE6
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	bne _08069922
	ldr r0, _08069918 @ =gEkrInitPosReal
	ldr r0, [r0]
	cmp r0, #0
	bne _0806991C
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r7, #6]
	b _08069922
	.align 2, 0
_080698E0: .4byte 0x020200D8
_080698E4: .4byte gBg1Tm
_080698E8: .4byte 0x01000200
_080698EC: .4byte gBg2Tm
_080698F0: .4byte 0x06006800
_080698F4: .4byte 0x06007000
_080698F8: .4byte 0x06005000
_080698FC: .4byte 0x06005800
_08069900: .4byte 0x0203E000
_08069904: .4byte gEkrDistanceType
_08069908: .4byte 0x0000FFFF
_0806990C: .4byte 0x06010000
_08069910: .4byte 0x020145C8
_08069914: .4byte 0x0203DFE6
_08069918: .4byte gEkrInitPosReal
_0806991C:
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r7]
_08069922:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0806994A
	adds r0, r7, #0
	bl sub_08055718
	ldr r3, [r7, #0x14]
	ldr r0, [r3, #0x4c]
	ldr r2, _08069A6C @ =0x0000F3FF
	ands r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r3, #0x4c]
	ldr r3, [r7, #0x18]
	ldr r0, [r3, #0x4c]
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x4c]
_0806994A:
	mov r1, sb
	ldr r2, [r1, #0x5c]
	ldr r1, _08069A6C @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	mov r0, sb
	ldr r2, [r0, #0x5c]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r3, r0, #0
	ldrh r0, [r2, #8]
	orrs r0, r3
	strh r0, [r2, #8]
	mov r2, sb
	ldr r0, [r2, #0x60]
	ldrh r2, [r0, #8]
	ands r1, r2
	strh r1, [r0, #8]
	mov r0, sb
	ldr r1, [r0, #0x60]
	movs r4, #0
	ldrh r0, [r1, #8]
	orrs r0, r3
	strh r0, [r1, #8]
	ldr r5, _08069A70 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r5, #0x14]
	ands r0, r2
	strb r0, [r5, #0x14]
	adds r0, r1, #0
	ldrb r3, [r5, #0x10]
	ands r0, r3
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0xc]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	ldr r0, _08069A74 @ =0x0202012C
	movs r1, #0x90
	strh r1, [r0]
	ldr r0, _08069A78 @ =0x0202012E
	strh r1, [r0]
	movs r0, #2
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xa0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #1
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #1
	bl SetBgScreenSize
	bl sub_0806A2D4
	ldr r1, _08069A7C @ =0x020200D0
	str r0, [r1]
	bl sub_0806A414
	ldr r1, _08069A80 @ =0x020200D4
	str r0, [r1]
	bl sub_0806A2EC
	movs r0, #2
	bl EkrGauge_0804CC68
	mov r2, sb
	ldr r0, [r2, #0x5c]
	bl sub_0804FFAC
	mov r3, sb
	ldr r0, [r3, #0x60]
	bl sub_0804FFAC
	bl sub_08050290
	bl sub_0804FC5C
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
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
	mov r0, sb
	bl Proc_Break
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069A6C: .4byte 0x0000F3FF
_08069A70: .4byte gDispIo
_08069A74: .4byte 0x0202012C
_08069A78: .4byte 0x0202012E
_08069A7C: .4byte 0x020200D0
_08069A80: .4byte 0x020200D4

	thumb_func_start sub_08069A84
sub_08069A84: @ 0x08069A84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _08069B1C @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _08069B20 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	mov r8, r0
	ldr r6, [r7, #0x5c]
	ldr r0, _08069B24 @ =gUnk_081E0C60
	ldr r5, _08069B28 @ =0x02017784
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, _08069B2C @ =gUnk_081E0EAC
	ldr r4, _08069B30 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08069B34 @ =0x020235E0
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	ldr r1, _08069B38 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _08069B3C @ =gUnk_081E0FA8
	ldr r4, _08069B40 @ =0x02022880
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08069B44 @ =gUnk_081E0FC8
	ldr r5, _08069B48 @ =0x0201A784
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, _08069B4C @ =0x06011400
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _08069B50 @ =gUnk_081E11DC
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0x50
	strh r0, [r7, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08069B54
	mov r1, sb
	b _08069B56
	.align 2, 0
_08069B1C: .4byte gpEkrBattleUnitLeft
_08069B20: .4byte gpEkrBattleUnitRight
_08069B24: .4byte gUnk_081E0C60
_08069B28: .4byte 0x02017784
_08069B2C: .4byte gUnk_081E0EAC
_08069B30: .4byte gEkrTsaBuffer
_08069B34: .4byte 0x020235E0
_08069B38: .4byte 0x06002000
_08069B3C: .4byte gUnk_081E0FA8
_08069B40: .4byte 0x02022880
_08069B44: .4byte gUnk_081E0FC8
_08069B48: .4byte 0x0201A784
_08069B4C: .4byte 0x06011400
_08069B50: .4byte gUnk_081E11DC
_08069B54:
	mov r1, r8
_08069B56:
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	ldr r0, _08069BA0 @ =gUnk_08C4A8E8
	bl sub_080069E0
	ldr r0, _08069BA4 @ =0x00001042
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xbc
	movs r3, #0x50
	bl sub_08006AC4
	ldr r0, _08069BA8 @ =0x030040E0
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1, #0x36]
	str r2, [sp, #8]
	ldr r1, _08069BAC @ =gBg2Tm
	ldr r2, _08069BB0 @ =0x01000200
	add r0, sp, #8
	bl CpuFastSet
	adds r0, r7, #0
	bl sub_08069314
	adds r0, r7, #0
	bl Proc_Break
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069BA0: .4byte gUnk_08C4A8E8
_08069BA4: .4byte 0x00001042
_08069BA8: .4byte 0x030040E0
_08069BAC: .4byte gBg2Tm
_08069BB0: .4byte 0x01000200

	thumb_func_start sub_08069BB4
sub_08069BB4: @ 0x08069BB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069BE0 @ =sub_0806A584
	bl SetOnHBlankA
	movs r0, #1
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069BE0: .4byte sub_0806A584

	thumb_func_start sub_08069BE4
sub_08069BE4: @ 0x08069BE4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _08069C1A
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r4, #0x4c]
	subs r0, #2
	str r0, [r4, #0x50]
	ldr r0, _08069C20 @ =gPal
	ldr r1, _08069C24 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
_08069C1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069C20: .4byte gPal
_08069C24: .4byte 0x020165C8

	thumb_func_start sub_08069C28
sub_08069C28: @ 0x08069C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r3, [r7, #0x44]
	ldr r5, [r7, #0x48]
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov sb, r0
	cmp r3, #0
	bge _08069C48
	movs r3, #0
	b _08069C4E
_08069C48:
	cmp r3, #8
	ble _08069C4E
	movs r3, #8
_08069C4E:
	cmp r5, #0
	bge _08069C56
	movs r5, #0
	b _08069C5C
_08069C56:
	cmp r5, #8
	ble _08069C5C
	movs r5, #8
_08069C5C:
	cmp r6, #0
	bge _08069C64
	movs r6, #0
	b _08069C6A
_08069C64:
	cmp r6, #8
	ble _08069C6A
	movs r6, #8
_08069C6A:
	mov r2, sb
	cmp r2, #0
	bge _08069C74
	movs r0, #0
	b _08069C7C
_08069C74:
	mov r2, sb
	cmp r2, #8
	ble _08069C7E
	movs r0, #8
_08069C7C:
	mov sb, r0
_08069C7E:
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	ldr r0, [r7, #0x48]
	adds r0, #1
	str r0, [r7, #0x48]
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	adds r0, #1
	str r0, [r7, #0x50]
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	mov r8, r0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	adds r3, r5, #0
	bl Interpolate
	mov sl, r0
	ldr r5, _08069D3C @ =0x0202012C
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	adds r3, r6, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08069D40 @ =0x0202012E
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	mov r3, sb
	bl Interpolate
	strh r0, [r5]
	ldr r0, _08069D44 @ =0x030040E0
	ldr r1, [r0]
	movs r0, #0x50
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r1, #0x36]
	ldr r0, _08069D48 @ =0x020165C8
	ldr r4, _08069D4C @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	mov r3, sl
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	mov r3, sl
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08069D2A
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08069D2A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069D3C: .4byte 0x0202012C
_08069D40: .4byte 0x0202012E
_08069D44: .4byte 0x030040E0
_08069D48: .4byte 0x020165C8
_08069D4C: .4byte gPal

	thumb_func_start sub_08069D50
sub_08069D50: @ 0x08069D50
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa0
	movs r1, #1
	bl sub_0806A8D8
	ldr r1, _08069D78 @ =0x020200B0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08069D64:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08069D64
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069D78: .4byte 0x020200B0

	thumb_func_start sub_08069D7C
sub_08069D7C: @ 0x08069D7C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069D90
	adds r0, r5, #0
	bl Proc_Break
	b _08069DC8
_08069D90:
	ldr r0, _08069DD0 @ =sub_0806A5C0
	bl SetOnHBlankA
	ldr r4, _08069DD4 @ =0x020200D0
	ldr r0, [r4]
	bl Proc_End
	bl sub_0806A370
	str r0, [r4]
	ldr r4, _08069DD8 @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_08069DC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069DD0: .4byte sub_0806A5C0
_08069DD4: .4byte 0x020200D0
_08069DD8: .4byte 0x000002CD

	thumb_func_start sub_08069DDC
sub_08069DDC: @ 0x08069DDC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069DF2
	adds r0, r5, #0
	bl Proc_Break
	b _08069E46
_08069DF2:
	ldr r4, _08069E50 @ =0x0202012C
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08069E46
	ldr r1, _08069E54 @ =0x02020100
	ldr r0, _08069E58 @ =0x02020104
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #0
	bl sub_080696F8
	ldr r1, _08069E5C @ =0x02020108
	ldr r0, _08069E60 @ =0x0202010A
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_08069730
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_08069E46:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069E50: .4byte 0x0202012C
_08069E54: .4byte 0x02020100
_08069E58: .4byte 0x02020104
_08069E5C: .4byte 0x02020108
_08069E60: .4byte 0x0202010A

	thumb_func_start sub_08069E64
sub_08069E64: @ 0x08069E64
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069E7A
	adds r0, r5, #0
	bl Proc_Break
	b _08069EAA
_08069E7A:
	ldr r4, _08069EB4 @ =0x0202012C
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08069EAA
	adds r0, r5, #0
	bl Proc_Break
_08069EAA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069EB4: .4byte 0x0202012C

	thumb_func_start sub_08069EB8
sub_08069EB8: @ 0x08069EB8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069F10
	strh r0, [r5, #0x2c]
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	movs r2, #0x84
	movs r3, #0x3c
	bl sub_0806AAA0
	ldr r1, _08069F04 @ =0x02020108
	ldr r0, _08069F08 @ =0x0202010A
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_08069730
	ldr r4, _08069F0C @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	adds r0, r5, #0
	bl Proc_Break
	b _08069F2A
	.align 2, 0
_08069F04: .4byte 0x02020108
_08069F08: .4byte 0x0202010A
_08069F0C: .4byte 0x000002CD
_08069F10:
	ldr r4, _08069F34 @ =0x020200D0
	ldr r0, [r4]
	bl Proc_End
	bl sub_0806A2D4
	str r0, [r4]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_08069F2A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069F34: .4byte 0x020200D0

	thumb_func_start sub_08069F38
sub_08069F38: @ 0x08069F38
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _08069F4C
	adds r0, r1, #0
	bl Proc_Break
	b _08069F64
_08069F4C:
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _08069F64
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	adds r0, r1, #0
	bl Proc_Break
_08069F64:
	pop {r0}
	bx r0

	thumb_func_start sub_08069F68
sub_08069F68: @ 0x08069F68
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806A03E
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x2e]
	cmp r0, #8
	beq _0806A044
	ldr r7, _0806A014 @ =0x0202010C
_08069F8C:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r2, r0, r7
	ldr r1, _0806A018 @ =0x0202011C
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r6, r0, r1
	cmp r6, #0
	beq _0806A030
	movs r1, #0
	mov r8, r1
	strh r0, [r2]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r0, r5, #0
	bl sub_080696A0
	ldr r4, _0806A01C @ =0x00000396
	adds r0, r4, #0
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	ldr r1, _0806A020 @ =gUnk_082EB8B4
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r2, #0x1f
	ands r2, r3
	lsls r2, r2, #3
	adds r2, #0x35
	movs r1, #0xfc
	lsls r1, r1, #3
	adds r0, r1, #0
	ands r3, r0
	lsrs r3, r3, #2
	adds r3, #6
	adds r4, #1
	str r4, [sp]
	str r6, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	bl sub_0806AAA0
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0806A00E
	ldr r1, _0806A024 @ =0x0203E094
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r1, _0806A028 @ =0x0203E098
	ldr r0, _0806A02C @ =0x0000FFFF
	strh r0, [r1, #2]
_0806A00E:
	mov r0, r8
	strh r0, [r5, #0x2c]
	b _0806A03E
	.align 2, 0
_0806A014: .4byte 0x0202010C
_0806A018: .4byte 0x0202011C
_0806A01C: .4byte 0x00000396
_0806A020: .4byte gUnk_082EB8B4
_0806A024: .4byte 0x0203E094
_0806A028: .4byte 0x0203E098
_0806A02C: .4byte 0x0000FFFF
_0806A030:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08069F8C
_0806A03E:
	ldrh r1, [r5, #0x2e]
	cmp r1, #8
	bne _0806A04E
_0806A044:
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806A04E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A05C
sub_0806A05C: @ 0x0806A05C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6d
	ble _0806A082
	movs r0, #0
	strh r0, [r4, #0x2c]
	bl sub_0806A93C
	ldr r0, _0806A088 @ =sub_0806A584
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_0806A082:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A088: .4byte sub_0806A584

	thumb_func_start sub_0806A08C
sub_0806A08C: @ 0x0806A08C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A098
sub_0806A098: @ 0x0806A098
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _0806A14C @ =0x0202012C
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	ldr r5, _0806A150 @ =0x0202012E
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _0806A154 @ =0x030040E0
	ldr r1, [r0]
	movs r0, #0x50
	subs r0, r0, r5
	strh r0, [r1, #0x36]
	ldr r0, _0806A158 @ =0x020165C8
	ldr r4, _0806A15C @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	adds r3, r6, #0
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	adds r3, r6, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	movs r0, #7
_0806A124:
	subs r0, #1
	cmp r0, #0
	bge _0806A124
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0806A142
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_0806A142:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A14C: .4byte 0x0202012C
_0806A150: .4byte 0x0202012E
_0806A154: .4byte 0x030040E0
_0806A158: .4byte 0x020165C8
_0806A15C: .4byte gPal

	thumb_func_start sub_0806A160
sub_0806A160: @ 0x0806A160
	push {r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r4, _0806A274 @ =0x020200D8
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0806A176
	adds r0, r4, #0
	bl sub_08055AC4
_0806A176:
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #0
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBgScreenSize
	mov r4, sp
	ldr r2, _0806A278 @ =0x0203E000
	ldrh r0, [r2]
	movs r6, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r0, _0806A27C @ =gEkrDistanceType
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r6, [sp, #0x1c]
	ldr r0, _0806A280 @ =0x020145C8
	str r0, [sp, #0x20]
	ldr r0, _0806A284 @ =0x0203DFE6
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0806A1F0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sp
	bl sub_08055718
_0806A1F0:
	ldr r2, [r5, #0x5c]
	ldr r1, _0806A288 @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	ldr r3, [r5, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	orrs r0, r2
	strh r0, [r3, #8]
	ldr r0, [r5, #0x60]
	ldrh r3, [r0, #8]
	ands r1, r3
	strh r1, [r0, #8]
	ldr r0, [r5, #0x60]
	ldrh r1, [r0, #8]
	orrs r2, r1
	strh r2, [r0, #8]
	str r6, [sp, #0x28]
	add r0, sp, #0x28
	ldr r1, _0806A28C @ =gBg1Tm
	ldr r2, _0806A290 @ =0x01000200
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	bl EkrGauge_0804CC68
	ldr r3, _0806A294 @ =gDispIo
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
	movs r0, #0
	bl EndFaceById
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x2c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A274: .4byte 0x020200D8
_0806A278: .4byte 0x0203E000
_0806A27C: .4byte gEkrDistanceType
_0806A280: .4byte 0x020145C8
_0806A284: .4byte 0x0203DFE6
_0806A288: .4byte 0x0000F3FF
_0806A28C: .4byte gBg1Tm
_0806A290: .4byte 0x01000200
_0806A294: .4byte gDispIo

	thumb_func_start sub_0806A298
sub_0806A298: @ 0x0806A298
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A2CC @ =0x020200D0
	ldr r0, [r0]
	bl Proc_End
	ldr r0, _0806A2D0 @ =0x020200D4
	ldr r0, [r0]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl sub_0804FFCC
	ldr r0, [r4, #0x60]
	bl sub_0804FFCC
	bl sub_080502A0
	bl sub_0804FC6C
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A2CC: .4byte 0x020200D0
_0806A2D0: .4byte 0x020200D4

	thumb_func_start sub_0806A2D4
sub_0806A2D4: @ 0x0806A2D4
	push {lr}
	ldr r0, _0806A2E8 @ =gUnk_08C4A9B8
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_0806A2E8: .4byte gUnk_08C4A9B8

	thumb_func_start sub_0806A2EC
sub_0806A2EC: @ 0x0806A2EC
	push {r4, r5, r6, lr}
	ldr r0, _0806A318 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r2, _0806A31C @ =0x0201FB2C
	cmp r0, #0
	bne _0806A2FA
	ldr r2, _0806A320 @ =0x0201FC6C
_0806A2FA:
	ldr r1, _0806A324 @ =0x0201FDB8
	cmp r0, #0
	bne _0806A302
	ldr r1, _0806A328 @ =0x0201FEF8
_0806A302:
	movs r3, #0
	movs r6, #0
	ldr r5, _0806A32C @ =0x0202012C
	ldr r4, _0806A330 @ =0x0202012E
_0806A30A:
	cmp r3, #0x27
	bhi _0806A334
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b _0806A350
	.align 2, 0
_0806A318: .4byte 0x0201FDAC
_0806A31C: .4byte 0x0201FB2C
_0806A320: .4byte 0x0201FC6C
_0806A324: .4byte 0x0201FDB8
_0806A328: .4byte 0x0201FEF8
_0806A32C: .4byte 0x0202012C
_0806A330: .4byte 0x0202012E
_0806A334:
	cmp r3, #0x47
	bhi _0806A342
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b _0806A34E
_0806A342:
	cmp r3, #0x9f
	bhi _0806A352
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
_0806A34E:
	strh r0, [r1]
_0806A350:
	adds r1, #2
_0806A352:
	adds r3, #1
	cmp r3, #0x9f
	bls _0806A30A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_58
nullsub_58: @ 0x0806A360
	bx lr
	.align 2, 0

	thumb_func_start sub_0806A364
sub_0806A364: @ 0x0806A364
	push {lr}
	bl sub_0806A2EC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A370
sub_0806A370: @ 0x0806A370
	push {lr}
	ldr r0, _0806A384 @ =gUnk_08C4A9D8
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_0806A384: .4byte gUnk_08C4A9D8

	thumb_func_start nullsub_59
nullsub_59: @ 0x0806A388
	bx lr
	.align 2, 0

	thumb_func_start sub_0806A38C
sub_0806A38C: @ 0x0806A38C
	push {r4, r5, r6, lr}
	ldr r0, _0806A3D8 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r3, _0806A3DC @ =0x0201FB2C
	cmp r0, #0
	bne _0806A39A
	ldr r3, _0806A3E0 @ =0x0201FC6C
_0806A39A:
	ldr r2, _0806A3E4 @ =0x0201FDB8
	cmp r0, #0
	bne _0806A3A2
	ldr r2, _0806A3E8 @ =0x0201FEF8
_0806A3A2:
	movs r4, #0
	movs r5, #0
	ldr r0, _0806A3EC @ =gUnk_08C4A9F8
	adds r6, r0, #0
	subs r6, #0x50
_0806A3AC:
	cmp r4, #0x27
	bls _0806A3FC
	cmp r4, #0x47
	bhi _0806A3F8
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, _0806A3F0 @ =0x0202012C
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	cmp r0, #0x2e
	bls _0806A3CE
	cmp r0, #0x51
	bls _0806A3D0
_0806A3CE:
	ldr r1, _0806A3F4 @ =0x0000FFE0
_0806A3D0:
	strh r1, [r3]
	adds r3, #2
	strh r1, [r2]
	b _0806A402
	.align 2, 0
_0806A3D8: .4byte 0x0201FDAC
_0806A3DC: .4byte 0x0201FB2C
_0806A3E0: .4byte 0x0201FC6C
_0806A3E4: .4byte 0x0201FDB8
_0806A3E8: .4byte 0x0201FEF8
_0806A3EC: .4byte gUnk_08C4A9F8
_0806A3F0: .4byte 0x0202012C
_0806A3F4: .4byte 0x0000FFE0
_0806A3F8:
	cmp r4, #0x9f
	bhi _0806A404
_0806A3FC:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
_0806A402:
	adds r2, #2
_0806A404:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _0806A3AC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A414
sub_0806A414: @ 0x0806A414
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0806A4B0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, _0806A4B4 @ =0x0201FB2C
	movs r1, #0
	adds r6, r2, #0
	ldr r4, _0806A4B8 @ =0x0201FC6C
	ldr r0, _0806A4BC @ =0x0201FDB8
	ldr r5, _0806A4C0 @ =0x0201FEF8
	ldr r7, _0806A4C4 @ =0x0201FB20
	ldr r3, _0806A4C8 @ =0x0201FDAC
	mov ip, r3
	ldr r3, _0806A4CC @ =0x0201FB24
	mov r8, r3
	ldr r3, _0806A4D0 @ =0x0201FDB0
	mov sb, r3
	ldr r3, _0806A4D4 @ =0x0201FB28
	mov sl, r3
	movs r3, #0
_0806A446:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806A446
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_0806A456:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806A456
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_0806A466:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806A466
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
_0806A476:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806A476
	movs r4, #0
	str r4, [r7]
	mov r1, ip
	str r4, [r1]
	mov r3, r8
	str r6, [r3]
	mov r1, sb
	str r0, [r1]
	mov r3, sl
	str r6, [r3]
	ldr r1, _0806A4D8 @ =0x0201FDB4
	str r0, [r1]
	ldr r0, _0806A4DC @ =gUnk_08C4AA38
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806A4B0: .4byte 0x0201774C
_0806A4B4: .4byte 0x0201FB2C
_0806A4B8: .4byte 0x0201FC6C
_0806A4BC: .4byte 0x0201FDB8
_0806A4C0: .4byte 0x0201FEF8
_0806A4C4: .4byte 0x0201FB20
_0806A4C8: .4byte 0x0201FDAC
_0806A4CC: .4byte 0x0201FB24
_0806A4D0: .4byte 0x0201FDB0
_0806A4D4: .4byte 0x0201FB28
_0806A4D8: .4byte 0x0201FDB4
_0806A4DC: .4byte gUnk_08C4AA38

	thumb_func_start sub_0806A4E0
sub_0806A4E0: @ 0x0806A4E0
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_0806A4EC
sub_0806A4EC: @ 0x0806A4EC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A4F8
sub_0806A4F8: @ 0x0806A4F8
	ldr r0, _0806A518 @ =gBmSt
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _0806A51C @ =0x0201FB24
	ldr r2, _0806A520 @ =0x0201FDB0
	cmp r0, #0
	beq _0806A564
	ldr r1, _0806A524 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _0806A52C
	movs r0, #0
	str r0, [r1]
	ldr r0, _0806A528 @ =0x0201FB2C
	b _0806A532
	.align 2, 0
_0806A518: .4byte gBmSt
_0806A51C: .4byte 0x0201FB24
_0806A520: .4byte 0x0201FDB0
_0806A524: .4byte 0x0201FB20
_0806A528: .4byte 0x0201FB2C
_0806A52C:
	movs r0, #1
	str r0, [r1]
	ldr r0, _0806A548 @ =0x0201FC6C
_0806A532:
	str r0, [r3]
	ldr r1, _0806A54C @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _0806A558
	movs r0, #0
	str r0, [r1]
	ldr r1, _0806A550 @ =0x0201FDB0
	ldr r0, _0806A554 @ =0x0201FDB8
	b _0806A560
	.align 2, 0
_0806A548: .4byte 0x0201FC6C
_0806A54C: .4byte 0x0201FDAC
_0806A550: .4byte 0x0201FDB0
_0806A554: .4byte 0x0201FDB8
_0806A558:
	movs r0, #1
	str r0, [r1]
	ldr r1, _0806A574 @ =0x0201FDB0
	ldr r0, _0806A578 @ =0x0201FEF8
_0806A560:
	str r0, [r1]
	adds r2, r1, #0
_0806A564:
	ldr r1, _0806A57C @ =0x0201FB28
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _0806A580 @ =0x0201FDB4
	ldr r0, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
_0806A574: .4byte 0x0201FDB0
_0806A578: .4byte 0x0201FEF8
_0806A57C: .4byte 0x0201FB28
_0806A580: .4byte 0x0201FDB4

	thumb_func_start sub_0806A584
sub_0806A584: @ 0x0806A584
	ldr r0, _0806A5B0 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0806A5AC
	ldr r3, _0806A5B4 @ =0x04000018
	ldr r2, _0806A5B8 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _0806A5BC @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_0806A5AC:
	bx lr
	.align 2, 0
_0806A5B0: .4byte 0x04000004
_0806A5B4: .4byte 0x04000018
_0806A5B8: .4byte 0x0201FB28
_0806A5BC: .4byte 0x0201FDB4

	thumb_func_start sub_0806A5C0
sub_0806A5C0: @ 0x0806A5C0
	push {r4, r5, r6, lr}
	ldr r0, _0806A5FC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0806A5F4
	ldr r3, _0806A600 @ =0x0400001A
	ldr r4, _0806A604 @ =gDispIo
	ldr r2, _0806A608 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r5, [r4, #0x26]
	ldrh r6, [r0]
	adds r1, r5, r6
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _0806A60C @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r4, [r4, #0x22]
	ldrh r5, [r0]
	adds r1, r4, r5
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_0806A5F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A5FC: .4byte 0x04000004
_0806A600: .4byte 0x0400001A
_0806A604: .4byte gDispIo
_0806A608: .4byte 0x0201FB28
_0806A60C: .4byte 0x0201FDB4

	thumb_func_start sub_0806A610
sub_0806A610: @ 0x0806A610
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A644 @ =gUnk_08C4AA60
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806A648 @ =gUnk_082EB8CA
	str r1, [r0, #0x48]
	ldr r1, _0806A64C @ =gUnk_08C4AA78
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806A650 @ =gUnk_08C4AAA4
	str r1, [r0, #0x54]
	ldr r0, _0806A654 @ =gUnk_081E9B28
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A644: .4byte gUnk_08C4AA60
_0806A648: .4byte gUnk_082EB8CA
_0806A64C: .4byte gUnk_08C4AA78
_0806A650: .4byte gUnk_08C4AAA4
_0806A654: .4byte gUnk_081E9B28

	thumb_func_start sub_0806A658
sub_0806A658: @ 0x0806A658
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0806A694
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0806A6AA
_0806A694:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0806A6AA
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0806A6AA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0806A6B0
sub_0806A6B0: @ 0x0806A6B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A6E8 @ =gUnk_08C4AAD0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806A6EC @ =gUnk_082EB8F8
	str r1, [r0, #0x48]
	ldr r1, _0806A6F0 @ =gUnk_08C4AAE8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0806A6F4 @ =gUnk_081EAC10
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806A6F8 @ =gUnk_081EB2D0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A6E8: .4byte gUnk_08C4AAD0
_0806A6EC: .4byte gUnk_082EB8F8
_0806A6F0: .4byte gUnk_08C4AAE8
_0806A6F4: .4byte gUnk_081EAC10
_0806A6F8: .4byte gUnk_081EB2D0

	thumb_func_start sub_0806A6FC
sub_0806A6FC: @ 0x0806A6FC
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
	blt _0806A72A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806A738
_0806A72A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806A738
	adds r0, r4, #0
	bl Proc_Break
_0806A738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A740
sub_0806A740: @ 0x0806A740
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, _0806A790 @ =gUnk_08C4AB00
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0806A794 @ =gUnk_08C0BD7C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x64]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _0806A798 @ =gUnk_081EB9AC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _0806A79C @ =gUnk_081EB2D0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A790: .4byte gUnk_08C4AB00
_0806A794: .4byte gUnk_08C0BD7C
_0806A798: .4byte gUnk_081EB9AC
_0806A79C: .4byte gUnk_081EB2D0

	thumb_func_start sub_0806A7A0
sub_0806A7A0: @ 0x0806A7A0
	push {lr}
	ldr r0, [r0, #0x64]
	bl AnimDelete
	pop {r0}
	bx r0

	thumb_func_start sub_0806A7AC
sub_0806A7AC: @ 0x0806A7AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A7D4 @ =gUnk_08C4AB20
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #0x19
	strh r1, [r0, #0x30]
	str r2, [r0, #0x44]
	ldr r1, _0806A7D8 @ =gUnk_082EB912
	str r1, [r0, #0x48]
	ldr r1, _0806A7DC @ =gUnk_081EB350
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A7D4: .4byte gUnk_08C4AB20
_0806A7D8: .4byte gUnk_082EB912
_0806A7DC: .4byte gUnk_081EB350

	thumb_func_start sub_0806A7E0
sub_0806A7E0: @ 0x0806A7E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0806A80A
	ldr r0, [r4, #0x4c]
	ldr r1, _0806A838 @ =0x02022862
	movs r2, #8
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_08050E58
_0806A80A:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r3, [r4, #0x30]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0806A830
	strh r2, [r4, #0x2c]
	strh r2, [r4, #0x2e]
	str r2, [r4, #0x44]
	ldr r0, _0806A83C @ =gUnk_082EB954
	str r0, [r4, #0x48]
	ldr r0, _0806A840 @ =gUnk_081EB2D0
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	bl Proc_Break
_0806A830:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A838: .4byte 0x02022862
_0806A83C: .4byte gUnk_082EB954
_0806A840: .4byte gUnk_081EB2D0

	thumb_func_start sub_0806A844
sub_0806A844: @ 0x0806A844
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
	blt _0806A86A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0806A878
_0806A86A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806A878
	adds r0, r4, #0
	bl Proc_Break
_0806A878:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A880
sub_0806A880: @ 0x0806A880
	movs r1, #0
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

	thumb_func_start sub_0806A888
sub_0806A888: @ 0x0806A888
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0806A8D4 @ =gUnk_083F9AF0
	ldrh r4, [r5, #0x2e]
	adds r4, #1
	strh r4, [r5, #0x2e]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0806A8CE
	lsls r4, r4, #0x10
	asrs r4, r4, #0x12
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl ApplyPaletteExt
	adds r4, #0x40
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl ApplyPaletteExt
_0806A8CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8D4: .4byte gUnk_083F9AF0

	thumb_func_start sub_0806A8D8
sub_0806A8D8: @ 0x0806A8D8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _0806A924 @ =gUnk_083F9F2C
	ldr r1, _0806A928 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _0806A92C @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl Decompress
	ldr r4, _0806A930 @ =gUnk_083F9ECC
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r5, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806A934 @ =gUnk_08C4AB40
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r5, [r0, #0x2c]
	ldr r0, _0806A938 @ =0x02020130
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A924: .4byte gUnk_083F9F2C
_0806A928: .4byte 0x000003FF
_0806A92C: .4byte 0x06010000
_0806A930: .4byte gUnk_083F9ECC
_0806A934: .4byte gUnk_08C4AB40
_0806A938: .4byte 0x02020130

	thumb_func_start sub_0806A93C
sub_0806A93C: @ 0x0806A93C
	push {lr}
	ldr r0, _0806A950 @ =gUnk_08C4AB40
	bl sub_08004748
	ldr r1, _0806A954 @ =0x02020130
	movs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806A950: .4byte gUnk_08C4AB40
_0806A954: .4byte 0x02020130

	thumb_func_start sub_0806A958
sub_0806A958: @ 0x0806A958
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r1, _0806A9B4 @ =gUnk_081EBC44
	mov r8, r1
	subs r0, #1
	lsls r4, r0, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _0806A970
	rsbs r0, r4, #0
_0806A970:
	ldr r5, _0806A9B8 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ands r1, r5
	lsls r1, r1, #5
	ldr r7, _0806A9BC @ =0x06010000
	adds r1, r1, r7
	movs r2, #0x40
	bl sub_08015068
	adds r0, r4, #0
	cmp r0, #0
	bge _0806A992
	rsbs r0, r0, #0
_0806A992:
	adds r0, #0x20
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r7
	movs r2, #0x40
	bl sub_08015068
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A9B4: .4byte gUnk_081EBC44
_0806A9B8: .4byte 0x000003FF
_0806A9BC: .4byte 0x06010000

	thumb_func_start sub_0806A9C0
sub_0806A9C0: @ 0x0806A9C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0806AA08 @ =gUnk_083FA1B8
	mov sb, r0
	ldr r0, _0806AA0C @ =gUnk_081EBC44
	mov r8, r0
	cmp r7, #0
	blt _0806AA18
	movs r0, #0xc0
	lsls r0, r0, #2
	add r0, r8
	adds r1, #0x2c
	ldr r5, _0806AA10 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _0806AA14 @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_08015068
	movs r0, #0xe0
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_08015068
	b _0806AA48
	.align 2, 0
_0806AA08: .4byte gUnk_083FA1B8
_0806AA0C: .4byte gUnk_081EBC44
_0806AA10: .4byte 0x000003FF
_0806AA14: .4byte 0x06010000
_0806AA18:
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r5, _0806AA98 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _0806AA9C @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_08015068
	movs r0, #0xe8
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_08015068
_0806AA48:
	adds r0, r7, #0
	cmp r7, #0
	bge _0806AA50
	rsbs r0, r7, #0
_0806AA50:
	ldr r4, _0806AA98 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0806AA9C @ =0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_08015068
	adds r0, r7, #0
	cmp r0, #0
	bge _0806AA72
	rsbs r0, r0, #0
_0806AA72:
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_08015068
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AA98: .4byte 0x000003FF
_0806AA9C: .4byte 0x06010000

	thumb_func_start sub_0806AAA0
sub_0806AAA0: @ 0x0806AAA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r8, r2
	mov sb, r3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	subs r0, #1
	lsls r0, r0, #1
	ldr r1, [sp, #0xc]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	lsls r6, r3, #0xc
	adds r7, r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r7, r0
	adds r5, r6, #0
	orrs r5, r7
	mov r0, r8
	subs r0, #0x12
	mov r1, sb
	subs r1, #4
	ldr r2, _0806AB20 @ =gUnk_08C0D608
	str r5, [sp]
	movs r3, #0
	mov sl, r3
	str r3, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	movs r3, #0
	bl NewEkrsubAnimeEmulator
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0806AB9A
	ldr r0, _0806AB24 @ =gUnk_08C4AB58
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, [sp, #0x40]
	cmp r1, #0
	blt _0806AB2C
	ldr r2, _0806AB28 @ =gUnk_08C0D638
	str r5, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	mov r0, r8
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	b _0806AB72
	.align 2, 0
_0806AB20: .4byte gUnk_08C0D608
_0806AB24: .4byte gUnk_08C4AB58
_0806AB28: .4byte gUnk_08C0D638
_0806AB2C:
	ldr r1, [sp, #0x18]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r1, r3
	orrs r1, r6
	mov r0, r8
	subs r0, #3
	ldr r2, _0806ABAC @ =gUnk_08C0D684
	str r1, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	orrs r6, r7
	ldr r2, _0806ABB0 @ =gUnk_08C0D668
	str r6, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	bl sub_0806A9C0
_0806AB72:
	movs r0, #0
	mov r3, r8
	strh r3, [r4, #0x32]
	mov r1, sb
	strh r1, [r4, #0x3a]
	strh r0, [r4, #0x2c]
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r4, #0x2e]
	mov r0, sp
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x44]
	ldr r3, [sp, #0x10]
	str r3, [r4, #0x48]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #0x4c]
	ldr r1, [sp, #0x40]
	str r1, [r4, #0x50]
_0806AB9A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ABAC: .4byte gUnk_08C0D684
_0806ABB0: .4byte gUnk_08C0D668

	thumb_func_start sub_0806ABB4
sub_0806ABB4: @ 0x0806ABB4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _0806ABC8
	adds r0, r4, #0
	bl Proc_Break
	b _0806AC16
_0806ABC8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0806AC16
	strh r5, [r4, #0x2c]
	ldr r3, [r4, #0x48]
	lsls r3, r3, #0xc
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	orrs r3, r0
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r0, #3
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	ldr r2, _0806AC20 @ =gUnk_08C0D6C0
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x50]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl sub_0806A958
	adds r0, r4, #0
	bl Proc_Break
_0806AC16:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AC20: .4byte gUnk_08C0D6C0

	thumb_func_start sub_0806AC24
sub_0806AC24: @ 0x0806AC24
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	bge _0806AC34
	bl Proc_Break
	b _0806AC56
_0806AC34:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0806AC56
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl sub_0806A9C0
	adds r0, r4, #0
	bl Proc_Break
_0806AC56:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806AC5C
sub_0806AC5C: @ 0x0806AC5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806AC80 @ =0x02020130
	ldr r0, [r0]
	cmp r0, #1
	bne _0806AC7A
	ldr r0, [r4, #0x60]
	bl Proc_End
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806AC7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AC80: .4byte 0x02020130

	thumb_func_start sub_0806AC84
sub_0806AC84: @ 0x0806AC84
	ldr r0, _0806AC90 @ =0x02020134
	ldr r0, [r0]
	cmp r0, #1
	beq _0806AC94
	movs r0, #0
	b _0806AC96
	.align 2, 0
_0806AC90: .4byte 0x02020134
_0806AC94:
	movs r0, #1
_0806AC96:
	bx lr

	thumb_func_start nullsub_10
nullsub_10: @ 0x0806AC98
	bx lr
	.align 2, 0

	thumb_func_start sub_0806AC9C
sub_0806AC9C: @ 0x0806AC9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806ACB8 @ =gUnk_08C4AB80
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	ldr r1, _0806ACBC @ =0x02020134
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806ACB8: .4byte gUnk_08C4AB80
_0806ACBC: .4byte 0x02020134

	thumb_func_start sub_0806ACC0
sub_0806ACC0: @ 0x0806ACC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	mov sl, r0
	mov r8, r0
	movs r7, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806ACEC
	ldr r0, _0806ACE8 @ =gpEkrBattleUnitLeft
	b _0806ACEE
	.align 2, 0
_0806ACE8: .4byte gpEkrBattleUnitLeft
_0806ACEC:
	ldr r0, _0806AD3C @ =gpEkrBattleUnitRight
_0806ACEE:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r5, [r0, #4]
	cmp r5, #0x14
	bge _0806ACFA
	b _0806ADFC
_0806ACFA:
	cmp r5, #0x17
	ble _0806AD00
	b _0806ADFC
_0806AD00:
	ldr r0, _0806AD40 @ =gpEkrTriangleUnits
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x14
	bne _0806AD10
	movs r2, #0
	mov sb, r2
_0806AD10:
	cmp r0, #0x15
	bne _0806AD18
	movs r2, #0
	mov sb, r2
_0806AD18:
	cmp r0, #0x16
	bne _0806AD20
	movs r2, #1
	mov sb, r2
_0806AD20:
	cmp r0, #0x17
	bne _0806AD28
	movs r0, #1
	mov sb, r0
_0806AD28:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806AD44
	movs r0, #1
	b _0806AD4A
	.align 2, 0
_0806AD3C: .4byte gpEkrBattleUnitRight
_0806AD40: .4byte gpEkrTriangleUnits
_0806AD44:
	adds r0, r4, #0
	bl GetItemType
_0806AD4A:
	cmp r0, #1
	beq _0806AD54
	cmp r0, #2
	beq _0806AD5A
	b _0806AD6C
_0806AD54:
	movs r1, #0
	mov r8, r1
	b _0806AD6C
_0806AD5A:
	adds r0, r4, #0
	bl GetItemIndex
	movs r2, #1
	mov r8, r2
	cmp r0, #0x28
	bne _0806AD6C
	movs r0, #2
	mov r8, r0
_0806AD6C:
	ldr r0, _0806ADA8 @ =gpEkrTriangleUnits
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x14
	bne _0806AD7C
	movs r2, #0
	mov sl, r2
_0806AD7C:
	cmp r0, #0x15
	bne _0806AD84
	movs r2, #0
	mov sl, r2
_0806AD84:
	cmp r0, #0x16
	bne _0806AD8C
	movs r2, #1
	mov sl, r2
_0806AD8C:
	cmp r0, #0x17
	bne _0806AD94
	movs r0, #1
	mov sl, r0
_0806AD94:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806ADAC
	movs r0, #1
	b _0806ADB2
	.align 2, 0
_0806ADA8: .4byte gpEkrTriangleUnits
_0806ADAC:
	adds r0, r4, #0
	bl GetItemType
_0806ADB2:
	cmp r0, #1
	beq _0806ADBC
	cmp r0, #2
	beq _0806ADC0
	b _0806ADCE
_0806ADBC:
	movs r7, #0
	b _0806ADCE
_0806ADC0:
	adds r0, r4, #0
	bl GetItemIndex
	movs r7, #1
	cmp r0, #0x28
	bne _0806ADCE
	movs r7, #2
_0806ADCE:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_0806B15C
	ldr r0, _0806ADF4 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x28
	bne _0806AEA4
	ldr r1, _0806ADF8 @ =0x02020134
	movs r0, #0
	b _0806AEA8
	.align 2, 0
_0806ADF4: .4byte gpEkrBattleUnitRight
_0806ADF8: .4byte 0x02020134
_0806ADFC:
	ldr r0, _0806AE28 @ =gpEkrTriangleUnits
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x32
	bne _0806AE0C
	movs r2, #0
	mov sb, r2
_0806AE0C:
	cmp r0, #0x33
	bne _0806AE14
	movs r0, #1
	mov sb, r0
_0806AE14:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806AE2C
	movs r0, #1
	b _0806AE36
	.align 2, 0
_0806AE28: .4byte gpEkrTriangleUnits
_0806AE2C:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0806AE40
_0806AE36:
	cmp r0, #1
	bne _0806AE44
	movs r1, #0
	mov r8, r1
	b _0806AE44
_0806AE40:
	movs r2, #1
	mov r8, r2
_0806AE44:
	ldr r0, _0806AE70 @ =gpEkrTriangleUnits
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x32
	bne _0806AE54
	movs r2, #0
	mov sl, r2
_0806AE54:
	cmp r0, #0x33
	bne _0806AE5C
	movs r0, #1
	mov sl, r0
_0806AE5C:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806AE74
	movs r0, #1
	b _0806AE7E
	.align 2, 0
_0806AE70: .4byte gpEkrTriangleUnits
_0806AE74:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0806AE86
_0806AE7E:
	cmp r0, #1
	bne _0806AE88
	movs r7, #0
	b _0806AE88
_0806AE86:
	movs r7, #1
_0806AE88:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_0806AEC4
	cmp r5, #0x32
	bne _0806AEA4
	ldr r1, _0806AEA0 @ =0x02020134
	movs r0, #0
	b _0806AEA8
	.align 2, 0
_0806AEA0: .4byte 0x02020134
_0806AEA4:
	ldr r1, _0806AEC0 @ =0x02020134
	movs r0, #1
_0806AEA8:
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AEC0: .4byte 0x02020134

	thumb_func_start sub_0806AEC4
sub_0806AEC4: @ 0x0806AEC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0806AEF8 @ =gUnk_08C4AB98
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806AEF8: .4byte gUnk_08C4AB98

	thumb_func_start sub_0806AEFC
sub_0806AEFC: @ 0x0806AEFC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0806AF22
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	movs r1, #0
	bl sub_0806B088
_0806AF22:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x1c
	bne _0806AF30
	adds r0, r5, #0
	movs r1, #6
	bl sub_0804F7B8
_0806AF30:
	ldrh r3, [r4, #0x2c]
	cmp r3, #0x22
	bne _0806AF62
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_0806AFB4
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	movs r1, #1
	bl sub_0806B088
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0806AF62:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x33
	bne _0806AF70
	adds r0, r5, #0
	movs r1, #6
	bl sub_0804F7B8
_0806AF70:
	ldrh r3, [r4, #0x2c]
	cmp r3, #0x39
	bne _0806AF96
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	adds r0, r5, #0
	movs r1, #1
	bl sub_0806AFB4
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0806AF96:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x43
	bne _0806AFA8
	ldr r1, _0806AFB0 @ =0x02020134
	movs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806AFA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AFB0: .4byte 0x02020134

	thumb_func_start sub_0806AFB4
sub_0806AFB4: @ 0x0806AFB4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0806AFDC @ =gUnk_08C4ABB0
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0806AFE8
	ldr r0, _0806AFE0 @ =0x0203E080
	ldr r2, [r0]
	ldr r0, _0806AFE4 @ =gUnk_082EB968
	b _0806AFEE
	.align 2, 0
_0806AFDC: .4byte gUnk_08C4ABB0
_0806AFE0: .4byte 0x0203E080
_0806AFE4: .4byte gUnk_082EB968
_0806AFE8:
	ldr r0, _0806B024 @ =0x0203E080
	ldr r2, [r0, #4]
	ldr r0, _0806B028 @ =gUnk_082EB976
_0806AFEE:
	str r0, [r1, #0x48]
	ldr r0, _0806B02C @ =gUnk_08C4ABC8
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r4, _0806B030 @ =0x02017784
	adds r0, r2, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0806B034 @ =gUnk_082EB984
	cmp r6, #0
	beq _0806B016
	ldr r0, _0806B038 @ =gUnk_082ECD18
	cmp r7, #0
	bne _0806B016
	ldr r0, _0806B03C @ =gUnk_082EC328
_0806B016:
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B024: .4byte 0x0203E080
_0806B028: .4byte gUnk_082EB976
_0806B02C: .4byte gUnk_08C4ABC8
_0806B030: .4byte 0x02017784
_0806B034: .4byte gUnk_082EB984
_0806B038: .4byte gUnk_082ECD18
_0806B03C: .4byte gUnk_082EC328

	thumb_func_start sub_0806B040
sub_0806B040: @ 0x0806B040
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
	blt _0806B06E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806B080
_0806B06E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806B080
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806B080:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806B088
sub_0806B088: @ 0x0806B088
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _0806B0BC @ =gUnk_08C4ABE0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _0806B0C8
	movs r0, #0x12
	strh r0, [r5, #0x2e]
	ldr r0, _0806B0C0 @ =0x0203E080
	ldr r6, [r0]
	ldr r3, _0806B0C4 @ =gUnk_08C4B110
	b _0806B0D2
	.align 2, 0
_0806B0BC: .4byte gUnk_08C4ABE0
_0806B0C0: .4byte 0x0203E080
_0806B0C4: .4byte gUnk_08C4B110
_0806B0C8:
	movs r0, #0x11
	strh r0, [r5, #0x2e]
	ldr r0, _0806B11C @ =0x0203E080
	ldr r6, [r0, #4]
	ldr r3, _0806B120 @ =gUnk_08C4B444
_0806B0D2:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	ldr r4, _0806B124 @ =0x0201A784
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806B128 @ =gUnk_082EDD3C
	mov r1, r8
	cmp r1, #0
	beq _0806B104
	ldr r0, _0806B12C @ =gUnk_082EF0C0
	mov r1, sb
	cmp r1, #0
	bne _0806B104
	ldr r0, _0806B130 @ =gUnk_082EE6F4
_0806B104:
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B11C: .4byte 0x0203E080
_0806B120: .4byte gUnk_08C4B444
_0806B124: .4byte 0x0201A784
_0806B128: .4byte gUnk_082EDD3C
_0806B12C: .4byte gUnk_082EF0C0
_0806B130: .4byte gUnk_082EE6F4

	thumb_func_start sub_0806B134
sub_0806B134: @ 0x0806B134
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B154
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806B154:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806B15C
sub_0806B15C: @ 0x0806B15C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0806B190 @ =gUnk_08C4ABF8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806B190: .4byte gUnk_08C4ABF8

	thumb_func_start sub_0806B194
sub_0806B194: @ 0x0806B194
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806B1CA
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, [r5, #0x50]
	str r4, [sp]
	bl sub_0806B264
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806B1CA:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x30
	bne _0806B1EE
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x44]
	ldr r3, [r5, #0x4c]
	movs r1, #0
	bl sub_0806B440
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806B1EE:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x3c
	bne _0806B204
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl sub_0804F7B8
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_0806B5C0
_0806B204:
	ldrh r3, [r5, #0x2c]
	cmp r3, #0x4f
	bne _0806B228
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x50]
	movs r1, #1
	bl sub_0806B440
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806B228:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x5b
	bne _0806B234
	ldr r1, _0806B260 @ =0x02020134
	movs r0, #1
	str r0, [r1]
_0806B234:
	ldrh r3, [r5, #0x2c]
	cmp r3, #0x60
	bne _0806B24A
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl sub_0804F7B8
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_0806B5C0
_0806B24A:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x78
	bne _0806B256
	adds r0, r5, #0
	bl Proc_Break
_0806B256:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B260: .4byte 0x02020134

	thumb_func_start sub_0806B264
sub_0806B264: @ 0x0806B264
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	mov sb, r2
	adds r6, r3, #0
	ldr r0, _0806B29C @ =gUnk_08C4AC10
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r0, _0806B2A0 @ =0x0203E080
	ldr r7, [r0]
	cmp r4, #0
	bne _0806B2AC
	ldr r3, _0806B2A4 @ =gUnk_08C4B4DC
	ldr r6, _0806B2A8 @ =gUnk_082EFA68
	b _0806B2D8
	.align 2, 0
_0806B29C: .4byte gUnk_08C4AC10
_0806B2A0: .4byte 0x0203E080
_0806B2A4: .4byte gUnk_08C4B4DC
_0806B2A8: .4byte gUnk_082EFA68
_0806B2AC:
	cmp r6, #1
	beq _0806B2C4
	cmp r6, #1
	bhs _0806B2D4
	ldr r3, _0806B2BC @ =gUnk_08C4B56C
	ldr r6, _0806B2C0 @ =gUnk_082EFD88
	b _0806B2D8
	.align 2, 0
_0806B2BC: .4byte gUnk_08C4B56C
_0806B2C0: .4byte gUnk_082EFD88
_0806B2C4:
	ldr r3, _0806B2CC @ =gUnk_08C4B5FC
	ldr r6, _0806B2D0 @ =gUnk_082F015C
	b _0806B2D8
	.align 2, 0
_0806B2CC: .4byte gUnk_08C4B5FC
_0806B2D0: .4byte gUnk_082F015C
_0806B2D4:
	ldr r3, _0806B318 @ =gUnk_08C4B688
	ldr r6, _0806B31C @ =gUnk_082F0590
_0806B2D8:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r1, r0, #0
	str r1, [r5, #0x60]
	ldr r0, _0806B320 @ =0x00008840
	strh r0, [r1, #8]
	ldr r4, _0806B324 @ =0x0201A784
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806B328 @ =0x02022B60
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0806B32C @ =0x0203E080
	ldr r7, [r0, #4]
	mov r0, sb
	cmp r0, #0
	bne _0806B338
	ldr r3, _0806B330 @ =gUnk_08C4B4DC
	ldr r6, _0806B334 @ =gUnk_082EFA68
	b _0806B364
	.align 2, 0
_0806B318: .4byte gUnk_08C4B688
_0806B31C: .4byte gUnk_082F0590
_0806B320: .4byte 0x00008840
_0806B324: .4byte 0x0201A784
_0806B328: .4byte 0x02022B60
_0806B32C: .4byte 0x0203E080
_0806B330: .4byte gUnk_08C4B4DC
_0806B334: .4byte gUnk_082EFA68
_0806B338:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	beq _0806B350
	cmp r0, #1
	bhs _0806B360
	ldr r3, _0806B348 @ =gUnk_08C4B56C
	ldr r6, _0806B34C @ =gUnk_082EFD88
	b _0806B364
	.align 2, 0
_0806B348: .4byte gUnk_08C4B56C
_0806B34C: .4byte gUnk_082EFD88
_0806B350:
	ldr r3, _0806B358 @ =gUnk_08C4B5FC
	ldr r6, _0806B35C @ =gUnk_082F015C
	b _0806B364
	.align 2, 0
_0806B358: .4byte gUnk_08C4B5FC
_0806B35C: .4byte gUnk_082F015C
_0806B360:
	ldr r3, _0806B3CC @ =gUnk_08C4B688
	ldr r6, _0806B3D0 @ =gUnk_082F0590
_0806B364:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r1, r0, #0
	str r1, [r5, #0x64]
	ldr r0, _0806B3D4 @ =0x0000A880
	strh r0, [r1, #8]
	ldr r4, _0806B3D8 @ =0x0201AF84
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806B3DC @ =0x02022BA0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806B3E0 @ =0x06010800
	ldr r0, _0806B3E4 @ =0xFFFFF800
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl RegisterDataMove
	bl EnablePalSync
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x20
	strh r0, [r1, #2]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B3CC: .4byte gUnk_08C4B688
_0806B3D0: .4byte gUnk_082F0590
_0806B3D4: .4byte 0x0000A880
_0806B3D8: .4byte 0x0201AF84
_0806B3DC: .4byte 0x02022BA0
_0806B3E0: .4byte 0x06010800
_0806B3E4: .4byte 0xFFFFF800

	thumb_func_start sub_0806B3E8
sub_0806B3E8: @ 0x0806B3E8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	movs r2, #0
	bl Interpolate
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, r1, r0
	strh r1, [r2, #2]
	ldr r2, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r0, r1, r0
	strh r0, [r2, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B438
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x64]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806B438:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806B440
sub_0806B440: @ 0x0806B440
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0806B47C @ =gUnk_08C4AC28
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	cmp r5, #0
	bne _0806B484
	ldr r0, _0806B480 @ =0x0203E080
	ldr r0, [r0]
	b _0806B488
	.align 2, 0
_0806B47C: .4byte gUnk_08C4AC28
_0806B480: .4byte 0x0203E080
_0806B484:
	ldr r0, _0806B494 @ =0x0203E080
	ldr r0, [r0, #4]
_0806B488:
	mov sb, r0
	cmp r6, #0
	bne _0806B4A0
	ldr r3, _0806B498 @ =gUnk_08C4B778
	ldr r6, _0806B49C @ =gUnk_082F0950
	b _0806B4CC
	.align 2, 0
_0806B494: .4byte 0x0203E080
_0806B498: .4byte gUnk_08C4B778
_0806B49C: .4byte gUnk_082F0950
_0806B4A0:
	cmp r7, #1
	beq _0806B4B8
	cmp r7, #1
	bhs _0806B4C8
	ldr r3, _0806B4B0 @ =gUnk_08C4B8F0
	ldr r6, _0806B4B4 @ =gUnk_082F0E88
	b _0806B4CC
	.align 2, 0
_0806B4B0: .4byte gUnk_08C4B8F0
_0806B4B4: .4byte gUnk_082F0E88
_0806B4B8:
	ldr r3, _0806B4C0 @ =gUnk_08C4BA44
	ldr r6, _0806B4C4 @ =gUnk_082F15C4
	b _0806B4CC
	.align 2, 0
_0806B4C0: .4byte gUnk_08C4BA44
_0806B4C4: .4byte gUnk_082F15C4
_0806B4C8:
	ldr r3, _0806B4F8 @ =gUnk_08C4BD0C
	ldr r6, _0806B4FC @ =gUnk_082F1D50
_0806B4CC:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r5, #0
	bne _0806B500
	ldrh r0, [r1, #4]
	adds r0, #0xa
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	adds r1, #0x10
	b _0806B516
	.align 2, 0
_0806B4F8: .4byte gUnk_08C4BD0C
_0806B4FC: .4byte gUnk_082F1D50
_0806B500:
	ldrh r0, [r1, #4]
	adds r0, #2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	subs r1, #0xc
_0806B516:
	strh r1, [r4, #0x32]
	ldrh r0, [r0, #2]
	subs r0, #0x10
	strh r0, [r4, #0x34]
	ldr r0, [r4, #0x60]
	strh r1, [r0, #2]
	ldr r4, _0806B54C @ =0x0201A784
	mov r0, sb
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r6, #0
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B54C: .4byte 0x0201A784

	thumb_func_start sub_0806B550
sub_0806B550: @ 0x0806B550
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	ldr r1, [r4, #0x60]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B590
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0806B590:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0806B598
sub_0806B598: @ 0x0806B598
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B5B8
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806B5B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806B5C0
sub_0806B5C0: @ 0x0806B5C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0806B5F0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B5F4 @ =gUnk_08C4AC48
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	movs r1, #0
	bl sub_0804EF18
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B5F0: .4byte 0x0201774C
_0806B5F4: .4byte gUnk_08C4AC48

	thumb_func_start sub_0806B5F8
sub_0806B5F8: @ 0x0806B5F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r4, _0806B760 @ =0x02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _0806B764 @ =0x02000038
	ldrh r0, [r4]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r4]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r6, #2]
	adds r1, r2, r3
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	ldr r0, _0806B768 @ =0x02000028
	mov sb, r0
	ldrh r5, [r4]
	ldrh r2, [r0]
	adds r1, r5, r2
	ldr r3, _0806B76C @ =gEkrBgPosition
	mov sl, r3
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r2, _0806B770 @ =0x0200002C
	mov r8, r2
	ldrh r4, [r4, #2]
	ldrh r3, [r2]
	subs r3, r3, r4
	mov ip, r3
	mov r2, sb
	ldrh r2, [r2, #2]
	adds r5, r5, r2
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r3, r8
	ldrh r3, [r3, #2]
	subs r4, r3, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, ip
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B752
	ldr r1, _0806B774 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	mov r0, sl
	ldr r4, [r0]
	mov r2, sb
	ldrh r2, [r2]
	subs r1, r2, r4
	mov r3, sb
	ldrh r3, [r3, #2]
	subs r4, r3, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	ldrh r5, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	ldr r0, [r7, #0x60]
	bl Proc_End
	adds r0, r7, #0
	bl Proc_Break
_0806B752:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B760: .4byte 0x02017760
_0806B764: .4byte 0x02000038
_0806B768: .4byte 0x02000028
_0806B76C: .4byte gEkrBgPosition
_0806B770: .4byte 0x0200002C
_0806B774: .4byte 0x0201774C

	thumb_func_start sub_0806B778
sub_0806B778: @ 0x0806B778
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _0806B790 @ =gUnk_08C4BD70
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _0806B794 @ =0x06008000
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	.align 2, 0
_0806B790: .4byte gUnk_08C4BD70
_0806B794: .4byte 0x06008000

	thumb_func_start sub_0806B798
sub_0806B798: @ 0x0806B798
	push {r4, lr}
	sub sp, #8
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	ldr r0, _0806B7D0 @ =gUnk_08C4BD70
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _0806B7D4 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806B7D8 @ =gBg3Tm
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B7D0: .4byte gUnk_08C4BD70
_0806B7D4: .4byte gEkrTsaBuffer
_0806B7D8: .4byte gBg3Tm

	thumb_func_start sub_0806B7DC
sub_0806B7DC: @ 0x0806B7DC
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	ldr r0, _0806B7F8 @ =gUnk_08C4BD70
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _0806B7FC @ =0x02022920
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	.align 2, 0
_0806B7F8: .4byte gUnk_08C4BD70
_0806B7FC: .4byte 0x02022920

	thumb_func_start sub_0806B800
sub_0806B800: @ 0x0806B800
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_0806B778
	movs r5, #0
	str r5, [sp]
	ldr r1, _0806B83C @ =0x0600FFE0
	ldr r2, _0806B840 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	adds r0, r4, #0
	bl sub_0806B798
	adds r0, r4, #0
	bl sub_0806B7DC
	ldr r0, _0806B844 @ =gPal
	strh r5, [r0]
	movs r0, #8
	bl EnableBgSync
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B83C: .4byte 0x0600FFE0
_0806B840: .4byte 0x01000008
_0806B844: .4byte gPal

	thumb_func_start CheckEkrPopupDone
CheckEkrPopupDone: @ 0x0806B848
	ldr r0, _0806B854 @ =0x0202013C
	ldr r0, [r0]
	cmp r0, #1
	beq _0806B858
	movs r0, #0
	b _0806B85A
	.align 2, 0
_0806B854: .4byte 0x0202013C
_0806B858:
	movs r0, #1
_0806B85A:
	bx lr

	thumb_func_start EndEkrPopup
EndEkrPopup: @ 0x0806B85C
	push {r4, lr}
	ldr r4, _0806B874 @ =0x02020138
	ldr r0, [r4]
	cmp r0, #0
	beq _0806B86E
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0806B86E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B874: .4byte 0x02020138

	thumb_func_start EfxPlaySound5AVol100
EfxPlaySound5AVol100: @ 0x0806B878
	push {lr}
	ldr r0, _0806B888 @ =0x0000037A
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0806B888: .4byte 0x0000037A

	thumb_func_start sub_0806B88C
sub_0806B88C: @ 0x0806B88C
	push {lr}
	movs r0, #0xdf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MakeBattlePopupTileMapFromTSA
MakeBattlePopupTileMapFromTSA: @ 0x0806B8A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r6, _0806B980 @ =gEkrTsaBuffer
	ldrh r1, [r6]
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r1, r2
	mov r3, ip
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x40
	ldrh r7, [r6, #0x30]
	adds r0, r7, r2
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r6, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r6, #0
	adds r0, #0x90
	ldrh r0, [r0]
	adds r0, r0, r2
	strh r0, [r1]
	movs r0, #0
	mov r8, r0
	cmp r8, sb
	bhs _0806B934
	adds r3, #0xc2
	str r3, [sp]
	mov r5, ip
	adds r5, #0x82
	adds r4, r6, #0
	adds r4, #0x62
	subs r3, #0x80
	mov r2, ip
	adds r2, #2
	adds r1, r6, #2
_0806B900:
	ldrh r7, [r1]
	movs r0, #0x88
	lsls r0, r0, #5
	adds r7, r7, r0
	strh r7, [r2]
	ldrh r7, [r1, #0x30]
	adds r7, r7, r0
	strh r7, [r3]
	ldrh r7, [r4]
	adds r7, r7, r0
	strh r7, [r5]
	ldrh r7, [r4, #0x30]
	adds r7, r7, r0
	ldr r0, [sp]
	strh r7, [r0]
	adds r0, #2
	str r0, [sp]
	adds r5, #2
	adds r4, #2
	adds r3, #2
	adds r2, #2
	adds r1, #2
	movs r7, #1
	add r8, r7
	cmp r8, sb
	blo _0806B900
_0806B934:
	mov r1, r8
	lsls r0, r1, #1
	mov r2, ip
	adds r1, r0, r2
	ldrh r3, [r6, #0x2e]
	movs r7, #0x88
	lsls r7, r7, #5
	adds r0, r3, r7
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x42
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r0, [r0]
	adds r3, r7, #0
	adds r0, r0, r3
	strh r0, [r2]
	adds r2, #0x40
	adds r0, r6, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r2]
	adds r1, #0xc2
	adds r0, r6, #0
	adds r0, #0xbe
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B980: .4byte gEkrTsaBuffer

	thumb_func_start DrawBattlePopup
DrawBattlePopup: @ 0x0806B984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r7, r1, #0
	mov r8, r2
	ldr r0, _0806B9DC @ =gUnk_081E11FC
	ldr r1, _0806B9E0 @ =0x06002000
	bl LZ77UnCompVram
	ldr r0, _0806B9E4 @ =gUnk_081E1378
	ldr r1, _0806B9E8 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	ldr r0, _0806B9EC @ =0x02017648
	ldr r1, _0806B9F0 @ =0x060020C0
	movs r2, #0x83
	lsls r2, r2, #1
	movs r3, #1
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, _0806B9F4 @ =gUnk_081E1358
	ldr r1, _0806B9F8 @ =0x02022880
	movs r2, #8
	bl CpuFastSet
	cmp r7, #0
	bne _0806BA04
	ldr r0, _0806B9FC @ =0x0000071A
	bl DecodeMsg
	adds r4, r0, #0
	bl GetStringTextLen
	mov sb, r0
	mov r5, sb
	adds r5, #0x10
	ldr r0, _0806BA00 @ =0x0000071B
	b _0806BA1E
	.align 2, 0
_0806B9DC: .4byte gUnk_081E11FC
_0806B9E0: .4byte 0x06002000
_0806B9E4: .4byte gUnk_081E1378
_0806B9E8: .4byte gEkrTsaBuffer
_0806B9EC: .4byte 0x02017648
_0806B9F0: .4byte 0x060020C0
_0806B9F4: .4byte gUnk_081E1358
_0806B9F8: .4byte 0x02022880
_0806B9FC: .4byte 0x0000071A
_0806BA00: .4byte 0x0000071B
_0806BA04:
	cmp r7, #1
	bne _0806BA30
	movs r0, #0
	mov sb, r0
	mov r0, r8
	bl GetItemName
	adds r4, r0, #0
	bl GetStringTextLen
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _0806BA2C @ =0x0000071C
_0806BA1E:
	bl DecodeMsg
	adds r4, r0, #0
	bl GetStringTextLen
	adds r4, r0, r5
	b _0806BA44
	.align 2, 0
_0806BA2C: .4byte 0x0000071C
_0806BA30:
	movs r1, #0
	mov sb, r1
	ldr r0, _0806BA9C @ =0x00000725
	bl DecodeMsg
	adds r4, r0, #0
	bl GetStringTextLen
	adds r4, r0, #0
	adds r4, #0x10
_0806BA44:
	adds r0, r4, #7
	asrs r6, r0, #3
	ldr r0, _0806BAA0 @ =gBg1Tm
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	bl MakeBattlePopupTileMapFromTSA
	ldr r5, _0806BAA4 @ =0x02017660
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitText
	lsls r0, r6, #3
	subs r0, r0, r4
	asrs r0, r0, #1
	mov sl, r0
	adds r0, r5, #0
	mov r1, sl
	bl Text_SetCursor
	ldr r0, _0806BAA8 @ =gUnk_081E1258
	ldr r1, _0806BAAC @ =0x060020C0
	bl LZ77UnCompVram
	cmp r7, #0
	bne _0806BAB8
	ldr r0, _0806BAB0 @ =0x0000071A
	bl DecodeMsg
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Skip
	ldr r0, _0806BAB4 @ =0x0000071B
	b _0806BADE
	.align 2, 0
_0806BA9C: .4byte 0x00000725
_0806BAA0: .4byte gBg1Tm
_0806BAA4: .4byte 0x02017660
_0806BAA8: .4byte gUnk_081E1258
_0806BAAC: .4byte 0x060020C0
_0806BAB0: .4byte 0x0000071A
_0806BAB4: .4byte 0x0000071B
_0806BAB8:
	cmp r7, #1
	bne _0806BAFC
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Skip
	mov r0, r8
	bl GetItemName
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	ldr r0, _0806BAF8 @ =0x0000071C
_0806BADE:
	bl DecodeMsg
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	b _0806BB1C
	.align 2, 0
_0806BAF8: .4byte 0x0000071C
_0806BAFC:
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Skip
	ldr r0, _0806BB54 @ =0x00000725
	bl DecodeMsg
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
_0806BB1C:
	adds r1, r6, #2
	lsls r1, r1, #3
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	rsbs r1, r5, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0806BB58 @ =0x0000FFD0
	movs r0, #1
	bl SetBgOffset
	movs r0, #2
	bl EnableBgSync
	bl InitIcons
	cmp r7, #0
	bne _0806BB5C
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, r8
	bl GetItemType
	adds r0, #0x70
	b _0806BB6E
	.align 2, 0
_0806BB54: .4byte 0x00000725
_0806BB58: .4byte 0x0000FFD0
_0806BB5C:
	cmp r7, #1
	bne _0806BB76
	movs r0, #0
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, r8
	bl sub_08017808
_0806BB6E:
	movs r1, #0x40
	bl PutIconObjImg
	b _0806BB88
_0806BB76:
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, r8
	adds r0, #0x70
	movs r1, #0x40
	bl PutIconObjImg
_0806BB88:
	ldr r0, _0806BBF0 @ =gUnk_08C4C058
	movs r1, #0x96
	bl AnimCreate
	ldr r3, [sp]
	str r0, [r3, #0x60]
	movs r4, #0
	movs r1, #0x91
	lsls r1, r1, #6
	strh r1, [r0, #8]
	mov r1, sl
	adds r1, #8
	adds r1, r5, r1
	add r1, sb
	strh r1, [r0, #2]
	movs r1, #0x38
	strh r1, [r0, #4]
	bl EnablePalSync
	ldr r2, _0806BBF4 @ =gDispIo
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
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BBF0: .4byte gUnk_08C4C058
_0806BBF4: .4byte gDispIo

	thumb_func_start NewEkrPopup
NewEkrPopup: @ 0x0806BBF8
	push {r4, r5, lr}
	ldr r0, _0806BC54 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _0806BC6C
	ldr r4, _0806BC58 @ =0x02020138
	ldr r0, _0806BC5C @ =gUnk_08C4C0C8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _0806BC60 @ =0x0202013C
	movs r0, #0
	str r0, [r1]
	subs r0, #1
	str r0, [r5, #0x44]
	movs r1, #0
	ldr r3, _0806BC64 @ =gpEkrBattleUnitRight
	ldr r2, _0806BC68 @ =gpEkrBattleUnitLeft
_0806BC20:
	ldr r0, [r3]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806BC3A
	ldr r0, [r2]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806BC3A
	str r1, [r5, #0x44]
_0806BC3A:
	adds r1, #1
	cmp r1, #7
	ble _0806BC20
	ldr r1, [r5, #0x44]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806BD0A
	movs r0, #0x80
	bl SetBgmVolume
	b _0806BD36
	.align 2, 0
_0806BC54: .4byte gEkrDistanceType
_0806BC58: .4byte 0x02020138
_0806BC5C: .4byte gUnk_08C4C0C8
_0806BC60: .4byte 0x0202013C
_0806BC64: .4byte gpEkrBattleUnitRight
_0806BC68: .4byte gpEkrBattleUnitLeft
_0806BC6C:
	ldr r4, _0806BD18 @ =0x02020138
	ldr r0, _0806BD1C @ =gUnk_08C4C060
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _0806BD20 @ =0x0202013C
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	ldr r0, _0806BD24 @ =0x0203DFF8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806BCC2
	ldr r4, _0806BD28 @ =gpEkrBattleUnitLeft
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806BCAC
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x44]
_0806BCAC:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806BCC2
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x48]
_0806BCC2:
	ldr r0, _0806BD24 @ =0x0203DFF8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806BCFA
	ldr r4, _0806BD2C @ =gpEkrBattleUnitRight
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806BCE4
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x4c]
_0806BCE4:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806BCFA
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x50]
_0806BCFA:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	ldr r1, [r5, #0x50]
	cmn r0, r1
	bne _0806BD30
_0806BD0A:
	ldr r1, _0806BD20 @ =0x0202013C
	movs r0, #1
	str r0, [r1]
	bl EndEkrPopup
	b _0806BD36
	.align 2, 0
_0806BD18: .4byte 0x02020138
_0806BD1C: .4byte gUnk_08C4C060
_0806BD20: .4byte 0x0202013C
_0806BD24: .4byte 0x0203DFF8
_0806BD28: .4byte gpEkrBattleUnitLeft
_0806BD2C: .4byte gpEkrBattleUnitRight
_0806BD30:
	movs r0, #0x80
	bl SetBgmVolume
_0806BD36:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EkrPopup_Delay
EkrPopup_Delay: @ 0x0806BD3C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0806BD54
	adds r0, r1, #0
	bl Proc_Break
_0806BD54:
	pop {r0}
	bx r0

	thumb_func_start EkrPopup_DrawWRankUp
EkrPopup_DrawWRankUp: @ 0x0806BD58
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	cmp r2, #0
	beq _0806BD74
	movs r1, #0
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806BD74:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrPopup_WaitWRankUp
ekrPopup_WaitWRankUp: @ 0x0806BD80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0806BD92
	adds r0, r4, #0
	bl Proc_Break
	b _0806BDB2
_0806BD92:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806BDB2
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806BDB2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrPopup_DrawWRankUp2
ekrPopup_DrawWRankUp2: @ 0x0806BDB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x4c]
	cmp r2, #0
	beq _0806BDD4
	movs r1, #0
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806BDD4:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BDE0
sub_0806BDE0: @ 0x0806BDE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _0806BDF2
	adds r0, r4, #0
	bl Proc_Break
	b _0806BE12
_0806BDF2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806BE12
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806BE12:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BE18
sub_0806BE18: @ 0x0806BE18
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0806BE34
	movs r1, #1
	bl DrawBattlePopup
	bl sub_0806B88C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0806BE34:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BE40
sub_0806BE40: @ 0x0806BE40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0806BE52
	adds r0, r4, #0
	bl Proc_Break
	b _0806BE72
_0806BE52:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806BE72
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806BE72:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BE78
sub_0806BE78: @ 0x0806BE78
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	beq _0806BE94
	movs r1, #1
	bl DrawBattlePopup
	bl sub_0806B88C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0806BE94:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BEA0
sub_0806BEA0: @ 0x0806BEA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0806BEB2
	adds r0, r4, #0
	bl Proc_Break
	b _0806BED6
_0806BEB2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806BED6
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806BED6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BEDC
sub_0806BEDC: @ 0x0806BEDC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0806BF02
	ldr r0, _0806BF08 @ =0x0202013C
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
_0806BF02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF08: .4byte 0x0202013C

	thumb_func_start nullsub_60
nullsub_60: @ 0x0806BF0C
	bx lr
	.align 2, 0

	thumb_func_start sub_0806BF10
sub_0806BF10: @ 0x0806BF10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0806BF30
	ldr r2, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806BF30:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BF3C
sub_0806BF3C: @ 0x0806BF3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0806BF4E
	adds r0, r4, #0
	bl Proc_Break
	b _0806BF72
_0806BF4E:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806BF72
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806BF72:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BF78
sub_0806BF78: @ 0x0806BF78
	ldr r1, _0806BF8C @ =gBattleStats
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0806BF90
	movs r0, #0
	b _0806BF92
	.align 2, 0
_0806BF8C: .4byte gBattleStats
_0806BF90:
	movs r0, #1
_0806BF92:
	bx lr

	thumb_func_start sub_0806BF94
sub_0806BF94: @ 0x0806BF94
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl sub_0804DC18
	ldr r1, _0806BFB4 @ =gEkrInitPosReal
	str r0, [r1]
	bl sub_0806BFD0
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0806BFB4: .4byte gEkrInitPosReal

	thumb_func_start sub_0806BFB8
sub_0806BFB8: @ 0x0806BFB8
	push {lr}
	bl AnimClearAll
	bl sub_0806C0D4
	ldr r0, _0806BFCC @ =sub_08051214
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_0806BFCC: .4byte sub_08051214
