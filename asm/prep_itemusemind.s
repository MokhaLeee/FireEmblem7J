	.include "macro.inc"
	.syntax unified

	thumb_func_start PrepItemUseBooster_OnDraw
PrepItemUseBooster_OnDraw: @ 0x080960F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl DecodeMsg
	mov sb, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, sb
	bl GetStringTextLen
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _08096144
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _080961B0 @ =gBg2Tm
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
_08096144:
	ldr r4, _080961B4 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _08096156
	adds r0, #2
_08096156:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080961B0 @ =gBg2Tm
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge _0809618A
	adds r0, #7
_0809618A:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq _0809619A
	adds r0, r1, #3
	str r0, [r6, #0x48]
_0809619A:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080961B0: .4byte gBg2Tm
_080961B4: .4byte 0x02012A80

	thumb_func_start PrepItemUseBooster_OnInit
PrepItemUseBooster_OnInit: @ 0x080961B8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_8074C70
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x37
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802D1E8
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl sub_80955D0
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl PrepItemUseBooster_OnDraw
	movs r4, #0
_080962D4:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08096302
	asrs r1, r4, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0xb8
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x32
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_8074F40
_08096302:
	adds r4, #1
	cmp r4, #7
	ble _080962D4
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _08096328 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809631E
	ldr r0, _0809632C @ =0x0000037A
	bl m4aSongNumStart
_0809631E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096328: .4byte gPlaySt
_0809632C: .4byte 0x0000037A

	thumb_func_start PrepItemUseBooster_IDLE
PrepItemUseBooster_IDLE: @ 0x08096330
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _0809636C @ =0x0000A580
	str r4, [sp]
	bl PrepItemDrawPopupBox
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809635E
	ldr r0, _08096370 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096364
_0809635E:
	adds r0, r5, #0
	bl Proc_Break
_08096364:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809636C: .4byte 0x0000A580
_08096370: .4byte gpKeySt

	thumb_func_start PrepItemUseBooster_OnEnd
PrepItemUseBooster_OnEnd: @ 0x08096374
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809639C @ =gBg2Tm + 0x3a2
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r5, #0
	bne _080963A0
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080963BC
	.align 2, 0
_0809639C: .4byte gBg2Tm + 0x3a2
_080963A0:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _080963AA
	subs r0, #1
	str r0, [r4, #0x30]
_080963AA:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_080963BC:
	ldr r0, _080963F0 @ =gBg0Tm + 0x244
	ldr r1, _080963F4 @ =0x02012A20
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_8094AC0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_8095750
	movs r0, #0
	bl sub_80A998C
	bl sub_8074D38
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080963F8 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080963F0: .4byte gBg0Tm + 0x244
_080963F4: .4byte 0x02012A20
_080963F8: .4byte 0x06014000
