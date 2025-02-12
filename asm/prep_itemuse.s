	.include "macro.inc"
	.syntax unified

	thumb_func_start PrepItemUseTryMoveHand
PrepItemUseTryMoveHand: @ 0x0809521C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _08095248 @ =gpKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0809525E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0809524C
	subs r0, #1
	str r0, [r4, #0x30]
	b _0809528A
	.align 2, 0
_08095248: .4byte gpKeySt
_0809524C:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _0809528A
_0809525E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _0809527C
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _0809528A
_0809527C:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	str r6, [r4, #0x30]
_0809528A:
	ldr r0, _080952A0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809529C
	ldr r0, _080952A4 @ =0x00000386
	bl m4aSongNumStart
_0809529C:
	movs r0, #1
	b _080952AA
	.align 2, 0
_080952A0: .4byte gPlaySt
_080952A4: .4byte 0x00000386
_080952A8:
	movs r0, #0
_080952AA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start DrawPrepScreenItemUseStatLabels
DrawPrepScreenItemUseStatLabels: @ 0x080952B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0809530C @ =0x020129A8
	adds r5, r6, #0
	movs r4, #7
_080952C0:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080952C0
	adds r0, r6, #0
	adds r6, #8
	ldr r4, _08095310 @ =gBg2Tm + 0x122
	movs r5, #0
	str r5, [sp]
	ldr r1, _08095314 @ =gUnk_0842CFFC
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _0809531C
	adds r0, r6, #0
	adds r6, #8
	adds r1, r4, #0
	adds r1, #0x80
	str r5, [sp]
	ldr r2, _08095318 @ =gUnk_0842D004
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _08095332
	.align 2, 0
_0809530C: .4byte 0x020129A8
_08095310: .4byte gBg2Tm + 0x122
_08095314: .4byte gUnk_0842CFFC
_08095318: .4byte gUnk_0842D004
_0809531C:
	adds r0, r6, #0
	adds r6, #8
	adds r1, r4, #0
	adds r1, #0x80
	str r2, [sp]
	ldr r2, _08095404 @ =gUnk_0842D00C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_08095332:
	adds r0, r6, #0
	adds r6, #8
	ldr r7, _08095408 @ =gBg2Tm + 0x222
	movs r5, #0
	str r5, [sp]
	ldr r1, _0809540C @ =gUnk_0842D010
	str r1, [sp, #4]
	adds r1, r7, #0
	movs r2, #3
	movs r3, #4
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	ldr r2, _08095410 @ =gUnk_0842D014
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf4
	str r5, [sp]
	ldr r2, _08095414 @ =gUnk_0842D01C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x74
	str r5, [sp]
	ldr r2, _08095418 @ =gUnk_0842D024
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xc
	str r5, [sp]
	ldr r2, _0809541C @ =gUnk_0842D02C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8c
	str r5, [sp]
	ldr r2, _08095420 @ =gUnk_0842D034
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _08095424 @ =0xFFFFFE0A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r1, _08095428 @ =0xFFFFFE02
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	ldr r2, _0809542C @ =0xFFFFFE04
	adds r0, r7, r2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095404: .4byte gUnk_0842D00C
_08095408: .4byte gBg2Tm + 0x222
_0809540C: .4byte gUnk_0842D010
_08095410: .4byte gUnk_0842D014
_08095414: .4byte gUnk_0842D01C
_08095418: .4byte gUnk_0842D024
_0809541C: .4byte gUnk_0842D02C
_08095420: .4byte gUnk_0842D034
_08095424: .4byte 0xFFFFFE0A
_08095428: .4byte 0xFFFFFE02
_0809542C: .4byte 0xFFFFFE04

	thumb_func_start DrawPrepScreenItemUseStatBars
DrawPrepScreenItemUseStatBars: @ 0x08095430
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl ApplyUiStatBarPal
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r2, r0, #3
	movs r0, #0xc0
	ldrb r3, [r5, #0xb]
	ands r0, r3
	cmp r0, #0x80
	beq _08095462
	adds r0, r2, #0
	movs r1, #0x3c
	b _08095466
_08095462:
	adds r0, r1, #0
	movs r1, #5
_08095466:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
_08095538:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _0809557C
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _08095578 @ =gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl PutDrawUiGauge
	b _080955AC
	.align 2, 0
_08095578: .4byte gBg0Tm
_0809557C:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _080955CC @ =gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl PutDrawUiGauge
_080955AC:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble _08095538
	movs r0, #1
	bl EnableBgSync
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080955CC: .4byte gBg0Tm

	thumb_func_start sub_80955D0
sub_80955D0: @ 0x080955D0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080955EC @ =gBg2Tm + 0x12a
	bl GetUnitCurrentHp
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r4, #0xb]
	ands r0, r2
	cmp r0, #0x80
	bne _080955F0
	cmp r1, #0x78
	beq _080955F4
	b _080955F8
	.align 2, 0
_080955EC: .4byte gBg2Tm + 0x12a
_080955F0:
	cmp r1, #0x3c
	bne _080955F8
_080955F4:
	movs r5, #4
	b _080955FA
_080955F8:
	movs r5, #2
_080955FA:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r5, _08095748 @ =gBg2Tm + 0x1aa
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08095622
	movs r6, #4
_08095622:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809564C
	movs r6, #4
_0809564C:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08095678
	movs r6, #4
_08095678:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	subs r7, #0x74
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne _0809569A
	movs r6, #4
_0809569A:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0xc
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _080956C4
	movs r6, #4
_080956C4:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x8c
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _080956EE
	movs r6, #4
_080956EE:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r1, #0x86
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne _08095726
	movs r1, #4
_08095726:
	adds r0, r6, #0
	adds r2, r3, #0
	bl PutNumberOrBlank
	ldr r2, _0809574C @ =0xFFFFFE80
	adds r0, r5, r2
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095748: .4byte gBg2Tm + 0x1aa
_0809574C: .4byte 0xFFFFFE80

	thumb_func_start sub_8095750
sub_8095750: @ 0x08095750
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080957C0 @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _080957EE
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemUseDescId
	adds r4, r0, #0
	ldr r0, _080957C4 @ =gUnk_0842D03C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r4, #0
	beq _080957EE
	adds r0, r6, #0
	adds r1, r5, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _080957CC
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _080957C8 @ =gBg0Tm + 0x39e
	mov r0, sp
	movs r3, #2
	bl PrintStringToTexts
	b _080957EE
	.align 2, 0
_080957C0: .4byte 0x02012A70
_080957C4: .4byte gUnk_0842D03C
_080957C8: .4byte gBg0Tm + 0x39e
_080957CC:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _080957FC @ =gBg0Tm + 0x39e
	mov r0, sp
	movs r3, #2
	bl PrintStringToTexts
_080957EE:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080957FC: .4byte gBg0Tm + 0x39e

	thumb_func_start sub_8095800
sub_8095800: @ 0x08095800
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #2
	bl sub_8026628
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_8095824
sub_8095824: @ 0x08095824
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start sub_8095830
sub_8095830: @ 0x08095830
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _08095B2C @ =gUnk_0842D044
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	ldr r4, _08095B30 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	strb r0, [r4]
	ldr r0, _08095B34 @ =gBgConfig_PrepScreen
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #0xff
	str r0, [r7, #0x34]
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
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r6, [r4, #0xc]
	ands r0, r6
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r2, r3
	strb r2, [r4, #0x14]
	movs r0, #3
	ldrb r5, [r4, #0x18]
	orrs r0, r5
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
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
	ldr r0, _08095B38 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r4, _08095B3C @ =0x02012A20
	movs r6, #4
	mov sl, r6
_08095904:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08095904
	ldr r4, _08095B40 @ =0x020129A8
	movs r2, #7
	mov sl, r2
_08095920:
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r4, #8
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r5, sl
	cmp r5, #0
	bge _08095920
	movs r6, #8
	mov sl, r6
	ldr r0, _08095B40 @ =0x020129A8
	mov r8, r0
	adds r0, #0x40
	movs r1, #7
	bl InitText
	mov r0, r8
	adds r0, #0xc8
	movs r1, #0xf
	bl InitText
	mov r0, r8
	adds r0, #0xd0
	movs r1, #0xf
	bl InitText
	mov r0, r8
	adds r0, #0xd8
	movs r1, #0xc
	bl InitText
	mov r0, r8
	adds r0, #0xe0
	movs r1, #8
	bl InitText
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatLabels
	ldr r0, [r7, #0x2c]
	bl sub_80955D0
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _08095B44 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08095B48 @ =gBg1Tm
	ldr r1, _08095B4C @ =gUnk_0842973C
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
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
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	bl GetStringTextLen
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _08095B50 @ =gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _08095B54 @ =sub_8095800
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r3, _08095B30 @ =gDispIo
	mov ip, r3
	movs r0, #0x20
	ldrb r4, [r3, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x6e
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x92
	strb r0, [r1]
	movs r0, #1
	ldr r5, _08095B58 @ =0x030027C4
	ldrb r1, [r5]
	orrs r1, r0
	movs r6, #2
	orrs r1, r6
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	movs r5, #0x36
	add r5, ip
	mov sb, r5
	ldrb r6, [r5]
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	movs r6, #0x20
	orrs r1, r6
	ldr r2, _08095B58 @ =0x030027C4
	strb r1, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	mov r3, sb
	strb r0, [r3]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r4, [r1]
	orrs r0, r4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	mov r6, sl
	strb r6, [r0]
	ldr r0, _08095B5C @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc0
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl sub_8095750
	mov r1, r8
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _08095B60 @ =gBg0Tm + 0x244
	movs r3, #1
	bl sub_8094AC0
	ldr r1, [r7, #0x30]
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
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl UseUnitSprite
	bl ForceSyncUnitSpriteSheet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095B2C: .4byte gUnk_0842D044
_08095B30: .4byte gDispIo
_08095B34: .4byte gBgConfig_PrepScreen
_08095B38: .4byte 0x06014000
_08095B3C: .4byte 0x02012A20
_08095B40: .4byte 0x020129A8
_08095B44: .4byte 0x00000203
_08095B48: .4byte gBg1Tm
_08095B4C: .4byte gUnk_0842973C
_08095B50: .4byte gBg0Tm
_08095B54: .4byte sub_8095800
_08095B58: .4byte 0x030027C4
_08095B5C: .4byte 0x0000FFE0
_08095B60: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8095B64
sub_8095B64: @ 0x08095B64
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _08095B8C
	ldr r0, _08095B88 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08095C40
	bl CloseHelpBox
	movs r0, #0xff
	b _08095C88
	.align 2, 0
_08095B88: .4byte gpKeySt
_08095B8C:
	ldr r0, _08095BEC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08095C6C
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08095C14
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _08095BF8
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl SetUiCursorHandConfig
	str r5, [r4, #0x3c]
	ldr r0, _08095BF0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095BE2
	ldr r0, _08095BF4 @ =0x0000038A
	bl m4aSongNumStart
_08095BE2:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08095C8A
	.align 2, 0
_08095BEC: .4byte gpKeySt
_08095BF0: .4byte gPlaySt
_08095BF4: .4byte 0x0000038A
_08095BF8:
	ldr r0, _08095C10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095C8A
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08095C8A
	.align 2, 0
_08095C10: .4byte gPlaySt
_08095C14:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095C40
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	ldr r0, _08095C38 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095C8A
	ldr r0, _08095C3C @ =0x0000038B
	bl m4aSongNumStart
	b _08095C8A
	.align 2, 0
_08095C38: .4byte gPlaySt
_08095C3C: .4byte 0x0000038B
_08095C40:
	adds r0, r4, #0
	bl PrepItemUseTryMoveHand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095C8A
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_8095750
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _08095C8A
_08095C6C:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08095C8A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_08095C88:
	str r0, [r4, #0x38]
_08095C8A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8095C90
sub_8095C90: @ 0x08095C90
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8095CA8
sub_8095CA8: @ 0x08095CA8
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _08095D08 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r4, #8
	ldr r5, _08095D0C @ =gBg2Tm + 0x364
	movs r6, #0
	str r6, [sp]
	ldr r1, _08095D10 @ =gUnk_0842D064
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	bl ClearText
	adds r5, #0x82
	str r6, [sp]
	ldr r0, _08095D14 @ =gUnk_0842D07C
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	str r6, [sp]
	ldr r0, _08095D18 @ =gUnk_0842D084
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095D08: .4byte 0x02012A80
_08095D0C: .4byte gBg2Tm + 0x364
_08095D10: .4byte gUnk_0842D064
_08095D14: .4byte gUnk_0842D07C
_08095D18: .4byte gUnk_0842D084

	thumb_func_start sub_8095D1C
sub_8095D1C: @ 0x08095D1C
	push {lr}
	ldr r0, _08095D34 @ =gBg2Tm + 0x364
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08095D34: .4byte gBg2Tm + 0x364

	thumb_func_start sub_8095D38
sub_8095D38: @ 0x08095D38
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8095CA8
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8095D58
sub_8095D58: @ 0x08095D58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _08095DB0 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x64
	movs r2, #0xb
	movs r3, #4
	bl PrepItemDrawPopupBox
	ldr r5, _08095DB4 @ =gpKeySt
	ldr r1, [r5]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08095DC0
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	bl DisableUiCursorHand
	bl sub_8095D1C
	ldr r0, _08095DB8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E26
	ldr r0, _08095DBC @ =0x0000038B
	bl m4aSongNumStart
	b _08095E26
	.align 2, 0
_08095DB0: .4byte 0x0000A580
_08095DB4: .4byte gpKeySt
_08095DB8: .4byte gPlaySt
_08095DBC: .4byte 0x0000038B
_08095DC0:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r3
	cmp r2, #0
	beq _08095E38
	bl sub_8095D1C
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _08095DFC
	bl HideSysHandCursor
	ldr r0, _08095DF4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095DEA
	ldr r0, _08095DF8 @ =0x0000038A
	bl m4aSongNumStart
_08095DEA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08095E7A
	.align 2, 0
_08095DF4: .4byte gPlaySt
_08095DF8: .4byte 0x0000038A
_08095DFC:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08095E30 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E20
	ldr r0, _08095E34 @ =0x0000038B
	bl m4aSongNumStart
_08095E20:
	movs r0, #0
	bl DisableUiCursorHand
_08095E26:
	adds r0, r4, #0
	bl Proc_Break
	b _08095E7A
	.align 2, 0
_08095E30: .4byte gPlaySt
_08095E34: .4byte 0x0000038B
_08095E38:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095E44
	str r2, [r4, #0x3c]
_08095E44:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095E52
	str r6, [r4, #0x3c]
_08095E52:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _08095E7A
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	ldr r0, _08095E84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E7A
	ldr r0, _08095E88 @ =0x00000387
	bl m4aSongNumStart
_08095E7A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095E84: .4byte gPlaySt
_08095E88: .4byte 0x00000387

	thumb_func_start PrepItemUse_HandleItemEffect
PrepItemUse_HandleItemEffect: @ 0x08095E8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemIndex
	subs r0, #0x63
	cmp r0, #0x33
	bhi _08095F9E
	lsls r0, r0, #2
	ldr r1, _08095EB0 @ =_08095EB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08095EB0: .4byte _08095EB4
_08095EB4: @ jump table
	.4byte _08095F84 @ case 0
	.4byte _08095F84 @ case 1
	.4byte _08095F84 @ case 2
	.4byte _08095F84 @ case 3
	.4byte _08095F84 @ case 4
	.4byte _08095F9E @ case 5
	.4byte _08095F9E @ case 6
	.4byte _08095F9E @ case 7
	.4byte _08095F9E @ case 8
	.4byte _08095F9E @ case 9
	.4byte _08095F9E @ case 10
	.4byte _08095F9E @ case 11
	.4byte _08095F9E @ case 12
	.4byte _08095F9E @ case 13
	.4byte _08095F9E @ case 14
	.4byte _08095F9E @ case 15
	.4byte _08095F9E @ case 16
	.4byte _08095F9E @ case 17
	.4byte _08095F9E @ case 18
	.4byte _08095F9E @ case 19
	.4byte _08095F9E @ case 20
	.4byte _08095F9E @ case 21
	.4byte _08095F9E @ case 22
	.4byte _08095F9E @ case 23
	.4byte _08095F9E @ case 24
	.4byte _08095F9E @ case 25
	.4byte _08095F9E @ case 26
	.4byte _08095F9E @ case 27
	.4byte _08095F9E @ case 28
	.4byte _08095F9E @ case 29
	.4byte _08095F9E @ case 30
	.4byte _08095F9E @ case 31
	.4byte _08095F9E @ case 32
	.4byte _08095F9E @ case 33
	.4byte _08095F9E @ case 34
	.4byte _08095F9E @ case 35
	.4byte _08095F84 @ case 36
	.4byte _08095F9E @ case 37
	.4byte _08095F84 @ case 38
	.4byte _08095F9E @ case 39
	.4byte _08095F84 @ case 40
	.4byte _08095F9E @ case 41
	.4byte _08095F9E @ case 42
	.4byte _08095F9E @ case 43
	.4byte _08095F9E @ case 44
	.4byte _08095F9E @ case 45
	.4byte _08095F9E @ case 46
	.4byte _08095F9E @ case 47
	.4byte _08095F9E @ case 48
	.4byte _08095F9E @ case 49
	.4byte _08095F9E @ case 50
	.4byte _08095F84 @ case 51
_08095F84:
	ldr r0, _08095FA4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095F96
	ldr r0, _08095FA8 @ =0x0000038A
	bl m4aSongNumStart
_08095F96:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08095F9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095FA4: .4byte gPlaySt
_08095FA8: .4byte 0x0000038A

	thumb_func_start PrepItemUse_ExecPromotionItem
PrepItemUse_ExecPromotionItem: @ 0x08095FAC
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground_
	bl ResetText
	movs r0, #0
	bl InitBgs
	bl EndGreenText
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl InitFaces
	bl EndHelpPromptSprite
	ldr r3, _08096050 @ =gDispIo
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
	adds r1, #6
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	bl EndSysBrownBox
	bl EndAllParallelWorkers
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl DisableUiCursorHand
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	movs r2, #0
	bl sub_802D06C
	ldr r1, _08096054 @ =gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096050: .4byte gDispIo
_08096054: .4byte gBattleStats

	thumb_func_start PrepItemUse_WaitPromotionDone
PrepItemUse_WaitPromotionDone: @ 0x08096058
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _08096070
	adds r0, r4, #0
	bl Proc_Break
_08096070:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemUse_PostPromotion
PrepItemUse_PostPromotion: @ 0x08096078
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _08096092
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080960A2
_08096092:
	ldr r0, [r4, #0x30]
	cmp r0, r1
	blt _0809609C
	subs r0, #1
	str r0, [r4, #0x30]
_0809609C:
	adds r0, r4, #0
	bl Proc_Break
_080960A2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepItemUse_ResetBgmAfterPromo
PrepItemUse_ResetBgmAfterPromo: @ 0x080960A8
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_80960C4
sub_80960C4: @ 0x080960C4
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepItemUseScreen
StartPrepItemUseScreen: @ 0x080960E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080960F4 @ =ProcScr_PrepItemUseScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080960F4: .4byte ProcScr_PrepItemUseScreen
