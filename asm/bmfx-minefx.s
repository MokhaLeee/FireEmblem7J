	.include "macro.inc"
	.syntax unified

    .section .data

	.global ProcScr_MineFx
ProcScr_MineFx:	@ 0x08C03000
        @ PROC_SLEEP
        .short 0xe, 0x18
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ProcMineFxFunc
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

    .section .text

	thumb_func_start ProcMineFxFunc
ProcMineFxFunc: @ 0x08021750
	push {lr}
	ldr r0, _08021768 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08021764
	ldr r0, _0802176C @ =0x000002F9
	bl m4aSongNumStart
_08021764:
	pop {r0}
	bx r0
	.align 2, 0
_08021768: .4byte gPlaySt
_0802176C: .4byte 0x000002F9

	thumb_func_start StartMineAnim
StartMineAnim: @ 0x08021770
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r0, r5, #4
	ldr r2, _080217D4 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	adds r5, #8
	lsls r0, r6, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r6, r0, #4
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80149B4
	ldr r0, _080217D8 @ =Img_MineFx
	ldr r1, _080217DC @ =0x06013000
	bl Decompress
	ldr r0, _080217E0 @ =Pal_MineFx
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080217E4 @ =SpritAnim_MineFx
	movs r3, #0xa3
	lsls r3, r3, #7
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartSpriteAnimProc
	ldr r0, _080217E8 @ =ProcScr_MineFx
	adds r1, r4, #0
	bl Proc_Start
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080217D4: .4byte gBmSt
_080217D8: .4byte Img_MineFx
_080217DC: .4byte 0x06013000
_080217E0: .4byte Pal_MineFx
_080217E4: .4byte SpritAnim_MineFx
_080217E8: .4byte ProcScr_MineFx
