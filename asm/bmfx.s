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
	bl EndMu
_0801D862:
	adds r0, r4, #0
	bl Proc_Break
	ldrb r5, [r5]
	cmp r5, #1
	bne _0801D87A
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
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
	bl SetMuMoveScript
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
	bl SetMuMoveScript
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
	bl UnlockGame
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
	bl LockGame
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
	bl EnsureCameraOntoPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl SetMapCursorPosition
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
	bl GetLastStatScreenUnitId
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
	bl EnsureCameraOntoPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
_0801DBAA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_801DBB0
sub_801DBB0: @ 0x0801DBB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801DBDC @ =0x02001F70
	bl GetConvoyItemCount
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
	bl MaybeStartSelectConvoyItemProc
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
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xf
	movs r3, #0xa
	bl sub_801E2A0
	bl sub_802ECE4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DD28
	bl GetConvoyItemCount
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
	bl SetTalkChoiceResult
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
	bl StartBoxDialogueSimple
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
	bl StartBoxDialogueSimple
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
	bl GetTalkChoiceResult
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
	bl GetChapterInfo
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
	bl GetChapterInfo
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
	bl PutSysArrow
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
	bl PutSysArrow
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
	bl PutSysArrow
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
	bl PutSysArrow
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
	bl PutSysArrow
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
	bl PutSysArrow
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
	bl PutSysArrow
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
	bl PutSysArrow
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
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0xc
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xc
	bl InitTextDb
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
	bl DrawUiFrame2
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
	bl Proc_EndEach
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
	bl PutSprite
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
	bl FadeBgmOut
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
	bl ClearUi
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
	bl GetFacingFromTo
	adds r0, #5
	ldr r1, _0801EFC4 @ =gWorkingMoveScr
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r1, #0
	bl sub_806C7F8
	pop {r0}
	bx r0
	.align 2, 0
_0801EFC0: .4byte gActiveUnit
_0801EFC4: .4byte gWorkingMoveScr

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
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xba
	adds r1, r4, #0
	bl PlaySeSpacial
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
	ldr r0, _0801F104 @ =Img_DragonFlameSmallFire
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
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xbf
	adds r1, r4, #0
	bl PlaySeSpacial
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F104: .4byte Img_DragonFlameSmallFire
_0801F108: .4byte 0x06014800
_0801F10C: .4byte gBmSt
_0801F110: .4byte gUnk_08193CD8

	thumb_func_start StartFireTrapAnim1
StartFireTrapAnim1: @ 0x0801F114
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801F13C @ =Pal_DragonFlameSmallFire
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
_0801F13C: .4byte Pal_DragonFlameSmallFire
_0801F140: .4byte gUnk_08C02AD0

	thumb_func_start StartFireTrapAnim2
StartFireTrapAnim2: @ 0x0801F144
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
	bl StartSpriteAnimProc
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
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xbc
	adds r1, r4, #0
	bl PlaySeSpacial
	ldr r1, [r5, #0x2c]
	adds r0, r5, #0
	movs r2, #0x1f
	bl EnsureCameraOntoPosition
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
	bl EnsureCameraOntoPosition
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
	bl PlaySeSpacial
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
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xbb
	adds r1, r4, #0
	bl PlaySeSpacial
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
	bl DrawUiFrame2
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
	bl Text_GetCursor
	adds r4, r0, #0
	adds r0, r7, #0
	bl Text_GetCursor
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
	bl DrawUiFrame2
	lsls r6, r6, #1
	ldr r5, _0801F648 @ =gBg0Tm + 0x202
	adds r4, r6, r5
	mov r0, r8
	bl GetItemIconId
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
	bl GetItemIconId
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
	bl Text_GetCursor
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
	bl DrawUiFrame2
	lsls r5, r5, #1
	ldr r4, _0801F704 @ =gBg0Tm + 0x242
	adds r6, r5, r4
	adds r0, r7, #0
	bl GetItemIconId
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
