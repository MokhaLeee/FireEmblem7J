	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_801D7B0
sub_801D7B0: @ 0x0801D7B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0801D7DC @ =gPlaySt
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0801D7D4
	ldrb r0, [r1, #0xf]
	bl CountFactionMoveableUnits
	cmp r0, #0
	bne _0801D7D4
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0801D7D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D7DC: .4byte gPlaySt
