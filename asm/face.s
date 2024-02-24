	.include "macro.inc"
	.syntax unified

	thumb_func_start FaceEye_80076F8
FaceEye_80076F8: @ 0x080076F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl FaceFmtProc_GenBlinkInterval
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne _08007730
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, _08007738 @ =0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl Proc_Goto
_08007730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007738: .4byte 0x7FFFFFFF

	thumb_func_start FaceEye_800773C
FaceEye_800773C: @ 0x0800773C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _08007758
	adds r1, r5, #0
	adds r0, r4, #0
	bl Proc_Goto
	b _0800776E
_08007758:
	cmp r0, #0
	bge _0800776E
	adds r0, r4, #0
	bl FaceFmtProc_GenBlinkInterval
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0800776E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start FaceEye_8007774
FaceEye_8007774: @ 0x08007774
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _080077CC
	lsls r0, r0, #2
	ldr r1, _0800778C @ =_08007790
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800778C: .4byte _08007790
_08007790: @ jump table
	.4byte _080077C0 @ case 0
	.4byte _080077C0 @ case 1
	.4byte _080077C0 @ case 2
	.4byte _080077BC @ case 3
	.4byte _080077BC @ case 4
	.4byte _080077BC @ case 5
	.4byte _080077C0 @ case 6
	.4byte _080077C0 @ case 7
	.4byte _080077C0 @ case 8
	.4byte _080077CC @ case 9
	.4byte _080077C4 @ case 10
_080077BC:
	movs r5, #0
	b _080077CC
_080077C0:
	movs r5, #1
	b _080077CC
_080077C4:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080077CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutFaceEyeSprite
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start FaceEye_80077E0
FaceEye_80077E0: @ 0x080077E0
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start FaceEye_80077E8
FaceEye_80077E8: @ 0x080077E8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _080077FC
	adds r0, r4, #0
	bl FaceEye_8007774
	b _08007814
_080077FC:
	adds r0, r4, #0
	movs r1, #0
	bl PutFaceEyeSprite
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007814
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08007814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FaceEye_800781C
FaceEye_800781C: @ 0x0800781C
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start FaceEye_8007824
FaceEye_8007824: @ 0x08007824
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt _08007838
	adds r0, r4, #0
	bl FaceEye_8007774
	b _08007850
_08007838:
	adds r0, r4, #0
	movs r1, #1
	bl PutFaceEyeSprite
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007850
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08007850:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FaceEye_8007858
FaceEye_8007858: @ 0x08007858
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start FaceEye_8007860
FaceEye_8007860: @ 0x08007860
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _080078BC
	lsls r0, r0, #2
	ldr r1, _08007878 @ =_0800787C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007878: .4byte _0800787C
_0800787C: @ jump table
	.4byte _080078AC @ case 0
	.4byte _080078AC @ case 1
	.4byte _080078AC @ case 2
	.4byte _080078A8 @ case 3
	.4byte _080078A8 @ case 4
	.4byte _080078A8 @ case 5
	.4byte _080078AC @ case 6
	.4byte _080078AC @ case 7
	.4byte _080078AC @ case 8
	.4byte _080078BC @ case 9
	.4byte _080078B0 @ case 10
_080078A8:
	movs r5, #0
	b _080078BC
_080078AC:
	movs r5, #1
	b _080078BC
_080078B0:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
	strh r0, [r4, #0x32]
_080078BC:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl PutFaceEyeSprite
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetFaceBlinkControl
SetFaceBlinkControl: @ 0x080078D4
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bne _080078E0
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0, #0x18]
_080078E0:
	ldr r4, [r2, #0x48]
	strh r1, [r4, #0x30]
	adds r0, r4, #0
	bl FaceFmtProc_GenBlinkInterval
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetFaceBlinkControlById
SetFaceBlinkControlById: @ 0x080078F4
	push {lr}
	ldr r2, _08007908 @ =gFaces
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl SetFaceBlinkControl
	pop {r0}
	bx r0
	.align 2, 0
_08007908: .4byte gFaces

	thumb_func_start FaceFmtProc_GenBlinkInterval
FaceFmtProc_GenBlinkInterval: @ 0x0800790C
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #0x30]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _08007960
	lsls r0, r0, #2
	ldr r1, _0800792C @ =_08007930
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800792C: .4byte _08007930
_08007930: @ jump table
	.4byte _0800794E @ case 0
	.4byte _08007954 @ case 1
	.4byte _08007944 @ case 2
	.4byte _0800795A @ case 3
	.4byte _0800795E @ case 4
_08007944:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b _08007960
_0800794E:
	asrs r0, r2, #7
	adds r0, #0x1e
	b _08007960
_08007954:
	asrs r0, r2, #9
	adds r0, #0x1e
	b _08007960
_0800795A:
	movs r0, #1
	b _08007960
_0800795E:
	ldr r0, _08007968 @ =0x7FFFFFFF
_08007960:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007968: .4byte 0x7FFFFFFF

	thumb_func_start sub_800796C
sub_800796C: @ 0x0800796C
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_8007974
sub_8007974: @ 0x08007974
	push {lr}
	ldr r2, _08007988 @ =gFaces
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_800796C
	pop {r0}
	bx r0
	.align 2, 0
_08007988: .4byte gFaces

	thumb_func_start sub_800798C
sub_800798C: @ 0x0800798C
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

	thumb_func_start sub_8007A5C
sub_8007A5C: @ 0x08007A5C
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
	ldr r0, _08007AC4 @ =FaceTm_Unk_08BFF9A8
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
_08007AC4: .4byte FaceTm_Unk_08BFF9A8
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
	bl sub_8091618
_08007BA4:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007BB0
	bl sub_8091618
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
