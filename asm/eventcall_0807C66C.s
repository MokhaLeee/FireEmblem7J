	.include "macro.inc"
	.syntax unified

    .section .data

	.global gUnk_08D6F9D4
gUnk_08D6F9D4:	@ 0x08D6F9D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C7E8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C8BC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C8DC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807C954
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C9A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

    .section .text

	thumb_func_start sub_807C66C
sub_807C66C: @ 0x0807C66C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetText
	ldr r1, _0807C6E0 @ =0x06009000
	mov r0, sp
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	mov r0, sp
	bl SetTextFont
	movs r4, #0
	str r4, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0807C6E4 @ =0x01000008
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _0807C6E8 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	add r4, sp, #0x20
	adds r0, r4, #0
	movs r1, #0x14
	bl InitText
	ldr r1, _0807C6EC @ =gBg3Tm + 0x24a
	adds r0, r4, #0
	bl PutText
	movs r0, #0xa0
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C6E0: .4byte 0x06009000
_0807C6E4: .4byte 0x01000008
_0807C6E8: .4byte 0x06008000
_0807C6EC: .4byte gBg3Tm + 0x24a

	thumb_func_start sub_807C6F0
sub_807C6F0: @ 0x0807C6F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #2
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r6, #0x1e
	str r6, [sp, #4]
	movs r5, #8
	str r5, [sp, #8]
	movs r2, #7
	movs r3, #7
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x11
	asrs r1, r1, #0x10
	mov r2, r8
	str r2, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #3
	movs r3, #0xf
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C754
sub_807C754: @ 0x0807C754
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0807C7B4 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0807C7B8 @ =gUnk_08452D90
	ldr r1, _0807C7BC @ =0x06000800
	bl Decompress
	ldr r1, _0807C7C0 @ =gUnk_08452E90
	ldr r2, _0807C7C4 @ =0x00007040
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _0807C7C8 @ =gUnk_08452E70
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	bl InitScanlineEffect
	ldr r0, _0807C7CC @ =sub_8078130
	bl SetOnHBlankA
	ldr r0, _0807C7D0 @ =sub_807C6F0
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _0807C7D4 @ =gUnk_0857E570
	ldr r1, _0807C7D8 @ =gUnk_08453438
	movs r2, #7
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl StartMixPalette
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C7B4: .4byte gBg1Tm
_0807C7B8: .4byte gUnk_08452D90
_0807C7BC: .4byte 0x06000800
_0807C7C0: .4byte gUnk_08452E90
_0807C7C4: .4byte 0x00007040
_0807C7C8: .4byte gUnk_08452E70
_0807C7CC: .4byte sub_8078130
_0807C7D0: .4byte sub_807C6F0
_0807C7D4: .4byte gUnk_0857E570
_0807C7D8: .4byte gUnk_08453438

	thumb_func_start sub_807C7DC
sub_807C7DC: @ 0x0807C7DC
	push {lr}
	bl EndMixPalette
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C7E8
sub_807C7E8: @ 0x0807C7E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl EndMixPalette
	ldr r3, _0807C894 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r6, [r2]
	ands r0, r6
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0807C898 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0807C89C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C8A0 @ =0x06008000
	ldr r1, _0807C8A4 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _0807C8A8 @ =gPal + 0x100
	ldr r6, _0807C8AC @ =0xFFFFFF00
	adds r1, r0, r6
	movs r2, #0x38
	bl CpuFastSet
	ldr r0, _0807C8B0 @ =0x00008080
	adds r3, r0, #0
	ldr r2, _0807C8B4 @ =gBg3Tm
	ldr r1, _0807C8B8 @ =gBg2Tm
	movs r4, #0x80
	lsls r4, r4, #3
_0807C86C:
	ldrh r6, [r2]
	adds r0, r3, r6
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0807C86C
	bl EnablePalSync
	movs r0, #4
	bl EnableBgSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C894: .4byte gDispIo
_0807C898: .4byte 0x0000FFE0
_0807C89C: .4byte 0x0000E0FF
_0807C8A0: .4byte 0x06008000
_0807C8A4: .4byte 0x06001000
_0807C8A8: .4byte gPal + 0x100
_0807C8AC: .4byte 0xFFFFFF00
_0807C8B0: .4byte 0x00008080
_0807C8B4: .4byte gBg3Tm
_0807C8B8: .4byte gBg2Tm

	thumb_func_start sub_807C8BC
sub_807C8BC: @ 0x0807C8BC
	ldr r2, _0807C8D8 @ =gDispIo
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
	bx lr
	.align 2, 0
_0807C8D8: .4byte gDispIo

	thumb_func_start sub_807C8DC
sub_807C8DC: @ 0x0807C8DC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807C944 @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x37
	str r2, [sp]
	movs r2, #8
	movs r3, #8
	bl sub_80B7980
	movs r0, #8
	bl EnableBgSync
	ldr r3, _0807C948 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _0807C94C @ =gUnk_08583EE4
	ldr r1, _0807C950 @ =gUnk_08453538
	movs r2, #7
	str r2, [sp]
	ldr r2, [r4, #0x14]
	str r2, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl StartMixPalette
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C944: .4byte gBg3Tm
_0807C948: .4byte gDispIo
_0807C94C: .4byte gUnk_08583EE4
_0807C950: .4byte gUnk_08453538

	thumb_func_start sub_807C954
sub_807C954: @ 0x0807C954
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807C9A0 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807C99A
	adds r0, r4, #0
	bl Proc_Break
_0807C99A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C9A0: .4byte gDispIo

	thumb_func_start sub_807C9A4
sub_807C9A4: @ 0x0807C9A4
	push {lr}
	ldr r0, _0807CA10 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0807CA14 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #6
	bl EnableBgSync
	ldr r3, _0807CA18 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl EndAllParallelWorkers
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807CA10: .4byte gBg1Tm
_0807CA14: .4byte gBg2Tm
_0807CA18: .4byte gDispIo

	thumb_func_start sub_807CA1C
sub_807CA1C: @ 0x0807CA1C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807CA2C @ =gUnk_08D6F9D4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807CA2C: .4byte gUnk_08D6F9D4
