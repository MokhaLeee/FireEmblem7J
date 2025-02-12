	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_807D328
sub_807D328: @ 0x0807D328
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0807D368 @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _0807D36C @ =0x00000FBD
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetDialogueBoxConfig
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetDialogueBoxConfig
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D368: .4byte 0x06013000
_0807D36C: .4byte 0x00000FBD

	thumb_func_start sub_807D370
sub_807D370: @ 0x0807D370
	push {r4, lr}
	ldr r2, _0807D3D0 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0807D3DA
	movs r4, #1
_0807D39E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807D3D4
	ldr r1, [r2]
	cmp r1, #0
	beq _0807D3D4
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0807D3D4
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	b _0807D3DA
	.align 2, 0
_0807D3D0: .4byte gDispIo
_0807D3D4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D39E
_0807D3DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D3E0
sub_807D3E0: @ 0x0807D3E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D3F8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x11
	beq _0807D3FC
	cmp r0, #0x14
	beq _0807D40A
	b _0807D416
	.align 2, 0
_0807D3F8: .4byte gPlaySt
_0807D3FC:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D41E
	b _0807D416
_0807D40A:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D41E
_0807D416:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0807D41E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D424
sub_807D424: @ 0x0807D424
	push {lr}
	ldr r2, _0807D470 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807D474 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	movs r0, #0x1c
	bl DisplayBackground
	bl ArchiveCurrentPalettes
	movs r3, #0xf0
	lsls r3, r3, #4
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
	pop {r0}
	bx r0
	.align 2, 0
_0807D470: .4byte gDispIo
_0807D474: .4byte 0x0000FFE0

	thumb_func_start sub_807D478
sub_807D478: @ 0x0807D478
	push {r4, lr}
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r4, _0807D4AC @ =gPlaySt
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	bne _0807D496
	ldr r2, _0807D4B0 @ =0x00000FBA
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807D496:
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0807D4A6
	ldr r2, _0807D4B4 @ =0x00000FBB
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807D4A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D4AC: .4byte gPlaySt
_0807D4B0: .4byte 0x00000FBA
_0807D4B4: .4byte 0x00000FBB

	thumb_func_start sub_807D4B8
sub_807D4B8: @ 0x0807D4B8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ClearTalk
	movs r0, #0
	bl InitBgs
	ldr r2, _0807D528 @ =gDispIo
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
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl ApplySystemObjectsGraphics
	ldr r4, _0807D52C @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	ldr r2, _0807D530 @ =0x00000FBC
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetDialogueBoxConfig
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetDialogueBoxConfig
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D528: .4byte gDispIo
_0807D52C: .4byte 0x06013000
_0807D530: .4byte 0x00000FBC

	thumb_func_start sub_807D534
sub_807D534: @ 0x0807D534
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _0807D590 @ =gDispIo
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
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl ApplySystemObjectsGraphics
	ldr r1, _0807D594 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807D58A
	movs r0, #0x90
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D58A
	ldr r0, _0807D598 @ =gUnk_08D6FC14
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0x90
	bl ClearFlag
_0807D58A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D590: .4byte gDispIo
_0807D594: .4byte gPlaySt
_0807D598: .4byte gUnk_08D6FC14

	thumb_func_start sub_807D59C
sub_807D59C: @ 0x0807D59C
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start sub_807D5B0
sub_807D5B0: @ 0x0807D5B0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r6, r0, #0
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #8
	movs r2, #0x11
	movs r3, #4
	bl sub_804A4CC
	ldr r0, _0807D650 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807D5E8
	ldr r0, _0807D654 @ =0x0000037B
	bl m4aSongNumStart
_0807D5E8:
	ldr r5, _0807D658 @ =gBg0Tm + 0x242
	adds r1, r5, #0
	adds r1, #0xe
	movs r4, #8
	str r4, [sp]
	ldr r0, _0807D65C @ =gUnk_084033A0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r1, r5, #0
	adds r1, #0x18
	movs r0, #2
	str r0, [sp]
	ldr r0, _0807D660 @ =gUnk_084033AC
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #0
	adds r0, #0x1e
	movs r2, #8
	ldrsb r2, [r6, r2]
	movs r1, #2
	bl PutNumber
	adds r1, r5, #0
	adds r1, #0x20
	str r4, [sp]
	ldr r0, _0807D664 @ =gUnk_084033B4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0x78
	strh r0, [r1]
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D650: .4byte gPlaySt
_0807D654: .4byte 0x0000037B
_0807D658: .4byte gBg0Tm + 0x242
_0807D65C: .4byte gUnk_084033A0
_0807D660: .4byte gUnk_084033AC
_0807D664: .4byte gUnk_084033B4

	thumb_func_start sub_807D668
sub_807D668: @ 0x0807D668
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807D68A
	ldr r0, _0807D694 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0807D690
_0807D68A:
	adds r0, r2, #0
	bl Proc_Break
_0807D690:
	pop {r0}
	bx r0
	.align 2, 0
_0807D694: .4byte gpKeySt

	thumb_func_start sub_807D698
sub_807D698: @ 0x0807D698
	push {lr}
	ldr r0, _0807D6B4 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0807D6B8 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807D6B4: .4byte gBg1Tm
_0807D6B8: .4byte gBg0Tm

	thumb_func_start sub_807D6BC
sub_807D6BC: @ 0x0807D6BC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl HasConvoyAccess_
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D6D4
	ldr r0, _0807D6DC @ =gUnk_08D6FB5C
	adds r1, r4, #0
	bl Proc_StartBlocking
_0807D6D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D6DC: .4byte gUnk_08D6FB5C

	thumb_func_start sub_807D6E0
sub_807D6E0: @ 0x0807D6E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _0807D7BC @ =0x030027CC
	mov ip, r2
	ldr r0, _0807D7C0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	mov r8, r0
	mov r0, r8
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #8
	rsbs r2, r2, #0
	add r2, ip
	mov sb, r2
	mov r1, r8
	ldrb r0, [r2]
	orrs r1, r0
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	mov sl, r2
	mov r0, sl
	ldrb r2, [r7]
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, sl
	ands r0, r1
	strb r0, [r7]
	movs r0, #0x3f
	mov r2, ip
	ldrb r2, [r2]
	ands r0, r2
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _0807D7C4 @ =sub_8077FB4
	bl SetOnHBlankA
	ldr r0, _0807D7C8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807D7AE
	ldr r0, _0807D7CC @ =0x00000269
	bl m4aSongNumStart
_0807D7AE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D7BC: .4byte 0x030027CC
_0807D7C0: .4byte 0x0000FFE0
_0807D7C4: .4byte sub_8077FB4
_0807D7C8: .4byte gPlaySt
_0807D7CC: .4byte 0x00000269

	thumb_func_start sub_807D7D0
sub_807D7D0: @ 0x0807D7D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #4
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x68
	mov r2, r8
	bl sub_8077E1C
	ldr r3, _0807D844 @ =gDispIo
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
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _0807D83A
	adds r0, r7, #0
	bl Proc_Break
_0807D83A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D844: .4byte gDispIo

	thumb_func_start sub_807D848
