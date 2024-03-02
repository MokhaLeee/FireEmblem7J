	.include "macro.inc"
	.syntax unified

	thumb_func_start StartAdjustedMenu
StartAdjustedMenu: @ 0x0804AA0C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	ldr r2, [r4]
	cmp r1, #0x77
	bgt _0804AA1C
	lsls r0, r3, #0x18
	b _0804AA1E
_0804AA1C:
	lsls r0, r0, #0x18
_0804AA1E:
	lsrs r0, r0, #0x18
	ldr r1, _0804AA38 @ =0xFFFFFF00
	ands r2, r1
	orrs r2, r0
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0
	bl StartLockingMenuExt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804AA38: .4byte 0xFFFFFF00

	thumb_func_start StartLockingMenu
StartLockingMenu: @ 0x0804AA3C
	push {lr}
	adds r2, r1, #0
	ldr r1, [r0]
	bl StartLockingMenuExt
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartMenuExt
StartMenuExt: @ 0x0804AA4C
	push {lr}
	movs r2, #0
	bl StartLockingMenuExt
	pop {r1}
	bx r1

	thumb_func_start StartMenu
StartMenu: @ 0x0804AA58
	push {lr}
	ldr r1, [r0]
	movs r2, #0
	bl StartLockingMenuExt
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartLockingMenuExt
StartLockingMenuExt: @ 0x0804AA68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	mov sl, r1
	adds r4, r2, #0
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	str r0, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	adds r0, #1
	mov sb, r0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0804AAC8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AAB2
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
_0804AAB2:
	cmp r4, #0
	beq _0804AAD0
	ldr r0, _0804AACC @ =gUnk_08C09BF4
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0
	b _0804AAE4
	.align 2, 0
_0804AAC8: .4byte gPlaySt
_0804AACC: .4byte gUnk_08C09BF4
_0804AAD0:
	bl sub_8015784
	ldr r0, _0804AC00 @ =gUnk_08C09BF4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #1
