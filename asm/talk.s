	.include "macro.inc"
	.syntax unified

	thumb_func_start InitTalk
InitTalk: @ 0x08007C88
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, _08007D0C @ =0x030000E8
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007D10 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl InitTextFont
	bl sub_08007DF4
	ldr r0, _08007D14 @ =0x08BFFB68
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08007CDE
	ldr r4, _08007D18 @ =0x030000C8
	adds r5, r6, #0
_08007CC6:
	adds r0, r4, #0
	movs r1, #0x1e
	bl sub_08005344
	adds r0, r4, #0
	movs r1, #1
	bl sub_08005450
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08007CC6
_08007CDE:
	cmp r7, #0
	beq _08007D00
	ldr r4, _08007D1C @ =0x084027B0
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007D20 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08013688
	ldr r0, _08007D24 @ =0x08402A4C
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
_08007D00:
	bl sub_08007C64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007D0C: .4byte 0x030000E8
_08007D10: .4byte 0x000003FF
_08007D14: .4byte 0x08BFFB68
_08007D18: .4byte 0x030000C8
_08007D1C: .4byte 0x084027B0
_08007D20: .4byte 0x06000200
_08007D24: .4byte 0x08402A4C

	thumb_func_start InitSpriteTalk
InitSpriteTalk: @ 0x08007D28
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _08007DB8 @ =0x030000E8
	ldr r1, _08007DBC @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08007DC0 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_08005ACC
	adds r0, r5, #0
	bl sub_08005320
	movs r0, #1
	bl sub_080052E0
	ldr r0, _08007DC4 @ =0x081901E8
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08007DC8 @ =0x02022860
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007DCC @ =0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007DD0 @ =0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _08007DD4 @ =0x00007FFF
	strh r0, [r4]
	ldr r0, _08007DD8 @ =0x08BFFB68
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08007DB0
_08007D88:
	lsls r4, r5, #3
	ldr r0, _08007DDC @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_08005B08
	adds r0, r4, #0
	bl sub_08005B2C
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005450
	adds r0, r4, #0
	movs r1, #4
	bl sub_08005444
	adds r5, #1
	cmp r5, r6
	blt _08007D88
_08007DB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007DB8: .4byte 0x030000E8
_08007DBC: .4byte 0x000003FF
_08007DC0: .4byte 0x06010000
_08007DC4: .4byte 0x081901E8
_08007DC8: .4byte 0x02022860
_08007DCC: .4byte 0x00007247
_08007DD0: .4byte 0x000031AE
_08007DD4: .4byte 0x00007FFF
_08007DD8: .4byte 0x08BFFB68
_08007DDC: .4byte 0x030000C8

	thumb_func_start sub_08007DE0
sub_08007DE0: @ 0x08007DE0
	push {lr}
	ldr r0, _08007DF0 @ =0x081901C8
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08007DF0: .4byte 0x081901C8

	thumb_func_start sub_08007DF4
sub_08007DF4: @ 0x08007DF4
	push {lr}
	ldr r0, _08007E04 @ =0x030000E8
	bl sub_08005320
	bl sub_08005944
	pop {r0}
	bx r0
	.align 2, 0
_08007E04: .4byte 0x030000E8

	thumb_func_start sub_08007E08
sub_08007E08: @ 0x08007E08
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, _08007E90 @ =0x08BFFB68
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl GetTextPrintDelay
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl sub_08008CB8
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl sub_08009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne _08007E98
	ldr r0, _08007E94 @ =0x08BFFB84
	movs r1, #3
	bl Proc_Start
	b _08007EA0
	.align 2, 0
_08007E90: .4byte 0x08BFFB68
_08007E94: .4byte 0x08BFFB84
_08007E98:
	ldr r0, _08007EA8 @ =0x08BFFB84
	adds r1, r7, #0
	bl Proc_StartBlocking
_08007EA0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007EA8: .4byte 0x08BFFB84

	thumb_func_start sub_08007EAC
sub_08007EAC: @ 0x08007EAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_08007E08
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08007ECC
sub_08007ECC: @ 0x08007ECC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_08007E08
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08007EEC
sub_08007EEC: @ 0x08007EEC
	push {lr}
	movs r3, #0
	bl sub_08007E08
	pop {r1}
	bx r1

	thumb_func_start sub_08007EF8
sub_08007EF8: @ 0x08007EF8
	push {lr}
	ldr r0, _08007F04 @ =0x08BFFB84
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08007F04: .4byte 0x08BFFB84

	thumb_func_start sub_08007F08
sub_08007F08: @ 0x08007F08
	ldr r1, _08007F10 @ =0x08BFFB68
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08007F10: .4byte 0x08BFFB68

	thumb_func_start sub_08007F14
sub_08007F14: @ 0x08007F14
	ldr r0, _08007F20 @ =0x08BFFB68
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08007F20: .4byte 0x08BFFB68

	thumb_func_start sub_08007F24
sub_08007F24: @ 0x08007F24
	ldr r1, _08007F34 @ =0x08BFFB68
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_08007F34: .4byte 0x08BFFB68

	thumb_func_start sub_08007F38
sub_08007F38: @ 0x08007F38
	ldr r1, _08007F40 @ =0x08BFFB68
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_08007F40: .4byte 0x08BFFB68

	thumb_func_start sub_08007F44
sub_08007F44: @ 0x08007F44
	ldr r1, _08007F54 @ =0x08BFFB68
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	bics r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08007F54: .4byte 0x08BFFB68

	thumb_func_start sub_08007F58
sub_08007F58: @ 0x08007F58
	ldr r1, _08007F64 @ =0x08BFFB68
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r1, [r1]
	ands r0, r1
	bx lr
	.align 2, 0
_08007F64: .4byte 0x08BFFB68

	thumb_func_start sub_08007F68
