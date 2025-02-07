	.include "macro.inc"
	.syntax unified

	thumb_func_start ProcPrepSpChar_Idle
ProcPrepSpChar_Idle: @ 0x08090388
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8090244
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProcPrepSpChar_OnEnd
ProcPrepSpChar_OnEnd: @ 0x0809039C
	push {lr}
	ldr r0, [r0, #0x38]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0

	thumb_func_start PrepSpecialChar_BlinkButtonStart
PrepSpecialChar_BlinkButtonStart: @ 0x080903A8
	push {lr}
	ldr r0, _080903C0 @ =ProcScr_PrepSpecialCharEff
	bl Proc_Find
	cmp r0, #0
	beq _080903BC
	adds r1, r0, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
_080903BC:
	pop {r0}
	bx r0
	.align 2, 0
_080903C0: .4byte ProcScr_PrepSpecialCharEff

	thumb_func_start PrepSpecialChar_BlinkButtonB
PrepSpecialChar_BlinkButtonB: @ 0x080903C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080903E4 @ =ProcScr_PrepSpecialCharEff
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080903E4: .4byte ProcScr_PrepSpecialCharEff

	thumb_func_start EndPrepSpecialCharEffect
EndPrepSpecialCharEffect: @ 0x080903E8
	push {lr}
	ldr r0, _080903F8 @ =ProcScr_PrepSpecialCharEff
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080903F8: .4byte ProcScr_PrepSpecialCharEff
