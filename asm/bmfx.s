	.include "macro.inc"
	.syntax unified

	thumb_func_start GetSomeFacingDirection
GetSomeFacingDirection: @ 0x0801D7E0
	cmp r0, r2
	bne _0801D7F4
	cmp r1, r3
	bge _0801D7EC
	movs r0, #3
	b _0801D806
_0801D7EC:
	cmp r1, r3
	ble _0801D7F4
	movs r0, #2
	b _0801D806
_0801D7F4:
	cmp r1, r3
	bne _0801D804
	cmp r0, r2
	blt _0801D804
	cmp r0, r2
	ble _0801D804
	movs r0, #1
	b _0801D806
_0801D804:
	movs r0, #0
_0801D806:
	bx lr

	thumb_func_start sub_801D808
sub_801D808: @ 0x0801D808
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0801D826
	adds r0, r3, #0
	bl StartMu
	b _0801D840
_0801D826:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r2, r0
	cmp r2, #0
	bne _0801D836
	adds r0, r3, #0
	movs r1, #0x61
	b _0801D83A
_0801D836:
	adds r0, r3, #0
	movs r1, #0x62
_0801D83A:
	movs r2, #0xc
	bl sub_806C274
_0801D840:
	pop {r1}
	bx r1

	thumb_func_start sub_801D844
sub_801D844: @ 0x0801D844
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_806C850
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D87A
	adds r5, r4, #0
	adds r5, #0x3c
	ldrb r0, [r5]
	cmp r0, #2
	beq _0801D862
	ldr r0, [r4, #0x34]
	bl sub_806D4BC
_0801D862:
	adds r0, r4, #0
	bl Proc_Break
	ldrb r5, [r5]
	cmp r5, #1
	bne _0801D87A
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl sub_8025A0C
_0801D87A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801D880
sub_801D880: @ 0x0801D880
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r1, r3, #0
	ldr r0, _0801D8D0 @ =gUnk_08C028A8
	bl Proc_StartBlocking
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3a
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, r8
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_801D808
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl sub_806C8F0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D8D0: .4byte gUnk_08C028A8

	thumb_func_start sub_801D8D4
sub_801D8D4: @ 0x0801D8D4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0801D91C @ =gUnk_08C028C0
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r1, #0
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r2, r7, #0
	adds r2, #0x3a
	movs r0, #4
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_801D808
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl sub_806C8F0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D91C: .4byte gUnk_08C028C0

	thumb_func_start sub_801D920
sub_801D920: @ 0x0801D920
	push {lr}
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bl InitBmBgLayers
	ldr r2, _0801D94C @ =0x030027CC
	ldr r0, _0801D950 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801D954 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801D94C: .4byte 0x030027CC
_0801D950: .4byte 0x0000FFE0
_0801D954: .4byte 0x0000E0FF

	thumb_func_start sub_801D958
sub_801D958: @ 0x0801D958
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r0, _0801D9E8 @ =gDispIo
	mov ip, r0
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0x3f
	mov sl, r1
	mov r0, sl
	ldrb r6, [r4]
	ands r0, r6
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4]
	adds r3, r5, #0
	adds r3, #0x4c
	ldrh r1, [r3]
	movs r0, #0x44
	add r0, ip
	mov sb, r0
	movs r2, #0
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	movs r6, #0x45
	add r6, ip
	mov r8, r6
	strb r0, [r6]
	mov r7, ip
	adds r7, #0x46
	strb r2, [r7]
	subs r1, #1
	movs r6, #0
	strh r1, [r3]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0801D9DA
	adds r0, r5, #0
	bl Proc_Break
	mov r0, sl
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x10
	mov r1, sb
	strb r0, [r1]
	mov r0, r8
	strb r6, [r0]
	strb r6, [r7]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _0801D9EC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0801D9DA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D9E8: .4byte gDispIo
_0801D9EC: .4byte gBg2Tm

	thumb_func_start sub_801D9F0
sub_801D9F0: @ 0x0801D9F0
	push {r4, lr}
	adds r4, r0, #0
	bl SetAllUnitNotBackSprite
	adds r4, #0x4e
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801DA06
	bl sub_8015794
_0801DA06:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartMapFade
StartMapFade: @ 0x0801DA0C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0801DA34 @ =gUnk_08C028E8
	movs r1, #3
	bl Proc_Start
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801DA2C
	bl sub_8015784
_0801DA2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DA34: .4byte gUnk_08C028E8

	thumb_func_start sub_801DA38
sub_801DA38: @ 0x0801DA38
	push {lr}
	ldr r0, _0801DA4C @ =gUnk_08C028E8
	bl Proc_Find
	cmp r0, #0
	beq _0801DA46
	movs r0, #1
_0801DA46:
	pop {r1}
	bx r1
	.align 2, 0
_0801DA4C: .4byte gUnk_08C028E8

	thumb_func_start sub_801DA50
sub_801DA50: @ 0x0801DA50
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0801DA90 @ =gPlaySt
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0801DA6E
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #0x13]
_0801DA6E:
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0801DA94
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r5]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	b _0801DA9A
	.align 2, 0
