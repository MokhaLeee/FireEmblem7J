	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80219B8
sub_80219B8: @ 0x080219B8
	movs r0, #0x17
	bx lr

	thumb_func_start MapMenu_Suspend_Available
MapMenu_Suspend_Available: @ 0x080219BC
	ldr r1, _080219CC @ =gPlaySt
	movs r0, #8
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080219D0
	movs r0, #1
	b _080219D2
	.align 2, 0
_080219CC: .4byte gPlaySt
_080219D0:
	movs r0, #2
_080219D2:
	bx lr

	thumb_func_start sub_80219D4
sub_80219D4: @ 0x080219D4
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080219E6
	bl sub_80B3D4C
	movs r0, #0x17
	b _080219EE
_080219E6:
	ldr r1, _080219F4 @ =0x00000717
	bl sub_804B210
	movs r0, #8
_080219EE:
	pop {r1}
	bx r1
	.align 2, 0
_080219F4: .4byte 0x00000717

	thumb_func_start sub_80219F8
sub_80219F8: @ 0x080219F8
	push {lr}
	ldr r0, _08021A08 @ =gUnk_08C02630
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021A08: .4byte gUnk_08C02630

	thumb_func_start sub_8021A0C
sub_8021A0C: @ 0x08021A0C
	push {lr}
	ldr r0, _08021A24 @ =gUnk_08C02630
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	bl sub_808B450
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021A24: .4byte gUnk_08C02630

	thumb_func_start sub_8021A28
sub_8021A28: @ 0x08021A28
	push {lr}
	ldr r0, _08021A38 @ =gUnk_08DAF408
	movs r1, #3
	bl Proc_Start
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021A38: .4byte gUnk_08DAF408

	thumb_func_start sub_8021A3C
sub_8021A3C: @ 0x08021A3C
	push {lr}
	movs r0, #0
	bl sub_8087B48
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021A4C
sub_8021A4C: @ 0x08021A4C
	push {lr}
	ldr r0, _08021A6C @ =gActiveUnit
	movs r1, #0
	str r1, [r0]
	ldr r0, _08021A70 @ =gBmSt
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, _08021A74 @ =gUnk_08C02630
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021A6C: .4byte gActiveUnit
_08021A70: .4byte gBmSt
_08021A74: .4byte gUnk_08C02630

	thumb_func_start sub_8021A78
sub_8021A78: @ 0x08021A78
	push {lr}
	movs r0, #3
	bl sub_80A5AF8
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021A88
sub_8021A88: @ 0x08021A88
	movs r0, #0x17
	bx lr

	thumb_func_start sub_8021A8C
sub_8021A8C: @ 0x08021A8C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009E60
	cmp r0, #1
	beq _08021AA0
	adds r0, r4, #0
	movs r1, #0x63
	bl sub_800D384
_08021AA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021AA8
sub_8021AA8: @ 0x08021AA8
	push {lr}
	ldr r0, _08021AB8 @ =gUnk_08C03060
	bl StartEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021AB8: .4byte gUnk_08C03060

	thumb_func_start sub_8021ABC
