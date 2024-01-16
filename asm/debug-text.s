	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugInitBg
DebugInitBg: @ 0x08004DD4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	bne _08004DE2
	movs r6, #0xb0
	lsls r6, r6, #7
_08004DE2:
	adds r0, r5, #0
	movs r1, #0
	bl SetBgChrOffset
	adds r0, r5, #0
	movs r1, #0
	bl SetBgScreenSize
	ldr r0, _08004E38 @ =0x08BBFD90
	ldr r1, _08004E3C @ =0x0001FFFF
	ands r1, r6
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r1, _08004E40 @ =gPal
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08004E44 @ =0x00007FFF
	strh r0, [r1, #4]
	bl EnablePalSync
	adds r0, r5, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, _08004E48 @ =0x02026D28
	strh r5, [r4, #4]
	str r6, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetBgChrId
	strh r0, [r4, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004E38: .4byte 0x08BBFD90
_08004E3C: .4byte 0x0001FFFF
_08004E40: .4byte gPal
_08004E44: .4byte 0x00007FFF
_08004E48: .4byte 0x02026D28

	thumb_func_start sub_08004E4C
sub_08004E4C: @ 0x08004E4C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldrb r0, [r1]
	ldr r5, _08004E6C @ =0x02026D28
	cmp r0, #0
	beq _08004E8A
	adds r3, r5, #0
	ldr r4, _08004E70 @ =0x0000FFC0
_08004E5C:
	cmp r0, #0x60
	bls _08004E74
	ldrh r6, [r3, #6]
	adds r0, r6, r4
	ldrb r7, [r1]
	adds r0, r7, r0
	b _08004E7E
	.align 2, 0
_08004E6C: .4byte 0x02026D28
_08004E70: .4byte 0x0000FFC0
_08004E74:
	ldrh r6, [r3, #6]
	ldr r7, _08004E98 @ =0x0000FFE0
	adds r0, r6, r7
	ldrb r6, [r1]
	adds r0, r6, r0
_08004E7E:
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08004E5C
_08004E8A:
	movs r7, #4
	ldrsh r0, [r5, r7]
	bl EnableBgSyncById
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004E98: .4byte 0x0000FFE0

	thumb_func_start sub_08004E9C
sub_08004E9C: @ 0x08004E9C
	push {r1, r2, r3}
	push {lr}
	sub sp, #0x100
	mov r1, sp
	bl sub_08004E4C
	add sp, #0x100
	pop {r3}
	add sp, #0xc
	bx r3

	thumb_func_start sub_08004EB0
sub_08004EB0: @ 0x08004EB0
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r2, _08004EEC @ =0x02026D28
	ldr r6, _08004EF0 @ =gBg2Tm
	movs r5, #0xff
	adds r4, r2, #0
	adds r4, #0x14
	movs r3, #0
_08004EC0:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r4
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0xff
	ble _08004EC0
	movs r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004EEC: .4byte 0x02026D28
_08004EF0: .4byte gBg2Tm

	thumb_func_start sub_08004EF4
sub_08004EF4: @ 0x08004EF4
	push {r0, r1, r2, r3}
	push {lr}
	sub sp, #0x100
	mov r0, sp
	bl sub_08005010
	add sp, #0x100
	pop {r3}
	add sp, #0x10
	bx r3

	thumb_func_start sub_08004F08
sub_08004F08: @ 0x08004F08
	ldr r1, _08004F18 @ =0x02028D3C
	ldr r0, _08004F1C @ =0x20202020
	stm r1!, {r0}
	str r0, [r1]
	ldr r1, _08004F18 @ =0x02028D3C
	movs r0, #0
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_08004F18: .4byte 0x02028D3C
_08004F1C: .4byte 0x20202020

	thumb_func_start sub_08004F20
sub_08004F20: @ 0x08004F20
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_08004F08
	movs r6, #7
	b _08004F32
_08004F2C:
	subs r6, #1
	cmp r6, #0
	blt _08004F50
_08004F32:
	ldr r4, _08004F58 @ =0x02028D3C
	adds r4, r6, r4
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _08004F2C
_08004F50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004F58: .4byte 0x02028D3C

	thumb_func_start sub_08004F5C
sub_08004F5C: @ 0x08004F5C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08004F08
	cmp r4, #0xff
	beq _08004F70
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08004F80
_08004F70:
	ldr r1, _08004F7C @ =0x02028D3C
	movs r0, #0x3a
	strb r0, [r1, #7]
	strb r0, [r1, #6]
	b _08004F86
	.align 2, 0
_08004F7C: .4byte 0x02028D3C
_08004F80:
	adds r0, r4, #0
	bl sub_08004F20
_08004F86:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08004F8C
sub_08004F8C: @ 0x08004F8C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08004F20
	ldr r0, _08004FA4 @ =0x02028D44
	subs r0, r0, r4
	bl sub_08005010
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004FA4: .4byte 0x02028D44

	thumb_func_start sub_08004FA8
sub_08004FA8: @ 0x08004FA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_08004F08
	movs r2, #7
	ldr r1, _08004FEC @ =0x02028D3C
	ldr r3, _08004FF0 @ =0x0818F8E4
	movs r0, #0xf
	ands r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1, #7]
	asrs r4, r4, #4
	cmp r4, #0
	beq _08004FE4
	adds r6, r1, #0
	adds r5, r3, #0
	movs r3, #0xf
_08004FCC:
	subs r2, #1
	cmp r2, #0
	blt _08004FE4
	adds r0, r2, r6
	adds r1, r4, #0
	ands r1, r3
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	asrs r4, r4, #4
	cmp r4, #0
	bne _08004FCC
_08004FE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004FEC: .4byte 0x02028D3C
_08004FF0: .4byte 0x0818F8E4

	thumb_func_start sub_08004FF4
sub_08004FF4: @ 0x08004FF4
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08004FA8
	ldr r0, _0800500C @ =0x02028D44
	subs r0, r0, r4
	bl sub_08005010
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800500C: .4byte 0x02028D44

	thumb_func_start sub_08005010
sub_08005010: @ 0x08005010
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldr r1, _0800502C @ =0x02026D28
	mov ip, r1
	cmp r0, #0
	beq _08005062
	mov r3, ip
_08005020:
	ldrb r2, [r4]
	ldr r0, [r3, #8]
	cmp r0, #0x30
	bne _08005030
	movs r2, #0
	b _08005032
	.align 2, 0
_0800502C: .4byte 0x02026D28
_08005030:
	adds r4, #1
_08005032:
	cmp r2, #0xa
	bne _08005038
	movs r2, #0
_08005038:
	ldrb r0, [r3, #0xc]
	lsls r1, r0, #5
	ldr r0, [r3, #8]
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x14
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3, #8]
	adds r0, #1
	str r0, [r3, #8]
	cmp r2, #0
	bne _0800505C
	mov r1, ip
	str r2, [r1, #8]
	ldr r0, [r1, #0xc]
	adds r0, #1
	str r0, [r1, #0xc]
_0800505C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005020
_08005062:
	mov r2, ip
	ldr r0, [r2, #0x10]
	adds r0, #0x14
	ldr r1, [r2, #0xc]
	cmp r1, r0
	bls _08005074
	adds r0, r1, #0
	subs r0, #0x14
	str r0, [r2, #0x10]
_08005074:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800507C
sub_0800507C: @ 0x0800507C
	push {r4, r5, r6, r7, lr}
	ldr r0, _080050C4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r3, #0
	ldr r7, _080050C8 @ =0x02026D28
	movs r0, #0x14
	adds r0, r0, r7
	mov ip, r0
	movs r6, #0xff
_08005092:
	lsls r1, r3, #6
	ldr r0, _080050C4 @ =gBg2Tm
	adds r2, r1, r0
	ldr r0, [r7, #0x10]
	adds r0, r3, r0
	ands r0, r6
	lsls r0, r0, #5
	add r0, ip
	ldrb r0, [r0]
	adds r5, r3, #1
	cmp r0, #0
	beq _080050E2
	ldr r4, _080050C8 @ =0x02026D28
	ldr r0, [r4, #0x10]
	adds r0, r3, r0
	ands r0, r6
	lsls r0, r0, #5
	adds r1, r4, #0
	adds r1, #0x14
	adds r1, r0, r1
_080050BA:
	ldrb r0, [r1]
	cmp r0, #0x60
	bls _080050CC
	subs r0, #0x40
	b _080050CE
	.align 2, 0
_080050C4: .4byte gBg2Tm
_080050C8: .4byte 0x02026D28
_080050CC:
	subs r0, #0x20
_080050CE:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #6]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080050BA
_080050E2:
	adds r3, r5, #0
	cmp r3, #0x13
	ble _08005092
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080050F4
sub_080050F4: @ 0x080050F4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800510A
	movs r0, #0
	b _0800514E
_0800510A:
	bl sub_0800507C
	ldr r3, _08005154 @ =0x02026D28
	ldr r0, [r3, #0xc]
	ldr r2, _08005158 @ =0xFFFFFF00
	adds r1, r0, r2
	cmp r1, #0
	bge _0800511C
	movs r1, #0
_0800511C:
	adds r2, r0, #0
	subs r2, #0x14
	cmp r2, #0
	bge _08005126
	movs r2, #0
_08005126:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _08005138
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bhs _08005138
	subs r0, #1
	str r0, [r3, #0x10]
_08005138:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0800514C
	ldr r1, _08005154 @ =0x02026D28
	ldr r0, [r1, #0x10]
	cmp r2, r0
	bls _0800514C
	adds r0, #1
	str r0, [r1, #0x10]
_0800514C:
	movs r0, #1
_0800514E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005154: .4byte 0x02026D28
_08005158: .4byte 0xFFFFFF00

	thumb_func_start sub_0800515C
sub_0800515C: @ 0x0800515C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bge _0800516A
	movs r2, #0xc0
	lsls r2, r2, #6
_0800516A:
	ldr r0, _080051CC @ =0x0000FFFF
	ands r2, r0
	ldr r1, _080051D0 @ =0x02028D48
	adds r0, r2, #0
	asrs r0, r0, #5
	str r0, [r1]
	ldr r1, _080051D4 @ =0x02028D4C
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	str r0, [r1]
	ldr r0, _080051D8 @ =0x08BBFD90
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r2, r3
	ldr r2, _080051DC @ =0x0001FFFF
	ands r1, r2
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r3, _080051E0 @ =gPal
	adds r1, r4, #0
	adds r1, #0x10
	lsls r0, r1, #5
	adds r0, r0, r3
	movs r2, #0
	strh r2, [r0]
	lsls r1, r1, #4
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0xf8
	lsls r2, r2, #7
	strh r2, [r0]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldr r0, _080051E4 @ =0x00007FFF
	strh r0, [r1]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080051CC: .4byte 0x0000FFFF
_080051D0: .4byte 0x02028D48
_080051D4: .4byte 0x02028D4C
_080051D8: .4byte 0x08BBFD90
_080051DC: .4byte 0x0001FFFF
_080051E0: .4byte gPal
_080051E4: .4byte 0x00007FFF

	thumb_func_start sub_080051E8
sub_080051E8: @ 0x080051E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	b _0800521A
_080051F2:
	cmp r0, #0x60
	bls _080051FA
	subs r0, #0x40
	b _080051FC
_080051FA:
	subs r0, #0x20
_080051FC:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08005228 @ =0x02028D48
	ldr r3, [r0]
	adds r3, r1, r3
	ldr r0, _0800522C @ =0x02028D4C
	ldr r0, [r0]
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _08005230 @ =Sprite_8x8
	bl PutOamHiRam
	adds r5, #8
	adds r4, #1
_0800521A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080051F2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005228: .4byte 0x02028D48
_0800522C: .4byte 0x02028D4C
_08005230: .4byte Sprite_8x8

	thumb_func_start sub_08005234
sub_08005234: @ 0x08005234
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl sub_08004F20
	ldr r2, _08005254 @ =0x02028D44
	subs r2, r2, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005254: .4byte 0x02028D44

	thumb_func_start sub_08005258
sub_08005258: @ 0x08005258
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl sub_08004FA8
	ldr r2, _08005278 @ =0x02028D44
	subs r2, r2, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005278: .4byte 0x02028D44