sub_807D848: @ 0x0807D848
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl ApplyMapChange
	movs r0, #1
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
	bl RenderMap
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807D870
sub_807D870: @ 0x0807D870
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x80
	movs r5, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	subs r1, r1, r4
	adds r0, r1, #0
	muls r0, r5, r0
	muls r0, r1, r0
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x30
	adds r2, r5, #0
	bl sub_8077E1C
	ldr r3, _0807D8E0 @ =gDispIo
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
	ldr r0, [r7, #0x2c]
	cmp r0, #0x80
	blt _0807D8D8
	adds r0, r7, #0
	bl Proc_Break
_0807D8D8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D8E0: .4byte gDispIo

	thumb_func_start sub_807D8E4
sub_807D8E4: @ 0x0807D8E4
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _0807D934 @ =gDispIo
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
	subs r0, #0x21
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807D934: .4byte gDispIo

	thumb_func_start sub_807D938
sub_807D938: @ 0x0807D938
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807D948 @ =gUnk_08D6FC44
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807D948: .4byte gUnk_08D6FC44

	thumb_func_start sub_807D94C
sub_807D94C: @ 0x0807D94C
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #1
	bl sub_809F88C
	pop {r0}
	bx r0

	thumb_func_start sub_807D95C
sub_807D95C: @ 0x0807D95C
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #2
	bl sub_809F88C
	pop {r0}
	bx r0

	thumb_func_start sub_807D96C
sub_807D96C: @ 0x0807D96C
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #3
	bl sub_809F88C
	pop {r0}
	bx r0

	thumb_func_start sub_807D97C
sub_807D97C: @ 0x0807D97C
	ldr r1, _0807D98C @ =gBmSt
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807D98C: .4byte gBmSt

	thumb_func_start sub_807D990
sub_807D990: @ 0x0807D990
	push {lr}
	movs r0, #0x18
	bl GetUnitFromCharId
	movs r1, #0x6b
	bl GetUnitItemSlot
	adds r1, r0, #0
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1

	thumb_func_start sub_807D9AC
sub_807D9AC: @ 0x0807D9AC
	push {r4, lr}
	ldr r4, _0807D9DC @ =gActionSt
	ldrb r0, [r4, #0x11]
	cmp r0, #0x17
	bne _0807D9E0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	adds r4, r0, #0
	movs r0, #0x6b
	bl GetItemIndex
	cmp r4, r0
	bne _0807D9E0
	movs r0, #1
	b _0807D9E2
	.align 2, 0
_0807D9DC: .4byte gActionSt
_0807D9E0:
	movs r0, #0
_0807D9E2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807D9E8
sub_807D9E8: @ 0x0807D9E8
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807D9FC
sub_807D9FC: @ 0x0807D9FC
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r1, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0807DA20
	ldr r0, _0807DA1C @ =0x00000407
	ldrh r1, [r1, #0x10]
	cmp r1, r0
	bne _0807DA20
	movs r0, #1
	b _0807DA22
	.align 2, 0
_0807DA1C: .4byte 0x00000407
_0807DA20:
	movs r0, #0
_0807DA22:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807DA28
sub_807DA28: @ 0x0807DA28
	push {lr}
	bl sub_807AAB0
	movs r1, #0
	cmp r0, #1
	bgt _0807DA36
	movs r1, #1
_0807DA36:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807DA3C
sub_807DA3C: @ 0x0807DA3C
	push {lr}
	movs r0, #0x17
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807DA48
sub_807DA48: @ 0x0807DA48
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807DA5E
	movs r2, #1
_0807DA5E:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807DA64
sub_807DA64: @ 0x0807DA64
	push {lr}
	ldr r0, _0807DA70 @ =0x00002710
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_0807DA70: .4byte 0x00002710

	thumb_func_start sub_807DA74
sub_807DA74: @ 0x0807DA74
	push {lr}
	movs r0, #8
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807DA84
sub_807DA84: @ 0x0807DA84
	push {lr}
	movs r0, #8
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807DA94
sub_807DA94: @ 0x0807DA94
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807DAA8
sub_807DAA8: @ 0x0807DAA8
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #9
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807DAC4
sub_807DAC4: @ 0x0807DAC4
	push {lr}
	movs r0, #8
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807DAD4
sub_807DAD4: @ 0x0807DAD4
	push {lr}
	movs r0, #9
	bl CheckFlag
	movs r0, #0xa
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	movs r0, #8
	bl CheckFlag
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807DAF4
sub_807DAF4: @ 0x0807DAF4
	push {lr}
	movs r0, #8
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DB06
	movs r0, #0
	b _0807DB18
_0807DB06:
	ldr r0, _0807DB1C @ =gBmMapTerrain
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r1, #0x25
	ldrb r0, [r0, #6]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_0807DB18:
	pop {r1}
	bx r1
	.align 2, 0
_0807DB1C: .4byte gBmMapTerrain

	thumb_func_start sub_807DB20
sub_807DB20: @ 0x0807DB20
	push {lr}
	movs r0, #6
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	bl sub_807AA5C
	movs r0, #2
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807DB3C
sub_807DB3C: @ 0x0807DB3C
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0x85
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DB5E
	movs r0, #0x84
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r5, #0x74
	cmp r0, #0
	beq _0807DB6C
	movs r5, #0x73
	b _0807DB70
_0807DB5E:
	movs r0, #0x84
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DB6C
	movs r5, #0x75
_0807DB6C:
	cmp r5, #0
	beq _0807DB86
_0807DB70:
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r0, r5, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
_0807DB86:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807DB8C
sub_807DB8C: @ 0x0807DB8C
	ldr r0, _0807DBA8 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0x2f
	beq _0807DBAC
	cmp r0, #0x30
	beq _0807DBAC
	cmp r0, #0x31
	beq _0807DBAC
	cmp r0, #0x2e
	beq _0807DBAC
	movs r0, #0
	b _0807DBAE
	.align 2, 0
_0807DBA8: .4byte gActiveUnit
_0807DBAC:
	movs r0, #1
_0807DBAE:
	bx lr

	thumb_func_start sub_807DBB0
sub_807DBB0: @ 0x0807DBB0
	push {lr}
	movs r0, #0xb
	bl CheckFlag
	movs r0, #0xc
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807DBC8
sub_807DBC8: @ 0x0807DBC8
	push {r4, lr}
	movs r0, #0x10
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x3e
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x10
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x1c
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807DC80
sub_807DC80: @ 0x0807DC80
	push {lr}
	movs r0, #0x10
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807DC96
	movs r2, #1
_0807DC96:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807DC9C
sub_807DC9C: @ 0x0807DC9C
	push {lr}
	movs r0, #0xa
	bl CheckFlag
	movs r0, #0xb
	bl CheckFlag
	movs r0, #0xc
	bl CheckFlag
	movs r0, #0xd
	bl CheckFlag
	bl sub_807AA5C
	movs r0, #0xe
	bl CheckFlag
	movs r0, #0xf
	bl CheckFlag
	movs r0, #0x10
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807DCD0
sub_807DCD0: @ 0x0807DCD0
	push {r4, lr}
	movs r0, #0xe
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xf
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DCF0
	adds r4, #1
_0807DCF0:
	movs r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DD02
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0807DD02:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807DD0C
sub_807DD0C: @ 0x0807DD0C
	push {lr}
	bl sub_807DCD0
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807DD1C
	movs r1, #1
_0807DD1C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807DD24
sub_807DD24: @ 0x0807DD24
	push {lr}
	bl sub_807DCD0
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0807DD36
	movs r1, #1
_0807DD36:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807DD3C
sub_807DD3C: @ 0x0807DD3C
	push {lr}
	bl sub_807DCD0
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807DD4E
	movs r1, #1
_0807DD4E:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807DD54
sub_807DD54: @ 0x0807DD54
	push {lr}
	ldr r0, _0807DD78 @ =gBmMapUnit
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldrb r0, [r0, #3]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807DD7C
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0807DD7C
	movs r0, #1
	b _0807DD7E
	.align 2, 0
_0807DD78: .4byte gBmMapUnit
_0807DD7C:
	movs r0, #0
_0807DD7E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807DD84
sub_807DD84: @ 0x0807DD84
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #9
	bl CheckFlag
	movs r0, #0xa
	bl CheckFlag
	movs r0, #0xb
	bl CheckFlag
	movs r0, #0xc
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807DDAC
sub_807DDAC: @ 0x0807DDAC
	push {lr}
	bl sub_807AA5C
	movs r0, #2
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807DDBC
sub_807DDBC: @ 0x0807DDBC
	push {lr}
	bl sub_807AA5C
	movs r0, #7
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807DDCC
sub_807DDCC: @ 0x0807DDCC
	push {lr}
	movs r0, #8
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807DDDC
sub_807DDDC: @ 0x0807DDDC
	push {lr}
	movs r0, #0x26
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0807DE02
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0807DE02
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DE02
	movs r0, #1
	b _0807DE04
_0807DE02:
	movs r0, #0
_0807DE04:
	pop {r1}
	bx r1

	thumb_func_start nullsub_69
nullsub_69: @ 0x0807DE08
	bx lr
	.align 2, 0

	thumb_func_start sub_807DE0C
sub_807DE0C: @ 0x0807DE0C
	push {lr}
	movs r0, #0xb
	bl CheckFlag
	movs r0, #0xc
	bl CheckFlag
	movs r0, #0xd
	bl CheckFlag
	movs r0, #0xe
	bl CheckFlag
	movs r0, #0xf
	bl CheckFlag
	bl sub_807AA5C
	movs r0, #7
	bl CheckFlag
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807DE3C
sub_807DE3C: @ 0x0807DE3C
	ldr r2, _0807DE68 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r3, #1
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	bx lr
	.align 2, 0
_0807DE68: .4byte gDispIo

	thumb_func_start sub_807DE6C
sub_807DE6C: @ 0x0807DE6C
	push {lr}
	movs r0, #1
	bl GetUnitFromCharId
	movs r1, #6
	movs r2, #2
	bl SetUnitStatusExt
	pop {r0}
	bx r0

	thumb_func_start sub_807DE80
sub_807DE80: @ 0x0807DE80
	push {lr}
	movs r0, #9
	bl CheckFlag
	movs r0, #0xa
	bl CheckFlag
	movs r0, #0xb
	bl CheckFlag
	movs r0, #0xc
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807DEA4
sub_807DEA4: @ 0x0807DEA4
	push {lr}
	movs r0, #0xa
	bl CheckFlag
	movs r0, #0xb
	bl CheckFlag
	bl sub_807AA5C
	movs r0, #2
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807DEC0
sub_807DEC0: @ 0x0807DEC0
	push {lr}
	ldr r0, _0807DEEC @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807DEE8
	ldr r0, _0807DEF0 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	beq _0807DEF4
	cmp r0, #0x3d
	beq _0807DEF4
	bl RandNextB
	movs r1, #0xb
	bl DivRem
	cmp r0, #0
	beq _0807DEF4
_0807DEE8:
	movs r0, #0
	b _0807DEF6
	.align 2, 0
_0807DEEC: .4byte gPlaySt
_0807DEF0: .4byte gActiveUnit
_0807DEF4:
	movs r0, #1
_0807DEF6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807DEFC
sub_807DEFC: @ 0x0807DEFC
	push {lr}
	bl sub_807AA5C
	movs r0, #2
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807DF0C
sub_807DF0C: @ 0x0807DF0C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807DF12:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807DF2E
	ldr r0, [r0]
	cmp r0, #0
	beq _0807DF2E
	ldrb r0, [r0, #4]
	bl sub_80A0BA8
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807DF2E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807DF12
	ldr r0, _0807DF40 @ =0x030049FC
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF40: .4byte 0x030049FC

	thumb_func_start sub_807DF44
sub_807DF44: @ 0x0807DF44
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807DF4A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807DF62
	ldr r0, [r0]
	cmp r0, #0
	beq _0807DF62
	ldrb r0, [r0, #4]
	bl sub_80A0BA8
	adds r5, r5, r0
_0807DF62:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807DF4A
	ldr r0, _0807DF78 @ =0x030049FA
	ldrh r0, [r0]
	subs r5, r5, r0
	ldr r0, _0807DF7C @ =0x000002BB
	cmp r5, r0
	bgt _0807DF80
	movs r0, #0
	b _0807DF82
	.align 2, 0
_0807DF78: .4byte 0x030049FA
_0807DF7C: .4byte 0x000002BB
_0807DF80:
	movs r0, #1
_0807DF82:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807DF88
sub_807DF88: @ 0x0807DF88
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807DF8E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807DFC4
	ldr r3, [r2]
	cmp r3, #0
	beq _0807DFC4
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807DFC4
	ldrb r1, [r3, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0807DFBA
	cmp r1, #0x2d
	bne _0807DFC4
_0807DFBA:
	movs r0, #8
	ldrsb r0, [r2, r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807DFC4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807DF8E
	cmp r5, #0x31
	bhi _0807DFD2
	movs r0, #0
	b _0807DFD4
_0807DFD2:
	movs r0, #1
_0807DFD4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807DFDC
sub_807DFDC: @ 0x0807DFDC
	push {lr}
	sub sp, #4
	movs r1, #3
	str r1, [sp]
	movs r1, #0x10
	movs r2, #1
	movs r3, #2
	bl sub_801F208
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_807DFF4
sub_807DFF4: @ 0x0807DFF4
	push {lr}
	movs r0, #0x25
	bl GetUnitFromCharId
	ldrb r1, [r0, #0x11]
	ldrb r0, [r0, #0x10]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807E012
	cmp r1, #2
	bhi _0807E012
	movs r0, #1
	b _0807E014
_0807E012:
	movs r0, #0
_0807E014:
	pop {r1}
	bx r1

	thumb_func_start sub_807E018
sub_807E018: @ 0x0807E018
	push {lr}
	movs r0, #0xb
	bl CheckFlag
	movs r0, #0xc
	bl CheckFlag
	movs r0, #0xd
	bl CheckFlag
	movs r0, #2
	bl CheckFlag
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E038
sub_807E038: @ 0x0807E038
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #9
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807E050
sub_807E050: @ 0x0807E050
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #9
	bl CheckFlag
	movs r0, #0xa
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E074
sub_807E074: @ 0x0807E074
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807E08C @ =0x00004E1F
	cmp r0, r1
	ble _0807E084
	movs r2, #1
_0807E084:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807E08C: .4byte 0x00004E1F

	thumb_func_start sub_807E090
sub_807E090: @ 0x0807E090
	push {lr}
	ldr r0, _0807E09C @ =0x00004E20
	bl sub_807A6BC
	pop {r0}
	bx r0
	.align 2, 0
_0807E09C: .4byte 0x00004E20

	thumb_func_start sub_807E0A0
sub_807E0A0: @ 0x0807E0A0
	push {lr}
	movs r0, #7
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E0BE
	movs r0, #0xd
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807E0BE
	movs r0, #1
	b _0807E0C0
_0807E0BE:
	movs r0, #0
_0807E0C0:
	pop {r1}
	bx r1

	thumb_func_start sub_807E0C4
sub_807E0C4: @ 0x0807E0C4
	push {lr}
	movs r0, #0xe
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807E0D4
sub_807E0D4: @ 0x0807E0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r2, #0
	movs r6, #0
	movs r4, #1
_0807E0E4:
	adds r0, r4, #0
	str r2, [sp]
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	ldr r2, [sp]
	cmp r5, #0
	beq _0807E134
	ldr r0, [r5]
	cmp r0, #0
	beq _0807E134
	ldr r0, [r5, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807E134
	lsls r0, r2, #1
	mov r2, r8
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0807E132
	adds r4, r1, #0
_0807E114:
	ldr r0, [r5]
	ldrh r1, [r4]
	ldrb r0, [r0, #4]
	ldrb r2, [r4]
	cmp r0, r2
	bne _0807E12A
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A0BA8
	adds r6, r6, r0
_0807E12A:
	adds r4, #2
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807E114
_0807E132:
	movs r2, #0
_0807E134:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _0807E0E4
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E14C
sub_807E14C: @ 0x0807E14C
	push {r4, lr}
	ldr r0, _0807E168 @ =gUnk_08D80D24
	bl sub_807E0D4
	adds r4, r0, #0
	ldr r0, _0807E16C @ =gUnk_08D80D2E
	bl sub_807E0D4
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhi _0807E170
	movs r0, #0
	b _0807E172
	.align 2, 0
_0807E168: .4byte gUnk_08D80D24
_0807E16C: .4byte gUnk_08D80D2E
_0807E170:
	movs r0, #1
_0807E172:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807E178
sub_807E178: @ 0x0807E178
	push {lr}
	movs r0, #8
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807E188
sub_807E188: @ 0x0807E188
	push {r4, lr}
	movs r0, #9
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E1A8
	adds r4, #1
_0807E1A8:
	movs r0, #0xb
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E1B6
	adds r4, #1
_0807E1B6:
	movs r0, #0
	cmp r4, #1
	bgt _0807E1BE
	movs r0, #1
_0807E1BE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807E1C4
sub_807E1C4: @ 0x0807E1C4
	push {lr}
	movs r0, #0xc
	bl CheckFlag
	movs r0, #0xd
	bl CheckFlag
	movs r0, #0xe
	bl CheckFlag
	bl sub_807AA5C
	movs r0, #7
	bl CheckFlag
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E1E8
sub_807E1E8: @ 0x0807E1E8
	push {r4, lr}
	movs r0, #9
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E208
	adds r4, #1
_0807E208:
	movs r0, #0xb
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E216
	adds r4, #1
_0807E216:
	movs r0, #0xc
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E224
	adds r4, #1
_0807E224:
	movs r0, #0xd
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E232
	adds r4, #1
_0807E232:
	movs r0, #0xe
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E240
	adds r4, #1
_0807E240:
	movs r0, #0xf
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E24E
	adds r4, #1
_0807E24E:
	movs r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E25C
	adds r4, #1
_0807E25C:
	movs r0, #0x11
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E26A
	adds r4, #1
_0807E26A:
	cmp r4, #3
	ble _0807E272
	movs r0, #0
	b _0807E274
_0807E272:
	movs r0, #1
_0807E274:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E27C
sub_807E27C: @ 0x0807E27C
	push {lr}
	movs r0, #0x12
	bl CheckFlag
	movs r0, #0x13
	bl CheckFlag
	movs r0, #0x14
	bl CheckFlag
	movs r0, #0x15
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807E2A0
sub_807E2A0: @ 0x0807E2A0
	push {lr}
	movs r0, #0xd
	bl CheckFlag
	movs r0, #0xe
	bl CheckFlag
	movs r0, #0xf
	bl CheckFlag
	movs r0, #0x10
	bl CheckFlag
	movs r0, #7
	bl CheckFlag
	movs r0, #8
	bl CheckFlag
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E2CC
sub_807E2CC: @ 0x0807E2CC
	push {lr}
	movs r0, #0xa
	bl CheckFlag
	movs r0, #0xb
	bl CheckFlag
	movs r0, #0xc
	bl CheckFlag
	movs r0, #0xd
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E2F0
sub_807E2F0: @ 0x0807E2F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E334
	movs r0, #0x5b
	bl GetUnitFromCharId
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r3, _0807E33C @ =gBmSt
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	lsls r2, r2, #4
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	subs r0, #8
	subs r2, r2, r0
	adds r0, r4, #0
	bl sub_80211D8
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
_0807E334:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E33C: .4byte gBmSt

	thumb_func_start sub_807E340
sub_807E340: @ 0x0807E340
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0807E372
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0807E368 @ =gBmSt
	ands r0, r2
	cmp r0, #0
	beq _0807E36C
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	b _0807E370
	.align 2, 0
_0807E368: .4byte gBmSt
_0807E36C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
_0807E370:
	strh r0, [r1, #0xc]
_0807E372:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E378
sub_807E378: @ 0x0807E378
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807E3A8
	ldr r0, _0807E3AC @ =gUnk_08D837E8
	movs r1, #0
	bl Proc_Start
	ldr r1, _0807E3B0 @ =gBmSt
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x2c]
	ldr r0, _0807E3B4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E3A8
	ldr r0, _0807E3B8 @ =0x0000026A
	bl m4aSongNumStart
_0807E3A8:
	pop {r0}
	bx r0
	.align 2, 0
_0807E3AC: .4byte gUnk_08D837E8
_0807E3B0: .4byte gBmSt
_0807E3B4: .4byte gPlaySt
_0807E3B8: .4byte 0x0000026A

	thumb_func_start sub_807E3BC
sub_807E3BC: @ 0x0807E3BC
	push {lr}
	ldr r0, _0807E3E0 @ =gUnk_08D837E8
	bl Proc_EndEach
	ldr r2, _0807E3E4 @ =gBmSt
	ldrh r0, [r2, #0xc]
	adds r0, #0xf
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2, #0xc]
	movs r0, #4
	bl Sound_FadeOutSE
	pop {r0}
	bx r0
	.align 2, 0
_0807E3E0: .4byte gUnk_08D837E8
_0807E3E4: .4byte gBmSt

	thumb_func_start sub_807E3E8
sub_807E3E8: @ 0x0807E3E8
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807E40A
	adds r0, r4, #0
	bl Proc_Break
_0807E40A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start nullsub_70
nullsub_70: @ 0x0807E410
	bx lr
	.align 2, 0

	thumb_func_start sub_807E414
sub_807E414: @ 0x0807E414
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_807E3E8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E428
sub_807E428: @ 0x0807E428
	push {lr}
	ldr r2, _0807E440 @ =gFadeComponentStep
	movs r1, #0xff
	strb r1, [r2, #0x1b]
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_807E3E8
	pop {r0}
	bx r0
	.align 2, 0
_0807E440: .4byte gFadeComponentStep

	thumb_func_start sub_807E444
sub_807E444: @ 0x0807E444
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E492
	movs r0, #0x85
	bl GetUnitFromCharId
	adds r4, r0, #0
	ldrb r0, [r4, #0xb]
	adds r0, #0x40
	strb r0, [r4, #0xb]
	bl RefreshUnitSprites
	ldrb r0, [r4, #0xb]
	subs r0, #0x40
	strb r0, [r4, #0xb]
	ldr r0, _0807E498 @ =gPal + 0x3a0
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	bl ColorFadeSetupFromColorToWhite
	bl ColorFadeInit
	ldr r1, _0807E49C @ =gFadeComponentStep
	movs r0, #1
	strb r0, [r1, #0x1b]
	ldr r0, _0807E4A0 @ =ProcScr_08D837F8
	adds r1, r5, #0
	bl Proc_Start
_0807E492:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E498: .4byte gPal + 0x3a0
_0807E49C: .4byte gFadeComponentStep
_0807E4A0: .4byte ProcScr_08D837F8

	thumb_func_start sub_807E4A4
sub_807E4A4: @ 0x0807E4A4
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807E4B8
	ldr r0, _0807E4BC @ =ProcScr_08D837F8
	bl Proc_BreakEach
_0807E4B8:
	pop {r0}
	bx r0
	.align 2, 0
_0807E4BC: .4byte ProcScr_08D837F8

	thumb_func_start sub_807E4C0
sub_807E4C0: @ 0x0807E4C0
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807E4E2
	movs r0, #0x84
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x56
	bl GetClassData
	str r0, [r4, #4]
	bl RefreshUnitSprites
_0807E4E2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E4E8
sub_807E4E8: @ 0x0807E4E8
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807E50C
	movs r0, #0x84
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	bl sub_806DD98
_0807E50C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E514
sub_807E514: @ 0x0807E514
	push {lr}
	movs r0, #0x70
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E530
	ldr r0, _0807E52C @ =gUnk_08DA4190
	bl LoadUnit
	b _0807E536
	.align 2, 0
_0807E52C: .4byte gUnk_08DA4190
_0807E530:
	ldr r0, _0807E53C @ =gUnk_08DA41B0
	bl LoadUnit
_0807E536:
	pop {r0}
	bx r0
	.align 2, 0
_0807E53C: .4byte gUnk_08DA41B0

	thumb_func_start sub_807E540
sub_807E540: @ 0x0807E540
	push {r4, lr}
	ldr r0, _0807E564 @ =gBattleActor
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetPlayerLeaderUnitId
	cmp r4, r0
	beq _0807E56C
	ldr r0, _0807E568 @ =gBattleTarget
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetPlayerLeaderUnitId
	cmp r4, r0
	beq _0807E56C
	movs r0, #0
	b _0807E56E
	.align 2, 0
_0807E564: .4byte gBattleActor
_0807E568: .4byte gBattleTarget
_0807E56C:
	movs r0, #1
_0807E56E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807E574
sub_807E574: @ 0x0807E574
	push {lr}
	movs r0, #0xa
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807E584
sub_807E584: @ 0x0807E584
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E5C8
	movs r0, #0x44
	bl GetUnitFromCharId
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r3, _0807E5D0 @ =gBmSt
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	lsls r2, r2, #4
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	subs r0, #8
	subs r2, r2, r0
	adds r0, r4, #0
	bl sub_80211D8
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
_0807E5C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5D0: .4byte gBmSt

	thumb_func_start sub_807E5D4
sub_807E5D4: @ 0x0807E5D4
	push {lr}
	bl sub_807AA5C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E5E0
sub_807E5E0: @ 0x0807E5E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E616
	ldr r0, _0807E620 @ =gBmSt
	movs r1, #0xc
	ldrsh r5, [r0, r1]
	movs r1, #0x7f
	subs r1, r1, r5
	movs r2, #0xe
	ldrsh r4, [r0, r2]
	movs r2, #0x18
	subs r2, r2, r4
	movs r3, #0x87
	subs r3, r3, r5
	movs r0, #0x30
	subs r0, r0, r4
	str r0, [sp]
	adds r0, r6, #0
	bl sub_8021550
_0807E616:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E620: .4byte gBmSt

	thumb_func_start sub_807E624
sub_807E624: @ 0x0807E624
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807E636
	bl sub_80215B8
_0807E636:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EventCall_SwingSwordfx
EventCall_SwingSwordfx: @ 0x0807E63C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E654
	adds r0, r2, #0
	bl StartSwingSwordfx
_0807E654:
	pop {r0}
	bx r0

	thumb_func_start sub_807E658
sub_807E658: @ 0x0807E658
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E68E
	movs r0, #0xda
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl NinianStartTransformToHunman
	adds r0, r4, #0
	bl ClearUnit
	bl RefreshUnitSprites
	bl RefreshEntityMaps
_0807E68E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807E694
sub_807E694: @ 0x0807E694
	push {lr}
	movs r0, #0xda
	bl GetUnitFromCharId
	bl HideUnitSprite
	pop {r0}
	bx r0

	thumb_func_start sub_807E6A4
sub_807E6A4: @ 0x0807E6A4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	cmp r6, #0
	bne _0807E6FA
	movs r0, #0xda
	bl GetUnitFromCharId
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #4
	ldr r2, _0807E704 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	adds r4, #8
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	lsls r5, r5, #4
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	subs r5, r5, r0
	ldr r0, _0807E708 @ =gUnk_081C2974
	ldr r1, _0807E70C @ =0x06013000
	bl Decompress
	ldr r0, _0807E710 @ =gUnk_081C2D44
	ldr r3, _0807E714 @ =0x0000C180
	str r6, [sp]
	str r6, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartSpriteAnimProc
	ldr r0, _0807E718 @ =sub_807E694
	movs r1, #1
	bl sub_8014FB0
_0807E6FA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E704: .4byte gBmSt
_0807E708: .4byte gUnk_081C2974
_0807E70C: .4byte 0x06013000
_0807E710: .4byte gUnk_081C2D44
_0807E714: .4byte 0x0000C180
_0807E718: .4byte sub_807E694

	thumb_func_start sub_807E71C
sub_807E71C: @ 0x0807E71C
	push {lr}
	movs r0, #0xda
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0807E730
	bl ShowUnitSprite
	bl EndEachSpriteAnimProc
_0807E730:
	pop {r0}
	bx r0

	thumb_func_start sub_807E734
sub_807E734: @ 0x0807E734
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #9
	bl CheckFlag
	movs r0, #0xa
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807E750
sub_807E750: @ 0x0807E750
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #9
	bl CheckFlag
	movs r0, #0xa
	bl CheckFlag
	bl sub_807AA5C
	movs r0, #2
	bl CheckFlag
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E774
sub_807E774: @ 0x0807E774
	push {r4, lr}
	movs r0, #9
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl sub_807A794
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E79C
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x13
	bne _0807E79C
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _0807E79C
	movs r0, #1
	b _0807E79E
_0807E79C:
	movs r0, #0
_0807E79E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807E7A4
sub_807E7A4: @ 0x0807E7A4
	push {r4, r5, r6, lr}
	movs r0, #9
	bl GetUnitFromCharId
	adds r6, r0, #0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0807E7EE
_0807E7B6:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807E7D6
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E7D6
	movs r0, #1
	b _0807E7F0
_0807E7D6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bhi _0807E7EE
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0807E7B6
_0807E7EE:
	movs r0, #0
_0807E7F0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E7F8
sub_807E7F8: @ 0x0807E7F8
	push {lr}
	movs r0, #0x37
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807E816
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807E816
	movs r0, #1
	b _0807E818
_0807E816:
	movs r0, #0
_0807E818:
	pop {r1}
	bx r1

	thumb_func_start sub_807E81C
sub_807E81C: @ 0x0807E81C
	push {lr}
	movs r0, #9
	bl GetUnitFromCharId
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807E830
	movs r1, #1
_0807E830:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E838
sub_807E838: @ 0x0807E838
	push {lr}
	movs r0, #0x37
	bl GetUnitFromCharId
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807E84C
	movs r1, #1
_0807E84C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E854
sub_807E854: @ 0x0807E854
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r6, #9
	movs r5, #1
_0807E85C:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807E8F4
	ldr r0, [r4]
	cmp r0, #0
	beq _0807E8F4
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _0807E8F4
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #6
	bl sub_80A08B4
	adds r0, r4, #0
	bl UnitKill
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _0807E8EC @ =gBattleActor
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807E8A0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807E8A0:
	ldr r0, _0807E8F0 @ =gBattleTarget
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807E8B2
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807E8B2:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807E8CA
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_0807E8CA:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807E8FA
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _0807E8FA
	.align 2, 0
_0807E8EC: .4byte gBattleActor
_0807E8F0: .4byte gBattleTarget
_0807E8F4:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807E85C
_0807E8FA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_20
nullsub_20: @ 0x0807E904
	bx lr
	.align 2, 0

	thumb_func_start sub_807E908
sub_807E908: @ 0x0807E908
	push {lr}
	bl sub_807AD78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E92C
	movs r1, #0
	ldr r0, _0807E928 @ =gBmMapTerrain
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #5]
	cmp r0, #0x25
	bne _0807E924
	movs r1, #1
_0807E924:
	adds r0, r1, #0
	b _0807E92E
	.align 2, 0
_0807E928: .4byte gBmMapTerrain
_0807E92C:
	movs r0, #0
_0807E92E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E934
sub_807E934: @ 0x0807E934
	push {lr}
	movs r0, #8
	bl CheckFlag
	movs r0, #9
	bl CheckFlag
	movs r0, #0xa
	bl CheckFlag
	bl sub_807AA5C
	pop {r0}
	bx r0

	thumb_func_start sub_807E950
sub_807E950: @ 0x0807E950
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r1, _0807E988 @ =gUnk_084033C4
	mov r0, sp
	movs r2, #0x14
	bl memcpy
	movs r3, #0
	ldr r0, _0807E98C @ =gBmMapUnit
	ldr r4, [r0]
	mov r2, sp
	movs r5, #0xc0
_0807E968:
	movs r0, #1
	ldrsb r0, [r2, r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807E990
	ands r0, r5
	cmp r0, #0
	bne _0807E990
	movs r0, #1
	b _0807E99A
	.align 2, 0
_0807E988: .4byte gUnk_084033C4
_0807E98C: .4byte gBmMapUnit
_0807E990:
	adds r2, #2
	adds r3, #1
	cmp r3, #8
	ble _0807E968
	movs r0, #0
_0807E99A:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E9A4
sub_807E9A4: @ 0x0807E9A4
	push {r4, lr}
	movs r0, #0x27
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x8c
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E9C4
sub_807E9C4: @ 0x0807E9C4
	push {lr}
	adds r0, #0x60
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strh r1, [r0, #4]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	pop {r0}
	bx r0

	thumb_func_start sub_807E9E0
sub_807E9E0: @ 0x0807E9E0
	adds r3, r0, #0
	ldr r1, _0807E9F8 @ =gUnk_08D87684
	ldr r0, [r1]
	cmp r0, #0
	beq _0807EA06
	adds r2, r1, #0
_0807E9EC:
	ldr r0, [r2]
	cmp r3, r0
	bne _0807E9FC
	ldr r0, [r1, #4]
	b _0807EA08
	.align 2, 0
_0807E9F8: .4byte gUnk_08D87684
_0807E9FC:
	adds r1, #8
	adds r2, #8
	ldr r0, [r1]
	cmp r0, #0
	bne _0807E9EC
_0807EA06:
	movs r0, #0
_0807EA08:
	bx lr
	.align 2, 0

	thumb_func_start sub_807EA0C
sub_807EA0C: @ 0x0807EA0C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x60
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807EA2A
	bl EndTalk
	movs r0, #0
	b _0807EB3E
_0807EA2A:
	bl IsTalkActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0807EA38
	b _0807EB3C
_0807EA38:
	ldrb r0, [r5]
	cmp r0, #1
	beq _0807EAA0
	cmp r0, #1
	bgt _0807EA48
	cmp r0, #0
	beq _0807EA52
	b _0807EB3C
_0807EA48:
	cmp r0, #2
	beq _0807EAC8
	cmp r0, #3
	beq _0807EB06
	b _0807EB3C
_0807EA52:
	movs r6, #1
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0807EA94
	adds r6, r0, #0
	b _0807EA94
_0807EA5E:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807EA92
	ldr r2, [r4]
	cmp r2, #0
	beq _0807EA92
	ldr r0, [r4, #0xc]
	ldr r1, _0807EA9C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807EA92
	ldrb r0, [r2, #4]
	strb r0, [r5, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0807EA92
	cmp r0, #2
	beq _0807EA92
	cmp r0, #0x2d
	beq _0807EA92
	cmp r0, #0x26
	bne _0807EAF8
_0807EA92:
	adds r6, #1
_0807EA94:
	cmp r6, #0x3f
	ble _0807EA5E
	movs r0, #0
	b _0807EB3E
	.align 2, 0
_0807EA9C: .4byte 0x0001000C
_0807EAA0:
	ldrb r0, [r5, #2]
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807EAE8
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r6, #0
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	b _0807EAE8
_0807EAC8:
	ldr r4, _0807EAF0 @ =ProcScr_Face
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0807EAE8
	bl sub_80095E4
	ldr r1, _0807EAF4 @ =StartFaceFadeOut
	adds r0, r4, #0
	bl Proc_ForEach
	adds r0, r6, #0
	movs r1, #8
	bl sub_80149B4
_0807EAE8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0807EB3C
	.align 2, 0
_0807EAF0: .4byte ProcScr_Face
_0807EAF4: .4byte StartFaceFadeOut
_0807EAF8:
	ldrb r0, [r5, #2]
	bl sub_807E9E0
	strh r0, [r5, #4]
	adds r0, r6, #1
	strb r0, [r5, #1]
	b _0807EAE8
_0807EB06:
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _0807EB3A
	bl sub_8007DF4
	bl sub_800968C
	bl sub_8009628
	bl ClearTalk
	ldrh r0, [r5, #4]
	bl DecodeMsg
	adds r2, r0, #0
	movs r0, #0xa
	movs r1, #0xe
	movs r3, #0
	bl StartTalkExt
	movs r0, #1
	bl sub_8007F84
	movs r0, #1
	bl sub_8008CB8
_0807EB3A:
	strb r4, [r5]
_0807EB3C:
	movs r0, #1
_0807EB3E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807EB44
sub_807EB44: @ 0x0807EB44
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0807EB74 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0807EB78 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0807EB7C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807EB74: .4byte 0x01000008
_0807EB78: .4byte gBg0Tm
_0807EB7C: .4byte gBg1Tm

	thumb_func_start sub_807EB80
sub_807EB80: @ 0x0807EB80
	push {lr}
	bl sub_800EFD4
	bl sub_800F070
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807EB9C
sub_807EB9C: @ 0x0807EB9C
	push {lr}
	ldr r0, _0807EBC0 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807EBC4
	bl sub_807AC6C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807EBC4
	movs r0, #7
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807EBC4
	movs r0, #1
	b _0807EBC6
	.align 2, 0
_0807EBC0: .4byte gPlaySt
_0807EBC4:
	movs r0, #0
_0807EBC6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807EBCC
sub_807EBCC: @ 0x0807EBCC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r0, sp, #0x10
	ldr r1, _0807EC50 @ =gUnk_084033D8
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
	movs r7, #0
	movs r6, #1
	add r5, sp, #0x10
_0807EBE6:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807EC3C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807EC3C
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807EC3C
	cmp r4, #2
	beq _0807EC3C
	cmp r4, #0x2d
	beq _0807EC3C
	cmp r4, #0x26
	beq _0807EC3C
	cmp r4, #0x27
	beq _0807EC3C
	ldr r1, [r1, #0xc]
	ldr r0, _0807EC54 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807EC3C
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	str r2, [sp]
	movs r0, #1
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807EC42
_0807EC3C:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807EBE6
_0807EC42:
	bl RefreshUnitSprites
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC50: .4byte gUnk_084033D8
_0807EC54: .4byte 0x0001000C

	thumb_func_start sub_807EC58
sub_807EC58: @ 0x0807EC58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	add r2, sp, #0x1c
	adds r1, r2, #0
	ldr r0, _0807EC7C @ =gUnk_084033F4
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, _0807EC80 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807EC84
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #1
	b _0807EC8E
	.align 2, 0
_0807EC7C: .4byte gUnk_084033F4
_0807EC80: .4byte gPlaySt
_0807EC84:
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #2
_0807EC8E:
	str r0, [sp, #0x18]
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807ECCC
	adds r4, r2, #0
	add r7, sp, #0x10
	movs r5, #2
_0807ECA4:
	ldm r7!, {r0}
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #1
	ldrsb r3, [r4, r3]
	movs r1, #2
	ldrsb r1, [r4, r1]
	str r1, [sp]
	movs r1, #3
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	bl EventLoadUnit
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807ECA4
_0807ECCC:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807ECD4
sub_807ECD4: @ 0x0807ECD4
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	add r0, sp, #0x10
	ldr r1, _0807ED84 @ =gUnk_08403400
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807ED7C
	add r0, sp, #0x10
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r3, #1
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x27
	movs r1, #0
	bl EventLoadUnit
	add r0, sp, #0x10
	movs r2, #4
	ldrsb r2, [r0, r2]
	movs r3, #5
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	bl EventLoadUnit
	ldr r1, _0807ED88 @ =gPlaySt
	adds r1, #0x2b
	movs r4, #1
	adds r0, r4, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807ED7C
	add r0, sp, #0x10
	movs r2, #8
	ldrsb r2, [r0, r2]
	movs r3, #9
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xcd
	movs r1, #0x51
	bl EventLoadUnit
_0807ED7C:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED84: .4byte gUnk_08403400
_0807ED88: .4byte gPlaySt

	thumb_func_start sub_807ED8C
sub_807ED8C: @ 0x0807ED8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	add r1, sp, #0x10
	ldr r0, _0807EE2C @ =gUnk_0840340C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807EE20
	movs r6, #1
	add r5, sp, #0x10
_0807EDB8:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807EE16
	ldr r0, [r1]
	cmp r0, #0
	beq _0807EE16
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807EE16
	cmp r4, #2
	beq _0807EE16
	cmp r4, #0x2d
	beq _0807EE16
	cmp r4, #0x26
	beq _0807EE16
	cmp r4, #0x27
	beq _0807EE16
	ldr r1, [r1, #0xc]
	ldr r0, _0807EE30 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807EE16
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	movs r0, #2
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #3
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r7, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	movs r0, #1
	add r8, r0
	mov r2, r8
	cmp r2, #3
	bgt _0807EE1C
_0807EE16:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807EDB8
_0807EE1C:
	bl RefreshUnitSprites
_0807EE20:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EE2C: .4byte gUnk_0840340C
_0807EE30: .4byte 0x0001000C

	thumb_func_start sub_807EE34
sub_807EE34: @ 0x0807EE34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	mov r8, r0
	movs r7, #0
	add r0, sp, #0x10
	ldr r1, _0807EED0 @ =gUnk_0840341C
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	mov r1, r8
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807EEC4
	movs r6, #1
	mov r5, sp
_0807EE5A:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807EEBA
	ldr r0, [r1]
	cmp r0, #0
	beq _0807EEBA
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807EEBA
	cmp r4, #2
	beq _0807EEBA
	cmp r4, #0x2d
	beq _0807EEBA
	cmp r4, #0x26
	beq _0807EEBA
	cmp r4, #0x27
	beq _0807EEBA
	ldr r1, [r1, #0xc]
	ldr r0, _0807EED4 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807EEBA
	cmp r7, #3
	ble _0807EEB2
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	movs r0, #2
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #3
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
_0807EEB2:
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807EEC0
_0807EEBA:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807EE5A
_0807EEC0:
	bl RefreshUnitSprites
_0807EEC4:
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EED0: .4byte gUnk_0840341C
_0807EED4: .4byte 0x0001000C

	thumb_func_start sub_807EED8
sub_807EED8: @ 0x0807EED8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	add r2, sp, #0x1c
	adds r1, r2, #0
	ldr r0, _0807EF0C @ =gUnk_08403428
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807EF52
	ldr r0, _0807EF10 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807EF14
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #1
	b _0807EF1E
	.align 2, 0
_0807EF0C: .4byte gUnk_08403428
_0807EF10: .4byte gPlaySt
_0807EF14:
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #2
_0807EF1E:
	str r0, [sp, #0x18]
	adds r4, r2, #0
	add r7, sp, #0x10
	movs r5, #2
_0807EF26:
	ldm r7!, {r0}
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #1
	ldrsb r3, [r4, r3]
	movs r1, #2
	ldrsb r1, [r4, r1]
	str r1, [sp]
	movs r1, #3
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	bl EventLoadUnit
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807EF26
	bl RefreshUnitSprites
_0807EF52:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807EF5C
sub_807EF5C: @ 0x0807EF5C
	push {lr}
	bl sub_807AA5C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807EF68
sub_807EF68: @ 0x0807EF68
	push {lr}
	movs r0, #0x27
	bl GetUnitFromCharId
	movs r1, #0
	bl StartStatusHealEffect
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807EF7C
sub_807EF7C: @ 0x0807EF7C
	push {r4, r5, lr}
	ldr r5, _0807EFFC @ =gUnk_08DA9AF8
	ldr r0, _0807F000 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r0, #0x27
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807F004 @ =gUnk_08DA9B78
	bl sub_800A70C
	movs r0, #1
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807F008 @ =gUnk_08DA9B98
	bl sub_800A70C
	movs r0, #1
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807F00C @ =gUnk_08DA9A98
	bl sub_800A70C
	movs r0, #2
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807F010 @ =gUnk_08DA9AB8
	bl sub_800A70C
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807F014 @ =gUnk_08DA9AD8
	bl sub_800A70C
	movs r4, #1
_0807EFD2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	bne _0807EFE0
	b _0807F0EA
_0807EFE0:
	ldr r0, [r2]
	cmp r0, #0
	bne _0807EFE8
	b _0807F0EA
_0807EFE8:
	ldrb r0, [r0, #4]
	subs r0, #1
	cmp r0, #0x2c
	bhi _0807F0D0
	lsls r0, r0, #2
	ldr r1, _0807F018 @ =_0807F01C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807EFFC: .4byte gUnk_08DA9AF8
_0807F000: .4byte 0x0202E3F0
_0807F004: .4byte gUnk_08DA9B78
_0807F008: .4byte gUnk_08DA9B98
_0807F00C: .4byte gUnk_08DA9A98
_0807F010: .4byte gUnk_08DA9AB8
_0807F014: .4byte gUnk_08DA9AD8
_0807F018: .4byte _0807F01C
_0807F01C: @ jump table
	.4byte _0807F0EA @ case 0
	.4byte _0807F0EA @ case 1
	.4byte _0807F0D0 @ case 2
	.4byte _0807F0D0 @ case 3
	.4byte _0807F0D0 @ case 4
	.4byte _0807F0D0 @ case 5
	.4byte _0807F0D0 @ case 6
	.4byte _0807F0D0 @ case 7
	.4byte _0807F0D0 @ case 8
	.4byte _0807F0D0 @ case 9
	.4byte _0807F0D0 @ case 10
	.4byte _0807F0D0 @ case 11
	.4byte _0807F0D0 @ case 12
	.4byte _0807F0D0 @ case 13
	.4byte _0807F0D0 @ case 14
	.4byte _0807F0D0 @ case 15
	.4byte _0807F0D0 @ case 16
	.4byte _0807F0D0 @ case 17
	.4byte _0807F0D0 @ case 18
	.4byte _0807F0D0 @ case 19
	.4byte _0807F0D0 @ case 20
	.4byte _0807F0D0 @ case 21
	.4byte _0807F0D0 @ case 22
	.4byte _0807F0D0 @ case 23
	.4byte _0807F0D0 @ case 24
	.4byte _0807F0D0 @ case 25
	.4byte _0807F0D0 @ case 26
	.4byte _0807F0D0 @ case 27
	.4byte _0807F0D0 @ case 28
	.4byte _0807F0D0 @ case 29
	.4byte _0807F0D0 @ case 30
	.4byte _0807F0D0 @ case 31
	.4byte _0807F0D0 @ case 32
	.4byte _0807F0D0 @ case 33
	.4byte _0807F0D0 @ case 34
	.4byte _0807F0D0 @ case 35
	.4byte _0807F0D0 @ case 36
	.4byte _0807F0EA @ case 37
	.4byte _0807F0EA @ case 38
	.4byte _0807F0D0 @ case 39
	.4byte _0807F0D0 @ case 40
	.4byte _0807F0D0 @ case 41
	.4byte _0807F0D0 @ case 42
	.4byte _0807F0D0 @ case 43
	.4byte _0807F0EA @ case 44
_0807F0D0:
	ldr r0, [r2, #0xc]
	ldr r1, _0807F100 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807F0EA
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_800A70C
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807F0F2
_0807F0EA:
	adds r4, #1
	cmp r4, #0x3f
	bgt _0807F0F2
	b _0807EFD2
_0807F0F2:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F100: .4byte 0x0001000C

	thumb_func_start sub_807F104
sub_807F104: @ 0x0807F104
	push {r4, r5, lr}
	ldr r5, _0807F160 @ =gUnk_08DA9BB8
	ldr r0, _0807F164 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #1
_0807F114:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807F14A
	ldr r0, [r2]
	cmp r0, #0
	beq _0807F14A
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	beq _0807F14A
	cmp r0, #0x27
	beq _0807F14A
	ldr r0, [r2, #0xc]
	ldr r1, _0807F168 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807F14A
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_800A70C
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807F150
_0807F14A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807F114
_0807F150:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F160: .4byte gUnk_08DA9BB8
_0807F164: .4byte 0x0202E3F0
_0807F168: .4byte 0x0001000C

	thumb_func_start sub_807F16C
sub_807F16C: @ 0x0807F16C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807F18C
	adds r0, r4, #0
	movs r1, #0
	bl sub_8012440
	b _0807F192
_0807F18C:
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807F192:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807F198
sub_807F198: @ 0x0807F198
	push {lr}
	ldr r0, _0807F1B0 @ =gUnk_08DA9D18
	movs r1, #0x27
	bl sub_807F16C
	ldr r0, _0807F1B4 @ =gUnk_08DA9D38
	movs r1, #0x26
	bl sub_807F16C
	pop {r0}
	bx r0
	.align 2, 0
_0807F1B0: .4byte gUnk_08DA9D18
_0807F1B4: .4byte gUnk_08DA9D38

	thumb_func_start sub_807F1B8
sub_807F1B8: @ 0x0807F1B8
	push {lr}
	sub sp, #0x10
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0x12
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x12
	bl EventLoadUnit
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start ForceDisplayDragonSprite
ForceDisplayDragonSprite: @ 0x0807F1DC
	push {lr}
	movs r0, #0x25
	bl GetUnitFromCharId
	adds r2, r0, #0
	cmp r2, #0
	beq _0807F1F2
	ldr r0, [r2, #0xc]
	ldr r1, _0807F1F8 @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0807F1F2:
	pop {r0}
	bx r0
	.align 2, 0
_0807F1F8: .4byte 0xFFFEFFFF
