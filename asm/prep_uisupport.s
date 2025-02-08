	.include "macro.inc"
	.syntax unified

	thumb_func_start GetSupportScreenUnitCount
GetSupportScreenUnitCount: @ 0x0809BA14
	ldr r0, _0809BA1C @ =0x02012BF8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0809BA1C: .4byte 0x02012BF8

	thumb_func_start GetNextSupportScreenUnit
GetNextSupportScreenUnit: @ 0x0809BA20
	adds r1, r0, #0
	ldr r0, _0809BA30 @ =0x02012BF8
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809BA34
	adds r0, r1, #1
	b _0809BA36
	.align 2, 0
_0809BA30: .4byte 0x02012BF8
_0809BA34:
	movs r0, #0
_0809BA36:
	bx lr

	thumb_func_start GetPreviousSupportScreenUnit
GetPreviousSupportScreenUnit: @ 0x0809BA38
	cmp r0, #0
	bne _0809BA40
	ldr r0, _0809BA44 @ =0x02012BF8
	ldr r0, [r0]
_0809BA40:
	subs r0, #1
	bx lr
	.align 2, 0
_0809BA44: .4byte 0x02012BF8

	thumb_func_start GetSupportScreenPartnerSupportLevel
GetSupportScreenPartnerSupportLevel: @ 0x0809BA48
	ldr r2, _0809BA5C @ =sSupportScreenUnits
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809BA5C: .4byte sSupportScreenUnits

	thumb_func_start sub_809BA60
sub_809BA60: @ 0x0809BA60
	ldr r2, _0809BA74 @ =sSupportScreenUnits
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809BA74: .4byte sSupportScreenUnits

	thumb_func_start sub_809BA78
sub_809BA78: @ 0x0809BA78
	ldr r2, _0809BA90 @ =sSupportScreenUnits
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_0809BA90: .4byte sSupportScreenUnits

	thumb_func_start sub_809BA94
sub_809BA94: @ 0x0809BA94
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _0809BAB4 @ =gCharacterData
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809BAB4: .4byte gCharacterData

	thumb_func_start sub_809BAB8
sub_809BAB8: @ 0x0809BAB8
	ldr r1, _0809BAC8 @ =sSupportScreenUnits
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0809BAC8: .4byte sSupportScreenUnits

	thumb_func_start GetSupportScreenClassIdAt
GetSupportScreenClassIdAt: @ 0x0809BACC
	ldr r1, _0809BADC @ =sSupportScreenUnits
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_0809BADC: .4byte sSupportScreenUnits

	thumb_func_start GetSupportClassForCharId
