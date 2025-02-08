	.include "macro.inc"
	.syntax unified

	thumb_func_start PrepUnit_DrawUnitListNames
PrepUnit_DrawUnitListNames: @ 0x0809385C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov sb, r2
_0809387C:
	mov r0, r8
	adds r4, r0, r7
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _080938F6
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	movs r6, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080938AE
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080938AE
	movs r6, #4
	b _080938BA
_080938AE:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080938BA
	movs r6, #1
_080938BA:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _08093918 @ =gPrepUnitTexts
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, sb
	lsls r1, r1, #1
	ldr r2, _0809391C @ =gBg2Tm
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
_080938F6:
	movs r0, #7
	add sb, r0
	adds r7, #1
	cmp r7, #1
	ble _0809387C
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093918: .4byte gPrepUnitTexts
_0809391C: .4byte gBg2Tm

	thumb_func_start PrepUpdateMenuTsaScroll
PrepUpdateMenuTsaScroll: @ 0x08093920
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _08093944 @ =gBg2Tm + 0x20
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08093944: .4byte gBg2Tm + 0x20

	thumb_func_start PrepUnit_DrawSMSAndObjs
PrepUnit_DrawSMSAndObjs: @ 0x08093948
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r6, #0
	b _08093984
_08093952:
	asrs r0, r6, #1
	lsls r0, r0, #4
	ldrh r1, [r7, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _08093982
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8026540
_08093982:
	adds r6, #1
_08093984:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _08093952
	movs r0, #0xf
	ldrh r2, [r7, #0x30]
	ands r0, r2
	cmp r0, #0
	beq _08093A2C
	ldr r0, _08093A28 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r2, #1
	ldrb r0, [r6]
	orrs r0, r2
	movs r4, #2
	orrs r0, r4
	movs r5, #5
	rsbs r5, r5, #0
	ands r0, r5
	movs r3, #8
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r2
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r2, r0
	orrs r2, r4
	movs r0, #4
	orrs r2, r0
	orrs r2, r3
	orrs r2, r5
	strb r2, [r1]
	b _08093A42
	.align 2, 0
_08093A28: .4byte gDispIo
_08093A2C:
	ldr r2, _08093A88 @ =gDispIo
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
_08093A42:
	ldr r3, _08093A8C @ =gUnk_08D8CDA8
	movs r4, #0x40
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8e
	bl PutSpriteExt
	adds r1, r7, #0
	adds r1, #0x37
	ldrb r0, [r1]
	cmp r0, #0
	beq _08093A60
	adds r0, #1
	strb r0, [r1]
_08093A60:
	ldrb r1, [r1]
	lsrs r0, r1, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08093AA2
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093A94
	ldr r3, _08093A90 @ =Sprite_08D8CDD0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
	b _08093AA2
	.align 2, 0
_08093A88: .4byte gDispIo
_08093A8C: .4byte gUnk_08D8CDA8
_08093A90: .4byte Sprite_08D8CDD0
_08093A94:
	ldr r3, _08093AB0 @ =Sprite_08D8CDBC
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
_08093AA2:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093AB0: .4byte Sprite_08D8CDBC

	thumb_func_start PrepUnit_InitTexts
PrepUnit_InitTexts: @ 0x08093AB4
	push {r4, r5, lr}
	bl ResetText
	ldr r5, _08093B08 @ =gPrepUnitTexts
	movs r4, #0xd
_08093ABE:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08093ABE
	ldr r5, _08093B0C @ =gPrepUnitTexts + 14 * 8
	movs r4, #4
_08093AD2:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08093AD2
	ldr r4, _08093B10 @ =gPrepUnitTexts + 19 * 8
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl InitText
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xb
	bl InitText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093B08: .4byte gPrepUnitTexts
_08093B0C: .4byte gPrepUnitTexts + 14 * 8
_08093B10: .4byte gPrepUnitTexts + 19 * 8

	thumb_func_start PrepUnit_InitGfx
PrepUnit_InitGfx: @ 0x08093B14
	push {lr}
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #0xf
	bl PutPrepMenuUiImg
	ldr r0, _08093B4C @ =gBg1Tm
	ldr r1, _08093B50 @ =gUnk_0841F9F4
	movs r2, #0xf3
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _08093B54 @ =Img_PrepScreenTitleSprites
	ldr r1, _08093B58 @ =0x06010800
	bl Decompress
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08093B4C: .4byte gBg1Tm
_08093B50: .4byte gUnk_0841F9F4
_08093B54: .4byte Img_PrepScreenTitleSprites
_08093B58: .4byte 0x06010800

	thumb_func_start sub_8093B5C
sub_8093B5C: @ 0x08093B5C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	bl NewSysBlackBoxHandler
	adds r0, r4, #0
	bl SysBlackBoxSetGfx
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093B90
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
	b _08093BA8
_08093B90:
	movs r2, #0x91
	lsls r2, r2, #3
	movs r0, #3
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
_08093BA8:
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x6c
	movs r3, #0x10
	bl EnableSysBlackBox
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepUnit_InitSMS
PrepUnit_InitSMS: @ 0x08093BC8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _08093BF8 @ =gPal + 0x360
	ldr r2, _08093BFC @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl MakePrepUnitList
	ldr r0, [r4, #0x14]
	bl PrepAutoCapDeployUnits
	bl PrepUpdateSMS
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093BF8: .4byte gPal + 0x360
_08093BFC: .4byte 0x01000008

	thumb_func_start PrepUnit_DrawLeftUnitName
PrepUnit_DrawLeftUnitName: @ 0x08093C00
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08093CB8 @ =gBg0Tm + 0xca
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	bl GetUnitPortraitId
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov sb, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _08093CBC @ =gPrepUnitTexts + 19 * 8
	mov r8, r0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, sb
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r4, #2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093CB8: .4byte gBg0Tm + 0xca
_08093CBC: .4byte gPrepUnitTexts + 19 * 8

	thumb_func_start PrepUnit_DrawLeftUnitNameCur
PrepUnit_DrawLeftUnitNameCur: @ 0x08093CC0
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawLeftUnitName
	pop {r0}
	bx r0

	thumb_func_start PrepUnit_DrawUnitItems
PrepUnit_DrawUnitItems: @ 0x08093CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl InitIcons
	ldr r4, _08093DBC @ =gBg0Tm + 0x142
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _08093DA4
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov sb, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_08093D10:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sb
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _08093DC0 @ =gPrepUnitTexts + 14 * 8
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093D4E
	movs r6, #1
_08093D4E:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _08093DC4 @ =gBg0Tm + 0x2
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08093D7E
	movs r5, #2
_08093D7E:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	add sl, r0
	add sb, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _08093D10
_08093DA4:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093DBC: .4byte gBg0Tm + 0x142
_08093DC0: .4byte gPrepUnitTexts + 14 * 8
_08093DC4: .4byte gBg0Tm + 0x2

	thumb_func_start PrepUnit_DrawPickLeftBar
PrepUnit_DrawPickLeftBar: @ 0x08093DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne _08093E04
	ldr r4, _08093E88 @ =0x02012B48
	adds r0, r4, #0
	bl ClearText
	ldr r5, _08093E8C @ =gBg0Tm + 0x5c
	str r6, [sp]
	ldr r0, _08093E90 @ =gUnk_0842CFC4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	str r6, [sp]
	ldr r0, _08093E94 @ =gUnk_0842CFCC
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
_08093E04:
	ldr r6, _08093E98 @ =gBg0Tm + 0x60
	adds r0, r6, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r6, #2
	adds r4, r7, #0
	adds r4, #0x29
	adds r5, r7, #0
	adds r5, #0x2a
	movs r1, #2
	ldrb r2, [r4]
	ldrb r3, [r5]
	cmp r2, r3
	bne _08093E28
	movs r1, #1
_08093E28:
	ldrb r7, [r5]
	ldrb r3, [r4]
	subs r2, r7, r3
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r6, #0
	adds r0, #0x14
	movs r1, #2
	ldrb r7, [r4]
	ldrb r2, [r5]
	cmp r7, r2
	bne _08093E50
	movs r1, #4
_08093E50:
	ldrb r2, [r4]
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x16
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x1a
	movs r1, #2
	ldrb r4, [r4]
	ldrb r3, [r5]
	cmp r4, r3
	bne _08093E72
	movs r1, #4
_08093E72:
	ldrb r2, [r5]
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093E88: .4byte 0x02012B48
_08093E8C: .4byte gBg0Tm + 0x5c
_08093E90: .4byte gUnk_0842CFC4
_08093E94: .4byte gUnk_0842CFCC
_08093E98: .4byte gBg0Tm + 0x60

	thumb_func_start PrepCheckCanSelectUnit
PrepCheckCanSelectUnit: @ 0x08093E9C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r1, r4, #0
	adds r1, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r1, r0
	bls _08093EF0
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldr r0, _08093EE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093EDA
	ldr r0, _08093EEC @ =0x0000038A
	bl m4aSongNumStart
_08093EDA:
	ldrh r0, [r4, #0x2e]
	lsrs r1, r0, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _08093F06
	.align 2, 0
_08093EE8: .4byte gPlaySt
_08093EEC: .4byte 0x0000038A
_08093EF0:
	ldr r0, _08093F0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F04
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093F04:
	movs r0, #0
_08093F06:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093F0C: .4byte gPlaySt

	thumb_func_start PrepCheckCanUnselectUnit
PrepCheckCanUnselectUnit: @ 0x08093F10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093F68
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldr r0, _08093F60 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F50
	ldr r0, _08093F64 @ =0x0000038B
	bl m4aSongNumStart
_08093F50:
	ldrh r0, [r5, #0x2e]
	lsrs r1, r0, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _08093F7E
	.align 2, 0
_08093F60: .4byte gPlaySt
_08093F64: .4byte 0x0000038B
_08093F68:
	ldr r0, _08093F84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F7C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093F7C:
	movs r0, #0
_08093F7E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08093F84: .4byte gPlaySt

	thumb_func_start PrepUnit_HandlePressA
PrepUnit_HandlePressA: @ 0x08093F88
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08093FC8
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _08093FC4 @ =0x000003B6
_08093FBA:
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _08094024
	.align 2, 0
_08093FC4: .4byte 0x000003B6
_08093FC8:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08094012
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094008
	adds r0, r5, #0
	bl sub_80916F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094008
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _08094004 @ =0x000003B2
	b _08093FBA
	.align 2, 0
_08094004: .4byte 0x000003B2
_08094008:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PrepCheckCanSelectUnit
	b _0809401A
_08094012:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PrepCheckCanUnselectUnit
_0809401A:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094024
	movs r0, #1
	b _08094026
_08094024:
	movs r0, #0
_08094026:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809402C
sub_809402C: @ 0x0809402C
	push {r4, r5, r6, lr}
	sub sp, #8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	bne _08094078
	ldr r0, _08094080 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	ldr r5, _08094084 @ =0x02012B40
	adds r0, r5, #0
	bl ClearText
	movs r0, #0x50
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r1, _08094088 @ =gBg0Tm + 0x402
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
_08094078:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094080: .4byte gPlaySt
_08094084: .4byte 0x02012B40
_08094088: .4byte gBg0Tm + 0x402

	thumb_func_start ShouldPrepUnitMenuScroll
ShouldPrepUnitMenuScroll: @ 0x0809408C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _080940A0
	ldrh r2, [r4, #0x2e]
	lsrs r0, r2, #1
	cmp r0, r1
	ble _080940B6
_080940A0:
	adds r5, r1, #5
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _080940BA
	ldrh r4, [r4, #0x2e]
	lsrs r0, r4, #1
	cmp r0, r5
	blt _080940BA
_080940B6:
	movs r0, #1
	b _080940BC
_080940BA:
	movs r0, #0
_080940BC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80940C4
sub_80940C4: @ 0x080940C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094106
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _080940F8
	cmp r4, #0
	bne _080940EE
	strh r4, [r5, #0x30]
	b _080940F4
_080940EE:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_080940F4:
	cmp r4, r6
	ble _08094106
_080940F8:
	cmp r4, r1
	bne _08094100
	subs r0, r4, #5
	b _08094102
_08094100:
	subs r0, r4, #4
_08094102:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_08094106:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809410C
sub_809410C: @ 0x0809410C
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _08094122
	movs r5, #1
_08094122:
	adds r0, r4, #5
	cmp r0, r1
	bge _0809412C
	movs r0, #2
	orrs r5, r0
_0809412C:
	adds r0, r5, #0
	bl SetUiSpinningArrowConfig
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ProcPrepUnit_OnInit
ProcPrepUnit_OnInit: @ 0x08094138
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProcPrepUnit_InitScreen
ProcPrepUnit_InitScreen: @ 0x08094178
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08094350 @ =gBgConfig_PrepScreen
	bl InitBgs
	ldr r4, _08094354 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_80940C4
	ldr r0, _08094358 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809435C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _08094360 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r3, [r4, #0x10]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl PrepUnit_InitTexts
	bl PrepUnit_InitGfx
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r5, #0
	bl sub_8093B5C
	movs r0, #7
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08094364 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	ldr r1, _08094368 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl PrepUnit_InitSMS
	ldr r0, _0809436C @ =PrepUnit_DrawSMSAndObjs
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl StartMenuScrollBar
	movs r0, #0xe2
	movs r1, #0x20
	bl PutMenuScrollBarAt
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitMenuScrollBarImg
	movs r0, #0x20
	movs r1, #0x8c
	adds r2, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawLeftUnitName
	bl sub_809402C
	movs r4, #0
_0809431C:
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	adds r4, #1
	cmp r4, #5
	ble _0809431C
	adds r0, r5, #0
	movs r1, #0
	bl PrepUnit_DrawPickLeftBar
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _08094370 @ =0x06015000
	movs r1, #5
	bl LoadHelpBoxGfx
	bl PrepRestartMuralBackground
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094350: .4byte gBgConfig_PrepScreen
_08094354: .4byte gDispIo
_08094358: .4byte gBg0Tm
_0809435C: .4byte gBg1Tm
_08094360: .4byte gBg2Tm
_08094364: .4byte 0x0000FFE0
_08094368: .4byte 0x0000E0FF
_0809436C: .4byte PrepUnit_DrawSMSAndObjs
_08094370: .4byte 0x06015000

	thumb_func_start sub_8094374
sub_8094374: @ 0x08094374
	push {lr}
	bl EndMenuScrollBar
	bl EndAllParallelWorkers
	bl EndSysBlackBoxs
	bl EndSysHandCursor
	bl EndHelpPromptSprite
	bl sub_80A9CE4
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProcPrepUnit_Idle
ProcPrepUnit_Idle: @ 0x08094398
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _080943A6
	b _080945BA
_080943A6:
	ldr r3, _080943F4 @ =gpKeySt
	ldr r1, [r3]
	ldrh r6, [r1, #6]
	adds r2, r5, #0
	adds r2, #0x36
	movs r4, #4
	strb r4, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _080943C6
	ldrh r6, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_080943C6:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08094420
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080943FC
	ldr r0, _080943F8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080943EA
	b _08094634
_080943EA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08094634
	.align 2, 0
_080943F4: .4byte gpKeySt
_080943F8: .4byte gPlaySt
_080943FC:
	ldr r0, _08094418 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809440E
	ldr r0, _0809441C @ =0x0000038A
	bl m4aSongNumStart
_0809440E:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08094634
	.align 2, 0
_08094418: .4byte gPlaySt
_0809441C: .4byte 0x0000038A
_08094420:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809444C
	ldr r0, _08094444 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809443A
	ldr r0, _08094448 @ =0x0000038A
	bl m4aSongNumStart
_0809443A:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08094634
	.align 2, 0
_08094444: .4byte gPlaySt
_08094448: .4byte 0x0000038A
_0809444C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08094460
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08094634
_08094460:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08094482
	adds r0, r5, #0
	bl PrepUnit_HandlePressA
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094478
	b _08094634
_08094478:
	adds r0, r5, #0
	movs r1, #1
	bl PrepUnit_DrawPickLeftBar
	b _08094634
_08094482:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080944B0
	ldr r0, _080944A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809449C
	ldr r0, _080944AC @ =0x0000038B
	bl m4aSongNumStart
_0809449C:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08094634
	.align 2, 0
_080944A8: .4byte gPlaySt
_080944AC: .4byte 0x0000038B
_080944B0:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _080944C6
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080944C6
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_080944C6:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _080944EA
	movs r0, #1
	ldrh r1, [r5, #0x2e]
	ands r0, r1
	cmp r0, #0
	bne _080944EA
	ldrh r4, [r5, #0x2e]
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bge _080944EA
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080944EA:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _080944FC
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _080944FC
	strh r0, [r5, #0x2e]
_080944FC:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08094518
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bgt _08094518
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_08094518:
	ldrh r3, [r5, #0x2c]
	ldrh r7, [r5, #0x2e]
	cmp r3, r7
	bne _08094522
	b _08094634
_08094522:
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldr r0, _08094580 @ =PrepUnit_DrawLeftUnitNameCur
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	ldr r0, _08094584 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094548
	ldr r0, _08094588 @ =0x00000385
	bl m4aSongNumStart
_08094548:
	adds r0, r5, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809458C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _08094568
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	subs r1, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_08094568:
	ldrh r7, [r5, #0x2e]
	ldrh r0, [r5, #0x2c]
	cmp r7, r0
	bls _080945B2
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, #6
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	b _080945B2
	.align 2, 0
_08094580: .4byte PrepUnit_DrawLeftUnitNameCur
_08094584: .4byte gPlaySt
_08094588: .4byte 0x00000385
_0809458C:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_080945B2:
	ldrh r7, [r5, #0x2c]
	ldrh r0, [r5, #0x2e]
	cmp r7, r0
	beq _08094634
_080945BA:
	ldrh r2, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r2, r1
	bhs _080945CE
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r3, [r5, #0x30]
	ldrb r0, [r0]
	subs r0, r3, r0
	strh r0, [r5, #0x30]
_080945CE:
	cmp r2, r1
	bls _080945DE
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r7, [r5, #0x30]
	ldrb r0, [r0]
	adds r0, r7, r0
	strh r0, [r5, #0x30]
_080945DE:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08094604
	lsrs r0, r1, #4
	subs r0, #1
	bl PrepUpdateMenuTsaScroll
	ldrh r1, [r5, #0x30]
	lsrs r0, r1, #4
	adds r0, #6
	bl PrepUpdateMenuTsaScroll
	adds r0, r5, #0
	bl sub_809410C
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_08094604:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
_08094634:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809463C
sub_809463C: @ 0x0809463C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	adds r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0809465A
	adds r0, r4, #0
	bl Proc_Break
_0809465A:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809467C
	lsrs r0, r1, #4
	subs r0, #1
	bl PrepUpdateMenuTsaScroll
_0809467C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094684
sub_8094684: @ 0x08094684
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809469C
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
_0809469C:
	ldrh r0, [r4, #0x34]
	subs r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	subs r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080946B4
	adds r0, r4, #0
	bl Proc_Break
_080946B4:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_11
nullsub_11: @ 0x080946CC
	bx lr
	.align 2, 0

	thumb_func_start sub_80946D0
sub_80946D0: @ 0x080946D0
	push {lr}
	bl nullsub_11
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start sub_80946E8
sub_80946E8: @ 0x080946E8
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094714
sub_8094714: @ 0x08094714
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08094768 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809473A
	ldr r0, _0809476C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809473A
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809473A:
	ldr r0, _08094768 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08094760
	ldr r0, _0809476C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809475A
	ldr r0, _08094770 @ =0x00000385
	bl m4aSongNumStart
_0809475A:
	adds r0, r4, #0
	bl Proc_Break
_08094760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094768: .4byte gpKeySt
_0809476C: .4byte gPlaySt
_08094770: .4byte 0x00000385

	thumb_func_start ProcPrepUnit_OnEnd
ProcPrepUnit_OnEnd: @ 0x08094774
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProcPrepUnit_OnGameStart
ProcPrepUnit_OnGameStart: @ 0x080947A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947C0
sub_80947C0: @ 0x080947C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	adds r0, r4, #0
	bl sub_808B468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947E0
sub_80947E0: @ 0x080947E0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl PrepGetLatestUnitIndex
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_080947F4:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08094816
	ldr r0, [r1]
	cmp r0, #0
	beq _08094816
	ldr r0, [r1, #0xc]
	ldr r1, _08094824 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08094816
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08094816:
	adds r5, #1
	cmp r5, #0x3f
	ble _080947F4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094824: .4byte 0x0001000C

	thumb_func_start PrepUnitDisableDisp
PrepUnitDisableDisp: @ 0x08094828
	ldr r2, _08094848 @ =gDispIo
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
	bx lr
	.align 2, 0
_08094848: .4byte gDispIo

	thumb_func_start PrepUnitEnableDisp
PrepUnitEnableDisp: @ 0x0809484C
	ldr r2, _08094868 @ =gDispIo
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
_08094868: .4byte gDispIo

	thumb_func_start sub_809486C
sub_809486C: @ 0x0809486C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8094888
sub_8094888: @ 0x08094888
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl GetLatestUnitIndexInPrepListByUId
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
