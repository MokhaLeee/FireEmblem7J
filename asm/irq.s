	.include "macro.inc"

	.syntax unified

	thumb_func_start StoreIRQToIRAM
StoreIRQToIRAM: @ 0x08000B30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_08000B3A:
	ldr r0, [r7]
	cmp r0, #0xd
	ble _08000B42
	b _08000B60
_08000B42:
	ldr r0, _08000B58 @ =0x03002800
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08000B5C @ =DummyIRQRoutine
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08000B3A
	.align 2, 0
_08000B58: .4byte 0x03002800
_08000B5C: .4byte DummyIRQRoutine
_08000B60:
	ldr r0, _08000B7C @ =IrqMain
	ldr r1, _08000B80 @ =0x03003870
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, _08000B84 @ =0x03007FFC
	ldr r1, _08000B80 @ =0x03003870
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000B7C: .4byte IrqMain
_08000B80: .4byte 0x03003870
_08000B84: .4byte 0x03007FFC

	thumb_func_start DummyIRQRoutine
DummyIRQRoutine: @ 0x08000B88
	push {r7, lr}
	mov r7, sp
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetIRQHandler
SetIRQHandler: @ 0x08000B94
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08000BB4 @ =0x03002800
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	str r1, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BB4: .4byte 0x03002800
