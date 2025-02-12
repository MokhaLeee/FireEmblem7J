	.include "macro.inc"
	.syntax unified

	thumb_func_start PrepItemTrade_ApplyItemSwap
PrepItemTrade_ApplyItemSwap: @ 0x080948A0
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start PrepItemTrade_DpadKeyHandler
PrepItemTrade_DpadKeyHandler: @ 0x080948CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08094930 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08094954
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080948EA
	b _08094AB8
_080948EA:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _08094918
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094918
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _08094918
	movs r0, #5
	cmp r2, #5
	beq _08094916
	adds r0, r2, #1
_08094916:
	adds r2, r0, #0
_08094918:
	cmp r2, #0
	bgt _0809491E
	b _08094AB8
_0809491E:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _08094934
	adds r0, r1, #0
	subs r0, #8
	b _08094936
	.align 2, 0
_08094930: .4byte gpKeySt
_08094934:
	subs r0, r2, #1
_08094936:
	str r0, [r4, #0x34]
	ldr r0, _0809494C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08094946
	b _08094AA8
_08094946:
	ldr r0, _08094950 @ =0x00000387
	b _08094AA4
	.align 2, 0
_0809494C: .4byte gPlaySt
_08094950: .4byte 0x00000387
_08094954:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080949C8
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08094968
	b _08094AB8
_08094968:
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _08094996
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094996
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _08094996
	movs r0, #5
	cmp r2, #5
	beq _08094994
	adds r0, r2, #1
_08094994:
	adds r2, r0, #0
_08094996:
	cmp r2, #0
	bgt _0809499C
	b _08094AB8
_0809499C:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _080949AC
	adds r0, r1, #0
	adds r0, #8
	b _080949AE
_080949AC:
	adds r0, r2, #7
_080949AE:
	str r0, [r4, #0x34]
	ldr r0, _080949C0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094AA8
	ldr r0, _080949C4 @ =0x00000387
	b _08094AA4
	.align 2, 0
_080949C0: .4byte gPlaySt
_080949C4: .4byte 0x00000387
_080949C8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08094A34
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _08094A04
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094A04
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _08094A04
	movs r0, #5
	cmp r3, #5
	beq _08094A02
	adds r0, r3, #1
_08094A02:
	adds r3, r0, #0
_08094A04:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _08094A14
	subs r0, r2, #1
	str r0, [r4, #0x34]
	b _08094A96
_08094A14:
	ldr r0, _08094A30 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	b _08094A96
	.align 2, 0
_08094A30: .4byte gpKeySt
_08094A34:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _08094A70
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094A70
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _08094A70
	movs r0, #5
	cmp r3, #5
	beq _08094A6E
	adds r0, r3, #1
_08094A6E:
	adds r3, r0, #0
_08094A70:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _08094A82
	adds r0, r2, #1
	str r0, [r4, #0x34]
	b _08094A96
_08094A82:
	ldr r0, _08094AAC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
_08094A96:
	ldr r0, _08094AB0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094AA8
	ldr r0, _08094AB4 @ =0x00000386
_08094AA4:
	bl m4aSongNumStart
_08094AA8:
	movs r0, #1
	b _08094ABA
	.align 2, 0
_08094AAC: .4byte gpKeySt
_08094AB0: .4byte gPlaySt
_08094AB4: .4byte 0x00000386
_08094AB8:
	movs r0, #0
_08094ABA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8094AC0
sub_8094AC0: @ 0x08094AC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _08094B94
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_08094AFA:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _08094B16
	mov r0, sl
	adds r1, r6, #0
	bl CanUnitUseItemPrepScreen
	b _08094B1E
_08094B16:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
_08094B1E:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, sb
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _08094B3C
	movs r2, #1
_08094B3C:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sb
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl PutDrawText
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq _08094B58
	movs r7, #2
_08094B58:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #8
	add sb, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _08094AFA
_08094B94:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094BA4
sub_8094BA4: @ 0x08094BA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _08094BDA
_08094BB8:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _08094BB8
_08094BDA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094BE0
sub_8094BE0: @ 0x08094BE0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _08094CD8 @ =gUnk_0842CFDC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _08094CDC @ =gBgConfig_PrepScreen
	ldrh r0, [r0]
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	ldr r3, _08094CE0 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r4, [r3, #0xc]
	ands r0, r4
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r4, [r3, #0x14]
	ands r2, r4
	strb r2, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
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
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08094CE4 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _08094CE8 @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08094CA6:
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r0, r6, #0
	movs r1, #7
	bl InitTextDb
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08094CA6
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x38]
	ldr r1, [r2, #0x40]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08094CEC
	adds r0, r1, #0
	adds r0, #8
	str r0, [r2, #0x34]
	b _08094D06
	.align 2, 0
_08094CD8: .4byte gUnk_0842CFDC
_08094CDC: .4byte gBgConfig_PrepScreen
_08094CE0: .4byte gDispIo
_08094CE4: .4byte 0x06014000
_08094CE8: .4byte 0x02012A20
_08094CEC:
	mov r3, r8
	ldr r0, [r3, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08094D00
	movs r0, #8
	mov r4, r8
	str r0, [r4, #0x34]
	b _08094D06
_08094D00:
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x34]
_08094D06:
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r4, #4
	rsbs r4, r4, #0
	ldr r0, _08094EA4 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartBmFace
	mov r3, r8
	ldr r0, [r3, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _08094EA8 @ =0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl StartBmFace
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804A4CC
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804A4CC
	movs r0, #7
	bl EnableBgSync
	mov r4, r8
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _08094EAC @ =gBg0Tm
	mov sb, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, sb
	movs r2, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, sb
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, sb
	ldr r4, _08094EB0 @ =0x02012A20
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, sb
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	mov r0, r8
	bl StartUiCursorHand
	mov r0, r8
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r5, #0x80
	lsls r5, r5, #4
	movs r2, #0xb
	adds r3, r5, #0
	bl ShowSysHandCursor
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl EnableSysBrownBox
	ldr r3, _08094EB4 @ =gDispIo
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, _08094EB8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _08094EBC @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r3, #0x3c]
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094EA4: .4byte 0x00000203
_08094EA8: .4byte 0x00000202
_08094EAC: .4byte gBg0Tm
_08094EB0: .4byte 0x02012A20
_08094EB4: .4byte gDispIo
_08094EB8: .4byte 0x0000FFE0
_08094EBC: .4byte 0x0000E0FF

	thumb_func_start sub_8094EC0
sub_8094EC0: @ 0x08094EC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _08094EEC
	ldr r0, _08094EE8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08094EE0
	b _08095154
_08094EE0:
	bl CloseHelpBox
	movs r0, #0xff
	b _080951B4
	.align 2, 0
_08094EE8: .4byte gpKeySt
_08094EEC:
	ldr r0, _08094F28 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08094F2C
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _08094F1C
	b _080951B6
_08094F1C:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _080951AC
	.align 2, 0
_08094F28: .4byte gpKeySt
_08094F2C:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _08094F34
	b _08095094
_08094F34:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08094F3E
	b _08095048
_08094F3E:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl CheckValidLinkArenaItemSwap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094F80
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08094F7C @ =0x000003B3
	adds r0, r1, #0
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	b _080951B6
	.align 2, 0
_08094F7C: .4byte 0x000003B3
_08094F80:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl PrepItemTrade_ApplyItemSwap
	ldr r4, _08094FE4 @ =gBg0Tm + 0x244
	ldr r5, _08094FE8 @ =0x02012A20
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8094AC0
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _08094FEC
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _08095000
	.align 2, 0
_08094FE4: .4byte gBg0Tm + 0x244
_08094FE8: .4byte 0x02012A20
_08094FEC:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _08095002
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_08095000:
	str r0, [r6, #0x38]
_08095002:
	ldr r0, _08095040 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095014
	ldr r0, _08095044 @ =0x0000038A
	bl m4aSongNumStart
_08095014:
	movs r0, #0
	bl DisableUiCursorHand
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	b _080951B6
	.align 2, 0
_08095040: .4byte gPlaySt
_08095044: .4byte 0x0000038A
_08095048:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08095052
	b _08095154
_08095052:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _0809508C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095084
	ldr r0, _08095090 @ =0x0000038B
	bl m4aSongNumStart
_08095084:
	movs r0, #0
	bl DisableUiCursorHand
	b _080951B6
	.align 2, 0
_0809508C: .4byte gPlaySt
_08095090: .4byte 0x0000038B
_08095094:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08095128
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl SetUiCursorHandConfig
	cmp r4, #4
	bgt _080950E4
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _080950EC
_080950E4:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_080950EC:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08095120 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080951B6
	ldr r0, _08095124 @ =0x0000038A
	bl m4aSongNumStart
	b _080951B6
	.align 2, 0
_08095120: .4byte gPlaySt
_08095124: .4byte 0x0000038A
_08095128:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095154
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _0809514C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080951B6
	ldr r0, _08095150 @ =0x0000038B
	bl m4aSongNumStart
	b _080951B6
	.align 2, 0
_0809514C: .4byte gPlaySt
_08095150: .4byte 0x0000038B
_08095154:
	adds r0, r6, #0
	bl PrepItemTrade_DpadKeyHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080951B6
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _080951B6
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080951B6
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_080951AC:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_080951B4:
	str r0, [r6, #0x3c]
_080951B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start PrepItemTrade_OnEnd
PrepItemTrade_OnEnd: @ 0x080951C0
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepItemTradeScreenProc
StartPrepItemTradeScreenProc: @ 0x080951D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080951F8 @ =ProcScr_PrepItemTradeScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080951F8: .4byte ProcScr_PrepItemTradeScreen

	thumb_func_start sub_80951FC
sub_80951FC: @ 0x080951FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08095218 @ =ProcScr_PrepItemTradeScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095218: .4byte ProcScr_PrepItemTradeScreen
