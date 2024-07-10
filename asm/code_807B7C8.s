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

	thumb_func_start DragonGatefx_DistortionHandler
DragonGatefx_DistortionHandler: @ 0x0807B8E4
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

	thumb_func_start DragonGatefx_DrawLight
DragonGatefx_DrawLight: @ 0x0807B94C
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
	ldr r0, _0807B9F4 @ =Img_DragonGateLight
	ldr r1, _0807B9F8 @ =0x06004000
	bl Decompress
	ldr r0, _0807B9FC @ =gBg2Tm
	ldr r1, _0807BA00 @ =Tsa_DragonGateLight
	movs r2, #0xc4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r5, _0807BA04 @ =Pal_DragonGateLight
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
	ldr r0, _0807BA0C @ =DragonGatefx_LightHBlank
	bl SetOnHBlankA
	ldr r0, _0807BA10 @ =DragonGatefx_DistortionHandler
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
_0807B9F4: .4byte Img_DragonGateLight
_0807B9F8: .4byte 0x06004000
_0807B9FC: .4byte gBg2Tm
_0807BA00: .4byte Tsa_DragonGateLight
_0807BA04: .4byte Pal_DragonGateLight
_0807BA08: .4byte gUnk_081C0A70
_0807BA0C: .4byte DragonGatefx_LightHBlank
_0807BA10: .4byte DragonGatefx_DistortionHandler

	thumb_func_start DragonGatefx_DrawDragon
DragonGatefx_DrawDragon: @ 0x0807BA14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0807BAC0 @ =DragonGatefx_DragonHBlank
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
	ldr r0, _0807BAD0 @ =Img_DragonGateDragon
	ldr r1, _0807BAD4 @ =0x06003000
	bl Decompress
	ldr r0, _0807BAD8 @ =gBg1Tm
	ldr r1, _0807BADC @ =Tsa_DragonGateDragon
	movs r2, #0xe3
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r0, _0807BAE0 @ =Pal_DragonGateDragon
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
_0807BAC0: .4byte DragonGatefx_DragonHBlank
_0807BAC4: .4byte gDispIo
_0807BAC8: .4byte 0x0000FFE0
_0807BACC: .4byte 0x0000E0FF
_0807BAD0: .4byte Img_DragonGateDragon
_0807BAD4: .4byte 0x06003000
_0807BAD8: .4byte gBg1Tm
_0807BADC: .4byte Tsa_DragonGateDragon
_0807BAE0: .4byte Pal_DragonGateDragon

	thumb_func_start DragonGatefx_MergeDragon
DragonGatefx_MergeDragon: @ 0x0807BAE4
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
	ldr r1, _0807BBE4 @ =Tsa_DragonGateDragon
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
_0807BBE4: .4byte Tsa_DragonGateDragon
_0807BBE8: .4byte gBg1Tm

	thumb_func_start DragonGatefxSetHBlank
DragonGatefxSetHBlank: @ 0x0807BBEC
	push {lr}
	ldr r0, _0807BBF8 @ =DragonGatefx_LightHBlank
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF8: .4byte DragonGatefx_LightHBlank

	thumb_func_start DragonGatefx_End
DragonGatefx_End: @ 0x0807BBFC
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

	thumb_func_start EventCall_StartDragonGatefx
EventCall_StartDragonGatefx: @ 0x0807BC54
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807BC64 @ =ProcScr_DragonGatefx
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807BC64: .4byte ProcScr_DragonGatefx

	thumb_func_start DrawDragonGateDragonfx
DrawDragonGateDragonfx: @ 0x0807BC68
	push {lr}
	ldr r0, _0807BC7C @ =ProcScr_DragonGatefx
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807BC7C: .4byte ProcScr_DragonGatefx

	thumb_func_start EndDragonGatefx
EndDragonGatefx: @ 0x0807BC80
	push {lr}
	ldr r0, _0807BC90 @ =ProcScr_DragonGatefx
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807BC90: .4byte ProcScr_DragonGatefx

	thumb_func_start DragonSpriteBlinking_Init
DragonSpriteBlinking_Init: @ 0x0807BC94
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start DragonSpriteBlinking_Loop
DragonSpriteBlinking_Loop: @ 0x0807BC9C
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

	thumb_func_start StartDragonSpriteBlinking
StartDragonSpriteBlinking: @ 0x0807BCD8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807BCE8 @ =ProcScr_DragonSpriteBlinking
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807BCE8: .4byte ProcScr_DragonSpriteBlinking

	thumb_func_start EndDragonSpriteBlinking
EndDragonSpriteBlinking: @ 0x0807BCEC
	push {lr}
	ldr r0, _0807BCFC @ =ProcScr_DragonSpriteBlinking
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807BCFC: .4byte ProcScr_DragonSpriteBlinking
