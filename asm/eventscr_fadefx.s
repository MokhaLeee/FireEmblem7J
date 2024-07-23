	.include "macro.inc"

	.syntax unified

	.section .data

	@ same as eventfx-fade in fe8u

	.global ProcScr_EventFadefx
ProcScr_EventFadefx:	@ 0x08C01654
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word EventFadefx_Init
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word EventFadefx_Loop
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.section .text

	thumb_func_start EventFadefx_Init
EventFadefx_Init: @ 0x080120D8
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start EventFadefx_Loop
EventFadefx_Loop: @ 0x080120E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	adds r0, r0, r1
	str r0, [r4, #0x38]
	cmp r0, #0xff
	ble _080120FC
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r4, #0x38]
_080120FC:
	ldr r2, [r4, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	subs r3, r0, r2
	ldr r0, [r4, #0x3c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08012116
	adds r0, #0xff
_08012116:
	asrs r6, r0, #8
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x4c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0801212A
	adds r1, #0xff
_0801212A:
	asrs r5, r1, #8
	ldr r0, [r4, #0x44]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x50]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _0801213E
	adds r0, #0xff
_0801213E:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NewEventFadefx
NewEventFadefx: @ 0x08012150
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x1c]
	ldr r0, _080121A0 @ =ProcScr_EventFadefx
	bl Proc_StartBlocking
	adds r5, r0, #0
	movs r0, #0xff
	ands r0, r4
	cmp r0, #0x80
	bne _08012174
	movs r0, #0x80
	lsls r0, r0, #1
_08012174:
	str r0, [r5, #0x34]
	bl GetPalFadeStClkEnd1
	str r0, [r5, #0x3c]
	bl GetPalFadeStClkEnd2
	str r0, [r5, #0x40]
	bl GetPalFadeStClkEnd3
	str r0, [r5, #0x44]
	mov r0, r8
	str r0, [r5, #0x30]
	str r6, [r5, #0x48]
	str r7, [r5, #0x4c]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080121A0: .4byte ProcScr_EventFadefx

	thumb_func_start EventE7_FadeSteps
EventE7_FadeSteps: @ 0x080121A4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	ldr r0, [r0, #0xc]
	ldr r1, _080121E0 @ =0x000003FF
	adds r4, r0, #0
	ands r4, r1
	lsrs r3, r0, #0xa
	ands r3, r1
	lsrs r2, r0, #0x14
	ands r2, r1
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080121E4
	str r2, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl NewEventFadefx
	movs r0, #2
	b _080121E6
	.align 2, 0
_080121E0: .4byte 0x000003FF
_080121E4:
	movs r0, #0
_080121E6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventE6_StartFade
EventE6_StartFade: @ 0x080121F0
	push {lr}
	bl ArchiveCurrentPalettes
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start EventE7_EndFade
EventE7_EndFade: @ 0x080121FC
	push {lr}
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	movs r0, #2
	pop {r1}
	bx r1
