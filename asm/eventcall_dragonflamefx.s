	.include "macro.inc"
	.syntax unified

    .section .data

	.global ProcScr_DragonFlamefx
ProcScr_DragonFlamefx:	@ 0x08D6F8BC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonFlamefx_Init
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DragonFlamefx_Rotation
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0

	/* flashing out */
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word TryLockParentProc
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonFlamefx_EndRing
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DragonFlamefx_RefrainBlendAlpha
        @ PROC_WHILE
        .short 0x14, 0x0
        .word CheckBmBgfxDone
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C170
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807BFEC
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807C108
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C170
        @ PROC_CALL
        .short 0x2, 0x0
        .word TryUnlockParentProc
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_DeadDragonFlamefx
ProcScr_DeadDragonFlamefx:	@ 0x08D6F95C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word DeadDragonFlame_Init
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DeadDragonFlame_Rotation
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807C3E8
        @ PROC_WHILE
        .short 0x14, 0x0
        .word CheckBmBgfxDone
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C490
        @ PROC_LABEL
        .short 0xb, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C58C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807C5A4
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

    .section .text

	thumb_func_start sub_807BFEC
sub_807BFEC: @ 0x0807BFEC
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r3, _0807C070 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0807C074 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807C078 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C07C @ =ProcScr_EventSpriteAnim
	bl Proc_Find
	bl Proc_End
	movs r0, #0x70
	movs r1, #0x20
	bl PutDragonGateFlame
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C070: .4byte gDispIo
_0807C074: .4byte 0x0000FFE0
_0807C078: .4byte 0x0000E0FF
_0807C07C: .4byte ProcScr_EventSpriteAnim

	thumb_func_start sub_807C080
sub_807C080: @ 0x0807C080
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _0807C100 @ =gPal + 0x3a0
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0x1b
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r6, #0x80
	lsls r6, r6, #0x14
	str r6, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	movs r0, #0xda
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807C0D2
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807C0D2:
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807C0E6
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807C0E6:
	ldr r0, _0807C104 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C0F8
	movs r0, #0xd6
	bl m4aSongNumStart
_0807C0F8:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C100: .4byte gPal + 0x3a0
_0807C104: .4byte gPlaySt

	thumb_func_start sub_807C108
sub_807C108: @ 0x0807C108
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807C126
	adds r0, r5, #0
	bl sub_807C080
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_807BD6C
_0807C126:
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	ldr r0, _0807C16C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807C166
	adds r0, r5, #0
	bl Proc_Break
_0807C166:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C16C: .4byte gDispIo

	thumb_func_start sub_807C170
sub_807C170: @ 0x0807C170
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807C1DC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0807C1E0 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #5
	bl EnableBgSync
	ldr r3, _0807C1E4 @ =gDispIo
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
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C1DC: .4byte gBg2Tm
_0807C1E0: .4byte gBg0Tm
_0807C1E4: .4byte gDispIo

	thumb_func_start StartDragonFlamefx
StartDragonFlamefx: @ 0x0807C1E8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C1F8 @ =ProcScr_DragonFlamefx
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807C1F8: .4byte ProcScr_DragonFlamefx

	thumb_func_start EndDragonFlamefx
EndDragonFlamefx: @ 0x0807C1FC
	push {lr}
	ldr r0, _0807C20C @ =ProcScr_DragonFlamefx
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807C20C: .4byte ProcScr_DragonFlamefx

	thumb_func_start DragonFlamefxFlashingOut
DragonFlamefxFlashingOut: @ 0x0807C210
	push {lr}
	ldr r0, _0807C224 @ =ProcScr_DragonFlamefx
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C224: .4byte ProcScr_DragonFlamefx

	thumb_func_start sub_807C228
sub_807C228: @ 0x0807C228
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807C25C
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0807C25C
	ldr r0, _0807C288 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C250
	movs r0, #0xe5
	bl m4aSongNumStart
_0807C250:
	movs r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl Proc_Goto
