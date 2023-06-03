
	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08000EEC
sub_08000EEC: @ 0x08000EEC
	push {r7, lr}
	mov r7, sp
	ldr r0, _08000EF8 @ =0x03000010
	ldr r1, [r0]
	adds r0, r1, #0
	b _08000EFC
	.align 2, 0
_08000EF8: .4byte 0x03000010
_08000EFC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08000F04
sub_08000F04: @ 0x08000F04
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08000F1C @ =0x03000010
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000F1C: .4byte 0x03000010

	thumb_func_start sub_08000F20
sub_08000F20: @ 0x08000F20
	push {r7, lr}
	mov r7, sp
	ldr r1, _08000F44 @ =0x03000010
	ldr r0, _08000F44 @ =0x03000010
	ldr r1, _08000F44 @ =0x03000010
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _08000F44 @ =0x03000010
	ldr r1, [r0]
	ldr r0, _08000F48 @ =0x0CDFE5FF
	cmp r1, r0
	bls _08000F50
	ldr r0, _08000F44 @ =0x03000010
	ldr r1, _08000F4C @ =0x0CBEF080
	str r1, [r0]
	b _08000F50
	.align 2, 0
_08000F44: .4byte 0x03000010
_08000F48: .4byte 0x0CDFE5FF
_08000F4C: .4byte 0x0CBEF080
_08000F50:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08000F58
sub_08000F58: @ 0x08000F58
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r4, [r7, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x3c
	bl __umodsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r4, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0xe1
	lsls r1, r1, #4
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x3c
	bl __umodsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r4, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	ldr r1, _08000FC8 @ =0x00034BC0
	bl __udivsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x1e
	bl __udivsi3
	adds r1, r0, #0
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	adds r0, r1, #0
	b _08000FCC
	.align 2, 0
_08000FC8: .4byte 0x00034BC0
_08000FCC:
	add sp, #0x10
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08000FD4
sub_08000FD4: @ 0x08000FD4
	push {r7, lr}
	mov r7, sp
	ldr r1, _08000FEC @ =0x0300000C
	ldr r2, _08000FEC @ =0x0300000C
	ldrb r3, [r2]
	adds r2, r0, #0
	orrs r3, r2
	adds r2, r3, #0
	strb r2, [r1]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000FEC: .4byte 0x0300000C

	thumb_func_start sub_08000FF0
sub_08000FF0: @ 0x08000FF0
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _0800100C @ =0x0300000C
	ldr r2, _0800100C @ =0x0300000C
	movs r4, #1
	adds r3, r4, #0
	lsls r3, r0
	ldrb r2, [r2]
	orrs r2, r3
	adds r3, r2, #0
	strb r3, [r1]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800100C: .4byte 0x0300000C

	thumb_func_start sub_08001010
sub_08001010: @ 0x08001010
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08001030 @ =0x0300000C
	ldr r2, _08001030 @ =0x0300000C
	adds r3, r0, #0
	mvns r4, r3
	ldrb r2, [r2]
	adds r3, r4, #0
	adds r4, r3, #0
	ands r2, r4
	adds r3, r2, #0
	strb r3, [r1]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001030: .4byte 0x0300000C

	thumb_func_start sub_08001034
sub_08001034: @ 0x08001034
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001044 @ =0x0300000D
	movs r1, #1
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001044: .4byte 0x0300000D

	thumb_func_start sub_08001048
sub_08001048: @ 0x08001048
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001058 @ =0x0300000D
	movs r1, #0
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001058: .4byte 0x0300000D

	thumb_func_start sub_0800105C
sub_0800105C: @ 0x0800105C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _08001098
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _08001094 @ =0x02022860
	adds r1, r0, r2
	ldr r0, [r7, #8]
	asrs r2, r0, #0x1f
	lsrs r3, r2, #0x1f
	adds r2, r0, r3
	asrs r0, r2, #1
	lsls r3, r0, #0xb
	lsrs r2, r3, #0xb
	ldr r0, [r7]
	bl CpuSet
	b _080010BA
	.align 2, 0
_08001094: .4byte 0x02022860
_08001098:
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _080010C8 @ =0x02022860
	adds r1, r0, r2
	ldr r2, [r7, #8]
	adds r0, r2, #0
	cmp r0, #0
	bge _080010AE
	adds r0, #3
_080010AE:
	asrs r0, r0, #2
	lsls r3, r0, #0xb
	lsrs r2, r3, #0xb
	ldr r0, [r7]
	bl CpuFastSet
_080010BA:
	bl sub_08001034
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080010C8: .4byte 0x02022860

	thumb_func_start sub_080010CC
sub_080010CC: @ 0x080010CC
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080010FC @ =0x02022860
	adds r0, r1, r0
	str r0, [r7, #0x14]
	ldr r0, [r7]
	str r0, [r7, #0x18]
	movs r0, #0
	str r0, [r7, #0x10]
_080010F0:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _08001100
	b _0800117A
	.align 2, 0
_080010FC: .4byte 0x02022860
_08001100:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	ldrh r2, [r1]
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	ldr r2, [r7, #0xc]
	muls r1, r2, r1
	asrs r2, r1, #6
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldr r2, [r7, #0x18]
	ldrh r3, [r2]
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, [r7, #0xc]
	muls r2, r3, r2
	asrs r3, r2, #6
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r2, r3
	adds r1, r1, r2
	ldr r2, [r7, #0x18]
	ldrh r3, [r2]
	movs r4, #0xf8
	lsls r4, r4, #7
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, [r7, #0xc]
	muls r2, r3, r2
	asrs r3, r2, #6
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r2, r3
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #2
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x18]
	adds r1, r0, #2
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _080010F0
_0800117A:
	bl sub_08001034
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08001188
sub_08001188: @ 0x08001188
	push {r7, lr}
	mov r7, sp
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldr r1, _0800125C @ =0x03002790
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001260 @ =0x04000004
	ldr r1, _08001264 @ =0x03002794
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001268 @ =0x04000008
	ldr r1, _0800126C @ =0x0300279C
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001270 @ =0x0400000A
	ldr r1, _08001274 @ =0x030027A0
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001278 @ =0x0400000C
	ldr r1, _0800127C @ =0x030027A4
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001280 @ =0x0400000E
	ldr r1, _08001284 @ =0x030027A8
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001288 @ =0x04000010
	ldr r1, _0800128C @ =0x030027AC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001290 @ =0x04000014
	ldr r1, _08001294 @ =0x030027B0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001298 @ =0x04000018
	ldr r1, _0800129C @ =0x030027B4
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012A0 @ =0x0400001C
	ldr r1, _080012A4 @ =0x030027B8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012A8 @ =0x04000040
	ldr r1, _080012AC @ =0x030027BC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012B0 @ =0x04000044
	ldr r1, _080012B4 @ =0x030027C0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012B8 @ =0x04000048
	ldr r1, _080012BC @ =0x030027C4
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012C0 @ =0x0400004C
	ldr r1, _080012C4 @ =0x030027C8
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012C8 @ =0x04000050
	ldr r1, _080012CC @ =0x030027CC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012D0 @ =0x04000052
	ldr r1, _080012D4 @ =0x030027D4
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012D8 @ =0x04000054
	ldr r1, _080012DC @ =0x030027D6
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, _080012E0 @ =0x04000020
	ldr r1, _080012E4 @ =0x030027D8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012E8 @ =0x04000024
	ldr r1, _080012EC @ =0x030027DC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012F0 @ =0x04000028
	ldr r1, _080012F4 @ =0x030027E0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012F8 @ =0x0400002C
	ldr r1, _080012FC @ =0x030027E4
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001300 @ =0x04000030
	ldr r1, _08001304 @ =0x030027E8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001308 @ =0x04000034
	ldr r1, _0800130C @ =0x030027EC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001310 @ =0x04000038
	ldr r1, _08001314 @ =0x030027F0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001318 @ =0x0400003C
	ldr r1, _0800131C @ =0x030027F4
	ldr r2, [r1]
	str r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800125C: .4byte 0x03002790
_08001260: .4byte 0x04000004
_08001264: .4byte 0x03002794
_08001268: .4byte 0x04000008
_0800126C: .4byte 0x0300279C
_08001270: .4byte 0x0400000A
_08001274: .4byte 0x030027A0
_08001278: .4byte 0x0400000C
_0800127C: .4byte 0x030027A4
_08001280: .4byte 0x0400000E
_08001284: .4byte 0x030027A8
_08001288: .4byte 0x04000010
_0800128C: .4byte 0x030027AC
_08001290: .4byte 0x04000014
_08001294: .4byte 0x030027B0
_08001298: .4byte 0x04000018
_0800129C: .4byte 0x030027B4
_080012A0: .4byte 0x0400001C
_080012A4: .4byte 0x030027B8
_080012A8: .4byte 0x04000040
_080012AC: .4byte 0x030027BC
_080012B0: .4byte 0x04000044
_080012B4: .4byte 0x030027C0
_080012B8: .4byte 0x04000048
_080012BC: .4byte 0x030027C4
_080012C0: .4byte 0x0400004C
_080012C4: .4byte 0x030027C8
_080012C8: .4byte 0x04000050
_080012CC: .4byte 0x030027CC
_080012D0: .4byte 0x04000052
_080012D4: .4byte 0x030027D4
_080012D8: .4byte 0x04000054
_080012DC: .4byte 0x030027D6
_080012E0: .4byte 0x04000020
_080012E4: .4byte 0x030027D8
_080012E8: .4byte 0x04000024
_080012EC: .4byte 0x030027DC
_080012F0: .4byte 0x04000028
_080012F4: .4byte 0x030027E0
_080012F8: .4byte 0x0400002C
_080012FC: .4byte 0x030027E4
_08001300: .4byte 0x04000030
_08001304: .4byte 0x030027E8
_08001308: .4byte 0x04000034
_0800130C: .4byte 0x030027EC
_08001310: .4byte 0x04000038
_08001314: .4byte 0x030027F0
_08001318: .4byte 0x0400003C
_0800131C: .4byte 0x030027F4

	thumb_func_start sub_08001320
sub_08001320: @ 0x08001320
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	cmp r0, #1
	beq _08001350
	cmp r0, #1
	bgt _0800133C
	cmp r0, #0
	beq _08001346
	b _08001368
_0800133C:
	cmp r0, #2
	beq _08001358
	cmp r0, #3
	beq _08001360
	b _08001368
_08001346:
	ldr r0, _0800134C @ =0x0300279C
	b _08001368
	.align 2, 0
_0800134C: .4byte 0x0300279C
_08001350:
	ldr r0, _08001354 @ =0x030027A0
	b _08001368
	.align 2, 0
_08001354: .4byte 0x030027A0
_08001358:
	ldr r0, _0800135C @ =0x030027A4
	b _08001368
	.align 2, 0
_0800135C: .4byte 0x030027A4
_08001360:
	ldr r0, _08001364 @ =0x030027A8
	b _08001368
	.align 2, 0
_08001364: .4byte 0x030027A8
_08001368:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08001370
sub_08001370: @ 0x08001370
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001320
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	lsls r0, r1, #0x1c
	lsrs r2, r0, #0x1e
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r2, r1, #0xe
	adds r0, r2, #0
	b _0800139C
_0800139C:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080013A4
sub_080013A4: @ 0x080013A4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7]
	bl sub_08001370
	ldr r2, [r7, #4]
	subs r1, r2, r0
	adds r0, r1, #0
	cmp r0, #0
	bge _080013C8
	adds r0, #0x1f
_080013C8:
	asrs r1, r0, #5
	adds r0, r1, #0
	b _080013CE
_080013CE:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080013D8
sub_080013D8: @ 0x080013D8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001320
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	lsls r0, r1, #0x13
	lsrs r2, r0, #0x1b
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r2, r1, #0xb
	adds r0, r2, #0
	b _08001404
_08001404:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800140C
sub_0800140C: @ 0x0800140C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001320
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	asrs r1, r2, #0xe
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	lsls r1, r2, #2
	ldrb r2, [r0]
	movs r3, #0xf3
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001450
sub_08001450: @ 0x08001450
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001320
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x15
	lsrs r0, r1, #0x15
	cmp r0, #0
	beq _08001476
	b _080014A8
_08001476:
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	asrs r1, r2, #0xb
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0, #1]
	movs r3, #0xe0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _080014B0 @ =0x02024C60
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	orrs r1, r2
	str r1, [r0]
_080014A8:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080014B0: .4byte 0x02024C60

	thumb_func_start sub_080014B4
sub_080014B4: @ 0x080014B4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001320
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, r1, #0
	lsls r1, r2, #6
	ldrb r2, [r0, #1]
	movs r3, #0x3f
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080014F0
sub_080014F0: @ 0x080014F0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08001320
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0
	ldr r2, [r7, #4]
	cmp r2, #8
	bne _08001516
	movs r1, #1
_08001516:
	adds r2, r1, #0
	lsls r1, r2, #7
	ldrb r2, [r0]
	movs r3, #0x7f
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08001534
sub_08001534: @ 0x08001534
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001554 @ =0x02022860
	str r0, [r7, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0xc]
_0800154A:
	ldr r0, [r7, #0xc]
	ldr r1, _08001558 @ =0x000001FF
	cmp r0, r1
	ble _0800155C
	b _080015F4
	.align 2, 0
_08001554: .4byte 0x02022860
_08001558: .4byte 0x000001FF
_0800155C:
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #5
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #0xa
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	cmp r0, #0x1f
	ble _080015B0
	movs r0, #0x1f
	str r0, [r7, #0x10]
_080015B0:
	ldr r0, [r7, #0x14]
	cmp r0, #0x1f
	ble _080015BA
	movs r0, #0x1f
	str r0, [r7, #0x14]
_080015BA:
	ldr r0, [r7, #0x18]
	cmp r0, #0x1f
	ble _080015C4
	movs r0, #0x1f
	str r0, [r7, #0x18]
_080015C4:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x18]
	adds r2, r1, #0
	lsls r1, r2, #0xa
	ldr r3, [r7, #0x14]
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #2
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0800154A
_080015F4:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080015FC
sub_080015FC: @ 0x080015FC
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800161C @ =0x02022860
	str r0, [r7, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0xc]
_08001612:
	ldr r0, [r7, #0xc]
	ldr r1, _08001620 @ =0x000001FF
	cmp r0, r1
	ble _08001624
	b _080016BC
	.align 2, 0
_0800161C: .4byte 0x02022860
_08001620: .4byte 0x000001FF
_08001624:
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #5
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #0xa
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bge _08001678
	movs r0, #0
	str r0, [r7, #0x10]
_08001678:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _08001682
	movs r0, #0
	str r0, [r7, #0x14]
_08001682:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bge _0800168C
	movs r0, #0
	str r0, [r7, #0x18]
_0800168C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x18]
	adds r2, r1, #0
	lsls r1, r2, #0xa
	ldr r3, [r7, #0x14]
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #2
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08001612
_080016BC:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080016C4
sub_080016C4: @ 0x080016C4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001784 @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080016EA
	ldr r0, _08001788 @ =0x02022C60
	ldr r2, _0800178C @ =0x02024C60
	ldr r1, [r2]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_080016EA:
	ldr r0, _08001784 @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800170C
	ldr r0, _08001790 @ =0x02023460
	ldr r2, _0800178C @ =0x02024C60
	ldr r1, [r2, #4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_0800170C:
	ldr r0, _08001784 @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0800172E
	ldr r0, _08001794 @ =0x02023C60
	ldr r2, _0800178C @ =0x02024C60
	ldr r1, [r2, #8]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_0800172E:
	ldr r0, _08001784 @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001750
	ldr r0, _08001798 @ =0x02024460
	ldr r2, _0800178C @ =0x02024C60
	ldr r1, [r2, #0xc]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001750:
	ldr r0, _08001784 @ =0x0300000C
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800179C @ =0x0300000D
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #1
	bne _080017DC
	ldr r0, _0800179C @ =0x0300000D
	movs r1, #0
	strb r1, [r0]
	ldr r1, _080017A0 @ =0x03002790
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080017A8
	ldr r0, _080017A4 @ =0x02022860
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	b _080017DC
	.align 2, 0
_08001784: .4byte 0x0300000C
_08001788: .4byte 0x02022C60
_0800178C: .4byte 0x02024C60
_08001790: .4byte 0x02023460
_08001794: .4byte 0x02023C60
_08001798: .4byte 0x02024460
_0800179C: .4byte 0x0300000D
_080017A0: .4byte 0x03002790
_080017A4: .4byte 0x02022860
_080017A8:
	ldr r1, _080017C8 @ =0x03002790
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080017CC
	ldr r1, _080017C8 @ =0x03002790
	adds r0, r1, #0
	adds r1, #0x68
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl sub_08001534
	b _080017DC
	.align 2, 0
_080017C8: .4byte 0x03002790
_080017CC:
	ldr r1, _080017E4 @ =0x03002790
	adds r0, r1, #0
	adds r1, #0x68
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl sub_080015FC
_080017DC:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080017E4: .4byte 0x03002790

	thumb_func_start sub_080017E8
sub_080017E8: @ 0x080017E8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	lsls r0, r1, #0x10
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #8
	ldr r2, _08001814 @ =0x01000200
	ldr r1, [r7]
	bl CpuFastSet
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001814: .4byte 0x01000200

	thumb_func_start sub_08001818
sub_08001818: @ 0x08001818
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	movs r0, #0
	movs r2, #0x20
	bl sub_08002FD8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetInterrupt_LCDVBlank
SetInterrupt_LCDVBlank: @ 0x0800183C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _08001878
	ldr r0, _08001870 @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	movs r0, #0
	ldr r1, [r7]
	bl SetIrqFunc
	ldr r0, _08001874 @ =0x04000200
	ldr r1, _08001874 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08001894
	.align 2, 0
_08001870: .4byte 0x03002790
_08001874: .4byte 0x04000200
_08001878:
	ldr r0, _0800189C @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #0xf7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _080018A0 @ =0x04000200
	ldr r1, _080018A0 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _080018A4 @ =0x0000FFFE
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08001894:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800189C: .4byte 0x03002790
_080018A0: .4byte 0x04000200
_080018A4: .4byte 0x0000FFFE

	thumb_func_start sub_080018A8
sub_080018A8: @ 0x080018A8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080018E4
	ldr r0, _080018DC @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	movs r0, #2
	ldr r1, [r7]
	bl SetIrqFunc
	ldr r0, _080018E0 @ =0x04000200
	ldr r1, _080018E0 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0800190C
	.align 2, 0
_080018DC: .4byte 0x03002790
_080018E0: .4byte 0x04000200
_080018E4:
	ldr r0, _08001914 @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08001918 @ =0x04000200
	ldr r1, _08001918 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _0800191C @ =0x0000FFFB
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08001914 @ =0x03002790
	ldrb r1, [r0, #5]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #5]
_0800190C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001914: .4byte 0x03002790
_08001918: .4byte 0x04000200
_0800191C: .4byte 0x0000FFFB

	thumb_func_start sub_08001920
sub_08001920: @ 0x08001920
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r1, _08001964 @ =0x04000004
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #4
	adds r1, r7, #4
	ldrh r2, [r1]
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #8
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08001964 @ =0x04000004
	adds r1, r7, #4
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001964: .4byte 0x04000004

	thumb_func_start sub_08001968
sub_08001968: @ 0x08001968
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800198C @ =0x03002790
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0, #5]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #5]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800198C: .4byte 0x03002790

	thumb_func_start SetMainUpdateRoutine
SetMainUpdateRoutine: @ 0x08001990
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080019A8 @ =0x02024C70
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019A8: .4byte 0x02024C70

	thumb_func_start sub_080019AC
sub_080019AC: @ 0x080019AC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080019C8 @ =0x02024C70
	ldr r1, [r0]
	cmp r1, #0
	beq _080019C0
	ldr r0, _080019C8 @ =0x02024C70
	ldr r4, [r0]
	bl _call_via_r4
_080019C0:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019C8: .4byte 0x02024C70

	thumb_func_start sub_080019CC
sub_080019CC: @ 0x080019CC
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r1, #0
	adds r1, r7, #4
	strh r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	ldr r0, [r7]
	adds r1, r7, #4
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r3, [r7]
	ldrh r2, [r2, #4]
	ldrh r3, [r3, #0xa]
	eors r2, r3
	ldr r3, [r7]
	ldrh r3, [r3, #4]
	adds r4, r3, #0
	ands r2, r4
	ldrh r3, [r1, #6]
	movs r4, #0
	ands r3, r4
	adds r4, r3, #0
	adds r3, r2, #0
	orrs r4, r3
	adds r3, r4, #0
	strh r3, [r1, #6]
	adds r1, r2, #0
	movs r2, #0
	bics r1, r2
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	cmp r1, #0
	beq _08001A60
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
_08001A60:
	ldr r0, [r7]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _08001AA8
	ldr r0, [r7]
	ldrh r1, [r0, #0xc]
	cmp r1, #0
	beq _08001AA8
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0xa]
	ldr r3, _08001B0C @ =0x00000303
	adds r1, r2, #0
	ands r1, r3
	ldrh r0, [r0, #0xc]
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	cmp r0, r1
	bne _08001AA8
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0xa]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
_08001AA8:
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _08001B10
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bne _08001B10
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r1, #2]
	subs r1, r2, #1
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _08001B0A
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
_08001B0A:
	b _08001B26
	.align 2, 0
_08001B0C: .4byte 0x00000303
_08001B10:
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
_08001B26:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldrh r1, [r1, #4]
	ldrh r2, [r2, #0x10]
	eors r1, r2
	ldr r2, [r7]
	ldrh r2, [r2, #4]
	adds r3, r2, #0
	ands r1, r3
	ldrh r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x10]
	adds r0, r7, #4
	ldrh r1, [r0]
	ldr r2, _08001B6C @ =0x000003F3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	beq _08001B70
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	b _08001B94
	.align 2, 0
_08001B6C: .4byte 0x000003F3
_08001B70:
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	ldr r0, _08001B9C @ =0x0000FFFE
	cmp r1, r0
	bhi _08001B94
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x12]
	adds r1, r2, #1
	ldrh r2, [r0, #0x12]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x12]
_08001B94:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001B9C: .4byte 0x0000FFFE

	thumb_func_start sub_08001BA0
sub_08001BA0: @ 0x08001BA0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001BEC @ =0x04000130
	ldrh r1, [r0]
	mvns r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0xf
	beq _08001BD4
	ldr r0, _08001BF0 @ =0x0300000E
	ldrh r1, [r0]
	mvns r0, r1
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r7, #4]
_08001BD4:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	ldr r0, [r7]
	bl sub_080019CC
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001BEC: .4byte 0x04000130
_08001BF0: .4byte 0x0300000E

	thumb_func_start sub_08001BF4
sub_08001BF4: @ 0x08001BF4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #6]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001C28
sub_08001C28: @ 0x08001C28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #1]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #2]
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	ldr r0, _08001CA4 @ =0x0300000E
	movs r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CA4: .4byte 0x0300000E

	thumb_func_start sub_08001CA8
sub_08001CA8: @ 0x08001CA8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001CC0 @ =0x0300000E
	ldr r1, [r7]
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CC0: .4byte 0x0300000E

	thumb_func_start sub_08001CC4
sub_08001CC4: @ 0x08001CC4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08001D28 @ =gpKeySt
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r1, _08001D28 @ =gpKeySt
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _08001D28 @ =gpKeySt
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
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
_08001D28: .4byte gpKeySt

	thumb_func_start sub_08001D2C
sub_08001D2C: @ 0x08001D2C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08001D60 @ =0x08BBFC80
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Start
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001D60: .4byte 0x08BBFC80

	thumb_func_start sub_08001D64
sub_08001D64: @ 0x08001D64
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	adds r3, r0, #0
	adds r0, r2, #0
	adds r2, r7, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	cmp r0, #1
	beq _08001DC8
	cmp r0, #1
	bgt _08001D8C
	cmp r0, #0
	beq _08001D96
	b _08001E64
_08001D8C:
	cmp r0, #2
	beq _08001DFC
	cmp r0, #3
	beq _08001E30
	b _08001E64
_08001D96:
	ldr r0, _08001DC4 @ =0x03002790
	adds r1, r7, #2
	ldrh r2, [r0, #0x1c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x1c]
	ldr r0, _08001DC4 @ =0x03002790
	adds r1, r7, #4
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x1e]
	b _08001E64
	.align 2, 0
_08001DC4: .4byte 0x03002790
_08001DC8:
	ldr r0, _08001DF8 @ =0x03002790
	adds r1, r7, #2
	ldrh r2, [r0, #0x20]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x20]
	ldr r0, _08001DF8 @ =0x03002790
	adds r1, r7, #4
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	b _08001E64
	.align 2, 0
_08001DF8: .4byte 0x03002790
_08001DFC:
	ldr r0, _08001E2C @ =0x03002790
	adds r1, r7, #2
	ldrh r2, [r0, #0x24]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x24]
	ldr r0, _08001E2C @ =0x03002790
	adds r1, r7, #4
	ldrh r2, [r0, #0x26]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x26]
	b _08001E64
	.align 2, 0
_08001E2C: .4byte 0x03002790
_08001E30:
	ldr r0, _08001E60 @ =0x03002790
	adds r1, r7, #2
	ldrh r2, [r0, #0x28]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x28]
	ldr r0, _08001E60 @ =0x03002790
	adds r1, r7, #4
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x2a]
	b _08001E64
	.align 2, 0
_08001E60: .4byte 0x03002790
_08001E64:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001E6C
sub_08001E6C: @ 0x08001E6C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001E94 @ =0x03000014
	ldr r1, _08001E98 @ =0x03000015
	movs r2, #0
	strb r2, [r1]
	movs r1, #0
	strb r1, [r0]
	ldr r1, _08001E9C @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl sub_080017E8
	movs r0, #1
	bl sub_08000FD4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001E94: .4byte 0x03000014
_08001E98: .4byte 0x03000015
_08001E9C: .4byte 0x02022C60

	thumb_func_start sub_08001EA0
sub_08001EA0: @ 0x08001EA0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r7, #0
	strb r2, [r1]
	adds r1, r7, #1
	strb r0, [r1]
	ldr r0, _08001ECC @ =0x03000014
	adds r1, r7, #0
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, _08001ED0 @ =0x03000015
	adds r1, r7, #1
	ldrb r2, [r1]
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001ECC: .4byte 0x03000014
_08001ED0: .4byte 0x03000015

	thumb_func_start sub_08001ED4
sub_08001ED4: @ 0x08001ED4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08001EEC @ =0x0000027F
	str r0, [r7, #8]
_08001EE2:
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _08001EF0
	b _08001F0A
	.align 2, 0
_08001EEC: .4byte 0x0000027F
_08001EF0:
	ldr r0, [r7]
	adds r1, r7, #4
	ldr r2, [r1]
	ldrh r3, [r2]
	strh r3, [r0]
	adds r2, #2
	str r2, [r1]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #8]
	subs r1, r0, #1
	str r1, [r7, #8]
	b _08001EE2
_08001F0A:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08001F14
sub_08001F14: @ 0x08001F14
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r2, #8
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #9
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x15
	ldr r1, [r7, #4]
	ldr r2, [r1]
	lsrs r1, r2, #8
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x15
	ldrb r2, [r1]
	strb r2, [r0]
_08001F5A:
	adds r0, r7, #0
	adds r0, #0x17
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001F68
	b _08001FE6
_08001F68:
	adds r1, r7, #0
	adds r1, #0x17
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r1, r7, #0
	adds r1, #9
	ldrb r2, [r1]
	lsls r0, r2
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x14
	ldrb r2, [r1]
	strb r2, [r0]
_08001F8A:
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001F98
	b _08001FD0
_08001F98:
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r0]
	adds r2, r7, #0
	adds r2, #0xc
	ldr r3, [r2]
	adds r4, r7, #0
	adds r4, #8
	ldrb r5, [r3]
	ldrb r4, [r4]
	adds r5, r5, r4
	adds r4, r5, #0
	strb r4, [r1]
	adds r3, #1
	str r3, [r2]
	adds r1, #1
	str r1, [r0]
	adds r1, r7, #0
	adds r1, #0x16
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x16
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001F8A
_08001FD0:
	adds r1, r7, #0
	adds r1, #0x17
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x17
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001F5A
_08001FE6:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08001FF0
sub_08001FF0: @ 0x08001FF0
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0xc]
	ldr r0, [r7, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	asrs r0, r1, #8
	adds r1, r0, #0
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #0x18]
_08002034:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _0800203E
	b _0800208C
_0800203E:
	ldr r1, [r7, #0x18]
	lsls r0, r1, #5
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x14]
_08002050:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	blt _0800205A
	b _08002084
_0800205A:
	adds r0, r7, #4
	ldr r1, [r0]
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #0x1c]
	adds r2, r3, r2
	str r2, [r7, #0x1c]
	adds r1, #2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	ldr r1, [r0]
	ldr r3, [r7, #0x1c]
	adds r2, r3, #0
	strh r2, [r1]
	adds r1, #2
	str r1, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002050
_08002084:
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _08002034
_0800208C:
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002094
sub_08002094: @ 0x08002094
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_0800209E:
	ldr r0, [r7]
	cmp r0, #0
	bge _080020A6
	b _080020C4
_080020A6:
	ldr r0, _080020C0 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _0800209E
	.align 2, 0
_080020C0: .4byte 0x02022240
_080020C4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080020CC
sub_080020CC: @ 0x080020CC
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _080020E4
	movs r0, #0x20
	b _080020E6
_080020E4:
	movs r0, #0
_080020E6:
	str r0, [r7, #0x18]
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #4
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_080020F8:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _08002102
	b _080021E8
_08002102:
	ldr r0, _0800212C @ =0x02022240
	ldr r1, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_08002122:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002130
	b _080021E0
	.align 2, 0
_0800212C: .4byte 0x02022240
_08002130:
	ldr r2, _080021DC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080021DC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080021DC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002122
	.align 2, 0
_080021DC: .4byte 0x02022260
_080021E0:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _080020F8
_080021E8:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080021F0
sub_080021F0: @ 0x080021F0
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08002220 @ =0x02022860
	adds r0, r1, r0
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_08002216:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _08002224
	b _08002308
	.align 2, 0
_08002220: .4byte 0x02022860
_08002224:
	ldr r0, _0800224C @ =0x02022240
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_08002244:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002250
	b _08002300
	.align 2, 0
_0800224C: .4byte 0x02022240
_08002250:
	ldr r2, _080022FC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080022FC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080022FC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #2
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002244
	.align 2, 0
_080022FC: .4byte 0x02022260
_08002300:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08002216
_08002308:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002310
sub_08002310: @ 0x08002310
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	str r0, [r7, #0xc]
_08002320:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _0800232E
	b _08002354
_0800232E:
	ldr r0, _08002350 @ =0x02022240
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08002320
	.align 2, 0
_08002350: .4byte 0x02022240
_08002354:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0800235C
sub_0800235C: @ 0x0800235C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_0800236A:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08002372
	b _0800248C
_08002372:
	ldr r0, _08002398 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_08002390:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _0800239C
	b _08002484
	.align 2, 0
_08002398: .4byte 0x02022240
_0800239C:
	ldr r0, _0800247C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002480 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0800247C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002480 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0800247C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002480 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08002390
	.align 2, 0
_0800247C: .4byte 0x02022260
_08002480: .4byte 0x02022860
_08002484:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _0800236A
_0800248C:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002494
sub_08002494: @ 0x08002494
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_080024A2:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080024AA
	b _080025B4
_080024AA:
	ldr r0, _080024D0 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_080024C8:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _080024D4
	b _080025AC
	.align 2, 0
_080024D0: .4byte 0x02022240
_080024D4:
	ldr r0, _080025A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _080025A8 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080025A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _080025A8 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080025A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080025A8 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080024C8
	.align 2, 0
_080025A4: .4byte 0x02022260
_080025A8: .4byte 0x02022860
_080025AC:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080024A2
_080025B4:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080025BC
sub_080025BC: @ 0x080025BC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_080025CA:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080025D2
	b _080026EC
_080025D2:
	ldr r0, _080025F8 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_080025F0:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _080025FC
	b _080026E4
	.align 2, 0
_080025F8: .4byte 0x02022240
_080025FC:
	ldr r0, _080026DC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _080026E0 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080026DC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _080026E0 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080026DC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080026E0 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080025F0
	.align 2, 0
_080026DC: .4byte 0x02022260
_080026E0: .4byte 0x02022860
_080026E4:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080025CA
_080026EC:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080026F4
sub_080026F4: @ 0x080026F4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_08002702:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0800270A
	b _08002824
_0800270A:
	ldr r0, _08002730 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_08002728:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08002734
	b _0800281C
	.align 2, 0
_08002730: .4byte 0x02022240
_08002734:
	ldr r0, _08002814 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002818 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002814 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002818 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002814 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002818 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08002728
	.align 2, 0
_08002814: .4byte 0x02022260
_08002818: .4byte 0x02022860
_0800281C:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08002702
_08002824:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0800282C
sub_0800282C: @ 0x0800282C
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_08002836:
	ldr r0, [r7]
	cmp r0, #0
	bge _0800283E
	b _08002A38
_0800283E:
	ldr r0, _08002850 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08002854
	b _08002A30
	.align 2, 0
_08002850: .4byte 0x02022240
_08002854:
	movs r0, #0xf
	str r0, [r7, #4]
_08002858:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08002860
	b _08002A30
_08002860:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08002A24 @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	ldr r2, _08002A28 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A24 @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	ldr r2, _08002A28 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A24 @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	ldr r2, _08002A28 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _08002942
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0x1f
	strh r1, [r0]
_08002942:
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _08002956
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strh r1, [r0]
_08002956:
	adds r0, r7, #0
	adds r0, #0xa
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _0800298A
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0x1f
	strh r1, [r0]
_0800298A:
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _0800299E
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strh r1, [r0]
_0800299E:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _080029D2
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0x1f
	strh r1, [r0]
_080029D2:
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _080029E6
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
_080029E6:
	ldr r0, _08002A2C @ =0x02022860
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	lsls r1, r2, #0xa
	adds r2, r7, #0
	adds r2, #0xa
	ldrh r3, [r2]
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r2, r7, #0
	adds r2, #8
	ldrh r2, [r2]
	adds r1, r1, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08002858
	.align 2, 0
_08002A24: .4byte 0x02022260
_08002A28: .4byte 0x02022240
_08002A2C: .4byte 0x02022860
_08002A30:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _08002836
_08002A38:
	bl sub_08001034
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002A44
sub_08002A44: @ 0x08002A44
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08002A8C @ =0x080C0E1C
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x18
	bl memcpy
	ldr r0, [r7]
	cmp r0, #0
	bne _08002A66
	adds r0, r7, #4
	str r0, [r7]
_08002A66:
	ldr r0, _08002A90 @ =0x0300279C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002A94 @ =0x030027A0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002A98 @ =0x030027A4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002A9C @ =0x030027A8
	movs r1, #0
	strh r1, [r0]
	movs r0, #0
	str r0, [r7, #0x1c]
_08002A82:
	ldr r0, [r7, #0x1c]
	cmp r0, #3
	ble _08002AA0
	b _08002B18
	.align 2, 0
_08002A8C: .4byte 0x080C0E1C
_08002A90: .4byte 0x0300279C
_08002A94: .4byte 0x030027A0
_08002A98: .4byte 0x030027A4
_08002A9C: .4byte 0x030027A8
_08002AA0:
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl sub_0800140C
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl sub_08001450
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl sub_080014B4
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl sub_08002BC0
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0
	bl sub_080017E8
	movs r0, #0
	str r0, [r7, #0x20]
	adds r4, r7, #0
	adds r4, #0x20
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl sub_08001370
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	ldr r2, _08002B14 @ =0x01000010
	adds r0, r4, #0
	bl CpuFastSet
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	b _08002A82
	.align 2, 0
_08002B14: .4byte 0x01000010
_08002B18:
	bl sub_08015998
	movs r0, #0xf
	bl sub_08000FD4
	movs r0, #0
	bl sub_08003108
	ldr r0, _08002BB8 @ =0x02022860
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	bl sub_08001034
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0]
	movs r2, #0xf8
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =0x03002790
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002BB8: .4byte 0x02022860
_08002BBC: .4byte 0x03002790

	thumb_func_start sub_08002BC0
sub_08002BC0: @ 0x08002BC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002BD8 @ =0x08BBFC98
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002BDC
	.align 2, 0
_08002BD8: .4byte 0x08BBFC98
_08002BDC:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08002BE4
sub_08002BE4: @ 0x08002BE4
	push {r7, lr}
	mov r7, sp
	ldr r1, _08002BFC @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	ldr r0, _08002C00 @ =0x00000303
	cmp r1, r0
	bne _08002C04
	movs r0, #0xff
	bl sub_080C0584
	b _08002C1C
	.align 2, 0
_08002BFC: .4byte gpKeySt
_08002C00: .4byte 0x00000303
_08002C04:
	ldr r1, _08002C18 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	cmp r1, #0xf
	bne _08002C1C
	movs r0, #0xff
	bl sub_080C0584
	b _08002C1C
	.align 2, 0
_08002C18: .4byte gpKeySt
_08002C1C:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08002C24
sub_08002C24: @ 0x08002C24
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r1, _08002C94 @ =0x04000200
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08002C98 @ =0x04000132
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r3, _08002C9C @ =0xFFFFC000
	adds r2, r1, r3
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08002C94 @ =0x04000200
	ldr r1, _08002C94 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002CA0 @ =0x0000DF7F
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08002C94 @ =0x04000200
	ldr r1, _08002C94 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	bl SoundBiasReset
	svc #3
	bl SoundBiasSet
	ldr r0, _08002C94 @ =0x04000200
	adds r1, r7, #4
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C94: .4byte 0x04000200
_08002C98: .4byte 0x04000132
_08002C9C: .4byte 0xFFFFC000
_08002CA0: .4byte 0x0000DF7F

	thumb_func_start sub_08002CA4
sub_08002CA4: @ 0x08002CA4
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08002CD0 @ =0x03002844
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CB8
	ldr r0, _08002CD0 @ =0x03002844
	ldr r4, [r0]
	bl _call_via_r4
_08002CB8:
	ldr r0, _08002CD4 @ =0x03002E58
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CC8
	ldr r0, _08002CD4 @ =0x03002E58
	ldr r4, [r0]
	bl _call_via_r4
_08002CC8:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002CD0: .4byte 0x03002844
_08002CD4: .4byte 0x03002E58

	thumb_func_start sub_08002CD8
sub_08002CD8: @ 0x08002CD8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
	ldr r0, _08002D10 @ =0x03002844
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CF0
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_08002CF0:
	ldr r0, _08002D14 @ =0x03002E58
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CFE
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
_08002CFE:
	ldr r0, [r7]
	cmp r0, #1
	beq _08002D4C
	cmp r0, #1
	bgt _08002D18
	cmp r0, #0
	beq _08002D22
	b _08002DE8
	.align 2, 0
_08002D10: .4byte 0x03002844
_08002D14: .4byte 0x03002E58
_08002D18:
	cmp r0, #2
	beq _08002D80
	cmp r0, #3
	beq _08002DB4
	b _08002DE8
_08002D22:
	ldr r0, _08002D40 @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002D44 @ =0x04000200
	ldr r1, _08002D44 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002D48 @ =0x0000FFFD
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002D40: .4byte 0x03002790
_08002D44: .4byte 0x04000200
_08002D48: .4byte 0x0000FFFD
_08002D4C:
	ldr r0, _08002D74 @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002D78 @ =0x03002844
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002D7C @ =0x04000200
	ldr r1, _08002D7C @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002D74: .4byte 0x03002790
_08002D78: .4byte 0x03002844
_08002D7C: .4byte 0x04000200
_08002D80:
	ldr r0, _08002DA8 @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002DAC @ =0x03002E58
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002DB0 @ =0x04000200
	ldr r1, _08002DB0 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002DA8: .4byte 0x03002790
_08002DAC: .4byte 0x03002E58
_08002DB0: .4byte 0x04000200
_08002DB4:
	ldr r0, _08002DDC @ =0x03002790
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r1, _08002DE0 @ =sub_08002CA4
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002DE4 @ =0x04000200
	ldr r1, _08002DE4 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002DDC: .4byte 0x03002790
_08002DE0: .4byte sub_08002CA4
_08002DE4: .4byte 0x04000200
_08002DE8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002DF0
sub_08002DF0: @ 0x08002DF0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002E0C @ =0x03002844
	ldr r1, [r7]
	str r1, [r0]
	bl sub_08002CD8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002E0C: .4byte 0x03002844

	thumb_func_start sub_08002E10
sub_08002E10: @ 0x08002E10
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002E2C @ =0x03002E58
	ldr r1, [r7]
	str r1, [r0]
	bl sub_08002CD8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002E2C: .4byte 0x03002E58

	thumb_func_start sub_08002E30
sub_08002E30: @ 0x08002E30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08002E4C @ =0x02022C60
	cmp r0, r1
	blo _08002E54
	ldr r0, [r7]
	ldr r1, _08002E50 @ =0x02023460
	cmp r0, r1
	bhs _08002E54
	movs r0, #0
	b _08002EAE
	.align 2, 0
_08002E4C: .4byte 0x02022C60
_08002E50: .4byte 0x02023460
_08002E54:
	ldr r0, [r7]
	ldr r1, _08002E68 @ =0x02023460
	cmp r0, r1
	blo _08002E70
	ldr r0, [r7]
	ldr r1, _08002E6C @ =0x02023C60
	cmp r0, r1
	bhs _08002E70
	movs r0, #1
	b _08002EAE
	.align 2, 0
_08002E68: .4byte 0x02023460
_08002E6C: .4byte 0x02023C60
_08002E70:
	ldr r0, [r7]
	ldr r1, _08002E84 @ =0x02023C60
	cmp r0, r1
	blo _08002E8C
	ldr r0, [r7]
	ldr r1, _08002E88 @ =0x02024460
	cmp r0, r1
	bhs _08002E8C
	movs r0, #2
	b _08002EAE
	.align 2, 0
_08002E84: .4byte 0x02023C60
_08002E88: .4byte 0x02024460
_08002E8C:
	ldr r0, [r7]
	ldr r1, _08002EA0 @ =0x02024460
	cmp r0, r1
	blo _08002EA8
	ldr r0, [r7]
	ldr r1, _08002EA4 @ =0x02024C60
	cmp r0, r1
	bhs _08002EA8
	movs r0, #3
	b _08002EAE
	.align 2, 0
_08002EA0: .4byte 0x02024460
_08002EA4: .4byte 0x02024C60
_08002EA8:
	movs r0, #1
	rsbs r0, r0, #0
	b _08002EAE
_08002EAE:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08002EB8
sub_08002EB8: @ 0x08002EB8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08002ED8 @ =0x02024C8C
	movs r1, #0
	str r1, [r0]
	ldr r0, _08002ED8 @ =0x02024C8C
	movs r1, #0
	str r1, [r0, #4]
	movs r0, #0
	str r0, [r7]
_08002ECE:
	ldr r0, [r7]
	cmp r0, #0x1f
	ble _08002EDC
	b _08002F40
	.align 2, 0
_08002ED8: .4byte 0x02024C8C
_08002EDC:
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	movs r0, #0
	str r0, [r1]
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08002ECE
	.align 2, 0
_08002F3C: .4byte 0x02024C94
_08002F40:
	ldr r0, _08002F50 @ =0x02024C94
	movs r1, #0
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F50: .4byte 0x02024C94

	thumb_func_start sub_08002F54
sub_08002F54: @ 0x08002F54
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r0, [r1]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	ldr r1, _08002FD4 @ =0x02024C94
	adds r0, r1, r0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #4]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [r7, #8]
	movs r3, #0x1f
	ands r2, r3
	cmp r2, #0
	bne _08002FA2
	movs r1, #1
_08002FA2:
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _08002FD0 @ =0x02024C8C
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r2, [r1, #4]
	ldr r1, [r7, #8]
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r0, _08002FD0 @ =0x02024C8C
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002FD0: .4byte 0x02024C8C
_08002FD4: .4byte 0x02024C94

	thumb_func_start sub_08002FD8
sub_08002FD8: @ 0x08002FD8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0800304C @ =0x02024C8C
	ldr r0, [r1]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	ldr r1, _08003050 @ =0x02024C94
	adds r0, r1, r0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #4]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _0800304C @ =0x02024C8C
	ldr r1, _0800304C @ =0x02024C8C
	ldr r2, [r1, #4]
	ldr r1, [r7, #8]
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _0800304C @ =0x02024C8C
	ldr r0, _0800304C @ =0x02024C8C
	ldr r1, _0800304C @ =0x02024C8C
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800304C: .4byte 0x02024C8C
_08003050: .4byte 0x02024C94

	thumb_func_start sub_08003054
sub_08003054: @ 0x08003054
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	ldr r0, _08003070 @ =0x02024C94
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_08003062:
	ldr r0, _08003074 @ =0x02024C8C
	ldr r1, [r7, #4]
	ldr r0, [r0]
	cmp r1, r0
	blt _08003078
	b _080030FA
	.align 2, 0
_08003070: .4byte 0x02024C94
_08003074: .4byte 0x02024C8C
_08003078:
	ldr r1, [r7]
	ldrh r0, [r1, #0xa]
	cmp r0, #1
	beq _080030AA
	cmp r0, #1
	bgt _0800308A
	cmp r0, #0
	beq _08003090
	b _080030EA
_0800308A:
	cmp r0, #2
	beq _080030C4
	b _080030EA
_08003090:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #1
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuSet
	b _080030EA
_080030AA:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuFastSet
	b _080030EA
_080030C4:
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7, #8]
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #0x11
	orrs r2, r3
	bl CpuFastSet
	b _080030EA
_080030EA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08003062
_080030FA:
	bl sub_08002EB8
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08003108
sub_08003108: @ 0x08003108
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003198 @ =0x03000028
	ldr r1, _0800319C @ =0x03002850
	str r1, [r0]
	ldr r0, _08003198 @ =0x03000028
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r0, _08003198 @ =0x03000028
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _08003198 @ =0x03000028
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _080031A0 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldr r2, _0800319C @ =0x03002850
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080031A0 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	movs r3, #0xe0
	lsls r3, r3, #0x13
	adds r2, r1, r3
	str r2, [r0, #4]
	ldr r0, _080031A0 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r0, _080031A0 @ =0x03000018
	ldr r2, [r7]
	adds r1, r2, #0
	movs r2, #0x80
	subs r1, r2, r1
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003198: .4byte 0x03000028
_0800319C: .4byte 0x03002850
_080031A0: .4byte 0x03000018

	thumb_func_start sub_080031A4
sub_080031A4: @ 0x080031A4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080031B0 @ =0x03000028
	ldrh r1, [r0, #0xa]
	adds r0, r1, #0
	b _080031B4
	.align 2, 0
_080031B0: .4byte 0x03000028
_080031B4:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080031BC
sub_080031BC: @ 0x080031BC
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08003200 @ =0x03000018
	ldr r0, [r1]
	ldr r2, _08003200 @ =0x03000018
	ldr r1, [r2, #4]
	ldr r2, _08003200 @ =0x03000018
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _08003200 @ =0x03000018
	ldr r0, [r1]
	ldr r1, _08003200 @ =0x03000018
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl sub_080C0C20
	ldr r0, _08003204 @ =0x03002E54
	ldr r1, _08003200 @ =0x03000018
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08003208 @ =0x03003868
	ldr r1, _0800320C @ =0x03002850
	str r1, [r0]
	ldr r0, _08003210 @ =0x0300283C
	movs r1, #0
	strh r1, [r0]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003200: .4byte 0x03000018
_08003204: .4byte 0x03002E54
_08003208: .4byte 0x03003868
_0800320C: .4byte 0x03002850
_08003210: .4byte 0x0300283C

	thumb_func_start sub_08003214
sub_08003214: @ 0x08003214
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08003224 @ =0x03000028
	ldrh r1, [r0, #0xa]
	cmp r1, #0
	bne _08003228
	b _08003256
	.align 2, 0
_08003224: .4byte 0x03000028
_08003228:
	ldr r1, _0800325C @ =0x03000028
	ldr r0, [r1]
	ldr r2, _0800325C @ =0x03000028
	ldr r1, [r2, #4]
	ldr r2, _0800325C @ =0x03000028
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _0800325C @ =0x03000028
	ldr r0, [r1]
	ldr r1, _0800325C @ =0x03000028
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl sub_080C0C20
	ldr r0, _08003260 @ =0x03002780
	ldr r1, _0800325C @ =0x03000028
	ldr r2, [r1]
	str r2, [r0]
_08003256:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800325C: .4byte 0x03000028
_08003260: .4byte 0x03002780

	thumb_func_start sub_08003264
sub_08003264: @ 0x08003264
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r3, #0
	ldr r0, [r7, #0x18]
	adds r3, r7, #4
	strh r4, [r3]
	adds r3, r7, #6
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #8
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xa
	strh r0, [r1]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #3
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #7
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	adds r2, #0xb
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	adds r2, #0xf
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003328: .4byte 0x03002850

	thumb_func_start sub_0800332C
sub_0800332C: @ 0x0800332C
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_08003338:
	b _0800333C
_0800333A:
	b _080033B0
_0800333C:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #1
	beq _08003358
	ldr r0, _08003350 @ =0x03002E54
	ldr r1, [r0]
	ldr r0, _08003354 @ =0x03002950
	cmp r1, r0
	bhs _08003358
	b _0800335A
	.align 2, 0
_08003350: .4byte 0x03002E54
_08003354: .4byte 0x03002950
_08003358:
	b _080033B0
_0800335A:
	ldr r0, [r7]
	movs r2, #6
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, r2
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	str r0, [r7, #0xc]
	ldr r0, [r7]
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #8]
	adds r0, r1, r2
	movs r1, #0xff
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r0, _080033AC @ =0x03002E54
	ldr r1, [r0]
	ldr r2, [r7]
	ldr r4, [r7, #0xc]
	lsls r3, r4, #0x10
	ldr r4, [r2]
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, [r7, #0x10]
	orrs r2, r3
	str r2, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, _080033AC @ =0x03002E54
	ldr r1, [r0]
	ldr r2, [r7]
	ldrh r3, [r2, #4]
	strh r3, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	b _08003338
	.align 2, 0
_080033AC: .4byte 0x03002E54
_080033B0:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080033B8
sub_080033B8: @ 0x080033B8
	push {r7, lr}
	mov r7, sp
	ldr r0, _080033C4 @ =0x02024E14
	ldrh r1, [r0, #4]
	adds r0, r1, #0
	b _080033C8
	.align 2, 0
_080033C4: .4byte 0x02024E14
_080033C8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080033D0
sub_080033D0: @ 0x080033D0
	push {r7, lr}
	mov r7, sp
	ldr r0, _080033E0 @ =0x02024E14
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _080033E4
	.align 2, 0
_080033E0: .4byte 0x02024E14
_080033E4:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080033EC
sub_080033EC: @ 0x080033EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800346C @ =0x03005C80
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003474 @ =0x03005D50
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003478 @ =0x03005CC0
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _0800347C @ =0x030059B0
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003480 @ =0x030059F0
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003484 @ =0x03005C00
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003488 @ =0x03005D10
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800346C: .4byte 0x03005C80
_08003470: .4byte 0x0000FFFF
_08003474: .4byte 0x03005D50
_08003478: .4byte 0x03005CC0
_0800347C: .4byte 0x030059B0
_08003480: .4byte 0x030059F0
_08003484: .4byte 0x03005C00
_08003488: .4byte 0x03005D10

	thumb_func_start sub_0800348C
sub_0800348C: @ 0x0800348C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080034BC @ =0x03005A30
	ldr r1, _080034C0 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _080034C4 @ =0x03005C40
	ldr r1, _080034C0 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080034BC: .4byte 0x03005A30
_080034C0: .4byte 0x0000FFFF
_080034C4: .4byte 0x03005C40

	thumb_func_start sub_080034C8
sub_080034C8: @ 0x080034C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _080034DA
	movs r0, #6
	str r0, [r7]
_080034DA:
	ldr r0, _0800353C @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _080034F2
	ldr r0, _0800353C @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0800457C
	ldr r0, _0800353C @ =0x03000038
	movs r1, #0
	str r1, [r0]
_080034F2:
	ldr r0, _08003540 @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800350A
	ldr r0, _08003540 @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0800457C
	ldr r0, _08003540 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_0800350A:
	ldr r0, _08003544 @ =0x03005A30
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003548 @ =0x03005C40
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800354C @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800353C: .4byte 0x03000038
_08003540: .4byte 0x0300003C
_08003544: .4byte 0x03005A30
_08003548: .4byte 0x03005C40
_0800354C: .4byte 0x02024E14

	thumb_func_start sub_08003550
sub_08003550: @ 0x08003550
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _08003562
	movs r0, #6
	str r0, [r7]
_08003562:
	ldr r0, _080035D8 @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _0800357A
	ldr r0, _080035D8 @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0800457C
	ldr r0, _080035D8 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_0800357A:
	ldr r0, _080035DC @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _08003592
	ldr r0, _080035DC @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0800457C
	ldr r0, _080035DC @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_08003592:
	ldr r0, _080035E0 @ =0x03005A30
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _080035E4 @ =0x03005C40
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOutPause
	ldr r0, _080035E8 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _080035E8 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080035D8: .4byte 0x03000038
_080035DC: .4byte 0x0300003C
_080035E0: .4byte 0x03005A30
_080035E4: .4byte 0x03005C40
_080035E8: .4byte 0x02024E14

	thumb_func_start sub_080035EC
sub_080035EC: @ 0x080035EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _080035FE
	movs r0, #6
	str r0, [r7]
_080035FE:
	ldr r0, _08003668 @ =0x03005C80
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800366C @ =0x03005D50
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003670 @ =0x03005CC0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003674 @ =0x030059B0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003678 @ =0x030059F0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800367C @ =0x03005C00
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003680 @ =0x03005D10
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003668: .4byte 0x03005C80
_0800366C: .4byte 0x03005D50
_08003670: .4byte 0x03005CC0
_08003674: .4byte 0x030059B0
_08003678: .4byte 0x030059F0
_0800367C: .4byte 0x03005C00
_08003680: .4byte 0x03005D10

	thumb_func_start sub_08003684
sub_08003684: @ 0x08003684
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080036E4 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _080036E4 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _080036E4 @ =0x02024E14
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_08003DF0
	ldr r1, _080036E8 @ =0x03005A30
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _080036EC @ =0x03005C40
	adds r0, r1, #0
	bl m4aMPlayImmInit
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080036E4: .4byte 0x02024E14
_080036E8: .4byte 0x03005A30
_080036EC: .4byte 0x03005C40

	thumb_func_start sub_080036F0
sub_080036F0: @ 0x080036F0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08003714 @ =0x02024E14
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _08003718
	bl sub_080033B8
	ldr r1, [r7]
	cmp r0, r1
	bne _08003718
	b _08003764
	.align 2, 0
_08003714: .4byte 0x02024E14
_08003718:
	ldr r1, _0800372C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003730
	b _08003764
	.align 2, 0
_0800372C: .4byte gPlaySt
_08003730:
	bl sub_080040F8
	ldr r0, _08003758 @ =0x02024E14
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _0800375C
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_080034C8
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_08003D7C
	b _08003764
	.align 2, 0
_08003758: .4byte 0x02024E14
_0800375C:
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl sub_08003684
_08003764:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0800376C
sub_0800376C: @ 0x0800376C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7, #4]
	ldr r0, [r7]
	movs r1, #3
	bl sub_080036F0
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08003788
sub_08003788: @ 0x08003788
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_080036F0
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080037A8
sub_080037A8: @ 0x080037A8
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_08013508
	str r0, [r7, #4]
	ldr r0, _08003848 @ =0x03005A30
	ldr r1, _0800384C @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003850 @ =0x03005C40
	ldr r1, _0800384C @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4c
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _0800383E
	ldr r0, [r7]
	bl sub_0800457C
	ldr r0, _08003854 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_0800383E:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003848: .4byte 0x03005A30
_0800384C: .4byte 0x0000FFFF
_08003850: .4byte 0x03005C40
_08003854: .4byte 0x03000038

	thumb_func_start sub_08003858
sub_08003858: @ 0x08003858
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08003878 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _0800387C
	b _0800392A
	.align 2, 0
_08003878: .4byte gPlaySt
_0800387C:
	ldr r0, _08003934 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003934 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003934 @ =0x02024E14
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, _08003938 @ =0x08BBFCA8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r1, _0800393C @ =0x03005A30
	adds r0, r1, #0
	bl MPlayStop_rev01
	ldr r1, _08003940 @ =0x03005C40
	adds r0, r1, #0
	bl MPlayStop_rev01
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl sub_08003DF0
	ldr r1, _0800393C @ =0x03005A30
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _08003940 @ =0x03005C40
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r0, _0800393C @ =0x03005A30
	ldr r1, _08003944 @ =0x0000FFFF
	movs r2, #0
	bl MPlayVolumeControl
	ldr r0, _08003940 @ =0x03005C40
	ldr r1, _08003944 @ =0x0000FFFF
	movs r2, #0
	bl MPlayVolumeControl
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003948 @ =0x03000038
	ldr r1, [r7, #0xc]
	str r1, [r0]
_0800392A:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003934: .4byte 0x02024E14
_08003938: .4byte 0x08BBFCA8
_0800393C: .4byte 0x03005A30
_08003940: .4byte 0x03005C40
_08003944: .4byte 0x0000FFFF
_08003948: .4byte 0x03000038

	thumb_func_start sub_0800394C
sub_0800394C: @ 0x0800394C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08003968 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _0800396C
	b _080039BE
	.align 2, 0
_08003968: .4byte gPlaySt
_0800396C:
	ldr r0, _080039C8 @ =0x02024E14
	ldr r1, _080039C8 @ =0x02024E14
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, _080039C8 @ =0x02024E14
	movs r1, #7
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08003996
	ldr r1, _080039CC @ =0x03005C40
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOutPause
_08003996:
	ldr r0, _080039C8 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _080039C8 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080039BE
	ldr r2, _080039D0 @ =0x03005A30
	ldr r0, [r7]
	movs r1, #0x20
	bl sub_08003D7C
_080039BE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080039C8: .4byte 0x02024E14
_080039CC: .4byte 0x03005C40
_080039D0: .4byte 0x03005A30

	thumb_func_start sub_080039D4
sub_080039D4: @ 0x080039D4
	push {r7, lr}
	mov r7, sp
	ldr r1, _080039EC @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _080039F0
	b _08003A56
	.align 2, 0
_080039EC: .4byte gPlaySt
_080039F0:
	ldr r0, _080039FC @ =0x02024E14
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003A00
	b _08003A56
	.align 2, 0
_080039FC: .4byte 0x02024E14
_08003A00:
	ldr r1, _08003A5C @ =0x03005A30
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r1, _08003A60 @ =0x03005C40
	adds r0, r1, #0
	movs r1, #6
	bl m4aMPlayFadeInContinue
	ldr r0, _08003A64 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003A64 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003A64 @ =0x02024E14
	ldr r1, _08003A64 @ =0x02024E14
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003A64 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003A56:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A5C: .4byte 0x03005A30
_08003A60: .4byte 0x03005C40
_08003A64: .4byte 0x02024E14

	thumb_func_start sub_08003A68
sub_08003A68: @ 0x08003A68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r1, _08003A84 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003A88
	b _08003AF0
	.align 2, 0
_08003A84: .4byte gPlaySt
_08003A88:
	ldr r0, _08003A94 @ =0x02024E14
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003A98
	b _08003AF0
	.align 2, 0
_08003A94: .4byte 0x02024E14
_08003A98:
	ldr r1, _08003AF8 @ =0x03005A30
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _08003AFC @ =0x03005C40
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	bl m4aMPlayFadeInContinue
	ldr r0, _08003B00 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003B00 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003B00 @ =0x02024E14
	ldr r1, _08003B00 @ =0x02024E14
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003B00 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003AF0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003AF8: .4byte 0x03005A30
_08003AFC: .4byte 0x03005C40
_08003B00: .4byte 0x02024E14

	thumb_func_start sub_08003B04
sub_08003B04: @ 0x08003B04
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003B1C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003B20
	b _08003B42
	.align 2, 0
_08003B1C: .4byte gPlaySt
_08003B20:
	ldr r0, _08003B48 @ =0x02024E14
	ldr r1, _08003B48 @ =0x02024E14
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003B48 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003B42:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B48: .4byte 0x02024E14

	thumb_func_start sub_08003B4C
sub_08003B4C: @ 0x08003B4C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08003B70
	ldr r0, _08003B6C @ =0x08BBFCC0
	ldr r1, [r7, #0xc]
	bl sub_080043D4
	str r0, [r7, #0x10]
	b _08003B7C
	.align 2, 0
_08003B6C: .4byte 0x08BBFCC0
_08003B70:
	ldr r1, _08003BF4 @ =0x08BBFCC0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_08003B7C:
	ldr r1, [r7, #0x10]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7]
	cmp r0, #0
	bne _08003BDE
	movs r0, #1
	str r0, [r7]
_08003BDE:
	ldr r0, [r7]
	bl sub_0800348C
	ldr r0, _08003BF8 @ =0x0300003C
	ldr r1, [r7, #0x10]
	str r1, [r0]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003BF4: .4byte 0x08BBFCC0
_08003BF8: .4byte 0x0300003C

	thumb_func_start sub_08003BFC
sub_08003BFC: @ 0x08003BFC
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x64
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	ldr r0, [r7]
	adds r3, r0, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r0]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	ldr r4, [r7]
	adds r0, r4, #0
	adds r4, #0x6a
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl sub_08013508
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_0800348C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x68
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08003CD8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bne _08003CB8
	bl sub_080033B8
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	bl m4aSongNumStop
	ldr r0, _08003CB4 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003CB4 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003CB4 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08003CB4 @ =0x02024E14
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	b _08003CCC
	.align 2, 0
_08003CB4: .4byte 0x02024E14
_08003CB8:
	ldr r0, _08003CE0 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
_08003CCC:
	ldr r0, [r7]
	bl sub_0800457C
	ldr r0, _08003CE4 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_08003CD8:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003CE0: .4byte 0x02024E14
_08003CE4: .4byte 0x0300003C

	thumb_func_start sub_08003CE8
sub_08003CE8: @ 0x08003CE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	blt _08003D26
	b _08003D6E
_08003D26:
	ldr r0, _08003D78 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003D78 @ =0x02024E14
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4a
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
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x54]
	adds r1, r2, #0
	bl sub_08003DF0
	ldr r0, [r7]
	bl sub_08004460
_08003D6E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003D78: .4byte 0x02024E14

	thumb_func_start sub_08003D7C
sub_08003D7C: @ 0x08003D7C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08003D9C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003DA0
	b _08003DE2
	.align 2, 0
_08003D9C: .4byte gPlaySt
_08003DA0:
	ldr r1, _08003DEC @ =0x08BBFCD8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
_08003DE2:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003DEC: .4byte 0x08BBFCD8

	thumb_func_start sub_08003DF0
sub_08003DF0: @ 0x08003DF0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	cmp r0, #0x7f
	bgt _08003E0E
	ldr r0, [r7]
	bl sub_08003E9C
	movs r0, #0
	ldr r1, [r7]
	bl sub_080A0184
_08003E0E:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08003E30
	ldr r0, [r7, #4]
	ldr r1, _08003E2C @ =0x086EA8D0
	ldr r2, [r7]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldr r2, [r1]
	adds r1, r2, #0
	bl MPlayStart_rev01
	b _08003E3E
	.align 2, 0
_08003E2C: .4byte 0x086EA8D0
_08003E30:
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl m4aSongNumStart
_08003E3E:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08003E48
sub_08003E48: @ 0x08003E48
	push {r7, lr}
	mov r7, sp
	movs r0, #7
	bl sub_08003E68
	ldr r0, _08003E64 @ =0x02024E14
	ldrb r1, [r0, #8]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #8]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003E64: .4byte 0x02024E14

	thumb_func_start sub_08003E68
sub_08003E68: @ 0x08003E68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003E98 @ =0x02024E14
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #8]
	ldr r0, [r7]
	lsls r1, r0, #8
	adds r0, r1, #0
	bl SoundMode_rev01
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003E98: .4byte 0x02024E14

	thumb_func_start sub_08003E9C
sub_08003E9C: @ 0x08003E9C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x5a
	beq _08003ECC
	cmp r0, #0x5a
	bgt _08003EB8
	cmp r0, #0x2a
	bgt _08003EE4
	cmp r0, #0x29
	blt _08003EE4
	b _08003ECC
_08003EB8:
	cmp r0, #0x5f
	beq _08003ECC
	cmp r0, #0x5f
	bgt _08003EC6
	cmp r0, #0x5c
	beq _08003ECC
	b _08003EE4
_08003EC6:
	cmp r0, #0x74
	beq _08003ECC
	b _08003EE4
_08003ECC:
	ldr r0, _08003EE0 @ =0x02024E14
	movs r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #8
	beq _08003EDC
	movs r0, #8
	bl sub_08003E68
_08003EDC:
	b _08003EFC
	.align 2, 0
_08003EE0: .4byte 0x02024E14
_08003EE4:
	ldr r0, _08003EF8 @ =0x02024E14
	movs r1, #8
	ldrsb r1, [r0, r1]
	movs r0, #1
	cmn r1, r0
	beq _08003EF4
	bl sub_08003E48
_08003EF4:
	b _08003EFC
	.align 2, 0
_08003EF8: .4byte 0x02024E14
_08003EFC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08003F04
sub_08003F04: @ 0x08003F04
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003F18 @ =0x08BBFCC0
	adds r0, r1, #0
	bl sub_08004584
	cmp r0, #0
	beq _08003F1C
	movs r0, #1
	b _08003F20
	.align 2, 0
_08003F18: .4byte 0x08BBFCC0
_08003F1C:
	movs r0, #0
	b _08003F20
_08003F20:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08003F28
sub_08003F28: @ 0x08003F28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08003F8A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08003F8A
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	movs r0, #1
	cmn r1, r0
	bne _08003F74
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	ldr r2, [r3, #0x58]
	ldr r3, [r7]
	bl sub_08003B4C
	b _08003F8A
_08003F74:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	movs r1, #0
	ldr r3, [r7]
	bl sub_08003B4C
_08003F8A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08003F94
sub_08003F94: @ 0x08003F94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	ble _08003FC2
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	adds r0, r1, #0
	movs r1, #0
	bl sub_0800376C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	bl sub_0800348C
	b _08003FCA
_08003FC2:
	ldr r0, [r7]
	movs r1, #0
	bl sub_080045FC
_08003FCA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08003FD4
sub_08003FD4: @ 0x08003FD4
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	bl sub_080033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08004008
	ldr r0, _08004004 @ =0x02024E14
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _08004008
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _08004008
	b _08004092
	.align 2, 0
_08004004: .4byte 0x02024E14
_08004008:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _08004020
	ldr r1, _0800401C @ =0x08BBFCE8
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl sub_080043D4
	str r0, [r7, #0x10]
	b _0800402C
	.align 2, 0
_0800401C: .4byte 0x08BBFCE8
_08004020:
	ldr r1, _08004054 @ =0x08BBFCE8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_0800402C:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x58]
	bl sub_080033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0800405C
	ldr r0, _08004058 @ =0x02024E14
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _0800405C
	ldr r0, [r7, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x5c]
	b _08004062
	.align 2, 0
_08004054: .4byte 0x08BBFCE8
_08004058: .4byte 0x02024E14
_0800405C:
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x5c]
_08004062:
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_08004092:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800409C
sub_0800409C: @ 0x0800409C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080040B0 @ =0x08BBFCE8
	adds r0, r1, #0
	bl sub_08004584
	cmp r0, #0
	beq _080040B4
	movs r0, #1
	b _080040B8
	.align 2, 0
_080040B0: .4byte 0x08BBFCE8
_080040B4:
	movs r0, #0
	b _080040B8
_080040B8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080040C0
sub_080040C0: @ 0x080040C0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080040F4 @ =0x02024E14
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	beq _080040EC
	bl sub_080033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080040E4
	movs r0, #0
	bl sub_0800348C
_080040E4:
	ldr r0, [r7]
	movs r1, #0
	bl sub_08003684
_080040EC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080040F4: .4byte 0x02024E14

	thumb_func_start sub_080040F8
sub_080040F8: @ 0x080040F8
	push {r7, lr}
	mov r7, sp
	ldr r1, _0800410C @ =0x08BBFCD8
	adds r0, r1, #0
	bl sub_08004748
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800410C: .4byte 0x08BBFCD8

	thumb_func_start sub_08004110
sub_08004110: @ 0x08004110
	push {r7, lr}
	mov r7, sp
	bl sub_080040F8
	ldr r1, _0800414C @ =0x03005A30
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r1, _08004150 @ =0x03005C40
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r0, _08004154 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08004154 @ =0x02024E14
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800414C: .4byte 0x03005A30
_08004150: .4byte 0x03005C40
_08004154: .4byte 0x02024E14

	thumb_func_start sub_08004158
sub_08004158: @ 0x08004158
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080041D8 @ =0x08000A20
	ldr r1, _080041DC @ =ArmCodeStart
	subs r0, r0, r1
	str r0, [r7]
	ldr r0, _080041DC @ =ArmCodeStart
	ldr r1, _080041E0 @ =0x03002E60
	ldr r2, [r7]
	asrs r3, r2, #0x1f
	lsrs r4, r3, #0x1f
	adds r3, r2, r4
	asrs r2, r3, #1
	lsls r3, r2, #0xb
	lsrs r2, r3, #0xb
	bl CpuSet
	ldr r0, _080041E4 @ =0x03002E50
	ldr r1, _080041E8 @ =DrawGlyph
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080041EC @ =0x03003860
	ldr r1, _080041F0 @ =DecodeString
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080041F4 @ =0x03002840
	ldr r1, _080041F8 @ =PutOamHi
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080041FC @ =0x03003864
	ldr r1, _08004200 @ =PutOamLo
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004204 @ =0x03004070
	ldr r1, _08004208 @ =MapFloodCoreStep
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _0800420C @ =0x03002838
	ldr r1, _08004210 @ =MapFloodCore
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080041D8: .4byte 0x08000A20
_080041DC: .4byte ArmCodeStart
_080041E0: .4byte 0x03002E60
_080041E4: .4byte 0x03002E50
_080041E8: .4byte DrawGlyph
_080041EC: .4byte 0x03003860
_080041F0: .4byte DecodeString
_080041F4: .4byte 0x03002840
_080041F8: .4byte PutOamHi
_080041FC: .4byte 0x03003864
_08004200: .4byte PutOamLo
_08004204: .4byte 0x03004070
_08004208: .4byte MapFloodCoreStep
_0800420C: .4byte 0x03002838
_08004210: .4byte MapFloodCore

	thumb_func_start sub_08004214
sub_08004214: @ 0x08004214
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _0800423C @ =0x03002E50
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800423C: .4byte 0x03002E50

	thumb_func_start sub_08004240
sub_08004240: @ 0x08004240
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08004260 @ =0x03003860
	ldr r1, [r7, #4]
	ldr r2, [r0]
	ldr r0, [r7]
	bl _call_via_r2
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004260: .4byte 0x03003860

	thumb_func_start sub_08004264
sub_08004264: @ 0x08004264
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _0800428C @ =0x03002840
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800428C: .4byte 0x03002840

	thumb_func_start sub_08004290
sub_08004290: @ 0x08004290
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080042B8 @ =0x03003864
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042B8: .4byte 0x03003864

	thumb_func_start sub_080042BC
sub_080042BC: @ 0x080042BC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080042E0 @ =0x03004070
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r0]
	ldr r0, [r7]
	bl _call_via_r3
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042E0: .4byte 0x03004070

	thumb_func_start sub_080042E4
sub_080042E4: @ 0x080042E4
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080042F8 @ =0x03002838
	ldr r4, [r0]
	bl _call_via_r4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042F8: .4byte 0x03002838

	thumb_func_start Proc_Init
Proc_Init: @ 0x080042FC
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _08004360 @ =0x02024E20
	ldr r5, _08004364 @ =0x02026920
	ldr r0, _08004368 @ =0x02026A24
	mov ip, r0
	movs r2, #0
	adds r6, r5, #0
	movs r3, #0
_0800430E:
	adds r1, r3, r7
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	str r2, [r1, #0x18]
	str r2, [r1, #0x1c]
	str r2, [r1, #0x20]
	strh r2, [r1, #0x24]
	adds r0, r1, #0
	adds r0, #0x26
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	stm r6!, {r1}
	adds r3, #0x6c
	adds r4, #1
	cmp r4, #0x3f
	ble _0800430E
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	mov r0, ip
	str r5, [r0]
	ldr r1, _0800436C @ =0x02026A28
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08004352:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08004352
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004360: .4byte 0x02024E20
_08004364: .4byte 0x02026920
_08004368: .4byte 0x02026A24
_0800436C: .4byte 0x02026A28

	thumb_func_start Proc_Start
Proc_Start: @ 0x08004370
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl sub_08004478
	adds r5, r0, #0
	str r4, [r5]
	str r4, [r5, #4]
	movs r0, #0
	str r0, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	str r0, [r5, #0x1c]
	str r0, [r5, #0x20]
	movs r1, #0
	strh r0, [r5, #0x24]
	adds r0, r5, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	cmp r6, #7
	bgt _080043B2
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08004498
	b _080043BA
_080043B2:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080044B8
_080043BA:
	adds r0, r5, #0
	bl sub_08004A60
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #0xf7
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080043D4
sub_080043D4: @ 0x080043D4
	push {lr}
	bl Proc_Start
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _080043FC
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #2
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [r2, #0x14]
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	adds r0, r2, #0
	b _080043FE
_080043FC:
	movs r0, #0
_080043FE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004404
sub_08004404: @ 0x08004404
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004412
	bl sub_08004404
_08004412:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0800441C
	bl sub_08004404
_0800441C:
	adds r6, r4, #0
	adds r6, #0x27
	movs r5, #1
	ldrb r0, [r6]
	ands r5, r0
	cmp r5, #0
	bne _0800445A
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _08004436
	adds r0, r4, #0
	bl _call_via_r1
_08004436:
	adds r0, r4, #0
	bl sub_08004488
	str r5, [r4]
	str r5, [r4, #0xc]
	movs r0, #1
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800445A
	ldr r0, [r4, #0x14]
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
_0800445A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08004460
sub_08004460: @ 0x08004460
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08004472
	bl sub_080044CC
	adds r0, r4, #0
	bl sub_08004404
_08004472:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08004478
sub_08004478: @ 0x08004478
	ldr r1, _08004484 @ =0x02026A24
	ldr r2, [r1]
	ldm r2!, {r0}
	str r2, [r1]
	bx lr
	.align 2, 0
_08004484: .4byte 0x02026A24

	thumb_func_start sub_08004488
sub_08004488: @ 0x08004488
	ldr r2, _08004494 @ =0x02026A24
	ldr r1, [r2]
	subs r1, #4
	str r1, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
_08004494: .4byte 0x02026A24

	thumb_func_start sub_08004498
sub_08004498: @ 0x08004498
	adds r2, r0, #0
	adds r3, r1, #0
	lsls r1, r3, #2
	ldr r0, _080044B4 @ =0x02026A28
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080044AC
	str r2, [r0, #0x1c]
	str r0, [r2, #0x20]
_080044AC:
	str r3, [r2, #0x14]
	str r2, [r1]
	bx lr
	.align 2, 0
_080044B4: .4byte 0x02026A28

	thumb_func_start sub_080044B8
sub_080044B8: @ 0x080044B8
	adds r2, r0, #0
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _080044C6
	str r2, [r0, #0x1c]
	ldr r0, [r1, #0x18]
	str r0, [r2, #0x20]
_080044C6:
	str r2, [r1, #0x18]
	str r1, [r2, #0x14]
	bx lr

	thumb_func_start sub_080044CC
sub_080044CC: @ 0x080044CC
	adds r2, r0, #0
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	beq _080044D8
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x20]
_080044D8:
	ldr r1, [r2, #0x20]
	cmp r1, #0
	beq _080044E2
	ldr r0, [r2, #0x1c]
	str r0, [r1, #0x1c]
_080044E2:
	ldr r1, [r2, #0x14]
	cmp r1, #8
	ble _080044F4
	ldr r0, [r1, #0x18]
	cmp r0, r2
	bne _08004504
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x18]
	b _08004504
_080044F4:
	lsls r0, r1, #2
	ldr r1, _0800450C @ =0x02026A28
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, r2
	bne _08004504
	ldr r0, [r2, #0x20]
	str r0, [r1]
_08004504:
	movs r0, #0
	str r0, [r2, #0x1c]
	str r0, [r2, #0x20]
	bx lr
	.align 2, 0
_0800450C: .4byte 0x02026A28

	thumb_func_start sub_08004510
sub_08004510: @ 0x08004510
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0800451E
	bl sub_08004510
_0800451E:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800455C
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #8
	ldrb r2, [r1]
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	bne _0800455C
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _0800454A
	adds r0, r4, #0
	bl sub_08004A60
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08004552
_0800454A:
	ldr r1, [r4, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
_08004552:
	movs r0, #1
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	bne _08004566
_0800455C:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08004566
	bl sub_08004510
_08004566:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0800456C
sub_0800456C: @ 0x0800456C
	push {lr}
	cmp r0, #0
	beq _08004576
	bl sub_08004510
_08004576:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800457C
sub_0800457C: @ 0x0800457C
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_08004584
sub_08004584: @ 0x08004584
	adds r3, r0, #0
	ldr r1, _08004594 @ =0x02024E20
	movs r2, #0
_0800458A:
	ldr r0, [r1]
	cmp r0, r3
	bne _08004598
	adds r0, r1, #0
	b _080045A2
	.align 2, 0
_08004594: .4byte 0x02024E20
_08004598:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _0800458A
	movs r0, #0
_080045A2:
	bx lr

	thumb_func_start sub_080045A4
sub_080045A4: @ 0x080045A4
	adds r3, r0, #0
	ldr r1, _080045C0 @ =0x02024E20
	movs r2, #0
_080045AA:
	ldr r0, [r1]
	cmp r0, r3
	bne _080045C4
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _080045C4
	adds r0, r1, #0
	b _080045CE
	.align 2, 0
_080045C0: .4byte 0x02024E20
_080045C4:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _080045AA
	movs r0, #0
_080045CE:
	bx lr

	thumb_func_start sub_080045D0
sub_080045D0: @ 0x080045D0
	adds r3, r0, #0
	ldr r1, _080045EC @ =0x02024E20
	movs r2, #0
_080045D6:
	ldr r0, [r1]
	cmp r0, #0
	beq _080045F0
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r3
	bne _080045F0
	adds r0, r1, #0
	b _080045FA
	.align 2, 0
_080045EC: .4byte 0x02024E20
_080045F0:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _080045D6
	movs r0, #0
_080045FA:
	bx lr

	thumb_func_start sub_080045FC
sub_080045FC: @ 0x080045FC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	ldr r2, [r1]
	ldrh r3, [r2]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	beq _0800462E
	movs r5, #0
_08004610:
	cmp r3, #0xb
	bne _08004622
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _08004622
	str r2, [r1, #4]
	str r5, [r1, #0xc]
	b _0800462E
_08004622:
	adds r2, #8
	ldrh r3, [r2]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r0, #0
	bne _08004610
_0800462E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08004634
sub_08004634: @ 0x08004634
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start sub_0800463C
sub_0800463C: @ 0x0800463C
	adds r0, #0x26
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08004644
sub_08004644: @ 0x08004644
	str r1, [r0, #8]
	bx lr

	thumb_func_start sub_08004648
sub_08004648: @ 0x08004648
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0800466C @ =0x02024E20
	movs r5, #0x3f
_08004650:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800465C
	adds r0, r4, #0
	bl _call_via_r6
_0800465C:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08004650
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800466C: .4byte 0x02024E20

	thumb_func_start sub_08004670
sub_08004670: @ 0x08004670
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _08004694 @ =0x02024E20
	movs r5, #0x3f
_0800467A:
	ldr r0, [r4]
	cmp r0, r7
	bne _08004686
	adds r0, r4, #0
	bl _call_via_r6
_08004686:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _0800467A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004694: .4byte 0x02024E20

	thumb_func_start sub_08004698
sub_08004698: @ 0x08004698
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _080046C0 @ =0x02024E20
	movs r5, #0x3f
_080046A2:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r7
	bne _080046B2
	adds r0, r4, #0
	bl _call_via_r6
_080046B2:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _080046A2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080046C0: .4byte 0x02024E20

	thumb_func_start sub_080046C4
sub_080046C4: @ 0x080046C4
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _080046E4 @ =0x02024E20
	adds r1, r0, #0
	adds r1, #0x26
_080046CE:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080046DA
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
_080046DA:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _080046CE
	bx lr
	.align 2, 0
_080046E4: .4byte 0x02024E20

	thumb_func_start sub_080046E8
sub_080046E8: @ 0x080046E8
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _0800470C @ =0x02024E20
	adds r1, r0, #0
	adds r1, #0x26
_080046F2:
	ldrb r0, [r1]
	cmp r0, r3
	bne _08004702
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08004702
	subs r0, #1
	strb r0, [r1, #2]
_08004702:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _080046F2
	bx lr
	.align 2, 0
_0800470C: .4byte 0x02024E20

	thumb_func_start sub_08004710
sub_08004710: @ 0x08004710
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08004738 @ =0x02024E20
	movs r5, #0x3f
_08004718:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r6
	bne _08004728
	adds r0, r4, #0
	bl sub_08004460
_08004728:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08004718
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004738: .4byte 0x02024E20

	thumb_func_start sub_0800473C
sub_0800473C: @ 0x0800473C
	push {lr}
	bl sub_08004460
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08004748
sub_08004748: @ 0x08004748
	push {lr}
	ldr r1, _08004754 @ =sub_0800473C
	bl sub_08004670
	pop {r0}
	bx r0
	.align 2, 0
_08004754: .4byte sub_0800473C

	thumb_func_start sub_08004758
sub_08004758: @ 0x08004758
	push {lr}
	bl sub_0800457C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08004764
sub_08004764: @ 0x08004764
	push {lr}
	ldr r1, _08004770 @ =sub_08004758
	bl sub_08004670
	pop {r0}
	bx r0
	.align 2, 0
_08004770: .4byte sub_08004758

	thumb_func_start sub_08004774
sub_08004774: @ 0x08004774
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004784
	bl sub_08004774
_08004784:
	adds r0, r4, #0
	bl _call_via_r5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08004796
	adds r1, r5, #0
	bl sub_08004774
_08004796:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0800479C
sub_0800479C: @ 0x0800479C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl _call_via_r5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _080047B2
	adds r1, r5, #0
	bl sub_08004774
_080047B2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080047B8
sub_080047B8: @ 0x080047B8
	push {lr}
	bl sub_08004460
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_080047C4
sub_080047C4: @ 0x080047C4
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0x10]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_080047D4
sub_080047D4: @ 0x080047D4
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl _call_via_r2
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start sub_080047E8
sub_080047E8: @ 0x080047E8
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl _call_via_r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004800
sub_08004800: @ 0x08004800
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #4]
	ldrh r0, [r2, #2]
	ldr r3, [r2, #4]
	adds r2, #8
	str r2, [r1, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl _call_via_r3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004820
sub_08004820: @ 0x08004820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, #8
	str r0, [r4, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800483E
	movs r0, #1
	b _08004846
_0800483E:
	ldr r0, [r4, #4]
	subs r0, #8
	str r0, [r4, #4]
	movs r0, #0
_08004846:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800484C
sub_0800484C: @ 0x0800484C
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0xc]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0800485C
sub_0800485C: @ 0x0800485C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_08004644
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08004878
sub_08004878: @ 0x08004878
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08004894
sub_08004894: @ 0x08004894
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl sub_080043D4
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080048B0
sub_080048B0: @ 0x080048B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	bl Proc_Start
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080048D0
sub_080048D0: @ 0x080048D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl sub_08004584
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _080048EE
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	b _080048F0
_080048EE:
	movs r0, #0
_080048F0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080048F8
sub_080048F8: @ 0x080048F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl sub_08004748
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004914
sub_08004914: @ 0x08004914
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl sub_08004764
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004930
sub_08004930: @ 0x08004930
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_0800493C
sub_0800493C: @ 0x0800493C
	push {lr}
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	bl sub_08004634
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start sub_0800494C
sub_0800494C: @ 0x0800494C
	push {lr}
	ldr r1, [r0, #4]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_080045FC
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004960
sub_08004960: @ 0x08004960
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x24]
	subs r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08004976
	adds r0, r1, #0
	bl sub_0800457C
_08004976:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800497C
sub_0800497C: @ 0x0800497C
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08004990
	strh r2, [r1, #0x24]
	ldr r0, _0800499C @ =sub_08004960
	str r0, [r1, #0xc]
_08004990:
	ldr r0, [r1, #4]
	adds r0, #8
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.align 2, 0
_0800499C: .4byte sub_08004960

	thumb_func_start sub_080049A0
sub_080049A0: @ 0x080049A0
	ldr r1, [r0, #4]
	ldrh r1, [r1, #2]
	adds r2, r0, #0
	adds r2, #0x26
	strb r1, [r2]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr

	thumb_func_start sub_080049B4
sub_080049B4: @ 0x080049B4
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_080049C0
sub_080049C0: @ 0x080049C0
	movs r0, #0
	bx lr

	thumb_func_start sub_080049C4
sub_080049C4: @ 0x080049C4
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _080049F0 @ =0x02024E20
	movs r4, #0
	ldr r5, [r3]
	movs r1, #0x3f
_080049D0:
	ldr r0, [r2]
	cmp r0, r5
	bne _080049D8
	adds r4, #1
_080049D8:
	subs r1, #1
	adds r2, #0x6c
	cmp r1, #0
	bge _080049D0
	cmp r4, #1
	bgt _080049F4
	ldr r0, [r3, #4]
	adds r0, #8
	str r0, [r3, #4]
	movs r0, #1
	b _080049FC
	.align 2, 0
_080049F0: .4byte 0x02024E20
_080049F4:
	adds r0, r3, #0
	bl sub_08004460
	movs r0, #0
_080049FC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004A04
sub_08004A04: @ 0x08004A04
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08004A10 @ =0x02024E20
	movs r3, #0
	b _08004A18
	.align 2, 0
_08004A10: .4byte 0x02024E20
_08004A14:
	adds r3, #1
	adds r2, #0x6c
_08004A18:
	cmp r3, #0x3f
	bgt _08004A2E
	cmp r2, r4
	beq _08004A14
	ldr r1, [r2]
	ldr r0, [r4]
	cmp r1, r0
	bne _08004A14
	adds r0, r2, #0
	bl sub_08004460
_08004A2E:
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08004A3C
sub_08004A3C: @ 0x08004A3C
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_08004A48
sub_08004A48: @ 0x08004A48
	adds r2, r0, #0
	adds r2, #0x27
	movs r1, #4
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_08004A60
sub_08004A60: @ 0x08004A60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _08004AA2
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08004AA2
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _08004AA2
	ldr r5, _08004A80 @ =0x08BBFD28
	b _08004A8A
	.align 2, 0
_08004A80: .4byte 0x08BBFD28
_08004A84:
	ldr r0, [r4]
	cmp r0, #0
	beq _08004AA2
_08004A8A:
	ldr r0, [r4, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08004A84
_08004AA2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start nullsub_2
nullsub_2: @ 0x08004AA8
	bx lr
	.align 2, 0

	thumb_func_start sub_08004AAC
sub_08004AAC: @ 0x08004AAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004ABC
	bl sub_08004AAC
_08004ABC:
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08004ADC
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	adds r0, r1, #0
	adds r1, r5, #0
	bl sub_08004AAC
	ldr r0, [r5]
	subs r0, #2
	str r0, [r5]
_08004ADC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08004AE4
sub_08004AE4: @ 0x08004AE4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08004B0E
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sp
	bl sub_08004AAC
	ldr r0, [sp]
	subs r0, #2
	str r0, [sp]
_08004B0E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_22
nullsub_22: @ 0x08004B18
	bx lr
	.align 2, 0

	thumb_func_start sub_08004B1C
sub_08004B1C: @ 0x08004B1C
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start sub_08004B20
sub_08004B20: @ 0x08004B20
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08004B2C
sub_08004B2C: @ 0x08004B2C
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08004B38
sub_08004B38: @ 0x08004B38
	adds r3, r0, #0
	cmp r1, #0
	bne _08004B4C
	ldr r1, _08004B44 @ =0x02024E20
	b _08004B4E
	.align 2, 0
_08004B44: .4byte 0x02024E20
_08004B48:
	adds r0, r1, #0
	b _08004B64
_08004B4C:
	adds r1, #0x6c
_08004B4E:
	ldr r0, _08004B68 @ =0x02026920
	cmp r1, r0
	bhs _08004B62
	adds r2, r0, #0
_08004B56:
	ldr r0, [r1]
	cmp r0, r3
	beq _08004B48
	adds r1, #0x6c
	cmp r1, r2
	blo _08004B56
_08004B62:
	movs r0, #0
_08004B64:
	bx lr
	.align 2, 0
_08004B68: .4byte 0x02026920

	thumb_func_start sub_08004B6C
sub_08004B6C: @ 0x08004B6C
	adds r2, r0, #0
	cmp r2, #0
	bne _08004B80
	ldr r2, _08004B78 @ =0x02024E20
	b _08004B82
	.align 2, 0
_08004B78: .4byte 0x02024E20
_08004B7C:
	adds r0, r2, #0
	b _08004B98
_08004B80:
	adds r2, #0x6c
_08004B82:
	ldr r0, _08004B9C @ =0x02026920
	cmp r2, r0
	bhs _08004B96
	adds r3, r0, #0
_08004B8A:
	ldr r0, [r2, #0x14]
	cmp r0, r1
	beq _08004B7C
	adds r2, #0x6c
	cmp r2, r3
	blo _08004B8A
_08004B96:
	movs r0, #0
_08004B98:
	bx lr
	.align 2, 0
_08004B9C: .4byte 0x02026920

	thumb_func_start sub_08004BA0
sub_08004BA0: @ 0x08004BA0
	movs r2, #0x40
	ldr r1, _08004BBC @ =0x02024E20
	ldr r0, _08004BC0 @ =0x00001A94
	adds r3, r1, r0
_08004BA8:
	ldr r0, [r1]
	cmp r0, #0
	beq _08004BB0
	subs r2, #1
_08004BB0:
	adds r1, #0x6c
	cmp r1, r3
	ble _08004BA8
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08004BBC: .4byte 0x02024E20
_08004BC0: .4byte 0x00001A94

	thumb_func_start sub_08004BC4
sub_08004BC4: @ 0x08004BC4
	push {lr}
	bl sub_08004BD0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08004BD0
sub_08004BD0: @ 0x08004BD0
	push {r4, lr}
	sub sp, #4
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r1, _08004BF8 @ =0x02026A48
	ldr r2, _08004BFC @ =0x01000160
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _08004C00 @ =0x02026D08
	ldr r2, _08004C04 @ =0x01000010
	bl CpuSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004BF8: .4byte 0x02026A48
_08004BFC: .4byte 0x01000160
_08004C00: .4byte 0x02026D08
_08004C04: .4byte 0x01000010

	thumb_func_start sub_08004C08
sub_08004C08: @ 0x08004C08
	push {lr}
	adds r1, r0, #0
	ldr r0, _08004C1C @ =0x080C72F4
	lsls r1, r1, #5
	movs r2, #0x40
	bl sub_0800105C
	pop {r0}
	bx r0
	.align 2, 0
_08004C1C: .4byte 0x080C72F4

	thumb_func_start sub_08004C20
sub_08004C20: @ 0x08004C20
	push {lr}
	lsls r0, r0, #5
	ldr r2, _08004C34 @ =0x080C72F4
	adds r0, r0, r2
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
	pop {r0}
	bx r0
	.align 2, 0
_08004C34: .4byte 0x080C72F4

	thumb_func_start sub_08004C38
sub_08004C38: @ 0x08004C38
	movs r2, #0
	movs r1, #0x1f
	ldr r3, _08004C54 @ =0x02026D08
_08004C3E:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08004C48
	adds r2, #1
_08004C48:
	subs r1, #1
	cmp r1, #0
	bge _08004C3E
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08004C54: .4byte 0x02026D08

	thumb_func_start sub_08004C58
sub_08004C58: @ 0x08004C58
	adds r1, r0, #0
	lsls r1, r1, #2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r2, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0

	thumb_func_start sub_08004C6C
sub_08004C6C: @ 0x08004C6C
	push {r4, lr}
	movs r2, #0
	ldr r4, _08004C84 @ =0x02026D08
	adds r3, r0, #1
_08004C74:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _08004C88
	strb r3, [r1]
	adds r0, r2, #0
	b _08004C92
	.align 2, 0
_08004C84: .4byte 0x02026D08
_08004C88:
	adds r2, #1
	cmp r2, #0x1f
	ble _08004C74
	movs r0, #1
	rsbs r0, r0, #0
_08004C92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08004C98
sub_08004C98: @ 0x08004C98
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08004CB4 @ =0x02026A48
	lsls r1, r4, #2
	adds r5, r1, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _08004CB8
	ldrb r0, [r5]
	cmp r0, #0xfe
	bhi _08004CEC
	adds r0, #1
	strb r0, [r5]
	b _08004CEC
	.align 2, 0
_08004CB4: .4byte 0x02026A48
_08004CB8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_08004C6C
	adds r0, #1
	strb r0, [r5, #1]
	lsls r4, r4, #7
	ldr r0, _08004CFC @ =0x080C12F4
	adds r4, r4, r0
	ldrb r0, [r5, #1]
	bl sub_08004C58
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	ldr r0, _08004D00 @ =0x0001FFE0
	ands r1, r0
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x80
	bl sub_08002F54
_08004CEC:
	ldrb r0, [r5, #1]
	bl sub_08004C58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08004CFC: .4byte 0x080C12F4
_08004D00: .4byte 0x0001FFE0

	thumb_func_start sub_08004D04
sub_08004D04: @ 0x08004D04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bge _08004D20
	movs r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r1, #2
	b _08004D4C
_08004D20:
	bl sub_08004C98
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	strh r1, [r4]
	lsrs r1, r0, #0x10
	adds r0, r0, r2
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x40
	lsrs r1, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	strh r1, [r2]
	adds r1, r4, #0
	adds r1, #0x42
_08004D4C:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08004D54
sub_08004D54: @ 0x08004D54
	ldr r2, _08004D6C @ =0x02026D08
	ldr r1, _08004D70 @ =0x02026A48
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	subs r1, #1
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	strb r2, [r0, #1]
	bx lr
	.align 2, 0
_08004D6C: .4byte 0x02026D08
_08004D70: .4byte 0x02026A48

	thumb_func_start sub_08004D74
sub_08004D74: @ 0x08004D74
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08004DA0 @ =0x06010000
	ldr r0, _08004DA4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	adds r5, r0, r5
	cmp r2, #0
	bge _08004DA8
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl sub_08002FD8
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #0
	movs r2, #0x40
	bl sub_08002FD8
	b _08004DC8
	.align 2, 0
_08004DA0: .4byte 0x06010000
_08004DA4: .4byte 0x000003FF
_08004DA8:
	ldr r4, _08004DD0 @ =0x080C12F4
	lsls r0, r2, #7
	adds r4, r0, r4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl sub_08002F54
	adds r4, #0x40
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	adds r0, r4, #0
	movs r2, #0x40
	bl sub_08002F54
_08004DC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004DD0: .4byte 0x080C12F4

	thumb_func_start sub_08004DD4
sub_08004DD4: @ 0x08004DD4
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
	bl sub_0800140C
	adds r0, r5, #0
	movs r1, #0
	bl sub_080014B4
	ldr r0, _08004E38 @ =0x08BBFD90
	ldr r1, _08004E3C @ =0x0001FFFF
	ands r1, r6
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08002F54
	ldr r1, _08004E40 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08004E44 @ =0x00007FFF
	strh r0, [r1, #4]
	bl sub_08001034
	adds r0, r5, #0
	bl sub_08002BC0
	movs r1, #0
	bl sub_080017E8
	ldr r4, _08004E48 @ =0x02026D28
	strh r5, [r4, #4]
	str r6, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080013A4
	strh r0, [r4, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004E38: .4byte 0x08BBFD90
_08004E3C: .4byte 0x0001FFFF
_08004E40: .4byte 0x02022860
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
	bl sub_08000FF0
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
	ldr r6, _08004EF0 @ =0x02023C60
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
	bl sub_080017E8
	movs r0, #4
	bl sub_08000FD4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004EEC: .4byte 0x02026D28
_08004EF0: .4byte 0x02023C60

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
	ldr r0, _080050C4 @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r3, #0
	ldr r7, _080050C8 @ =0x02026D28
	movs r0, #0x14
	adds r0, r0, r7
	mov ip, r0
	movs r6, #0xff
_08005092:
	lsls r1, r3, #6
	ldr r0, _080050C4 @ =0x02023C60
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
_080050C4: .4byte 0x02023C60
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
	bl sub_08000FD4
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
	bl sub_08002F54
	ldr r3, _080051E0 @ =0x02022860
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
	bl sub_08001034
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080051CC: .4byte 0x0000FFFF
_080051D0: .4byte 0x02028D48
_080051D4: .4byte 0x02028D4C
_080051D8: .4byte 0x08BBFD90
_080051DC: .4byte 0x0001FFFF
_080051E0: .4byte 0x02022860
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
	ldr r2, _08005230 @ =0x08BFF760
	bl sub_08004264
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
_08005230: .4byte 0x08BFF760

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

	thumb_func_start sub_0800527C
sub_0800527C: @ 0x0800527C
	movs r0, #0
	bx lr

	thumb_func_start sub_08005280
sub_08005280: @ 0x08005280
	push {lr}
	ldr r0, _08005298 @ =0x02028D50
	ldr r1, _0800529C @ =0x06001000
	movs r2, #0x80
	movs r3, #0
	bl sub_080052A4
	ldr r1, _080052A0 @ =0x02028D6C
	movs r0, #0xff
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08005298: .4byte 0x02028D50
_0800529C: .4byte 0x06001000
_080052A0: .4byte 0x02028D6C

	thumb_func_start sub_080052A4
sub_080052A4: @ 0x080052A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080052AE
	ldr r4, _080052D8 @ =0x02028D50
_080052AE:
	str r1, [r4]
	ldr r0, _080052DC @ =sub_08005740
	str r0, [r4, #0xc]
	movs r1, #0
	strh r3, [r4, #0x14]
	lsls r0, r3, #0xc
	adds r0, r2, r0
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	bl sub_0800527C
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_08005320
	bl sub_08005904
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080052D8: .4byte 0x02028D50
_080052DC: .4byte sub_08005740

	thumb_func_start sub_080052E0
sub_080052E0: @ 0x080052E0
	cmp r0, #0
	bne _080052F4
	ldr r0, _080052EC @ =0x02028D68
	ldr r1, [r0]
	ldr r0, _080052F0 @ =0x08BC1FEC
	b _080052FA
	.align 2, 0
_080052EC: .4byte 0x02028D68
_080052F0: .4byte 0x08BC1FEC
_080052F4:
	ldr r0, _08005300 @ =0x02028D68
	ldr r1, [r0]
	ldr r0, _08005304 @ =0x08BDC1E0
_080052FA:
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08005300: .4byte 0x02028D68
_08005304: .4byte 0x08BDC1E0

	thumb_func_start sub_08005308
sub_08005308: @ 0x08005308
	ldr r0, _08005318 @ =0x02028D68
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, _0800531C @ =0x02028D6C
	movs r0, #0xff
	strb r0, [r1]
	bx lr
	.align 2, 0
_08005318: .4byte 0x02028D68
_0800531C: .4byte 0x02028D6C

	thumb_func_start sub_08005320
sub_08005320: @ 0x08005320
	adds r1, r0, #0
	cmp r1, #0
	bne _08005338
	ldr r1, _08005330 @ =0x02028D68
	ldr r0, _08005334 @ =0x02028D50
	str r0, [r1]
	b _0800533C
	.align 2, 0
_08005330: .4byte 0x02028D68
_08005334: .4byte 0x02028D50
_08005338:
	ldr r0, _08005340 @ =0x02028D68
	str r1, [r0]
_0800533C:
	bx lr
	.align 2, 0
_08005340: .4byte 0x02028D68

	thumb_func_start sub_08005344
sub_08005344: @ 0x08005344
	push {r4, lr}
	ldr r2, _08005368 @ =0x02028D68
	ldr r4, [r2]
	ldrh r3, [r4, #0x12]
	movs r2, #0
	strh r3, [r0]
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r2, [r4, #0x12]
	adds r1, r2, r1
	strh r1, [r4, #0x12]
	bl sub_080053B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005368: .4byte 0x02028D68

	thumb_func_start sub_0800536C
sub_0800536C: @ 0x0800536C
	push {r4, lr}
	ldr r2, _08005390 @ =0x02028D68
	ldr r3, [r2]
	ldrh r2, [r3, #0x12]
	movs r4, #0
	strh r2, [r0]
	strb r1, [r0, #4]
	strb r4, [r0, #6]
	movs r2, #1
	strb r2, [r0, #5]
	strb r4, [r0, #7]
	lsls r1, r1, #1
	ldrh r0, [r3, #0x12]
	adds r1, r0, r1
	strh r1, [r3, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005390: .4byte 0x02028D68

	thumb_func_start sub_08005394
sub_08005394: @ 0x08005394
	push {r4, lr}
	adds r4, r0, #0
	b _080053A4
_0800539A:
	ldr r0, [r4]
	ldrb r1, [r4, #4]
	bl sub_08005344
	adds r4, #8
_080053A4:
	ldr r0, [r4]
	cmp r0, #0
	bne _0800539A
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080053B0
sub_080053B0: @ 0x080053B0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	str r0, [sp]
	ldr r0, _080053E4 @ =0x02028D68
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldrb r4, [r4, #4]
	lsls r2, r4, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080053E4: .4byte 0x02028D68

	thumb_func_start sub_080053E8
sub_080053E8: @ 0x080053E8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _08005424 @ =0x02028D68
	ldr r4, [r3]
	ldrb r5, [r0, #4]
	ldrb r6, [r0, #6]
	adds r3, r5, #0
	muls r3, r6, r3
	ldrh r0, [r0]
	adds r3, r0, r3
	adds r3, r3, r1
	lsls r3, r3, #6
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08005428 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005424: .4byte 0x02028D68
_08005428: .4byte 0x001FFFFF

	thumb_func_start sub_0800542C
sub_0800542C: @ 0x0800542C
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #1
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_08005440
sub_08005440: @ 0x08005440
	ldrb r0, [r0, #2]
	bx lr

	thumb_func_start sub_08005444
sub_08005444: @ 0x08005444
	strb r1, [r0, #2]
	bx lr

	thumb_func_start sub_08005448
sub_08005448: @ 0x08005448
	ldrb r2, [r0, #2]
	adds r1, r2, r1
	strb r1, [r0, #2]
	bx lr

	thumb_func_start sub_08005450
sub_08005450: @ 0x08005450
	strb r1, [r0, #3]
	bx lr

	thumb_func_start sub_08005454
sub_08005454: @ 0x08005454
	ldrb r0, [r0, #3]
	bx lr

	thumb_func_start sub_08005458
sub_08005458: @ 0x08005458
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0

	thumb_func_start sub_08005460
sub_08005460: @ 0x08005460
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _080054AC @ =0x02028D68
	ldr r1, [r0]
	ldrb r3, [r4, #4]
	ldrb r5, [r4, #6]
	adds r0, r5, #0
	muls r0, r3, r0
	ldrh r5, [r4]
	adds r0, r5, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	cmp r3, #0
	beq _08005494
_08005480:
	strh r1, [r2]
	adds r1, #1
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08005480
_08005494:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080054A4
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_080054A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080054AC: .4byte 0x02028D68

	thumb_func_start sub_080054B0
sub_080054B0: @ 0x080054B0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080054CA
	movs r3, #0
	adds r2, r0, #0
_080054BA:
	strh r3, [r1]
	adds r0, r1, #0
	adds r0, #0x40
	strh r3, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080054BA
_080054CA:
	bx lr

	thumb_func_start sub_080054CC
sub_080054CC: @ 0x080054CC
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _080054E8 @ =0x02028D68
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r5, r0, #0
	cmp r1, #0
	beq _08005514
	adds r0, r2, #0
	bl sub_08005A94
	b _0800551C
	.align 2, 0
_080054E8: .4byte 0x02028D68
_080054EC:
	ldrb r3, [r2]
	adds r2, #1
	cmp r3, #0x1f
	bls _08005514
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r5]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08005524 @ =0xFFFFFF00
	adds r0, r0, r1
_08005504:
	ldr r0, [r0]
	cmp r0, #0
	beq _08005514
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _08005504
	ldrb r0, [r0, #5]
	adds r4, r0, r4
_08005514:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080054EC
	adds r0, r4, #0
_0800551C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005524: .4byte 0xFFFFFF00

	thumb_func_start sub_08005528
sub_08005528: @ 0x08005528
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0800555C @ =0x02028D68
	ldr r1, [r0]
	ldrb r3, [r2]
	adds r2, #1
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08005560 @ =0xFFFFFF00
	adds r0, r0, r1
_08005544:
	ldr r0, [r0]
	cmp r0, #0
	beq _08005554
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _08005544
	ldrb r0, [r0, #5]
	str r0, [r4]
_08005554:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800555C: .4byte 0x02028D68
_08005560: .4byte 0xFFFFFF00

	thumb_func_start sub_08005564
sub_08005564: @ 0x08005564
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_080054CC
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08005580
sub_08005580: @ 0x08005580
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #0
	str r0, [r6]
	str r0, [r5]
	bl sub_08013374
	adds r4, r0, #0
	b _08005596
_08005594:
	adds r4, #1
_08005596:
	ldrb r0, [r4]
	cmp r0, #1
	bls _080055C0
	adds r0, r4, #0
	bl sub_080054CC
	adds r1, r0, #0
	ldr r0, [r6]
	cmp r0, r1
	bge _080055AC
	str r1, [r6]
_080055AC:
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	adds r0, r4, #0
	bl sub_080055C8
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005594
_080055C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080055C8
sub_080055C8: @ 0x080055C8
	b _080055D4
_080055CA:
	cmp r1, #4
	bne _080055D2
	adds r0, #1
	b _080055D4
_080055D2:
	adds r0, #2
_080055D4:
	ldrb r1, [r0]
	cmp r1, #1
	bhi _080055CA
	bx lr

	thumb_func_start sub_080055DC
sub_080055DC: @ 0x080055DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _080055F4 @ =0x02028D68
	ldr r0, [r0]
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _080055F8
	adds r0, r6, #0
	bl sub_08005A24
	b _0800564A
	.align 2, 0
_080055F4: .4byte 0x02028D68
_080055F8:
	ldrb r0, [r4]
	cmp r0, #1
	bls _0800564A
_080055FE:
	ldrb r3, [r4]
	adds r4, #1
	cmp r3, #0x1f
	bls _08005644
	ldrb r2, [r4]
	adds r4, #1
	ldr r5, _08005620 @ =0x02028D68
_0800560C:
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08005624 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08005644
	b _08005634
	.align 2, 0
_08005620: .4byte 0x02028D68
_08005624: .4byte 0xFFFFFF00
_08005628:
	ldr r1, [r1]
	cmp r1, #0
	bne _08005634
	movs r3, #0x81
	movs r2, #0xa7
	b _0800560C
_08005634:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005628
	ldr r0, [r5]
	ldr r2, [r0, #8]
	adds r0, r6, #0
	bl _call_via_r2
_08005644:
	ldrb r1, [r4]
	cmp r1, #1
	bhi _080055FE
_0800564A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08005650
sub_08005650: @ 0x08005650
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _08005668
	ldr r1, _08005664 @ =0x0818F8F8
	bl sub_080056D8
	b _08005698
	.align 2, 0
_08005664: .4byte 0x0818F8F8
_08005668:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x18
	ldr r1, _080056A0 @ =0x4F820000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sp
	bl sub_080056D8
	ldrb r0, [r5, #2]
	subs r0, #0x10
	strb r0, [r5, #2]
	cmp r4, #0
	bne _08005668
_08005698:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080056A0: .4byte 0x4F820000

	thumb_func_start sub_080056A4
sub_080056A4: @ 0x080056A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xff
	beq _080056B4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080056CC
_080056B4:
	movs r1, #8
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_08005448
	ldr r1, _080056C8 @ =0x0818F8FC
	adds r0, r4, #0
	bl sub_080055DC
	b _080056D2
	.align 2, 0
_080056C8: .4byte 0x0818F8FC
_080056CC:
	adds r0, r4, #0
	bl sub_08005650
_080056D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080056D8
sub_080056D8: @ 0x080056D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080056F4 @ =0x02028D68
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r6, r0, #0
	cmp r1, #0
	beq _080056F8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08005A60
	b _0800573A
	.align 2, 0
_080056F4: .4byte 0x02028D68
_080056F8:
	ldrb r3, [r4]
	adds r4, #1
	ldrb r2, [r4]
	adds r4, #1
_08005700:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08005710 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08005716
	.align 2, 0
_08005710: .4byte 0xFFFFFF00
_08005714:
	ldr r1, [r1]
_08005716:
	cmp r1, #0
	bne _08005728
	movs r3, #0x81
	movs r2, #0xa7
	ldr r6, _08005724 @ =0x02028D68
	b _08005700
	.align 2, 0
_08005724: .4byte 0x02028D68
_08005728:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005714
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
_0800573A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08005740
sub_08005740: @ 0x08005740
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r2, [r0]
	adds r1, r2, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08005760 @ =0x02028D68
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08005760: .4byte 0x02028D68

	thumb_func_start sub_08005764
sub_08005764: @ 0x08005764
	ldr r1, _08005770 @ =0x08BC0590
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08005770: .4byte 0x08BC0590

	thumb_func_start sub_08005774
sub_08005774: @ 0x08005774
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _080057C0 @ =0x02028D68
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r5, #0
	bl _call_via_r1
	mov r8, r0
	movs r4, #7
	ldrb r0, [r5, #2]
	ands r4, r0
	mov r6, sb
	adds r6, #8
	ldrb r0, [r5, #3]
	bl sub_08005764
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08004214
	ldrb r2, [r5, #2]
	mov r1, sb
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	strb r0, [r5, #2]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080057C0: .4byte 0x02028D68

	thumb_func_start sub_080057C4
sub_080057C4: @ 0x080057C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005900 @ =0x02028D68
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0x14]
	movs r0, #9
	bl sub_08005764
	mov sl, r0
	ldr r6, [sp]
	ldrb r0, [r6, #3]
	bl sub_08005764
	mov sb, r0
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r7, [sp, #0xc]
	adds r7, #0x40
_0800580C:
	ldr r2, [sp, #0x14]
	ldm r2!, {r0}
	str r2, [sp, #0x14]
	movs r1, #0
	ldr r3, [sp, #0x10]
	lsls r2, r3, #1
	bl __ashldi3
	movs r5, #0xff
	ands r5, r0
	lsls r5, r5, #1
	adds r6, r5, #0
	add r6, sl
	mov r8, r6
	lsls r6, r1, #0x18
	lsrs r4, r0, #8
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r6, [sp, #0xc]
	ldr r3, [r6]
	ands r3, r2
	str r3, [r6]
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	stm r6!, {r3}
	str r6, [sp, #0xc]
	lsls r5, r1, #0x10
	lsrs r4, r0, #0x10
	adds r2, r5, #0
	orrs r2, r4
	movs r5, #0xff
	ands r5, r2
	lsls r5, r5, #1
	adds r2, r5, #0
	add r2, sl
	mov r8, r2
	lsls r6, r1, #8
	lsrs r4, r0, #0x18
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r3, [r7]
	ands r3, r2
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	str r3, [r7]
	adds r2, r1, #0
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r2, sl
	adds r5, r4, r2
	lsrs r2, r1, #8
	movs r1, #0xff
	ands r1, r2
	lsls r1, r1, #1
	mov r3, sl
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	ldrh r5, [r5]
	orrs r0, r5
	ldr r2, [r7, #0x40]
	ands r2, r0
	add r4, sb
	add r1, sb
	ldrh r1, [r1]
	lsls r0, r1, #0x10
	ldrh r4, [r4]
	orrs r0, r4
	orrs r2, r0
	str r2, [r7, #0x40]
	adds r7, #4
	ldr r6, [sp, #8]
	subs r6, #1
	str r6, [sp, #8]
	cmp r6, #0
	bge _0800580C
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005900: .4byte 0x02028D68

	thumb_func_start sub_08005904
sub_08005904: @ 0x08005904
	push {r4, lr}
	ldr r0, _08005934 @ =0x081901C8
	ldr r4, _08005938 @ =0x02028D68
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
	ldr r1, _0800593C @ =0x02022860
	ldr r2, [r4]
	ldrh r3, [r2, #0x14]
	lsls r0, r3, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08005940 @ =sub_08005774
	str r0, [r2, #8]
	movs r0, #0
	bl sub_080052E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005934: .4byte 0x081901C8
_08005938: .4byte 0x02028D68
_0800593C: .4byte 0x02022860
_08005940: .4byte sub_08005774

	thumb_func_start sub_08005944
sub_08005944: @ 0x08005944
	push {r4, lr}
	ldr r0, _08005974 @ =0x081901E8
	ldr r4, _08005978 @ =0x02028D68
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
	ldr r1, _0800597C @ =0x02022860
	ldr r2, [r4]
	ldrh r3, [r2, #0x14]
	lsls r0, r3, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08005980 @ =sub_08005774
	str r0, [r2, #8]
	movs r0, #1
	bl sub_080052E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005974: .4byte 0x081901E8
_08005978: .4byte 0x02028D68
_0800597C: .4byte 0x02022860
_08005980: .4byte sub_08005774

	thumb_func_start sub_08005984
sub_08005984: @ 0x08005984
	ldr r0, _08005990 @ =0x02028D68
	ldr r1, [r0]
	ldr r0, _08005994 @ =sub_080057C4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08005990: .4byte 0x02028D68
_08005994: .4byte sub_080057C4

	thumb_func_start sub_08005998
sub_08005998: @ 0x08005998
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _080059B2
	mov r4, sp
	mov r0, sp
	ldr r1, [sp, #0x1c]
	bl sub_08005344
_080059B2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08005444
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005450
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl sub_080055DC
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08005460
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080059DC
sub_080059DC: @ 0x080059DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_08005444
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08005450
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080055DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08005A00
sub_08005A00: @ 0x08005A00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_08005444
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08005450
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080056A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08005A24
sub_08005A24: @ 0x08005A24
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	b _08005A4E
_08005A2C:
	ldr r0, _08005A5C @ =0x02028D68
	ldr r3, [r0]
	ldr r2, [r3, #4]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08005A46
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08005A46:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
_08005A4E:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005A2C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08005A5C: .4byte 0x02028D68

	thumb_func_start sub_08005A60
sub_08005A60: @ 0x08005A60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08005A90 @ =0x02028D68
	ldr r3, [r0]
	ldr r2, [r3, #4]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08005A80
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08005A80:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005A90: .4byte 0x02028D68

	thumb_func_start sub_08005A94
sub_08005A94: @ 0x08005A94
	push {r4, lr}
	adds r1, r0, #0
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08005ABA
	ldr r0, _08005AC4 @ =0x02028D68
	ldr r0, [r0]
	ldr r3, [r0, #4]
_08005AA6:
	ldrb r4, [r1]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, #1
	ldrb r0, [r0, #5]
	adds r2, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08005AA6
_08005ABA:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005AC4: .4byte 0x02028D68

	thumb_func_start nullsub_23
nullsub_23: @ 0x08005AC8
	bx lr
	.align 2, 0

	thumb_func_start sub_08005ACC
sub_08005ACC: @ 0x08005ACC
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	ldr r0, _08005B00 @ =sub_08005BB8
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r2, r0
	adds r2, #0x10
	movs r0, #0
	strh r2, [r4, #0x14]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x14
	strh r1, [r4, #0x10]
	strh r0, [r4, #0x12]
	bl sub_0800527C
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_08005320
	ldr r0, _08005B04 @ =sub_08005BDC
	str r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005B00: .4byte sub_08005BB8
_08005B04: .4byte sub_08005BDC

	thumb_func_start sub_08005B08
sub_08005B08: @ 0x08005B08
	ldr r1, _08005B28 @ =0x02028D68
	ldr r3, [r1]
	ldrh r1, [r3, #0x12]
	movs r2, #0
	strh r1, [r0]
	movs r1, #0x20
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r1, [r3, #0x12]
	adds r1, #0x40
	strh r1, [r3, #0x12]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_08005B28: .4byte 0x02028D68

	thumb_func_start sub_08005B2C
sub_08005B2C: @ 0x08005B2C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _08005B76
	movs r0, #0
	strb r0, [r7, #2]
	ldr r4, _08005B80 @ =0x44444444
	str r4, [sp]
	ldr r5, _08005B84 @ =0x02028D68
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldr r6, _08005B88 @ =0x010000D8
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r4, sp, #4
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
_08005B76:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005B80: .4byte 0x44444444
_08005B84: .4byte 0x02028D68
_08005B88: .4byte 0x010000D8

	thumb_func_start sub_08005B8C
sub_08005B8C: @ 0x08005B8C
	push {lr}
	sub sp, #4
	movs r2, #0
	strb r2, [r0, #2]
	str r1, [sp]
	ldr r1, _08005BB0 @ =0x02028D68
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	adds r1, r0, #0
	ldr r2, _08005BB4 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08005BB0: .4byte 0x02028D68
_08005BB4: .4byte 0x01000200

	thumb_func_start sub_08005BB8
sub_08005BB8: @ 0x08005BB8
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r2, [r0]
	adds r1, r2, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08005BD8 @ =0x02028D68
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08005BD8: .4byte 0x02028D68

	thumb_func_start sub_08005BDC
sub_08005BDC: @ 0x08005BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005D88 @ =0x02028D68
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	adds r7, r0, #0
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0xc]
	ldrb r0, [r1, #3]
	bl sub_08005764
	mov r8, r0
	movs r0, #0xff
	mov sb, r0
	ldr r1, [sp, #8]
	lsls r1, r1, #1
	str r1, [sp, #0x10]
	movs r2, #7
	mov sl, r2
_08005C20:
	ldr r3, [sp, #0xc]
	ldm r3!, {r0}
	str r3, [sp, #0xc]
	movs r1, #0
	ldr r3, [sp, #8]
	lsls r2, r3, #1
	bl __ashldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08005C20
	ldr r0, _08005D88 @ =0x02028D68
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r0, r2
	movs r3, #0xff
	mov sb, r3
	movs r0, #7
	mov sl, r0
_08005CD2:
	ldr r2, [sp, #0xc]
	ldm r2!, {r0}
	str r2, [sp, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x10]
	bl __ashldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _08005CD2
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005D88: .4byte 0x02028D68

	thumb_func_start sub_08005D8C
sub_08005D8C: @ 0x08005D8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08005DFA
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x36
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r5, r1
	bge _08005DFA
_08005DB8:
	ldr r0, [r4, #0x30]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	blt _08005DE8
	cmp r2, #1
	ble _08005DCC
	cmp r2, #4
	beq _08005DDA
	b _08005DE8
_08005DCC:
	ldr r1, [r4, #0x2c]
	movs r0, #0
	strb r0, [r1, #7]
	adds r0, r4, #0
	bl sub_0800457C
	b _08005DFA
_08005DDA:
	adds r0, r1, #1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	movs r1, #6
	bl sub_08005448
	b _08005DF0
_08005DE8:
	ldr r0, [r4, #0x2c]
	bl sub_080056D8
	str r0, [r4, #0x30]
_08005DF0:
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r5, r0
	blt _08005DB8
_08005DFA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08005E00
sub_08005E00: @ 0x08005E00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r7, #0
	bne _08005E12
	bl sub_080055DC
_08005E12:
	cmp r4, #0
	bne _08005E18
	movs r4, #1
_08005E18:
	ldr r0, _08005E44 @ =0x08BC05C4
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	str r5, [r2, #0x2c]
	str r6, [r2, #0x30]
	adds r0, #0x36
	movs r1, #0
	strb r4, [r0]
	subs r0, #2
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #7]
	adds r0, r6, #0
	bl sub_080055C8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005E44: .4byte 0x08BC05C4

	thumb_func_start sub_08005E48
sub_08005E48: @ 0x08005E48
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	thumb_func_start sub_08005E50
sub_08005E50: @ 0x08005E50
	push {lr}
	ldr r0, _08005E5C @ =0x08BC05C4
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08005E5C: .4byte 0x08BC05C4

	thumb_func_start sub_08005E60
sub_08005E60: @ 0x08005E60
	push {lr}
	bl sub_08000EEC
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	ldr r2, _08005E80 @ =0x02022860
	lsls r0, r0, #1
	ldr r1, _08005E84 @ =0x08190288
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl sub_08001034
	pop {r0}
	bx r0
	.align 2, 0
_08005E80: .4byte 0x02022860
_08005E84: .4byte 0x08190288

	thumb_func_start sub_08005E88
sub_08005E88: @ 0x08005E88
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08005E9C
	ldr r0, _08005E98 @ =0x08BC05D4
	bl Proc_Start
	b _08005EA4
	.align 2, 0
_08005E98: .4byte 0x08BC05D4
_08005E9C:
	ldr r0, _08005EA8 @ =0x08BC05D4
	movs r1, #3
	bl Proc_Start
_08005EA4:
	pop {r0}
	bx r0
	.align 2, 0
_08005EA8: .4byte 0x08BC05D4

	thumb_func_start sub_08005EAC
sub_08005EAC: @ 0x08005EAC
	push {lr}
	ldr r0, _08005EB8 @ =0x08BC05D4
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08005EB8: .4byte 0x08BC05D4

	thumb_func_start sub_08005EBC
sub_08005EBC: @ 0x08005EBC
	push {r4, r5, lr}
	adds r4, r0, #0
	mov ip, r1
	adds r5, r2, #0
	ldr r0, _08005EE0 @ =0x02028D68
	ldr r1, [r0]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #6]
	adds r0, r3, #0
	muls r0, r2, r0
	ldrh r3, [r4]
	adds r0, r3, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	movs r3, #0
	b _08005EF6
	.align 2, 0
_08005EE0: .4byte 0x02028D68
_08005EE4:
	mov r0, ip
	strh r1, [r0]
	adds r1, #1
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	movs r0, #2
	add ip, r0
	adds r3, #1
_08005EF6:
	cmp r3, r2
	bge _08005EFE
	cmp r3, r5
	blt _08005EE4
_08005EFE:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08005F0E
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_08005F0E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08005F14
sub_08005F14: @ 0x08005F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08005F6C @ =0x02028D68
	ldr r3, [r3]
	lsls r0, r0, #6
	ldr r3, [r3]
	adds r3, r3, r0
	mov r8, r3
	adds r7, r2, #0
	adds r7, #8
	adds r0, r1, #0
	bl sub_08005764
	adds r2, r0, #0
	movs r6, #0xff
	movs r3, #0xf
_08005F36:
	ldm r7!, {r0}
	adds r1, r0, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r4, [r1]
	lsrs r0, r0, #8
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r5, [r0]
	lsls r0, r5, #0x10
	adds r0, r0, r4
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08005F36
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005F6C: .4byte 0x02028D68

	thumb_func_start sub_08005F70
sub_08005F70: @ 0x08005F70
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5]
	strb r2, [r5, #1]
	ldr r0, _08005FA4 @ =0x02028D68
	ldr r3, [r0]
	ldrh r4, [r3, #0x12]
	adds r0, r4, #1
	strh r0, [r3, #0x12]
	strh r4, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #4]
	movs r3, #2
	ldrsh r0, [r5, r3]
	ldr r3, _08005FA8 @ =0x08BDC134
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_08005F14
	movs r1, #2
	ldrsh r0, [r5, r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005FA4: .4byte 0x02028D68
_08005FA8: .4byte 0x08BDC134

	thumb_func_start sub_08005FAC
sub_08005FAC: @ 0x08005FAC
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r1, _08005FC8 @ =0x02028D6C
_08005FB4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08005FCC
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_08005F70
	b _08005FE6
	.align 2, 0
_08005FC8: .4byte 0x02028D6C
_08005FCC:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _08005FE2
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08005FE2
	movs r2, #2
	ldrsh r0, [r1, r2]
	b _08005FE6
_08005FE2:
	adds r1, #4
	b _08005FB4
_08005FE6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08005FEC
sub_08005FEC: @ 0x08005FEC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	cmp r1, #0xff
	bne _08006004
	movs r1, #0
	strh r1, [r4]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	b _0800601C
_08006004:
	bl sub_08005FAC
	lsls r0, r0, #1
	ldr r1, _08006024 @ =0x02028D68
	ldr r1, [r1]
	ldrh r1, [r1, #0x10]
	adds r0, r1, r0
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	adds r0, #1
	strh r0, [r1]
_0800601C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006024: .4byte 0x02028D68

	thumb_func_start sub_08006028
sub_08006028: @ 0x08006028
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _0800603E
	adds r2, r6, #0
	bl sub_08005FEC
	b _08006062
_0800603E:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08005FEC
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bne _0800603E
_08006062:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08006068
sub_08006068: @ 0x08006068
	push {lr}
	movs r3, #0
	bl sub_08006028
	pop {r0}
	bx r0

	thumb_func_start sub_08006074
sub_08006074: @ 0x08006074
	push {lr}
	cmp r2, #0
	blt _0800607E
	cmp r2, #0xff
	bne _0800608A
_0800607E:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl sub_0800623C
	b _0800608E
_0800608A:
	bl sub_08006068
_0800608E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006094
sub_08006094: @ 0x08006094
	push {lr}
	cmp r2, #0x64
	bne _080060A6
	subs r0, #2
	movs r2, #0x28
	movs r3, #0x29
	bl sub_0800623C
	b _080060BE
_080060A6:
	cmp r2, #0
	blt _080060AE
	cmp r2, #0xff
	bne _080060BA
_080060AE:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl sub_0800623C
	b _080060BE
_080060BA:
	bl sub_08006068
_080060BE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080060C4
sub_080060C4: @ 0x080060C4
	push {lr}
	movs r3, #0xa
	bl sub_08006028
	pop {r0}
	bx r0

	thumb_func_start sub_080060D0
sub_080060D0: @ 0x080060D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	beq _080060F4
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x15
	bl sub_08005FEC
	adds r0, r4, #2
	cmp r5, #9
	ble _080060EC
	adds r0, r4, #4
_080060EC:
	movs r1, #4
	adds r2, r5, #0
	bl sub_080060C4
_080060F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080060FC
sub_080060FC: @ 0x080060FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_08000EEC
	adds r5, r0, #0
	movs r0, #0
	ldr r1, _08006144 @ =0x02022C60
	mov r8, r1
_0800610E:
	adds r7, r0, #1
	lsls r4, r0, #7
	movs r6, #0x1d
_08006114:
	mov r1, r8
	adds r0, r4, r1
	movs r2, #1
	ands r2, r5
	adds r5, #1
	movs r1, #0
	bl sub_08005FEC
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08006114
	adds r0, r7, #0
	cmp r0, #9
	ble _0800610E
	movs r0, #1
	bl sub_08000FD4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006144: .4byte 0x02022C60

	thumb_func_start sub_08006148
sub_08006148: @ 0x08006148
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	mov r4, sp
	adds r4, #2
	add r1, sp, #4
	mov r8, r1
	mov r1, sp
	adds r2, r4, #0
	mov r3, r8
	bl sub_08000F58
	mov r1, sp
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	str r0, [sp, #0xc]
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r7, #4
	ldrh r2, [r1]
	adds r1, r6, #0
	bl sub_08006068
	ldrh r5, [r4]
	adds r4, r7, #0
	adds r4, #0xa
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	mov r1, r8
	ldrh r5, [r1]
	adds r4, #8
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	mov r0, sb
	cmp r0, #0
	beq _080061FC
	mov r1, sl
	cmp r1, #0
	beq _08006214
_080061FC:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0x20
	bl sub_08005FEC
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0x21
	bl sub_08005FEC
	b _0800622A
_08006214:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0xff
	bl sub_08005FEC
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0xff
	bl sub_08005FEC
_0800622A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800623C
sub_0800623C: @ 0x0800623C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	adds r4, #2
	bl sub_08005FEC
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08005FEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800625C
sub_0800625C: @ 0x0800625C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006298
sub_08006298: @ 0x08006298
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08005FEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080062D8
sub_080062D8: @ 0x080062D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl sub_08005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl sub_08005FEC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08006320
sub_08006320: @ 0x08006320
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _08006330 @ =0x02029C7C
	ldr r0, [r0]
	cmp r0, #0
	beq _08006392
	adds r4, r0, #0
	b _08006336
	.align 2, 0
_08006330: .4byte 0x02029C7C
_08006334:
	ldr r4, [r4, #0x38]
_08006336:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08006334
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08006376
	ldrh r1, [r4, #6]
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0800635A
	subs r0, r1, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800636E
_0800635A:
	adds r0, r4, #0
	bl sub_08006518
	cmp r0, #1
	bne _08006366
	movs r5, #1
_08006366:
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0800635A
_0800636E:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08006334
_08006376:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08006384
	adds r0, r4, #0
	bl sub_080066E0
_08006384:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _08006334
	cmp r5, #1
	bne _08006392
	bl sub_08006488
_08006392:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08006398
sub_08006398: @ 0x08006398
	ldr r0, _080063BC @ =0x02028E6C
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r2, r0, r1
	ldr r3, _080063C0 @ =0x02029C7C
	cmp r0, r2
	bhs _080063B4
	movs r1, #0
_080063A8:
	strh r1, [r0]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	adds r0, #0x48
	cmp r0, r2
	blo _080063A8
_080063B4:
	movs r0, #0
	str r0, [r3]
	bx lr
	.align 2, 0
_080063BC: .4byte 0x02028E6C
_080063C0: .4byte 0x02029C7C

	thumb_func_start sub_080063C4
sub_080063C4: @ 0x080063C4
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08006418 @ =0x02028E6C
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bhs _080063E8
	ldrh r0, [r4]
	cmp r0, #0
	beq _080063E8
	adds r1, r2, #0
_080063DC:
	adds r4, #0x48
	cmp r4, r1
	bhs _080063E8
	ldrh r0, [r4]
	cmp r0, #0
	bne _080063DC
_080063E8:
	cmp r4, r2
	beq _0800641C
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl sub_08006698
	adds r0, r4, #0
	b _0800641E
	.align 2, 0
_08006418: .4byte 0x02028E6C
_0800641C:
	movs r0, #0
_0800641E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08006424
sub_08006424: @ 0x08006424
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r4, _0800647C @ =0x02028E6C
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bhs _0800644C
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800644C
	adds r1, r2, #0
_08006440:
	adds r4, #0x48
	cmp r4, r1
	bhs _0800644C
	ldrh r0, [r4]
	cmp r0, #0
	bne _08006440
_0800644C:
	cmp r4, r2
	beq _08006480
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r5, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl sub_08006698
	adds r0, r4, #0
	b _08006482
	.align 2, 0
_0800647C: .4byte 0x02028E6C
_08006480:
	movs r0, #0
_08006482:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08006488
sub_08006488: @ 0x08006488
	push {r4, r5, lr}
	ldr r4, _080064D8 @ =0x02028E6C
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	adds r5, r4, #0
	ldr r3, _080064DC @ =0x02029C7C
	cmp r4, r0
	bhs _080064AE
	movs r1, #0
	adds r2, r0, #0
_0800649E:
	ldrh r0, [r4]
	cmp r0, #0
	beq _080064A8
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
_080064A8:
	adds r4, #0x48
	cmp r4, r2
	blo _0800649E
_080064AE:
	movs r0, #0
	str r0, [r3]
	adds r4, r5, #0
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	cmp r4, r0
	bhs _080064D2
	adds r5, r0, #0
_080064C0:
	ldrh r0, [r4]
	cmp r0, #0
	beq _080064CC
	adds r0, r4, #0
	bl sub_08006698
_080064CC:
	adds r4, #0x48
	cmp r4, r5
	blo _080064C0
_080064D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080064D8: .4byte 0x02028E6C
_080064DC: .4byte 0x02029C7C

	thumb_func_start sub_080064E0
sub_080064E0: @ 0x080064E0
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	cmp r3, #0
	bne _080064F8
	ldr r1, _080064F4 @ =0x02029C7C
	ldr r0, [r2, #0x38]
	str r0, [r1]
	str r3, [r0, #0x34]
	b _08006502
	.align 2, 0
_080064F4: .4byte 0x02029C7C
_080064F8:
	ldr r0, [r2, #0x38]
	str r0, [r3, #0x38]
	ldr r1, [r2, #0x38]
	ldr r0, [r2, #0x34]
	str r0, [r1, #0x34]
_08006502:
	movs r0, #0
	strh r0, [r2]
	str r0, [r2, #0x34]
	str r0, [r2, #0x38]
	bx lr

	thumb_func_start sub_0800650C
sub_0800650C: @ 0x0800650C
	push {lr}
	bl sub_080066E0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006518
sub_08006518: @ 0x08006518
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, [r2, #0x20]
	ldm r0!, {r3}
	str r0, [r2, #0x20]
	cmp r3, #0
	blt _0800652A
	b _08006678
_0800652A:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	beq _08006564
	lsrs r1, r3, #0x1c
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	beq _08006544
	cmp r1, #1
	beq _08006554
	b _0800668C
_08006544:
	ldr r0, _08006550 @ =0x0FFFFFFF
	ands r3, r0
	adds r0, r2, #0
	bl _call_via_r3
	b _0800668C
	.align 2, 0
_08006550: .4byte 0x0FFFFFFF
_08006554:
	ldr r0, _08006560 @ =0x0FFFFFFF
	ands r0, r3
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r1, [r2, #6]
	b _0800668C
	.align 2, 0
_08006560: .4byte 0x0FFFFFFF
_08006564:
	lsrs r1, r3, #0x18
	movs r0, #0x3f
	ands r1, r0
	cmp r1, #6
	bls _08006570
	b _0800668C
_08006570:
	lsls r0, r1, #2
	ldr r1, _0800657C @ =_08006580
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800657C: .4byte _08006580
_08006580: @ jump table
	.4byte _0800659C @ case 0
	.4byte _080065B8 @ case 1
	.4byte _080065C4 @ case 2
	.4byte _080065D0 @ case 3
	.4byte _080065CC @ case 4
	.4byte _080065EC @ case 5
	.4byte _0800664A @ case 6
_0800659C:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	movs r0, #1
	strh r0, [r2, #6]
	ldr r0, _080065B4 @ =0x00000FFF
	ldrh r1, [r2, #0xc]
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	b _0800666E
	.align 2, 0
_080065B4: .4byte 0x00000FFF
_080065B8:
	movs r0, #0
	strh r0, [r2]
	movs r0, #1
	strh r0, [r2, #6]
	movs r4, #1
	b _0800668C
_080065C4:
	ldr r0, [r2, #0x24]
	str r0, [r2, #0x20]
	movs r0, #1
	b _0800668A
_080065CC:
	strh r3, [r2, #6]
	b _0800668C
_080065D0:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	ldrh r5, [r2, #2]
	adds r0, r5, r0
	strh r0, [r2, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #4]
	adds r0, r1, r0
	strh r0, [r2, #4]
	lsrs r0, r3, #0x10
	movs r1, #0xff
	ands r0, r1
	b _0800668A
_080065EC:
	ldr r0, _0800662C @ =0x00000FFF
	ldrh r5, [r2, #0xc]
	ands r0, r5
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x15
	ldrb r1, [r2, #0x14]
	adds r0, r1, r0
	strb r3, [r0]
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	movs r0, #1
	strh r0, [r2, #6]
	movs r0, #0xff
	ands r0, r3
	cmp r0, #0x18
	beq _08006642
	cmp r0, #0x18
	bhi _08006630
	cmp r0, #1
	blo _0800668C
	cmp r0, #5
	bls _08006642
	cmp r0, #0x13
	beq _08006642
	b _0800668C
	.align 2, 0
_0800662C: .4byte 0x00000FFF
_08006630:
	cmp r0, #0x39
	beq _08006642
	cmp r0, #0x39
	bhi _0800663E
	cmp r0, #0x2d
	beq _08006642
	b _0800668C
_0800663E:
	cmp r0, #0x52
	bne _0800668C
_08006642:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	b _0800668C
_0800664A:
	strh r3, [r2, #6]
	lsrs r0, r3, #0x10
	strb r0, [r2, #0x13]
	ldr r0, [r2, #0x20]
	ldm r0!, {r1}
	str r1, [r2, #0x28]
	str r0, [r2, #0x20]
	ldm r0!, {r1}
	str r0, [r2, #0x20]
	ldr r0, [r2, #0x30]
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldr r0, _08006674 @ =0x00000FFF
	ldrh r3, [r2, #0xc]
	ands r0, r3
	movs r5, #0x80
	lsls r5, r5, #6
	adds r1, r5, #0
_0800666E:
	orrs r0, r1
	strh r0, [r2, #0xc]
	b _0800668C
	.align 2, 0
_08006674: .4byte 0x00000FFF
_08006678:
	ldr r0, _08006694 @ =0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x3c]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
_0800668A:
	strh r0, [r2, #6]
_0800668C:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006694: .4byte 0x0FFFFFFC

	thumb_func_start sub_08006698
sub_08006698: @ 0x08006698
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _080066AC @ =0x02029C7C
	ldr r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080066B8
_080066A6:
	str r2, [r4]
	b _080066DA
	.align 2, 0
_080066AC: .4byte 0x02029C7C
_080066B0:
	str r0, [r2, #0x38]
	str r1, [r2, #0x34]
	str r2, [r1, #0x38]
	b _080066DA
_080066B8:
	ldrh r3, [r2, #0xa]
	b _080066C4
_080066BC:
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _080066B0
	adds r1, r0, #0
_080066C4:
	ldrh r0, [r1, #0xa]
	cmp r3, r0
	bls _080066BC
	ldr r3, [r1, #0x34]
	str r3, [r2, #0x34]
	str r1, [r2, #0x38]
	str r2, [r1, #0x34]
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _080066A6
	str r2, [r3, #0x38]
_080066DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080066E0
sub_080066E0: @ 0x080066E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _080067EC @ =0x0300283C
	ldrh r0, [r4]
	str r0, [sp]
	ldr r2, [r7, #0x3c]
	cmp r2, #0
	beq _080067DC
	ldr r3, [r2]
	ldr r1, _080067F0 @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08006740
	ldr r6, _080067F4 @ =0x0000FFFF
	ands r6, r3
	cmp r6, #0
	beq _08006740
	ldr r3, _080067F8 @ =0x03003868
_08006710:
	ldr r0, [r3]
	ldrh r1, [r2, #4]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #6]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #8]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #0xa]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	subs r6, #1
	adds r2, #0xc
	cmp r6, #0
	bne _08006710
_08006740:
	adds r5, r2, #0
	ldr r0, [r5]
	cmp r0, #1
	beq _080067DC
	ldr r2, _080067FC @ =0x03002E54
	ldr r0, [r2]
	ldr r1, _08006800 @ =0x03002C50
	mov sl, r1
	cmp r0, sl
	bhs _080067DC
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	movs r1, #0x40
	rsbs r1, r1, #0
	mov r8, r1
	mov ip, r2
_08006762:
	movs r2, #6
	ldrsh r1, [r5, r2]
	movs r2, #2
	ldrsh r0, [r7, r2]
	adds r3, r1, r0
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r2, #4
	ldrsh r0, [r7, r2]
	adds r4, r1, r0
	cmp r3, sb
	bgt _0800677E
	cmp r3, r8
	bge _08006782
_0800677E:
	movs r3, #0xc0
	lsls r3, r3, #1
_08006782:
	cmp r4, #0xa0
	bgt _0800678A
	cmp r4, r8
	bge _0800678E
_0800678A:
	movs r3, #0xc0
	lsls r3, r3, #1
_0800678E:
	ldr r0, _08006804 @ =0x000001FF
	ands r3, r0
	movs r0, #0xff
	ands r4, r0
	movs r6, #0
	ldr r1, [r5]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080067A8
	ldr r0, [sp]
	lsls r6, r0, #0x19
_080067A8:
	ldr r0, [r7, #0x1c]
	adds r6, r6, r0
	mov r0, ip
	ldr r2, [r0]
	adds r0, r1, r6
	lsls r1, r3, #0x10
	orrs r0, r1
	orrs r0, r4
	stm r2!, {r0}
	mov r1, ip
	str r2, [r1]
	ldr r0, _08006808 @ =0x0000F3FF
	ldrh r1, [r5, #4]
	ands r0, r1
	ldrh r1, [r7, #8]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, #4
	mov r0, ip
	str r2, [r0]
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #1
	beq _080067DC
	cmp r2, sl
	blo _08006762
_080067DC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080067EC: .4byte 0x0300283C
_080067F0: .4byte 0xFFFF0000
_080067F4: .4byte 0x0000FFFF
_080067F8: .4byte 0x03003868
_080067FC: .4byte 0x03002E54
_08006800: .4byte 0x03002C50
_08006804: .4byte 0x000001FF
_08006808: .4byte 0x0000F3FF

	thumb_func_start sub_0800680C
sub_0800680C: @ 0x0800680C
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _0800683C @ =0x03002850
	lsls r0, r0, #4
	adds r4, r0, #3
	lsls r4, r4, #1
	adds r4, r4, r5
	strh r1, [r4]
	adds r1, r0, #7
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, #0xf
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800683C: .4byte 0x03002850

	thumb_func_start sub_08006840
sub_08006840: @ 0x08006840
	push {r4, r5, r6, lr}
	movs r3, #0xf
	ldr r2, _08006878 @ =0x0202A480
	ldr r6, _0800687C @ =0x030040B0
	ldr r5, _08006880 @ =0x02029C80
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r0, r2, #0
	adds r0, #0xf0
_08006856:
	str r1, [r0]
	str r4, [r0, #0xc]
	subs r1, #0x10
	subs r0, #0x10
	subs r3, #1
	cmp r3, #0
	bge _08006856
	adds r0, r2, #0
	adds r0, #0xf0
	movs r1, #0
	str r1, [r0]
	subs r0, #0x30
	str r1, [r0]
	str r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006878: .4byte 0x0202A480
_0800687C: .4byte 0x030040B0
_08006880: .4byte 0x02029C80

	thumb_func_start sub_08006884
sub_08006884: @ 0x08006884
	push {r4, r5, r6, r7, lr}
	ldr r6, _080068B8 @ =0x030040B0
	ldr r5, [r6]
	ldr r4, _080068BC @ =0x0202A480
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r4, [r0]
	str r4, [r5]
	ldr r7, _080068C0 @ =0x000001FF
	adds r4, r7, #0
	ands r1, r4
	strh r1, [r5, #4]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r5, #6]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r5, #8]
	str r3, [r5, #0xc]
	str r5, [r0]
	adds r5, #0x10
	str r5, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080068B8: .4byte 0x030040B0
_080068BC: .4byte 0x0202A480
_080068C0: .4byte 0x000001FF

	thumb_func_start sub_080068C4
sub_080068C4: @ 0x080068C4
	push {r4, r5, r6, r7, lr}
	ldr r7, [sp, #0x14]
	ldr r6, _080068EC @ =0x030040B0
	ldr r4, [r6]
	ldr r5, _080068F0 @ =0x0202A480
	lsls r0, r0, #4
	adds r0, r0, r5
	ldr r5, [r0]
	str r5, [r4]
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	strh r7, [r4, #8]
	str r3, [r4, #0xc]
	str r4, [r0]
	adds r4, #0x10
	str r4, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080068EC: .4byte 0x030040B0
_080068F0: .4byte 0x0202A480

	thumb_func_start sub_080068F4
sub_080068F4: @ 0x080068F4
	push {r4, lr}
	lsls r0, r0, #4
	ldr r1, _08006920 @ =0x0202A480
	adds r4, r0, r1
	cmp r4, #0
	beq _0800691A
_08006900:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _08006914
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r3, #6
	ldrsh r1, [r4, r3]
	ldrh r3, [r4, #8]
	bl sub_08004264
_08006914:
	ldr r4, [r4]
	cmp r4, #0
	bne _08006900
_0800691A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006920: .4byte 0x0202A480

	thumb_func_start sub_08006924
sub_08006924: @ 0x08006924
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, [r0, #0x54]
	adds r0, #0x52
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_08006884
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800694C
sub_0800694C: @ 0x0800694C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	beq _08006964
	ldr r0, _08006960 @ =0x08BFF7F8
	adds r1, r4, #0
	b _08006968
	.align 2, 0
_08006960: .4byte 0x08BFF7F8
_08006964:
	ldr r0, _0800698C @ =0x08BFF7F8
	movs r1, #3
_08006968:
	bl Proc_Start
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	adds r0, r1, #0
	adds r0, #0x50
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	str r0, [r1, #0x54]
	adds r2, r1, #0
	adds r2, #0x52
	ldr r0, [sp, #0x18]
	strh r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800698C: .4byte 0x08BFF7F8

	thumb_func_start sub_08006990
sub_08006990: @ 0x08006990
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bne _080069A0
	ldr r0, _080069AC @ =0x08BFF7F8
	bl sub_08004584
_080069A0:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080069AC: .4byte 0x08BFF7F8

	thumb_func_start sub_080069B0
sub_080069B0: @ 0x080069B0
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080069C0 @ =0x08D5E23C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080069C0: .4byte 0x08D5E23C

	thumb_func_start sub_080069C4
sub_080069C4: @ 0x080069C4
	push {r4, lr}
	movs r4, #0
_080069C8:
	adds r0, r4, #0
	bl sub_08006BE0
	adds r4, #1
	cmp r4, #3
	ble _080069C8
	movs r0, #0
	bl sub_080069E0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080069E0
sub_080069E0: @ 0x080069E0
	cmp r0, #0
	bne _080069E6
	ldr r0, _08006A00 @ =0x08BFF808
_080069E6:
	ldr r2, _08006A04 @ =0x0202A580
	adds r1, r0, #0
	movs r3, #3
_080069EC:
	ldr r0, [r1]
	str r0, [r2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	adds r2, #8
	adds r1, #8
	subs r3, #1
	cmp r3, #0
	bge _080069EC
	bx lr
	.align 2, 0
_08006A00: .4byte 0x08BFF808
_08006A04: .4byte 0x0202A580

	thumb_func_start sub_08006A08
sub_08006A08: @ 0x08006A08
	movs r1, #0
	ldr r2, _08006A18 @ =0x030040E0
_08006A0C:
	ldr r0, [r2]
	cmp r0, #0
	bne _08006A1C
	adds r0, r1, #0
	b _08006A28
	.align 2, 0
_08006A18: .4byte 0x030040E0
_08006A1C:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08006A0C
	movs r0, #1
	rsbs r0, r0, #0
_08006A28:
	bx lr
	.align 2, 0

	thumb_func_start sub_08006A2C
sub_08006A2C: @ 0x08006A2C
	push {lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r1]
	ldr r1, _08006A4C @ =0x0202A580
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08006A50 @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08013688
	pop {r0}
	bx r0
	.align 2, 0
_08006A4C: .4byte 0x0202A580
_08006A50: .4byte 0x06010000

	thumb_func_start sub_08006A54
sub_08006A54: @ 0x08006A54
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_08006C2C
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #0x1f
	ands r2, r0
	movs r0, #0xff
	ldrh r1, [r4, #0x36]
	ands r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r1, _08006A94 @ =0x000001FF
	ldrh r3, [r4, #0x34]
	ands r1, r3
	ldr r3, [r4, #0x38]
	ldrh r4, [r4, #0x3c]
	str r4, [sp]
	bl sub_080068C4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006A94: .4byte 0x000001FF

	thumb_func_start sub_08006A98
sub_08006A98: @ 0x08006A98
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl sub_08006A08
	cmp r0, #0
	blt _08006ABA
	str r4, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_08006AC4
	b _08006ABC
_08006ABA:
	movs r0, #0
_08006ABC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08006AC4
sub_08006AC4: @ 0x08006AC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r1, _08006AE8 @ =0x030040E0
	lsls r0, r6, #2
	adds r5, r0, r1
	ldr r7, [r5]
	cmp r7, #0
	beq _08006AEC
	movs r0, #0
	b _08006BA8
	.align 2, 0
_08006AE8: .4byte 0x030040E0
_08006AEC:
	ldr r0, _08006B2C @ =0x08BFF970
	movs r1, #5
	bl Proc_Start
	adds r4, r0, #0
	str r4, [r5]
	mov r0, r8
	bl sub_080069B0
	adds r5, r0, #0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _08006B3C
	str r7, [sp]
	ldr r1, _08006B30 @ =0x0202A580
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	lsls r1, r0, #5
	ldr r0, _08006B34 @ =0x02022A60
	adds r1, r1, r0
	ldr r2, _08006B38 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl sub_08001034
	b _08006B50
	.align 2, 0
_08006B2C: .4byte 0x08BFF970
_08006B30: .4byte 0x0202A580
_08006B34: .4byte 0x02022A60
_08006B38: .4byte 0x01000008
_08006B3C:
	ldr r0, [r5, #8]
	ldr r2, _08006B80 @ =0x0202A580
	lsls r1, r6, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
_08006B50:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #5
	strb r0, [r1]
	mov r1, sb
	strh r1, [r4, #0x34]
	mov r0, sl
	strh r0, [r4, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _08006B84
	str r2, [r4, #0x44]
	str r2, [r4, #0x48]
	b _08006B98
	.align 2, 0
_08006B80: .4byte 0x0202A580
_08006B84:
	ldr r0, _08006BB8 @ =0x08BFFA68
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x44]
	ldr r0, _08006BBC @ =0x08BFFA80
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x48]
_08006B98:
	ldr r1, [sp, #0x24]
	mvns r0, r1
	str r0, [r4, #0x30]
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl sub_08006BF8
	adds r0, r4, #0
_08006BA8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006BB8: .4byte 0x08BFFA68
_08006BBC: .4byte 0x08BFFA80

	thumb_func_start sub_08006BC0
sub_08006BC0: @ 0x08006BC0
	push {lr}
	ldr r2, _08006BDC @ =0x030040E0
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	str r2, [r1]
	bl sub_08004460
	pop {r0}
	bx r0
	.align 2, 0
_08006BDC: .4byte 0x030040E0

	thumb_func_start sub_08006BE0
sub_08006BE0: @ 0x08006BE0
	push {lr}
	ldr r1, _08006BF4 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08006BC0
	pop {r0}
	bx r0
	.align 2, 0
_08006BF4: .4byte 0x030040E0

	thumb_func_start sub_08006BF8
sub_08006BF8: @ 0x08006BF8
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08006C0A
	str r1, [r4, #0x30]
	bl sub_08006C48
	ldr r0, [r4, #0x30]
	b _08006C0C
_08006C0A:
	movs r0, #0
_08006C0C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08006C14
sub_08006C14: @ 0x08006C14
	push {lr}
	ldr r2, _08006C28 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_08006BF8
	pop {r1}
	bx r1
	.align 2, 0
_08006C28: .4byte 0x030040E0

	thumb_func_start sub_08006C2C
sub_08006C2C: @ 0x08006C2C
	ldr r0, [r0, #0x30]
	bx lr

	thumb_func_start sub_08006C30
sub_08006C30: @ 0x08006C30
	push {lr}
	ldr r1, _08006C44 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08006C2C
	pop {r1}
	bx r1
	.align 2, 0
_08006C44: .4byte 0x030040E0

	thumb_func_start sub_08006C48
sub_08006C48: @ 0x08006C48
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x30]
	ldr r0, _08006C70 @ =0x00000807
	ands r1, r0
	cmp r1, #3
	beq _08006C94
	cmp r1, #3
	bls _08006C74
	cmp r1, #5
	beq _08006CA4
	cmp r1, #5
	blo _08006C9C
	subs r0, #7
	cmp r1, r0
	beq _08006CAC
	adds r0, #1
	cmp r1, r0
	beq _08006CB4
	b _08006CB8
	.align 2, 0
_08006C70: .4byte 0x00000807
_08006C74:
	cmp r1, #1
	beq _08006C84
	cmp r1, #1
	bhi _08006C8C
	ldr r0, _08006C80 @ =0x08BFF828
	b _08006CB6
	.align 2, 0
_08006C80: .4byte 0x08BFF828
_08006C84:
	ldr r0, _08006C88 @ =0x08BFF842
	b _08006CB6
	.align 2, 0
_08006C88: .4byte 0x08BFF842
_08006C8C:
	ldr r0, _08006C90 @ =0x08BFF85C
	b _08006CB6
	.align 2, 0
_08006C90: .4byte 0x08BFF85C
_08006C94:
	ldr r0, _08006C98 @ =0x08BFF882
	b _08006CB6
	.align 2, 0
_08006C98: .4byte 0x08BFF882
_08006C9C:
	ldr r0, _08006CA0 @ =0x08BFF8A8
	b _08006CB6
	.align 2, 0
_08006CA0: .4byte 0x08BFF8A8
_08006CA4:
	ldr r0, _08006CA8 @ =0x08BFF8DA
	b _08006CB6
	.align 2, 0
_08006CA8: .4byte 0x08BFF8DA
_08006CAC:
	ldr r0, _08006CB0 @ =0x08BFF90C
	b _08006CB6
	.align 2, 0
_08006CB0: .4byte 0x08BFF90C
_08006CB4:
	ldr r0, _08006CD0 @ =0x08BFF93E
_08006CB6:
	str r0, [r3, #0x38]
_08006CB8:
	ldr r1, [r3, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0x80
	beq _08006CE2
	cmp r1, #0x80
	bhi _08006CD4
	cmp r1, #0x40
	beq _08006CDE
	b _08006CEE
	.align 2, 0
_08006CD0: .4byte 0x08BFF93E
_08006CD4:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08006CE8
	b _08006CEE
_08006CDE:
	movs r4, #0
	b _08006CF2
_08006CE2:
	movs r4, #0x80
	lsls r4, r4, #3
	b _08006CF2
_08006CE8:
	movs r4, #0xc0
	lsls r4, r4, #4
	b _08006CF2
_08006CEE:
	movs r4, #0x80
	lsls r4, r4, #4
_08006CF2:
	ldr r1, _08006D18 @ =0x0202A580
	adds r0, r3, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r2, r2, r1
	ldr r1, [r2]
	lsrs r1, r1, #5
	movs r0, #0xf
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r4
	strh r1, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006D18: .4byte 0x0202A580

	thumb_func_start sub_08006D1C
sub_08006D1C: @ 0x08006D1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov ip, r2
	ldrb r7, [r1]
	adds r1, #1
	ldrb r6, [r1]
	adds r2, r1, #1
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08006D66
	movs r0, #0
	cmp r0, r6
	bge _08006DA0
_08006D3A:
	adds r4, r0, #1
	cmp r7, #0
	beq _08006D5E
	lsls r0, r0, #6
	mov r3, r8
	adds r1, r0, r3
	adds r3, r7, #0
_08006D48:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08006D54
	ldrb r0, [r2]
	add r0, ip
	strh r0, [r1]
_08006D54:
	adds r2, #1
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08006D48
_08006D5E:
	adds r0, r4, #0
	cmp r0, r6
	blt _08006D3A
	b _08006DA0
_08006D66:
	movs r0, #0
	cmp r0, r6
	bge _08006DA0
_08006D6C:
	subs r3, r7, #1
	adds r4, r0, #1
	cmp r3, #0
	blt _08006D9A
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r1, #0
	lsls r1, r3, #1
	lsls r0, r0, #6
	add r0, r8
	adds r1, r1, r0
_08006D82:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08006D90
	ldrb r0, [r2]
	add r0, ip
	adds r0, r0, r5
	strh r0, [r1]
_08006D90:
	adds r2, #1
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08006D82
_08006D9A:
	adds r0, r4, #0
	cmp r0, r6
	blt _08006D6C
_08006DA0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006DAC
sub_08006DAC: @ 0x08006DAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08006DE0 @ =0x00007EFF
	cmp r4, r0
	ble _08006DE8
	adds r0, r4, #0
	bl sub_08007428
	lsls r1, r5, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	ldr r2, _08006DE4 @ =0x0001FFFF
	ands r1, r2
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08002F54
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08007458
	b _08006E08
	.align 2, 0
_08006DE0: .4byte 0x00007EFF
_08006DE4: .4byte 0x0001FFFF
_08006DE8:
	adds r0, r4, #0
	bl sub_080069B0
	adds r4, r0, #0
	ldr r0, [r4, #4]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08013688
	ldr r0, [r4, #8]
	lsls r1, r6, #5
	movs r2, #0x20
	bl sub_0800105C
_08006E08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006E10
sub_08006E10: @ 0x08006E10
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_08006DAC
	ldr r2, _08006E4C @ =0x000003FF
	ands r2, r6
	ldr r1, _08006E50 @ =0x08BFF9E0
	lsls r5, r5, #0xc
	adds r2, r2, r5
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r0, r8
	adds r3, r4, #0
	bl sub_08006D1C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006E4C: .4byte 0x000003FF
_08006E50: .4byte 0x08BFF9E0

	thumb_func_start sub_08006E54
sub_08006E54: @ 0x08006E54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08006EE4 @ =0xFFFFFE00
	add sp, r4
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r0, #0x80
	lsls r0, r0, #4
	adds r7, r7, r0
	ldr r0, _08006EE8 @ =0x00007EFF
	cmp r6, r0
	ble _08006EF0
	adds r0, r6, #0
	bl sub_08007428
	lsls r1, r7, #5
	ldr r5, _08006EEC @ =0x0001FFFF
	ands r1, r5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	movs r2, #0x80
	bl sub_08002F54
	adds r0, r6, #0
	bl sub_08007428
	adds r0, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl sub_08002F54
	adds r0, r6, #0
	bl sub_08007428
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #4
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl sub_08002F54
	adds r0, r6, #0
	bl sub_08007428
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl sub_08002F54
	mov r1, r8
	adds r1, #0x10
	adds r0, r6, #0
	bl sub_08007458
	b _08006F4C
	.align 2, 0
_08006EE4: .4byte 0xFFFFFE00
_08006EE8: .4byte 0x00007EFF
_08006EEC: .4byte 0x0001FFFF
_08006EF0:
	adds r0, r6, #0
	bl sub_080069B0
	adds r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, sp
	bl sub_08013688
	lsls r1, r7, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	mov r0, sp
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x100
	adds r1, r7, #4
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x180
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, [r5, #8]
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
_08006F4C:
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08006F5C
sub_08006F5C: @ 0x08006F5C
	push {r4, lr}
	sub sp, #4
	movs r2, #0x34
	ldrsh r1, [r0, r2]
	ldr r3, _08006F88 @ =0x03002790
	ldrh r4, [r3, #0x1c]
	subs r1, r1, r4
	movs r4, #0x36
	ldrsh r2, [r0, r4]
	ldrh r3, [r3, #0x1e]
	subs r2, r2, r3
	ldr r3, [r0, #0x38]
	ldrh r0, [r0, #0x3c]
	str r0, [sp]
	movs r0, #5
	bl sub_08006884
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006F88: .4byte 0x03002790

	thumb_func_start sub_08006F8C
sub_08006F8C: @ 0x08006F8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r0, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	ldr r7, [sp, #0x24]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_08006E54
	ldr r0, _08006FD4 @ =0x08BFF9F4
	adds r1, r7, #0
	bl Proc_Start
	adds r1, r0, #0
	mov r0, r8
	strh r0, [r1, #0x34]
	mov r0, sb
	strh r0, [r1, #0x36]
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r6, r6, r4
	strh r6, [r1, #0x3c]
	cmp r5, #0
	beq _08006FDC
	ldr r0, _08006FD8 @ =0x08BFFA12
	b _08006FDE
	.align 2, 0
_08006FD4: .4byte 0x08BFF9F4
_08006FD8: .4byte 0x08BFFA12
_08006FDC:
	ldr r0, _08006FEC @ =0x08BFFA04
_08006FDE:
	str r0, [r1, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006FEC: .4byte 0x08BFFA04

	thumb_func_start sub_08006FF0
sub_08006FF0: @ 0x08006FF0
	push {lr}
	ldr r0, _08006FFC @ =0x08BFF9F4
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08006FFC: .4byte 0x08BFF9F4

	thumb_func_start sub_08007000
sub_08007000: @ 0x08007000
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r6, [r2, #0x14]
	subs r6, #1
	ldrb r4, [r2, #0x15]
	ldr r1, _08007050 @ =0x081911D4
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl sub_080C0C28
	lsls r4, r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r2, r4, r5
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007050: .4byte 0x081911D4

	thumb_func_start sub_08007054
sub_08007054: @ 0x08007054
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r6, [r2, #0x14]
	subs r6, #1
	ldrb r4, [r2, #0x15]
	subs r4, #1
	ldr r1, _080070A8 @ =0x0819128C
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl sub_080C0C28
	lsls r4, r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r2, r4, r5
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080070A8: .4byte 0x0819128C

	thumb_func_start sub_080070AC
sub_080070AC: @ 0x080070AC
	subs r0, #0x1c
	cmp r0, #0x25
	bhi _0800715C
	lsls r0, r0, #2
	ldr r1, _080070BC @ =_080070C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080070BC: .4byte _080070C0
_080070C0: @ jump table
	.4byte _08007158 @ case 0
	.4byte _0800715C @ case 1
	.4byte _0800715C @ case 2
	.4byte _0800715C @ case 3
	.4byte _0800715C @ case 4
	.4byte _0800715C @ case 5
	.4byte _0800715C @ case 6
	.4byte _0800715C @ case 7
	.4byte _0800715C @ case 8
	.4byte _0800715C @ case 9
	.4byte _0800715C @ case 10
	.4byte _0800715C @ case 11
	.4byte _0800715C @ case 12
	.4byte _0800715C @ case 13
	.4byte _0800715C @ case 14
	.4byte _0800715C @ case 15
	.4byte _0800715C @ case 16
	.4byte _0800715C @ case 17
	.4byte _0800715C @ case 18
	.4byte _0800715C @ case 19
	.4byte _0800715C @ case 20
	.4byte _0800715C @ case 21
	.4byte _0800715C @ case 22
	.4byte _08007158 @ case 23
	.4byte _0800715C @ case 24
	.4byte _0800715C @ case 25
	.4byte _0800715C @ case 26
	.4byte _0800715C @ case 27
	.4byte _0800715C @ case 28
	.4byte _08007158 @ case 29
	.4byte _0800715C @ case 30
	.4byte _0800715C @ case 31
	.4byte _0800715C @ case 32
	.4byte _0800715C @ case 33
	.4byte _08007158 @ case 34
	.4byte _08007158 @ case 35
	.4byte _0800715C @ case 36
	.4byte _08007158 @ case 37
_08007158:
	movs r0, #1
	b _0800715E
_0800715C:
	movs r0, #0
_0800715E:
	bx lr

	thumb_func_start sub_08007160
sub_08007160: @ 0x08007160
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	beq _08007210
	adds r0, r5, #0
	bl sub_080069B0
	adds r4, r0, #0
	ldr r0, [r4, #8]
	lsls r1, r7, #5
	mov r8, r1
	movs r2, #0x20
	bl sub_0800105C
	ldr r0, [r4]
	cmp r0, #0
	beq _080071F0
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08013688
	ldr r0, [r4, #8]
	mov r1, r8
	movs r2, #0x20
	bl sub_0800105C
	adds r0, r5, #0
	bl sub_080070AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080071C8
	lsls r1, r7, #0xc
	ldr r0, _080071C4 @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl sub_08007054
	b _080071D8
	.align 2, 0
_080071C4: .4byte 0x000003FF
_080071C8:
	lsls r1, r7, #0xc
	ldr r0, _080071EC @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl sub_08007000
_080071D8:
	movs r2, #0
	mov r0, sb
	movs r1, #5
_080071DE:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #0x40
	subs r1, #1
	cmp r1, #0
	bge _080071DE
	b _08007210
	.align 2, 0
_080071EC: .4byte 0x000003FF
_080071F0:
	ldr r0, [r4, #0x10]
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08013688
	lsls r1, r7, #0xc
	ldr r0, _0800721C @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	movs r2, #0xa
	movs r3, #9
	bl sub_0801383C
_08007210:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800721C: .4byte 0x000003FF

	thumb_func_start sub_08007220
sub_08007220: @ 0x08007220
	movs r2, #0
	str r2, [r0, #0x2c]
	movs r1, #0x78
	str r1, [r0, #0x38]
	strh r2, [r0, #0x32]
	bx lr

	thumb_func_start sub_0800722C
sub_0800722C: @ 0x0800722C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _0800724C
	adds r0, r4, #0
	bl sub_0800790C
	str r0, [r4, #0x38]
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl sub_0800457C
_0800724C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007254
sub_08007254: @ 0x08007254
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r2, r0, #0xc
	adds r1, r4, #0
	adds r1, #0x40
	ldr r0, _0800728C @ =0x000003FF
	ldrh r1, [r1]
	ands r0, r1
	adds r7, r2, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_080069B0
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bhi _080072F8
	lsls r0, r0, #2
	ldr r1, _08007290 @ =_08007294
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800728C: .4byte 0x000003FF
_08007290: .4byte _08007294
_08007294: @ jump table
	.4byte _080072C0 @ case 0
	.4byte _08007348 @ case 1
	.4byte _08007348 @ case 2
	.4byte _080072BC @ case 3
	.4byte _08007348 @ case 4
	.4byte _08007348 @ case 5
	.4byte _080072C0 @ case 6
	.4byte _08007348 @ case 7
	.4byte _08007348 @ case 8
	.4byte _080072C4 @ case 9
_080072BC:
	movs r6, #0x58
	b _080072F8
_080072C0:
	movs r6, #0x18
	b _080072F8
_080072C4:
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #0xc
	adds r3, r4, #0
	adds r3, #0x40
	ldr r2, _080072F4 @ =0x000003FF
	ldrh r3, [r3]
	ands r2, r3
	adds r1, r1, r2
	adds r2, r5, #0
	bl sub_08007000
	ldr r0, [r4, #0x3c]
	bl sub_08002E30
	bl sub_08000FF0
	adds r0, r4, #0
	bl sub_0800457C
	b _0800734E
	.align 2, 0
_080072F4: .4byte 0x000003FF
_080072F8:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_080069B0
	adds r5, r0, #0
	ldrb r3, [r5, #0x17]
	lsls r1, r3, #6
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r5, [r5, #0x16]
	lsls r1, r5, #1
	adds r0, r0, r1
	mov ip, r0
	subs r0, #2
	adds r2, r7, r6
	strh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r1, r2, #2
	strh r1, [r0, #4]
	adds r1, r2, #3
	strh r1, [r0, #6]
	adds r1, #0x1d
	mov r3, ip
	strh r1, [r3, #0x3e]
	adds r3, #0x40
	adds r1, #1
	strh r1, [r3]
	adds r3, #2
	adds r1, #1
	strh r1, [r3]
	mov r1, ip
	adds r1, #0x44
	adds r2, #0x23
	strh r2, [r1]
	bl sub_08002E30
	bl sub_08000FF0
_08007348:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_0800734E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08007354
sub_08007354: @ 0x08007354
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r0, _08007384 @ =0x08BFFA20
	bl sub_08004748
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_08007160
	mov r0, r8
	bl sub_080069B0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007384: .4byte 0x08BFFA20

	thumb_func_start sub_08007388
sub_08007388: @ 0x08007388
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_08006BC0
	pop {r0}
	bx r0

	thumb_func_start sub_08007394
sub_08007394: @ 0x08007394
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080073A8 @ =0x08BFFA50
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080073A8: .4byte 0x08BFFA50

	thumb_func_start sub_080073AC
sub_080073AC: @ 0x080073AC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	ldrh r0, [r5, #0x3e]
	bl sub_080069B0
	mov r8, r0
	ldr r6, _080073F0 @ =0x0202A580
	adds r4, r5, #0
	adds r4, #0x40
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	adds r0, #0x10
	bl sub_0801417C
	mov r1, r8
	ldr r0, [r1, #8]
	ldrb r4, [r4]
	lsls r1, r4, #3
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	adds r1, #0x10
	movs r2, #0xc
	adds r3, r5, #0
	bl sub_08014020
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080073F0: .4byte 0x0202A580

	thumb_func_start sub_080073F4
sub_080073F4: @ 0x080073F4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl sub_080069B0
	ldr r1, _08007424 @ =0x0202A580
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r0, #0x10
	movs r1, #0xc
	adds r2, r4, #0
	bl sub_08013FE8
	adds r0, r4, #0
	bl sub_08007394
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007424: .4byte 0x0202A580

	thumb_func_start sub_08007428
sub_08007428: @ 0x08007428
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r2, sp
	ldr r1, _08007450 @ =0x0818F904
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	ldr r1, _08007454 @ =0xFFFF8100
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08007450: .4byte 0x0818F904
_08007454: .4byte 0xFFFF8100

	thumb_func_start sub_08007458
sub_08007458: @ 0x08007458
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	mov r3, sp
	ldr r2, _08007488 @ =0x0818F920
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldr r2, [r2]
	str r2, [r3]
	ldr r2, _0800748C @ =0xFFFF8100
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007488: .4byte 0x0818F920
_0800748C: .4byte 0xFFFF8100

	thumb_func_start sub_08007490
sub_08007490: @ 0x08007490
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800749C
sub_0800749C: @ 0x0800749C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	bne _080074F0
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	movs r1, #8
	ands r1, r0
	movs r3, #0
	cmp r1, #0
	bne _080074C2
	movs r3, #0x18
_080074C2:
	adds r3, #0x10
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _080074E8 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _080074EC @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_0801372C
	b _08007560
	.align 2, 0
_080074E8: .4byte 0x000003FF
_080074EC: .4byte 0x06010000
_080074F0:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08007560
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	movs r1, #8
	ands r1, r0
	movs r5, #0
	cmp r1, #0
	bne _0800750E
	movs r5, #0x18
_0800750E:
	bl RandNextB
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0800753A
	cmp r0, #1
	ble _08007540
	cmp r0, #2
	beq _0800753E
	cmp r0, #3
	bne _08007540
_0800753A:
	adds r5, #8
	b _08007540
_0800753E:
	adds r5, #0x10
_08007540:
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r5, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _080075E0 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _080075E4 @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_0801372C
_08007560:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x2c]
	movs r1, #4
	ldrb r2, [r2, #0x14]
	subs r5, r1, r2
	bl sub_08006C2C
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _08007578
	rsbs r5, r5, #0
_08007578:
	lsls r1, r5, #3
	ldr r0, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r5, r1, #0
	subs r5, #0x10
	ldr r1, _080075E8 @ =0x000001FF
	ands r5, r1
	bl sub_08006C2C
	ands r0, r6
	cmp r0, #0
	beq _0800759A
	movs r0, #0x80
	lsls r0, r0, #5
	adds r5, r5, r0
_0800759A:
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #0x1f
	ands r2, r0
	ldr r4, [r4, #0x2c]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x2c]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _080075EC @ =0x08BFF7A8
	ldrh r1, [r4, #0x3c]
	adds r1, #0x1c
	str r1, [sp]
	adds r1, r5, #0
	bl sub_080068C4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080075E0: .4byte 0x000003FF
_080075E4: .4byte 0x06010000
_080075E8: .4byte 0x000001FF
_080075EC: .4byte 0x08BFF7A8

	thumb_func_start sub_080075F0
sub_080075F0: @ 0x080075F0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	mov sb, r0
	cmp r5, #1
	beq _0800761E
	cmp r5, #1
	bgt _08007610
	cmp r5, #0
	beq _0800761A
	b _080076E6
_08007610:
	cmp r5, #0x80
	beq _08007622
	cmp r5, #0x81
	beq _0800762A
	b _080076E6
_0800761A:
	movs r5, #0x58
	b _08007630
_0800761E:
	movs r5, #0x18
	b _08007630
_08007622:
	movs r5, #0x58
	movs r1, #1
	mov sb, r1
	b _08007630
_0800762A:
	movs r5, #0x18
	movs r3, #1
	mov sb, r3
_08007630:
	ldr r0, [r7, #0x2c]
	ldr r2, [r0, #0x2c]
	movs r1, #4
	ldrb r2, [r2, #0x16]
	subs r4, r1, r2
	bl sub_08006C2C
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne _0800764A
	rsbs r4, r4, #0
_0800764A:
	lsls r1, r4, #3
	ldr r0, [r7, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r4, r1, #0
	subs r4, #0x10
	ldr r1, _080076C8 @ =0x000001FF
	ands r4, r1
	bl sub_08006C2C
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0800766E
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r4, r0
_0800766E:
	ldr r0, [r7, #0x2c]
	bl sub_08006C2C
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	rsbs r0, r0, #0
	asrs r6, r0, #0x1f
	ands r6, r1
	ldr r2, [r7, #0x2c]
	movs r3, #0x36
	ldrsh r0, [r2, r3]
	ldr r1, [r2, #0x2c]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r6, r6, r0
	mov r0, sb
	cmp r0, #0
	beq _080076D0
	adds r0, r2, #0
	bl sub_08006C2C
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080076AA
	adds r4, #0x10
_080076AA:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _080076CC @ =0x08BFF768
	ldrh r1, [r1, #0x3c]
	adds r1, r1, r5
	adds r1, #2
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_080068C4
	b _080076E6
	.align 2, 0
_080076C8: .4byte 0x000001FF
_080076CC: .4byte 0x08BFF768
_080076D0:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _080076F4 @ =0x08BFF7A8
	ldrh r2, [r2, #0x3c]
	adds r1, r2, r5
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_080068C4
_080076E6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080076F4: .4byte 0x08BFF7A8

	thumb_func_start sub_080076F8
sub_080076F8: @ 0x080076F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_0800790C
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne _08007730
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, _08007738 @ =0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl sub_080045FC
_08007730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007738: .4byte 0x7FFFFFFF

	thumb_func_start sub_0800773C
sub_0800773C: @ 0x0800773C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _08007758
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080045FC
	b _0800776E
_08007758:
	cmp r0, #0
	bge _0800776E
	adds r0, r4, #0
	bl sub_0800790C
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl sub_080045FC
_0800776E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08007774
sub_08007774: @ 0x08007774
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _080077CC
	lsls r0, r0, #2
	ldr r1, _0800778C @ =_08007790
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800778C: .4byte _08007790
_08007790: @ jump table
	.4byte _080077C0 @ case 0
	.4byte _080077C0 @ case 1
	.4byte _080077C0 @ case 2
	.4byte _080077BC @ case 3
	.4byte _080077BC @ case 4
	.4byte _080077BC @ case 5
	.4byte _080077C0 @ case 6
	.4byte _080077C0 @ case 7
	.4byte _080077C0 @ case 8
	.4byte _080077CC @ case 9
	.4byte _080077C4 @ case 10
_080077BC:
	movs r5, #0
	b _080077CC
_080077C0:
	movs r5, #1
	b _080077CC
_080077C4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080045FC
_080077CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080075F0
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080077E0
sub_080077E0: @ 0x080077E0
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_080077E8
sub_080077E8: @ 0x080077E8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _080077FC
	adds r0, r4, #0
	bl sub_08007774
	b _08007814
_080077FC:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080075F0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007814
	adds r0, r4, #0
	movs r1, #1
	bl sub_080045FC
_08007814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800781C
sub_0800781C: @ 0x0800781C
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_08007824
sub_08007824: @ 0x08007824
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt _08007838
	adds r0, r4, #0
	bl sub_08007774
	b _08007850
_08007838:
	adds r0, r4, #0
	movs r1, #1
	bl sub_080075F0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007850
	adds r0, r4, #0
	movs r1, #1
	bl sub_080045FC
_08007850:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007858
sub_08007858: @ 0x08007858
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_08007860
sub_08007860: @ 0x08007860
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _080078BC
	lsls r0, r0, #2
	ldr r1, _08007878 @ =_0800787C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007878: .4byte _0800787C
_0800787C: @ jump table
	.4byte _080078AC @ case 0
	.4byte _080078AC @ case 1
	.4byte _080078AC @ case 2
	.4byte _080078A8 @ case 3
	.4byte _080078A8 @ case 4
	.4byte _080078A8 @ case 5
	.4byte _080078AC @ case 6
	.4byte _080078AC @ case 7
	.4byte _080078AC @ case 8
	.4byte _080078BC @ case 9
	.4byte _080078B0 @ case 10
_080078A8:
	movs r5, #0
	b _080078BC
_080078AC:
	movs r5, #1
	b _080078BC
_080078B0:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080045FC
	movs r0, #0
	strh r0, [r4, #0x32]
_080078BC:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl sub_080075F0
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080078D4
sub_080078D4: @ 0x080078D4
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bne _080078E0
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0, #0x18]
_080078E0:
	ldr r4, [r2, #0x48]
	strh r1, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800790C
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080078F4
sub_080078F4: @ 0x080078F4
	push {lr}
	ldr r2, _08007908 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_080078D4
	pop {r0}
	bx r0
	.align 2, 0
_08007908: .4byte 0x030040E0

	thumb_func_start sub_0800790C
sub_0800790C: @ 0x0800790C
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #0x30]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _08007960
	lsls r0, r0, #2
	ldr r1, _0800792C @ =_08007930
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800792C: .4byte _08007930
_08007930: @ jump table
	.4byte _0800794E @ case 0
	.4byte _08007954 @ case 1
	.4byte _08007944 @ case 2
	.4byte _0800795A @ case 3
	.4byte _0800795E @ case 4
_08007944:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b _08007960
_0800794E:
	asrs r0, r2, #7
	adds r0, #0x1e
	b _08007960
_08007954:
	asrs r0, r2, #9
	adds r0, #0x1e
	b _08007960
_0800795A:
	movs r0, #1
	b _08007960
_0800795E:
	ldr r0, _08007968 @ =0x7FFFFFFF
_08007960:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007968: .4byte 0x7FFFFFFF

	thumb_func_start sub_0800796C
sub_0800796C: @ 0x0800796C
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_08007974
sub_08007974: @ 0x08007974
	push {lr}
	ldr r2, _08007988 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_0800796C
	pop {r0}
	bx r0
	.align 2, 0
_08007988: .4byte 0x030040E0

	thumb_func_start sub_0800798C
sub_0800798C: @ 0x0800798C
	push {r4, r5, lr}
	ldr r2, _080079AC @ =0x030040E0
	ldr r0, [r2]
	ldr r4, [r0, #0x48]
	ldr r1, _080079B0 @ =gpKeySt
	ldr r0, [r1]
	movs r3, #1
	ldrh r0, [r0, #4]
	ands r3, r0
	adds r5, r1, #0
	cmp r3, #0
	beq _080079B4
	movs r0, #2
	strh r0, [r4, #0x32]
	b _080079B6
	.align 2, 0
_080079AC: .4byte 0x030040E0
_080079B0: .4byte gpKeySt
_080079B4:
	strh r3, [r4, #0x32]
_080079B6:
	ldr r0, [r2, #8]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080079CC
	movs r0, #3
_080079CC:
	strh r0, [r4, #0x32]
	ldr r0, [r2, #4]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080079E4
	movs r0, #4
	strh r0, [r4, #0x32]
_080079E4:
	ldr r0, [r2, #0xc]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080079FA
	movs r0, #4
	strh r0, [r4, #0x32]
_080079FA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08007A00
sub_08007A00: @ 0x08007A00
	push {lr}
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0
	movs r3, #0x13
	bl sub_08006A98
	movs r1, #3
	bl sub_080078D4
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0x50
	movs r3, #0x1b
	bl sub_08006A98
	movs r1, #1
	bl sub_080078D4
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0
	movs r3, #0x12
	bl sub_08006A98
	movs r1, #2
	bl sub_080078D4
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0x50
	movs r3, #0x1a
	bl sub_08006A98
	movs r1, #4
	bl sub_080078D4
	ldr r0, _08007A58 @ =0x08BFFB20
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08007A58: .4byte 0x08BFFB20

	thumb_func_start sub_08007A5C
sub_08007A5C: @ 0x08007A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sb, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, _08007A80 @ =0x030040E0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq _08007A84
	movs r0, #0
	b _08007B6A
	.align 2, 0
_08007A80: .4byte 0x030040E0
_08007A84:
	ldr r0, _08007AC4 @ =0x08BFF9A8
	movs r1, #5
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	mov r0, sb
	bl sub_080069B0
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _08007AD4
	str r6, [sp]
	ldr r0, _08007AC8 @ =0x0202A580
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r0, [r0, #4]
	lsls r1, r0, #5
	ldr r0, _08007ACC @ =0x02022A60
	adds r1, r1, r0
	ldr r2, _08007AD0 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl sub_08001034
	b _08007AEA
	.align 2, 0
_08007AC4: .4byte 0x08BFF9A8
_08007AC8: .4byte 0x0202A580
_08007ACC: .4byte 0x02022A60
_08007AD0: .4byte 0x01000008
_08007AD4:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, _08007B30 @ =0x0202A580
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
_08007AEA:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, sb
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_08006C48
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq _08007B42
	cmp r1, #0x80
	bgt _08007B34
	cmp r1, #0x40
	beq _08007B3E
	b _08007B4E
	.align 2, 0
_08007B30: .4byte 0x0202A580
_08007B34:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08007B48
	b _08007B4E
_08007B3E:
	movs r3, #0
	b _08007B52
_08007B42:
	movs r3, #0x80
	lsls r3, r3, #3
	b _08007B52
_08007B48:
	movs r3, #0xc0
	lsls r3, r3, #4
	b _08007B52
_08007B4E:
	movs r3, #0x80
	lsls r3, r3, #4
_08007B52:
	ldr r2, _08007B7C @ =0x0202A580
	adds r2, r4, r2
	ldr r1, [r2]
	lsrs r1, r1, #5
	movs r0, #0xf
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
_08007B6A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007B7C: .4byte 0x0202A580

	thumb_func_start sub_08007B80
sub_08007B80: @ 0x08007B80
	ldr r3, _08007B90 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	strh r1, [r3, #0x34]
	ldr r0, [r0]
	strh r2, [r0, #0x36]
	bx lr
	.align 2, 0
_08007B90: .4byte 0x030040E0

	thumb_func_start sub_08007B94
sub_08007B94: @ 0x08007B94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _08007BA4
	bl sub_08091618
_08007BA4:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007BB0
	bl sub_08091618
_08007BB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007BB8
sub_08007BB8: @ 0x08007BB8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl sub_080069B0
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, _08007C08 @ =0x0202A580
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, _08007C0C @ =0x06010000
	adds r1, r1, r2
	bl sub_08013688
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_0800105C
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007C08: .4byte 0x0202A580
_08007C0C: .4byte 0x06010000

	thumb_func_start sub_08007C10
sub_08007C10: @ 0x08007C10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _08007C34
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl sub_080045FC
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl sub_08091628
_08007C34:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007C40
	bl sub_08091628
_08007C40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007C48
sub_08007C48: @ 0x08007C48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08007C60 @ =0x08BFFB30
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007C60: .4byte 0x08BFFB30

	thumb_func_start sub_08007C64
sub_08007C64: @ 0x08007C64
	push {r4, lr}
	movs r2, #0
	ldr r4, _08007C84 @ =0x08BFFB68
	movs r3, #0
_08007C6C:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08007C6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007C84: .4byte 0x08BFFB68

	thumb_func_start sub_08007C88
sub_08007C88: @ 0x08007C88
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, _08007D0C @ =0x030000E8
	movs r0, #0
	bl sub_08001370
	adds r1, r0, #0
	ldr r0, _08007D10 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl sub_080052A4
	bl sub_08007DF4
	ldr r0, _08007D14 @ =0x08BFFB68
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08007CDE
	ldr r4, _08007D18 @ =0x030000C8
	adds r5, r6, #0
_08007CC6:
	adds r0, r4, #0
	movs r1, #0x1e
	bl sub_08005344
	adds r0, r4, #0
	movs r1, #1
	bl sub_08005450
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08007CC6
_08007CDE:
	cmp r7, #0
	beq _08007D00
	ldr r4, _08007D1C @ =0x084027B0
	movs r0, #1
	bl sub_08001370
	adds r1, r0, #0
	ldr r0, _08007D20 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08013688
	ldr r0, _08007D24 @ =0x08402A4C
	movs r1, #0x60
	movs r2, #0x20
	bl sub_0800105C
_08007D00:
	bl sub_08007C64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007D0C: .4byte 0x030000E8
_08007D10: .4byte 0x000003FF
_08007D14: .4byte 0x08BFFB68
_08007D18: .4byte 0x030000C8
_08007D1C: .4byte 0x084027B0
_08007D20: .4byte 0x06000200
_08007D24: .4byte 0x08402A4C

	thumb_func_start sub_08007D28
sub_08007D28: @ 0x08007D28
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _08007DB8 @ =0x030000E8
	ldr r1, _08007DBC @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08007DC0 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_08005ACC
	adds r0, r5, #0
	bl sub_08005320
	movs r0, #1
	bl sub_080052E0
	ldr r0, _08007DC4 @ =0x081901E8
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl sub_0800105C
	ldr r2, _08007DC8 @ =0x02022860
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007DCC @ =0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007DD0 @ =0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _08007DD4 @ =0x00007FFF
	strh r0, [r4]
	ldr r0, _08007DD8 @ =0x08BFFB68
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08007DB0
_08007D88:
	lsls r4, r5, #3
	ldr r0, _08007DDC @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_08005B08
	adds r0, r4, #0
	bl sub_08005B2C
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005450
	adds r0, r4, #0
	movs r1, #4
	bl sub_08005444
	adds r5, #1
	cmp r5, r6
	blt _08007D88
_08007DB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007DB8: .4byte 0x030000E8
_08007DBC: .4byte 0x000003FF
_08007DC0: .4byte 0x06010000
_08007DC4: .4byte 0x081901E8
_08007DC8: .4byte 0x02022860
_08007DCC: .4byte 0x00007247
_08007DD0: .4byte 0x000031AE
_08007DD4: .4byte 0x00007FFF
_08007DD8: .4byte 0x08BFFB68
_08007DDC: .4byte 0x030000C8

	thumb_func_start sub_08007DE0
sub_08007DE0: @ 0x08007DE0
	push {lr}
	ldr r0, _08007DF0 @ =0x081901C8
	movs r1, #0x40
	movs r2, #0x20
	bl sub_0800105C
	pop {r0}
	bx r0
	.align 2, 0
_08007DF0: .4byte 0x081901C8

	thumb_func_start sub_08007DF4
sub_08007DF4: @ 0x08007DF4
	push {lr}
	ldr r0, _08007E04 @ =0x030000E8
	bl sub_08005320
	bl sub_08005944
	pop {r0}
	bx r0
	.align 2, 0
_08007E04: .4byte 0x030000E8

	thumb_func_start sub_08007E08
sub_08007E08: @ 0x08007E08
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, _08007E90 @ =0x08BFFB68
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl sub_0802E380
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl sub_08008CB8
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl sub_08009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne _08007E98
	ldr r0, _08007E94 @ =0x08BFFB84
	movs r1, #3
	bl Proc_Start
	b _08007EA0
	.align 2, 0
_08007E90: .4byte 0x08BFFB68
_08007E94: .4byte 0x08BFFB84
_08007E98:
	ldr r0, _08007EA8 @ =0x08BFFB84
	adds r1, r7, #0
	bl sub_080043D4
_08007EA0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007EA8: .4byte 0x08BFFB84

	thumb_func_start sub_08007EAC
sub_08007EAC: @ 0x08007EAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl sub_08013318
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_08007E08
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08007ECC
sub_08007ECC: @ 0x08007ECC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl sub_08013318
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_08007E08
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08007EEC
sub_08007EEC: @ 0x08007EEC
	push {lr}
	movs r3, #0
	bl sub_08007E08
	pop {r1}
	bx r1

	thumb_func_start sub_08007EF8
sub_08007EF8: @ 0x08007EF8
	push {lr}
	ldr r0, _08007F04 @ =0x08BFFB84
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08007F04: .4byte 0x08BFFB84

	thumb_func_start sub_08007F08
sub_08007F08: @ 0x08007F08
	ldr r1, _08007F10 @ =0x08BFFB68
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08007F10: .4byte 0x08BFFB68

	thumb_func_start sub_08007F14
sub_08007F14: @ 0x08007F14
	ldr r0, _08007F20 @ =0x08BFFB68
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08007F20: .4byte 0x08BFFB68

	thumb_func_start sub_08007F24
sub_08007F24: @ 0x08007F24
	ldr r1, _08007F34 @ =0x08BFFB68
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_08007F34: .4byte 0x08BFFB68

	thumb_func_start sub_08007F38
sub_08007F38: @ 0x08007F38
	ldr r1, _08007F40 @ =0x08BFFB68
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_08007F40: .4byte 0x08BFFB68

	thumb_func_start sub_08007F44
sub_08007F44: @ 0x08007F44
	ldr r1, _08007F54 @ =0x08BFFB68
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	bics r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08007F54: .4byte 0x08BFFB68

	thumb_func_start sub_08007F58
sub_08007F58: @ 0x08007F58
	ldr r1, _08007F64 @ =0x08BFFB68
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r1, [r1]
	ands r0, r1
	bx lr
	.align 2, 0
_08007F64: .4byte 0x08BFFB68

	thumb_func_start sub_08007F68
sub_08007F68: @ 0x08007F68
	ldr r2, _08007F80 @ =0x08BFFB68
	ldr r1, [r2]
	strb r0, [r1, #0x13]
	ldr r2, [r2]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _08007F7C
	movs r0, #0
	strb r0, [r2, #0x13]
_08007F7C:
	bx lr
	.align 2, 0
_08007F80: .4byte 0x08BFFB68

	thumb_func_start sub_08007F84
sub_08007F84: @ 0x08007F84
	push {r4, r5, r6, lr}
	ldr r2, _08007FB8 @ =0x08BFFB68
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08007FB0
	adds r6, r2, #0
	ldr r5, _08007FBC @ =0x030000C8
_08007F9A:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl sub_08005450
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08007F9A
_08007FB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007FB8: .4byte 0x08BFFB68
_08007FBC: .4byte 0x030000C8

	thumb_func_start sub_08007FC0
sub_08007FC0: @ 0x08007FC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08008020 @ =0x08BFFC7C
	bl sub_08004584
	cmp r0, #0
	bne _08008062
	ldr r0, _08008024 @ =0x08BFFCD4
	bl sub_08004584
	cmp r0, #0
	bne _08008062
	movs r0, #4
	bl sub_08007F58
	cmp r0, #0
	bne _08008038
	ldr r0, _08008028 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08008038
	bl sub_0800EF98
	ldr r0, _0800802C @ =0x08BFFB68
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_08009E24
	adds r0, r4, #0
	bl sub_08004460
	bl sub_08007EF8
	ldr r0, _08008030 @ =0x02022C60
	movs r1, #0
	bl sub_080017E8
	ldr r0, _08008034 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r0, #3
	bl sub_08000FD4
	b _08008062
	.align 2, 0
_08008020: .4byte 0x08BFFC7C
_08008024: .4byte 0x08BFFCD4
_08008028: .4byte gpKeySt
_0800802C: .4byte 0x08BFFB68
_08008030: .4byte 0x02022C60
_08008034: .4byte 0x02023460
_08008038:
	ldr r0, _08008068 @ =0x08BFFBFC
	bl sub_08004584
	cmp r0, #0
	bne _08008062
	movs r0, #8
	bl sub_08007F58
	cmp r0, #0
	bne _08008062
	ldr r0, _0800806C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08008062
	ldr r0, _08008070 @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
_08008062:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008068: .4byte 0x08BFFBFC
_0800806C: .4byte gpKeySt
_08008070: .4byte 0x08BFFB68

	thumb_func_start sub_08008074
sub_08008074: @ 0x08008074
	push {lr}
	movs r0, #0x20
	bl sub_08007F58
	cmp r0, #0
	bne _08008098
	bl sub_08015A0C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
_08008098:
	ldr r0, _080080A4 @ =0x08BFFB6C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080080A4: .4byte 0x08BFFB6C

	thumb_func_start sub_080080A8
sub_080080A8: @ 0x080080A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_08008EB0
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq _080080BE
	b _0800820E
_080080BE:
	ldr r2, _08008108 @ =0x08BFFB68
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080080E2
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080080E2
	b _0800820E
_080080E2:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
_080080E6:
	ldr r7, _08008108 @ =0x08BFFB68
	ldr r0, _0800810C @ =0x0202BC35
	mov r8, r0
_080080EC:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl sub_08009E24
	adds r0, r6, #0
	bl sub_0800844C
	cmp r0, #1
	beq _08008144
	cmp r0, #1
	bgt _08008110
	cmp r0, #0
	beq _0800811A
	b _08008144
	.align 2, 0
_08008108: .4byte 0x08BFFB68
_0800810C: .4byte 0x0202BC35
_08008110:
	cmp r0, #2
	beq _08008122
	cmp r0, #3
	beq _08008136
	b _08008144
_0800811A:
	adds r0, r6, #0
	bl sub_0800457C
	b _0800820E
_08008122:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080080E6
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080081F8
	b _0800820E
_08008136:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b _0800820E
_08008144:
	movs r0, #0x20
	bl sub_08007F58
	cmp r0, #0
	bne _08008156
	adds r0, r6, #0
	bl sub_0800821C
	b _0800815C
_08008156:
	adds r0, r6, #0
	bl sub_08008308
_0800815C:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800820E
	ldr r5, _080081AC @ =0x08BFFB68
	ldr r4, [r5]
	ldrb r1, [r4, #0xb]
	ldrb r2, [r4, #9]
	adds r0, r1, r2
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080081B0 @ =0x030000C8
	adds r0, r0, r1
	ldr r1, [r4]
	bl sub_080056D8
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl sub_08007F58
	cmp r0, #0
	bne _080081F8
	movs r0, #0x80
	bl sub_08007F58
	cmp r0, #0
	beq _080081B8
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _080081F8
	ldr r0, _080081B4 @ =0x0000039A
	bl m4aSongNumStart
	b _080081F8
	.align 2, 0
_080081AC: .4byte 0x08BFFB68
_080081B0: .4byte 0x030000C8
_080081B4: .4byte 0x0000039A
_080081B8:
	bl sub_0802E380
	adds r4, r0, #0
	cmp r4, #1
	bne _080081CC
	bl sub_08000EEC
	ands r0, r4
	cmp r0, #0
	beq _080081F8
_080081CC:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080081E0
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _080081F8
_080081E0:
	adds r0, r1, #0
	adds r0, #0x82
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1e
	cmp r0, #0
	blt _080081F8
	ldr r0, _08008218 @ =0x0000038E
	bl m4aSongNumStart
_080081F8:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008204
	b _080080EC
_08008204:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _0800820E
	b _080080EC
_0800820E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008218: .4byte 0x0000038E

	thumb_func_start sub_0800821C
sub_0800821C: @ 0x0800821C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08009D70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08008288
	ldr r4, _08008284 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq _08008288
	movs r0, #2
	bl sub_08007F58
	cmp r0, #0
	bne _08008288
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08008248
	ldr r0, [r1]
_08008248:
	movs r1, #0
	bl sub_08009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl sub_080095E4
	ldr r4, _08008284 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl sub_08009D0C
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl sub_08007F58
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008DFC
	movs r0, #1
	b _080082F8
	.align 2, 0
_08008284: .4byte 0x08BFFB68
_08008288:
	ldr r6, _080082A4 @ =0x08BFFB68
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	blo _080082AC
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, _080082A8 @ =0x08BFFCD4
	adds r1, r7, #0
	bl sub_080043D4
	movs r0, #1
	b _080082F8
	.align 2, 0
_080082A4: .4byte 0x08BFFB68
_080082A8: .4byte 0x08BFFCD4
_080082AC:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne _080082E8
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008300 @ =0x030000C8
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r1, r4
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r5, r4
	lsls r4, r4, #1
	ldr r1, _08008304 @ =0x02022C60
	adds r4, r4, r1
	adds r1, r4, #0
	bl sub_08005460
	movs r0, #1
	bl sub_0800A4EC
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_080082E8:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _080082F6
	ldrb r0, [r1, #0x11]
	bl sub_08009E18
_080082F6:
	movs r0, #0
_080082F8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008300: .4byte 0x030000C8
_08008304: .4byte 0x02022C60

	thumb_func_start sub_08008308
sub_08008308: @ 0x08008308
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008328 @ =0x08BFFB68
	ldr r2, [r0]
	ldrb r0, [r2, #9]
	ldrb r3, [r2, #0xa]
	cmp r0, r3
	blo _08008330
	movs r0, #0
	strb r0, [r2, #0x12]
	ldr r0, _0800832C @ =0x08BFFCFC
	bl sub_080043D4
	movs r0, #1
	b _0800833C
	.align 2, 0
_08008328: .4byte 0x08BFFB68
_0800832C: .4byte 0x08BFFCFC
_08008330:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne _0800833A
	movs r0, #1
	strb r0, [r2, #0x15]
_0800833A:
	movs r0, #0
_0800833C:
	pop {r1}
	bx r1

	thumb_func_start sub_08008340
sub_08008340: @ 0x08008340
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008350 @ =0x08BFFBB4
	bl sub_080043D4
	pop {r0}
	bx r0
	.align 2, 0
_08008350: .4byte 0x08BFFBB4

	thumb_func_start sub_08008354
sub_08008354: @ 0x08008354
	push {lr}
	ldr r0, _08008368 @ =0x08BFFBB4
	bl sub_08004584
	cmp r0, #0
	beq _08008362
	movs r0, #1
_08008362:
	pop {r1}
	bx r1
	.align 2, 0
_08008368: .4byte 0x08BFFBB4

	thumb_func_start sub_0800836C
sub_0800836C: @ 0x0800836C
	push {lr}
	ldr r0, _08008378 @ =0x08BFFBB4
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08008378: .4byte 0x08BFFBB4

	thumb_func_start sub_0800837C
sub_0800837C: @ 0x0800837C
	push {r4, r5, lr}
	ldr r0, _080083BC @ =0x08BFFB68
	ldr r2, [r0]
	ldrb r1, [r2, #8]
	cmp r1, #1
	bne _080083C4
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _080083B4
	adds r5, r0, #0
_08008392:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080083C0 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #4
	bl sub_08005450
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08008392
_080083B4:
	ldr r0, _080083BC @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #4
	b _080083F6
	.align 2, 0
_080083BC: .4byte 0x08BFFB68
_080083C0: .4byte 0x030000C8
_080083C4:
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _080083F0
	adds r5, r0, #0
_080083CE:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008400 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #1
	bl sub_08005450
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _080083CE
_080083F0:
	ldr r0, _08008404 @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #1
_080083F6:
	strb r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008400: .4byte 0x030000C8
_08008404: .4byte 0x08BFFB68

	thumb_func_start sub_08008408
sub_08008408: @ 0x08008408
	push {lr}
	cmp r0, #0
	beq _0800842C
	ldr r0, _08008424 @ =0x081902C8
	movs r1, #0x60
	movs r2, #0x20
	bl sub_0800105C
	ldr r0, _08008428 @ =0x081902A8
	movs r1, #0x40
	movs r2, #0x20
	bl sub_0800105C
	b _08008440
	.align 2, 0
_08008424: .4byte 0x081902C8
_08008428: .4byte 0x081902A8
_0800842C:
	ldr r0, _08008444 @ =0x08402A4C
	movs r1, #0x60
	movs r2, #0x20
	bl sub_0800105C
	ldr r0, _08008448 @ =0x081901C8
	movs r1, #0x40
	movs r2, #0x20
	bl sub_0800105C
_08008440:
	pop {r0}
	bx r0
	.align 2, 0
_08008444: .4byte 0x08402A4C
_08008448: .4byte 0x081901C8

	thumb_func_start sub_0800844C
sub_0800844C: @ 0x0800844C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
_08008456:
	ldr r7, _0800848C @ =0x08BFFB68
	adds r5, r7, #0
_0800845A:
	ldr r1, [r5]
	ldr r4, [r1]
	ldrb r0, [r4]
	cmp r0, #0x14
	bgt _08008490
	cmp r0, #0x12
	blt _08008490
	adds r4, #1
	str r4, [r1]
	bl sub_08009D70
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r5]
	adds r0, #2
	strb r0, [r1, #0xe]
	b _0800845A
	.align 2, 0
_0800848C: .4byte 0x08BFFB68
_08008490:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x81
	bls _0800849E
	bl _08008CA8
_0800849E:
	lsls r0, r0, #2
	ldr r1, _080084A8 @ =_080084AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080084A8: .4byte _080084AC
_080084AC: @ jump table
	.4byte _08008714 @ case 0
	.4byte _0800872A @ case 1
	.4byte _08008748 @ case 2
	.4byte _08008790 @ case 3
	.4byte _080087CC @ case 4
	.4byte _080087CC @ case 5
	.4byte _080087CC @ case 6
	.4byte _080087CC @ case 7
	.4byte _080088D0 @ case 8
	.4byte _080088D0 @ case 9
	.4byte _080088D0 @ case 10
	.4byte _080088D0 @ case 11
	.4byte _080088D0 @ case 12
	.4byte _080088D0 @ case 13
	.4byte _080088D0 @ case 14
	.4byte _080088D0 @ case 15
	.4byte _08008828 @ case 16
	.4byte _08008868 @ case 17
	.4byte _08008CA8 @ case 18
	.4byte _08008CA8 @ case 19
	.4byte _08008CA8 @ case 20
	.4byte _08008800 @ case 21
	.4byte _08008810 @ case 22
	.4byte _0800881C @ case 23
	.4byte _080088E2 @ case 24
	.4byte _0800892C @ case 25
	.4byte _08008978 @ case 26
	.4byte _080089C4 @ case 27
	.4byte _080088AC @ case 28
	.4byte _08008CA8 @ case 29
	.4byte _08008CA8 @ case 30
	.4byte _08008CA8 @ case 31
	.4byte _08008CA8 @ case 32
	.4byte _08008CA8 @ case 33
	.4byte _08008CA8 @ case 34
	.4byte _08008CA8 @ case 35
	.4byte _08008CA8 @ case 36
	.4byte _08008CA8 @ case 37
	.4byte _08008CA8 @ case 38
	.4byte _08008CA8 @ case 39
	.4byte _08008CA8 @ case 40
	.4byte _08008CA8 @ case 41
	.4byte _08008CA8 @ case 42
	.4byte _08008CA8 @ case 43
	.4byte _08008CA8 @ case 44
	.4byte _08008CA8 @ case 45
	.4byte _08008CA8 @ case 46
	.4byte _08008CA8 @ case 47
	.4byte _08008CA8 @ case 48
	.4byte _08008CA8 @ case 49
	.4byte _08008CA8 @ case 50
	.4byte _08008CA8 @ case 51
	.4byte _08008CA8 @ case 52
	.4byte _08008CA8 @ case 53
	.4byte _08008CA8 @ case 54
	.4byte _08008CA8 @ case 55
	.4byte _08008CA8 @ case 56
	.4byte _08008CA8 @ case 57
	.4byte _08008CA8 @ case 58
	.4byte _08008CA8 @ case 59
	.4byte _08008CA8 @ case 60
	.4byte _08008CA8 @ case 61
	.4byte _08008CA8 @ case 62
	.4byte _08008CA8 @ case 63
	.4byte _08008CA8 @ case 64
	.4byte _08008CA8 @ case 65
	.4byte _08008CA8 @ case 66
	.4byte _08008CA8 @ case 67
	.4byte _08008CA8 @ case 68
	.4byte _08008CA8 @ case 69
	.4byte _08008CA8 @ case 70
	.4byte _08008CA8 @ case 71
	.4byte _08008CA8 @ case 72
	.4byte _08008CA8 @ case 73
	.4byte _08008CA8 @ case 74
	.4byte _08008CA8 @ case 75
	.4byte _08008CA8 @ case 76
	.4byte _08008CA8 @ case 77
	.4byte _08008CA8 @ case 78
	.4byte _08008CA8 @ case 79
	.4byte _08008CA8 @ case 80
	.4byte _08008CA8 @ case 81
	.4byte _08008CA8 @ case 82
	.4byte _08008CA8 @ case 83
	.4byte _08008CA8 @ case 84
	.4byte _08008CA8 @ case 85
	.4byte _08008CA8 @ case 86
	.4byte _08008CA8 @ case 87
	.4byte _08008CA8 @ case 88
	.4byte _08008CA8 @ case 89
	.4byte _08008CA8 @ case 90
	.4byte _08008CA8 @ case 91
	.4byte _08008CA8 @ case 92
	.4byte _08008CA8 @ case 93
	.4byte _08008CA8 @ case 94
	.4byte _08008CA8 @ case 95
	.4byte _08008CA8 @ case 96
	.4byte _08008CA8 @ case 97
	.4byte _08008CA8 @ case 98
	.4byte _08008CA8 @ case 99
	.4byte _08008CA8 @ case 100
	.4byte _08008CA8 @ case 101
	.4byte _08008CA8 @ case 102
	.4byte _08008CA8 @ case 103
	.4byte _08008CA8 @ case 104
	.4byte _08008CA8 @ case 105
	.4byte _08008CA8 @ case 106
	.4byte _08008CA8 @ case 107
	.4byte _08008CA8 @ case 108
	.4byte _08008CA8 @ case 109
	.4byte _08008CA8 @ case 110
	.4byte _08008CA8 @ case 111
	.4byte _08008CA8 @ case 112
	.4byte _08008CA8 @ case 113
	.4byte _08008CA8 @ case 114
	.4byte _08008CA8 @ case 115
	.4byte _08008CA8 @ case 116
	.4byte _08008CA8 @ case 117
	.4byte _08008CA8 @ case 118
	.4byte _08008CA8 @ case 119
	.4byte _08008CA8 @ case 120
	.4byte _08008CA8 @ case 121
	.4byte _08008CA8 @ case 122
	.4byte _08008CA8 @ case 123
	.4byte _08008CA8 @ case 124
	.4byte _08008CA8 @ case 125
	.4byte _08008CA8 @ case 126
	.4byte _08008CA8 @ case 127
	.4byte _08008A10 @ case 128
	.4byte _080086B4 @ case 129
_080086B4:
	ldr r1, [r7]
	ldr r0, [r1]
	ldrb r2, [r0, #1]
	cmp r2, #0x40
	beq _080086C0
	b _08008CA8
_080086C0:
	adds r0, #2
	str r0, [r1]
	ldrb r3, [r1, #0xb]
	ldrb r2, [r1, #9]
	adds r0, r3, r2
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0800870C @ =0x030000C8
	adds r0, r0, r1
	movs r1, #6
	bl sub_08005448
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080086E8
	b _080087DC
_080086E8:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080087DC
	ldr r0, _08008710 @ =0x08BFFBDC
	mov r1, r8
	bl sub_080043D4
	adds r4, r0, #0
	movs r0, #4
	bl sub_080095D4
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
_08008706:
	movs r0, #3
	b _08008CAA
	.align 2, 0
_0800870C: .4byte 0x030000C8
_08008710: .4byte 0x08BFFBDC
_08008714:
	ldr r1, [r7]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08008720
_0800871C:
	movs r0, #0
	b _08008CAA
_08008720:
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	str r0, [r1, #4]
	b _08008456
_0800872A:
	ldr r1, [r7]
	ldrb r3, [r1, #0x15]
	cmp r3, #1
	beq _08008738
	ldrb r0, [r1, #9]
	cmp r0, #1
	bne _0800873E
_08008738:
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
_0800873E:
	ldr r1, [r7]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldr r1, [r7]
	b _080087D6
_08008748:
	movs r0, #0x80
	bl sub_08007F58
	cmp r0, #0
	beq _08008768
	bl sub_08009598
	ldr r0, _08008764 @ =0x08BFFB68
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08008784
	.align 2, 0
_08008764: .4byte 0x08BFFB68
_08008768:
	movs r0, #1
	bl sub_08007F58
	cmp r0, #0
	bne _08008780
	ldr r0, _0800877C @ =0x08BFFC7C
	mov r1, r8
	bl sub_080043D4
	b _08008784
	.align 2, 0
_0800877C: .4byte 0x08BFFC7C
_08008780:
	bl sub_0800968C
_08008784:
	ldr r0, _0800878C @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_0800878C: .4byte 0x08BFFB68
_08008790:
	ldr r1, [r7]
	ldrb r2, [r1, #0xb]
	ldrb r3, [r1, #9]
	adds r0, r2, r3
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080087C8 @ =0x030000C8
	adds r0, r0, r1
	bl sub_08005440
	ldr r3, [r7]
	ldrb r2, [r3, #0xc]
	lsls r1, r2, #3
	adds r1, r1, r0
	adds r1, #4
	ldrb r0, [r3, #0xd]
	lsls r2, r0, #3
	ldrb r3, [r3, #9]
	lsls r0, r3, #4
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl sub_0800914C
	b _08008BBA
	.align 2, 0
_080087C8: .4byte 0x030000C8
_080087CC:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080087E0
_080087D6:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_080087DC:
	movs r0, #2
	b _08008CAA
_080087E0:
	ldr r0, _080087FC @ =0x08BFFBDC
	mov r1, r8
	bl sub_080043D4
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	bl sub_080095D4
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	b _08008BBA
	.align 2, 0
_080087FC: .4byte 0x08BFFBDC
_08008800:
	bl sub_080095E4
	ldr r0, _0800880C @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_0800880C: .4byte 0x08BFFB68
_08008810:
	ldr r1, [r7]
	movs r0, #1
	ldrb r2, [r1, #0x16]
	subs r0, r0, r2
	strb r0, [r1, #0x16]
	b _08008BBA
_0800881C:
	ldr r1, [r7]
	movs r0, #1
	ldrb r3, [r1, #0x17]
	subs r0, r0, r3
	strb r0, [r1, #0x17]
	b _08008BBA
_08008828:
	ldr r4, _08008840 @ =0x08BFFB68
_0800882A:
	ldr r2, [r4]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #8
	bge _08008836
	b _08008706
_08008836:
	cmp r0, #0xf
	ble _08008844
	cmp r0, #0x10
	beq _08008854
	b _08008706
	.align 2, 0
_08008840: .4byte 0x08BFFB68
_08008844:
	subs r0, #8
	bl sub_08008CB8
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _0800882A
_08008854:
	adds r0, r1, #1
	str r0, [r2]
	mov r0, r8
	bl sub_08008CC4
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	b _0800882A
_08008868:
	bl sub_08009D70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08008876
	bl sub_080095E4
_08008876:
	ldr r4, _080088A8 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080073F4
	ldr r2, [r4]
	ldrb r3, [r2, #0x11]
	lsls r1, r3, #2
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	mov r0, r8
	movs r1, #0x10
	bl sub_080149B4
	b _08008706
	.align 2, 0
_080088A8: .4byte 0x08BFFB68
_080088AC:
	movs r0, #0x10
	bl sub_08007F58
	cmp r0, #0
	beq _080088BE
	movs r0, #0x10
	bl sub_08007F44
	b _080088C4
_080088BE:
	movs r0, #0x10
	bl sub_08007F24
_080088C4:
	ldr r0, _080088CC @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_080088CC: .4byte 0x08BFFB68
_080088D0:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl sub_08009E24
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #8
	b _08008BB6
_080088E2:
	ldr r6, _08008920 @ =0x08BFFC9C
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008924 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008928 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_08008920: .4byte 0x08BFFC9C
_08008924: .4byte 0x030000C8
_08008928: .4byte 0x02022C60
_0800892C:
	ldr r6, _0800896C @ =0x08BFFC9C
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008970 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008974 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_0800896C: .4byte 0x08BFFC9C
_08008970: .4byte 0x030000C8
_08008974: .4byte 0x02022C60
_08008978:
	ldr r6, _080089B8 @ =0x08BFFCAC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _080089BC @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _080089C0 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_080089B8: .4byte 0x08BFFCAC
_080089BC: .4byte 0x030000C8
_080089C0: .4byte 0x02022C60
_080089C4:
	ldr r6, _08008A04 @ =0x08BFFCAC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008A08 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008A0C @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_0800925C
	b _08008BBA
	.align 2, 0
_08008A04: .4byte 0x08BFFCAC
_08008A08: .4byte 0x030000C8
_08008A0C: .4byte 0x02022C60
_08008A10:
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #0x25
	bls _08008A20
	b _0800871C
_08008A20:
	lsls r0, r0, #2
	ldr r1, _08008A2C @ =_08008A30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008A2C: .4byte _08008A30
_08008A30: @ jump table
	.4byte _08008AEC @ case 0
	.4byte _08008AEC @ case 1
	.4byte _08008AEC @ case 2
	.4byte _08008AEC @ case 3
	.4byte _08008B3E @ case 4
	.4byte _08008B50 @ case 5
	.4byte _08008B88 @ case 6
	.4byte _08008BBA @ case 7
	.4byte _08008BBA @ case 8
	.4byte _0800871C @ case 9
	.4byte _08008BA0 @ case 10
	.4byte _08008BA0 @ case 11
	.4byte _08008BA0 @ case 12
	.4byte _08008BA0 @ case 13
	.4byte _08008BA0 @ case 14
	.4byte _08008BA0 @ case 15
	.4byte _08008BA0 @ case 16
	.4byte _08008BA0 @ case 17
	.4byte _0800871C @ case 18
	.4byte _0800871C @ case 19
	.4byte _0800871C @ case 20
	.4byte _0800871C @ case 21
	.4byte _08008BC4 @ case 22
	.4byte _08008BDA @ case 23
	.4byte _08008BF0 @ case 24
	.4byte _08008C06 @ case 25
	.4byte _08008C1C @ case 26
	.4byte _08008C32 @ case 27
	.4byte _08008C4C @ case 28
	.4byte _08008C62 @ case 29
	.4byte _08008C78 @ case 30
	.4byte _08008C8E @ case 31
	.4byte _08008B70 @ case 32
	.4byte _08008AD8 @ case 33
	.4byte _0800871C @ case 34
	.4byte _0800871C @ case 35
	.4byte _08008AC8 @ case 36
	.4byte _08008B2C @ case 37
_08008AC8:
	ldr r0, [r7]
	ldr r1, [r0, #0x38]
	cmp r1, #0
	beq _08008BBA
	mov r0, r8
	bl _call_via_r1
	b _08008BBA
_08008AD8:
	bl sub_0800837C
	ldr r0, _08008AE8 @ =0x08BFFB68
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008AE8: .4byte 0x08BFFB68
_08008AEC:
	ldr r3, _08008B24 @ =0x08BFFB68
	ldr r1, [r3]
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r3]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08008B1E
	adds r6, r3, #0
	ldr r5, _08008B28 @ =0x030000C8
_08008B08:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl sub_08005450
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08008B08
_08008B1E:
	ldr r0, _08008B24 @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_08008B24: .4byte 0x08BFFB68
_08008B28: .4byte 0x030000C8
_08008B2C:
	ldr r2, [r7]
	adds r2, #0x83
	movs r1, #1
	ldrb r3, [r2]
	ands r1, r3
	movs r0, #3
	subs r0, r0, r1
	strb r0, [r2]
	b _08008BBA
_08008B3E:
	mov r0, r8
	bl sub_08008340
	ldr r0, _08008B4C @ =0x08BFFB68
	ldr r1, [r0]
	b _08008BBC
	.align 2, 0
_08008B4C: .4byte 0x08BFFB68
_08008B50:
	ldr r4, _08008B6C @ =0x08BFFB68
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	adds r1, #0x40
	bl sub_080149EC
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008B6C: .4byte 0x08BFFB68
_08008B70:
	ldr r4, _08008B84 @ =0x08BFFB68
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	bl sub_0802EBB0
	ldr r1, [r4]
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008B84: .4byte 0x08BFFB68
_08008B88:
	ldr r0, _08008B9C @ =0x08BFFB68
	ldr r1, [r0]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x60
	str r0, [r1]
	b _08008456
	.align 2, 0
_08008B9C: .4byte 0x08BFFB68
_08008BA0:
	ldr r1, [r7]
	ldrb r0, [r1, #0x11]
	ldr r1, [r1]
	ldrb r1, [r1]
	subs r1, #0xa
	bl sub_08008E58
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0xa
_08008BB6:
	bl sub_08008CB8
_08008BBA:
	ldr r1, [r7]
_08008BBC:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08008706
_08008BC4:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08008C46
_08008BDA:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #1
	b _08008C46
_08008BF0:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08008C46
_08008C06:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08008C46
_08008C1C:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
	b _08008C46
_08008C32:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #5
_08008C46:
	bl sub_080078D4
	b _08008706
_08008C4C:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08008CA2
_08008C62:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08008CA2
_08008C78:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08008CA2
_08008C8E:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
_08008CA2:
	bl sub_0800796C
	b _08008706
_08008CA8:
	movs r0, #1
_08008CAA:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08008CB8
sub_08008CB8: @ 0x08008CB8
	ldr r1, _08008CC0 @ =0x08BFFB68
	ldr r1, [r1]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08008CC0: .4byte 0x08BFFB68

	thumb_func_start sub_08008CC4
sub_08008CC4: @ 0x08008CC4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08008CEC @ =0x08BFFB68
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	bne _08008CDA
	movs r0, #1
	bl sub_08008CB8
_08008CDA:
	bl sub_0804B9C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08008CF0
	bl sub_0800EC74
	b _08008CF2
	.align 2, 0
_08008CEC: .4byte 0x08BFFB68
_08008CF0:
	movs r6, #2
_08008CF2:
	ldr r4, _08008D24 @ =0x08BFFB68
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	bl sub_08009D94
	cmp r0, #0xe
	bgt _08008D04
	movs r0, #1
	orrs r6, r0
_08008D04:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r4, r1, #8
	ldrb r0, [r0]
	orrs r4, r0
	ldr r0, _08008D28 @ =0x0000FFFF
	cmp r4, r0
	bne _08008D30
	ldr r0, _08008D2C @ =0x030045B0
	ldr r0, [r0]
	bl sub_08018FC8
	adds r4, r0, #0
	b _08008D34
	.align 2, 0
_08008D24: .4byte 0x08BFFB68
_08008D28: .4byte 0x0000FFFF
_08008D2C: .4byte 0x030045B0
_08008D30:
	ldr r2, _08008D50 @ =0xFFFFFF00
	adds r4, r4, r2
_08008D34:
	ldr r5, _08008D54 @ =0x08BFFB68
	ldr r0, [r5]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008D58
	adds r1, r4, #0
	bl sub_08007C48
	b _08008DA0
	.align 2, 0
_08008D50: .4byte 0xFFFFFF00
_08008D54: .4byte 0x08BFFB68
_08008D58:
	adds r0, r2, #0
	bl sub_08009D94
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r0, r4, #0
	movs r2, #0x50
	adds r3, r6, #0
	bl sub_08006A98
	ldr r3, [r5]
	ldrb r2, [r3, #0x11]
	lsls r1, r2, #2
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r2, r1
	str r0, [r1]
	ldrb r3, [r3, #0x11]
	lsls r0, r3, #2
	adds r2, r2, r0
	ldr r0, [r2]
	bl sub_080073AC
	ldr r0, [r5]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl sub_08007F58
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008DFC
	adds r0, r7, #0
	movs r1, #8
	bl sub_080149B4
_08008DA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08008DA8
sub_08008DA8: @ 0x08008DA8
	push {r4, lr}
	ldr r4, [sp, #8]
	bl sub_08006A98
	ldr r1, _08008DC4 @ =0x08BFFB68
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x18
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008DC4: .4byte 0x08BFFB68

	thumb_func_start sub_08008DC8
sub_08008DC8: @ 0x08008DC8
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08008DE4 @ =0x030040E0
_08008DD0:
	ldr r0, [r2]
	cmp r0, #0
	beq _08008DE8
	movs r4, #0x34
	ldrsh r0, [r0, r4]
	cmp r0, r3
	bne _08008DE8
	adds r0, r1, #0
	b _08008DF4
	.align 2, 0
_08008DE4: .4byte 0x030040E0
_08008DE8:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08008DD0
	movs r0, #1
	rsbs r0, r0, #0
_08008DF4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08008DFC
sub_08008DFC: @ 0x08008DFC
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r1, #0
	beq _08008E0A
	movs r6, #6
	movs r5, #5
	b _08008E0E
_08008E0A:
	movs r6, #5
	movs r5, #6
_08008E0E:
	cmp r3, #0
	blt _08008E1A
	cmp r3, #2
	ble _08008E1A
	cmp r3, #5
	ble _08008E20
_08008E1A:
	movs r1, #0
	movs r4, #2
	b _08008E24
_08008E20:
	movs r1, #3
	movs r4, #5
_08008E24:
	adds r2, r1, #0
	cmp r2, r4
	bgt _08008E52
	ldr r7, _08008E44 @ =0x08BFFB68
_08008E2C:
	ldr r0, [r7]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008E4C
	cmp r2, r3
	bne _08008E48
	adds r0, #0x41
	strb r6, [r0]
	b _08008E4C
	.align 2, 0
_08008E44: .4byte 0x08BFFB68
_08008E48:
	adds r0, #0x41
	strb r5, [r0]
_08008E4C:
	adds r2, #1
	cmp r2, r4
	ble _08008E2C
_08008E52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08008E58
sub_08008E58: @ 0x08008E58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r7, #0
	ldr r0, _08008EAC @ =0x08BFFB68
	mov r8, r0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, #0x18
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _08008E82
	movs r7, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08008ECC
_08008E82:
	adds r2, r7, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008ECC
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r5, #2
	adds r0, #0x18
	adds r2, r0, r2
	ldr r3, [r2]
	adds r0, r0, r6
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008EAC: .4byte 0x08BFFB68

	thumb_func_start sub_08008EB0
sub_08008EB0: @ 0x08008EB0
	push {lr}
	ldr r0, _08008EC0 @ =0x08BFFBBC
	bl sub_08004584
	cmp r0, #0
	bne _08008EC4
	movs r0, #0
	b _08008EC6
	.align 2, 0
_08008EC0: .4byte 0x08BFFBBC
_08008EC4:
	movs r0, #1
_08008EC6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08008ECC
sub_08008ECC: @ 0x08008ECC
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl sub_08009D94
	lsls r0, r0, #3
	bl sub_08008DC8
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08008F14
	ldr r0, _08008F1C @ =0x08BFFBBC
	ldr r1, _08008F20 @ =0x030040E0
	lsls r4, r5, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl Proc_Start
	adds r3, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
_08008F14:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008F1C: .4byte 0x08BFFBBC
_08008F20: .4byte 0x030040E0

	thumb_func_start sub_08008F24
sub_08008F24: @ 0x08008F24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x58]
	adds r4, r6, #0
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08009D94
	adds r5, r6, #0
	adds r5, #0x68
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0
	bge _08008F5E
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08009D94
	lsls r0, r0, #3
	movs r2, #0
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r0, #0x18
	bgt _08008F72
	b _08008F76
_08008F5E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08009D94
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0x18
	ble _08008F76
_08008F72:
	movs r0, #0x20
	b _08008F78
_08008F76:
	movs r0, #0x10
_08008F78:
	str r0, [r6, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08008F80
sub_08008F80: @ 0x08008F80
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	cmp r2, #0x10
	ble _08008FF4
	adds r1, r2, #0
	cmp r2, #0
	bge _08008F94
	adds r1, r2, #7
_08008F94:
	asrs r1, r1, #3
	ldr r0, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, r1
	bne _08008FB2
	ldr r1, _08008FF0 @ =0x030040E0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08008FB2:
	ldr r0, [r4, #0x5c]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	cmp r1, r0
	bne _08008FD2
	ldr r1, _08008FF0 @ =0x030040E0
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
_08008FD2:
	ldr r1, [r4, #0x5c]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08008FDE
	adds r0, #7
_08008FDE:
	asrs r1, r0, #3
	ldr r0, [r4, #0x58]
	cmp r0, r1
	bne _08009016
	ldr r1, _08008FF0 @ =0x030040E0
	movs r2, #0
	ldrsh r0, [r5, r2]
	b _0800900A
	.align 2, 0
_08008FF0: .4byte 0x030040E0
_08008FF4:
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r1, r0
	bne _08009016
	ldr r1, _08009038 @ =0x030040E0
	movs r3, #0
	ldrsh r0, [r5, r3]
_0800900A:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08009016:
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	blt _0800903C
	ldr r1, _08009038 @ =0x030040E0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
	adds r0, r4, #0
	bl sub_0800457C
	b _08009074
	.align 2, 0
_08009038: .4byte 0x030040E0
_0800903C:
	adds r0, r4, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl sub_08009D94
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x58]
	adds r3, r0, #0
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	str r0, [sp]
	movs r0, #4
	bl sub_08013508
	ldr r2, _0800907C @ =0x030040E0
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	strh r0, [r1, #0x34]
_08009074:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800907C: .4byte 0x030040E0

	thumb_func_start sub_08009080
sub_08009080: @ 0x08009080
	push {lr}
	ldr r0, _08009094 @ =0x08BFFB6C
	bl sub_08004748
	ldr r0, _08009098 @ =0x08BFFC7C
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08009094: .4byte 0x08BFFB6C
_08009098: .4byte 0x08BFFC7C

	thumb_func_start sub_0800909C
sub_0800909C: @ 0x0800909C
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _080090B6
	adds r0, r2, #0
	bl sub_0800457C
	b _080090BA
_080090B6:
	subs r0, r3, #1
	strh r0, [r1]
_080090BA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080090C0
sub_080090C0: @ 0x080090C0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_08000EEC
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x80
	bl sub_08007F58
	cmp r0, #0
	bne _08009100
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _080090FC @ =0x08BFFC3C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	bl sub_08006884
	b _08009120
	.align 2, 0
_080090FC: .4byte 0x08BFFC3C
_08009100:
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _0800913C @ =0x08BFFC3C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _08009140 @ =0x0000B2BF
	str r0, [sp]
	movs r0, #0
	bl sub_08006884
_08009120:
	ldr r0, _08009144 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08009134
	adds r0, r5, #0
	bl sub_0800457C
_08009134:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800913C: .4byte 0x08BFFC3C
_08009140: .4byte 0x0000B2BF
_08009144: .4byte gpKeySt

	thumb_func_start nullsub_24
nullsub_24: @ 0x08009148
	bx lr
	.align 2, 0

	thumb_func_start sub_0800914C
sub_0800914C: @ 0x0800914C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08009174 @ =0x08BFFBFC
	adds r1, r3, #0
	bl sub_080043D4
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009174: .4byte 0x08BFFBFC

	thumb_func_start sub_08009178
sub_08009178: @ 0x08009178
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080091A8 @ =0x08BFFBFC
	adds r1, r4, #0
	bl sub_080043D4
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080091A8: .4byte 0x08BFFBFC

	thumb_func_start sub_080091AC
sub_080091AC: @ 0x080091AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080091F4 @ =0x08BFFB68
	ldr r2, [r4]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _080091F8 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl sub_080C0C30
	movs r0, #1
	bl sub_0800A4EC
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _080091FC
	adds r1, r5, #0
	adds r1, #0x66
	movs r0, #0x10
	strh r0, [r1]
	b _08009212
	.align 2, 0
_080091F4: .4byte 0x08BFFB68
_080091F8: .4byte 0x02022C60
_080091FC:
	ldrb r0, [r1, #9]
	adds r0, #1
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	blt _0800920A
	lsls r1, r1, #4
	b _0800920C
_0800920A:
	lsls r1, r0, #4
_0800920C:
	adds r0, r5, #0
	adds r0, #0x66
	strh r1, [r0]
_08009212:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08009218
sub_08009218: @ 0x08009218
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl sub_08001D64
	adds r0, r5, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _08009254
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	bl sub_08009628
	adds r0, r5, #0
	bl sub_0800457C
_08009254:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800925C
sub_0800925C: @ 0x0800925C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	adds r0, r6, #0
	bl sub_08005440
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl sub_08013318
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl sub_080059DC
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl sub_08013318
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl sub_080059DC
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08005460
	movs r0, #1
	bl sub_0800A4EC
	ldr r0, _08009304 @ =0x08BFFCBC
	ldr r1, [sp, #0x20]
	bl sub_080043D4
	adds r1, r0, #0
	mov r3, sb
	strh r3, [r1, #0x2a]
	ldr r0, _08009308 @ =0x02022C60
	subs r5, r5, r0
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #3
	ldr r2, _0800930C @ =0x03002790
	ldrh r3, [r2, #0x1c]
	subs r0, r0, r3
	add r0, r8
	strh r0, [r1, #0x2c]
	cmp r5, #0
	bge _080092D8
	adds r5, #0x1f
_080092D8:
	asrs r0, r5, #5
	lsls r0, r0, #3
	ldrh r2, [r2, #0x1e]
	subs r0, r0, r2
	strh r0, [r1, #0x2e]
	str r7, [r1, #0x34]
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r7
	subs r0, #8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _080092F6
	bl _call_via_r0
_080092F6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009304: .4byte 0x08BFFCBC
_08009308: .4byte 0x02022C60
_0800930C: .4byte 0x03002790

	thumb_func_start sub_08009310
sub_08009310: @ 0x08009310
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800933C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800934C
	ldr r0, _08009340 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009334
	ldr r0, _08009344 @ =0x0000038B
	bl m4aSongNumStart
_08009334:
	ldr r1, _08009348 @ =0x030000E0
	movs r0, #0
	b _0800936E
	.align 2, 0
_0800933C: .4byte gpKeySt
_08009340: .4byte gPlaySt
_08009344: .4byte 0x0000038B
_08009348: .4byte 0x030000E0
_0800934C:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08009384
	ldr r0, _08009378 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009368
	ldr r0, _0800937C @ =0x0000038A
	bl m4aSongNumStart
_08009368:
	ldr r1, _08009380 @ =0x030000E0
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
_0800936E:
	str r0, [r1]
	adds r0, r4, #0
	bl sub_0800457C
	b _08009404
	.align 2, 0
_08009378: .4byte gPlaySt
_0800937C: .4byte 0x0000038A
_08009380: .4byte 0x030000E0
_08009384:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080093B2
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	bne _080093B2
	ldr r0, _0800940C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080093A4
	ldr r0, _08009410 @ =0x00000387
	bl m4aSongNumStart
_080093A4:
	strh r5, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _080093B2
	bl _call_via_r0
_080093B2:
	ldr r0, _08009414 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080093E8
	ldrh r1, [r4, #0x2a]
	cmp r1, #1
	bne _080093E8
	ldr r0, _0800940C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080093D8
	ldr r0, _08009410 @ =0x00000387
	bl m4aSongNumStart
_080093D8:
	movs r0, #2
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _080093E8
	bl _call_via_r0
_080093E8:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl sub_0804A740
_08009404:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800940C: .4byte gPlaySt
_08009410: .4byte 0x00000387
_08009414: .4byte gpKeySt

	thumb_func_start sub_08009418
sub_08009418: @ 0x08009418
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08009450 @ =0x08BFFB68
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _08009454 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl sub_080C0C30
	movs r0, #1
	bl sub_0800A4EC
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009450: .4byte 0x08BFFB68
_08009454: .4byte 0x02022C60

	thumb_func_start sub_08009458
sub_08009458: @ 0x08009458
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl sub_08001D64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _08009538
	ldr r4, _08009540 @ =0x08BFFB68
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r5, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	bge _080094D6
	adds r6, r4, #0
_080094A2:
	ldr r4, [r6]
	ldrb r2, [r4, #0xb]
	adds r0, r2, r5
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08009544 @ =0x030000C8
	adds r0, r0, r1
	lsls r1, r5, #1
	ldrb r2, [r4, #0xd]
	adds r1, r2, r1
	lsls r1, r1, #5
	ldrb r4, [r4, #0xc]
	adds r1, r4, r1
	lsls r1, r1, #1
	ldr r2, _08009548 @ =0x02022C60
	adds r1, r1, r2
	bl sub_08005460
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	blt _080094A2
_080094D6:
	ldr r4, _08009540 @ =0x08BFFB68
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	subs r0, #1
	lsls r0, r0, #1
	ldrb r1, [r2, #0xd]
	adds r0, r1, r0
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _08009548 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	movs r2, #2
	movs r3, #0
	bl sub_080C0C30
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	ldr r5, _08009544 @ =0x030000C8
	adds r0, r0, r5
	bl sub_080053B0
	ldr r4, [r4]
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4, #8]
	bl sub_08005450
	movs r0, #1
	bl sub_0800A4EC
	adds r0, r7, #0
	bl sub_0800457C
_08009538:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009540: .4byte 0x08BFFB68
_08009544: .4byte 0x030000C8
_08009548: .4byte 0x02022C60

	thumb_func_start sub_0800954C
sub_0800954C: @ 0x0800954C
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, _08009560 @ =0x44444444
	movs r1, #0x19
	bl sub_0800A530
	pop {r0}
	bx r0
	.align 2, 0
_08009560: .4byte 0x44444444

	thumb_func_start sub_08009564
sub_08009564: @ 0x08009564
	push {r4, lr}
	ldr r0, _08009590 @ =0x08BFFB68
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r4, _08009594 @ =0x030000D0
	adds r0, r4, #0
	bl sub_08005B2C
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005450
	adds r0, r4, #0
	movs r1, #4
	bl sub_08005444
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009590: .4byte 0x08BFFB68
_08009594: .4byte 0x030000D0

	thumb_func_start sub_08009598
sub_08009598: @ 0x08009598
	push {r4, r5, lr}
	ldr r0, _080095CC @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
_080095A4:
	lsls r4, r5, #3
	ldr r0, _080095D0 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_08005B2C
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005450
	adds r0, r4, #0
	movs r1, #4
	bl sub_08005444
	adds r5, #1
	cmp r5, #1
	ble _080095A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080095CC: .4byte 0x08BFFB68
_080095D0: .4byte 0x030000C8

	thumb_func_start sub_080095D4
sub_080095D4: @ 0x080095D4
	ldr r1, _080095E0 @ =0x08BFFD2C
	subs r0, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080095E0: .4byte 0x08BFFD2C

	thumb_func_start sub_080095E4
sub_080095E4: @ 0x080095E4
	push {lr}
	ldr r0, _0800961C @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, _08009620 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r0, #2
	bl sub_0800A4EC
	bl sub_08009628
	ldr r2, _08009624 @ =0x03002790
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0800961C: .4byte 0x08BFFB68
_08009620: .4byte 0x02023460
_08009624: .4byte 0x03002790

	thumb_func_start sub_08009628
sub_08009628: @ 0x08009628
	push {r4, r5, r6, lr}
	ldr r0, _08009680 @ =0x02022C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #1
	bl sub_0800A4EC
	ldr r2, _08009684 @ =0x08BFFB68
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _0800967A
	adds r6, r2, #0
_0800965A:
	lsls r4, r5, #3
	ldr r0, _08009688 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_080053B0
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl sub_08005450
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _0800965A
_0800967A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009680: .4byte 0x02022C60
_08009684: .4byte 0x08BFFB68
_08009688: .4byte 0x030000C8

	thumb_func_start sub_0800968C
sub_0800968C: @ 0x0800968C
	push {r4, r5, r6, lr}
	ldr r2, _080096D8 @ =0x08BFFB68
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _080096D0
	adds r6, r2, #0
_080096B0:
	lsls r4, r5, #3
	ldr r0, _080096DC @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_080053B0
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl sub_08005450
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _080096B0
_080096D0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080096D8: .4byte 0x08BFFB68
_080096DC: .4byte 0x030000C8

	thumb_func_start sub_080096E0
sub_080096E0: @ 0x080096E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sl, r1
	adds r4, r2, #0
	str r3, [sp, #4]
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r0, _08009730 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r7, #1
	cmp r5, #0xf
	bgt _0800970A
	movs r7, #0
_0800970A:
	bl sub_0804B9C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009716
	adds r7, #2
_08009716:
	mov r1, sl
	ldr r2, [sp, #4]
	subs r0, r1, r2
	adds r0, #1
	mov sb, r0
	cmp r7, #1
	beq _08009752
	cmp r7, #1
	bgt _08009734
	cmp r7, #0
	beq _0800973E
	b _08009796
	.align 2, 0
_08009730: .4byte 0x02023460
_08009734:
	cmp r7, #2
	beq _08009776
	cmp r7, #3
	beq _08009788
	b _08009796
_0800973E:
	adds r5, #3
	mov r8, r5
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r6, r5, r0
	cmp r6, #0
	bgt _08009796
	movs r6, #1
	b _08009796
_08009752:
	subs r5, #5
	mov r8, r5
	adds r0, r4, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, r8
	cmp r0, #0x1d
	ble _0800976A
	movs r0, #0x1d
	subs r6, r0, r4
	b _08009796
_0800976A:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r1, r8
	subs r6, r1, r0
	b _08009796
_08009776:
	movs r6, #9
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	movs r0, #8
	mov r8, r0
	movs r1, #0x10
	mov sl, r1
	b _08009796
_08009788:
	movs r6, #1
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	mov r8, r4
	movs r0, #0x10
	mov sl, r0
_08009796:
	ldr r5, _08009818 @ =0x08BFFB68
	ldr r1, [r5]
	adds r0, r6, #1
	strb r0, [r1, #0xc]
	ldr r1, [r5]
	mov r0, sb
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r1, [sp, #4]
	str r1, [sp]
	movs r0, #1
	adds r1, r6, #0
	mov r2, sb
	adds r3, r4, #0
	bl sub_08009AA8
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080097D8
	movs r0, #1
	ands r0, r1
	bl sub_08008408
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #2
	ldrb r2, [r1]
	eors r0, r2
	strb r0, [r1]
_080097D8:
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080097F2
	movs r0, #1
	mov r1, r8
	mov r2, sl
	adds r3, r7, #0
	bl sub_08009920
_080097F2:
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl sub_080098A0
	bl sub_0800981C
	movs r0, #2
	bl sub_0800A4EC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009818: .4byte 0x08BFFB68

	thumb_func_start sub_0800981C
sub_0800981C: @ 0x0800981C
	push {lr}
	ldr r0, _08009830 @ =0x08BFFD3C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08009830: .4byte 0x08BFFD3C

	thumb_func_start sub_08009834
sub_08009834: @ 0x08009834
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _08009898 @ =0x0818F93C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x64
	ldrh r1, [r5]
	adds r2, r1, #1
	strh r2, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08009890
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #2
	add r0, sp
	ldr r4, [r0]
	movs r0, #1
	bl sub_08001370
	adds r1, r0, #0
	ldr r0, _0800989C @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08013688
	ldrh r5, [r5]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x11
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	bne _08009890
	adds r0, r6, #0
	bl sub_0800457C
_08009890:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009898: .4byte 0x0818F93C
_0800989C: .4byte 0x06000200

	thumb_func_start sub_080098A0
sub_080098A0: @ 0x080098A0
	push {r4, r5, r6, lr}
	ldr r4, _0800991C @ =0x03002790
	mov ip, r4
	movs r4, #0x20
	mov r5, ip
	ldrb r5, [r5, #1]
	orrs r4, r5
	movs r5, #0x41
	rsbs r5, r5, #0
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	mov r6, ip
	strb r4, [r6, #1]
	adds r4, r0, #1
	lsls r4, r4, #3
	mov r5, ip
	adds r5, #0x2d
	strb r4, [r5]
	adds r4, r1, #1
	lsls r4, r4, #3
	adds r5, #4
	strb r4, [r5]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #3
	mov r2, ip
	adds r2, #0x2c
	strb r0, [r2]
	adds r1, r1, r3
	subs r1, #1
	lsls r1, r1, #3
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x34
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800991C: .4byte 0x03002790

	thumb_func_start sub_08009920
sub_08009920: @ 0x08009920
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl sub_08002BC0
	adds r3, r0, #0
	cmp r6, #5
	bls _08009934
	b _08009A96
_08009934:
	lsls r0, r6, #2
	ldr r1, _08009940 @ =_08009944
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009940: .4byte _08009944
_08009944: @ jump table
	.4byte _0800995C @ case 0
	.4byte _08009990 @ case 1
	.4byte _080099C8 @ case 2
	.4byte _080099FC @ case 3
	.4byte _08009A34 @ case 4
	.4byte _08009A6C @ case 5
_0800995C:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08009984 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08009988 @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _0800998C @ =0x00003416
	adds r1, r3, #0
	strh r1, [r0]
	adds r2, #1
	b _08009A92
	.align 2, 0
_08009984: .4byte 0x00003014
_08009988: .4byte 0x00003414
_0800998C: .4byte 0x00003416
_08009990:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _080099B8 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _080099BC @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080099C0 @ =0x00003015
	adds r1, r3, #0
	strh r1, [r0]
	ldr r2, _080099C4 @ =0x00003016
	b _08009A92
	.align 2, 0
_080099B8: .4byte 0x00003014
_080099BC: .4byte 0x00003414
_080099C0: .4byte 0x00003015
_080099C4: .4byte 0x00003016
_080099C8:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _080099F0 @ =0x00003418
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080099F4 @ =0x00003419
	adds r1, r3, #0
	strh r1, [r0]
	subs r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _080099F8 @ =0x00003C17
	b _08009A92
	.align 2, 0
_080099F0: .4byte 0x00003418
_080099F4: .4byte 0x00003419
_080099F8: .4byte 0x00003C17
_080099FC:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009A24 @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009A28 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009A2C @ =0x00003018
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009A30 @ =0x00003019
	b _08009A92
	.align 2, 0
_08009A24: .4byte 0x00003017
_08009A28: .4byte 0x00003817
_08009A2C: .4byte 0x00003018
_08009A30: .4byte 0x00003019
_08009A34:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009A5C @ =0x00003C19
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009A60 @ =0x00003C18
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009A64 @ =0x00003417
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009A68 @ =0x00003C17
	b _08009A92
	.align 2, 0
_08009A5C: .4byte 0x00003C19
_08009A60: .4byte 0x00003C18
_08009A64: .4byte 0x00003417
_08009A68: .4byte 0x00003C17
_08009A6C:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009A9C @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009AA0 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	adds r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009AA4 @ =0x00003818
_08009A92:
	adds r1, r2, #0
	strh r1, [r0, #2]
_08009A96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009A9C: .4byte 0x00003017
_08009AA0: .4byte 0x00003817
_08009AA4: .4byte 0x00003818

	thumb_func_start sub_08009AA8
sub_08009AA8: @ 0x08009AA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	str r2, [sp]
	adds r5, r3, #0
	ldr r4, [sp, #0x28]
	bl sub_08002BC0
	adds r7, r0, #0
	subs r5, #1
	subs r4, #1
	mov r0, r8
	adds r3, r0, r5
	cmp r8, r3
	bge _08009B00
	ldr r1, _08009BC0 @ =0x00003011
	mov sb, r1
	ldr r2, [sp]
	adds r0, r2, r4
	mov r6, r8
	lsls r1, r6, #1
	lsls r0, r0, #6
	adds r0, r0, r7
	adds r2, r1, r0
	ldr r6, [sp]
	lsls r0, r6, #6
	adds r0, r0, r7
	adds r1, r1, r0
	ldr r6, _08009BC4 @ =0x00003811
	adds r0, r6, #0
	mov r6, r8
	subs r3, r3, r6
_08009AF0:
	mov r6, sb
	strh r6, [r1]
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08009AF0
_08009B00:
	ldr r3, [sp]
	add r5, r8
	mov ip, r5
	lsls r0, r3, #5
	str r0, [sp, #4]
	adds r4, r4, r3
	mov sb, r4
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r3, sb
	bge _08009B44
	ldr r2, _08009BC8 @ =0x00003012
	adds r6, r2, #0
	ldr r4, _08009BCC @ =0x00003412
	adds r5, r4, #0
	lsls r0, r3, #6
	mov r2, ip
	lsls r1, r2, #1
	adds r1, r1, r7
	adds r2, r0, r1
	mov r4, r8
	lsls r1, r4, #1
	adds r1, r1, r7
	adds r0, r0, r1
	mov r1, sb
	subs r3, r1, r3
_08009B36:
	strh r6, [r0]
	strh r5, [r2]
	adds r2, #0x40
	adds r0, #0x40
	subs r3, #1
	cmp r3, #0
	bne _08009B36
_08009B44:
	mov r3, sl
	cmp r3, ip
	bge _08009B76
	mov r5, sb
	mov sl, ip
_08009B4E:
	ldr r2, [sp]
	adds r2, #1
	adds r4, r3, #1
	cmp r2, r5
	bge _08009B70
	ldr r0, _08009BD0 @ =0x00003013
	adds r6, r0, #0
	lsls r1, r2, #6
	lsls r0, r3, #1
	adds r0, r0, r7
	adds r0, r1, r0
	subs r2, r5, r2
_08009B66:
	strh r6, [r0]
	adds r0, #0x40
	subs r2, #1
	cmp r2, #0
	bne _08009B66
_08009B70:
	adds r3, r4, #0
	cmp r3, sl
	blt _08009B4E
_08009B76:
	ldr r0, [sp, #4]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r2, _08009BD4 @ =0x00003010
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08009BD8 @ =0x00003410
	adds r1, r3, #0
	strh r1, [r0]
	mov r4, sb
	lsls r1, r4, #5
	mov r6, r8
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08009BDC @ =0x00003810
	adds r2, r3, #0
	strh r2, [r0]
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r4, _08009BE0 @ =0x00003C10
	adds r0, r4, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009BC0: .4byte 0x00003011
_08009BC4: .4byte 0x00003811
_08009BC8: .4byte 0x00003012
_08009BCC: .4byte 0x00003412
_08009BD0: .4byte 0x00003013
_08009BD4: .4byte 0x00003010
_08009BD8: .4byte 0x00003410
_08009BDC: .4byte 0x00003810
_08009BE0: .4byte 0x00003C10

	thumb_func_start nullsub_25
nullsub_25: @ 0x08009BE4
	bx lr
	.align 2, 0

	thumb_func_start sub_08009BE8
sub_08009BE8: @ 0x08009BE8
	push {r4, lr}
	movs r1, #0
	str r1, [r0, #0x58]
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_08007F58
	adds r4, r0, #0
	cmp r4, #0
	bne _08009C44
	ldr r2, _08009C4C @ =0x030027CC
	ldr r0, _08009C50 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08009C54 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r1
	strb r0, [r2, #1]
	adds r3, r2, #0
	subs r3, #8
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
	subs r0, r2, #6
	ldrb r3, [r0]
	orrs r1, r3
	strb r1, [r0]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	strb r4, [r2, #8]
	movs r0, #0x10
	strb r0, [r2, #9]
	strb r4, [r2, #0xa]
_08009C44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009C4C: .4byte 0x030027CC
_08009C50: .4byte 0x0000FFE0
_08009C54: .4byte 0x0000E0FF

	thumb_func_start sub_08009C58
sub_08009C58: @ 0x08009C58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r4, #0
	adds r3, #0x6a
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl sub_080096E0
	adds r0, r4, #0
	bl sub_0800457C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08009C8C
sub_08009C8C: @ 0x08009C8C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x58]
	adds r3, #1
	str r3, [r5, #0x58]
	movs r1, #0x1e
	rsbs r1, r1, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_08013508
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl sub_08001D64
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_08007F58
	adds r6, r0, #0
	cmp r6, #0
	bne _08009CF4
	ldr r3, _08009D08 @ =0x03002790
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #1
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_08009CF4:
	ldr r0, [r5, #0x58]
	cmp r0, #0xc
	bne _08009D00
	adds r0, r5, #0
	bl sub_0800457C
_08009D00:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009D08: .4byte 0x03002790

	thumb_func_start sub_08009D0C
sub_08009D0C: @ 0x08009D0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08009D68 @ =0x08BFFD4C
	bl sub_080043D4
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08009D94
	adds r2, r4, #0
	adds r2, #0x64
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #8
	strh r0, [r1]
	ldr r3, _08009D6C @ =0x08BFFB68
	ldr r0, [r3]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	movs r0, #6
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08009D4C
	movs r0, #0
	strh r0, [r2]
_08009D4C:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1d
	ble _08009D58
	movs r0, #0x1e
	strh r0, [r2]
_08009D58:
	ldr r0, [r3]
	strb r5, [r0, #0xf]
	ldr r1, [r3]
	ldrb r0, [r1, #0xe]
	strb r0, [r1, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009D68: .4byte 0x08BFFD4C
_08009D6C: .4byte 0x08BFFB68

	thumb_func_start sub_08009D70
sub_08009D70: @ 0x08009D70
	ldr r0, _08009D8C @ =0x08BFFB68
	ldr r1, [r0]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	ldrb r2, [r1, #0x11]
	cmp r0, r2
	bne _08009D90
	ldrb r0, [r1, #0x10]
	ldrb r2, [r1, #0xe]
	cmp r0, r2
	bne _08009D90
	movs r0, #1
	b _08009D92
	.align 2, 0
_08009D8C: .4byte 0x08BFFB68
_08009D90:
	movs r0, #0
_08009D92:
	bx lr

	thumb_func_start sub_08009D94
sub_08009D94: @ 0x08009D94
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B9C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009DAE
	cmp r4, #2
	bgt _08009DAA
	movs r0, #4
	b _08009DB6
_08009DAA:
	movs r0, #0x1a
	b _08009DB6
_08009DAE:
	ldr r0, _08009DBC @ =0x08BFFD7C
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
_08009DB6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08009DBC: .4byte 0x08BFFD7C

	thumb_func_start sub_08009DC0
sub_08009DC0: @ 0x08009DC0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08009E10 @ =0x0818F958
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r5, #0xff
	beq _08009E06
	ldr r4, _08009E14 @ =0x08BFFB68
	ldr r0, [r4]
	lsls r5, r5, #2
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_08006C2C
	movs r1, #0x39
	rsbs r1, r1, #0
	ands r1, r0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r1, r6
	ldrb r2, [r2, #0x17]
	lsls r2, r2, #2
	add r2, sp
	ldr r2, [r2]
	orrs r1, r2
	bl sub_08006BF8
_08009E06:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009E10: .4byte 0x0818F958
_08009E14: .4byte 0x08BFFB68

	thumb_func_start sub_08009E18
sub_08009E18: @ 0x08009E18
	push {lr}
	movs r1, #0x10
	bl sub_08009DC0
	pop {r0}
	bx r0

	thumb_func_start sub_08009E24
sub_08009E24: @ 0x08009E24
	push {lr}
	movs r1, #0
	bl sub_08009DC0
	pop {r0}
	bx r0

	thumb_func_start sub_08009E30
sub_08009E30: @ 0x08009E30
	push {lr}
	ldr r0, _08009E44 @ =0x08BFFB84
	bl sub_08004584
	cmp r0, #0
	beq _08009E3E
	movs r0, #1
_08009E3E:
	pop {r1}
	bx r1
	.align 2, 0
_08009E44: .4byte 0x08BFFB84

	thumb_func_start sub_08009E48
sub_08009E48: @ 0x08009E48
	push {lr}
	ldr r0, _08009E5C @ =0x08BFF970
	bl sub_08004584
	cmp r0, #0
	beq _08009E56
	movs r0, #1
_08009E56:
	pop {r1}
	bx r1
	.align 2, 0
_08009E5C: .4byte 0x08BFF970

	thumb_func_start sub_08009E60
sub_08009E60: @ 0x08009E60
	ldr r0, _08009E68 @ =0x030000E0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009E68: .4byte 0x030000E0

	thumb_func_start sub_08009E6C
sub_08009E6C: @ 0x08009E6C
	ldr r1, _08009E74 @ =0x030000E0
	str r0, [r1]
	bx lr
	.align 2, 0
_08009E74: .4byte 0x030000E0

	thumb_func_start sub_08009E78
sub_08009E78: @ 0x08009E78
	ldr r1, _08009E80 @ =0x08BFFB68
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_08009E80: .4byte 0x08BFFB68

	thumb_func_start sub_08009E84
sub_08009E84: @ 0x08009E84
	push {lr}
	adds r1, r0, #0
	ldr r0, _08009E98 @ =0x08BFFB68
	ldr r0, [r0]
	adds r0, #0x60
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_08009E98: .4byte 0x08BFFB68

	thumb_func_start sub_08009E9C
sub_08009E9C: @ 0x08009E9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	str r2, [sp]
	mov sb, r3
	movs r6, #0
	mov r7, sl
	adds r5, r2, #0
	b _08009EC2
_08009EB8:
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_080056D8
	adds r4, r0, #0
_08009EC2:
	movs r0, #0
	mov r8, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08009EE8
	cmp r0, #1
	bne _08009EE2
	ldm r7!, {r0}
	adds r1, r5, #0
	bl sub_08005460
	adds r5, #0x80
	adds r6, #1
	adds r4, #1
	cmp r6, sb
	bge _08009EF8
_08009EE2:
	mov r2, r8
	cmp r2, #0
	beq _08009EB8
_08009EE8:
	lsls r0, r6, #2
	add r0, sl
	ldr r0, [r0]
	lsls r1, r6, #7
	ldr r2, [sp]
	adds r1, r2, r1
	bl sub_08005460
_08009EF8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08009F08
sub_08009F08: @ 0x08009F08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r0, _08009F7C @ =0x08BFFDB6
	mov ip, r0
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	ldr r4, _08009F80 @ =0x000003FF
	mov sl, r4
	ldrh r6, [r3]
	ands r4, r6
	movs r0, #0x64
	adds r0, r0, r7
	mov r8, r0
	movs r5, #0xf
	adds r0, r5, #0
	mov r3, r8
	ldrh r3, [r3]
	ands r0, r3
	lsls r0, r0, #0xc
	orrs r4, r0
	str r4, [sp]
	movs r0, #3
	mov r3, ip
	bl sub_08006884
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, _08009F84 @ =0x08BFFD9C
	mov r6, sl
	mov r4, sb
	ldrh r4, [r4]
	ands r6, r4
	ldr r0, _08009F88 @ =0x030000E8
	ldrh r0, [r0, #0x14]
	ands r5, r0
	lsls r5, r5, #0xc
	orrs r6, r5
	str r6, [sp]
	movs r0, #3
	bl sub_08006884
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009F7C: .4byte 0x08BFFDB6
_08009F80: .4byte 0x000003FF
_08009F84: .4byte 0x08BFFD9C
_08009F88: .4byte 0x030000E8

	thumb_func_start sub_08009F8C
sub_08009F8C: @ 0x08009F8C
	push {lr}
	movs r0, #0
	bl sub_08002DF0
	pop {r0}
	bx r0

	thumb_func_start sub_08009F98
sub_08009F98: @ 0x08009F98
	push {lr}
	ldr r0, _08009FA8 @ =sub_08009F8C
	movs r1, #1
	bl sub_08014FB0
	pop {r0}
	bx r0
	.align 2, 0
_08009FA8: .4byte sub_08009F8C

	thumb_func_start sub_08009FAC
sub_08009FAC: @ 0x08009FAC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r0, _08009FE0 @ =0x08BFFB68
	ldr r0, [r0]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	mov sb, r1
	ldrb r5, [r0, #0x11]
	movs r6, #0
	movs r7, #0x18
_08009FCE:
	ldrb r0, [r4]
	cmp r0, #0x81
	bls _08009FD6
	b _0800A342
_08009FD6:
	lsls r0, r0, #2
	ldr r1, _08009FE4 @ =_08009FE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009FE0: .4byte 0x08BFFB68
_08009FE4: .4byte _08009FE8
_08009FE8: @ jump table
	.4byte _0800A1F0 @ case 0
	.4byte _0800A1FA @ case 1
	.4byte _0800A1FA @ case 2
	.4byte _0800A206 @ case 3
	.4byte _0800A202 @ case 4
	.4byte _0800A202 @ case 5
	.4byte _0800A202 @ case 6
	.4byte _0800A202 @ case 7
	.4byte _0800A20A @ case 8
	.4byte _0800A20A @ case 9
	.4byte _0800A20A @ case 10
	.4byte _0800A20A @ case 11
	.4byte _0800A20A @ case 12
	.4byte _0800A20A @ case 13
	.4byte _0800A20A @ case 14
	.4byte _0800A20A @ case 15
	.4byte _0800A210 @ case 16
	.4byte _0800A22E @ case 17
	.4byte _0800A234 @ case 18
	.4byte _0800A234 @ case 19
	.4byte _0800A234 @ case 20
	.4byte _0800A234 @ case 21
	.4byte _0800A202 @ case 22
	.4byte _0800A202 @ case 23
	.4byte _0800A23C @ case 24
	.4byte _0800A23C @ case 25
	.4byte _0800A23C @ case 26
	.4byte _0800A23C @ case 27
	.4byte _0800A202 @ case 28
	.4byte _0800A342 @ case 29
	.4byte _0800A342 @ case 30
	.4byte _0800A342 @ case 31
	.4byte _0800A342 @ case 32
	.4byte _0800A342 @ case 33
	.4byte _0800A342 @ case 34
	.4byte _0800A342 @ case 35
	.4byte _0800A342 @ case 36
	.4byte _0800A342 @ case 37
	.4byte _0800A342 @ case 38
	.4byte _0800A342 @ case 39
	.4byte _0800A342 @ case 40
	.4byte _0800A342 @ case 41
	.4byte _0800A342 @ case 42
	.4byte _0800A342 @ case 43
	.4byte _0800A342 @ case 44
	.4byte _0800A342 @ case 45
	.4byte _0800A342 @ case 46
	.4byte _0800A342 @ case 47
	.4byte _0800A342 @ case 48
	.4byte _0800A342 @ case 49
	.4byte _0800A342 @ case 50
	.4byte _0800A342 @ case 51
	.4byte _0800A342 @ case 52
	.4byte _0800A342 @ case 53
	.4byte _0800A342 @ case 54
	.4byte _0800A342 @ case 55
	.4byte _0800A342 @ case 56
	.4byte _0800A342 @ case 57
	.4byte _0800A342 @ case 58
	.4byte _0800A342 @ case 59
	.4byte _0800A342 @ case 60
	.4byte _0800A342 @ case 61
	.4byte _0800A342 @ case 62
	.4byte _0800A342 @ case 63
	.4byte _0800A342 @ case 64
	.4byte _0800A342 @ case 65
	.4byte _0800A342 @ case 66
	.4byte _0800A342 @ case 67
	.4byte _0800A342 @ case 68
	.4byte _0800A342 @ case 69
	.4byte _0800A342 @ case 70
	.4byte _0800A342 @ case 71
	.4byte _0800A342 @ case 72
	.4byte _0800A342 @ case 73
	.4byte _0800A342 @ case 74
	.4byte _0800A342 @ case 75
	.4byte _0800A342 @ case 76
	.4byte _0800A342 @ case 77
	.4byte _0800A342 @ case 78
	.4byte _0800A342 @ case 79
	.4byte _0800A342 @ case 80
	.4byte _0800A342 @ case 81
	.4byte _0800A342 @ case 82
	.4byte _0800A342 @ case 83
	.4byte _0800A342 @ case 84
	.4byte _0800A342 @ case 85
	.4byte _0800A342 @ case 86
	.4byte _0800A342 @ case 87
	.4byte _0800A342 @ case 88
	.4byte _0800A342 @ case 89
	.4byte _0800A342 @ case 90
	.4byte _0800A342 @ case 91
	.4byte _0800A342 @ case 92
	.4byte _0800A342 @ case 93
	.4byte _0800A342 @ case 94
	.4byte _0800A342 @ case 95
	.4byte _0800A342 @ case 96
	.4byte _0800A342 @ case 97
	.4byte _0800A342 @ case 98
	.4byte _0800A342 @ case 99
	.4byte _0800A342 @ case 100
	.4byte _0800A342 @ case 101
	.4byte _0800A342 @ case 102
	.4byte _0800A342 @ case 103
	.4byte _0800A342 @ case 104
	.4byte _0800A342 @ case 105
	.4byte _0800A342 @ case 106
	.4byte _0800A342 @ case 107
	.4byte _0800A342 @ case 108
	.4byte _0800A342 @ case 109
	.4byte _0800A342 @ case 110
	.4byte _0800A342 @ case 111
	.4byte _0800A342 @ case 112
	.4byte _0800A342 @ case 113
	.4byte _0800A342 @ case 114
	.4byte _0800A342 @ case 115
	.4byte _0800A342 @ case 116
	.4byte _0800A342 @ case 117
	.4byte _0800A342 @ case 118
	.4byte _0800A342 @ case 119
	.4byte _0800A342 @ case 120
	.4byte _0800A342 @ case 121
	.4byte _0800A342 @ case 122
	.4byte _0800A342 @ case 123
	.4byte _0800A342 @ case 124
	.4byte _0800A342 @ case 125
	.4byte _0800A342 @ case 126
	.4byte _0800A342 @ case 127
	.4byte _0800A240 @ case 128
	.4byte _0800A336 @ case 129
_0800A1F0:
	cmp r6, r7
	bgt _0800A1F6
	b _0800A368
_0800A1F6:
	adds r7, r6, #0
	b _0800A368
_0800A1FA:
	cmp r6, r7
	ble _0800A200
	adds r7, r6, #0
_0800A200:
	movs r6, #0
_0800A202:
	adds r4, #1
	b _08009FCE
_0800A206:
	adds r6, #0xc
	b _0800A202
_0800A20A:
	ldrb r5, [r4]
	subs r5, #8
	b _0800A202
_0800A210:
	ldrb r0, [r4]
	cmp r0, #8
	bge _0800A218
	b _08009FCE
_0800A218:
	cmp r0, #0xf
	ble _0800A222
	cmp r0, #0x10
	beq _0800A22A
	b _08009FCE
_0800A222:
	adds r5, r0, #0
	subs r5, #8
	adds r4, #1
	b _0800A210
_0800A22A:
	adds r4, #3
	b _0800A210
_0800A22E:
	cmp r5, sb
	beq _0800A1F0
	b _0800A202
_0800A234:
	mov r2, r8
	cmp r2, #0
	beq _0800A1F0
	b _0800A202
_0800A23C:
	adds r6, #0x80
	b _0800A202
_0800A240:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0x25
	bls _0800A24A
	b _08009FCE
_0800A24A:
	lsls r0, r0, #2
	ldr r1, _0800A254 @ =_0800A258
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A254: .4byte _0800A258
_0800A258: @ jump table
	.4byte _0800A202 @ case 0
	.4byte _0800A202 @ case 1
	.4byte _0800A202 @ case 2
	.4byte _0800A202 @ case 3
	.4byte _0800A202 @ case 4
	.4byte _0800A2F0 @ case 5
	.4byte _0800A316 @ case 6
	.4byte _0800A202 @ case 7
	.4byte _0800A202 @ case 8
	.4byte _0800A202 @ case 9
	.4byte _0800A330 @ case 10
	.4byte _0800A330 @ case 11
	.4byte _0800A330 @ case 12
	.4byte _0800A330 @ case 13
	.4byte _0800A330 @ case 14
	.4byte _0800A330 @ case 15
	.4byte _0800A330 @ case 16
	.4byte _0800A330 @ case 17
	.4byte _08009FCE @ case 18
	.4byte _08009FCE @ case 19
	.4byte _08009FCE @ case 20
	.4byte _08009FCE @ case 21
	.4byte _0800A202 @ case 22
	.4byte _0800A202 @ case 23
	.4byte _0800A202 @ case 24
	.4byte _0800A202 @ case 25
	.4byte _0800A202 @ case 26
	.4byte _0800A202 @ case 27
	.4byte _0800A202 @ case 28
	.4byte _0800A202 @ case 29
	.4byte _0800A202 @ case 30
	.4byte _0800A202 @ case 31
	.4byte _0800A30C @ case 32
	.4byte _0800A202 @ case 33
	.4byte _08009FCE @ case 34
	.4byte _08009FCE @ case 35
	.4byte _0800A202 @ case 36
	.4byte _0800A202 @ case 37
_0800A2F0:
	ldr r0, _0800A308 @ =0x08BFFB68
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	mov r1, sp
	bl sub_080149EC
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	b _0800A322
	.align 2, 0
_0800A308: .4byte 0x08BFFB68
_0800A30C:
	bl sub_0802EBB0
	bl sub_080054CC
	b _0800A326
_0800A316:
	ldr r0, _0800A32C @ =0x08BFFB68
	ldr r0, [r0]
	adds r0, #0x60
	mov r2, r8
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
_0800A322:
	bl sub_08009FAC
_0800A326:
	adds r6, r6, r0
	b _0800A202
	.align 2, 0
_0800A32C: .4byte 0x08BFFB68
_0800A330:
	ldrb r5, [r4]
	subs r5, #0xa
	b _0800A202
_0800A336:
	ldrb r0, [r4, #1]
	cmp r0, #0x40
	bne _0800A342
	adds r4, #2
	adds r6, #6
	b _08009FCE
_0800A342:
	cmp r5, sb
	beq _0800A358
	cmp r5, #0xff
	beq _0800A358
	mov r1, r8
	cmp r1, #0
	beq _0800A352
	b _0800A1F0
_0800A352:
	movs r2, #1
	mov r8, r2
	mov sb, r5
_0800A358:
	add r1, sp, #0x20
	adds r0, r4, #0
	bl sub_08005528
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	adds r6, r6, r0
	b _08009FCE
_0800A368:
	adds r0, r7, #0
	add sp, #0x24
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800A378
sub_0800A378: @ 0x0800A378
	push {lr}
	ldr r0, _0800A38C @ =0x08BFFE18
	bl sub_08004584
	cmp r0, #0
	beq _0800A386
	movs r0, #1
_0800A386:
	pop {r1}
	bx r1
	.align 2, 0
_0800A38C: .4byte 0x08BFFE18

	thumb_func_start sub_0800A390
sub_0800A390: @ 0x0800A390
	push {lr}
	ldr r0, _0800A3A0 @ =0x08BFFE18
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0800A3A0: .4byte 0x08BFFE18

	thumb_func_start sub_0800A3A4
sub_0800A3A4: @ 0x0800A3A4
	movs r1, #1
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800A3AC
sub_0800A3AC: @ 0x0800A3AC
	push {lr}
	movs r0, #0x1c
	bl sub_0800B72C
	pop {r0}
	bx r0

	thumb_func_start sub_0800A3B8
sub_0800A3B8: @ 0x0800A3B8
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_0800A3A4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A3C8
sub_0800A3C8: @ 0x0800A3C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x2c]
	bl sub_08008354
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A3DC
	bl sub_0800836C
_0800A3DC:
	bl sub_0800EC2C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A3E8
	b _0800A4E6
_0800A3E8:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bne _0800A3FE
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl sub_0800515C
	adds r0, r6, #0
	bl sub_0800A3A4
_0800A3FE:
	movs r0, #0x70
	movs r1, #0x64
	adds r2, r5, #0
	movs r3, #4
	bl sub_08005234
	ldr r1, _0800A420 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #4
	ldrh r3, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq _0800A424
	adds r0, r6, #0
	bl sub_0800457C
	b _0800A4E6
	.align 2, 0
_0800A420: .4byte gpKeySt
_0800A424:
	ldrh r2, [r2, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0800A430
	adds r5, #1
_0800A430:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0800A43A
	subs r5, #1
_0800A43A:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0800A444
	adds r5, #0xa
_0800A444:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0800A44E
	subs r5, #0xa
_0800A44E:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800A45A
	adds r5, #0x64
_0800A45A:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0800A466
	subs r5, #0x64
_0800A466:
	cmp r5, #0
	bge _0800A46C
	movs r5, #0
_0800A46C:
	ldr r0, _0800A4C4 @ =0x00001234
	cmp r5, r0
	ble _0800A474
	adds r5, r0, #0
_0800A474:
	ldr r0, [r6, #0x2c]
	cmp r5, r0
	beq _0800A4C8
	bl sub_0800EC08
	bl sub_08007EF8
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #9
	bl sub_0800515C
	str r5, [r6, #0x2c]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_08007C88
	ldr r2, [r6, #0x2c]
	movs r0, #1
	movs r1, #1
	bl sub_08007EAC
	movs r0, #1
	bl sub_08007F24
	movs r0, #2
	bl sub_08007F24
	movs r0, #4
	bl sub_08007F24
	adds r0, r4, #0
	bl sub_08007F68
	movs r0, #1
	bl sub_0800A4EC
	b _0800A4E6
	.align 2, 0
_0800A4C4: .4byte 0x00001234
_0800A4C8:
	ldr r1, [r1]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800A4E6
	bl sub_0800EC08
	bl sub_08007EF8
	movs r0, #0
	str r0, [r6, #0x34]
	ldr r0, [r6, #0x2c]
	bl sub_0800EC84
_0800A4E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0800A4EC
sub_0800A4EC: @ 0x0800A4EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl sub_08007F58
	cmp r0, #0
	bne _0800A500
	adds r0, r4, #0
	bl sub_08000FD4
_0800A500:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A508
sub_0800A508: @ 0x0800A508
	push {lr}
	ldr r0, _0800A51C @ =0x08BFFE70
	bl sub_08004584
	cmp r0, #0
	beq _0800A516
	movs r0, #1
_0800A516:
	pop {r1}
	bx r1
	.align 2, 0
_0800A51C: .4byte 0x08BFFE70

	thumb_func_start sub_0800A520
sub_0800A520: @ 0x0800A520
	push {lr}
	ldr r0, _0800A52C @ =0x08BFFE70
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_0800A52C: .4byte 0x08BFFE70

	thumb_func_start sub_0800A530
sub_0800A530: @ 0x0800A530
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _0800A568 @ =0x08BFFE70
	movs r1, #0
	bl Proc_Start
	ldr r1, _0800A56C @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _0800A570 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #0x4c]
	str r5, [r0, #0x54]
	str r6, [r0, #0x58]
	ldr r0, _0800A574 @ =0x08BFFE58
	mov r1, r8
	bl sub_080043D4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A568: .4byte 0x08BFFE70
_0800A56C: .4byte 0x000003FF
_0800A570: .4byte 0x06010000
_0800A574: .4byte 0x08BFFE58

	thumb_func_start sub_0800A578
sub_0800A578: @ 0x0800A578
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0800A580
sub_0800A580: @ 0x0800A580
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b _0800A5DC
_0800A58A:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
_0800A594:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, _0800A5C4 @ =0x000002FF
	cmp r2, r0
	bgt _0800A5C8
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b _0800A5CA
	.align 2, 0
_0800A5C4: .4byte 0x000002FF
_0800A5C8:
	ldr r0, [r3, #0x58]
_0800A5CA:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble _0800A594
	adds r1, r5, #0
_0800A5DC:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt _0800A58A
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0800A5FC
	adds r0, r3, #0
	bl sub_0800457C
_0800A5FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A604
sub_0800A604: @ 0x0800A604
	ldr r1, _0800A610 @ =0x08BFFE88
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0800A610: .4byte 0x08BFFE88

	thumb_func_start sub_0800A614
sub_0800A614: @ 0x0800A614
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	bl sub_0800CEF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6FE
	movs r0, #6
	ldrb r1, [r5, #3]
	ands r0, r1
	cmp r0, #0
	beq _0800A668
	ldrb r0, [r5]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	adds r4, r0, #0
	cmp r4, #0
	beq _0800A674
	ldrb r2, [r5, #3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0800A65E
	cmp r0, #1
	bgt _0800A650
	cmp r0, #0
	beq _0800A656
	b _0800A660
_0800A650:
	cmp r0, #2
	beq _0800A65A
	b _0800A660
_0800A656:
	movs r6, #0
	b _0800A660
_0800A65A:
	movs r6, #0x80
	b _0800A660
_0800A65E:
	movs r6, #0x40
_0800A660:
	adds r0, r4, #0
	adds r1, r6, #0
	bl UnitChangeFaction
_0800A668:
	ldrb r0, [r5]
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	bne _0800A688
_0800A674:
	adds r0, r5, #0
	bl LoadUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800A6BA
_0800A688:
	adds r0, r4, #0
	bl sub_0807A124
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A6A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitLoadItemsFromDefinition
	ldr r0, [r4, #0xc]
	ldr r1, _0800A704 @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r4, #0xc]
_0800A6A4:
	adds r0, r4, #0
	bl sub_0807A1E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6BA
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800A6FE
_0800A6BA:
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x11]
	ldr r1, _0800A708 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800A6EE
	ldrb r0, [r1, #0x1b]
	cmp r0, #3
	bne _0800A6EE
	movs r0, #6
	ldrb r2, [r5, #3]
	ands r0, r2
	cmp r0, #4
	bne _0800A6EE
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl sub_08031A5C
	ldrb r1, [r0, #0x14]
	adds r0, r4, #0
	bl UnitApplyBonusLevels
_0800A6EE:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_0800A720
	bl sub_08019EA4
_0800A6FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A704: .4byte 0xFFFEFFFF
_0800A708: .4byte gPlaySt

	thumb_func_start sub_0800A70C
sub_0800A70C: @ 0x0800A70C
	push {lr}
	movs r2, #0
	movs r3, #0
	bl sub_0800A720
	bl sub_08019EA4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A720
sub_0800A720: @ 0x0800A720
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r6, #0
	beq _0800A79A
	cmp r3, #0
	beq _0800A78A
	cmp r7, #0
	beq _0800A778
	ldr r5, [r6, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0800A778
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r6, #0
	movs r3, #0
	bl sub_0800C9F8
	bl sub_08025BB0
	ldr r0, _0800A774 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r2, [r4, #4]
	ands r1, r2
	ldrh r2, [r4, #6]
	ands r0, r2
	cmp r1, r0
	beq _0800A79A
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_0800CA84
	b _0800A79A
	.align 2, 0
_0800A774: .4byte 0x0000FFFF
_0800A778:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	b _0800A79A
_0800A78A:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
_0800A79A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A7A4
sub_0800A7A4: @ 0x0800A7A4
	ldr r0, _0800A7B8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0800A7BC
	movs r0, #0
	b _0800A7BE
	.align 2, 0
_0800A7B8: .4byte gpKeySt
_0800A7BC:
	movs r0, #1
_0800A7BE:
	bx lr

	thumb_func_start sub_0800A7C0
sub_0800A7C0: @ 0x0800A7C0
	ldr r1, _0800A7CC @ =0x03000100
	movs r0, #0
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_0800A7CC: .4byte 0x03000100

	thumb_func_start sub_0800A7D0
sub_0800A7D0: @ 0x0800A7D0
	ldr r0, _0800A7E0 @ =0x08BFFE8C
	ldr r2, _0800A7E4 @ =0x03000100
	ldr r1, [r2]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, #1
	str r1, [r2]
	bx lr
	.align 2, 0
_0800A7E0: .4byte 0x08BFFE8C
_0800A7E4: .4byte 0x03000100

	thumb_func_start sub_0800A7E8
sub_0800A7E8: @ 0x0800A7E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	ldr r5, [r6, #0x2c]
	b _0800A8DA
_0800A7F4:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #9
	bhi _0800A8D8
	lsls r0, r0, #2
	ldr r1, _0800A808 @ =_0800A80C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A808: .4byte _0800A80C
_0800A80C: @ jump table
	.4byte _0800A8D4 @ case 0
	.4byte _0800A8C0 @ case 1
	.4byte _0800A8A8 @ case 2
	.4byte _0800A894 @ case 3
	.4byte _0800A8A0 @ case 4
	.4byte _0800A8D8 @ case 5
	.4byte _0800A850 @ case 6
	.4byte _0800A870 @ case 7
	.4byte _0800A83E @ case 8
	.4byte _0800A834 @ case 9
_0800A834:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	b _0800A8D8
_0800A83E:
	ldr r0, _0800A84C @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl sub_080149EC
	lsls r0, r0, #3
	b _0800A8D6
	.align 2, 0
_0800A84C: .4byte 0x0300010C
_0800A850:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A86C @ =0x03000108
	ldrh r0, [r0]
	bl sub_08017808
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0
	b _0800A886
	.align 2, 0
_0800A86C: .4byte 0x03000108
_0800A870:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A890 @ =0x03000108
	ldrh r0, [r0]
	adds r0, #0x70
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #1
_0800A886:
	bl sub_08004C20
	adds r4, #0x10
	b _0800A8D8
	.align 2, 0
_0800A890: .4byte 0x03000108
_0800A894:
	ldr r0, [r5, #4]
	bl sub_08013318
	bl sub_080054CC
	b _0800A8D6
_0800A8A0:
	ldr r0, [r5, #4]
	bl sub_080054CC
	b _0800A8D6
_0800A8A8:
	ldr r0, _0800A8BC @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_08013318
	bl sub_080054CC
	b _0800A8D6
	.align 2, 0
_0800A8BC: .4byte 0x03000104
_0800A8C0:
	ldr r0, _0800A8D0 @ =0x03000108
	ldrh r0, [r0]
	bl sub_08017610
	bl sub_080054CC
	b _0800A8D6
	.align 2, 0
_0800A8D0: .4byte 0x03000108
_0800A8D4:
	ldr r0, [r5, #4]
_0800A8D6:
	adds r4, r4, r0
_0800A8D8:
	adds r5, #8
_0800A8DA:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A7F4
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800A8EC
sub_0800A8EC: @ 0x0800A8EC
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	b _0800A9AA
_0800A8F8:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #8
	bhi _0800A9A8
	lsls r0, r0, #2
	ldr r1, _0800A90C @ =_0800A910
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A90C: .4byte _0800A910
_0800A910: @ jump table
	.4byte _0800A9A0 @ case 0
	.4byte _0800A988 @ case 1
	.4byte _0800A974 @ case 2
	.4byte _0800A960 @ case 3
	.4byte _0800A96A @ case 4
	.4byte _0800A956 @ case 5
	.4byte _0800A94C @ case 6
	.4byte _0800A94C @ case 7
	.4byte _0800A934 @ case 8
_0800A934:
	ldr r0, _0800A948 @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl sub_080149EC
	add r0, sp, #0x10
	mov r1, sp
	bl sub_080055DC
	b _0800A9A8
	.align 2, 0
_0800A948: .4byte 0x0300010C
_0800A94C:
	add r0, sp, #0x10
	movs r1, #0x10
	bl sub_08005448
	b _0800A9A8
_0800A956:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl sub_08005450
	b _0800A9A8
_0800A960:
	add r4, sp, #0x10
	ldr r0, [r5, #4]
	bl sub_08013318
	b _0800A992
_0800A96A:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl sub_080055DC
	b _0800A9A8
_0800A974:
	add r4, sp, #0x10
	ldr r0, _0800A984 @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_08013318
	b _0800A992
	.align 2, 0
_0800A984: .4byte 0x03000104
_0800A988:
	add r4, sp, #0x10
	ldr r0, _0800A99C @ =0x03000108
	ldrh r0, [r0]
	bl sub_08017610
_0800A992:
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080055DC
	b _0800A9A8
	.align 2, 0
_0800A99C: .4byte 0x03000108
_0800A9A0:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl sub_08005448
_0800A9A8:
	adds r5, #8
_0800A9AA:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A8F8
	movs r0, #3
	bl sub_08000FD4
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A9C0
sub_0800A9C0: @ 0x0800A9C0
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800A9F0 @ =0x0000FFFF
	strh r0, [r3, #0x3e]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800A9F0: .4byte 0x0000FFFF

	thumb_func_start sub_0800A9F4
sub_0800A9F4: @ 0x0800A9F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_08001370
	adds r1, r0, #0
	ldr r0, _0800AA5C @ =0x06002000
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #0
	bl sub_080052A4
	bl sub_08004BD0
	bl sub_0804A9F8
	ldr r3, _0800AA60 @ =0x03002790
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
	adds r0, r4, #0
	bl sub_0800A7E8
	adds r4, #0x46
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AA5C: .4byte 0x06002000
_0800AA60: .4byte 0x03002790

	thumb_func_start sub_0800AA64
sub_0800AA64: @ 0x0800AA64
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AA7C
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl sub_08003B4C
_0800AA7C:
	pop {r0}
	bx r0

	thumb_func_start sub_0800AA80
sub_0800AA80: @ 0x0800AA80
	push {lr}
	adds r1, r0, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800AA9E
	ldr r0, _0800AAA4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800AA9E
	ldrh r0, [r1]
	bl m4aSongNumStart
_0800AA9E:
	pop {r0}
	bx r0
	.align 2, 0
_0800AAA4: .4byte gPlaySt

	thumb_func_start sub_0800AAA8
sub_0800AAA8: @ 0x0800AAA8
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AAC0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl sub_08003B4C
_0800AAC0:
	pop {r0}
	bx r0

	thumb_func_start sub_0800AAC4
sub_0800AAC4: @ 0x0800AAC4
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	ldr r2, _0800AADC @ =0x08BFF768
	adds r0, #0x4a
	ldrh r3, [r0]
	adds r0, r4, #0
	bl sub_08004264
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AADC: .4byte 0x08BFF768

	thumb_func_start sub_0800AAE0
sub_0800AAE0: @ 0x0800AAE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	bl sub_0800A7E8
	adds r2, r5, #0
	adds r2, #0x46
	strh r0, [r2]
	lsls r1, r0, #0x10
	lsrs r6, r1, #0x13
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	beq _0800AB06
	adds r6, #1
_0800AB06:
	lsls r0, r6, #3
	ldrh r2, [r2]
	subs r0, r0, r2
	asrs r0, r0, #1
	mov sb, r0
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800AB2A
	movs r0, #0x1e
	subs r0, r0, r6
	asrs r0, r0, #1
	subs r7, r0, #1
	b _0800AB2E
_0800AB2A:
	movs r7, #0
	ldrsb r7, [r2, r7]
_0800AB2E:
	adds r2, r5, #0
	adds r2, #0x35
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	movs r3, #8
	mov r8, r3
	cmp r1, r0
	beq _0800AB46
	adds r2, r1, #0
	mov r8, r2
_0800AB46:
	adds r4, r6, #2
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #4
	bl sub_0804A4CC
	movs r0, #0x37
	adds r0, r0, r5
	mov sl, r0
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp, #0xc]
	mov r2, r8
	strb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, #2
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x44
	ldrb r0, [r4]
	add r0, sb
	strb r0, [r4]
	add r0, sp, #4
	adds r1, r6, #0
	bl sub_08005344
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	add r0, sp, #4
	bl sub_08005450
	add r0, sp, #4
	mov r1, sb
	bl sub_08005444
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_0800A8EC
	ldr r6, _0800AC28 @ =0x0000FFFF
	ldrh r3, [r5, #0x3e]
	cmp r3, r6
	beq _0800ABBE
	ldrh r0, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	bl sub_08004D74
_0800ABBE:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _0800AC2C @ =0x02022C60
	adds r1, r1, r0
	add r0, sp, #4
	bl sub_08005460
	bl sub_08005280
	ldrh r0, [r5, #0x3e]
	cmp r0, r6
	beq _0800AC16
	ldr r0, _0800AC30 @ =0x08BFFEF0
	adds r1, r5, #0
	bl Proc_Start
	mov r2, sl
	ldrb r1, [r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r4, [r4]
	adds r1, r4, r1
	str r1, [r0, #0x2c]
	ldr r3, [sp, #0xc]
	ldrb r1, [r3]
	adds r1, #1
	lsls r1, r1, #3
	str r1, [r0, #0x30]
	adds r3, r5, #0
	adds r3, #0x40
	adds r2, r5, #0
	adds r2, #0x42
	movs r1, #0xf
	ldrb r2, [r2]
	ands r1, r2
	lsls r1, r1, #0xc
	ldrh r3, [r3]
	orrs r1, r3
	adds r0, #0x4a
	strh r1, [r0]
_0800AC16:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AC28: .4byte 0x0000FFFF
_0800AC2C: .4byte 0x02022C60
_0800AC30: .4byte 0x08BFFEF0

	thumb_func_start sub_0800AC34
sub_0800AC34: @ 0x0800AC34
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	bge _0800AC54
	ldr r0, _0800AC50 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0800AC66
	adds r0, r1, #0
	bl sub_0800457C
	b _0800AC66
	.align 2, 0
_0800AC50: .4byte gpKeySt
_0800AC54:
	cmp r0, #0
	beq _0800AC66
	subs r0, #1
	str r0, [r1, #0x30]
	cmp r0, #0
	bne _0800AC66
	adds r0, r1, #0
	bl sub_0800457C
_0800AC66:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800AC6C
sub_0800AC6C: @ 0x0800AC6C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x38
	ldrb r1, [r5]
	lsls r0, r1, #5
	adds r7, r2, #0
	adds r7, #0x37
	ldrb r1, [r7]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _0800ACBC @ =0x02022C60
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x39
	ldrb r1, [r6]
	adds r4, r2, #0
	adds r4, #0x3a
	ldrb r2, [r4]
	movs r3, #0
	bl sub_080C0C30
	ldrb r5, [r5]
	lsls r0, r5, #5
	ldrb r7, [r7]
	adds r0, r7, r0
	lsls r0, r0, #1
	ldr r1, _0800ACC0 @ =0x02023460
	adds r0, r0, r1
	ldrb r1, [r6]
	ldrb r2, [r4]
	movs r3, #0
	bl sub_080C0C30
	movs r0, #3
	bl sub_08000FD4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800ACBC: .4byte 0x02022C60
_0800ACC0: .4byte 0x02023460

	thumb_func_start sub_0800ACC4
sub_0800ACC4: @ 0x0800ACC4
	ldr r1, _0800ACCC @ =0x03000104
	str r0, [r1]
	bx lr
	.align 2, 0
_0800ACCC: .4byte 0x03000104

	thumb_func_start sub_0800ACD0
sub_0800ACD0: @ 0x0800ACD0
	ldr r1, _0800ACD8 @ =0x03000108
	strh r0, [r1]
	bx lr
	.align 2, 0
_0800ACD8: .4byte 0x03000108

	thumb_func_start sub_0800ACDC
sub_0800ACDC: @ 0x0800ACDC
	ldr r1, _0800ACE4 @ =0x0300010C
	str r0, [r1]
	bx lr
	.align 2, 0
_0800ACE4: .4byte 0x0300010C

	thumb_func_start sub_0800ACE8
sub_0800ACE8: @ 0x0800ACE8
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #0x90
	lsls r5, r5, #2
	movs r4, #4
	str r4, [sp]
	str r3, [sp, #4]
	adds r3, r5, #0
	bl sub_0800AD04
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800AD04
sub_0800AD04: @ 0x0800AD04
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _0800AD20
	ldr r0, _0800AD1C @ =0x08BFFE90
	bl sub_080043D4
	b _0800AD28
	.align 2, 0
_0800AD1C: .4byte 0x08BFFE90
_0800AD20:
	ldr r0, _0800AD4C @ =0x08BFFE90
	movs r1, #3
	bl Proc_Start
_0800AD28:
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x36
	strb r6, [r0]
	adds r0, #0xa
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	adds r2, r1, #0
	adds r2, #0x42
	strb r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800AD4C: .4byte 0x08BFFE90

	thumb_func_start sub_0800AD50
sub_0800AD50: @ 0x0800AD50
	push {lr}
	ldr r0, _0800AD5C @ =0x08BFFE90
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_0800AD5C: .4byte 0x08BFFE90

	thumb_func_start sub_0800AD60
sub_0800AD60: @ 0x0800AD60
	push {lr}
	ldr r0, _0800AD70 @ =0x08BFFF78
	ldr r1, _0800AD74 @ =sub_0800AD78
	bl sub_08004670
	pop {r0}
	bx r0
	.align 2, 0
_0800AD70: .4byte 0x08BFFF78
_0800AD74: .4byte sub_0800AD78

	thumb_func_start sub_0800AD78
sub_0800AD78: @ 0x0800AD78
	push {lr}
	bl sub_0800E570
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800AD84
sub_0800AD84: @ 0x0800AD84
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800AD94 @ =0x08BFFEF8
	bl sub_080043D4
	pop {r0}
	bx r0
	.align 2, 0
_0800AD94: .4byte 0x08BFFEF8

	thumb_func_start sub_0800AD98
sub_0800AD98: @ 0x0800AD98
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800ADA8 @ =0x08BFFF58
	bl sub_080043D4
	pop {r0}
	bx r0
	.align 2, 0
_0800ADA8: .4byte 0x08BFFF58

	thumb_func_start sub_0800ADAC
sub_0800ADAC: @ 0x0800ADAC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800ADBC @ =0x08BFFF30
	bl sub_080043D4
	pop {r0}
	bx r0
	.align 2, 0
_0800ADBC: .4byte 0x08BFFF30

	thumb_func_start sub_0800ADC0
sub_0800ADC0: @ 0x0800ADC0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800ADD8
	adds r0, r2, #0
	bl sub_08014500
_0800ADD8:
	pop {r0}
	bx r0

	thumb_func_start sub_0800ADDC
sub_0800ADDC: @ 0x0800ADDC
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800ADF4
	adds r0, r2, #0
	bl sub_08014530
_0800ADF4:
	pop {r0}
	bx r0

	thumb_func_start sub_0800ADF8
sub_0800ADF8: @ 0x0800ADF8
	push {lr}
	bl sub_0802E834
	bl sub_0802D8A8
	bl sub_0806D52C
	ldr r0, _0800AE2C @ =0x02022C60
	movs r1, #0
	bl sub_080017E8
	ldr r0, _0800AE30 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r0, #1
	bl sub_08000FD4
	movs r0, #2
	bl sub_08000FD4
	bl sub_0800EC08
	pop {r0}
	bx r0
	.align 2, 0
_0800AE2C: .4byte 0x02022C60
_0800AE30: .4byte 0x02023460

	thumb_func_start sub_0800AE34
sub_0800AE34: @ 0x0800AE34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r0, _0800AE84 @ =0x02022C60
	movs r1, #0
	bl sub_080017E8
	ldr r0, _0800AE88 @ =0x02023460
	movs r1, #0
	bl sub_080017E8
	movs r0, #1
	bl sub_08000FD4
	movs r0, #2
	bl sub_08000FD4
	bl sub_0800EC08
	bl sub_0802E834
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800AE8C
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800AE92
	movs r0, #0x20
	adds r1, r4, #0
	bl sub_08014470
	b _0800AE92
	.align 2, 0
_0800AE84: .4byte 0x02022C60
_0800AE88: .4byte 0x02023460
_0800AE8C:
	adds r0, r4, #0
	bl sub_08014530
_0800AE92:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0800AE98
sub_0800AE98: @ 0x0800AE98
	push {lr}
	movs r1, #3
	bl sub_0800AEB0
	pop {r1}
	bx r1

	thumb_func_start sub_0800AEA4
sub_0800AEA4: @ 0x0800AEA4
	push {lr}
	bl sub_0800AEB0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800AEB0
sub_0800AEB0: @ 0x0800AEB0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r6, _0800AED8 @ =0x08BFFF78
	adds r0, r6, #0
	bl sub_08004584
	adds r4, r0, #0
	cmp r4, #0
	beq _0800AEE4
	ldr r2, _0800AEDC @ =0x03004090
	ldr r1, _0800AEE0 @ =0x03004080
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r2
	str r7, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0800B024
	.align 2, 0
_0800AED8: .4byte 0x08BFFF78
_0800AEDC: .4byte 0x03004090
_0800AEE0: .4byte 0x03004080
_0800AEE4:
	ldr r0, _0800AEFC @ =0x03004080
	strb r4, [r0]
	ldr r0, _0800AF00 @ =0x03004090
	str r4, [r0]
	cmp r5, #7
	bgt _0800AF04
	adds r0, r6, #0
	adds r1, r5, #0
	bl Proc_Start
	b _0800AF0C
	.align 2, 0
_0800AEFC: .4byte 0x03004080
_0800AF00: .4byte 0x03004090
_0800AF04:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080043D4
_0800AF0C:
	adds r4, r0, #0
	str r7, [r4, #0x2c]
	str r7, [r4, #0x30]
	movs r1, #0
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x3c]
	str r1, [r4, #0x48]
	adds r3, r4, #0
	adds r3, #0x5e
	movs r2, #0
	movs r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x50
	strh r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4c
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x68
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _0800AF70 @ =0x03002790
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0xc0
	bne _0800AF74
	adds r0, r2, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800AF74
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	b _0800AF7A
	.align 2, 0
_0800AF70: .4byte 0x03002790
_0800AF74:
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #0
_0800AF7A:
	strb r0, [r1]
	ldr r0, _0800AF9C @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0]
	subs r0, #0x84
	cmp r0, #7
	bhi _0800B024
	lsls r0, r0, #2
	ldr r1, _0800AFA0 @ =_0800AFA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800AF9C: .4byte 0x0202E3F0
_0800AFA0: .4byte _0800AFA4
_0800AFA4: @ jump table
	.4byte _0800AFD2 @ case 0
	.4byte _0800AFE0 @ case 1
	.4byte _0800AFEE @ case 2
	.4byte _0800B024 @ case 3
	.4byte _0800AFC4 @ case 4
	.4byte _0800AFFC @ case 5
	.4byte _0800B00A @ case 6
	.4byte _0800B018 @ case 7
_0800AFC4:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800E60C
	b _0800B024
_0800AFD2:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800E570
	b _0800B024
_0800AFE0:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800E598
	b _0800B024
_0800AFEE:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800E5C0
	b _0800B024
_0800AFFC:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800E628
	b _0800B024
_0800B00A:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800E65C
	b _0800B024
_0800B018:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800E698
_0800B024:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800B02C
sub_0800B02C: @ 0x0800B02C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08015784
	movs r0, #0
	str r0, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800B040
sub_0800B040: @ 0x0800B040
	push {lr}
	bl sub_08015794
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800B04C
sub_0800B04C: @ 0x0800B04C
	push {lr}
	adds r0, #0x5e
	movs r1, #0x10
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800B068
	movs r0, #0
	bl sub_08005320
	bl sub_08005904
	bl sub_0804A9F8
_0800B068:
	pop {r0}
	bx r0

	thumb_func_start sub_0800B06C
sub_0800B06C: @ 0x0800B06C
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B0B0 @ =0x0000FFFB
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	ldr r3, _0800B0B4 @ =0x03004080
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800B0AA
	subs r0, #1
	strb r0, [r3]
	movs r0, #0
	str r0, [r2, #0x40]
	ldr r1, _0800B0B8 @ =0x03004090
	ldrb r4, [r3]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x2c]
	ldrb r3, [r3]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x30]
	adds r0, r2, #0
	movs r1, #0
	bl sub_080045FC
_0800B0AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0B0: .4byte 0x0000FFFB
_0800B0B4: .4byte 0x03004080
_0800B0B8: .4byte 0x03004090

	thumb_func_start sub_0800B0BC
sub_0800B0BC: @ 0x0800B0BC
	push {lr}
	adds r0, #0x5e
	movs r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800B0CE
	bl sub_0802E87C
_0800B0CE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800B0D4
sub_0800B0D4: @ 0x0800B0D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08014900
	ldr r0, _0800B0FC @ =0x08BFFD4C
	bl sub_08004748
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B0F4
	bl sub_0806E930
_0800B0F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0FC: .4byte 0x08BFFD4C

	thumb_func_start sub_0800B100
sub_0800B100: @ 0x0800B100
	push {lr}
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B124
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800B124
	bl sub_0804B9C8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B124
	movs r0, #1
	b _0800B126
_0800B124:
	movs r0, #0
_0800B126:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800B12C
sub_0800B12C: @ 0x0800B12C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0800B144 @ =0x08C00018
	bl sub_080043D4
	str r5, [r0, #0x50]
	str r4, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B144: .4byte 0x08C00018

	thumb_func_start sub_0800B148
sub_0800B148: @ 0x0800B148
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0800B188
	adds r4, #0x64
	movs r0, #0x40
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0800B15C
sub_0800B15C: @ 0x0800B15C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x50]
	bl sub_0800B200
	ldr r0, _0800B184 @ =0x03002790
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800B17C
	ldr r0, [r4, #0x4c]
	bl _call_via_r5
	adds r0, r4, #0
	bl sub_0800457C
_0800B17C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B184: .4byte 0x03002790

	thumb_func_start sub_0800B188
sub_0800B188: @ 0x0800B188
	push {r4, r5, r6, lr}
	ldr r1, _0800B1F8 @ =0x03002790
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r5, #0
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	ldr r1, _0800B1FC @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x66
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B1F8: .4byte 0x03002790
_0800B1FC: .4byte 0x0000FFE0

	thumb_func_start sub_0800B200
sub_0800B200: @ 0x0800B200
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800B218 @ =0x03002790
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _0800B21C
	adds r0, r2, #0
	bl sub_08004460
	b _0800B240
	.align 2, 0
_0800B218: .4byte 0x03002790
_0800B21C:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0800B23A
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0800B23A:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_0800B240:
	pop {r0}
	bx r0

	thumb_func_start sub_0800B244
sub_0800B244: @ 0x0800B244
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0800B25A
	bl _call_via_r0
_0800B25A:
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	bl sub_0800A378
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B2AE
	bl sub_080B6464
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B284
	adds r0, r4, #0
	bl sub_0800B0D4
	subs r5, #0x11
	b _0800B2AA
_0800B284:
	movs r0, #0x20
	ldrh r5, [r5]
	ands r0, r5
	adds r5, r4, #0
	adds r5, #0x4d
	cmp r0, #0
	bne _0800B2AA
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0800B2A2
	adds r0, r4, #0
	bl sub_0800B0D4
	b _0800B2AA
_0800B2A2:
	ldr r0, _0800B2C8 @ =sub_0800B0D4
	adds r1, r4, #0
	bl sub_0800B12C
_0800B2AA:
	movs r0, #1
	strb r0, [r5]
_0800B2AE:
	movs r0, #5
	bl sub_080046C4
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B2C0
	adds r0, r4, #0
	bl _call_via_r1
_0800B2C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B2C8: .4byte sub_0800B0D4

	thumb_func_start sub_0800B2CC
sub_0800B2CC: @ 0x0800B2CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0800B314 @ =0x08C05CA0
	bl sub_08004584
	cmp r0, #0
	bne _0800B3D0
	bl sub_08032CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B3D0
	bl sub_0801DA38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B3D0
	adds r0, r4, #0
	bl sub_0800B100
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B31C
	ldr r0, _0800B318 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800B31C
	adds r0, r4, #0
	bl sub_0800B244
	b _0800B3D0
	.align 2, 0
_0800B314: .4byte 0x08C05CA0
_0800B318: .4byte gpKeySt
_0800B31C:
	adds r3, r4, #0
	adds r3, #0x50
	ldrh r2, [r3]
	cmp r2, #0
	beq _0800B378
	subs r5, r2, #1
	strh r5, [r3]
	adds r0, r4, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B3D0
	ldr r0, _0800B370 @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0800B34E
	ldr r0, _0800B374 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0800B3D0
_0800B34E:
	lsls r0, r5, #0x10
	cmp r0, #0
	beq _0800B3D0
	subs r0, r2, #2
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B3D0
	subs r0, r2, #3
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B3D0
	subs r0, r2, #4
	strh r0, [r3]
	b _0800B3D0
	.align 2, 0
_0800B370: .4byte gPlaySt
_0800B374: .4byte gpKeySt
_0800B378:
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B386
	adds r0, r4, #0
	bl _call_via_r1
	b _0800B3D0
_0800B386:
	adds r6, r4, #0
	adds r6, #0x56
	ldr r7, _0800B3A4 @ =0x08C00038
	adds r0, r7, #4
	mov r8, r0
_0800B390:
	ldr r0, [r4, #0x30]
	ldrh r5, [r0]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0800B3A8
	subs r0, #1
	strh r0, [r6]
	movs r2, #0
	b _0800B3B6
	.align 2, 0
_0800B3A4: .4byte 0x08C00038
_0800B3A8:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r2, r0, #0
_0800B3B6:
	cmp r2, #1
	beq _0800B390
	cmp r2, #3
	beq _0800B3D0
	lsls r0, r5, #3
	add r0, r8
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	cmp r2, #2
	bne _0800B390
_0800B3D0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800B3DC
sub_0800B3DC: @ 0x0800B3DC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B3F8
	bl sub_08009E48
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B3FE
_0800B3F8:
	adds r0, r4, #0
	bl sub_0800457C
_0800B3FE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0800B404
sub_0800B404: @ 0x0800B404
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrh r2, [r0, #2]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B41C
	movs r0, #0
	b _0800B430
_0800B41C:
	cmp r2, #0
	ble _0800B422
	subs r2, #1
_0800B422:
	adds r0, r3, #0
	adds r0, #0x50
	movs r1, #0
	strh r2, [r0]
	subs r0, #2
	strb r1, [r0]
	movs r0, #2
_0800B430:
	bx lr
	.align 2, 0

	thumb_func_start sub_0800B434
sub_0800B434: @ 0x0800B434
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrh r2, [r0, #2]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B44C
	movs r0, #0
	b _0800B462
_0800B44C:
	cmp r2, #0
	ble _0800B452
	subs r2, #1
_0800B452:
	adds r0, r3, #0
	adds r0, #0x50
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r0, #1
	strb r0, [r1]
	movs r0, #2
_0800B462:
	bx lr

	thumb_func_start sub_0800B464
sub_0800B464: @ 0x0800B464
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r2, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	bne _0800B480
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0800B484
_0800B480:
	movs r0, #0
	b _0800B492
_0800B484:
	cmp r1, #0
	ble _0800B48A
	subs r1, #1
_0800B48A:
	adds r0, r2, #0
	adds r0, #0x50
	strh r1, [r0]
	movs r0, #2
_0800B492:
	bx lr

	thumb_func_start sub_0800B494
sub_0800B494: @ 0x0800B494
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B4AE
	movs r0, #0
	b _0800B4EA
_0800B4AE:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B4C6
	bl sub_0802D874
	bl sub_0806D51C
_0800B4C6:
	adds r0, r5, #0
	bl sub_0800B72C
	strb r5, [r4]
	ldr r2, _0800B4F0 @ =0x03002790
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
	movs r0, #2
_0800B4EA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800B4F0: .4byte 0x03002790

	thumb_func_start sub_0800B4F4
sub_0800B4F4: @ 0x0800B4F4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800B51C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031A5C
	adds r0, #0x91
	ldrb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B520
	movs r0, #0
	b _0800B56E
	.align 2, 0
_0800B51C: .4byte gPlaySt
_0800B520:
	bl sub_0807FC04
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B534
	movs r0, #0x2c
	bl sub_0800394C
	bl sub_0807FC14
_0800B534:
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B54A
	bl sub_0802D874
	bl sub_0806D51C
_0800B54A:
	adds r0, r5, #0
	bl sub_0800B72C
	strb r5, [r4]
	ldr r2, _0800B574 @ =0x03002790
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
	movs r0, #2
_0800B56E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800B574: .4byte 0x03002790

	thumb_func_start sub_0800B578
sub_0800B578: @ 0x0800B578
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B5A4
	bl RandNextB
	movs r1, #0x5b
	bl __umodsi3
	adds r4, r0, #0
	bl sub_0800B72C
	adds r0, r5, #0
	adds r0, #0x4c
	strb r4, [r0]
	movs r0, #2
	b _0800B5A6
_0800B5A4:
	movs r0, #0
_0800B5A6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800B5AC
sub_0800B5AC: @ 0x0800B5AC
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B5C6
	movs r0, #0
	b _0800B5E8
_0800B5C6:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B5DE
	bl sub_0802D874
	bl sub_0806D51C
_0800B5DE:
	adds r0, r5, #0
	bl sub_0800B7BC
	strb r5, [r4]
	movs r0, #2
_0800B5E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800B5F0
sub_0800B5F0: @ 0x0800B5F0
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800B610
	adds r0, r2, #0
	bl sub_0800AD84
	movs r0, #0xff
	strb r0, [r4]
	b _0800B630
_0800B610:
	adds r0, r2, #0
	bl sub_0800EBBC
	ldr r2, _0800B638 @ =0x03002790
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
_0800B630:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800B638: .4byte 0x03002790

	thumb_func_start sub_0800B63C
sub_0800B63C: @ 0x0800B63C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _0800B654
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B658
_0800B654:
	movs r0, #0
	b _0800B670
_0800B658:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0800B66E
	adds r0, r4, #0
	bl sub_0800AD98
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0xff
	strb r0, [r1]
_0800B66E:
	movs r0, #2
_0800B670:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800B678
sub_0800B678: @ 0x0800B678
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, r6
	beq _0800B694
	bl sub_0802D8A8
	bl sub_0806D52C
_0800B694:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800B6C0
	ldr r0, _0800B6BC @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031A5C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800B700
	adds r0, r4, #0
	bl sub_0800AD98
	b _0800B700
	.align 2, 0
_0800B6BC: .4byte gPlaySt
_0800B6C0:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, r6
	bne _0800B6E8
	ldr r0, _0800B6E4 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031A5C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800B700
	adds r0, r4, #0
	bl sub_08014500
	b _0800B700
	.align 2, 0
_0800B6E4: .4byte gPlaySt
_0800B6E8:
	ldr r0, _0800B708 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031A5C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800B700
	adds r0, r4, #0
	bl sub_0800AD98
_0800B700:
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800B708: .4byte gPlaySt

	thumb_func_start sub_0800B70C
sub_0800B70C: @ 0x0800B70C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802D874
	bl sub_0806D51C
	adds r0, r4, #0
	bl sub_0800AD84
	adds r4, #0x4c
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800B72C
sub_0800B72C: @ 0x0800B72C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_0800EC08
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	ldr r5, _0800B7B0 @ =0x08C00798
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r6, [r0]
	movs r0, #3
	bl sub_08001370
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl sub_08013688
	ldr r0, _0800B7B4 @ =0x02024460
	adds r1, r5, #4
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl sub_080C0C28
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl sub_0800105C
	movs r0, #8
	bl sub_08000FD4
	ldr r1, _0800B7B8 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B7B0: .4byte 0x08C00798
_0800B7B4: .4byte 0x02024460
_0800B7B8: .4byte 0x02022860

	thumb_func_start sub_0800B7BC
sub_0800B7BC: @ 0x0800B7BC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	ldr r5, _0800B83C @ =0x08C00798
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r6, [r0]
	movs r0, #3
	bl sub_08001370
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl sub_08013688
	ldr r0, _0800B840 @ =0x02024460
	adds r1, r5, #4
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl sub_080C0C28
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	bl sub_0800105C
	movs r0, #8
	bl sub_08000FD4
	ldr r1, _0800B844 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B83C: .4byte 0x08C00798
_0800B840: .4byte 0x02024460
_0800B844: .4byte 0x02022860

	thumb_func_start sub_0800B848
sub_0800B848: @ 0x0800B848
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _0800B85E
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_08007C88
_0800B85E:
	adds r3, r5, #0
	adds r3, #0x68
	movs r0, #0xff
	strb r0, [r3]
	adds r4, r5, #0
	adds r4, #0x5e
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B890
	ldr r2, _0800B8C4 @ =gPlaySt
	adds r2, #0x40
	ldrb r1, [r2]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1e
	strb r0, [r3]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
_0800B890:
	movs r0, #1
	movs r1, #1
	adds r2, r6, #0
	bl sub_08007EAC
	movs r0, #0x80
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B8AA
	movs r0, #4
	bl sub_08007F24
_0800B8AA:
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0800B8BA
	movs r0, #8
	bl sub_08007F24
_0800B8BA:
	ldr r0, _0800B8C8 @ =sub_0800BCF0
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B8C4: .4byte gPlaySt
_0800B8C8: .4byte sub_0800BCF0

	thumb_func_start sub_0800B8CC
sub_0800B8CC: @ 0x0800B8CC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B8F4 @ =0x0000FFFD
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B8F8
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #1
	bl sub_0800B848
	movs r0, #2
	b _0800B8FA
	.align 2, 0
_0800B8F4: .4byte 0x0000FFFD
_0800B8F8:
	movs r0, #0
_0800B8FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800B900
sub_0800B900: @ 0x0800B900
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B930 @ =0x0000FFFD
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B934
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #1
	bl sub_0800B848
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_08007F24
	movs r0, #2
	b _0800B936
	.align 2, 0
_0800B930: .4byte 0x0000FFFD
_0800B934:
	movs r0, #0
_0800B936:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800B93C
sub_0800B93C: @ 0x0800B93C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800B958 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800B95C
	movs r0, #0
	b _0800B98E
	.align 2, 0
_0800B958: .4byte 0x0000FFFD
_0800B95C:
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_08007C88
	ldr r0, _0800B97C @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800B980
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
	b _0800B98C
	.align 2, 0
_0800B97C: .4byte gPlaySt
_0800B980:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
_0800B98C:
	movs r0, #2
_0800B98E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800B994
sub_0800B994: @ 0x0800B994
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B9B2
	ldr r0, [r2, #0x30]
	ldr r0, [r0, #4]
	bl sub_08007F38
	movs r0, #2
	b _0800B9B4
_0800B9B2:
	movs r0, #0
_0800B9B4:
	pop {r1}
	bx r1

	thumb_func_start sub_0800B9B8
sub_0800B9B8: @ 0x0800B9B8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B9E0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800B9E0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl sub_0800B848
	movs r0, #2
	b _0800B9E2
_0800B9E0:
	movs r0, #0
_0800B9E2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800B9E8
sub_0800B9E8: @ 0x0800B9E8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BA00
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BA04
_0800BA00:
	movs r0, #0
	b _0800BA2E
_0800BA04:
	ldr r0, _0800BA1C @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800BA20
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl sub_0800B848
	b _0800BA2C
	.align 2, 0
_0800BA1C: .4byte gPlaySt
_0800BA20:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #8]
	adds r0, r2, #0
	movs r2, #0
	bl sub_0800B848
_0800BA2C:
	movs r0, #2
_0800BA2E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800BA34
sub_0800BA34: @ 0x0800BA34
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BA54
	ldr r1, [r2, #0x48]
	adds r0, r2, #0
	movs r2, #1
	bl sub_0800B848
	movs r0, #2
	b _0800BA56
_0800BA54:
	movs r0, #0
_0800BA56:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800BA5C
sub_0800BA5C: @ 0x0800BA5C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BA80
	bl sub_0800836C
	ldr r0, _0800BA7C @ =sub_0800BCF0
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800BA86
	.align 2, 0
_0800BA7C: .4byte sub_0800BCF0
_0800BA80:
	bl sub_08007EF8
	movs r0, #0
_0800BA86:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BA8C
sub_0800BA8C: @ 0x0800BA8C
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800BAC4 @ =0x0000FFFD
	ldrh r4, [r1]
	ands r0, r4
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BACC
	ldr r0, _0800BAC8 @ =0x030045B0
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #1
	bl sub_0800B848
	movs r0, #2
	b _0800BACE
	.align 2, 0
_0800BAC4: .4byte 0x0000FFFD
_0800BAC8: .4byte 0x030045B0
_0800BACC:
	movs r0, #0
_0800BACE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BAD4
sub_0800BAD4: @ 0x0800BAD4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BAF4 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BAF8
	movs r0, #0
	b _0800BB5E
	.align 2, 0
_0800BAF4: .4byte 0x0000FFFD
_0800BAF8:
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #4
	bhi _0800BB3C
	lsls r0, r0, #2
	ldr r1, _0800BB0C @ =_0800BB10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BB0C: .4byte _0800BB10
_0800BB10: @ jump table
	.4byte _0800BB24 @ case 0
	.4byte _0800BB2A @ case 1
	.4byte _0800BB30 @ case 2
	.4byte _0800BB36 @ case 3
	.4byte _0800BB3C @ case 4
_0800BB24:
	bl sub_080B7100
	b _0800BB40
_0800BB2A:
	bl sub_080B71F8
	b _0800BB40
_0800BB30:
	bl sub_080B7230
	b _0800BB40
_0800BB36:
	bl sub_080B7328
	b _0800BB40
_0800BB3C:
	bl sub_080B735C
_0800BB40:
	movs r1, #0
	cmp r0, #2
	bgt _0800BB4E
	movs r1, #1
	cmp r0, #1
	bgt _0800BB4E
	movs r1, #2
_0800BB4E:
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
	movs r0, #2
_0800BB5E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BB64
sub_0800BB64: @ 0x0800BB64
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BB80 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BB84
	movs r0, #0
	b _0800BBAA
	.align 2, 0
_0800BB80: .4byte 0x0000FFFD
_0800BB84:
	bl sub_0807AE3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BB9C
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
	b _0800BBA8
_0800BB9C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
_0800BBA8:
	movs r0, #2
_0800BBAA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BBB0
sub_0800BBB0: @ 0x0800BBB0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BBC8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BBCC
_0800BBC8:
	movs r0, #0
	b _0800BBF2
_0800BBCC:
	bl sub_0807AE3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BBE4
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #0
	bl sub_0800B848
	b _0800BBF0
_0800BBE4:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl sub_0800B848
_0800BBF0:
	movs r0, #2
_0800BBF2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BBF8
sub_0800BBF8: @ 0x0800BBF8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BC14 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BC18
	movs r0, #0
	b _0800BC42
	.align 2, 0
_0800BC14: .4byte 0x0000FFFD
_0800BC18:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl sub_0807A0C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BC34
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
	b _0800BC40
_0800BC34:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
_0800BC40:
	movs r0, #2
_0800BC42:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BC48
sub_0800BC48: @ 0x0800BC48
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BC64 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BC68
	movs r0, #0
	b _0800BC92
	.align 2, 0
_0800BC64: .4byte 0x0000FFFD
_0800BC68:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BC84
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
	b _0800BC90
_0800BC84:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl sub_0800B848
_0800BC90:
	movs r0, #2
_0800BC92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BC98
sub_0800BC98: @ 0x0800BC98
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BCB0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BCB4
_0800BCB0:
	movs r0, #0
	b _0800BCDE
_0800BCB4:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BCD0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl sub_0800B848
	b _0800BCDC
_0800BCD0:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #0
	bl sub_0800B848
_0800BCDC:
	movs r0, #2
_0800BCDE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BCE4
sub_0800BCE4: @ 0x0800BCE4
	push {lr}
	bl sub_080095E4
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800BCF0
sub_0800BCF0: @ 0x0800BCF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0800BD3C
	bl sub_08007EF8
	adds r3, r4, #0
	adds r3, #0x68
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BD30
	ldr r2, _0800BD38 @ =gPlaySt
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0800BD30:
	movs r0, #0
	str r0, [r4, #0x40]
	b _0800BD78
	.align 2, 0
_0800BD38: .4byte gPlaySt
_0800BD3C:
	bl sub_08009E30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD50
	bl sub_08008354
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD78
_0800BD50:
	adds r3, r4, #0
	adds r3, #0x68
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BD76
	ldr r2, _0800BD80 @ =gPlaySt
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0800BD76:
	str r5, [r4, #0x40]
_0800BD78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD80: .4byte gPlaySt

	thumb_func_start sub_0800BD84
sub_0800BD84: @ 0x0800BD84
	push {r4, r5, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	movs r0, #0xff
	ldrh r4, [r1, #2]
	ands r4, r0
	ldrb r5, [r1, #3]
	ands r5, r0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BDB2
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BDE0
_0800BDB2:
	add r3, sp, #4
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl sub_08016080
	ldr r1, _0800BDDC @ =0x0202BBB4
	ldr r0, [sp]
	lsls r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08015F0C
	bl sub_080198EC
	movs r0, #0
	b _0800BDF4
	.align 2, 0
_0800BDDC: .4byte 0x0202BBB4
_0800BDE0:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080160D4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08015F0C
	movs r0, #2
_0800BDF4:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BDFC
sub_0800BDFC: @ 0x0800BDFC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	movs r0, #0xff
	ldrh r4, [r1, #2]
	ands r4, r0
	ldrb r5, [r1, #3]
	ands r5, r0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BE28
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BE50
_0800BE28:
	adds r6, r4, #0
	lsls r0, r6, #4
	bl sub_08015D10
	ldr r4, _0800BE4C @ =0x0202BBB4
	strh r0, [r4, #0xc]
	lsls r0, r5, #4
	bl sub_08015D54
	strh r0, [r4, #0xe]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08015F0C
	bl sub_080198EC
	movs r0, #0
	b _0800BE64
	.align 2, 0
_0800BE4C: .4byte 0x0202BBB4
_0800BE50:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0801615C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08015F0C
	movs r0, #2
_0800BE64:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800BE6C
sub_0800BE6C: @ 0x0800BE6C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldrh r0, [r0, #2]
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BE96
	adds r0, r6, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BEC4
_0800BE96:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl sub_08015D10
	ldr r4, _0800BEE8 @ =0x0202BBB4
	strh r0, [r4, #0xc]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl sub_08015D54
	strh r0, [r4, #0xe]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl sub_08015F0C
	bl sub_080198EC
	bl sub_080198EC
_0800BEC4:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r6, #0
	bl sub_0801615C
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl sub_08015F0C
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800BEE8: .4byte 0x0202BBB4

	thumb_func_start sub_0800BEEC
sub_0800BEEC: @ 0x0800BEEC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_0801615C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl sub_08015F0C
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BF1C
sub_0800BF1C: @ 0x0800BF1C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800BF4C
	ldr r0, _0800BF5C @ =0x08C020F4
	bl sub_08004584
	cmp r0, #0
	bne _0800BF60
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0801615C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BF60
_0800BF4C:
	bl sub_0806D5EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BF60
	movs r0, #1
	b _0800BF62
	.align 2, 0
_0800BF5C: .4byte 0x08C020F4
_0800BF60:
	movs r0, #0
_0800BF62:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0800BF68
sub_0800BF68: @ 0x0800BF68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800BF94
	ldr r0, _0800BF90 @ =0x0000FFFF
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _0800BF9A
	.align 2, 0
_0800BF90: .4byte 0x0000FFFF
_0800BF94:
	movs r4, #1
	rsbs r4, r4, #0
	mov r8, r4
_0800BF9A:
	ldr r1, [r5, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r4, #1
	rsbs r4, r4, #0
	mov sl, r4
	cmp r0, #0
	bne _0800BFB2
	mov sl, r2
_0800BFB2:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800BFC8
	ldr r7, _0800BFC4 @ =0x0000FFFF
	ands r7, r2
	b _0800BFCC
	.align 2, 0
_0800BFC4: .4byte 0x0000FFFF
_0800BFC8:
	movs r7, #1
	rsbs r7, r7, #0
_0800BFCC:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, #0
	bne _0800BFE0
	mov sb, r1
_0800BFE0:
	ldr r0, _0800BFFC @ =0x0202E3D8
	ldr r1, [r0]
	mov r4, sl
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C000
	movs r0, #0
	b _0800C05A
	.align 2, 0
_0800BFFC: .4byte 0x0202E3D8
_0800C000:
	ldrb r0, [r1]
	bl GetUnit
	adds r6, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C022
	adds r0, r5, #0
	adds r0, #0x4d
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq _0800C036
_0800C022:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sb
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C05A
_0800C036:
	adds r0, r5, #0
	mov r1, r8
	mov r2, sl
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C058
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, sb
	bl sub_0800CA84
	movs r0, #0
	b _0800C05A
_0800C058:
	movs r0, #3
_0800C05A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800C06C
sub_0800C06C: @ 0x0800C06C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C094
	ldr r7, _0800C090 @ =0x0000FFFF
	ands r7, r1
	b _0800C098
	.align 2, 0
_0800C090: .4byte 0x0000FFFF
_0800C094:
	movs r7, #1
	rsbs r7, r7, #0
_0800C098:
	ldr r1, [r4, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	mov sb, r5
	cmp r0, #0
	bne _0800C0B0
	mov sb, r2
_0800C0B0:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800C0C4
	ldr r6, _0800C0C0 @ =0x0000FFFF
	ands r6, r2
	b _0800C0C8
	.align 2, 0
_0800C0C0: .4byte 0x0000FFFF
_0800C0C4:
	movs r6, #1
	rsbs r6, r6, #0
_0800C0C8:
	ldrh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	cmp r0, #0
	bne _0800C0DC
	mov r8, r2
_0800C0DC:
	ldrh r1, [r1, #0xc]
	mov sl, r1
	ldr r0, _0800C0F8 @ =0x0202E3D8
	ldr r1, [r0]
	mov r5, sb
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C0FC
	movs r0, #0
	b _0800C15A
	.align 2, 0
_0800C0F8: .4byte 0x0202E3D8
_0800C0FC:
	ldrb r0, [r1]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C120
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C134
_0800C120:
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C15A
_0800C134:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C158
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_0800CA84
	movs r0, #0
	b _0800C15A
_0800C158:
	movs r0, #3
_0800C15A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800C16C
sub_0800C16C: @ 0x0800C16C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C198
	ldr r7, _0800C194 @ =0x0000FFFF
	ands r7, r1
	b _0800C19C
	.align 2, 0
_0800C194: .4byte 0x0000FFFF
_0800C198:
	movs r7, #1
	rsbs r7, r7, #0
_0800C19C:
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	cmp r0, #0
	bne _0800C1B2
	mov r8, r1
_0800C1B2:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C1CC
	adds r0, r4, #0
	adds r0, #0x4d
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0800C1E0
_0800C1CC:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C208
_0800C1E0:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C206
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_0800CA84
	movs r0, #0
	b _0800C208
_0800C206:
	movs r0, #3
_0800C208:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C214
sub_0800C214: @ 0x0800C214
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C240
	ldr r6, _0800C23C @ =0x0000FFFF
	ands r6, r1
	b _0800C244
	.align 2, 0
_0800C23C: .4byte 0x0000FFFF
_0800C240:
	movs r6, #1
	rsbs r6, r6, #0
_0800C244:
	ldr r2, [r4, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800C258
	adds r7, r1, #0
_0800C258:
	ldrh r2, [r2, #0xc]
	mov r8, r2
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C278
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C28C
_0800C278:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C2B6
_0800C28C:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C2B4
	mov r0, r8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_0800CA84
	movs r0, #0
	b _0800C2B6
_0800C2B4:
	movs r0, #3
_0800C2B6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800C2C4
sub_0800C2C4: @ 0x0800C2C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r7, #0x30]
	ldr r1, [r0, #8]
	ldrh r0, [r0, #0xc]
	mov r8, r0
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	cmp r1, #1
	beq _0800C304
	cmp r1, #1
	bgt _0800C2F6
	cmp r1, #0
	beq _0800C300
	b _0800C30E
_0800C2F6:
	cmp r1, #2
	beq _0800C308
	cmp r1, #3
	beq _0800C30C
	b _0800C30E
_0800C300:
	subs r5, #1
	b _0800C30E
_0800C304:
	adds r5, #1
	b _0800C30E
_0800C308:
	subs r4, #1
	b _0800C30E
_0800C30C:
	adds r4, #1
_0800C30E:
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C32A
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C33E
_0800C32A:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C368
_0800C33E:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r7, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C366
	mov r0, r8
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0800CA84
	movs r0, #0
	b _0800C368
_0800C366:
	movs r0, #3
_0800C368:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C374
sub_0800C374: @ 0x0800C374
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C3A4
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C3CE
_0800C3A4:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	add r1, sp, #4
	mov r0, sp
	adds r2, r6, #0
	bl sub_0806D53C
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C3F4
_0800C3CE:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C3F2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_0800CB6C
	movs r0, #0
	b _0800C3F4
_0800C3F2:
	movs r0, #3
_0800C3F4:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C3FC
sub_0800C3FC: @ 0x0800C3FC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C41C
	ldr r0, _0800C418 @ =0x0000FFFF
	ands r1, r0
	str r1, [sp]
	b _0800C422
	.align 2, 0
_0800C418: .4byte 0x0000FFFF
_0800C41C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
_0800C422:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C434
	str r3, [sp, #4]
	b _0800C43A
_0800C434:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C43A:
	ldr r6, [r1, #8]
	ldr r0, _0800C490 @ =0x0202E3D8
	ldr r1, [r0]
	ldr r0, [sp, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C470
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C494
_0800C470:
	add r1, sp, #4
	mov r0, sp
	adds r2, r6, #0
	bl sub_0806D53C
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C4B6
	.align 2, 0
_0800C490: .4byte 0x0202E3D8
_0800C494:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C4B4
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_0800CB6C
	movs r0, #0
	b _0800C4B6
_0800C4B4:
	movs r0, #3
_0800C4B6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800C4C0
sub_0800C4C0: @ 0x0800C4C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r7, #0x10
	ldrsb r7, [r4, r7]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C504
	adds r0, r5, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800C518
_0800C504:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C540
_0800C518:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C53E
	str r6, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_0800CA84
	movs r0, #0
	b _0800C540
_0800C53E:
	movs r0, #3
_0800C540:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C54C
sub_0800C54C: @ 0x0800C54C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C578
	ldr r7, _0800C574 @ =0x0000FFFF
	ands r7, r1
	b _0800C57C
	.align 2, 0
_0800C574: .4byte 0x0000FFFF
_0800C578:
	movs r7, #1
	rsbs r7, r7, #0
_0800C57C:
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	cmp r0, #0
	bne _0800C592
	mov r8, r1
_0800C592:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C5AC
	adds r0, r4, #0
	adds r0, #0x4d
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0800C5C0
_0800C5AC:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	b _0800C5E8
_0800C5C0:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C5E6
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_0800CA84
	movs r0, #0
	b _0800C5E8
_0800C5E6:
	movs r0, #3
_0800C5E8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C5F4
sub_0800C5F4: @ 0x0800C5F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl sub_0807A7B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x30]
	ldr r6, _0800C630 @ =0x0000FFFF
	ldrh r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C634
	ands r1, r6
	str r1, [sp, #4]
	b _0800C63A
	.align 2, 0
_0800C630: .4byte 0x0000FFFF
_0800C634:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C63A:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C64C
	str r3, [sp, #8]
	b _0800C652
_0800C64C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
_0800C652:
	ldrh r0, [r1, #6]
	mov sb, r0
	ldr r7, [r1, #0xc]
	mov r1, r8
	lsls r0, r1, #0x18
	adds r6, r0, #0
	cmp r6, #0
	beq _0800C67A
	ldr r1, [sp, #4]
	cmp r1, #0x63
	beq _0800C6FC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _0800C67A
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #8]
	cmp r0, r1
	beq _0800C6FC
_0800C67A:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C696
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C6C2
_0800C696:
	cmp r6, #0
	bne _0800C6B0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #8]
	add r1, sp, #8
	add r0, sp, #4
	adds r2, r7, #0
	bl sub_0806D53C
_0800C6B0:
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0800C9F8
	bl sub_08025BB0
	b _0800C6FC
_0800C6C2:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C6DA
	movs r0, #3
	b _0800C6FE
_0800C6DA:
	cmp r6, #0
	beq _0800C6F0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800CA84
	b _0800C6FC
_0800C6F0:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_0800CB6C
_0800C6FC:
	movs r0, #0
_0800C6FE:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C70C
sub_0800C70C: @ 0x0800C70C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl sub_0807A7B4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	mov r8, r1
	ldr r7, [r0, #0xc]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C750
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C788
_0800C750:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	cmp r6, #0
	bne _0800C76C
	add r1, sp, #4
	mov r0, sp
	adds r2, r7, #0
	bl sub_0806D53C
	b _0800C776
_0800C76C:
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl sub_0806D53C
_0800C776:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0800C9F8
	bl sub_08025BB0
	b _0800C7BE
_0800C788:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C7A0
	movs r0, #3
	b _0800C7C0
_0800C7A0:
	cmp r6, #0
	beq _0800C7B2
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	movs r3, #0
	bl sub_0800CB6C
	b _0800C7BE
_0800C7B2:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_0800CB6C
_0800C7BE:
	movs r0, #0
_0800C7C0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C7CC
sub_0800C7CC: @ 0x0800C7CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C7EC
	ldr r0, _0800C7E8 @ =0x0202E3D8
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	b _0800C7F2
	.align 2, 0
_0800C7E8: .4byte 0x0202E3D8
_0800C7EC:
	ldr r0, _0800C80C @ =0x0202E3D8
	ldr r0, [r0]
	subs r0, #4
_0800C7F2:
	ldr r1, [r0]
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C814
	ldr r0, _0800C810 @ =0x0000FFFF
	ands r2, r0
	adds r0, r1, r2
	b _0800C816
	.align 2, 0
_0800C80C: .4byte 0x0202E3D8
_0800C810: .4byte 0x0000FFFF
_0800C814:
	subs r0, r1, #1
_0800C816:
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _0800C860
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C83C
	ldr r3, _0800C838 @ =0x0000FFFF
	ands r3, r2
	b _0800C840
	.align 2, 0
_0800C838: .4byte 0x0000FFFF
_0800C83C:
	movs r3, #1
	rsbs r3, r3, #0
_0800C840:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C852
	adds r2, r1, #0
_0800C852:
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
_0800C860:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C868
sub_0800C868: @ 0x0800C868
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C890
	ldr r1, _0800C88C @ =0x0000FFFF
	ands r1, r2
	b _0800C894
	.align 2, 0
_0800C88C: .4byte 0x0000FFFF
_0800C890:
	movs r1, #1
	rsbs r1, r1, #0
_0800C894:
	ldr r0, [r4, #0x30]
	ldrh r3, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C8A8
	adds r2, r3, #0
_0800C8A8:
	adds r0, r5, #0
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800C8BC
sub_0800C8BC: @ 0x0800C8BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800C8F0
	bl GetPlayerLeaderUnitId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C91C
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, _0800C8EC @ =gPlaySt
	ldrb r2, [r0, #0x1b]
	b _0800C90C
	.align 2, 0
_0800C8EC: .4byte gPlaySt
_0800C8F0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C91C
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
_0800C90C:
	ldr r0, _0800C924 @ =0x0202A5A6
	adds r0, r2, r0
	ldrb r1, [r3, #0x10]
	strb r1, [r0]
	ldr r0, _0800C928 @ =0x0202A5AA
	adds r0, r2, r0
	ldrb r1, [r3, #0x11]
	strb r1, [r0]
_0800C91C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800C924: .4byte 0x0202A5A6
_0800C928: .4byte 0x0202A5AA

	thumb_func_start sub_0800C92C
sub_0800C92C: @ 0x0800C92C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800C964
	bl GetPlayerLeaderUnitId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C9B8
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, _0800C960 @ =gPlaySt
	ldrb r3, [r0, #0x1b]
	b _0800C980
	.align 2, 0
_0800C960: .4byte gPlaySt
_0800C964:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C9B8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r3, [r0, #8]
_0800C980:
	ldr r0, _0800C9BC @ =0x0202A5A6
	adds r0, r3, r0
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _0800C9C0 @ =0x0202A5AA
	adds r0, r3, r0
	ldrb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C9A8
	adds r0, r4, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800C9C4
_0800C9A8:
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #1
	bl sub_0800C9F8
	bl sub_08025BB0
_0800C9B8:
	movs r0, #0
	b _0800C9EA
	.align 2, 0
_0800C9BC: .4byte 0x0202A5A6
_0800C9C0: .4byte 0x0202A5AA
_0800C9C4:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C9E8
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_0800CA84
	b _0800C9B8
_0800C9E8:
	movs r0, #3
_0800C9EA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800C9F8
sub_0800C9F8: @ 0x0800C9F8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	cmp r5, #0xff
	bne _0800CA0C
	movs r5, #1
	rsbs r5, r5, #0
_0800CA0C:
	cmp r2, #0xff
	bne _0800CA14
	movs r2, #1
	rsbs r2, r2, #0
_0800CA14:
	lsls r6, r5, #0x10
	lsls r3, r2, #0x10
	lsrs r0, r6, #0x10
	orrs r0, r3
	str r0, [sp]
	ldr r0, _0800CA80 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CA50
	cmp r7, #0
	beq _0800CA50
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, r5
	bne _0800CA44
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	cmp r0, r2
	beq _0800CA50
_0800CA44:
	asrs r1, r6, #0x10
	asrs r2, r3, #0x10
	adds r0, r4, #0
	mov r3, sp
	bl sub_080373B0
_0800CA50:
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrh r0, [r0, #2]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitFinalizeMovement
	ldr r1, [r4, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CA78
	movs r0, #0xa
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
	bl sub_08019EA4
_0800CA78:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA80: .4byte 0x0202E3DC

	thumb_func_start sub_0800CA84
sub_0800CA84: @ 0x0800CA84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	mov sb, r0
	cmp r5, #0xff
	bne _0800CAAC
	movs r5, #1
	rsbs r5, r5, #0
_0800CAAC:
	cmp r4, #0xff
	bne _0800CAB4
	movs r4, #1
	rsbs r4, r4, #0
_0800CAB4:
	bl sub_0802C75C
	lsls r7, r5, #0x10
	lsls r2, r4, #0x10
	lsrs r0, r7, #0x10
	orrs r0, r2
	str r0, [sp]
	ldr r0, _0800CAE0 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r3, r0, r5
	ldrb r0, [r3]
	adds r4, r1, #0
	cmp r0, #0
	bne _0800CAE4
	movs r1, #1
	mov sb, r1
	mov r2, sb
	strb r2, [r3]
	b _0800CAF0
	.align 2, 0
_0800CAE0: .4byte 0x0202E3DC
_0800CAE4:
	asrs r1, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	mov r3, sp
	bl sub_080373B0
_0800CAF0:
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r2, [r6, #4]
	ldr r2, [r2, #0x38]
	bl sub_0801A030
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, sp
	movs r2, #2
	ldrsh r1, [r1, r2]
	ldr r7, _0800CB64 @ =0x02033DFC
	adds r2, r7, #0
	bl sub_0801A23C
	mov r0, sb
	cmp r0, #0
	beq _0800CB28
	ldr r0, _0800CB68 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_0800CB28:
	mov r1, sl
	adds r1, #0x5e
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800CB40
	movs r0, #0x40
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800CB40:
	bl sub_0802C79C
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_0800CB6C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CB64: .4byte 0x02033DFC
_0800CB68: .4byte 0x0202E3DC

	thumb_func_start sub_0800CB6C
sub_0800CB6C: @ 0x0800CB6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	adds r0, r5, #0
	bl sub_0806C2DC
	adds r6, r0, #0
	adds r4, #0x5e
	movs r7, #1
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800CB9E
	adds r0, r6, #0
	bl sub_0806C3D8
_0800CB9E:
	ldr r0, _0800CC1C @ =0x08C00C18
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x54]
	adds r0, r5, #0
	bl sub_08026A00
	ldr r0, [r5, #0xc]
	orrs r0, r7
	str r0, [r5, #0xc]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	str r2, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r7, _0800CC20 @ =0x0202E3F0
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl sub_0806D53C
	ldr r0, [sp]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #4]
	str r0, [r4, #0x30]
	adds r0, r6, #0
	mov r1, r8
	bl sub_0806C8F0
	mov r0, sb
	cmp r0, #0
	beq _0800CBFA
	adds r0, r6, #0
	mov r1, sb
	bl sub_0806DCB8
_0800CBFA:
	ldr r0, [sp, #4]
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r1, [r5, #0xb]
	strb r1, [r0]
	movs r0, #1
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CC1C: .4byte 0x08C00C18
_0800CC20: .4byte 0x0202E3F0

	thumb_func_start nullsub_26
nullsub_26: @ 0x0800CC24
	bx lr
	.align 2, 0

	thumb_func_start sub_0800CC28
sub_0800CC28: @ 0x0800CC28
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	adds r0, r4, #0
	bl sub_0806C8B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800CC6E
	adds r0, r4, #0
	bl sub_0806D4BC
	ldr r4, [r4, #0x2c]
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitFinalizeMovement
	adds r0, r4, #0
	bl sub_08026A24
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl sub_08019EA4
	bl sub_08025BB0
	adds r0, r5, #0
	bl sub_0800457C
_0800CC6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0800CC74
sub_0800CC74: @ 0x0800CC74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CCA0 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CCA8
	ldr r0, _0800CCA4 @ =sub_0800CF2C
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CCB0
	.align 2, 0
_0800CCA0: .4byte 0x0202E3F0
_0800CCA4: .4byte sub_0800CF2C
_0800CCA8:
	adds r0, r4, #0
	bl sub_0800CF2C
	movs r0, #0
_0800CCB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800CCB8
sub_0800CCB8: @ 0x0800CCB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CCE4 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CCEC
	ldr r0, _0800CCE8 @ =sub_0800CFA8
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CCF4
	.align 2, 0
_0800CCE4: .4byte 0x0202E3F0
_0800CCE8: .4byte sub_0800CFA8
_0800CCEC:
	adds r0, r4, #0
	bl sub_0800CFA8
	movs r0, #0
_0800CCF4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800CCFC
sub_0800CCFC: @ 0x0800CCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r1, _0800CD48 @ =0xFFFF0000
	ands r0, r1
	ldr r1, _0800CD4C @ =gPlaySt
	cmp r0, #0
	beq _0800CD18
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800CD5E
_0800CD18:
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bne _0800CD5E
	ldr r0, _0800CD50 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CD58
	ldr r0, _0800CD54 @ =sub_0800CF2C
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CD60
	.align 2, 0
_0800CD48: .4byte 0xFFFF0000
_0800CD4C: .4byte gPlaySt
_0800CD50: .4byte 0x0202E3F0
_0800CD54: .4byte sub_0800CF2C
_0800CD58:
	adds r0, r4, #0
	bl sub_0800CF2C
_0800CD5E:
	movs r0, #0
_0800CD60:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800CD68
sub_0800CD68: @ 0x0800CD68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CD8C @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl sub_0800D044
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CD8C: .4byte 0x0202E3F0

	thumb_func_start sub_0800CD90
sub_0800CD90: @ 0x0800CD90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800CDA4 @ =gPlaySt
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	beq _0800CDA8
	movs r0, #0
	b _0800CDC0
	.align 2, 0
_0800CDA4: .4byte gPlaySt
_0800CDA8:
	ldr r0, _0800CDC8 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl sub_0800D044
	movs r0, #2
_0800CDC0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CDC8: .4byte 0x0202E3F0

	thumb_func_start sub_0800CDCC
sub_0800CDCC: @ 0x0800CDCC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CE04 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CDE8
	adds r4, #2
_0800CDE8:
	ldr r0, _0800CE08 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #1
	beq _0800CE0C
	cmp r4, #1
	ble _0800CE1E
	cmp r4, #2
	beq _0800CE12
	cmp r4, #3
	beq _0800CE18
	b _0800CE1E
	.align 2, 0
_0800CE04: .4byte gPlaySt
_0800CE08: .4byte 0x0202E3F0
_0800CE0C:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CE22
_0800CE12:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CE22
_0800CE18:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CE22
_0800CE1E:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CE22:
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0800CE4A
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CE44
	ldr r0, _0800CE40 @ =sub_0800CF2C
	str r0, [r5, #0x40]
	movs r0, #2
	b _0800CE4C
	.align 2, 0
_0800CE40: .4byte sub_0800CF2C
_0800CE44:
	adds r0, r5, #0
	bl sub_0800CF2C
_0800CE4A:
	movs r0, #0
_0800CE4C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800CE54
sub_0800CE54: @ 0x0800CE54
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CE8C @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CE70
	adds r4, #2
_0800CE70:
	ldr r0, _0800CE90 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #1
	beq _0800CE94
	cmp r4, #1
	ble _0800CEA6
	cmp r4, #2
	beq _0800CE9A
	cmp r4, #3
	beq _0800CEA0
	b _0800CEA6
	.align 2, 0
_0800CE8C: .4byte gPlaySt
_0800CE90: .4byte 0x0202E3F0
_0800CE94:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CEAA
_0800CE9A:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CEAA
_0800CEA0:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CEAA
_0800CEA6:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CEAA:
	str r0, [r5, #0x44]
	adds r0, r5, #0
	bl sub_0800D044
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800CEBC
sub_0800CEBC: @ 0x0800CEBC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x3f
	bgt _0800CEEA
_0800CEC4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800CEE4
	ldr r0, [r1]
	cmp r0, #0
	beq _0800CEE4
	ldr r0, [r1, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800CEE4
	adds r0, r4, #0
	b _0800CEEC
_0800CEE4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800CEC4
_0800CEEA:
	movs r0, #0
_0800CEEC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800CEF4
sub_0800CEF4: @ 0x0800CEF4
	adds r2, r0, #0
	ldr r0, _0800CF20 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r2, #4]
	ands r1, r3
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r1, r0
	bne _0800CF28
	ldr r0, _0800CF24 @ =0x0202E3D8
	ldr r1, [r0]
	ldrb r3, [r2, #5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r2, [r2, #4]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CF28
	movs r0, #1
	b _0800CF2A
	.align 2, 0
_0800CF20: .4byte 0x0000FFFF
_0800CF24: .4byte 0x0202E3D8
_0800CF28:
	movs r0, #0
_0800CF2A:
	bx lr

	thumb_func_start sub_0800CF2C
sub_0800CF2C: @ 0x0800CF2C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800CF90
_0800CF34:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CF5C
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800CF68
	b _0800CF5C
_0800CF52:
	adds r0, r4, #0
	movs r1, #0
	bl sub_0800A614
	adds r4, #0x10
_0800CF5C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CF52
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800CF9E
_0800CF68:
	adds r0, r4, #0
	bl sub_0800CEF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800CF8C
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CF9A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A614
_0800CF8C:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800CF90:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CF34
	ldr r0, _0800CFA4 @ =sub_0800D204
	str r0, [r5, #0x40]
_0800CF9A:
	bl sub_08025A0C
_0800CF9E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CFA4: .4byte sub_0800D204

	thumb_func_start sub_0800CFA8
sub_0800CFA8: @ 0x0800CFA8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800D02C
_0800CFB0:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r6, #4
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CFEA
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800CFF6
	b _0800CFEA
_0800CFD0:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800CFE8
	adds r0, r4, #0
	movs r1, #0
	bl sub_0800A614
_0800CFE8:
	adds r4, #0x10
_0800CFEA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CFD0
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800D03A
_0800CFF6:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ands r0, r6
	cmp r0, #0
	bne _0800D028
	adds r0, r4, #0
	bl sub_0800CEF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D028
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl sub_0800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D036
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A614
_0800D028:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800D02C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CFB0
	ldr r0, _0800D040 @ =sub_0800D204
	str r0, [r5, #0x40]
_0800D036:
	bl sub_08025A0C
_0800D03A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D040: .4byte sub_0800D204

	thumb_func_start sub_0800D044
sub_0800D044: @ 0x0800D044
	push {r4, r5, r6, lr}
	ldr r6, [r0, #0x44]
	movs r5, #0
	movs r4, #1
_0800D04C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800D06A
	ldr r0, [r1]
	cmp r0, #0
	beq _0800D06A
	ldr r0, [r1, #0xc]
	ldr r1, _0800D0C4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D06A
	adds r5, #1
_0800D06A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D04C
	cmp r5, #0
	ble _0800D086
	ldr r0, _0800D0C8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031A5C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800D162
_0800D086:
	ldr r0, _0800D0C8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031A5C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800D0CC
	movs r4, #1
_0800D09A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D0BC
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D0BC
	ldr r1, [r2, #0xc]
	ldr r0, _0800D0C4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D0BC
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D0BC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D09A
	b _0800D0FA
	.align 2, 0
_0800D0C4: .4byte 0x00010004
_0800D0C8: .4byte gPlaySt
_0800D0CC:
	movs r4, #1
_0800D0CE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D0F4
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D0F4
	ldr r1, [r2, #0xc]
	ldr r0, _0800D100 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D0F4
	movs r0, #1
	orrs r1, r0
	subs r0, #0xa
	ands r1, r0
	str r1, [r2, #0xc]
_0800D0F4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D0CE
_0800D0FA:
	movs r4, #0
	b _0800D116
	.align 2, 0
_0800D100: .4byte 0x00010004
_0800D104:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	adds r4, #1
	adds r0, r6, #0
	bl sub_0800A70C
	adds r6, #0x10
_0800D116:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800D128
	adds r0, r4, #0
	bl sub_0800CEBC
	adds r4, r0, #0
	cmp r4, #0
	bne _0800D104
_0800D128:
	movs r4, #1
_0800D12A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D154
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D154
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D154
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D154
	movs r0, #8
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D154:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D12A
	bl sub_08019EA4
	bl sub_08025BB0
_0800D162:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0800D168
sub_0800D168: @ 0x0800D168
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov sb, r1
	ldrb r3, [r0, #6]
	mov sl, r3
	ldrb r6, [r0, #8]
	ldrb r0, [r0, #0xa]
	mov r8, r0
	ldr r0, _0800D1FC @ =0x030040F0
	ldr r5, _0800D200 @ =0x08C00C28
	ldrb r1, [r5, #2]
	strb r1, [r0, #2]
	ldrb r4, [r5, #3]
	lsls r2, r4, #0x1f
	lsrs r2, r2, #0x1f
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r0, #3]
	ands r1, r3
	orrs r1, r2
	movs r2, #6
	ands r2, r4
	movs r3, #7
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	lsrs r4, r4, #3
	lsls r4, r4, #3
	movs r2, #7
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #3]
	ldrb r1, [r5, #8]
	strb r1, [r0, #8]
	ldrb r1, [r5, #9]
	strb r1, [r0, #9]
	ldrb r1, [r5, #0xa]
	strb r1, [r0, #0xa]
	ldrb r1, [r5, #0xb]
	strb r1, [r0, #0xb]
	ldrb r1, [r5, #0xc]
	strb r1, [r0, #0xc]
	ldrb r1, [r5, #0xd]
	strb r1, [r0, #0xd]
	ldrb r1, [r5, #0xe]
	strb r1, [r0, #0xe]
	ldrb r1, [r5, #0xf]
	strb r1, [r0, #0xf]
	mov r1, sb
	strb r1, [r0]
	mov r3, sl
	strb r3, [r0, #1]
	strb r6, [r0, #4]
	mov r1, r8
	strb r1, [r0, #5]
	strb r6, [r0, #6]
	strb r1, [r0, #7]
	movs r1, #0
	bl sub_0800A614
	movs r0, #2
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D1FC: .4byte 0x030040F0
_0800D200: .4byte 0x08C00C28

	thumb_func_start sub_0800D204
sub_0800D204: @ 0x0800D204
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0806C850
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0800D220
	ldr r0, _0800D228 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	str r4, [r5, #0x40]
_0800D220:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D228: .4byte 0x0202E3F0

	thumb_func_start sub_0800D22C
sub_0800D22C: @ 0x0800D22C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0806C850
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D23E
	movs r0, #3
	b _0800D262
_0800D23E:
	ldr r0, _0800D25C @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D260
	movs r0, #2
	b _0800D262
	.align 2, 0
_0800D25C: .4byte 0x0202E3F0
_0800D260:
	movs r0, #0
_0800D262:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D268
sub_0800D268: @ 0x0800D268
	adds r0, #0x5e
	movs r1, #1
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0800D278
sub_0800D278: @ 0x0800D278
	adds r0, #0x5e
	ldr r1, _0800D288 @ =0x0000FFFE
	ldrh r2, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0800D288: .4byte 0x0000FFFE

	thumb_func_start sub_0800D28C
sub_0800D28C: @ 0x0800D28C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D2A8
	movs r0, #2
	b _0800D2AA
_0800D2A8:
	movs r0, #1
_0800D2AA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D2B0
sub_0800D2B0: @ 0x0800D2B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D2D6
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D2DA
_0800D2D6:
	movs r0, #0
	b _0800D2DC
_0800D2DA:
	movs r0, #1
_0800D2DC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D2E4
sub_0800D2E4: @ 0x0800D2E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D310
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D310
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D314
_0800D310:
	movs r0, #0
	b _0800D316
_0800D314:
	movs r0, #1
_0800D316:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D31C
sub_0800D31C: @ 0x0800D31C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	beq _0800D33C
	movs r0, #1
	b _0800D346
_0800D33C:
	cmp r1, #0
	bne _0800D344
	movs r0, #3
	b _0800D346
_0800D344:
	movs r0, #0
_0800D346:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D34C
sub_0800D34C: @ 0x0800D34C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	beq _0800D36C
	movs r0, #1
	b _0800D376
_0800D36C:
	cmp r1, #0
	bne _0800D374
	movs r0, #0
	b _0800D376
_0800D374:
	movs r0, #3
_0800D376:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D37C
sub_0800D37C: @ 0x0800D37C
	movs r0, #3
	bx lr

	thumb_func_start sub_0800D380
sub_0800D380: @ 0x0800D380
	movs r0, #0
	bx lr

	thumb_func_start sub_0800D384
sub_0800D384: @ 0x0800D384
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	ldr r2, [r3, #0x2c]
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D3D6
	ldr r4, _0800D3B8 @ =0x0000FFFF
	ldr r5, _0800D3BC @ =0x08C0024C
	ldr r0, _0800D3C0 @ =0xFFFFFDF0
	adds r7, r5, r0
_0800D39A:
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0x42
	bne _0800D3C4
	ldr r0, [r2, #4]
	cmp r0, r6
	bne _0800D3C4
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D3D8
	.align 2, 0
_0800D3B8: .4byte 0x0000FFFF
_0800D3BC: .4byte 0x08C0024C
_0800D3C0: .4byte 0xFFFFFDF0
_0800D3C4:
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r7
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D39A
_0800D3D6:
	movs r0, #2
_0800D3D8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D3E0
sub_0800D3E0: @ 0x0800D3E0
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	bl sub_0800D384
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D3F0
sub_0800D3F0: @ 0x0800D3F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r6, [r0, #8]
	movs r4, #1
_0800D3FA:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D41E
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D41E
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D41E
	ldrb r0, [r2, #4]
	cmp r0, r6
	bne _0800D41E
	movs r0, #0
	b _0800D42E
_0800D41E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D3FA
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl sub_0800D384
_0800D42E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D434
sub_0800D434: @ 0x0800D434
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r6, [r0, #8]
	movs r4, #1
_0800D43E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D462
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D462
	ldr r0, [r0, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800D462
	ldrb r0, [r2, #4]
	cmp r0, r6
	bne _0800D462
	movs r0, #0
	b _0800D472
_0800D462:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D43E
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl sub_0800D384
_0800D472:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D478
sub_0800D478: @ 0x0800D478
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	bl _call_via_r0

	thumb_func_start sub_0800D484
sub_0800D484: @ 0x0800D484
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D48E
	movs r0, #0
	b _0800D498
_0800D48E:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_0800D384
_0800D498:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D4A0
sub_0800D4A0: @ 0x0800D4A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	bl _call_via_r0

	thumb_func_start sub_0800D4AC
sub_0800D4AC: @ 0x0800D4AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D4B6
	movs r0, #0
	b _0800D4C0
_0800D4B6:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_0800D384
_0800D4C0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D4C8
sub_0800D4C8: @ 0x0800D4C8
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #6
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D4DE
	movs r0, #0
	b _0800D4E8
_0800D4DE:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_0800D384
_0800D4E8:
	pop {r1}
	bx r1

	thumb_func_start sub_0800D4EC
sub_0800D4EC: @ 0x0800D4EC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D502
	movs r0, #0
	b _0800D50C
_0800D502:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_0800D384
_0800D50C:
	pop {r1}
	bx r1

	thumb_func_start sub_0800D510
sub_0800D510: @ 0x0800D510
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl sub_0807A0C8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D544
	movs r0, #0
	b _0800D56E
_0800D52A:
	ldr r0, _0800D540 @ =0x08C00038
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D56E
	.align 2, 0
_0800D540: .4byte 0x08C00038
_0800D544:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D56C
	ldr r3, _0800D574 @ =0x0000FFFF
	ldr r2, _0800D578 @ =0x08C0003C
_0800D54E:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x42
	bne _0800D55C
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D52A
_0800D55C:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D54E
_0800D56C:
	movs r0, #2
_0800D56E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D574: .4byte 0x0000FFFF
_0800D578: .4byte 0x08C0003C

	thumb_func_start sub_0800D57C
sub_0800D57C: @ 0x0800D57C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl sub_0807A0C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D5B0
	movs r0, #0
	b _0800D5DA
_0800D596:
	ldr r0, _0800D5AC @ =0x08C00038
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D5DA
	.align 2, 0
_0800D5AC: .4byte 0x08C00038
_0800D5B0:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D5D8
	ldr r3, _0800D5E0 @ =0x0000FFFF
	ldr r2, _0800D5E4 @ =0x08C0003C
_0800D5BA:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x42
	bne _0800D5C8
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D596
_0800D5C8:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D5BA
_0800D5D8:
	movs r0, #2
_0800D5DA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D5E0: .4byte 0x0000FFFF
_0800D5E4: .4byte 0x08C0003C

	thumb_func_start sub_0800D5E8
sub_0800D5E8: @ 0x0800D5E8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	ldr r6, [r1, #4]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D610
	ldr r0, _0800D60C @ =0x030045B0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	beq _0800D640
	movs r0, #0
	b _0800D66A
	.align 2, 0
_0800D60C: .4byte 0x030045B0
_0800D610:
	ldr r0, _0800D624 @ =0x030045B0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	bne _0800D640
	movs r0, #0
	b _0800D66A
	.align 2, 0
_0800D624: .4byte 0x030045B0
_0800D628:
	ldr r0, _0800D63C @ =0x08C00038
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D66A
	.align 2, 0
_0800D63C: .4byte 0x08C00038
_0800D640:
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D668
	ldr r5, _0800D670 @ =0x0000FFFF
	ldr r4, _0800D674 @ =0x08C0003C
_0800D64A:
	ldr r1, [r2]
	ands r1, r5
	cmp r1, #0x42
	bne _0800D658
	ldr r0, [r2, #4]
	cmp r0, r6
	beq _0800D628
_0800D658:
	lsls r0, r1, #3
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D64A
_0800D668:
	movs r0, #2
_0800D66A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D670: .4byte 0x0000FFFF
_0800D674: .4byte 0x08C0003C

	thumb_func_start sub_0800D678
sub_0800D678: @ 0x0800D678
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D688 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _0800D68C
	movs r0, #0
	b _0800D696
	.align 2, 0
_0800D688: .4byte gPlaySt
_0800D68C:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_0800D384
_0800D696:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D69C
sub_0800D69C: @ 0x0800D69C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D6AC @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800D6B0
	movs r0, #0
	b _0800D6BA
	.align 2, 0
_0800D6AC: .4byte gPlaySt
_0800D6B0:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_0800D384
_0800D6BA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D6C0
sub_0800D6C0: @ 0x0800D6C0
	push {lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x30]
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _0800D6E0
	ldr r1, _0800D6DC @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0800D6FC
	b _0800D6EC
	.align 2, 0
_0800D6DC: .4byte gPlaySt
_0800D6E0:
	ldr r1, _0800D6F8 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D6FC
_0800D6EC:
	ldr r1, [r2, #4]
	adds r0, r3, #0
	bl sub_0800D384
	b _0800D6FE
	.align 2, 0
_0800D6F8: .4byte gPlaySt
_0800D6FC:
	movs r0, #0
_0800D6FE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D704
sub_0800D704: @ 0x0800D704
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08009E60
	cmp r0, #1
	bne _0800D714
	movs r0, #0
	b _0800D71E
_0800D714:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_0800D384
_0800D71E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D724
sub_0800D724: @ 0x0800D724
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08009E60
	cmp r0, #1
	bne _0800D734
	movs r0, #0
	b _0800D73E
_0800D734:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_0800D384
_0800D73E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D744
sub_0800D744: @ 0x0800D744
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800D768 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D75C
	bl sub_0807AE5C
	cmp r0, #0
	beq _0800D76C
_0800D75C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_0800D384
	b _0800D76E
	.align 2, 0
_0800D768: .4byte gPlaySt
_0800D76C:
	movs r0, #0
_0800D76E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D774
sub_0800D774: @ 0x0800D774
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldrh r7, [r0, #8]
	ldr r5, [r0, #0xc]
	movs r4, #1
_0800D780:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D7B6
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D7B6
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800D7B6
	ldrb r0, [r2, #4]
	cmp r0, r7
	bne _0800D7B6
	adds r0, r5, #0
	bl sub_0807A0C8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D7BC
	adds r0, r5, #0
	bl sub_0807A0B4
	movs r0, #0
	b _0800D7C6
_0800D7B6:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D780
_0800D7BC:
	ldr r0, [r6, #0x30]
	ldr r1, [r0, #4]
	adds r0, r6, #0
	bl sub_0800D384
_0800D7C6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D7CC
sub_0800D7CC: @ 0x0800D7CC
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D7E0 @ =gPlaySt
	ldr r1, [r2, #0x30]
	ldrh r0, [r0, #0x10]
	ldrh r3, [r1, #2]
	cmp r0, r3
	bhs _0800D7E4
	movs r0, #0
	b _0800D7EC
	.align 2, 0
_0800D7E0: .4byte gPlaySt
_0800D7E4:
	ldr r1, [r1, #4]
	adds r0, r2, #0
	bl sub_0800D384
_0800D7EC:
	pop {r1}
	bx r1

	thumb_func_start sub_0800D7F0
sub_0800D7F0: @ 0x0800D7F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D80C
	ldrb r0, [r1, #8]
	bl sub_0807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D818
_0800D808:
	movs r0, #0
	b _0800D822
_0800D80C:
	ldrb r0, [r1, #8]
	bl sub_0807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D808
_0800D818:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_0800D384
_0800D822:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D828
sub_0800D828: @ 0x0800D828
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	movs r0, #1
	bx lr

	thumb_func_start sub_0800D834
sub_0800D834: @ 0x0800D834
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0

	thumb_func_start sub_0800D840
sub_0800D840: @ 0x0800D840
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D850
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
_0800D850:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D858
sub_0800D858: @ 0x0800D858
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0

	thumb_func_start sub_0800D864
sub_0800D864: @ 0x0800D864
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D874
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
_0800D874:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D87C
sub_0800D87C: @ 0x0800D87C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #4]
	ldr r0, _0800D890 @ =0x030045B0
	ldr r0, [r0]
	bl sub_0800D8DC
	pop {r1}
	bx r1
	.align 2, 0
_0800D890: .4byte 0x030045B0

	thumb_func_start sub_0800D894
sub_0800D894: @ 0x0800D894
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r2, [r0, #4]
	ldrh r5, [r0, #8]
	cmp r2, #0
	bne _0800D8A8
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r2, [r0]
_0800D8A8:
	adds r0, r2, #0
	bl GetUnitFromCharId
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800D8DC
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800D8BC
sub_0800D8BC: @ 0x0800D8BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #4]
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800D8DC
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D8DC
sub_0800D8DC: @ 0x0800D8DC
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800D8EE
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
_0800D8EE:
	adds r0, r3, #0
	bl sub_0800EE60
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D8FC
sub_0800D8FC: @ 0x0800D8FC
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800D918 @ =0x0000FFFF
	cmp r4, r0
	bne _0800D91C
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800D92C
	.align 2, 0
_0800D918: .4byte 0x0000FFFF
_0800D91C:
	ldr r0, _0800D968 @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800D92C:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800D96C
	bl sub_0801996C
	adds r0, r4, #0
	bl sub_0802C228
	cmp r5, #0
	beq _0800D94E
	subs r0, r4, #1
	bl sub_0802C2A8
_0800D94E:
	adds r0, r4, #0
	bl sub_0802C294
	bl sub_08019714
	bl sub_0802C300
	bl sub_080198EC
	movs r0, #1
	bl sub_0801DA0C
	b _0800D98A
	.align 2, 0
_0800D968: .4byte 0x00007FFF
_0800D96C:
	adds r0, r4, #0
	bl sub_0802C228
	cmp r5, #0
	beq _0800D97C
	subs r0, r4, #1
	bl sub_0802C2A8
_0800D97C:
	adds r0, r4, #0
	bl sub_0802C294
	bl sub_08019714
	bl sub_0802C300
_0800D98A:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800D994
sub_0800D994: @ 0x0800D994
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800D9B0 @ =0x0000FFFF
	cmp r4, r0
	bne _0800D9B4
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800D9C4
	.align 2, 0
_0800D9B0: .4byte 0x0000FFFF
_0800D9B4:
	ldr r0, _0800D9FC @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800D9C4:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DA38
	bl sub_0801996C
	adds r0, r4, #0
	bl sub_0802C228
	cmp r5, #0
	beq _0800DA04
	subs r0, r4, #1
	bl sub_0802C2A8
	ldr r0, _0800DA00 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DA16
	movs r0, #0xbd
	bl m4aSongNumStart
	b _0800DA16
	.align 2, 0
_0800D9FC: .4byte 0x00007FFF
_0800DA00: .4byte gPlaySt
_0800DA04:
	ldr r0, _0800DA34 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DA16
	movs r0, #0xbe
	bl m4aSongNumStart
_0800DA16:
	adds r0, r4, #0
	bl sub_0802C294
	bl sub_08019714
	bl sub_0802C300
	bl sub_08019428
	bl sub_080198EC
	movs r0, #1
	bl sub_0801DA0C
	b _0800DA5A
	.align 2, 0
_0800DA34: .4byte gPlaySt
_0800DA38:
	adds r0, r4, #0
	bl sub_0802C228
	cmp r5, #0
	beq _0800DA48
	subs r0, r4, #1
	bl sub_0802C2A8
_0800DA48:
	adds r0, r4, #0
	bl sub_0802C294
	bl sub_08019714
	bl sub_0802C300
	bl sub_08019428
_0800DA5A:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800DA64
sub_0800DA64: @ 0x0800DA64
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r4, [r0, #2]
	ldr r0, _0800DA98 @ =0x0000FFFF
	cmp r4, r0
	bne _0800DA78
	adds r0, r1, #0
	adds r0, #0x4f
	ldrb r4, [r0]
_0800DA78:
	adds r0, r4, #0
	bl sub_0802C228
	adds r0, r4, #0
	bl sub_0802C294
	bl sub_08019714
	bl sub_0802C300
	bl sub_080198EC
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800DA98: .4byte 0x0000FFFF

	thumb_func_start sub_0800DA9C
sub_0800DA9C: @ 0x0800DA9C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DAB8 @ =0x0000FFFF
	cmp r4, r0
	bne _0800DABC
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DACC
	.align 2, 0
_0800DAB8: .4byte 0x0000FFFF
_0800DABC:
	ldr r0, _0800DAE0 @ =0x00007FFF
	ands r4, r0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DACC:
	adds r0, r4, #0
	bl sub_0802C228
	cmp r5, #0
	beq _0800DAE4
	subs r0, r4, #1
	bl sub_0802C2A8
	b _0800DAEA
	.align 2, 0
_0800DAE0: .4byte 0x00007FFF
_0800DAE4:
	adds r0, r4, #0
	bl sub_0802C294
_0800DAEA:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800DAF4
sub_0800DAF4: @ 0x0800DAF4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019714
	bl sub_0802C300
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800DB0C
	bl sub_08019428
_0800DB0C:
	bl sub_080198EC
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800DB18
sub_0800DB18: @ 0x0800DB18
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0]
	lsrs r0, r1, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl sub_0802C1CC
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0800DB3C
	adds r0, r5, #0
	adds r0, #0x4f
	ldrb r4, [r0]
_0800DB3C:
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DB6E
	bl sub_0801996C
	adds r0, r4, #0
	bl sub_0802C228
	adds r0, r4, #0
	bl sub_0802C294
	bl sub_08019714
	bl sub_0802C300
	bl sub_080198EC
	movs r0, #1
	bl sub_0801DA0C
	b _0800DB82
_0800DB6E:
	adds r0, r4, #0
	bl sub_0802C228
	adds r0, r4, #0
	bl sub_0802C294
	bl sub_08019714
	bl sub_0802C300
_0800DB82:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800DB8C
sub_0800DB8C: @ 0x0800DB8C
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x30]
	ldrb r6, [r0, #4]
	ldr r5, [r0, #8]
	movs r4, #1
_0800DB96:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800DBC0
	ldr r3, [r2]
	cmp r3, #0
	beq _0800DBC0
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800DBC0
	ldrb r3, [r3, #4]
	cmp r3, r6
	bne _0800DBC0
	adds r0, r2, #0
	adds r1, r5, #0
	bl UnitChangeFaction
_0800DBC0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800DB96
	bl sub_08025BB0
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800DBD4
sub_0800DBD4: @ 0x0800DBD4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DBEA
	movs r0, #0
	b _0800DC32
_0800DBEA:
	ldr r1, [r5, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DBFE
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DC00
_0800DBFE:
	ldr r0, _0800DC14 @ =0x0000FFFF
_0800DC00:
	adds r6, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DC18
	adds r4, r1, #0
	b _0800DC1A
	.align 2, 0
_0800DC14: .4byte 0x0000FFFF
_0800DC18:
	ldr r4, _0800DC38 @ =0x0000FFFF
_0800DC1A:
	ldr r0, _0800DC3C @ =0x08C00C48
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r6, [r1]
	adds r0, #0x66
	strh r4, [r0]
	ldr r0, _0800DC40 @ =sub_0800DC94
	str r0, [r5, #0x40]
	movs r0, #2
_0800DC32:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DC38: .4byte 0x0000FFFF
_0800DC3C: .4byte 0x08C00C48
_0800DC40: .4byte sub_0800DC94

	thumb_func_start sub_0800DC44
sub_0800DC44: @ 0x0800DC44
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800DC8C
	ldr r0, _0800DC84 @ =0x08C00C48
	adds r1, r4, #0
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	adds r1, r0, #0
	adds r1, #0x64
	strh r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, #0x66
	strh r1, [r0]
	ldr r0, _0800DC88 @ =sub_0800DC94
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800DC8E
	.align 2, 0
_0800DC84: .4byte 0x08C00C48
_0800DC88: .4byte sub_0800DC94
_0800DC8C:
	movs r0, #0
_0800DC8E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800DC94
sub_0800DC94: @ 0x0800DC94
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DCB4
	ldr r0, _0800DCB0 @ =0x08C00C48
	bl sub_08004748
	movs r0, #0
	b _0800DCBE
	.align 2, 0
_0800DCB0: .4byte 0x08C00C48
_0800DCB4:
	ldr r0, _0800DCC8 @ =0x08C00C48
	bl sub_08004584
	cmp r0, #0
	bne _0800DCC0
_0800DCBE:
	str r0, [r4, #0x40]
_0800DCC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DCC8: .4byte 0x08C00C48

	thumb_func_start sub_0800DCCC
sub_0800DCCC: @ 0x0800DCCC
	movs r1, #0x3c
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800DCD4
sub_0800DCD4: @ 0x0800DCD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0
	bgt _0800DCE8
	adds r0, r4, #0
	bl sub_0800457C
_0800DCE8:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	movs r2, #0
	bl sub_08015DE8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0800DD08
sub_0800DD08: @ 0x0800DD08
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DD1E
	movs r0, #0
	b _0800DD62
_0800DD1E:
	ldr r1, [r3, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DD32
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DD34
_0800DD32:
	ldr r0, _0800DD48 @ =0x0000FFFF
_0800DD34:
	adds r5, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DD4C
	adds r4, r1, #0
	b _0800DD4E
	.align 2, 0
_0800DD48: .4byte 0x0000FFFF
_0800DD4C:
	ldr r4, _0800DD68 @ =0x0000FFFF
_0800DD4E:
	ldr r0, _0800DD6C @ =0x08C00C60
	adds r1, r3, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r5, [r1]
	adds r0, #0x66
	strh r4, [r0]
	movs r0, #2
_0800DD62:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DD68: .4byte 0x0000FFFF
_0800DD6C: .4byte 0x08C00C60

	thumb_func_start sub_0800DD70
sub_0800DD70: @ 0x0800DD70
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r2, r2, #4
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r1, r1, #4
	adds r0, r2, #0
	movs r2, #0
	bl sub_08015DE8
	pop {r0}
	bx r0

	thumb_func_start sub_0800DD90
sub_0800DD90: @ 0x0800DD90
	push {lr}
	ldr r0, _0800DDA0 @ =0x08C00C60
	bl sub_08004748
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800DDA0: .4byte 0x08C00C60

	thumb_func_start sub_0800DDA4
sub_0800DDA4: @ 0x0800DDA4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0800DDAC:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800DDC6
	ldr r0, [r0]
	cmp r0, #0
	beq _0800DDC6
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0800DDC6
	movs r0, #1
	b _0800DDCE
_0800DDC6:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800DDAC
	movs r0, #0
_0800DDCE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800DDD4
sub_0800DDD4: @ 0x0800DDD4
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DDEC
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DDEE
_0800DDEC:
	ldr r0, _0800DE04 @ =0x0000FFFF
_0800DDEE:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DE08
	adds r0, r2, #0
	b _0800DE0A
	.align 2, 0
_0800DE04: .4byte 0x0000FFFF
_0800DE08:
	ldr r0, _0800DE3C @ =0x0000FFFF
_0800DE0A:
	lsls r2, r0, #0x10
	ldr r0, _0800DE40 @ =0x0202E3D8
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_0800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DE44
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DE4A
	.align 2, 0
_0800DE3C: .4byte 0x0000FFFF
_0800DE40: .4byte 0x0202E3D8
_0800DE44:
	adds r0, r4, #0
	bl ClearUnit
_0800DE4A:
	bl sub_08019EA4
	bl sub_08025BB0
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800DE5C
sub_0800DE5C: @ 0x0800DE5C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl sub_0800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DE82
	ldr r0, [r5, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r5, #0xc]
	b _0800DE88
_0800DE82:
	adds r0, r5, #0
	bl ClearUnit
_0800DE88:
	bl sub_08019EA4
	bl sub_08025BB0
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800DE98
sub_0800DE98: @ 0x0800DE98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DEB0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DEB2
_0800DEB0:
	ldr r0, _0800DEC8 @ =0x0000FFFF
_0800DEB2:
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DECC
	adds r0, r2, #0
	b _0800DECE
	.align 2, 0
_0800DEC8: .4byte 0x0000FFFF
_0800DECC:
	ldr r0, _0800DF10 @ =0x0000FFFF
_0800DECE:
	lsls r2, r0, #0x10
	ldr r0, _0800DF14 @ =0x0202E3D8
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DF28
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_0800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DF18
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DF1E
	.align 2, 0
_0800DF10: .4byte 0x0000FFFF
_0800DF14: .4byte 0x0202E3D8
_0800DF18:
	adds r0, r4, #0
	bl ClearUnit
_0800DF1E:
	bl sub_08019EA4
	bl sub_08025BB0
	b _0800DF56
_0800DF28:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08026A00
	adds r0, r4, #0
	bl sub_0806C2DC
	adds r4, r0, #0
	bl sub_0806C7CC
	adds r0, r4, #0
	bl sub_0806DD98
	ldr r0, _0800DF60 @ =sub_0800DFE0
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800DF56:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DF60: .4byte sub_0800DFE0

	thumb_func_start sub_0800DF64
sub_0800DF64: @ 0x0800DF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DFB0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_0800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DFA0
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DFA6
_0800DFA0:
	adds r0, r4, #0
	bl ClearUnit
_0800DFA6:
	bl sub_08019EA4
	bl sub_08025BB0
	b _0800DFD4
_0800DFB0:
	adds r0, r4, #0
	bl sub_08026A00
	adds r0, r4, #0
	bl sub_0806C2DC
	adds r4, r0, #0
	bl sub_0806C7CC
	adds r0, r4, #0
	bl sub_0806DD98
	ldr r0, _0800DFDC @ =sub_0800DFE0
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800DFD4:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DFDC: .4byte sub_0800DFE0

	thumb_func_start sub_0800DFE0
sub_0800DFE0: @ 0x0800DFE0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x55
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl sub_0806D4A4
	adds r0, r4, #0
	bl ClearUnit
	bl sub_08019EA4
	bl sub_08025BB0
	movs r0, #0
	str r0, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800E00C
sub_0800E00C: @ 0x0800E00C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800E024
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800E026
_0800E024:
	ldr r0, _0800E03C @ =0x0000FFFF
_0800E026:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800E040
	adds r0, r2, #0
	b _0800E042
	.align 2, 0
_0800E03C: .4byte 0x0000FFFF
_0800E040:
	ldr r0, _0800E070 @ =0x0000FFFF
_0800E042:
	lsls r2, r0, #0x10
	ldr r0, _0800E074 @ =0x0202E3D8
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_08019EA4
	bl sub_08025BB0
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0800E070: .4byte 0x0000FFFF
_0800E074: .4byte 0x0202E3D8

	thumb_func_start sub_0800E078
sub_0800E078: @ 0x0800E078
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_08019EA4
	bl sub_08025BB0
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start sub_0800E098
sub_0800E098: @ 0x0800E098
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	ldr r2, _0800E0B0 @ =0x04010000
	orrs r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E0B0: .4byte 0x04010000

	thumb_func_start sub_0800E0B4
sub_0800E0B4: @ 0x0800E0B4
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	ldr r2, _0800E0CC @ =0xFFBFFFFF
	ands r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E0CC: .4byte 0xFFBFFFFF

	thumb_func_start sub_0800E0D0
sub_0800E0D0: @ 0x0800E0D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	ldr r1, [r0, #0xc]
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_08019EA4
	bl sub_08025BB0
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800E0F8
sub_0800E0F8: @ 0x0800E0F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	ldr r1, [r0, #0xc]
	bics r1, r2
	str r1, [r0, #0xc]
	bl sub_08019EA4
	bl sub_08025BB0
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800E120
sub_0800E120: @ 0x0800E120
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r1, #0x14
	beq _0800E13C
	mov r3, ip
	adds r3, #0x42
	movs r0, #0
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x43
	strb r0, [r1]
_0800E13C:
	cmp r2, #0x23
	beq _0800E15C
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	cmp r2, #0xc
	bne _0800E15C
	movs r0, #8
	mov r1, ip
	ldrb r1, [r1, #0xa]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0xa]
_0800E15C:
	bx lr
	.align 2, 0

	thumb_func_start sub_0800E160
sub_0800E160: @ 0x0800E160
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov r8, r1
	ldr r1, [r0, #8]
	ldrb r7, [r0, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r6, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	movs r4, #1
_0800E182:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E1B0
	ldr r3, [r2]
	cmp r3, #0
	beq _0800E1B0
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E1B0
	ldrb r3, [r3, #4]
	cmp r3, r8
	bne _0800E1B0
	adds r0, r2, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_0800E120
_0800E1B0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E182
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800E1C4
sub_0800E1C4: @ 0x0800E1C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, [r0, #0x30]
	ldr r1, [r2, #8]
	ldrb r0, [r2, #8]
	mov sb, r0
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	mov r8, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	movs r4, #0x41
	movs r6, #4
	ldrsb r6, [r2, r6]
	movs r5, #6
	ldrsb r5, [r2, r5]
_0800E1F0:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E228
	ldr r0, [r2]
	cmp r0, #0
	beq _0800E228
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E228
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0800E228
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800E228
	adds r0, r2, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_0800E120
_0800E228:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E1F0
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E23C
sub_0800E23C: @ 0x0800E23C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl sub_0807A0B4
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800E24C
sub_0800E24C: @ 0x0800E24C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl sub_0807A0E0
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800E25C
sub_0800E25C: @ 0x0800E25C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E27E
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	movs r1, #1
	movs r2, #0
	bl sub_08003788
	movs r0, #2
	b _0800E280
_0800E27E:
	movs r0, #0
_0800E280:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E284
sub_0800E284: @ 0x0800E284
	push {lr}
	ldr r2, [r0, #0x30]
	ldrh r3, [r2, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800E29A
	movs r0, #0
	b _0800E324
_0800E29A:
	ldr r0, [r2, #4]
	subs r0, #1
	cmp r0, #7
	bhi _0800E318
	lsls r0, r0, #2
	ldr r1, _0800E2AC @ =_0800E2B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E2AC: .4byte _0800E2B0
_0800E2B0: @ jump table
	.4byte _0800E2D0 @ case 0
	.4byte _0800E2D8 @ case 1
	.4byte _0800E2E0 @ case 2
	.4byte _0800E2E8 @ case 3
	.4byte _0800E2F0 @ case 4
	.4byte _0800E2F8 @ case 5
	.4byte _0800E300 @ case 6
	.4byte _0800E308 @ case 7
_0800E2D0:
	ldr r2, _0800E2D4 @ =0x03005C40
	b _0800E30A
	.align 2, 0
_0800E2D4: .4byte 0x03005C40
_0800E2D8:
	ldr r2, _0800E2DC @ =0x03005C80
	b _0800E30A
	.align 2, 0
_0800E2DC: .4byte 0x03005C80
_0800E2E0:
	ldr r2, _0800E2E4 @ =0x03005D50
	b _0800E30A
	.align 2, 0
_0800E2E4: .4byte 0x03005D50
_0800E2E8:
	ldr r2, _0800E2EC @ =0x03005CC0
	b _0800E30A
	.align 2, 0
_0800E2EC: .4byte 0x03005CC0
_0800E2F0:
	ldr r2, _0800E2F4 @ =0x030059B0
	b _0800E30A
	.align 2, 0
_0800E2F4: .4byte 0x030059B0
_0800E2F8:
	ldr r2, _0800E2FC @ =0x030059F0
	b _0800E30A
	.align 2, 0
_0800E2FC: .4byte 0x030059F0
_0800E300:
	ldr r2, _0800E304 @ =0x03005C00
	b _0800E30A
	.align 2, 0
_0800E304: .4byte 0x03005C00
_0800E308:
	ldr r2, _0800E314 @ =0x03005D10
_0800E30A:
	adds r0, r3, #0
	movs r1, #1
	bl sub_08003788
	b _0800E322
	.align 2, 0
_0800E314: .4byte 0x03005D10
_0800E318:
	ldr r2, _0800E328 @ =0x03005A30
	adds r0, r3, #0
	movs r1, #1
	bl sub_08003788
_0800E322:
	movs r0, #2
_0800E324:
	pop {r1}
	bx r1
	.align 2, 0
_0800E328: .4byte 0x03005A30

	thumb_func_start sub_0800E32C
sub_0800E32C: @ 0x0800E32C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E352
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl sub_0800394C
	adds r0, r4, #0
	movs r1, #0x21
	bl sub_080149B4
	movs r0, #2
	b _0800E354
_0800E352:
	movs r0, #0
_0800E354:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800E35C
sub_0800E35C: @ 0x0800E35C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl sub_08003A68
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start sub_0800E36C
sub_0800E36C: @ 0x0800E36C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E38A
	ldr r1, [r2, #0x30]
	ldrh r0, [r1, #2]
	ldr r1, [r1, #4]
	movs r2, #0
	bl sub_08003858
_0800E38A:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800E390
sub_0800E390: @ 0x0800E390
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E3AE
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl sub_08003550
	movs r0, #2
	b _0800E3B0
_0800E3AE:
	movs r0, #0
_0800E3B0:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E3B4
sub_0800E3B4: @ 0x0800E3B4
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E3D6
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl sub_08003B4C
	movs r0, #2
	b _0800E3D8
_0800E3D6:
	movs r0, #0
_0800E3D8:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E3DC
sub_0800E3DC: @ 0x0800E3DC
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E3FE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x90
	movs r2, #0xa
	bl sub_08003B4C
	movs r0, #2
	b _0800E408
_0800E3FE:
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_0800348C
	movs r0, #0
_0800E408:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E40C
sub_0800E40C: @ 0x0800E40C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E432
	ldr r0, _0800E438 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800E432
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl m4aSongNumStart
_0800E432:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E438: .4byte gPlaySt

	thumb_func_start sub_0800E43C
sub_0800E43C: @ 0x0800E43C
	adds r0, #0x5e
	movs r1, #8
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0800E44C
sub_0800E44C: @ 0x0800E44C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #2]
	bl sub_0806D4A4
	adds r0, r5, #0
	bl sub_08013214
	movs r0, #1
	bl sub_08013200
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E47E
	adds r0, r4, #0
	bl sub_08014510
_0800E47E:
	cmp r5, #0x2f
	beq _0800E488
	movs r0, #4
	bl sub_080034C8
_0800E488:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E490
sub_0800E490: @ 0x0800E490
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	bl sub_08013200
	adds r0, r4, #0
	bl sub_0800E43C
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E4A8
sub_0800E4A8: @ 0x0800E4A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	bl sub_08013200
	adds r0, r4, #0
	bl sub_0800E43C
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E4C0
sub_0800E4C0: @ 0x0800E4C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0800E508 @ =gPlaySt
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	strb r0, [r1, #0xe]
	bl sub_0802E5B4
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	lsls r0, r0, #4
	bl sub_08015D98
	ldr r5, _0800E50C @ =0x0202BBB4
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	lsls r0, r0, #4
	bl sub_08015DC0
	strh r0, [r5, #0xe]
	bl sub_08019EA4
	bl sub_080198EC
	bl sub_08025BB0
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E508: .4byte gPlaySt
_0800E50C: .4byte 0x0202BBB4

	thumb_func_start sub_0800E510
sub_0800E510: @ 0x0800E510
	ldr r1, _0800E51C @ =gPlaySt
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	strb r0, [r1, #0xe]
	movs r0, #0
	bx lr
	.align 2, 0
_0800E51C: .4byte gPlaySt

	thumb_func_start sub_0800E520
sub_0800E520: @ 0x0800E520
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _0800E568 @ =0x0000FFFB
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	bl sub_08015A48
	bl sub_08019624
	bl sub_08025124
	ldr r2, _0800E56C @ =0x03002790
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
	adds r1, r5, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E568: .4byte 0x0000FFFB
_0800E56C: .4byte 0x03002790

	thumb_func_start sub_0800E570
sub_0800E570: @ 0x0800E570
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E588
	adds r0, r1, #0
	bl sub_0800E520
_0800E588:
	movs r0, #0x40
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E598
sub_0800E598: @ 0x0800E598
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E5B0
	adds r0, r1, #0
	bl sub_0800E520
_0800E5B0:
	movs r0, #0xc0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E5C0
sub_0800E5C0: @ 0x0800E5C0
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E5D8
	adds r0, r1, #0
	bl sub_0800E520
_0800E5D8:
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E5EC
sub_0800E5EC: @ 0x0800E5EC
	adds r2, r0, #0
	adds r2, #0x5e
	ldrh r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E608
	ldr r0, _0800E604 @ =0x0000FE1F
	ands r0, r1
	strh r0, [r2]
	movs r0, #2
	b _0800E60A
	.align 2, 0
_0800E604: .4byte 0x0000FE1F
_0800E608:
	movs r0, #0
_0800E60A:
	bx lr

	thumb_func_start sub_0800E60C
sub_0800E60C: @ 0x0800E60C
	adds r1, r0, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r2, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0800E622
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #2
	b _0800E624
_0800E622:
	movs r0, #0
_0800E624:
	bx lr
	.align 2, 0

	thumb_func_start sub_0800E628
sub_0800E628: @ 0x0800E628
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E640
	adds r0, r1, #0
	bl sub_0800E520
_0800E640:
	bl sub_0809F9D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800E652
	movs r0, #0x40
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
_0800E652:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800E65C
sub_0800E65C: @ 0x0800E65C
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E674
	adds r0, r1, #0
	bl sub_0800E520
_0800E674:
	bl sub_0809F9D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E684
	movs r1, #0xa0
	lsls r1, r1, #1
	b _0800E688
_0800E684:
	movs r1, #0xe0
	lsls r1, r1, #1
_0800E688:
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E698
sub_0800E698: @ 0x0800E698
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E6B0
	adds r0, r1, #0
	bl sub_0800E520
_0800E6B0:
	bl sub_0809F9D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E6C0
	movs r1, #0xc0
	lsls r1, r1, #1
	b _0800E6C4
_0800E6C0:
	movs r1, #0xe0
	lsls r1, r1, #1
_0800E6C4:
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E6D4
sub_0800E6D4: @ 0x0800E6D4
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E6F2
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl sub_08014458
	movs r0, #2
	b _0800E6F4
_0800E6F2:
	movs r0, #0
_0800E6F4:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E6F8
sub_0800E6F8: @ 0x0800E6F8
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E716
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl sub_08014470
	movs r0, #2
	b _0800E718
_0800E716:
	movs r0, #0
_0800E718:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E71C
sub_0800E71C: @ 0x0800E71C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E732
	movs r0, #0
	b _0800E74A
_0800E732:
	bl sub_0807FC04
	lsls r0, r0, #0x18
	movs r1, #4
	cmp r0, #0
	beq _0800E740
	movs r1, #0x10
_0800E740:
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_08014458
	movs r0, #2
_0800E74A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800E750
sub_0800E750: @ 0x0800E750
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E76E
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl sub_08014488
	movs r0, #2
	b _0800E770
_0800E76E:
	movs r0, #0
_0800E770:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E774
sub_0800E774: @ 0x0800E774
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E792
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl sub_080144A0
	movs r0, #2
	b _0800E794
_0800E792:
	movs r0, #0
_0800E794:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E798
sub_0800E798: @ 0x0800E798
	push {lr}
	bl sub_0800F200
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800E7A4
sub_0800E7A4: @ 0x0800E7A4
	push {lr}
	bl sub_0800F208
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800E7B0
sub_0800E7B0: @ 0x0800E7B0
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E7D2
	ldr r2, [r3, #0x30]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl sub_080AFB94
	movs r0, #2
	b _0800E7D4
_0800E7D2:
	movs r0, #0
_0800E7D4:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E7D8
sub_0800E7D8: @ 0x0800E7D8
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E7FA
	ldr r2, [r3, #0x30]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl sub_080AFBE8
	movs r0, #2
	b _0800E7FC
_0800E7FA:
	movs r0, #0
_0800E7FC:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E800
sub_0800E800: @ 0x0800E800
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r4, [r0, #4]
	cmp r4, #0
	bne _0800E80E
	ldr r4, [r5, #0x58]
_0800E80E:
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800E828
	bl sub_08023D90
	adds r0, r0, r4
	bl SetPartyGoldAmount
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800ED9C
	b _0800E848
_0800E828:
	ldr r0, _0800E850 @ =0x030045B0
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800E840
	bl sub_08023D90
	adds r0, r0, r4
	bl SetPartyGoldAmount
_0800E840:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800ED58
_0800E848:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E850: .4byte 0x030045B0

	thumb_func_start sub_0800E854
sub_0800E854: @ 0x0800E854
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl sub_08053C10
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	mov sb, r0
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitFromCharId
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r6, [r0, #0xc]
	movs r1, #0xff
	adds r4, r1, #0
	ldrh r2, [r0, #0x12]
	ands r4, r2
	ldrb r2, [r0, #0x13]
	ands r2, r1
	str r2, [sp]
	ldrh r7, [r0, #0x10]
	ldr r1, _0800E8A0 @ =0x0203A858
	cmp r2, #0
	bne _0800E8A4
	str r6, [r1, #0x18]
	b _0800E8A8
	.align 2, 0
_0800E8A0: .4byte 0x0203A858
_0800E8A4:
	movs r0, #0
	str r0, [r1, #0x18]
_0800E8A8:
	mov r1, sb
	ldrh r0, [r1, #0x1e]
	bl sub_08017664
	cmp r0, #4
	beq _0800E8B8
	cmp r7, #0
	beq _0800E8C8
_0800E8B8:
	mov r0, sb
	movs r1, #0
	bl sub_0802A964
	mov r0, sl
	bl sub_0802AA10
	b _0800E8DE
_0800E8C8:
	cmp r4, #0
	bne _0800E8D6
	mov r0, sb
	mov r1, sl
	bl sub_08028868
	b _0800E8DE
_0800E8D6:
	mov r0, sb
	mov r1, sl
	bl sub_0802889C
_0800E8DE:
	ldr r4, _0800E994 @ =0x0203A3EC
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0
	strb r0, [r1]
	ldr r5, _0800E998 @ =0x0203A46C
	adds r1, r5, #0
	adds r1, #0x6e
	strb r0, [r1]
	mov r0, sb
	bl GetUnitEquippedWeapon
	ldr r2, _0800E99C @ =0x0203A434
	strh r0, [r2]
	adds r4, #0x4a
	strh r0, [r4]
	mov r0, sl
	bl GetUnitEquippedWeapon
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	cmp r7, #0
	beq _0800E92E
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r2, _0800E99C @ =0x0203A434
	strh r0, [r2]
	strh r0, [r4]
	cmp r7, #0x7f
	bgt _0800E92E
	cmp r7, #0x7c
	blt _0800E92E
	ldr r1, _0800E9A0 @ =0x0203A3D4
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
_0800E92E:
	mov r7, r8
	adds r7, #0x5e
	ldr r0, [sp]
	cmp r0, #0
	bne _0800E96C
	bl sub_08029434
	ldr r2, _0800E9A4 @ =0x0203A508
	ldr r1, [r2]
	ldr r0, [r6]
	str r0, [r1]
	movs r0, #0x80
	ldrb r1, [r6, #2]
	ands r0, r1
	cmp r0, #0
	bne _0800E968
	adds r4, r2, #0
	movs r5, #0x80
_0800E952:
	bl sub_0802B040
	adds r6, #4
	ldr r1, [r4]
	ldr r0, [r6]
	str r0, [r1]
	adds r0, r5, #0
	ldrb r2, [r6, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800E952
_0800E968:
	bl sub_0802B050
_0800E96C:
	movs r0, #4
	ldrh r7, [r7]
	ands r0, r7
	cmp r0, #0
	bne _0800E984
	mov r0, r8
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800E9AC
_0800E984:
	bl sub_08029F20
	bl sub_08053C1C
	ldr r1, _0800E9A8 @ =0x0203A858
	movs r0, #0
	str r0, [r1, #0x18]
	b _0800E9F2
	.align 2, 0
_0800E994: .4byte 0x0203A3EC
_0800E998: .4byte 0x0203A46C
_0800E99C: .4byte 0x0203A434
_0800E9A0: .4byte 0x0203A3D4
_0800E9A4: .4byte 0x0203A508
_0800E9A8: .4byte 0x0203A858
_0800E9AC:
	bl sub_080157A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	adds r1, #0x52
	strh r0, [r1]
	ldr r0, _0800EA04 @ =sub_0800EA10
	mov r1, r8
	str r0, [r1, #0x40]
	mov r0, sb
	bl UnitBeginAction
	ldr r4, _0800EA08 @ =0x030045B0
	ldr r0, [r4]
	bl sub_08026A00
	ldr r0, [r4]
	bl sub_0806C2DC
	bl sub_0806C7CC
	bl sub_0802A860
	mov r0, r8
	movs r1, #7
	bl sub_0800463C
	ldr r1, _0800EA0C @ =0x0203A978
	mov r2, sb
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #2]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #3]
	movs r0, #2
_0800E9F2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800EA04: .4byte sub_0800EA10
_0800EA08: .4byte 0x030045B0
_0800EA0C: .4byte 0x0203A978

	thumb_func_start sub_0800EA10
sub_0800EA10: @ 0x0800EA10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_080157A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0800EA34
	ldr r0, _0800EA3C @ =sub_0800EA44
	str r0, [r5, #0x40]
	bl sub_08029F20
	ldr r1, _0800EA40 @ =0x0203A858
	movs r0, #0
	str r0, [r1, #0x18]
_0800EA34:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EA3C: .4byte sub_0800EA44
_0800EA40: .4byte 0x0203A858

	thumb_func_start sub_0800EA44
sub_0800EA44: @ 0x0800EA44
	push {lr}
	movs r1, #0
	str r1, [r0, #0x40]
	movs r1, #6
	bl sub_0800463C
	bl sub_08035714
	pop {r0}
	bx r0

	thumb_func_start sub_0800EA58
sub_0800EA58: @ 0x0800EA58
	adds r0, #0x5e
	movs r1, #0x10
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0800EA68
sub_0800EA68: @ 0x0800EA68
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0800EA74
sub_0800EA74: @ 0x0800EA74
	movs r1, #0
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr

	thumb_func_start sub_0800EA7C
sub_0800EA7C: @ 0x0800EA7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EA98 @ =0x08C00C88
	adds r1, r4, #0
	bl sub_080043D4
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EA98: .4byte 0x08C00C88

	thumb_func_start sub_0800EA9C
sub_0800EA9C: @ 0x0800EA9C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800EAB8
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl sub_0802E368
	b _0800EAC8
_0800EAB8:
	ldr r0, _0800EAD0 @ =0x08C00C88
	adds r1, r4, #0
	bl sub_080043D4
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
_0800EAC8:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EAD0: .4byte 0x08C00C88

	thumb_func_start sub_0800EAD4
sub_0800EAD4: @ 0x0800EAD4
	push {lr}
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0802E368
	pop {r0}
	bx r0

	thumb_func_start sub_0800EAE4
sub_0800EAE4: @ 0x0800EAE4
	push {lr}
	ldr r1, [r0, #0x30]
	ldrh r2, [r1, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800EAFE
	adds r0, r2, #0
	bl sub_0801DEFC
	b _0800EB04
_0800EAFE:
	adds r0, r2, #0
	bl sub_0801DF38
_0800EB04:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800EB0C
sub_0800EB0C: @ 0x0800EB0C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl sub_0801DF38
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800EB1C
sub_0800EB1C: @ 0x0800EB1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r1, #4]
	ldrb r1, [r1, #8]
	bl sub_0801759C
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	bl sub_0807A0B4
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800EB3C
sub_0800EB3C: @ 0x0800EB3C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl sub_0800AE98
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800EB4C
sub_0800EB4C: @ 0x0800EB4C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0800EB66
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x30]
	str r5, [r4, #0x34]
	str r5, [r4, #0x38]
	movs r5, #1
	b _0800EB6C
_0800EB66:
	adds r0, r4, #0
	bl sub_0800457C
_0800EB6C:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800EB90
	ldr r0, _0800EB8C @ =0x08BFF970
	bl sub_08004584
	cmp r0, #0
	beq _0800EB9E
	bl sub_0800EC08
	b _0800EB9E
	.align 2, 0
_0800EB8C: .4byte 0x08BFF970
_0800EB90:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800EB9E
	adds r0, r4, #0
	bl sub_0800EBBC
_0800EB9E:
	cmp r5, #0
	bne _0800EBA6
	movs r0, #2
	b _0800EBA8
_0800EBA6:
	movs r0, #1
_0800EBA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800EBB0
sub_0800EBB0: @ 0x0800EBB0
	push {lr}
	bl sub_0800EB4C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800EBBC
sub_0800EBBC: @ 0x0800EBBC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800EBD2
	bl sub_0800EC08
	b _0800EBFA
_0800EBD2:
	ldr r5, _0800EC00 @ =0x08BFF970
	adds r0, r5, #0
	bl sub_08004584
	cmp r0, #0
	beq _0800EBFA
	bl sub_080095E4
	ldr r1, _0800EC04 @ =sub_080073F4
	adds r0, r5, #0
	bl sub_08004670
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl sub_080149B4
_0800EBFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC00: .4byte 0x08BFF970
_0800EC04: .4byte sub_080073F4

	thumb_func_start sub_0800EC08
sub_0800EC08: @ 0x0800EC08
	push {lr}
	bl sub_080095E4
	ldr r0, _0800EC20 @ =0x08BFF970
	bl sub_08004748
	bl sub_080069C4
	bl sub_08007C64
	pop {r0}
	bx r0
	.align 2, 0
_0800EC20: .4byte 0x08BFF970

	thumb_func_start nullsub_27
nullsub_27: @ 0x0800EC24
	bx lr
	.align 2, 0

	thumb_func_start nullsub_28
nullsub_28: @ 0x0800EC28
	bx lr
	.align 2, 0

	thumb_func_start sub_0800EC2C
sub_0800EC2C: @ 0x0800EC2C
	push {lr}
	movs r0, #6
	bl sub_080045D0
	cmp r0, #0
	beq _0800EC3A
	movs r0, #1
_0800EC3A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800EC40
sub_0800EC40: @ 0x0800EC40
	push {lr}
	ldr r0, _0800EC54 @ =0x08BFFF78
	bl sub_080045A4
	cmp r0, #0
	beq _0800EC4E
	movs r0, #1
_0800EC4E:
	pop {r1}
	bx r1
	.align 2, 0
_0800EC54: .4byte 0x08BFFF78

	thumb_func_start sub_0800EC58
sub_0800EC58: @ 0x0800EC58
	push {lr}
	movs r0, #6
	bl sub_08004710
	movs r0, #7
	bl sub_08004710
	movs r0, #5
	bl sub_08004710
	bl sub_0806D4A4
	pop {r0}
	bx r0

	thumb_func_start sub_0800EC74
sub_0800EC74: @ 0x0800EC74
	push {lr}
	ldr r0, _0800EC80 @ =0x08C00CC8
	bl sub_080069E0
	pop {r0}
	bx r0
	.align 2, 0
_0800EC80: .4byte 0x08C00CC8

	thumb_func_start sub_0800EC84
sub_0800EC84: @ 0x0800EC84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EC98 @ =0x08C00CE8
	bl sub_0800AE98
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EC98: .4byte 0x08C00CE8

	thumb_func_start sub_0800EC9C
sub_0800EC9C: @ 0x0800EC9C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0800ECB4 @ =0x08C00CF8
	bl sub_0800AE98
	str r4, [r0, #0x48]
	str r5, [r0, #0x58]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800ECB4: .4byte 0x08C00CF8

	thumb_func_start sub_0800ECB8
sub_0800ECB8: @ 0x0800ECB8
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _0800ECC8
	movs r1, #0
	bl sub_0800376C
	b _0800ECCE
_0800ECC8:
	movs r0, #0x90
	bl sub_0800348C
_0800ECCE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800ECD4
sub_0800ECD4: @ 0x0800ECD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800ECE8 @ =0x08C00D20
	bl sub_0800AE98
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800ECE8: .4byte 0x08C00D20

	thumb_func_start sub_0800ECEC
sub_0800ECEC: @ 0x0800ECEC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800ACD0
	ldr r0, _0800ED0C @ =0x08C00D44
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED0C: .4byte 0x08C00D44

	thumb_func_start sub_0800ED10
sub_0800ED10: @ 0x0800ED10
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800ACD0
	ldr r0, _0800ED30 @ =0x08C00D84
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED30: .4byte 0x08C00D84

	thumb_func_start sub_0800ED34
sub_0800ED34: @ 0x0800ED34
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800ACD0
	ldr r0, _0800ED54 @ =0x08C00DC4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED54: .4byte 0x08C00DC4

	thumb_func_start sub_0800ED58
sub_0800ED58: @ 0x0800ED58
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0800ACDC
	ldr r0, _0800ED7C @ =0x030045B0
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800ED84
	ldr r0, _0800ED80 @ =0x08C00DEC
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
	b _0800ED90
	.align 2, 0
_0800ED7C: .4byte 0x030045B0
_0800ED80: .4byte 0x08C00DEC
_0800ED84:
	ldr r0, _0800ED98 @ =0x08C00E24
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
_0800ED90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED98: .4byte 0x08C00E24

	thumb_func_start sub_0800ED9C
sub_0800ED9C: @ 0x0800ED9C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0800ACDC
	ldr r0, _0800EDB8 @ =0x08C00DEC
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EDB8: .4byte 0x08C00DEC

	thumb_func_start sub_0800EDBC
sub_0800EDBC: @ 0x0800EDBC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800ACD0
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	cmp r0, #0
	bne _0800EDE8
	ldr r0, _0800EDE4 @ =0x08C00E5C
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl sub_0800ACE8
	b _0800EDF4
	.align 2, 0
_0800EDE4: .4byte 0x08C00E5C
_0800EDE8:
	ldr r0, _0800EDFC @ =0x08C00E9C
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl sub_0800ACE8
_0800EDF4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EDFC: .4byte 0x08C00E9C

	thumb_func_start sub_0800EE00
sub_0800EE00: @ 0x0800EE00
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800ACD0
	ldr r0, _0800EE28 @ =0x030045B0
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800EE30
	ldr r0, _0800EE2C @ =0x08C00EDC
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
	b _0800EE3C
	.align 2, 0
_0800EE28: .4byte 0x030045B0
_0800EE2C: .4byte 0x08C00EDC
_0800EE30:
	ldr r0, _0800EE44 @ =0x08C00F1C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800ACE8
_0800EE3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE44: .4byte 0x08C00F1C

	thumb_func_start sub_0800EE48
sub_0800EE48: @ 0x0800EE48
	push {lr}
	adds r3, r0, #0
	ldr r0, _0800EE5C @ =0x08C00F5C
	movs r1, #0x60
	movs r2, #0
	bl sub_0800ACE8
	pop {r0}
	bx r0
	.align 2, 0
_0800EE5C: .4byte 0x08C00F5C

	thumb_func_start sub_0800EE60
sub_0800EE60: @ 0x0800EE60
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r2, #7
	bhi _0800EE7C
	ldr r0, _0800EE78 @ =0x08C00F7C
	adds r1, r2, #0
	bl Proc_Start
	b _0800EE84
	.align 2, 0
_0800EE78: .4byte 0x08C00F7C
_0800EE7C:
	ldr r0, _0800EEA4 @ =0x08C00F7C
	adds r1, r2, #0
	bl sub_080043D4
_0800EE84:
	str r5, [r0, #0x58]
	str r4, [r0, #0x54]
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _0800EE9C
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_0800EE9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEA4: .4byte 0x08C00F7C

	thumb_func_start sub_0800EEA8
sub_0800EEA8: @ 0x0800EEA8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x58]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0800EDBC
	pop {r0}
	bx r0

	thumb_func_start sub_0800EEBC
sub_0800EEBC: @ 0x0800EEBC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x58]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_0801DCB4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0800EED8
sub_0800EED8: @ 0x0800EED8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800EEF0 @ =0x08C00FAC
	bl sub_0800AE98
	adds r0, #0x5c
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEF0: .4byte 0x08C00FAC

	thumb_func_start sub_0800EEF4
sub_0800EEF4: @ 0x0800EEF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800EF18 @ =0x08C00FC4
	bl sub_0800AE98
	adds r1, r0, #0
	adds r1, #0x55
	strb r4, [r1]
	adds r0, #0x5c
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF18: .4byte 0x08C00FC4

	thumb_func_start sub_0800EF1C
sub_0800EF1C: @ 0x0800EF1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EF30 @ =0x08C00FE0
	bl sub_0800AE98
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF30: .4byte 0x08C00FE0

	thumb_func_start sub_0800EF34
sub_0800EF34: @ 0x0800EF34
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800EF4C @ =0x08C00FF8
	bl sub_0800AE98
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF4C: .4byte 0x08C00FF8

	thumb_func_start sub_0800EF50
sub_0800EF50: @ 0x0800EF50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0800EF74 @ =0x08C01004
	bl sub_0800AE98
	adds r1, r0, #0
	adds r1, #0x5c
	strh r4, [r1]
	adds r0, #0x4f
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF74: .4byte 0x08C01004

	thumb_func_start sub_0800EF78
sub_0800EF78: @ 0x0800EF78
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800EF94 @ =0x08C01020
	bl sub_0800AE98
	str r5, [r0, #0x58]
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF94: .4byte 0x08C01020

	thumb_func_start sub_0800EF98
sub_0800EF98: @ 0x0800EF98
	push {lr}
	ldr r0, _0800EFB4 @ =0x08BFFF78
	bl sub_08004584
	cmp r0, #0
	beq _0800EFAE
	adds r0, #0x5e
	movs r1, #2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_0800EFAE:
	pop {r0}
	bx r0
	.align 2, 0
_0800EFB4: .4byte 0x08BFFF78

	thumb_func_start sub_0800EFB8
sub_0800EFB8: @ 0x0800EFB8
	push {lr}
	bl sub_08079A50
	adds r1, r0, #0
	movs r2, #0
	b _0800EFC8
_0800EFC4:
	adds r2, #1
	adds r1, #0x10
_0800EFC8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800EFC4
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800EFD4
sub_0800EFD4: @ 0x0800EFD4
	push {r4, r5, r6, r7, lr}
	bl sub_08079A50
	adds r6, r0, #0
	movs r7, #1
_0800EFDE:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0800F062
	ldr r2, [r4]
	cmp r2, #0
	beq _0800F062
	ldrb r0, [r6]
	cmp r0, #0
	bne _0800EFFC
	movs r0, #0xff
	strb r0, [r4, #0x10]
	b _0800F062
_0800EFFC:
	ldr r0, [r4, #0xc]
	ldr r1, _0800F050 @ =0x0201000C
	ands r0, r1
	cmp r0, #0
	bne _0800F062
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800F058
	ldr r5, _0800F054 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0800F02C
	movs r1, #1
_0800F02C:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _0800F046
	movs r1, #1
_0800F046:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	b _0800F062
	.align 2, 0
_0800F050: .4byte 0x0201000C
_0800F054: .4byte gPlaySt
_0800F058:
	ldrb r0, [r6, #6]
	strb r0, [r4, #0x10]
	ldrb r0, [r6, #7]
	strb r0, [r4, #0x11]
	adds r6, #0x10
_0800F062:
	adds r7, #1
	cmp r7, #0x3f
	ble _0800EFDE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800F070
sub_0800F070: @ 0x0800F070
	push {r4, r5, lr}
	movs r4, #1
	movs r5, #1
	rsbs r5, r5, #0
_0800F078:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800F0BE
	ldr r0, [r2]
	cmp r0, #0
	beq _0800F0BE
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800F0BE
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F0A8
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
	b _0800F0BE
_0800F0A8:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800F0BE
	adds r0, r2, #0
	bl sub_0800F0CC
_0800F0BE:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800F078
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800F0CC
sub_0800F0CC: @ 0x0800F0CC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08079A50
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F176
	ldr r4, _0800F124 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0800F0FE
	movs r1, #1
_0800F0FE:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0800F118
	movs r1, #1
_0800F118:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7, #0x11]
	b _0800F17C
	.align 2, 0
_0800F124: .4byte gPlaySt
_0800F128:
	ldrb r0, [r4, #6]
	strb r0, [r7, #0x10]
	ldrb r0, [r4, #7]
	strb r0, [r7, #0x11]
	b _0800F17C
_0800F132:
	movs r6, #0
	movs r5, #1
	b _0800F13A
_0800F138:
	adds r5, #1
_0800F13A:
	cmp r5, #0x3f
	bgt _0800F170
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800F138
	ldr r0, [r2]
	cmp r0, #0
	beq _0800F138
	ldr r0, [r2, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800F138
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r1, [r4, #6]
	cmp r0, r1
	bne _0800F138
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0800F138
	movs r6, #1
_0800F170:
	cmp r6, #0
	beq _0800F128
	adds r4, #0x10
_0800F176:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800F132
_0800F17C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_29
nullsub_29: @ 0x0800F184
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F188
sub_0800F188: @ 0x0800F188
	push {r4, r5, r6, lr}
	movs r6, #1
_0800F18C:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0800F1F0
	ldr r1, [r4]
	cmp r1, #0
	beq _0800F1F0
	ldr r0, [r4, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800F1F0
	ldr r5, _0800F1FC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0800F1C4
	movs r1, #1
_0800F1C4:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _0800F1DE
	movs r1, #1
_0800F1DE:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
_0800F1F0:
	adds r6, #1
	cmp r6, #0x3f
	ble _0800F18C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F1FC: .4byte gPlaySt

	thumb_func_start sub_0800F200
sub_0800F200: @ 0x0800F200
	adds r0, #0x4d
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_0800F208
sub_0800F208: @ 0x0800F208
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0800F222
	adds r0, r2, #0
	adds r0, #0x4d
	strb r1, [r0]
_0800F222:
	bx lr

	thumb_func_start sub_0800F224
sub_0800F224: @ 0x0800F224
	push {lr}
	movs r0, #0
	bl sub_0802E368
	pop {r0}
	bx r0

	thumb_func_start sub_0800F230
sub_0800F230: @ 0x0800F230
	push {lr}
	movs r0, #6
	bl sub_0802E368
	pop {r0}
	bx r0

	thumb_func_start sub_0800F23C
sub_0800F23C: @ 0x0800F23C
	push {lr}
	ldr r0, _0800F24C @ =0x03005C40
	movs r1, #3
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_0800F24C: .4byte 0x03005C40

	thumb_func_start sub_0800F250
sub_0800F250: @ 0x0800F250
	push {lr}
	ldr r0, _0800F260 @ =0x03005A30
	movs r1, #3
	bl m4aMPlayFadeOutPause
	pop {r0}
	bx r0
	.align 2, 0
_0800F260: .4byte 0x03005A30

	thumb_func_start sub_0800F264
sub_0800F264: @ 0x0800F264
	push {lr}
	ldr r0, _0800F274 @ =0x03005A30
	movs r1, #2
	bl m4aMPlayFadeInContinue
	pop {r0}
	bx r0
	.align 2, 0
_0800F274: .4byte 0x03005A30

	thumb_func_start sub_0800F278
sub_0800F278: @ 0x0800F278
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F298
	ldr r4, _0800F294 @ =0x0000FFFF
	ands r4, r2
	b _0800F29C
	.align 2, 0
_0800F294: .4byte 0x0000FFFF
_0800F298:
	movs r4, #1
	rsbs r4, r4, #0
_0800F29C:
	ldr r2, [r3, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F2B0
	adds r6, r1, #0
_0800F2B0:
	ldr r5, [r2, #0xc]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F2D8
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_080B6374
	adds r0, r5, #0
	bl sub_080B63DC
	movs r0, #2
	b _0800F2DA
_0800F2D8:
	movs r0, #0
_0800F2DA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F2E0
sub_0800F2E0: @ 0x0800F2E0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F2FC
	adds r0, r2, #0
	bl sub_08014510
	movs r0, #2
	b _0800F31C
_0800F2FC:
	ldr r2, _0800F320 @ =0x03002790
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
	movs r0, #0
_0800F31C:
	pop {r1}
	bx r1
	.align 2, 0
_0800F320: .4byte 0x03002790

	thumb_func_start sub_0800F324
sub_0800F324: @ 0x0800F324
	push {lr}
	bl sub_080B63AC
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800F330
sub_0800F330: @ 0x0800F330
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F34C
	ldr r3, _0800F348 @ =0x0000FFFF
	ands r3, r2
	b _0800F350
	.align 2, 0
_0800F348: .4byte 0x0000FFFF
_0800F34C:
	movs r3, #1
	rsbs r3, r3, #0
_0800F350:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800F364
	adds r4, r2, #0
_0800F364:
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F37C
	adds r0, r3, #0
	adds r1, r4, #0
	bl nullsub_3
	movs r0, #2
	b _0800F37E
_0800F37C:
	movs r0, #0
_0800F37E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F384
sub_0800F384: @ 0x0800F384
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F39A
	bl nullsub_4
	movs r0, #2
	b _0800F39C
_0800F39A:
	movs r0, #0
_0800F39C:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F3A0
sub_0800F3A0: @ 0x0800F3A0
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F3BC
	ldr r4, _0800F3B8 @ =0x0000FFFF
	ands r4, r2
	b _0800F3C0
	.align 2, 0
_0800F3B8: .4byte 0x0000FFFF
_0800F3BC:
	movs r4, #1
	rsbs r4, r4, #0
_0800F3C0:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F3D4
	adds r5, r2, #0
_0800F3D4:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F3F0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5D98
	movs r0, #2
	b _0800F3F2
_0800F3F0:
	movs r0, #0
_0800F3F2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F3F8
sub_0800F3F8: @ 0x0800F3F8
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F414
	ldr r3, _0800F410 @ =0x0000FFFF
	ands r3, r2
	b _0800F418
	.align 2, 0
_0800F410: .4byte 0x0000FFFF
_0800F414:
	movs r3, #1
	rsbs r3, r3, #0
_0800F418:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800F42C
	adds r4, r2, #0
_0800F42C:
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F444
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080B6964
	movs r0, #2
	b _0800F446
_0800F444:
	movs r0, #0
_0800F446:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F44C
sub_0800F44C: @ 0x0800F44C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B698C
	adds r4, #0x5e
	movs r0, #4
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800F464
	movs r0, #2
	b _0800F466
_0800F464:
	movs r0, #0
_0800F466:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F46C
sub_0800F46C: @ 0x0800F46C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r4, [r1, #4]
	ldr r5, [r1, #8]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F4AE
	cmp r2, #0
	beq _0800F4A2
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_080B6580
	b _0800F4AE
_0800F4A2:
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B6C
_0800F4AE:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start nullsub_13
nullsub_13: @ 0x0800F4B8
	bx lr
	.align 2, 0

	thumb_func_start nullsub_14
nullsub_14: @ 0x0800F4BC
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F4C0
sub_0800F4C0: @ 0x0800F4C0
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r4, [r1, #8]
	ldr r3, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F4E4
	adds r0, r2, #0
	bl sub_08006BE0
	b _0800F504
_0800F4E4:
	cmp r3, #0
	beq _0800F4FA
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r0, r3, #0
	movs r1, #7
	movs r3, #0
	bl sub_080B6580
	b _0800F504
_0800F4FA:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_080B5CA8
_0800F504:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start nullsub_15
nullsub_15: @ 0x0800F510
	bx lr
	.align 2, 0

	thumb_func_start nullsub_16
nullsub_16: @ 0x0800F514
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F518
sub_0800F518: @ 0x0800F518
	push {lr}
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	bl sub_08006BE0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800F528
sub_0800F528: @ 0x0800F528
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _0800F53E
	movs r0, #0
	b _0800F55C
_0800F53E:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl sub_080B5E04
	ldr r0, _0800F564 @ =sub_0800BCF0
	str r0, [r4, #0x40]
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0800F55A
	movs r0, #4
	bl sub_08007F24
_0800F55A:
	movs r0, #2
_0800F55C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800F564: .4byte sub_0800BCF0

	thumb_func_start sub_0800F568
sub_0800F568: @ 0x0800F568
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F580
	movs r0, #1
	bl sub_080B4B58
	movs r0, #2
	b _0800F582
_0800F580:
	movs r0, #0
_0800F582:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F588
sub_0800F588: @ 0x0800F588
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F5A0
	movs r0, #0
	bl sub_080B4B58
	movs r0, #2
	b _0800F5A2
_0800F5A0:
	movs r0, #0
_0800F5A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F5A8
sub_0800F5A8: @ 0x0800F5A8
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F5BE
	bl sub_080B4BB0
	movs r0, #2
	b _0800F5C0
_0800F5BE:
	movs r0, #0
_0800F5C0:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F5C4
sub_0800F5C4: @ 0x0800F5C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r7, [r0, #4]
	ldr r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800F5E4
	ldr r4, _0800F5E0 @ =0x0000FFFF
	ands r4, r3
	b _0800F5E8
	.align 2, 0
_0800F5E0: .4byte 0x0000FFFF
_0800F5E4:
	movs r4, #1
	rsbs r4, r4, #0
_0800F5E8:
	ldr r1, [r2, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F5FC
	adds r5, r3, #0
_0800F5FC:
	ldr r6, [r1, #0xc]
	ldr r3, [r1, #0x10]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F632
	cmp r3, #0
	beq _0800F626
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r3, #0
	movs r1, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_080B6580
	b _0800F632
_0800F626:
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_080B5724
_0800F632:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F63C
sub_0800F63C: @ 0x0800F63C
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F672
	cmp r3, #0
	beq _0800F66C
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r3, #0
	movs r1, #1
	movs r3, #0
	bl sub_080B6580
	b _0800F672
_0800F66C:
	adds r0, r2, #0
	bl sub_080B58FC
_0800F672:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F67C
sub_0800F67C: @ 0x0800F67C
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r4, [r1, #8]
	ldr r2, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F6B8
	cmp r2, #0
	beq _0800F6B0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r2, #0
	movs r1, #2
	adds r2, r3, #0
	adds r3, r4, #0
	bl sub_080B6580
	b _0800F6B8
_0800F6B0:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080B4810
_0800F6B8:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F6C4
sub_0800F6C4: @ 0x0800F6C4
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F6E2
	movs r0, #0
	b _0800F700
_0800F6E2:
	cmp r3, #0
	beq _0800F6F8
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r3, #0
	movs r1, #3
	movs r3, #0
	bl sub_080B6580
	b _0800F6FE
_0800F6F8:
	adds r0, r2, #0
	bl sub_080B4934
_0800F6FE:
	movs r0, #2
_0800F700:
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F708
sub_0800F708: @ 0x0800F708
	movs r1, #0
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F710
sub_0800F710: @ 0x0800F710
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F726
	bl sub_080B49A8
	movs r0, #2
	b _0800F728
_0800F726:
	movs r0, #0
_0800F728:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F72C
sub_0800F72C: @ 0x0800F72C
	movs r1, #0
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F734
sub_0800F734: @ 0x0800F734
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F74A
	bl sub_080B4A20
	movs r0, #2
	b _0800F74C
_0800F74A:
	movs r0, #0
_0800F74C:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F750
sub_0800F750: @ 0x0800F750
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F788
	cmp r2, #0
	beq _0800F782
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xa
	movs r2, #0
	movs r3, #0
	bl sub_080B6580
	b _0800F788
_0800F782:
	adds r0, r3, #0
	bl sub_080B6664
_0800F788:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F790
sub_0800F790: @ 0x0800F790
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F7C8
	cmp r2, #0
	beq _0800F7C2
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #9
	movs r2, #0
	movs r3, #0
	bl sub_080B6580
	b _0800F7C8
_0800F7C2:
	adds r0, r3, #0
	bl sub_080B6754
_0800F7C8:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F7D0
sub_0800F7D0: @ 0x0800F7D0
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F808
	cmp r2, #0
	beq _0800F802
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xc
	movs r2, #0
	movs r3, #0
	bl sub_080B6580
	b _0800F808
_0800F802:
	adds r0, r3, #0
	bl sub_080B56B0
_0800F808:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F810
sub_0800F810: @ 0x0800F810
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F848
	cmp r2, #0
	beq _0800F842
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xb
	movs r2, #0
	movs r3, #0
	bl sub_080B6580
	b _0800F848
_0800F842:
	adds r0, r3, #0
	bl sub_080B5648
_0800F848:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F850
sub_0800F850: @ 0x0800F850
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F86C
	ldr r4, _0800F868 @ =0x0000FFFF
	ands r4, r2
	b _0800F870
	.align 2, 0
_0800F868: .4byte 0x0000FFFF
_0800F86C:
	movs r4, #1
	rsbs r4, r4, #0
_0800F870:
	ldr r2, [r1, #0x30]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F884
	adds r5, r3, #0
_0800F884:
	ldr r2, [r2, #8]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F89A
	adds r0, r4, #0
	adds r1, r5, #0
	bl nullsub_5
_0800F89A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F8A4
sub_0800F8A4: @ 0x0800F8A4
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F8B6
	bl nullsub_6
_0800F8B6:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800F8BC
sub_0800F8BC: @ 0x0800F8BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F8DC
	ldr r5, _0800F8D8 @ =0x0000FFFF
	ands r5, r2
	b _0800F8E0
	.align 2, 0
_0800F8D8: .4byte 0x0000FFFF
_0800F8DC:
	movs r5, #1
	rsbs r5, r5, #0
_0800F8E0:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F8F4
	adds r6, r3, #0
_0800F8F4:
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F930
	cmp r2, #0
	beq _0800F91E
	str r5, [sp]
	str r6, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #5
	adds r2, r7, #0
	movs r3, #0
	bl sub_080B6580
	b _0800F930
_0800F91E:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	bl sub_080B5A80
_0800F930:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F93C
sub_0800F93C: @ 0x0800F93C
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F954
	adds r0, r2, #0
	bl sub_080B5B34
_0800F954:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F95C
sub_0800F95C: @ 0x0800F95C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F97C
	ldr r5, _0800F978 @ =0x0000FFFF
	ands r5, r2
	b _0800F980
	.align 2, 0
_0800F978: .4byte 0x0000FFFF
_0800F97C:
	movs r5, #1
	rsbs r5, r5, #0
_0800F980:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F994
	adds r6, r3, #0
_0800F994:
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F9D0
	cmp r2, #0
	beq _0800F9BE
	str r5, [sp]
	str r6, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #4
	adds r2, r7, #0
	movs r3, #0
	bl sub_080B6580
	b _0800F9D0
_0800F9BE:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	bl sub_080B59AC
_0800F9D0:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F9DC
sub_0800F9DC: @ 0x0800F9DC
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F9F4
	adds r0, r2, #0
	bl sub_080B5A48
_0800F9F4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F9FC
sub_0800F9FC: @ 0x0800F9FC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FA1C
	ldr r4, _0800FA18 @ =0x0000FFFF
	ands r4, r2
	b _0800FA20
	.align 2, 0
_0800FA18: .4byte 0x0000FFFF
_0800FA1C:
	movs r4, #1
	rsbs r4, r4, #0
_0800FA20:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FA34
	adds r5, r2, #0
_0800FA34:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800FA48
	movs r0, #0
	b _0800FA6A
_0800FA48:
	cmp r3, #0
	beq _0800FA60
	str r4, [sp]
	str r5, [sp, #4]
	str r2, [sp, #8]
	adds r0, r3, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0
	bl sub_080B6580
	b _0800FA68
_0800FA60:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5DBC
_0800FA68:
	movs r0, #2
_0800FA6A:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FA74
sub_0800FA74: @ 0x0800FA74
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl sub_08001CA8
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800FA84
sub_0800FA84: @ 0x0800FA84
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl sub_0802ACE0
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800FA94
sub_0800FA94: @ 0x0800FA94
	push {lr}
	bl sub_0804B378
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800FAA0
sub_0800FAA0: @ 0x0800FAA0
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FAB4 @ =sub_0804B0DC
	movs r1, #1
	bl sub_0804B3F8
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FAB4: .4byte sub_0804B0DC

	thumb_func_start sub_0800FAB8
sub_0800FAB8: @ 0x0800FAB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FADC @ =sub_0804B0D8
	movs r1, #1
	bl sub_0804B3F8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FAE0 @ =sub_0801B624
	movs r1, #2
	bl sub_0804B3F8
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800FADC: .4byte sub_0804B0D8
_0800FAE0: .4byte sub_0801B624

	thumb_func_start sub_0800FAE4
sub_0800FAE4: @ 0x0800FAE4
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FAF8 @ =sub_0804B0D4
	movs r1, #1
	bl sub_0804B3F8
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FAF8: .4byte sub_0804B0D4

	thumb_func_start sub_0800FAFC
sub_0800FAFC: @ 0x0800FAFC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x30]
	ldrh r6, [r3, #2]
	movs r4, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FB9A
	ldr r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FB2C
	ldr r3, _0800FB28 @ =0x0000FFFF
	ands r3, r1
	b _0800FB30
	.align 2, 0
_0800FB28: .4byte 0x0000FFFF
_0800FB2C:
	movs r3, #1
	rsbs r3, r3, #0
_0800FB30:
	ldr r1, [r2, #0x30]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FB44
	adds r5, r2, #0
_0800FB44:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_08084000
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _0800FB5C
	movs r0, #0x10
	orrs r4, r0
_0800FB5C:
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0800FB6C
	movs r0, #0x80
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FB6C:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _0800FB80
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FB80:
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	beq _0800FB90
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FB90:
	cmp r6, #0
	beq _0800FB9A
	adds r0, r4, #0
	bl sub_08083B9C
_0800FB9A:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FBA4
sub_0800FBA4: @ 0x0800FBA4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FC36
	bl sub_0807AE3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FBFC
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FBD8
	ldr r3, _0800FBD4 @ =0x0000FFFF
	ands r3, r2
	b _0800FBDC
	.align 2, 0
_0800FBD4: .4byte 0x0000FFFF
_0800FBD8:
	movs r3, #1
	rsbs r3, r3, #0
_0800FBDC:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FBEE
	adds r4, r2, #0
_0800FBEE:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_08084000
	b _0800FC36
_0800FBFC:
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FC14
	ldr r3, _0800FC10 @ =0x0000FFFF
	ands r3, r2
	b _0800FC18
	.align 2, 0
_0800FC10: .4byte 0x0000FFFF
_0800FC14:
	movs r3, #1
	rsbs r3, r3, #0
_0800FC18:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FC2A
	adds r4, r2, #0
_0800FC2A:
	ldr r2, [r1, #0xc]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_08084000
_0800FC36:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FC40
sub_0800FC40: @ 0x0800FC40
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FC54
	movs r0, #0
	bl sub_080850A8
_0800FC54:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FC5C
sub_0800FC5C: @ 0x0800FC5C
	push {lr}
	movs r0, #0
	bl sub_0807B158
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FC6C
sub_0800FC6C: @ 0x0800FC6C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800FC7E
	movs r0, #1
	bl sub_0807B158
	b _0800FC82
_0800FC7E:
	bl sub_0807B158
_0800FC82:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800FC88
sub_0800FC88: @ 0x0800FC88
	push {r4, lr}
	bl sub_0807A284
	ldr r4, _0800FCB8 @ =0x0202A5A0
	strb r0, [r4]
	bl sub_0807A2E4
	strb r0, [r4, #1]
	bl sub_0807A344
	strb r0, [r4, #2]
	bl sub_0807A3A4
	strb r0, [r4, #3]
	bl sub_0807A3DC
	strb r0, [r4, #4]
	bl sub_0807A414
	strb r0, [r4, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FCB8: .4byte 0x0202A5A0

	thumb_func_start sub_0800FCBC
sub_0800FCBC: @ 0x0800FCBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r4, [r0, #4]
	ldr r0, _0800FCF0 @ =0x0202A5A0
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800FCFC
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r0, _0800FCF4 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #8]
	str r0, [r5, #0x44]
	ldr r0, _0800FCF8 @ =sub_0800CF2C
	str r0, [r5, #0x40]
	movs r0, #2
	b _0800FCFE
	.align 2, 0
_0800FCF0: .4byte 0x0202A5A0
_0800FCF4: .4byte 0x0202E3F0
_0800FCF8: .4byte sub_0800CF2C
_0800FCFC:
	movs r0, #0
_0800FCFE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800FD04
sub_0800FD04: @ 0x0800FD04
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldr r5, [r0, #4]
	ldr r1, _0800FD3C @ =0x0202A5A0
	ldr r0, [r0, #8]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800FD36
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r6, #0
	adds r4, #0x5e
	ldr r0, _0800FD40 @ =0x0000FFFD
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800FD44
_0800FD36:
	movs r0, #0
	b _0800FD6E
	.align 2, 0
_0800FD3C: .4byte 0x0202A5A0
_0800FD40: .4byte 0x0000FFFD
_0800FD44:
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_08007C88
	ldr r2, [r5, #4]
	movs r0, #1
	movs r1, #1
	bl sub_08007EAC
	movs r0, #0x80
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0800FD68
	movs r0, #4
	bl sub_08007F24
_0800FD68:
	ldr r0, _0800FD74 @ =sub_0800BCF0
	str r0, [r6, #0x40]
	movs r0, #2
_0800FD6E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800FD74: .4byte sub_0800BCF0

	thumb_func_start sub_0800FD78
sub_0800FD78: @ 0x0800FD78
	push {r4, r5, lr}
	ldr r0, [r0, #0x30]
	ldr r4, [r0, #4]
	ldr r1, _0800FDC0 @ =0x0202A5A0
	ldr r0, [r0, #8]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800FDB6
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	movs r5, #2
	orrs r1, r5
	str r1, [r0, #0xc]
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0800FDB2
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	orrs r1, r5
	str r1, [r0, #0xc]
_0800FDB2:
	bl sub_08025BB0
_0800FDB6:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800FDC0: .4byte 0x0202A5A0

	thumb_func_start sub_0800FDC4
sub_0800FDC4: @ 0x0800FDC4
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x2c]
	str r2, [r0, #0x34]
	adds r1, #8
	str r1, [r0, #0x38]
	str r3, [r0, #0x30]
	str r3, [r0, #0x2c]
	movs r0, #1
	bx lr

	thumb_func_start sub_0800FDD8
sub_0800FDD8: @ 0x0800FDD8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FDF8
	ldr r5, _0800FDF4 @ =0x0000FFFF
	ands r5, r2
	b _0800FDFC
	.align 2, 0
_0800FDF4: .4byte 0x0000FFFF
_0800FDF8:
	movs r5, #1
	rsbs r5, r5, #0
_0800FDFC:
	ldr r3, [r4, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800FE10
	adds r6, r1, #0
_0800FE10:
	ldr r3, [r3, #8]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0800FE28
	movs r0, #0
	b _0800FE58
_0800FE28:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800FE44
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08020E5C
	b _0800FE56
_0800FE44:
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08020E5C
_0800FE56:
	movs r0, #2
_0800FE58:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0800FE60
sub_0800FE60: @ 0x0800FE60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #4
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0800FE88
	movs r0, #0
	b _0800FEBE
_0800FE88:
	movs r5, #0x10
	ldrsb r5, [r2, r5]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0800FEAC
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08020E5C
	b _0800FEBC
_0800FEAC:
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08020E5C
_0800FEBC:
	movs r0, #2
_0800FEBE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FEC8
sub_0800FEC8: @ 0x0800FEC8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FEE4
	ldr r2, _0800FEE0 @ =0x0000FFFF
	ands r2, r1
	b _0800FEE8
	.align 2, 0
_0800FEE0: .4byte 0x0000FFFF
_0800FEE4:
	movs r2, #1
	rsbs r2, r2, #0
_0800FEE8:
	ldr r3, [r5, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800FEFC
	adds r7, r1, #0
_0800FEFC:
	ldr r6, [r3, #8]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FF30
	adds r0, r2, #0
	bl sub_080B7084
	adds r4, r0, #0
	subs r4, #0x10
	adds r0, r7, #0
	bl sub_080B7094
	adds r2, r0, #0
	subs r2, #0x28
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08020ECC
	movs r0, #2
	b _0800FF32
_0800FF30:
	movs r0, #0
_0800FF32:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800FF38
sub_0800FF38: @ 0x0800FF38
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0800FF70 @ =0x080C86F4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x4a
	ldrh r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0xd
	str r2, [sp, #4]
	movs r2, #0
	bl sub_08012AF0
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x38]
	str r0, [r4, #0x3c]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FF70: .4byte 0x080C86F4

	thumb_func_start sub_0800FF74
sub_0800FF74: @ 0x0800FF74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, _08010014 @ =0x080C0E98
	movs r0, #0x48
	adds r0, r0, r6
	mov r8, r0
	ldrh r3, [r0]
	lsls r1, r3, #3
	movs r0, #0xff
	mov ip, r0
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r4, [r0, r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r5, [r1, r0]
	ldr r0, [r6, #0x38]
	ldr r3, [r6, #0x40]
	adds r0, r0, r3
	str r0, [r6, #0x38]
	ldr r1, [r6, #0x3c]
	ldr r7, [r6, #0x44]
	adds r1, r1, r7
	str r1, [r6, #0x3c]
	adds r0, r0, r4
	asrs r0, r0, #0xa
	ldr r2, [r6, #0x30]
	adds r4, r2, r0
	adds r1, r1, r5
	asrs r1, r1, #0xa
	ldr r0, [r6, #0x34]
	adds r2, r0, r1
	lsls r0, r3, #3
	subs r0, r0, r3
	cmp r0, #0
	bge _0800FFCC
	adds r0, #7
_0800FFCC:
	asrs r0, r0, #3
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, r0, r7
	cmp r0, #0
	bge _0800FFDA
	adds r0, #7
_0800FFDA:
	asrs r0, r0, #3
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x2c]
	ldr r1, _08010018 @ =0x000001FF
	ands r4, r1
	mov r1, ip
	ands r2, r1
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r3, [r1]
	adds r1, r4, #0
	bl sub_08012B70
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _0801000A
	adds r0, r6, #0
	bl sub_0800457C
_0801000A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010014: .4byte 0x080C0E98
_08010018: .4byte 0x000001FF

	thumb_func_start sub_0801001C
sub_0801001C: @ 0x0801001C
	push {lr}
	ldr r0, [r0, #0x2c]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0

	thumb_func_start sub_08010028
sub_08010028: @ 0x08010028
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r4, [sp, #0x1c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08010068 @ =0x08C01094
	adds r1, r7, #0
	bl Proc_Start
	adds r7, r0, #0
	str r5, [r7, #0x30]
	str r6, [r7, #0x34]
	mov r0, r8
	str r0, [r7, #0x40]
	mov r0, sb
	str r0, [r7, #0x44]
	adds r0, r7, #0
	adds r0, #0x4a
	strh r4, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010068: .4byte 0x08C01094

	thumb_func_start sub_0801006C
sub_0801006C: @ 0x0801006C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08010094 @ =0x08C010BC
	bl Proc_Start
	lsls r4, r4, #4
	ldr r1, _08010098 @ =0x0202BBB4
	ldrh r2, [r1, #0xc]
	subs r4, r4, r2
	adds r4, #8
	strh r4, [r0, #0x2a]
	lsls r5, r5, #4
	ldrh r1, [r1, #0xe]
	subs r5, r5, r1
	strh r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010094: .4byte 0x08C010BC
_08010098: .4byte 0x0202BBB4

	thumb_func_start sub_0801009C
sub_0801009C: @ 0x0801009C
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080100B8
	ldr r4, _080100B4 @ =0x0000FFFF
	ands r4, r1
	b _080100BC
	.align 2, 0
_080100B4: .4byte 0x0000FFFF
_080100B8:
	movs r4, #1
	rsbs r4, r4, #0
_080100BC:
	ldr r0, [r2, #0x30]
	ldrh r3, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080100D0
	adds r1, r3, #0
_080100D0:
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #4
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _080100E8
	adds r0, r4, #0
	bl sub_0801006C
	movs r0, #2
	b _080100EA
_080100E8:
	movs r0, #0
_080100EA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080100F0
sub_080100F0: @ 0x080100F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08010120 @ =0x080C8174
	ldr r1, _08010124 @ =0x06014000
	bl sub_08013688
	ldr r0, _08010128 @ =0x080C86D4
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_0800105C
	movs r1, #0
	movs r2, #0
	movs r0, #0x82
	lsls r0, r0, #8
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x36
	strb r1, [r0]
	str r2, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010120: .4byte 0x080C8174
_08010124: .4byte 0x06014000
_08010128: .4byte 0x080C86D4

	thumb_func_start sub_0801012C
sub_0801012C: @ 0x0801012C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080101A8
	ldr r1, [r5, #0x38]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	str r0, [r5, #0x38]
	ldr r2, _080101C0 @ =0x080C0E98
	movs r1, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r4, [r0, r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r3, [r1, r0]
	lsls r0, r4, #1
	adds r0, r0, r4
	asrs r2, r0, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _08010178
	rsbs r1, r4, #0
_08010178:
	adds r0, r3, #0
	cmp r3, #0
	bge _08010180
	rsbs r0, r3, #0
_08010180:
	cmp r1, r0
	ble _0801018A
	adds r4, r4, r3
	subs r3, r4, r3
	subs r4, r4, r3
_0801018A:
	cmp r3, #0
	ble _08010190
	rsbs r3, r3, #0
_08010190:
	movs r1, #0x2a
	ldrsh r0, [r5, r1]
	adds r0, r0, r2
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	adds r1, #4
	ldrh r2, [r5, #0x34]
	str r2, [sp]
	str r5, [sp, #4]
	adds r2, r4, #0
	bl sub_08010028
_080101A8:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _080101B8
	adds r0, r5, #0
	bl sub_0800457C
_080101B8:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080101C0: .4byte 0x080C0E98

	thumb_func_start nullsub_30
nullsub_30: @ 0x080101C4
	bx lr
	.align 2, 0

	thumb_func_start sub_080101C8
sub_080101C8: @ 0x080101C8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _08010220 @ =0x0819381C
	ldr r1, _08010224 @ =0x06014000
	bl sub_08013688
	ldr r0, _08010228 @ =0x08193CB8
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_0800105C
	movs r6, #0
	movs r0, #0
	mov r8, r0
	movs r3, #0x82
	lsls r3, r3, #8
	strh r3, [r5, #0x38]
	ldr r0, _0801022C @ =0x08193CD8
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	movs r4, #1
	str r4, [sp]
	movs r4, #0xd
	str r4, [sp, #4]
	bl sub_08012AF0
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x3a
	strb r6, [r0]
	mov r0, r8
	str r0, [r5, #0x3c]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010220: .4byte 0x0819381C
_08010224: .4byte 0x06014000
_08010228: .4byte 0x08193CB8
_0801022C: .4byte 0x08193CD8

	thumb_func_start sub_08010230
sub_08010230: @ 0x08010230
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	adds r5, r0, #0
	add r0, sp, #8
	ldr r1, _080102CC @ =0x0818F960
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	adds r7, r5, #0
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r6, [r7]
	adds r0, r6, #0
	movs r1, #0x14
	bl __modsi3
	mov r8, r0
	cmp r0, #0
	bne _080102B0
	ldr r4, _080102D0 @ =0x08193CD8
	mov sb, r4
	movs r0, #0x2a
	ldrsh r4, [r5, r0]
	adds r0, r6, #0
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #3
	mov r1, sp
	adds r1, r1, r0
	adds r1, #8
	ldr r1, [r1]
	lsls r1, r1, #4
	adds r4, r4, r1
	adds r4, #8
	ldr r1, _080102D4 @ =0x000001FF
	ands r4, r1
	movs r1, #0x2c
	ldrsh r2, [r5, r1]
	add r1, sp, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	movs r0, #0xff
	ands r2, r0
	ldrh r3, [r5, #0x38]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	mov r0, sb
	adds r1, r4, #0
	bl sub_08012AF0
_080102B0:
	ldrb r7, [r7]
	cmp r7, #0x50
	ble _080102BC
	adds r0, r5, #0
	bl sub_0800457C
_080102BC:
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080102CC: .4byte 0x0818F960
_080102D0: .4byte 0x08193CD8
_080102D4: .4byte 0x000001FF

	thumb_func_start nullsub_31
nullsub_31: @ 0x080102D8
	bx lr
	.align 2, 0

	thumb_func_start sub_080102DC
sub_080102DC: @ 0x080102DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08010308 @ =0x08C010EC
	bl Proc_Start
	lsls r4, r4, #4
	ldr r1, _0801030C @ =0x0202BBB4
	ldrh r2, [r1, #0xc]
	subs r4, r4, r2
	adds r4, #0x10
	strh r4, [r0, #0x2a]
	lsls r5, r5, #4
	ldrh r1, [r1, #0xe]
	subs r5, r5, r1
	adds r5, #0x10
	strh r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010308: .4byte 0x08C010EC
_0801030C: .4byte 0x0202BBB4

	thumb_func_start sub_08010310
sub_08010310: @ 0x08010310
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0801032C
	ldr r4, _08010328 @ =0x0000FFFF
	ands r4, r1
	b _08010330
	.align 2, 0
_08010328: .4byte 0x0000FFFF
_0801032C:
	movs r4, #1
	rsbs r4, r4, #0
_08010330:
	ldr r0, [r2, #0x30]
	ldrh r3, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _08010344
	adds r1, r3, #0
_08010344:
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #4
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _0801035C
	adds r0, r4, #0
	bl sub_080102DC
	movs r0, #2
	b _0801035E
_0801035C:
	movs r0, #0
_0801035E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08010364
sub_08010364: @ 0x08010364
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	bl sub_08015A0C
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	bl sub_08007C88
	movs r0, #1
	bl sub_08000FD4
	cmp r4, #0
	beq _0801038E
	cmp r4, #1
	beq _080103A8
	b _080103C4
_0801038E:
	str r6, [sp]
	ldr r0, _080103F8 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #3
	movs r1, #2
	movs r2, #0x14
	movs r3, #4
	bl sub_08088584
_080103A8:
	str r6, [sp]
	ldr r0, _080103F8 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	movs r1, #0x12
	movs r2, #0x14
	movs r3, #4
	bl sub_08088584
_080103C4:
	ldr r0, _080103FC @ =sub_08010600
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080103DA
	movs r0, #0x40
	orrs r5, r0
_080103DA:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080103E8
	ldr r0, _08010400 @ =0x00002820
	orrs r5, r0
_080103E8:
	adds r0, r5, #0
	bl sub_08087E2C
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080103F8: .4byte 0x06011000
_080103FC: .4byte sub_08010600
_08010400: .4byte 0x00002820

	thumb_func_start sub_08010404
sub_08010404: @ 0x08010404
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08010434 @ =0x0000FFFD
	ldrh r5, [r1]
	ands r0, r5
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08010438
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_08010364
	movs r0, #2
	b _0801043A
	.align 2, 0
_08010434: .4byte 0x0000FFFD
_08010438:
	movs r0, #0
_0801043A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08010440
sub_08010440: @ 0x08010440
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	ldr r2, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08010474 @ =0x0000FFFD
	ldrh r6, [r1]
	ands r0, r6
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08010478
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08010364
	movs r0, #2
	b _0801047A
	.align 2, 0
_08010474: .4byte 0x0000FFFD
_08010478:
	movs r0, #0
_0801047A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08010480
sub_08010480: @ 0x08010480
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r0, #4]
	ldr r4, [r0, #8]
	adds r0, r3, #0
	adds r0, #0x5e
	ldrh r2, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _080104B0
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _080104B0
	adds r0, r1, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_08010364
	movs r0, #2
	b _080104B2
_080104B0:
	movs r0, #0
_080104B2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080104B8
sub_080104B8: @ 0x080104B8
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080104CE
	bl sub_080886CC
	movs r0, #2
	b _080104D0
_080104CE:
	movs r0, #0
_080104D0:
	pop {r1}
	bx r1

	thumb_func_start sub_080104D4
sub_080104D4: @ 0x080104D4
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080104F0
	movs r0, #0
	b _08010532
_080104F0:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08010508
	bl sub_0802D874
	bl sub_0806D51C
_08010508:
	movs r0, #0x61
	strb r0, [r4]
	movs r0, #3
	bl sub_08001370
	adds r1, r0, #0
	ldr r0, _0801053C @ =0x02024460
	str r5, [sp]
	movs r2, #8
	movs r3, #8
	bl sub_080B7980
	movs r0, #8
	bl sub_08000FD4
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08001D64
	movs r0, #2
_08010532:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801053C: .4byte 0x02024460

	thumb_func_start sub_08010540
sub_08010540: @ 0x08010540
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0801054E
	movs r0, #0
_0801054E:
	bx lr

	thumb_func_start sub_08010550
sub_08010550: @ 0x08010550
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r3, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _0801056A
	movs r0, #0
	b _080105A2
_0801056A:
	cmp r3, #1
	beq _0801058A
	cmp r3, #1
	bgt _08010578
	cmp r3, #0
	beq _08010582
	b _080105A0
_08010578:
	cmp r3, #2
	beq _08010592
	cmp r3, #3
	beq _0801059A
	b _080105A0
_08010582:
	movs r0, #0x10
	bl sub_080AB1AC
	b _080105A0
_0801058A:
	movs r0, #8
	bl sub_080AB1AC
	b _080105A0
_08010592:
	movs r0, #4
	bl sub_080AB1AC
	b _080105A0
_0801059A:
	movs r0, #2
	bl sub_080AB1AC
_080105A0:
	movs r0, #2
_080105A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080105A8
sub_080105A8: @ 0x080105A8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r3, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080105C2
	movs r0, #0
	b _080105FA
_080105C2:
	cmp r3, #1
	beq _080105E2
	cmp r3, #1
	bgt _080105D0
	cmp r3, #0
	beq _080105DA
	b _080105F8
_080105D0:
	cmp r3, #2
	beq _080105EA
	cmp r3, #3
	beq _080105F2
	b _080105F8
_080105DA:
	movs r0, #0x10
	bl sub_080AB1D0
	b _080105F8
_080105E2:
	movs r0, #8
	bl sub_080AB1D0
	b _080105F8
_080105EA:
	movs r0, #4
	bl sub_080AB1D0
	b _080105F8
_080105F2:
	movs r0, #2
	bl sub_080AB1D0
_080105F8:
	movs r0, #2
_080105FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08010600
sub_08010600: @ 0x08010600
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801061A
	bl sub_080886CC
	movs r0, #0
	b _08010626
_0801061A:
	bl sub_080886E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08010628
_08010626:
	str r0, [r4, #0x40]
_08010628:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
