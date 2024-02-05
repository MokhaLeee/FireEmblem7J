	.include "macro.inc"
	.syntax unified



	thumb_func_start EkrDragonBarkQuake_Loop
EkrDragonBarkQuake_Loop: @ 0x08066DD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0

	ldr r0, [r0, #0x5c]
	str r0, [sp]

	ldr r4, _08066F6C @ =gEkrBg2QuakeVec
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset

	ldr r7, _08066F70 @ =gEkrBg0QuakeVec
	ldrh r2, [r4]
	ldrh r3, [r7]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r6, [r4, #2]
	ldrh r0, [r7, #2]
	adds r2, r6, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #3
	bl SetBgOffset

	ldrh r5, [r4]
	ldr r0, _08066F74 @ =gEkrXPosReal
	ldrh r0, [r0]
	subs r1, r0, r5
	ldr r2, _08066F78 @ =gEkrBgPosition
	ldr r0, [r2]
	subs r1, r1, r0
	lsls r1, r1, #0x10

	ldr r3, _08066F7C @ =gEkrYPosReal
	mov sl, r3
	ldrh r4, [r4, #2]
	ldrh r6, [r3]
	subs r2, r6, r4
	lsls r2, r2, #0x10

	ldr r3, _08066F74 @ =gEkrXPosReal
	ldrh r3, [r3, #2]
	adds r5, r5, r3
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r6, sl
	ldrh r6, [r6, #2]
	subs r4, r6, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r0, r1, #0x10
	mov r8, r0
	asrs r1, r1, #0x10
	lsrs r6, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion

	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r6, [r3, #0x2e]
	lsls r1, r6, #0x10
	cmp r0, r1
	ble _08066F5C
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r7]
	ldrh r2, [r7, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r7]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r7, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r7]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r7, [r7, #2]
	rsbs r1, r7, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r6, _08066F78 @ =gEkrBgPosition
	ldr r4, [r6]
	ldr r0, _08066F74 @ =gEkrXPosReal
	ldrh r0, [r0]
	subs r1, r0, r4
	lsls r1, r1, #0x10
	ldr r2, _08066F74 @ =gEkrXPosReal
	ldrh r2, [r2, #2]
	subs r4, r2, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r3, sl
	ldrh r5, [r3, #2]
	lsrs r6, r1, #0x10
	mov r8, r6
	asrs r1, r1, #0x10
	ldrh r6, [r3]
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldr r0, [r3, #0x60]
	bl Proc_End
	mov r0, sb
	bl Proc_Break
_08066F5C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066F6C: .4byte gEkrBg2QuakeVec
_08066F70: .4byte gEkrBg0QuakeVec
_08066F74: .4byte gEkrXPosReal
_08066F78: .4byte gEkrBgPosition
_08066F7C: .4byte gEkrYPosReal

	thumb_func_start NewEkrDragonProc_8066F80
NewEkrDragonProc_8066F80: @ 0x08066F80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08066FB8 @ =ProcScr_EkrDragon_08C488FC
	movs r1, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _08066FBC @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	subs r1, #0x21
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066FB8: .4byte ProcScr_EkrDragon_08C488FC
_08066FBC: .4byte gDispIo

	thumb_func_start sub_8066FC0
sub_8066FC0: @ 0x08066FC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08067028 @ =gPal
	ldr r4, _0806702C @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08067020
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08067020:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067028: .4byte gPal
_0806702C: .4byte gEfxPal

	thumb_func_start sub_8067030
sub_8067030: @ 0x08067030
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08067080 @ =gPal
	ldr r4, _08067084 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _0806707A
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0806707A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067080: .4byte gPal
_08067084: .4byte gEfxPal

	thumb_func_start sub_8067088
sub_8067088: @ 0x08067088
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _080670F0 @ =gPal
	ldr r4, _080670F4 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x4c]
	cmp r0, r1
	ble _080670E8
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_080670E8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080670F0: .4byte gPal
_080670F4: .4byte gEfxPal

	thumb_func_start sub_80670F8
sub_80670F8: @ 0x080670F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08067124 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x3d
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067124: .4byte gDispIo