_0807C25C:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0807C27E
	ldr r0, [r4, #0x50]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0807C27E
	ldr r0, _0807C288 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C27E
	movs r0, #0xf8
	bl m4aSongNumStart
_0807C27E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807C288: .4byte gPlaySt

	thumb_func_start DeadDragonFlame_Init
DeadDragonFlame_Init: @ 0x0807C28C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ArchiveCurrentPalettes
	adds r6, r5, #0
	adds r6, #0x4c
	movs r3, #0
	movs r4, #0
	strh r4, [r6]
	ldr r7, _0807C36C @ =gDispIo
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r3, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0807C370 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807C374 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_80780E0
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807C378 @ =HBlank_Scanline_8078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #7
	bl EnableBgSync
	strh r4, [r6]
	ldr r0, _0807C37C @ =BmBgfxConf_DeadDragonFlame
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	str r4, [sp, #8]
	ldr r1, _0807C380 @ =sub_807C228
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0x80
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x82
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C36C: .4byte gDispIo
_0807C370: .4byte 0x0000FFE0
_0807C374: .4byte 0x0000E0FF
_0807C378: .4byte HBlank_Scanline_8078098
_0807C37C: .4byte BmBgfxConf_DeadDragonFlame
_0807C380: .4byte sub_807C228

	thumb_func_start DeadDragonFlame_Rotation
DeadDragonFlame_Rotation: @ 0x0807C384
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x12
	ldr r2, _0807C3BC @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r3, r2, #0
	cmp r4, #6
	bgt _0807C3C0
	movs r0, #0x10
	subs r1, r0, r4
	b _0807C3C2
	.align 2, 0
_0807C3BC: .4byte gDispIo
_0807C3C0:
	movs r1, #0xa
_0807C3C2:
	adds r0, r3, #0
	adds r0, #0x45
	movs r3, #0
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x46
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807C3E0
	adds r0, r5, #0
	adds r0, #0x4c
	strh r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807C3E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C3E8
sub_807C3E8: @ 0x0807C3E8
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r6, r2, #0x13
	ldr r0, _0807C460 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x50
	bne _0807C44C
	movs r0, #0x80
	lsls r0, r0, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #0x80
	movs r2, #0x80
	bl sub_8013EF8
_0807C44C:
	cmp r6, #0x10
	bne _0807C456
	adds r0, r5, #0
	bl Proc_Break
_0807C456:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C460: .4byte gDispIo

	thumb_func_start sub_807C464
sub_807C464: @ 0x0807C464
	push {r4, lr}
	movs r4, #0x41
_0807C468:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807C482
	ldr r1, [r0]
	cmp r1, #0
	beq _0807C482
	ldrb r1, [r1, #4]
	cmp r1, #0x86
	beq _0807C482
	bl ClearUnit
_0807C482:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807C468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C490
sub_807C490: @ 0x0807C490
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	ldr r0, _0807C574 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807C578 @ =gDispIo
	mov ip, r0
	mov r5, ip
	adds r5, #0x3c
	movs r3, #0x3f
	ldrb r1, [r5]
	ands r3, r1
	mov r6, ip
	adds r6, #0x44
	movs r2, #0
	mov r8, r2
	movs r7, #0x45
	add r7, ip
	mov sl, r7
	movs r4, #0x10
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r7, ip
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r7, [r7, #0x14]
	ands r1, r7
	movs r0, #2
	orrs r1, r0
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	movs r0, #0x40
	orrs r3, r0
	strb r3, [r5]
	strb r4, [r6]
	mov r7, sl
	strb r4, [r7]
	mov r1, r8
	ldr r0, _0807C57C @ =0x030027D6
	strb r1, [r0]
	ldr r0, _0807C580 @ =0x0000FFE0
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807C584 @ =0x0000E0FF
	ands r0, r1
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x70
	movs r1, #0x20
	bl PutDragonGateFlame
	bl sub_807C464
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _0807C588 @ =0xFFDFFFFE
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	mov r7, sb
	str r7, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C574: .4byte gBg2Tm
_0807C578: .4byte gDispIo
_0807C57C: .4byte 0x030027D6
_0807C580: .4byte 0x0000FFE0
_0807C584: .4byte 0x0000E0FF
_0807C588: .4byte 0xFFDFFFFE

	thumb_func_start sub_807C58C
sub_807C58C: @ 0x0807C58C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_807BD6C
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807C5A4
sub_807C5A4: @ 0x0807C5A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r2, r0, #1
	strh r2, [r4]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x13
	ldr r0, _0807C64C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #8
	bne _0807C5F6
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r1, r5, #0
	bl StartUnitTornOut
_0807C5F6:
	ldrh r4, [r4]
	cmp r4, #0x10
	bne _0807C60E
	ldr r0, _0807C650 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C60E
	movs r0, #0xd6
	bl m4aSongNumStart
_0807C60E:
	cmp r6, #0x10
	bne _0807C644
	ldr r0, _0807C654 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r2, _0807C64C @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807C644:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C64C: .4byte gDispIo
_0807C650: .4byte gPlaySt
_0807C654: .4byte gBg0Tm

	thumb_func_start StartDeadDragonFlamefx
StartDeadDragonFlamefx: @ 0x0807C658
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C668 @ =ProcScr_DeadDragonFlamefx
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807C668: .4byte ProcScr_DeadDragonFlamefx
