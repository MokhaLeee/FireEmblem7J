	.include "macro.inc"
	.syntax unified

	thumb_func_start AiPhase_Begin
AiPhase_Begin: @ 0x08034DB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08034E14 @ =0x0203A8E8
	adds r3, r2, #0
	adds r3, #0x7b
	movs r1, #0
	movs r0, #1
	strb r0, [r3]
	adds r3, #3
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x78
	strb r1, [r0]
	ldr r5, _08034E18 @ =0x081D92F4
	ldr r4, _08034E1C @ =gPlaySt
	movs r3, #0
	movs r1, #7
	adds r0, #0x15
_08034DDE:
	strb r3, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _08034DDE
	adds r1, r2, #0
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	bl sub_08039BB8
	bl sub_08037610
	ldr r0, _08034E20 @ =0x08C061A8
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034E14: .4byte 0x0203A8E8
_08034E18: .4byte 0x081D92F4
_08034E1C: .4byte gPlaySt
_08034E20: .4byte 0x08C061A8

	thumb_func_start sub_08034E24
sub_08034E24: @ 0x08034E24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08034E74 @ =0x0203A8E8
	adds r2, r0, #0
	adds r2, #0x7b
	movs r1, #4
	strb r1, [r2]
	adds r2, #3
	movs r1, #0xff
	strb r1, [r2]
	adds r1, r0, #0
	ldr r5, _08034E78 @ =0x081D92F4
	ldr r4, _08034E7C @ =gPlaySt
	movs r0, #0
	movs r3, #7
	adds r2, r1, #0
	adds r2, #0x8d
_08034E46:
	strb r0, [r2]
	subs r2, #1
	subs r3, #1
	cmp r3, #0
	bge _08034E46
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	bl sub_08039BB8
	bl sub_08037610
	ldr r0, _08034E80 @ =0x08C061C0
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034E74: .4byte 0x0203A8E8
_08034E78: .4byte 0x081D92F4
_08034E7C: .4byte gPlaySt
_08034E80: .4byte 0x08C061C0

	thumb_func_start sub_08034E84
sub_08034E84: @ 0x08034E84
	ldr r0, _08034E90 @ =0x0203A8E8
	adds r0, #0x7b
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08034E90: .4byte 0x0203A8E8

	thumb_func_start sub_08034E94
sub_08034E94: @ 0x08034E94
	push {r4, lr}
	ldr r4, _08034EB4 @ =0x08C061E0
	ldr r2, _08034EB8 @ =0x0203A8E8
	adds r2, #0x78
	ldrb r1, [r2]
	adds r3, r1, #1
	strb r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	adds r1, r1, r4
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034EB4: .4byte 0x08C061E0
_08034EB8: .4byte 0x0203A8E8

	thumb_func_start sub_08034EBC
sub_08034EBC: @ 0x08034EBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	movs r5, #0
	ldr r0, _08034F48 @ =gPlaySt
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _08034F4C @ =0x081D8EEC
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08034F20
	adds r7, r1, #0
	adds r4, r2, #1