sub_08007F68: @ 0x08007F68
	ldr r2, _08007F80 @ =0x08BFFB68
	ldr r1, [r2]
	strb r0, [r1, #0x13]
	ldr r2, [r2]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _08007F7C
	movs r0, #0
	strb r0, [r2, #0x13]
_08007F7C:
	bx lr
	.align 2, 0
_08007F80: .4byte 0x08BFFB68

	thumb_func_start sub_08007F84
sub_08007F84: @ 0x08007F84
	push {r4, r5, r6, lr}
	ldr r2, _08007FB8 @ =0x08BFFB68
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08007FB0
	adds r6, r2, #0
	ldr r5, _08007FBC @ =0x030000C8
_08007F9A:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl sub_08005450
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08007F9A
_08007FB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007FB8: .4byte 0x08BFFB68
_08007FBC: .4byte 0x030000C8

	thumb_func_start sub_08007FC0
sub_08007FC0: @ 0x08007FC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08008020 @ =0x08BFFC7C
	bl Proc_Find
	cmp r0, #0
	bne _08008062
	ldr r0, _08008024 @ =0x08BFFCD4
	bl Proc_Find
	cmp r0, #0
	bne _08008062
	movs r0, #4
	bl sub_08007F58
	cmp r0, #0
	bne _08008038
	ldr r0, _08008028 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08008038
	bl sub_0800EF98
	ldr r0, _0800802C @ =0x08BFFB68
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_08009E24
	adds r0, r4, #0
	bl Proc_End
	bl sub_08007EF8
	ldr r0, _08008030 @ =0x02022C60
	movs r1, #0
	bl sub_080017E8
	ldr r0, _08008034 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r0, #3
	bl EnableBgSync
	b _08008062
	.align 2, 0
_08008020: .4byte 0x08BFFC7C
_08008024: .4byte 0x08BFFCD4
_08008028: .4byte gpKeySt
_0800802C: .4byte 0x08BFFB68
_08008030: .4byte 0x02022C60
_08008034: .4byte 0x02023460
_08008038:
	ldr r0, _08008068 @ =0x08BFFBFC
	bl Proc_Find
	cmp r0, #0
	bne _08008062
	movs r0, #8
	bl sub_08007F58
	cmp r0, #0
	bne _08008062
	ldr r0, _0800806C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08008062
	ldr r0, _08008070 @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
_08008062:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008068: .4byte 0x08BFFBFC
_0800806C: .4byte gpKeySt
_08008070: .4byte 0x08BFFB68

	thumb_func_start sub_08008074
sub_08008074: @ 0x08008074
	push {lr}
	movs r0, #0x20
	bl sub_08007F58
	cmp r0, #0
	bne _08008098
	bl sub_08015A0C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08008098:
	ldr r0, _080080A4 @ =0x08BFFB6C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080080A4: .4byte 0x08BFFB6C

	thumb_func_start sub_080080A8
sub_080080A8: @ 0x080080A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_08008EB0
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq _080080BE
	b _0800820E
_080080BE:
	ldr r2, _08008108 @ =0x08BFFB68
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080080E2
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080080E2
	b _0800820E
_080080E2:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
_080080E6:
	ldr r7, _08008108 @ =0x08BFFB68
	ldr r0, _0800810C @ =0x0202BC35
	mov r8, r0
_080080EC:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl sub_08009E24
	adds r0, r6, #0
	bl sub_0800844C
	cmp r0, #1
	beq _08008144
	cmp r0, #1
	bgt _08008110
	cmp r0, #0
	beq _0800811A
	b _08008144
	.align 2, 0
_08008108: .4byte 0x08BFFB68
_0800810C: .4byte 0x0202BC35
_08008110:
	cmp r0, #2
	beq _08008122
	cmp r0, #3
	beq _08008136
	b _08008144
_0800811A:
	adds r0, r6, #0
	bl Proc_Break
	b _0800820E
_08008122:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080080E6
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080081F8
	b _0800820E
_08008136:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b _0800820E
_08008144:
	movs r0, #0x20
	bl sub_08007F58
	cmp r0, #0
	bne _08008156
	adds r0, r6, #0
	bl sub_0800821C
	b _0800815C
_08008156:
	adds r0, r6, #0
	bl sub_08008308
_0800815C:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800820E
	ldr r5, _080081AC @ =0x08BFFB68
	ldr r4, [r5]
	ldrb r1, [r4, #0xb]
	ldrb r2, [r4, #9]
	adds r0, r1, r2
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080081B0 @ =0x030000C8
	adds r0, r0, r1
	ldr r1, [r4]
	bl sub_080056D8
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl sub_08007F58
	cmp r0, #0
	bne _080081F8
	movs r0, #0x80
	bl sub_08007F58
	cmp r0, #0
	beq _080081B8
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _080081F8
	ldr r0, _080081B4 @ =0x0000039A
	bl m4aSongNumStart
	b _080081F8
	.align 2, 0
_080081AC: .4byte 0x08BFFB68
_080081B0: .4byte 0x030000C8
_080081B4: .4byte 0x0000039A
_080081B8:
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _080081CC
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _080081F8
_080081CC:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080081E0
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _080081F8
_080081E0:
	adds r0, r1, #0
	adds r0, #0x82
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1e
	cmp r0, #0
	blt _080081F8
	ldr r0, _08008218 @ =0x0000038E
	bl m4aSongNumStart
_080081F8:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008204
	b _080080EC
_08008204:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _0800820E
	b _080080EC
_0800820E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008218: .4byte 0x0000038E

	thumb_func_start sub_0800821C
sub_0800821C: @ 0x0800821C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08009D70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08008288
	ldr r4, _08008284 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq _08008288
	movs r0, #2
	bl sub_08007F58
	cmp r0, #0
	bne _08008288
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08008248
	ldr r0, [r1]
_08008248:
	movs r1, #0
	bl sub_08009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl sub_080095E4
	ldr r4, _08008284 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl sub_08009D0C
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl sub_08007F58
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008DFC
	movs r0, #1
	b _080082F8
	.align 2, 0
_08008284: .4byte 0x08BFFB68
_08008288:
	ldr r6, _080082A4 @ =0x08BFFB68
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	blo _080082AC
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, _080082A8 @ =0x08BFFCD4
	adds r1, r7, #0
	bl Proc_StartBlocking
	movs r0, #1
	b _080082F8
	.align 2, 0
_080082A4: .4byte 0x08BFFB68
_080082A8: .4byte 0x08BFFCD4
_080082AC:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne _080082E8
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008300 @ =0x030000C8
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r1, r4
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r5, r4
	lsls r4, r4, #1
	ldr r1, _08008304 @ =0x02022C60
	adds r4, r4, r1
	adds r1, r4, #0
	bl sub_08005460
	movs r0, #1
	bl TalkBgSync
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_080082E8:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _080082F6
	ldrb r0, [r1, #0x11]
	bl sub_08009E18
_080082F6:
	movs r0, #0
_080082F8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008300: .4byte 0x030000C8
_08008304: .4byte 0x02022C60

	thumb_func_start sub_08008308
sub_08008308: @ 0x08008308
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008328 @ =0x08BFFB68
	ldr r2, [r0]
	ldrb r0, [r2, #9]
	ldrb r3, [r2, #0xa]
	cmp r0, r3
	blo _08008330
	movs r0, #0
	strb r0, [r2, #0x12]
	ldr r0, _0800832C @ =0x08BFFCFC
	bl Proc_StartBlocking
	movs r0, #1
	b _0800833C
	.align 2, 0
_08008328: .4byte 0x08BFFB68
_0800832C: .4byte 0x08BFFCFC
_08008330:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne _0800833A
	movs r0, #1
	strb r0, [r2, #0x15]
_0800833A:
	movs r0, #0
_0800833C:
	pop {r1}
	bx r1

	thumb_func_start sub_08008340
sub_08008340: @ 0x08008340
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008350 @ =0x08BFFBB4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08008350: .4byte 0x08BFFBB4

	thumb_func_start sub_08008354
sub_08008354: @ 0x08008354
	push {lr}
	ldr r0, _08008368 @ =0x08BFFBB4
	bl Proc_Find
	cmp r0, #0
	beq _08008362
	movs r0, #1
_08008362:
	pop {r1}
	bx r1
	.align 2, 0
_08008368: .4byte 0x08BFFBB4

	thumb_func_start sub_0800836C
sub_0800836C: @ 0x0800836C
	push {lr}
	ldr r0, _08008378 @ =0x08BFFBB4
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08008378: .4byte 0x08BFFBB4

	thumb_func_start sub_0800837C
sub_0800837C: @ 0x0800837C
	push {r4, r5, lr}
	ldr r0, _080083BC @ =0x08BFFB68
	ldr r2, [r0]
	ldrb r1, [r2, #8]
	cmp r1, #1
	bne _080083C4
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _080083B4
	adds r5, r0, #0
_08008392:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080083C0 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #4
	bl sub_08005450
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08008392
_080083B4:
	ldr r0, _080083BC @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #4
	b _080083F6
	.align 2, 0
_080083BC: .4byte 0x08BFFB68
_080083C0: .4byte 0x030000C8
_080083C4:
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _080083F0
	adds r5, r0, #0
_080083CE:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008400 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #1
	bl sub_08005450
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _080083CE
_080083F0:
	ldr r0, _08008404 @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #1
_080083F6:
	strb r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008400: .4byte 0x030000C8
_08008404: .4byte 0x08BFFB68

	thumb_func_start sub_08008408
sub_08008408: @ 0x08008408
	push {lr}
	cmp r0, #0
	beq _0800842C
	ldr r0, _08008424 @ =0x081902C8
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08008428 @ =0x081902A8
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08008440
	.align 2, 0
_08008424: .4byte 0x081902C8
_08008428: .4byte 0x081902A8
_0800842C:
	ldr r0, _08008444 @ =0x08402A4C
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08008448 @ =0x081901C8
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_08008440:
	pop {r0}
	bx r0
	.align 2, 0
_08008444: .4byte 0x08402A4C
_08008448: .4byte 0x081901C8

	thumb_func_start sub_0800844C
sub_0800844C: @ 0x0800844C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
_08008456:
	ldr r7, _0800848C @ =0x08BFFB68
	adds r5, r7, #0
_0800845A:
	ldr r1, [r5]
	ldr r4, [r1]
	ldrb r0, [r4]
	cmp r0, #0x14
	bgt _08008490
	cmp r0, #0x12
	blt _08008490
	adds r4, #1
	str r4, [r1]
	bl sub_08009D70
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r5]
	adds r0, #2
	strb r0, [r1, #0xe]
	b _0800845A
	.align 2, 0
_0800848C: .4byte 0x08BFFB68
_08008490:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x81
	bls _0800849E
	bl _08008CA8
_0800849E:
	lsls r0, r0, #2
	ldr r1, _080084A8 @ =_080084AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080084A8: .4byte _080084AC
_080084AC: @ jump table
	.4byte _08008714 @ case 0
	.4byte _0800872A @ case 1
	.4byte _08008748 @ case 2
	.4byte _08008790 @ case 3
	.4byte _080087CC @ case 4
	.4byte _080087CC @ case 5
	.4byte _080087CC @ case 6
	.4byte _080087CC @ case 7
	.4byte _080088D0 @ case 8
	.4byte _080088D0 @ case 9
	.4byte _080088D0 @ case 10
	.4byte _080088D0 @ case 11
	.4byte _080088D0 @ case 12
	.4byte _080088D0 @ case 13
	.4byte _080088D0 @ case 14
	.4byte _080088D0 @ case 15
	.4byte _08008828 @ case 16
	.4byte _08008868 @ case 17
	.4byte _08008CA8 @ case 18
	.4byte _08008CA8 @ case 19
	.4byte _08008CA8 @ case 20
	.4byte _08008800 @ case 21
	.4byte _08008810 @ case 22
	.4byte _0800881C @ case 23
	.4byte _080088E2 @ case 24
	.4byte _0800892C @ case 25
	.4byte _08008978 @ case 26
	.4byte _080089C4 @ case 27
	.4byte _080088AC @ case 28
	.4byte _08008CA8 @ case 29
	.4byte _08008CA8 @ case 30
	.4byte _08008CA8 @ case 31
	.4byte _08008CA8 @ case 32
	.4byte _08008CA8 @ case 33
	.4byte _08008CA8 @ case 34
	.4byte _08008CA8 @ case 35
	.4byte _08008CA8 @ case 36
	.4byte _08008CA8 @ case 37
	.4byte _08008CA8 @ case 38
	.4byte _08008CA8 @ case 39
	.4byte _08008CA8 @ case 40
	.4byte _08008CA8 @ case 41
	.4byte _08008CA8 @ case 42
	.4byte _08008CA8 @ case 43
	.4byte _08008CA8 @ case 44
	.4byte _08008CA8 @ case 45
	.4byte _08008CA8 @ case 46
	.4byte _08008CA8 @ case 47
	.4byte _08008CA8 @ case 48
	.4byte _08008CA8 @ case 49
	.4byte _08008CA8 @ case 50
	.4byte _08008CA8 @ case 51
	.4byte _08008CA8 @ case 52
	.4byte _08008CA8 @ case 53
	.4byte _08008CA8 @ case 54
	.4byte _08008CA8 @ case 55
	.4byte _08008CA8 @ case 56
	.4byte _08008CA8 @ case 57
	.4byte _08008CA8 @ case 58
	.4byte _08008CA8 @ case 59
	.4byte _08008CA8 @ case 60
	.4byte _08008CA8 @ case 61
	.4byte _08008CA8 @ case 62
	.4byte _08008CA8 @ case 63
	.4byte _08008CA8 @ case 64
	.4byte _08008CA8 @ case 65
	.4byte _08008CA8 @ case 66
	.4byte _08008CA8 @ case 67
	.4byte _08008CA8 @ case 68
	.4byte _08008CA8 @ case 69
	.4byte _08008CA8 @ case 70
	.4byte _08008CA8 @ case 71
	.4byte _08008CA8 @ case 72
	.4byte _08008CA8 @ case 73
	.4byte _08008CA8 @ case 74
	.4byte _08008CA8 @ case 75
	.4byte _08008CA8 @ case 76
	.4byte _08008CA8 @ case 77
	.4byte _08008CA8 @ case 78
	.4byte _08008CA8 @ case 79
	.4byte _08008CA8 @ case 80
	.4byte _08008CA8 @ case 81
	.4byte _08008CA8 @ case 82
	.4byte _08008CA8 @ case 83
	.4byte _08008CA8 @ case 84
	.4byte _08008CA8 @ case 85
	.4byte _08008CA8 @ case 86
	.4byte _08008CA8 @ case 87
	.4byte _08008CA8 @ case 88
	.4byte _08008CA8 @ case 89
	.4byte _08008CA8 @ case 90
	.4byte _08008CA8 @ case 91
	.4byte _08008CA8 @ case 92
	.4byte _08008CA8 @ case 93
	.4byte _08008CA8 @ case 94
	.4byte _08008CA8 @ case 95
	.4byte _08008CA8 @ case 96
	.4byte _08008CA8 @ case 97
	.4byte _08008CA8 @ case 98
	.4byte _08008CA8 @ case 99
	.4byte _08008CA8 @ case 100
	.4byte _08008CA8 @ case 101
	.4byte _08008CA8 @ case 102
	.4byte _08008CA8 @ case 103
	.4byte _08008CA8 @ case 104
	.4byte _08008CA8 @ case 105
	.4byte _08008CA8 @ case 106
	.4byte _08008CA8 @ case 107
	.4byte _08008CA8 @ case 108
	.4byte _08008CA8 @ case 109
	.4byte _08008CA8 @ case 110
	.4byte _08008CA8 @ case 111
	.4byte _08008CA8 @ case 112
	.4byte _08008CA8 @ case 113
	.4byte _08008CA8 @ case 114
	.4byte _08008CA8 @ case 115
	.4byte _08008CA8 @ case 116
	.4byte _08008CA8 @ case 117
	.4byte _08008CA8 @ case 118
	.4byte _08008CA8 @ case 119
	.4byte _08008CA8 @ case 120
	.4byte _08008CA8 @ case 121
	.4byte _08008CA8 @ case 122
	.4byte _08008CA8 @ case 123
	.4byte _08008CA8 @ case 124
	.4byte _08008CA8 @ case 125
	.4byte _08008CA8 @ case 126
	.4byte _08008CA8 @ case 127
	.4byte _08008A10 @ case 128
	.4byte _080086B4 @ case 129
_080086B4:
	ldr r1, [r7]
	ldr r0, [r1]
	ldrb r2, [r0, #1]
	cmp r2, #0x40
	beq _080086C0
	b _08008CA8
_080086C0:
	adds r0, #2
	str r0, [r1]
	ldrb r3, [r1, #0xb]
	ldrb r2, [r1, #9]
	adds r0, r3, r2
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0800870C @ =0x030000C8
	adds r0, r0, r1
	movs r1, #6
	bl sub_08005448
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080086E8
	b _080087DC
_080086E8:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080087DC
	ldr r0, _08008710 @ =0x08BFFBDC
	mov r1, r8
	bl Proc_StartBlocking
	adds r4, r0, #0
	movs r0, #4
	bl sub_080095D4
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
_08008706:
	movs r0, #3
	b _08008CAA
	.align 2, 0
_0800870C: .4byte 0x030000C8
_08008710: .4byte 0x08BFFBDC
_08008714:
	ldr r1, [r7]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08008720
_0800871C:
	movs r0, #0
	b _08008CAA
_08008720:
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	str r0, [r1, #4]
	b _08008456
_0800872A:
	ldr r1, [r7]
	ldrb r3, [r1, #0x15]
	cmp r3, #1
	beq _08008738
	ldrb r0, [r1, #9]
	cmp r0, #1
	bne _0800873E
_08008738:
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
_0800873E:
	ldr r1, [r7]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldr r1, [r7]
	b _080087D6
_08008748:
	movs r0, #0x80
	bl sub_08007F58
	cmp r0, #0
	beq _08008768
	bl sub_08009598
	ldr r0, _08008764 @ =0x08BFFB68
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08008784
	.align 2, 0
_08008764: .4byte 0x08BFFB68
_08008768:
	movs r0, #1
	bl sub_08007F58
	cmp r0, #0
	bne _08008780
	ldr r0, _0800877C @ =0x08BFFC7C
	mov r1, r8
	bl Proc_StartBlocking
	b _08008784
	.align 2, 0
_0800877C: .4byte 0x08BFFC7C
_08008780:
	bl sub_0800968C
_08008784:
	ldr r0, _0800878C @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_0800878C: .4byte 0x08BFFB68
_08008790:
	ldr r1, [r7]
	ldrb r2, [r1, #0xb]
	ldrb r3, [r1, #9]
	adds r0, r2, r3
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080087C8 @ =0x030000C8
	adds r0, r0, r1
	bl sub_08005440
	ldr r3, [r7]
	ldrb r2, [r3, #0xc]
	lsls r1, r2, #3
	adds r1, r1, r0
	adds r1, #4
	ldrb r0, [r3, #0xd]
	lsls r2, r0, #3
	ldrb r3, [r3, #9]
	lsls r0, r3, #4
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl sub_0800914C
	b _08008BBA
	.align 2, 0
_080087C8: .4byte 0x030000C8
_080087CC:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080087E0
_080087D6:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_080087DC:
	movs r0, #2
	b _08008CAA
_080087E0:
	ldr r0, _080087FC @ =0x08BFFBDC
	mov r1, r8
	bl Proc_StartBlocking
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	bl sub_080095D4
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	b _08008BBA
	.align 2, 0
_080087FC: .4byte 0x08BFFBDC
_08008800:
	bl sub_080095E4
	ldr r0, _0800880C @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_0800880C: .4byte 0x08BFFB68
_08008810:
	ldr r1, [r7]
	movs r0, #1
	ldrb r2, [r1, #0x16]
	subs r0, r0, r2
	strb r0, [r1, #0x16]
	b _08008BBA
_0800881C:
	ldr r1, [r7]
	movs r0, #1
	ldrb r3, [r1, #0x17]
	subs r0, r0, r3
	strb r0, [r1, #0x17]
	b _08008BBA
_08008828:
	ldr r4, _08008840 @ =0x08BFFB68
_0800882A:
	ldr r2, [r4]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #8
	bge _08008836
	b _08008706
_08008836:
	cmp r0, #0xf
	ble _08008844
	cmp r0, #0x10
	beq _08008854
	b _08008706
	.align 2, 0
_08008840: .4byte 0x08BFFB68
_08008844:
	subs r0, #8
	bl sub_08008CB8
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _0800882A
_08008854:
	adds r0, r1, #1
	str r0, [r2]
	mov r0, r8
	bl sub_08008CC4
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	b _0800882A
_08008868:
	bl sub_08009D70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08008876
	bl sub_080095E4
_08008876:
	ldr r4, _080088A8 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080073F4
	ldr r2, [r4]
	ldrb r3, [r2, #0x11]
	lsls r1, r3, #2
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	mov r0, r8
	movs r1, #0x10
	bl sub_080149B4
	b _08008706
	.align 2, 0
_080088A8: .4byte 0x08BFFB68
_080088AC:
	movs r0, #0x10
	bl sub_08007F58
	cmp r0, #0
	beq _080088BE
	movs r0, #0x10
	bl sub_08007F44
	b _080088C4
_080088BE:
	movs r0, #0x10
	bl sub_08007F24
_080088C4:
	ldr r0, _080088CC @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_080088CC: .4byte 0x08BFFB68
_080088D0:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl sub_08009E24
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #8
	b _08008BB6
_080088E2:
	ldr r6, _08008920 @ =0x08BFFC9C
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008924 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008928 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_08008920: .4byte 0x08BFFC9C
_08008924: .4byte 0x030000C8
_08008928: .4byte 0x02022C60
_0800892C:
	ldr r6, _0800896C @ =0x08BFFC9C
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008970 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008974 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_0800896C: .4byte 0x08BFFC9C
_08008970: .4byte 0x030000C8
_08008974: .4byte 0x02022C60
_08008978:
	ldr r6, _080089B8 @ =0x08BFFCAC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _080089BC @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _080089C0 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_080089B8: .4byte 0x08BFFCAC
_080089BC: .4byte 0x030000C8
_080089C0: .4byte 0x02022C60
_080089C4:
	ldr r6, _08008A04 @ =0x08BFFCAC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008A08 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008A0C @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_08008A04: .4byte 0x08BFFCAC
_08008A08: .4byte 0x030000C8
_08008A0C: .4byte 0x02022C60
_08008A10:
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #0x25
	bls _08008A20
	b _0800871C
_08008A20:
	lsls r0, r0, #2
	ldr r1, _08008A2C @ =_08008A30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008A2C: .4byte _08008A30
_08008A30: @ jump table
	.4byte _08008AEC @ case 0
	.4byte _08008AEC @ case 1
	.4byte _08008AEC @ case 2
	.4byte _08008AEC @ case 3
	.4byte _08008B3E @ case 4
	.4byte _08008B50 @ case 5
	.4byte _08008B88 @ case 6
	.4byte _08008BBA @ case 7
	.4byte _08008BBA @ case 8
	.4byte _0800871C @ case 9
	.4byte _08008BA0 @ case 10
	.4byte _08008BA0 @ case 11
	.4byte _08008BA0 @ case 12
	.4byte _08008BA0 @ case 13
	.4byte _08008BA0 @ case 14
	.4byte _08008BA0 @ case 15
	.4byte _08008BA0 @ case 16
	.4byte _08008BA0 @ case 17
	.4byte _0800871C @ case 18
	.4byte _0800871C @ case 19
	.4byte _0800871C @ case 20
	.4byte _0800871C @ case 21
	.4byte _08008BC4 @ case 22
	.4byte _08008BDA @ case 23
	.4byte _08008BF0 @ case 24
	.4byte _08008C06 @ case 25
	.4byte _08008C1C @ case 26
	.4byte _08008C32 @ case 27
	.4byte _08008C4C @ case 28
	.4byte _08008C62 @ case 29
	.4byte _08008C78 @ case 30
	.4byte _08008C8E @ case 31
	.4byte _08008B70 @ case 32
	.4byte _08008AD8 @ case 33
	.4byte _0800871C @ case 34
	.4byte _0800871C @ case 35
	.4byte _08008AC8 @ case 36
	.4byte _08008B2C @ case 37
_08008AC8:
	ldr r0, [r7]
	ldr r1, [r0, #0x38]
	cmp r1, #0
	beq _08008BBA
	mov r0, r8
	bl _call_via_r1
	b _08008BBA
_08008AD8:
	bl sub_0800837C
	ldr r0, _08008AE8 @ =0x08BFFB68
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008AE8: .4byte 0x08BFFB68
_08008AEC:
	ldr r3, _08008B24 @ =0x08BFFB68
	ldr r1, [r3]
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r3]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08008B1E
	adds r6, r3, #0
	ldr r5, _08008B28 @ =0x030000C8
_08008B08:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl sub_08005450
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08008B08
_08008B1E:
	ldr r0, _08008B24 @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_08008B24: .4byte 0x08BFFB68
_08008B28: .4byte 0x030000C8
_08008B2C:
	ldr r2, [r7]
	adds r2, #0x83
	movs r1, #1
	ldrb r3, [r2]
	ands r1, r3
	movs r0, #3
	subs r0, r0, r1
	strb r0, [r2]
	b _08008BBA
_08008B3E:
	mov r0, r8
	bl sub_08008340
	ldr r0, _08008B4C @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_08008B4C: .4byte 0x08BFFB68
_08008B50:
	ldr r4, _08008B6C @ =0x08BFFB68
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	adds r1, #0x40
	bl sub_080149EC
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008B6C: .4byte 0x08BFFB68
_08008B70:
	ldr r4, _08008B84 @ =0x08BFFB68
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	bl sub_0802EBB0
	ldr r1, [r4]
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008B84: .4byte 0x08BFFB68
_08008B88:
	ldr r0, _08008B9C @ =0x08BFFB68
	ldr r1, [r0]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x60
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008B9C: .4byte 0x08BFFB68
_08008BA0:
	ldr r1, [r7]
	ldrb r0, [r1, #0x11]
	ldr r1, [r1]
	ldrb r1, [r1]
	subs r1, #0xa
	bl sub_08008E58
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0xa
_08008BB6:
	bl sub_08008CB8
_08008BBA:
	ldr r1, [r7]
_08008BBC:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08008706
_08008BC4:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08008C46
_08008BDA:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #1
	b _08008C46
_08008BF0:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08008C46
_08008C06:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08008C46
_08008C1C:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
	b _08008C46
_08008C32:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #5
_08008C46:
	bl sub_080078D4
	b _08008706
_08008C4C:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08008CA2
_08008C62:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08008CA2
_08008C78:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08008CA2
_08008C8E:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
_08008CA2:
	bl sub_0800796C
	b _08008706
_08008CA8:
	movs r0, #1
_08008CAA:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08008CB8
sub_08008CB8: @ 0x08008CB8
	ldr r1, _08008CC0 @ =0x08BFFB68
	ldr r1, [r1]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08008CC0: .4byte 0x08BFFB68

	thumb_func_start sub_08008CC4
sub_08008CC4: @ 0x08008CC4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08008CEC @ =0x08BFFB68
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	bne _08008CDA
	movs r0, #1
	bl sub_08008CB8
_08008CDA:
	bl sub_0804B9C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08008CF0
	bl sub_0800EC74
	b _08008CF2
	.align 2, 0
_08008CEC: .4byte 0x08BFFB68
_08008CF0:
	movs r6, #2
_08008CF2:
	ldr r4, _08008D24 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	bl sub_08009D94
	cmp r0, #0xe
	bgt _08008D04
	movs r0, #1
	orrs r6, r0
_08008D04:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r4, r1, #8
	ldrb r0, [r0]
	orrs r4, r0
	ldr r0, _08008D28 @ =0x0000FFFF
	cmp r4, r0
	bne _08008D30
	ldr r0, _08008D2C @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitPortraitId
	adds r4, r0, #0
	b _08008D34
	.align 2, 0
_08008D24: .4byte 0x08BFFB68
_08008D28: .4byte 0x0000FFFF
_08008D2C: .4byte gActiveUnit
_08008D30:
	ldr r2, _08008D50 @ =0xFFFFFF00
	adds r4, r4, r2
_08008D34:
	ldr r5, _08008D54 @ =0x08BFFB68
	ldr r0, [r5]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008D58
	adds r1, r4, #0
	bl sub_08007C48
	b _08008DA0
	.align 2, 0
_08008D50: .4byte 0xFFFFFF00
_08008D54: .4byte 0x08BFFB68
_08008D58:
	adds r0, r2, #0
	bl sub_08009D94
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r0, r4, #0
	movs r2, #0x50
	adds r3, r6, #0
	bl sub_08006A98
	ldr r3, [r5]
	ldrb r2, [r3, #0x11]
	lsls r1, r2, #2
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r2, r1
	str r0, [r1]
	ldrb r3, [r3, #0x11]
	lsls r0, r3, #2
	adds r2, r2, r0
	ldr r0, [r2]
	bl sub_080073AC
	ldr r0, [r5]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl sub_08007F58
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008DFC
	adds r0, r7, #0
	movs r1, #8
	bl sub_080149B4
_08008DA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08008DA8
sub_08008DA8: @ 0x08008DA8
	push {r4, lr}
	ldr r4, [sp, #8]
	bl sub_08006A98
	ldr r1, _08008DC4 @ =0x08BFFB68
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x18
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008DC4: .4byte 0x08BFFB68

	thumb_func_start sub_08008DC8
sub_08008DC8: @ 0x08008DC8
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08008DE4 @ =0x030040E0
_08008DD0:
	ldr r0, [r2]
	cmp r0, #0
	beq _08008DE8
	movs r4, #0x34
	ldrsh r0, [r0, r4]
	cmp r0, r3
	bne _08008DE8
	adds r0, r1, #0
	b _08008DF4
	.align 2, 0
_08008DE4: .4byte 0x030040E0
_08008DE8:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08008DD0
	movs r0, #1
	rsbs r0, r0, #0
_08008DF4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08008DFC
sub_08008DFC: @ 0x08008DFC
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r1, #0
	beq _08008E0A
	movs r6, #6
	movs r5, #5
	b _08008E0E
_08008E0A:
	movs r6, #5
	movs r5, #6
_08008E0E:
	cmp r3, #0
	blt _08008E1A
	cmp r3, #2
	ble _08008E1A
	cmp r3, #5
	ble _08008E20
_08008E1A:
	movs r1, #0
	movs r4, #2
	b _08008E24
_08008E20:
	movs r1, #3
	movs r4, #5
_08008E24:
	adds r2, r1, #0
	cmp r2, r4
	bgt _08008E52
	ldr r7, _08008E44 @ =0x08BFFB68
_08008E2C:
	ldr r0, [r7]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008E4C
	cmp r2, r3
	bne _08008E48
	adds r0, #0x41
	strb r6, [r0]
	b _08008E4C
	.align 2, 0
_08008E44: .4byte 0x08BFFB68
_08008E48:
	adds r0, #0x41
	strb r5, [r0]
_08008E4C:
	adds r2, #1
	cmp r2, r4
	ble _08008E2C
_08008E52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08008E58
sub_08008E58: @ 0x08008E58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r7, #0
	ldr r0, _08008EAC @ =0x08BFFB68
	mov r8, r0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, #0x18
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _08008E82
	movs r7, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08008ECC
_08008E82:
	adds r2, r7, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008ECC
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r5, #2
	adds r0, #0x18
	adds r2, r0, r2
	ldr r3, [r2]
	adds r0, r0, r6
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008EAC: .4byte 0x08BFFB68

	thumb_func_start sub_08008EB0
sub_08008EB0: @ 0x08008EB0
	push {lr}
	ldr r0, _08008EC0 @ =0x08BFFBBC
	bl Proc_Find
	cmp r0, #0
	bne _08008EC4
	movs r0, #0
	b _08008EC6
	.align 2, 0
_08008EC0: .4byte 0x08BFFBBC
_08008EC4:
	movs r0, #1
_08008EC6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08008ECC
sub_08008ECC: @ 0x08008ECC
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl sub_08009D94
	lsls r0, r0, #3
	bl sub_08008DC8
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08008F14
	ldr r0, _08008F1C @ =0x08BFFBBC
	ldr r1, _08008F20 @ =0x030040E0
	lsls r4, r5, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl Proc_Start
	adds r3, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
_08008F14:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008F1C: .4byte 0x08BFFBBC
_08008F20: .4byte 0x030040E0

	thumb_func_start sub_08008F24
sub_08008F24: @ 0x08008F24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x58]
	adds r4, r6, #0
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08009D94
	adds r5, r6, #0
	adds r5, #0x68
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0
	bge _08008F5E
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08009D94
	lsls r0, r0, #3
	movs r2, #0
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r0, #0x18
	bgt _08008F72
	b _08008F76
_08008F5E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08009D94
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0x18
	ble _08008F76
_08008F72:
	movs r0, #0x20
	b _08008F78
_08008F76:
	movs r0, #0x10
_08008F78:
	str r0, [r6, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08008F80
sub_08008F80: @ 0x08008F80
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	cmp r2, #0x10
	ble _08008FF4
	adds r1, r2, #0
	cmp r2, #0
	bge _08008F94
	adds r1, r2, #7
_08008F94:
	asrs r1, r1, #3
	ldr r0, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, r1
	bne _08008FB2
	ldr r1, _08008FF0 @ =0x030040E0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08008FB2:
	ldr r0, [r4, #0x5c]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	cmp r1, r0
	bne _08008FD2
	ldr r1, _08008FF0 @ =0x030040E0
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
_08008FD2:
	ldr r1, [r4, #0x5c]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08008FDE
	adds r0, #7
_08008FDE:
	asrs r1, r0, #3
	ldr r0, [r4, #0x58]
	cmp r0, r1
	bne _08009016
	ldr r1, _08008FF0 @ =0x030040E0
	movs r2, #0
	ldrsh r0, [r5, r2]
	b _0800900A
	.align 2, 0
_08008FF0: .4byte 0x030040E0
_08008FF4:
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r1, r0
	bne _08009016
	ldr r1, _08009038 @ =0x030040E0
	movs r3, #0
	ldrsh r0, [r5, r3]
_0800900A:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08009016:
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	blt _0800903C
	ldr r1, _08009038 @ =0x030040E0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
	adds r0, r4, #0
	bl Proc_Break
	b _08009074
	.align 2, 0
_08009038: .4byte 0x030040E0
_0800903C:
	adds r0, r4, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl sub_08009D94
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x58]
	adds r3, r0, #0
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	ldr r2, _0800907C @ =0x030040E0
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	strh r0, [r1, #0x34]
_08009074:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800907C: .4byte 0x030040E0

	thumb_func_start sub_08009080
sub_08009080: @ 0x08009080
	push {lr}
	ldr r0, _08009094 @ =0x08BFFB6C
	bl sub_08004748
	ldr r0, _08009098 @ =0x08BFFC7C
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08009094: .4byte 0x08BFFB6C
_08009098: .4byte 0x08BFFC7C

	thumb_func_start sub_0800909C
sub_0800909C: @ 0x0800909C
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _080090B6
	adds r0, r2, #0
	bl Proc_Break
	b _080090BA
_080090B6:
	subs r0, r3, #1
	strh r0, [r1]
_080090BA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080090C0
sub_080090C0: @ 0x080090C0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x80
	bl sub_08007F58
	cmp r0, #0
	bne _08009100
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _080090FC @ =0x08BFFC3C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	bl sub_08006884
	b _08009120
	.align 2, 0
_080090FC: .4byte 0x08BFFC3C
_08009100:
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _0800913C @ =0x08BFFC3C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _08009140 @ =0x0000B2BF
	str r0, [sp]
	movs r0, #0
	bl sub_08006884
_08009120:
	ldr r0, _08009144 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08009134
	adds r0, r5, #0
	bl Proc_Break
_08009134:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800913C: .4byte 0x08BFFC3C
_08009140: .4byte 0x0000B2BF
_08009144: .4byte gpKeySt

	thumb_func_start nullsub_24
nullsub_24: @ 0x08009148
	bx lr
	.align 2, 0

	thumb_func_start sub_0800914C
sub_0800914C: @ 0x0800914C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08009174 @ =0x08BFFBFC
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009174: .4byte 0x08BFFBFC

	thumb_func_start sub_08009178
sub_08009178: @ 0x08009178
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080091A8 @ =0x08BFFBFC
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080091A8: .4byte 0x08BFFBFC

	thumb_func_start sub_080091AC
sub_080091AC: @ 0x080091AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080091F4 @ =0x08BFFB68
	ldr r2, [r4]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _080091F8 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl TalkBgSync
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _080091FC
	adds r1, r5, #0
	adds r1, #0x66
	movs r0, #0x10
	strh r0, [r1]
	b _08009212
	.align 2, 0
_080091F4: .4byte 0x08BFFB68
_080091F8: .4byte 0x02022C60
_080091FC:
	ldrb r0, [r1, #9]
	adds r0, #1
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	blt _0800920A
	lsls r1, r1, #4
	b _0800920C
_0800920A:
	lsls r1, r0, #4
_0800920C:
	adds r0, r5, #0
	adds r0, #0x66
	strh r1, [r0]
_08009212:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08009218
sub_08009218: @ 0x08009218
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	adds r0, r5, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _08009254
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_08009628
	adds r0, r5, #0
	bl Proc_Break
_08009254:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800925C
sub_0800925C: @ 0x0800925C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	adds r0, r6, #0
	bl sub_08005440
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl sub_080059DC
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl sub_080059DC
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08005460
	movs r0, #1
	bl TalkBgSync
	ldr r0, _08009304 @ =0x08BFFCBC
	ldr r1, [sp, #0x20]
	bl Proc_StartBlocking
	adds r1, r0, #0
	mov r3, sb
	strh r3, [r1, #0x2a]
	ldr r0, _08009308 @ =0x02022C60
	subs r5, r5, r0
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #3
	ldr r2, _0800930C @ =0x03002790
	ldrh r3, [r2, #0x1c]
	subs r0, r0, r3
	add r0, r8
	strh r0, [r1, #0x2c]
	cmp r5, #0
	bge _080092D8
	adds r5, #0x1f
_080092D8:
	asrs r0, r5, #5
	lsls r0, r0, #3
	ldrh r2, [r2, #0x1e]
	subs r0, r0, r2
	strh r0, [r1, #0x2e]
	str r7, [r1, #0x34]
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r7
	subs r0, #8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _080092F6
	bl _call_via_r0
_080092F6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009304: .4byte 0x08BFFCBC
_08009308: .4byte 0x02022C60
_0800930C: .4byte 0x03002790

	thumb_func_start sub_08009310
sub_08009310: @ 0x08009310
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800933C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800934C
	ldr r0, _08009340 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009334
	ldr r0, _08009344 @ =0x0000038B
	bl m4aSongNumStart
_08009334:
	ldr r1, _08009348 @ =0x030000E0
	movs r0, #0
	b _0800936E
	.align 2, 0
_0800933C: .4byte gpKeySt
_08009340: .4byte gPlaySt
_08009344: .4byte 0x0000038B
_08009348: .4byte 0x030000E0
_0800934C:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08009384
	ldr r0, _08009378 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009368
	ldr r0, _0800937C @ =0x0000038A
	bl m4aSongNumStart
_08009368:
	ldr r1, _08009380 @ =0x030000E0
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
_0800936E:
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08009404
	.align 2, 0
_08009378: .4byte gPlaySt
_0800937C: .4byte 0x0000038A
_08009380: .4byte 0x030000E0
_08009384:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080093B2
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	bne _080093B2
	ldr r0, _0800940C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080093A4
	ldr r0, _08009410 @ =0x00000387
	bl m4aSongNumStart
_080093A4:
	strh r5, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _080093B2
	bl _call_via_r0
_080093B2:
	ldr r0, _08009414 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080093E8
	ldrh r1, [r4, #0x2a]
	cmp r1, #1
	bne _080093E8
	ldr r0, _0800940C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080093D8
	ldr r0, _08009410 @ =0x00000387
	bl m4aSongNumStart
_080093D8:
	movs r0, #2
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _080093E8
	bl _call_via_r0
_080093E8:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl sub_0804A740
_08009404:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800940C: .4byte gPlaySt
_08009410: .4byte 0x00000387
_08009414: .4byte gpKeySt

	thumb_func_start sub_08009418
sub_08009418: @ 0x08009418
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08009450 @ =0x08BFFB68
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _08009454 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl TalkBgSync
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009450: .4byte 0x08BFFB68
_08009454: .4byte 0x02022C60

	thumb_func_start sub_08009458
sub_08009458: @ 0x08009458
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _08009538
	ldr r4, _08009540 @ =0x08BFFB68
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	bge _080094D6
	adds r6, r4, #0
_080094A2:
	ldr r4, [r6]
	ldrb r2, [r4, #0xb]
	adds r0, r2, r5
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08009544 @ =0x030000C8
	adds r0, r0, r1
	lsls r1, r5, #1
	ldrb r2, [r4, #0xd]
	adds r1, r2, r1
	lsls r1, r1, #5
	ldrb r4, [r4, #0xc]
	adds r1, r4, r1
	lsls r1, r1, #1
	ldr r2, _08009548 @ =0x02022C60
	adds r1, r1, r2
	bl sub_08005460
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	blt _080094A2
_080094D6:
	ldr r4, _08009540 @ =0x08BFFB68
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	subs r0, #1
	lsls r0, r0, #1
	ldrb r1, [r2, #0xd]
	adds r0, r1, r0
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _08009548 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	ldr r5, _08009544 @ =0x030000C8
	adds r0, r0, r5
	bl sub_080053B0
	ldr r4, [r4]
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4, #8]
	bl sub_08005450
	movs r0, #1
	bl TalkBgSync
	adds r0, r7, #0
	bl Proc_Break
_08009538:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009540: .4byte 0x08BFFB68
_08009544: .4byte 0x030000C8
_08009548: .4byte 0x02022C60

	thumb_func_start sub_0800954C
sub_0800954C: @ 0x0800954C
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, _08009560 @ =0x44444444
	movs r1, #0x19
	bl sub_0800A530
	pop {r0}
	bx r0
	.align 2, 0
_08009560: .4byte 0x44444444

	thumb_func_start sub_08009564
sub_08009564: @ 0x08009564
	push {r4, lr}
	ldr r0, _08009590 @ =0x08BFFB68
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r4, _08009594 @ =0x030000D0
	adds r0, r4, #0
	bl sub_08005B2C
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005450
	adds r0, r4, #0
	movs r1, #4
	bl sub_08005444
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009590: .4byte 0x08BFFB68
_08009594: .4byte 0x030000D0

	thumb_func_start sub_08009598
sub_08009598: @ 0x08009598
	push {r4, r5, lr}
	ldr r0, _080095CC @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
_080095A4:
	lsls r4, r5, #3
	ldr r0, _080095D0 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_08005B2C
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005450
	adds r0, r4, #0
	movs r1, #4
	bl sub_08005444
	adds r5, #1
	cmp r5, #1
	ble _080095A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080095CC: .4byte 0x08BFFB68
_080095D0: .4byte 0x030000C8

	thumb_func_start sub_080095D4
sub_080095D4: @ 0x080095D4
	ldr r1, _080095E0 @ =0x08BFFD2C
	subs r0, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080095E0: .4byte 0x08BFFD2C

	thumb_func_start sub_080095E4
sub_080095E4: @ 0x080095E4
	push {lr}
	ldr r0, _0800961C @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, _08009620 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r0, #2
	bl TalkBgSync
	bl sub_08009628
	ldr r2, _08009624 @ =0x03002790
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
	pop {r0}
	bx r0
	.align 2, 0
_0800961C: .4byte 0x08BFFB68
_08009620: .4byte 0x02023460
_08009624: .4byte 0x03002790

	thumb_func_start sub_08009628
sub_08009628: @ 0x08009628
	push {r4, r5, r6, lr}
	ldr r0, _08009680 @ =0x02022C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #1
	bl TalkBgSync
	ldr r2, _08009684 @ =0x08BFFB68
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _0800967A
	adds r6, r2, #0
_0800965A:
	lsls r4, r5, #3
	ldr r0, _08009688 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_080053B0
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl sub_08005450
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _0800965A
_0800967A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009680: .4byte 0x02022C60
_08009684: .4byte 0x08BFFB68
_08009688: .4byte 0x030000C8

	thumb_func_start sub_0800968C
sub_0800968C: @ 0x0800968C
	push {r4, r5, r6, lr}
	ldr r2, _080096D8 @ =0x08BFFB68
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _080096D0
	adds r6, r2, #0
_080096B0:
	lsls r4, r5, #3
	ldr r0, _080096DC @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_080053B0
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl sub_08005450
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _080096B0
_080096D0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080096D8: .4byte 0x08BFFB68
_080096DC: .4byte 0x030000C8

	thumb_func_start sub_080096E0
sub_080096E0: @ 0x080096E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sl, r1
	adds r4, r2, #0
	str r3, [sp, #4]
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r0, _08009730 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r7, #1
	cmp r5, #0xf
	bgt _0800970A
	movs r7, #0
_0800970A:
	bl sub_0804B9C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009716
	adds r7, #2
_08009716:
	mov r1, sl
	ldr r2, [sp, #4]
	subs r0, r1, r2
	adds r0, #1
	mov sb, r0
	cmp r7, #1
	beq _08009752
	cmp r7, #1
	bgt _08009734
	cmp r7, #0
	beq _0800973E
	b _08009796
	.align 2, 0
_08009730: .4byte 0x02023460
_08009734:
	cmp r7, #2
	beq _08009776
	cmp r7, #3
	beq _08009788
	b _08009796
_0800973E:
	adds r5, #3
	mov r8, r5
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r6, r5, r0
	cmp r6, #0
	bgt _08009796
	movs r6, #1
	b _08009796
_08009752:
	subs r5, #5
	mov r8, r5
	adds r0, r4, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, r8
	cmp r0, #0x1d
	ble _0800976A
	movs r0, #0x1d
	subs r6, r0, r4
	b _08009796
_0800976A:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r1, r8
	subs r6, r1, r0
	b _08009796
_08009776:
	movs r6, #9
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	movs r0, #8
	mov r8, r0
	movs r1, #0x10
	mov sl, r1
	b _08009796
_08009788:
	movs r6, #1
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	mov r8, r4
	movs r0, #0x10
	mov sl, r0
_08009796:
	ldr r5, _08009818 @ =0x08BFFB68
	ldr r1, [r5]
	adds r0, r6, #1
	strb r0, [r1, #0xc]
	ldr r1, [r5]
	mov r0, sb
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r1, [sp, #4]
	str r1, [sp]
	movs r0, #1
	adds r1, r6, #0
	mov r2, sb
	adds r3, r4, #0
	bl sub_08009AA8
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080097D8
	movs r0, #1
	ands r0, r1
	bl sub_08008408
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #2
	ldrb r2, [r1]
	eors r0, r2
	strb r0, [r1]
_080097D8:
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080097F2
	movs r0, #1
	mov r1, r8
	mov r2, sl
	adds r3, r7, #0
	bl sub_08009920
_080097F2:
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl sub_080098A0
	bl sub_0800981C
	movs r0, #2
	bl TalkBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009818: .4byte 0x08BFFB68

	thumb_func_start sub_0800981C
sub_0800981C: @ 0x0800981C
	push {lr}
	ldr r0, _08009830 @ =0x08BFFD3C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08009830: .4byte 0x08BFFD3C

	thumb_func_start sub_08009834
sub_08009834: @ 0x08009834
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _08009898 @ =0x0818F93C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x64
	ldrh r1, [r5]
	adds r2, r1, #1
	strh r2, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08009890
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #2
	add r0, sp
	ldr r4, [r0]
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0800989C @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08013688
	ldrh r5, [r5]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x11
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	bne _08009890
	adds r0, r6, #0
	bl Proc_Break
_08009890:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009898: .4byte 0x0818F93C
_0800989C: .4byte 0x06000200

	thumb_func_start sub_080098A0
sub_080098A0: @ 0x080098A0
	push {r4, r5, r6, lr}
	ldr r4, _0800991C @ =0x03002790
	mov ip, r4
	movs r4, #0x20
	mov r5, ip
	ldrb r5, [r5, #1]
	orrs r4, r5
	movs r5, #0x41
	rsbs r5, r5, #0
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	mov r6, ip
	strb r4, [r6, #1]
	adds r4, r0, #1
	lsls r4, r4, #3
	mov r5, ip
	adds r5, #0x2d
	strb r4, [r5]
	adds r4, r1, #1
	lsls r4, r4, #3
	adds r5, #4
	strb r4, [r5]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #3
	mov r2, ip
	adds r2, #0x2c
	strb r0, [r2]
	adds r1, r1, r3
	subs r1, #1
	lsls r1, r1, #3
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x34
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800991C: .4byte 0x03002790

	thumb_func_start sub_08009920
sub_08009920: @ 0x08009920
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl sub_08002BC0
	adds r3, r0, #0
	cmp r6, #5
	bls _08009934
	b _08009A96
_08009934:
	lsls r0, r6, #2
	ldr r1, _08009940 @ =_08009944
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009940: .4byte _08009944
_08009944: @ jump table
	.4byte _0800995C @ case 0
	.4byte _08009990 @ case 1
	.4byte _080099C8 @ case 2
	.4byte _080099FC @ case 3
	.4byte _08009A34 @ case 4
	.4byte _08009A6C @ case 5
_0800995C:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08009984 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08009988 @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _0800998C @ =0x00003416
	adds r1, r3, #0
	strh r1, [r0]
	adds r2, #1
	b _08009A92
	.align 2, 0
_08009984: .4byte 0x00003014
_08009988: .4byte 0x00003414
_0800998C: .4byte 0x00003416
_08009990:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _080099B8 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _080099BC @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080099C0 @ =0x00003015
	adds r1, r3, #0
	strh r1, [r0]
	ldr r2, _080099C4 @ =0x00003016
	b _08009A92
	.align 2, 0
_080099B8: .4byte 0x00003014
_080099BC: .4byte 0x00003414
_080099C0: .4byte 0x00003015
_080099C4: .4byte 0x00003016
_080099C8:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _080099F0 @ =0x00003418
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080099F4 @ =0x00003419
	adds r1, r3, #0
	strh r1, [r0]
	subs r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _080099F8 @ =0x00003C17
	b _08009A92
	.align 2, 0
_080099F0: .4byte 0x00003418
_080099F4: .4byte 0x00003419
_080099F8: .4byte 0x00003C17
_080099FC:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009A24 @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009A28 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009A2C @ =0x00003018
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009A30 @ =0x00003019
	b _08009A92
	.align 2, 0
_08009A24: .4byte 0x00003017
_08009A28: .4byte 0x00003817
_08009A2C: .4byte 0x00003018
_08009A30: .4byte 0x00003019
_08009A34:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009A5C @ =0x00003C19
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009A60 @ =0x00003C18
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009A64 @ =0x00003417
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009A68 @ =0x00003C17
	b _08009A92
	.align 2, 0
_08009A5C: .4byte 0x00003C19
_08009A60: .4byte 0x00003C18
_08009A64: .4byte 0x00003417
_08009A68: .4byte 0x00003C17
_08009A6C:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009A9C @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009AA0 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	adds r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009AA4 @ =0x00003818
_08009A92:
	adds r1, r2, #0
	strh r1, [r0, #2]
_08009A96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009A9C: .4byte 0x00003017
_08009AA0: .4byte 0x00003817
_08009AA4: .4byte 0x00003818

	thumb_func_start sub_08009AA8
sub_08009AA8: @ 0x08009AA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	str r2, [sp]
	adds r5, r3, #0
	ldr r4, [sp, #0x28]
	bl sub_08002BC0
	adds r7, r0, #0
	subs r5, #1
	subs r4, #1
	mov r0, r8
	adds r3, r0, r5
	cmp r8, r3
	bge _08009B00
	ldr r1, _08009BC0 @ =0x00003011
	mov sb, r1
	ldr r2, [sp]
	adds r0, r2, r4
	mov r6, r8
	lsls r1, r6, #1
	lsls r0, r0, #6
	adds r0, r0, r7
	adds r2, r1, r0
	ldr r6, [sp]
	lsls r0, r6, #6
	adds r0, r0, r7
	adds r1, r1, r0
	ldr r6, _08009BC4 @ =0x00003811
	adds r0, r6, #0
	mov r6, r8
	subs r3, r3, r6
_08009AF0:
	mov r6, sb
	strh r6, [r1]
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08009AF0
_08009B00:
	ldr r3, [sp]
	add r5, r8
	mov ip, r5
	lsls r0, r3, #5
	str r0, [sp, #4]
	adds r4, r4, r3
	mov sb, r4
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r3, sb
	bge _08009B44
	ldr r2, _08009BC8 @ =0x00003012
	adds r6, r2, #0
	ldr r4, _08009BCC @ =0x00003412
	adds r5, r4, #0
	lsls r0, r3, #6
	mov r2, ip
	lsls r1, r2, #1
	adds r1, r1, r7
	adds r2, r0, r1
	mov r4, r8
	lsls r1, r4, #1
	adds r1, r1, r7
	adds r0, r0, r1
	mov r1, sb
	subs r3, r1, r3
_08009B36:
	strh r6, [r0]
	strh r5, [r2]
	adds r2, #0x40
	adds r0, #0x40
	subs r3, #1
	cmp r3, #0
	bne _08009B36
_08009B44:
	mov r3, sl
	cmp r3, ip
	bge _08009B76
	mov r5, sb
	mov sl, ip
_08009B4E:
	ldr r2, [sp]
	adds r2, #1
	adds r4, r3, #1
	cmp r2, r5
	bge _08009B70
	ldr r0, _08009BD0 @ =0x00003013
	adds r6, r0, #0
	lsls r1, r2, #6
	lsls r0, r3, #1
	adds r0, r0, r7
	adds r0, r1, r0
	subs r2, r5, r2
_08009B66:
	strh r6, [r0]
	adds r0, #0x40
	subs r2, #1
	cmp r2, #0
	bne _08009B66
_08009B70:
	adds r3, r4, #0
	cmp r3, sl
	blt _08009B4E
_08009B76:
	ldr r0, [sp, #4]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r2, _08009BD4 @ =0x00003010
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08009BD8 @ =0x00003410
	adds r1, r3, #0
	strh r1, [r0]
	mov r4, sb
	lsls r1, r4, #5
	mov r6, r8
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08009BDC @ =0x00003810
	adds r2, r3, #0
	strh r2, [r0]
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r4, _08009BE0 @ =0x00003C10
	adds r0, r4, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009BC0: .4byte 0x00003011
_08009BC4: .4byte 0x00003811
_08009BC8: .4byte 0x00003012
_08009BCC: .4byte 0x00003412
_08009BD0: .4byte 0x00003013
_08009BD4: .4byte 0x00003010
_08009BD8: .4byte 0x00003410
_08009BDC: .4byte 0x00003810
_08009BE0: .4byte 0x00003C10

	thumb_func_start nullsub_25
nullsub_25: @ 0x08009BE4
	bx lr
	.align 2, 0

	thumb_func_start sub_08009BE8
sub_08009BE8: @ 0x08009BE8
	push {r4, lr}
	movs r1, #0
	str r1, [r0, #0x58]
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_08007F58
	adds r4, r0, #0
	cmp r4, #0
	bne _08009C44
	ldr r2, _08009C4C @ =0x030027CC
	ldr r0, _08009C50 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08009C54 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r1
	strb r0, [r2, #1]
	adds r3, r2, #0
	subs r3, #8
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
	subs r0, r2, #6
	ldrb r3, [r0]
	orrs r1, r3
	strb r1, [r0]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	strb r4, [r2, #8]
	movs r0, #0x10
	strb r0, [r2, #9]
	strb r4, [r2, #0xa]
_08009C44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009C4C: .4byte 0x030027CC
_08009C50: .4byte 0x0000FFE0
_08009C54: .4byte 0x0000E0FF

	thumb_func_start sub_08009C58
sub_08009C58: @ 0x08009C58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r4, #0
	adds r3, #0x6a
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl sub_080096E0
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08009C8C
sub_08009C8C: @ 0x08009C8C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x58]
	adds r3, #1
	str r3, [r5, #0x58]
	movs r1, #0x1e
	rsbs r1, r1, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_08007F58
	adds r6, r0, #0
	cmp r6, #0
	bne _08009CF4
	ldr r3, _08009D08 @ =0x03002790
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #1
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_08009CF4:
	ldr r0, [r5, #0x58]
	cmp r0, #0xc
	bne _08009D00
	adds r0, r5, #0
	bl Proc_Break
_08009D00:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009D08: .4byte 0x03002790

	thumb_func_start sub_08009D0C
sub_08009D0C: @ 0x08009D0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08009D68 @ =0x08BFFD4C
	bl Proc_StartBlocking
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08009D94
	adds r2, r4, #0
	adds r2, #0x64
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #8
	strh r0, [r1]
	ldr r3, _08009D6C @ =0x08BFFB68
	ldr r0, [r3]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	movs r0, #6
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08009D4C
	movs r0, #0
	strh r0, [r2]
_08009D4C:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1d
	ble _08009D58
	movs r0, #0x1e
	strh r0, [r2]
_08009D58:
	ldr r0, [r3]
	strb r5, [r0, #0xf]
	ldr r1, [r3]
	ldrb r0, [r1, #0xe]
	strb r0, [r1, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009D68: .4byte 0x08BFFD4C
_08009D6C: .4byte 0x08BFFB68

	thumb_func_start sub_08009D70
sub_08009D70: @ 0x08009D70
	ldr r0, _08009D8C @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	ldrb r2, [r1, #0x11]
	cmp r0, r2
	bne _08009D90
	ldrb r0, [r1, #0x10]
	ldrb r2, [r1, #0xe]
	cmp r0, r2
	bne _08009D90
	movs r0, #1
	b _08009D92
	.align 2, 0
_08009D8C: .4byte 0x08BFFB68
_08009D90:
	movs r0, #0
_08009D92:
	bx lr

	thumb_func_start sub_08009D94
sub_08009D94: @ 0x08009D94
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B9C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009DAE
	cmp r4, #2
	bgt _08009DAA
	movs r0, #4
	b _08009DB6
_08009DAA:
	movs r0, #0x1a
	b _08009DB6
_08009DAE:
	ldr r0, _08009DBC @ =0x08BFFD7C
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
_08009DB6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08009DBC: .4byte 0x08BFFD7C

	thumb_func_start sub_08009DC0
sub_08009DC0: @ 0x08009DC0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08009E10 @ =0x0818F958
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r5, #0xff
	beq _08009E06
	ldr r4, _08009E14 @ =0x08BFFB68
	ldr r0, [r4]
	lsls r5, r5, #2
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_08006C2C
	movs r1, #0x39
	rsbs r1, r1, #0
	ands r1, r0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r1, r6
	ldrb r2, [r2, #0x17]
	lsls r2, r2, #2
	add r2, sp
	ldr r2, [r2]
	orrs r1, r2
	bl sub_08006BF8
_08009E06:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009E10: .4byte 0x0818F958
_08009E14: .4byte 0x08BFFB68

	thumb_func_start sub_08009E18
sub_08009E18: @ 0x08009E18
	push {lr}
	movs r1, #0x10
	bl sub_08009DC0
	pop {r0}
	bx r0

	thumb_func_start sub_08009E24
sub_08009E24: @ 0x08009E24
	push {lr}
	movs r1, #0
	bl sub_08009DC0
	pop {r0}
	bx r0

	thumb_func_start sub_08009E30
sub_08009E30: @ 0x08009E30
	push {lr}
	ldr r0, _08009E44 @ =0x08BFFB84
	bl Proc_Find
	cmp r0, #0
	beq _08009E3E
	movs r0, #1
_08009E3E:
	pop {r1}
	bx r1
	.align 2, 0
_08009E44: .4byte 0x08BFFB84

	thumb_func_start sub_08009E48
sub_08009E48: @ 0x08009E48
	push {lr}
	ldr r0, _08009E5C @ =0x08BFF970
	bl Proc_Find
	cmp r0, #0
	beq _08009E56
	movs r0, #1
_08009E56:
	pop {r1}
	bx r1
	.align 2, 0
_08009E5C: .4byte 0x08BFF970

	thumb_func_start sub_08009E60
sub_08009E60: @ 0x08009E60
	ldr r0, _08009E68 @ =0x030000E0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009E68: .4byte 0x030000E0

	thumb_func_start sub_08009E6C
sub_08009E6C: @ 0x08009E6C
	ldr r1, _08009E74 @ =0x030000E0
	str r0, [r1]
	bx lr
	.align 2, 0
_08009E74: .4byte 0x030000E0

	thumb_func_start sub_08009E78
sub_08009E78: @ 0x08009E78
	ldr r1, _08009E80 @ =0x08BFFB68
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_08009E80: .4byte 0x08BFFB68

	thumb_func_start sub_08009E84
sub_08009E84: @ 0x08009E84
	push {lr}
	adds r1, r0, #0
	ldr r0, _08009E98 @ =0x08BFFB68
	ldr r0, [r0]
	adds r0, #0x60
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_08009E98: .4byte 0x08BFFB68

	thumb_func_start sub_08009E9C
sub_08009E9C: @ 0x08009E9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	str r2, [sp]
	mov sb, r3
	movs r6, #0
	mov r7, sl
	adds r5, r2, #0
	b _08009EC2
_08009EB8:
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_080056D8
	adds r4, r0, #0
_08009EC2:
	movs r0, #0
	mov r8, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08009EE8
	cmp r0, #1
	bne _08009EE2
	ldm r7!, {r0}
	adds r1, r5, #0
	bl sub_08005460
	adds r5, #0x80
	adds r6, #1
	adds r4, #1
	cmp r6, sb
	bge _08009EF8
_08009EE2:
	mov r2, r8
	cmp r2, #0
	beq _08009EB8
_08009EE8:
	lsls r0, r6, #2
	add r0, sl
	ldr r0, [r0]
	lsls r1, r6, #7
	ldr r2, [sp]
	adds r1, r2, r1
	bl sub_08005460
_08009EF8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08009F08
sub_08009F08: @ 0x08009F08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r0, _08009F7C @ =0x08BFFDB6
	mov ip, r0
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	ldr r4, _08009F80 @ =0x000003FF
	mov sl, r4
	ldrh r6, [r3]
	ands r4, r6
	movs r0, #0x64
	adds r0, r0, r7
	mov r8, r0
	movs r5, #0xf
	adds r0, r5, #0
	mov r3, r8
	ldrh r3, [r3]
	ands r0, r3
	lsls r0, r0, #0xc
	orrs r4, r0
	str r4, [sp]
	movs r0, #3
	mov r3, ip
	bl sub_08006884
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, _08009F84 @ =0x08BFFD9C
	mov r6, sl
	mov r4, sb
	ldrh r4, [r4]
	ands r6, r4
	ldr r0, _08009F88 @ =0x030000E8
	ldrh r0, [r0, #0x14]
	ands r5, r0
	lsls r5, r5, #0xc
	orrs r6, r5
	str r6, [sp]
	movs r0, #3
	bl sub_08006884
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009F7C: .4byte 0x08BFFDB6
_08009F80: .4byte 0x000003FF
_08009F84: .4byte 0x08BFFD9C
_08009F88: .4byte 0x030000E8

	thumb_func_start sub_08009F8C
sub_08009F8C: @ 0x08009F8C
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_08009F98
sub_08009F98: @ 0x08009F98
	push {lr}
	ldr r0, _08009FA8 @ =sub_08009F8C
	movs r1, #1
	bl sub_08014FB0
	pop {r0}
	bx r0
	.align 2, 0
_08009FA8: .4byte sub_08009F8C

	thumb_func_start sub_08009FAC
sub_08009FAC: @ 0x08009FAC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r0, _08009FE0 @ =0x08BFFB68
	ldr r0, [r0]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	mov sb, r1
	ldrb r5, [r0, #0x11]
	movs r6, #0
	movs r7, #0x18
_08009FCE:
	ldrb r0, [r4]
	cmp r0, #0x81
	bls _08009FD6
	b _0800A342
_08009FD6:
	lsls r0, r0, #2
	ldr r1, _08009FE4 @ =_08009FE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009FE0: .4byte 0x08BFFB68
_08009FE4: .4byte _08009FE8
_08009FE8: @ jump table
	.4byte _0800A1F0 @ case 0
	.4byte _0800A1FA @ case 1
	.4byte _0800A1FA @ case 2
	.4byte _0800A206 @ case 3
	.4byte _0800A202 @ case 4
	.4byte _0800A202 @ case 5
	.4byte _0800A202 @ case 6
	.4byte _0800A202 @ case 7
	.4byte _0800A20A @ case 8
	.4byte _0800A20A @ case 9
	.4byte _0800A20A @ case 10
	.4byte _0800A20A @ case 11
	.4byte _0800A20A @ case 12
	.4byte _0800A20A @ case 13
	.4byte _0800A20A @ case 14
	.4byte _0800A20A @ case 15
	.4byte _0800A210 @ case 16
	.4byte _0800A22E @ case 17
	.4byte _0800A234 @ case 18
	.4byte _0800A234 @ case 19
	.4byte _0800A234 @ case 20
	.4byte _0800A234 @ case 21
	.4byte _0800A202 @ case 22
	.4byte _0800A202 @ case 23
	.4byte _0800A23C @ case 24
	.4byte _0800A23C @ case 25
	.4byte _0800A23C @ case 26
	.4byte _0800A23C @ case 27
	.4byte _0800A202 @ case 28
	.4byte _0800A342 @ case 29
	.4byte _0800A342 @ case 30
	.4byte _0800A342 @ case 31
	.4byte _0800A342 @ case 32
	.4byte _0800A342 @ case 33
	.4byte _0800A342 @ case 34
	.4byte _0800A342 @ case 35
	.4byte _0800A342 @ case 36
	.4byte _0800A342 @ case 37
	.4byte _0800A342 @ case 38
	.4byte _0800A342 @ case 39
	.4byte _0800A342 @ case 40
	.4byte _0800A342 @ case 41
	.4byte _0800A342 @ case 42
	.4byte _0800A342 @ case 43
	.4byte _0800A342 @ case 44
	.4byte _0800A342 @ case 45
	.4byte _0800A342 @ case 46
	.4byte _0800A342 @ case 47
	.4byte _0800A342 @ case 48
	.4byte _0800A342 @ case 49
	.4byte _0800A342 @ case 50
	.4byte _0800A342 @ case 51
	.4byte _0800A342 @ case 52
	.4byte _0800A342 @ case 53
	.4byte _0800A342 @ case 54
	.4byte _0800A342 @ case 55
	.4byte _0800A342 @ case 56
	.4byte _0800A342 @ case 57
	.4byte _0800A342 @ case 58
	.4byte _0800A342 @ case 59
	.4byte _0800A342 @ case 60
	.4byte _0800A342 @ case 61
	.4byte _0800A342 @ case 62
	.4byte _0800A342 @ case 63
	.4byte _0800A342 @ case 64
	.4byte _0800A342 @ case 65
	.4byte _0800A342 @ case 66
	.4byte _0800A342 @ case 67
	.4byte _0800A342 @ case 68
	.4byte _0800A342 @ case 69
	.4byte _0800A342 @ case 70
	.4byte _0800A342 @ case 71
	.4byte _0800A342 @ case 72
	.4byte _0800A342 @ case 73
	.4byte _0800A342 @ case 74
	.4byte _0800A342 @ case 75
	.4byte _0800A342 @ case 76
	.4byte _0800A342 @ case 77
	.4byte _0800A342 @ case 78
	.4byte _0800A342 @ case 79
	.4byte _0800A342 @ case 80
	.4byte _0800A342 @ case 81
	.4byte _0800A342 @ case 82
	.4byte _0800A342 @ case 83
	.4byte _0800A342 @ case 84
	.4byte _0800A342 @ case 85
	.4byte _0800A342 @ case 86
	.4byte _0800A342 @ case 87
	.4byte _0800A342 @ case 88
	.4byte _0800A342 @ case 89
	.4byte _0800A342 @ case 90
	.4byte _0800A342 @ case 91
	.4byte _0800A342 @ case 92
	.4byte _0800A342 @ case 93
	.4byte _0800A342 @ case 94
	.4byte _0800A342 @ case 95
	.4byte _0800A342 @ case 96
	.4byte _0800A342 @ case 97
	.4byte _0800A342 @ case 98
	.4byte _0800A342 @ case 99
	.4byte _0800A342 @ case 100
	.4byte _0800A342 @ case 101
	.4byte _0800A342 @ case 102
	.4byte _0800A342 @ case 103
	.4byte _0800A342 @ case 104
	.4byte _0800A342 @ case 105
	.4byte _0800A342 @ case 106
	.4byte _0800A342 @ case 107
	.4byte _0800A342 @ case 108
	.4byte _0800A342 @ case 109
	.4byte _0800A342 @ case 110
	.4byte _0800A342 @ case 111
	.4byte _0800A342 @ case 112
	.4byte _0800A342 @ case 113
	.4byte _0800A342 @ case 114
	.4byte _0800A342 @ case 115
	.4byte _0800A342 @ case 116
	.4byte _0800A342 @ case 117
	.4byte _0800A342 @ case 118
	.4byte _0800A342 @ case 119
	.4byte _0800A342 @ case 120
	.4byte _0800A342 @ case 121
	.4byte _0800A342 @ case 122
	.4byte _0800A342 @ case 123
	.4byte _0800A342 @ case 124
	.4byte _0800A342 @ case 125
	.4byte _0800A342 @ case 126
	.4byte _0800A342 @ case 127
	.4byte _0800A240 @ case 128
	.4byte _0800A336 @ case 129
_0800A1F0:
	cmp r6, r7
	bgt _0800A1F6
	b _0800A368
_0800A1F6:
	adds r7, r6, #0
	b _0800A368
_0800A1FA:
	cmp r6, r7
	ble _0800A200
	adds r7, r6, #0
_0800A200:
	movs r6, #0
_0800A202:
	adds r4, #1
	b _08009FCE
_0800A206:
	adds r6, #0xc
	b _0800A202
_0800A20A:
	ldrb r5, [r4]
	subs r5, #8
	b _0800A202
_0800A210:
	ldrb r0, [r4]
	cmp r0, #8
	bge _0800A218
	b _08009FCE
_0800A218:
	cmp r0, #0xf
	ble _0800A222
	cmp r0, #0x10
	beq _0800A22A
	b _08009FCE
_0800A222:
	adds r5, r0, #0
	subs r5, #8
	adds r4, #1
	b _0800A210
_0800A22A:
	adds r4, #3
	b _0800A210
_0800A22E:
	cmp r5, sb
	beq _0800A1F0
	b _0800A202
_0800A234:
	mov r2, r8
	cmp r2, #0
	beq _0800A1F0
	b _0800A202
_0800A23C:
	adds r6, #0x80
	b _0800A202
_0800A240:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0x25
	bls _0800A24A
	b _08009FCE
_0800A24A:
	lsls r0, r0, #2
	ldr r1, _0800A254 @ =_0800A258
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A254: .4byte _0800A258
_0800A258: @ jump table
	.4byte _0800A202 @ case 0
	.4byte _0800A202 @ case 1
	.4byte _0800A202 @ case 2
	.4byte _0800A202 @ case 3
	.4byte _0800A202 @ case 4
	.4byte _0800A2F0 @ case 5
	.4byte _0800A316 @ case 6
	.4byte _0800A202 @ case 7
	.4byte _0800A202 @ case 8
	.4byte _0800A202 @ case 9
	.4byte _0800A330 @ case 10
	.4byte _0800A330 @ case 11
	.4byte _0800A330 @ case 12
	.4byte _0800A330 @ case 13
	.4byte _0800A330 @ case 14
	.4byte _0800A330 @ case 15
	.4byte _0800A330 @ case 16
	.4byte _0800A330 @ case 17
	.4byte _08009FCE @ case 18
	.4byte _08009FCE @ case 19
	.4byte _08009FCE @ case 20
	.4byte _08009FCE @ case 21
	.4byte _0800A202 @ case 22
	.4byte _0800A202 @ case 23
	.4byte _0800A202 @ case 24
	.4byte _0800A202 @ case 25
	.4byte _0800A202 @ case 26
	.4byte _0800A202 @ case 27
	.4byte _0800A202 @ case 28
	.4byte _0800A202 @ case 29
	.4byte _0800A202 @ case 30
	.4byte _0800A202 @ case 31
	.4byte _0800A30C @ case 32
	.4byte _0800A202 @ case 33
	.4byte _08009FCE @ case 34
	.4byte _08009FCE @ case 35
	.4byte _0800A202 @ case 36
	.4byte _0800A202 @ case 37
_0800A2F0:
	ldr r0, _0800A308 @ =0x08BFFB68
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	mov r1, sp
	bl sub_080149EC
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	b _0800A322
	.align 2, 0
_0800A308: .4byte 0x08BFFB68
_0800A30C:
	bl sub_0802EBB0
	bl sub_080054CC
	b _0800A326
_0800A316:
	ldr r0, _0800A32C @ =0x08BFFB68
	ldr r0, [r0]
	adds r0, #0x60
	mov r2, r8
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
_0800A322:
	bl sub_08009FAC
_0800A326:
	adds r6, r6, r0
	b _0800A202
	.align 2, 0
_0800A32C: .4byte 0x08BFFB68
_0800A330:
	ldrb r5, [r4]
	subs r5, #0xa
	b _0800A202
_0800A336:
	ldrb r0, [r4, #1]
	cmp r0, #0x40
	bne _0800A342
	adds r4, #2
	adds r6, #6
	b _08009FCE
_0800A342:
	cmp r5, sb
	beq _0800A358
	cmp r5, #0xff
	beq _0800A358
	mov r1, r8
	cmp r1, #0
	beq _0800A352
	b _0800A1F0
_0800A352:
	movs r2, #1
	mov r8, r2
	mov sb, r5
_0800A358:
	add r1, sp, #0x20
	adds r0, r4, #0
	bl sub_08005528
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	adds r6, r6, r0
	b _08009FCE
_0800A368:
	adds r0, r7, #0
	add sp, #0x24
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800A378
sub_0800A378: @ 0x0800A378
	push {lr}
	ldr r0, _0800A38C @ =0x08BFFE18
	bl Proc_Find
	cmp r0, #0
	beq _0800A386
	movs r0, #1
_0800A386:
	pop {r1}
	bx r1
	.align 2, 0
_0800A38C: .4byte 0x08BFFE18

	thumb_func_start sub_0800A390
sub_0800A390: @ 0x0800A390
	push {lr}
	ldr r0, _0800A3A0 @ =0x08BFFE18
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0800A3A0: .4byte 0x08BFFE18

	thumb_func_start sub_0800A3A4
sub_0800A3A4: @ 0x0800A3A4
	movs r1, #1
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start StartTalkDebug
StartTalkDebug: @ 0x0800A3AC
	push {lr}
	movs r0, #0x1c
	bl sub_0800B72C
	pop {r0}
	bx r0

	thumb_func_start sub_0800A3B8
sub_0800A3B8: @ 0x0800A3B8
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_0800A3A4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A3C8
sub_0800A3C8: @ 0x0800A3C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x2c]
	bl sub_08008354
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A3DC
	bl sub_0800836C
_0800A3DC:
	bl sub_0800EC2C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A3E8
	b _0800A4E6
_0800A3E8:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bne _0800A3FE
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl sub_0800515C
	adds r0, r6, #0
	bl sub_0800A3A4
_0800A3FE:
	movs r0, #0x70
	movs r1, #0x64
	adds r2, r5, #0
	movs r3, #4
	bl sub_08005234
	ldr r1, _0800A420 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #4
	ldrh r3, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq _0800A424
	adds r0, r6, #0
	bl Proc_Break
	b _0800A4E6
	.align 2, 0
_0800A420: .4byte gpKeySt
_0800A424:
	ldrh r2, [r2, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0800A430
	adds r5, #1
_0800A430:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0800A43A
	subs r5, #1
_0800A43A:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0800A444
	adds r5, #0xa
_0800A444:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0800A44E
	subs r5, #0xa
_0800A44E:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800A45A
	adds r5, #0x64
_0800A45A:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0800A466
	subs r5, #0x64
_0800A466:
	cmp r5, #0
	bge _0800A46C
	movs r5, #0
_0800A46C:
	ldr r0, _0800A4C4 @ =0x00001234
	cmp r5, r0
	ble _0800A474
	adds r5, r0, #0
_0800A474:
	ldr r0, [r6, #0x2c]
	cmp r5, r0
	beq _0800A4C8
	bl sub_0800EC08
	bl sub_08007EF8
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #9
	bl sub_0800515C
	str r5, [r6, #0x2c]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r2, [r6, #0x2c]
	movs r0, #1
	movs r1, #1
	bl sub_08007EAC
	movs r0, #1
	bl sub_08007F24
	movs r0, #2
	bl sub_08007F24
	movs r0, #4
	bl sub_08007F24
	adds r0, r4, #0
	bl sub_08007F68
	movs r0, #1
	bl TalkBgSync
	b _0800A4E6
	.align 2, 0
_0800A4C4: .4byte 0x00001234
_0800A4C8:
	ldr r1, [r1]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800A4E6
	bl sub_0800EC08
	bl sub_08007EF8
	movs r0, #0
	str r0, [r6, #0x34]
	ldr r0, [r6, #0x2c]
	bl sub_0800EC84
_0800A4E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start TalkBgSync
TalkBgSync: @ 0x0800A4EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl sub_08007F58
	cmp r0, #0
	bne _0800A500
	adds r0, r4, #0
	bl EnableBgSync
_0800A500:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
