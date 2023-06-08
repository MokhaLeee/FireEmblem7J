	.include "macro.inc"
    .syntax unified

	thumb_func_start AgbMain
AgbMain: @ 0x08000A20
	sub sp, #0x10
	push {r4, lr}
	add r4, sp, #0x18
	str r4, [sp, #0xc]
	mov r4, pc
	str r4, [sp, #0x14]
	mov r4, fp
	str r4, [sp, #8]
	mov r4, lr
	str r4, [sp, #0x10]
	add r4, sp, #0x14
	mov fp, r4
	sub sp, #4
	movs r2, #0
	str r2, [sp]
	ldr r1, _08000ACC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	str r0, [r1, #4]
	ldr r0, _08000AD0 @ =0x85001FE0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r2, [sp]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ldr r2, _08000AD4 @ =0x01010000
	mov r0, sp
	bl CpuFastSet
	ldr r1, _08000AD8 @ =0x04000204
	ldr r2, _08000ADC @ =0x000045B4
	adds r0, r2, #0
	strh r0, [r1]
	bl IrqInit
	movs r0, #0
	bl SetInterrupt_LCDVBlank
	ldr r1, _08000AE0 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _08000AE4 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	ldr r4, _08000AE8 @ =gpKeySt
	ldr r0, [r4]
	bl sub_08001C28
	ldr r0, [r4]
	bl UpdateKeyStatus
	bl InitRamFuncs
	bl SramInit
	bl Proc_Init
	bl InitSpriteAnims
	bl MU_Init
	ldr r0, _08000AEC @ =0x42D690E9
	bl RandInitB
	bl RandNextB
	bl RandInit
	bl LoadAndVerifySramSaveData
	bl m4aSoundInit
	bl sub_08003E48
	ldr r0, _08000AF0 @ =OnVBlank
	bl SetInterrupt_LCDVBlank
	bl StartGame
_08000AC2:
	bl sub_080019AC
	bl sub_08002BE4
	b _08000AC2
	.align 2, 0
_08000ACC: .4byte 0x040000D4
_08000AD0: .4byte 0x85001FE0
_08000AD4: .4byte 0x01010000
_08000AD8: .4byte 0x04000204
_08000ADC: .4byte 0x000045B4
_08000AE0: .4byte 0x04000004
_08000AE4: .4byte 0x04000208
_08000AE8: .4byte gpKeySt
_08000AEC: .4byte 0x42D690E9
_08000AF0: .4byte OnVBlank

	thumb_func_start PutBuildInfo
PutBuildInfo: @ 0x08000AF4
	sub sp, #0x10
	push {r4, lr}
	add r4, sp, #0x18
	str r4, [sp, #0xc]
	mov r4, pc
	str r4, [sp, #0x14]
	mov r4, fp
	str r4, [sp, #8]
	mov r4, lr
	str r4, [sp, #0x10]
	add r4, sp, #0x14
	mov fp, r4
	adds r4, r0, #0
	ldr r1, _08000B28 @ =0x080C0C50
	bl sub_08004E4C
	subs r4, #0x40
	ldr r1, _08000B2C @ =0x080C0C6C
	adds r0, r4, #0
	bl sub_08004E4C
	pop {r4}
	pop {r0, r1, r2}
	mov fp, r1
	mov sp, r2
	bx r0
	.align 2, 0
_08000B28: .4byte 0x080C0C50
_08000B2C: .4byte 0x080C0C6C
