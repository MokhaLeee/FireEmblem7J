	.include "macro.inc"
	.syntax unified

	thumb_func_start Face_0800798C
Face_0800798C: @ 0x0800798C
	push {r4, r5, lr}
	ldr r2, _080079AC @ =gFaces
	ldr r0, [r2]
	ldr r4, [r0, #0x48]
	ldr r1, _080079B0 @ =gpKeySt
	ldr r0, [r1]
	movs r3, #1
	ldrh r0, [r0, #4]
	ands r3, r0
	adds r5, r1, #0
	cmp r3, #0
	beq _080079B4
	movs r0, #2
	strh r0, [r4, #0x32]
	b _080079B6
	.align 2, 0
_080079AC: .4byte gFaces
_080079B0: .4byte gpKeySt
_080079B4:
	strh r3, [r4, #0x32]
_080079B6:
	ldr r0, [r2, #8]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080079CC
	movs r0, #3
_080079CC:
	strh r0, [r4, #0x32]
	ldr r0, [r2, #4]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080079E4
	movs r0, #4
	strh r0, [r4, #0x32]
_080079E4:
	ldr r0, [r2, #0xc]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080079FA
	movs r0, #4
	strh r0, [r4, #0x32]
_080079FA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8007A00
sub_8007A00: @ 0x08007A00
	push {lr}
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0
	movs r3, #0x13
	bl StartFaceAuto
	movs r1, #3
	bl SetFaceBlinkControl
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0x50
	movs r3, #0x1b
	bl StartFaceAuto
	movs r1, #1
	bl SetFaceBlinkControl
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0
	movs r3, #0x12
	bl StartFaceAuto
	movs r1, #2
	bl SetFaceBlinkControl
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0x50
	movs r3, #0x1a
	bl StartFaceAuto
	movs r1, #4
	bl SetFaceBlinkControl
	ldr r0, _08007A58 @ =gUnk_08BFFB20
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08007A58: .4byte gUnk_08BFFB20

	thumb_func_start StartBmFace
StartBmFace: @ 0x08007A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sb, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, _08007A80 @ =gFaces
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq _08007A84
	movs r0, #0
	b _08007B6A
	.align 2, 0
_08007A80: .4byte gFaces
_08007A84:
	ldr r0, _08007AC4 @ =ProcScr_BmFace
	movs r1, #5
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	mov r0, sb
	bl GetFaceInfo
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _08007AD4
	str r6, [sp]
	ldr r0, _08007AC8 @ =gFaceConfig
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r0, [r0, #4]
	lsls r1, r0, #5
	ldr r0, _08007ACC @ =gPal + 0x200
	adds r1, r1, r0
	ldr r2, _08007AD0 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _08007AEA
	.align 2, 0
_08007AC4: .4byte ProcScr_BmFace
_08007AC8: .4byte gFaceConfig
_08007ACC: .4byte gPal + 0x200
_08007AD0: .4byte 0x01000008
_08007AD4:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, _08007B30 @ =gFaceConfig
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08007AEA:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, sb
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl FaceRefreshSprite
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq _08007B42
	cmp r1, #0x80
	bgt _08007B34
	cmp r1, #0x40
	beq _08007B3E
	b _08007B4E
	.align 2, 0
_08007B30: .4byte gFaceConfig
_08007B34:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08007B48
	b _08007B4E
_08007B3E:
	movs r3, #0
	b _08007B52
_08007B42:
	movs r3, #0x80
	lsls r3, r3, #3
	b _08007B52
_08007B48:
	movs r3, #0xc0
	lsls r3, r3, #4
	b _08007B52
_08007B4E:
	movs r3, #0x80
	lsls r3, r3, #4
_08007B52:
	ldr r2, _08007B7C @ =gFaceConfig
	adds r2, r4, r2
	ldr r1, [r2]
	lsrs r1, r1, #5
	movs r0, #0xf
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
_08007B6A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007B7C: .4byte gFaceConfig

	thumb_func_start sub_8007B80
sub_8007B80: @ 0x08007B80
	ldr r3, _08007B90 @ =gFaces
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	strh r1, [r3, #0x34]
	ldr r0, [r0]
	strh r2, [r0, #0x36]
	bx lr
	.align 2, 0
_08007B90: .4byte gFaces

	thumb_func_start sub_8007B94
sub_8007B94: @ 0x08007B94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _08007BA4
	bl TryLockProc
_08007BA4:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007BB0
	bl TryLockProc
_08007BB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8007BB8
sub_8007BB8: @ 0x08007BB8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl GetFaceInfo
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, _08007C08 @ =gFaceConfig
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, _08007C0C @ =0x06010000
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007C08: .4byte gFaceConfig
_08007C0C: .4byte 0x06010000
