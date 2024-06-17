	.include "macro.inc"
	.syntax unified

	thumb_func_start SpinRotation_Init
SpinRotation_Init: @ 0x080A691C
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x35
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start SpinRotation_Loop
SpinRotation_Loop: @ 0x080A6950
	push {lr}
	sub sp, #8
	ldrh r1, [r0, #0x2a]
	adds r1, #1
	strh r1, [r0, #0x2a]
	ldr r1, [r0, #0x2c]
	subs r1, #4
	str r1, [r0, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_80AACB0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	bl sub_80AAD44
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r1, #0x78
	movs r2, #0xa0
	movs r3, #0x4c
	bl sub_80AAD94
	bl SyncDispIo
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSpinRotation
StartSpinRotation: @ 0x080A69A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A69B4 @ =ProcScr_SpinRotation
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A69B4: .4byte ProcScr_SpinRotation

	thumb_func_start SaveDrawCursor_Init
SaveDrawCursor_Init: @ 0x080A69B8
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x2d
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start SaveDrawCursor_Loop
SaveDrawCursor_Loop: @ 0x080A69EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _080A6A64 @ =gUnk_084392DC
	add r0, sp, #4
	movs r2, #8
	bl memcpy
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	cmp r0, #3
	bhi _080A6A18
	adds r0, #1
	strb r0, [r2]
_080A6A18:
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0
	beq _080A6AF4
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	mov sb, r1
	mov ip, r0
	adds r4, r7, #0
	adds r4, #0x30
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r2, [r2]
	cmp r2, #3
	bhi _080A6A52
	ldrb r0, [r4]
	add r0, r8
	lsrs r0, r0, #1
	mov r8, r0
	ldrb r1, [r5]
	adds r0, r1, r3
	lsrs r3, r0, #1
_080A6A52:
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A6A68
	adds r0, r3, #0
	adds r0, #0x86
	b _080A6A6C
	.align 2, 0
_080A6A64: .4byte gUnk_084392DC
_080A6A68:
	adds r0, r3, #0
	adds r0, #0xb0
_080A6A6C:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	strb r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	strb r0, [r5]
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A6AC8
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r5, #7
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r0, _080A6AC4 @ =gUnk_08DAD8FC
	mov sb, r0
	movs r4, #0x80
	lsls r4, r4, #5
	str r4, [sp]
	movs r0, #4
	adds r1, r3, #0
	mov r3, sb
	bl PutSpriteExt
	orrs r6, r4
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #3
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r3, sb
	bl PutSpriteExt
	b _080A6AE8
	.align 2, 0
_080A6AC4: .4byte gUnk_08DAD8FC
_080A6AC8:
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r1, #7
	ands r0, r1
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r3, _080A6AF0 @ =gUnk_08DAD8FC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	bl PutSpriteExt
_080A6AE8:
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	b _080A6AFE
	.align 2, 0
_080A6AF0: .4byte gUnk_08DAD8FC
_080A6AF4:
	ldrb r2, [r2]
	cmp r2, #4
	bne _080A6B00
	movs r0, #0
	mov r1, sl
_080A6AFE:
	strb r0, [r1]
_080A6B00:
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A6B20
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r2, [r0]
	ldr r3, _080A6B48 @ =gUnk_08DAD8FC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	bl PutSpriteExt
_080A6B20:
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A6B2E
	movs r0, #0
	strb r0, [r4]
_080A6B2E:
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	movs r0, #1
	strb r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6B48: .4byte gUnk_08DAD8FC

	thumb_func_start sub_80A6B4C
sub_80A6B4C: @ 0x080A6B4C
	push {r4, lr}
	ldr r3, [r3, #0x34]
	movs r4, #0x2f
	strb r2, [r4, r3]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	adds r2, #4
	movs r1, #1
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A6B6C
sub_80A6B6C: @ 0x080A6B6C
	push {r4, lr}
	ldr r3, [r2, #0x34]
	movs r2, #0x32
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r4, ip
	strb r1, [r4]
	movs r1, #0x33
	adds r1, r1, r3
	mov ip, r1
	movs r1, #1
	mov r4, ip
	strb r1, [r4]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSaveDrawCursor
StartSaveDrawCursor: @ 0x080A6B9C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6BAC @ =ProcScr_SaveDrawCursor
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A6BAC: .4byte ProcScr_SaveDrawCursor

	thumb_func_start sub_80A6BB0
sub_80A6BB0: @ 0x080A6BB0
	push {lr}
	ldr r0, _080A6BCC @ =0x02000044
	ldr r1, _080A6BD0 @ =0x0600C020
	movs r2, #1
	movs r3, #4
	bl InitTextFont
	ldr r0, _080A6BD4 @ =gpBanimModesLeft
	movs r1, #0xa
	bl InitText
	pop {r0}
	bx r0
	.align 2, 0
_080A6BCC: .4byte 0x02000044
_080A6BD0: .4byte 0x0600C020
_080A6BD4: .4byte gpBanimModesLeft

	thumb_func_start sub_80A6BD8
sub_80A6BD8: @ 0x080A6BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080A6C20
	ldr r0, _080A6C14 @ =0x02000044
	bl SetTextFont
	ldr r4, _080A6C18 @ =gpBanimModesLeft
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r1, _080A6C1C @ =gBg1Tm + 0x44e
	adds r0, r4, #0
	bl PutText
	b _080A6C2C
	.align 2, 0
_080A6C14: .4byte 0x02000044
_080A6C18: .4byte gpBanimModesLeft
_080A6C1C: .4byte gBg1Tm + 0x44e
_080A6C20:
	ldr r0, _080A6C38 @ =gBg1Tm + 0x44e
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
_080A6C2C:
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C38: .4byte gBg1Tm + 0x44e

	thumb_func_start sub_80A6C3C
sub_80A6C3C: @ 0x080A6C3C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080A6C70 @ =gUnk_08DADAAC
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_80A4054
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r4, #0
	bl sub_80A6BD8
	cmp r4, #0
	bne _080A6C6A
	adds r0, r6, #0
	adds r0, #0x36
	strb r4, [r0]
_080A6C6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C70: .4byte gUnk_08DADAAC

	thumb_func_start sub_80A6C74
sub_80A6C74: @ 0x080A6C74
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r1, _080A6C9C @ =0x06008000
	ldr r5, _080A6CA0 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080A6CA4 @ =0x0600C000
	adds r2, r5, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C9C: .4byte 0x06008000
_080A6CA0: .4byte 0x01000200
_080A6CA4: .4byte 0x0600C000

	thumb_func_start sub_80A6CA8
sub_80A6CA8: @ 0x080A6CA8
	adds r2, r0, #0
	adds r2, #0x30
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x31
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80A6CBC
sub_80A6CBC: @ 0x080A6CBC
	adds r2, r0, #0
	adds r2, #0x32
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x33
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80A6CD0
sub_80A6CD0: @ 0x080A6CD0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x31
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	adds r6, r4, #0
	adds r6, #0x32
	strb r5, [r6]
	adds r0, #3
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080A6CFE
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A6CA8
_080A6CFE:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x37
_080A6D04:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A6D0E
	adds r5, #1
_080A6D0E:
	adds r1, #1
	cmp r1, #2
	ble _080A6D04
	cmp r5, #0
	ble _080A6D34
	adds r0, r4, #0
	movs r1, #2
	bl sub_80A6CA8
	cmp r5, #2
	bgt _080A6D2C
	adds r0, r4, #0
	movs r1, #4
	bl sub_80A6CA8
_080A6D2C:
	adds r0, r4, #0
	movs r1, #8
	bl sub_80A6CA8
_080A6D34:
	cmp r5, #2
	bgt _080A6D40
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_80A6CA8
_080A6D40:
	bl sub_809F490
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6D52
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A6CBC
_080A6D52:
	bl sub_809F4C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6D64
	adds r0, r4, #0
	movs r1, #2
	bl sub_80A6CBC
_080A6D64:
	bl sub_809F4F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6D76
	adds r0, r4, #0
	movs r1, #4
	bl sub_80A6CBC
_080A6D76:
	bl sub_809F50C
	cmp r0, #0
	beq _080A6D86
	adds r0, r4, #0
	movs r1, #8
	bl sub_80A6CBC
_080A6D86:
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_80A6CBC
	bl sub_809F5B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6DA0
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80A6CBC
_080A6DA0:
	bl sub_809F588
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6DB2
	adds r0, r4, #0
	movs r1, #0x40
	bl sub_80A6CBC
_080A6DB2:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080A6DCC
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A6DCC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A6DD4
sub_80A6DD4: @ 0x080A6DD4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	cmp r2, #0
	ble _080A6E12
	movs r5, #0
	lsls r6, r1, #0x18
_080A6DE8:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A6E0E
	cmp r4, #2
	bne _080A6DFC
	movs r4, #0
	b _080A6E02
_080A6DFC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6E02:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6DE8
	b _080A6E3A
_080A6E0E:
	adds r0, r4, #0
	b _080A6E3C
_080A6E12:
	movs r5, #0
	lsls r6, r1, #0x18
_080A6E16:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A6E0E
	cmp r4, #0
	bne _080A6E2A
	movs r4, #2
	b _080A6E30
_080A6E2A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6E30:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6E16
_080A6E3A:
	movs r0, #0xff
_080A6E3C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A6E44
sub_80A6E44: @ 0x080A6E44
	push {r4, r5, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	adds r0, #0x16
	ldrh r0, [r0]
	cmp r0, #4
	beq _080A6E7C
	cmp r0, #4
	bgt _080A6E68
	cmp r0, #1
	beq _080A6ED8
	cmp r0, #2
	beq _080A6E86
	b _080A6E88
_080A6E68:
	cmp r0, #0x10
	beq _080A6E88
	cmp r0, #0x10
	bgt _080A6E76
	cmp r0, #8
	beq _080A6E86
	b _080A6E88
_080A6E76:
	cmp r0, #0x80
	bne _080A6E88
	b _080A6E86
_080A6E7C:
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A6E88
_080A6E86:
	movs r1, #1
_080A6E88:
	lsls r0, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	ble _080A6EA4
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #2
	bne _080A6EA0
	movs r0, #0
	b _080A6EB6
_080A6EA0:
	adds r0, r3, #1
	b _080A6EB6
_080A6EA4:
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #0
	bne _080A6EB4
	movs r0, #2
	b _080A6EB6
_080A6EB4:
	subs r0, r3, #1
_080A6EB6:
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A6ED4
	ldrb r0, [r4]
	asrs r2, r2, #0x18
	bl sub_80A6DD4
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080A6ED8
_080A6ED4:
	movs r0, #1
	b _080A6EDA
_080A6ED8:
	movs r0, #0
_080A6EDA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80A6EE0
sub_80A6EE0: @ 0x080A6EE0
	adds r1, r0, #0
	adds r1, #0x42
	adds r0, #0x30
	ldrb r0, [r0]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A6EF4
	movs r0, #0
	b _080A6EF6
_080A6EF4:
	movs r0, #1
_080A6EF6:
	bx lr

	thumb_func_start sub_80A6EF8
sub_80A6EF8: @ 0x080A6EF8
	push {r4, lr}
	mov ip, r0
	mov r2, ip
	adds r2, #0x29
	adds r0, #0x2b
	ldrb r1, [r2]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r2]
	ldr r3, _080A6F68 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080A6F6C
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r1, #4
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r1, r4, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldrb r2, [r2]
	lsls r1, r2, #1
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x32
	b _080A6FA0
	.align 2, 0
_080A6F68: .4byte gDispIo
_080A6F6C:
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r1, #0x78
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #1
	movs r0, #0x50
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x33
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x78
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, #0x50
	adds r1, #4
_080A6FA0:
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r4, [r2]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _080A6FEC
	mov r0, ip
	bl Proc_Break
_080A6FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A6FF4
sub_80A6FF4: @ 0x080A6FF4
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080A7024 @ =gUnk_08DADAC8
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x2a
	movs r1, #0
	strb r4, [r2]
	adds r2, #1
	strb r5, [r2]
	adds r0, #0x29
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7024: .4byte gUnk_08DADAC8

	thumb_func_start sub_80A7028
sub_80A7028: @ 0x080A7028
	push {lr}
	ldr r0, _080A703C @ =gBg2Tm
	ldr r1, _080A7040 @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	pop {r0}
	bx r0
	.align 2, 0
_080A703C: .4byte gBg2Tm
_080A7040: .4byte 0x06007000

	thumb_func_start StartSaveBgUp
StartSaveBgUp: @ 0x080A7044
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7054 @ =ProcScr_SaveBgUp
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A7054: .4byte ProcScr_SaveBgUp