_0801DA90: .4byte gPlaySt
_0801DA94:
	ldrb r0, [r4, #0x12]
	str r0, [r5]
	ldrb r0, [r4, #0x13]
_0801DA9A:
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801DAA4
sub_801DAA4: @ 0x0801DAA4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0801DAB4 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _0801DAF8
	.align 2, 0
_0801DAB4: .4byte gPlaySt
_0801DAB8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801DAF2
	ldr r3, [r2]
	cmp r3, #0
	beq _0801DAF2
	ldr r0, [r2, #0xc]
	ldr r1, _0801DB04 @ =0x00000201
	ands r0, r1
	cmp r0, #0
	bne _0801DAF2
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	str r0, [r5]
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0801DAFE
_0801DAF2:
	adds r4, #1
	ldr r0, _0801DB08 @ =gPlaySt
	ldrb r0, [r0, #0xf]
_0801DAF8:
	adds r0, #0x40
	cmp r4, r0
	blt _0801DAB8
_0801DAFE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DB04: .4byte 0x00000201
_0801DB08: .4byte gPlaySt

	thumb_func_start sub_801DB0C
sub_801DB0C: @ 0x0801DB0C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r4, _0801DB30 @ =gPlaySt
	ldrb r0, [r4, #0xf]
	bl CountFactionMoveableUnits
	cmp r0, #0
	bne _0801DB34
	adds r0, r5, #0
	bl Proc_End
	b _0801DB76
	.align 2, 0
_0801DB30: .4byte gPlaySt
_0801DB34:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x40
	beq _0801DB54
	cmp r0, #0x40
	bgt _0801DB44
	cmp r0, #0
	beq _0801DB4A
	b _0801DB5C
_0801DB44:
	cmp r0, #0x80
	beq _0801DB54
	b _0801DB5C
_0801DB4A:
	add r1, sp, #4
	mov r0, sp
	bl sub_801DA50
	b _0801DB5C
_0801DB54:
	add r1, sp, #4
	mov r0, sp
	bl sub_801DAA4
_0801DB5C:
	ldr r1, [sp]
	cmp r1, #0
	blt _0801DB76
	ldr r2, [sp, #4]
	cmp r2, #0
	blt _0801DB76
	adds r0, r5, #0
	bl sub_801615C
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_8015F0C
_0801DB76:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801DB80
sub_801DB80: @ 0x0801DB80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_80807CC
	bl GetUnit
	cmp r0, #0
	beq _0801DBAA
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_801615C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8015F0C
_0801DBAA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_801DBB0
sub_801DBB0: @ 0x0801DBB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801DBDC @ =0x02001F70
	bl sub_802EC3C
	strb r0, [r5]
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_802ECE4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DBE4
	ldrb r5, [r5]
	cmp r5, #0x63
	bhi _0801DBE4
	ldr r0, _0801DBE0 @ =gUnk_08C04C24
	adds r1, r4, #0
	bl StartLockingMenu
	b _0801DBEC
	.align 2, 0
_0801DBDC: .4byte 0x02001F70
_0801DBE0: .4byte gUnk_08C04C24
_0801DBE4:
	ldr r0, _0801DBF4 @ =gUnk_08C04C00
	adds r1, r4, #0
	bl StartLockingMenu
_0801DBEC:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801DBF4: .4byte gUnk_08C04C00

	thumb_func_start sub_801DBF8
sub_801DBF8: @ 0x0801DBF8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8032CCC
	bl sub_801E650
	ldr r0, _0801DC10 @ =gBmSt
	ldrh r0, [r0, #0x2e]
	cmp r0, #0
	beq _0801DC14
	movs r0, #0
	b _0801DC1E
	.align 2, 0
_0801DC10: .4byte gBmSt
_0801DC14:
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	movs r0, #1
_0801DC1E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_801DC24
sub_801DC24: @ 0x0801DC24
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_8097C74
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_801DC34
sub_801DC34: @ 0x0801DC34
	push {lr}
	ldr r0, _0801DC44 @ =gBmSt
	ldrh r0, [r0, #0x2e]
	bl AddItemToConvoy
	pop {r1}
	bx r1
	.align 2, 0
_0801DC44: .4byte gBmSt

	thumb_func_start sub_801DC48
sub_801DC48: @ 0x0801DC48
	push {lr}
	ldr r0, _0801DC5C @ =gActionSt
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, _0801DC60 @ =gActiveUnit
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801DC5C: .4byte gActionSt
_0801DC60: .4byte gActiveUnit

	thumb_func_start sub_801DC64
sub_801DC64: @ 0x0801DC64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802ECE4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DCA0
	ldr r0, _0801DC88 @ =0x02001F70
	ldrb r0, [r0]
	cmp r0, #0x63
	bhi _0801DC90
	ldr r0, _0801DC8C @ =gActionSt
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_801F71C
	b _0801DCAA
	.align 2, 0
_0801DC88: .4byte 0x02001F70
_0801DC8C: .4byte gActionSt
_0801DC90:
	ldr r0, _0801DC9C @ =gActionSt
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_801F70C
	b _0801DCAA
	.align 2, 0
_0801DC9C: .4byte gActionSt
_0801DCA0:
	ldr r0, _0801DCB0 @ =gActionSt
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_801F70C
_0801DCAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DCB0: .4byte gActionSt

	thumb_func_start sub_801DCB4
sub_801DCB4: @ 0x0801DCB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl UnitAddItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801DD44
	ldr r0, _0801DD1C @ =gActiveUnit
	str r4, [r0]
	ldr r0, _0801DD20 @ =gBmSt
	strh r5, [r0, #0x2c]
	adds r0, r4, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #4
	bl sub_8006AC4
	movs r0, #0
	movs r1, #5
	bl sub_80078F4
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xf
	movs r3, #0xa
	bl sub_801E2A0
	bl sub_802ECE4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DD28
	bl sub_802EC3C
	cmp r0, #0x63
	bgt _0801DD28
	ldr r0, _0801DD24 @ =0x000006F5
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartSubtitleHelp
	b _0801DD36
	.align 2, 0
_0801DD1C: .4byte gActiveUnit
_0801DD20: .4byte gBmSt
_0801DD24: .4byte 0x000006F5
_0801DD28:
	ldr r0, _0801DD4C @ =0x000006F6
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartSubtitleHelp
_0801DD36:
	movs r0, #2
	bl sub_8009E6C
	ldr r0, _0801DD50 @ =gUnk_08C02958
	adds r1, r6, #0
	bl Proc_StartBlocking
_0801DD44:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DD4C: .4byte 0x000006F6
_0801DD50: .4byte gUnk_08C02958

	thumb_func_start sub_801DD54
sub_801DD54: @ 0x0801DD54
	push {lr}
	bl sub_802267C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801DD60
sub_801DD60: @ 0x0801DD60
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0801DD9C @ =gBmSt
	ldrh r6, [r0, #0x2c]
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	movs r0, #0x2c
	ldrsh r2, [r4, r0]
	lsls r2, r2, #5
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _0801DDA0 @ =gBg0Tm
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8016A4C
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801DD9C: .4byte gBmSt
_0801DDA0: .4byte gBg0Tm

	thumb_func_start sub_801DDA4
sub_801DDA4: @ 0x0801DDA4
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _0801DDEC @ =gActiveUnit
	ldr r1, [r5]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl AddItemToConvoy
	ldr r3, _0801DDF0 @ =gActionSt
	ldr r0, [r5]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r3, #6]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl UnitRemoveItem
	ldr r0, [r5]
	ldr r1, _0801DDF4 @ =gBmSt
	ldrh r1, [r1, #0x2c]
	bl UnitAddItem
	movs r0, #0x37
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801DDEC: .4byte gActiveUnit
_0801DDF0: .4byte gActionSt
_0801DDF4: .4byte gBmSt

	thumb_func_start sub_801DDF8
sub_801DDF8: @ 0x0801DDF8
	push {r4, lr}
	ldr r4, _0801DE10 @ =gBmSt
	ldrh r0, [r4, #0x2c]
	bl AddItemToConvoy
	ldr r1, _0801DE14 @ =gActionSt
	ldrh r0, [r4, #0x2c]
	strh r0, [r1, #6]
	movs r0, #0x37
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DE10: .4byte gBmSt
_0801DE14: .4byte gActionSt

	thumb_func_start sub_801DE18
sub_801DE18: @ 0x0801DE18
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, _0801DE60 @ =gActionSt
	ldr r0, _0801DE64 @ =gActiveUnit
	ldr r1, [r0]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #6]
	movs r0, #0
	ldrsb r0, [r4, r0]
	strh r0, [r2, #8]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DE68 @ =0x0000072A
	movs r0, #8
	adds r3, r5, #0
	bl sub_8084000
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801DE60: .4byte gActionSt
_0801DE64: .4byte gActiveUnit
_0801DE68: .4byte 0x0000072A

	thumb_func_start sub_801DE6C
sub_801DE6C: @ 0x0801DE6C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0801DEA4 @ =gActionSt
	ldr r0, _0801DEA8 @ =gBmSt
	ldrh r0, [r0, #0x2c]
	strh r0, [r1, #6]
	movs r0, #5
	strh r0, [r1, #8]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DEAC @ =0x0000072A
	movs r0, #8
	adds r3, r5, #0
	bl sub_8084000
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801DEA4: .4byte gActionSt
_0801DEA8: .4byte gBmSt
_0801DEAC: .4byte 0x0000072A

	thumb_func_start sub_801DEB0
sub_801DEB0: @ 0x0801DEB0
	push {r4, lr}
	bl sub_8009E60
	cmp r0, #1
	beq _0801DEBE
	movs r0, #0
	b _0801DEE4
_0801DEBE:
	ldr r0, _0801DEEC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #8]
	ldr r1, _0801DEF0 @ =gActionSt
	ldrh r0, [r1, #8]
	cmp r0, #4
	bhi _0801DEE2
	ldr r4, _0801DEF4 @ =gActiveUnit
	ldr r0, [r4]
	ldrh r1, [r1, #8]
	bl UnitRemoveItem
	ldr r0, [r4]
	ldr r1, _0801DEF8 @ =gBmSt
	ldrh r1, [r1, #0x2c]
	bl UnitAddItem
_0801DEE2:
	movs r0, #0x37
_0801DEE4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DEEC: .4byte gpKeySt
_0801DEF0: .4byte gActionSt
_0801DEF4: .4byte gActiveUnit
_0801DEF8: .4byte gBmSt

	thumb_func_start sub_801DEFC
sub_801DEFC: @ 0x0801DEFC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _0801DF12
	ldr r0, _0801DF34 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r4, [r0, #0xc]
_0801DF12:
	bl RenderMapForFade
	ldr r0, _0801DF34 @ =gPlaySt
	strb r4, [r0, #0xd]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DF34: .4byte gPlaySt

	thumb_func_start sub_801DF38
sub_801DF38: @ 0x0801DF38
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _0801DF4E
	ldr r0, _0801DF64 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0xc]
_0801DF4E:
	ldr r0, _0801DF64 @ =gPlaySt
	strb r1, [r0, #0xd]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
_0801DF64: .4byte gPlaySt

	thumb_func_start sub_801DF68
sub_801DF68: @ 0x0801DF68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r6, _0801E034 @ =gBmMapMovement
	ldr r0, [r6]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _0801E038 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r6]
	bl SetWorkingBmMap
	mov r0, r8
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	mov r0, sb
	bl GetUnitMagRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl MapAddInBoundedRange
	ldr r0, _0801E03C @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0801E04C
	ldr r0, _0801E040 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r3, r0, #1
	adds r2, r6, #0
	cmp r3, #0
	bge _0801DFC8
	b _0801E0D0
_0801DFC8:
	ldr r0, _0801E040 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r3, #1
	cmp r4, #0
	blt _0801E02A
	ldr r6, _0801E034 @ =gBmMapMovement
	lsls r5, r3, #2
_0801DFDA:
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801E024
	ldr r0, _0801E044 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, r8
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801E012
	ldr r0, _0801E048 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0801E034 @ =gBmMapMovement
	cmp r0, #0
	beq _0801E024
_0801E012:
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r0]
	ldr r2, _0801E034 @ =gBmMapMovement
_0801E024:
	subs r4, #1
	cmp r4, #0
	bge _0801DFDA
_0801E02A:
	adds r3, r7, #0
	cmp r3, #0
	bge _0801DFC8
	b _0801E0D0
	.align 2, 0
_0801E034: .4byte gBmMapMovement
_0801E038: .4byte 0x0202E3E4
_0801E03C: .4byte gPlaySt
_0801E040: .4byte gBmMapSize
_0801E044: .4byte gBmMapTerrain
_0801E048: .4byte gBmMapUnit
_0801E04C:
	ldr r0, _0801E0FC @ =gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r3, r0, #1
	adds r2, r6, #0
	cmp r3, #0
	blt _0801E0D0
_0801E05A:
	ldr r0, _0801E0FC @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r3, #1
	cmp r4, #0
	blt _0801E0CA
	lsls r5, r3, #2
_0801E06A:
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801E0C4
	ldr r0, _0801E100 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, r8
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801E0B2
	ldr r0, _0801E104 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801E0B2
	ldr r0, _0801E108 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0801E10C @ =gBmMapMovement
	cmp r0, #0
	bne _0801E0C4
_0801E0B2:
	ldr r2, _0801E10C @ =gBmMapMovement
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
_0801E0C4:
	subs r4, #1
	cmp r4, #0
	bge _0801E06A
_0801E0CA:
	adds r3, r7, #0
	cmp r3, #0
	bge _0801E05A
_0801E0D0:
	mov r1, sb
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sb
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E0FC: .4byte gBmMapSize
_0801E100: .4byte gBmMapTerrain
_0801E104: .4byte gBmMapUnit
_0801E108: .4byte 0x0202E3E8
_0801E10C: .4byte gBmMapMovement

	thumb_func_start sub_801E110
sub_801E110: @ 0x0801E110
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x64
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801E122
	b _0801E28E
_0801E122:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0801E132
	b _0801E28E
_0801E132:
	ldr r6, _0801E298 @ =gBattleActor
	movs r0, #0x5a
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0801E29C @ =gBattleTarget
	adds r7, r5, #0
	adds r7, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	ble _0801E166
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015F24
_0801E166:
	mov r0, r8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bge _0801E18E
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015F24
_0801E18E:
	adds r7, r6, #0
	adds r7, #0x60
	movs r0, #0x60
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801E1BE
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015F24
_0801E1BE:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801E1E6
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015F24
_0801E1E6:
	adds r7, r6, #0
	adds r7, #0x66
	movs r0, #0x66
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801E216
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015F24
_0801E216:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801E23E
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015F24
_0801E23E:
	adds r6, #0x62
	adds r5, #0x62
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0801E268
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015F24
_0801E268:
	movs r3, #0
	ldrsh r1, [r6, r3]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _0801E28E
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015F24
_0801E28E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E298: .4byte gBattleActor
_0801E29C: .4byte gBattleTarget

	thumb_func_start sub_801E2A0
sub_801E2A0: @ 0x0801E2A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r4, _0801E358 @ =gUnk_08C029A8
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _0801E34E
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x2c]
	adds r0, #0x30
	strb r7, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x32
	movs r0, #3
	strb r0, [r5]
	adds r0, r6, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0xc
	bl sub_800536C
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0xc
	bl sub_800536C
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xc
	bl sub_800536C
	ldrb r1, [r5]
	movs r0, #1
	bl ApplyIconPalette
	ldr r0, [r4, #0x2c]
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleGenerateUiStats
	ldr r3, _0801E35C @ =gBattleTarget
	ldr r2, _0801E360 @ =gBattleActor
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801E34E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E358: .4byte gUnk_08C029A8
_0801E35C: .4byte gBattleTarget
_0801E360: .4byte gBattleActor

	thumb_func_start sub_801E364
sub_801E364: @ 0x0801E364
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0801E3E0 @ =gUnk_08C029A8
	bl Proc_Find
	adds r7, r0, #0
	movs r0, #0
	bl GetBgTilemap
	adds r4, r7, #0
	adds r4, #0x30
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r3, #0x31
	adds r3, r3, r7
	mov r8, r3
	ldrb r2, [r3]
	lsls r1, r2, #6
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r7, #0
	adds r6, #0x34
	ldr r3, [r7, #0x2c]
	mov sb, r3
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ClearText
	adds r0, r7, #0
	adds r0, #0x3c
	bl ClearText
	adds r0, r7, #0
	adds r0, #0x44
	bl ClearText
	ldrb r0, [r4]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #0xe
	movs r3, #8
	bl sub_804A4CC
	cmp r5, #0
	blt _0801E3FC
	cmp r5, #4
	ble _0801E3E4
	cmp r5, #5
	beq _0801E3F0
	b _0801E3FC
	.align 2, 0
_0801E3E0: .4byte gUnk_08C029A8
_0801E3E4:
	lsls r1, r5, #1
	mov r0, sb
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	b _0801E400
_0801E3F0:
	ldr r0, _0801E3F8 @ =gBmSt
	ldrh r4, [r0, #0x2c]
	b _0801E400
	.align 2, 0
_0801E3F8: .4byte gBmSt
_0801E3FC:
	adds r4, r5, #0
	movs r5, #8
_0801E400:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #9
	beq _0801E41C
	cmp r0, #9
	bgt _0801E414
	cmp r0, #4
	beq _0801E41C
	b _0801E4C0
_0801E414:
	cmp r0, #0xc
	bgt _0801E4C0
	cmp r0, #0xb
	blt _0801E4C0
_0801E41C:
	adds r0, r4, #0
	bl GetItemUseDescId
	bl DecodeMsg
	adds r4, r0, #0
	movs r5, #0
	ldr r7, [sp, #4]
	adds r7, #0x42
	movs r3, #8
	adds r3, r3, r6
	mov r8, r3
	ldr r0, [sp, #4]
	adds r0, #0xc2
	mov sb, r0
	movs r1, #0x10
	adds r1, r1, r6
	mov sl, r1
	b _0801E446
_0801E442:
	adds r4, #1
	adds r5, #1
_0801E446:
	lsls r0, r5, #3
	adds r0, r6, r0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	bl GetStringLineEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801E442
	ldr r3, _0801E4B8 @ =gBattleActor
	ldr r2, _0801E4BC @ =gBattleTarget
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	bl PutText
	mov r0, r8
	mov r1, sb
	bl PutText
	ldr r2, [sp, #4]
	movs r3, #0xa1
	lsls r3, r3, #1
	adds r1, r2, r3
	mov r0, sl
	bl PutText
	b _0801E61A
	.align 2, 0
_0801E4B8: .4byte gBattleActor
_0801E4BC: .4byte gBattleTarget
_0801E4C0:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	mov r0, sb
	bl BattleGenerateUiStats
	cmp r5, #8
	bne _0801E502
	ldr r3, _0801E630 @ =gBattleTarget
	ldr r2, _0801E634 @ =gBattleActor
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801E502:
	ldr r0, _0801E634 @ =gBattleActor
	mov r8, r0
	movs r1, #0x48
	add r1, r8
	mov sl, r1
	ldrh r1, [r1]
	mov r0, sb
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r2, #1
	mov sb, r2
	cmp r0, #0
	beq _0801E522
	movs r3, #2
	mov sb, r3
_0801E522:
	ldr r3, _0801E638 @ =gUnk_081C9350
	adds r0, r6, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, r6, #0
	adds r4, #8
	ldr r3, _0801E63C @ =gUnk_081C9358
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, r6, #0
	adds r5, #0x10
	ldr r3, _0801E640 @ =gUnk_081C9360
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _0801E644 @ =gUnk_081C9368
	adds r0, r4, #0
	movs r1, #0x32
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _0801E648 @ =gUnk_081C9370
	adds r0, r5, #0
	movs r1, #0x32
	movs r2, #0
	bl Text_InsertDrawString
	mov r0, r8
	adds r0, #0x5a
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r4, #0
	movs r1, #0x24
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x60
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r5, #0
	movs r1, #0x24
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r4, #0
	movs r1, #0x54
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x62
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r5, #0
	movs r1, #0x54
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x34
	adds r6, r7, #0
	adds r6, #0x31
	ldrb r1, [r6]
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r5, r7, #0
	adds r5, #0x30
	ldrb r3, [r5]
	adds r1, r3, r1
	lsls r1, r1, #1
	ldr r4, _0801E64C @ =gBg0Tm
	adds r1, r1, r4
	bl PutText
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r1, [r6]
	adds r1, #3
	lsls r1, r1, #5
	adds r1, #1
	ldrb r2, [r5]
	adds r1, r2, r1
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r1, [r6]
	adds r1, #5
	lsls r1, r1, #5
	adds r1, #1
	ldrb r5, [r5]
	adds r1, r5, r1
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
	ldr r4, [sp, #4]
	adds r4, #0x4e
	mov r3, sl
	ldrh r0, [r3]
	bl GetItemType
	adds r1, r0, #0
	adds r1, #0x70
	ldr r0, [sp, #8]
	lsls r2, r0, #0xc
	adds r0, r4, #0
	bl PutIcon
_0801E61A:
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E630: .4byte gBattleTarget
_0801E634: .4byte gBattleActor
_0801E638: .4byte gUnk_081C9350
_0801E63C: .4byte gUnk_081C9358
_0801E640: .4byte gUnk_081C9360
_0801E644: .4byte gUnk_081C9368
_0801E648: .4byte gUnk_081C9370
_0801E64C: .4byte gBg0Tm

	thumb_func_start sub_801E650
sub_801E650: @ 0x0801E650
	push {lr}
	ldr r0, _0801E65C @ =gUnk_08C029A8
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_0801E65C: .4byte gUnk_08C029A8

	thumb_func_start sub_801E660
sub_801E660: @ 0x0801E660
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r2, #0
	mov r8, r2
	strh r0, [r4, #0x30]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	subs r2, r2, r0
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r3, #0x32
	ldrsh r0, [r4, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	movs r2, #0x80
	lsls r2, r2, #0xa
	movs r6, #0x80
	lsls r6, r6, #2
	str r6, [sp]
	movs r0, #0
	adds r3, r5, #0
	bl Interpolate
	str r0, [r4, #0x44]
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0x30
	adds r3, r5, #0
	bl Interpolate
	strh r0, [r4, #0x3e]
	mov r3, r8
	strh r3, [r4, #0x3c]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801E6E4
sub_801E6E4: @ 0x0801E6E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #9
	movs r0, #0x3c
	ldrsh r3, [r7, r0]
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [sp, #4]
	movs r2, #0x34
	ldrsh r6, [r7, r2]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	mov sb, r0
	subs r6, r6, r0
	movs r0, #0x36
	ldrsh r2, [r7, r0]
	mov r8, r2
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	str r1, [sp, #8]
	mov r0, r8
	subs r0, r0, r1
	mov r8, r0
	ldr r2, _0801E7D4 @ =gSinLut
	ldr r1, [sp, #4]
	asrs r0, r1, #9
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r4, [r0, r2]
	adds r0, r6, #0
	muls r0, r4, r0
	ldr r5, [r7, #0x44]
	adds r1, r5, #0
	bl __divsi3
	mov sl, r0
	mov r0, r8
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	ldr r2, [sp, #4]
	adds r1, r6, #0
	muls r1, r2, r1
	asrs r1, r1, #0x10
	adds r5, r1, r0
	mov r0, r8
	muls r0, r2, r0
	asrs r0, r0, #0x10
	mov r1, sl
	subs r4, r0, r1
	add sb, r5
	ldr r1, _0801E7D8 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r2, sb
	subs r5, r2, r0
	ldr r0, [sp, #8]
	adds r4, r4, r0
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0801E7AE
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0801E7AE
	adds r2, r4, #0
	subs r2, #0xc
	ldr r3, _0801E7DC @ =Sprite_16x16
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl sub_8006884
	ldr r3, [r7, #0x2c]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8026540
_0801E7AE:
	ldrh r0, [r7, #0x3c]
	adds r0, #1
	strh r0, [r7, #0x3c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x3e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0801E7C4
	adds r0, r7, #0
	bl Proc_Break
_0801E7C4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E7D4: .4byte gSinLut
_0801E7D8: .4byte gBmSt
_0801E7DC: .4byte Sprite_16x16

	thumb_func_start sub_801E7E0
sub_801E7E0: @ 0x0801E7E0
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r3, #0x34
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801E7EE
	adds r0, #0xf
_0801E7EE:
	asrs r0, r0, #4
	strb r0, [r2, #0x10]
	ldr r2, [r1, #0x2c]
	movs r3, #0x36
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801E7FE
	adds r0, #0xf
_0801E7FE:
	asrs r0, r0, #4
	strb r0, [r2, #0x11]
	bx lr

	thumb_func_start sub_801E804
sub_801E804: @ 0x0801E804
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _0801E838 @ =gUnk_08C029C0
	adds r1, r6, #0
	bl Proc_Start
	mov r1, r8
	str r1, [r0, #0x2c]
	lsls r4, r4, #4
	strh r4, [r0, #0x34]
	lsls r5, r5, #4
	strh r5, [r0, #0x36]
	mov r0, r8
	bl HideUnitSprite
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E838: .4byte gUnk_08C029C0

	thumb_func_start sub_801E83C
sub_801E83C: @ 0x0801E83C
	push {lr}
	ldr r0, _0801E84C @ =gUnk_08C029C0
	bl Proc_Find
	cmp r0, #0
	bne _0801E850
	movs r0, #0
	b _0801E852
	.align 2, 0
_0801E84C: .4byte gUnk_08C029C0
_0801E850:
	movs r0, #1
_0801E852:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801E858
sub_801E858: @ 0x0801E858
	push {lr}
	ldr r1, _0801E888 @ =0x04000050
	ldr r2, _0801E88C @ =0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E890 @ =0x04000052
	ldr r1, _0801E894 @ =gBmSt
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x48
	bl SetNextVCount
	ldr r0, _0801E898 @ =sub_801E89C
	bl SetOnVMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801E888: .4byte 0x04000050
_0801E88C: .4byte 0x00003C42
_0801E890: .4byte 0x04000052
_0801E894: .4byte gBmSt
_0801E898: .4byte sub_801E89C

	thumb_func_start sub_801E89C
sub_801E89C: @ 0x0801E89C
	push {lr}
	ldr r1, _0801E8CC @ =0x04000050
	ldr r2, _0801E8D0 @ =0x00003E41
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E8D4 @ =0x04000052
	ldr r1, _0801E8D8 @ =gBmSt
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x39
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x60
	bl SetNextVCount
	ldr r0, _0801E8DC @ =sub_801E8E0
	bl SetOnVMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801E8CC: .4byte 0x04000050
_0801E8D0: .4byte 0x00003E41
_0801E8D4: .4byte 0x04000052
_0801E8D8: .4byte gBmSt
_0801E8DC: .4byte sub_801E8E0

	thumb_func_start sub_801E8E0
sub_801E8E0: @ 0x0801E8E0
	push {lr}
	ldr r1, _0801E910 @ =0x04000050
	ldr r2, _0801E914 @ =0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E918 @ =0x04000052
	ldr r1, _0801E91C @ =gBmSt
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0
	bl SetNextVCount
	ldr r0, _0801E920 @ =sub_801E858
	bl SetOnVMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801E910: .4byte 0x04000050
_0801E914: .4byte 0x00003C42
_0801E918: .4byte 0x04000052
_0801E91C: .4byte gBmSt
_0801E920: .4byte sub_801E858

	thumb_func_start sub_801E924
sub_801E924: @ 0x0801E924
	push {lr}
	ldr r2, _0801E944 @ =gBg0Tm + 0x240
	movs r1, #0
	ldr r0, _0801E948 @ =0x00005140
	adds r3, r0, #0
_0801E92E:
	adds r0, r1, r3
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x5f
	ble _0801E92E
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0801E944: .4byte gBg0Tm + 0x240
_0801E948: .4byte 0x00005140

	thumb_func_start sub_801E94C
sub_801E94C: @ 0x0801E94C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetCurrentBgmSong
	adds r4, r0, #0
	bl sub_8016318
	cmp r4, r0
	beq _0801E964
	movs r0, #4
	bl sub_80034C8
_0801E964:
	ldr r0, _0801E984 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801E976
	ldr r0, _0801E988 @ =0x00000393
	bl m4aSongNumStart
_0801E976:
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E984: .4byte gPlaySt
_0801E988: .4byte 0x00000393

	thumb_func_start sub_801E98C
sub_801E98C: @ 0x0801E98C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x1c
	rsbs r1, r1, #0
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801E9EC @ =gBmSt
	adds r2, r0, #0
	adds r2, #0x38
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	adds r0, #0x39
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801E9E4
	movs r0, #0xf
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0801E9E4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E9EC: .4byte gBmSt

	thumb_func_start sub_801E9F0
sub_801E9F0: @ 0x0801E9F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r2, #0x1c
	rsbs r2, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0x24
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801EA50 @ =gBmSt
	adds r2, r0, #0
	adds r2, #0x38
	ldrb r1, [r2]
	subs r1, #1
	strb r1, [r2]
	adds r0, #0x39
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801EA46
	movs r0, #0xf
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0801EA46:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801EA50: .4byte gBmSt

	thumb_func_start sub_801EA54
sub_801EA54: @ 0x0801EA54
	push {lr}
	ldr r0, _0801EA68 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0801EA68: .4byte gBg0Tm

	thumb_func_start sub_801EA6C
sub_801EA6C: @ 0x0801EA6C
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

	thumb_func_start sub_801EA74
sub_801EA74: @ 0x0801EA74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801EB44 @ =gBg1Tm
	mov ip, r1
_0801EA8E:
	movs r3, #0xe
	str r3, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r7, r6, #1
	mov sb, r7
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801EABA:
	mov r3, r8
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldr r3, [sp]
	subs r0, r3, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801EACE
	movs r3, #0x10
_0801EACE:
	cmp r3, #0
	bge _0801EAD4
	movs r3, #0
_0801EAD4:
	movs r0, #0x10
	subs r3, r0, r3
	movs r0, #0xfe
	ands r3, r0
	movs r7, #0xa2
	lsls r7, r7, #7
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	adds r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x1f
	adds r0, r3, r7
	strh r0, [r5]
	adds r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801EABA
	mov r6, sb
	cmp r6, #0
	bge _0801EA8E
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	mov r3, r8
	ldrh r3, [r3]
	cmp r3, #0x22
	bne _0801EB34
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	mov r0, sl
	bl Proc_Break
_0801EB34:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EB44: .4byte gBg1Tm

	thumb_func_start sub_801EB48
sub_801EB48: @ 0x0801EB48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801EC14 @ =gBg1Tm
	mov ip, r1
_0801EB62:
	movs r3, #0xe
	str r3, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r7, r6, #1
	mov sb, r7
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801EB8E:
	mov r3, r8
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldr r3, [sp]
	subs r0, r3, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801EBA2
	movs r3, #0x10
_0801EBA2:
	cmp r3, #0
	bge _0801EBA8
	movs r3, #0
_0801EBA8:
	movs r0, #0xfe
	ands r3, r0
	ldr r7, _0801EC18 @ =0x00005501
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	subs r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x21
	adds r0, r3, r7
	strh r0, [r5]
	subs r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801EB8E
	mov r6, sb
	cmp r6, #0
	bge _0801EB62
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	mov r3, r8
	ldrh r3, [r3]
	cmp r3, #0x24
	bne _0801EC02
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	mov r0, sl
	bl Proc_Break
_0801EC02:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EC14: .4byte gBg1Tm
_0801EC18: .4byte 0x00005501

	thumb_func_start sub_801EC1C
sub_801EC1C: @ 0x0801EC1C
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

	thumb_func_start sub_801EC24
sub_801EC24: @ 0x0801EC24
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0x3c
	bl Interpolate
	ldr r3, _0801ECA4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #8
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	bl Interpolate
	ldr r2, _0801ECA8 @ =gBmSt
	adds r1, r2, #0
	adds r1, #0x3a
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x3b
	strb r1, [r2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0801EC9A
	adds r0, r6, #0
	bl Proc_Break
_0801EC9A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801ECA4: .4byte gDispIo
_0801ECA8: .4byte gBmSt

	thumb_func_start sub_801ECAC
sub_801ECAC: @ 0x0801ECAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x3c
	bl Interpolate
	ldr r3, _0801ED28 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #8
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	bl Interpolate
	ldr r2, _0801ED2C @ =gBmSt
	adds r1, r2, #0
	adds r1, #0x3a
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x3b
	strb r1, [r2]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801ED20
	adds r0, r6, #0
	bl Proc_Break
_0801ED20:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED28: .4byte gDispIo
_0801ED2C: .4byte gBmSt

	thumb_func_start sub_801ED30
sub_801ED30: @ 0x0801ED30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801ED4C @ =gPlaySt
	ldrb r0, [r0, #0xf]
	bl CountFactionMoveableUnits
	cmp r0, #0
	bne _0801ED46
	adds r0, r4, #0
	bl Proc_End
_0801ED46:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED4C: .4byte gPlaySt

	thumb_func_start sub_801ED50
sub_801ED50: @ 0x0801ED50
	push {lr}
	ldr r0, _0801ED8C @ =gUnk_08191074
	ldr r1, _0801ED90 @ =0x06002000
	bl Decompress
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
	ldr r0, _0801ED94 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0801EDD8
	cmp r0, #0x40
	bgt _0801ED98
	cmp r0, #0
	beq _0801ED9E
	b _0801EDEA
	.align 2, 0
_0801ED8C: .4byte gUnk_08191074
_0801ED90: .4byte 0x06002000
_0801ED94: .4byte gPlaySt
_0801ED98:
	cmp r0, #0x80
	beq _0801EDB8
	b _0801EDEA
_0801ED9E:
	ldr r0, _0801EDAC @ =gUnk_081902E8
	ldr r1, _0801EDB0 @ =0x06002800
	bl Decompress
	ldr r0, _0801EDB4 @ =gUnk_08190764
	b _0801EDC2
	.align 2, 0
_0801EDAC: .4byte gUnk_081902E8
_0801EDB0: .4byte 0x06002800
_0801EDB4: .4byte gUnk_08190764
_0801EDB8:
	ldr r0, _0801EDCC @ =gUnk_08190784
	ldr r1, _0801EDD0 @ =0x06002800
	bl Decompress
	ldr r0, _0801EDD4 @ =gUnk_08190BDC
_0801EDC2:
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0801EDEA
	.align 2, 0
_0801EDCC: .4byte gUnk_08190784
_0801EDD0: .4byte 0x06002800
_0801EDD4: .4byte gUnk_08190BDC
_0801EDD8:
	ldr r0, _0801EDF0 @ =gUnk_08190BFC
	ldr r1, _0801EDF4 @ =0x06002800
	bl Decompress
	ldr r0, _0801EDF8 @ =gUnk_08191054
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
_0801EDEA:
	pop {r0}
	bx r0
	.align 2, 0
_0801EDF0: .4byte gUnk_08190BFC
_0801EDF4: .4byte 0x06002800
_0801EDF8: .4byte gUnk_08191054

	thumb_func_start sub_801EDFC
sub_801EDFC: @ 0x0801EDFC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0801EEE4 @ =gDispIo
	mov ip, r0
	movs r1, #0x20
	mov r8, r1
	mov r0, r8
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r6, #0
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r7]
	ldr r1, _0801EEE8 @ =gBmSt
	adds r0, r1, #0
	adds r0, #0x3a
	strb r6, [r0]
	adds r0, #1
	movs r3, #0x10
	strb r3, [r0]
	subs r0, #3
	strb r6, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0801EEEC @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _0801EEF0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0
	bl SetVCount
	ldr r0, _0801EEF4 @ =sub_801E858
	bl SetOnVMatch
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EEE4: .4byte gDispIo
_0801EEE8: .4byte gBmSt
_0801EEEC: .4byte 0x0000FFE0
_0801EEF0: .4byte 0x0000E0FF
_0801EEF4: .4byte sub_801E858

	thumb_func_start sub_801EEF8
sub_801EEF8: @ 0x0801EEF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801EF80 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801EF84 @ =gBmSt
	adds r1, r0, #0
	adds r1, #0x3a
	ldrb r2, [r1]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r2, [r1]
	adds r0, #0x3b
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0801EF88 @ =gUnk_08C029E8
	bl Proc_Find
	cmp r0, #0
	bne _0801EF7A
	ldr r0, _0801EF8C @ =gUnk_08C02A28
	bl Proc_Find
	cmp r0, #0
	bne _0801EF7A
	ldr r0, _0801EF90 @ =gUnk_08C02A48
	bl Proc_Find
	cmp r0, #0
	bne _0801EF7A
	bl ClearBg0Bg1
	movs r0, #0
	bl SetOnVMatch
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
	adds r0, r4, #0
	bl Proc_Break
_0801EF7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EF80: .4byte gDispIo
_0801EF84: .4byte gBmSt
_0801EF88: .4byte gUnk_08C029E8
_0801EF8C: .4byte gUnk_08C02A28
_0801EF90: .4byte gUnk_08C02A48

	thumb_func_start sub_801EF94
sub_801EF94: @ 0x0801EF94
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0801EFC0 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_806FC64
	adds r0, #5
	ldr r1, _0801EFC4 @ =0x02033DFC
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r1, #0
	bl sub_806C7F8
	pop {r0}
	bx r0
	.align 2, 0
_0801EFC0: .4byte gActiveUnit
_0801EFC4: .4byte 0x02033DFC

	thumb_func_start sub_801EFC8
sub_801EFC8: @ 0x0801EFC8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	movs r6, #0
	movs r7, #0
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r1, #1
	beq _0801F020
	cmp r1, #1
	bgt _0801EFEA
	cmp r1, #0
	beq _0801F010
	b _0801F024
_0801EFEA:
	cmp r1, #2
	beq _0801F000
	cmp r1, #3
	bne _0801F024
	ldr r0, _0801EFF8 @ =gUnk_081923EC
	ldr r6, _0801EFFC @ =gUnk_08191ED4
	b _0801F024
	.align 2, 0
_0801EFF8: .4byte gUnk_081923EC
_0801EFFC: .4byte gUnk_08191ED4
_0801F000:
	ldr r0, _0801F008 @ =gUnk_081923EC
	ldr r6, _0801F00C @ =gUnk_08191ED4
	movs r7, #1
	b _0801F024
	.align 2, 0
_0801F008: .4byte gUnk_081923EC
_0801F00C: .4byte gUnk_08191ED4
_0801F010:
	ldr r0, _0801F018 @ =gUnk_081929D4
	ldr r6, _0801F01C @ =gUnk_08192178
	movs r7, #1
	b _0801F024
	.align 2, 0
_0801F018: .4byte gUnk_081929D4
_0801F01C: .4byte gUnk_08192178
_0801F020:
	ldr r0, _0801F074 @ =gUnk_081929D4
	ldr r6, _0801F078 @ =gUnk_08192178
_0801F024:
	ldr r1, _0801F07C @ =0x06014800
	bl Decompress
	ldr r0, _0801F080 @ =gUnk_08192F48
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F084 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8012AF0
	adds r4, #8
	movs r0, #0xba
	adds r1, r4, #0
	bl sub_80151FC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F074: .4byte gUnk_081929D4
_0801F078: .4byte gUnk_08192178
_0801F07C: .4byte 0x06014800
_0801F080: .4byte gUnk_08192F48
_0801F084: .4byte gBmSt

	thumb_func_start sub_801F088
sub_801F088: @ 0x0801F088
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _0801F0B4 @ =gUnk_08C02AB0
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	adds r0, #0x4a
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F0B4: .4byte gUnk_08C02AB0

	thumb_func_start sub_801F0B8
sub_801F0B8: @ 0x0801F0B8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F104 @ =gUnk_0819381C
	ldr r1, _0801F108 @ =0x06014800
	bl Decompress
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F10C @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F110 @ =gUnk_08193CD8
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_8012AF0
	adds r4, #8
	movs r0, #0xbf
	adds r1, r4, #0
	bl sub_80151FC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F104: .4byte gUnk_0819381C
_0801F108: .4byte 0x06014800
_0801F10C: .4byte gBmSt
_0801F110: .4byte gUnk_08193CD8

	thumb_func_start sub_801F114
sub_801F114: @ 0x0801F114
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801F13C @ =gUnk_08193CB8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801F140 @ =gUnk_08C02AD0
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F13C: .4byte gUnk_08193CB8
_0801F140: .4byte gUnk_08C02AD0

	thumb_func_start sub_801F144
sub_801F144: @ 0x0801F144
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801F16C @ =gUnk_0819436C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801F170 @ =gUnk_08C02AD0
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F16C: .4byte gUnk_0819436C
_0801F170: .4byte gUnk_08C02AD0

	thumb_func_start sub_801F174
sub_801F174: @ 0x0801F174
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsls r1, r1, #4
	ldr r3, _0801F1D0 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r0, #8
	subs r1, r1, r0
	ldr r0, _0801F1D4 @ =0x000001FF
	ands r1, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	subs r0, #8
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F1D8 @ =gUnk_083F44FC
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_8012AF0
	ldr r0, [r5, #0x5c]
	subs r0, #1
	str r0, [r5, #0x5c]
	cmp r0, #0
	bgt _0801F1BE
	adds r0, r5, #0
	movs r1, #0x64
	bl Proc_Goto
_0801F1BE:
	ldr r0, [r5, #0x58]
	cmp r0, #1
	beq _0801F1FA
	cmp r0, #1
	bgt _0801F1DC
	cmp r0, #0
	beq _0801F1F4
	b _0801F200
	.align 2, 0
_0801F1D0: .4byte gBmSt
_0801F1D4: .4byte 0x000001FF
_0801F1D8: .4byte gUnk_083F44FC
_0801F1DC:
	cmp r0, #2
	beq _0801F1EC
	cmp r0, #3
	bne _0801F200
	ldr r0, [r5, #0x30]
	subs r0, #1
	str r0, [r5, #0x30]
	b _0801F200
_0801F1EC:
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	b _0801F200
_0801F1F4:
	ldr r0, [r5, #0x2c]
	subs r0, #1
	b _0801F1FE
_0801F1FA:
	ldr r0, [r5, #0x2c]
	adds r0, #1
_0801F1FE:
	str r0, [r5, #0x2c]
_0801F200:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801F208
sub_801F208: @ 0x0801F208
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov sb, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, _0801F250 @ =gUnk_083FAEE0
	ldr r1, _0801F254 @ =0x06014800
	bl Decompress
	ldr r0, _0801F258 @ =gUnk_083FB16C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801F25C @ =gUnk_08C02AF0
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x58]
	str r6, [r0, #0x5c]
	mov r1, r8
	str r1, [r0, #0x2c]
	mov r1, sb
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F250: .4byte gUnk_083FAEE0
_0801F254: .4byte 0x06014800
_0801F258: .4byte gUnk_083FB16C
_0801F25C: .4byte gUnk_08C02AF0

	thumb_func_start sub_801F260
sub_801F260: @ 0x0801F260
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F2B8 @ =gUnk_08192F88
	ldr r1, _0801F2BC @ =0x06014800
	bl Decompress
	ldr r0, _0801F2C0 @ =gUnk_08192F68
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r0, _0801F2C4 @ =gBmSt
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	subs r0, #8
	subs r4, r4, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F2C8 @ =gUnk_08193260
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0x50
	bl sub_8012AF0
	adds r4, #8
	movs r0, #0xbc
	adds r1, r4, #0
	bl sub_80151FC
	ldr r1, [r5, #0x2c]
	adds r0, r5, #0
	movs r2, #0x1f
	bl sub_801615C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F2B8: .4byte gUnk_08192F88
_0801F2BC: .4byte 0x06014800
_0801F2C0: .4byte gUnk_08192F68
_0801F2C4: .4byte gBmSt
_0801F2C8: .4byte gUnk_08193260

	thumb_func_start sub_801F2CC
sub_801F2CC: @ 0x0801F2CC
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0801F2E4 @ =gUnk_08C02B30
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F2E4: .4byte gUnk_08C02B30

	thumb_func_start sub_801F2E8
sub_801F2E8: @ 0x0801F2E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl sub_802C190
	ldrb r1, [r0, #3]
	lsrs r4, r1, #1
	ldrb r1, [r0, #1]
	adds r4, r1, r4
	ldrb r1, [r0, #4]
	lsrs r2, r1, #1
	ldrb r0, [r0, #2]
	adds r2, r0, r2
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_801615C
	str r4, [r5, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801F314
sub_801F314: @ 0x0801F314
	push {r4, lr}
	adds r4, r0, #0
	bl RenderMapForFade
	bl sub_8019428
	bl RenderMap
	movs r0, #0
	bl StartMapFade
	ldr r0, [r4, #0x30]
	movs r2, #0xbd
	cmp r0, #0
	beq _0801F334
	movs r2, #0xbe
_0801F334:
	ldr r0, _0801F34C @ =gBmSt
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	ldr r1, [r4, #0x34]
	subs r1, r1, r0
	adds r0, r2, #0
	bl sub_80151FC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F34C: .4byte gBmSt

	thumb_func_start sub_801F350
sub_801F350: @ 0x0801F350
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r4, r2, #0
	ldr r0, _0801F378 @ =gUnk_08C02B58
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetTrap
	adds r1, r0, #0
	movs r0, #1
	ldrb r2, [r1, #3]
	eors r0, r2
	strb r0, [r1, #3]
	cmp r0, #0
	beq _0801F37C
	ldrb r0, [r1, #1]
	b _0801F37E
	.align 2, 0
_0801F378: .4byte gUnk_08C02B58
_0801F37C:
	ldrb r0, [r1]
_0801F37E:
	str r0, [r5, #0x2c]
	ldrb r0, [r1, #3]
	str r0, [r5, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801F38C
sub_801F38C: @ 0x0801F38C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F3EC @ =gUnk_08194AF8
	ldr r1, _0801F3F0 @ =0x06014800
	bl Decompress
	ldr r0, _0801F3F4 @ =gUnk_08194F8C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F3F8 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F3FC @ =gUnk_08194D78
	adds r5, #0x4a
	movs r6, #0
	ldrsh r1, [r5, r6]
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_8012AF0
	adds r4, #8
	movs r0, #0xbb
	adds r1, r4, #0
	bl sub_80151FC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F3EC: .4byte gUnk_08194AF8
_0801F3F0: .4byte 0x06014800
_0801F3F4: .4byte gUnk_08194F8C
_0801F3F8: .4byte gBmSt
_0801F3FC: .4byte gUnk_08194D78

	thumb_func_start sub_801F400
sub_801F400: @ 0x0801F400
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0801F424 @ =gUnk_08C02B88
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	cmp r7, #1
	beq _0801F42E
	cmp r7, #1
	bgt _0801F428
	cmp r7, #0
	beq _0801F436
	b _0801F446
	.align 2, 0
_0801F424: .4byte gUnk_08C02B88
_0801F428:
	cmp r7, #3
	beq _0801F43E
	b _0801F446
_0801F42E:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #0
	b _0801F444
_0801F436:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #1
	b _0801F444
_0801F43E:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #2
_0801F444:
	strh r0, [r1]
_0801F446:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801F44C
sub_801F44C: @ 0x0801F44C
	adds r0, #0x4c
	movs r1, #0xf0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_801F454
sub_801F454: @ 0x0801F454
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0801F476
	ldr r0, _0801F480 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801F47C
_0801F476:
	adds r0, r2, #0
	bl Proc_Break
_0801F47C:
	pop {r0}
	bx r0
	.align 2, 0
_0801F480: .4byte gpKeySt

	thumb_func_start sub_801F484
sub_801F484: @ 0x0801F484
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r6, #0
	bl GetStringTextLen
	adds r2, r0, #0
	cmp r5, #0
	blt _0801F49C
	adds r2, #0x10
_0801F49C:
	adds r2, #0x18
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F4A8
	adds r0, #0xf
_0801F4A8:
	asrs r4, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F4B2
	adds r0, #7
_0801F4B2:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r3, #4
	bl sub_804A4CC
	cmp r5, #0
	blt _0801F4E2
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	lsls r0, r4, #1
	ldr r1, _0801F50C @ =gBg0Tm + 0x242
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r5, #0
	bl PutIcon
	adds r4, #2
_0801F4E2:
	bl ResetTextFont
	lsls r1, r4, #1
	ldr r0, _0801F50C @ =gBg0Tm + 0x242
	adds r1, r1, r0
	movs r0, #0x14
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0801F510 @ =gUnk_08C02BA8
	adds r1, r7, #0
	bl Proc_StartBlocking
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F50C: .4byte gBg0Tm + 0x242
_0801F510: .4byte gUnk_08C02BA8

	thumb_func_start sub_801F514
sub_801F514: @ 0x0801F514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	mov sb, r2
	bl ResetTextFont
	add r0, sp, #4
	movs r1, #0x14
	bl InitText
	add r7, sp, #0xc
	adds r0, r7, #0
	movs r1, #0x14
	bl InitText
	add r0, sp, #4
	movs r1, #2
	bl Text_SetColor
	adds r0, r7, #0
	movs r1, #2
	bl Text_SetColor
	mov r0, r8
	bl GetItemName
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	mov r0, sb
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	add r0, sp, #4
	movs r1, #2
	bl Text_Skip
	adds r0, r7, #0
	movs r1, #2
	bl Text_Skip
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, _0801F640 @ =0x00000726
	bl DecodeMsg
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	ldr r0, _0801F644 @ =0x00000727
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	add r0, sp, #4
	bl sub_8005440
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_8005440
	adds r2, r0, #0
	cmp r4, r2
	ble _0801F5BA
	adds r2, r4, #0
_0801F5BA:
	adds r2, #0x30
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F5C6
	adds r0, #0xf
_0801F5C6:
	asrs r6, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F5D0
	adds r0, #7
_0801F5D0:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #7
	movs r3, #6
	bl sub_804A4CC
	lsls r6, r6, #1
	ldr r5, _0801F648 @ =gBg0Tm + 0x202
	adds r4, r6, r5
	mov r0, r8
	bl sub_8017808
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	mov r8, r0
	adds r0, r4, #0
	mov r2, r8
	bl PutIcon
	adds r4, r5, #0
	adds r4, #0x80
	adds r4, r6, r4
	mov r0, sb
	bl sub_8017808
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, r8
	bl PutIcon
	adds r1, r5, #4
	adds r1, r6, r1
	add r0, sp, #4
	bl PutText
	adds r5, #0x84
	adds r6, r6, r5
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutText
	ldr r0, _0801F64C @ =gUnk_08C02BA8
	mov r1, sl
	bl Proc_StartBlocking
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F640: .4byte 0x00000726
_0801F644: .4byte 0x00000727
_0801F648: .4byte gBg0Tm + 0x202
_0801F64C: .4byte gUnk_08C02BA8

	thumb_func_start sub_801F650
sub_801F650: @ 0x0801F650
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	bl ResetTextFont
	add r0, sp, #4
	movs r1, #0x14
	bl InitText
	add r0, sp, #4
	movs r1, #2
	bl Text_SetColor
	adds r0, r7, #0
	bl GetItemName
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	add r0, sp, #4
	movs r1, #2
	bl Text_Skip
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	add r0, sp, #4
	bl sub_8005440
	adds r2, r0, #0
	adds r2, #0x28
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F6B2
	adds r0, #0xf
_0801F6B2:
	asrs r5, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F6BC
	adds r0, #7
_0801F6BC:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #8
	movs r3, #4
	bl sub_804A4CC
	lsls r5, r5, #1
	ldr r4, _0801F704 @ =gBg0Tm + 0x242
	adds r6, r5, r4
	adds r0, r7, #0
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r6, #0
	bl PutIcon
	adds r4, #4
	adds r5, r5, r4
	add r0, sp, #4
	adds r1, r5, #0
	bl PutText
	ldr r0, _0801F708 @ =gUnk_08C02BA8
	mov r1, r8
	bl Proc_StartBlocking
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F704: .4byte gBg0Tm + 0x242
_0801F708: .4byte gUnk_08C02BA8

	thumb_func_start sub_801F70C
sub_801F70C: @ 0x0801F70C
	push {lr}
	movs r2, #0xe5
	lsls r2, r2, #3
	bl sub_801F650
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801F71C
sub_801F71C: @ 0x0801F71C
	push {lr}
	ldr r2, _0801F728 @ =0x00000729
	bl sub_801F650
	pop {r0}
	bx r0
	.align 2, 0
_0801F728: .4byte 0x00000729

	thumb_func_start sub_801F72C
sub_801F72C: @ 0x0801F72C
	push {lr}
	bl GetGameTime
	adds r2, r0, #0
	lsrs r2, r2, #1
	movs r0, #0xff
	ands r2, r0
	movs r0, #3
	adds r1, r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801F748
sub_801F748: @ 0x0801F748
	ldr r1, [r0, #0x14]
	adds r1, #0x50
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_801F758
sub_801F758: @ 0x0801F758
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801F7AC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801F77E
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801F77A
	adds r1, r4, #0
	adds r1, #0x50
_0801F77A:
	movs r0, #1
	strh r0, [r1]
_0801F77E:
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0801F7A6
	ldr r2, [r4, #0x14]
	adds r1, r2, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0801F7A6
	adds r1, r0, #0
	adds r0, r2, #0
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_End
_0801F7A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F7AC: .4byte gpKeySt

	thumb_func_start sub_801F7B0
sub_801F7B0: @ 0x0801F7B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r4, _0801F80C @ =gBg2Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0801F810 @ =gUnk_08405FD0
	ldr r5, _0801F814 @ =0x02001F72
	adds r1, r5, #0
	bl Decompress
	movs r1, #0
	mov ip, r4
	mov r8, r5
	ldr r0, _0801F818 @ =0x00005001
	adds r5, r0, #0
_0801F7D6:
	movs r3, #0
	adds r4, r1, #1
	lsls r1, r4, #5
	adds r1, #3
	lsls r0, r6, #1
	mov r7, r8
	adds r2, r0, r7
	lsls r1, r1, #1
	add r1, ip
_0801F7E8:
	ldrh r7, [r2]
	adds r0, r5, r7
	strh r0, [r1]
	adds r2, #2
	adds r6, #1
	adds r1, #2
	adds r3, #1
	cmp r3, #0x17
	ble _0801F7E8
	adds r1, r4, #0
	cmp r1, #0x11
	ble _0801F7D6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F80C: .4byte gBg2Tm
_0801F810: .4byte gUnk_08405FD0
_0801F814: .4byte 0x02001F72
_0801F818: .4byte 0x00005001

	thumb_func_start sub_801F81C
sub_801F81C: @ 0x0801F81C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0x82
	lsls r0, r0, #7
	mov sb, r0
	ldr r1, _0801F8E8 @ =0x00004110
	mov r8, r1
	movs r6, #0
	ldr r7, _0801F8EC @ =gBg3Tm
	mov sl, r7
_0801F838:
	movs r0, #0
	str r0, [sp]
	lsls r5, r6, #5
	adds r2, r6, #0
	adds r2, #0x10
	adds r0, r6, #0
	adds r0, #8
	adds r4, r6, #0
	adds r4, #0x18
	adds r1, r6, #1
	str r1, [sp, #4]
	adds r5, #0x10
	lsls r3, r2, #5
	adds r3, #0x10
	lsls r1, r0, #5
	adds r1, #0x10
	lsls r0, r0, #6
	add r0, sl
	mov ip, r0
	lsls r2, r2, #6
	add r2, sl
	str r2, [sp, #0xc]
	lsls r0, r6, #6
	mov r6, sl
	adds r2, r0, r6
	lsls r0, r4, #5
	adds r0, #0x10
	str r0, [sp, #8]
	lsls r4, r4, #6
	add r4, sl
	lsls r1, r1, #1
	add r1, sl
	lsls r3, r3, #1
	add r3, sl
	lsls r5, r5, #1
	add r5, sl
_0801F880:
	mov r7, sb
	strh r7, [r2]
	mov r0, sb
	strh r0, [r5]
	ldr r6, [sp, #0xc]
	strh r0, [r6]
	strh r0, [r3]
	mov r0, r8
	mov r7, ip
	strh r0, [r7]
	strh r0, [r1]
	strh r0, [r4]
	ldr r6, [sp, #8]
	ldr r7, [sp]
	adds r0, r6, r7
	lsls r0, r0, #1
	add r0, sl
	mov r6, r8
	strh r6, [r0]
	movs r7, #1
	add sb, r7
	movs r0, #1
	add r8, r0
	movs r6, #2
	add ip, r6
	ldr r7, [sp, #0xc]
	adds r7, #2
	str r7, [sp, #0xc]
	adds r2, #2
	adds r4, #2
	adds r1, #2
	adds r3, #2
	adds r5, #2
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	cmp r0, #0xf
	ble _0801F880
	movs r1, #0x10
	add sb, r1
	add r8, r1
	ldr r6, [sp, #4]
	cmp r6, #7
	ble _0801F838
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F8E8: .4byte 0x00004110
_0801F8EC: .4byte gBg3Tm

	thumb_func_start sub_801F8F0
sub_801F8F0: @ 0x0801F8F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0x82
	lsls r0, r0, #7
	mov r8, r0
	ldr r1, _0801F9D0 @ =0x00004110
	str r1, [sp, #0xc]
	movs r2, #0
	ldr r6, _0801F9D4 @ =gBg2Tm
_0801F90A:
	movs r5, #0
	adds r0, r2, #0
	adds r0, #0x10
	adds r3, r2, #0
	adds r3, #8
	adds r4, r2, #0
	adds r4, #0x18
	adds r7, r2, #1
	str r7, [sp, #8]
	lsls r2, r2, #5
	str r2, [sp]
	adds r2, #0x1f
	lsls r0, r0, #5
	mov sl, r0
	mov r1, sl
	adds r1, #0x1f
	lsls r3, r3, #5
	mov sb, r3
	mov r0, sb
	adds r0, #0x1f
	lsls r4, r4, #5
	mov ip, r4
	mov r3, ip
	adds r3, #0x1f
	str r3, [sp, #4]
	lsls r0, r0, #1
	adds r4, r0, r6
	lsls r1, r1, #1
	adds r3, r1, r6
	lsls r2, r2, #1
	adds r2, r2, r6
_0801F948:
	ldr r0, [sp]
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	strh r1, [r0]
	strh r1, [r2]
	mov r0, sl
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	strh r1, [r3]
	mov r0, sb
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r7, r0
	ldr r7, [sp, #0x10]
	strh r1, [r7]
	strh r1, [r4]
	mov r0, ip
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	ldr r7, [sp, #4]
	subs r0, r7, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	subs r4, #2
	subs r3, #2
	subs r2, #2
	adds r5, #1
	cmp r5, #0xf
	ble _0801F948
	movs r3, #0x10
	add r8, r3
	adds r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [sp, #8]
	cmp r2, #7
	ble _0801F90A
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F9D0: .4byte 0x00004110
_0801F9D4: .4byte gBg2Tm

	thumb_func_start sub_801F9D8
sub_801F9D8: @ 0x0801F9D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	bl InitBmBgLayers
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801FB5C @ =gBg0Tm
	mov sl, r0
	movs r1, #0
	bl TmFill
	ldr r1, _0801FB60 @ =gBg1Tm
	mov sb, r1
	mov r0, sb
	movs r1, #0
	bl TmFill
	ldr r0, _0801FB64 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0801FB68 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBgChrOffset
	ldr r2, _0801FB6C @ =gDispIo
	mov ip, r2
	movs r5, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0x34
	add r0, ip
	mov r8, r0
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r6, #4
	orrs r1, r6
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r7]
	ands r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, r8
	strb r1, [r2]
	orrs r0, r5
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	movs r0, #8
	movs r1, #0
	bl sub_8082DB8
	movs r0, #0
	movs r1, #1
	bl sub_8082DB8
	movs r0, #0x80
	bl sub_8082E9C
	movs r4, #0x80
	lsls r4, r4, #1
	ldr r0, _0801FB70 @ =gPlaySt
	bl sub_8082F30
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8082E2C
	movs r0, #0x80
	lsls r0, r0, #2
	add sb, r0
	mov r0, sb
	movs r1, #0
	bl sub_8082F0C
	ldr r1, _0801FB74 @ =0x00000246
	add sl, r1
	mov r0, sl
	movs r1, #1
	bl sub_8082ECC
	bl ColorFadeInit
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	movs r1, #2
	movs r2, #0x40
	bl sub_80021F0
	bl ColorFadeTick_thm
	bl EnablePalSync
	ldr r0, _0801FB78 @ =gUnk_08406218
	ldr r1, _0801FB7C @ =0x0600A000
	bl Decompress
	ldr r0, _0801FB80 @ =gUnk_08407E9C
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801FB84 @ =gUnk_08405010
	ldr r1, _0801FB88 @ =0x06008020
	bl Decompress
	ldr r0, _0801FB8C @ =gUnk_084061F8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0x80
	lsls r0, r0, #3
	bl SetBlankChr
	ldr r0, _0801FB90 @ =gPal
	strh r5, [r0]
	bl sub_801F7B0
	bl sub_801F81C
	movs r0, #0xf
	bl EnableBgSync
	ldr r0, [sp]
	adds r0, #0x52
	strh r5, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FB5C: .4byte gBg0Tm
_0801FB60: .4byte gBg1Tm
_0801FB64: .4byte gBg2Tm
_0801FB68: .4byte gBg3Tm
_0801FB6C: .4byte gDispIo
_0801FB70: .4byte gPlaySt
_0801FB74: .4byte 0x00000246
_0801FB78: .4byte gUnk_08406218
_0801FB7C: .4byte 0x0600A000
_0801FB80: .4byte gUnk_08407E9C
_0801FB84: .4byte gUnk_08405010
_0801FB88: .4byte 0x06008020
_0801FB8C: .4byte gUnk_084061F8
_0801FB90: .4byte gPal

	thumb_func_start sub_801FB94
sub_801FB94: @ 0x0801FB94
	push {lr}
	ldr r3, _0801FBD0 @ =gDispIo
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	ldr r1, _0801FBD4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r1, r2
	movs r2, #0x18
	orrs r1, r2
	strh r1, [r3, #0x3c]
	adds r0, #0x4c
	movs r1, #0xc
	strh r1, [r0]
	movs r0, #2
	bl sub_80034C8
	pop {r0}
	bx r0
	.align 2, 0
_0801FBD0: .4byte gDispIo
_0801FBD4: .4byte 0x0000FFE0

	thumb_func_start sub_801FBD8
sub_801FBD8: @ 0x0801FBD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0801FC28 @ =gDispIo
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
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #3
	beq _0801FC16
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0801FC62
_0801FC16:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801FC2C
	ldrh r0, [r4]
	subs r0, #4
	b _0801FC30
	.align 2, 0
_0801FC28: .4byte gDispIo
_0801FC2C:
	ldrh r0, [r4]
	subs r0, #1
_0801FC30:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0801FC62
	ldr r2, _0801FC68 @ =gDispIo
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
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0801FC62:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC68: .4byte gDispIo

	thumb_func_start sub_801FC6C
sub_801FC6C: @ 0x0801FC6C
	push {lr}
	ldr r3, _0801FCC0 @ =gDispIo
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0801FCC4 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801FCC8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0801FCCC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801FCBC
	movs r0, #0x60
	bl m4aSongNumStart
_0801FCBC:
	pop {r0}
	bx r0
	.align 2, 0
_0801FCC0: .4byte gDispIo
_0801FCC4: .4byte 0x0000FFE0
_0801FCC8: .4byte 0x0000E0FF
_0801FCCC: .4byte gPlaySt

	thumb_func_start sub_801FCD0
sub_801FCD0: @ 0x0801FCD0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0801FD2C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0x10
	ldrb r1, [r4]
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #3
	beq _0801FD1A
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0801FD6E
_0801FD1A:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801FD30
	ldrh r0, [r4]
	subs r0, #4
	b _0801FD34
	.align 2, 0
_0801FD2C: .4byte gDispIo
_0801FD30:
	ldrh r0, [r4]
	subs r0, #1
_0801FD34:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0801FD6E
	ldr r3, _0801FD74 @ =gDispIo
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0801FD6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD74: .4byte gDispIo

	thumb_func_start sub_801FD78
sub_801FD78: @ 0x0801FD78
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0801FDB0 @ =gDispIo
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
	ldr r0, _0801FDB4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801FDAC
	movs r0, #0x61
	bl m4aSongNumStart
_0801FDAC:
	pop {r0}
	bx r0
	.align 2, 0
_0801FDB0: .4byte gDispIo
_0801FDB4: .4byte gPlaySt

	thumb_func_start sub_801FDB8
sub_801FDB8: @ 0x0801FDB8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x78
	bl Interpolate
	ldr r2, _0801FE10 @ =gDispIo
	movs r1, #0x78
	subs r1, r1, r0
	adds r3, r2, #0
	adds r3, #0x2d
	strb r1, [r3]
	adds r3, #4
	movs r1, #0x4e
	strb r1, [r3]
	adds r0, #0x78
	adds r1, r2, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x51
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801FE14
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801FE14
	adds r0, r1, #2
	strh r0, [r4]
	adds r0, r4, #0
	b _0801FE1E
	.align 2, 0
_0801FE10: .4byte gDispIo
_0801FE14:
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_0801FE1E:
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	ble _0801FE2C
	adds r0, r5, #0
	bl Proc_Break
_0801FE2C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801FE34
sub_801FE34: @ 0x0801FE34
	adds r0, #0x4c
	movs r1, #1
	strh r1, [r0]
	bx lr

	thumb_func_start sub_801FE3C
sub_801FE3C: @ 0x0801FE3C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r3, _0801FE94 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	movs r1, #0x50
	subs r1, r1, r0
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	adds r0, #0x50
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0801FE8C
	adds r0, r5, #0
	bl Proc_Break
_0801FE8C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE94: .4byte gDispIo

	thumb_func_start sub_801FE98
sub_801FE98: @ 0x0801FE98
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, _0801FEE4 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _0801FEE8 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #6
	orrs r0, r1
	ldr r1, _0801FEEC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0801FEE4: .4byte gDispIo
_0801FEE8: .4byte 0x0000FFE0
_0801FEEC: .4byte 0x0000E0FF

	thumb_func_start sub_801FEF0
sub_801FEF0: @ 0x0801FEF0
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
	bge _0801FF12
	adds r0, r4, #0
	bl Proc_Break
_0801FF12:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_801FF18
sub_801FF18: @ 0x0801FF18
	push {lr}
	adds r0, #0x4c
	movs r1, #0xd
	strh r1, [r0]
	bl ColorFadeInit
	ldr r0, _0801FF38 @ =gPal + 0x80
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #4
	movs r2, #2
	bl sub_80020CC
	pop {r0}
	bx r0
	.align 2, 0
_0801FF38: .4byte gPal + 0x80

	thumb_func_start sub_801FF3C
sub_801FF3C: @ 0x0801FF3C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #3
	ands r4, r0
	cmp r4, #0
	bne _0801FF98
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801FF98
	ldr r2, _0801FFA0 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _0801FFA4 @ =gPal
	strh r4, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
_0801FF98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FFA0: .4byte gDispIo
_0801FFA4: .4byte gPal

	thumb_func_start sub_801FFA8
sub_801FFA8: @ 0x0801FFA8
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	ldr r0, _0801FFCC @ =gPlaySt
	ldrb r0, [r0, #0x15]
	bl sub_802D8E4
	bl RefreshUnitSprites
	bl sub_8025A0C
	bl InitSystemTextFont
	pop {r0}
	bx r0
	.align 2, 0
_0801FFCC: .4byte gPlaySt

	thumb_func_start sub_801FFD0
sub_801FFD0: @ 0x0801FFD0
	ldr r1, _0801FFDC @ =gBmSt
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801FFDC: .4byte gBmSt

	thumb_func_start sub_801FFE0
sub_801FFE0: @ 0x0801FFE0
	push {r4, r5, lr}
	ldr r3, _080200B4 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _080200B8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _080200BC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080200C0 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl sub_802E310
	ldr r4, _080200C4 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	bl ApplyUnitSpritePalettes
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	bl sub_8015D98
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xf8
	lsls r1, r1, #1
	ands r0, r1
	ldr r5, _080200C8 @ =gBmSt
	strh r0, [r5, #0xc]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #4
	bl sub_8015DC0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xfc
	lsls r1, r1, #2
	ands r0, r1
	strh r0, [r5, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080200B4: .4byte gDispIo
_080200B8: .4byte 0x0000FFE0
_080200BC: .4byte 0x0000E0FF
_080200C0: .4byte gBg2Tm
_080200C4: .4byte gPlaySt
_080200C8: .4byte gBmSt

	thumb_func_start sub_80200CC
sub_80200CC: @ 0x080200CC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ColorFadeInit
	ldr r5, _0802013C @ =gPal + 0xc0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #1
	bl sub_80020CC
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #1
	bl sub_80020CC
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #1
	bl sub_80020CC
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #1
	bl sub_80020CC
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0x1e
	strh r0, [r4]
	ldr r0, _08020140 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020136
	bl sub_802DE44
_08020136:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802013C: .4byte gPal + 0xc0
_08020140: .4byte gPlaySt

	thumb_func_start sub_8020144
sub_8020144: @ 0x08020144
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08020156
	b _08020294
_08020156:
	bl ColorFadeTick_thm
	ldr r4, _080201E4 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0802016E
	bl sub_802DE44
_0802016E:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r6, [r0]
	cmp r6, #0
	beq _080201F0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _08020190
	movs r1, #2
_08020190:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _080201E8 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _080201BA
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _080201AE
	movs r1, #2
_080201AE:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl sub_800376C
_080201BA:
	adds r3, r7, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080201EC @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r5, r3, #0
	b _08020236
	.align 2, 0
_080201E4: .4byte gPlaySt
_080201E8: .4byte 0x0000FFFF
_080201EC: .4byte gDispIo
_080201F0:
	bl EnablePalSync
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r1, #7
	adds r5, r0, #0
	cmp r3, #0
	bge _08020206
	adds r3, #7
_08020206:
	asrs r3, r3, #3
	ldr r0, _0802029C @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0xc
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #4
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
_08020236:
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _08020282
	ldr r4, _080202A0 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _08020258
	movs r1, #2
_08020258:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _080202A4 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _08020282
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _08020276
	movs r1, #2
_08020276:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl sub_800376C
_08020282:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08020294
	bl sub_802E32C
	adds r0, r7, #0
	bl Proc_Break
_08020294:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802029C: .4byte gDispIo
_080202A0: .4byte gPlaySt
_080202A4: .4byte 0x0000FFFF

	thumb_func_start sub_80202A8
sub_80202A8: @ 0x080202A8
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start sub_80202B0
sub_80202B0: @ 0x080202B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080202F8 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x50
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	subs r1, #1
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080202F0
	adds r0, r5, #0
	bl Proc_Break
_080202F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080202F8: .4byte gDispIo

	thumb_func_start sub_80202FC
sub_80202FC: @ 0x080202FC
	adds r0, #0x4c
	movs r1, #8
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8020304
sub_8020304: @ 0x08020304
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0802034C @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x50
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	subs r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _08020344
	adds r0, r5, #0
	bl Proc_Break
_08020344:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802034C: .4byte gDispIo

	thumb_func_start sub_8020350
sub_8020350: @ 0x08020350
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeInit
	ldr r0, _08020378 @ =gPal
	movs r3, #2
	rsbs r3, r3, #0
	movs r1, #0
	movs r2, #6
	bl sub_80020CC
	adds r4, #0x4c
	movs r0, #0xf
	strh r0, [r4]
	movs r0, #1
	bl sub_80035EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020378: .4byte gPal

	thumb_func_start sub_802037C
sub_802037C: @ 0x0802037C
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
	bge _080203C4
	ldr r2, _080203CC @ =gDispIo
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
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	adds r0, r4, #0
	bl Proc_Break
_080203C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080203CC: .4byte gDispIo

	thumb_func_start sub_80203D0
sub_80203D0: @ 0x080203D0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ClearBg0Bg1
	bl ColorFadeInit
	ldr r5, _0802046C @ =gPal + 0xc0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #2
	bl sub_80020CC
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #2
	bl sub_80020CC
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r1, #0x10
	movs r2, #2
	movs r3, #2
	bl sub_80020CC
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #2
	bl sub_80020CC
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0xe
	strh r0, [r4]
	ldr r4, _08020470 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0802043C
	movs r1, #2
_0802043C:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _08020474 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _08020466
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0802045A
	movs r1, #2
_0802045A:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl sub_800376C
_08020466:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802046C: .4byte gPal + 0xc0
_08020470: .4byte gPlaySt
_08020474: .4byte 0x0000FFFF

	thumb_func_start sub_8020478
sub_8020478: @ 0x08020478
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	ldr r5, _080204CC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020494
	bl sub_802DE44
_08020494:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _080204D4
	adds r3, r4, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080204D0 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _080204DC
	.align 2, 0
_080204CC: .4byte gPlaySt
_080204D0: .4byte gDispIo
_080204D4:
	bl EnablePalSync
	adds r3, r4, #0
	adds r3, #0x4c
_080204DC:
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080204F2
	bl sub_802E32C
	adds r0, r4, #0
	bl Proc_Break
_080204F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80204F8
sub_80204F8: @ 0x080204F8
	adds r1, #0x50
	strh r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_8020500
sub_8020500: @ 0x08020500
	adds r1, #0x4c
	strh r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_8020508
sub_8020508: @ 0x08020508
	push {lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0802051C
	adds r0, r3, #0
	bl Proc_Break
	b _08020532
_0802051C:
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _08020532
	adds r0, r3, #0
	bl Proc_Break
_08020532:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8020538
sub_8020538: @ 0x08020538
	adds r0, #0x52
	movs r1, #2
	strh r1, [r0]
	bx lr

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
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0802056A
	bl sub_802DE44
_0802056A:
	bl sub_802E32C
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
	bl sub_802D874
	movs r0, #0x2b
	movs r1, #0
	bl sub_800376C
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
	ldr r0, _08020798 @ =gUnk_08406218
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
	bl ClearBg0Bg1
	ldr r0, _080207A4 @ =gBg0Tm + 0x24e
	ldr r1, _080207A8 @ =gUnk_08409060
	movs r2, #0x80
	bl TmApplyTsa_thm
	bl sub_801F8F0
	bl sub_801F81C
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
_08020798: .4byte gUnk_08406218
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
	bl sub_80034C8
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

	thumb_func_start sub_8020A84
sub_8020A84: @ 0x08020A84
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

	thumb_func_start sub_8020AD0
sub_8020AD0: @ 0x08020AD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020B60 @ =gUnk_081BDEE8
	ldr r1, _08020B64 @ =0x06002000
	bl Decompress
	ldr r0, _08020B68 @ =gUnk_081BEF08
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020B6C @ =gUnk_081BECCC
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
_08020B60: .4byte gUnk_081BDEE8
_08020B64: .4byte 0x06002000
_08020B68: .4byte gUnk_081BEF08
_08020B6C: .4byte gUnk_081BECCC
_08020B70: .4byte gUiTmScratchA
_08020B74: .4byte gBg0Tm
_08020B78: .4byte gDispIo
_08020B7C: .4byte 0x0000FFE0
_08020B80: .4byte 0x0000E0FF

	thumb_func_start sub_8020B84
sub_8020B84: @ 0x08020B84
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, _08020BBC @ =gUnk_081C93AC
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
_08020BBC: .4byte gUnk_081C93AC
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

	thumb_func_start sub_8020BEC
sub_8020BEC: @ 0x08020BEC
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8020BF4
sub_8020BF4: @ 0x08020BF4
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

	thumb_func_start sub_8020C44
sub_8020C44: @ 0x08020C44
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
	ldr r0, _08020CA8 @ =gUnk_08C02E50
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
_08020CA8: .4byte gUnk_08C02E50
_08020CAC: .4byte gBmSt

	thumb_func_start sub_8020CB0
sub_8020CB0: @ 0x08020CB0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020D68 @ =gUnk_0819839C
	ldr r1, _08020D6C @ =0x06002000
	bl Decompress
	ldr r0, _08020D70 @ =gUnk_08198AE4
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020D74 @ =gUnk_08198B04
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
_08020D68: .4byte gUnk_0819839C
_08020D6C: .4byte 0x06002000
_08020D70: .4byte gUnk_08198AE4
_08020D74: .4byte gUnk_08198B04
_08020D78: .4byte gUiTmScratchA
_08020D7C: .4byte gBg0Tm
_08020D80: .4byte gPlaySt
_08020D84: .4byte gDispIo
_08020D88: .4byte 0x0000FFE0
_08020D8C: .4byte 0x0000E0FF

	thumb_func_start sub_8020D90
sub_8020D90: @ 0x08020D90
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, _08020DEC @ =gUnk_08C02ECC
	cmp r0, #0
	bne _08020DA2
	ldr r4, _08020DF0 @ =gUnk_08C02E88
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
_08020DEC: .4byte gUnk_08C02ECC
_08020DF0: .4byte gUnk_08C02E88
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

	thumb_func_start sub_8020E2C
sub_8020E2C: @ 0x08020E2C
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

	thumb_func_start sub_8020E5C
sub_8020E5C: @ 0x08020E5C
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
	ldr r0, _08020EC4 @ =gUnk_08C02F10
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
_08020EC4: .4byte gUnk_08C02F10
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
	ldr r0, _08020F1C @ =gUnk_08C02F10
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
_08020F1C: .4byte gUnk_08C02F10

	thumb_func_start sub_8020F20
sub_8020F20: @ 0x08020F20
	push {lr}
	ldr r0, _08020F34 @ =gUnk_08C02F10
	bl Proc_Find
	cmp r0, #0
	beq _08020F2E
	movs r0, #1
_08020F2E:
	pop {r1}
	bx r1
	.align 2, 0
_08020F34: .4byte gUnk_08C02F10

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
	bl ClearBg0Bg1
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
	bl ClearBg0Bg1
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
	bl sub_8006884
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
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_080215DC: .4byte gUnk_08C02F90

	thumb_func_start sub_80215E0
sub_80215E0: @ 0x080215E0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _08021610 @ =gPal
	ldr r2, _08021614 @ =0x00007FFF
	adds r1, r3, #0
	adds r1, #0x42
	movs r0, #0xe
_080215EE:
	strh r2, [r1]
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bge _080215EE
	movs r4, #0
	ldr r0, _08021614 @ =0x00007FFF
	strh r0, [r3]
	bl EnablePalSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021610: .4byte gPal
_08021614: .4byte 0x00007FFF

	thumb_func_start sub_8021618
sub_8021618: @ 0x08021618
	push {r4, r5, r6, lr}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r1, _08021670 @ =gUnk_081C9422
	mov r0, sp
	movs r2, #0x50
	bl memcpy
	ldr r1, _08021674 @ =gPal
	movs r0, #0
	strh r0, [r1]
	movs r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r3, r4, #0
	adds r1, #0x5e
_08021638:
	movs r6, #0
	ldrsh r0, [r3, r6]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #2
	adds r2, #1
	cmp r2, #0xf
	ble _08021638
	bl EnablePalSync
	ldrh r0, [r4]
	adds r0, #3
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _08021668
	adds r0, r5, #0
	bl Proc_Break
_08021668:
	add sp, #0x50
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021670: .4byte gUnk_081C9422
_08021674: .4byte gPal

	thumb_func_start sub_8021678
sub_8021678: @ 0x08021678
	push {lr}
	ldr r2, _0802169C @ =gDispIo
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
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0
_0802169C: .4byte gDispIo

	thumb_func_start sub_80216A0
sub_80216A0: @ 0x080216A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08021728 @ =gUnk_081BEF28
	ldr r1, _0802172C @ =0x06005000
	bl Decompress
	ldr r0, _08021730 @ =gUnk_081BF2E0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08021734 @ =gUnk_081BF4E0
	ldr r4, _08021738 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, _0802173C @ =gBg0Tm + 0x4
	movs r2, #0x8a
	lsls r2, r2, #6
	adds r1, r4, #0
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r3, _08021740 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _08021744 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	ldr r1, _08021748 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0802174C @ =gUnk_08C02FC8
	adds r1, r5, #0
	bl Proc_StartBlocking
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021728: .4byte gUnk_081BEF28
_0802172C: .4byte 0x06005000
_08021730: .4byte gUnk_081BF2E0
_08021734: .4byte gUnk_081BF4E0
_08021738: .4byte gBuf
_0802173C: .4byte gBg0Tm + 0x4
_08021740: .4byte gDispIo
_08021744: .4byte 0x0000FFE0
_08021748: .4byte 0x0000E0FF
_0802174C: .4byte gUnk_08C02FC8

	thumb_func_start sub_8021750
sub_8021750: @ 0x08021750
	push {lr}
	ldr r0, _08021768 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08021764
	ldr r0, _0802176C @ =0x000002F9
	bl m4aSongNumStart
_08021764:
	pop {r0}
	bx r0
	.align 2, 0
_08021768: .4byte gPlaySt
_0802176C: .4byte 0x000002F9

	thumb_func_start sub_8021770
sub_8021770: @ 0x08021770
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r0, r5, #4
	ldr r2, _080217D4 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	adds r5, #8
	lsls r0, r6, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r6, r0, #4
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80149B4
	ldr r0, _080217D8 @ =gUnk_081C83E8
	ldr r1, _080217DC @ =0x06013000
	bl Decompress
	ldr r0, _080217E0 @ =gUnk_081C85F0
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080217E4 @ =gUnk_081C855C
	movs r3, #0xa3
	lsls r3, r3, #7
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8012AF0
	ldr r0, _080217E8 @ =gUnk_08C03000
	adds r1, r4, #0
	bl Proc_Start
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080217D4: .4byte gBmSt
_080217D8: .4byte gUnk_081C83E8
_080217DC: .4byte 0x06013000
_080217E0: .4byte gUnk_081C85F0
_080217E4: .4byte gUnk_081C855C
_080217E8: .4byte gUnk_08C03000

	thumb_func_start sub_80217EC
sub_80217EC: @ 0x080217EC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r2, #0
	movs r2, #0
	lsls r5, r1, #2
_080217F6:
	lsls r0, r2, #5
	adds r4, r2, #1
	movs r1, #3
	adds r0, r0, r5
	adds r0, r0, r6
	adds r3, r0, #3
	lsls r0, r2, #6
	adds r0, r0, r7
	adds r0, #6
_08021808:
	strh r3, [r0]
	subs r3, #1
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08021808
	adds r2, r4, #0
	cmp r2, #3
	ble _080217F6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021820
sub_8021820: @ 0x08021820
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x4a
	ldrh r0, [r7]
	cmp r0, #6
	bne _0802183C
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080218D8
_0802183C:
	bl ClearBg0Bg1
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, [r6, #0x2c]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080218E4 @ =gBg0Tm
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r4, #0xa2
	lsls r4, r4, #7
	adds r2, r4, #0
	bl sub_80217EC
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, [r6, #0x2c]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080218E8 @ =gBg1Tm
	adds r0, r0, r1
	ldrh r1, [r7]
	adds r1, #1
	movs r5, #0
	movs r2, #0
	mov r8, r2
	strh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	bl sub_80217EC
	ldr r3, _080218EC @ =gDispIo
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
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080218F0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080218F4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	mov r1, r8
	strh r1, [r0]
_080218D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080218E4: .4byte gBg0Tm
_080218E8: .4byte gBg1Tm
_080218EC: .4byte gDispIo
_080218F0: .4byte 0x0000FFE0
_080218F4: .4byte 0x0000E0FF

	thumb_func_start sub_80218F8
sub_80218F8: @ 0x080218F8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _08021948
	ldr r0, _08021950 @ =gDispIo
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
	ldrh r1, [r3]
	movs r0, #0x10
	subs r0, r0, r1
	adds r2, #8
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #1
	strh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x10
	ble _08021948
	adds r0, r5, #0
	bl Proc_Break
_08021948:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021950: .4byte gDispIo

	thumb_func_start sub_8021954
sub_8021954: @ 0x08021954
	push {lr}
	ldr r0, _08021968 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08021968: .4byte gBg0Tm

	thumb_func_start sub_802196C
sub_802196C: @ 0x0802196C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080219A8 @ =gUnk_081C2358
	ldr r1, _080219AC @ =0x06002000
	bl Decompress
	ldr r0, _080219B0 @ =gPal + 0x3c0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080219B4 @ =gUnk_08C03018
	adds r1, r6, #0
	bl Proc_StartBlocking
	lsls r4, r4, #1
	subs r4, #1
	str r4, [r0, #0x2c]
	lsls r5, r5, #1
	subs r5, #2
	str r5, [r0, #0x30]
	adds r0, #0x4a
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080219A8: .4byte gUnk_081C2358
_080219AC: .4byte 0x06002000
_080219B0: .4byte gPal + 0x3c0
_080219B4: .4byte gUnk_08C03018
