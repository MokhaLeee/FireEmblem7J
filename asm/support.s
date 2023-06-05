	.include "macro.inc"
	.syntax unified

	thumb_func_start GetUnitSupporterCount
GetUnitSupporterCount: @ 0x08026AB4
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026AC0
	ldrb r0, [r0, #0x15]
	b _08026AC2
_08026AC0:
	movs r0, #0
_08026AC2:
	bx lr

	thumb_func_start sub_08026AC4
sub_08026AC4: @ 0x08026AC4
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026AD2
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026AD4
_08026AD2:
	movs r0, #0
_08026AD4:
	bx lr
	.align 2, 0

	thumb_func_start sub_08026AD8
sub_08026AD8: @ 0x08026AD8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_08026AC4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	adds r5, r0, #1
	adds r6, r0, #0
	adds r6, #0x40
	cmp r5, r6
	bge _08026B16
_08026AF4:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026B10
	ldr r0, [r4]
	cmp r0, #0
	beq _08026B10
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _08026B10
	adds r0, r4, #0
	b _08026B18
_08026B10:
	adds r5, #1
	cmp r5, r6
	blt _08026AF4
_08026B16:
	movs r0, #0
_08026B18:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08026B20
sub_08026B20: @ 0x08026B20
	adds r0, #0x32
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xf0
	ble _08026B2E
	movs r0, #3
	b _08026B40
_08026B2E:
	cmp r0, #0xa0
	ble _08026B36
	movs r0, #2
	b _08026B40
_08026B36:
	cmp r0, #0x50
	bgt _08026B3E
	movs r0, #0
	b _08026B40
_08026B3E:
	movs r0, #1
_08026B40:
	bx lr
	.align 2, 0

	thumb_func_start sub_08026B44
sub_08026B44: @ 0x08026B44
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0
	cmp r6, r5
	bge _08026B66
_08026B56:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_08026B20
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _08026B56
_08026B66:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08026B70
sub_08026B70: @ 0x08026B70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _08026BC8 @ =gPlaySt
	mov r8, r0
	ldrb r3, [r0, #0x1b]
	cmp r3, #1
	beq _08026BBC
	ldr r0, [r2]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026BBC
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r6, [r0]
	adds r0, r2, #0
	adds r0, #0x32
	adds r7, r0, r1
	ldrb r5, [r7]
	ldr r4, _08026BCC @ =0x08C03440
	adds r0, r2, #0
	bl sub_08026B20
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, r6
	cmp r0, r1
	ble _08026BAE
	subs r6, r1, r5
_08026BAE:
	adds r0, r5, r6
	strb r0, [r7]
	mov r1, r8
	ldrh r1, [r1, #0x16]
	adds r0, r1, r6
	mov r2, r8
	strh r0, [r2, #0x16]
_08026BBC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026BC8: .4byte gPlaySt
_08026BCC: .4byte 0x08C03440

	thumb_func_start sub_08026BD0
sub_08026BD0: @ 0x08026BD0
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x32
	adds r2, r2, r1
	ldrb r3, [r2]
	adds r3, #1
	strb r3, [r2]
	ldr r3, _08026C00 @ =gPlaySt
	ldrh r2, [r3, #0x16]
	adds r2, #1
	strh r2, [r3, #0x16]
	ldr r2, [r0]
	ldrb r4, [r2, #4]
	bl sub_08026AC4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08027028
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026C00: .4byte gPlaySt

	thumb_func_start sub_08026C04
sub_08026C04: @ 0x08026C04
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08026C68 @ =gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08026C62
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08026C62
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08027078
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08026C62
	adds r0, r5, #0
	bl sub_08026B44
	cmp r0, #4
	bgt _08026C62
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08026AD8
	bl sub_08026B44
	cmp r0, #4
	bgt _08026C62
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	ldrb r7, [r0]
	ldr r4, _08026C6C @ =0x08C03440
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08026B20
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r7, #0xf1
	bne _08026C70
_08026C62:
	movs r0, #0
	b _08026C7A
	.align 2, 0
_08026C68: .4byte gPlaySt
_08026C6C: .4byte 0x08C03440
_08026C70:
	movs r1, #0
	cmp r7, r0
	bne _08026C78
	movs r1, #1
_08026C78:
	adds r0, r1, #0
_08026C7A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetUnitSupporterInitialExp
GetUnitSupporterInitialExp: @ 0x08026C80
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026C90
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026C94
_08026C90:
	movs r0, #1
	rsbs r0, r0, #0
_08026C94:
	bx lr
	.align 2, 0

	thumb_func_start sub_08026C98
sub_08026C98: @ 0x08026C98
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _08026CC6
_08026CAC:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08026AC4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r7
	bne _08026CC0
	adds r0, r4, #0
	b _08026CCA
_08026CC0:
	adds r4, #1
	cmp r4, r5
	blt _08026CAC
_08026CC6:
	movs r0, #1
	rsbs r0, r0, #0
_08026CCA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ClearUnitSupports
ClearUnitSupports: @ 0x08026CD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	bl GetUnitSupporterCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08026D18
	mov r8, r6
_08026CE6:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08026AD8
	adds r4, r0, #0
	cmp r4, #0
	beq _08026D12
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl sub_08026C98
	adds r1, r4, #0
	adds r1, #0x32
	adds r1, r1, r0
	mov r0, r8
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
_08026D12:
	adds r6, #1
	cmp r6, r7
	blt _08026CE6
_08026D18:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08026D24
sub_08026D24: @ 0x08026D24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08026DC4 @ =gPlaySt
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	beq _08026E10
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08026E10
	movs r4, #1
_08026D40:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov sb, r4
	cmp r5, #0
	beq _08026E0A
	ldr r0, [r5]
	cmp r0, #0
	beq _08026E0A
	ldr r0, [r5, #0xc]
	ldr r1, _08026DC8 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08026E0A
	adds r0, r5, #0
	bl sub_08026B44
	cmp r0, #4
	bgt _08026E0A
	adds r0, r5, #0
	bl GetUnitSupporterCount
	mov r8, r0
	movs r7, #0
	cmp r7, r8
	bge _08026E0A
_08026D78:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08026AD8
	adds r4, r0, #0
	cmp r4, #0
	beq _08026E04
	ldr r1, [r4, #0xc]
	ldr r0, _08026DC8 @ =0x0001000C
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0
	bne _08026E04
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	mov ip, r1
	cmp r0, #0
	bne _08026E04
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026DB0
	subs r1, r0, r2
_08026DB0:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08026DCC
	adds r0, r1, r2
	b _08026DD0
	.align 2, 0
_08026DC4: .4byte gPlaySt
_08026DC8: .4byte 0x0001000C
_08026DCC:
	subs r0, r0, r3
	adds r0, r1, r0
_08026DD0:
	cmp r0, #0
	beq _08026DDA
	cmp r0, #1
	beq _08026DE2
	b _08026E04
_08026DDA:
	ldrb r0, [r5, #0x1b]
	cmp r0, ip
	bne _08026E04
	b _08026DF2
_08026DE2:
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08026E04
	ands r6, r1
	cmp r6, #0
	bne _08026E04
_08026DF2:
	adds r0, r4, #0
	bl sub_08026B44
	cmp r0, #4
	bgt _08026E04
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08026B70
_08026E04:
	adds r7, #1
	cmp r7, r8
	blt _08026D78
_08026E0A:
	mov r4, sb
	cmp r4, #0x3f
	ble _08026D40
_08026E10:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08026E1C
sub_08026E1C: @ 0x08026E1C
	adds r2, r0, #0
	ldr r1, _08026E24 @ =0x08D61E78
	b _08026E34
	.align 2, 0
_08026E24: .4byte 0x08D61E78
_08026E28:
	ldrb r0, [r1]
	cmp r0, r2
	bne _08026E32
	adds r0, r1, #0
	b _08026E3A
_08026E32:
	adds r1, #8
_08026E34:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08026E28
_08026E3A:
	bx lr

	thumb_func_start sub_08026E3C
sub_08026E3C: @ 0x08026E3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	bl sub_08026E1C
	ldrb r2, [r0, #1]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #1]
	adds r1, r2, r1
	strb r1, [r4, #1]
	ldrb r2, [r0, #2]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #2]
	adds r1, r2, r1
	strb r1, [r4, #2]
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #3]
	adds r1, r2, r1
	strb r1, [r4, #3]
	ldrb r2, [r0, #4]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #4]
	adds r1, r2, r1
	strb r1, [r4, #4]
	ldrb r2, [r0, #5]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #5]
	adds r1, r2, r1
	strb r1, [r4, #5]
	ldrb r0, [r0, #6]
	muls r0, r5, r0
	ldrb r1, [r4, #6]
	adds r0, r1, r0
	strb r0, [r4, #6]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08026E94
sub_08026E94: @ 0x08026E94
	movs r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	bx lr

	thumb_func_start sub_08026EA4
sub_08026EA4: @ 0x08026EA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	bl sub_08026E94
	adds r0, r7, #0
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov r8, r1
	cmp sb, sl
	bge _08026F70
	subs r0, #1
	str r0, [sp]
_08026ED2:
	mov r1, sb
	asrs r1, r1, #1
	mov sb, r1
	adds r0, r7, #0
	mov r1, r8
	bl sub_08026AD8
	adds r5, r0, #0
	cmp r5, #0
	beq _08026F68
	ldr r1, _08026FA8 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08026F18
	movs r2, #0x10
	ldrsb r2, [r7, r2]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026F02
	subs r1, r0, r2
_08026F02:
	movs r3, #0x11
	ldrsb r3, [r7, r3]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _08026F12
	subs r0, r2, r3
_08026F12:
	adds r0, r1, r0
	cmp r0, #3
	bgt _08026F68
_08026F18:
	ldr r0, [r5, #0xc]
	ldr r1, _08026FAC @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08026F68
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl sub_08026C98
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08026B20
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_08026E3C
	adds r0, r7, #0
	mov r1, r8
	bl sub_08026B20
	adds r5, r0, #0
	ldr r0, [r7]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r5, #0
	bl sub_08026E3C
	cmp r4, #0
	beq _08026F68
	cmp r5, #0
	beq _08026F68
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r1
	add sb, r0
_08026F68:
	movs r0, #1
	add r8, r0
	cmp r8, sl
	blt _08026ED2
_08026F70:
	ldrb r1, [r6, #1]
	lsrs r0, r1, #1
	strb r0, [r6, #1]
	ldrb r1, [r6, #2]
	lsrs r0, r1, #1
	strb r0, [r6, #2]
	ldrb r1, [r6, #3]
	lsrs r0, r1, #1
	strb r0, [r6, #3]
	ldrb r1, [r6, #4]
	lsrs r0, r1, #1
	strb r0, [r6, #4]
	ldrb r1, [r6, #5]
	lsrs r0, r1, #1
	strb r0, [r6, #5]
	ldrb r1, [r6, #6]
	lsrs r0, r1, #1
	strb r0, [r6, #6]
	mov r0, sb
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026FA8: .4byte gBmSt
_08026FAC: .4byte 0x0001002C

	thumb_func_start sub_08026FB0
sub_08026FB0: @ 0x08026FB0
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026FBC
	adds r0, #0x79
	b _08026FC0
_08026FBC:
	movs r0, #1
	rsbs r0, r0, #0
_08026FC0:
	bx lr
	.align 2, 0

	thumb_func_start sub_08026FC4
sub_08026FC4: @ 0x08026FC4
	push {lr}
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026FD4
	adds r0, #0x79
	b _08026FD8
_08026FD4:
	movs r0, #1
	rsbs r0, r0, #0
_08026FD8:
	pop {r1}
	bx r1

	thumb_func_start GetSupportLevelUiChar
GetSupportLevelUiChar: @ 0x08026FDC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08026FFC @ =0x081C947C
	mov r0, sp
	movs r2, #4
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08026FFC: .4byte 0x081C947C

	thumb_func_start sub_08027000
sub_08027000: @ 0x08027000
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08027024 @ =0x081C94A0
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027024: .4byte 0x081C94A0

	thumb_func_start sub_08027028
sub_08027028: @ 0x08027028
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromCharId
	adds r7, r0, #0
	adds r1, r5, #0
	bl sub_08026C98
	adds r2, r0, #0
	adds r1, r7, #0
	adds r1, #0x39
	movs r4, #1
	adds r0, r4, #0
	lsls r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	bl GetUnitFromCharId
	adds r7, r0, #0
	adds r1, r6, #0
	bl sub_08026C98
	adds r2, r0, #0
	adds r0, r7, #0
	adds r0, #0x39
	lsls r4, r2
	ldrb r1, [r0]
	orrs r4, r1
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08027078
sub_08027078: @ 0x08027078
	adds r0, #0x39
	movs r2, #1
	lsls r2, r1
	ldrb r0, [r0]
	ands r2, r0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0

	thumb_func_start sub_08027090
sub_08027090: @ 0x08027090
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r4, #0
	bl sub_08026C98
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08026B20
	cmp r0, #2
	bgt _080270B8
	movs r0, #0
	b _080270BA
_080270B8:
	movs r0, #1
_080270BA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SwapUnitStats
SwapUnitStats: @ 0x080270C0
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _08027154
	cmp r3, #0
	beq _08027154
	ldrb r1, [r2, #8]
	ldrb r0, [r3, #8]
	strb r0, [r2, #8]
	strb r1, [r3, #8]
	ldrb r1, [r2, #9]
	ldrb r0, [r3, #9]
	strb r0, [r2, #9]
	strb r1, [r3, #9]
	ldrb r1, [r2, #0x12]
	ldrb r0, [r3, #0x12]
	strb r0, [r2, #0x12]
	strb r1, [r3, #0x12]
	ldrb r1, [r2, #0x13]
	ldrb r0, [r3, #0x13]
	strb r0, [r2, #0x13]
	strb r1, [r3, #0x13]
	ldrb r1, [r2, #0x14]
	ldrb r0, [r3, #0x14]
	strb r0, [r2, #0x14]
	strb r1, [r3, #0x14]
	ldrb r1, [r2, #0x15]
	ldrb r0, [r3, #0x15]
	strb r0, [r2, #0x15]
	strb r1, [r3, #0x15]
	ldrb r1, [r2, #0x16]
	ldrb r0, [r3, #0x16]
	strb r0, [r2, #0x16]
	strb r1, [r3, #0x16]
	ldrb r1, [r2, #0x17]
	ldrb r0, [r3, #0x17]
	strb r0, [r2, #0x17]
	strb r1, [r3, #0x17]
	ldrb r1, [r2, #0x18]
	ldrb r0, [r3, #0x18]
	strb r0, [r2, #0x18]
	strb r1, [r3, #0x18]
	ldrb r1, [r2, #0x19]
	ldrb r0, [r3, #0x19]
	strb r0, [r2, #0x19]
	strb r1, [r3, #0x19]
	ldrb r1, [r2, #0x1a]
	ldrb r0, [r3, #0x1a]
	strb r0, [r2, #0x1a]
	strb r1, [r3, #0x1a]
	ldrb r1, [r2, #0x1d]
	ldrb r0, [r3, #0x1d]
	strb r0, [r2, #0x1d]
	strb r1, [r3, #0x1d]
	ldrh r1, [r2, #0x1e]
	ldrh r0, [r3, #0x1e]
	strh r0, [r2, #0x1e]
	strh r1, [r3, #0x1e]
	ldrh r1, [r2, #0x20]
	ldrh r0, [r3, #0x20]
	strh r0, [r2, #0x20]
	strh r1, [r3, #0x20]
	ldrh r1, [r2, #0x22]
	ldrh r0, [r3, #0x22]
	strh r0, [r2, #0x22]
	strh r1, [r3, #0x22]
	ldrh r1, [r2, #0x24]
	ldrh r0, [r3, #0x24]
	strh r0, [r2, #0x24]
	strh r1, [r3, #0x24]
	ldrh r1, [r2, #0x26]
	ldrh r0, [r3, #0x26]
	strh r0, [r2, #0x26]
	strh r1, [r3, #0x26]
_08027154:
	bx lr
	.align 2, 0
