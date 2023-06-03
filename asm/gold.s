	.include "macro.inc"
	.syntax unified

	thumb_func_start GetGold
GetGold: @ 0x08023D90
	ldr r0, _08023D98 @ =gPlaySt
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_08023D98: .4byte gPlaySt

	thumb_func_start SetGold
SetGold: @ 0x08023D9C
	ldr r2, _08023DAC @ =gPlaySt
	str r0, [r2, #8]
	ldr r1, _08023DB0 @ =0x000F423F
	cmp r0, r1
	ble _08023DA8
	str r1, [r2, #8]
_08023DA8:
	bx lr
	.align 2, 0
_08023DAC: .4byte gPlaySt
_08023DB0: .4byte 0x000F423F

	thumb_func_start AddGold
AddGold: @ 0x08023DB4
	ldr r2, _08023DC8 @ =gPlaySt
	ldr r1, [r2, #8]
	adds r1, r1, r0
	str r1, [r2, #8]
	ldr r0, _08023DCC @ =0x000F423F
	cmp r1, r0
	ble _08023DC4
	str r0, [r2, #8]
_08023DC4:
	bx lr
	.align 2, 0
_08023DC8: .4byte gPlaySt
_08023DCC: .4byte 0x000F423F