GetSupportClassForCharId: @ 0x0809BAE0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0809BAE6:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809BB14
	ldr r3, [r2]
	cmp r3, #0
	beq _0809BB14
	ldr r0, [r2, #0xc]
	ldr r1, _0809BB10 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BB14
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _0809BB14
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _0809BB26
	.align 2, 0
_0809BB10: .4byte 0x00010004
_0809BB14:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BAE6
	ldr r2, _0809BB2C @ =gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_0809BB26:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809BB2C: .4byte gCharacterData

	thumb_func_start sub_809BB30
sub_809BB30: @ 0x0809BB30
	adds r2, r0, #0
	ldr r1, _0809BB38 @ =gUnk_08D67934
	b _0809BB4E
	.align 2, 0
_0809BB38: .4byte gUnk_08D67934
_0809BB3C:
	ldrb r0, [r1]
	cmp r0, r2
	beq _0809BB48
	ldrb r0, [r1, #1]
	cmp r0, r2
	bne _0809BB4C
_0809BB48:
	movs r0, #1
	b _0809BB56
_0809BB4C:
	adds r1, #0x14
_0809BB4E:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809BB3C
	movs r0, #0
_0809BB56:
	bx lr

	thumb_func_start sub_809BB58
sub_809BB58: @ 0x0809BB58
	push {r4, r5, r6, lr}
	ldr r6, _0809BB60 @ =gUnk_08D67934
	b _0809BB8C
	.align 2, 0
_0809BB60: .4byte gUnk_08D67934
_0809BB64:
	ldrb r0, [r6]
	movs r1, #0
	bl sub_809F908
	ldrb r0, [r6, #1]
	movs r1, #0
	bl sub_809F908
	ldrb r4, [r6]
	ldrb r5, [r6, #1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809F5FC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809F88C
	adds r6, #0x14
_0809BB8C:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0809BB64
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809BB98
sub_809BB98: @ 0x0809BB98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _0809BD18 @ =sSupportScreenUnits
	ldr r1, [r7]
	ldr r2, _0809BD1C @ =0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _0809BD20 @ =0x02012BF8
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809BBCA
	b _0809BD30
_0809BBCA:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _0809BD24 @ =0x01000010
	bl CpuSet
	movs r4, #1
_0809BBD8:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809BC08
	ldr r2, [r0]
	cmp r2, #0
	beq _0809BC08
	ldr r0, [r0, #0xc]
	ldr r1, _0809BD28 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BC08
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_0809BC08:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BBD8
	movs r4, #1
	ldr r0, _0809BD20 @ =0x02012BF8
	mov sl, r0
_0809BC14:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _0809BD0E
	ldr r2, [r5]
	cmp r2, #0
	beq _0809BD0E
	ldr r0, [r5, #0xc]
	ldr r1, _0809BD28 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BD0E
	ldrb r0, [r2, #4]
	bl sub_809CEA8
	cmp r0, #0
	beq _0809BD0E
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0809BD18 @ =sSupportScreenUnits
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0809BD18 @ =sSupportScreenUnits
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809BD2C @ =0x08C4C184
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _0809BD06
	ldr r7, _0809BD20 @ =0x02012BF8
	ldr r0, _0809BD18 @ =sSupportScreenUnits
	mov r8, r0
_0809BC88:
	ldr r0, [r7]
	adds r1, r6, #0
	bl sub_809BA94
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl GetSupportClassForCharId
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, sb
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809BD2C @ =0x08C4C184
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _0809BC88
_0809BD06:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0809BD0E:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _0809BD16
	b _0809BC14
_0809BD16:
	b _0809BE06
	.align 2, 0
_0809BD18: .4byte sSupportScreenUnits
_0809BD1C: .4byte 0x01000600
_0809BD20: .4byte 0x02012BF8
_0809BD24: .4byte 0x01000010
_0809BD28: .4byte 0x00010004
_0809BD2C: .4byte 0x08C4C184
_0809BD30:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl ReadGlobalSaveInfo
	ldr r0, _0809BDA8 @ =0x00000569
	bl DecodeMsg
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _0809BDAC @ =gCharacterData
	mov r8, r1
_0809BD4C:
	adds r0, r6, #0
	mov r1, sl
	bl sub_809F950
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq _0809BE00
	adds r0, r6, #0
	bl sub_809CEA8
	cmp r0, #0
	beq _0809BE00
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl sub_809F770
	movs r0, #0
	mov sb, r0
	b _0809BDF0
	.align 2, 0
_0809BDA8: .4byte 0x00000569
_0809BDAC: .4byte gCharacterData
_0809BDB0:
	ldr r0, [r5]
	mov r1, sb
	bl sub_809BA94
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, sb
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl sub_809F950
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, sb
	strb r0, [r1]
	movs r1, #1
	add sb, r1
_0809BDF0:
	adds r0, r6, #0
	bl sub_809CEA8
	cmp sb, r0
	blt _0809BDB0
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_0809BE00:
	adds r6, r4, #0
	cmp r6, #0xff
	ble _0809BD4C
_0809BE06:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809BE18
sub_809BE18: @ 0x0809BE18
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809BE4C
	movs r4, #1
_0809BE28:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809BE44
	ldr r0, [r1]
	cmp r0, #0
	beq _0809BE44
	adds r0, r1, #0
	bl GetUnitSMSId
	bl UseUnitSprite
_0809BE44:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BE28
	b _0809BE74
_0809BE4C:
	movs r4, #0
	ldr r0, _0809BE80 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	bge _0809BE74
	movs r5, #0
_0809BE58:
	ldr r0, _0809BE84 @ =sSupportScreenUnits
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r5, #0x18
	adds r4, #1
	ldr r0, _0809BE80 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	blt _0809BE58
_0809BE74:
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE80: .4byte 0x02012BF8
_0809BE84: .4byte sSupportScreenUnits

	thumb_func_start sub_809BE88
sub_809BE88: @ 0x0809BE88
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _0809BE94 @ =0x08C4C184
	b _0809BEA4
	.align 2, 0
_0809BE94: .4byte 0x08C4C184
_0809BE98:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	adds r6, r6, r0
	adds r4, #1
_0809BEA4:
	adds r0, r5, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _0809BE98
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809BEC4
sub_809BEC4: @ 0x0809BEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BEE0
	adds r0, r6, #0
	bl sub_809BE88
	cmp r0, #5
	beq _0809BF22
	b _0809BF28
_0809BEE0:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl sub_809BE88
	mov sb, r0
	adds r0, r6, #0
	bl sub_809BAB8
	bl sub_809CEA8
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _0809BF1E
_0809BEFE:
	adds r0, r6, #0
	bl sub_809BAB8
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_809BA94
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_809F5FC
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _0809BEFE
_0809BF1E:
	cmp r8, sb
	bne _0809BF26
_0809BF22:
	movs r0, #2
	b _0809BF32
_0809BF26:
	mov r0, sb
_0809BF28:
	cmp r0, #0
	beq _0809BF30
	movs r0, #1
	b _0809BF32
_0809BF30:
	movs r0, #0
_0809BF32:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809BF40
sub_809BF40: @ 0x0809BF40
	push {r4, r5, lr}
	ldr r4, _0809BFA8 @ =0x02012A90
	bl sub_809F6CC
	adds r5, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r2, #0
	cmp r5, #0x64
	bne _0809BF5A
	movs r2, #4
_0809BF5A:
	ldr r3, _0809BFAC @ =gUnk_0842D1FC
	adds r0, r4, #0
	movs r1, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x30
	bl Text_SetCursor
	movs r1, #2
	cmp r5, #0x64
	bne _0809BF74
	movs r1, #4
_0809BF74:
	adds r0, r4, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	cmp r5, #0x64
	bne _0809BF8A
	movs r2, #4
_0809BF8A:
	ldr r3, _0809BFB0 @ =gUnk_0842D204
	adds r0, r4, #0
	movs r1, #0x38
	bl Text_InsertDrawString
	ldr r1, _0809BFB4 @ =gBg0Tm + 0x4a8
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BFA8: .4byte 0x02012A90
_0809BFAC: .4byte gUnk_0842D1FC
_0809BFB0: .4byte gUnk_0842D204
_0809BFB4: .4byte gBg0Tm + 0x4a8

	thumb_func_start sub_809BFB8
sub_809BFB8: @ 0x0809BFB8
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	thumb_func_start sub_809BFCC
sub_809BFCC: @ 0x0809BFCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl GetSupportScreenUnitCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0809C026
_0809BFE2:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x4c
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x4c
	cmp r0, #0x30
	bhi _0809C020
	adds r0, r6, #0
	bl GetSupportScreenClassIdAt
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl sub_8026628
_0809C020:
	adds r6, #1
	cmp r6, r7
	blt _0809BFE2
_0809C026:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C038
sub_809C038: @ 0x0809C038
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0809C0C0
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809C05A
	adds r0, #0xf
_0809C05A:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x4c
	bgt _0809C074
	cmp r1, #0
	bne _0809C06E
	str r1, [r4, #0x34]
	b _0809C074
_0809C06E:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809C074:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809C086
	adds r0, #0xf
_0809C086:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x7b
	ble _0809C0C0
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _0809C0B2
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	b _0809C0BC
_0809C0B2:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #2
_0809C0BC:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809C0C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C0C8
sub_809C0C8: @ 0x0809C0C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0809C2F8 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
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
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r2, r0
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	bl ApplyIconPalettes
	adds r0, r7, #0
	bl sub_809C038
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0809C2FC @ =0x0000FFD8
	ldr r2, [r7, #0x34]
	subs r2, #0x4c
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	bl PrepRestartMuralBackground
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	adds r0, r7, #0
	bl sub_809BE18
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809C300 @ =gBg1Tm
	ldr r1, _0809C304 @ =gUnk_0842BF0C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	bl GetSupportScreenUnitCount
	cmp r0, #0
	beq _0809C1EE
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r4, [r7, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809C1DA
	adds r1, #0xf
_0809C1DA:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl ShowSysHandCursor
_0809C1EE:
	ldr r1, _0809C2F8 @ =gDispIo
	mov ip, r1
	movs r6, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	mov r8, r5
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x4c
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x8c
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	add r2, ip
	mov sl, r2
	ldrb r5, [r2]
	orrs r0, r5
	movs r2, #2
	orrs r0, r2
	subs r2, #7
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r5, sb
	strb r1, [r5]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	mov r5, r8
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0809C308 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r6, r7, #0
	adds r6, #0x42
	movs r5, #0x43
	adds r5, r5, r7
	mov r8, r5
	ldr r5, _0809C30C @ =0x020129A8
	movs r4, #0xe
_0809C2A0:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C2A0
	ldr r4, _0809C310 @ =0x02012A90
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #9
	bl InitText
	bl sub_809BF40
	movs r3, #0xa
	rsbs r3, r3, #0
	ldr r0, _0809C314 @ =0x00000901
	str r0, [sp]
	movs r0, #0
	movs r1, #0x41
	movs r2, #0x38
	bl StartBmFace
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809C318 @ =Img_SysBlackBox
	ldr r1, _0809C31C @ =0x06017800
	bl Decompress
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0809C324
	ldr r0, _0809C320 @ =0x00000F4B
	b _0809C326
	.align 2, 0
_0809C2F8: .4byte gDispIo
_0809C2FC: .4byte 0x0000FFD8
_0809C300: .4byte gBg1Tm
_0809C304: .4byte gUnk_0842BF0C
_0809C308: .4byte 0x0000FFE0
_0809C30C: .4byte 0x020129A8
_0809C310: .4byte 0x02012A90
_0809C314: .4byte 0x00000901
_0809C318: .4byte Img_SysBlackBox
_0809C31C: .4byte 0x06017800
_0809C320: .4byte 0x00000F4B
_0809C324:
	ldr r0, _0809C378 @ =0x00000FB5
_0809C326:
	str r0, [r7, #0x30]
	ldr r0, _0809C37C @ =sub_809BFCC
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xd8
	movs r1, #0x54
	bl PutMenuScrollBarAt
	ldrh r4, [r7, #0x34]
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	bl TryHideMenuScrollBar
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809C374
	adds r1, #0xf
_0809C374:
	asrs r4, r1, #4
	b _0809C38A
	.align 2, 0
_0809C378: .4byte 0x00000FB5
_0809C37C: .4byte sub_809BFCC
_0809C380:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_809C838
	adds r4, #1
_0809C38A:
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bge _0809C392
	adds r0, #0xf
_0809C392:
	asrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809C380
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0809C3E4 @ =0x06014800
	movs r1, #0xa
	bl LoadHelpBoxGfx
	ldr r2, _0809C3E8 @ =gDispIo
	movs r0, #1
	ldrb r5, [r2, #1]
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x10
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3E4: .4byte 0x06014800
_0809C3E8: .4byte gDispIo

	thumb_func_start sub_809C3EC
sub_809C3EC: @ 0x0809C3EC
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809C410
sub_809C410: @ 0x0809C410
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809C440 @ =0x06013000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl StartCgText
	ldr r0, _0809C444 @ =0x000008FC
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809C440: .4byte 0x06013000
_0809C444: .4byte 0x000008FC

	thumb_func_start sub_809C448
sub_809C448: @ 0x0809C448
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl GetSupportScreenUnitCount
	cmp r0, #0
	bne _0809C45E
	b _0809C770
_0809C45E:
	adds r0, r6, #0
	adds r0, #0x40
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r8, r0
	cmp r4, #0
	beq _0809C46E
	b _0809C6FC
_0809C46E:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r3, _0809C4B8 @ =gpKeySt
	ldr r1, [r3]
	ldrh r5, [r1, #6]
	adds r2, r6, #0
	adds r2, #0x41
	movs r0, #4
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _0809C492
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_0809C492:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r1, #0
	beq _0809C4BC
	ldr r1, [r3]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C57C
	bl CloseHelpBox
	mov r0, sb
	strb r4, [r0]
	b _0809C798
	.align 2, 0
_0809C4B8: .4byte gpKeySt
_0809C4BC:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C51C
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809C4EC
	adds r0, #0xf
_0809C4EC:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x4c
	ldr r5, _0809C518 @ =gCharacterData
	adds r0, r7, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _0809C798
	.align 2, 0
_0809C518: .4byte gCharacterData
_0809C51C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C54C
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0809C544 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809C53A
	b _0809C798
_0809C53A:
	ldr r0, _0809C548 @ =0x0000038A
	bl m4aSongNumStart
	b _0809C798
	.align 2, 0
_0809C544: .4byte gPlaySt
_0809C548: .4byte 0x0000038A
_0809C54C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809C57C
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809C574 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809C56A
	b _0809C798
_0809C56A:
	ldr r0, _0809C578 @ =0x0000038B
	bl m4aSongNumStart
	b _0809C798
	.align 2, 0
_0809C574: .4byte gPlaySt
_0809C578: .4byte 0x0000038B
_0809C57C:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809C596
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _0809C596
	subs r0, r4, #1
	str r0, [r6, #0x38]
_0809C596:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0809C5C2
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _0809C5C2
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl GetSupportScreenUnitCount
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _0809C5C2
	bl GetSupportScreenUnitCount
	subs r0, #1
	str r0, [r6, #0x38]
_0809C5C2:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _0809C5D4
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _0809C5D4
	subs r0, #3
	str r0, [r6, #0x38]
_0809C5D4:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _0809C5EE
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl GetSupportScreenUnitCount
	cmp r4, r0
	bge _0809C5EE
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_0809C5EE:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _0809C5F6
	b _0809C6F2
_0809C5F6:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809C606
	adds r0, #0xf
_0809C606:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r7, r8
	strb r0, [r7]
	ldr r0, _0809C648 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C624
	ldr r0, _0809C64C @ =0x00000385
	bl m4aSongNumStart
_0809C624:
	cmp r4, #0xf
	bgt _0809C650
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _0809C650
	cmp r1, #0
	bge _0809C634
	adds r1, #0xf
_0809C634:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_809C838
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1]
	b _0809C69C
	.align 2, 0
_0809C648: .4byte gPlaySt
_0809C64C: .4byte 0x00000385
_0809C650:
	cmp r4, #0x2f
	ble _0809C682
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _0809C682
	cmp r1, #0
	bge _0809C670
	adds r1, #0xf
_0809C670:
	asrs r1, r1, #4
	adds r1, #4
	adds r0, r6, #0
	bl sub_809C838
	movs r0, #1
	mov r7, r8
	strb r0, [r7]
	b _0809C69C
_0809C682:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_0809C69C:
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809C6F2
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov sb, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _0809C6C6
	adds r4, #0xf
_0809C6C6:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x4c
	subs r4, r4, r0
	ldr r5, _0809C768 @ =gCharacterData
	adds r0, r7, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, sb
	adds r1, r4, #0
	bl StartHelpBox
_0809C6F2:
	mov r7, r8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0809C798
_0809C6FC:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0809C712
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_0809C712:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _0809C726
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	adds r0, r1, r0
	str r0, [r6, #0x34]
_0809C726:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0809C734
	mov r0, r8
	strb r1, [r0]
_0809C734:
	ldrh r4, [r6, #0x34]
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	ldr r1, _0809C76C @ =0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x4c
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	b _0809C798
	.align 2, 0
_0809C768: .4byte gCharacterData
_0809C76C: .4byte 0x0000FFD8
_0809C770:
	ldr r0, _0809C7A8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C798
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809C7AC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C798
	ldr r0, _0809C7B0 @ =0x0000038B
	bl m4aSongNumStart
_0809C798:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C7A8: .4byte gpKeySt
_0809C7AC: .4byte gPlaySt
_0809C7B0: .4byte 0x0000038B

	thumb_func_start sub_809C7B4
sub_809C7B4: @ 0x0809C7B4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl StartSupportUnitSubScreen
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C7CC
sub_809C7CC: @ 0x0809C7CC
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809C7EE
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	b _0809C800
_0809C7EE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
_0809C800:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSupportScreenFromPrepScreen
StartSupportScreenFromPrepScreen: @ 0x0809C808
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809C81C @ =ProcScr_SupportScreen
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809C81C: .4byte ProcScr_SupportScreen

	thumb_func_start StartSupportScreen
StartSupportScreen: @ 0x0809C820
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809C834 @ =ProcScr_SupportScreen
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809C834: .4byte ProcScr_SupportScreen

	thumb_func_start sub_809C838
sub_809C838: @ 0x0809C838
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809C8AC @ =0x020129A8
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_0809C86C:
	adds r0, r5, #0
	bl ClearText
	bl GetSupportScreenUnitCount
	cmp r6, r0
	bge _0809C902
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_809BEC4
	cmp r0, #1
	beq _0809C8BA
	cmp r0, #1
	bgt _0809C8B0
	cmp r0, #0
	beq _0809C8B6
	b _0809C8C4
	.align 2, 0
_0809C8AC: .4byte 0x020129A8
_0809C8B0:
	cmp r0, #2
	beq _0809C8C0
	b _0809C8C4
_0809C8B6:
	movs r0, #1
	b _0809C8C2
_0809C8BA:
	movs r1, #0
	mov sb, r1
	b _0809C8C4
_0809C8C0:
	movs r0, #4
_0809C8C2:
	mov sb, r0
_0809C8C4:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, sb
	bl Text_SetColor
	adds r0, r6, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _0809C924 @ =gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809C928 @ =gBg2Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
_0809C902:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _0809C86C
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C924: .4byte gCharacterData
_0809C928: .4byte gBg2Tm

	thumb_func_start sub_809C92C
sub_809C92C: @ 0x0809C92C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809C944 @ =ProcScr_SupportScreen
	bl Proc_Find
	cmp r0, #0
	beq _0809C93C
	str r4, [r0, #0x3c]
_0809C93C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C944: .4byte ProcScr_SupportScreen

	thumb_func_start UiSupport_GetSupportTalkSong
UiSupport_GetSupportTalkSong: @ 0x0809C948
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl sub_809BAB8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_809BA94
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl sub_807931C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_809C980
sub_809C980: @ 0x0809C980
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r2, [r0, #0x34]
	subs r1, r2, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x7e
	subs r1, r1, r0
	movs r0, #0x54
	mov sb, r0
	movs r6, #0
	cmp r6, r2
	bge _0809C9DC
	ldr r7, _0809C9EC @ =gUnk_08D8DE48
	adds r5, r1, #2
	adds r4, r1, #0
_0809C9AE:
	ldr r0, _0809C9F0 @ =0x0000EF80
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	ldr r0, _0809C9F4 @ =0x0000FF80
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0xf
	adds r4, #0xf
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x34]
	cmp r6, r0
	blt _0809C9AE
_0809C9DC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C9EC: .4byte gUnk_08D8DE48
_0809C9F0: .4byte 0x0000EF80
_0809C9F4: .4byte 0x0000FF80

	thumb_func_start sub_809C9F8
sub_809C9F8: @ 0x0809C9F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _0809CAE8 @ =0x020129A8
	ldr r0, _0809CAEC @ =gUnk_08190268
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	bl sub_802EBB0
	adds r1, r4, #0
	adds r4, #8
	ldr r7, _0809CAF0 @ =gBg2Tm + 0x120
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	subs r0, r7, #4
	ldr r3, _0809CAF4 @ =Unk_081C8FCC
	ldr r5, _0809CAF8 @ =gPlaySt
	movs r1, #0x2b
	adds r1, r1, r5
	mov r8, r1
	ldrb r2, [r1]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	lsrs r2, r2, #4
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	bl sub_80A7AA8
	bl DecodeMsg
	adds r2, r4, #0
	adds r4, #8
	adds r1, r7, #0
	adds r1, #0xf2
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	mov r3, r8
	ldrb r3, [r3]
	lsrs r0, r3, #4
	bl sub_80A7AB8
	bl DecodeMsg
	adds r2, r4, #0
	adds r4, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r7, r3
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	adds r5, #0x2c
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r7, r2
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	movs r0, #0
	bl SetTextFont
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CAE8: .4byte 0x020129A8
_0809CAEC: .4byte gUnk_08190268
_0809CAF0: .4byte gBg2Tm + 0x120
_0809CAF4: .4byte Unk_081C8FCC
_0809CAF8: .4byte gPlaySt

	thumb_func_start sub_809CAFC
sub_809CAFC: @ 0x0809CAFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809CB20 @ =gPlaySt
	ldrh r0, [r0, #0x2c]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _0809CB14
	movs r0, #0xa
_0809CB14:
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CB20: .4byte gPlaySt

	thumb_func_start sub_809CB24
sub_809CB24: @ 0x0809CB24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r7, _0809CD20 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
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
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	movs r2, #3
	ldrb r0, [r7, #0x10]
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	ldrb r6, [r7, #0x18]
	orrs r2, r6
	strb r2, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
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
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _0809CD24 @ =gUnk_084364A0
	ldr r1, _0809CD28 @ =0x06000400
	bl Decompress
	ldr r0, _0809CD2C @ =gUnk_08436480
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD30 @ =gBg1Tm
	ldr r1, _0809CD34 @ =gUnk_08438D90
	ldr r2, _0809CD38 @ =0x0000F020
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
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
	movs r2, #0x34
	adds r2, r2, r7
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	ldrb r2, [r6, r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	mov r3, sb
	strb r1, [r3]
	orrs r0, r2
	strb r0, [r6, r7]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r4, _0809CD3C @ =0x02012990
	ldr r1, _0809CD40 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r3, #0
	bl InitTextFont
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x18
	movs r5, #0xb
_0809CC80:
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809CC80
	ldr r0, _0809CD44 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r0, #0
	bl SetTextFont
	bl sub_809C9F8
	movs r3, #0x81
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	bl sub_8008DA8
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809CD48 @ =gUnk_0842B374
	ldr r1, _0809CD4C @ =0x06017000
	bl Decompress
	str r4, [sp, #8]
	ldr r1, _0809CD50 @ =gPal + 0x3c0
	ldr r2, _0809CD54 @ =0x01000008
	add r0, sp, #8
	bl CpuFastSet
	ldr r0, _0809CD58 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD5C @ =sub_809C980
	mov r1, r8
	bl StartParallelWorker
	ldr r0, _0809CD60 @ =gUnk_08439190
	ldr r1, _0809CD64 @ =0x06017800
	bl Decompress
	ldr r0, _0809CD68 @ =gUnk_0843927C
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD6C @ =gUnk_0843929C
	ldr r3, _0809CD70 @ =0x0000DBC0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x86
	movs r2, #0x6c
	bl StartSpriteAnimProc
	ldr r0, _0809CD74 @ =0x00000FB3
	mov r1, r8
	str r0, [r1, #0x30]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD20: .4byte gDispIo
_0809CD24: .4byte gUnk_084364A0
_0809CD28: .4byte 0x06000400
_0809CD2C: .4byte gUnk_08436480
_0809CD30: .4byte gBg1Tm
_0809CD34: .4byte gUnk_08438D90
_0809CD38: .4byte 0x0000F020
_0809CD3C: .4byte 0x02012990
_0809CD40: .4byte 0x06004000
_0809CD44: .4byte 0x02012A90
_0809CD48: .4byte gUnk_0842B374
_0809CD4C: .4byte 0x06017000
_0809CD50: .4byte gPal + 0x3c0
_0809CD54: .4byte 0x01000008
_0809CD58: .4byte gUnk_0842B4BC
_0809CD5C: .4byte sub_809C980
_0809CD60: .4byte gUnk_08439190
_0809CD64: .4byte 0x06017800
_0809CD68: .4byte gUnk_0843927C
_0809CD6C: .4byte gUnk_0843929C
_0809CD70: .4byte 0x0000DBC0
_0809CD74: .4byte 0x00000FB3

	thumb_func_start sub_809CD78
sub_809CD78: @ 0x0809CD78
	push {r4, lr}
	adds r4, r0, #0
	bl EndEachSpriteAnimProc
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809CDA0
sub_809CDA0: @ 0x0809CDA0
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809CDCC @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	movs r0, #0x4e
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809CDCC: .4byte 0x06011000

	thumb_func_start sub_809CDD0
sub_809CDD0: @ 0x0809CDD0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80893F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CDE6
	adds r0, r4, #0
	bl Proc_Break
	b _0809CE0C
_0809CDE6:
	ldr r0, _0809CE14 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809CE0C
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _0809CE18 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CE0C
	ldr r0, _0809CE1C @ =0x0000038B
	bl m4aSongNumStart
_0809CE0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE14: .4byte gpKeySt
_0809CE18: .4byte gPlaySt
_0809CE1C: .4byte 0x0000038B

	thumb_func_start sub_809CE20
sub_809CE20: @ 0x0809CE20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _0809CE94 @ =gBg1Tm
	mov sl, r1
	ldr r6, _0809CE98 @ =gBg2Tm
	mov sb, r6
	ldr r7, _0809CE9C @ =0x02012BFC
	ldr r1, _0809CEA0 @ =gBg0Tm
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_0809CE44:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _0809CEA4 @ =0x02013BFC
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_0809CE54:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0809CE54
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _0809CE44
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE94: .4byte gBg1Tm
_0809CE98: .4byte gBg2Tm
_0809CE9C: .4byte 0x02012BFC
_0809CEA0: .4byte gBg0Tm
_0809CEA4: .4byte 0x02013BFC

	thumb_func_start sub_809CEA8
sub_809CEA8: @ 0x0809CEA8
	ldr r2, _0809CEC0 @ =gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _0809CEC4
	ldrb r0, [r0, #0x15]
	b _0809CEC6
	.align 2, 0
_0809CEC0: .4byte gCharacterData
_0809CEC4:
	movs r0, #0
_0809CEC6:
	bx lr

	thumb_func_start sub_809CEC8
sub_809CEC8: @ 0x0809CEC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r5, _0809CFB8 @ =0x000001FF
	ands r1, r5
	ldr r3, _0809CFBC @ =gUnk_08D8DEB0
	movs r4, #0xe0
	lsls r4, r4, #2
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa8
	ands r1, r5
	ldr r3, _0809CFC0 @ =gUnk_08D8DEB8
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc8
	ands r1, r5
	ldr r3, _0809CFC4 @ =gUnk_08D8DEC6
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r5
	ldr r3, _0809CFC8 @ =gUnk_08D8DED4
	ldr r4, _0809CFCC @ =0x0000E280
	str r4, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa0
	ands r1, r5
	ldr r3, _0809CFD0 @ =gUnk_08D8DEE2
	str r4, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r5
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809CF92
	adds r5, r2, #0
_0809CF4C:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809CF60
	movs r3, #0xd0
	lsls r3, r3, #8
_0809CF60:
	cmp r0, #2
	bne _0809CF68
	movs r3, #0xf0
	lsls r3, r3, #8
_0809CF68:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4e
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8026628
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809CF4C
_0809CF92:
	ldr r1, [r6, #0x30]
	adds r1, #8
	ldr r0, _0809CFB8 @ =0x000001FF
	ands r1, r0
	ldr r3, _0809CFD4 @ =gUnk_08D8D51C
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CFB8: .4byte 0x000001FF
_0809CFBC: .4byte gUnk_08D8DEB0
_0809CFC0: .4byte gUnk_08D8DEB8
_0809CFC4: .4byte gUnk_08D8DEC6
_0809CFC8: .4byte gUnk_08D8DED4
_0809CFCC: .4byte 0x0000E280
_0809CFD0: .4byte gUnk_08D8DEE2
_0809CFD4: .4byte gUnk_08D8D51C

	thumb_func_start sub_809CFD8
sub_809CFD8: @ 0x0809CFD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _0809D06C @ =gUnk_0842D208
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sb
	adds r0, #0x40
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D074
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D012:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809D012
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D034:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _0809D034
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D056:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809D056
	b _0809D1B4
	.align 2, 0
_0809D06C: .4byte gUnk_0842D208
_0809D070: .4byte gBg2Tm
_0809D074:
	movs r7, #0
	mov r2, sb
	ldr r0, [r2, #0x2c]
	bl sub_809BAB8
	str r0, [sp, #0x14]
	mov r3, sb
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl sub_809BA94
	str r0, [sp, #0x18]
	ldrb r4, [r4]
	cmp r4, #2
	bne _0809D094
	movs r7, #1
_0809D094:
	mov r4, sb
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl sub_809BA94
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _0809D124 @ =gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _0809D128 @ =gBg2Tm + 0x20
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, sb
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl sub_809BA94
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _0809D124 @ =gCharacterData
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_809F5FC
	cmp r0, #2
	bne _0809D170
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov sb, r4
	lsls r4, r0, #1
_0809D116:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _0809D12C
	movs r7, #4
	b _0809D134
	.align 2, 0
_0809D124: .4byte gCharacterData
_0809D128: .4byte gBg2Tm + 0x20
_0809D12C:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809D134
	movs r7, #0
_0809D134:
	ldr r3, _0809D16C @ =gBg2Tm
	adds r0, r4, r3
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _0809D116
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809D1B4
	.align 2, 0
_0809D16C: .4byte gBg2Tm
_0809D170:
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_0809D184:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _0809D190
	movs r7, #4
	b _0809D198
_0809D190:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809D198
	movs r7, #0
_0809D198:
	ldr r0, _0809D1C4 @ =gBg2Tm
	adds r0, r4, r0
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r2}
	adds r1, r7, #0
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809D184
_0809D1B4:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1C4: .4byte gBg2Tm

	thumb_func_start sub_809D1C8
sub_809D1C8: @ 0x0809D1C8
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r0, #0
	ldr r1, _0809D288 @ =0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _0809D28C @ =Pal_Text
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add r5, sp, #0x18
	adds r0, r5, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r4, _0809D290 @ =gCharacterData
	ldr r0, [r6, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D29C
	movs r2, #0
	adds r4, r6, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D248
	movs r2, #1
_0809D248:
	ldr r3, _0809D294 @ =gUnk_0842D214
	adds r0, r5, #0
	movs r1, #0x30
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	bl Text_SetCursor
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0
	bne _0809D264
	movs r1, #1
_0809D264:
	adds r0, r5, #0
	bl Text_SetColor
	ldrb r1, [r4]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D27C
	movs r2, #1
_0809D27C:
	ldr r3, _0809D298 @ =gUnk_0842D220
	adds r0, r5, #0
	movs r1, #0x68
	bl Text_InsertDrawString
	b _0809D2E8
	.align 2, 0
_0809D288: .4byte 0x06015000
_0809D28C: .4byte Pal_Text
_0809D290: .4byte gCharacterData
_0809D294: .4byte gUnk_0842D214
_0809D298: .4byte gUnk_0842D220
_0809D29C:
	movs r2, #0
	adds r4, r6, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D2AA
	movs r2, #1
_0809D2AA:
	ldr r3, _0809D328 @ =gUnk_0842D214
	adds r0, r5, #0
	movs r1, #0x30
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	bl Text_SetCursor
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0
	bne _0809D2C6
	movs r1, #1
_0809D2C6:
	adds r0, r5, #0
	bl Text_SetColor
	ldrb r1, [r4]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D2DE
	movs r2, #1
_0809D2DE:
	ldr r3, _0809D32C @ =gUnk_0842D220
	adds r0, r5, #0
	movs r1, #0x68
	bl Text_InsertDrawString
_0809D2E8:
	ldr r3, _0809D330 @ =gUnk_0842D224
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r3, _0809D334 @ =gUnk_0842D238
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _0809D338 @ =gUnk_0842D254
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D328: .4byte gUnk_0842D214
_0809D32C: .4byte gUnk_0842D220
_0809D330: .4byte gUnk_0842D224
_0809D334: .4byte gUnk_0842D238
_0809D338: .4byte gUnk_0842D254

	thumb_func_start InitSupportSubScreenPartners
InitSupportSubScreenPartners: @ 0x0809D33C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D3C8
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809D412
	movs r1, #0x40
	adds r1, r1, r6
	mov sl, r1
_0809D368:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA94
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov sb, r4
	adds r4, r1, #0
_0809D382:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809D3B6
	ldr r0, [r1]
	cmp r0, #0
	beq _0809D3B6
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _0809D3B6
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809D3B6
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809D3B2
	movs r0, #2
	b _0809D3B4
_0809D3B2:
	movs r0, #1
_0809D3B4:
	strb r0, [r4]
_0809D3B6:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809D382
	mov r4, sb
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809D368
	b _0809D412
_0809D3C8:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _0809D412
	adds r7, r1, #0
_0809D3DE:
	adds r0, r6, #0
	adds r0, #0x40
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D408
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	ldrb r1, [r7]
	adds r0, r1, r0
	strb r0, [r7]
_0809D408:
	adds r4, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r4, r2
	blt _0809D3DE
_0809D412:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809D420
sub_809D420: @ 0x0809D420
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _0809D448
	adds r7, r5, #0
	adds r7, #0x47
	adds r6, r0, #0
_0809D434:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809D434
_0809D448:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D450
sub_809D450: @ 0x0809D450
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0809D476
	ldr r0, [r4, #0x2c]
	bl sub_809BE88
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _0809D4C4
_0809D476:
	ldr r0, [r4, #0x2c]
	bl sub_809BAB8
	mov sb, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _0809D4B4
	mov r6, r8
_0809D496:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl sub_809BA94
	adds r1, r0, #0
	mov r0, sb
	bl sub_809F5FC
	ldrb r1, [r6]
	adds r0, r1, r0
	strb r0, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _0809D496
_0809D4B4:
	ldr r0, [r4, #0x2c]
	bl sub_809BE88
	mov r1, r8
	ldrb r1, [r1]
	subs r0, r1, r0
	mov r2, r8
	strb r0, [r2]
_0809D4C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809D4D0
sub_809D4D0: @ 0x0809D4D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b _0809D4F8
_0809D4DC:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_809BA60
	adds r1, r5, #0
	adds r1, #0x4e
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r4, #1
_0809D4F8:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809D4DC
	bl ForceSyncUnitSpriteSheet
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _0809D51A
_0809D510:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809CFD8
	adds r4, #1
_0809D51A:
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809D510
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D528
sub_809D528: @ 0x0809D528
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_0809D530:
	cmp r5, #0
	blt _0809D59C
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _0809D59C
	adds r1, r7, #0
	adds r1, #0x40
	adds r1, r1, r5
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809D598
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r0, #0
	ble _0809D598
	adds r6, r7, #0
	adds r6, #0x39
	movs r1, #0xe3
	ldrb r0, [r6]
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r4, r0
	blt _0809D59C
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	movs r1, #0xfc
	ldrb r2, [r6]
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _0809D59C
_0809D598:
	adds r5, r5, r4
	b _0809D530
_0809D59C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D5A4
sub_809D5A4: @ 0x0809D5A4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_809BAB8
	bl sub_809CEA8
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl InitSupportSubScreenPartners
	adds r0, r4, #0
	bl sub_809D420
	adds r0, r4, #0
	bl sub_809D450
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_809D528
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809D5F0
sub_809D5F0: @ 0x0809D5F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0809D644 @ =gPal + 0x380
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
_0809D60E:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _0809D60E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D644: .4byte gPal + 0x380

	thumb_func_start sub_809D648
sub_809D648: @ 0x0809D648
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0809D7CC @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
	bl sub_809D5F0
	movs r0, #0xd
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl StartGreenText
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809D714
	ldr r2, _0809D7D0 @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #1
	bl ConfigSysHandCursorShadowEnabled
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809D714
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
_0809D714:
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
	ldr r3, _0809D7CC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r6, #0
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0809D7D4 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _0809D7D8 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	bl PrepRestartMuralBackground
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809D7DC @ =gBg1Tm
	ldr r1, _0809D7E0 @ =gUnk_0842C3C0
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r4, _0809D7E4 @ =gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D7E8
	adds r0, r5, #0
	adds r0, #0x3f
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809D800
	.align 2, 0
_0809D7CC: .4byte gDispIo
_0809D7D0: .4byte gPlaySt
_0809D7D4: .4byte 0x0000FFE0
_0809D7D8: .4byte 0x0000E0FF
_0809D7DC: .4byte gBg1Tm
_0809D7E0: .4byte gUnk_0842C3C0
_0809D7E4: .4byte gCharacterData
_0809D7E8:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809D800:
	ldr r0, _0809D838 @ =gUnk_0842C874
	ldr r1, _0809D83C @ =0x06017000
	bl Decompress
	ldr r0, _0809D840 @ =gUnk_08429658
	ldr r1, _0809D844 @ =0x06017800
	bl Decompress
	ldr r0, _0809D848 @ =gUnk_0842971C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl sub_809D4D0
	adds r0, r5, #0
	bl sub_809D1C8
	ldr r0, _0809D84C @ =sub_809CEC8
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D838: .4byte gUnk_0842C874
_0809D83C: .4byte 0x06017000
_0809D840: .4byte gUnk_08429658
_0809D844: .4byte 0x06017800
_0809D848: .4byte gUnk_0842971C
_0809D84C: .4byte sub_809CEC8

	thumb_func_start sub_809D850
sub_809D850: @ 0x0809D850
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _0809D884 @ =gpKeySt
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809D890
	ldr r0, _0809D888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D878
	ldr r0, _0809D88C @ =0x0000038B
	bl m4aSongNumStart
_0809D878:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0809DA00
	.align 2, 0
_0809D884: .4byte gpKeySt
_0809D888: .4byte gPlaySt
_0809D88C: .4byte 0x0000038B
_0809D890:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0809D8A6
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0809DA00
_0809D8A6:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809D8BA
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0809DA00
_0809D8BA:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D8CA
	b _0809DA00
_0809D8CA:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D8D6
	b _0809D9E4
_0809D8D6:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _0809D90C
	ldr r0, _0809D904 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D8F8
	ldr r0, _0809D908 @ =0x0000038A
	bl m4aSongNumStart
_0809D8F8:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0809DA00
	.align 2, 0
_0809D904: .4byte gPlaySt
_0809D908: .4byte 0x0000038A
_0809D90C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0809D926
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _0809D926
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_0809D926:
	ldr r0, _0809D9D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D960
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl GetSupportScreenPartnerSupportLevel
	subs r0, #1
	cmp r4, r0
	bge _0809D960
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_0809D960:
	ldr r4, _0809D9D8 @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D982
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r6, #0
	bl sub_809D528
_0809D982:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D9A0
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_809D528
_0809D9A0:
	ldrb r1, [r5]
	cmp r7, r1
	beq _0809DA00
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _0809D9DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DA00
	ldr r0, _0809D9E0 @ =0x00000385
	bl m4aSongNumStart
	b _0809DA00
	.align 2, 0
_0809D9D8: .4byte gpKeySt
_0809D9DC: .4byte gPlaySt
_0809D9E0: .4byte 0x00000385
_0809D9E4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809DA00
	ldr r0, _0809DA0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DA00
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809DA00:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DA0C: .4byte gPlaySt

	thumb_func_start sub_809DA10
sub_809DA10: @ 0x0809DA10
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r3, _0809DAC8 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
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
	ldr r0, _0809DACC @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _0809DAD0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r2, [r5]
	lsrs r1, r2, #2
	movs r2, #7
	ands r1, r2
	bl sub_809BA94
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	ldrb r5, [r5]
	ands r2, r5
	adds r2, #1
	adds r0, r4, #0
	bl sub_80792C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DAC8: .4byte gDispIo
_0809DACC: .4byte 0x0000FFE0
_0809DAD0: .4byte 0x0000E0FF

	thumb_func_start sub_809DAD4
sub_809DAD4: @ 0x0809DAD4
	push {r4, r5, lr}
	adds r0, #0x3a
	movs r4, #0
	strb r4, [r0]
	bl HideSysHandCursor
	ldr r3, _0809DB64 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r5, [r3, #0x10]
	orrs r0, r5
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r5, [r3, #0x14]
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	strb r1, [r3, #0x18]
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
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0809DB68 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809DB6C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xb8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl sub_809CE20
	ldr r0, _0809DB70 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DB5C
	movs r0, #0xc8
	bl m4aSongNumStart
_0809DB5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DB64: .4byte gDispIo
_0809DB68: .4byte 0x0000FFE0
_0809DB6C: .4byte 0x0000E0FF
_0809DB70: .4byte gPlaySt

	thumb_func_start sub_809DB74
sub_809DB74: @ 0x0809DB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _0809DBE4 @ =gBg2Tm
	mov sl, r0
_0809DB88:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _0809DBF8
	adds r3, r4, #1
	mov sb, r3
	ldr r2, _0809DBE8 @ =0x02012BFC
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _0809DBEC @ =gBg0Tm
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _0809DBF0 @ =gBg1Tm
	mov r8, r0
	movs r4, #0x13
_0809DBB4:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _0809DBF4 @ =0x020133FC
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809DBB4
	b _0809DC20
	.align 2, 0
_0809DBE4: .4byte gBg2Tm
_0809DBE8: .4byte 0x02012BFC
_0809DBEC: .4byte gBg0Tm
_0809DBF0: .4byte gBg1Tm
_0809DBF4: .4byte 0x020133FC
_0809DBF8:
	adds r1, r4, #1
	mov sb, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _0809DC3C @ =gBg1Tm
	adds r1, r0, r4
	ldr r4, _0809DC40 @ =gBg0Tm
	adds r0, r0, r4
	movs r4, #0x13
_0809DC0E:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809DC0E
_0809DC20:
	mov r4, sb
	cmp r4, #0x1d
	ble _0809DB88
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DC3C: .4byte gBg1Tm
_0809DC40: .4byte gBg0Tm

	thumb_func_start sub_809DC44
sub_809DC44: @ 0x0809DC44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	rsbs r0, r5, #0
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DCE4 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DCE8 @ =gDispIo
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
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DCDA
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl GetNextSupportScreenUnit
	str r0, [r7, #0x2c]
_0809DCDA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DCE4: .4byte 0x000001FF
_0809DCE8: .4byte gDispIo

	thumb_func_start sub_809DCEC
sub_809DCEC: @ 0x0809DCEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	str r5, [r7, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DD90 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DD94 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DD82
	adds r0, r7, #0
	bl Proc_Break
_0809DD82:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DD90: .4byte 0x000001FF
_0809DD94: .4byte gDispIo

	thumb_func_start sub_809DD98
sub_809DD98: @ 0x0809DD98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	rsbs r5, r5, #0
	adds r0, r5, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DE38 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DE3C @ =gDispIo
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
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DE2E
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl GetPreviousSupportScreenUnit
	str r0, [r7, #0x2c]
_0809DE2E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DE38: .4byte 0x000001FF
_0809DE3C: .4byte gDispIo

	thumb_func_start sub_809DE40
sub_809DE40: @ 0x0809DE40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DEE4 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DEE8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DED8
	adds r0, r7, #0
	bl Proc_Break
_0809DED8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DEE4: .4byte 0x000001FF
_0809DEE8: .4byte gDispIo

	thumb_func_start sub_809DEEC
sub_809DEEC: @ 0x0809DEEC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl InitFaces
	bl ResetText
	bl InitIcons
	ldr r0, _0809DF9C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r4, _0809DFA0 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0809DFA4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	adds r2, r5, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	bl sub_809CEA8
	adds r1, r5, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r5, #0
	bl InitSupportSubScreenPartners
	adds r0, r5, #0
	bl sub_809D420
	adds r0, r5, #0
	bl sub_809D450
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl sub_809D528
	ldr r1, _0809DFA8 @ =gUnk_0842C3C0
	movs r2, #0xa4
	lsls r2, r2, #7
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r4, _0809DFAC @ =gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DFB0
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809DFC8
	.align 2, 0
_0809DF9C: .4byte gBg0Tm
_0809DFA0: .4byte gBg1Tm
_0809DFA4: .4byte gBg2Tm
_0809DFA8: .4byte gUnk_0842C3C0
_0809DFAC: .4byte gCharacterData
_0809DFB0:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809DFC8:
	adds r0, r5, #0
	bl sub_809D4D0
	adds r0, r5, #0
	bl sub_809D1C8
	bl sub_809CE20
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809DFE8
sub_809DFE8: @ 0x0809DFE8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0809E0B4 @ =gDispIo
	mov ip, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	mov r5, ip
	strb r0, [r5, #0xc]
	movs r2, #3
	ldrb r0, [r5, #0x10]
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r2, r1
	strb r2, [r5, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	mov r3, ip
	adds r3, #0x45
	movs r0, #0xc
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0809E0B8 @ =0x0000FFE0
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	ldr r1, _0809E0BC @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r5, ip
	strh r0, [r5, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x3d
	ldrb r5, [r0]
	ands r1, r5
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809E0AE
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809E0AE
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_0809E0AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E0B4: .4byte gDispIo
_0809E0B8: .4byte 0x0000FFE0
_0809E0BC: .4byte 0x0000E0FF

	thumb_func_start sub_809E0C0
sub_809E0C0: @ 0x0809E0C0
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_809C92C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SupportSubScreen_PrepareSupportConvo
SupportSubScreen_PrepareSupportConvo: @ 0x0809E0E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl UiSupport_GetSupportTalkSong
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809E11C
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #0x30
	movs r2, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809E12C
_0809E11C:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809E12C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809E134
sub_809E134: @ 0x0809E134
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809E152
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #0x30
	movs r1, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809E164
_0809E152:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x30
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809E164:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSupportUnitSubScreen
StartSupportUnitSubScreen: @ 0x0809E16C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0809E18C @ =gProcScr_SupportUnitSubScreen
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E18C: .4byte gProcScr_SupportUnitSubScreen
