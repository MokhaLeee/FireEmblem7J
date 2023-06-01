	.include "macro.inc"

	.syntax unified

	thumb_func_start NextRN
NextRN: @ 0x08000BB8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08000C74 @ =0x03000000
	ldrh r2, [r1, #2]
	lsls r1, r2, #0xb
	ldr r2, _08000C74 @ =0x03000000
	ldrh r3, [r2]
	lsrs r2, r3, #5
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08000C74 @ =0x03000000
	ldr r1, _08000C74 @ =0x03000000
	ldrh r2, [r1, #4]
	lsls r1, r2, #1
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08000C74 @ =0x03000000
	ldrh r1, [r0, #2]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08000C1A
	ldr r1, _08000C74 @ =0x03000000
	ldr r0, _08000C74 @ =0x03000000
	ldr r1, _08000C74 @ =0x03000000
	ldrh r2, [r1, #4]
	adds r1, r2, #1
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
_08000C1A:
	adds r0, r7, #0
	adds r1, r7, #0
	ldr r2, _08000C74 @ =0x03000000
	ldrh r1, [r1]
	ldrh r2, [r2, #4]
	eors r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08000C74 @ =0x03000000
	ldr r1, _08000C74 @ =0x03000000
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08000C74 @ =0x03000000
	ldr r1, _08000C74 @ =0x03000000
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, _08000C74 @ =0x03000000
	adds r1, r7, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	adds r0, r1, #0
	b _08000C78
	.align 2, 0
_08000C74: .4byte 0x03000000
_08000C78:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start InitRN
InitRN: @ 0x08000C80
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08000D30 @ =0x080C0C90
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x10
	bl memcpy
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #7
	bl __modsi3
	str r0, [r7, #0x14]
	ldr r0, _08000D34 @ =0x03000000
	adds r1, r7, #4
	ldr r2, [r7, #0x14]
	movs r3, #7
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, _08000D34 @ =0x03000000
	adds r1, r7, #4
	ldr r2, [r7, #0x14]
	movs r3, #7
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, _08000D34 @ =0x03000000
	adds r1, r7, #4
	ldr r2, [r7, #0x14]
	movs r3, #7
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x17
	bl __modsi3
	str r0, [r7, #0x18]
	movs r0, #0
	str r0, [r7, #0x14]
_08000D26:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	cmp r0, r1
	blt _08000D38
	b _08000D44
	.align 2, 0
_08000D30: .4byte 0x080C0C90
_08000D34: .4byte 0x03000000
_08000D38:
	bl NextRN
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08000D26
_08000D44:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start LoadRNState
LoadRNState: @ 0x08000D4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08000DA4 @ =0x03000000
	ldr r0, [r7]
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r2, [r0]
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1]
	adds r0, #2
	str r0, [r7]
	ldr r1, _08000DA4 @ =0x03000000
	ldr r0, [r7]
	ldrh r2, [r1, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r2, [r0]
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1, #2]
	adds r0, #2
	str r0, [r7]
	ldr r0, _08000DA4 @ =0x03000000
	ldr r1, [r7]
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000DA4: .4byte 0x03000000

	thumb_func_start StoreRNState
StoreRNState: @ 0x08000DA8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08000DD8 @ =0x03000000
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08000DD8 @ =0x03000000
	ldrh r2, [r1, #2]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08000DD8 @ =0x03000000
	ldrh r2, [r1, #4]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000DD8: .4byte 0x03000000

	thumb_func_start NextRN_100
NextRN_100: @ 0x08000DDC
	push {r7, lr}
	mov r7, sp
	bl NextRN
	movs r2, #0x64
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _08000DF4
	ldr r1, _08000DFC @ =0x0000FFFF
	adds r0, r0, r1
_08000DF4:
	asrs r1, r0, #0x10
	adds r0, r1, #0
	b _08000E00
	.align 2, 0
_08000DFC: .4byte 0x0000FFFF
_08000E00:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NextRN_N
NextRN_N: @ 0x08000E08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl NextRN
	ldr r2, [r7]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _08000E24
	ldr r1, _08000E2C @ =0x0000FFFF
	adds r0, r0, r1
_08000E24:
	asrs r1, r0, #0x10
	adds r0, r1, #0
	b _08000E30
	.align 2, 0
_08000E2C: .4byte 0x0000FFFF
_08000E30:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start Roll1RN
Roll1RN: @ 0x08000E38
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl NextRN_100
	adds r1, r0, #0
	movs r0, #0
	ldr r2, [r7]
	cmp r2, r1
	ble _08000E50
	movs r0, #1
_08000E50:
	b _08000E52
_08000E52:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Roll2RN
Roll2RN: @ 0x08000E5C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl NextRN_100
	str r0, [r7, #4]
	bl NextRN_100
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	str r0, [r7, #4]
	movs r0, #0
	ldr r1, [r7]
	ldr r2, [r7, #4]
	cmp r1, r2
	ble _08000E8C
	movs r0, #1
_08000E8C:
	b _08000E8E
_08000E8E:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetLCGRNValue
SetLCGRNValue: @ 0x08000E98
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08000EB0 @ =0x03000008
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000EB0: .4byte 0x03000008

	thumb_func_start AdvanceGetLCGRNValue
AdvanceGetLCGRNValue: @ 0x08000EB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08000EE0 @ =0x03000008
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r1, r0, #2
	str r1, [r7]
	ldr r1, [r7]
	adds r0, r1, #1
	ldr r1, [r7]
	muls r0, r1, r0
	str r0, [r7]
	ldr r0, [r7]
	lsrs r1, r0, #2
	str r1, [r7]
	ldr r0, _08000EE0 @ =0x03000008
	ldr r1, [r7]
	str r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	b _08000EE4
	.align 2, 0
_08000EE0: .4byte 0x03000008
_08000EE4:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
