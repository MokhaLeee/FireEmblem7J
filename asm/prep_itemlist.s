	.include "macro.inc"
	.syntax unified

	thumb_func_start PrepItemList_Init
PrepItemList_Init: @ 0x08097C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097CD8 @ =ProcScr_AtMenu
	bl Proc_Find
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #0x36]
	movs r1, #0xff
	strh r1, [r4, #0x34]
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r2, #0
	adds r0, #8
	movs r1, #8
_08097CC4:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08097CC4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097CD8: .4byte ProcScr_AtMenu

	thumb_func_start sub_8097CDC
sub_8097CDC: @ 0x08097CDC
	push {r4, lr}
	sub sp, #8
	ldr r4, _08097D10 @ =gBg0Tm + 0x68
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08097D14 @ =0x02012BE0
	movs r1, #0
	str r1, [sp]
	ldr r1, _08097D18 @ =gUnk_0842D0FC
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097D10: .4byte gBg0Tm + 0x68
_08097D14: .4byte 0x02012BE0
_08097D18: .4byte gUnk_0842D0FC

	thumb_func_start PrepItemList_DrawCurrentOwnerText
PrepItemList_DrawCurrentOwnerText: @ 0x08097D1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _08097D64 @ =gBg0Tm + 0x70
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r7, _08097D68 @ =0x02012B70
	adds r0, r7, #0
	bl ClearText
	ldr r0, _08097D6C @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, r4
	bgt _08097D74
	movs r0, #0
	str r0, [sp]
	ldr r0, _08097D70 @ =gUnk_0842D108
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _08097D94
	.align 2, 0
_08097D64: .4byte gBg0Tm + 0x70
_08097D68: .4byte 0x02012B70
_08097D6C: .4byte Unk_Prep_02012466
_08097D70: .4byte gUnk_0842D108
_08097D74:
	ldr r0, _08097D9C @ =gPrepScreenItemList
	ldrb r6, [r6]
	lsls r1, r6, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08097DA4
	str r0, [sp]
	ldr r0, _08097DA0 @ =gUnk_0842D110
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_08097D94:
	movs r3, #0
	bl PutDrawText
	b _08097DC2
	.align 2, 0
_08097D9C: .4byte gPrepScreenItemList
_08097DA0: .4byte gUnk_0842D110
_08097DA4:
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl PutDrawText
_08097DC2:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8097DD4
sub_8097DD4: @ 0x08097DD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08097E4C @ =gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08097E50 @ =gUnk_08421C24
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08097E54 @ =0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08097E58 @ =gUnk_08D8D4F8
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08097E5C @ =gUnk_08D8D4E8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _08097E60 @ =Unk_Prep_02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097E4C: .4byte gPal
_08097E50: .4byte gUnk_08421C24
_08097E54: .4byte 0x0000029A
_08097E58: .4byte gUnk_08D8D4F8
_08097E5C: .4byte gUnk_08D8D4E8
_08097E60: .4byte Unk_Prep_02012466

	thumb_func_start sub_8097E64
sub_8097E64: @ 0x08097E64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080981A4 @ =gDispIo
	mov r8, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, r8
	ldrb r3, [r3, #0xc]
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	mov r2, r8
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r2, #2
	mov sb, r2
	mov r3, sb
	orrs r0, r3
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	ands r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080981A8 @ =0x06012000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _080981AC @ =gBg1Tm
	ldr r1, _080981B0 @ =gUnk_0842AA0C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0x20
	mov r2, r8
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, r8
	strb r0, [r3, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r2, r8
	adds r2, #0x34
	ldrb r0, [r2]
	orrs r0, r4
	mov r1, sb
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	mov r1, r8
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r4, r2
	mov r0, sb
	orrs r4, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	orrs r4, r3
	strb r4, [r1]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _080981B4 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl InitText
	adds r4, #0x10
	movs r5, #4
_08098000:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08098000
	movs r1, #0x33
	adds r1, r1, r7
	mov r8, r1
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _080981B8 @ =0x02012BA0
	movs r5, #7
_0809801E:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809801E
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r2, _080981BC @ =gBg0Tm + 0xde
	mov sb, r2
	mov r0, sb
	adds r1, r4, #0
	movs r2, #6
	bl sub_8096A38
	ldr r0, _080981C0 @ =gUnk_0841E0A4
	ldr r1, _080981C4 @ =0x06015000
	bl Decompress
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xe2
	movs r1, #0x30
	bl PutMenuScrollBarAt
	bl TryHideMenuScrollBar
	ldr r0, [r7, #0x2c]
	mov r3, r8
	ldrb r1, [r3]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_80986C0
	ldr r5, _080981B8 @ =0x02012BA0
	ldr r1, _080981C8 @ =gBg2Tm + 0x1e
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_80964A0
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, sb
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	bl sub_8097CDC
	adds r0, r7, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _080981CC @ =sub_8097DD4
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _080981D0 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r3, _080981A4 @ =gDispIo
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _080981D4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _080981D8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _080981DC @ =gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl PrepItemList_DrawCurrentOwnerText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080981A4: .4byte gDispIo
_080981A8: .4byte 0x06012000
_080981AC: .4byte gBg1Tm
_080981B0: .4byte gUnk_0842AA0C
_080981B4: .4byte 0x02012B68
_080981B8: .4byte 0x02012BA0
_080981BC: .4byte gBg0Tm + 0xde
_080981C0: .4byte gUnk_0841E0A4
_080981C4: .4byte 0x06015000
_080981C8: .4byte gBg2Tm + 0x1e
_080981CC: .4byte sub_8097DD4
_080981D0: .4byte 0x00000203
_080981D4: .4byte 0x0000FFE0
_080981D8: .4byte 0x0000E0FF
_080981DC: .4byte gBg0Tm

	thumb_func_start sub_80981E0
sub_80981E0: @ 0x080981E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809820C @ =ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
	strb r1, [r0]
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndMuralBackground_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809820C: .4byte ProcScr_AtMenu

	thumb_func_start sub_8098210
sub_8098210: @ 0x08098210
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r4, #0
	bl sub_8098430
	ldr r0, _080982B0 @ =0x02012BA0
	ldr r1, _080982B4 @ =gBg2Tm + 0x1e
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_80964A0
	ldr r0, _080982B8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080982BC @ =PrepItemList_DrawCurrentOwnerText
	movs r1, #2
	adds r2, r4, #0
	bl StartParallelFiniteLoop
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080982D0
	ldr r0, _080982C0 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080982C8
	ldr r2, _080982C4 @ =gPrepScreenItemList
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _080982CE
	.align 2, 0
_080982B0: .4byte 0x02012BA0
_080982B4: .4byte gBg2Tm + 0x1e
_080982B8: .4byte gBg0Tm + 0x244
_080982BC: .4byte PrepItemList_DrawCurrentOwnerText
_080982C0: .4byte Unk_Prep_02012466
_080982C4: .4byte gPrepScreenItemList
_080982C8:
	bl CloseHelpBox
	movs r0, #0xff
_080982CE:
	strh r0, [r4, #0x36]
_080982D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80982D8
sub_80982D8: @ 0x080982D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809830A
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r6, r0, #0
	subs r6, #0x60
_0809830A:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _08098326
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809831C
	movs r0, #8
	b _0809831E
_0809831C:
	subs r0, #1
_0809831E:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8098210
_08098326:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809834A
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	adds r6, r0, #0
_0809834A:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809837A
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809837A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098384
sub_8098384: @ 0x08098384
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _080983B6
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_080983B6:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _080983D2
	ldrb r0, [r5]
	cmp r0, #8
	bne _080983C8
	movs r0, #0
	b _080983CA
_080983C8:
	adds r0, #1
_080983CA:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8098210
_080983D2:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _080983F6
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	rsbs r6, r0, #0
_080983F6:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _08098426
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_08098426:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098430
sub_8098430: @ 0x08098430
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _08098458 @ =Unk_Prep_02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809845C
	mov r3, ip
	adds r3, #0x33
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809847A
	.align 2, 0
_08098458: .4byte Unk_Prep_02012466
_0809845C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _0809847A
	strh r4, [r0]
_0809847A:
	ldrh r0, [r5]
	cmp r0, #6
	bls _08098498
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _08098498
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_08098498:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80984B4
sub_80984B4: @ 0x080984B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _0809854C @ =gBg2Tm + 0x1e
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_80965B4
	ldr r0, _08098550 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _08098506
	ldr r0, _08098554 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_08098506:
	cmp r7, #0
	ble _08098520
	ldr r0, _08098554 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_08098520:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809854C: .4byte gBg2Tm + 0x1e
_08098550: .4byte gBg0Tm + 0x244
_08098554: .4byte 0x02012BA0

	thumb_func_start sub_8098558
sub_8098558: @ 0x08098558
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08098576
	ldr r0, _08098590 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08098598
_08098576:
	ldr r0, _08098594 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08098584
	b _080986AA
_08098584:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080986AA
	.align 2, 0
_08098590: .4byte Unk_Prep_02012466
_08098594: .4byte gPlaySt
_08098598:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, _0809867C @ =gPrepScreenItemList
	mov sb, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	strh r4, [r0, #2]
	bl sub_8091B48
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r6, #0
	bl sub_8098430
	bl InitIcons
	ldr r0, _08098680 @ =gBg0Tm + 0x244
	ldr r4, _08098684 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08098688 @ =gBg2Tm + 0x1e
	ldrb r2, [r7]
	lsls r0, r2, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08098632
	ldr r0, _0809868C @ =PrepItemList_DrawCurrentOwnerText
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
_08098632:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08098698
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08098690 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080986AA
	ldr r0, _08098694 @ =0x0000038B
	bl m4aSongNumStart
	b _080986AA
	.align 2, 0
_0809867C: .4byte gPrepScreenItemList
_08098680: .4byte gBg0Tm + 0x244
_08098684: .4byte 0x02012B78
_08098688: .4byte gBg2Tm + 0x1e
_0809868C: .4byte PrepItemList_DrawCurrentOwnerText
_08098690: .4byte gPlaySt
_08098694: .4byte 0x0000038B
_08098698:
	ldr r0, _080986B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080986AA
	ldr r0, _080986BC @ =0x0000038A
	bl m4aSongNumStart
_080986AA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080986B8: .4byte gPlaySt
_080986BC: .4byte 0x0000038A

	thumb_func_start sub_80986C0
sub_80986C0: @ 0x080986C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _080986EE
	cmp r3, #0
	beq _080986EE
	adds r0, r3, #1
	strh r0, [r4]
_080986EE:
	mov r4, ip
	adds r4, #0x33
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _08098722
	ldr r0, _08098750 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _08098722
	subs r0, r5, #1
	strh r0, [r6]
_08098722:
	mov r0, ip
	bl sub_8098430
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098750: .4byte Unk_Prep_02012466

	thumb_func_start sub_8098754
sub_8098754: @ 0x08098754
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r1, r0, #1
	movs r2, #0x38
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sb, r0
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r1
	movs r3, #0xf
	ldrh r0, [r7]
	ands r0, r3
	mov sl, r0
	cmp r0, #0
	beq _08098788
	b _080989DC
_08098788:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098794
	cmp r0, #0xff
	beq _08098794
	b _08098890
_08098794:
	ldr r1, _080987D0 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080987DC
	ldr r0, _080987D4 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080987EC
	ldr r1, _080987D8 @ =gPrepScreenItemList
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sb
	lsls r1, r3, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _08098B52
	.align 2, 0
_080987D0: .4byte gpKeySt
_080987D4: .4byte Unk_Prep_02012466
_080987D8: .4byte gPrepScreenItemList
_080987DC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08098860
	ldr r0, _08098804 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809880C
_080987EC:
	ldr r0, _08098808 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080987FA
	b _08098B52
_080987FA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08098B52
	.align 2, 0
_08098804: .4byte Unk_Prep_02012466
_08098808: .4byte gPlaySt
_0809880C:
	ldr r0, _08098834 @ =gPrepScreenItemList
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08098838
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl SetUiCursorHandConfig
	adds r0, r4, #0
	movs r1, #7
	b _0809883C
	.align 2, 0
_08098834: .4byte gPrepScreenItemList
_08098838:
	adds r0, r4, #0
	movs r1, #6
_0809883C:
	bl Proc_Goto
	ldr r0, _08098858 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809884E
	b _08098B52
_0809884E:
	ldr r0, _0809885C @ =0x0000038A
	bl m4aSongNumStart
	b _08098B52
	.align 2, 0
_08098858: .4byte gPlaySt
_0809885C: .4byte 0x0000038A
_08098860:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080988B0
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08098888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098882
	ldr r0, _0809888C @ =0x0000038B
	bl m4aSongNumStart
_08098882:
	mov r3, sl
	strh r3, [r4, #0x36]
	b _08098B52
	.align 2, 0
_08098888: .4byte gPlaySt
_0809888C: .4byte 0x0000038B
_08098890:
	ldr r2, _080988AC @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _080988B0
	bl CloseHelpBox
	mov r0, sl
	strh r0, [r4, #0x36]
	b _08098B52
	.align 2, 0
_080988AC: .4byte gpKeySt
_080988B0:
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080988FC
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080988F4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080988DA
	ldr r0, _080988F8 @ =0x00000387
	bl m4aSongNumStart
_080988DA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80982D8
	b _08098B52
	.align 2, 0
_080988F4: .4byte gPlaySt
_080988F8: .4byte 0x00000387
_080988FC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809893C
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08098934 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809891C
	ldr r0, _08098938 @ =0x00000387
	bl m4aSongNumStart
_0809891C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8098384
	b _08098B52
	.align 2, 0
_08098934: .4byte gPlaySt
_08098938: .4byte 0x00000387
_0809893C:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _08098950
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _08098956
_08098950:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_08098956:
	strb r0, [r1]
	adds r5, r1, #0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08098982
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x33
	adds r6, r4, #0
	adds r6, #0x38
	cmp r0, #0
	beq _0809899E
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809899E
_08098982:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _0809899E
	subs r0, r1, #1
	strh r0, [r3]
_0809899E:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _080989BE
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08098A3C
	ldrb r5, [r5]
	cmp r5, #8
	bne _08098A3C
_080989BE:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _080989D8 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08098A3C
	adds r0, r1, #1
	strh r0, [r2]
	b _08098A3C
	.align 2, 0
_080989D8: .4byte Unk_Prep_02012466
_080989DC:
	mov r2, sb
	lsls r0, r2, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _080989FA
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_080989FA:
	ldrb r3, [r6]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098A22
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_08098A22:
	ldrb r2, [r6]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	adds r7, r6, #0
	mov r6, r8
_08098A3C:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sb, r0
	bne _08098A4A
	b _08098B52
_08098A4A:
	ldr r5, _08098AC4 @ =gPrepScreenItemList
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #2]
	mov sl, r0
	ldr r0, _08098AC8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098A66
	ldr r0, _08098ACC @ =0x00000386
	bl m4aSongNumStart
_08098A66:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r5
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r5
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08098A86
	adds r0, r4, #0
	bl PrepItemList_DrawCurrentOwnerText
_08098A86:
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4a
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _08098AD0
	cmp r5, #0
	beq _08098AD0
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098AB6
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098AB6:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _08098B08
	.align 2, 0
_08098AC4: .4byte gPrepScreenItemList
_08098AC8: .4byte gPlaySt
_08098ACC: .4byte 0x00000386
_08098AD0:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098B14
	ldr r0, _08098B10 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08098B14
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B00
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098B00:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_08098B08:
	adds r0, r4, #0
	bl sub_80984B4
	b _08098B52
	.align 2, 0
_08098B10: .4byte Unk_Prep_02012466
_08098B14:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B34
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098B34:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_08098B52:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098B60
sub_8098B60: @ 0x08098B60
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r7, [r0]
	adds r3, r1, #0
	cmp r3, #5
	bne _08098B7C
	movs r3, #4
	b _08098B84
_08098B7C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B84
	subs r3, #1
_08098B84:
	cmp r1, #0
	beq _08098C04
	ldr r1, _08098BA8 @ =gpKeySt
	ldr r5, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r5, #6]
	ands r0, r2
	adds r2, r4, #0
	adds r2, #0x30
	cmp r0, #0
	beq _08098BB8
	ldrb r0, [r2]
	cmp r0, #0
	beq _08098BAC
	subs r0, #1
	strb r0, [r2]
	b _08098BB8
	.align 2, 0
_08098BA8: .4byte gpKeySt
_08098BAC:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _08098BB8
	strb r3, [r2]
_08098BB8:
	ldr r1, [r1]
	movs r4, #0x80
	adds r0, r4, #0
	ldrh r5, [r1, #6]
	ands r0, r5
	cmp r0, #0
	beq _08098BDE
	ldrb r0, [r2]
	cmp r0, r3
	bge _08098BD0
	adds r0, #1
	b _08098BDC
_08098BD0:
	adds r0, r4, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098BDE
	movs r0, #0
_08098BDC:
	strb r0, [r2]
_08098BDE:
	ldrb r2, [r2]
	cmp r7, r2
	beq _08098C04
	ldr r0, _08098BFC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098BF6
	ldr r0, _08098C00 @ =0x00000386
	bl m4aSongNumStart
_08098BF6:
	movs r0, #1
	b _08098C06
	.align 2, 0
_08098BFC: .4byte gPlaySt
_08098C00: .4byte 0x00000386
_08098C04:
	movs r0, #0
_08098C06:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8098C0C
sub_8098C0C: @ 0x08098C0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _08098C28
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _08098C2E
_08098C28:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_08098C2E:
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8098C48
sub_8098C48: @ 0x08098C48
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, #0
	adds r2, #0x38
	adds r2, r2, r0
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _08098CE8 @ =gPrepScreenItemList
	ldrh r2, [r2]
	lsls r4, r2, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_8091B48
	cmp r5, #0
	bne _08098C90
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
_08098C90:
	adds r0, r6, #0
	bl sub_8098430
	ldr r0, _08098CEC @ =gBg0Tm + 0x244
	ldr r4, _08098CF0 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08098CF4 @ =gBg2Tm + 0x1e
	ldrb r7, [r7]
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08098CF8 @ =PrepItemList_DrawCurrentOwnerText
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08098CFC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098CE0
	ldr r0, _08098D00 @ =0x0000038A
	bl m4aSongNumStart
_08098CE0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098CE8: .4byte gPrepScreenItemList
_08098CEC: .4byte gBg0Tm + 0x244
_08098CF0: .4byte 0x02012B78
_08098CF4: .4byte gBg2Tm + 0x1e
_08098CF8: .4byte PrepItemList_DrawCurrentOwnerText
_08098CFC: .4byte gPlaySt
_08098D00: .4byte 0x0000038A

	thumb_func_start sub_8098D04
sub_8098D04: @ 0x08098D04
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098D2C
	ldr r0, _08098D28 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098DF4
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _08098E36
	.align 2, 0
_08098D28: .4byte gpKeySt
_08098D2C:
	ldr r0, _08098D60 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D64
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08098E36
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _08098E36
	.align 2, 0
_08098D60: .4byte gpKeySt
_08098D64:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098DC4
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _08098DA8 @ =gPrepScreenItemList
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r2, [r2]
	lsls r3, r2, #1
	adds r2, r5, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl CheckValidLinkArenaItemSupply
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08098DB0
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08098DAC @ =0x000003B3
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _08098E36
	.align 2, 0
_08098DA8: .4byte gPrepScreenItemList
_08098DAC: .4byte 0x000003B3
_08098DB0:
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_8098C48
	b _08098E36
_08098DC4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098DF4
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08098DEC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098E36
	ldr r0, _08098DF0 @ =0x0000038B
	bl m4aSongNumStart
	b _08098E36
	.align 2, 0
_08098DEC: .4byte gPlaySt
_08098DF0: .4byte 0x0000038B
_08098DF4:
	adds r0, r5, #0
	bl sub_8098B60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098E36
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098E36
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08098E36
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08098E36:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start PrepItemList_StartTradeScreen
PrepItemList_StartTradeScreen: @ 0x08098E3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r4, r0, #2
	ldr r0, _08098E70 @ =gPrepScreenItemList
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_80951FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098E70: .4byte gPrepScreenItemList

	thumb_func_start StartPrepItemListScreenProc
StartPrepItemListScreenProc: @ 0x08098E74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098E88 @ =ProcScr_PrepItemListScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098E88: .4byte ProcScr_PrepItemListScreen
