	.include "macro.inc"

	.syntax unified

	.section .text

	thumb_func_start EventE3_ScreenFlashing
EventE3_ScreenFlashing: @ 0x0801206C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	ldr r1, [r0, #4]
	mov ip, r1
	ldr r1, [r0, #8]
	mov r8, r1
	ldr r1, [r0, #0xc]
	movs r2, #0xff
	adds r6, r1, #0
	ands r6, r2
	lsrs r5, r1, #0x10
	ands r5, r2
	ldr r0, [r0, #0x10]
	ldr r1, _080120C4 @ =0x000003FF
	adds r4, r0, #0
	ands r4, r1
	lsrs r3, r0, #0xa
	ands r3, r1
	lsrs r2, r0, #0x14
	ands r2, r1
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080120C8
	str r4, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r7, [sp, #0xc]
	mov r0, ip
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl StartScreenFlashing
	movs r0, #2
	b _080120CA
	.align 2, 0
_080120C4: .4byte 0x000003FF
_080120C8:
	movs r0, #0
_080120CA:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
