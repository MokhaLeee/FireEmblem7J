	.include "macro.inc"
	.syntax unified


	thumb_func_start sub_8020540
sub_8020540: @ 0x08020540
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08020574
	bl ColorFadeTick_thm
	ldr r0, _0802057C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0802056A
	bl ApplyFlamesWeatherGradient
_0802056A:
	bl EnableTilesetPalAnim
	adds r0, r4, #0
	bl Proc_Break
_08020574:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802057C: .4byte gPlaySt

	thumb_func_start sub_8020580
sub_8020580: @ 0x08020580
	adds r2, r0, #0
	movs r0, #0x2e
	str r0, [r2, #0x34]
	subs r0, #0x88
	str r0, [r2, #0x38]
	adds r0, #0x4a
	str r0, [r2, #0x3c]
	subs r0, #0x25
	str r0, [r2, #0x40]
	adds r1, r2, #0
	adds r1, #0x64
	ldr r0, _080205B0 @ =0x000004D2
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080205B4 @ =0x0000162E
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080205B8 @ =0x000018CA
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080205BC @ =0x00002158
	strh r0, [r1]
	bx lr
	.align 2, 0
_080205B0: .4byte 0x000004D2
_080205B4: .4byte 0x0000162E
_080205B8: .4byte 0x000018CA
_080205BC: .4byte 0x00002158

	thumb_func_start sub_80205C0
sub_80205C0: @ 0x080205C0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r2, #0x34]
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r3, r2, #0
	adds r3, #0x66
	ldrh r5, [r2, #0x38]
	ldrh r6, [r3]
	adds r0, r5, r6
	strh r0, [r3]
	adds r4, r2, #0
	adds r4, #0x68
	ldrh r5, [r2, #0x3c]
	ldrh r6, [r4]
	adds r0, r5, r6
	strh r0, [r4]
	adds r5, r2, #0
	adds r5, #0x6a
	ldr r0, [r2, #0x40]
	ldrh r2, [r5]
	adds r0, r2, r0
	strh r0, [r5]
	movs r6, #0
	ldrsh r1, [r1, r6]
	rsbs r1, r1, #0
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	rsbs r2, r2, #0
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r5, r3]
	rsbs r2, r2, #0
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8020630
sub_8020630: @ 0x08020630
	push {lr}
	ldr r0, _0802066C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xa0
	bls _08020642
	movs r1, #0
_08020642:
	cmp r1, #0x50
	bls _0802064E
	movs r0, #0xa0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0802064E:
	adds r0, r1, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x10
	bls _08020660
	movs r1, #0x10
_08020660:
	ldr r0, _08020670 @ =0x04000052
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0802066C: .4byte 0x04000006
_08020670: .4byte 0x04000052

	thumb_func_start sub_8020674
sub_8020674: @ 0x08020674
	push {r4, r5, lr}
	adds r5, r0, #0
	bl LockBmDisplay
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	ldr r4, _08020788 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #3
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _0802078C @ =gUnk_08408CE8
	ldr r1, _08020790 @ =0x06001000
	bl Decompress
	ldr r0, _08020794 @ =gUnk_08409040
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020798 @ =Img_ChapterIntroFog
	ldr r1, _0802079C @ =0x06002000
	bl Decompress
	ldr r0, _080207A0 @ =gUnk_08409020
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	ldr r0, _080207A4 @ =gBg0Tm + 0x24e
	ldr r1, _080207A8 @ =gUnk_08409060
	movs r2, #0x80
	bl TmApplyTsa_thm
	bl PutScreenFogEffectOverlayed
	bl PutScreenFogEffect
	movs r0, #0xc
	bl EnableBgSync
	ldr r0, _080207AC @ =sub_8020630
	bl SetOnHBlankA
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080207B0 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _080207B4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	bl ColorFadeInit
	ldr r4, _080207B8 @ =gPal
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_80020CC
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	movs r3, #1
	bl sub_80020CC
	adds r5, #0x4c
	movs r0, #0x15
	strh r0, [r5]
	movs r4, #9
_08020774:
	bl ColorFadeTick_thm
	subs r4, #1
	cmp r4, #0
	bge _08020774
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020788: .4byte gDispIo
_0802078C: .4byte gUnk_08408CE8
_08020790: .4byte 0x06001000
_08020794: .4byte gUnk_08409040
_08020798: .4byte Img_ChapterIntroFog
_0802079C: .4byte 0x06002000
_080207A0: .4byte gUnk_08409020
_080207A4: .4byte gBg0Tm + 0x24e
_080207A8: .4byte gUnk_08409060
_080207AC: .4byte sub_8020630
_080207B0: .4byte 0x0000FFE0
_080207B4: .4byte 0x0000E0FF
_080207B8: .4byte gPal

	thumb_func_start sub_80207BC
sub_80207BC: @ 0x080207BC
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _080207EA
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080207EA
	adds r0, r4, #0
	bl Proc_Break
_080207EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80207F0
sub_80207F0: @ 0x080207F0
	adds r0, #0x4e
	ldr r1, _080207F8 @ =0x000005DC
	strh r1, [r0]
	bx lr
	.align 2, 0
_080207F8: .4byte 0x000005DC

	thumb_func_start sub_80207FC
sub_80207FC: @ 0x080207FC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08020818
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_08020818:
	ldr r0, _08020834 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802082E
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_0802082E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020834: .4byte gpKeySt

	thumb_func_start sub_8020838
sub_8020838: @ 0x08020838
	push {r4, r5, lr}
	bl ColorFadeInit
	ldr r4, _0802086C @ =gPal
	movs r5, #1
	rsbs r5, r5, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl sub_80020CC
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl sub_80020CC
	movs r0, #4
	bl FadeBgmOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802086C: .4byte gPal

	thumb_func_start sub_8020870
sub_8020870: @ 0x08020870
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _08020894
	adds r0, r4, #0
	bl Proc_Break
_08020894:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802089C
sub_802089C: @ 0x0802089C
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl SetOnHBlankB
	ldr r2, _080208D8 @ =gDispIo
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
	ldr r1, _080208DC @ =gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080208D8: .4byte gDispIo
_080208DC: .4byte gPal

	thumb_func_start sub_80208E0
sub_80208E0: @ 0x080208E0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080208F4
	ldr r0, _080208F0 @ =gUnk_08C02DD8
	bl Proc_StartBlocking
	b _080208FC
	.align 2, 0
_080208F0: .4byte gUnk_08C02DD8
_080208F4:
	ldr r0, _08020900 @ =gUnk_08C02DD8
	movs r1, #3
	bl Proc_Start
_080208FC:
	pop {r0}
	bx r0
	.align 2, 0
_08020900: .4byte gUnk_08C02DD8

	thumb_func_start sub_8020904
sub_8020904: @ 0x08020904
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080209A8 @ =gUnk_08195688
	ldr r1, _080209AC @ =0x06002000
	bl Decompress
	ldr r0, _080209B0 @ =gUnk_08196DAC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080209B4 @ =gUnk_08196DCC
	ldr r4, _080209B8 @ =gUiTmScratchA
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_0802092E:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _0802092E
	ldr r0, _080209BC @ =gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, _080209C0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08020960
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
_08020960:
	ldr r3, _080209C4 @ =gDispIo
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
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080209C8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080209CC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080209A8: .4byte gUnk_08195688
_080209AC: .4byte 0x06002000
_080209B0: .4byte gUnk_08196DAC
_080209B4: .4byte gUnk_08196DCC
_080209B8: .4byte gUiTmScratchA
_080209BC: .4byte gBg0Tm
_080209C0: .4byte gPlaySt
_080209C4: .4byte gDispIo
_080209C8: .4byte 0x0000FFE0
_080209CC: .4byte 0x0000E0FF

	thumb_func_start sub_80209D0
sub_80209D0: @ 0x080209D0
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, _08020A0C @ =gUnk_081C9378
	mov r0, sp
	movs r2, #0x34
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08020A10
	adds r0, r6, #0
	bl Proc_Break
	b _08020A36
	.align 2, 0
_08020A0C: .4byte gUnk_081C9378
_08020A10:
	cmp r4, #0x18
	bne _08020A1C
	cmp r5, #9
	bne _08020A1C
	bl RefreshUnitSprites
_08020A1C:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08020A40 @ =gUiTmScratchA
	adds r0, r0, r1
	ldr r1, _08020A44 @ =gBg0Tm
	movs r2, #8
	movs r3, #9
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08020A36:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020A40: .4byte gUiTmScratchA
_08020A44: .4byte gBg0Tm

	thumb_func_start sub_8020A48
sub_8020A48: @ 0x08020A48
	push {lr}
	ldr r3, _08020A7C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _08020A80 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08020A7C: .4byte gDispIo
_08020A80: .4byte gBg0Tm

	thumb_func_start StartLightRuneAnim3
StartLightRuneAnim3: @ 0x08020A84
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08020AC8 @ =gUnk_08C02E30
	adds r1, r3, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08020ACC @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020AC8: .4byte gUnk_08C02E30
_08020ACC: .4byte gBmSt

	thumb_func_start ProcDanceAnim_Init
ProcDanceAnim_Init: @ 0x08020AD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020B60 @ =Img_DanceringFx
	ldr r1, _08020B64 @ =0x06002000
	bl Decompress
	ldr r0, _08020B68 @ =Pal_DanceringFx
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020B6C @ =Tsa_DanceringFx
	ldr r4, _08020B70 @ =gUiTmScratchA
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0x90
	lsls r5, r5, #2
_08020AFA:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020AFA
	ldr r0, _08020B74 @ =gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r3, _08020B78 @ =gDispIo
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
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020B7C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020B80 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020B60: .4byte Img_DanceringFx
_08020B64: .4byte 0x06002000
_08020B68: .4byte Pal_DanceringFx
_08020B6C: .4byte Tsa_DanceringFx
_08020B70: .4byte gUiTmScratchA
_08020B74: .4byte gBg0Tm
_08020B78: .4byte gDispIo
_08020B7C: .4byte 0x0000FFE0
_08020B80: .4byte 0x0000E0FF

	thumb_func_start ProcDanceAnim_Loop
ProcDanceAnim_Loop: @ 0x08020B84
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, _08020BBC @ =Vectors_DanceringFx
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	cmp r1, #0xff
	bne _08020BC0
	adds r0, r4, #0
	bl Proc_Break
	b _08020BDA
	.align 2, 0
_08020BBC: .4byte Vectors_DanceringFx
_08020BC0:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08020BE4 @ =gUiTmScratchA
	adds r0, r0, r1
	ldr r1, _08020BE8 @ =gBg0Tm
	movs r2, #6
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08020BDA:
	add sp, #0x38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020BE4: .4byte gUiTmScratchA
_08020BE8: .4byte gBg0Tm

	thumb_func_start ProcDanceAnim_ResetTimer
ProcDanceAnim_ResetTimer: @ 0x08020BEC
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start ProcDanceAnim_Loop_Blend
ProcDanceAnim_Loop_Blend: @ 0x08020BF4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08020C40 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r3, r5, #0
	adds r3, #0x4c
	ldrh r0, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x45
	movs r1, #0x10
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x46
	strb r2, [r1]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08020C38
	adds r0, r5, #0
	bl Proc_Break
_08020C38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020C40: .4byte gDispIo

	thumb_func_start StartDanceringAnim
StartDanceringAnim: @ 0x08020C44
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08020CA0 @ =gBattleStats
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08020C9A
	ldr r0, _08020CA4 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r0, _08020CA8 @ =ProcScr_DanceringAnim
	adds r1, r6, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08020CAC @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x10
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x10
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
_08020C9A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020CA0: .4byte gBattleStats
_08020CA4: .4byte gActionSt
_08020CA8: .4byte ProcScr_DanceringAnim
_08020CAC: .4byte gBmSt

	thumb_func_start ProcEventWrapAnim_Init
ProcEventWrapAnim_Init: @ 0x08020CB0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020D68 @ =Img_EventWarp
	ldr r1, _08020D6C @ =0x06002000
	bl Decompress
	ldr r0, _08020D70 @ =Pal_EventWarp
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020D74 @ =Tsa_EventWarp
	ldr r4, _08020D78 @ =gUiTmScratchA
	adds r1, r4, #0
	bl Decompress
	movs r0, #0xa2
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08020CDA:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020CDA
	ldr r0, _08020D7C @ =gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08020D80 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08020D0A
	movs r0, #0xb4
	bl m4aSongNumStart
_08020D0A:
	ldr r3, _08020D84 @ =gDispIo
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
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _08020D88 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020D8C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020D68: .4byte Img_EventWarp
_08020D6C: .4byte 0x06002000
_08020D70: .4byte Pal_EventWarp
_08020D74: .4byte Tsa_EventWarp
_08020D78: .4byte gUiTmScratchA
_08020D7C: .4byte gBg0Tm
_08020D80: .4byte gPlaySt
_08020D84: .4byte gDispIo
_08020D88: .4byte 0x0000FFE0
_08020D8C: .4byte 0x0000E0FF

	thumb_func_start ProcEventWrapAnim_Loop
ProcEventWrapAnim_Loop: @ 0x08020D90
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, _08020DEC @ =Vectors_EventWarp1
	cmp r0, #0
	bne _08020DA2
	ldr r4, _08020DF0 @ =Vectors_EventWarp2
_08020DA2:
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r3, #0
	adds r2, #0x4c
	cmp r0, #0
	beq _08020DC6
	ldr r0, _08020DF4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08020DC6
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_08020DC6:
	ldrh r6, [r2]
	adds r6, #1
	strh r6, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08020DF8
	adds r0, r3, #0
	bl Proc_Break
	b _08020E1E
	.align 2, 0
_08020DEC: .4byte Vectors_EventWarp1
_08020DF0: .4byte Vectors_EventWarp2
_08020DF4: .4byte gpKeySt
_08020DF8:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08020E04
	bl RefreshUnitSprites
_08020E04:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08020E24 @ =gUiTmScratchA
	adds r0, r0, r1
	ldr r1, _08020E28 @ =gBg0Tm
	movs r2, #4
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08020E1E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020E24: .4byte gUiTmScratchA
_08020E28: .4byte gBg0Tm

	thumb_func_start ProcEventWrapAnim_End
ProcEventWrapAnim_End: @ 0x08020E2C
	push {lr}
	ldr r0, _08020E54 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08020E40
	movs r0, #0xb5
	bl m4aSongNumStart
_08020E40:
	ldr r0, _08020E58 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08020E54: .4byte gPlaySt
_08020E58: .4byte gBg0Tm

	thumb_func_start StartEventWarpAnim
StartEventWarpAnim: @ 0x08020E5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08020EC4 @ =ProcScr_EventWrapAnim
	adds r1, r6, #0
	bl Proc_Start
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r0, #0
	adds r1, #0x64
	strh r4, [r1]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r0, #0x66
	strh r5, [r0]
	lsls r0, r7, #4
	ldr r2, _08020EC8 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r7, r0, #0
	subs r7, #8
	mov r1, r8
	lsls r0, r1, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	subs r0, #0x20
	rsbs r1, r7, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020EC4: .4byte ProcScr_EventWrapAnim
_08020EC8: .4byte gBmSt

	thumb_func_start sub_8020ECC
sub_8020ECC: @ 0x08020ECC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08020F1C @ =ProcScr_EventWrapAnim
	mov r1, r8
	bl Proc_Start
	adds r3, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x64
	strh r4, [r0]
	rsbs r5, r5, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	rsbs r6, r6, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	str r3, [sp]
	bl SetBgOffset
	ldr r3, [sp]
	adds r3, #0x66
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020F1C: .4byte ProcScr_EventWrapAnim

	thumb_func_start sub_8020F20
sub_8020F20: @ 0x08020F20
	push {lr}
	ldr r0, _08020F34 @ =ProcScr_EventWrapAnim
	bl Proc_Find
	cmp r0, #0
	beq _08020F2E
	movs r0, #1
_08020F2E:
	pop {r1}
	bx r1
	.align 2, 0
_08020F34: .4byte ProcScr_EventWrapAnim

	thumb_func_start sub_8020F38
sub_8020F38: @ 0x08020F38
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020FC8 @ =gUnk_081970AC
	ldr r1, _08020FCC @ =0x06002000
	bl Decompress
	ldr r0, _08020FD0 @ =gUnk_081980C0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020FD4 @ =gUnk_081980E0
	ldr r4, _08020FD8 @ =gUiTmScratchA
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08020F62:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020F62
	ldr r0, _08020FDC @ =gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r3, _08020FE0 @ =gDispIo
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
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020FE4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020FE8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020FC8: .4byte gUnk_081970AC
_08020FCC: .4byte 0x06002000
_08020FD0: .4byte gUnk_081980C0
_08020FD4: .4byte gUnk_081980E0
_08020FD8: .4byte gUiTmScratchA
_08020FDC: .4byte gBg0Tm
_08020FE0: .4byte gDispIo
_08020FE4: .4byte 0x0000FFE0
_08020FE8: .4byte 0x0000E0FF

	thumb_func_start sub_8020FEC
sub_8020FEC: @ 0x08020FEC
	push {r4, r5, r6, lr}
	sub sp, #0x38
	adds r6, r0, #0
	ldr r1, _08021028 @ =gUnk_081C93E4
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _0802102C
	adds r0, r6, #0
	bl Proc_Break
	b _08021052
	.align 2, 0
_08021028: .4byte gUnk_081C93E4
_0802102C:
	cmp r4, #0
	bne _08021038
	cmp r5, #0x10
	bne _08021038
	bl RefreshUnitSprites
_08021038:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _0802105C @ =gUiTmScratchA
	adds r0, r0, r1
	ldr r1, _08021060 @ =gBg0Tm
	movs r2, #6
	movs r3, #8
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08021052:
	add sp, #0x38
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802105C: .4byte gUiTmScratchA
_08021060: .4byte gBg0Tm

	thumb_func_start sub_8021064
sub_8021064: @ 0x08021064
	push {lr}
	ldr r0, _08021078 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08021078: .4byte gBg0Tm

	thumb_func_start sub_802107C
sub_802107C: @ 0x0802107C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080210BC @ =gUnk_08C02F38
	movs r1, #3
	bl Proc_Start
	lsls r0, r4, #4
	ldr r2, _080210C0 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x10
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080210BC: .4byte gUnk_08C02F38
_080210C0: .4byte gBmSt

	thumb_func_start nullsub_40
nullsub_40: @ 0x080210C4
	bx lr
	.align 2, 0

	thumb_func_start sub_80210C8
sub_80210C8: @ 0x080210C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r2, r7, #0
	adds r2, #0x4c
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	movs r1, #0x40
	subs r1, r1, r0
	mov sb, r1
	movs r0, #0
	mov sl, r2
_080210EA:
	movs r6, #0
	lsls r5, r0, #3
	adds r1, r0, #1
	mov r8, r1
	lsls r0, r0, #6
	ldr r2, _08021180 @ =gBg0Tm
	adds r4, r0, r2
_080210F8:
	lsls r2, r6, #3
	ldr r1, [r7, #0x2c]
	subs r0, r1, r2
	cmp r0, #0
	bge _08021104
	subs r0, r2, r1
_08021104:
	ldr r2, [r7, #0x30]
	subs r1, r2, r5
	cmp r1, #0
	bge _0802110E
	subs r1, r5, r2
_0802110E:
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, sb
	cmp r0, #0
	bge _0802112C
	adds r0, #3
_0802112C:
	asrs r1, r0, #2
	movs r0, #0xf
	subs r0, r0, r1
	cmp r0, #0xf
	ble _08021138
	movs r0, #0xf
_08021138:
	cmp r0, #0
	bge _0802113E
	movs r0, #0
_0802113E:
	movs r1, #0x84
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #0x1d
	ble _080210F8
	mov r0, r8
	cmp r0, #0x13
	ble _080210EA
	movs r0, #1
	bl EnableBgSync
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x46
	ble _08021170
	adds r0, r7, #0
	bl Proc_Break
_08021170:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021180: .4byte gBg0Tm

	thumb_func_start sub_8021184
sub_8021184: @ 0x08021184
	push {lr}
	ldr r3, _080211CC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080211D0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _080211D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_080211CC: .4byte gDispIo
_080211D0: .4byte 0x0000FFE0
_080211D4: .4byte 0x0000E0FF

	thumb_func_start sub_80211D8
sub_80211D8: @ 0x080211D8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r2, _08021284 @ =0x06002000
	movs r1, #0
	ldr r4, _08021288 @ =0x11111111
	movs r3, #0x1f
_080211E8:
	movs r0, #7
_080211EA:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bge _080211EA
	adds r1, r1, r4
	subs r3, #1
	cmp r3, #0
	bge _080211E8
	movs r3, #0
	ldr r0, _0802128C @ =gPal
	adds r4, r0, #0
	adds r4, #0x40
_08021202:
	lsls r0, r3, #1
	lsls r1, r3, #0xb
	lsls r2, r3, #6
	adds r1, r1, r2
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble _08021202
	movs r4, #0
	bl EnablePalSync
	ldr r3, _08021290 @ =gDispIo
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
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _08021294 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08021298 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _0802129C @ =gUnk_08C02F60
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021284: .4byte 0x06002000
_08021288: .4byte 0x11111111
_0802128C: .4byte gPal
_08021290: .4byte gDispIo
_08021294: .4byte 0x0000FFE0
_08021298: .4byte 0x0000E0FF
_0802129C: .4byte gUnk_08C02F60

	thumb_func_start sub_80212A0
sub_80212A0: @ 0x080212A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	str r0, [r4, #0x3c]
	bl RandNextB
	ldr r1, _080212D0 @ =0x000003FF
	ands r1, r0
	ldr r0, [r4, #0x14]
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r1, r1, r0
	rsbs r1, r1, #0
	str r1, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080212D0: .4byte 0x000003FF

	thumb_func_start sub_80212D4
sub_80212D4: @ 0x080212D4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080212F2
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0802130E
_080212F2:
	ldr r2, [r4, #0x34]
	ldr r0, [r4, #0x3c]
	adds r2, r2, r0
	str r2, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x40]
	adds r1, r1, r0
	str r1, [r4, #0x38]
	ldr r0, [r4, #0x2c]
	adds r0, r0, r2
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_0802130E:
	ldr r2, [r4, #0x30]
	cmp r2, #0
	bge _08021326
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	b _0802133A
_08021326:
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	asrs r2, r2, #0x10
	ldr r3, _08021344 @ =Sprite_8x8
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0xa
	bl PutSprite
_0802133A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021344: .4byte Sprite_8x8

	thumb_func_start sub_8021348
sub_8021348: @ 0x08021348
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	mov sb, r3
	ldr r6, [sp, #0x1c]
	ldr r1, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl Interpolate
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	str r4, [sp]
	movs r0, #0
	mov r2, sb
	adds r3, r6, #0
	bl Interpolate
	mov r1, r8
	str r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021390
sub_8021390: @ 0x08021390
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080213AC
	b _080214D6
_080213AC:
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0x28
	ble _080213C0
	b _080214D6
_080213C0:
	movs r3, #0x64
	adds r3, r3, r6
	mov sl, r3
	mov r7, sl
_080213C8:
	ldr r0, _0802148C @ =gUnk_08C02F78
	adds r1, r6, #0
	bl Proc_Start
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	lsls r1, r1, #0x10
	ldr r4, _08021490 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r4, r5, #0
	adds r4, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	movs r5, #0
	ldrsh r0, [r7, r5]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _08021412
	movs r0, #0x80
	lsls r0, r0, #1
_08021412:
	str r0, [sp]
	adds r0, r4, #0
	bl sub_8021348
	mov r2, r8
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r2]
	movs r3, #1
	add sb, r3
	mov r4, sb
	cmp r4, #0
	bgt _08021434
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _080213C8
_08021434:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bgt _080214D6
	ldr r0, _0802148C @ =gUnk_08C02F78
	adds r1, r6, #0
	bl Proc_Start
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	subs r1, #8
	lsls r1, r1, #0x10
	ldr r4, _08021490 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #5
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r7, r5, #0
	adds r7, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	mov r5, sl
	movs r4, #0
	ldrsh r0, [r5, r4]
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r0, r4
	bgt _08021494
	str r0, [sp]
	b _08021496
	.align 2, 0
_0802148C: .4byte gUnk_08C02F78
_08021490: .4byte 0x0000FFFF
_08021494:
	str r4, [sp]
_08021496:
	adds r0, r7, #0
	bl sub_8021348
	mov r5, r8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	mov r1, sl
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt _080214B6
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1]
_080214B6:
	mov r4, sl
	movs r5, #0
	ldrsh r1, [r4, r5]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _080214D6
	adds r0, r6, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x66
	movs r0, #1
	strh r0, [r1]
_080214D6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80214E8
sub_80214E8: @ 0x080214E8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r0, #0x10
	subs r4, r0, r1
	cmp r4, #0
	bge _080214FC
	movs r4, #0
_080214FC:
	ldr r3, _08021544 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _08021548 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _0802154C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021544: .4byte gDispIo
_08021548: .4byte 0x0000FFE0
_0802154C: .4byte 0x0000E0FF

	thumb_func_start sub_8021550
sub_8021550: @ 0x08021550
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	ldr r0, _080215A8 @ =gUnk_08C02FA8
	ldr r1, _080215AC @ =0x06014000
	movs r2, #0x20
	bl RegisterDataMove
	ldr r0, _080215B0 @ =gUnk_08C02F90
	adds r1, r6, #0
	bl Proc_Start
	adds r3, r0, #0
	mov r0, r8
	str r0, [r3, #0x34]
	mov r0, sb
	str r0, [r3, #0x38]
	lsls r4, r4, #0x10
	str r4, [r3, #0x3c]
	lsls r5, r5, #0x10
	str r5, [r3, #0x40]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r2, #0
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x64
	ldr r0, _080215B4 @ =0x0000FFFF
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x66
	strh r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080215A8: .4byte gUnk_08C02FA8
_080215AC: .4byte 0x06014000
_080215B0: .4byte gUnk_08C02F90
_080215B4: .4byte 0x0000FFFF

	thumb_func_start sub_80215B8
sub_80215B8: @ 0x080215B8
	push {lr}
	ldr r0, _080215CC @ =gUnk_08C02F90
	bl Proc_Find
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080215CC: .4byte gUnk_08C02F90

	thumb_func_start sub_80215D0
sub_80215D0: @ 0x080215D0
	push {lr}
	ldr r0, _080215DC @ =gUnk_08C02F90
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080215DC: .4byte gUnk_08C02F90