_08034EE8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08034F16
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	bne _08034F16
	ldr r0, [r2, #0xc]
	ldr r1, _08034F50 @ =0x00000427
	ands r0, r1
	cmp r0, #0
	bne _08034F16
	ldr r0, _08034F54 @ =0x0203A8E8
	adds r0, r5, r0
	strb r4, [r0]
	adds r5, #1
_08034F16:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _08034EE8
_08034F20:
	cmp r5, #0
	beq _08034F3C
	ldr r0, _08034F54 @ =0x0203A8E8
	adds r2, r5, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _08034F58 @ =0x030046C0
	ldr r0, _08034F5C @ =sub_080353B4
	str r0, [r1]
	ldr r0, _08034F60 @ =0x08C06218
	mov r1, r8
	bl Proc_StartBlocking
_08034F3C:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034F48: .4byte gPlaySt
_08034F4C: .4byte 0x081D8EEC
_08034F50: .4byte 0x00000427
_08034F54: .4byte 0x0203A8E8
_08034F58: .4byte 0x030046C0
_08034F5C: .4byte sub_080353B4
_08034F60: .4byte 0x08C06218

	thumb_func_start sub_08034F64
sub_08034F64: @ 0x08034F64
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_080350BC
	adds r4, r0, #0
	cmp r4, #0
	beq _08034F8E
	bl sub_0803515C
	ldr r0, _08034F94 @ =0x0203A8E8
	adds r2, r4, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _08034F98 @ =0x030046C0
	ldr r0, _08034F9C @ =sub_080353B4
	str r0, [r1]
	ldr r0, _08034FA0 @ =0x08C06218
	adds r1, r5, #0
	bl Proc_StartBlocking
_08034F8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034F94: .4byte 0x0203A8E8
_08034F98: .4byte 0x030046C0
_08034F9C: .4byte sub_080353B4
_08034FA0: .4byte 0x08C06218

	thumb_func_start sub_08034FA4
sub_08034FA4: @ 0x08034FA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08035022
_08034FBA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034FD6
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803500E
_08034FD6:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08035034
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803500E
	adds r0, r4, #0
	bl sub_0801778C
	cmp r0, #1
	ble _08035004
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _0803500E
_08035004:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0803500E:
	adds r6, #1
	cmp r6, #4
	bgt _08035022
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08034FBA
_08035022:
	cmp r7, #0
	beq _0803502A
	movs r0, #0x28
	b _0803503A
_0803502A:
	mov r0, r8
	cmp r0, #0
	bne _08035038
	movs r0, #0x57
	b _0803503A
_08035034:
	movs r0, #0x48
	b _0803503A
_08035038:
	movs r0, #0x14
_0803503A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08035044
sub_08035044: @ 0x08035044
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x1d
	ldrsb r1, [r5, r1]
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, r0
	adds r0, r5, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r6, r2, #0
	ldr r3, [r5]
	ldr r0, [r5, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0803507A
	adds r0, r4, #0
	subs r0, #0x95
	b _080350B6
_0803507A:
	movs r0, #1
	ldrb r7, [r5, #0xa]
	ands r0, r7
	cmp r0, #0
	bne _080350B4
	lsls r0, r2, #8
	adds r4, r4, r0
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08035096
	adds r0, r4, #0
	adds r0, #0x3c
	b _080350B6
_08035096:
	ldrb r0, [r3, #4]
	cmp r0, r6
	beq _080350A6
	movs r0, #0x80
	lsls r0, r0, #6
	ands r1, r0
	cmp r1, #0
	beq _080350AC
_080350A6:
	adds r0, r4, #0
	adds r0, #0x57
	b _080350B6
_080350AC:
	adds r0, r5, #0
	bl sub_08034FA4
	adds r4, r4, r0
_080350B4:
	adds r0, r4, #0
_080350B6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080350BC
sub_080350BC: @ 0x080350BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r5, #0
	ldr r0, _08035148 @ =gPlaySt
	ldrb r2, [r0, #0xf]
	ldr r0, _0803514C @ =0x08C061A4
	ldr r0, [r0]
	mov r8, r0
	mov r1, sp
	ldr r0, _08035150 @ =0x081D8EEC
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08035138
	adds r7, r1, #0
	adds r4, r2, #1
_080350EC:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _0803512E
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0803512E
	cmp r1, #4
	beq _0803512E
	ldr r0, [r2, #0xc]
	ldr r1, _08035154 @ =0x00000427
	ands r0, r1
	cmp r0, #0
	bne _0803512E
	ldr r0, _08035158 @ =0x0203A8E8
	adds r0, r5, r0
	strb r4, [r0]
	adds r0, r2, #0
	bl sub_08035044
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	adds r5, #1
_0803512E:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _080350EC
_08035138:
	adds r0, r5, #0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08035148: .4byte gPlaySt
_0803514C: .4byte 0x08C061A4
_08035150: .4byte 0x081D8EEC
_08035154: .4byte 0x00000427
_08035158: .4byte 0x0203A8E8

	thumb_func_start sub_0803515C
sub_0803515C: @ 0x0803515C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	cmp r0, #1
	ble _080351B2
	movs r5, #0
	subs r0, #2
	cmp r5, r0
	bgt _080351B2
	mov ip, r0
	ldr r1, _080351C0 @ =0x08C061A4
	mov sb, r1
	ldr r1, _080351C4 @ =0x0203A8E8
	mov r8, r1
_0803517A:
	adds r4, r0, #0
	adds r6, r5, #1
	cmp r0, r5
	blt _080351AA
	mov r7, sb
	mov r1, r8
	adds r3, r0, r1
_08035188:
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	bls _080351A2
	str r1, [r0]
	str r2, [r0, #4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	strb r0, [r3]
	strb r1, [r3, #1]
_080351A2:
	subs r3, #1
	subs r4, #1
	cmp r4, r5
	bge _08035188
_080351AA:
	adds r5, r6, #0
	mov r0, ip
	cmp r5, r0
	ble _0803517A
_080351B2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080351C0: .4byte 0x08C061A4
_080351C4: .4byte 0x0203A8E8

	thumb_func_start sub_080351C8
sub_080351C8: @ 0x080351C8
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080351D4
sub_080351D4: @ 0x080351D4
	push {lr}
	ldr r0, _080351EC @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080351F4
	ldr r1, _080351F0 @ =gActionSt
	movs r0, #3
	b _080351F8
	.align 2, 0
_080351EC: .4byte gActiveUnit
_080351F0: .4byte gActionSt
_080351F4:
	ldr r1, _08035204 @ =gActionSt
	movs r0, #2
_080351F8:
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_08035204: .4byte gActionSt

	thumb_func_start sub_08035208
sub_08035208: @ 0x08035208
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
_0803520C:
	ldr r4, _08035250 @ =0x0203A8E8
	adds r0, r4, #0
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r4, #0x74]
	ldrb r0, [r2]
	cmp r0, #0
	beq _080352FC
	adds r0, r4, #0
	adds r0, #0x7c
	strb r1, [r0]
	ldr r1, _08035254 @ =gActiveUnitId
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r1, r0, #0
	ldr r6, _08035258 @ =gActiveUnit
	str r1, [r6]
	ldr r5, [r1, #0xc]
	movs r0, #6
	ands r5, r0
	cmp r5, #0
	bne _08035246
	ldr r0, [r1]
	cmp r0, #0
	bne _0803525C
_08035246:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	b _0803520C
	.align 2, 0
_08035250: .4byte 0x0203A8E8
_08035254: .4byte gActiveUnitId
_08035258: .4byte gActiveUnit
_0803525C:
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	ldr r0, [r6]
	bl sub_0803C57C
	ldr r1, [r6]
	adds r1, #0x40
	movs r0, #0xf8
	ldrh r1, [r1]
	ands r0, r1
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x7d
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x7a
	strb r5, [r0]
	bl sub_08039870
	bl sub_08035308
	ldr r0, _080352D8 @ =0x030046C0
	ldr r0, [r0]
	bl _call_via_r0
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r1, _080352DC @ =0x0203A978
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080352C6
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _080352E0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r1, #3]
	cmp r0, r2
	bne _080352E0
	ldrb r0, [r1]
	cmp r0, #0
	bne _080352E0
_080352C6:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	adds r0, r7, #0
	movs r1, #0
	bl Proc_Goto
	b _08035302
	.align 2, 0
_080352D8: .4byte 0x030046C0
_080352DC: .4byte 0x0203A978
_080352E0:
	ldr r0, _080352F4 @ =0x0203A8E8
	ldr r1, [r0, #0x74]
	adds r1, #1
	str r1, [r0, #0x74]
	ldr r0, _080352F8 @ =0x08C06270
	adds r1, r7, #0
	bl Proc_StartBlocking
	b _08035302
	.align 2, 0
_080352F4: .4byte 0x0203A8E8
_080352F8: .4byte 0x08C06270
_080352FC:
	adds r0, r7, #0
	bl Proc_End
_08035302:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08035308
sub_08035308: @ 0x08035308
	ldr r1, _08035324 @ =0x0203A978
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08035324: .4byte 0x0203A978

	thumb_func_start sub_08035328
sub_08035328: @ 0x08035328
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r6, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	mov r8, r4
	ldr r4, [sp, #0x20]
	mov sb, r4
	ldr r4, _08035364 @ =0x0203A978
	ldr r5, _08035368 @ =gActiveUnitId
	ldrb r5, [r5]
	strb r5, [r4, #1]
	strb r0, [r4, #2]
	strb r1, [r4, #3]
	strb r2, [r4]
	strb r3, [r4, #6]
	strb r6, [r4, #7]
	mov r0, r8
	strb r0, [r4, #8]
	mov r0, sb
	strb r0, [r4, #9]
	movs r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035364: .4byte 0x0203A978
_08035368: .4byte gActiveUnitId

	thumb_func_start sub_0803536C
sub_0803536C: @ 0x0803536C
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080353B0 @ =0x0203A978
	cmp r0, #0xff
	beq _0803538C
	strb r0, [r1]
_0803538C:
	cmp r5, #0xff
	beq _08035392
	strb r5, [r1, #6]
_08035392:
	cmp r2, #0xff
	beq _08035398
	strb r2, [r1, #7]
_08035398:
	cmp r3, #0xff
	beq _0803539E
	strb r3, [r1, #8]
_0803539E:
	cmp r4, #0xff
	beq _080353A4
	strb r4, [r1, #9]
_080353A4:
	movs r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080353B0: .4byte 0x0203A978

	thumb_func_start sub_080353B4
sub_080353B4: @ 0x080353B4
	push {r4, r5, lr}
	ldr r2, _0803540C @ =0x08C061E8
	ldr r0, _08035410 @ =0x0203A8E8
	adds r1, r0, #0
	adds r1, #0x79
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08035404
	ldr r0, _08035414 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08035404
	adds r5, r2, #0
	adds r4, r1, #0
_080353DA:
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08035404
	ldr r0, _08035414 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080353DA
_08035404:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803540C: .4byte 0x08C061E8
_08035410: .4byte 0x0203A8E8
_08035414: .4byte 0x0203A978

	thumb_func_start sub_08035418
sub_08035418: @ 0x08035418
	push {r4, lr}
	sub sp, #8
	ldr r1, _08035464 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080354C0
	ldr r4, _08035468 @ =gActiveUnit
	ldr r0, [r4]
	bl sub_08039C10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080354A4
	bl sub_08039C90
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080354C0
	ldr r1, [r4]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _0803546C
	bl sub_08039D48
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803546C
	bl sub_0803A228
	b _080354C0
	.align 2, 0
_08035464: .4byte 0x0203A8E8
_08035468: .4byte gActiveUnit
_0803546C:
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_080399E8
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _080354C0
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_08036FD8
	ldr r0, _080354A0 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	cmp r0, #1
	bne _080354C0
	bl sub_0803A254
	b _080354C0
	.align 2, 0
_080354A0: .4byte 0x0203A978
_080354A4:
	ldr r1, [r4]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _080354C0
	bl sub_08039D48
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080354C0
	bl sub_0803A228
_080354C0:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080354C8
sub_080354C8: @ 0x080354C8
	push {lr}
	ldr r1, _080354E0 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080354DC
	bl sub_0803BECC
_080354DC:
	pop {r0}
	bx r0
	.align 2, 0
_080354E0: .4byte 0x0203A8E8

	thumb_func_start sub_080354E4
sub_080354E4: @ 0x080354E4
	push {r4, lr}
	movs r4, #0
	ldr r1, _080354FC @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08035500
	bl sub_080389A0
	b _08035516
	.align 2, 0
_080354FC: .4byte 0x0203A8E8
_08035500:
	bl sub_08037A6C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08035516
	adds r4, #1
	cmp r4, #0xff
	ble _08035500
	bl sub_08037AC0
_08035516:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0803551C
sub_0803551C: @ 0x0803551C
	push {r4, lr}
	movs r4, #0
	ldr r0, _08035554 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08035540
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_08034B70
	cmp r0, #0
	bne _08035572
_08035540:
	ldr r1, _08035558 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803555C
	bl sub_080389C0
	b _08035572
	.align 2, 0
_08035554: .4byte gActiveUnit
_08035558: .4byte 0x0203A8E8
_0803555C:
	bl sub_08037AFC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08035572
	adds r4, #1
	cmp r4, #0xff
	ble _0803555C
	bl sub_08037B50
_08035572:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08035578
sub_08035578: @ 0x08035578
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl sub_08015DE8
	ldr r0, _080355B8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080355A2
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #0x2d
	ble _080355AC
_080355A2:
	adds r0, r4, #0
	bl Proc_Break
	adds r2, r4, #0
	adds r2, #0x64
_080355AC:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080355B8: .4byte gpKeySt

	thumb_func_start sub_080355BC
sub_080355BC: @ 0x080355BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080355E0 @ =0x08C06250
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080355E0: .4byte 0x08C06250

	thumb_func_start sub_080355E4
sub_080355E4: @ 0x080355E4
	push {lr}
	ldr r0, _080355F8 @ =0x08BBFCD8
	bl Proc_Find
	cmp r0, #0
	bne _080355F4
	bl sub_08016400
_080355F4:
	pop {r0}
	bx r0
	.align 2, 0
_080355F8: .4byte 0x08BBFCD8

	thumb_func_start sub_080355FC
sub_080355FC: @ 0x080355FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	movs r0, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _08035658 @ =gPlaySt
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _0803567E
	ldrb r1, [r1, #0xf]
	cmp r1, #0x80
	bne _0803567E
	ldr r0, _0803565C @ =gActiveUnit
	ldr r1, [r0]
	movs r5, #0x11
	ldrsb r5, [r1, r5]
	ldr r0, _08035660 @ =0x0202E3E8
	ldr r2, [r0]
	lsls r0, r5, #2
	adds r0, r0, r2
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803564E
	ldr r3, _08035664 @ =0x0203A978
	ldrb r6, [r3, #3]
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrb r2, [r3, #2]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035668
_0803564E:
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_0801615C
	b _08035690
	.align 2, 0
_08035658: .4byte gPlaySt
_0803565C: .4byte gActiveUnit
_08035660: .4byte 0x0202E3E8
_08035664: .4byte 0x0203A978
_08035668:
	mov r6, ip
	strb r0, [r6]
	ldrb r0, [r3]
	cmp r0, #4
	bne _08035690
	ldrb r1, [r3, #2]
	ldrb r2, [r3, #3]
	adds r0, r4, #0
	bl sub_0801615C
	b _08035690
_0803567E:
	ldr r0, _08035698 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl sub_0801615C
_08035690:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035698: .4byte gActiveUnit

	thumb_func_start sub_0803569C
sub_0803569C: @ 0x0803569C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08035700 @ =gActiveUnit
	ldr r0, [r6]
	bl UnitBeginAction
	ldr r0, [r6]
	bl HideUnitSprite
	ldr r0, [r6]
	bl RevertMapChange
	ldr r0, _08035704 @ =gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r4, _08035708 @ =0x0203A978
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldr r7, _0803570C @ =0x02033DFC
	adds r2, r7, #0
	bl sub_0801A23C
	ldr r0, [r6]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl sub_0801A424
	ldr r1, _08035710 @ =gActionSt
	ldrb r0, [r1, #0xe]
	strb r0, [r4, #2]
	ldrb r0, [r1, #0xf]
	strb r0, [r4, #3]
	adds r5, #0x31
	ldrb r0, [r5]
	cmp r0, #0
	beq _080356FA
	ldr r0, [r6]
	bl sub_0806C2DC
	bl sub_0806C7CC
	adds r0, r7, #0
	bl sub_0806C7F8
_080356FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035700: .4byte gActiveUnit
_08035704: .4byte gBmMapMovement
_08035708: .4byte 0x0203A978
_0803570C: .4byte 0x02033DFC
_08035710: .4byte gActionSt

	thumb_func_start sub_08035714
sub_08035714: @ 0x08035714
	push {r4, r5, lr}
	ldr r0, _08035760 @ =gActionSt
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r5, _08035764 @ =gActiveUnit
	str r0, [r5]
	ldr r4, _08035768 @ =0x0203A978
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_08015F0C
	bl RenderMapForFade
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	bl MU_EndAll
	bl RefreshEntityMaps
	ldr r0, [r5]
	bl ShowUnitSprite
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035760: .4byte gActionSt
_08035764: .4byte gActiveUnit
_08035768: .4byte 0x0203A978

	thumb_func_start sub_0803576C
sub_0803576C: @ 0x0803576C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r5, _080357C4 @ =gActionSt
	ldr r0, _080357C8 @ =gActiveUnitId
	ldrb r0, [r0]
	strb r0, [r5, #0xc]
	movs r0, #2
	strb r0, [r5, #0x11]
	ldr r4, _080357CC @ =0x0203A978
	ldrb r0, [r4, #6]
	strb r0, [r5, #0xd]
	ldr r6, _080357D0 @ =gActiveUnit
	ldr r1, [r6]
	ldrb r0, [r4, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r6]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _080357AA
	ldrb r0, [r4, #8]
	ldrb r1, [r4, #9]
	bl GetTrapAt
	ldrb r1, [r0]
	strb r1, [r5, #0x13]
	ldrb r1, [r0, #1]
	strb r1, [r5, #0x14]
	ldrb r0, [r0, #3]
	strb r0, [r5, #0x15]
_080357AA:
	movs r1, #7
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080357D4
	ldr r0, [r6]
	ldrb r1, [r4, #7]
	bl EquipUnitItemSlot
	movs r0, #0
	b _080357D6
	.align 2, 0
_080357C4: .4byte gActionSt
_080357C8: .4byte gActiveUnitId
_080357CC: .4byte 0x0203A978
_080357D0: .4byte gActiveUnit
_080357D4:
	movs r0, #8
_080357D6:
	strb r0, [r5, #0x12]
	adds r0, r7, #0
	bl sub_0802F6E4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080357E4
sub_080357E4: @ 0x080357E4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _0803581C @ =0x081D8EF8
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	ldr r1, _08035820 @ =0x0203A978
	ldrb r0, [r1, #8]
	cmp r0, #5
	beq _08035812
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035812
	ldrb r2, [r1, #8]
	lsls r0, r2, #1
	adds r0, r0, r2
	add r0, sp
	bl sub_0806C7F8
_08035812:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803581C: .4byte 0x081D8EF8
_08035820: .4byte 0x0203A978

	thumb_func_start sub_08035824
sub_08035824: @ 0x08035824
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r4, _08035868 @ =0x0203A978
	ldrb r0, [r4, #6]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #7]
	lsls r1, r0, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r0, _0803586C @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r5, #0
	bl UnitAddItem
	ldrb r1, [r4, #7]
	adds r0, r6, #0
	bl UnitRemoveItem
	adds r0, r5, #0
	mov r1, r8
	bl sub_0800EE00
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035868: .4byte 0x0203A978
_0803586C: .4byte gActiveUnit

	thumb_func_start sub_08035870
sub_08035870: @ 0x08035870
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _080358AC @ =0x0203A978
	ldrb r2, [r3, #2]
	ldrb r4, [r3, #3]
	ldr r0, _080358B0 @ =gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _080358BC
	ldr r1, _080358B4 @ =gActiveUnit
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r1, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r1, #0x11]
	ldr r1, _080358B8 @ =gActionSt
	movs r0, #0x17
	strb r0, [r1, #0x11]
	ldrb r0, [r3, #7]
	strb r0, [r1, #0x12]
	adds r0, r5, #0
	bl sub_0802D4CC
	b _080358E8
	.align 2, 0
_080358AC: .4byte 0x0203A978
_080358B0: .4byte gBmMapTerrain
_080358B4: .4byte gActiveUnit
_080358B8: .4byte gActionSt
_080358BC:
	subs r1, r4, #1
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_080793E4
	ldr r0, _080358F0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080358DC
	movs r0, #0xab
	bl m4aSongNumStart
_080358DC:
	ldr r0, _080358F4 @ =0x08C062F0
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl sub_0800ACE8
_080358E8:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080358F0: .4byte gPlaySt
_080358F4: .4byte 0x08C062F0

	thumb_func_start sub_080358F8
sub_080358F8: @ 0x080358F8
	push {r4, lr}
	ldr r4, _08035924 @ =gActiveUnit
	ldr r2, [r4]
	ldr r3, _08035928 @ =0x0203A978
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	ldr r2, _0803592C @ =gActionSt
	movs r1, #3
	strb r1, [r2, #0x11]
	ldrb r1, [r3, #6]
	strb r1, [r2, #0xd]
	ldrb r1, [r3, #7]
	strb r1, [r2, #0x12]
	bl sub_0802D4CC
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08035924: .4byte gActiveUnit
_08035928: .4byte 0x0203A978
_0803592C: .4byte gActionSt

	thumb_func_start sub_08035930
sub_08035930: @ 0x08035930
	push {r4, lr}
	ldr r4, _08035958 @ =gActiveUnit
	ldr r2, [r4]
	ldr r3, _0803595C @ =0x0203A978
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	ldr r2, _08035960 @ =gActionSt
	movs r1, #0x17
	strb r1, [r2, #0x11]
	ldrb r1, [r3, #7]
	strb r1, [r2, #0x12]
	bl sub_0802D4CC
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08035958: .4byte gActiveUnit
_0803595C: .4byte 0x0203A978
_08035960: .4byte gActionSt

	thumb_func_start sub_08035964
sub_08035964: @ 0x08035964
	movs r0, #1
	bx lr

	thumb_func_start sub_08035968
sub_08035968: @ 0x08035968
	push {r4, r5, lr}
	ldr r2, _080359A4 @ =gActiveUnit
	ldr r1, [r2]
	ldr r5, _080359A8 @ =0x0203A978
	ldrb r0, [r5, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #0x11]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0803599A
	ldrb r0, [r5, #7]
	bl GetUnit
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	ldrb r0, [r5, #8]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl sub_08079210
_0803599A:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080359A4: .4byte gActiveUnit
_080359A8: .4byte 0x0203A978

	thumb_func_start sub_080359AC
sub_080359AC: @ 0x080359AC
	push {lr}
	ldr r1, _080359CC @ =gActiveUnit
	ldr r2, [r1]
	ldr r3, _080359D0 @ =0x0203A978
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	bl sub_08034C48
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080359CC: .4byte gActiveUnit
_080359D0: .4byte 0x0203A978

	thumb_func_start sub_080359D4
sub_080359D4: @ 0x080359D4
	push {lr}
	ldr r1, _080359F4 @ =gActiveUnit
	ldr r2, [r1]
	ldr r3, _080359F8 @ =0x0203A978
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	bl sub_08034C80
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080359F4: .4byte gActiveUnit
_080359F8: .4byte 0x0203A978

	thumb_func_start sub_080359FC
sub_080359FC: @ 0x080359FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _08035A28 @ =gActionSt
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	bne _08035A12
	b _08035B00
_08035A12:
	ldr r0, _08035A2C @ =0x0203A978
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0xa
	bhi _08035AEA
	lsls r0, r1, #2
	ldr r1, _08035A30 @ =_08035A34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035A28: .4byte gActionSt
_08035A2C: .4byte 0x0203A978
_08035A30: .4byte _08035A34
_08035A34: @ jump table
	.4byte _08035B00 @ case 0
	.4byte _08035A60 @ case 1
	.4byte _08035B00 @ case 2
	.4byte _08035ACC @ case 3
	.4byte _08035B00 @ case 4
	.4byte _08035AD8 @ case 5
	.4byte _08035B00 @ case 6
	.4byte _08035AD0 @ case 7
	.4byte _08035AD4 @ case 8
	.4byte _08035B00 @ case 9
	.4byte _08035B00 @ case 10
_08035A60:
	ldr r1, _08035A70 @ =0x0203A978
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _08035A74
	ldrb r6, [r1, #8]
	ldrb r5, [r1, #9]
	b _08035A82
	.align 2, 0
_08035A70: .4byte 0x0203A978
_08035A74:
	ldrb r0, [r1, #6]
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_08035A82:
	ldr r7, _08035AC4 @ =0x0203A978
	movs r1, #7
	ldrsb r1, [r7, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08035AEA
	ldr r4, _08035AC8 @ =gActiveUnit
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08035AEA
	bl MU_EndAll
	ldr r1, [r4]
	ldrb r0, [r7, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r7, #3]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl sub_08034C48
	ldr r0, [r4]
	bl sub_0806C2DC
	bl sub_0806C7CC
	b _08035AEA
	.align 2, 0
_08035AC4: .4byte 0x0203A978
_08035AC8: .4byte gActiveUnit
_08035ACC:
	ldrb r0, [r2, #6]
	b _08035ADE
_08035AD0:
	ldrb r0, [r2, #6]
	b _08035ADE
_08035AD4:
	ldrb r0, [r2, #9]
	b _08035ADE
_08035AD8:
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _08035B00
_08035ADE:
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_08035AEA:
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0801615C
	lsls r0, r6, #4
	lsls r1, r5, #4
	movs r2, #2
	mov r3, r8
	bl sub_080355BC
_08035B00:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08035B0C
sub_08035B0C: @ 0x08035B0C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08035B24 @ =gActionSt
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	bne _08035B2C
	ldr r0, _08035B28 @ =sub_08035C68
	b _08035BDE
	.align 2, 0
_08035B24: .4byte gActionSt
_08035B28: .4byte sub_08035C68
_08035B2C:
	ldr r0, _08035B40 @ =0x0203A978
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _08035BE0
	lsls r0, r0, #2
	ldr r1, _08035B44 @ =_08035B48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035B40: .4byte 0x0203A978
_08035B44: .4byte _08035B48
_08035B48: @ jump table
	.4byte _08035B74 @ case 0
	.4byte _08035B7C @ case 1
	.4byte _08035B8C @ case 2
	.4byte _08035B9C @ case 3
	.4byte _08035BAC @ case 4
	.4byte _08035BB4 @ case 5
	.4byte _08035BBC @ case 6
	.4byte _08035BC4 @ case 7
	.4byte _08035BCC @ case 8
	.4byte _08035BD4 @ case 9
	.4byte _08035BDC @ case 10
_08035B74:
	ldr r0, _08035B78 @ =sub_08035C68
	b _08035BDE
	.align 2, 0
_08035B78: .4byte sub_08035C68
_08035B7C:
	ldr r0, _08035B88 @ =sub_08035C68
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_0803576C
	b _08035BE0
	.align 2, 0
_08035B88: .4byte sub_08035C68
_08035B8C:
	adds r0, r4, #0
	bl sub_080357E4
	ldr r0, _08035B98 @ =sub_08035C6C
	b _08035BDE
	.align 2, 0
_08035B98: .4byte sub_08035C6C
_08035B9C:
	adds r0, r4, #0
	bl sub_08035824
	ldr r0, _08035BA8 @ =sub_08035C90
	b _08035BDE
	.align 2, 0
_08035BA8: .4byte sub_08035C90
_08035BAC:
	ldr r0, _08035BB0 @ =sub_08035870
	b _08035BDE
	.align 2, 0
_08035BB0: .4byte sub_08035870
_08035BB4:
	ldr r0, _08035BB8 @ =sub_080358F8
	b _08035BDE
	.align 2, 0
_08035BB8: .4byte sub_080358F8
_08035BBC:
	ldr r0, _08035BC0 @ =sub_08035930
	b _08035BDE
	.align 2, 0
_08035BC0: .4byte sub_08035930
_08035BC4:
	ldr r0, _08035BC8 @ =sub_08035964
	b _08035BDE
	.align 2, 0
_08035BC8: .4byte sub_08035964
_08035BCC:
	ldr r0, _08035BD0 @ =sub_08035968
	b _08035BDE
	.align 2, 0
_08035BD0: .4byte sub_08035968
_08035BD4:
	ldr r0, _08035BD8 @ =sub_080359AC
	b _08035BDE
	.align 2, 0
_08035BD8: .4byte sub_080359AC
_08035BDC:
	ldr r0, _08035BE8 @ =sub_080359D4
_08035BDE:
	str r0, [r4, #0x2c]
_08035BE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035BE8: .4byte sub_080359D4

	thumb_func_start sub_08035BEC
sub_08035BEC: @ 0x08035BEC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08035C10
	adds r0, r4, #0
	bl Proc_Break
_08035C10:
	ldr r3, _08035C28 @ =gActiveUnit
	ldr r1, [r3]
	ldr r2, _08035C2C @ =0x0203A978
	ldrb r0, [r2, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r3]
	ldrb r0, [r2, #3]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035C28: .4byte gActiveUnit
_08035C2C: .4byte 0x0203A978

	thumb_func_start sub_08035C30
sub_08035C30: @ 0x08035C30
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08039BB8
	bl sub_08035714
	ldr r0, _08035C60 @ =gActiveUnit
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	beq _08035C50
	ldr r0, [r1, #0xc]
	ldr r1, _08035C64 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _08035C58
_08035C50:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08035C58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035C60: .4byte gActiveUnit
_08035C64: .4byte 0x00010005

	thumb_func_start sub_08035C68
sub_08035C68: @ 0x08035C68
	movs r0, #1
	bx lr

	thumb_func_start sub_08035C6C
sub_08035C6C: @ 0x08035C6C
	push {lr}
	bl sub_0806C850
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08035C7E
	movs r0, #0
	b _08035C86
_08035C7E:
	ldr r0, _08035C8C @ =gActiveUnit
	ldr r0, [r0]
	str r1, [r0]
	movs r0, #1
_08035C86:
	pop {r1}
	bx r1
	.align 2, 0
_08035C8C: .4byte gActiveUnit

	thumb_func_start sub_08035C90
sub_08035C90: @ 0x08035C90
	push {lr}
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi _08035C9E
	movs r0, #0
	b _08035CB6
_08035C9E:
	ldr r0, _08035CBC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _08035CC0 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	movs r0, #1
_08035CB6:
	pop {r1}
	bx r1
	.align 2, 0
_08035CBC: .4byte gBg0Tm
_08035CC0: .4byte gBg1Tm

	thumb_func_start sub_08035CC4
sub_08035CC4: @ 0x08035CC4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	bl sub_08039E78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035D02
	add r0, sp, #4
	bl sub_08039EAC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035D02
	ldr r1, _08035D0C @ =0x0203A978
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	add r4, sp, #0x10
	mov r5, sp
	adds r5, #0x12
	add r6, sp, #0x14
	str r6, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_08039FB8
	ldrh r0, [r4]
	ldrh r1, [r5]
	ldrh r2, [r6]
	add r3, sp, #4
	bl sub_0803A158
_08035D02:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035D0C: .4byte 0x0203A978

	thumb_func_start sub_08035D10
sub_08035D10: @ 0x08035D10
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #5
	bhi _08035D70
	lsls r0, r0, #2
	ldr r1, _08035D24 @ =_08035D28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035D24: .4byte _08035D28
_08035D28: @ jump table
	.4byte _08035D40 @ case 0
	.4byte _08035D4A @ case 1
	.4byte _08035D52 @ case 2
	.4byte _08035D5A @ case 3
	.4byte _08035D62 @ case 4
	.4byte _08035D6A @ case 5
_08035D40:
	ldrb r3, [r3]
	cmp r3, r2
	bls _08035D70
_08035D46:
	movs r0, #1
	b _08035D72
_08035D4A:
	ldrb r3, [r3]
	cmp r3, r2
	blo _08035D70
	b _08035D46
_08035D52:
	ldrb r0, [r3]
	cmp r0, r2
	bne _08035D70
	b _08035D46
_08035D5A:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _08035D70
	b _08035D46
_08035D62:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _08035D70
	b _08035D46
_08035D6A:
	ldrb r0, [r3]
	cmp r0, r2
	bne _08035D46
_08035D70:
	movs r0, #0
_08035D72:
	bx lr

	thumb_func_start sub_08035D74
sub_08035D74: @ 0x08035D74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08035E10 @ =gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801A030
	bl sub_0801A5C8
	ldr r0, _08035E14 @ =0x0000FFFF
	strh r0, [r6]
	movs r5, #1
	ldr r0, _08035E18 @ =0x0203A96E
	mov r8, r0
_08035DA6:
	adds r0, r5, #0
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _08035DFC
	ldr r4, [r3]
	cmp r4, #0
	beq _08035DFC
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r0, _08035E1C @ =0x0202E3E4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035DFC
	ldrb r0, [r4, #4]
	cmp r0, r7
	bne _08035DFC
	ldr r1, [r3, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08035E40
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _08035DF0
	movs r0, #3
	mov r1, r8
	strb r0, [r1]
_08035DF0:
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	strh r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	strh r0, [r6, #2]
_08035DFC:
	adds r5, #1
	cmp r5, #0xbf
	ble _08035DA6
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	blt _08035E20
	movs r0, #1
	b _08035E56
	.align 2, 0
_08035E10: .4byte gActiveUnit
_08035E14: .4byte 0x0000FFFF
_08035E18: .4byte 0x0203A96E
_08035E1C: .4byte 0x0202E3E4
_08035E20:
	adds r0, r7, #0
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ldr r1, _08035E38 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _08035E4C
	ldr r0, _08035E3C @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #1
	b _08035E52
	.align 2, 0
_08035E38: .4byte 0x0001000C
_08035E3C: .4byte 0x0203A8E8
_08035E40:
	ldr r0, _08035E48 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #1
	b _08035E52
	.align 2, 0
_08035E48: .4byte 0x0203A8E8
_08035E4C:
	ldr r0, _08035E60 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #4
_08035E52:
	strb r1, [r0]
	movs r0, #0
_08035E56:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08035E60: .4byte 0x0203A8E8

	thumb_func_start sub_08035E64
sub_08035E64: @ 0x08035E64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	movs r7, #0xff
	ldr r0, _08035EF4 @ =gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801A030
	ldr r0, _08035EF8 @ =0x0000FFFF
	strh r0, [r6]
	movs r4, #1
_08035E90:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08035EE0
	ldr r0, [r2]
	cmp r0, #0
	beq _08035EE0
	ldr r0, [r2, #0xc]
	ldr r1, _08035EFC @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08035EE0
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _08035F00 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0x10
	ldrsb r3, [r2, r3]
	ldr r0, [r1]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _08035EE0
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _08035EE0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r7, r0
	blt _08035EE0
	ldrb r7, [r1]
	strh r3, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r6, #2]
_08035EE0:
	adds r4, #1
	cmp r4, #0xbf
	ble _08035E90
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _08035F04
	movs r0, #0
	b _08035F06
	.align 2, 0
_08035EF4: .4byte gActiveUnit
_08035EF8: .4byte 0x0000FFFF
_08035EFC: .4byte 0x00010025
_08035F00: .4byte 0x0202E3E4
_08035F04:
	movs r0, #1
_08035F06:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08035F10
sub_08035F10: @ 0x08035F10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, _08035F50 @ =gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801A030
	ldr r2, _08035F54 @ =0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _08035F58 @ =gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08035FE6
	.align 2, 0
_08035F50: .4byte gActiveUnit
_08035F54: .4byte 0x0000FFFF
_08035F58: .4byte gBmMapSize
_08035F5C:
	ldr r0, _08035FF8 @ =gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _08035FE2
	mov sl, r8
	ldr r0, _08035FFC @ =0x0202E3E4
	mov sb, r0
	asrs r7, r1, #0xe
_08035F78:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035FD4
	ldr r0, _08036000 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _08035FD4
	ldr r0, _08036004 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _08035FD4
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035FD4
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r1, [sp, #8]
	cmp r2, r1
	bhi _08035FD4
	ldrb r0, [r0]
	str r0, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r2, sl
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
_08035FD4:
	lsls r0, r6, #0x10
	ldr r1, _08036008 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _08035F78
_08035FE2:
	ldr r0, _08036008 @ =0xFFFF0000
	add r0, r8
_08035FE6:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08035F5C
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0803600C
	movs r0, #0
	b _0803601C
	.align 2, 0
_08035FF8: .4byte gBmMapSize
_08035FFC: .4byte 0x0202E3E4
_08036000: .4byte gBmMapUnit
_08036004: .4byte gActiveUnitId
_08036008: .4byte 0xFFFF0000
_0803600C:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_0803601C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0803602C
sub_0803602C: @ 0x0803602C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, _0803606C @ =gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803C414
	ldr r2, _08036070 @ =0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _08036074 @ =gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08036102
	.align 2, 0
_0803606C: .4byte gActiveUnit
_08036070: .4byte 0x0000FFFF
_08036074: .4byte gBmMapSize
_08036078:
	ldr r0, _08036114 @ =gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _080360FE
	mov sl, r8
	ldr r0, _08036118 @ =0x0202E3E4
	mov sb, r0
	asrs r7, r1, #0xe
_08036094:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080360F0
	ldr r0, _0803611C @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _080360F0
	ldr r0, _08036120 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _080360F0
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080360F0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r1, [sp, #8]
	cmp r2, r1
	bhi _080360F0
	ldrb r0, [r0]
	str r0, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r2, sl
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
_080360F0:
	lsls r0, r6, #0x10
	ldr r1, _08036124 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _08036094
_080360FE:
	ldr r0, _08036124 @ =0xFFFF0000
	add r0, r8
_08036102:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08036078
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _08036128
	movs r0, #0
	b _08036138
	.align 2, 0
_08036114: .4byte gBmMapSize
_08036118: .4byte 0x0202E3E4
_0803611C: .4byte gBmMapUnit
_08036120: .4byte gActiveUnitId
_08036124: .4byte 0xFFFF0000
_08036128:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_08036138:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08036148
sub_08036148: @ 0x08036148
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _0803616C @ =gActiveUnit
	ldr r0, [r0]
	bl RevertMapChange
	ldr r3, _08036170 @ =0x0000FFFF
	ldr r0, _08036174 @ =gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _080361E2
	.align 2, 0
_0803616C: .4byte gActiveUnit
_08036170: .4byte 0x0000FFFF
_08036174: .4byte gBmMapSize
_08036178:
	ldr r0, _08036218 @ =gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	lsls r7, r1, #0x10
	cmp r4, #0
	blt _080361DE
	adds r2, r7, #0
	asrs r6, r7, #0xe
_0803618E:
	ldr r0, _0803621C @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	asrs r1, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080361D0
	ldr r0, _08036220 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080361D0
	movs r0, #0x80
	lsls r0, r0, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	cmp r0, r8
	blo _080361D0
	mov r8, r0
	lsrs r3, r4, #0x10
	lsrs r1, r2, #0x10
	mov sb, r1
_080361D0:
	lsls r0, r5, #0x10
	ldr r1, _08036224 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	cmp r4, #0
	bge _0803618E
_080361DE:
	ldr r1, _08036224 @ =0xFFFF0000
	adds r0, r7, r1
_080361E2:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08036178
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08036208
	mov r0, sb
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl sub_08035328
_08036208:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036218: .4byte gBmMapSize
_0803621C: .4byte gBmMapMovement
_08036220: .4byte gBmMapUnit
_08036224: .4byte 0xFFFF0000

	thumb_func_start sub_08036228
sub_08036228: @ 0x08036228
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r3, r1, r0
	cmp r3, #0
	bge _08036242
	subs r3, r0, r1
_08036242:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	subs r0, r2, r1
	cmp r0, #0
	bge _08036252
	subs r0, r1, r2
_08036252:
	adds r5, r3, r0
	adds r0, r6, #0
	bl sub_0801778C
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r5, r1
	ble _08036272
	movs r0, #0
	b _08036274
_08036272:
	movs r0, #1
_08036274:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803627C
sub_0803627C: @ 0x0803627C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r3, #0x10
	ldrsb r3, [r4, r3]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	bge _08036296
	subs r1, r0, r3
_08036296:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _080362A8
	adds r6, r1, r3
	b _080362AC
_080362A8:
	subs r0, r0, r2
	adds r6, r1, r0
_080362AC:
	adds r0, r7, #0
	bl sub_0801778C
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	movs r2, #0x1d
	ldrsb r2, [r5, r2]
	ldr r3, [r5, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r6, r1
	ble _080362DA
	movs r0, #0
	b _080362DC
_080362DA:
	movs r0, #1
_080362DC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080362E4
sub_080362E4: @ 0x080362E4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _080362F4
_080362EA:
	cmp r2, r1
	bne _080362F2
	movs r0, #1
	b _080362FC
_080362F2:
	adds r0, #2
_080362F4:
	ldrh r2, [r0]
	cmp r2, #0
	bne _080362EA
	movs r0, #0
_080362FC:
	bx lr
	.align 2, 0

	thumb_func_start sub_08036300
sub_08036300: @ 0x08036300
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	b _08036310
_08036306:
	cmp r2, r1
	bne _0803630E
	movs r0, #1
	b _08036318
_0803630E:
	adds r0, #1
_08036310:
	ldrb r2, [r0]
	cmp r2, #0
	bne _08036306
	movs r0, #0
_08036318:
	bx lr
	.align 2, 0

	thumb_func_start sub_0803631C
sub_0803631C: @ 0x0803631C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov sb, r0
	ldr r0, _080363F8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080363EE
_0803633E:
	ldr r0, _080363F8 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _080363E8
	lsls r6, r5, #2
_08036350:
	ldr r0, _080363FC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080363E2
	ldr r0, _08036400 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_08036300
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080363E2
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080363A8
	ldr r0, _08036404 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080363A8
	ldr r0, _08036408 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080363E2
_080363A8:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080363C2
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_080369EC
	cmp r0, #0
	bne _080363E2
_080363C2:
	ldr r0, _080363FC @ =0x0202E3E4
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	ble _080363E2
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_080363E2:
	subs r4, #1
	cmp r4, #0
	bge _08036350
_080363E8:
	mov r5, sl
	cmp r5, #0
	bge _0803633E
_080363EE:
	mov r0, sb
	cmp r0, #0xff
	bne _0803640C
	movs r0, #0
	b _0803640E
	.align 2, 0
_080363F8: .4byte gBmMapSize
_080363FC: .4byte 0x0202E3E4
_08036400: .4byte gBmMapTerrain
_08036404: .4byte gBmMapUnit
_08036408: .4byte gActiveUnit
_0803640C:
	movs r0, #1
_0803640E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08036420
sub_08036420: @ 0x08036420
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _08036458 @ =0x0202E3E4
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08036454
	ldr r0, _0803645C @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _08036464
	ldr r0, _08036460 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq _08036464
_08036454:
	movs r0, #0xff
	b _08036470
	.align 2, 0
_08036458: .4byte 0x0202E3E4
_0803645C: .4byte gBmMapUnit
_08036460: .4byte gActiveUnitId
_08036464:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_08036470:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08036478
sub_08036478: @ 0x08036478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	mov sl, r1
	mov sb, r2
	movs r0, #0xff
	str r0, [sp, #8]
	ldr r0, _08036594 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _08036588
	mov r8, sp
_0803649C:
	ldr r0, _08036594 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r6, #1
	str r3, [sp, #0xc]
	cmp r5, #0
	blt _08036582
	lsls r7, r6, #2
	str r7, [sp, #0x10]
_080364B0:
	ldr r0, _08036598 @ =0x0202E3E4
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803657C
	ldr r0, _0803659C @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	bl sub_08036300
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803657C
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0803650C
	ldr r0, _080365A0 @ =gBmMapUnit
	ldr r0, [r0]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803650C
	ldr r0, _080365A4 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803657C
_0803650C:
	movs r0, #2
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _08036526
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_080369EC
	cmp r0, #0
	bne _0803657C
_08036526:
	mov r4, sp
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _080365A8 @ =sub_08036420
	mov r3, sp
	bl sub_08036CE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803657C
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _08036598 @ =0x0202E3E4
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r3, r8
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _0803657C
	ldrh r0, [r3]
	mov r3, sb
	strh r0, [r3]
	ldrh r0, [r4, #2]
	strh r0, [r3, #2]
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
_0803657C:
	subs r5, #1
	cmp r5, #0
	bge _080364B0
_08036582:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	bge _0803649C
_08036588:
	ldr r7, [sp, #8]
	cmp r7, #0xff
	bne _080365AC
	movs r0, #0
	b _080365AE
	.align 2, 0
_08036594: .4byte gBmMapSize
_08036598: .4byte 0x0202E3E4
_0803659C: .4byte gBmMapTerrain
_080365A0: .4byte gBmMapUnit
_080365A4: .4byte gActiveUnit
_080365A8: .4byte sub_08036420
_080365AC:
	movs r0, #1
_080365AE:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080365C0
sub_080365C0: @ 0x080365C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	movs r0, #0xff
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _08036634 @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _080365E6
	b _080367A8
_080365E6:
	movs r4, #1
	mov r0, sl
	ands r0, r4
	str r0, [sp, #0xc]
_080365EE:
	ldr r0, _08036634 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _080365FC
	b _080367A0
_080365FC:
	lsls r2, r7, #2
	mov sb, r2
	mov r5, sp
	movs r4, #2
	mov r0, sl
	ands r0, r4
	str r0, [sp, #0x10]
_0803660A:
	ldr r0, _08036638 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _0803661C
	b _08036798
_0803661C:
	ldr r0, _0803663C @ =gBmMapTerrain
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _08036640
	cmp r0, #0x21
	beq _08036670
	b _08036798
	.align 2, 0
_08036634: .4byte gBmMapSize
_08036638: .4byte 0x0202E3E4
_0803663C: .4byte gBmMapTerrain
_08036640:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #8
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08036656
	b _08036798
_08036656:
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, _0803666C @ =sub_08036420
	mov r3, sp
	bl sub_08036CE8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803666A
	b _08036798
_0803666A:
	b _0803670C
	.align 2, 0
_0803666C: .4byte sub_08036420
_08036670:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #4
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08036686
	b _08036798
_08036686:
	strh r6, [r5]
	mov r4, sp
	strh r7, [r4, #2]
	ldr r0, _08036700 @ =gBmMapMovement
	ldr r0, [r0]
	add r0, sb
	ldr r2, [r0]
	adds r2, r2, r6
	ldr r0, _08036704 @ =gActiveUnit
	ldr r3, [r0]
	movs r1, #0x1d
	ldrsb r1, [r3, r1]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldrb r2, [r2]
	cmp r2, r1
	bgt _0803670C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _080366DE
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _08036708 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _080366DE
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08036798
_080366DE:
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _080366F4
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_080369EC
	cmp r0, #0
	bne _08036798
_080366F4:
	ldrh r0, [r5]
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	b _080367E0
	.align 2, 0
_08036700: .4byte gBmMapMovement
_08036704: .4byte gActiveUnit
_08036708: .4byte gBmMapUnit
_0803670C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _08036742
	movs r1, #2
	ldrsh r0, [r5, r1]
	ldr r1, _080367D0 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036742
	ldr r0, _080367D4 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08036798
_08036742:
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _08036758
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_080369EC
	cmp r0, #0
	bne _08036798
_08036758:
	mov r2, sp
	movs r4, #2
	ldrsh r0, [r2, r4]
	ldr r1, _080367D8 @ =0x0202E3E4
	ldr r3, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _08036798
	ldrh r0, [r5]
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #4]
_08036798:
	subs r6, #1
	cmp r6, #0
	blt _080367A0
	b _0803660A
_080367A0:
	subs r7, #1
	cmp r7, #0
	blt _080367A8
	b _080365EE
_080367A8:
	movs r0, #0
	cmp r0, #0
	bne _080367B6
	ldr r0, _080367DC @ =0x0203A8E8
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
_080367B6:
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _080367C4
	ldr r0, _080367DC @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #5
	strb r1, [r0]
_080367C4:
	ldr r0, [sp, #4]
	cmp r0, #0xff
	bne _080367E0
	movs r0, #0
	b _080367E2
	.align 2, 0
_080367D0: .4byte gBmMapUnit
_080367D4: .4byte gActiveUnit
_080367D8: .4byte 0x0202E3E4
_080367DC: .4byte 0x0203A8E8
_080367E0:
	movs r0, #1
_080367E2:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080367F4
sub_080367F4: @ 0x080367F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r1, _0803685C @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	cmp r2, #0
	blt _08036850
	movs r3, #0
	ldrsh r7, [r1, r3]
	ldr r0, _08036860 @ =0x0202E3E4
	mov r8, r0
	ldr r3, _08036864 @ =gBmMapUnit
	mov ip, r3
_08036814:
	subs r1, r7, #1
	subs r5, r2, #1
	cmp r1, #0
	blt _0803684A
	mov r3, r8
	ldr r0, [r3]
	lsls r2, r2, #2
	adds r0, r2, r0
	ldr r3, [r0]
	mov r6, ip
_08036828:
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08036844
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036844
	adds r4, #1
_08036844:
	subs r1, #1
	cmp r1, #0
	bge _08036828
_0803684A:
	adds r2, r5, #0
	cmp r2, #0
	bge _08036814
_08036850:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803685C: .4byte gBmMapSize
_08036860: .4byte 0x0202E3E4
_08036864: .4byte gBmMapUnit

	thumb_func_start sub_08036868
sub_08036868: @ 0x08036868
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _080368D4 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _080368CA
_08036878:
	ldr r0, _080368D4 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _080368C4
	lsls r5, r1, #2
_08036888:
	ldr r0, _080368D8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080368BE
	ldr r0, _080368DC @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080368BE
	ldr r0, _080368E0 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080368BE
	adds r6, #1
_080368BE:
	subs r4, #1
	cmp r4, #0
	bge _08036888
_080368C4:
	adds r1, r7, #0
	cmp r1, #0
	bge _08036878
_080368CA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080368D4: .4byte gBmMapSize
_080368D8: .4byte 0x0202E3E4
_080368DC: .4byte gBmMapUnit
_080368E0: .4byte gActiveUnitId

	thumb_func_start sub_080368E4
sub_080368E4: @ 0x080368E4
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _08036950 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08036948
_080368F4:
	ldr r0, _08036950 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _08036942
	lsls r5, r1, #2
_08036904:
	ldr r0, _08036954 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803693C
	ldr r0, _08036958 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803693C
	ldr r0, _0803695C @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803693C
	adds r6, #1
_0803693C:
	subs r4, #1
	cmp r4, #0
	bge _08036904
_08036942:
	adds r1, r7, #0
	cmp r1, #0
	bge _080368F4
_08036948:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036950: .4byte gBmMapSize
_08036954: .4byte 0x0202E3E4
_08036958: .4byte gBmMapUnit
_0803695C: .4byte gActiveUnitId

	thumb_func_start sub_08036960
sub_08036960: @ 0x08036960
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _080369DC @ =0x08C06308
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _080369E0 @ =0x0000270F
	cmp r0, r2
	beq _080369CE
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	ldr r5, _080369E4 @ =gBmMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov sb, r2
	ldr r0, _080369E8 @ =gBmMapUnit
	mov r8, r0
_08036992:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, ip
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _080369C6
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _080369C6
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080369C6
	adds r6, #1
_080369C6:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, sb
	bne _08036992
_080369CE:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080369DC: .4byte 0x08C06308
_080369E0: .4byte 0x0000270F
_080369E4: .4byte gBmMapSize
_080369E8: .4byte gBmMapUnit

	thumb_func_start sub_080369EC
sub_080369EC: @ 0x080369EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _08036A74 @ =0x08C06308
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _08036A78 @ =0x0000270F
	cmp r0, r2
	beq _08036A66
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _08036A7C @ =gBmMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov sb, r2
_08036A1A:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _08036A5E
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _08036A5E
	ldr r0, _08036A80 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036A5E
	ldr r0, _08036A84 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036A5E
	adds r6, #1
_08036A5E:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, sb
	bne _08036A1A
_08036A66:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036A74: .4byte 0x08C06308
_08036A78: .4byte 0x0000270F
_08036A7C: .4byte gBmMapSize
_08036A80: .4byte gBmMapUnit
_08036A84: .4byte gActiveUnitId

	thumb_func_start sub_08036A88
sub_08036A88: @ 0x08036A88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _08036B14 @ =0x08C06308
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _08036B18 @ =0x0000270F
	cmp r0, r2
	beq _08036B04
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _08036B1C @ =gBmMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov sb, r2
_08036AB6:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _08036AFC
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _08036AFC
	ldr r0, _08036B20 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036AFC
	ldr r0, _08036B24 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08036AFC
	adds r6, #1
_08036AFC:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, sb
	bne _08036AB6
_08036B04:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036B14: .4byte 0x08C06308
_08036B18: .4byte 0x0000270F
_08036B1C: .4byte gBmMapSize
_08036B20: .4byte gBmMapUnit
_08036B24: .4byte gActiveUnitId

	thumb_func_start sub_08036B28
sub_08036B28: @ 0x08036B28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	bl RevertMapChange
	ldr r0, _08036BBC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08036BC0 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08036BAC
_08036B52:
	ldr r0, _08036BC0 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _08036BA6
	lsls r1, r7, #0x10
	mov r8, r1
_08036B66:
	ldr r0, _08036BC4 @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036BA0
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	bl sub_08017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	bl sub_0801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_08036BA0:
	subs r6, #1
	cmp r6, #0
	bge _08036B66
_08036BA6:
	mov r7, sl
	cmp r7, #0
	bge _08036B52
_08036BAC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036BBC: .4byte 0x0202E3E4
_08036BC0: .4byte gBmMapSize
_08036BC4: .4byte gBmMapMovement

	thumb_func_start sub_08036BC8
sub_08036BC8: @ 0x08036BC8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitPower
	cmp r0, #0x14
	bgt _08036BDE
	adds r0, r4, #0
	bl GetUnitPower
	adds r7, r0, #0
	b _08036BE0
_08036BDE:
	movs r7, #0x14
_08036BE0:
	adds r0, r4, #0
	bl RevertMapChange
	ldr r0, _08036C3C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08036C40 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08036C34
_08036BFC:
	ldr r0, _08036C40 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08036C2E
_08036C0A:
	ldr r0, _08036C44 @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036C28
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_0801A6B4
_08036C28:
	subs r4, #1
	cmp r4, #0
	bge _08036C0A
_08036C2E:
	adds r5, r6, #0
	cmp r5, #0
	bge _08036BFC
_08036C34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036C3C: .4byte 0x0202E3E4
_08036C40: .4byte gBmMapSize
_08036C44: .4byte gBmMapMovement

	thumb_func_start sub_08036C48
sub_08036C48: @ 0x08036C48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	bl RevertMapChange
	ldr r0, _08036CDC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08036CE0 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08036CCC
_08036C72:
	ldr r0, _08036CE0 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _08036CC6
	lsls r1, r7, #0x10
	mov r8, r1
_08036C86:
	ldr r0, _08036CE4 @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036CC0
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	bl sub_08017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	bl sub_0801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_08036CC0:
	subs r6, #1
	cmp r6, #0
	bge _08036C86
_08036CC6:
	mov r7, sl
	cmp r7, #0
	bge _08036C72
_08036CCC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036CDC: .4byte 0x0202E3E4
_08036CE0: .4byte gBmMapSize
_08036CE4: .4byte gBmMapMovement

	thumb_func_start sub_08036CE8
sub_08036CE8: @ 0x08036CE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r3, #0
	mov sb, r2
	movs r0, #0xff
	mov r8, r0
	ldr r1, _08036D50 @ =0x081D8F04
	mov r0, sp
	movs r2, #8
	bl memcpy
	mov r4, sp
	movs r2, #3
_08036D0C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r7, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r6, r1
	str r2, [sp, #8]
	bl _call_via_r9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #8]
	cmp r0, #0xff
	beq _08036D3E
	cmp r8, r0
	bls _08036D3E
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r7
	strh r0, [r5]
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r0, r6
	strh r0, [r5, #2]
_08036D3E:
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _08036D0C
	mov r0, r8
	cmp r0, #0xff
	bne _08036D54
	movs r0, #0
	b _08036D56
	.align 2, 0
_08036D50: .4byte 0x081D8F04
_08036D54:
	movs r0, #1
_08036D56:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08036D64
sub_08036D64: @ 0x08036D64
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	ldr r2, _08036D90 @ =0x08C06564
	ldrh r1, [r2]
	ldr r3, _08036D94 @ =0x0000FFFF
	cmp r1, r3
	beq _08036D84
_08036D76:
	cmp r1, r4
	beq _08036D88
	adds r2, #2
	adds r0, #1
	ldrh r1, [r2]
	cmp r1, r3
	bne _08036D76
_08036D84:
	movs r0, #1
	rsbs r0, r0, #0
_08036D88:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08036D90: .4byte 0x08C06564
_08036D94: .4byte 0x0000FFFF

	thumb_func_start sub_08036D98
sub_08036D98: @ 0x08036D98
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xff
	movs r5, #0xff
	movs r4, #0
_08036DA2:
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _08036DCE
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	bl sub_08036D64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blo _08036DC8
	adds r6, r0, #0
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
_08036DC8:
	adds r4, #1
	cmp r4, #4
	ble _08036DA2
_08036DCE:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08036DD8
sub_08036DD8: @ 0x08036DD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov sb, r1
	movs r0, #0xff
	mov sl, r0
	ldr r1, _08036E1C @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08036E24
	ldr r4, _08036E20 @ =gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _08036E2A
	.align 2, 0
_08036E1C: .4byte 0x0203A8E8
_08036E20: .4byte gBmMapMovement
_08036E24:
	adds r0, r5, #0
	bl RevertMapChange
_08036E2A:
	ldr r1, _08036EA8 @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _08036E9E
_08036E36:
	ldr r1, _08036EA8 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r3, #0
	blt _08036E98
	lsls r4, r5, #2
	ldr r1, _08036EAC @ =gBmMapMovement
	mov ip, r1
	ldr r7, _08036EB0 @ =gBmMapUnit
	ldr r6, _08036EB4 @ =gActiveUnitId
	ldr r1, _08036EB8 @ =0x0202E3F0
_08036E52:
	mov r2, ip
	ldr r0, [r2]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036E92
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036E76
	ldrb r2, [r6]
	cmp r0, r2
	bne _08036E92
_08036E76:
	ldr r0, [r1]
	adds r2, r4, r0
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp sl, r0
	blo _08036E92
	mov r0, sb
	strh r3, [r0]
	strh r5, [r0, #2]
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	mov sl, r0
_08036E92:
	subs r3, #1
	cmp r3, #0
	bge _08036E52
_08036E98:
	mov r5, r8
	cmp r5, #0
	bge _08036E36
_08036E9E:
	mov r1, sl
	cmp r1, #0xff
	bne _08036EBC
	movs r0, #0
	b _08036EBE
	.align 2, 0
_08036EA8: .4byte gBmMapSize
_08036EAC: .4byte gBmMapMovement
_08036EB0: .4byte gBmMapUnit
_08036EB4: .4byte gActiveUnitId
_08036EB8: .4byte 0x0202E3F0
_08036EBC:
	movs r0, #1
_08036EBE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08036ECC
sub_08036ECC: @ 0x08036ECC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r5, _08036F4C @ =gActiveUnit
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _08036F50 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r2, [r5]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r3, #0xb
	ldrsb r3, [r2, r3]
	movs r2, #0x7c
	bl sub_0801A0E0
	adds r0, r4, #0
	bl sub_08036F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r6, _08036F54 @ =0x08C0636C
	cmp r0, #1
	bne _08036F0C
	ldr r6, _08036F58 @ =0x08C06370
_08036F0C:
	adds r0, r6, #0
	movs r1, #1
	adds r2, r7, #0
	bl sub_0803631C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08036F5C
	ldr r0, [r5]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801A030
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl sub_0803631C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08036F5C
	movs r0, #0
	b _08036F5E
	.align 2, 0
_08036F4C: .4byte gActiveUnit
_08036F50: .4byte 0x0202E3E4
_08036F54: .4byte 0x08C0636C
_08036F58: .4byte 0x08C06370
_08036F5C:
	movs r0, #1
_08036F5E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08036F64
sub_08036F64: @ 0x08036F64
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	strb r5, [r6]
	ldr r4, _08036F84 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08036F8C
	ldr r1, [r4]
	movs r0, #8
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
	b _08036FCE
	.align 2, 0
_08036F84: .4byte gActiveUnit
_08036F88:
	movs r0, #1
	b _08036FD0
_08036F8C:
	movs r5, #0
	adds r7, r4, #0
_08036F90:
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _08036FCE
	strb r5, [r6]
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x68
	beq _08036F88
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6a
	bne _08036FC8
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	bne _08036F88
_08036FC8:
	adds r5, #1
	cmp r5, #4
	ble _08036F90
_08036FCE:
	movs r0, #0
_08036FD0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08036FD8
sub_08036FD8: @ 0x08036FD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _08037034 @ =gActiveUnit
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _08037038
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _08037038
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_08035328
	b _08037190
	.align 2, 0
_08037034: .4byte gActiveUnit
_08037038:
	cmp r4, #0
	beq _0803705C
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _08037058 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801A030
	b _0803706C
	.align 2, 0
_08037058: .4byte gActiveUnit
_0803705C:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0803709C @ =gActiveUnit
	ldr r2, [r2]
	bl sub_0803C5B0
_0803706C:
	ldr r4, _0803709C @ =gActiveUnit
	ldr r0, [r4]
	bl RevertMapChange
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _080370A0 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _080370A4 @ =0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _080370A8 @ =gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08037168
	.align 2, 0
_0803709C: .4byte gActiveUnit
_080370A0: .4byte 0x0202E3E4
_080370A4: .4byte 0x0000FFFF
_080370A8: .4byte gBmMapSize
_080370AC:
	ldr r0, _080371A0 @ =gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _08037164
	asrs r0, r7, #0xe
	mov r8, r0
_080370C2:
	ldr r0, _080371A4 @ =gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	lsls r2, r4, #0x10
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08037158
	ldr r0, _080371A8 @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _080370EE
	ldr r0, _080371AC @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _08037158
_080370EE:
	mov r1, sl
	cmp r1, #0
	bne _08037122
	ldr r0, _080371B0 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _080371B4 @ =0x0203A8E8
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _08037122
	ldr r0, _080371B8 @ =0x0202E3F0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _08037158
_08037122:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl sub_080399C4
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _08037158
	ldr r0, _080371BC @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08037158
	ldrb r0, [r0]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_08037158:
	ldr r1, _080371C0 @ =0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _080370C2
_08037164:
	ldr r1, _080371C0 @ =0xFFFF0000
	adds r0, r7, r1
_08037168:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080370AC
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08037190
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_08035328
_08037190:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080371A0: .4byte gBmMapSize
_080371A4: .4byte gBmMapMovement
_080371A8: .4byte gBmMapUnit
_080371AC: .4byte gActiveUnitId
_080371B0: .4byte gActiveUnit
_080371B4: .4byte 0x0203A8E8
_080371B8: .4byte 0x0202E3F0
_080371BC: .4byte 0x0202E3E4
_080371C0: .4byte 0xFFFF0000

	thumb_func_start sub_080371C4
sub_080371C4: @ 0x080371C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _08037220 @ =gActiveUnit
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _08037224
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _08037224
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_08035328
	b _0803737C
	.align 2, 0
_08037220: .4byte gActiveUnit
_08037224:
	cmp r4, #0
	beq _08037248
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _08037244 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0803C414
	b _08037258
	.align 2, 0
_08037244: .4byte gActiveUnit
_08037248:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08037288 @ =gActiveUnit
	ldr r2, [r2]
	bl sub_0803C440
_08037258:
	ldr r4, _08037288 @ =gActiveUnit
	ldr r0, [r4]
	bl RevertMapChange
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803728C @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _08037290 @ =0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _08037294 @ =gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08037354
	.align 2, 0
_08037288: .4byte gActiveUnit
_0803728C: .4byte 0x0202E3E4
_08037290: .4byte 0x0000FFFF
_08037294: .4byte gBmMapSize
_08037298:
	ldr r0, _0803738C @ =gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _08037350
	asrs r0, r7, #0xe
	mov r8, r0
_080372AE:
	ldr r0, _08037390 @ =gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	lsls r2, r4, #0x10
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08037344
	ldr r0, _08037394 @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _080372DA
	ldr r0, _08037398 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _08037344
_080372DA:
	mov r1, sl
	cmp r1, #0
	bne _0803730E
	ldr r0, _0803739C @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _080373A0 @ =0x0203A8E8
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803730E
	ldr r0, _080373A4 @ =0x0202E3F0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _08037344
_0803730E:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl sub_080399C4
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _08037344
	ldr r0, _080373A8 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08037344
	ldrb r0, [r0]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_08037344:
	ldr r1, _080373AC @ =0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _080372AE
_08037350:
	ldr r1, _080373AC @ =0xFFFF0000
	adds r0, r7, r1
_08037354:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08037298
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0803737C
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_08035328
_0803737C:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803738C: .4byte gBmMapSize
_08037390: .4byte gBmMapMovement
_08037394: .4byte gBmMapUnit
_08037398: .4byte gActiveUnitId
_0803739C: .4byte gActiveUnit
_080373A0: .4byte 0x0203A8E8
_080373A4: .4byte 0x0202E3F0
_080373A8: .4byte 0x0202E3E4
_080373AC: .4byte 0xFFFF0000

	thumb_func_start sub_080373B0
sub_080373B0: @ 0x080373B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	adds r6, r3, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	asrs r5, r2, #0x10
	ldr r0, _080373F8 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	lsrs r4, r1, #0x10
	mov r8, r4
	asrs r4, r1, #0x10
	ldr r1, [r0]
	adds r1, r1, r4
	ldr r7, _080373FC @ =0x0202E3F0
	ldr r0, [r7]
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	orrs r0, r1
	cmp r0, #0
	bne _08037400
	mov r0, r8
	strh r0, [r6]
	strh r3, [r6, #2]
	b _080374E4
	.align 2, 0
_080373F8: .4byte gBmMapUnit
_080373FC: .4byte 0x0202E3F0
_08037400:
	ldr r0, [sp, #4]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801A030
	ldr r0, [sp, #4]
	bl sub_08019FFC
	movs r1, #0x7c
	str r1, [sp]
	ldr r0, _08037428 @ =0x0000FFFF
	strh r0, [r6]
	ldr r1, _0803742C @ =gBmMapSize
	ldrh r0, [r1, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _080374B4
	.align 2, 0
_08037428: .4byte 0x0000FFFF
_0803742C: .4byte gBmMapSize
_08037430:
	ldr r2, _080374CC @ =gBmMapSize
	ldrh r0, [r2]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	lsls r4, r5, #0x10
	str r4, [sp, #4]
	cmp r1, #0
	blt _080374AE
	asrs r4, r4, #0xe
	ldr r7, _080374D0 @ =gBmMapMovement
	mov sl, r7
	ldr r0, _080374D4 @ =gBmMapUnit
	mov sb, r0
	ldr r2, _080374D8 @ =0x0202E3F0
	mov r8, r2
	ldr r7, _080374DC @ =0x0202E3E4
	mov ip, r7
_08037456:
	mov r2, sl
	ldr r0, [r2]
	adds r0, r4, r0
	asrs r2, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080374A0
	mov r7, sb
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	adds r1, r1, r2
	mov r7, r8
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	orrs r0, r1
	cmp r0, #0
	bne _080374A0
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r7, [sp]
	cmp r2, r7
	bhi _080374A0
	ldrb r0, [r0]
	str r0, [sp]
	strh r3, [r6]
	strh r5, [r6, #2]
_080374A0:
	lsls r0, r3, #0x10
	ldr r1, _080374E0 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	cmp r1, #0
	bge _08037456
_080374AE:
	ldr r2, [sp, #4]
	ldr r4, _080374E0 @ =0xFFFF0000
	adds r0, r2, r4
_080374B4:
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _08037430
	movs r7, #0
	ldrsh r1, [r6, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080374E4
	movs r0, #0
	b _080374E6
	.align 2, 0
_080374CC: .4byte gBmMapSize
_080374D0: .4byte gBmMapMovement
_080374D4: .4byte gBmMapUnit
_080374D8: .4byte 0x0202E3F0
_080374DC: .4byte 0x0202E3E4
_080374E0: .4byte 0xFFFF0000
_080374E4:
	movs r0, #1
_080374E6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080374F8
sub_080374F8: @ 0x080374F8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r2, _08037504 @ =0x08C0639C
	b _08037520
	.align 2, 0
_08037504: .4byte 0x08C0639C
_08037508:
	ldr r1, [r2]
	b _08037512
_0803750C:
	cmp r0, r4
	beq _08037526
	adds r1, #1
_08037512:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803750C
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #4
_08037520:
	ldr r0, [r2]
	cmp r0, #0
	bne _08037508
_08037526:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08037530
sub_08037530: @ 0x08037530
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_08037538:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0803756C
	ldr r0, [r1]
	cmp r0, #0
	beq _0803756C
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0803756C
	ldr r1, [r1, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803755E
_0803755A:
	movs r0, #1
	b _08037574
_0803755E:
	ldr r0, _08037568 @ =0x00010005
	ands r1, r0
	cmp r1, #0
	bne _08037572
	b _0803755A
	.align 2, 0
_08037568: .4byte 0x00010005
_0803756C:
	adds r4, #1
	cmp r4, #0xbf
	ble _08037538
_08037572:
	movs r0, #0
_08037574:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803757C
sub_0803757C: @ 0x0803757C
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r0, r2
	cmp r1, #0
	bge _0803759E
	subs r1, r2, r0
_0803759E:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	subs r0, r2, r3
	cmp r0, #0
	bge _080375AA
	subs r0, r6, r2
_080375AA:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bls _080375B8
	movs r0, #0
	b _080375BA
_080375B8:
	movs r0, #1
_080375BA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080375C0
sub_080375C0: @ 0x080375C0
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _080375E8 @ =gBmMapTerrain
	ldr r2, [r2]
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x21
	beq _080375F6
	cmp r0, #0x21
	bgt _080375EC
	cmp r0, #3
	beq _08037604
	b _08037608
	.align 2, 0
_080375E8: .4byte gBmMapTerrain
_080375EC:
	cmp r0, #0x24
	beq _08037604
	cmp r0, #0x37
	bne _08037608
	b _08037604
_080375F6:
	mov r0, sp
	bl sub_08036F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037608
_08037604:
	movs r0, #1
	b _0803760A
_08037608:
	movs r0, #0
_0803760A:
	add sp, #4
	pop {r1}
	bx r1

	thumb_func_start sub_08037610
sub_08037610: @ 0x08037610
	push {r4, r5, r6, r7, lr}
	ldr r0, _080376C4 @ =0x0203A8E8
	adds r0, #0x85
	movs r1, #0
	strb r1, [r0]
	movs r4, #1
_0803761C:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	cmp r5, #0
	beq _080376B6
	ldr r0, [r5]
	cmp r0, #0
	beq _080376B6
	ldr r0, [r5, #0xc]
	ldr r1, _080376C8 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _080376B6
	ldr r0, [r5, #4]
	ldrb r1, [r5, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080376C4 @ =0x0203A8E8
	adds r0, #0x85
	ldrb r2, [r0]
	cmp r1, r2
	bls _08037652
	strb r1, [r0]
_08037652:
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _080376B0
_0803765A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037676
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803769C
_08037676:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0803768C
	movs r0, #1
	ldrb r1, [r5, #0xa]
	orrs r0, r1
	strb r0, [r5, #0xa]
_0803768C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080376CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08037714
_0803769C:
	adds r6, #1
	cmp r6, #4
	bgt _080376B0
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803765A
_080376B0:
	adds r0, r5, #0
	bl sub_08037760
_080376B6:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _0803761C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080376C4: .4byte 0x0203A8E8
_080376C8: .4byte 0x00010005

	thumb_func_start sub_080376CC
sub_080376CC: @ 0x080376CC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803770E
	movs r4, #2
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x51
	beq _08037702
	cmp r0, #0x51
	bgt _080376F8
	cmp r0, #0x50
	beq _080376FE
	b _08037708
_080376F8:
	cmp r0, #0x52
	beq _08037706
	b _08037708
_080376FE:
	movs r4, #8
	b _08037708
_08037702:
	movs r4, #0x10
	b _08037708
_08037706:
	movs r4, #0x20
_08037708:
	ldrb r0, [r6, #0xa]
	orrs r4, r0
	strb r4, [r6, #0xa]
_0803770E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08037714
sub_08037714: @ 0x08037714
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r5, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08037738
	adds r0, r4, #0
	bl sub_0801778C
	cmp r0, #1
	ble _08037738
	movs r5, #0x40
_08037738:
	adds r0, r4, #0
	bl sub_08017844
	cmp r0, #1
	blt _08037752
	cmp r0, #5
	ble _0803774E
	cmp r0, #0x22
	bgt _08037752
	cmp r0, #0x21
	blt _08037752
_0803774E:
	movs r0, #4
	orrs r5, r0
_08037752:
	ldrb r0, [r6, #0xa]
	orrs r5, r0
	strb r5, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08037760
sub_08037760: @ 0x08037760
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r0, _080377F8 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #1
	movs r3, #8
	bl MapAddInBoundedRange
	ldr r0, _080377FC @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _080377E6
_08037792:
	ldr r0, _080377FC @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _080377E0
	lsls r5, r1, #2
_080377A2:
	ldr r0, _080377F8 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080377DA
	ldr r0, _08037800 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080377DA
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080377DA
	movs r0, #1
	add r8, r0
_080377DA:
	subs r4, #1
	cmp r4, #0
	bge _080377A2
_080377E0:
	adds r1, r7, #0
	cmp r1, #0
	bge _08037792
_080377E6:
	adds r0, r6, #0
	adds r0, #0x46
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080377F8: .4byte gBmMapMovement
_080377FC: .4byte gBmMapSize
_08037800: .4byte gBmMapUnit

	thumb_func_start CharStoreAI
CharStoreAI: @ 0x08037804
	adds r3, r0, #0
	ldrb r0, [r1, #0xc]
	adds r2, r3, #0
	adds r2, #0x42
	strb r0, [r2]
	ldrb r2, [r1, #0xd]
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x40
	ldr r0, _08037830 @ =0x0000FFF8
	ldrh r3, [r2]
	ands r0, r3
	ldrb r3, [r1, #0xe]
	orrs r0, r3
	ldrb r1, [r1, #0xf]
	lsls r1, r1, #8
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08037830: .4byte 0x0000FFF8

	thumb_func_start sub_08037834
sub_08037834: @ 0x08037834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	movs r0, #0
	mov sb, r0
	ldr r0, _080378E8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _080378DE
_08037850:
	ldr r0, _080378E8 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _080378D8
	lsls r7, r6, #2
_08037862:
	ldr r0, _080378EC @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080378D2
	ldr r0, _080378F0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080378D2
	ldr r0, _080378F4 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803789E
	ldr r0, _080378F8 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _080378D2
_0803789E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080397B8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080397F8
	adds r4, r4, r0
	ldr r0, _080378FC @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r1, _08037900 @ =0x7FFFFFFF
	adds r4, r4, r1
	cmp sb, r4
	bhs _080378D2
	mov r0, r8
	strh r5, [r0]
	strh r6, [r0, #2]
	mov sb, r4
_080378D2:
	subs r5, #1
	cmp r5, #0
	bge _08037862
_080378D8:
	mov r6, sl
	cmp r6, #0
	bge _08037850
_080378DE:
	mov r1, sb
	cmp r1, #0
	bne _08037904
	movs r0, #0
	b _08037906
	.align 2, 0
_080378E8: .4byte gBmMapSize
_080378EC: .4byte gBmMapMovement
_080378F0: .4byte 0x0202E3E4
_080378F4: .4byte gBmMapUnit
_080378F8: .4byte gActiveUnitId
_080378FC: .4byte 0x0202E3F0
_08037900: .4byte 0x7FFFFFFF
_08037904:
	movs r0, #1
_08037906:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08037914
sub_08037914: @ 0x08037914
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetActiveFactionAlliance
	adds r5, r0, #0
	adds r4, r5, #1
	b _0803794E
_08037922:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0803794A
	ldr r0, [r2]
	cmp r0, #0
	beq _0803794A
	ldr r0, [r2, #0xc]
	ldr r1, _0803795C @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803794A
	movs r0, #1
	ldrb r2, [r2, #0xa]
	ands r0, r2
	cmp r0, #0
	beq _0803794A
	adds r6, #1
_0803794A:
	adds r4, #1
	adds r0, r5, #0
_0803794E:
	adds r0, #0x80
	cmp r4, r0
	blt _08037922
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803795C: .4byte 0x00010005

	thumb_func_start sub_08037960
sub_08037960: @ 0x08037960
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, _080379EC @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _080379E0
_08037974:
	ldr r0, _080379EC @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r1, #1
	mov r8, r0
	cmp r4, #0
	blt _080379DA
	lsls r5, r1, #2
_08037986:
	ldr r0, _080379F0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080379D4
	ldr r6, _080379F4 @ =gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080379D4
	ldr r0, _080379F8 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080379D4
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	movs r1, #1
	ldrb r0, [r0, #0xa]
	ands r1, r0
	cmp r1, #0
	beq _080379D4
	adds r7, #1
_080379D4:
	subs r4, #1
	cmp r4, #0
	bge _08037986
_080379DA:
	mov r1, r8
	cmp r1, #0
	bge _08037974
_080379E0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080379EC: .4byte gBmMapSize
_080379F0: .4byte 0x0202E3E4
_080379F4: .4byte gBmMapUnit
_080379F8: .4byte gActiveUnitId

	thumb_func_start sub_080379FC
sub_080379FC: @ 0x080379FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_08037A02:
	lsls r0, r5, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08037A38
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _08037A32
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037A32
	movs r0, #1
	b _08037A3A
_08037A32:
	adds r5, #1
	cmp r5, #4
	ble _08037A02
_08037A38:
	movs r0, #0
_08037A3A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08037A40
sub_08037A40: @ 0x08037A40
	push {lr}
	adds r2, r0, #0
	ldr r1, _08037A5C @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08037A60
	adds r0, r2, #0
	movs r1, #0
	bl sub_08019FC0
	b _08037A66
	.align 2, 0
_08037A5C: .4byte 0x0203A8E8
_08037A60:
	adds r0, r2, #0
	bl RevertMapChange
_08037A66:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08037A6C
sub_08037A6C: @ 0x08037A6C
	push {r4, lr}
	ldr r3, _08037AAC @ =0x030013B8
	ldr r1, _08037AB0 @ =0x08C07CB0
	ldr r0, _08037AB4 @ =gActiveUnit
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x42
	ldr r2, [r1]
	ldrb r4, [r4]
	lsls r1, r4, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r3]
	adds r0, #0x43
	ldrb r4, [r0]
	lsls r2, r4, #4
	adds r1, r1, r2
	str r1, [r3]
	ldr r4, _08037AB8 @ =0x030013B0
	movs r1, #1
	strb r1, [r4]
	ldr r2, _08037ABC @ =0x030013B4
	movs r1, #0
	str r1, [r2]
	bl sub_08037B8C
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037AAC: .4byte 0x030013B8
_08037AB0: .4byte 0x08C07CB0
_08037AB4: .4byte gActiveUnit
_08037AB8: .4byte 0x030013B0
_08037ABC: .4byte 0x030013B4

	thumb_func_start sub_08037AC0
sub_08037AC0: @ 0x08037AC0
	push {r4, lr}
	ldr r1, _08037AE8 @ =0x030013B8
	ldr r0, _08037AEC @ =0x08C06378
	str r0, [r1]
	ldr r4, _08037AF0 @ =0x030013B0
	movs r0, #1
	strb r0, [r4]
	ldr r1, _08037AF4 @ =0x030013B4
	movs r0, #0
	str r0, [r1]
	ldr r0, _08037AF8 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x43
	bl sub_08037B8C
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037AE8: .4byte 0x030013B8
_08037AEC: .4byte 0x08C06378
_08037AF0: .4byte 0x030013B0
_08037AF4: .4byte 0x030013B4
_08037AF8: .4byte gActiveUnit

	thumb_func_start sub_08037AFC
sub_08037AFC: @ 0x08037AFC
	push {r4, lr}
	ldr r3, _08037B3C @ =0x030013B8
	ldr r2, _08037B40 @ =0x08C07CA4
	ldr r0, _08037B44 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	ldr r2, [r2]
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r3]
	adds r0, #0x45
	ldrb r4, [r0]
	lsls r2, r4, #4
	adds r1, r1, r2
	str r1, [r3]
	ldr r4, _08037B48 @ =0x030013B0
	movs r1, #1
	strb r1, [r4]
	ldr r2, _08037B4C @ =0x030013B4
	movs r1, #1
	str r1, [r2]
	bl sub_08037B8C
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037B3C: .4byte 0x030013B8
_08037B40: .4byte 0x08C07CA4
_08037B44: .4byte gActiveUnit
_08037B48: .4byte 0x030013B0
_08037B4C: .4byte 0x030013B4

	thumb_func_start sub_08037B50
sub_08037B50: @ 0x08037B50
	push {r4, lr}
	ldr r1, _08037B78 @ =0x030013B8
	ldr r0, _08037B7C @ =0x08C06388
	str r0, [r1]
	ldr r4, _08037B80 @ =0x030013B0
	movs r0, #1
	strb r0, [r4]
	ldr r1, _08037B84 @ =0x030013B4
	movs r0, #1
	str r0, [r1]
	ldr r0, _08037B88 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x45
	bl sub_08037B8C
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037B78: .4byte 0x030013B8
_08037B7C: .4byte 0x08C06388
_08037B80: .4byte 0x030013B0
_08037B84: .4byte 0x030013B4
_08037B88: .4byte gActiveUnit

	thumb_func_start sub_08037B8C
sub_08037B8C: @ 0x08037B8C
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, _08037BB4 @ =0x081D8F0C
	mov r0, sp
	movs r2, #0x70
	bl memcpy
	ldr r1, _08037BB8 @ =0x030013B8
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0x1b
	bls _08037BC8
	ldr r0, _08037BBC @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037BC4
	ldr r0, _08037BC0 @ =0x08C06378
	b _08037BC6
	.align 2, 0
_08037BB4: .4byte 0x081D8F0C
_08037BB8: .4byte 0x030013B8
_08037BBC: .4byte 0x030013B4
_08037BC0: .4byte 0x08C06378
_08037BC4:
	ldr r0, _08037BEC @ =0x08C06388
_08037BC6:
	str r0, [r1]
_08037BC8:
	ldr r1, _08037BF0 @ =0x0203A8E8
	ldr r0, _08037BF4 @ =0x030013B8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	adds r1, #0x7e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	add sp, #0x70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037BEC: .4byte 0x08C06388
_08037BF0: .4byte 0x0203A8E8
_08037BF4: .4byte 0x030013B8

	thumb_func_start sub_08037BF8
sub_08037BF8: @ 0x08037BF8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08037C28 @ =0x030013B8
	ldr r2, [r0]
	ldrb r5, [r2, #3]
	movs r4, #0
	ldr r0, [r2, #8]
	ldrb r1, [r2, #1]
	ldr r2, [r2, #4]
	bl sub_08035D10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037C84
	ldr r0, _08037C2C @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037C38
	ldr r1, _08037C30 @ =0x08C07CB0
	ldr r0, _08037C34 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b _08037C40
	.align 2, 0
_08037C28: .4byte 0x030013B8
_08037C2C: .4byte 0x030013B4
_08037C30: .4byte 0x08C07CB0
_08037C34: .4byte gActiveUnit
_08037C38:
	ldr r1, _08037C58 @ =0x08C07CA4
	ldr r0, _08037C5C @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x44
_08037C40:
	ldr r1, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r5, #0
	beq _08037C80
	lsls r0, r4, #4
	adds r0, r0, r1
	ldr r2, _08037C60 @ =0x030013B0
	b _08037C6E
	.align 2, 0
_08037C58: .4byte 0x08C07CA4
_08037C5C: .4byte gActiveUnit
_08037C60: .4byte 0x030013B0
_08037C64:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r1
_08037C6E:
	ldrb r3, [r0]
	cmp r3, #0x1b
	bne _08037C64
	ldrb r0, [r0, #3]
	cmp r0, r5
	bne _08037C64
	adds r0, r4, #1
	strb r0, [r6]
	b _08037C8C
_08037C80:
	strb r5, [r6]
	b _08037C8A
_08037C84:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08037C8A:
	ldr r2, _08037C98 @ =0x030013B0
_08037C8C:
	movs r0, #0
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037C98: .4byte 0x030013B0

	thumb_func_start sub_08037C9C
sub_08037C9C: @ 0x08037C9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08037CC0 @ =0x030013BC
	ldr r0, _08037CC4 @ =0x030013B8
	ldr r0, [r0]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	bl _call_via_r1
	ldr r1, _08037CC8 @ =0x030013B0
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037CC0: .4byte 0x030013BC
_08037CC4: .4byte 0x030013B8
_08037CC8: .4byte 0x030013B0

	thumb_func_start sub_08037CCC
sub_08037CCC: @ 0x08037CCC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08037D2C @ =0x030013B8
	ldr r0, [r0]
	ldrb r3, [r0, #1]
	adds r6, r3, #0
	ldrb r4, [r0, #2]
	adds r7, r4, #0
	cmp r3, #0xff
	beq _08037CF0
	ldr r1, _08037D30 @ =gActiveUnit
	ldr r0, [r1]
	adds r0, #0x42
	movs r2, #0
	strb r3, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r2, [r0]
_08037CF0:
	cmp r4, #0xff
	beq _08037D04
	ldr r1, _08037D30 @ =gActiveUnit
	ldr r0, [r1]
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x45
	strb r2, [r0]
_08037D04:
	ldr r0, _08037D34 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037D10
	cmp r6, #0xff
	beq _08037D18
_08037D10:
	cmp r0, #1
	bne _08037D1E
	cmp r7, #0xff
	bne _08037D1E
_08037D18:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_08037D1E:
	ldr r0, _08037D38 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037D2C: .4byte 0x030013B8
_08037D30: .4byte gActiveUnit
_08037D34: .4byte 0x030013B4
_08037D38: .4byte 0x0203A8E8

	thumb_func_start sub_08037D3C
sub_08037D3C: @ 0x08037D3C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08037D5C @ =0x030013B8
	ldr r0, [r0]
	ldrb r3, [r0, #3]
	movs r2, #0
	ldr r0, _08037D60 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037D6C
	ldr r1, _08037D64 @ =0x08C07CB0
	ldr r0, _08037D68 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b _08037D74
	.align 2, 0
_08037D5C: .4byte 0x030013B8
_08037D60: .4byte 0x030013B4
_08037D64: .4byte 0x08C07CB0
_08037D68: .4byte gActiveUnit
_08037D6C:
	ldr r1, _08037D8C @ =0x08C07CA4
	ldr r0, _08037D90 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x44
_08037D74:
	ldr r1, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r3, #0
	beq _08037DB4
	lsls r0, r2, #4
	adds r0, r0, r1
	ldr r5, _08037D94 @ =0x030013B0
	b _08037DA2
	.align 2, 0
_08037D8C: .4byte 0x08C07CA4
_08037D90: .4byte gActiveUnit
_08037D94: .4byte 0x030013B0
_08037D98:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #4
	adds r0, r0, r1
_08037DA2:
	ldrb r6, [r0]
	cmp r6, #0x1b
	bne _08037D98
	ldrb r0, [r0, #3]
	cmp r0, r3
	bne _08037D98
	adds r0, r2, #1
	strb r0, [r4]
	b _08037DB8
_08037DB4:
	strb r3, [r4]
	ldr r5, _08037DC4 @ =0x030013B0
_08037DB8:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037DC4: .4byte 0x030013B0

	thumb_func_start sub_08037DC8
sub_08037DC8: @ 0x08037DC8
	push {lr}
	adds r1, r0, #0
	ldr r0, _08037DEC @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037DF0
	movs r0, #1
	b _08037DF2
	.align 2, 0
_08037DEC: .4byte gActiveUnit
_08037DF0:
	movs r0, #0
_08037DF2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08037DF8
sub_08037DF8: @ 0x08037DF8
	ldr r1, _08037E04 @ =gActiveUnit
	ldr r1, [r1]
	cmp r0, r1
	beq _08037E08
	movs r0, #1
	b _08037E0A
	.align 2, 0
_08037E04: .4byte gActiveUnit
_08037E08:
	movs r0, #0
_08037E0A:
	bx lr

	thumb_func_start sub_08037E0C
sub_08037E0C: @ 0x08037E0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037E44 @ =0x030013B8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_080362E4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08037E4C
	ldr r0, _08037E48 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037E4C
	movs r0, #1
	b _08037E4E
	.align 2, 0
_08037E44: .4byte 0x030013B8
_08037E48: .4byte gActiveUnit
_08037E4C:
	movs r0, #0
_08037E4E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08037E54
sub_08037E54: @ 0x08037E54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037E8C @ =0x030013B8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_080362E4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08037E86
	ldr r0, _08037E90 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037E94
_08037E86:
	movs r0, #1
	b _08037E96
	.align 2, 0
_08037E8C: .4byte 0x030013B8
_08037E90: .4byte gActiveUnit
_08037E94:
	movs r0, #0
_08037E96:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08037E9C
sub_08037E9C: @ 0x08037E9C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _08037ECC @ =0x030013B8
	ldr r1, [r1]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _08037ED4
	ldr r0, _08037ED0 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037ED4
	movs r0, #1
	b _08037ED6
	.align 2, 0
_08037ECC: .4byte 0x030013B8
_08037ED0: .4byte gActiveUnit
_08037ED4:
	movs r0, #0
_08037ED6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08037EDC
sub_08037EDC: @ 0x08037EDC
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldr r1, _08037F0C @ =0x030013B8
	ldr r1, [r1]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _08037F14
	ldr r0, _08037F10 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037F14
	movs r0, #1
	b _08037F16
	.align 2, 0
_08037F0C: .4byte 0x030013B8
_08037F10: .4byte gActiveUnit
_08037F14:
	movs r0, #0
_08037F16:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08037F1C
sub_08037F1C: @ 0x08037F1C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08037F6C @ =0x030013B8
	ldr r1, [r5]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08037F9C
	ldr r0, _08037F70 @ =sub_08037DC8
	bl sub_0803AF8C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _08037FA4
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	bl sub_08037530
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037F84
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08037F78
	ldr r0, _08037F74 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #3
	b _08037F8A
	.align 2, 0
_08037F6C: .4byte 0x030013B8
_08037F70: .4byte sub_08037DC8
_08037F74: .4byte 0x0203A8E8
_08037F78:
	ldr r0, _08037F80 @ =sub_08037E9C
	bl sub_08038A0C
	b _08037FA4
	.align 2, 0
_08037F80: .4byte sub_08037E9C
_08037F84:
	ldr r0, _08037F94 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #1
_08037F8A:
	strb r1, [r0]
	ldr r0, _08037F98 @ =0x030013B0
	strb r4, [r0]
	b _08037FA4
	.align 2, 0
_08037F94: .4byte 0x0203A8E8
_08037F98: .4byte 0x030013B0
_08037F9C:
	ldr r0, _08037FB0 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037FA4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037FB0: .4byte 0x0203A8E8

	thumb_func_start sub_08037FB4
sub_08037FB4: @ 0x08037FB4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037FE8 @ =0x030013B8
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	cmp r0, r2
	bhi _0803800C
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08037FF0
	ldr r4, _08037FEC @ =sub_08037DC8
	adds r0, r4, #0
	bl sub_0803AF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038014
	adds r0, r4, #0
	bl sub_08038A0C
	b _08038014
	.align 2, 0
_08037FE8: .4byte 0x030013B8
_08037FEC: .4byte sub_08037DC8
_08037FF0:
	ldr r0, _08038004 @ =sub_08037E54
	bl sub_0803AF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038014
	ldr r0, _08038008 @ =sub_08037E0C
	bl sub_08038A0C
	b _08038014
	.align 2, 0
_08038004: .4byte sub_08037E54
_08038008: .4byte sub_08037E0C
_0803800C:
	ldr r0, _08038020 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08038014:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038020: .4byte 0x0203A8E8

	thumb_func_start sub_08038024
sub_08038024: @ 0x08038024
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_0803802C
sub_0803802C: @ 0x0803802C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08038068 @ =0x030013B8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08038074
	ldr r0, _0803806C @ =0x0203A8E8
	adds r0, #0x7b
	movs r1, #2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r4, _08038070 @ =sub_08037DC8
	adds r0, r4, #0
	bl sub_0803AF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803807C
	adds r0, r4, #0
	bl sub_08038A0C
	b _0803807C
	.align 2, 0
_08038068: .4byte 0x030013B8
_0803806C: .4byte 0x0203A8E8
_08038070: .4byte sub_08037DC8
_08038074:
	ldr r0, _08038088 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803807C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038088: .4byte 0x0203A8E8

	thumb_func_start sub_0803808C
sub_0803808C: @ 0x0803808C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080380BC @ =0x030013B8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _080380C4
	ldr r4, _080380C0 @ =sub_08037EDC
	adds r0, r4, #0
	bl sub_0803AF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080380CC
	adds r0, r4, #0
	bl sub_08038A0C
	b _080380CC
	.align 2, 0
_080380BC: .4byte 0x030013B8
_080380C0: .4byte sub_08037EDC
_080380C4:
	ldr r0, _080380D8 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_080380CC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080380D8: .4byte 0x0203A8E8

	thumb_func_start sub_080380DC
sub_080380DC: @ 0x080380DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080380F4 @ =sub_08037DC8
	bl sub_0803AF8C
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080380F4: .4byte sub_08037DC8

	thumb_func_start sub_080380F8
sub_080380F8: @ 0x080380F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08038110 @ =sub_08037DC8
	bl sub_0803AF8C
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038110: .4byte sub_08037DC8

	thumb_func_start sub_08038114
sub_08038114: @ 0x08038114
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803812C @ =sub_08037DC8
	bl sub_0803AF8C
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803812C: .4byte sub_08037DC8

	thumb_func_start sub_08038130
sub_08038130: @ 0x08038130
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08038174 @ =0x030013B8
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl sub_08036FD8
	ldr r0, _08038178 @ =0x0203A978
	ldrb r1, [r0, #0xa]
	cmp r1, #1
	bne _0803816A
	ldr r2, [r4]
	ldrb r3, [r0, #2]
	ldrb r1, [r2, #1]
	cmp r3, r1
	bne _0803816A
	ldrb r0, [r0, #3]
	ldrb r2, [r2, #3]
	cmp r0, r2
	bne _0803816A
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803816A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038174: .4byte 0x030013B8
_08038178: .4byte 0x0203A978

	thumb_func_start sub_0803817C
sub_0803817C: @ 0x0803817C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _080381EC @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_08035D74
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08038220
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036FD8
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, _080381F0 @ =0x0203A978
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl sub_0803757C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08038226
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq _080381F8
	ldr r0, _080381F4 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b _08038226
	.align 2, 0
_080381EC: .4byte 0x030013B8
_080381F0: .4byte 0x0203A978
_080381F4: .4byte 0x0203A8E8
_080381F8:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_0803536C
	ldr r0, _08038218 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, _0803821C @ =0x030013B0
	strb r4, [r0]
	b _08038226
	.align 2, 0
_08038218: .4byte 0x0203A8E8
_0803821C: .4byte 0x030013B0
_08038220:
	ldr r1, _08038234 @ =0x030013B0
	movs r0, #0
	strb r0, [r1]
_08038226:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038234: .4byte 0x030013B0

	thumb_func_start sub_08038238
sub_08038238: @ 0x08038238
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_08038240
sub_08038240: @ 0x08038240
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, _08038280 @ =0x030013B8
	ldr r0, [r7]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_08035E64
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08038272
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r7]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036FD8
_08038272:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038280: .4byte 0x030013B8

	thumb_func_start sub_08038284
sub_08038284: @ 0x08038284
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl sub_0803BECC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080382D4
	ldr r3, _080382C8 @ =0x030013B8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _08038370
	ldr r2, _080382CC @ =gActiveUnit
	ldr r0, [r2]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08038370
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _080382D0 @ =0x030013B0
	movs r0, #0
	b _0803836E
	.align 2, 0
_080382C8: .4byte 0x030013B8
_080382CC: .4byte gActiveUnit
_080382D0: .4byte 0x030013B0
_080382D4:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl sub_08036ECC
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08038364
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
	ldr r4, _08038354 @ =0x0203A978
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_080375C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08038370
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl sub_08035328
	ldr r3, _08038358 @ =0x030013B8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _08038370
	ldr r2, _0803835C @ =gActiveUnit
	ldr r0, [r2]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08038370
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08038360 @ =0x030013B0
	strb r4, [r0]
	b _08038370
	.align 2, 0
_08038354: .4byte 0x0203A978
_08038358: .4byte 0x030013B8
_0803835C: .4byte gActiveUnit
_08038360: .4byte 0x030013B0
_08038364:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08038378 @ =0x030013B0
	movs r0, #0
_0803836E:
	strb r0, [r1]
_08038370:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038378: .4byte 0x030013B0

	thumb_func_start sub_0803837C
sub_0803837C: @ 0x0803837C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _080383BC @ =gActiveUnit
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl sub_08036DD8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080383AE
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0
	bl sub_08035328
_080383AE:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080383BC: .4byte gActiveUnit

	thumb_func_start sub_080383C0
sub_080383C0: @ 0x080383C0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _080383FC @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08038404
	ldr r0, _08038400 @ =sub_08037DC8
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_08035F10
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803842C
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036FD8
	b _0803842C
	.align 2, 0
_080383FC: .4byte 0x030013B8
_08038400: .4byte sub_08037DC8
_08038404:
	ldr r0, _0803843C @ =sub_08037E0C
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_08035F10
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803842C
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036FD8
_0803842C:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803843C: .4byte sub_08037E0C

	thumb_func_start sub_08038440
sub_08038440: @ 0x08038440
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803847C @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08038484
	ldr r0, _08038480 @ =sub_08037DC8
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_0803602C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _080384AC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_080371C4
	b _080384AC
	.align 2, 0
_0803847C: .4byte 0x030013B8
_08038480: .4byte sub_08037DC8
_08038484:
	ldr r0, _080384BC @ =sub_08037E0C
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_0803602C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _080384AC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_080371C4
_080384AC:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080384BC: .4byte sub_08037E0C

	thumb_func_start sub_080384C0
sub_080384C0: @ 0x080384C0
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080384C8
sub_080384C8: @ 0x080384C8
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080384D0
sub_080384D0: @ 0x080384D0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08036148
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080384E4
sub_080384E4: @ 0x080384E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08038504 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #8
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
	bl sub_08039D48
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038504: .4byte gActiveUnit

	thumb_func_start sub_08038508
sub_08038508: @ 0x08038508
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl sub_080397B8
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080397F8
	adds r4, r4, r0
	ldr r0, _08038550 @ =gBmMapMovement
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _08038554 @ =0x0202E3F0
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _08038558 @ =0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08038550: .4byte gBmMapMovement
_08038554: .4byte 0x0202E3F0
_08038558: .4byte 0x7FFFFFFF

	thumb_func_start sub_0803855C
sub_0803855C: @ 0x0803855C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r4, _080386A0 @ =gActiveUnit
	ldr r0, [r4]
	bl RevertMapChange
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	mov r8, r0
	cmp r0, #0
	beq _08038686
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	lsls r6, r6, #0x10
	str r6, [sp, #0x1c]
_0803859A:
	ldr r0, _080386A0 @ =gActiveUnit
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov sb, r1
	cmp r0, #0
	beq _0803866C
	ldr r0, _080386A4 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	mov r0, r8
	bl sub_08017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl sub_0801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _080386A8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803866C
_080385EC:
	ldr r0, _080386A8 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _08038666
	lsls r7, r6, #2
_080385FE:
	ldr r0, _080386AC @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038660
	ldr r0, _080386A4 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08038660
	ldr r0, _080386B0 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803863A
	ldr r0, _080386B4 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _08038660
_0803863A:
	mov r0, r8
	bl GetItemMight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08038508
	adds r4, r4, r0
	ldr r1, [sp, #0x14]
	cmp r4, r1
	bls _08038660
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
_08038660:
	subs r5, #1
	cmp r5, #0
	bge _080385FE
_08038666:
	mov r6, sl
	cmp r6, #0
	bge _080385EC
_0803866C:
	mov r1, sb
	str r1, [sp, #8]
	cmp r1, #4
	bgt _08038686
	ldr r0, _080386A0 @ =gActiveUnit
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _0803859A
_08038686:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _080386B8
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
	b _080386BA
	.align 2, 0
_080386A0: .4byte gActiveUnit
_080386A4: .4byte 0x0202E3E4
_080386A8: .4byte gBmMapSize
_080386AC: .4byte gBmMapMovement
_080386B0: .4byte gBmMapUnit
_080386B4: .4byte gActiveUnitId
_080386B8:
	movs r0, #0
_080386BA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080386CC
sub_080386CC: @ 0x080386CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov sb, r0
	ldr r0, _080387A8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803879E
_080386EE:
	ldr r0, _080387A8 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _08038798
	lsls r6, r5, #2
_08038700:
	ldr r0, _080387AC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038792
	ldr r0, _080387B0 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_08036300
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038792
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08038758
	ldr r0, _080387B4 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08038758
	ldr r0, _080387B8 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038792
_08038758:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08038772
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_080369EC
	cmp r0, #0
	bne _08038792
_08038772:
	ldr r0, _080387AC @ =0x0202E3E4
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	ble _08038792
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_08038792:
	subs r4, #1
	cmp r4, #0
	bge _08038700
_08038798:
	mov r5, sl
	cmp r5, #0
	bge _080386EE
_0803879E:
	mov r0, sb
	cmp r0, #0xff
	bne _080387BC
	movs r0, #0
	b _080387BE
	.align 2, 0
_080387A8: .4byte gBmMapSize
_080387AC: .4byte 0x0202E3E4
_080387B0: .4byte gBmMapTerrain
_080387B4: .4byte gBmMapUnit
_080387B8: .4byte gActiveUnit
_080387BC:
	movs r0, #1
_080387BE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080387D0
sub_080387D0: @ 0x080387D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _08038854 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_0803C50C
	ldr r0, _08038858 @ =0x08C06398
	add r4, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl sub_080386CC
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _08038870
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	add r5, sp, #0x14
	adds r2, r5, #0
	add r3, sp, #0xc
	bl sub_0803855C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803885C
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl GetTrapAt
	cmp r0, #0
	bne _0803882E
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r1, #1
	bl GetTrapAt
	cmp r0, #0
	beq _08038884
_0803882E:
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	ldrb r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0
	bl sub_08035328
	b _0803887E
	.align 2, 0
_08038854: .4byte gActiveUnit
_08038858: .4byte 0x08C06398
_0803885C:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
	b _0803887E
_08038870:
	ldr r0, _0803888C @ =0x0203A8E8
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _08038890 @ =0x030013B0
	strb r2, [r0]
_0803887E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_08038884:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803888C: .4byte 0x0203A8E8
_08038890: .4byte 0x030013B0

	thumb_func_start sub_08038894
sub_08038894: @ 0x08038894
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080388E4 @ =gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801A030
	ldr r6, _080388E8 @ =0x030013B8
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl sub_0803631C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _080388EC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036FD8
	b _080388FA
	.align 2, 0
_080388E4: .4byte gActiveUnit
_080388E8: .4byte 0x030013B8
_080388EC:
	ldr r0, _08038908 @ =0x0203A8E8
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803890C @ =0x030013B0
	strb r2, [r0]
_080388FA:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038908: .4byte 0x0203A8E8
_0803890C: .4byte 0x030013B0

	thumb_func_start sub_08038910
sub_08038910: @ 0x08038910
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _08038960 @ =gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801A030
	ldr r6, _08038964 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl sub_0803631C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08038968
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036FD8
	b _08038976
	.align 2, 0
_08038960: .4byte gActiveUnit
_08038964: .4byte 0x030013B8
_08038968:
	ldr r0, _08038984 @ =0x0203A8E8
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _08038988 @ =0x030013B0
	strb r2, [r0]
_08038976:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038984: .4byte 0x0203A8E8
_08038988: .4byte 0x030013B0

	thumb_func_start sub_0803898C
sub_0803898C: @ 0x0803898C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0803899C @ =0x030013B0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803899C: .4byte 0x030013B0

	thumb_func_start sub_080389A0
sub_080389A0: @ 0x080389A0
	push {lr}
	ldr r0, _080389B8 @ =sub_08037DC8
	bl sub_0803AF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080389B4
	ldr r0, _080389BC @ =sub_08037DF8
	bl sub_08038A0C
_080389B4:
	pop {r0}
	bx r0
	.align 2, 0
_080389B8: .4byte sub_08037DC8
_080389BC: .4byte sub_08037DF8

	thumb_func_start sub_080389C0
sub_080389C0: @ 0x080389C0
	push {r4, lr}
	sub sp, #8
	ldr r0, _080389F4 @ =sub_08037DF8
	add r4, sp, #4
	adds r1, r4, #0
	bl sub_08035F10
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _080389EA
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
_080389EA:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080389F4: .4byte sub_08037DF8

	thumb_func_start sub_080389F8
sub_080389F8: @ 0x080389F8
	movs r0, #1
	bx lr

	thumb_func_start sub_080389FC
sub_080389FC: @ 0x080389FC
	push {lr}
	ldrb r0, [r0]
	bl sub_080374F8
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08038A0C
sub_08038A0C: @ 0x08038A0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	movs r5, #0
	strb r5, [r0, #2]
	str r5, [r0, #8]
	ldr r6, _08038A74 @ =gActiveUnit
	ldr r3, [r6]
	ldr r1, [r3, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	cmp r1, #0
	beq _08038A7C
	ldr r4, _08038A78 @ =gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08034B70
	cmp r0, #0
	beq _08038A6A
	b _08038BD2
_08038A6A:
	ldr r0, [r6]
	bl sub_08034C80
	b _08038B12
	.align 2, 0
_08038A74: .4byte gActiveUnit
_08038A78: .4byte gBmMapMovement
_08038A7C:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08038AB2
	adds r0, r3, #0
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08038AB2
	ldr r0, [r6]
	bl RevertMapChange
	bl sub_0801A4DC
	bl sub_080390F8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08038AB2
	movs r0, #0
	b _08038C46
_08038AB2:
	ldr r1, _08038AE8 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08038AF4
	ldr r4, _08038AEC @ =gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08038AF0 @ =gActiveUnit
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _08038AFC
	.align 2, 0
_08038AE8: .4byte 0x0203A8E8
_08038AEC: .4byte gBmMapMovement
_08038AF0: .4byte gActiveUnit
_08038AF4:
	ldr r0, _08038C58 @ =gActiveUnit
	ldr r0, [r0]
	bl RevertMapChange
_08038AFC:
	ldr r0, _08038C58 @ =gActiveUnit
	ldr r0, [r0]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038B12
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
_08038B12:
	ldr r0, _08038C5C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0
	mov r8, r0
	ldr r1, _08038C58 @ =gActiveUnit
	ldr r0, [r1]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08038BD2
	mov sl, r1
	add r1, sp, #0xc
	mov sb, r1
_08038B2E:
	mov r2, sl
	ldr r0, [r2]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	mov r7, r8
	adds r7, #1
	cmp r0, #0
	beq _08038BBC
	mov r4, r8
	mov r3, sb
	strh r4, [r3, #4]
	movs r6, #1
_08038B4A:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08038BB6
	ldr r0, [r4]
	cmp r0, #0
	beq _08038BB6
	ldr r0, [r4, #0xc]
	ldr r1, _08038C60 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08038BB6
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BB6
	mov r2, sl
	ldr r0, [r2]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08036228
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BB6
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08038E18
	ldrb r0, [r4, #0xb]
	mov r3, sb
	strb r0, [r3, #2]
	add r0, sp, #0xc
	bl sub_08039258
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BB6
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blo _08038BB6
	add r1, sp, #0x18
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, r8
	mov r4, sp
	strh r0, [r4, #0x1c]
_08038BB6:
	adds r6, #1
	cmp r6, #0xbf
	ble _08038B4A
_08038BBC:
	mov r8, r7
	cmp r7, #4
	bgt _08038BD2
	mov r1, sl
	ldr r0, [r1]
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	bne _08038B2E
_08038BD2:
	ldr r0, _08038C58 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08038C08
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl sub_08038F30
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08038C08
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blo _08038C08
	add r1, sp, #0x18
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
_08038C08:
	add r1, sp, #0x18
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08038C16
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08038C46
_08038C16:
	mov r1, sp
	ldrb r0, [r1, #0x18]
	ldrb r1, [r1, #0x19]
	mov r2, sp
	ldrb r3, [r2, #0x1a]
	ldrb r2, [r2, #0x1c]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl sub_08035328
	mov r3, sp
	movs r1, #0x1c
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08038C46
	ldr r0, _08038C58 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08034C80
_08038C46:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038C58: .4byte gActiveUnit
_08038C5C: .4byte 0x0202E3E4
_08038C60: .4byte 0x00010025

	thumb_func_start sub_08038C64
sub_08038C64: @ 0x08038C64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #0x24]
	add r2, sp, #0x18
	movs r5, #0
	strb r5, [r2, #2]
	str r5, [r2, #8]
	ldr r6, _08038E08 @ =gActiveUnit
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08038CC8
	ldr r4, _08038E0C @ =gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08034B70
	cmp r0, #0
	bne _08038D86
	ldr r0, [r6]
	bl sub_08034C80
_08038CC8:
	ldr r0, _08038E10 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0
	mov sb, r0
	ldr r0, [r6]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08038D86
	add r1, sp, #0xc
	mov sl, r1
_08038CE0:
	ldr r2, _08038E08 @ =gActiveUnit
	ldr r0, [r2]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	mov r7, sb
	adds r7, #1
	cmp r0, #0
	beq _08038D70
	mov r4, sb
	mov r3, sl
	strh r4, [r3, #4]
	movs r6, #1
_08038CFC:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08038D6A
	ldr r0, [r4]
	cmp r0, #0
	beq _08038D6A
	ldr r0, [r4, #0xc]
	ldr r1, _08038E14 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08038D6A
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D6A
	ldr r2, _08038E08 @ =gActiveUnit
	ldr r0, [r2]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08036228
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D6A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08038E18
	ldrb r0, [r4, #0xb]
	mov r3, sl
	strb r0, [r3, #2]
	add r0, sp, #0xc
	bl sub_08039258
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D6A
	ldr r1, [sp, #0x14]
	mov r4, r8
	ldr r0, [r4, #8]
	cmp r1, r0
	blo _08038D6A
	mov r1, r8
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	mov r0, r8
	strh r1, [r0, #4]
_08038D6A:
	adds r6, #1
	cmp r6, #0xbf
	ble _08038CFC
_08038D70:
	mov sb, r7
	cmp r7, #4
	bgt _08038D86
	ldr r2, _08038E08 @ =gActiveUnit
	ldr r0, [r2]
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	bne _08038CE0
_08038D86:
	ldr r0, _08038E08 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08038DBE
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl sub_08038F30
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08038DBE
	ldr r1, [sp, #0x14]
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r1, r0
	blo _08038DBE
	mov r1, r8
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
_08038DBE:
	mov r1, r8
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08038DCC
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08038DF8
_08038DCC:
	mov r4, r8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl sub_08035328
	movs r1, #4
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08038DF8
	ldr r0, _08038E08 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08034C80
_08038DF8:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038E08: .4byte gActiveUnit
_08038E0C: .4byte gBmMapMovement
_08038E10: .4byte 0x0202E3E4
_08038E14: .4byte 0x00010025

	thumb_func_start sub_08038E18
sub_08038E18: @ 0x08038E18
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08038E68 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r6, #0x10
	ldrsb r6, [r4, r6]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	adds r0, r5, #0
	bl sub_08017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl sub_0801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl MapAddInBoundedRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08038E68: .4byte 0x0202E3E4

	thumb_func_start sub_08038E6C
sub_08038E6C: @ 0x08038E6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _08038F24 @ =gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl sub_0801A0E0
	ldr r0, _08038F28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08038F2C @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08038F16
_08038EBC:
	ldr r0, _08038F2C @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sb, r0
	cmp r6, #0
	blt _08038F10
	lsls r1, r7, #0x10
	mov r8, r1
_08038ED0:
	ldr r0, _08038F24 @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038F0A
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	bl sub_08017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	bl sub_0801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_08038F0A:
	subs r6, #1
	cmp r6, #0
	bge _08038ED0
_08038F10:
	mov r7, sb
	cmp r7, #0
	bge _08038EBC
_08038F16:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038F24: .4byte gBmMapMovement
_08038F28: .4byte 0x0202E3E4
_08038F2C: .4byte gBmMapSize

	thumb_func_start sub_08038F30
sub_08038F30: @ 0x08038F30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	mov r8, r1
	movs r0, #0
	mov sl, r0
	add r4, sp, #0xc
	ldr r1, _08038FA4 @ =0x081D93F8
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	ldr r0, _08038FA8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08038FCC
_08038F5C:
	ldr r0, _08038FA8 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r3, r7, #1
	mov sb, r3
	cmp r4, #0
	blt _08038FC6
	ldr r2, _08038FAC @ =gBmMapMovement
	lsls r6, r7, #2
_08038F70:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038FC0
	adds r0, r4, #0
	adds r1, r7, #0
	str r2, [sp, #0x14]
	bl GetBallistaItemAt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x14]
	cmp r5, #0
	beq _08038FB0
	movs r0, #1
	add sl, r0
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	b _08038FC0
	.align 2, 0
_08038FA4: .4byte 0x081D93F8
_08038FA8: .4byte gBmMapSize
_08038FAC: .4byte gBmMapMovement
_08038FB0:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
_08038FC0:
	subs r4, #1
	cmp r4, #0
	bge _08038F70
_08038FC6:
	mov r7, sb
	cmp r7, #0
	bge _08038F5C
_08038FCC:
	mov r0, sl
	cmp r0, #0
	beq _0803908C
	movs r0, #0
	mov r1, r8
	strb r0, [r1, #2]
	str r0, [r1, #8]
	movs r1, #0
	mov r6, sp
_08038FDE:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r5, [r0]
	ldr r0, _08039080 @ =0x0000FFFF
	mov r2, r8
	strh r0, [r2, #4]
	movs r7, #1
	adds r1, #1
	mov sb, r1
_08038FF2:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08039060
	ldr r0, [r4]
	cmp r0, #0
	beq _08039060
	ldr r0, [r4, #0xc]
	ldr r1, _08039084 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08039060
	adds r0, r4, #0
	ldr r3, [sp, #0x10]
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039060
	ldr r0, _08039088 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08036228
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039060
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08038E18
	ldrb r0, [r4, #0xb]
	strb r0, [r6, #2]
	mov r0, sp
	adds r1, r5, #0
	bl sub_08039318
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039060
	ldr r1, [sp, #8]
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r1, r0
	blo _08039060
	ldrb r0, [r6]
	strb r0, [r2]
	ldrb r0, [r6, #1]
	strb r0, [r2, #1]
	ldrb r0, [r6, #2]
	strb r0, [r2, #2]
	str r1, [r2, #8]
_08039060:
	adds r7, #1
	cmp r7, #0xbf
	ble _08038FF2
	mov r1, sb
	cmp r1, #2
	ble _08038FDE
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _0803907A
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _0803908C
_0803907A:
	movs r0, #1
	b _0803908E
	.align 2, 0
_08039080: .4byte 0x0000FFFF
_08039084: .4byte 0x00010025
_08039088: .4byte gActiveUnit
_0803908C:
	movs r0, #0
_0803908E:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080390A0
sub_080390A0: @ 0x080390A0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _080390D8 @ =gBmMapMovement
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _080390D4
	ldr r0, _080390DC @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _080390E4
	ldr r0, _080390E0 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq _080390E4
_080390D4:
	movs r0, #0xff
	b _080390F0
	.align 2, 0
_080390D8: .4byte gBmMapMovement
_080390DC: .4byte gBmMapUnit
_080390E0: .4byte gActiveUnitId
_080390E4:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_080390F0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080390F8
sub_080390F8: @ 0x080390F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0xff
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	ldr r0, _0803911C @ =gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r0, #1
	b _080391F4
	.align 2, 0
_0803911C: .4byte gBmMapSize
_08039120:
	ldr r0, _08039204 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	mov r2, r8
	subs r2, #1
	str r2, [sp, #0x20]
	cmp r5, #0
	blt _080391F2
	mov r3, r8
	lsls r7, r3, #2
_08039136:
	ldr r0, _08039208 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080391EC
	ldr r0, _0803920C @ =gBmMapUnit
	mov sl, r0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _080391EC
	ldr r0, _08039210 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080391EC
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, r8
	ldr r2, _08039214 @ =sub_080390A0
	add r3, sp, #0xc
	bl sub_08036CE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080391EC
	mov r2, sl
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _08039218 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _080391EC
	adds r0, r4, #0
	bl sub_08036D98
	lsls r6, r0, #0x18
	asrs r1, r6, #0x18
	cmp r1, #0
	blt _080391EC
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_08036D64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r3, r0
	blo _080391EC
	str r0, [sp, #0x14]
	add r1, sp, #0xc
	ldr r2, [sp, #0x1c]
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	ldrh r1, [r1]
	orrs r1, r0
	mov sb, r1
	mov r3, sl
	ldr r0, [r3]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
_080391EC:
	subs r5, #1
	cmp r5, #0
	bge _08039136
_080391F2:
	ldr r0, [sp, #0x20]
_080391F4:
	mov r8, r0
	cmp r0, #0
	bge _08039120
	ldr r1, [sp, #0x14]
	cmp r1, #0xff
	bne _0803921C
	movs r0, #0
	b _08039244
	.align 2, 0
_08039204: .4byte gBmMapSize
_08039208: .4byte gBmMapMovement
_0803920C: .4byte gBmMapUnit
_08039210: .4byte gActiveUnitId
_08039214: .4byte sub_080390A0
_08039218: .4byte gActiveUnit
_0803921C:
	ldr r0, _08039254 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	asrs r1, r3, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #3
	ldr r3, [sp, #0x18]
	bl sub_08035328
	movs r0, #1
_08039244:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039254: .4byte gActiveUnit

	thumb_func_start sub_08039258
sub_08039258: @ 0x08039258
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r3, #0
	ldr r0, _080392F4 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080392E2
_08039270:
	ldr r0, _080392F4 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _080392DC
	lsls r6, r5, #2
_08039282:
	ldr r0, _080392F8 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080392D6
	ldr r0, _080392FC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080392D6
	ldr r0, _08039300 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _080392BE
	ldr r0, _08039304 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _080392D6
_080392BE:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl sub_080393EC
	ldr r3, [sp]
	cmp r0, r3
	bls _080392D6
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_080392D6:
	subs r4, #1
	cmp r4, #0
	bge _08039282
_080392DC:
	mov r5, r8
	cmp r5, #0
	bge _08039270
_080392E2:
	cmp r3, #0
	beq _08039308
	adds r0, r7, #0
	bl sub_08039458
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803930A
	.align 2, 0
_080392F4: .4byte gBmMapSize
_080392F8: .4byte gBmMapMovement
_080392FC: .4byte 0x0202E3E4
_08039300: .4byte gBmMapUnit
_08039304: .4byte gActiveUnitId
_08039308:
	movs r0, #0
_0803930A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08039318
sub_08039318: @ 0x08039318
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r3, #0
	ldr r0, _080393C8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080393B8
_08039338:
	ldr r0, _080393C8 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _080393B2
	lsls r6, r5, #2
_0803934A:
	ldr r0, _080393CC @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0x78
	bhi _080393AC
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _080393AC
	ldr r0, _080393D0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080393AC
	ldr r0, _080393D4 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _08039394
	ldr r0, _080393D8 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _080393AC
_08039394:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl sub_080393EC
	ldr r3, [sp]
	cmp r0, r3
	bls _080393AC
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_080393AC:
	subs r4, #1
	cmp r4, #0
	bge _0803934A
_080393B2:
	mov r5, r8
	cmp r5, #0
	bge _08039338
_080393B8:
	cmp r3, #0
	beq _080393DC
	adds r0, r7, #0
	bl sub_08039458
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080393DE
	.align 2, 0
_080393C8: .4byte gBmMapSize
_080393CC: .4byte gBmMapMovement
_080393D0: .4byte 0x0202E3E4
_080393D4: .4byte gBmMapUnit
_080393D8: .4byte gActiveUnitId
_080393DC:
	movs r0, #0
_080393DE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080393EC
sub_080393EC: @ 0x080393EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldrb r0, [r2, #2]
	bl GetUnit
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08039768
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080397B8
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080397F8
	adds r4, r4, r0
	ldr r0, _08039448 @ =gBmMapMovement
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _0803944C @ =0x0202E3F0
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _08039450 @ =0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08039448: .4byte gBmMapMovement
_0803944C: .4byte 0x0202E3F0
_08039450: .4byte 0x7FFFFFFF

	thumb_func_start sub_08039454
sub_08039454: @ 0x08039454
	movs r0, #0
	bx lr

	thumb_func_start sub_08039458
sub_08039458: @ 0x08039458
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08039480 @ =0x0000FFFF
	ldrh r1, [r5, #4]
	cmp r1, r0
	beq _08039488
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, _08039484 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl BattleGenerateSimulation
	b _0803949E
	.align 2, 0
_08039480: .4byte 0x0000FFFF
_08039484: .4byte gActiveUnit
_08039488:
	ldr r0, _080394B0 @ =gActiveUnit
	ldr r4, [r0]
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	adds r0, r4, #0
	bl BattleGenerateBallistaSimulation
_0803949E:
	adds r0, r5, #0
	bl sub_08039454
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080394B4
	movs r0, #0
	b _080394BC
	.align 2, 0
_080394B0: .4byte gActiveUnit
_080394B4:
	adds r0, r5, #0
	bl sub_080396F4
	movs r0, #1
_080394BC:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080394C4
sub_080394C4: @ 0x080394C4
	push {r4, lr}
	ldr r3, _080394D4 @ =gBattleTarget
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080394D8
	movs r0, #0x32
	b _08039516
	.align 2, 0
_080394D4: .4byte gBattleTarget
_080394D8:
	ldr r1, _0803951C @ =gBattleActor
	adds r0, r1, #0
	adds r0, #0x5a
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r2, r2, r0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r2, #0
	muls r1, r0, r1
	cmp r1, #0
	bge _080394FC
	movs r1, #0
_080394FC:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _08039520 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _08039514
	movs r1, #0x28
_08039514:
	adds r0, r1, #0
_08039516:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803951C: .4byte gBattleActor
_08039520: .4byte 0x030013C0

	thumb_func_start sub_08039524
sub_08039524: @ 0x08039524
	ldr r0, _08039540 @ =gBattleTarget
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _08039544 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803953C
	movs r1, #0
_0803953C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08039540: .4byte gBattleTarget
_08039544: .4byte 0x030013C0

	thumb_func_start sub_08039548
sub_08039548: @ 0x08039548
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r4, _080395D8 @ =0x08C07CBC
	ldrb r2, [r4]
	cmp r2, #0x7f
	beq _080395BC
	ldr r0, _080395DC @ =gBattleActor
	mov sb, r0
	ldr r1, _080395E0 @ =gBmMapSize
	mov r8, r1
_08039562:
	mov r3, sb
	ldrb r3, [r3, #0x10]
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r6, sb
	ldrb r6, [r6, #0x11]
	ldrb r7, [r4, #1]
	adds r0, r6, r7
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080395E4 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r6, r8
	movs r7, #0
	ldrsh r0, [r6, r7]
	cmp r2, r0
	bge _080395B4
	movs r2, #2
	ldrsh r0, [r6, r2]
	cmp r3, r0
	bge _080395B4
	cmp r1, #0
	beq _080395B4
	mov r3, sb
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080395B4
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
_080395B4:
	adds r4, #4
	ldrb r2, [r4]
	cmp r2, #0x7f
	bne _08039562
_080395BC:
	ldr r0, _080395E8 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	muls r5, r0, r5
	cmp r5, #0xa
	ble _080395CA
	movs r5, #0xa
_080395CA:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080395D8: .4byte 0x08C07CBC
_080395DC: .4byte gBattleActor
_080395E0: .4byte gBmMapSize
_080395E4: .4byte gBmMapUnit
_080395E8: .4byte 0x030013C0

	thumb_func_start sub_080395EC
sub_080395EC: @ 0x080395EC
	push {lr}
	ldr r0, _08039618 @ =gBattleTarget
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	bl sub_080374F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803961C @ =0x030013C0
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r1, r1, r0
	ldrb r2, [r2, #3]
	ldrb r1, [r1]
	adds r0, r2, #0
	muls r0, r1, r0
	cmp r0, #0x14
	ble _08039614
	movs r0, #0x14
_08039614:
	pop {r1}
	bx r1
	.align 2, 0
_08039618: .4byte gBattleTarget
_0803961C: .4byte 0x030013C0

	thumb_func_start sub_08039620
sub_08039620: @ 0x08039620
	ldr r1, _08039630 @ =gPlaySt
	ldr r0, _08039634 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrh r1, [r1, #0x10]
	muls r0, r1, r0
	bx lr
	.align 2, 0
_08039630: .4byte gPlaySt
_08039634: .4byte 0x030013C0

	thumb_func_start sub_08039638
sub_08039638: @ 0x08039638
	push {lr}
	ldr r2, _0803964C @ =gBattleTarget
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08039650
	movs r0, #0xa
	rsbs r0, r0, #0
	b _0803968C
	.align 2, 0
_0803964C: .4byte gBattleTarget
_08039650:
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08039690 @ =gBattleActor
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	cmp r1, #0
	bge _08039672
	movs r1, #0
_08039672:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _08039694 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _0803968A
	movs r1, #0x28
_0803968A:
	adds r0, r1, #0
_0803968C:
	pop {r1}
	bx r1
	.align 2, 0
_08039690: .4byte gBattleActor
_08039694: .4byte 0x030013C0

	thumb_func_start sub_08039698
sub_08039698: @ 0x08039698
	ldr r2, _080396C4 @ =gBattleActor
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _080396C8 @ =0x0202E3F0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, #3
	ldr r0, _080396CC @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	muls r1, r0, r1
	cmp r1, #0x14
	ble _080396C0
	movs r1, #0x14
_080396C0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080396C4: .4byte gBattleActor
_080396C8: .4byte 0x0202E3F0
_080396CC: .4byte 0x030013C0

	thumb_func_start sub_080396D0
sub_080396D0: @ 0x080396D0
	ldr r0, _080396EC @ =gBattleActor
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _080396F0 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	muls r1, r0, r1
	cmp r1, #0
	bge _080396E8
	movs r1, #0
_080396E8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080396EC: .4byte gBattleActor
_080396F0: .4byte 0x030013C0

	thumb_func_start sub_080396F4
sub_080396F4: @ 0x080396F4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08039750 @ =0x030013C0
	ldr r1, _08039754 @ =0x0203A8E8
	adds r1, #0x7d
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _08039758 @ =0x081D8F88
	adds r0, r0, r1
	str r0, [r2]
	bl sub_080394C4
	adds r4, r0, #0
	adds r5, r4, #0
	bl sub_08039524
	adds r4, r4, r0
	bl sub_08039548
	adds r4, r4, r0
	bl sub_080395EC
	adds r4, r4, r0
	bl sub_08039620
	adds r4, r4, r0
	bl sub_08039638
	subs r4, r4, r0
	bl sub_08039698
	subs r4, r4, r0
	bl sub_080396D0
	subs r4, r4, r0
	cmp r4, #0
	bge _08039744
	movs r4, #0
_08039744:
	cmp r4, #0
	beq _0803975C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #3
	b _0803975E
	.align 2, 0
_08039750: .4byte 0x030013C0
_08039754: .4byte 0x0203A8E8
_08039758: .4byte 0x081D8F88
_0803975C:
	adds r4, r5, #0
_0803975E:
	str r4, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08039768
sub_08039768: @ 0x08039768
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	subs r3, r4, r0
	cmp r3, #0
	bge _08039776
	subs r3, r0, r4
_08039776:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	subs r4, r0, r1
	cmp r4, #0
	blt _08039784
	adds r5, r3, r4
	b _08039788
_08039784:
	subs r0, r1, r0
	adds r5, r3, r0
_08039788:
	adds r0, r2, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080397AE
	adds r0, r4, #0
	bl sub_0801778C
	cmp r5, r0
	bgt _080397AA
	adds r0, r4, #0
	bl sub_08017774
	cmp r5, r0
	bge _080397AE
_080397AA:
	movs r0, #0x32
	b _080397B0
_080397AE:
	movs r0, #0
_080397B0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080397B8
sub_080397B8: @ 0x080397B8
	ldr r2, _080397F0 @ =gBmMapTerrain
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r3, [r1]
	ldr r0, _080397F4 @ =gActiveUnit
	ldr r0, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r2, #0x44]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x48]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldr r1, [r2, #0x4c]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080397F0: .4byte gBmMapTerrain
_080397F4: .4byte gActiveUnit

	thumb_func_start sub_080397F8
sub_080397F8: @ 0x080397F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r4, _08039848 @ =0x08C07D20
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _0803984C @ =0x0000270F
	cmp r0, r1
	beq _08039864
	mov r8, r1
_08039812:
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, r6, r0
	ldr r1, _08039850 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r7, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803985A
	ldr r0, _08039854 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039858
	adds r5, #5
	b _0803985A
	.align 2, 0
_08039848: .4byte 0x08C07D20
_0803984C: .4byte 0x0000270F
_08039850: .4byte gBmMapUnit
_08039854: .4byte gActiveUnitId
_08039858:
	subs r5, #5
_0803985A:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	bne _08039812
_08039864:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08039870
sub_08039870: @ 0x08039870
	push {lr}
	ldr r0, _08039894 @ =0x0203A8E8
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne _08039890
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08039898 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	bl sub_0803989C
_08039890:
	pop {r0}
	bx r0
	.align 2, 0
_08039894: .4byte 0x0203A8E8
_08039898: .4byte 0x0202E3F0

	thumb_func_start sub_0803989C
sub_0803989C: @ 0x0803989C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	mov sb, r0
	movs r4, #1
_080398AE:
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r4, #1
	mov sl, r4
	cmp r6, #0
	beq _08039998
	ldr r0, [r6]
	cmp r0, #0
	beq _08039998
	ldr r0, [r6, #0xc]
	ldr r1, _080399AC @ =0x0001000D
	ands r0, r1
	cmp r0, #0
	bne _08039998
	ldr r0, _080399B0 @ =gActiveUnitId
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039998
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _08039922
_080398E8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803990E
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, sb
	ble _0803990E
	mov r8, r4
	mov r0, r8
	bl GetItemMight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0803990E:
	adds r5, #1
	cmp r5, #4
	bgt _08039922
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080398E8
_08039922:
	mov r1, r8
	cmp r1, #0
	beq _08039998
	ldr r0, _080399B4 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r6, #0
	mov r2, r8
	bl sub_0803627C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039998
	adds r0, r6, #0
	mov r1, r8
	bl sub_08036B28
	ldr r0, _080399B8 @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r1, r0, #1
	cmp r1, #0
	blt _08039998
_0803994E:
	ldr r0, _080399B8 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _08039992
	lsls r5, r1, #2
_0803995E:
	ldr r0, _080399BC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803998C
	adds r0, r6, #0
	bl GetUnitPower
	ldr r1, _080399C0 @ =0x0202E3F0
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	add r0, sb
	asrs r0, r0, #1
	ldrb r2, [r1]
	adds r0, r2, r0
	strb r0, [r1]
_0803998C:
	subs r4, #1
	cmp r4, #0
	bge _0803995E
_08039992:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803994E
_08039998:
	mov r4, sl
	cmp r4, #0xbf
	ble _080398AE
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080399AC: .4byte 0x0001000D
_080399B0: .4byte gActiveUnitId
_080399B4: .4byte gActiveUnit
_080399B8: .4byte gBmMapSize
_080399BC: .4byte 0x0202E3E4
_080399C0: .4byte 0x0202E3F0

	thumb_func_start sub_080399C4
sub_080399C4: @ 0x080399C4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _080399E0 @ =0x0202E3F0
	ldr r3, [r3]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, r2
	bhi _080399E4
	movs r0, #1
	b _080399E6
	.align 2, 0
_080399E0: .4byte 0x0202E3F0
_080399E4:
	movs r0, #0
_080399E6:
	bx lr

	thumb_func_start sub_080399E8
sub_080399E8: @ 0x080399E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _08039AAC @ =0x00002710
	str r0, [sp]
	movs r1, #0xff
	mov sb, r1
	ldr r0, _08039AB0 @ =gActiveUnit
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08039A16
	b _08039BA4
_08039A16:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08039A28
	b _08039BA4
_08039A28:
	adds r0, r2, #0
	movs r1, #0x7c
	bl sub_08019FC0
	ldr r0, _08039AB4 @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _08039A3E
	b _08039B5A
_08039A3E:
	ldr r0, _08039AB4 @ =gBmMapSize
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r4, #0
	bge _08039A50
	b _08039B52
_08039A50:
	lsls r5, r7, #2
_08039A52:
	ldr r0, _08039AB8 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08039B4A
	ldr r0, _08039ABC @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, _08039AC0 @ =0x08C07D84
	bl sub_08036300
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039ACC
	ldr r6, _08039AC4 @ =gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039B4A
	ldr r0, _08039AC8 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039B4A
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	b _08039B0E
	.align 2, 0
_08039AAC: .4byte 0x00002710
_08039AB0: .4byte gActiveUnit
_08039AB4: .4byte gBmMapSize
_08039AB8: .4byte gBmMapMovement
_08039ABC: .4byte gBmMapTerrain
_08039AC0: .4byte 0x08C07D84
_08039AC4: .4byte gBmMapUnit
_08039AC8: .4byte gActiveUnitId
_08039ACC:
	ldr r6, _08039B98 @ =gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039B18
	ldr r0, _08039B9C @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039B4A
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08039B18
_08039B0E:
	movs r0, #4
	ldrb r2, [r2, #0xa]
	ands r0, r2
	cmp r0, #0
	beq _08039B4A
_08039B18:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_080369EC
	adds r2, r0, #0
	ldr r0, [sp]
	cmp r2, r0
	bgt _08039B4A
	ldr r0, _08039BA0 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, sb
	bgt _08039B4A
	str r2, [sp]
	ldrb r1, [r1]
	mov sb, r1
	mov r1, r8
	strh r4, [r1]
	strh r7, [r1, #2]
_08039B4A:
	subs r4, #1
	cmp r4, #0
	blt _08039B52
	b _08039A52
_08039B52:
	mov r7, sl
	cmp r7, #0
	blt _08039B5A
	b _08039A3E
_08039B5A:
	mov r2, sb
	cmp r2, #0xff
	beq _08039BA4
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _08039B98 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _08039B94
	ldr r0, _08039B9C @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _08039B94
	adds r0, r1, #0
	bl GetUnit
	adds r2, r0, #0
	movs r0, #2
	ldrb r3, [r2, #0xa]
	orrs r0, r3
	strb r0, [r2, #0xa]
_08039B94:
	movs r0, #1
	b _08039BA6
	.align 2, 0
_08039B98: .4byte gBmMapUnit
_08039B9C: .4byte gActiveUnitId
_08039BA0: .4byte gBmMapMovement
_08039BA4:
	movs r0, #0
_08039BA6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08039BB8
sub_08039BB8: @ 0x08039BB8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _08039C08 @ =gPlaySt
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _08039C0C @ =0x081D93FC
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08039BFE
	adds r6, r1, #0
	adds r4, r2, #1
_08039BDC:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08039BF4
	ldr r0, [r1]
	cmp r0, #0
	beq _08039BF4
	adds r0, r1, #0
	bl sub_08039C10
_08039BF4:
	adds r4, #1
	adds r5, #1
	ldr r0, [r6]
	cmp r5, r0
	blt _08039BDC
_08039BFE:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039C08: .4byte gPlaySt
_08039C0C: .4byte 0x081D93FC

	thumb_func_start sub_08039C10
sub_08039C10: @ 0x08039C10
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r3, [r5, #0xa]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08039C60
	ldr r2, _08039C5C @ =0x08C06550
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #7
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r4
	bhi _08039C86
	movs r0, #0xfe
	ands r0, r3
	strb r0, [r5, #0xa]
	movs r0, #0
	b _08039C88
	.align 2, 0
_08039C5C: .4byte 0x08C06550
_08039C60:
	ldr r2, _08039C7C @ =0x08C06550
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #7
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, r4
	bhi _08039C80
	movs r0, #0
	b _08039C88
	.align 2, 0
_08039C7C: .4byte 0x08C06550
_08039C80:
	movs r0, #1
	orrs r0, r3
	strb r0, [r5, #0xa]
_08039C86:
	movs r0, #1
_08039C88:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08039C90
sub_08039C90: @ 0x08039C90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	ldr r7, _08039D0C @ =gActiveUnit
_08039C98:
	ldr r0, [r7]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	beq _08039D3E
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6b
	beq _08039CBC
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6c
	bne _08039D38
_08039CBC:
	ldr r1, _08039D10 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08039D14
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08039D14
	add r5, sp, #0xc
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_08036DD8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039D38
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	b _08039D2C
	.align 2, 0
_08039D0C: .4byte gActiveUnit
_08039D10: .4byte 0x0203A8E8
_08039D14:
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_08039D2C:
	movs r2, #6
	movs r3, #0
	bl sub_08035328
	movs r0, #1
	b _08039D40
_08039D38:
	adds r6, #1
	cmp r6, #4
	ble _08039C98
_08039D3E:
	movs r0, #0
_08039D40:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08039D48
sub_08039D48: @ 0x08039D48
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _08039DB8 @ =gActiveUnit
	ldr r0, [r6]
	movs r1, #0x7c
	bl sub_08019FC0
	bl sub_08039DF0
	adds r4, r0, #0
	cmp r4, #0
	beq _08039DE4
	ldrb r5, [r4, #1]
	ldr r0, _08039DBC @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r3, [r4]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r6]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r2, r0
	bgt _08039DC4
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
	ldr r1, _08039DC0 @ =0x0203A978
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldrb r3, [r4]
	ldrb r2, [r4, #1]
	str r2, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #2
	bl sub_08035328
	movs r0, #1
	b _08039DE6
	.align 2, 0
_08039DB8: .4byte gActiveUnit
_08039DBC: .4byte gBmMapMovement
_08039DC0: .4byte 0x0203A978
_08039DC4:
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
	ldr r0, _08039DE0 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08039DE6
	.align 2, 0
_08039DE0: .4byte 0x0203A978
_08039DE4:
	movs r0, #0
_08039DE6:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08039DF0
sub_08039DF0: @ 0x08039DF0
	push {r4, r5, r6, lr}
	movs r1, #0
	movs r5, #0
	ldr r0, _08039E10 @ =gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	movs r4, #0xff
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _08039E28
	cmp r0, #0x40
	bgt _08039E14
	cmp r0, #0
	beq _08039E1A
	b _08039E30
	.align 2, 0
_08039E10: .4byte gPlaySt
_08039E14:
	cmp r0, #0x80
	beq _08039E1E
	b _08039E30
_08039E1A:
	movs r0, #0
	b _08039E6A
_08039E1E:
	ldr r1, _08039E24 @ =0x08C063D4
	b _08039E2A
	.align 2, 0
_08039E24: .4byte 0x08C063D4
_08039E28:
	ldr r1, _08039E70 @ =0x08C06494
_08039E2A:
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
_08039E30:
	movs r0, #0
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08039E68
	ldr r0, _08039E74 @ =gBmMapMovement
	ldr r3, [r0]
	adds r2, r1, #0
_08039E42:
	ldrb r1, [r2, #1]
	lsls r0, r1, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrb r6, [r2]
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _08039E60
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble _08039E60
	ldrb r4, [r1]
	adds r5, r2, #0
_08039E60:
	adds r2, #4
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _08039E42
_08039E68:
	adds r0, r5, #0
_08039E6A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08039E70: .4byte 0x08C06494
_08039E74: .4byte gBmMapMovement

	thumb_func_start sub_08039E78
sub_08039E78: @ 0x08039E78
	ldr r0, _08039EA0 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08039EA8
	ldr r0, _08039EA4 @ =0x0203A978
	ldrb r0, [r0]
	cmp r0, #1
	beq _08039EA8
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08039EA8
	movs r0, #1
	b _08039EAA
	.align 2, 0
_08039EA0: .4byte gActiveUnit
_08039EA4: .4byte 0x0203A978
_08039EA8:
	movs r0, #0
_08039EAA:
	bx lr

	thumb_func_start sub_08039EAC
sub_08039EAC: @ 0x08039EAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _08039EC4 @ =gActiveUnit
	ldr r0, [r5]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08039EC8
	movs r0, #0
	b _08039FAA
	.align 2, 0
_08039EC4: .4byte gActiveUnit
_08039EC8:
	movs r7, #0
	strh r7, [r4]
	ldr r0, [r5]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08039FAA
	adds r6, r4, #0
	movs r0, #0
	mov r8, r0
_08039EDA:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08039F8C
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08039F8C
	ldr r4, _08039F6C @ =gActiveUnit
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039F16
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039F8C
_08039F16:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08039F70
	adds r0, r5, #0
	bl sub_08017774
	cmp r0, #1
	ble _08039F36
	movs r0, #2
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039F36:
	adds r0, r5, #0
	bl sub_0801778C
	cmp r0, #1
	bne _08039F48
	movs r0, #1
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039F48:
	adds r0, r5, #0
	bl GetItemUses
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetItemMaxUses
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	cmp r4, #0xa
	bhi _08039F7E
	movs r0, #4
	b _08039F78
	.align 2, 0
_08039F6C: .4byte gActiveUnit
_08039F70:
	adds r0, r5, #0
	bl sub_0803A180
	movs r0, #8
_08039F78:
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039F7E:
	adds r0, r5, #0
	bl GetItemMight
	lsls r0, r0, #8
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039F8C:
	adds r6, #2
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #4
	bgt _08039FAA
	movs r0, #0
	strh r0, [r6]
	ldr r0, _08039FB4 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x1e
	add r0, r8
	ldrh r5, [r0]
	cmp r5, #0
	bne _08039EDA
_08039FAA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039FB4: .4byte gActiveUnit

	thumb_func_start sub_08039FB8
sub_08039FB8: @ 0x08039FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r0, _0803A0FC @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #1
_08039FE6:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x14]
	cmp r5, #0
	beq _0803A0D6
	ldr r0, [r5]
	cmp r0, #0
	beq _0803A0D6
	ldr r0, [r5, #0xc]
	movs r1, #0x21
	ands r0, r1
	cmp r0, #0
	bne _0803A0D6
	ldr r0, _0803A100 @ =gActiveUnitId
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A0D6
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_0803A1B8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A0D6
	adds r0, r5, #0
	bl RevertMapChange
	ldr r4, _0803A104 @ =gBmMapMovement
	ldr r1, [r4]
	ldr r7, [sp, #8]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803A0D6
	adds r0, r5, #0
	mov r1, sp
	bl sub_0803A1FC
	adds r6, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	bl sub_08017774
	cmp r0, #1
	ble _0803A064
	ldr r2, [sp, #0xc]
	ldrh r2, [r2]
	adds r0, r2, r6
	ldr r3, [sp, #0xc]
	strh r0, [r3]
_0803A064:
	mov r0, sp
	ldrh r0, [r0]
	bl sub_0801778C
	cmp r0, #1
	bne _0803A07A
	ldr r7, [sp, #0x10]
	ldrh r7, [r7]
	adds r0, r7, r6
	ldr r1, [sp, #0x10]
	strh r0, [r1]
_0803A07A:
	ldr r1, _0803A108 @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	mov sl, r1
	cmp r2, #0
	blt _0803A0D6
	mov sb, r4
	ldr r3, _0803A0FC @ =0x0202E3F0
	mov r8, r3
_0803A08E:
	mov r7, sl
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r3, r0, #1
	subs r7, r2, #1
	str r7, [sp, #0x18]
	cmp r3, #0
	blt _0803A0D0
	lsls r4, r2, #2
	mov r1, sb
	mov r5, r8
	movs r0, #0xff
	mov ip, r0
_0803A0A8:
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A0CA
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r7, [r0]
	adds r2, r7, r6
	cmp r2, #0xff
	ble _0803A0C8
	mov r2, ip
_0803A0C8:
	strb r2, [r0]
_0803A0CA:
	subs r3, #1
	cmp r3, #0
	bge _0803A0A8
_0803A0D0:
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bge _0803A08E
_0803A0D6:
	ldr r4, [sp, #0x14]
	cmp r4, #0xbf
	ble _08039FE6
	ldr r3, [sp, #0xc]
	ldrh r7, [r3]
	ldr r3, [sp, #0x10]
	ldrh r3, [r3]
	adds r0, r7, r3
	ldr r7, [sp, #0x3c]
	strh r0, [r7]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A0FC: .4byte 0x0202E3F0
_0803A100: .4byte gActiveUnitId
_0803A104: .4byte gBmMapMovement
_0803A108: .4byte gBmMapSize

	thumb_func_start sub_0803A10C
sub_0803A10C: @ 0x0803A10C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #1
	rsbs r5, r5, #0
	movs r4, #0
	movs r3, #0
	movs r7, #0xff
	lsls r7, r7, #8
_0803A11C:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803A136
	adds r2, r0, #0
	ands r0, r6
	cmp r0, #0
	beq _0803A136
	adds r0, r7, #0
	ands r0, r2
	cmp r0, r4
	bls _0803A136
	adds r4, r0, #0
	adds r5, r3, #0
_0803A136:
	adds r1, #2
	adds r3, #1
	cmp r3, #4
	ble _0803A11C
	cmp r5, #0
	ble _0803A14C
	ldr r0, _0803A154 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r5, #0
	bl EquipUnitItemSlot
_0803A14C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A154: .4byte gActiveUnit

	thumb_func_start sub_0803A158
sub_0803A158: @ 0x0803A158
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmn r1, r0
	beq _0803A17C
	cmp r1, r0
	blo _0803A174
	movs r0, #1
	adds r1, r3, #0
	bl sub_0803A10C
	b _0803A17C
_0803A174:
	movs r0, #2
	adds r1, r3, #0
	bl sub_0803A10C
_0803A17C:
	pop {r0}
	bx r0

	thumb_func_start sub_0803A180
sub_0803A180: @ 0x0803A180
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	cmp r0, #0x4a
	blt _0803A1B0
	cmp r0, #0x4e
	ble _0803A198
	cmp r0, #0x56
	beq _0803A1A4
	b _0803A1B0
_0803A198:
	ldr r0, _0803A1A0 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #4
	b _0803A1AA
	.align 2, 0
_0803A1A0: .4byte gActiveUnit
_0803A1A4:
	ldr r0, _0803A1B4 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
_0803A1AA:
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
_0803A1B0:
	pop {r0}
	bx r0
	.align 2, 0
_0803A1B4: .4byte gActiveUnit

	thumb_func_start sub_0803A1B8
sub_0803A1B8: @ 0x0803A1B8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x1d
	ldrsb r0, [r3, r0]
	ldr r1, [r3, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, r1
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	subs r1, r4, r0
	cmp r1, #0
	bge _0803A1D8
	subs r1, r0, r4
_0803A1D8:
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _0803A1E6
	adds r0, r1, r3
	b _0803A1EA
_0803A1E6:
	subs r0, r0, r2
	adds r0, r1, r0
_0803A1EA:
	cmp r5, r0
	bge _0803A1F2
	movs r0, #0
	b _0803A1F4
_0803A1F2:
	movs r0, #1
_0803A1F4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803A1FC
sub_0803A1FC: @ 0x0803A1FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r4, [r6]
	adds r0, r5, #0
	bl GetUnitPower
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetItemMight
	adds r5, r5, r0
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803A228
sub_0803A228: @ 0x0803A228
	push {r4, lr}
	ldr r4, _0803A250 @ =0x0203A978
	ldrb r0, [r4]
	cmp r0, #2
	beq _0803A24A
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_0803A28C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A24A
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_0803A3B0
_0803A24A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A250: .4byte 0x0203A978

	thumb_func_start sub_0803A254
sub_0803A254: @ 0x0803A254
	push {r4, lr}
	ldr r4, _0803A288 @ =0x0203A978
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_0803A28C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A280
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_0803A3B0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A280
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_0803A414
_0803A280:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A288: .4byte 0x0203A978

	thumb_func_start sub_0803A28C
sub_0803A28C: @ 0x0803A28C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	str r1, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _0803A36C @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0803A368
	ldr r0, _0803A370 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl sub_0801A6B4
	ldr r0, _0803A374 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803A362
_0803A2DC:
	ldr r0, _0803A374 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803A35C
	lsls r5, r1, #2
_0803A2EC:
	ldr r0, _0803A370 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A356
	ldr r6, _0803A378 @ =gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803A356
	ldr r0, _0803A37C @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A356
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0803A356
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r8, r0
	bge _0803A356
	ldrb r2, [r2, #8]
	mov r8, r2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_0803A356:
	subs r4, #1
	cmp r4, #0
	bge _0803A2EC
_0803A35C:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803A2DC
_0803A362:
	mov r0, r8
	cmp r0, #0
	bne _0803A380
_0803A368:
	movs r0, #0
	b _0803A39E
	.align 2, 0
_0803A36C: .4byte gActiveUnit
_0803A370: .4byte gBmMapMovement
_0803A374: .4byte gBmMapSize
_0803A378: .4byte gBmMapUnit
_0803A37C: .4byte gActiveUnitId
_0803A380:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #7
	mov r3, sb
	bl sub_08035328
	movs r0, #1
_0803A39E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803A3B0
sub_0803A3B0: @ 0x0803A3B0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0803A404 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803A400
	ldr r4, _0803A408 @ =gBmMapMovement
	ldr r0, [r4]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl BmMapFillg
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x78
	bl sub_0801A6B4
	bl sub_080390F8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _0803A40C
_0803A400:
	movs r0, #0
	b _0803A40E
	.align 2, 0
_0803A404: .4byte gActiveUnit
_0803A408: .4byte gBmMapMovement
_0803A40C:
	movs r0, #1
_0803A40E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0803A414
sub_0803A414: @ 0x0803A414
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r1
	ldr r0, _0803A438 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _0803A46C
	b _0803A522
	.align 2, 0
_0803A438: .4byte gActiveUnit
_0803A43C:
	ldr r0, _0803A468 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitEquippedWeaponSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	asrs r2, r1, #0x10
	mov r3, r8
	asrs r1, r3, #0x10
	ldrb r3, [r5, #0xb]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #1
	bl sub_08035328
	movs r0, #1
	b _0803A524
	.align 2, 0
_0803A468: .4byte gActiveUnit
_0803A46C:
	ldr r0, _0803A534 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x10
	mov sb, r0
	asrs r6, r0, #0x10
	mov r1, sl
	lsls r1, r1, #0x10
	mov r8, r1
	asrs r5, r1, #0x10
	adds r0, r7, #0
	bl sub_08017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl sub_0801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _0803A538 @ =gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803A522
_0803A4B4:
	ldr r0, _0803A538 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803A51C
	lsls r6, r7, #2
_0803A4C2:
	ldr r0, _0803A534 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803A516
	ldr r5, _0803A53C @ =gBmMapUnit
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803A516
	ldr r0, _0803A540 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A516
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, sl
	adds r2, r5, #0
	bl sub_08039768
	cmp r0, #0
	bne _0803A43C
_0803A516:
	subs r4, #1
	cmp r4, #0
	bge _0803A4C2
_0803A51C:
	subs r7, #1
	cmp r7, #0
	bge _0803A4B4
_0803A522:
	movs r0, #0
_0803A524:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A534: .4byte gBmMapMovement
_0803A538: .4byte gBmMapSize
_0803A53C: .4byte gBmMapUnit
_0803A540: .4byte gActiveUnitId

	thumb_func_start sub_0803A544
sub_0803A544: @ 0x0803A544
	ldr r2, _0803A568 @ =gBmMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq _0803A564
	ldr r0, _0803A56C @ =gActiveUnitId
	ldrb r0, [r0]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803A570
_0803A564:
	movs r0, #0
	b _0803A572
	.align 2, 0
_0803A568: .4byte gBmMapUnit
_0803A56C: .4byte gActiveUnitId
_0803A570:
	movs r0, #1
_0803A572:
	bx lr

	thumb_func_start sub_0803A574
sub_0803A574: @ 0x0803A574
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r4, _0803A60C @ =gActiveUnit
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r2, [r0, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	mov r2, r8
	ldrb r2, [r2]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x14
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r3, r8
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _0803A618
	cmp r2, #0
	beq _0803A618
	ldr r0, [r4]
	adds r1, r5, #0
	bl sub_08038E6C
	ldr r0, _0803A610 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A68E
_0803A5C2:
	ldr r0, _0803A610 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803A602
_0803A5D0:
	ldr r0, _0803A614 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803A5FC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803A544
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803A5FC
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803A5FC:
	subs r4, #1
	cmp r4, #0
	bge _0803A5D0
_0803A602:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803A5C2
	b _0803A68E
	.align 2, 0
_0803A60C: .4byte gActiveUnit
_0803A610: .4byte gBmMapSize
_0803A614: .4byte 0x0202E3E4
_0803A618:
	ldr r4, _0803A6A8 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _0803A6AC @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801A0E0
	ldr r0, _0803A6B0 @ =gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A68E
_0803A64C:
	ldr r0, _0803A6B0 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803A688
_0803A65A:
	ldr r0, _0803A6AC @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A682
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803A544
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803A682
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803A682:
	subs r4, #1
	cmp r4, #0
	bge _0803A65A
_0803A688:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803A64C
_0803A68E:
	ldr r0, _0803A6B4 @ =0x0203A8E8
	adds r0, #0x86
	mov r2, r8
	ldrb r2, [r2, #2]
	adds r0, r2, r0
	strb r7, [r0]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A6A8: .4byte gActiveUnit
_0803A6AC: .4byte 0x0202E3E4
_0803A6B0: .4byte gBmMapSize
_0803A6B4: .4byte 0x0203A8E8

	thumb_func_start sub_0803A6B8
sub_0803A6B8: @ 0x0803A6B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0803A754 @ =gActiveUnit
	ldr r0, [r5]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r2, [r0, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	ldrb r2, [r4, #4]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x14
	str r1, [sp, #4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xfe
	lsls r0, r0, #5
	ldrh r1, [r1]
	ands r0, r1
	lsrs r0, r0, #8
	ldr r1, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r8, r1
	ldrb r0, [r0, #1]
	mov sb, r0
	movs r6, #0x10
	ldrsb r6, [r2, r6]
	movs r7, #0x11
	ldrsb r7, [r2, r7]
	strb r1, [r2, #0x10]
	ldr r0, [r5]
	mov r2, sb
	strb r2, [r0, #0x11]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0803A75C
	mov r0, sl
	cmp r0, #0
	beq _0803A75C
	ldr r0, [r5]
	ldr r1, [sp, #4]
	mov r2, sl
	bl sub_08038E6C
	ldr r0, _0803A758 @ =0x0202E3E4
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803A796
_0803A748:
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldr r0, [r5]
	strb r7, [r0, #0x11]
	b _0803A85C
	.align 2, 0
_0803A754: .4byte gActiveUnit
_0803A758: .4byte 0x0202E3E4
_0803A75C:
	ldr r5, _0803A80C @ =gActiveUnit
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r4, _0803A810 @ =0x0202E3E4
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #4]
	movs r3, #0
	bl sub_0801A0E0
	ldr r1, [r4]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A748
_0803A796:
	ldr r4, _0803A80C @ =gActiveUnit
	ldr r0, [r4]
	strb r6, [r0, #0x10]
	ldr r0, [r4]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	bl RevertMapChange
	ldr r0, [r4]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A7BA
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
_0803A7BA:
	ldr r1, _0803A814 @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A84E
_0803A7C6:
	ldr r1, _0803A814 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov ip, r0
	cmp r3, #0
	blt _0803A848
	ldr r7, _0803A818 @ =gBmMapMovement
	ldr r6, _0803A810 @ =0x0202E3E4
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
_0803A7E0:
	mov r0, sl
	cmp r0, #0
	beq _0803A81C
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803A840
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803A842
	b _0803A840
	.align 2, 0
_0803A80C: .4byte gActiveUnit
_0803A810: .4byte 0x0202E3E4
_0803A814: .4byte gBmMapSize
_0803A818: .4byte gBmMapMovement
_0803A81C:
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803A840
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	ble _0803A842
_0803A840:
	strb r1, [r4]
_0803A842:
	subs r3, #1
	cmp r3, #0
	bge _0803A7E0
_0803A848:
	mov r5, ip
	cmp r5, #0
	bge _0803A7C6
_0803A84E:
	ldr r0, _0803A880 @ =sub_08037DC8
	bl sub_08038C64
	ldr r0, _0803A884 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	cmp r0, #1
	beq _0803A86C
_0803A85C:
	mov r0, r8
	mov r1, sb
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
_0803A86C:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A880: .4byte sub_08037DC8
_0803A884: .4byte 0x0203A978

	thumb_func_start sub_0803A888
sub_0803A888: @ 0x0803A888
	ldr r1, _0803A89C @ =0x0203A8E8
	ldr r0, _0803A8A0 @ =gActiveUnit
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r0, [r0]
	adds r1, #0x86
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0803A89C: .4byte 0x0203A8E8
_0803A8A0: .4byte gActiveUnit

	thumb_func_start sub_0803A8A4
sub_0803A8A4: @ 0x0803A8A4
	push {r4, r5, lr}
	bl GetActiveFactionAlliance
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803A8C0
	adds r5, r0, #0
_0803A8B4:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803A8B4
_0803A8C0:
	ldr r0, _0803A8D0 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A8D0: .4byte 0x0203A8E8

	thumb_func_start sub_0803A8D4
sub_0803A8D4: @ 0x0803A8D4
	push {r4, r5, lr}
	bl GetActiveFactionAlliance
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803A8F0
	adds r5, r0, #0
_0803A8E4:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803A8E4
_0803A8F0:
	ldr r0, _0803A900 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A900: .4byte 0x0203A8E8

	thumb_func_start sub_0803A904
sub_0803A904: @ 0x0803A904
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0803A938 @ =gActiveUnit
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xfe
	lsls r0, r0, #5
	ldrh r1, [r1]
	ands r0, r1
	lsrs r3, r0, #8
	adds r5, r2, #0
	adds r5, #0x46
	ldrb r4, [r5]
	ldr r0, _0803A93C @ =0x08C065BC
	ldr r1, [r0]
	cmp r1, #0
	beq _0803A932
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	bne _0803A940
_0803A932:
	movs r0, #0
	b _0803A982
	.align 2, 0
_0803A938: .4byte gActiveUnit
_0803A93C: .4byte 0x08C065BC
_0803A940:
	lsls r0, r4, #2
	adds r3, r2, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0803A956
	movs r4, #0
	strb r4, [r5]
	adds r3, r2, #0
_0803A956:
	ldrh r0, [r3]
	strh r0, [r6]
	ldrh r0, [r3, #2]
	strh r0, [r6, #2]
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _0803A988 @ =gBmMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803A980
	adds r4, #1
	ldr r0, [r7]
	adds r0, #0x46
	strb r4, [r0]
_0803A980:
	movs r0, #1
_0803A982:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A988: .4byte gBmMapMovement

	thumb_func_start sub_0803A98C
sub_0803A98C: @ 0x0803A98C
	push {r4, lr}
	sub sp, #8
	ldr r4, _0803A9BC @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803A9C4
	ldr r0, [r4]
	bl sub_08036B28
	bl sub_08036868
	adds r1, r0, #0
	cmp r1, #0
	beq _0803A9CA
	ldr r0, _0803A9C0 @ =0x0203A8E8
	adds r0, #0x86
	strb r1, [r0]
	movs r0, #0
	b _0803A9F4
	.align 2, 0
_0803A9BC: .4byte gActiveUnit
_0803A9C0: .4byte 0x0203A8E8
_0803A9C4:
	ldr r0, [r4]
	bl RevertMapChange
_0803A9CA:
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_0803A904
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	beq _0803A9DE
	movs r0, #0
	b _0803A9F4
_0803A9DE:
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
	movs r0, #1
_0803A9F4:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803A9FC
sub_0803A9FC: @ 0x0803A9FC
	adds r1, r0, #0
	ldr r0, _0803AA28 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	ldrb r0, [r0, #0x11]
	ldrb r3, [r1]
	cmp r3, r2
	bhi _0803AA30
	ldrb r3, [r1, #2]
	cmp r3, r2
	blo _0803AA30
	ldrb r2, [r1, #1]
	cmp r2, r0
	bhi _0803AA30
	ldrb r1, [r1, #3]
	cmp r1, r0
	blo _0803AA30
	ldr r0, _0803AA2C @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #1
	b _0803AA36
	.align 2, 0
_0803AA28: .4byte gActiveUnit
_0803AA2C: .4byte 0x0203A8E8
_0803AA30:
	ldr r0, _0803AA3C @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #0
_0803AA36:
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0803AA3C: .4byte 0x0203A8E8

	thumb_func_start sub_0803AA40
sub_0803AA40: @ 0x0803AA40
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldrb r5, [r0, #0xb]
	ldrb r0, [r4, #1]
	bl GetUnitFromCharId
	ldrb r3, [r0, #0xb]
	movs r0, #0xff
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	adds r2, r5, #0
	bl sub_0803536C
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803AA70
sub_0803AA70: @ 0x0803AA70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, _0803AAA8 @ =gActiveUnitId
	ldrb r0, [r7]
	mov r8, r0
	ldr r4, _0803AAAC @ =gActiveUnit
	ldr r6, [r4]
	adds r0, r6, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803AB1A
	bl GetUnitFromCharId
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne _0803AAB4
	str r6, [r4]
	ldr r0, _0803AAB0 @ =0x0203A8E8
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803AB1A
	.align 2, 0
_0803AAA8: .4byte gActiveUnitId
_0803AAAC: .4byte gActiveUnit
_0803AAB0: .4byte 0x0203A8E8
_0803AAB4:
	ldrb r0, [r1, #0xb]
	strb r0, [r7]
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, #1
	ldrb r7, [r0]
_0803AAC2:
	bl sub_08037A6C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803AAD8
	adds r5, #1
	cmp r5, #0xff
	ble _0803AAC2
	bl sub_08037AC0
_0803AAD8:
	ldr r1, _0803AAF0 @ =0x0203A978
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bne _0803AAF8
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803AAF8
	ldr r0, _0803AAF4 @ =0x0203A8E8
	ldrb r1, [r1, #6]
	adds r0, #0x86
	b _0803AAFE
	.align 2, 0
_0803AAF0: .4byte 0x0203A978
_0803AAF4: .4byte 0x0203A8E8
_0803AAF8:
	ldr r0, _0803AB28 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #0
_0803AAFE:
	strb r1, [r0]
	bl sub_08035308
	ldr r1, _0803AB2C @ =gActiveUnit
	ldr r0, [r1]
	adds r0, #0x42
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r7, [r0]
	ldr r0, _0803AB30 @ =gActiveUnitId
	mov r2, r8
	strb r2, [r0]
	str r6, [r1]
_0803AB1A:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803AB28: .4byte 0x0203A8E8
_0803AB2C: .4byte gActiveUnit
_0803AB30: .4byte gActiveUnitId

	thumb_func_start sub_0803AB34
sub_0803AB34: @ 0x0803AB34
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2]
	ldr r0, _0803AB60 @ =0x0203A984
	ldrb r1, [r1, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803AB68
	ldr r0, _0803AB64 @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AB68
	movs r0, #1
	b _0803AB6A
	.align 2, 0
_0803AB60: .4byte 0x0203A984
_0803AB64: .4byte gActiveUnit
_0803AB68:
	movs r0, #0
_0803AB6A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803AB70
sub_0803AB70: @ 0x0803AB70
	push {lr}
	ldr r2, _0803AB90 @ =0x0203A984
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	bl sub_08037530
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803AB98
	ldr r0, _0803AB94 @ =0x0203A8E8
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803ABBE
	.align 2, 0
_0803AB90: .4byte 0x0203A984
_0803AB94: .4byte 0x0203A8E8
_0803AB98:
	ldr r0, _0803ABC4 @ =sub_0803AB34
	bl sub_08038A0C
	ldr r0, _0803ABC8 @ =0x0203A8E8
	adds r1, r0, #0
	adds r1, #0x86
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803ABCC @ =0x0203A978
	ldrb r2, [r0, #0xa]
	cmp r2, #1
	bne _0803ABBA
	ldrb r2, [r0]
	cmp r2, #1
	bne _0803ABBA
	ldrb r0, [r0, #6]
	strb r0, [r1]
_0803ABBA:
	bl sub_08035308
_0803ABBE:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803ABC4: .4byte sub_0803AB34
_0803ABC8: .4byte 0x0203A8E8
_0803ABCC: .4byte 0x0203A978

	thumb_func_start sub_0803ABD0
sub_0803ABD0: @ 0x0803ABD0
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	ldr r0, _0803ABF8 @ =0x0203A8E8
	adds r0, #0x86
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803AC00
	ldr r0, _0803ABFC @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AC00
	movs r0, #1
	b _0803AC02
	.align 2, 0
_0803ABF8: .4byte 0x0203A8E8
_0803ABFC: .4byte gActiveUnit
_0803AC00:
	movs r0, #0
_0803AC02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803AC08
sub_0803AC08: @ 0x0803AC08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0803AC68 @ =0x0203A8E8
	adds r0, #0x86
	ldrb r0, [r0]
	bl GetUnit
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r1, _0803AC6C @ =gActiveUnit
	ldr r1, [r1]
	movs r3, #0x10
	ldrsb r3, [r1, r3]
	subs r7, r2, r3
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	subs r0, r0, r2
	mov r8, r0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r5, r0, r3
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r6, r0, r2
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AC70
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r0, #0
	blt _0803AC70
	mov r0, r8
	muls r0, r6, r0
	cmp r0, #0
	blt _0803AC70
	movs r0, #1
	b _0803AC72
	.align 2, 0
_0803AC68: .4byte 0x0203A8E8
_0803AC6C: .4byte gActiveUnit
_0803AC70:
	movs r0, #0
_0803AC72:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0803AC7C
sub_0803AC7C: @ 0x0803AC7C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803ACCC @ =0x0203A8E8
	adds r1, r0, #0
	adds r1, #0x86
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803ACC2
	ldrb r0, [r1]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0803ACD0 @ =sub_0803ABD0
	bl sub_08038A0C
	ldr r5, _0803ACD4 @ =0x0203A978
	ldrb r0, [r5, #0xa]
	cmp r0, #1
	beq _0803ACC2
	ldr r0, _0803ACD8 @ =sub_0803AC08
	bl sub_08038A0C
	ldrb r5, [r5, #0xa]
	cmp r5, #1
	beq _0803ACC2
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
_0803ACC2:
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803ACCC: .4byte 0x0203A8E8
_0803ACD0: .4byte sub_0803ABD0
_0803ACD4: .4byte 0x0203A978
_0803ACD8: .4byte sub_0803AC08

	thumb_func_start sub_0803ACDC
sub_0803ACDC: @ 0x0803ACDC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803AD10 @ =0x0203A8E8
	ldrb r2, [r4, #1]
	adds r1, r3, #0
	adds r1, #0x7c
	strb r2, [r1]
	ldrb r4, [r4]
	cmp r0, r4
	bhi _0803AD18
	ldr r4, _0803AD14 @ =sub_08037DC8
	adds r0, r4, #0
	bl sub_0803AF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AD20
	adds r0, r4, #0
	bl sub_08038A0C
	b _0803AD20
	.align 2, 0
_0803AD10: .4byte 0x0203A8E8
_0803AD14: .4byte sub_08037DC8
_0803AD18:
	adds r1, r3, #0
	adds r1, #0x79
	movs r0, #4
	strb r0, [r1]
_0803AD20:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803AD28
sub_0803AD28: @ 0x0803AD28
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	bhi _0803AD64
	bl sub_0803BECC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AD6C
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r4, [r4, #1]
	cmp r0, r4
	bhi _0803AD6C
	ldr r0, _0803AD60 @ =sub_08037DC8
	bl sub_08038A0C
	b _0803AD6C
	.align 2, 0
_0803AD60: .4byte sub_08037DC8
_0803AD64:
	ldr r0, _0803AD74 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803AD6C:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803AD74: .4byte 0x0203A8E8

	thumb_func_start sub_0803AD78
sub_0803AD78: @ 0x0803AD78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0803ADD4 @ =0x0000FFFF
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	movs r2, #0xff
	mov sl, r2
	ldr r4, _0803ADD8 @ =gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803ADDC
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_08034B70
	cmp r0, #0
	beq _0803ADB4
	b _0803AEDC
_0803ADB4:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r8
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xa
	movs r3, #0
	bl sub_08035328
	b _0803AEDC
	.align 2, 0
_0803ADD4: .4byte 0x0000FFFF
_0803ADD8: .4byte gActiveUnit
_0803ADDC:
	adds r0, r2, #0
	bl sub_0803C354
	ldr r0, _0803AEB0 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803AE64
_0803ADEE:
	ldr r0, _0803AEB0 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sb, r0
	cmp r4, #0
	blt _0803AE5E
	ldr r7, _0803AEB4 @ =gBmMapMovement
	lsls r6, r5, #2
_0803AE02:
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AE58
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08034B70
	cmp r0, #0
	beq _0803AE58
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803AEB8 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803AE58
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, sl
	bhi _0803AE58
	ldrb r0, [r0]
	mov sl, r0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0803AE58:
	subs r4, #1
	cmp r4, #0
	bge _0803AE02
_0803AE5E:
	mov r5, sb
	cmp r5, #0
	bge _0803ADEE
_0803AE64:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0803AE82
	ldr r0, [sp, #0x10]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
_0803AE82:
	ldr r1, _0803AEBC @ =0x0203A978
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bne _0803AEC0
	ldrb r0, [r1, #2]
	cmp r0, r4
	bne _0803AEDC
	ldrb r1, [r1, #3]
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0803AEDC
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_0803536C
	b _0803AEDC
	.align 2, 0
_0803AEB0: .4byte gBmMapSize
_0803AEB4: .4byte gBmMapMovement
_0803AEB8: .4byte gBmMapUnit
_0803AEBC: .4byte 0x0203A978
_0803AEC0:
	mov r0, r8
	cmp r0, #0
	beq _0803AED4
	ldr r0, _0803AED0 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #7
	b _0803AEDA
	.align 2, 0
_0803AED0: .4byte 0x0203A8E8
_0803AED4:
	ldr r0, _0803AEF0 @ =0x0203A8E8
	adds r0, #0x86
	movs r1, #6
_0803AEDA:
	strb r1, [r0]
_0803AEDC:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803AEF0: .4byte 0x0203A8E8

	thumb_func_start sub_0803AEF4
sub_0803AEF4: @ 0x0803AEF4
	push {lr}
	sub sp, #4
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	movs r0, #1
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_08036FD8
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803AF14
sub_0803AF14: @ 0x0803AF14
	ldr r0, _0803AF20 @ =0x0203A8E8
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
_0803AF20: .4byte 0x0203A8E8

	thumb_func_start sub_0803AF24
sub_0803AF24: @ 0x0803AF24
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, _0803AF40 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AF48
	b _0803AF7C
	.align 2, 0
_0803AF40: .4byte gActiveUnit
_0803AF44:
	adds r0, r5, #0
	b _0803AF80
_0803AF48:
	adds r0, r4, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _0803AF88 @ =0x081D9408
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803AF7C
	movs r3, #0
	adds r2, r4, #4
	adds r1, r4, #0
_0803AF60:
	ldrh r0, [r1]
	cmp r6, r0
	bne _0803AF6C
	ldr r0, [r2]
	cmp r0, #0
	bne _0803AF44
_0803AF6C:
	adds r3, #8
	adds r2, #8
	adds r1, #8
	adds r5, #1
	adds r0, r3, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803AF60
_0803AF7C:
	movs r0, #1
	rsbs r0, r0, #0
_0803AF80:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803AF88: .4byte 0x081D9408

	thumb_func_start sub_0803AF8C
sub_0803AF8C: @ 0x0803AF8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0803B028 @ =gActiveUnit
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0803B016
	movs r5, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _0803B016
	ldr r0, _0803B02C @ =0x081D940C
	mov r8, r0
_0803AFB4:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803B000
	adds r0, r4, #0
	bl GetItemRequiredExp
	cmp r0, r6
	blt _0803B000
	adds r0, r4, #0
	bl sub_0803AF24
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803B000
	lsls r0, r1, #3
	add r0, r8
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	bl _call_via_r2
	ldr r0, _0803B030 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B000
	adds r0, r4, #0
	bl GetItemRequiredExp
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803B000:
	adds r5, #1
	cmp r5, #4
	bgt _0803B016
	ldr r0, _0803B028 @ =gActiveUnit
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803AFB4
_0803B016:
	ldr r0, _0803B030 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B028: .4byte gActiveUnit
_0803B02C: .4byte 0x081D940C
_0803B030: .4byte 0x0203A978

	thumb_func_start sub_0803B034
sub_0803B034: @ 0x0803B034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r8, r2
	movs r0, #0
	mov sl, r0
	ldr r2, _0803B0D8 @ =0x08C07D88
	movs r1, #3
	mov sb, r1
_0803B050:
	ldr r0, [r2]
	ldr r1, [sp]
	adds r5, r1, r0
	ldr r0, [r2, #4]
	ldr r1, [sp, #4]
	adds r7, r1, r0
	ldr r0, _0803B0DC @ =gBmMapMovement
	ldr r0, [r0]
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0803B0BE
	ldr r0, _0803B0E0 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803B086
	ldr r0, _0803B0E4 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803B0BE
_0803B086:
	adds r0, r5, #0
	adds r1, r7, #0
	str r2, [sp, #8]
	bl sub_080397B8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_080397F8
	adds r4, r4, r0
	ldr r0, _0803B0E8 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803B0EC @ =0x7FFFFFFF
	adds r4, r4, r0
	ldr r2, [sp, #8]
	cmp sl, r4
	bhs _0803B0BE
	mov r1, r8
	strh r5, [r1]
	strh r7, [r1, #2]
	mov sl, r4
_0803B0BE:
	adds r2, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	bge _0803B050
	mov r0, sl
	cmp r0, #0
	bne _0803B0F0
	movs r0, #0
	b _0803B0F2
	.align 2, 0
_0803B0D8: .4byte 0x08C07D88
_0803B0DC: .4byte gBmMapMovement
_0803B0E0: .4byte gBmMapUnit
_0803B0E4: .4byte gActiveUnitId
_0803B0E8: .4byte 0x0202E3F0
_0803B0EC: .4byte 0x7FFFFFFF
_0803B0F0:
	movs r0, #1
_0803B0F2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803B104
sub_0803B104: @ 0x0803B104
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r0, _0803B25C @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	ldr r0, [sp, #0x18]
	bl sub_0801B528
	bl sub_0801A4DC
	ldr r0, _0803B260 @ =0x0203A8E8
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B146
	adds r1, r0, #0
	mov sl, r1
_0803B146:
	ldr r0, _0803B264 @ =gBmMapSize
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B226
_0803B152:
	ldr r0, _0803B264 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x20]
	cmp r6, #0
	blt _0803B220
	lsls r4, r7, #2
	mov r8, r4
_0803B166:
	ldr r0, _0803B268 @ =gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B21A
	ldr r0, _0803B26C @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803B21A
	ldr r0, _0803B270 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803B21A
	adds r0, r1, #0
	bl GetUnit
	adds r5, r0, #0
	movs r0, #4
	ldr r1, _0803B274 @ =0x0203A963
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B1B6
	mov r2, sb
	cmp r2, #0
	beq _0803B1B6
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B21A
_0803B1B6:
	ldr r4, _0803B278 @ =0x0203A964
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803B1C8
	movs r0, #1
	ldrb r1, [r5, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _0803B21A
_0803B1C8:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sl
	bhi _0803B21A
	add r5, sp, #0xc
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_0803B034
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B21A
	mov sl, r4
	add r0, sp, #0xc
	movs r4, #0
	ldrsh r2, [r0, r4]
	str r2, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r5, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803B26C @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B21A:
	subs r6, #1
	cmp r6, #0
	bge _0803B166
_0803B220:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803B152
_0803B226:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x14]
	cmp r2, r0
	beq _0803B24A
	adds r0, r2, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_08035328
_0803B24A:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B25C: .4byte gActiveUnit
_0803B260: .4byte 0x0203A8E8
_0803B264: .4byte gBmMapSize
_0803B268: .4byte gBmMapMovement
_0803B26C: .4byte gBmMapUnit
_0803B270: .4byte gActiveUnitId
_0803B274: .4byte 0x0203A963
_0803B278: .4byte 0x0203A964

	thumb_func_start sub_0803B27C
sub_0803B27C: @ 0x0803B27C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r4, _0803B42C @ =0x0203A8E8
	adds r5, r4, #0
	adds r5, #0x7b
	movs r0, #4
	ldrb r3, [r5]
	ands r0, r3
	cmp r0, #0
	beq _0803B2AE
	b _0803B41C
_0803B2AE:
	ldr r0, _0803B430 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	ldr r0, [sp, #0x18]
	bl sub_0801B528
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B2CA
	adds r4, r0, #0
	mov sl, r4
_0803B2CA:
	movs r0, #1
	mov r8, r0
_0803B2CE:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	bne _0803B2DC
	b _0803B3EC
_0803B2DC:
	ldr r0, [r6]
	cmp r0, #0
	bne _0803B2E4
	b _0803B3EC
_0803B2E4:
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803B434 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, _0803B438 @ =gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0803B3EC
	ldr r0, [r6, #0xc]
	ldr r1, _0803B43C @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803B3EC
	movs r0, #4
	ldr r1, _0803B440 @ =0x0203A963
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B32C
	mov r2, sb
	cmp r2, #0
	beq _0803B32C
	adds r0, r6, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B3EC
_0803B32C:
	ldr r3, _0803B444 @ =0x0203A964
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803B33E
	movs r0, #1
	ldrb r4, [r6, #0xa]
	ands r0, r4
	cmp r0, #0
	beq _0803B3EC
_0803B33E:
	ldr r7, _0803B430 @ =gActiveUnit
	ldr r0, [r7]
	bl GetUnitMagRange
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r3, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_0803757C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B3EC
	ldr r0, _0803B448 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A6B4
	add r5, sp, #0xc
	adds r0, r5, #0
	bl sub_08037834
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B3EC
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	bhi _0803B3EC
	mov sl, r0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r3, #2
	ldrsh r2, [r5, r3]
	str r2, [sp, #0x18]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803B434 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B3EC:
	movs r4, #1
	add r8, r4
	mov r0, r8
	cmp r0, #0xbf
	bgt _0803B3F8
	b _0803B2CE
_0803B3F8:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0803B41C
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_08035328
_0803B41C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B42C: .4byte 0x0203A8E8
_0803B430: .4byte gActiveUnit
_0803B434: .4byte gBmMapUnit
_0803B438: .4byte gActiveUnitId
_0803B43C: .4byte 0x00010005
_0803B440: .4byte 0x0203A963
_0803B444: .4byte 0x0203A964
_0803B448: .4byte 0x0202E3E4

	thumb_func_start sub_0803B44C
sub_0803B44C: @ 0x0803B44C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	mov sl, r0
	ldr r1, _0803B53C @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B52C
	bl sub_08037914
	cmp r0, #2
	ble _0803B52C
	ldr r0, _0803B540 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
	ldr r0, _0803B544 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B504
_0803B494:
	ldr r0, _0803B544 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r5, #1
	cmp r4, #0
	blt _0803B4FE
	lsls r6, r5, #2
_0803B4A4:
	ldr r0, _0803B548 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B4F8
	ldr r0, _0803B54C @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803B4CC
	ldr r0, _0803B550 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803B4F8
_0803B4CC:
	ldr r0, _0803B554 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0803B540 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A6B4
	bl sub_08037960
	cmp r0, r8
	ble _0803B4F8
	mov r8, r0
	mov sb, r4
	mov sl, r5
_0803B4F8:
	subs r4, #1
	cmp r4, #0
	bge _0803B4A4
_0803B4FE:
	adds r5, r7, #0
	cmp r5, #0
	bge _0803B494
_0803B504:
	mov r3, r8
	cmp r3, #1
	ble _0803B52C
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl sub_08035328
_0803B52C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B53C: .4byte 0x0203A8E8
_0803B540: .4byte gActiveUnit
_0803B544: .4byte gBmMapSize
_0803B548: .4byte gBmMapMovement
_0803B54C: .4byte gBmMapUnit
_0803B550: .4byte gActiveUnitId
_0803B554: .4byte 0x0202E3E4

	thumb_func_start sub_0803B558
sub_0803B558: @ 0x0803B558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r5, #0
	str r5, [sp, #0x1c]
	ldr r1, _0803B69C @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B588
	b _0803B68A
_0803B588:
	ldr r0, _0803B6A0 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
	bl sub_0801A4DC
	ldr r0, _0803B6A4 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B654
_0803B5A8:
	ldr r0, _0803B6A4 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r5, r7, #1
	str r5, [sp, #0x20]
	cmp r4, #0
	blt _0803B64E
	lsls r0, r7, #2
	mov r8, r0
_0803B5BC:
	ldr r0, _0803B6A8 @ =gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B648
	ldr r0, _0803B6AC @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B648
	bl GetUnit
	adds r5, r0, #0
	ldr r1, _0803B69C @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B604
	mov r1, sb
	cmp r1, #0
	beq _0803B604
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B648
_0803B604:
	movs r0, #9
	ldrb r2, [r5, #0xa]
	ands r0, r2
	cmp r0, #0
	bne _0803B648
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _0803B648
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_0803B034
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B648
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r5, [r0, r1]
	str r5, [sp, #0x14]
	movs r5, #2
	ldrsh r2, [r6, r5]
	str r2, [sp, #0x18]
	ldr r0, _0803B6AC @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B648:
	subs r4, #1
	cmp r4, #0
	bge _0803B5BC
_0803B64E:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803B5A8
_0803B654:
	mov r0, sl
	cmp r0, #0
	beq _0803B68A
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_0803BCF0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B68A
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r5, [sp, #0x10]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #5
	bl sub_08035328
_0803B68A:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B69C: .4byte 0x0203A8E8
_0803B6A0: .4byte gActiveUnit
_0803B6A4: .4byte gBmMapSize
_0803B6A8: .4byte gBmMapMovement
_0803B6AC: .4byte gBmMapUnit

	thumb_func_start sub_0803B6B0
sub_0803B6B0: @ 0x0803B6B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r1, _0803B7E0 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B7CE
	ldr r0, _0803B7E4 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
	bl sub_0801A4DC
	ldr r0, _0803B7E8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B7AE
_0803B6FE:
	ldr r0, _0803B7E8 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt _0803B7A8
	lsls r1, r7, #2
	mov r8, r1
_0803B712:
	ldr r0, _0803B7EC @ =gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B7A2
	ldr r0, _0803B7F0 @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B7A2
	bl GetUnit
	adds r5, r0, #0
	ldr r1, _0803B7E0 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B75A
	mov r2, sb
	cmp r2, #0
	beq _0803B75A
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B7A2
_0803B75A:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B7A2
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _0803B7A2
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_0803B034
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B7A2
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803B7F0 @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B7A2:
	subs r4, #1
	cmp r4, #0
	bge _0803B712
_0803B7A8:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803B6FE
_0803B7AE:
	mov r2, sl
	cmp r2, #0
	beq _0803B7CE
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_08035328
_0803B7CE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B7E0: .4byte 0x0203A8E8
_0803B7E4: .4byte gActiveUnit
_0803B7E8: .4byte gBmMapSize
_0803B7EC: .4byte gBmMapMovement
_0803B7F0: .4byte gBmMapUnit

	thumb_func_start sub_0803B7F4
sub_0803B7F4: @ 0x0803B7F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
_0803B7FA:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803B842
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _0803B838 @ =0x00000405
	ands r1, r0
	cmp r1, #0
	beq _0803B83C
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B834
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B83C
_0803B834:
	movs r0, #1
	b _0803B844
	.align 2, 0
_0803B838: .4byte 0x00000405
_0803B83C:
	adds r6, #1
	cmp r6, #4
	ble _0803B7FA
_0803B842:
	movs r0, #0
_0803B844:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803B84C
sub_0803B84C: @ 0x0803B84C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0803B868 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r5, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B86C
	movs r0, #0
	b _0803B898
	.align 2, 0
_0803B868: .4byte gActiveUnit
_0803B86C:
	adds r0, r5, #0
	bl GetUnitPower
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803B896
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0803B896
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_0803B896:
	adds r0, r4, #0
_0803B898:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803B8A0
sub_0803B8A0: @ 0x0803B8A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sl, r1
	movs r0, #0
	str r0, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	movs r3, #0
	str r3, [sp, #0x20]
	ldr r1, _0803BA1C @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B8D0
	b _0803BA0C
_0803B8D0:
	ldr r0, _0803BA20 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
	movs r4, #1
	mov sb, r4
_0803B8E4:
	mov r0, sb
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0803B9DC
	ldr r0, [r6]
	cmp r0, #0
	beq _0803B9DC
	ldr r0, [r6, #0xc]
	ldr r1, _0803BA24 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803B9DC
	ldr r1, _0803BA1C @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B920
	mov r0, sl
	cmp r0, #0
	beq _0803B920
	adds r0, r6, #0
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B9DC
_0803B920:
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0803B9DC
	adds r0, r6, #0
	bl sub_080379FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B9DC
	ldr r1, _0803BA20 @ =gActiveUnit
	mov r8, r1
	ldr r0, [r1]
	bl GetUnitMagRange
	mov r3, r8
	ldr r2, [r3]
	ldr r1, [r2, #4]
	ldrb r4, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r4, r1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_0803757C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B9DC
	adds r0, r6, #0
	bl sub_0803B7F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B9DC
	adds r0, r6, #0
	bl sub_0803B84C
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0803B9DC
	ldr r0, [sp, #0x14]
	cmp r7, r0
	blo _0803B9DC
	ldr r0, _0803BA28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	mov r1, r8
	ldr r0, [r1]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A6B4
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_08037834
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B9DC
	str r7, [sp, #0x14]
	add r0, sp, #0xc
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x18]
	movs r1, #2
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x1c]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x20]
_0803B9DC:
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #0xbf
	bgt _0803B9E8
	b _0803B8E4
_0803B9E8:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq _0803BA0C
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_08035328
_0803BA0C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BA1C: .4byte 0x0203A8E8
_0803BA20: .4byte gActiveUnit
_0803BA24: .4byte 0x00010005
_0803BA28: .4byte 0x0202E3E4

	thumb_func_start sub_0803BA2C
sub_0803BA2C: @ 0x0803BA2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r3, #0
	str r3, [sp, #0x1c]
	ldr r1, _0803BBA0 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803BA5C
	b _0803BB8E
_0803BA5C:
	ldr r0, _0803BBA4 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
	movs r4, #1
	mov r8, r4
_0803BA70:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0803BB5E
	ldr r0, [r6]
	cmp r0, #0
	beq _0803BB5E
	ldr r0, [r6, #0xc]
	ldr r1, _0803BBA8 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803BB5E
	ldr r1, _0803BBA0 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803BAAC
	mov r0, sb
	cmp r0, #0
	beq _0803BAAC
	adds r0, r6, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BB5E
_0803BAAC:
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803BB5E
	ldr r7, _0803BBA4 @ =gActiveUnit
	ldr r0, [r7]
	bl GetUnitMagRange
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r3, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_0803757C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BB5E
	adds r0, r6, #0
	bl sub_0803B7F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BB5E
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0803BB5E
	movs r0, #8
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	cmp r0, sl
	blt _0803BB5E
	ldr r0, _0803BBAC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A6B4
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_08037834
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BB5E
	ldrb r0, [r6, #8]
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r0, #2
	ldrsh r3, [r4, r0]
	str r3, [sp, #0x18]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x1c]
_0803BB5E:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #0xbf
	bgt _0803BB6A
	b _0803BA70
_0803BB6A:
	mov r3, sl
	cmp r3, #0
	beq _0803BB8E
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_08035328
_0803BB8E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BBA0: .4byte 0x0203A8E8
_0803BBA4: .4byte gActiveUnit
_0803BBA8: .4byte 0x00010005
_0803BBAC: .4byte 0x0202E3E4

	thumb_func_start sub_0803BBB0
sub_0803BBB0: @ 0x0803BBB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0xff
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r1, _0803BCDC @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803BCCA
	ldr r0, _0803BCE0 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08037A40
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0801B528
	bl sub_0801A4DC
	ldr r0, _0803BCE4 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803BCAA
_0803BBFE:
	ldr r0, _0803BCE4 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt _0803BCA4
	lsls r1, r7, #2
	mov r8, r1
_0803BC12:
	ldr r0, _0803BCE8 @ =gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803BC9E
	ldr r0, _0803BCEC @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803BC9E
	bl GetUnit
	adds r5, r0, #0
	ldr r1, _0803BCDC @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803BC5A
	mov r2, sb
	cmp r2, #0
	beq _0803BC5A
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803BC9E
_0803BC5A:
	adds r0, r5, #0
	bl GetUnitResistance
	cmp r0, sl
	bgt _0803BC9E
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_0803B034
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BC9E
	adds r0, r5, #0
	bl GetUnitResistance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803BCEC @ =gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803BC9E:
	subs r4, #1
	cmp r4, #0
	bge _0803BC12
_0803BCA4:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803BBFE
_0803BCAA:
	mov r2, sl
	cmp r2, #0xff
	beq _0803BCCA
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_08035328
_0803BCCA:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BCDC: .4byte 0x0203A8E8
_0803BCE0: .4byte gActiveUnit
_0803BCE4: .4byte gBmMapSize
_0803BCE8: .4byte gBmMapMovement
_0803BCEC: .4byte gBmMapUnit

	thumb_func_start sub_0803BCF0
sub_0803BCF0: @ 0x0803BCF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	mov r8, r0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0803BDC4 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	str r0, [sp, #0x10]
	bl GetActiveFactionAlliance
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #0x80
	cmp r4, r0
	blt _0803BD2A
	b _0803BE52
_0803BD2A:
	adds r0, r4, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x18]
	cmp r7, #0
	bne _0803BD42
	b _0803BE48
_0803BD42:
	ldr r0, [r7]
	cmp r0, #0
	bne _0803BD4A
	b _0803BE48
_0803BD4A:
	ldr r0, [r7, #0xc]
	ldr r1, _0803BDC8 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803BE48
	adds r0, r7, #0
	bl sub_0803C540
	ldr r0, _0803BDCC @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803BE22
_0803BD66:
	ldr r0, _0803BDCC @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r6, #1
	mov sb, r0
	cmp r4, #0
	blt _0803BE1C
	ldr r3, _0803BDD0 @ =0x0202E3E4
	lsls r5, r6, #2
_0803BD7A:
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r1, [r2]
	cmp r1, #0x78
	bhi _0803BE16
	ldr r0, _0803BDD4 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803BDD8
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	str r3, [sp, #0x20]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne _0803BE16
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	ble _0803BE16
	ldrb r1, [r1]
	mov r8, r1
	b _0803BE16
	.align 2, 0
_0803BDC4: .4byte gActiveUnit
_0803BDC8: .4byte 0x00010025
_0803BDCC: .4byte gBmMapSize
_0803BDD0: .4byte 0x0202E3E4
_0803BDD4: .4byte gBmMapUnit
_0803BDD8:
	ldr r0, _0803BE5C @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0803BE16
	ldr r0, _0803BE60 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x78
	ble _0803BE16
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp sl, r0
	ble _0803BE16
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r2, [r2]
	mov sl, r2
_0803BE16:
	subs r4, #1
	cmp r4, #0
	bge _0803BD7A
_0803BE1C:
	mov r6, sb
	cmp r6, #0
	bge _0803BD66
_0803BE22:
	mov r0, r8
	cmp r0, #0xff
	beq _0803BE48
	ldr r1, [sp, #4]
	cmp r1, r8
	blo _0803BE48
	mov r0, sl
	cmp r0, #0xff
	beq _0803BE48
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldr r1, [sp]
	strh r0, [r1, #2]
	mov r1, r8
	str r1, [sp, #4]
_0803BE48:
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	cmp r4, r0
	bge _0803BE52
	b _0803BD2A
_0803BE52:
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _0803BE64
	movs r0, #0
	b _0803BE66
	.align 2, 0
_0803BE5C: .4byte gBmMapTerrain
_0803BE60: .4byte gBmMapMovement
_0803BE64:
	movs r0, #1
_0803BE66:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803BE78
sub_0803BE78: @ 0x0803BE78
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _0803BEA8 @ =0x081D9470
	ldrh r0, [r3]
	cmp r0, #0
	beq _0803BEBC
	movs r1, #0
	adds r2, r3, #0
	adds r6, r2, #4
_0803BE96:
	ldrh r0, [r2]
	cmp r5, r0
	bne _0803BEAC
	adds r0, r1, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _0803BEAC
	adds r0, r4, #0
	b _0803BEC0
	.align 2, 0
_0803BEA8: .4byte 0x081D9470
_0803BEAC:
	adds r1, #8
	adds r2, #8
	adds r4, #1
	ldr r3, _0803BEC8 @ =0x081D9470
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803BE96
_0803BEBC:
	movs r0, #1
	rsbs r0, r0, #0
_0803BEC0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803BEC8: .4byte 0x081D9470

	thumb_func_start sub_0803BECC
sub_0803BECC: @ 0x0803BECC
	push {r4, r5, r6, lr}
	ldr r1, _0803BEE0 @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803BEE4
	movs r0, #0
	b _0803BF56
	.align 2, 0
_0803BEE0: .4byte 0x0203A8E8
_0803BEE4:
	movs r5, #0
	ldr r0, _0803BF44 @ =gActiveUnit
	ldr r0, [r0]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _0803BF2E
	ldr r6, _0803BF48 @ =0x081D9474
_0803BEF2:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0803BF18
	adds r0, r4, #0
	bl sub_0803BE78
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803BF18
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_0803BF18:
	adds r5, #1
	cmp r5, #4
	bgt _0803BF2E
	ldr r0, _0803BF44 @ =gActiveUnit
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803BEF2
_0803BF2E:
	ldr r0, _0803BF4C @ =0x0203A8E8
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BF54
	ldr r0, _0803BF50 @ =0x0203A978
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803BF56
	.align 2, 0
_0803BF44: .4byte gActiveUnit
_0803BF48: .4byte 0x081D9474
_0803BF4C: .4byte 0x0203A8E8
_0803BF50: .4byte 0x0203A978
_0803BF54:
	movs r0, #1
_0803BF56:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0803BF5C
sub_0803BF5C: @ 0x0803BF5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, _0803BFE4 @ =0x0203A8E8
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, _0803BFE8 @ =0x80000001
	ands r0, r1
	cmp r0, #0
	beq _0803BFDA
	ldr r0, _0803BFEC @ =gActiveUnit
	ldr r0, [r0]
	add r5, sp, #0xc
	adds r1, r5, #0
	bl sub_0803C19C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BFDA
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl sub_08036FD8
	ldr r4, _0803BFF0 @ =0x0203A978
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	bne _0803BFDA
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	movs r5, #0
	str r5, [sp]
	bl sub_0803757C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BFDA
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl sub_08035328
_0803BFDA:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803BFE4: .4byte 0x0203A8E8
_0803BFE8: .4byte 0x80000001
_0803BFEC: .4byte gActiveUnit
_0803BFF0: .4byte 0x0203A978

	thumb_func_start sub_0803BFF4
sub_0803BFF4: @ 0x0803BFF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r5, #0
	ldr r6, _0803C034 @ =0x0203A8E8
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C0C6
	ldr r4, _0803C038 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble _0803C03C
	ldr r2, [r4]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0803C03C
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	adds r0, r6, #0
	adds r0, #0x79
	strb r5, [r0]
	b _0803C0C6
	.align 2, 0
_0803C034: .4byte 0x0203A8E8
_0803C038: .4byte gActiveUnit
_0803C03C:
	ldr r6, _0803C0D0 @ =gActiveUnit
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r4, #4
	ands r0, r4
	cmp r0, #0
	beq _0803C0C6
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #4
	ble _0803C05E
	orrs r5, r4
_0803C05E:
	ldr r0, [r6]
	add r6, sp, #0xc
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0803C218
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C0C6
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, _0803C0D4 @ =0x0203A8E8
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl sub_08036FD8
	ldr r4, _0803C0D8 @ =0x0203A978
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	bne _0803C0C6
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl sub_0803757C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C0C6
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl sub_08035328
_0803C0C6:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C0D0: .4byte gActiveUnit
_0803C0D4: .4byte 0x0203A8E8
_0803C0D8: .4byte 0x0203A978

	thumb_func_start sub_0803C0DC
sub_0803C0DC: @ 0x0803C0DC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0803C13C @ =0x0203A8E8
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803C132
	ldr r0, _0803C140 @ =gActiveUnit
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _0803C132
	add r4, sp, #0xc
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_08036DD8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C132
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl sub_08035328
_0803C132:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803C13C: .4byte 0x0203A8E8
_0803C140: .4byte gActiveUnit

	thumb_func_start sub_0803C144
sub_0803C144: @ 0x0803C144
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803C17C @ =0x0202E3E4
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803C178
	ldr r0, _0803C180 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803C188
	ldr r0, _0803C184 @ =gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803C188
_0803C178:
	movs r0, #0xff
	b _0803C194
	.align 2, 0
_0803C17C: .4byte 0x0202E3E4
_0803C180: .4byte gBmMapUnit
_0803C184: .4byte gActiveUnitId
_0803C188:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803C194:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803C19C
sub_0803C19C: @ 0x0803C19C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_0803C4A8
	ldr r0, _0803C1E0 @ =0x08C07DA8
	movs r1, #0
	adds r2, r4, #0
	bl sub_08036478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C1E8
	adds r0, r5, #0
	bl sub_0803C384
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803C1E4 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803C1E8
	movs r0, #1
	b _0803C1EA
	.align 2, 0
_0803C1E0: .4byte 0x08C07DA8
_0803C1E4: .4byte 0x0202E3E4
_0803C1E8:
	movs r0, #0
_0803C1EA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0803C1F0
sub_0803C1F0: @ 0x0803C1F0
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0803C384
	ldr r0, _0803C20C @ =0x08C07DAA
	movs r1, #0
	adds r2, r4, #0
	bl sub_0803631C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C210
	movs r0, #1
	b _0803C212
	.align 2, 0
_0803C20C: .4byte 0x08C07DAA
_0803C210:
	movs r0, #0
_0803C212:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803C218
sub_0803C218: @ 0x0803C218
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl sub_0803C354
	adds r0, r5, #0
	bl sub_0803C474
	movs r0, #1
	orrs r0, r6
	adds r1, r4, #0
	bl sub_080365C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C264
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803C260 @ =gBmMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803C264
_0803C25A:
	movs r0, #1
	b _0803C2AA
	.align 2, 0
_0803C260: .4byte gBmMapMovement
_0803C264:
	adds r0, r5, #0
	bl sub_0803C4A8
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080365C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C2A8
	movs r3, #2
	ldrsh r1, [r4, r3]
	ldr r0, _0803C2B0 @ =gBmMapMovement
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803C25A
	ldr r0, _0803C2B4 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803C25A
_0803C2A8:
	movs r0, #0
_0803C2AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803C2B0: .4byte gBmMapMovement
_0803C2B4: .4byte gBmMapUnit

	thumb_func_start sub_0803C2B8
sub_0803C2B8: @ 0x0803C2B8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #1
	ldr r3, _0803C2D8 @ =0x03004310
	movs r5, #1
_0803C2C2:
	adds r0, r4, r2
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0803C2DC
	adds r0, r2, r3
	strb r1, [r0]
	b _0803C2E0
	.align 2, 0
_0803C2D8: .4byte 0x03004310
_0803C2DC:
	adds r0, r2, r3
	strb r5, [r0]
_0803C2E0:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _0803C2C2
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0803C2F0
sub_0803C2F0: @ 0x0803C2F0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r2, #1
	ldr r6, _0803C31C @ =0x03004310
	adds r4, r6, #0
_0803C2FC:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _0803C2FC
	adds r1, r5, r6
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C31C: .4byte 0x03004310

	thumb_func_start sub_0803C320
sub_0803C320: @ 0x0803C320
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r3, #1
	ldr r2, _0803C350 @ =0x03004310
	adds r5, r2, #0
_0803C32E:
	adds r1, r3, r5
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x40
	bls _0803C32E
	adds r0, r6, r2
	movs r1, #1
	strb r1, [r0]
	adds r0, r7, r2
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C350: .4byte 0x03004310

	thumb_func_start sub_0803C354
sub_0803C354: @ 0x0803C354
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _0803C380 @ =gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C380: .4byte gBmMapMovement

	thumb_func_start sub_0803C384
sub_0803C384: @ 0x0803C384
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _0803C3B0 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C3B0: .4byte 0x0202E3E4

	thumb_func_start sub_0803C3B4
sub_0803C3B4: @ 0x0803C3B4
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_0803C2B8
	ldr r0, _0803C3E0 @ =gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C3E0: .4byte gBmMapMovement

	thumb_func_start sub_0803C3E4
sub_0803C3E4: @ 0x0803C3E4
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_0803C2B8
	ldr r0, _0803C410 @ =gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C410: .4byte gBmMapMovement

	thumb_func_start sub_0803C414
sub_0803C414: @ 0x0803C414
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl sub_0803C2B8
	ldr r0, _0803C43C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl sub_0801A0E0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803C43C: .4byte 0x0202E3E4

	thumb_func_start sub_0803C440
sub_0803C440: @ 0x0803C440
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl sub_0803C2B8
	ldr r0, _0803C470 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl sub_0801A0E0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C470: .4byte 0x0202E3E4

	thumb_func_start sub_0803C474
sub_0803C474: @ 0x0803C474
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl sub_0803C2F0
	ldr r0, _0803C4A4 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C4A4: .4byte 0x0202E3E4

	thumb_func_start sub_0803C4A8
sub_0803C4A8: @ 0x0803C4A8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl sub_0803C2F0
	ldr r0, _0803C4D4 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C4D4: .4byte 0x0202E3E4

	thumb_func_start sub_0803C4D8
sub_0803C4D8: @ 0x0803C4D8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_0803C320
	ldr r0, _0803C508 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C508: .4byte 0x0202E3E4

	thumb_func_start sub_0803C50C
sub_0803C50C: @ 0x0803C50C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_0803C320
	ldr r0, _0803C53C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C53C: .4byte 0x0202E3E4

	thumb_func_start sub_0803C540
sub_0803C540: @ 0x0803C540
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _0803C578 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C578: .4byte 0x0202E3E4

	thumb_func_start sub_0803C57C
sub_0803C57C: @ 0x0803C57C
	adds r0, #0x40
	movs r1, #0x80
	lsls r1, r1, #6
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0803C59C
	ldr r0, _0803C598 @ =0x0203A8E8
	adds r0, #0x7b
	movs r1, #2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	b _0803C5A8
	.align 2, 0
_0803C598: .4byte 0x0203A8E8
_0803C59C:
	ldr r1, _0803C5AC @ =0x0203A8E8
	adds r1, #0x7b
	movs r0, #0xfd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0803C5A8:
	bx lr
	.align 2, 0
_0803C5AC: .4byte 0x0203A8E8

	thumb_func_start sub_0803C5B0
sub_0803C5B0: @ 0x0803C5B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _0803C5E0 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl sub_0801A0E0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C5E0: .4byte 0x0202E3E4
