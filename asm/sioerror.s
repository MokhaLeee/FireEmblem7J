	.include "macro.inc"
	.syntax unified

	thumb_func_start OnVBlank_SioError
OnVBlank_SioError: @ 0x08087004
	push {lr}
	ldr r1, _08087024 @ =0x03007FF8
	movs r0, #1
	strh r0, [r1]
	bl SyncDispIo
	bl SyncBgsAndPal
	bl ApplyDataMoves
	bl m4aSoundVSync
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_08087024: .4byte 0x03007FF8

	thumb_func_start OnMain_SioErrorWait
OnMain_SioErrorWait: @ 0x08087028
	push {r4, lr}
	ldr r4, _08087050 @ =gpKeySt
	ldr r0, [r4]
	bl RefreshKeySt
	ldr r1, [r4]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08087044
	movs r0, #0xff
	bl SoftReset
_08087044:
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087050: .4byte gpKeySt

	thumb_func_start PutSioErrorMessage
PutSioErrorMessage: @ 0x08087054
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x7c
	add r5, sp, #0x18
	bl ResetText
	bl InitTalkTextFont
	add r7, sp, #8
	add r0, sp, #0x10
	mov r8, r0
	mov r4, sp
	movs r6, #2
_08087070:
	adds r0, r4, #0
	movs r1, #0x16
	bl InitText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _08087070
	movs r1, #0
	str r1, [r5, #0x30]
	mov r0, sp
	str r0, [r5, #0x34]
	str r7, [r5, #0x38]
	mov r0, r8
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, _080870E0 @ =0x00000719
	bl DecodeMsg
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_808356C
	ldr r4, _080870E4 @ =gBg0Tm + 0x188
	mov r0, sp
	adds r1, r4, #0
	bl PutText
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r7, #0
	bl PutText
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	add sp, #0x7c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080870E0: .4byte 0x00000719
_080870E4: .4byte gBg0Tm + 0x188

	thumb_func_start OnMain_SioError
OnMain_SioError: @ 0x080870E8
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl InitBgs
	bl m4aSoundInit
	bl Proc_Init
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r5, _08087198 @ =gDispIo
	movs r0, #1
	ldrb r1, [r5, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	strh r4, [r5, #0x38]
	bl SyncDispIo
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0808719C @ =0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080871A0 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	bl PutSioErrorMessage
	ldr r0, _080871A4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087188
	movs r0, #0x7b
	bl m4aSongNumStart
_08087188:
	ldr r0, _080871A8 @ =OnMain_SioErrorWait
	bl SetMainFunc
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087198: .4byte gDispIo
_0808719C: .4byte 0x01000008
_080871A0: .4byte 0x06008000
_080871A4: .4byte gPlaySt
_080871A8: .4byte OnMain_SioErrorWait

	thumb_func_start StartSioErrorScreen
StartSioErrorScreen: @ 0x080871AC
	push {lr}
	ldr r1, _080871D4 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _080871D8 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080871DC @ =OnVBlank_SioError
	bl SetOnVBlank
	ldr r0, _080871E0 @ =OnMain_SioError
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_080871D4: .4byte 0x04000004
_080871D8: .4byte 0x04000208
_080871DC: .4byte OnVBlank_SioError
_080871E0: .4byte OnMain_SioError