sub_8021ABC: @ 0x08021ABC
	ldr r1, _08021AC8 @ =gActionSt
	movs r0, #1
	strb r0, [r1, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021AC8: .4byte gActionSt

	thumb_func_start sub_8021ACC
sub_8021ACC: @ 0x08021ACC
	push {lr}
	bl sub_804B6DC
	ldr r0, _08021B18 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	bl sub_801D6D8
	ldr r0, _08021B1C @ =gUnk_08C04D68
	ldr r2, _08021B20 @ =gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_804B2DC
	ldr r1, _08021B24 @ =gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_801615C
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_08021B18: .4byte gBg2Tm
_08021B1C: .4byte gUnk_08C04D68
_08021B20: .4byte gBmSt
_08021B24: .4byte gActiveUnit

	thumb_func_start sub_8021B28
sub_8021B28: @ 0x08021B28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08021B80 @ =gActiveUnit
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80161EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021B7A
	ldr r0, [r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r0, _08021B84 @ =ProcScr_CamMove
	bl Proc_EndEach
	lsls r0, r4, #4
	bl sub_8015D54
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08021B88 @ =gBmSt
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _08021B6C
	ldrh r2, [r2, #0x2a]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	adds r4, r0, #2
_08021B6C:
	ldr r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_801615C
_08021B7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021B80: .4byte gActiveUnit
_08021B84: .4byte ProcScr_CamMove
_08021B88: .4byte gBmSt

	thumb_func_start sub_8021B8C
sub_8021B8C: @ 0x08021B8C
	push {lr}
	ldr r0, _08021BA8 @ =gUnk_08C04D68
	ldr r2, _08021BAC @ =gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_804B2DC
	pop {r0}
	bx r0
	.align 2, 0
_08021BA8: .4byte gUnk_08C04D68
_08021BAC: .4byte gBmSt

	thumb_func_start sub_8021BB0
sub_8021BB0: @ 0x08021BB0
	push {lr}
	bl sub_804B6DC
	ldr r0, _08021BDC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl sub_801D6D8
	bl ResetTextFont
	ldr r0, _08021BE0 @ =gUnk_08C03098
	movs r1, #3
	bl Proc_Start
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_08021BDC: .4byte gBg2Tm
_08021BE0: .4byte gUnk_08C03098

	thumb_func_start sub_8021BE4
sub_8021BE4: @ 0x08021BE4
	push {lr}
	ldr r0, _08021C18 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	ldr r0, _08021C1C @ =gUnk_08C04D68
	ldr r2, _08021C20 @ =gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_804B2DC
	bl sub_801D6D8
	movs r0, #0x3b
	pop {r1}
	bx r1
	.align 2, 0
_08021C18: .4byte gBg2Tm
_08021C1C: .4byte gUnk_08C04D68
_08021C20: .4byte gBmSt

	thumb_func_start sub_8021C24
sub_8021C24: @ 0x08021C24
	movs r0, #0
	bx lr

	thumb_func_start sub_8021C28
sub_8021C28: @ 0x08021C28
	push {lr}
	ldr r0, _08021C54 @ =gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021C58
	movs r0, #0x81
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	bne _08021C58
	adds r0, r2, #0
	bl sub_80242C4
	bl sub_804B950
	cmp r0, #0
	beq _08021C58
	movs r0, #1
	b _08021C5A
	.align 2, 0
_08021C54: .4byte gActiveUnit
_08021C58:
	movs r0, #3
_08021C5A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021C60
sub_8021C60: @ 0x08021C60
	push {lr}
	ldr r0, _08021C78 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_80242C4
	ldr r0, _08021C7C @ =gUnk_08C04FD4
	bl sub_804B664
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021C78: .4byte gActiveUnit
_08021C7C: .4byte gUnk_08C04FD4

	thumb_func_start sub_8021C80
sub_8021C80: @ 0x08021C80
	ldr r2, _08021C90 @ =gActionSt
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #7
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021C90: .4byte gActionSt

	thumb_func_start sub_8021C94
sub_8021C94: @ 0x08021C94
	push {lr}
	ldr r0, _08021CC0 @ =gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021CC4
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08021CC4
	adds r0, r2, #0
	bl sub_8024350
	bl sub_804B950
	cmp r0, #0
	beq _08021CC4
	movs r0, #1
	b _08021CC6
	.align 2, 0
_08021CC0: .4byte gActiveUnit
_08021CC4:
	movs r0, #3
_08021CC6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021CCC
sub_8021CCC: @ 0x08021CCC
	push {lr}
	ldr r0, _08021CE4 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_8024350
	ldr r0, _08021CE8 @ =gUnk_08C04FB4
	bl sub_804B664
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021CE4: .4byte gActiveUnit
_08021CE8: .4byte gUnk_08C04FB4

	thumb_func_start sub_8021CEC
sub_8021CEC: @ 0x08021CEC
	ldr r2, _08021D08 @ =gActionSt
	movs r0, #8
	strb r0, [r2, #0x11]
	ldr r0, _08021D0C @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	strb r0, [r2, #0xd]
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021D08: .4byte gActionSt
_08021D0C: .4byte gActiveUnit

	thumb_func_start sub_8021D10
sub_8021D10: @ 0x08021D10
	push {lr}
	ldr r0, _08021D48 @ =gActiveUnit
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08021D50
	ldr r1, _08021D4C @ =gBmSt
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021D50
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _08021D50
	adds r0, r3, #0
	bl sub_80243F0
	bl sub_804B950
	cmp r0, #0
	beq _08021D50
	movs r0, #1
	b _08021D52
	.align 2, 0
_08021D48: .4byte gActiveUnit
_08021D4C: .4byte gBmSt
_08021D50:
	movs r0, #3
_08021D52:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021D58
sub_8021D58: @ 0x08021D58
	push {lr}
	ldr r0, _08021D70 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_80243F0
	ldr r0, _08021D74 @ =gUnk_08C04F94
	bl sub_804B664
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021D70: .4byte gActiveUnit
_08021D74: .4byte gUnk_08C04F94

	thumb_func_start sub_8021D78
sub_8021D78: @ 0x08021D78
	push {lr}
	ldr r0, _08021DB0 @ =gActiveUnit
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08021DB8
	ldr r1, _08021DB4 @ =gBmSt
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021DB8
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _08021DB8
	adds r0, r3, #0
	bl sub_80244A4
	bl sub_804B950
	cmp r0, #0
	beq _08021DB8
	movs r0, #1
	b _08021DBA
	.align 2, 0
_08021DB0: .4byte gActiveUnit
_08021DB4: .4byte gBmSt
_08021DB8:
	movs r0, #3
_08021DBA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021DC0
sub_8021DC0: @ 0x08021DC0
	push {lr}
	ldr r0, _08021DD8 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_80244A4
	ldr r0, _08021DDC @ =gUnk_08C04F74
	bl sub_804B664
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021DD8: .4byte gActiveUnit
_08021DDC: .4byte gUnk_08C04F74

	thumb_func_start sub_8021DE0
sub_8021DE0: @ 0x08021DE0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl sub_8032CCC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_801D8D4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8021E14
sub_8021E14: @ 0x08021E14
	push {r4, r5, lr}
	ldr r4, _08021E60 @ =gActionSt
	movs r0, #9
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8021DE0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021E60: .4byte gActionSt

	thumb_func_start sub_8021E64
sub_8021E64: @ 0x08021E64
	push {r4, r5, lr}
	ldr r4, _08021EB0 @ =gActionSt
	movs r0, #0xa
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8021DE0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021EB0: .4byte gActionSt

	thumb_func_start sub_8021EB4
sub_8021EB4: @ 0x08021EB4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08021ED4
	ldr r1, _08021ED0 @ =0x0000070C
	adds r0, r5, #0
	bl sub_804B210
	movs r0, #8
	b _08021F08
	.align 2, 0
_08021ED0: .4byte 0x0000070C
_08021ED4:
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _08021EF8 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08021EFC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8021F5C
	b _08021F04
	.align 2, 0
_08021EF8: .4byte gActiveUnit
_08021EFC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8021F10
_08021F04:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08021F08:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021F10
sub_8021F10: @ 0x08021F10
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021F54 @ =gUnk_08C04D20
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021F58 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E2A0
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021F54: .4byte gUnk_08C04D20
_08021F58: .4byte gActiveUnit

	thumb_func_start sub_8021F5C
sub_8021F5C: @ 0x08021F5C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021FA4 @ =gUnk_08C04D44
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021FA8 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E2A0
	bl sub_8079888
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021FA4: .4byte gUnk_08C04D44
_08021FA8: .4byte gActiveUnit

	thumb_func_start sub_8021FAC
sub_8021FAC: @ 0x08021FAC
	push {r4, r5, lr}
	ldr r0, _08021FE8 @ =gBmMapMovement
	ldr r0, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl BmMapFillg
	ldr r0, _08021FEC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08021FF0 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08021FF4
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #1
	movs r3, #0xa
	bl MapAddInBoundedRange
	b _08022004
	.align 2, 0
_08021FE8: .4byte gBmMapMovement
_08021FEC: .4byte 0x0202E3E4
_08021FF0: .4byte gActiveUnit
_08021FF4:
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_8017310
	adds r1, r0, #0
	ldr r0, [r4]
	bl sub_801B040
_08022004:
	movs r0, #3
	bl sub_801D6A4
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8022014
sub_8022014: @ 0x08022014
	push {lr}
	bl sub_801D6D8
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8022020
sub_8022020: @ 0x08022020
	push {r4, r5, lr}
	ldr r5, _08022060 @ =gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022064
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022064
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_80240E4
	bl sub_804B950
	cmp r0, #0
	beq _08022064
	movs r0, #1
	b _08022066
	.align 2, 0
_08022060: .4byte gActiveUnit
_08022064:
	movs r0, #3
_08022066:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_802206C
sub_802206C: @ 0x0802206C
	push {r4, lr}
	ldr r4, _080220A4 @ =gActiveUnit
	ldr r0, [r4]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r1, _080220A8 @ =gActionSt
	movs r0, #0
	strb r0, [r1, #0x12]
	bl ClearUi
	ldr r0, [r4]
	ldrh r1, [r0, #0x1e]
	bl sub_80240E4
	ldr r0, _080220AC @ =gUnk_08C04F54
	bl sub_804B664
	bl sub_807988C
	movs r0, #0x27
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080220A4: .4byte gActiveUnit
_080220A8: .4byte gActionSt
_080220AC: .4byte gUnk_08C04F54

	thumb_func_start sub_80220B0
sub_80220B0: @ 0x080220B0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _080220F8 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _080220FC @ =gBg0Tm
	adds r3, r3, r1
	adds r1, r4, #0
	bl sub_80168EC
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080220F8: .4byte gActiveUnit
_080220FC: .4byte gBg0Tm

	thumb_func_start sub_8022100
sub_8022100: @ 0x08022100
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl sub_801E364
	ldr r0, _08022148 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _0802214C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08022150 @ =gActiveUnit
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl sub_8017310
	adds r1, r0, #0
	ldr r0, [r4]
	bl sub_801B040
	movs r0, #2
	bl sub_801D6A4
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022148: .4byte gBmMapMovement
_0802214C: .4byte 0x0202E3E4
_08022150: .4byte gActiveUnit

	thumb_func_start sub_8022154
sub_8022154: @ 0x08022154
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08022166
	bl sub_801D6D8
_08022166:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_802216C
sub_802216C: @ 0x0802216C
	push {lr}
	ldr r2, _08022198 @ =gActionSt
	movs r0, #2
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802218C
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	ldrb r0, [r1, #3]
	strb r0, [r2, #0x15]
_0802218C:
	ldr r0, _0802219C @ =gUnk_08C06030
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022198: .4byte gActionSt
_0802219C: .4byte gUnk_08C06030

	thumb_func_start sub_80221A0
sub_80221A0: @ 0x080221A0
	push {lr}
	ldr r0, _080221B8 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl sub_801615C
	pop {r0}
	bx r0
	.align 2, 0
_080221B8: .4byte gActiveUnit

	thumb_func_start sub_80221BC
sub_80221BC: @ 0x080221BC
	push {lr}
	movs r0, #0
	movs r1, #0
	bl sub_8021EB4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80221CC
sub_80221CC: @ 0x080221CC
	push {lr}
	ldr r0, _080221DC @ =gUnk_08C030C8
	movs r1, #3
	bl Proc_Start
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_080221DC: .4byte gUnk_08C030C8

	thumb_func_start sub_80221E0
sub_80221E0: @ 0x080221E0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08022216
	ldr r1, _08022234 @ =gActionSt
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
	bl InitObstacleBattleUnit
_08022216:
	ldr r1, _08022234 @ =gActionSt
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _0802223C
	ldr r0, _08022238 @ =gActiveUnit
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	adds r1, r5, #0
	bl BattleGenerateBallistaSimulation
	b _08022250
	.align 2, 0
_08022234: .4byte gActionSt
_08022238: .4byte gActiveUnit
_0802223C:
	ldr r0, _08022260 @ =gActiveUnit
	ldr r0, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	ldrb r1, [r1, #0x12]
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r3, #0
	bl BattleGenerateSimulation
_08022250:
	bl sub_803463C
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022260: .4byte gActiveUnit

	thumb_func_start sub_8022264
sub_8022264: @ 0x08022264
	push {lr}
	ldr r0, _08022284 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl sub_801D6D8
	bl sub_8034664
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08022284: .4byte gBg2Tm

	thumb_func_start sub_8022288
sub_8022288: @ 0x08022288
	push {lr}
	ldr r0, _080222CC @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080222D4
	ldr r1, _080222D0 @ =gBmSt
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080222D4
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080222D4
	adds r0, r2, #0
	bl sub_80241F0
	bl sub_804B950
	cmp r0, #0
	beq _080222D4
	movs r0, #1
	b _080222D6
	.align 2, 0
_080222CC: .4byte gActiveUnit
_080222D0: .4byte gBmSt
_080222D4:
	movs r0, #3
_080222D6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80222DC
sub_80222DC: @ 0x080222DC
	push {lr}
	bl ClearUi
	ldr r0, _080222F8 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_80241F0
	ldr r0, _080222FC @ =gUnk_08C04F34
	bl sub_804B664
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080222F8: .4byte gActiveUnit
_080222FC: .4byte gUnk_08C04F34

	thumb_func_start sub_8022300
sub_8022300: @ 0x08022300
	push {r4, lr}
	ldr r2, _08022328 @ =gActionSt
	movs r0, #0x1a
	strb r0, [r2, #0x11]
	ldr r0, _0802232C @ =gActiveUnit
	ldr r4, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_802BB28
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022328: .4byte gActionSt
_0802232C: .4byte gActiveUnit

	thumb_func_start sub_8022330
sub_8022330: @ 0x08022330
	push {r4, lr}
	ldr r4, _08022350 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802234C
	adds r0, r2, #0
	bl sub_8034D5C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022354
_0802234C:
	movs r0, #3
	b _0802236E
	.align 2, 0
_08022350: .4byte gActiveUnit
_08022354:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	movs r1, #3
	cmp r0, #0xf
	bne _0802236C
	movs r1, #1
_0802236C:
	adds r0, r1, #0
_0802236E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8022374
sub_8022374: @ 0x08022374
	ldr r1, _0802238C @ =gActionSt
	movs r0, #0xf
	strb r0, [r1, #0x11]
	ldr r0, _08022390 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x17
	bx lr
	.align 2, 0
_0802238C: .4byte gActionSt
_08022390: .4byte gActiveUnit

	thumb_func_start sub_8022394
sub_8022394: @ 0x08022394
	push {r4, lr}
	ldr r0, _080223E4 @ =gActiveUnit
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	movs r2, #0x40
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	bne _080223E0
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	ldr r1, _080223E8 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080223CC
	cmp r0, #5
	beq _080223CC
	cmp r0, #0x38
	beq _080223CC
	cmp r0, #0x37
	bne _080223E0
_080223CC:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0xe
	beq _080223EC
_080223E0:
	movs r0, #3
	b _080223FE
	.align 2, 0
_080223E4: .4byte gActiveUnit
_080223E8: .4byte gBmMapTerrain
_080223EC:
	ldr r0, [r4]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080223FC
	movs r0, #1
	b _080223FE
_080223FC:
	movs r0, #2
_080223FE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8022404
sub_8022404: @ 0x08022404
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _0802241C
	ldr r1, _08022418 @ =gActionSt
	movs r0, #0xe
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _08022426
	.align 2, 0
_08022418: .4byte gActionSt
_0802241C:
	movs r1, #0xe0
	lsls r1, r1, #3
	bl sub_804B210
	movs r0, #8
_08022426:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802242C
sub_802242C: @ 0x0802242C
	push {r4, r5, r6, lr}
	ldr r6, _08022450 @ =gActiveUnit
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802248A
	adds r0, r2, #0
	bl sub_8024904
	bl sub_804B950
	cmp r0, #0
	beq _08022454
_0802244A:
	movs r0, #1
	b _0802248C
	.align 2, 0
_08022450: .4byte gActiveUnit
_08022454:
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _0802248A
_0802245E:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08022476
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802244A
_08022476:
	adds r5, #1
	cmp r5, #4
	bgt _0802248A
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0802245E
_0802248A:
	movs r0, #3
_0802248C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8022494
sub_8022494: @ 0x08022494
	push {lr}
	adds r3, r0, #0
	ldr r0, _080224C0 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080224C8
	ldr r1, _080224C4 @ =gBmSt
	movs r0, #0x9e
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_802242C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080224CA
	.align 2, 0
_080224C0: .4byte gActiveUnit
_080224C4: .4byte gBmSt
_080224C8:
	movs r0, #3
_080224CA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80224D0
sub_80224D0: @ 0x080224D0
	push {lr}
	adds r3, r0, #0
	ldr r0, _080224FC @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08022504
	ldr r1, _08022500 @ =gBmSt
	movs r0, #0x9d
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_802242C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022506
	.align 2, 0
_080224FC: .4byte gActiveUnit
_08022500: .4byte gBmSt
_08022504:
	movs r0, #3
_08022506:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802250C
sub_802250C: @ 0x0802250C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	mov sl, r1
	movs r7, #0
	ldr r6, _08022584 @ =gActiveUnit
	ldr r0, [r6]
	bl sub_8024904
	bl sub_804B950
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _0802256A
_0802253C:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08022556
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022556
	movs r7, #1
_08022556:
	adds r5, #1
	cmp r5, #4
	bgt _0802256A
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0802253C
_0802256A:
	mov r0, r8
	cmp r0, #0
	beq _08022588
	cmp r7, #0
	bne _08022588
	mov r0, sb
	mov r1, sl
	bl sub_8023B4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080225C8
	.align 2, 0
_08022584: .4byte gActiveUnit
_08022588:
	ldr r0, _080225D8 @ =gUnk_08C04CB4
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080225DC @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E2A0
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0x17
_080225C8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080225D8: .4byte gUnk_08C04CB4
_080225DC: .4byte gActiveUnit

	thumb_func_start sub_80225E0
sub_80225E0: @ 0x080225E0
	ldr r2, _080225F0 @ =gActionSt
	movs r0, #4
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_080225F0: .4byte gActionSt

	thumb_func_start sub_80225F4
sub_80225F4: @ 0x080225F4
	ldr r0, _0802260C @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022610
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	beq _08022610
	movs r0, #1
	b _08022612
	.align 2, 0
_0802260C: .4byte gActiveUnit
_08022610:
	movs r0, #3
_08022612:
	bx lr

	thumb_func_start sub_8022614
sub_8022614: @ 0x08022614
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _08022670
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ResetTextFont
	ldr r0, _08022668 @ =gUnk_08C04CFC
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _0802266C @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E2A0
	movs r0, #0x17
	b _08022672
	.align 2, 0
_08022668: .4byte gUnk_08C04CFC
_0802266C: .4byte gActiveUnit
_08022670:
	movs r0, #0
_08022672:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802267C
sub_802267C: @ 0x0802267C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r7, _080226B4 @ =gActiveUnit
	ldr r1, [r7]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080226B8
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80220B0
	movs r0, #0
	b _080226F8
	.align 2, 0
_080226B4: .4byte gActiveUnit
_080226B8:
	adds r0, r5, #0
	bl GetItemType
	cmp r0, #0xc
	bne _080226C6
	movs r2, #0
	b _080226D2
_080226C6:
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080226D2:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r4, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08022700 @ =gBg0Tm
	adds r3, r3, r1
	adds r1, r5, #0
	bl sub_80168EC
	movs r0, #1
	bl EnableBgSync
_080226F8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022700: .4byte gBg0Tm

	thumb_func_start sub_8022704
sub_8022704: @ 0x08022704
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r7, _08022720 @ =gActiveUnit
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08022724
	movs r0, #3
	b _0802274E
	.align 2, 0
_08022720: .4byte gActiveUnit
_08022724:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0802273A
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8022020
_0802273A:
	ldr r0, [r7]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0802274C
	movs r1, #1
_0802274C:
	adds r0, r1, #0
_0802274E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8022754
sub_8022754: @ 0x08022754
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _080227AC @ =gActionSt
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x2a]
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080227B0 @ =0xFFFFFF00
	ands r5, r2
	orrs r5, r0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _080227B4 @ =0xFFFF00FF
	ands r5, r1
	orrs r5, r0
	ldr r0, _080227B8 @ =0xFF00FFFF
	ands r5, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r5, r0
	ldr r0, _080227BC @ =0x00FFFFFF
	ands r5, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	bl sub_80227D8
	ldr r0, _080227C0 @ =gUnk_08C04C90
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	movs r0, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080227AC: .4byte gActionSt
_080227B0: .4byte 0xFFFFFF00
_080227B4: .4byte 0xFFFF00FF
_080227B8: .4byte 0xFF00FFFF
_080227BC: .4byte 0x00FFFFFF
_080227C0: .4byte gUnk_08C04C90

	thumb_func_start sub_80227C4
sub_80227C4: @ 0x080227C4
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_801E364
	pop {r1}
	bx r1

	thumb_func_start nullsub_18
nullsub_18: @ 0x080227D4
	bx lr
	.align 2, 0

	thumb_func_start sub_80227D8
sub_80227D8: @ 0x080227D8
	push {lr}
	ldr r0, _08022804 @ =0x02002774
	ldr r1, _08022808 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl InitTextFont
	ldr r0, _0802280C @ =gBg0Tm + 0x56
	ldr r1, _08022810 @ =gUiTmScratchA
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _08022814 @ =gBg1Tm + 0x56
	ldr r1, _08022818 @ =gUiTmScratchB
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	pop {r0}
	bx r0
	.align 2, 0
_08022804: .4byte 0x02002774
_08022808: .4byte 0x06004000
_0802280C: .4byte gBg0Tm + 0x56
_08022810: .4byte gUiTmScratchA
_08022814: .4byte gBg1Tm + 0x56
_08022818: .4byte gUiTmScratchB

	thumb_func_start sub_802281C
sub_802281C: @ 0x0802281C
	push {lr}
	movs r0, #0
	bl SetTextFont
	pop {r0}
	bx r0

	thumb_func_start sub_8022828
sub_8022828: @ 0x08022828
	push {lr}
	movs r0, #0
	bl SetTextFont
	ldr r0, _08022854 @ =gUiTmScratchA
	ldr r1, _08022858 @ =gBg0Tm + 0x56
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _0802285C @ =gUiTmScratchB
	ldr r1, _08022860 @ =gBg1Tm + 0x56
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_08022854: .4byte gUiTmScratchA
_08022858: .4byte gBg0Tm + 0x56
_0802285C: .4byte gUiTmScratchB
_08022860: .4byte gBg1Tm + 0x56

	thumb_func_start sub_8022864
sub_8022864: @ 0x08022864
	push {lr}
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl sub_804AC78
	movs r0, #0x31
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802287C
sub_802287C: @ 0x0802287C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8022864
	adds r0, r4, #0
	bl sub_8022828
	ldr r0, _080228CC @ =gUnk_08C04CFC
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080228D0 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E2A0
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080228CC: .4byte gUnk_08C04CFC
_080228D0: .4byte gActiveUnit

	thumb_func_start sub_80228D4
sub_80228D4: @ 0x080228D4
	push {r4, r5, r6, lr}
	sub sp, #4
	bl sub_8022864
	ldr r6, _0802295C @ =gActiveUnit
	ldr r0, [r6]
	bl GetUnitItemCount
	cmp r0, #0
	beq _08022974
	ldr r0, _08022960 @ =gUiTmScratchA
	ldr r5, _08022964 @ =gBg0Tm + 0x56
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _08022968 @ =gUiTmScratchB
	ldr r4, _0802296C @ =gBg1Tm + 0x56
	adds r1, r4, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	subs r5, #0x14
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	subs r4, #0x14
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	ldr r0, _08022970 @ =gUnk_08C04CFC
	bl StartMenu
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r6]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E2A0
	movs r0, #1
	b _08022996
	.align 2, 0
_0802295C: .4byte gActiveUnit
_08022960: .4byte gUiTmScratchA
_08022964: .4byte gBg0Tm + 0x56
_08022968: .4byte gUiTmScratchB
_0802296C: .4byte gBg1Tm + 0x56
_08022970: .4byte gUnk_08C04CFC
_08022974:
	bl ClearUi
	movs r0, #0
	bl EndFaceById
	ldr r0, _080229A0 @ =gUnk_08C04D68
	ldr r2, _080229A4 @ =gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_804B2DC
	movs r0, #0x1b
_08022996:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080229A0: .4byte gUnk_08C04D68
_080229A4: .4byte gBmSt

	thumb_func_start sub_80229A8
sub_80229A8: @ 0x080229A8
	push {r4, r5, lr}
	ldr r5, _080229F8 @ =gActiveUnit
	ldr r0, [r5]
	ldr r1, _080229FC @ =gActionSt
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_8017844
	cmp r0, #0
	beq _080229F4
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	beq _080229F4
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	beq _080229F4
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022A00
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022A00
_080229F4:
	movs r0, #3
	b _08022A16
	.align 2, 0
_080229F8: .4byte gActiveUnit
_080229FC: .4byte gActionSt
_08022A00:
	ldr r0, _08022A1C @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08022A14
	movs r1, #1
_08022A14:
	adds r0, r1, #0
_08022A16:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022A1C: .4byte gActiveUnit

	thumb_func_start sub_8022A20
sub_8022A20: @ 0x08022A20
	push {r4, r5, lr}
	ldr r5, _08022A44 @ =gActiveUnit
	ldr r0, [r5]
	ldr r1, _08022A48 @ =gActionSt
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08022A4C
	movs r0, #3
	b _08022A60
	.align 2, 0
_08022A44: .4byte gActiveUnit
_08022A48: .4byte gActionSt
_08022A4C:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08022A5E
	movs r1, #1
_08022A5E:
	adds r0, r1, #0
_08022A60:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8022A68
sub_8022A68: @ 0x08022A68
	push {lr}
	ldr r0, _08022A8C @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, _08022A90 @ =gActionSt
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _08022A94
	movs r0, #1
	b _08022A96
	.align 2, 0
_08022A8C: .4byte gActiveUnit
_08022A90: .4byte gActionSt
_08022A94:
	movs r0, #2
_08022A96:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8022A9C
sub_8022A9C: @ 0x08022A9C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _08022AD4
	ldr r0, _08022ACC @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, _08022AD0 @ =gActionSt
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetItemCantUseMsgid
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_804B210
	movs r0, #8
	b _08022B10
	.align 2, 0
_08022ACC: .4byte gActiveUnit
_08022AD0: .4byte gActionSt
_08022AD4:
	bl ClearUi
	ldr r0, _08022B18 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, _08022B1C @ =gActionSt
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	ldr r0, _08022B20 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08022B00
	ldr r0, _08022B24 @ =0x0000038A
	bl m4aSongNumStart
_08022B00:
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl sub_804AC78
	movs r0, #0x21
_08022B10:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022B18: .4byte gActiveUnit
_08022B1C: .4byte gActionSt
_08022B20: .4byte gPlaySt
_08022B24: .4byte 0x0000038A

	thumb_func_start sub_8022B28
sub_8022B28: @ 0x08022B28
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022B54
	ldr r0, _08022B4C @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, _08022B50 @ =gActionSt
	ldrb r1, [r1, #0x12]
	bl EquipUnitItemSlot
	adds r0, r4, #0
	bl sub_802287C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022B5E
	.align 2, 0
_08022B4C: .4byte gActiveUnit
_08022B50: .4byte gActionSt
_08022B54:
	ldr r1, _08022B64 @ =0x00000701
	adds r0, r4, #0
	bl sub_804B210
	movs r0, #8
_08022B5E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022B64: .4byte 0x00000701

	thumb_func_start sub_8022B68
sub_8022B68: @ 0x08022B68
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08022B94 @ =gBmSt
	ldr r1, _08022B98 @ =gActionSt
	ldrb r1, [r1, #0x12]
	adds r0, #0x3f
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8022864
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80222DC
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022B94: .4byte gBmSt
_08022B98: .4byte gActionSt

	thumb_func_start sub_8022B9C
sub_8022B9C: @ 0x08022B9C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _08022BFC
	ldrh r0, [r2, #0x2a]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08022BE8 @ =0xFFFFFF00
	ands r3, r1
	orrs r3, r0
	ldrh r2, [r2, #0x2c]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08022BEC @ =0xFFFF00FF
	ands r3, r1
	orrs r3, r0
	ldr r0, _08022BF0 @ =0xFF00FFFF
	ands r3, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r3, r0
	ldr r0, _08022BF4 @ =0x00FFFFFF
	ands r3, r0
	ldr r0, _08022BF8 @ =gUnk_08C04C6C
	adds r1, r3, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	adds r0, #0x61
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x84
	b _08022C06
	.align 2, 0
_08022BE8: .4byte 0xFFFFFF00
_08022BEC: .4byte 0xFFFF00FF
_08022BF0: .4byte 0xFF00FFFF
_08022BF4: .4byte 0x00FFFFFF
_08022BF8: .4byte gUnk_08C04C6C
_08022BFC:
	ldr r1, _08022C0C @ =0x00000703
	adds r0, r4, #0
	bl sub_804B210
	movs r0, #8
_08022C06:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022C0C: .4byte 0x00000703

	thumb_func_start sub_8022C10
sub_8022C10: @ 0x08022C10
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08022C3C @ =gActiveUnit
	ldr r0, [r0]
	ldr r4, _08022C40 @ =gActionSt
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08022C2E
	ldr r0, _08022C44 @ =gBg0Tm
	movs r1, #0
	bl TmFill
_08022C2E:
	adds r0, r5, #0
	bl sub_80228D4
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022C3C: .4byte gActiveUnit
_08022C40: .4byte gActionSt
_08022C44: .4byte gBg0Tm

	thumb_func_start sub_8022C48
sub_8022C48: @ 0x08022C48
	push {lr}
	ldr r0, _08022C5C @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022C60
	movs r0, #3
	b _08022C7C
	.align 2, 0
_08022C5C: .4byte gActiveUnit
_08022C60:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetBallistaItemAt
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08022C7A
	movs r0, #2
	b _08022C7C
_08022C7A:
	movs r0, #1
_08022C7C:
	pop {r1}
	bx r1

	thumb_func_start sub_8022C80
sub_8022C80: @ 0x08022C80
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _08022C92
	movs r5, #1
_08022C92:
	ldr r0, _08022CC8 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	adds r2, r5, #0
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r4, [r4, r5]
	adds r3, r3, r4
	lsls r3, r3, #1
	ldr r4, _08022CCC @ =gBg0Tm
	adds r3, r3, r4
	bl sub_80168EC
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022CC8: .4byte gActiveUnit
_08022CCC: .4byte gBg0Tm

	thumb_func_start sub_8022CD0
sub_8022CD0: @ 0x08022CD0
	push {lr}
	bl ClearUi
	ldr r1, _08022CF0 @ =gActionSt
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, _08022CF4 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_8024638
	ldr r0, _08022CF8 @ =gUnk_08C04F54
	bl sub_804B664
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
_08022CF0: .4byte gActionSt
_08022CF4: .4byte gActiveUnit
_08022CF8: .4byte gUnk_08C04F54

	thumb_func_start sub_8022CFC
sub_8022CFC: @ 0x08022CFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08022D78 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r4, _08022D7C @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r4, _08022D80 @ =gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r5, r0, #0
	bl sub_801E364
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	bl sub_8017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl sub_801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl MapAddInBoundedRange
	movs r0, #2
	bl sub_801D6A4
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022D78: .4byte gBmMapMovement
_08022D7C: .4byte 0x0202E3E4
_08022D80: .4byte gActiveUnit

	thumb_func_start sub_8022D84
sub_8022D84: @ 0x08022D84
	push {r4, r5, r6, lr}
	ldr r0, _08022D98 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022DA0
	b _08022DEE
	.align 2, 0
_08022D98: .4byte gActiveUnit
_08022D9C:
	movs r0, #2
	b _08022DF0
_08022DA0:
	movs r6, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _08022DEE
_08022DA8:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08022DD8
	ldr r5, _08022DD4 @ =gActiveUnit
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022DD8
	ldr r0, [r5]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022D9C
	movs r0, #1
	b _08022DF0
	.align 2, 0
_08022DD4: .4byte gActiveUnit
_08022DD8:
	adds r6, #1
	cmp r6, #4
	bgt _08022DEE
	ldr r0, _08022DF8 @ =gActiveUnit
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08022DA8
_08022DEE:
	movs r0, #3
_08022DF0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022DF8: .4byte gActiveUnit

	thumb_func_start sub_8022DFC
sub_8022DFC: @ 0x08022DFC
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022E54
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _08022E4C @ =gUnk_08C04CD8
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08022E50 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E2A0
	movs r0, #0x17
	b _08022E5C
	.align 2, 0
_08022E4C: .4byte gUnk_08C04CD8
_08022E50: .4byte gActiveUnit
_08022E54:
	ldr r1, _08022E64 @ =0x00000705
	bl sub_804B210
	movs r0, #8
_08022E5C:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022E64: .4byte 0x00000705

	thumb_func_start sub_8022E68
sub_8022E68: @ 0x08022E68
	push {r4, r5, r6, lr}
	ldr r5, _08022EA4 @ =gActiveUnit
	ldr r0, [r5]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl sub_8017364
	adds r6, r0, #0
	ldr r0, _08022EA8 @ =gBmMapMovement
	ldr r0, [r0]
	adds r1, r4, #0
	bl BmMapFillg
	ldr r0, _08022EAC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl sub_801B040
	movs r0, #5
	bl sub_801D6A4
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022EA4: .4byte gActiveUnit
_08022EA8: .4byte gBmMapMovement
_08022EAC: .4byte 0x0202E3E4

	thumb_func_start sub_8022EB0
sub_8022EB0: @ 0x08022EB0
	push {lr}
	bl sub_801D6D8
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8022EBC
sub_8022EBC: @ 0x08022EBC
	push {r4, r5, lr}
	ldr r5, _08022EE8 @ =gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08022EEC
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022EEC
	movs r0, #1
	b _08022EEE
	.align 2, 0
_08022EE8: .4byte gActiveUnit
_08022EEC:
	movs r0, #3
_08022EEE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8022EF4
sub_8022EF4: @ 0x08022EF4
	push {r4, r5, lr}
	ldr r5, _08022F2C @ =gActiveUnit
	ldr r0, [r5]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r4, _08022F30 @ =gActionSt
	movs r0, #0
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, [r5]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022F2C: .4byte gActiveUnit
_08022F30: .4byte gActionSt

	thumb_func_start sub_8022F34
sub_8022F34: @ 0x08022F34
	push {lr}
	bl sub_802267C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8022F40
sub_8022F40: @ 0x08022F40
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, _08022F88 @ =gActiveUnit
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_8017364
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_801E364
	ldr r0, _08022F8C @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08022F90 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl sub_801B040
	movs r0, #4
	bl sub_801D6A4
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022F88: .4byte gActiveUnit
_08022F8C: .4byte gBmMapMovement
_08022F90: .4byte 0x0202E3E4

	thumb_func_start sub_8022F94
sub_8022F94: @ 0x08022F94
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08022FA6
	bl sub_801D6D8
_08022FA6:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8022FAC
sub_8022FAC: @ 0x08022FAC
	push {r4, lr}
	ldr r4, _08022FD0 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022FCA
	adds r0, r2, #0
	bl sub_8024520
	bl sub_804B950
	cmp r0, #0
	bne _08022FD4
_08022FCA:
	movs r0, #3
	b _08022FE8
	.align 2, 0
_08022FD0: .4byte gActiveUnit
_08022FD4:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08022FE6
	movs r0, #1
	b _08022FE8
_08022FE6:
	movs r0, #2
_08022FE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8022FF0
sub_8022FF0: @ 0x08022FF0
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08023014
	ldr r0, _0802300C @ =gActiveUnit
	ldr r0, [r0]
	bl sub_8024520
	ldr r0, _08023010 @ =gUnk_08C04EF4
	bl sub_804B664
	movs r0, #7
	b _0802301C
	.align 2, 0
_0802300C: .4byte gActiveUnit
_08023010: .4byte gUnk_08C04EF4
_08023014:
	ldr r1, _08023020 @ =0x00000706
	bl sub_804B210
	movs r0, #8
_0802301C:
	pop {r1}
	bx r1
	.align 2, 0
_08023020: .4byte 0x00000706

	thumb_func_start sub_8023024
sub_8023024: @ 0x08023024
	ldr r2, _08023034 @ =gActionSt
	movs r0, #0xc
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08023034: .4byte gActionSt

	thumb_func_start sub_8023038
sub_8023038: @ 0x08023038
	push {r4, lr}
	ldr r4, _08023068 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023064
	adds r0, r2, #0
	bl sub_8024554
	bl sub_804B950
	cmp r0, #0
	beq _08023064
	ldr r0, [r4]
	bl sub_8024520
	bl sub_804B950
	cmp r0, #0
	beq _0802306C
_08023064:
	movs r0, #3
	b _08023080
	.align 2, 0
_08023068: .4byte gActiveUnit
_0802306C:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0802307E
	movs r0, #1
	b _08023080
_0802307E:
	movs r0, #2
_08023080:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023088
sub_8023088: @ 0x08023088
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080230AC
	ldr r0, _080230A4 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_8024554
	ldr r0, _080230A8 @ =gUnk_08C04ED4
	bl sub_804B664
	movs r0, #7
	b _080230B4
	.align 2, 0
_080230A4: .4byte gActiveUnit
_080230A8: .4byte gUnk_08C04ED4
_080230AC:
	ldr r1, _080230B8 @ =0x00000706
	bl sub_804B210
	movs r0, #8
_080230B4:
	pop {r1}
	bx r1
	.align 2, 0
_080230B8: .4byte 0x00000706

	thumb_func_start sub_80230BC
sub_80230BC: @ 0x080230BC
	ldr r2, _080230CC @ =gActionSt
	movs r0, #0xd
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_080230CC: .4byte gActionSt

	thumb_func_start sub_80230D0
sub_80230D0: @ 0x080230D0
	push {r4, lr}
	ldr r4, _080230F0 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080230EC
	adds r0, r2, #0
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _080230F4
_080230EC:
	movs r0, #3
	b _0802310A
	.align 2, 0
_080230F0: .4byte gActiveUnit
_080230F4:
	ldr r0, [r4]
	movs r1, #0x1e
	bl sub_8024724
	bl sub_804B950
	movs r1, #3
	cmp r0, #0
	beq _08023108
	movs r1, #1
_08023108:
	adds r0, r1, #0
_0802310A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8023110
sub_8023110: @ 0x08023110
	push {r4, lr}
	ldr r4, _08023130 @ =gActionSt
	movs r0, #0x10
	strb r0, [r4, #0x11]
	ldr r0, _08023134 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	strb r1, [r4, #0xc]
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023130: .4byte gActionSt
_08023134: .4byte gActiveUnit

	thumb_func_start sub_8023138
sub_8023138: @ 0x08023138
	push {r4, lr}
	ldr r4, _08023158 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023154
	adds r0, r2, #0
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _0802315C
_08023154:
	movs r0, #3
	b _0802316E
	.align 2, 0
_08023158: .4byte gActiveUnit
_0802315C:
	ldr r0, [r4]
	bl sub_80277E0
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _0802316C
	movs r1, #1
_0802316C:
	adds r0, r1, #0
_0802316E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8023174
sub_8023174: @ 0x08023174
	push {r4, lr}
	ldr r4, _08023190 @ =gActionSt
	movs r0, #0x12
	strb r0, [r4, #0x11]
	ldr r0, _08023194 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023190: .4byte gActionSt
_08023194: .4byte gActiveUnit

	thumb_func_start sub_8023198
sub_8023198: @ 0x08023198
	push {r4, lr}
	ldr r0, _08023210 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023224
	ldr r1, _08023214 @ =gBmSt
	adds r1, #0x3d
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08023224
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _080231C8
	bl sub_802EC3C
	cmp r0, #0
	beq _08023224
_080231C8:
	bl sub_807A810
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023224
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08023224
	ldr r0, _08023210 @ =gActiveUnit
	ldr r4, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	subs r1, r0, r2
	cmp r1, #0
	bge _080231F8
	subs r1, r2, r0
_080231F8:
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	subs r0, r4, r2
	cmp r0, #0
	blt _08023218
	adds r0, r1, r0
	cmp r0, #1
	beq _08023220
	b _08023224
	.align 2, 0
_08023210: .4byte gActiveUnit
_08023214: .4byte gBmSt
_08023218:
	subs r0, r2, r4
	adds r0, r1, r0
	cmp r0, #1
	bne _08023224
_08023220:
	movs r0, #1
	b _08023226
_08023224:
	movs r0, #3
_08023226:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_802322C
sub_802322C: @ 0x0802322C
	push {lr}
	ldr r1, _08023244 @ =gActionSt
	movs r0, #0x1a
	strb r0, [r1, #0x11]
	ldr r0, _08023248 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0
	bl sub_8097C54
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08023244: .4byte gActionSt
_08023248: .4byte gActiveUnit

	thumb_func_start sub_802324C
sub_802324C: @ 0x0802324C
	push {lr}
	ldr r0, _08023260 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023264
	movs r0, #3
	b _0802327A
	.align 2, 0
_08023260: .4byte gActiveUnit
_08023264:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_80793A0
	movs r1, #3
	cmp r0, #0x13
	bne _08023278
	movs r1, #1
_08023278:
	adds r0, r1, #0
_0802327A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023280
sub_8023280: @ 0x08023280
	push {lr}
	ldr r0, _0802329C @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793E4
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0802329C: .4byte gActiveUnit

	thumb_func_start sub_80232A0
sub_80232A0: @ 0x080232A0
	push {lr}
	ldr r0, _080232B4 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080232B8
	movs r0, #3
	b _080232CE
	.align 2, 0
_080232B4: .4byte gActiveUnit
_080232B8:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_80793A0
	movs r1, #3
	cmp r0, #0x14
	bne _080232CC
	movs r1, #1
_080232CC:
	adds r0, r1, #0
_080232CE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80232D4
sub_80232D4: @ 0x080232D4
	push {lr}
	ldr r0, _080232F0 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793E4
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080232F0: .4byte gActiveUnit

	thumb_func_start sub_80232F4
sub_80232F4: @ 0x080232F4
	push {lr}
	ldr r0, _08023308 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802330C
	movs r0, #3
	b _08023322
	.align 2, 0
_08023308: .4byte gActiveUnit
_0802330C:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_80793A0
	movs r1, #3
	cmp r0, #0x15
	bne _08023320
	movs r1, #1
_08023320:
	adds r0, r1, #0
_08023322:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023328
sub_8023328: @ 0x08023328
	push {lr}
	ldr r0, _08023344 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793E4
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08023344: .4byte gActiveUnit

	thumb_func_start sub_8023348
sub_8023348: @ 0x08023348
	push {lr}
	ldr r0, _08023378 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023372
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802337C @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	beq _08023380
_08023372:
	movs r0, #3
	b _08023392
	.align 2, 0
_08023378: .4byte gActiveUnit
_0802337C: .4byte gBmMapTerrain
_08023380:
	adds r0, r2, #0
	bl sub_802F624
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08023390
	movs r1, #1
_08023390:
	adds r0, r1, #0
_08023392:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023398
sub_8023398: @ 0x08023398
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _080233D2
	ldr r0, _080233BC @ =gActiveUnit
	ldr r0, [r0]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080233C4
	ldr r1, _080233C0 @ =0x00000707
	adds r0, r4, #0
	bl sub_804B210
	b _080233CE
	.align 2, 0
_080233BC: .4byte gActiveUnit
_080233C0: .4byte 0x00000707
_080233C4:
	movs r1, #0xe1
	lsls r1, r1, #3
	adds r0, r4, #0
	bl sub_804B210
_080233CE:
	movs r0, #8
	b _080233D8
_080233D2:
	bl sub_80B34A0
	movs r0, #0x17
_080233D8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80233E0
sub_80233E0: @ 0x080233E0
	push {lr}
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080233F0
	movs r0, #1
	b _080233F2
_080233F0:
	movs r0, #3
_080233F2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80233F8
sub_80233F8: @ 0x080233F8
	ldr r1, _08023400 @ =gActionSt
	movs r0, #0x20
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08023400: .4byte gActionSt

	thumb_func_start sub_8023404
sub_8023404: @ 0x08023404
	push {r4, lr}
	ldr r4, _08023438 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08023434
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023434
	adds r0, r2, #0
	bl sub_8024990
	bl sub_804B950
	cmp r0, #0
	bne _0802343C
_08023434:
	movs r0, #3
	b _0802344C
	.align 2, 0
_08023438: .4byte gActiveUnit
_0802343C:
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	beq _0802344A
	movs r0, #1
	b _0802344C
_0802344A:
	movs r0, #2
_0802344C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023454
sub_8023454: @ 0x08023454
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _0802347C
	bl ClearUi
	ldr r0, _08023474 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_8024990
	ldr r0, _08023478 @ =gUnk_08C04EB4
	bl sub_804B664
	movs r0, #7
	b _08023484
	.align 2, 0
_08023474: .4byte gActiveUnit
_08023478: .4byte gUnk_08C04EB4
_0802347C:
	ldr r1, _08023488 @ =0x00000715
	bl sub_804B210
	movs r0, #8
_08023484:
	pop {r1}
	bx r1
	.align 2, 0
_08023488: .4byte 0x00000715

	thumb_func_start sub_802348C
sub_802348C: @ 0x0802348C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8031FAC
	ldr r0, _080234A8 @ =0x000006EF
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080234A8: .4byte 0x000006EF

	thumb_func_start sub_80234AC
sub_80234AC: @ 0x080234AC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_80320D8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80234D0
sub_80234D0: @ 0x080234D0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _08023560 @ =gActionSt
	ldrb r0, [r1, #2]
	strb r0, [r6, #0xd]
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _08023564 @ =gUnk_08C04BDC
	bl StartMenu
	adds r0, r4, #0
	bl sub_804B6DC
	ldr r0, _08023568 @ =gBg1Tm + 0x84
	ldr r1, _0802356C @ =gUnk_08191C28
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	movs r4, #0x38
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	ldr r5, _08023570 @ =gBg0Tm + 0xc6
	movs r1, #7
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl PutFace80x72_Core
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023560: .4byte gActionSt
_08023564: .4byte gUnk_08C04BDC
_08023568: .4byte gBg1Tm + 0x84
_0802356C: .4byte gUnk_08191C28
_08023570: .4byte gBg0Tm + 0xc6

	thumb_func_start sub_8023574
sub_8023574: @ 0x08023574
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _08023590 @ =gActionSt
	ldrb r0, [r5, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08023594
	movs r0, #3
	b _080235B0
	.align 2, 0
_08023590: .4byte gActionSt
_08023594:
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	bl sub_801718C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080235AE
	movs r0, #1
	b _080235B0
_080235AE:
	movs r0, #2
_080235B0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80235B8
sub_80235B8: @ 0x080235B8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08023604 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_801718C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08023608 @ =gBg0Tm
	adds r3, r3, r1
	adds r1, r4, #0
	bl sub_80168EC
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023604: .4byte gActionSt
_08023608: .4byte gBg0Tm

	thumb_func_start sub_802360C
sub_802360C: @ 0x0802360C
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08023630
	ldr r1, _0802362C @ =gActionSt
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r0, #6
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _0802363A
	.align 2, 0
_0802362C: .4byte gActionSt
_08023630:
	ldr r1, _08023640 @ =0x00000709
	adds r0, r2, #0
	bl sub_804B210
	movs r0, #8
_0802363A:
	pop {r1}
	bx r1
	.align 2, 0
_08023640: .4byte 0x00000709

	thumb_func_start sub_8023644
sub_8023644: @ 0x08023644
	push {r4, lr}
	adds r4, r1, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _08023670
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _0802366C @ =gBmSt
	ldrh r2, [r2, #0x2c]
	bl sub_80826EC
	movs r0, #0
	b _08023690
	.align 2, 0
_0802366C: .4byte gBmSt
_08023670:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _08023698 @ =gActiveUnit
	ldr r3, [r2]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r3, #0x1e
	adds r3, r3, r2
	ldrh r2, [r3]
	bl sub_80826EC
_08023690:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023698: .4byte gActiveUnit

	thumb_func_start sub_802369C
sub_802369C: @ 0x0802369C
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _080236D0 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0x2a
	ldrsh r3, [r4, r1]
	lsls r3, r3, #3
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #3
	adds r4, #0x3c
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r0, r3, #0
	bl sub_80826EC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080236D0: .4byte gActionSt

	thumb_func_start sub_80236D4
sub_80236D4: @ 0x080236D4
	push {r4, r5, lr}
	movs r0, #0x2a
	ldrsh r5, [r1, r0]
	lsls r5, r5, #3
	movs r0, #0x2c
	ldrsh r4, [r1, r0]
	lsls r4, r4, #3
	ldr r0, _08023704 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80826EC
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023704: .4byte gActiveUnit

	thumb_func_start sub_8023708
sub_8023708: @ 0x08023708
	push {lr}
	bl sub_803232C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023714
sub_8023714: @ 0x08023714
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8032340
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023738
sub_8023738: @ 0x08023738
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803255C
	ldr r0, _08023754 @ =0x000006EA
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023754: .4byte 0x000006EA

	thumb_func_start sub_8023758
sub_8023758: @ 0x08023758
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8032594
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802377C
sub_802377C: @ 0x0802377C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08023794 @ =0x000006EB
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023794: .4byte 0x000006EB

	thumb_func_start nullsub_41
nullsub_41: @ 0x08023798
	bx lr
	.align 2, 0

	thumb_func_start sub_802379C
sub_802379C: @ 0x0802379C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8032710
	ldr r0, _080237B8 @ =0x000006ED
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080237B8: .4byte 0x000006ED

	thumb_func_start sub_80237BC
sub_80237BC: @ 0x080237BC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8032748
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80237E0
sub_80237E0: @ 0x080237E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803255C
	ldr r0, _080237FC @ =0x000006EC
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080237FC: .4byte 0x000006EC

	thumb_func_start sub_8023800
sub_8023800: @ 0x08023800
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_803264C
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023824
sub_8023824: @ 0x08023824
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8031FAC
	ldr r0, _08023840 @ =0x000006EE
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023840: .4byte 0x000006EE

	thumb_func_start sub_8023844
sub_8023844: @ 0x08023844
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	bl ClearIcons
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8031FD0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802386C
sub_802386C: @ 0x0802386C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803232C
	ldr r0, _08023888 @ =0x000006F1
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023888: .4byte 0x000006F1

	thumb_func_start sub_802388C
sub_802388C: @ 0x0802388C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8032340
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80238B0
sub_80238B0: @ 0x080238B0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803232C
	ldr r0, _080238CC @ =0x000006F2
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080238CC: .4byte 0x000006F2

	thumb_func_start sub_80238D0
sub_80238D0: @ 0x080238D0
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8032340
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80238F4
sub_80238F4: @ 0x080238F4
	push {lr}
	bl sub_803232C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023900
sub_8023900: @ 0x08023900
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8032340
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023924
sub_8023924: @ 0x08023924
	push {lr}
	ldr r0, _08023970 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023978
	ldr r0, [r2, #0xc]
	movs r1, #0x83
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08023978
	ldr r1, _08023974 @ =gBmSt
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08023978
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _08023978
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08023978
	movs r0, #1
	b _0802397A
	.align 2, 0
_08023970: .4byte gActiveUnit
_08023974: .4byte gBmSt
_08023978:
	movs r0, #3
_0802397A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023980
sub_8023980: @ 0x08023980
	push {r4, lr}
	ldr r1, _080239A4 @ =gActionSt
	movs r0, #0x1e
	strb r0, [r1, #0x11]
	ldr r4, _080239A8 @ =gActiveUnit
	ldr r0, [r4]
	bl sub_8034C48
	bl MU_EndAll
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080239A4: .4byte gActionSt
_080239A8: .4byte gActiveUnit

	thumb_func_start sub_80239AC
sub_80239AC: @ 0x080239AC
	ldr r0, _080239D0 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080239D8
	ldr r1, _080239D4 @ =gBmSt
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080239D8
	movs r0, #1
	b _080239DA
	.align 2, 0
_080239D0: .4byte gActiveUnit
_080239D4: .4byte gBmSt
_080239D8:
	movs r0, #3
_080239DA:
	bx lr

	thumb_func_start sub_80239DC
sub_80239DC: @ 0x080239DC
	push {r4, lr}
	ldr r1, _08023A00 @ =gActionSt
	movs r0, #0x1f
	strb r0, [r1, #0x11]
	ldr r4, _08023A04 @ =gActiveUnit
	ldr r0, [r4]
	bl sub_8034C80
	bl MU_EndAll
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023A00: .4byte gActionSt
_08023A04: .4byte gActiveUnit

	thumb_func_start sub_8023A08
sub_8023A08: @ 0x08023A08
	push {r4, r5, r6, lr}
	ldr r0, _08023A24 @ =gActiveUnit
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08023A78
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08023A2C
	b _08023A78
	.align 2, 0
_08023A24: .4byte gActiveUnit
_08023A28:
	movs r0, #1
	b _08023A7A
_08023A2C:
	movs r6, #0
	ldrh r4, [r1, #0x1e]
	cmp r4, #0
	beq _08023A78
_08023A34:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08023A62
	ldr r5, _08023A80 @ =gActiveUnit
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023A62
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_80240E4
	bl sub_804B950
	cmp r0, #0
	bne _08023A28
_08023A62:
	adds r6, #1
	cmp r6, #4
	bgt _08023A78
	ldr r0, _08023A80 @ =gActiveUnit
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08023A34
_08023A78:
	movs r0, #3
_08023A7A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023A80: .4byte gActiveUnit

	thumb_func_start sub_8023A84
sub_8023A84: @ 0x08023A84
	push {r4, r5, lr}
	ldr r5, _08023AC8 @ =gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08023AC2
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	adds r4, r0, #0
	bl sub_8034CBC
	cmp r0, #0
	beq _08023AC2
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	orrs r1, r2
	bl sub_80240E4
	bl sub_804B950
	cmp r0, #0
	bne _08023ACC
_08023AC2:
	movs r0, #3
	b _08023ADC
	.align 2, 0
_08023AC8: .4byte gActiveUnit
_08023ACC:
	adds r0, r4, #0
	bl sub_8034D14
	cmp r0, #0
	beq _08023ADA
	movs r0, #1
	b _08023ADC
_08023ADA:
	movs r0, #2
_08023ADC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023AE4
sub_8023AE4: @ 0x08023AE4
	push {lr}
	ldr r0, _08023AFC @ =gActiveUnit
	ldr r0, [r0]
	bl sub_8024904
	bl sub_804B950
	cmp r0, #0
	beq _08023B00
	movs r0, #1
	b _08023B02
	.align 2, 0
_08023AFC: .4byte gActiveUnit
_08023B00:
	movs r0, #3
_08023B02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023B08
sub_8023B08: @ 0x08023B08
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	ldr r0, _08023B44 @ =gBmSt
	ldrh r0, [r0, #0x2c]
	bl GetItemName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08023B48 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023B44: .4byte gBmSt
_08023B48: .4byte gBg0Tm

	thumb_func_start sub_8023B4C
sub_8023B4C: @ 0x08023B4C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08023B70
	ldr r0, _08023B68 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_8024904
	ldr r0, _08023B6C @ =gUnk_08C04E54
	bl sub_804B664
	movs r0, #0x27
	b _08023B72
	.align 2, 0
_08023B68: .4byte gActiveUnit
_08023B6C: .4byte gUnk_08C04E54
_08023B70:
	movs r0, #8
_08023B72:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023B78
sub_8023B78: @ 0x08023B78
	push {r4, r5, lr}
	ldr r5, _08023BA4 @ =gActiveUnit
	ldr r0, [r5]
	subs r1, #1
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08023BA8
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023BA8
	movs r0, #1
	b _08023BAA
	.align 2, 0
_08023BA4: .4byte gActiveUnit
_08023BA8:
	movs r0, #3
_08023BAA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8023BB0
sub_8023BB0: @ 0x08023BB0
	push {r4, lr}
	adds r2, r1, #0
	ldr r0, _08023BF0 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x34
	movs r4, #0x2c
	ldrsh r3, [r2, r4]
	lsls r3, r3, #5
	movs r4, #0x2a
	ldrsh r2, [r2, r4]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, _08023BF4 @ =gBg0Tm
	adds r3, r3, r2
	movs r2, #1
	bl sub_80168EC
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023BF0: .4byte gActiveUnit
_08023BF4: .4byte gBg0Tm

	thumb_func_start sub_8023BF8
sub_8023BF8: @ 0x08023BF8
	push {r4, lr}
	ldr r4, _08023C24 @ =gActionSt
	adds r1, #0x3c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, _08023C28 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023C24: .4byte gActionSt
_08023C28: .4byte gActiveUnit

	thumb_func_start sub_8023C2C
sub_8023C2C: @ 0x08023C2C
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08023C40
	movs r0, #5
	bl sub_801E364
	b _08023C4A
_08023C40:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl sub_801E364
_08023C4A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start nullsub_19
nullsub_19: @ 0x08023C50
	bx lr
	.align 2, 0

	thumb_func_start sub_8023C54
sub_8023C54: @ 0x08023C54
	push {r4, lr}
	adds r3, r1, #0
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08023C70
	ldr r0, _08023C6C @ =gBmSt
	ldrh r2, [r0, #0x2c]
	b _08023C82
	.align 2, 0
_08023C6C: .4byte gBmSt
_08023C70:
	ldr r0, _08023C98 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r2, [r1]
_08023C82:
	movs r1, #0x2a
	ldrsh r0, [r3, r1]
	lsls r0, r0, #3
	movs r4, #0x2c
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	bl sub_80826EC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023C98: .4byte gActiveUnit
