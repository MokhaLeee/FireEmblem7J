	.include "macro.inc"
	.syntax unified

	thumb_func_start GetGameTime
GetGameTime: @ 0x08000EEC
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

	thumb_func_start SetGameTime
SetGameTime: @ 0x08000F04
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

	thumb_func_start IncGameTime
IncGameTime: @ 0x08000F20
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

	thumb_func_start FormatTime
FormatTime: @ 0x08000F58
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

	thumb_func_start EnableBgSync
EnableBgSync: @ 0x08000FD4
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

	thumb_func_start EnableBgSyncById
EnableBgSyncById: @ 0x08000FF0
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

	thumb_func_start DisableBgSync
DisableBgSync: @ 0x08001010
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

	thumb_func_start EnablePalSync
EnablePalSync: @ 0x08001034
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

	thumb_func_start DisablePalSync
DisablePalSync: @ 0x08001048
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

	thumb_func_start ApplyPaletteExt
ApplyPaletteExt: @ 0x0800105C
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
	ldr r2, _08001094 @ =gPaletteBuffer
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
_08001094: .4byte gPaletteBuffer
_08001098:
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _080010C8 @ =gPaletteBuffer
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
	bl EnablePalSync
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080010C8: .4byte gPaletteBuffer

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
	ldr r1, _080010FC @ =gPaletteBuffer
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
_080010FC: .4byte gPaletteBuffer
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
	bl EnablePalSync
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SyncDispIo
SyncDispIo: @ 0x08001188
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

	thumb_func_start GetBgChrOffset
GetBgChrOffset: @ 0x08001370
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

	thumb_func_start GetBgChrId
GetBgChrId: @ 0x080013A4
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
	bl GetBgChrOffset
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

	thumb_func_start GetBgTilemapOffset
GetBgTilemapOffset: @ 0x080013D8
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
	ldr r0, _08001554 @ =gPaletteBuffer
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
_08001554: .4byte gPaletteBuffer
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
	ldr r0, _0800161C @ =gPaletteBuffer
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
_0800161C: .4byte gPaletteBuffer
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
	ldr r0, _08001794 @ =gBG2TilemapBuffer
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
	ldr r0, _080017A4 @ =gPaletteBuffer
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
_08001794: .4byte gBG2TilemapBuffer
_08001798: .4byte 0x02024460
_0800179C: .4byte 0x0300000D
_080017A0: .4byte 0x03002790
_080017A4: .4byte gPaletteBuffer
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

	thumb_func_start BG_Fill
BG_Fill: @ 0x080017E8
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
	bl RegisterDataFill
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

	thumb_func_start UpdateKeyStatus
UpdateKeyStatus: @ 0x08001BA0
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

	thumb_func_start SetBgOffset
SetBgOffset: @ 0x08001D64
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
	bl BG_Fill
	movs r0, #1
	bl EnableBgSync
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
	ldr r1, _08002220 @ =gPaletteBuffer
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
_08002220: .4byte gPaletteBuffer
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
	ldr r1, _08002480 @ =gPaletteBuffer
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
	ldr r1, _08002480 @ =gPaletteBuffer
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
	ldr r1, _08002480 @ =gPaletteBuffer
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
_08002480: .4byte gPaletteBuffer
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
	ldr r1, _080025A8 @ =gPaletteBuffer
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
	ldr r1, _080025A8 @ =gPaletteBuffer
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
	ldr r1, _080025A8 @ =gPaletteBuffer
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
_080025A8: .4byte gPaletteBuffer
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
	ldr r1, _080026E0 @ =gPaletteBuffer
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
	ldr r1, _080026E0 @ =gPaletteBuffer
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
	ldr r1, _080026E0 @ =gPaletteBuffer
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
_080026E0: .4byte gPaletteBuffer
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
	ldr r1, _08002818 @ =gPaletteBuffer
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
	ldr r1, _08002818 @ =gPaletteBuffer
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
	ldr r1, _08002818 @ =gPaletteBuffer
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
_08002818: .4byte gPaletteBuffer
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
	ldr r0, _08002A2C @ =gPaletteBuffer
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
_08002A2C: .4byte gPaletteBuffer
_08002A30:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _08002836
_08002A38:
	bl EnablePalSync
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
	bl SetBgOffset
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl sub_08002BC0
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [r7, #0x20]
	adds r4, r7, #0
	adds r4, #0x20
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl GetBgChrOffset
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
	bl EnableBgSync
	movs r0, #0
	bl InitOam
	ldr r0, _08002BB8 @ =gPaletteBuffer
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	bl EnablePalSync
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
_08002BB8: .4byte gPaletteBuffer
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

	thumb_func_start SetOnHBlankA
SetOnHBlankA: @ 0x08002DF0
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

	thumb_func_start SetOnHBlankB
SetOnHBlankB: @ 0x08002E10
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
	ldr r1, _08002E6C @ =gBG2TilemapBuffer
	cmp r0, r1
	bhs _08002E70
	movs r0, #1
	b _08002EAE
	.align 2, 0
_08002E68: .4byte 0x02023460
_08002E6C: .4byte gBG2TilemapBuffer
_08002E70:
	ldr r0, [r7]
	ldr r1, _08002E84 @ =gBG2TilemapBuffer
	cmp r0, r1
	blo _08002E8C
	ldr r0, [r7]
	ldr r1, _08002E88 @ =0x02024460
	cmp r0, r1
	bhs _08002E8C
	movs r0, #2
	b _08002EAE
	.align 2, 0
_08002E84: .4byte gBG2TilemapBuffer
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

	thumb_func_start ClearMoveList
ClearMoveList: @ 0x08002EB8
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

	thumb_func_start RegisterDataMove
RegisterDataMove: @ 0x08002F54
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

	thumb_func_start RegisterDataFill
RegisterDataFill: @ 0x08002FD8
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

	thumb_func_start ApplyDataMoves
ApplyDataMoves: @ 0x08003054
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
	bl ClearMoveList
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start InitOam
InitOam: @ 0x08003108
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

	thumb_func_start GetOamSplice
GetOamSplice: @ 0x080031A4
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

	thumb_func_start SyncHiOam
SyncHiOam: @ 0x080031BC
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
	bl ClearOam_thm
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

	thumb_func_start SyncLoOam
SyncLoOam: @ 0x08003214
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
	bl ClearOam_thm
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

	thumb_func_start SetObjAffine
SetObjAffine: @ 0x08003264
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

	thumb_func_start PutUnkSprite
PutUnkSprite: @ 0x0800332C
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
