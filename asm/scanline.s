	.include "macro.inc"
	.syntax unified

	thumb_func_start InitScanlineEffect
InitScanlineEffect: @ 0x0807702C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0807705C @ =gManimScanlineBufA
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _08077060 @ =gManimScanlineBufB
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r0, _08077064 @ =gManimScanlineBufs
	ldr r1, _0807705C @ =gManimScanlineBufA
	str r1, [r0]
	ldr r0, _08077064 @ =gManimScanlineBufs
	ldr r1, _08077060 @ =gManimScanlineBufB
	str r1, [r0, #4]
	ldr r0, _08077068 @ =gManimActiveScanlineBuf
	ldr r1, _08077064 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807705C: .4byte gManimScanlineBufA
_08077060: .4byte gManimScanlineBufB
_08077064: .4byte gManimScanlineBufs
_08077068: .4byte gManimActiveScanlineBuf

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
	ldr r0, _080771CC @ =gManimScanlineBufs
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _080771CC @ =gManimScanlineBufs
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl MapAnimScanlineCore
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080771CC: .4byte gManimScanlineBufs

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
	ldr r0, _0807720C @ =gManimActiveScanlineBuf
	ldr r1, _08077210 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077222
	.align 2, 0
_08077208: .4byte 0x04000006
_0807720C: .4byte gManimActiveScanlineBuf
_08077210: .4byte gManimScanlineBufs
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
	ldr r3, _08077244 @ =gManimActiveScanlineBuf
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
_08077244: .4byte gManimActiveScanlineBuf

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
	ldr r0, _08077274 @ =gManimActiveScanlineBuf
	ldr r1, _08077278 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807728A
	.align 2, 0
_08077270: .4byte 0x04000006
_08077274: .4byte gManimActiveScanlineBuf
_08077278: .4byte gManimScanlineBufs
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
	ldr r3, _080772C4 @ =gManimActiveScanlineBuf
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080772C8 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080772C4 @ =gManimActiveScanlineBuf
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
_080772C4: .4byte gManimActiveScanlineBuf
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
	ldr r0, _080772F8 @ =gManimActiveScanlineBuf
	ldr r1, _080772FC @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807730E
	.align 2, 0
_080772F4: .4byte 0x04000006
_080772F8: .4byte gManimActiveScanlineBuf
_080772FC: .4byte gManimScanlineBufs
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
	ldr r3, _08077348 @ =gManimActiveScanlineBuf
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _0807734C @ =0x05000042
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077348 @ =gManimActiveScanlineBuf
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
_08077348: .4byte gManimActiveScanlineBuf
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
	ldr r0, _0807737C @ =gManimActiveScanlineBuf
	ldr r1, _08077380 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077392
	.align 2, 0
_08077378: .4byte 0x04000006
_0807737C: .4byte gManimActiveScanlineBuf
_08077380: .4byte gManimScanlineBufs
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
	ldr r3, _080773B4 @ =gManimActiveScanlineBuf
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
_080773B4: .4byte gManimActiveScanlineBuf

	thumb_func_start StartManimFrameGradientScanlineEffect1
StartManimFrameGradientScanlineEffect1: @ 0x080773B8
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
	ldr r0, _080773E4 @ =gManimActiveScanlineBuf
	ldr r1, _080773E8 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080773FA
	.align 2, 0
_080773E0: .4byte 0x04000006
_080773E4: .4byte gManimActiveScanlineBuf
_080773E8: .4byte gManimScanlineBufs
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
	ldr r3, _0807741C @ =gManimActiveScanlineBuf
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
_0807741C: .4byte gManimActiveScanlineBuf

	thumb_func_start StartManimFrameGradientScanlineEffect2
StartManimFrameGradientScanlineEffect2: @ 0x08077420
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
	ldr r1, _08077554 @ =gManimScanlineBufs
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
	bl PrepareGradientScanlineBuf
	ldr r0, _08077554 @ =gManimScanlineBufs
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
	bl PrepareGradientScanlineBuf
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
_08077554: .4byte gManimScanlineBufs
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
	ldr r0, _08077584 @ =gManimScanlineBufs
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
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
_08077584: .4byte gManimScanlineBufs
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
	ldr r1, _080775D4 @ =gManimScanlineBufs
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl SetScanlineBufWinR
	ldr r1, _080775D4 @ =gManimScanlineBufs
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl SetScanlineBufWinL
_080775CA:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08077574
	.align 2, 0
_080775D4: .4byte gManimScanlineBufs
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
	ldr r1, _08077610 @ =gManimScanlineBufs
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl SetScanlineBufWinR
	ldr r1, _08077610 @ =gManimScanlineBufs
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080775DE
	.align 2, 0
_08077610: .4byte gManimScanlineBufs
_08077614:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start PrepareSineWaveScanlineBuf
PrepareSineWaveScanlineBuf: @ 0x0807761C
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

	thumb_func_start PrepareSineWaveScanlineBufExt
PrepareSineWaveScanlineBufExt: @ 0x0807781C
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
	ldr r0, _080778BC @ =gManimScanlineBufs
	ldr r1, [r0]
	str r1, [r7]
	ldr r0, _080778BC @ =gManimScanlineBufs
	ldr r1, _080778BC @ =gManimScanlineBufs
	ldr r2, [r1, #4]
	str r2, [r0]
	ldr r0, _080778BC @ =gManimScanlineBufs
	ldr r1, [r7]
	str r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080778BC: .4byte gManimScanlineBufs

	thumb_func_start InitScanlineBuf
InitScanlineBuf: @ 0x080778C0
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

	thumb_func_start SetScanlineBufWinL
SetScanlineBufWinL: @ 0x080778FC
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

	thumb_func_start SetScanlineBufWinR
SetScanlineBufWinR: @ 0x08077944
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

	thumb_func_start MapAnimScanlineCore
MapAnimScanlineCore: @ 0x0807798C
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
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
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

	thumb_func_start PrepareGradientScanlineBuf
PrepareGradientScanlineBuf: @ 0x08077A70
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
	ldr r0, _08077C18 @ =gManimScanlineBufs
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
	bl PrepareSineWaveScanlineBuf
	bl SwapScanlineBufs
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C18: .4byte gManimScanlineBufs

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
	ldr r0, _08077C4C @ =gManimScanlineBufs
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
_08077C4C: .4byte gManimScanlineBufs
_08077C50:
	movs r0, #8
	str r0, [r7]
_08077C54:
	ldr r0, [r7]
	cmp r0, #0x97
	ble _08077C5C
	b _08077C78
_08077C5C:
	ldr r0, _08077C74 @ =gManimScanlineBufs
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
_08077C74: .4byte gManimScanlineBufs
_08077C78:
	movs r0, #0
	str r0, [r7]
_08077C7C:
	ldr r0, [r7]
	cmp r0, #0x20
	ble _08077C84
	b _08077CE4
_08077C84:
	ldr r0, _08077CDC @ =gManimScanlineBufs
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
	ldr r0, _08077CDC @ =gManimScanlineBufs
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
_08077CDC: .4byte gManimScanlineBufs
_08077CE0: .4byte 0xFFFFFED0
_08077CE4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start GetScanlineBuf
GetScanlineBuf: @ 0x08077CEC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08077D10 @ =gManimScanlineBufs
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
_08077D10: .4byte gManimScanlineBufs
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
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
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
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
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
	ldr r0, _08077E4C @ =gManimScanlineBufs
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _08077E4C @ =gManimScanlineBufs
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
_08077E4C: .4byte gManimScanlineBufs

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
	ldr r0, _08077E9C @ =gManimScanlineBufs
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
_08077E9C: .4byte gManimScanlineBufs
_08077EA0:
	ldr r0, [r7, #0xc]
	str r0, [r7, #4]
_08077EA4:
	ldr r0, [r7, #4]
	cmp r0, #0x9f
	ble _08077EAC
	b _08077ECC
_08077EAC:
	ldr r0, _08077EC8 @ =gManimScanlineBufs
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
_08077EC8: .4byte gManimScanlineBufs
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
	ldr r0, _08077F1C @ =gManimScanlineBufs
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
_08077F1C: .4byte gManimScanlineBufs
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
	ldr r0, _08077F70 @ =gManimScanlineBufs
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
_08077F70: .4byte gManimScanlineBufs
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
	ldr r0, _08077FA4 @ =gManimScanlineBufs
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
_08077FA4: .4byte gManimScanlineBufs
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
	ldr r0, _08077FE0 @ =gManimActiveScanlineBuf
	ldr r1, _08077FE4 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077FF6
	.align 2, 0
_08077FDC: .4byte 0x04000006
_08077FE0: .4byte gManimActiveScanlineBuf
_08077FE4: .4byte gManimScanlineBufs
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
	ldr r3, _0807802C @ =gManimActiveScanlineBuf
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
_0807802C: .4byte gManimActiveScanlineBuf

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
	ldr r0, _0807805C @ =gManimActiveScanlineBuf
	ldr r1, _08078060 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08078072
	.align 2, 0
_08078058: .4byte 0x04000006
_0807805C: .4byte gManimActiveScanlineBuf
_08078060: .4byte gManimScanlineBufs
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
	ldr r3, _08078094 @ =gManimActiveScanlineBuf
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
_08078094: .4byte gManimActiveScanlineBuf

	thumb_func_start HBlank_Scanline_8078098
HBlank_Scanline_8078098: @ 0x08078098
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
	ldr r3, _080780DC @ =gManimActiveScanlineBuf
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
_080780DC: .4byte gManimActiveScanlineBuf

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
	ldr r2, _08078120 @ =gManimActiveScanlineBuf
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
_08078120: .4byte gManimActiveScanlineBuf
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
	ldr r0, _0807815C @ =gManimActiveScanlineBuf
	ldr r1, _08078160 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08078172
	.align 2, 0
_08078158: .4byte 0x04000006
_0807815C: .4byte gManimActiveScanlineBuf
_08078160: .4byte gManimScanlineBufs
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
	ldr r3, _080781C0 @ =gManimActiveScanlineBuf
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
	ldr r3, _080781C0 @ =gManimActiveScanlineBuf
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
_080781C0: .4byte gManimActiveScanlineBuf
_080781C4: .4byte 0x04000016

	thumb_func_start ScanlineRotation
ScanlineRotation: @ 0x080781C8
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

	thumb_func_start HBlank_Scanline_80782AC
HBlank_Scanline_80782AC: @ 0x080782AC
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
	ldr r0, _080782D8 @ =gManimActiveScanlineBuf
	ldr r1, _080782DC @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080782EE
	.align 2, 0
_080782D4: .4byte 0x04000006
_080782D8: .4byte gManimActiveScanlineBuf
_080782DC: .4byte gManimScanlineBufs
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
	ldr r3, _0807833C @ =gManimActiveScanlineBuf
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
	ldr r3, _0807833C @ =gManimActiveScanlineBuf
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
_0807833C: .4byte gManimActiveScanlineBuf
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
	ldr r0, _08078370 @ =gManimActiveScanlineBuf
	ldr r1, _08078374 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08078386
	.align 2, 0
_0807836C: .4byte 0x04000006
_08078370: .4byte gManimActiveScanlineBuf
_08078374: .4byte gManimScanlineBufs
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
	ldr r3, _080783D4 @ =gManimActiveScanlineBuf
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
	ldr r3, _080783D4 @ =gManimActiveScanlineBuf
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
_080783D4: .4byte gManimActiveScanlineBuf
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
	ldr r0, _08078408 @ =gManimActiveScanlineBuf
	ldr r1, _0807840C @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807841E
	.align 2, 0
_08078404: .4byte 0x04000006
_08078408: .4byte gManimActiveScanlineBuf
_0807840C: .4byte gManimScanlineBufs
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
	ldr r3, _0807846C @ =gManimActiveScanlineBuf
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
	ldr r3, _0807846C @ =gManimActiveScanlineBuf
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
_0807846C: .4byte gManimActiveScanlineBuf
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
	ldr r0, _080784A0 @ =gManimActiveScanlineBuf
	ldr r1, _080784A4 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080784B6
	.align 2, 0
_0807849C: .4byte 0x04000006
_080784A0: .4byte gManimActiveScanlineBuf
_080784A4: .4byte gManimScanlineBufs
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
	ldr r3, _08078504 @ =gManimActiveScanlineBuf
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
	ldr r3, _08078504 @ =gManimActiveScanlineBuf
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
_08078504: .4byte gManimActiveScanlineBuf
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
	ldr r0, _08078538 @ =gManimActiveScanlineBuf
	ldr r1, _0807853C @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _0807854E
	.align 2, 0
_08078534: .4byte 0x04000006
_08078538: .4byte gManimActiveScanlineBuf
_0807853C: .4byte gManimScanlineBufs
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
	ldr r3, _080785AC @ =gManimActiveScanlineBuf
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
	ldr r3, _080785AC @ =gManimActiveScanlineBuf
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
_080785AC: .4byte gManimActiveScanlineBuf
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
	ldr r0, _080785E4 @ =gManimActiveScanlineBuf
	ldr r1, _080785E8 @ =gManimScanlineBufs
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080785FA
	.align 2, 0
_080785E0: .4byte 0x04000006
_080785E4: .4byte gManimActiveScanlineBuf
_080785E8: .4byte gManimScanlineBufs
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
	ldr r3, _08078678 @ =gManimActiveScanlineBuf
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
	ldr r3, _08078678 @ =gManimActiveScanlineBuf
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08078680 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08078678 @ =gManimActiveScanlineBuf
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
	ldr r3, _08078678 @ =gManimActiveScanlineBuf
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
_08078678: .4byte gManimActiveScanlineBuf
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
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
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
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
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
	ldr r0, _080788CC @ =gManimScanlineBufs
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _080788CC @ =gManimScanlineBufs
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
_080788CC: .4byte gManimScanlineBufs
