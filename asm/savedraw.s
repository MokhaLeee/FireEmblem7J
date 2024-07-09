	.include "macro.inc"
	.syntax unified


	thumb_func_start sub_80A5C60
sub_80A5C60: @ 0x080A5C60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080A5D00 @ =gpBonusClaimData
	ldr r1, [r4]
	ldr r2, _080A5D04 @ =0x01000142
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	cmp r0, #0
	beq _080A5CF6
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov sb, r0
	movs r7, #0x1f
_080A5C98:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	movs r4, #3
	ldrb r2, [r1]
	ands r4, r2
	cmp r4, #1
	bne _080A5CE2
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _080A5CC2
	str r4, [r5, #0x58]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x75
	bl UnlockSoundRoomSong
_080A5CC2:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	ldrb r2, [r1, #1]
	cmp r2, #4
	bne _080A5CE2
	str r4, [r5, #0x5c]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x76
	bl UnlockSoundRoomSong
_080A5CE2:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080A5C98
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080A5D08
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080A5D08
_080A5CF6:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080A5D10
	.align 2, 0
_080A5D00: .4byte gpBonusClaimData
_080A5D04: .4byte 0x01000142
_080A5D08:
	ldr r0, _080A5D20 @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
_080A5D10:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D20: .4byte 0x06013800

	thumb_func_start sub_80A5D24
sub_80A5D24: @ 0x080A5D24
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080A5D60
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A5D54 @ =0x00000731
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A5D58 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5D68
	ldr r0, _080A5D5C @ =0x0000037B
	bl m4aSongNumStart
	b _080A5D68
	.align 2, 0
_080A5D54: .4byte 0x00000731
_080A5D58: .4byte gPlaySt
_080A5D5C: .4byte 0x0000037B
_080A5D60:
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_080A5D68:
	pop {r0}
	bx r0

	thumb_func_start sub_80A5D6C
sub_80A5D6C: @ 0x080A5D6C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080A5DA8
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A5D9C @ =0x00000732
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A5DA0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5DB0
	ldr r0, _080A5DA4 @ =0x0000037B
	bl m4aSongNumStart
	b _080A5DB0
	.align 2, 0
_080A5D9C: .4byte 0x00000732
_080A5DA0: .4byte gPlaySt
_080A5DA4: .4byte 0x0000037B
_080A5DA8:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A5DB0:
	pop {r0}
	bx r0

	thumb_func_start sub_80A5DB4
sub_80A5DB4: @ 0x080A5DB4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080A5DE4
	ldr r0, _080A5DE0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A5DE8
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _080A5DE8
	.align 2, 0
_080A5DE0: .4byte gpKeySt
_080A5DE4:
	adds r0, r2, #1
	strh r0, [r1]
_080A5DE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A5DF0
sub_80A5DF0: @ 0x080A5DF0
	push {lr}
	ldr r0, _080A5E00 @ =gpBonusClaimData
	ldr r0, [r0]
	bl SaveBonusContentData
	pop {r0}
	bx r0
	.align 2, 0
_080A5E00: .4byte gpBonusClaimData

	thumb_func_start sub_80A5E04
sub_80A5E04: @ 0x080A5E04
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5E14 @ =gUnk_08DAD848
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A5E14: .4byte gUnk_08DAD848

	thumb_func_start sub_80A5E18
sub_80A5E18: @ 0x080A5E18
	lsls r2, r2, #4
	cmp r2, #0
	ble _080A5E2E
	adds r3, r0, #0
_080A5E20:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080A5E20
_080A5E2E:
	bx lr

	thumb_func_start sub_80A5E30
sub_80A5E30: @ 0x080A5E30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	movs r0, #0x3f
	ands r5, r0
	movs r1, #0x20
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080A5E50
	movs r0, #0x1f
	ands r0, r5
	subs r5, r1, r0
_080A5E50:
	movs r0, #1
	mov ip, r0
	ldr r0, _080A5EF4 @ =0x02000004
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	subs r6, r1, r5
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r0, #0x22
	mov r8, r0
	movs r4, #0x1f
	mov sl, r4
_080A5E6A:
	mov r0, ip
	subs r0, #8
	cmp r0, #2
	bls _080A5ED4
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _080A5EF8 @ =gPal
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r2, r8
	ldrh r4, [r2]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	adds r3, r0, #0
	muls r3, r6, r3
	adds r0, r4, #0
	ands r0, r2
	muls r0, r5, r0
	adds r3, r3, r0
	asrs r3, r3, #5
	ands r3, r2
	adds r0, r1, #0
	ands r0, r7
	adds r2, r0, #0
	muls r2, r6, r2
	adds r0, r4, #0
	ands r0, r7
	muls r0, r5, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r7
	mov r0, sl
	ands r1, r0
	muls r1, r6, r1
	ands r4, r0
	adds r0, r4, #0
	muls r0, r5, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	movs r4, #0x1f
	ands r1, r4
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r4, _080A5EF8 @ =gPal
	adds r0, r0, r4
	orrs r3, r2
	orrs r1, r3
	strh r1, [r0]
_080A5ED4:
	movs r0, #2
	add r8, r0
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #0xf
	ble _080A5E6A
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5EF4: .4byte 0x02000004
_080A5EF8: .4byte gPal

	thumb_func_start sub_80A5EFC
sub_80A5EFC: @ 0x080A5EFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r7, r1, #0x18
	movs r1, #0x8f
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5F48
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	b _080A5F68
_080A5F48:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
_080A5F68:
	mov r1, sb
	adds r1, #8
	adds r2, r7, #0
	subs r2, #0xe
	ldr r3, _080A60F8 @ =gUnk_08DAD90C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x10
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _080A60FC @ =gUnk_08DAD9D6
	movs r0, #0xc0
	lsls r0, r0, #7
	mov r8, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	add r0, sp, #4
	adds r6, r7, #0
	subs r6, #8
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _080A5FE6
	mov r5, sb
	adds r5, #0x12
	ldr r4, _080A6100 @ =gUnk_08DADA10
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0x64
	mov sl, r1
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	subs r4, r4, r0
	strh r4, [r5]
_080A5FE6:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080A6014
	mov r5, sb
	adds r5, #0x1a
	ldr r4, _080A6100 @ =gUnk_08DADA10
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
_080A6014:
	mov r5, sb
	adds r5, #0x22
	ldr r4, _080A6100 @ =gUnk_08DADA10
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r1, r8
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x2a
	subs r2, r7, #7
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x42
	adds r2, r7, #1
	ldr r4, _080A6104 @ =gUnk_08DAD9E4
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A60F8: .4byte gUnk_08DAD90C
_080A60FC: .4byte gUnk_08DAD9D6
_080A6100: .4byte gUnk_08DADA10
_080A6104: .4byte gUnk_08DAD9E4

	thumb_func_start SaveDraw_Init
SaveDraw_Init: @ 0x080A6108
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	movs r7, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x3b
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl StartSaveDrawCursor
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080A6178
	str r7, [r1, #0x60]
	b _080A6196
_080A6178:
	ldr r0, _080A61AC @ =gUnk_08432B28
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xb0
	lsls r3, r3, #1
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080A6196:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	strb r1, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A61AC: .4byte gUnk_08432B28

	thumb_func_start sub_80A61B0
sub_80A61B0: @ 0x080A61B0
	push {lr}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A61DC
	ldr r2, _080A61D8 @ =gPal
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080A61EA
	.align 2, 0
_080A61D8: .4byte gPal
_080A61DC:
	ldr r0, _080A61F4 @ =gPal
	ldr r2, _080A61F8 @ =0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080A61EA:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080A61F4: .4byte gPal
_080A61F8: .4byte 0x0000033A

	thumb_func_start sub_80A61FC
sub_80A61FC: @ 0x080A61FC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A626C @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A6270 @ =gUnk_08DAD8A8
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080A6274 @ =gUnk_08DADD50
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A626C: .4byte 0x000001FF
_080A6270: .4byte gUnk_08DAD8A8
_080A6274: .4byte gUnk_08DADD50

	thumb_func_start sub_80A6278
sub_80A6278: @ 0x080A6278
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A62E8 @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A62EC @ =gUnk_08DAD8A8
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080A62F0 @ =gUnk_08DADD34
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A62E8: .4byte 0x000001FF
_080A62EC: .4byte gUnk_08DAD8A8
_080A62F0: .4byte gUnk_08DADD34

	thumb_func_start sub_80A62F4
sub_80A62F4: @ 0x080A62F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x3c
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r1, [r4]
	ldrb r2, [r0]
	cmp r1, r2
	beq _080A631E
	ldrb r0, [r0]
	bl sub_80A715C
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4]
_080A631E:
	ldrh r0, [r7, #0x2a]
	ldrb r1, [r4]
	bl sub_80A71EC
	ldr r2, _080A636C @ =gPal
	ldr r3, _080A6370 @ =0x02000004
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r7, #0x14]
	adds r4, r1, #0
	adds r4, #0x3f
	ldrb r3, [r4]
	adds r0, r3, #0
	cmp r0, #0xff
	beq _080A6412
	adds r5, r1, #0
	adds r5, #0x44
	ldrh r2, [r5]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080A6412
	cmp r1, #0xf
	bhi _080A6374
	movs r0, #0xff
	strb r0, [r4]
	b _080A6408
	.align 2, 0
_080A636C: .4byte gPal
_080A6370: .4byte 0x02000004
_080A6374:
	ldr r0, _080A642C @ =gSinLut
	mov sb, r0
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r5]
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	ands r4, r0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
_080A6408:
	ldr r0, [r7, #0x14]
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #0x10
	strh r1, [r0]
_080A6412:
	ldrh r0, [r7, #0x2a]
	bl sub_80A5E30
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A642C: .4byte gSinLut

	thumb_func_start sub_80A6430
sub_80A6430: @ 0x080A6430
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	adds r1, #0x2f
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r5, r0, r1
	ldr r2, _080A6498 @ =0x000001FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _080A649C @ =gUnk_08DAD8A8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	adds r2, r5, #0
	bl PutSpriteExt
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A64A4
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_80A4054
	adds r2, r5, #0
	adds r2, #8
	ldr r0, _080A6498 @ =0x000001FF
	ands r2, r0
	ldr r0, _080A64A0 @ =gUnk_08DADD50
	ldr r3, [r0, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
	b _080A64CE
	.align 2, 0
_080A6498: .4byte 0x000001FF
_080A649C: .4byte gUnk_08DAD8A8
_080A64A0: .4byte gUnk_08DADD50
_080A64A4:
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_80A4054
	lsls r0, r0, #0x18
	adds r2, r5, #0
	adds r2, #8
	ldr r1, _080A64D8 @ =0x000001FF
	ands r2, r1
	ldr r1, _080A64DC @ =gUnk_08DADD50
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
_080A64CE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A64D8: .4byte 0x000001FF
_080A64DC: .4byte gUnk_08DADD50

	thumb_func_start SaveDraw_Loop
SaveDraw_Loop: @ 0x080A64E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080A6512
	cmp r1, #0x20
	bne _080A650C
	adds r0, #0x35
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x33
	strb r0, [r1]
	b _080A6512
_080A650C:
	mov r0, r8
	adds r0, #0x33
	strb r2, [r0]
_080A6512:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x2f
	adds r1, r2, #0
	adds r1, #0x46
	ldrh r1, [r1]
	ldrb r0, [r0]
	adds r5, r1, r0
	cmp r5, #0xdb
	bgt _080A65D2
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	movs r1, #0x44
	subs r6, r1, r0
	cmp r6, #1
	bgt _080A653E
	movs r6, #2
_080A653E:
	movs r7, #0
	cmp r7, r3
	bge _080A65AA
	adds r4, r6, #0
	movs r1, #0x38
	mov sb, r1
_080A654A:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A4054
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A6586
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_80A61FC
	b _080A659A
_080A6586:
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_80A61FC
_080A659A:
	adds r4, #0x18
	adds r7, #1
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r7, r0
	blt _080A654A
_080A65AA:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #2
	bne _080A65D2
	adds r0, #0x2b
	ldrb r1, [r0]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r6, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_80A6B4C
_080A65D2:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x46
	ldrh r1, [r1]
	subs r1, #1
	lsls r1, r1, #0x10
	movs r2, #0xdb
	lsls r2, r2, #0x11
	adds r3, r0, #0
	cmp r1, r2
	bhi _080A66B4
	adds r1, r3, #0
	adds r1, #0x33
	ldrb r0, [r1]
	cmp r0, #7
	bne _080A65FA
	movs r5, #2
	movs r6, #0x15
	b _080A660E
_080A65FA:
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	movs r1, #0x44
	subs r5, r1, r0
	cmp r5, #1
	bgt _080A660C
	movs r5, #2
_080A660C:
	movs r6, #0x18
_080A660E:
	movs r7, #0
	adds r0, r3, #0
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	bge _080A668E
	adds r4, r5, #0
_080A661E:
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A4054
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A6660
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_80A6278
	b _080A667C
_080A6660:
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_80A6278
_080A667C:
	adds r4, r4, r6
	adds r7, #1
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	blt _080A661E
_080A668E:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0xa
	bne _080A66B4
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r5, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_80A6B4C
_080A66B4:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A66C2
	b _080A683C
_080A66C2:
	mov r0, r8
	bl sub_80A5EFC
	mov r0, r8
	bl sub_80A6430
	movs r7, #0
	movs r2, #0xf
	mov sl, r2
	movs r0, #0xa
	mov sb, r0
_080A66D8:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	movs r2, #0
	ldrb r1, [r1]
	cmp r1, #6
	bne _080A66F4
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080A66F4
	movs r2, #0x80
	lsls r2, r2, #1
_080A66F4:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xe8
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r0, _080A67AC @ =0x000001FF
	ands r1, r0
	lsls r5, r7, #5
	adds r5, #0x20
	adds r5, r2, r5
	ldr r0, _080A67B0 @ =gUnk_08DADD84
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r3, [r0]
	lsls r4, r7, #1
	mov r0, sb
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xf4
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A67AC @ =0x000001FF
	ands r1, r2
	adds r5, #8
	ldr r0, _080A67B4 @ =gUnk_08DADD78
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r0, sl
	ands r4, r0
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	movs r1, #2
	add sb, r1
	adds r7, #1
	cmp r7, #2
	ble _080A66D8
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080A683C
	adds r1, r2, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	beq _080A67DC
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080A6788
	bl EndSpriteAnimProc
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080A6788:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A67BC
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A67B8 @ =gUnk_08DAD904
	movs r0, #0
	b _080A67CC
	.align 2, 0
_080A67AC: .4byte 0x000001FF
_080A67B0: .4byte gUnk_08DADD84
_080A67B4: .4byte gUnk_08DADD78
_080A67B8: .4byte gUnk_08DAD904
_080A67BC:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A67D8 @ =gUnk_08DAD904
	movs r0, #0xc0
	lsls r0, r0, #7
_080A67CC:
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl PutSpriteExt
	b _080A683C
	.align 2, 0
_080A67D8: .4byte gUnk_08DAD904
_080A67DC:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A6802
	ldr r0, [r2, #0x60]
	adds r2, #0x2f
	movs r1, #0xda
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	b _080A683C
_080A6802:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	adds r2, #0x2f
	movs r1, #0xd3
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A68AC @ =gUnk_08DAD904
	movs r0, #0xc0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080A683C:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080A68F2
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A68B4
	ldr r3, _080A68B0 @ =gUnk_08DAD8C2
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x80
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x34
	movs r1, #0x88
	bl PutUiHand
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80A6B4C
	b _080A68D2
	.align 2, 0
_080A68AC: .4byte gUnk_08DAD904
_080A68B0: .4byte gUnk_08DAD8C2
_080A68B4:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A68D2
	ldrb r1, [r1]
	lsls r2, r1, #0x1d
	movs r1, #0x80
	lsls r1, r1, #0x16
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80A6B4C
_080A68D2:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A68F2
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_80A6B6C
_080A68F2:
	mov r0, r8
	bl sub_80A62F4
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartSaveDraw
StartSaveDraw: @ 0x080A6908
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6918 @ =ProcScr_SaveDraw
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A6918: .4byte ProcScr_SaveDraw