_0804AAE4:
	strb r0, [r1]
	mov r1, sl
	asrs r0, r1, #0x18
	str r0, [sp, #8]
	cmp r0, #0
	bge _0804AAFC
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0804AAFC:
	movs r7, #0
	movs r3, #0
	str r3, [sp]
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0xc]
	mov r2, sl
	lsls r2, r2, #0x10
	str r2, [sp, #0x18]
	adds r3, r5, #0
	adds r3, #0x60
	str r3, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x61
	str r2, [sp, #0x10]
	adds r3, #2
	str r3, [sp, #0x14]
	cmp r0, #0
	beq _0804ABB2
	movs r6, #0
_0804AB24:
	adds r0, r1, r6
	adds r1, r7, #0
	bl sub_804B428
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0804AB46
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r6, r0
	ldr r2, [r0, #0xc]
	adds r1, r7, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804AB46:
	cmp r4, #3
	beq _0804ABA2
	ldr r0, _0804AC04 @ =gUnk_08C09C34
	adds r1, r5, #0
	bl Proc_Start
	adds r2, r0, #0
	ldr r3, [sp]
	lsls r1, r3, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
	adds r3, #1
	str r3, [sp]
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r2, #0x30]
	adds r0, r2, #0
	adds r0, #0x3c
	strb r7, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r3, sp
	ldrh r3, [r3, #4]
	strh r3, [r2, #0x2a]
	mov r0, sb
	strh r0, [r2, #0x2c]
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804AB9E
	adds r0, r2, #0
	adds r0, #0x34
	mov r2, sl
	lsls r1, r2, #8
	asrs r1, r1, #0x18
	subs r1, #2
	bl InitText
_0804AB9E:
	movs r3, #2
	add sb, r3
_0804ABA2:
	adds r6, #0x24
	adds r7, #1
	mov r0, r8
	ldr r1, [r0, #8]
	adds r0, r6, r1
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0804AB24
_0804ABB2:
	mov r1, r8
	str r1, [r5, #0x30]
	mov r2, sl
	str r2, [r5, #0x2c]
	movs r2, #0
	mov r3, sp
	ldrb r0, [r3]
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r1, [sp, #0x10]
	strb r2, [r1]
	movs r0, #0xff
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r0, [sp, #0x18]
	asrs r1, r0, #0x18
	ldr r3, [sp, #8]
	adds r0, r1, r3
	cmp r0, sb
	bge _0804ABE6
	subs r0, r1, #1
	mov r1, sb
	subs r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_0804ABE6:
	ldr r0, _0804AC08 @ =gpKeySt
	ldr r0, [r0]
	strh r2, [r0, #8]
	adds r0, r5, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804AC00: .4byte gUnk_08C09BF4
_0804AC04: .4byte gUnk_08C09C34
_0804AC08: .4byte gpKeySt

	thumb_func_start sub_804AC0C
sub_804AC0C: @ 0x0804AC0C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r5, r4, #0
	adds r5, #0x63
	movs r0, #4
	ldrb r2, [r5]
	orrs r0, r2
	strb r0, [r5]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804AC38
	adds r0, r4, #0
	bl _call_via_r2
_0804AC38:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _0804AC46
	adds r0, r4, #0
	bl _call_via_r1
_0804AC46:
	movs r0, #1
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0804AC54
	bl sub_8015794
_0804AC54:
	adds r0, r4, #0
	bl Proc_End
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r4, #0x14]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804AC78
sub_804AC78: @ 0x0804AC78
	push {lr}
	ldr r0, _0804AC88 @ =gUnk_08C09BF4
	ldr r1, _0804AC8C @ =sub_804AC0C
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_0804AC88: .4byte gUnk_08C09BF4
_0804AC8C: .4byte sub_804AC0C

	thumb_func_start sub_804AC90
sub_804AC90: @ 0x0804AC90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _0804ACA2
	adds r0, r4, #0
	bl _call_via_r1
_0804ACA2:
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804ACC0
	adds r0, r4, #0
	bl _call_via_r2
_0804ACC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804ACC8
sub_804ACC8: @ 0x0804ACC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804ADA8
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r6, #0
	adds r2, #0x2e
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x2f
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r4, [r6, #0x30]
	ldrb r4, [r4, #4]
	str r4, [sp]
	bl sub_804A4CC
	movs r7, #0
	adds r0, r6, #0
	adds r0, #0x60
	mov r8, r0
	movs r0, #0x61
	adds r0, r0, r6
	mov sb, r0
	mov r1, r8
	ldrb r1, [r1]
	cmp r7, r1
	bge _0804AD96
_0804AD2A:
	lsls r1, r7, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #0x10]
	cmp r2, #0
	beq _0804AD46
	adds r0, r6, #0
	adds r1, r4, #0
	bl _call_via_r2
	b _0804AD8C
_0804AD46:
	ldrb r0, [r1, #8]
	adds r5, r4, #0
	adds r5, #0x34
	cmp r0, #0
	beq _0804AD58
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetColor
_0804AD58:
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804AD6A
	adds r0, r5, #0
	movs r1, #1
	bl Text_SetColor
_0804AD6A:
	ldr r0, [r4, #0x30]
	ldr r1, [r0]
	adds r0, r5, #0
	bl Text_DrawString
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0804ADB8 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
_0804AD8C:
	adds r7, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AD2A
_0804AD96:
	mov r2, sb
	ldrb r1, [r2]
	adds r0, r6, #0
	movs r2, #1
	bl sub_804ADBC
	movs r0, #3
	bl EnableBgSync
_0804ADA8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ADB8: .4byte gBg0Tm

	thumb_func_start sub_804ADBC
sub_804ADBC: @ 0x0804ADBC
	push {r4, lr}
	mov ip, r0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	mov r3, ip
	adds r3, #0x63
	movs r0, #0x10
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _0804AE12
	mov r0, ip
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r0, #1
	lsls r1, r1, #2
	mov r0, ip
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, #2
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804AE0C
	cmp r0, #1
	bne _0804AE12
	adds r0, r3, #0
	bl sub_804A84C
	b _0804AE12
_0804AE0C:
	adds r0, r3, #0
	bl sub_804A8B0
_0804AE12:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_804AE18
sub_804AE18: @ 0x0804AE18
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804AE3E
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl sub_804B08C
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_804A7EC
	b _0804AF02
_0804AE3E:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804AE4E
	adds r0, r5, #0
	bl sub_804AC0C
	b _0804AF02
_0804AE4E:
	adds r0, r5, #0
	bl sub_804AF18
	adds r0, r5, #0
	bl sub_804AFFC
	adds r4, r0, #0
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0804AE6A
	adds r0, r5, #0
	bl sub_804AC0C
_0804AE6A:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0804AE84
	ldr r0, _0804AF0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AE84
	ldr r0, _0804AF10 @ =0x0000038A
	bl m4aSongNumStart
_0804AE84:
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0804AE9E
	ldr r0, _0804AF0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AE9E
	ldr r0, _0804AF14 @ =0x0000038B
	bl m4aSongNumStart
_0804AE9E:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0804AEAA
	bl ClearUi
_0804AEAA:
	movs r6, #0x20
	adds r0, r4, #0
	ands r0, r6
	cmp r0, #0
	beq _0804AEBA
	movs r0, #0
	bl EndFaceById
_0804AEBA:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0804AECE
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0x80
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0804AECE:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	bne _0804AF02
	adds r1, r5, #0
	adds r1, #0x63
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804AF02
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B08C
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B334
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayUiHand
_0804AF02:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF0C: .4byte gPlaySt
_0804AF10: .4byte 0x0000038A
_0804AF14: .4byte 0x0000038B

	thumb_func_start sub_804AF18
sub_804AF18: @ 0x0804AF18
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x61
	ldrb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x62
	strb r0, [r1]
	ldr r1, _0804AFF0 @ =gpKeySt
	ldr r3, [r1]
	ldrh r4, [r3, #6]
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0804AF50
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804AF4A
	ldrh r3, [r3, #8]
	cmp r4, r3
	bne _0804AFE8
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	strb r0, [r2]
_0804AF4A:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_0804AF50:
	ldr r1, [r1]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	ands r0, r3
	adds r4, r6, #0
	adds r4, #0x61
	cmp r0, #0
	beq _0804AF7E
	ldrb r2, [r4]
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _0804AF78
	ldrh r1, [r1, #8]
	cmp r3, r1
	bne _0804AFE8
	movs r0, #0xff
	strb r0, [r4]
_0804AF78:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0804AF7E:
	adds r0, r6, #0
	adds r0, #0x62
	adds r5, r0, #0
	ldrb r0, [r5]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0804AFB2
	ldrb r1, [r5]
	adds r0, r6, #0
	movs r2, #0
	bl sub_804ADBC
	ldrb r1, [r4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_804ADBC
	ldr r0, _0804AFF4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AFB2
	ldr r0, _0804AFF8 @ =0x00000386
	bl m4aSongNumStart
_0804AFB2:
	ldrb r0, [r4]
	ldrb r1, [r5]
	cmp r0, r1
	beq _0804AFE8
	lsls r0, r1, #2
	adds r5, r6, #0
	adds r5, #0x34
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804AFD2
	adds r0, r6, #0
	bl _call_via_r2
_0804AFD2:
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804AFE8
	adds r0, r6, #0
	bl _call_via_r2
_0804AFE8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AFF0: .4byte gpKeySt
_0804AFF4: .4byte gPlaySt
_0804AFF8: .4byte 0x00000386

	thumb_func_start sub_804AFFC
sub_804AFFC: @ 0x0804AFFC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r7, [r5, #0x30]
	ldr r2, [r7, #0x18]
	cmp r2, #0
	beq _0804B024
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0804B024:
	ldr r0, _0804B048 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B04C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_804B464
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _0804B082
	ldr r2, [r7, #0x14]
	b _0804B058
	.align 2, 0
_0804B048: .4byte gpKeySt
_0804B04C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B06A
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #0x18]
_0804B058:
	cmp r2, #0
	beq _0804B082
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0804B082
_0804B06A:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B082
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _0804B082
	adds r0, r4, #0
	bl _call_via_r1
_0804B082:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804B08C
sub_804B08C: @ 0x0804B08C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x61
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r1, r3, #0
	adds r1, #0x34
	adds r0, r1, r0
	ldr r0, [r0]
	movs r5, #0x2a
	ldrsh r0, [r0, r5]
	lsls r0, r0, #3
	str r0, [r4]
	mov r6, ip
	ldrb r6, [r6]
	lsls r0, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0x2c
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	str r0, [r2]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0804B0CC
	ldr r0, [r4]
	subs r0, #4
	str r0, [r4]
_0804B0CC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804B0D4
sub_804B0D4: @ 0x0804B0D4
	movs r0, #1
	bx lr

	thumb_func_start sub_804B0D8
sub_804B0D8: @ 0x0804B0D8
	movs r0, #2
	bx lr

	thumb_func_start sub_804B0DC
sub_804B0DC: @ 0x0804B0DC
	movs r0, #3
	bx lr

	thumb_func_start sub_804B0E0
sub_804B0E0: @ 0x0804B0E0
	movs r0, #0x1b
	bx lr

	thumb_func_start sub_804B0E4
sub_804B0E4: @ 0x0804B0E4
	push {lr}
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r3, [r1, r2]
	lsls r3, r3, #3
	ldr r1, [r1, #0x30]
	ldrh r2, [r1, #6]
	adds r1, r3, #0
	bl sub_808266C
	pop {r1}
	bx r1

	thumb_func_start sub_804B100
sub_804B100: @ 0x0804B100
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r2, [r4, #0x30]
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r4, #0
	bl _call_via_r2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804B130
sub_804B130: @ 0x0804B130
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_804AF18
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B08C
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B334
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayUiHand
	ldr r0, _0804B178 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804B180
	bl CloseHelpBox
	ldr r1, _0804B17C @ =gUnk_08C09BDC
	adds r0, r5, #0
	bl sub_8004634
	b _0804B1A6
	.align 2, 0
_0804B178: .4byte gpKeySt
_0804B17C: .4byte gUnk_08C09BDC
_0804B180:
	adds r1, r5, #0
	adds r1, #0x61
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r2, r0
	beq _0804B1A6
	ldr r2, [r5, #0x30]
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r5, #0
	bl _call_via_r2
_0804B1A6:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804B1B0
sub_804B1B0: @ 0x0804B1B0
	push {lr}
	ldr r1, _0804B1BC @ =gUnk_08C09C3C
	bl sub_8004634
	pop {r1}
	bx r1
	.align 2, 0
_0804B1BC: .4byte gUnk_08C09C3C

	thumb_func_start sub_804B1C0
sub_804B1C0: @ 0x0804B1C0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B08C
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B334
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_804A7EC
	ldr r0, _0804B208 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804B1FE
	bl CloseHelpBox
	ldr r1, _0804B20C @ =gUnk_08C09BDC
	adds r0, r5, #0
	bl sub_8004634
_0804B1FE:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B208: .4byte gpKeySt
_0804B20C: .4byte gUnk_08C09BDC

	thumb_func_start sub_804B210
sub_804B210: @ 0x0804B210
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _0804B240 @ =gUnk_08C09C54
	bl sub_8004634
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl sub_804A810
	adds r4, r0, #0
	bl sub_804A81C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_808266C
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804B240: .4byte gUnk_08C09C54

	thumb_func_start sub_804B244
sub_804B244: @ 0x0804B244
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B08C
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_804B334
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_804A7EC
	ldr r0, _0804B284 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804B27C
	ldr r1, _0804B288 @ =gUnk_08C09BDC
	adds r0, r5, #0
	bl sub_8004634
_0804B27C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B284: .4byte gpKeySt
_0804B288: .4byte gUnk_08C09BDC

	thumb_func_start sub_804B28C
sub_804B28C: @ 0x0804B28C
	push {lr}
	ldr r1, _0804B298 @ =gUnk_08C09C64
	bl sub_8004634
	pop {r1}
	bx r1
	.align 2, 0
_0804B298: .4byte gUnk_08C09C64

	thumb_func_start sub_804B29C
sub_804B29C: @ 0x0804B29C
	push {lr}
	ldr r0, _0804B2B8 @ =gUnk_08C09BF4
	bl Proc_Find
	cmp r0, #0
	beq _0804B2B2
	adds r0, #0x63
	movs r1, #0x40
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0804B2B2:
	pop {r0}
	bx r0
	.align 2, 0
_0804B2B8: .4byte gUnk_08C09BF4

	thumb_func_start sub_804B2BC
sub_804B2BC: @ 0x0804B2BC
	push {lr}
	ldr r0, _0804B2D8 @ =gUnk_08C09BF4
	bl Proc_Find
	cmp r0, #0
	beq _0804B2D4
	adds r1, r0, #0
	adds r1, #0x63
	movs r0, #0xbf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0804B2D4:
	pop {r0}
	bx r0
	.align 2, 0
_0804B2D8: .4byte gUnk_08C09BF4

	thumb_func_start sub_804B2DC
sub_804B2DC: @ 0x0804B2DC
	push {r4, r5, r6, r7, lr}
	bl StartAdjustedMenu
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #6
	bls _0804B326
	adds r2, r4, #0
	adds r2, #0x2d
	ldr r5, _0804B330 @ =gUnk_08C09C74
	ldrb r3, [r1]
	adds r0, r3, r5
	ldrb r7, [r2]
	ldrb r0, [r0]
	subs r0, r7, r0
	strb r0, [r2]
	movs r3, #0
	ldrb r0, [r1]
	cmp r3, r0
	bge _0804B326
	adds r6, r5, #0
	adds r2, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
_0804B310:
	ldm r5!, {r0}
	ldrb r7, [r2]
	adds r1, r7, r6
	ldrh r7, [r0, #0x2c]
	ldrb r1, [r1]
	subs r1, r7, r1
	strh r1, [r0, #0x2c]
	adds r3, #1
	ldrb r0, [r2]
	cmp r3, r0
	blt _0804B310
_0804B326:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B330: .4byte gUnk_08C09C74

	thumb_func_start sub_804B334
sub_804B334: @ 0x0804B334
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r6, r2, #0
	adds r0, #0x60
	ldrb r2, [r0]
	cmp r2, #9
	bls _0804B372
	lsls r0, r2, #4
	subs r0, #0x90
	adds r1, #0x61
	ldrb r1, [r1]
	muls r0, r1, r0
	movs r1, #9
	bl __divsi3
	adds r5, r0, #0
	lsls r4, r5, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	ldr r0, [r6]
	subs r0, r0, r5
	str r0, [r6]
_0804B372:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_804B378
sub_804B378: @ 0x0804B378
	ldr r1, _0804B38C @ =0x03001458
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x78
_0804B380:
	strh r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0804B380
	bx lr
	.align 2, 0
_0804B38C: .4byte 0x03001458

	thumb_func_start sub_804B390
sub_804B390: @ 0x0804B390
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	ldr r2, _0804B3B0 @ =0x03001458
	ldr r5, _0804B3B4 @ =sub_804B0DC
	adds r3, r2, #4
_0804B39C:
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _0804B3B8
	ldr r0, [r3]
	cmp r0, r5
	bne _0804B3B8
	ldrh r0, [r2]
	b _0804B3BA
	.align 2, 0
_0804B3B0: .4byte 0x03001458
_0804B3B4: .4byte sub_804B0DC
_0804B3B8:
	movs r0, #0
_0804B3BA:
	strb r0, [r1]
	adds r1, #1
	adds r2, #8
	adds r3, #8
	adds r4, #1
	cmp r4, #0xf
	ble _0804B39C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804B3D0
sub_804B3D0: @ 0x0804B3D0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0804B3D6:
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804B3E6
	movs r1, #1
	ldr r2, _0804B3F4 @ =sub_804B0DC
	bl sub_804B3F8
_0804B3E6:
	adds r4, #1
	cmp r4, #0xf
	ble _0804B3D6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B3F4: .4byte sub_804B0DC

	thumb_func_start sub_804B3F8
sub_804B3F8: @ 0x0804B3F8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0804B400 @ =0x03001458
	b _0804B406
	.align 2, 0
_0804B400: .4byte 0x03001458
_0804B404:
	adds r3, #8
_0804B406:
	movs r5, #2
	ldrsh r0, [r3, r5]
	cmp r0, #0
	beq _0804B41A
	cmp r0, r1
	bne _0804B404
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, r4
	bne _0804B404
_0804B41A:
	strh r4, [r3]
	strh r1, [r3, #2]
	str r2, [r3, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804B428
sub_804B428: @ 0x0804B428
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0804B430 @ =0x03001458
	b _0804B452
	.align 2, 0
_0804B430: .4byte 0x03001458
_0804B434:
	cmp r3, #1
	bne _0804B450
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldrb r5, [r4, #9]
	cmp r0, r5
	bne _0804B450
	ldr r2, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804B45E
_0804B450:
	adds r2, #8
_0804B452:
	ldrh r3, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804B434
	movs r0, #0
_0804B45E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_804B464
sub_804B464: @ 0x0804B464
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r2, _0804B470 @ =0x03001458
	b _0804B496
	.align 2, 0
_0804B470: .4byte 0x03001458
_0804B474:
	cmp r1, #2
	bne _0804B494
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bne _0804B494
	ldr r2, [r2, #4]
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804B4A2
_0804B494:
	adds r2, #8
_0804B496:
	ldrh r1, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804B474
	movs r0, #0xff
_0804B4A2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_804B4A8
sub_804B4A8: @ 0x0804B4A8
	adds r1, r0, #0
	adds r1, #0x61
	adds r0, #0x62
	ldrb r0, [r0]
	ldrb r1, [r1]
	eors r0, r1
	adds r1, r0, #0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
