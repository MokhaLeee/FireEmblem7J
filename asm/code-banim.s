	.include "macro.inc"
	.syntax unified

	thumb_func_start AnimScrAdvance
AnimScrAdvance: @ 0x080546F0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x12]
	bl CheckRound1
	cmp r0, #0
	beq _0805472C
	ldr r1, [r4, #0x20]
	ldr r0, _0805470C @ =0x08C0A5D8
	cmp r1, r0
	beq _0805472C
	movs r2, #0x3f
	b _08054718
	.align 2, 0
_0805470C: .4byte 0x08C0A5D8
_08054710:
	cmp r1, #6
	bne _08054718
	adds r0, #0xc
	str r0, [r4, #0x20]
_08054718:
	ldr r0, [r4, #0x20]
	adds r1, r2, #0
	ldrb r3, [r0, #3]
	ands r1, r3
	cmp r1, #0
	beq _08054728
	cmp r1, #5
	bne _08054710
_08054728:
	subs r0, #0xc
	str r0, [r4, #0x20]
_0805472C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrChienCHR
NewEkrChienCHR: @ 0x08054734
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08054748 @ =0x08C0A610
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054748: .4byte 0x08C0A610

	thumb_func_start EkrChienCHRMain
EkrChienCHRMain: @ 0x0805474C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl RegisterAISSheetGraphics
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RegisterAISSheetGraphics
RegisterAISSheetGraphics: @ 0x08054764
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08054790 @ =0x000003FF
	ldrh r0, [r5, #8]
	ands r4, r0
	lsls r4, r4, #5
	ldr r0, _08054794 @ =0x06010000
	adds r4, r4, r0
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	bl LZ77UnCompWram
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054790: .4byte 0x000003FF
_08054794: .4byte 0x06010000

	thumb_func_start sub_08054798
sub_08054798: @ 0x08054798
	adds r2, r0, #0
	ldr r0, _080547BC @ =0x0203E0C0
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080547B8
	movs r1, #0
	adds r3, r2, #0
	adds r3, #0x80
_080547AE:
	ldm r3!, {r0}
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #7
	bls _080547AE
_080547B8:
	bx lr
	.align 2, 0
_080547BC: .4byte 0x0203E0C0

	thumb_func_start GetBanimPalette
GetBanimPalette: @ 0x080547C0
	adds r2, r0, #0
	cmp r1, #0
	bne _080547D0
	ldr r0, _080547CC @ =gpEkrBattleUnitLeft
	b _080547D2
	.align 2, 0
_080547CC: .4byte gpEkrBattleUnitLeft
_080547D0:
	ldr r0, _080547E8 @ =gpEkrBattleUnitRight
_080547D2:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _080547FA
	cmp r0, #0x19
	bhi _080547EC
	cmp r0, #0x18
	beq _080547F6
	b _08054806
	.align 2, 0
_080547E8: .4byte gpEkrBattleUnitRight
_080547EC:
	cmp r0, #0x1a
	beq _080547FE
	cmp r0, #0x1b
	beq _08054802
	b _08054806
_080547F6:
	movs r0, #0x24
	b _08054808
_080547FA:
	movs r0, #0x26
	b _08054808
_080547FE:
	movs r0, #0x28
	b _08054808
_08054802:
	movs r0, #0x2a
	b _08054808
_08054806:
	adds r0, r2, #0
_08054808:
	bx lr
	.align 2, 0

	thumb_func_start UpdateBanimFrame
UpdateBanimFrame: @ 0x0805480C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080549DC @ =0x08E00008
	mov sb, r0
	ldr r1, _080549E0 @ =0x08FD8008
	mov sl, r1
	ldr r1, _080549E4 @ =gpImgSheet
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1]
	ldr r0, _080549E8 @ =0x0203DFE8
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r8, r2
	cmp r2, #1
	bne _080548C4
	ldr r0, _080549EC @ =0x0203E066
	movs r2, #0
	ldrsh r5, [r0, r2]
	ldr r0, _080549F0 @ =0x0203DFF8
	movs r1, #0
	ldrsh r7, [r0, r1]
	ldr r0, _080549F4 @ =0x0203DFF4
	movs r2, #0
	ldrsh r4, [r0, r2]
	lsls r0, r5, #5
	ldr r1, _080549DC @ =0x08E00008
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _080549F8 @ =gBanimScrLeft
	bl LZ77UnCompWram
	ldr r1, _080549FC @ =gpBanimModesLeft
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl GetBanimPalette
	lsls r0, r0, #5
	ldr r2, _080549DC @ =0x08E00008
	adds r0, r0, r2
	ldr r0, [r0, #0x1c]
	ldr r5, _08054A00 @ =0x02004088
	adds r1, r5, #0
	bl LZ77UnCompWram
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0805488E
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	movs r1, #0
	bl sub_08054798
_0805488E:
	ldr r1, _08054A04 @ =0x02000054
	lsls r0, r7, #5
	adds r0, r0, r5
	str r0, [r1]
	ldr r4, _08054A08 @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08054A0C @ =0x0203E080
	ldr r0, [r0]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x18]
	ldr r4, _08054A10 @ =0x020041C8
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08054A14 @ =0x000057F0
	adds r4, r4, r0
	mov r1, r8
	str r1, [r4]
_080548C4:
	ldr r0, _080549E8 @ =0x0203DFE8
	movs r1, #2
	ldrsh r2, [r0, r1]
	mov r8, r2
	cmp r2, #1
	bne _0805495E
	ldr r0, _080549EC @ =0x0203E066
	movs r2, #2
	ldrsh r5, [r0, r2]
	ldr r0, _080549F0 @ =0x0203DFF8
	movs r1, #2
	ldrsh r7, [r0, r1]
	ldr r0, _080549F4 @ =0x0203DFF4
	movs r2, #2
	ldrsh r4, [r0, r2]
	lsls r0, r5, #5
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _08054A18 @ =0x02011BC8
	bl LZ77UnCompWram
	ldr r1, _08054A1C @ =gpBanimModesRight
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #1
	bl GetBanimPalette
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r5, _08054A20 @ =0x02004128
	adds r1, r5, #0
	bl LZ77UnCompWram
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08054928
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	movs r1, #1
	bl sub_08054798
_08054928:
	ldr r1, _08054A04 @ =0x02000054
	lsls r0, r7, #5
	adds r0, r0, r5
	str r0, [r1, #4]
	ldr r4, _08054A24 @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08054A0C @ =0x0203E080
	ldr r0, [r0, #4]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x14]
	ldr r4, _08054A28 @ =0x020099C8
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _08054A14 @ =0x000057F0
	adds r4, r4, r2
	mov r0, r8
	str r0, [r4]
_0805495E:
	ldr r6, _08054A2C @ =gpEkrTriangleUnits
	ldr r2, [r6]
	cmp r2, #0
	beq _080549CC
	ldr r0, [r2, #4]
	ldr r1, [r0, #0x34]
	adds r0, r2, #0
	movs r2, #0
	mov r3, sp
	bl sub_08053040
	lsls r0, r0, #0x10
	ldr r5, _08054A0C @ =0x0203E080
	lsrs r0, r0, #0xb
	add r0, sb
	ldr r0, [r0, #0x1c]
	str r0, [r5]
	ldr r0, [r6]
	ldr r1, [sp]
	bl sub_08053A14
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r4, r7
	beq _0805499C
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	str r0, [r5]
_0805499C:
	ldr r0, [r6, #4]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x34]
	movs r2, #0
	mov r3, sp
	bl sub_08053040
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	add r0, sb
	ldr r0, [r0, #0x1c]
	str r0, [r5, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp]
	bl sub_08053A14
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r7
	beq _080549CC
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	str r0, [r5, #4]
_080549CC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080549DC: .4byte 0x08E00008
_080549E0: .4byte 0x08FD8008
_080549E4: .4byte gpImgSheet
_080549E8: .4byte 0x0203DFE8
_080549EC: .4byte 0x0203E066
_080549F0: .4byte 0x0203DFF8
_080549F4: .4byte 0x0203DFF4
_080549F8: .4byte gBanimScrLeft
_080549FC: .4byte gpBanimModesLeft
_08054A00: .4byte 0x02004088
_08054A04: .4byte 0x02000054
_08054A08: .4byte 0x02022B40
_08054A0C: .4byte 0x0203E080
_08054A10: .4byte 0x020041C8
_08054A14: .4byte 0x000057F0
_08054A18: .4byte 0x02011BC8
_08054A1C: .4byte gpBanimModesRight
_08054A20: .4byte 0x02004128
_08054A24: .4byte 0x02022B80
_08054A28: .4byte 0x020099C8
_08054A2C: .4byte gpEkrTriangleUnits

	thumb_func_start InitMainAnims
InitMainAnims: @ 0x08054A30
	push {lr}
	ldr r0, _08054A48 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _08054AAA
	lsls r0, r0, #2
	ldr r1, _08054A4C @ =_08054A50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054A48: .4byte gEkrDistanceType
_08054A4C: .4byte _08054A50
_08054A50: @ jump table
	.4byte _08054A64 @ case 0
	.4byte _08054A6E @ case 1
	.4byte _08054A78 @ case 2
	.4byte _08054A64 @ case 3
	.4byte _08054A64 @ case 4
_08054A64:
	movs r0, #6
	movs r1, #6
	bl InitBattleAnimFrame
	b _08054AAA
_08054A6E:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	b _08054AAA
_08054A78:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	bl sub_0804DC18
	cmp r0, #0
	bne _08054A9C
	ldr r1, _08054A98 @ =gAnims
	ldr r2, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #0xc]
	b _08054AA8
	.align 2, 0
_08054A98: .4byte gAnims
_08054A9C:
	ldr r1, _08054AB8 @ =gAnims
	ldr r2, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #4]
_08054AA8:
	strh r0, [r1, #2]
_08054AAA:
	ldr r1, _08054ABC @ =gEfxPairHpBufOffset
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_08054AB8: .4byte gAnims
_08054ABC: .4byte gEfxPairHpBufOffset

	thumb_func_start InitBattleAnimFrame
InitBattleAnimFrame: @ 0x08054AC0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r4, _08054B0C @ =gAnims
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r5, _08054B10 @ =0x0203DFE8
	ldrh r0, [r5]
	cmp r0, #1
	bne _08054AE0
	adds r0, r2, #0
	bl InitLeftAnim
_08054AE0:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne _08054AEC
	adds r0, r6, #0
	bl InitRightAnim
_08054AEC:
	ldr r0, _08054B14 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _08054B06
	ldr r1, [r4]
	movs r2, #2
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r4, #4]
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
_08054B06:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054B0C: .4byte gAnims
_08054B10: .4byte 0x0203DFE8
_08054B14: .4byte gEkrDistanceType

	thumb_func_start InitLeftAnim
InitLeftAnim: @ 0x08054B18
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, _08054C20 @ =gBanimRoundScripts
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sb, r1
	ldr r0, _08054C24 @ =0x081DE20D
	ldr r1, _08054C28 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, _08054C2C @ =0x02000030
	ldr r0, _08054C30 @ =0x081DE218
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	rsbs r1, r1, #0
	movs r2, #0
	strh r1, [r3]
	ldr r0, _08054C34 @ =0x02000034
	strh r2, [r0]
	ldr r0, _08054C38 @ =0x02000028
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, _08054C3C @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, _08054C40 @ =gpBanimModesLeft
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054C44 @ =gBanimScrLeft
	adds r0, r1, r0
	cmp r5, #0xff
	bne _08054B80
	ldr r0, _08054C48 @ =0x08C0A5D8
_08054B80:
	adds r1, r6, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054C38 @ =0x02000028
	ldr r0, _08054C4C @ =gEkrBgPosition
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054C3C @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, _08054C50 @ =0x02000088
	str r0, [r2, #0x2c]
	ldr r0, _08054C54 @ =0x020041C8
	str r0, [r2, #0x30]
	ldr r0, _08054C58 @ =gAnims
	str r2, [r0]
	ldr r0, _08054C40 @ =gpBanimModesLeft
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054C44 @ =gBanimScrLeft
	adds r0, r1, r0
	cmp r2, #0xff
	bne _08054BD4
	ldr r0, _08054C48 @ =0x08C0A5D8
_08054BD4:
	mov r1, sb
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054C38 @ =0x02000028
	ldr r0, _08054C4C @ =gEkrBgPosition
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054C3C @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, _08054C50 @ =0x02000088
	str r0, [r2, #0x2c]
	ldr r0, _08054C54 @ =0x020041C8
	str r0, [r2, #0x30]
	ldr r0, _08054C58 @ =gAnims
	str r2, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054C20: .4byte gBanimRoundScripts
_08054C24: .4byte 0x081DE20D
_08054C28: .4byte gEkrDistanceType
_08054C2C: .4byte 0x02000030
_08054C30: .4byte 0x081DE218
_08054C34: .4byte 0x02000034
_08054C38: .4byte 0x02000028
_08054C3C: .4byte 0x0200002C
_08054C40: .4byte gpBanimModesLeft
_08054C44: .4byte gBanimScrLeft
_08054C48: .4byte 0x08C0A5D8
_08054C4C: .4byte gEkrBgPosition
_08054C50: .4byte 0x02000088
_08054C54: .4byte 0x020041C8
_08054C58: .4byte gAnims

	thumb_func_start InitRightAnim
InitRightAnim: @ 0x08054C5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, _08054D44 @ =gBanimRoundScripts
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, _08054D48 @ =0x081DE212
	ldr r0, _08054D4C @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _08054D50 @ =0x02000030
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, _08054D54 @ =0x02000034
	strh r1, [r0, #2]
	ldr r0, _08054D58 @ =0x02000028
	strh r2, [r0, #2]
	ldr r1, _08054D5C @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, _08054D60 @ =gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054D64 @ =0x02011BC8
	adds r0, r1, r0
	cmp r3, #0xff
	bne _08054CAE
	ldr r0, _08054D68 @ =0x08C0A5D8
_08054CAE:
	adds r1, r4, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054D58 @ =0x02000028
	ldr r0, _08054D6C @ =gEkrBgPosition
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054D5C @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, _08054D70 @ =0x02002088
	str r0, [r2, #0x2c]
	ldr r0, _08054D74 @ =0x020099C8
	str r0, [r2, #0x30]
	ldr r0, _08054D78 @ =gAnims
	str r2, [r0, #8]
	ldr r0, _08054D60 @ =gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054D64 @ =0x02011BC8
	adds r0, r1, r0
	cmp r6, #0xff
	bne _08054D00
	ldr r0, _08054D68 @ =0x08C0A5D8
_08054D00:
	adds r1, r7, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054D58 @ =0x02000028
	ldr r0, _08054D6C @ =gEkrBgPosition
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054D5C @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, _08054D70 @ =0x02002088
	str r0, [r2, #0x2c]
	ldr r0, _08054D74 @ =0x020099C8
	str r0, [r2, #0x30]
	ldr r0, _08054D78 @ =gAnims
	str r2, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054D44: .4byte gBanimRoundScripts
_08054D48: .4byte 0x081DE212
_08054D4C: .4byte gEkrDistanceType
_08054D50: .4byte 0x02000030
_08054D54: .4byte 0x02000034
_08054D58: .4byte 0x02000028
_08054D5C: .4byte 0x0200002C
_08054D60: .4byte gpBanimModesRight
_08054D64: .4byte 0x02011BC8
_08054D68: .4byte 0x08C0A5D8
_08054D6C: .4byte gEkrBgPosition
_08054D70: .4byte 0x02002088
_08054D74: .4byte 0x020099C8
_08054D78: .4byte gAnims

	thumb_func_start SwitchAISFrameDataFromBARoundType
SwitchAISFrameDataFromBARoundType: @ 0x08054D7C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08054D9C
	ldr r0, _08054D98 @ =gBanimRoundScripts
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b _08054DAA
	.align 2, 0
_08054D98: .4byte gBanimRoundScripts
_08054D9C:
	ldr r2, _08054DC8 @ =gBanimRoundScripts
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
_08054DAA:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq _08054DF0
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08054DD4
	ldr r0, _08054DCC @ =gpBanimModesLeft
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054DD0 @ =gBanimScrLeft
	b _08054DE0
	.align 2, 0
_08054DC8: .4byte gBanimRoundScripts
_08054DCC: .4byte gpBanimModesLeft
_08054DD0: .4byte gBanimScrLeft
_08054DD4:
	ldr r0, _08054DE8 @ =gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054DEC @ =0x02011BC8
_08054DE0:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b _08054DFA
	.align 2, 0
_08054DE8: .4byte gpBanimModesRight
_08054DEC: .4byte 0x02011BC8
_08054DF0:
	ldr r0, _08054E40 @ =0x08C0A5D8
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
_08054DFA:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldr r0, _08054E44 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	movs r0, #0xe0
	lsls r0, r0, #3
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, _08054E48 @ =0x020041C8
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl AnimSort
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054E40: .4byte 0x08C0A5D8
_08054E44: .4byte 0x0000F3FF
_08054E48: .4byte 0x020041C8

	thumb_func_start GetAISLayerId
GetAISLayerId: @ 0x08054E4C
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq _08054E5C
	movs r0, #1
	b _08054E5E
_08054E5C:
	movs r0, #0
_08054E5E:
	bx lr

	thumb_func_start GetAnimPosition
GetAnimPosition: @ 0x08054E60
	movs r1, #0x80
	lsls r1, r1, #2
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq _08054E70
	movs r0, #1
	b _08054E72
_08054E70:
	movs r0, #0
_08054E72:
	bx lr

	thumb_func_start CheckRoundMiss
CheckRoundMiss: @ 0x08054E74
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _08054EB8
	lsls r0, r0, #2
	ldr r1, _08054E88 @ =_08054E8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054E88: .4byte _08054E8C
_08054E8C: @ jump table
	.4byte _08054EB8 @ case 0
	.4byte _08054EB8 @ case 1
	.4byte _08054EB8 @ case 2
	.4byte _08054EB8 @ case 3
	.4byte _08054EB4 @ case 4
	.4byte _08054EB4 @ case 5
	.4byte _08054EB8 @ case 6
	.4byte _08054EB8 @ case 7
	.4byte _08054EB8 @ case 8
	.4byte _08054EB8 @ case 9
_08054EB4:
	movs r0, #1
	b _08054EBA
_08054EB8:
	movs r0, #0
_08054EBA:
	bx lr

	thumb_func_start CheckRound1
CheckRound1: @ 0x08054EBC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _08054F00
	lsls r0, r0, #2
	ldr r1, _08054ED0 @ =_08054ED4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054ED0: .4byte _08054ED4
_08054ED4: @ jump table
	.4byte _08054F00 @ case 0
	.4byte _08054F00 @ case 1
	.4byte _08054F00 @ case 2
	.4byte _08054F00 @ case 3
	.4byte _08054F00 @ case 4
	.4byte _08054F00 @ case 5
	.4byte _08054EFC @ case 6
	.4byte _08054EFC @ case 7
	.4byte _08054EFC @ case 8
	.4byte _08054F00 @ case 9
_08054EFC:
	movs r0, #1
	b _08054F02
_08054F00:
	movs r0, #0
_08054F02:
	bx lr

	thumb_func_start CheckRound2
CheckRound2: @ 0x08054F04
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _08054F48
	lsls r0, r0, #2
	ldr r1, _08054F18 @ =_08054F1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054F18: .4byte _08054F1C
_08054F1C: @ jump table
	.4byte _08054F44 @ case 0
	.4byte _08054F44 @ case 1
	.4byte _08054F44 @ case 2
	.4byte _08054F44 @ case 3
	.4byte _08054F48 @ case 4
	.4byte _08054F48 @ case 5
	.4byte _08054F48 @ case 6
	.4byte _08054F48 @ case 7
	.4byte _08054F48 @ case 8
	.4byte _08054F44 @ case 9
_08054F44:
	movs r0, #1
	b _08054F4A
_08054F48:
	movs r0, #0
_08054F4A:
	bx lr

	thumb_func_start CheckRoundCrit
CheckRoundCrit: @ 0x08054F4C
	ldrb r0, [r0, #0x12]
	cmp r0, #9
	bhi _08054F8C
	lsls r0, r0, #2
	ldr r1, _08054F5C @ =_08054F60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054F5C: .4byte _08054F60
_08054F60: @ jump table
	.4byte _08054F8C @ case 0
	.4byte _08054F88 @ case 1
	.4byte _08054F8C @ case 2
	.4byte _08054F88 @ case 3
	.4byte _08054F8C @ case 4
	.4byte _08054F8C @ case 5
	.4byte _08054F8C @ case 6
	.4byte _08054F8C @ case 7
	.4byte _08054F8C @ case 8
	.4byte _08054F8C @ case 9
_08054F88:
	movs r0, #1
	b _08054F8E
_08054F8C:
	movs r0, #0
_08054F8E:
	bx lr

	thumb_func_start GetAnimAnotherSide
GetAnimAnotherSide: @ 0x08054F90
	push {r4, lr}
	ldr r4, _08054FA8 @ =gAnims
	bl GetAnimPosition
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08054FA8: .4byte gAnims

	thumb_func_start GetAnimRoundType
GetAnimRoundType: @ 0x08054FAC
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetAnimNextRoundType
GetAnimNextRoundType: @ 0x08054FCC
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r4, [r4, #0xe]
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetAnimRoundTypeAnotherSide
GetAnimRoundTypeAnotherSide: @ 0x08054FEC
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetAnimNextRoundTypeAnotherSide
GetAnimNextRoundTypeAnotherSide: @ 0x08055010
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r2, r0, #0
	ldrh r4, [r4, #0xe]
	lsls r0, r4, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetAnimStateHidden
SetAnimStateHidden: @ 0x08055034
	cmp r0, #0
	bne _0805504C
	ldr r2, _08055048 @ =gAnims
	ldr r3, [r2]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _0805505E
	.align 2, 0
_08055048: .4byte gAnims
_0805504C:
	cmp r0, #1
	bne _08055064
	ldr r2, _08055068 @ =gAnims
	ldr r3, [r2, #8]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_0805505E:
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
_08055064:
	bx lr
	.align 2, 0
_08055068: .4byte gAnims

	thumb_func_start SetAnimStateUnHidden
SetAnimStateUnHidden: @ 0x0805506C
	push {r4, lr}
	cmp r0, #0
	bne _0805508C
	ldr r2, _08055084 @ =gAnims
	ldr r3, [r2]
	ldr r1, _08055088 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _080550A0
	.align 2, 0
_08055084: .4byte gAnims
_08055088: .4byte 0x0000FFFD
_0805508C:
	cmp r0, #1
	bne _080550A6
	ldr r2, _080550AC @ =gAnims
	ldr r3, [r2, #8]
	ldr r1, _080550B0 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_080550A0:
	ldrh r0, [r3]
	ands r1, r0
	strh r1, [r3]
_080550A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080550AC: .4byte gAnims
_080550B0: .4byte 0x0000FFFD

	thumb_func_start sub_080550B4
sub_080550B4: @ 0x080550B4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _080550C0
	b _08055246
_080550C0:
	movs r5, #0xf0
	lsls r5, r5, #8
	ldrh r0, [r4, #0xc]
	ands r5, r0
	cmp r5, #0
	bne _080550CE
	b _08055246
_080550CE:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r5
	cmp r0, #0
	bne _080550DA
	b _08055208
_080550DA:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _080550E2
	b _080551FE
_080550E2:
	ldrb r1, [r4, #0x14]
	adds r0, r1, r4
	ldrb r0, [r0, #0x14]
	cmp r0, #0x32
	bls _080550EE
	b _080551F6
_080550EE:
	lsls r0, r0, #2
	ldr r1, _080550F8 @ =_080550FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080550F8: .4byte _080550FC
_080550FC: @ jump table
	.4byte _080551F6 @ case 0
	.4byte _080551C8 @ case 1
	.4byte _080551C8 @ case 2
	.4byte _080551E0 @ case 3
	.4byte _080551E0 @ case 4
	.4byte _080551D0 @ case 5
	.4byte _080551F6 @ case 6
	.4byte _080551F6 @ case 7
	.4byte _080551F6 @ case 8
	.4byte _080551F6 @ case 9
	.4byte _080551F6 @ case 10
	.4byte _080551F6 @ case 11
	.4byte _080551F6 @ case 12
	.4byte _080551E8 @ case 13
	.4byte _080551F6 @ case 14
	.4byte _080551F6 @ case 15
	.4byte _080551F6 @ case 16
	.4byte _080551F6 @ case 17
	.4byte _080551F6 @ case 18
	.4byte _080551F6 @ case 19
	.4byte _080551F6 @ case 20
	.4byte _080551F6 @ case 21
	.4byte _080551F6 @ case 22
	.4byte _080551F6 @ case 23
	.4byte _080551F0 @ case 24
	.4byte _080551F6 @ case 25
	.4byte _080551F6 @ case 26
	.4byte _080551F6 @ case 27
	.4byte _080551F6 @ case 28
	.4byte _080551F6 @ case 29
	.4byte _080551F6 @ case 30
	.4byte _080551F6 @ case 31
	.4byte _080551F6 @ case 32
	.4byte _080551F6 @ case 33
	.4byte _080551F6 @ case 34
	.4byte _080551F6 @ case 35
	.4byte _080551F6 @ case 36
	.4byte _080551F6 @ case 37
	.4byte _080551F6 @ case 38
	.4byte _080551F6 @ case 39
	.4byte _080551F6 @ case 40
	.4byte _080551F6 @ case 41
	.4byte _080551F6 @ case 42
	.4byte _080551F6 @ case 43
	.4byte _080551F6 @ case 44
	.4byte _080551F6 @ case 45
	.4byte _080551F6 @ case 46
	.4byte _080551F6 @ case 47
	.4byte _080551F6 @ case 48
	.4byte _080551F6 @ case 49
	.4byte _080551F6 @ case 50
_080551C8:
	adds r0, r4, #0
	bl sub_08055250
	b _080551F6
_080551D0:
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _080551E0
	adds r0, r4, #0
	bl sub_08064A2C
_080551E0:
	ldr r0, [r4, #0x20]
	adds r0, #4
	str r0, [r4, #0x20]
	b _080551F6
_080551E8:
	adds r0, r4, #0
	bl sub_08055274
	b _080551F6
_080551F0:
	adds r0, r4, #0
	bl sub_08055250
_080551F6:
	ldrb r0, [r4, #0x14]
	subs r0, #1
	strb r0, [r4, #0x14]
	b _080550DA
_080551FE:
	movs r0, #0xe7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
_08055208:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r5
	cmp r0, #0
	beq _08055238
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805522E
	ldr r1, [r6, #0x2c]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _0805522E
	adds r0, r4, #0
	bl RegisterAISSheetGraphics
	ldr r0, [r4, #0x28]
	str r0, [r6, #0x2c]
_0805522E:
	movs r0, #0xd7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
_08055238:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r5, r0
	cmp r5, #0
	beq _08055246
	ldr r0, _0805524C @ =0x0000FFFF
	strh r0, [r4, #0xe]
_08055246:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805524C: .4byte 0x0000FFFF

	thumb_func_start sub_08055250
sub_08055250: @ 0x08055250
	adds r1, r0, #0
	ldr r0, _08055270 @ =0x0000FFFE
	strh r0, [r1, #0xe]
	movs r0, #8
	ldrh r2, [r1, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _0805526C
	strh r0, [r1, #0x10]
	movs r0, #0
	strh r0, [r1, #0xe]
	ldr r0, [r1, #0x20]
	adds r0, #4
	str r0, [r1, #0x20]
_0805526C:
	bx lr
	.align 2, 0
_08055270: .4byte 0x0000FFFE

	thumb_func_start sub_08055274
sub_08055274: @ 0x08055274
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x44]
	bl GetAISLayerId
	cmp r0, #0
	bne _080552C6
	ldr r3, _080552CC @ =gBanimRoundScripts
	movs r1, #6
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r1, _080552D0 @ =0x08E00008
	adds r0, r0, r1
	ldr r1, [r0, #0xc]
	ldr r2, [r6, #0x14]
	ldr r4, [r6, #0x18]
	ldr r5, [r6, #0x28]
	ldrb r3, [r3, #0x18]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, r0
	ldr r0, [r1, #4]
	str r0, [r2, #0x28]
	ldr r5, [r2, #0x30]
	ldr r0, [r1, #8]
	adds r5, r5, r0
	str r5, [r2, #0x3c]
	ldr r5, [r4, #0x30]
	ldr r0, _080552D4 @ =0x000057F0
	adds r5, r5, r0
	str r5, [r4, #0x3c]
	ldr r1, [r6, #0x2c]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq _080552C6
	adds r0, r7, #0
	bl NewEkrChienCHR
	ldr r0, [r7, #0x28]
	str r0, [r6, #0x2c]
_080552C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080552CC: .4byte gBanimRoundScripts
_080552D0: .4byte 0x08E00008
_080552D4: .4byte 0x000057F0

	thumb_func_start sub_080552D8
sub_080552D8: @ 0x080552D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08055360 @ =0x08E00008
	mov sb, r0
	ldr r2, _08055364 @ =gBanimRoundScripts
	ldrh r3, [r5, #0xa]
	lsls r1, r3, #2
	adds r0, r1, r2
	ldrb r4, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, #6
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r5, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	mov r3, sb
	adds r1, r0, r3
	ldr r2, [r1, #0xc]
	ldr r3, [r5, #0x28]
	ldr r7, _08055368 @ =0x08C0A5D8
	cmp r4, #0xff
	beq _08055336
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_08055336:
	ldr r0, _08055368 @ =0x08C0A5D8
	mov sl, r0
	cmp r6, #0xff
	beq _08055348
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov sl, r3
_08055348:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08055370
	ldr r4, [r5, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _0805536C @ =0x000057F0
	adds r1, r4, r2
	b _0805537E
	.align 2, 0
_08055360: .4byte 0x08E00008
_08055364: .4byte gBanimRoundScripts
_08055368: .4byte 0x08C0A5D8
_0805536C: .4byte 0x000057F0
_08055370:
	ldr r4, [r5, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r3, _08055468 @ =0x000057F0
	adds r1, r4, r3
_0805537E:
	movs r0, #1
	str r0, [r1]
	mov r1, r8
	adds r0, r7, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r5, #2]
	movs r6, #0
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	ldrh r1, [r5, #0x10]
	lsls r0, r1, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r4, r3, #0
	orrs r0, r4
	ldrh r1, [r5, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r5, #0xc]
	lsls r0, r3, #9
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r6, [r2, #0xe]
	ldrh r0, [r5, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r5, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r5, #0x14]
	str r5, [r2, #0x44]
	ldr r1, [sp]
	mov r0, sl
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	ldrh r3, [r5, #0x10]
	lsls r0, r3, #0xc
	orrs r0, r4
	ldrh r1, [r5, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r5, #0xc]
	lsls r0, r3, #9
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r6, [r2, #0xe]
	ldrh r0, [r5, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r5, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r5, #0x18]
	str r5, [r2, #0x44]
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r5, #0x20]
	bl LZ77UnCompWram
	movs r3, #8
	ldrsh r1, [r5, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805543A
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r2, _0805546C @ =0x08FD8008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	ldr r1, [r5, #0x20]
	bl LZ77UnCompWram
_0805543A:
	ldrb r3, [r5, #1]
	lsls r1, r3, #5
	ldr r0, [r5, #0x20]
	adds r0, r0, r1
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #5
	ldr r2, _08055470 @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	str r6, [r5, #0x2c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055468: .4byte 0x000057F0
_0805546C: .4byte 0x08FD8008
_08055470: .4byte 0x02022A60

	thumb_func_start sub_08055474
sub_08055474: @ 0x08055474
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _080554E8 @ =0x08E00008
	mov sb, r0
	ldr r2, _080554EC @ =gBanimRoundScripts
	ldrh r1, [r6, #0xa]
	lsls r0, r1, #2
	adds r1, r0, r2
	ldrb r4, [r1]
	adds r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	movs r2, #6
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r6, #0x28]
	bl LZ77UnCompWram
	movs r3, #6
	ldrsh r0, [r6, r3]
	lsls r0, r0, #5
	mov r7, sb
	adds r1, r0, r7
	ldr r2, [r1, #0xc]
	ldr r3, [r6, #0x28]
	ldr r7, _080554F0 @ =0x08C0A5D8
	cmp r4, #0xff
	beq _080554BE
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_080554BE:
	ldr r0, _080554F0 @ =0x08C0A5D8
	mov r8, r0
	cmp r5, #0xff
	beq _080554D0
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov r8, r3
_080554D0:
	ldrh r0, [r6, #0xc]
	cmp r0, #0
	bne _080554F8
	ldr r4, [r6, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _080554F4 @ =0x000057F0
	adds r1, r4, r2
	b _08055506
	.align 2, 0
_080554E8: .4byte 0x08E00008
_080554EC: .4byte gBanimRoundScripts
_080554F0: .4byte 0x08C0A5D8
_080554F4: .4byte 0x000057F0
_080554F8:
	ldr r4, [r6, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r3, _080555DC @ =0x000057F0
	adds r1, r4, r3
_08055506:
	movs r0, #1
	str r0, [r1]
	ldr r5, [r6, #0x14]
	str r7, [r5, #0x24]
	str r7, [r5, #0x20]
	ldr r0, [r6, #0x24]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	movs r4, #0
	movs r2, #0
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0x10]
	lsls r0, r7, #0xc
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r1, #0
	orrs r0, r3
	ldrh r7, [r6, #0xe]
	orrs r0, r7
	strh r0, [r5, #8]
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r7, [r5, #0xc]
	ands r0, r7
	strh r0, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #0xa]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x1c]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x14]
	ldr r5, [r6, #0x18]
	mov r0, r8
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	ldr r0, [r6, #0x24]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0x10]
	lsls r0, r7, #0xc
	orrs r0, r3
	ldrh r3, [r6, #0xe]
	orrs r0, r3
	strh r0, [r5, #8]
	ldrh r7, [r5, #0xc]
	ands r1, r7
	strh r1, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #0xa]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x1c]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x18]
	movs r1, #6
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r6, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080555B4
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r7, _080555E0 @ =0x08FD8008
	adds r0, r0, r7
	ldr r0, [r0, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
_080555B4:
	ldrb r0, [r6, #1]
	lsls r1, r0, #5
	ldr r0, [r6, #0x20]
	adds r0, r0, r1
	ldrh r6, [r6, #0x10]
	lsls r1, r6, #5
	ldr r2, _080555E4 @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080555DC: .4byte 0x000057F0
_080555E0: .4byte 0x08FD8008
_080555E4: .4byte 0x02022A60

	thumb_func_start sub_080555E8
sub_080555E8: @ 0x080555E8
	push {lr}
	strh r1, [r0, #6]
	strh r2, [r0, #8]
	bl sub_08055474
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080555F8
sub_080555F8: @ 0x080555F8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	ldr r2, [r0, #0x14]
	strh r1, [r2, #2]
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldr r2, [r0, #0x18]
	ldrh r1, [r0, #2]
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	bx lr

	thumb_func_start sub_08055614
sub_08055614: @ 0x08055614
	lsls r1, r1, #0x10
	ldr r2, [r0, #0x14]
	lsrs r1, r1, #6
	strh r1, [r2, #8]
	ldr r2, [r0, #0x18]
	strh r1, [r2, #8]
	bx lr
	.align 2, 0

	thumb_func_start sub_08055624
sub_08055624: @ 0x08055624
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x18]
	ldr r0, _0805563C @ =0x0000FFFE
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	beq _08055640
	ldrh r2, [r2, #0xe]
	cmp r2, r0
	beq _08055640
	movs r0, #0
	b _08055642
	.align 2, 0
_0805563C: .4byte 0x0000FFFE
_08055640:
	movs r0, #1
_08055642:
	bx lr

	thumb_func_start sub_08055644
sub_08055644: @ 0x08055644
	ldr r3, [r0, #0x14]
	movs r2, #8
	ldrh r1, [r3, #0x10]
	orrs r1, r2
	strh r1, [r3, #0x10]
	ldr r3, [r0, #0x18]
	ldrh r0, [r3, #0x10]
	orrs r0, r2
	strh r0, [r3, #0x10]
	bx lr

	thumb_func_start sub_08055658
sub_08055658: @ 0x08055658
	ldr r1, [r0, #0x14]
	ldr r0, _08055668 @ =0x0000FFFF
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	bne _0805566C
	movs r0, #1
	b _0805566E
	.align 2, 0
_08055668: .4byte 0x0000FFFF
_0805566C:
	movs r0, #0
_0805566E:
	bx lr

	thumb_func_start sub_08055670
sub_08055670: @ 0x08055670
	push {r4, lr}
	ldr r4, _08055688 @ =0x0201FB0C
	ldr r0, _0805568C @ =0x08C0A628
	movs r1, #4
	bl Proc_Start
	str r0, [r4]
	bl AnimClearAll
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055688: .4byte 0x0201FB0C
_0805568C: .4byte 0x08C0A628

	thumb_func_start sub_08055690
sub_08055690: @ 0x08055690
	push {lr}
	ldr r0, _080556A0 @ =0x0201FB0C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080556A0: .4byte 0x0201FB0C

	thumb_func_start sub_080556A4
sub_080556A4: @ 0x080556A4
	push {lr}
	bl AnimUpdateAll
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080556B0
sub_080556B0: @ 0x080556B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080556D4 @ =0x08C0A640
	movs r1, #4
	bl Proc_Start
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_080552D8
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080556D4: .4byte 0x08C0A640

	thumb_func_start sub_080556D8
sub_080556D8: @ 0x080556D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl AnimDelete
	ldr r0, [r4, #0x18]
	bl AnimDelete
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x34]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080556FC
sub_080556FC: @ 0x080556FC
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_080550B4
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_080550B4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055718
sub_08055718: @ 0x08055718
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, _08055780 @ =0x08FC0008
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08055756
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
_08055756:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805576C
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
_0805576C:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _08055784
	cmp r0, #1
	bge _08055792
	cmp r0, #0
	beq _08055788
	b _08055792
	.align 2, 0
_08055780: .4byte 0x08FC0008
_08055784:
	cmp r0, #4
	bne _08055792
_08055788:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b _080557A0
_08055792:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
_080557A0:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov sb, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08055824
	cmp r4, r0
	blt _08055884
	cmp r4, #3
	bgt _08055884
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, _08055820 @ =gPal
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r6, #0
	bl sub_08055B08
	b _08055884
	.align 2, 0
_08055820: .4byte gPal
_08055824:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _08055852
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805589C @ =0x02022A60
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
_08055852:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _08055880
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805589C @ =0x02022A60
	adds r1, r1, r0
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
_08055880:
	bl EnablePalSync
_08055884:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls _08055892
	b _08055AB2
_08055892:
	lsls r0, r0, #2
	ldr r1, _080558A0 @ =_080558A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805589C: .4byte 0x02022A60
_080558A0: .4byte _080558A4
_080558A4: @ jump table
	.4byte _080558D8 @ case 0
	.4byte _080558B8 @ case 1
	.4byte _080558C0 @ case 2
	.4byte _080558C8 @ case 3
	.4byte _080558D0 @ case 4
_080558B8:
	movs r0, #1
	bl EnableBgSync
	b _08055AB2
_080558C0:
	movs r0, #2
	bl EnableBgSync
	b _08055AB2
_080558C8:
	movs r0, #4
	bl EnableBgSync
	b _08055AB2
_080558D0:
	movs r0, #8
	bl EnableBgSync
	b _08055AB2
_080558D8:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq _080559C6
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _080559C6
	lsls r0, r0, #2
	ldr r1, _080558FC @ =_08055900
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080558FC: .4byte _08055900
_08055900: @ jump table
	.4byte _08055914 @ case 0
	.4byte _08055940 @ case 1
	.4byte _0805596C @ case 2
	.4byte _08055998 @ case 3
	.4byte _08055914 @ case 4
_08055914:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805593C @ =0x08C0BFD0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b _080559BC
	.align 2, 0
_0805593C: .4byte 0x08C0BFD0
_08055940:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055968 @ =0x08C0BED0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b _080559BC
	.align 2, 0
_08055968: .4byte 0x08C0BED0
_0805596C:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055994 @ =0x08C0BED0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b _080559BC
	.align 2, 0
_08055994: .4byte 0x08C0BED0
_08055998:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080559E4 @ =0x08C0BFD0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
_080559BC:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
_080559C6:
	movs r0, #6
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08055AB2
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _08055AB2
	lsls r0, r0, #2
	ldr r1, _080559E8 @ =_080559EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080559E4: .4byte 0x08C0BFD0
_080559E8: .4byte _080559EC
_080559EC: @ jump table
	.4byte _08055A00 @ case 0
	.4byte _08055A2C @ case 1
	.4byte _08055A58 @ case 2
	.4byte _08055A84 @ case 3
	.4byte _08055A00 @ case 4
_08055A00:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055A28 @ =0x08C0BF50
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b _08055AA8
	.align 2, 0
_08055A28: .4byte 0x08C0BF50
_08055A2C:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055A54 @ =0x08C0BE44
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _08055AA8
	.align 2, 0
_08055A54: .4byte 0x08C0BE44
_08055A58:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055A80 @ =0x08C0BE44
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _08055AA8
	.align 2, 0
_08055A80: .4byte 0x08C0BE44
_08055A84:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055AC0 @ =0x08C0BE44
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
_08055AA8:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
_08055AB2:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055AC0: .4byte 0x08C0BE44

	thumb_func_start sub_08055AC4
sub_08055AC4: @ 0x08055AC4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08055AE8
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _08055ADE
	bl Proc_End
_08055ADE:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08055AE8
	bl Proc_End
_08055AE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055AF0
sub_08055AF0: @ 0x08055AF0
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #0x14]
	strh r1, [r5, #0x32]
	strh r2, [r5, #0x3a]
	ldr r5, [r0, #0x18]
	strh r3, [r5, #0x32]
	strh r4, [r5, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055B08
sub_08055B08: @ 0x08055B08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	mov sl, r4
	ldr r0, _08055B4C @ =0x08C0A5E8
	movs r2, #0xc
	ldrsh r1, [r7, r2]
	lsls r2, r1, #3
	adds r2, r2, r0
	ldr r2, [r2]
	str r2, [sp, #0x10]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #0x14]
	movs r0, #0
	bl sub_08050F74
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bhi _08055B9C
	lsls r0, r0, #2
	ldr r1, _08055B50 @ =_08055B54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055B4C: .4byte 0x08C0A5E8
_08055B50: .4byte _08055B54
_08055B54: @ jump table
	.4byte _08055B68 @ case 0
	.4byte _08055B70 @ case 1
	.4byte _08055B88 @ case 2
	.4byte _08055B9C @ case 3
	.4byte _08055B68 @ case 4
_08055B68:
	movs r4, #0x21
	movs r2, #0x30
	mov sl, r2
	b _08055BBC
_08055B70:
	movs r4, #0x1d
	movs r0, #0x30
	mov sl, r0
	ldr r0, _08055B84 @ =gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #4
	rsbs r5, r5, #0
_08055B7E:
	cmp r0, #1
	bne _08055BBE
	b _08055BBC
	.align 2, 0
_08055B84: .4byte gEkrInitPosReal
_08055B88:
	movs r4, #3
	movs r1, #0x30
	mov sl, r1
	ldr r0, _08055B98 @ =gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #0x1e
	rsbs r5, r5, #0
	b _08055B7E
	.align 2, 0
_08055B98: .4byte gEkrInitPosReal
_08055B9C:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08055BAE
	movs r4, #0x27
	movs r0, #3
	mov sl, r0
_08055BAE:
	movs r2, #6
	ldrsh r0, [r7, r2]
	cmp r0, r1
	beq _08055BBC
	movs r4, #3
	movs r0, #0x2a
	mov sl, r0
_08055BBC:
	movs r5, #0
_08055BBE:
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	lsls r2, r4, #1
	ldr r4, _08055C44 @ =0x0201CF78
	adds r2, r2, r4
	movs r0, #0xf
	mov r8, r0
	str r0, [sp]
	movs r6, #5
	str r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #4
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	mov r0, sl
	lsls r2, r0, #1
	adds r2, r2, r4
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	lsls r0, r5, #1
	adds r4, r4, r0
	ldr r2, _08055C48 @ =0xFFFFFA96
	adds r4, r4, r2
	ldr r2, _08055C4C @ =gBg2Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055C44: .4byte 0x0201CF78
_08055C48: .4byte 0xFFFFFA96
_08055C4C: .4byte gBg2Tm

	thumb_func_start sub_08055C50
sub_08055C50: @ 0x08055C50
	push {lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _08055C98
	lsls r0, r0, #2
	ldr r1, _08055C6C @ =_08055C70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055C6C: .4byte _08055C70
_08055C70: @ jump table
	.4byte _08055C84 @ case 0
	.4byte _08055C8E @ case 1
	.4byte _08055C98 @ case 2
	.4byte _08055C98 @ case 3
	.4byte _08055C84 @ case 4
_08055C84:
	movs r2, #0x30
	cmp r3, #0
	bne _08055CA0
	movs r2, #0x21
	b _08055CA0
_08055C8E:
	movs r2, #0x30
	cmp r3, #0
	bne _08055CA0
	movs r2, #0x1d
	b _08055CA0
_08055C98:
	movs r2, #0x30
	cmp r3, #0
	bne _08055CA0
	movs r2, #3
_08055CA0:
	ldr r0, _08055CC4 @ =0x081DE222
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	ldr r3, _08055CC8 @ =0x0201CF78
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl EfxTmCpyExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08055CC4: .4byte 0x081DE222
_08055CC8: .4byte 0x0201CF78

	thumb_func_start sub_08055CCC
sub_08055CCC: @ 0x08055CCC
	ldr r1, _08055CD4 @ =0x0203E0C8
	str r0, [r1]
	bx lr
	.align 2, 0
_08055CD4: .4byte 0x0203E0C8

	thumb_func_start GetBattleAnimArenaFlag
GetBattleAnimArenaFlag: @ 0x08055CD8
	ldr r0, _08055CE0 @ =0x0203E0C8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08055CE0: .4byte 0x0203E0C8

	thumb_func_start sub_08055CE4
sub_08055CE4: @ 0x08055CE4
	push {r4, lr}
	sub sp, #0x10
	asrs r4, r0, #3
	movs r1, #7
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _08055D24 @ =0x0201D42C
	adds r4, r4, r0
	ldr r2, _08055D28 @ =gBg3Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	subs r0, #0x17
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055D24: .4byte 0x0201D42C
_08055D28: .4byte gBg3Tm

	thumb_func_start sub_08055D2C
sub_08055D2C: @ 0x08055D2C
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _08055D40
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8f
	bl EfxPlaySE
_08055D40:
	pop {r0}
	bx r0

	thumb_func_start sub_08055D44
sub_08055D44: @ 0x08055D44
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _08055D54
	movs r0, #0x8e
	bl DoM4aSongNumStop
_08055D54:
	pop {r0}
	bx r0

	thumb_func_start sub_08055D58
sub_08055D58: @ 0x08055D58
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl sub_0804DC18
	ldr r1, _08055D78 @ =gEkrInitPosReal
	str r0, [r1]
	bl sub_08055D94
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08055D78: .4byte gEkrInitPosReal

	thumb_func_start sub_08055D7C
sub_08055D7C: @ 0x08055D7C
	push {lr}
	bl AnimClearAll
	bl sub_08055F1C
	ldr r0, _08055D90 @ =sub_08051214
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_08055D90: .4byte sub_08051214

	thumb_func_start sub_08055D94
sub_08055D94: @ 0x08055D94
	push {lr}
	ldr r0, _08055DA4 @ =0x08C0A658
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08055DA4: .4byte 0x08C0A658

	thumb_func_start sub_08055DA8
sub_08055DA8: @ 0x08055DA8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl InitOam
	ldr r1, _08055E1C @ =gEkrInitPosReal
	ldr r0, _08055E20 @ =gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	bl sub_0804D738
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl sub_0804D540
	bl NewEkrBattle
	ldr r0, _08055E24 @ =0x081E4210
	ldr r4, _08055E28 @ =0x02022920
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	subs r4, #0xc0
	ldr r5, _08055E2C @ =0x020165C8
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	mov r0, r8
	bl Proc_Break
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055E1C: .4byte gEkrInitPosReal
_08055E20: .4byte gEkrInitialHitSide
_08055E24: .4byte 0x081E4210
_08055E28: .4byte 0x02022920
_08055E2C: .4byte 0x020165C8

	thumb_func_start sub_08055E30
sub_08055E30: @ 0x08055E30
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _08055E90 @ =0x081E1404
	ldr r1, _08055E94 @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _08055E98 @ =0x081E3A70
	ldr r6, _08055E9C @ =gEkrTsaBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08055EA0 @ =gEfxFrameTmap
	movs r0, #0x2e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r3, #0x42
	bl EfxTmCpyExt
	movs r0, #0
	bl sub_08055CE4
	movs r0, #8
	bl EnableBgSync
	strh r4, [r5, #0x2c]
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8e
	bl EfxPlaySE
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055E90: .4byte 0x081E1404
_08055E94: .4byte 0x06008000
_08055E98: .4byte 0x081E3A70
_08055E9C: .4byte gEkrTsaBuffer
_08055EA0: .4byte gEfxFrameTmap

	thumb_func_start sub_08055EA4
sub_08055EA4: @ 0x08055EA4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08055F00 @ =0x020165C8
	ldr r4, _08055F04 @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08055EF8
	adds r0, r6, #0
	bl Proc_Break
_08055EF8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055F00: .4byte 0x020165C8
_08055F04: .4byte gPal

	thumb_func_start sub_08055F08
sub_08055F08: @ 0x08055F08
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08055FF0
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08055F1C
sub_08055F1C: @ 0x08055F1C
	push {lr}
	ldr r0, _08055F30 @ =0x08C0A688
	movs r1, #3
	bl Proc_Start
	bl sub_08056024
	pop {r0}
	bx r0
	.align 2, 0
_08055F30: .4byte 0x08C0A688

	thumb_func_start sub_08055F34
sub_08055F34: @ 0x08055F34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08055F58 @ =gPal
	ldr r1, _08055F5C @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055F58: .4byte gPal
_08055F5C: .4byte 0x020165C8

	thumb_func_start sub_08055F60
sub_08055F60: @ 0x08055F60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08055FBC @ =0x020165C8
	ldr r4, _08055FC0 @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08055FB4
	adds r0, r6, #0
	bl Proc_Break
_08055FB4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055FBC: .4byte 0x020165C8
_08055FC0: .4byte gPal

	thumb_func_start sub_08055FC4
sub_08055FC4: @ 0x08055FC4
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, _08055FE8 @ =OnGameLoopMain
	bl SetMainFunc
	ldr r0, _08055FEC @ =OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055FE8: .4byte OnGameLoopMain
_08055FEC: .4byte OnVBlank

	thumb_func_start sub_08055FF0
sub_08055FF0: @ 0x08055FF0
	push {r4, lr}
	ldr r4, _08056014 @ =0x0201FB18
	ldr r0, _08056018 @ =0x08C0A6B0
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805601C @ =0x081DE2B8
	str r1, [r0, #0x48]
	ldr r1, _08056020 @ =0x08C0A6C8
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056014: .4byte 0x0201FB18
_08056018: .4byte 0x08C0A6B0
_0805601C: .4byte 0x081DE2B8
_08056020: .4byte 0x08C0A6C8

	thumb_func_start sub_08056024
sub_08056024: @ 0x08056024
	push {lr}
	ldr r0, _08056034 @ =0x0201FB18
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08056034: .4byte 0x0201FB18

	thumb_func_start sub_08056038
sub_08056038: @ 0x08056038
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _08056064
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0805606C @ =0x02022920
	movs r2, #0x20
	bl CpuFastSet
	bl EnablePalSync
_08056064:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805606C: .4byte 0x02022920

	thumb_func_start StartSpellAnimation
StartSpellAnimation: @ 0x08056070
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08056098 @ =gEkrSpellAnimIndex
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, _0805609C @ =0x08C1071C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056098: .4byte gEkrSpellAnimIndex
_0805609C: .4byte 0x08C1071C

	thumb_func_start nullsub_49
nullsub_49: @ 0x080560A0
	bx lr
	.align 2, 0

	thumb_func_start sub_080560A4
sub_080560A4: @ 0x080560A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, _080560E0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080560E4 @ =0x08C10830
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080560E0: .4byte 0x0201774C
_080560E4: .4byte 0x08C10830

	thumb_func_start sub_080560E8
sub_080560E8: @ 0x080560E8
	ldr r1, _080560F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080560F4: .4byte 0x0201774C

	thumb_func_start sub_080560F8
sub_080560F8: @ 0x080560F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	ldr r0, _08056178 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _0805617C @ =0x0201FDB8
	cmp r0, #0
	bne _08056110
	ldr r4, _08056180 @ =0x0201FEF8
_08056110:
	ldrh r0, [r2, #0x2e]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	ldr r1, [r2, #0x50]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	movs r1, #0
	ldr r0, [r2, #0x44]
	mov r8, r0
	ldr r6, [r2, #0x48]
	mov sl, r6
	ldr r7, _08056184 @ =0x08C4A008
	mov ip, r7
	ldr r5, [r2, #0x4c]
	ldr r0, _08056188 @ =gDispIo
	mov sb, r0
_08056130:
	mov r6, sl
	adds r0, r3, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov r6, sb
	ldrh r6, [r6, #0x20]
	adds r0, r6, r0
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	cmp r1, #0x77
	bls _08056130
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _0805616A
	adds r0, r2, #0
	bl Proc_End
_0805616A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056178: .4byte 0x0201FDAC
_0805617C: .4byte 0x0201FDB8
_08056180: .4byte 0x0201FEF8
_08056184: .4byte 0x08C4A008
_08056188: .4byte gDispIo

	thumb_func_start sub_0805618C
sub_0805618C: @ 0x0805618C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080561CC @ =0x08C10850
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	ldr r2, _080561D0 @ =0x0201FDB8
_080561A6:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _080561A6
	ldr r2, _080561D4 @ =0x0201FEF8
	movs r1, #0
_080561B8:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _080561B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080561CC: .4byte 0x08C10850
_080561D0: .4byte 0x0201FDB8
_080561D4: .4byte 0x0201FEF8

	thumb_func_start sub_080561D8
sub_080561D8: @ 0x080561D8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x44]
	cmp r0, r1
	bne _080561F2
	adds r0, r2, #0
	bl Proc_Break
_080561F2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080561F8
sub_080561F8: @ 0x080561F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08056220 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056224 @ =0x08C10868
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056220: .4byte 0x0201774C
_08056224: .4byte 0x08C10868

	thumb_func_start sub_08056228
sub_08056228: @ 0x08056228
	ldr r1, _08056234 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08056234: .4byte 0x0201774C

	thumb_func_start sub_08056238
sub_08056238: @ 0x08056238
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08056274 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r1, _08056278 @ =0x0201FDB8
	cmp r0, #0
	bne _08056248
	ldr r1, _0805627C @ =0x0201FEF8
_08056248:
	movs r2, #0
	ldr r5, [r3, #0x44]
	ldr r4, _08056280 @ =gDispIo
_0805624E:
	ldrh r0, [r4, #0x20]
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x77
	bls _0805624E
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bne _0805626E
	adds r0, r3, #0
	bl Proc_End
_0805626E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056274: .4byte 0x0201FDAC
_08056278: .4byte 0x0201FDB8
_0805627C: .4byte 0x0201FEF8
_08056280: .4byte gDispIo

	thumb_func_start sub_08056284
sub_08056284: @ 0x08056284
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r1, _080562CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080562D0 @ =0x08C10888
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	mov r0, r8
	str r0, [r7, #0x5c]
	movs r1, #0
	mov sb, r1
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	str r4, [r7, #0x44]
	str r5, [r7, #0x54]
	str r6, [r7, #0x58]
	mov r0, r8
	bl GetAnimAnotherSide
	bl GetAnimPosition
	cmp r0, #0
	bne _080562D8
	ldr r0, _080562D4 @ =0x0000FFB8
	b _080562DA
	.align 2, 0
_080562CC: .4byte 0x0201774C
_080562D0: .4byte 0x08C10888
_080562D4: .4byte 0x0000FFB8
_080562D8:
	ldr r0, _080562F8 @ =0x0000FFF8
_080562DA:
	strh r0, [r7, #0x32]
	ldr r0, _080562FC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08056306
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne _08056300
	ldrh r0, [r7, #0x32]
	adds r0, #0x18
	b _08056304
	.align 2, 0
_080562F8: .4byte 0x0000FFF8
_080562FC: .4byte gEkrDistanceType
_08056300:
	ldrh r0, [r7, #0x32]
	subs r0, #0x18
_08056304:
	strh r0, [r7, #0x32]
_08056306:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08056314
sub_08056314: @ 0x08056314
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0805635C @ =0x0201FB20
	ldr r0, [r0]
	ldr r5, _08056360 @ =0x0201FB2C
	cmp r0, #0
	bne _08056324
	ldr r5, _08056364 @ =0x0201FC6C
_08056324:
	ldr r1, [r4, #0x54]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r1, [r4, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _08056368 @ =0x0000FFFF
	cmp r2, r0
	beq _08056390
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0
	ldr r6, [r4, #0x44]
	ldr r7, _0805636C @ =0x00007FFF
	mov ip, r7
_0805634C:
	ldrh r1, [r3]
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r0, ip
	bne _08056370
	movs r0, #0
	b _08056382
	.align 2, 0
_0805635C: .4byte 0x0201FB20
_08056360: .4byte 0x0201FB2C
_08056364: .4byte 0x0201FC6C
_08056368: .4byte 0x0000FFFF
_0805636C: .4byte 0x00007FFF
_08056370:
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	ldrh r7, [r3, #2]
	adds r0, r0, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
_08056382:
	strh r0, [r5]
	adds r3, #4
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _0805634C
	b _080563A0
_08056390:
	movs r2, #0
	ldr r6, [r4, #0x44]
	movs r0, #0
_08056396:
	strh r0, [r5]
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _08056396
_080563A0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r6
	bne _080563BC
	ldr r1, _080563C4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080563BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080563C4: .4byte 0x0201774C

	thumb_func_start sub_080563C8
sub_080563C8: @ 0x080563C8
	ldr r0, _080563E4 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080563E2
	ldr r3, _080563E8 @ =0x04000014
	ldr r2, _080563EC @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_080563E2:
	bx lr
	.align 2, 0
_080563E4: .4byte 0x04000004
_080563E8: .4byte 0x04000014
_080563EC: .4byte 0x0201FDB4

	thumb_func_start sub_080563F0
sub_080563F0: @ 0x080563F0
	ldr r0, _0805640C @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805640A
	ldr r3, _08056410 @ =0x04000016
	ldr r2, _08056414 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_0805640A:
	bx lr
	.align 2, 0
_0805640C: .4byte 0x04000004
_08056410: .4byte 0x04000016
_08056414: .4byte 0x0201FDB4

	thumb_func_start sub_08056418
sub_08056418: @ 0x08056418
	ldr r0, _08056444 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08056440
	ldr r3, _08056448 @ =0x0400001A
	ldr r2, _0805644C @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #6
	ldr r2, _08056450 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08056440:
	bx lr
	.align 2, 0
_08056444: .4byte 0x04000004
_08056448: .4byte 0x0400001A
_0805644C: .4byte 0x0201FB28
_08056450: .4byte 0x0201FDB4

	thumb_func_start sub_08056454
sub_08056454: @ 0x08056454
	ldr r0, _08056480 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805647C
	ldr r3, _08056484 @ =0x0400001A
	ldr r2, _08056488 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _0805648C @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_0805647C:
	bx lr
	.align 2, 0
_08056480: .4byte 0x04000004
_08056484: .4byte 0x0400001A
_08056488: .4byte 0x0201FB28
_0805648C: .4byte 0x0201FDB4

	thumb_func_start sub_08056490
sub_08056490: @ 0x08056490
	ldr r0, _080564AC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080564AA
	ldr r3, _080564B0 @ =0x0400001A
	ldr r2, _080564B4 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_080564AA:
	bx lr
	.align 2, 0
_080564AC: .4byte 0x04000004
_080564B0: .4byte 0x0400001A
_080564B4: .4byte 0x0201FB28

	thumb_func_start sub_080564B8
sub_080564B8: @ 0x080564B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _08056554 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r6, _08056558 @ =0x0201FDB8
	ldr r7, _0805655C @ =0x0201FEF8
	ldr r0, _08056560 @ =0x0201FDAC
	mov sl, r0
	cmp r4, #2
	bne _0805651A
	ldr r1, _08056564 @ =0x0201FB2C
	movs r0, #0
	adds r5, r1, #0
	ldr r3, _08056568 @ =0x0201FB20
	mov ip, r3
	ldr r3, _0805656C @ =0x0201FB24
	mov r8, r3
	ldr r3, _08056570 @ =0x0201FB28
	mov sb, r3
_080564F4:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _080564F4
	ldr r1, _08056574 @ =0x0201FC6C
	movs r0, #0
_08056502:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08056502
	movs r0, #0
	mov r1, ip
	str r0, [r1]
	mov r3, r8
	str r5, [r3]
	mov r0, sb
	str r5, [r0]
_0805651A:
	adds r1, r6, #0
	movs r0, #0
_0805651E:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _0805651E
	adds r1, r7, #0
	movs r0, #0
_0805652C:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _0805652C
	movs r0, #0
	mov r1, sl
	str r0, [r1]
	ldr r3, _08056578 @ =0x0201FDB0
	str r6, [r3]
	ldr r0, _0805657C @ =0x0201FDB4
	str r6, [r0]
	cmp r4, #1
	beq _080565A0
	cmp r4, #1
	blo _08056580
	cmp r4, #2
	beq _080565C0
	b _080565CE
	.align 2, 0
_08056554: .4byte 0x0201774C
_08056558: .4byte 0x0201FDB8
_0805655C: .4byte 0x0201FEF8
_08056560: .4byte 0x0201FDAC
_08056564: .4byte 0x0201FB2C
_08056568: .4byte 0x0201FB20
_0805656C: .4byte 0x0201FB24
_08056570: .4byte 0x0201FB28
_08056574: .4byte 0x0201FC6C
_08056578: .4byte 0x0201FDB0
_0805657C: .4byte 0x0201FDB4
_08056580:
	bl CheckInEkrDragon
	cmp r0, #0
	bne _08056594
	ldr r0, _08056590 @ =sub_080563C8
	bl SetOnHBlankA
	b _080565CE
	.align 2, 0
_08056590: .4byte sub_080563C8
_08056594:
	ldr r0, _0805659C @ =sub_08056418
	bl SetOnHBlankA
	b _080565CE
	.align 2, 0
_0805659C: .4byte sub_08056418
_080565A0:
	bl CheckInEkrDragon
	cmp r0, #0
	bne _080565B4
	ldr r0, _080565B0 @ =sub_080563F0
	bl SetOnHBlankA
	b _080565CE
	.align 2, 0
_080565B0: .4byte sub_080563F0
_080565B4:
	ldr r0, _080565BC @ =sub_08056454
	bl SetOnHBlankA
	b _080565CE
	.align 2, 0
_080565BC: .4byte sub_08056454
_080565C0:
	bl CheckInEkrDragon
	cmp r0, #0
	bne _080565CE
	ldr r0, _080565F4 @ =sub_080563F0
	bl SetOnHBlankA
_080565CE:
	ldr r0, _080565F8 @ =0x08C108A0
	movs r1, #0
	bl Proc_Start
	ldr r1, [sp]
	str r1, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r3, [sp, #4]
	str r3, [r0, #0x44]
	str r4, [r0, #0x48]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080565F4: .4byte sub_080563F0
_080565F8: .4byte 0x08C108A0

	thumb_func_start sub_080565FC
sub_080565FC: @ 0x080565FC
	push {lr}
	adds r3, r2, #0
	movs r2, #0
	bl sub_080564B8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805660C
sub_0805660C: @ 0x0805660C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08056618
sub_08056618: @ 0x08056618
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08056644 @ =gBmSt
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _08056648 @ =0x0201FB24
	ldr r2, _0805664C @ =0x0201FDB0
	cmp r0, #0
	beq _08056690
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _08056660
	ldr r1, _08056650 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _08056658
	movs r0, #0
	str r0, [r1]
	ldr r0, _08056654 @ =0x0201FB2C
	b _0805665E
	.align 2, 0
_08056644: .4byte gBmSt
_08056648: .4byte 0x0201FB24
_0805664C: .4byte 0x0201FDB0
_08056650: .4byte 0x0201FB20
_08056654: .4byte 0x0201FB2C
_08056658:
	movs r0, #1
	str r0, [r1]
	ldr r0, _08056674 @ =0x0201FC6C
_0805665E:
	str r0, [r3]
_08056660:
	ldr r1, _08056678 @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08056684
	movs r0, #0
	str r0, [r1]
	ldr r1, _0805667C @ =0x0201FDB0
	ldr r0, _08056680 @ =0x0201FDB8
	b _0805668C
	.align 2, 0
_08056674: .4byte 0x0201FC6C
_08056678: .4byte 0x0201FDAC
_0805667C: .4byte 0x0201FDB0
_08056680: .4byte 0x0201FDB8
_08056684:
	movs r0, #1
	str r0, [r1]
	ldr r1, _080566C4 @ =0x0201FDB0
	ldr r0, _080566C8 @ =0x0201FEF8
_0805668C:
	str r0, [r1]
	adds r2, r1, #0
_08056690:
	ldr r1, _080566CC @ =0x0201FB28
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _080566D0 @ =0x0201FDB4
	ldr r0, [r2]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _080566E4
	ldr r0, _080566D4 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	bl CheckInEkrDragon
	cmp r0, #0
	bne _080566D8
	movs r0, #0
	bl SetOnHBlankA
	b _080566DE
	.align 2, 0
_080566C4: .4byte 0x0201FDB0
_080566C8: .4byte 0x0201FEF8
_080566CC: .4byte 0x0201FB28
_080566D0: .4byte 0x0201FDB4
_080566D4: .4byte 0x0201774C
_080566D8:
	ldr r0, _080566EC @ =sub_08056490
	bl SetOnHBlankA
_080566DE:
	adds r0, r4, #0
	bl Proc_Break
_080566E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080566EC: .4byte sub_08056490

	thumb_func_start sub_080566F0
sub_080566F0: @ 0x080566F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, _08056730 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056734 @ =0x08C108C0
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	adds r4, r4, r6
	strh r4, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x44]
	str r7, [r0, #0x48]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056730: .4byte 0x0201774C
_08056734: .4byte 0x08C108C0

	thumb_func_start sub_08056738
sub_08056738: @ 0x08056738
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0805682C
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r6, #0x2c
	ldrsh r3, [r5, r6]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	subs r3, r3, r4
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r4
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	beq _080567AC
	cmp r0, #1
	bgt _0805677E
	cmp r0, #0
	beq _08056784
	b _08056812
_0805677E:
	cmp r0, #2
	beq _080567D4
	b _08056812
_08056784:
	ldr r3, _080567A8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	b _0805680E
	.align 2, 0
_080567A8: .4byte gDispIo
_080567AC:
	ldr r3, _080567D0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r6, [r0]
	b _08056812
	.align 2, 0
_080567D0: .4byte gDispIo
_080567D4:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	subs r3, r3, r1
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x10
	bl Interpolate
	ldr r4, _08056834 @ =gDispIo
	adds r3, r4, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x44
	strb r6, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
_0805680E:
	adds r0, #0x46
	strb r7, [r0]
_08056812:
	movs r6, #0x2c
	ldrsh r1, [r5, r6]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r1, r0
	blt _0805682C
	ldr r1, _08056838 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805682C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056834: .4byte gDispIo
_08056838: .4byte 0x0201774C

	thumb_func_start sub_0805683C
sub_0805683C: @ 0x0805683C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r1, _08056894 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056898 @ =0x08C108D8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r0, sb
	str r0, [r4, #0x44]
	mov r0, sl
	str r0, [r4, #0x54]
	mov r0, r8
	bl GetAnimAnotherSide
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3a]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056894: .4byte 0x0201774C
_08056898: .4byte 0x08C108D8

	thumb_func_start sub_0805689C
sub_0805689C: @ 0x0805689C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _0805691C @ =0x0201FB20
	ldr r0, [r0]
	ldr r1, _08056920 @ =0x0201FB2C
	mov r8, r1
	cmp r0, #0
	bne _080568B6
	ldr r2, _08056924 @ =0x0201FC6C
	mov r8, r2
_080568B6:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl sub_08013970
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, _08056928 @ =0x0000FFFF
	ldrh r0, [r0, #2]
	cmp r0, r1
	beq _080568E0
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080568E0:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080568EE
	movs r2, #0
_080568EE:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _080568FC
	movs r1, #0xa0
_080568FC:
	movs r3, #0
	lsls r0, r2, #0x10
	ldr r2, [r5, #0x44]
	mov ip, r2
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
_0805690C:
	cmp sb, r3
	bhi _08056914
	cmp r4, r3
	bhs _0805692C
_08056914:
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	b _0805695C
	.align 2, 0
_0805691C: .4byte 0x0201FB20
_08056920: .4byte 0x0201FB2C
_08056924: .4byte 0x0201FC6C
_08056928: .4byte 0x0000FFFF
_0805692C:
	ldrh r2, [r5, #0x32]
	ldrh r1, [r6]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0805693C
	movs r1, #0
_0805693C:
	ldrh r7, [r6, #2]
	adds r0, r2, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0805694C
	movs r2, #0xf0
_0805694C:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r6, #4
_0805695C:
	movs r2, #2
	add r8, r2
	adds r3, #1
	cmp r3, #0x9f
	bls _0805690C
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r5, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r5, r4]
	cmp r0, ip
	bne _080569A2
	ldr r1, _080569B0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r2, _080569B4 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r7, [r1]
	ands r0, r7
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
_080569A2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080569B0: .4byte 0x0201774C
_080569B4: .4byte gDispIo

	thumb_func_start sub_080569B8
sub_080569B8: @ 0x080569B8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r1, _080569F4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080569F8 @ =0x08C108F0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_0804EF18
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080569F4: .4byte 0x0201774C
_080569F8: .4byte 0x08C108F0

	thumb_func_start sub_080569FC
sub_080569FC: @ 0x080569FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, _08056A8C @ =0x02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r4, _08056A90 @ =0x02000038
	ldrh r0, [r5]
	ldrh r2, [r4]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r4, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r2, [r4, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r5]
	ldrh r1, [r4]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r2, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08056A7A
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl SetBgOffset
_08056A7A:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08056A98
	ldr r3, _08056A94 @ =0x02000028
	ldrh r4, [r3]
	ldrh r1, [r5]
	subs r0, r4, r1
	b _08056AA0
	.align 2, 0
_08056A8C: .4byte 0x02017760
_08056A90: .4byte 0x02000038
_08056A94: .4byte 0x02000028
_08056A98:
	ldr r3, _08056BB0 @ =0x02000028
	ldrh r1, [r3]
	ldrh r2, [r5]
	adds r0, r1, r2
_08056AA0:
	ldr r2, _08056BB4 @ =gEkrBgPosition
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _08056BB8 @ =0x0200002C
	ldrh r4, [r1]
	ldrh r5, [r5, #2]
	subs r0, r4, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov sb, r3
	mov sl, r1
	ldr r2, _08056BBC @ =0x02017760
	mov r1, sb
	ldrh r1, [r1, #2]
	ldrh r3, [r2]
	adds r0, r1, r3
	ldr r4, _08056BB4 @ =gEkrBgPosition
	ldr r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sl
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #2]
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_08050FB4
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_08050FB4
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08056BA2
	ldr r1, _08056BC0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08056BC4 @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r3, [r4]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08056B60
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08056B60:
	ldr r4, _08056BB4 @ =gEkrBgPosition
	ldr r0, [r4]
	mov r2, sb
	ldrh r2, [r2]
	subs r1, r2, r0
	mov r3, sb
	ldrh r3, [r3, #2]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sl
	ldrh r4, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl sub_08050FB4
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_08050FB4
	mov r4, r8
	ldr r0, [r4, #0x60]
	bl Proc_End
	mov r0, r8
	bl Proc_Break
_08056BA2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056BB0: .4byte 0x02000028
_08056BB4: .4byte gEkrBgPosition
_08056BB8: .4byte 0x0200002C
_08056BBC: .4byte 0x02017760
_08056BC0: .4byte 0x0201774C
_08056BC4: .4byte 0x02000038

	thumb_func_start sub_08056BC8
sub_08056BC8: @ 0x08056BC8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08056BE8 @ =0x08C10908
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056BE8: .4byte 0x08C10908

	thumb_func_start sub_08056BEC
sub_08056BEC: @ 0x08056BEC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08056C12
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _08056C3A
_08056C12:
	cmp r0, #0xa
	bne _08056C3A
	adds r0, r4, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08056C30
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
_08056C30:
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08056C3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08056C40
sub_08056C40: @ 0x08056C40
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08056C74 @ =0x08C10920
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056C74: .4byte 0x08C10920

	thumb_func_start sub_08056C78
sub_08056C78: @ 0x08056C78
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08056CF6
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	ldr r0, [r5, #0x5c]
	bl sub_08056D14
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _08056CF6
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08056CE8
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _08056CDC
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _08056CE8
_08056CDC:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056D0C
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_08056CE8:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056D0C
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08056D0C
_08056CF6:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x46
	beq _08056D0C
	cmp r0, #0x50
	bne _08056D0C
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08056D0C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08056D14
sub_08056D14: @ 0x08056D14
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08056D58 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056D5C @ =0x08C10938
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, _08056D60 @ =0x08C14534
	ldr r2, _08056D64 @ =0x08C1419C
	ldr r3, _08056D68 @ =0x08C14590
	ldr r0, _08056D6C @ =0x08C141F8
	str r0, [sp]
	adds r0, r4, #0
	bl sub_08050BF8
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056D70
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _08056D74
	.align 2, 0
_08056D58: .4byte 0x0201774C
_08056D5C: .4byte 0x08C10938
_08056D60: .4byte 0x08C14534
_08056D64: .4byte 0x08C1419C
_08056D68: .4byte 0x08C14590
_08056D6C: .4byte 0x08C141F8
_08056D70:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_08056D74:
	strh r0, [r5, #2]
	ldr r0, _08056D84 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08056D88
	movs r0, #0x23
	b _08056D8A
	.align 2, 0
_08056D84: .4byte gEkrDistanceType
_08056D88:
	movs r0, #0xa
_08056D8A:
	strh r0, [r6, #0x2e]
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_08056EFC
	str r0, [r6, #0x64]
	ldr r0, _08056DB0 @ =0x081EF9F8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08056DB4 @ =0x081EF5F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056DB0: .4byte 0x081EF9F8
_08056DB4: .4byte 0x081EF5F8

	thumb_func_start sub_08056DB8
sub_08056DB8: @ 0x08056DB8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08056E0A
	ldr r1, _08056DF8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, _08056DFC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08056E04
	ldr r0, _08056E00 @ =Unk_02017758
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	b _08056E0A
	.align 2, 0
_08056DF8: .4byte 0x0201774C
_08056DFC: .4byte gEkrDistanceType
_08056E00: .4byte Unk_02017758
_08056E04:
	adds r0, r4, #0
	bl Proc_Break
_08056E0A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08056E10
sub_08056E10: @ 0x08056E10
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08056E34 @ =0x02017754
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl sub_08056E38
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056E34: .4byte 0x02017754

	thumb_func_start sub_08056E38
sub_08056E38: @ 0x08056E38
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08056E78 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056E7C @ =0x08C10958
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r3, _08056E80 @ =0x08C145B0
	ldr r2, _08056E84 @ =0x08C14218
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_08050BF8
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056E88
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _08056E8C
	.align 2, 0
_08056E78: .4byte 0x0201774C
_08056E7C: .4byte 0x08C10958
_08056E80: .4byte 0x08C145B0
_08056E84: .4byte 0x08C14218
_08056E88:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_08056E8C:
	strh r0, [r5, #2]
	ldr r0, _08056EB4 @ =0x081EF9F8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08056EB8 @ =0x081EF5F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_08056EFC
	str r0, [r6, #0x64]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056EB4: .4byte 0x081EF9F8
_08056EB8: .4byte 0x081EF5F8

	thumb_func_start sub_08056EBC
sub_08056EBC: @ 0x08056EBC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08056EEE
	ldr r1, _08056EF4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _08056EF8 @ =Unk_02017758
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08056EEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056EF4: .4byte 0x0201774C
_08056EF8: .4byte Unk_02017758

	thumb_func_start sub_08056EFC
sub_08056EFC: @ 0x08056EFC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _08056F38 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056F3C @ =0x08C10970
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	str r5, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xcd
	movs r3, #1
	bl PlaySFX
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08056F38: .4byte 0x0201774C
_08056F3C: .4byte 0x08C10970

	thumb_func_start sub_08056F40
sub_08056F40: @ 0x08056F40
	ldr r1, _08056F4C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08056F4C: .4byte 0x0201774C

	thumb_func_start sub_08056F50
sub_08056F50: @ 0x08056F50
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08056F92
	ldr r0, [r4, #0x60]
	bl GetProperAnimSoundLocation
	adds r2, r0, #0
	ldr r0, [r4, #0x60]
	ldrh r0, [r0, #2]
	adds r2, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xcd
	movs r3, #1
	bl PlaySFX
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt _08056F92
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
_08056F92:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08056F98
sub_08056F98: @ 0x08056F98
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08056FCC @ =0x08C10990
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056FCC: .4byte 0x08C10990

	thumb_func_start sub_08056FD0
sub_08056FD0: @ 0x08056FD0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057066
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	ldr r0, [r5, #0x5c]
	bl sub_08057088
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xcc
	movs r3, #1
	bl PlaySFX
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _08057066
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08057058
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805704C
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _08057058
_0805704C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057082
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_08057058:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057082
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08057082
_08057066:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r4, #0
	adds r0, #9
	cmp r1, r0
	beq _08057082
	adds r0, #1
	cmp r1, r0
	bne _08057082
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08057082:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08057088
sub_08057088: @ 0x08057088
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080570D0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080570D4 @ =0x08C109A8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _080570D8 @ =0x08C146DC
	ldr r2, _080570DC @ =0x08C14650
	ldr r3, _080570E0 @ =0x08C146EC
	ldr r0, _080570E4 @ =0x08C14660
	str r0, [sp]
	adds r0, r5, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _080570E8 @ =0x081EF9F8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080570EC @ =0x081EFA18
	movs r1, #0x60
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080570D0: .4byte 0x0201774C
_080570D4: .4byte 0x08C109A8
_080570D8: .4byte 0x08C146DC
_080570DC: .4byte 0x08C14650
_080570E0: .4byte 0x08C146EC
_080570E4: .4byte 0x08C14660
_080570E8: .4byte 0x081EF9F8
_080570EC: .4byte 0x081EFA18

	thumb_func_start sub_080570F0
sub_080570F0: @ 0x080570F0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08057116
	ldr r0, _0805711C @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08057116:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805711C: .4byte 0x0201774C

	thumb_func_start sub_08057120
sub_08057120: @ 0x08057120
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057170 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl sub_080575BC
	ldr r0, _08057174 @ =0x081EFC84
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057178 @ =0x081EFA54
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057170: .4byte 0x08C109C0
_08057174: .4byte 0x081EFC84
_08057178: .4byte 0x081EFA54

	thumb_func_start sub_0805717C
sub_0805717C: @ 0x0805717C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _080571CC @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _080571D0 @ =0x081EFEC0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080571D4 @ =0x081EFCA4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080571CC: .4byte 0x08C109C0
_080571D0: .4byte 0x081EFEC0
_080571D4: .4byte 0x081EFCA4

	thumb_func_start sub_080571D8
sub_080571D8: @ 0x080571D8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057228 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl sub_080575BC
	ldr r0, _0805722C @ =0x081F00F8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057230 @ =0x081EFEE0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057228: .4byte 0x08C109C0
_0805722C: .4byte 0x081F00F8
_08057230: .4byte 0x081EFEE0

	thumb_func_start sub_08057234
sub_08057234: @ 0x08057234
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057284 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _08057288 @ =0x081F0334
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805728C @ =0x081F0118
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057284: .4byte 0x08C109C0
_08057288: .4byte 0x081F0334
_0805728C: .4byte 0x081F0118

	thumb_func_start sub_08057290
sub_08057290: @ 0x08057290
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _080572E0 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _080572E4 @ =0x081F0580
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080572E8 @ =0x081F0354
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080572E0: .4byte 0x08C109C0
_080572E4: .4byte 0x081F0580
_080572E8: .4byte 0x081F0354

	thumb_func_start sub_080572EC
sub_080572EC: @ 0x080572EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805733C @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _08057340 @ =0x081F07E8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057344 @ =0x081F05A0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805733C: .4byte 0x08C109C0
_08057340: .4byte 0x081F07E8
_08057344: .4byte 0x081F05A0

	thumb_func_start sub_08057348
sub_08057348: @ 0x08057348
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057398 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _0805739C @ =0x081F0A40
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080573A0 @ =0x081F0808
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057398: .4byte 0x08C109C0
_0805739C: .4byte 0x081F0A40
_080573A0: .4byte 0x081F0808

	thumb_func_start sub_080573A4
sub_080573A4: @ 0x080573A4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _080573F4 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _080573F8 @ =0x081F0CC4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080573FC @ =0x081F0A60
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080573F4: .4byte 0x08C109C0
_080573F8: .4byte 0x081F0CC4
_080573FC: .4byte 0x081F0A60

	thumb_func_start sub_08057400
sub_08057400: @ 0x08057400
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057450 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _08057454 @ =0x081F0F54
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057458 @ =0x081F0CE4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057450: .4byte 0x08C109C0
_08057454: .4byte 0x081F0F54
_08057458: .4byte 0x081F0CE4

	thumb_func_start sub_0805745C
sub_0805745C: @ 0x0805745C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _080574AC @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _080574B0 @ =0x081F11A4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080574B4 @ =0x081F0F74
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080574AC: .4byte 0x08C109C0
_080574B0: .4byte 0x081F11A4
_080574B4: .4byte 0x081F0F74

	thumb_func_start sub_080574B8
sub_080574B8: @ 0x080574B8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057508 @ =0x08C109C0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_080575BC
	ldr r0, _0805750C @ =0x081F13E0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057510 @ =0x081F11C4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057508: .4byte 0x08C109C0
_0805750C: .4byte 0x081F13E0
_08057510: .4byte 0x081F11C4

	thumb_func_start sub_08057514
sub_08057514: @ 0x08057514
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805759E
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xca
	movs r3, #1
	bl PlaySFX
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _0805759E
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08057590
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _08057584
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _08057590
_08057584:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080575B4
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_08057590:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080575B4
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _080575B4
_0805759E:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0xe
	beq _080575B4
	cmp r0, #0x10
	bne _080575B4
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_080575B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080575BC
sub_080575BC: @ 0x080575BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _080575E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080575EC @ =0x08C109D8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _080575F8
	ldr r2, _080575F0 @ =0x08C148D0
	ldr r3, _080575F4 @ =0x08C14B24
	b _080575FC
	.align 2, 0
_080575E8: .4byte 0x0201774C
_080575EC: .4byte 0x08C109D8
_080575F0: .4byte 0x08C148D0
_080575F4: .4byte 0x08C14B24
_080575F8:
	ldr r2, _0805761C @ =0x08C14D84
	ldr r3, _08057620 @ =0x08C14FE4
_080575FC:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_08050BF8
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057624
	ldrh r0, [r4, #2]
	adds r0, #0x38
	b _08057628
	.align 2, 0
_0805761C: .4byte 0x08C14D84
_08057620: .4byte 0x08C14FE4
_08057624:
	ldrh r0, [r4, #2]
	subs r0, #0x38
_08057628:
	strh r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08057634
sub_08057634: @ 0x08057634
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0805765A
	ldr r0, _08057660 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805765A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057660: .4byte 0x0201774C

	thumb_func_start sub_08057664
sub_08057664: @ 0x08057664
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057698 @ =0x08C109F0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057698: .4byte 0x08C109F0

	thumb_func_start sub_0805769C
sub_0805769C: @ 0x0805769C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bne _08057730
	adds r0, r4, #0
	movs r1, #0
	bl sub_080577AC
	adds r0, r4, #0
	movs r1, #0
	bl sub_08057888
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl sub_080565FC
	adds r0, r4, #0
	movs r1, #0x64
	bl sub_0805618C
	ldr r3, _08057764 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_080566F0
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl sub_080566F0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl PlaySFX
_08057730:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x8b
	bne _0805778C
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_08050BBC
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057770
	ldr r0, _08057768 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _0805776C @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	b _0805777C
	.align 2, 0
_08057764: .4byte gDispIo
_08057768: .4byte 0x02000054
_0805776C: .4byte 0x02022B40
_08057770:
	ldr r0, _08057784 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08057788 @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
_0805777C:
	adds r0, r4, #0
	bl sub_0804FFCC
	b _080577A2
	.align 2, 0
_08057784: .4byte 0x02000054
_08057788: .4byte 0x02022B80
_0805778C:
	cmp r0, #0xb3
	bne _080577A2
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_080577A2:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080577AC
sub_080577AC: @ 0x080577AC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080577F4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080577F8 @ =0x08C10A08
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _080577FC @ =0x081EDC70
	str r1, [r0, #0x48]
	ldr r1, _08057800 @ =0x08C10A20
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08057804 @ =0x08C10A8C
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	lsls r4, r4, #5
	ldr r0, _08057808 @ =0x082E2700
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080577F4: .4byte 0x0201774C
_080577F8: .4byte 0x08C10A08
_080577FC: .4byte 0x081EDC70
_08057800: .4byte 0x08C10A20
_08057804: .4byte 0x08C10A8C
_08057808: .4byte 0x082E2700

	thumb_func_start sub_0805780C
sub_0805780C: @ 0x0805780C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805785C
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08057846
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08057846:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805787A
_0805785C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805787A
	bl SpellFx_ClearBG1
	ldr r1, _08057884 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805787A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057884: .4byte 0x0201774C

	thumb_func_start sub_08057888
sub_08057888: @ 0x08057888
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _080578DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080578E0 @ =0x08C10AF8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x38
	strh r0, [r4, #0x2e]
	ldr r3, _080578E4 @ =0x08C48338
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	lsls r5, r5, #5
	ldr r0, _080578E8 @ =0x082E2700
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080578EC @ =0x082E3E64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080578DC: .4byte 0x0201774C
_080578E0: .4byte 0x08C10AF8
_080578E4: .4byte 0x08C48338
_080578E8: .4byte 0x082E2700
_080578EC: .4byte 0x082E3E64

	thumb_func_start sub_080578F0
sub_080578F0: @ 0x080578F0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08057918
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08057920 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057918:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057920: .4byte 0x0201774C

	thumb_func_start sub_08057924
sub_08057924: @ 0x08057924
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057958 @ =0x08C10B10
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057958: .4byte 0x08C10B10

	thumb_func_start sub_0805795C
sub_0805795C: @ 0x0805795C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne _080579F0
	adds r0, r4, #0
	movs r1, #0
	bl sub_080577AC
	adds r0, r4, #0
	movs r1, #0
	bl sub_08057888
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl sub_080565FC
	adds r0, r4, #0
	movs r1, #0x64
	bl sub_0805618C
	ldr r3, _08057A24 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_080566F0
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl sub_080566F0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl PlaySFX
_080579F0:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne _08057A4C
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_08050BBC
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057A30
	ldr r0, _08057A28 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _08057A2C @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	b _08057A3C
	.align 2, 0
_08057A24: .4byte gDispIo
_08057A28: .4byte 0x02000054
_08057A2C: .4byte 0x02022B40
_08057A30:
	ldr r0, _08057A44 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08057A48 @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
_08057A3C:
	adds r0, r4, #0
	bl sub_0804FFCC
	b _08057A62
	.align 2, 0
_08057A44: .4byte 0x02000054
_08057A48: .4byte 0x02022B80
_08057A4C:
	cmp r0, #0xa5
	bne _08057A62
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08057A62:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08057A6C
sub_08057A6C: @ 0x08057A6C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08057AB8 @ =0x08C10B28
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0x9b
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057AB8: .4byte 0x08C10B28

	thumb_func_start sub_08057ABC
sub_08057ABC: @ 0x08057ABC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08057AE2
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _08057B74
_08057AE2:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x22
	bne _08057B04
	ldr r0, _08057B00 @ =0x00000137
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08057B74
	.align 2, 0
_08057B00: .4byte 0x00000137
_08057B04:
	cmp r0, #0x2a
	bne _08057B10
	adds r0, r6, #0
	bl sub_08057B7C
	b _08057B74
_08057B10:
	cmp r0, #0x2d
	bne _08057B62
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl sub_080684B0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08057B54
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _08057B48
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _08057B54
_08057B48:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057B74
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_08057B54:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057B74
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08057B74
_08057B62:
	cmp r0, #0x3e
	beq _08057B74
	cmp r0, #0x40
	bne _08057B74
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08057B74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08057B7C
sub_08057B7C: @ 0x08057B7C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08057BD0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057BD4 @ =0x08C10B40
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08057BD8 @ =0x08C150E8
	ldr r2, _08057BDC @ =0x08C15184
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r0, [r6, #4]
	adds r0, #0x10
	strh r0, [r6, #4]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r6, #8]
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #1
	bne _08057BE0
	movs r1, #0xe4
	lsls r1, r1, #7
	b _08057BE4
	.align 2, 0
_08057BD0: .4byte 0x0201774C
_08057BD4: .4byte 0x08C10B40
_08057BD8: .4byte 0x08C150E8
_08057BDC: .4byte 0x08C15184
_08057BE0:
	movs r1, #0x93
	lsls r1, r1, #8
_08057BE4:
	adds r0, r1, #0
	ldrh r1, [r6, #8]
	orrs r0, r1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08057BF4
sub_08057BF4: @ 0x08057BF4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08057C1A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08057C20 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057C1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057C20: .4byte 0x0201774C

	thumb_func_start sub_08057C24
sub_08057C24: @ 0x08057C24
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08057C5C @ =0x08C10B58
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057C5C: .4byte 0x08C10B58

	thumb_func_start sub_08057C60
sub_08057C60: @ 0x08057C60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057C84
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl sub_0804F7B8
	b _08057CF6
_08057C84:
	cmp r0, #6
	bne _08057CBC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	adds r0, r5, #0
	movs r1, #9
	bl sub_08057CFC
	adds r0, r5, #0
	movs r1, #9
	bl sub_08057DF0
	adds r0, r5, #0
	bl sub_08057EFC
	movs r0, #0x86
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _08057CF6
_08057CBC:
	cmp r0, #0xa
	bne _08057CE0
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057CF6
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08057CF6
_08057CE0:
	cmp r0, #0x19
	beq _08057CF6
	cmp r0, #0x1e
	bne _08057CF6
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_08057CF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08057CFC
sub_08057CFC: @ 0x08057CFC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08057D5C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057D60 @ =0x08C10B70
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _08057D64 @ =0x081F3CC8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08057D68 @ =0x081F2E08
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08057D6C @ =0x081F3DC8
	ldr r5, _08057D70 @ =gEkrTsaBuffer
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08057D78
	ldr r1, _08057D74 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	b _08057D8C
	.align 2, 0
_08057D5C: .4byte 0x0201774C
_08057D60: .4byte 0x08C10B70
_08057D64: .4byte 0x081F3CC8
_08057D68: .4byte 0x081F2E08
_08057D6C: .4byte 0x081F3DC8
_08057D70: .4byte gEkrTsaBuffer
_08057D74: .4byte gBg1Tm
_08057D78:
	ldr r1, _08057DB4 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
_08057D8C:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, _08057DB8 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057DB4: .4byte gBg1Tm
_08057DB8: .4byte gDispIo

	thumb_func_start sub_08057DBC
sub_08057DBC: @ 0x08057DBC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08057DE6
	bl SpellFx_ClearBG1
	ldr r1, _08057DEC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08057DE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057DEC: .4byte 0x0201774C

	thumb_func_start sub_08057DF0
sub_08057DF0: @ 0x08057DF0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08057E20 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057E24 @ =0x08C10B88
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057E28
	movs r0, #0xd8
	b _08057E2C
	.align 2, 0
_08057E20: .4byte 0x0201774C
_08057E24: .4byte 0x08C10B88
_08057E28:
	movs r0, #0xd8
	rsbs r0, r0, #0
_08057E2C:
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08057E34
sub_08057E34: @ 0x08057E34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, [r6, #0x44]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, _08057E6C @ =gDispIo
	strh r0, [r4, #0x20]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08057E70
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	adds r7, r0, #0
	adds r7, #0x1e
	b _08057E76
	.align 2, 0
_08057E6C: .4byte gDispIo
_08057E70:
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	subs r7, r0, #1
_08057E76:
	movs r2, #0x1f
	mov r8, r2
	adds r0, r7, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, _08057EF4 @ =gBg1Tm
	adds r0, r0, r5
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #1
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #2
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08057EE8
	ldr r1, _08057EF8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearBG1
	adds r0, r6, #0
	bl Proc_Break
_08057EE8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057EF4: .4byte gBg1Tm
_08057EF8: .4byte 0x0201774C

	thumb_func_start sub_08057EFC
sub_08057EFC: @ 0x08057EFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057F28 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057F2C @ =0x08C10BA0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057F30 @ =0x081EDCDE
	str r1, [r0, #0x48]
	ldr r1, _08057F34 @ =0x081F3CC8
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057F28: .4byte 0x0201774C
_08057F2C: .4byte 0x08C10BA0
_08057F30: .4byte 0x081EDCDE
_08057F34: .4byte 0x081F3CC8

	thumb_func_start sub_08057F38
sub_08057F38: @ 0x08057F38
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08057F5E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08057F78
_08057F5E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08057F78
	bl SpellFx_ClearColorEffects
	ldr r1, _08057F80 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057F78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057F80: .4byte 0x0201774C

	thumb_func_start sub_08057F84
sub_08057F84: @ 0x08057F84
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08057FBC @ =0x08C10BC0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057FBC: .4byte 0x08C10BC0

	thumb_func_start sub_08057FC0
sub_08057FC0: @ 0x08057FC0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057FEE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_08057FEE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805803C
	ldr r0, _08058038 @ =0x0000010D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_0805807C
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08058072
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08058072
	.align 2, 0
_08058038: .4byte 0x0000010D
_0805803C:
	adds r0, r6, #0
	adds r0, #0x1c
	cmp r1, r0
	bne _08058056
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x10
	bl sub_080566F0
	b _08058072
_08058056:
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	beq _08058072
	adds r0, #5
	cmp r1, r0
	bne _08058072
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_08058072:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805807C
sub_0805807C: @ 0x0805807C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080580D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080580D8 @ =0x08C10BD8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r3, _080580DC @ =0x08C17264
	cmp r0, #0
	bne _080580AC
	ldr r3, _080580E0 @ =0x08C16604
_080580AC:
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _080580E4 @ =0x081F4E90
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080580E8 @ =0x081F4190
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080580D4: .4byte 0x0201774C
_080580D8: .4byte 0x08C10BD8
_080580DC: .4byte 0x08C17264
_080580E0: .4byte 0x08C16604
_080580E4: .4byte 0x081F4E90
_080580E8: .4byte 0x081F4190

	thumb_func_start sub_080580EC
sub_080580EC: @ 0x080580EC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08058114
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805811C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058114:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805811C: .4byte 0x0201774C

	thumb_func_start sub_08058120
sub_08058120: @ 0x08058120
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08058154 @ =0x08C10BF0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058154: .4byte 0x08C10BF0

	thumb_func_start sub_08058158
sub_08058158: @ 0x08058158
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08058180
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_08058180:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _080581CC
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_080569B8
	adds r0, r5, #0
	bl sub_08058208
	adds r0, r5, #0
	bl sub_08058318
	adds r0, r5, #0
	bl sub_080583A0
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl sub_080566F0
	ldr r0, _080581C8 @ =0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _080581FE
	.align 2, 0
_080581C8: .4byte 0x0000011D
_080581CC:
	cmp r0, #0xf
	bne _080581F0
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _080581FE
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _080581FE
_080581F0:
	cmp r0, #0x82
	bne _080581FE
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_080581FE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08058208
sub_08058208: @ 0x08058208
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08058264 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058268 @ =0x08C10C08
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r3, _0805826C @ =0x08C195F4
	cmp r0, #0
	bne _08058238
	ldr r3, _08058270 @ =0x08C189F4
_08058238:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, _08058274 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805827E
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08058278
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b _08058292
	.align 2, 0
_08058264: .4byte 0x0201774C
_08058268: .4byte 0x08C10C08
_0805826C: .4byte 0x08C195F4
_08058270: .4byte 0x08C189F4
_08058274: .4byte gEkrDistanceType
_08058278:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b _08058292
_0805827E:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805828E
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b _08058292
_0805828E:
	ldrh r0, [r4, #2]
	subs r0, #0x48
_08058292:
	strh r0, [r4, #2]
	ldr r0, _080582B0 @ =0x081F4E90
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080582B4 @ =0x081F4190
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080582B0: .4byte 0x081F4E90
_080582B4: .4byte 0x081F4190

	thumb_func_start sub_080582B8
sub_080582B8: @ 0x080582B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080582DC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080582EA
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080582E0
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, #0x48
	b _080582E8
	.align 2, 0
_080582DC: .4byte gEkrDistanceType
_080582E0:
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, #0x48
_080582E8:
	strh r1, [r0, #2]
_080582EA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805830E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08058314 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805830E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058314: .4byte 0x0201774C

	thumb_func_start sub_08058318
sub_08058318: @ 0x08058318
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0805835C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058360 @ =0x08C10C20
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x70
	strh r0, [r4, #0x2e]
	ldr r0, _08058364 @ =0x08280884
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r2, _08058368 @ =0x08281C9C
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_ClearBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805835C: .4byte 0x0201774C
_08058360: .4byte 0x08C10C20
_08058364: .4byte 0x08280884
_08058368: .4byte 0x08281C9C

	thumb_func_start sub_0805836C
sub_0805836C: @ 0x0805836C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08058396
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, _0805839C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058396:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805839C: .4byte 0x0201774C

	thumb_func_start sub_080583A0
sub_080583A0: @ 0x080583A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080583CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080583D0 @ =0x08C10C38
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080583D4 @ =0x081EDD00
	str r1, [r0, #0x48]
	ldr r1, _080583D8 @ =0x08281C7C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080583CC: .4byte 0x0201774C
_080583D0: .4byte 0x08C10C38
_080583D4: .4byte 0x081EDD00
_080583D8: .4byte 0x08281C7C

	thumb_func_start sub_080583DC
sub_080583DC: @ 0x080583DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805841C
	ldr r0, [r4, #0x4c]
	ldr r4, _08058418 @ =0x020165C8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08058432
	.align 2, 0
_08058418: .4byte 0x020165C8
_0805841C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08058432
	ldr r1, _08058438 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058432:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058438: .4byte 0x0201774C

	thumb_func_start sub_0805843C
sub_0805843C: @ 0x0805843C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08058474 @ =0x08C10C58
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058474: .4byte 0x08C10C58

	thumb_func_start sub_08058478
sub_08058478: @ 0x08058478
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080584B4
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_080569B8
	ldr r0, [r4, #0x5c]
	bl sub_080584F8
	movs r0, #0x8f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_080584B4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _080584DC
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _080584F2
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _080584F2
_080584DC:
	cmp r0, #0x32
	beq _080584F2
	cmp r0, #0x3c
	bne _080584F2
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_080584F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080584F8
sub_080584F8: @ 0x080584F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08058534 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058538 @ =0x08C10C70
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r2, _0805853C @ =0x08C1A224
	ldr r3, _08058540 @ =0x08C1AE54
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08058544
	ldrh r0, [r6, #2]
	adds r0, #0x20
	b _08058548
	.align 2, 0
_08058534: .4byte 0x0201774C
_08058538: .4byte 0x08C10C70
_0805853C: .4byte 0x08C1A224
_08058540: .4byte 0x08C1AE54
_08058544:
	ldrh r0, [r6, #2]
	subs r0, #0x20
_08058548:
	strh r0, [r6, #2]
	ldr r0, _08058564 @ =0x081F5F54
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08058568 @ =0x081F4190
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058564: .4byte 0x081F5F54
_08058568: .4byte 0x081F4190

	thumb_func_start sub_0805856C
sub_0805856C: @ 0x0805856C
	push {lr}
	ldr r2, _08058580 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08058580: .4byte 0x0201774C

	thumb_func_start sub_08058584
sub_08058584: @ 0x08058584
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _080585B8 @ =0x08C10C90
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080585B8: .4byte 0x08C10C90

	thumb_func_start sub_080585BC
sub_080585BC: @ 0x080585BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08058602
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_080569B8
	ldr r0, [r4, #0x5c]
	bl sub_08058648
	ldr r0, [r4, #0x5c]
	bl sub_080586F0
	ldr r0, [r4, #0x5c]
	bl sub_08058778
	ldr r0, _0805862C @ =0x0000011F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_08058602:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _08058630
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08058642
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08058642
	.align 2, 0
_0805862C: .4byte 0x0000011F
_08058630:
	cmp r0, #0x20
	beq _08058642
	cmp r0, #0x30
	bne _08058642
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_08058642:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08058648
sub_08058648: @ 0x08058648
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058684 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058688 @ =0x08C10CA8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805868C @ =0x081EDDDA
	str r1, [r0, #0x48]
	ldr r1, _08058690 @ =0x08C10CC0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08058694 @ =0x081F5F94
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058684: .4byte 0x0201774C
_08058688: .4byte 0x08C10CA8
_0805868C: .4byte 0x081EDDDA
_08058690: .4byte 0x08C10CC0
_08058694: .4byte 0x081F5F94

	thumb_func_start sub_08058698
sub_08058698: @ 0x08058698
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080586C6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080586E4
_080586C6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080586E4
	bl SpellFx_ClearBG1
	ldr r1, _080586EC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080586E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080586EC: .4byte 0x0201774C

	thumb_func_start sub_080586F0
sub_080586F0: @ 0x080586F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805871C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058720 @ =0x08C10CF0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08058724 @ =0x081EDE20
	str r1, [r0, #0x48]
	ldr r1, _08058728 @ =0x082131F8
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805871C: .4byte 0x0201774C
_08058720: .4byte 0x08C10CF0
_08058724: .4byte 0x081EDE20
_08058728: .4byte 0x082131F8

	thumb_func_start sub_0805872C
sub_0805872C: @ 0x0805872C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08058752
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805876C
_08058752:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805876C
	bl SpellFx_ClearColorEffects
	ldr r1, _08058774 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805876C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058774: .4byte 0x0201774C

	thumb_func_start sub_08058778
sub_08058778: @ 0x08058778
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080587BC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080587C0 @ =0x08C10D10
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x37
	strh r0, [r4, #0x2e]
	ldr r3, _080587C4 @ =0x08C1BA90
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080587C8
	ldrh r0, [r6, #2]
	adds r0, #0x24
	b _080587CC
	.align 2, 0
_080587BC: .4byte 0x0201774C
_080587C0: .4byte 0x08C10D10
_080587C4: .4byte 0x08C1BA90
_080587C8:
	ldrh r0, [r6, #2]
	subs r0, #0x24
_080587CC:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	adds r0, #0xc
	strh r0, [r6, #4]
	ldr r0, _080587F0 @ =0x081F5F74
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080587F4 @ =0x081F4190
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080587F0: .4byte 0x081F5F74
_080587F4: .4byte 0x081F4190

	thumb_func_start sub_080587F8
sub_080587F8: @ 0x080587F8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08058820
	ldr r0, _08058828 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08058820:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058828: .4byte 0x0201774C

	thumb_func_start sub_0805882C
sub_0805882C: @ 0x0805882C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08058864 @ =0x08C10D28
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058864: .4byte 0x08C10D28

	thumb_func_start sub_08058868
sub_08058868: @ 0x08058868
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08058892
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_08058892:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080588B0
	adds r0, r5, #0
	bl sub_08058908
	adds r0, r5, #0
	bl sub_08058A10
	adds r0, r5, #0
	bl sub_08058A98
	b _08058902
_080588B0:
	adds r0, r6, #4
	cmp r1, r0
	bne _080588E6
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf5
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne _08058902
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08058902
_080588E6:
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	beq _08058902
	adds r0, #0x10
	cmp r1, r0
	bne _08058902
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_08058902:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08058908
sub_08058908: @ 0x08058908
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058960 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058964 @ =0x08C10D40
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058968 @ =0x081EDEC2
	str r0, [r5, #0x48]
	ldr r0, _0805896C @ =0x08C10D58
	str r0, [r5, #0x4c]
	ldr r0, _08058970 @ =0x08C10D60
	str r0, [r5, #0x50]
	ldr r0, _08058974 @ =0x08201128
	movs r1, #0x86
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08058978 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08058986
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805897C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08058986
	.align 2, 0
_08058960: .4byte 0x0201774C
_08058964: .4byte 0x08C10D40
_08058968: .4byte 0x081EDEC2
_0805896C: .4byte 0x08C10D58
_08058970: .4byte 0x08C10D60
_08058974: .4byte 0x08201128
_08058978: .4byte gEkrDistanceType
_0805897C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08058986:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805898C
sub_0805898C: @ 0x0805898C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _080589E4
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	cmp r5, #0
	bne _080589C2
	ldr r6, _080589DC @ =0x0000011F
_080589C2:
	cmp r5, #1
	bne _080589CA
	movs r6, #0xa8
	lsls r6, r6, #1
_080589CA:
	ldr r0, _080589E0 @ =0x0202349C
	str r6, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	b _08058A02
	.align 2, 0
_080589DC: .4byte 0x0000011F
_080589E0: .4byte 0x0202349C
_080589E4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08058A02
	bl SpellFx_ClearBG1
	ldr r1, _08058A0C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08058A02:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058A0C: .4byte 0x0201774C

	thumb_func_start sub_08058A10
sub_08058A10: @ 0x08058A10
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058A3C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058A40 @ =0x08C10D68
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08058A44 @ =0x081EDECC
	str r1, [r0, #0x48]
	ldr r1, _08058A48 @ =0x082019E4
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058A3C: .4byte 0x0201774C
_08058A40: .4byte 0x08C10D68
_08058A44: .4byte 0x081EDECC
_08058A48: .4byte 0x082019E4

	thumb_func_start sub_08058A4C
sub_08058A4C: @ 0x08058A4C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08058A72
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08058A8C
_08058A72:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08058A8C
	bl SpellFx_ClearColorEffects
	ldr r1, _08058A94 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058A8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058A94: .4byte 0x0201774C

	thumb_func_start sub_08058A98
sub_08058A98: @ 0x08058A98
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08058AE0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058AE4 @ =0x08C10D88
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08058AE8 @ =0x08C2327C
	ldr r2, _08058AEC @ =0x08C22750
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _08058AF0 @ =0x082022A8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08058AF4 @ =0x08201E10
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058AE0: .4byte 0x0201774C
_08058AE4: .4byte 0x08C10D88
_08058AE8: .4byte 0x08C2327C
_08058AEC: .4byte 0x08C22750
_08058AF0: .4byte 0x082022A8
_08058AF4: .4byte 0x08201E10

	thumb_func_start sub_08058AF8
sub_08058AF8: @ 0x08058AF8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08058B1E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08058B24 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058B1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058B24: .4byte 0x0201774C

	thumb_func_start sub_08058B28
sub_08058B28: @ 0x08058B28
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08058B68 @ =0x08C10DA0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058B68: .4byte 0x08C10DA0

	thumb_func_start sub_08058B6C
sub_08058B6C: @ 0x08058B6C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08058BAC @ =0x08C10DA0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058BAC: .4byte 0x08C10DA0

	thumb_func_start sub_08058BB0
sub_08058BB0: @ 0x08058BB0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r0, _08058BDC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08058BE0
	movs r5, #0x20
	movs r7, #0x34
	movs r3, #0x36
	mov r8, r3
	movs r0, #0x55
	mov sb, r0
	b _08058BEC
	.align 2, 0
_08058BDC: .4byte gEkrDistanceType
_08058BE0:
	movs r5, #0x28
	movs r7, #0x3c
	movs r1, #0x41
	mov r8, r1
	movs r3, #0x60
	mov sb, r3
_08058BEC:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08058C18
	ldr r0, [r4, #0x5c]
	bl sub_08058CB8
	ldr r0, [r4, #0x5c]
	bl sub_08058D70
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf1
	movs r3, #1
	bl PlaySFX
_08058C18:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bne _08058C2C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _08058CAC
_08058C2C:
	cmp r0, r7
	bne _08058C96
	movs r0, #9
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r5]
	cmp r0, #0
	bne _08058CAC
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058C6C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xf7
	movs r3, #1
	bl PlaySFX
	adds r0, r6, #0
	bl sub_08058E44
	b _08058C8E
_08058C6C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #0xf8
	movs r3, #1
	bl PlaySFX
	adds r0, r6, #0
	bl sub_08058F2C
	adds r0, r6, #0
	bl sub_08058FF8
	adds r0, r6, #0
	bl sub_08059084
_08058C8E:
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08058CAC
_08058C96:
	cmp r0, r8
	beq _08058CAC
	cmp r0, sb
	bne _08058CAC
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_08058CAC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08058CB8
sub_08058CB8: @ 0x08058CB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058CFC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058D00 @ =0x08C10DB8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08058D04 @ =0x081EDF0E
	str r1, [r0, #0x48]
	ldr r1, _08058D08 @ =0x08C10DD0
	str r1, [r0, #0x4c]
	ldr r1, _08058D0C @ =0x08C10E00
	str r1, [r0, #0x50]
	ldr r0, _08058D10 @ =0x08202F40
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08058D14 @ =0x08202348
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058CFC: .4byte 0x0201774C
_08058D00: .4byte 0x08C10DB8
_08058D04: .4byte 0x081EDF0E
_08058D08: .4byte 0x08C10DD0
_08058D0C: .4byte 0x08C10E00
_08058D10: .4byte 0x08202F40
_08058D14: .4byte 0x08202348

	thumb_func_start sub_08058D18
sub_08058D18: @ 0x08058D18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08058D46
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08058D64
_08058D46:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08058D64
	bl SpellFx_ClearBG1
	ldr r1, _08058D6C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08058D64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058D6C: .4byte 0x0201774C

	thumb_func_start sub_08058D70
sub_08058D70: @ 0x08058D70
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08058DB4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058DB8 @ =0x08C10E30
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _08058DBC @ =0x08C23A1C
	ldr r2, _08058DC0 @ =0x08C23694
	ldr r3, _08058DC4 @ =0x08C23A48
	ldr r0, _08058DC8 @ =0x08C236C0
	str r0, [sp]
	adds r0, r6, #0
	bl sub_08050BF8
	adds r5, r0, #0
	str r5, [r4, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08058DCC
	ldrh r0, [r6, #2]
	subs r0, #8
	b _08058DD0
	.align 2, 0
_08058DB4: .4byte 0x0201774C
_08058DB8: .4byte 0x08C10E30
_08058DBC: .4byte 0x08C23A1C
_08058DC0: .4byte 0x08C23694
_08058DC4: .4byte 0x08C23A48
_08058DC8: .4byte 0x08C236C0
_08058DCC:
	ldrh r0, [r6, #2]
	adds r0, #8
_08058DD0:
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r5, #4]
	ldr r0, _08058DF4 @ =0x08204A74
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08058DF8 @ =0x08204478
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058DF4: .4byte 0x08204A74
_08058DF8: .4byte 0x08204478

	thumb_func_start sub_08058DFC
sub_08058DFC: @ 0x08058DFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x25
	bne _08058E22
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf2
	movs r3, #1
	bl PlaySFX
	b _08058E3A
_08058E22:
	cmp r0, #0x32
	ble _08058E3A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08058E40 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058E3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058E40: .4byte 0x0201774C

	thumb_func_start sub_08058E44
sub_08058E44: @ 0x08058E44
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058E9C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058EA0 @ =0x08C10E48
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058EA4 @ =0x081EDF40
	str r0, [r5, #0x48]
	ldr r0, _08058EA8 @ =0x08C10EB4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08058EAC @ =0x08C10E60
	str r0, [r5, #0x54]
	ldr r0, _08058EB0 @ =0x0820D68C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08058EB4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08058EC2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08058EB8
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08058EC2
	.align 2, 0
_08058E9C: .4byte 0x0201774C
_08058EA0: .4byte 0x08C10E48
_08058EA4: .4byte 0x081EDF40
_08058EA8: .4byte 0x08C10EB4
_08058EAC: .4byte 0x08C10E60
_08058EB0: .4byte 0x0820D68C
_08058EB4: .4byte gEkrDistanceType
_08058EB8:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08058EC2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08058EC8
sub_08058EC8: @ 0x08058EC8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08058F04
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _08058F22
_08058F04:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08058F22
	bl SpellFx_ClearBG1
	ldr r1, _08058F28 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
_08058F22:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058F28: .4byte 0x0201774C

	thumb_func_start sub_08058F2C
sub_08058F2C: @ 0x08058F2C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08058F88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058F8C @ =0x08C10F08
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, _08058F90 @ =0x0820F194
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r5, #0x5c]
	ldr r2, _08058F94 @ =0x08210350
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_ClearBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08058F98 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08058FB8
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08058F9C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08058FA6
	.align 2, 0
_08058F88: .4byte 0x0201774C
_08058F8C: .4byte 0x08C10F08
_08058F90: .4byte 0x0820F194
_08058F94: .4byte 0x08210350
_08058F98: .4byte gEkrDistanceType
_08058F9C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08058FA6:
	ldr r0, _08058FC0 @ =0x0202349C
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl sub_080671E0
_08058FB8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058FC0: .4byte 0x0202349C

	thumb_func_start sub_08058FC4
sub_08058FC4: @ 0x08058FC4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _08058FEC
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, _08058FF4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058FF4: .4byte 0x0201774C

	thumb_func_start sub_08058FF8
sub_08058FF8: @ 0x08058FF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805902C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059030 @ =0x08C10F20
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08059034 @ =0x081EDF96
	str r1, [r0, #0x48]
	ldr r1, _08059038 @ =0x08210150
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805902C: .4byte 0x0201774C
_08059030: .4byte 0x08C10F20
_08059034: .4byte 0x081EDF96
_08059038: .4byte 0x08210150

	thumb_func_start sub_0805903C
sub_0805903C: @ 0x0805903C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08059062
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08059078
_08059062:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08059078
	ldr r1, _08059080 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08059078:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059080: .4byte 0x0201774C

	thumb_func_start sub_08059084
sub_08059084: @ 0x08059084
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080590C4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080590C8 @ =0x08C10F40
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _080590CC @ =0x08C25638
	ldr r2, _080590D0 @ =0x08C24818
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080590D4
	ldrh r0, [r6, #2]
	subs r0, #8
	b _080590D8
	.align 2, 0
_080590C4: .4byte 0x0201774C
_080590C8: .4byte 0x08C10F40
_080590CC: .4byte 0x08C25638
_080590D0: .4byte 0x08C24818
_080590D4:
	ldrh r0, [r6, #2]
	adds r0, #8
_080590D8:
	strh r0, [r6, #2]
	ldr r0, [r6, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x1c]
	ldr r0, _08059100 @ =0x08210810
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08059104 @ =0x08210598
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059100: .4byte 0x08210810
_08059104: .4byte 0x08210598

	thumb_func_start sub_08059108
sub_08059108: @ 0x08059108
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0805912E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08059134 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805912E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059134: .4byte 0x0201774C

	thumb_func_start sub_08059138
sub_08059138: @ 0x08059138
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08059170 @ =0x08C10F58
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059170: .4byte 0x08C10F58

	thumb_func_start sub_08059174
sub_08059174: @ 0x08059174
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080591AA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_080591AA:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne _08059206
	adds r0, r5, #0
	bl sub_080592AC
	adds r0, r5, #0
	bl sub_08059510
	ldr r3, _0805921C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_080566F0
	movs r0, #0x91
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_08059206:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne _08059220
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_0804F7B8
	b _080592A0
	.align 2, 0
_0805921C: .4byte gDispIo
_08059220:
	adds r0, r6, #0
	adds r0, #0x55
	cmp r1, r0
	bne _0805925C
	adds r0, r5, #0
	bl sub_08059394
	adds r0, r5, #0
	bl sub_0805947C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x10
	bl sub_080566F0
	ldr r0, _08059258 @ =0x00000123
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _080592A0
	.align 2, 0
_08059258: .4byte 0x00000123
_0805925C:
	adds r0, r6, #0
	adds r0, #0x58
	cmp r1, r0
	bne _08059284
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _080592A0
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _080592A0
_08059284:
	adds r0, r6, #0
	adds r0, #0x88
	cmp r1, r0
	beq _080592A0
	adds r0, #0x19
	cmp r1, r0
	bne _080592A0
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_080592A0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080592AC
sub_080592AC: @ 0x080592AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059300 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059304 @ =0x08C10F70
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059308 @ =0x081EDFEC
	str r0, [r5, #0x48]
	ldr r0, _0805930C @ =0x08C10F88
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059310 @ =0x08C10FA0
	str r0, [r5, #0x54]
	ldr r0, _08059314 @ =0x0822181C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08059318 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059326
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805931C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08059326
	.align 2, 0
_08059300: .4byte 0x0201774C
_08059304: .4byte 0x08C10F70
_08059308: .4byte 0x081EDFEC
_0805930C: .4byte 0x08C10F88
_08059310: .4byte 0x08C10FA0
_08059314: .4byte 0x0822181C
_08059318: .4byte gEkrDistanceType
_0805931C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08059326:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059330
sub_08059330: @ 0x08059330
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805936C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0805938A
_0805936C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805938A
	bl SpellFx_ClearBG1
	ldr r1, _08059390 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805938A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059390: .4byte 0x0201774C

	thumb_func_start sub_08059394
sub_08059394: @ 0x08059394
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080593E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080593EC @ =0x08C10FB8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080593F0 @ =0x081EE05A
	str r0, [r5, #0x48]
	ldr r0, _080593F4 @ =0x08C10FD0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080593F8 @ =0x08C10FFC
	str r0, [r5, #0x54]
	ldr r0, _080593FC @ =0x08219AF4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08059400 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805940E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059404
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805940E
	.align 2, 0
_080593E8: .4byte 0x0201774C
_080593EC: .4byte 0x08C10FB8
_080593F0: .4byte 0x081EE05A
_080593F4: .4byte 0x08C10FD0
_080593F8: .4byte 0x08C10FFC
_080593FC: .4byte 0x08219AF4
_08059400: .4byte gEkrDistanceType
_08059404:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805940E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059418
sub_08059418: @ 0x08059418
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08059454
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _08059472
_08059454:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08059472
	bl SpellFx_ClearBG1
	ldr r1, _08059478 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08059472:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059478: .4byte 0x0201774C

	thumb_func_start sub_0805947C
sub_0805947C: @ 0x0805947C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080594CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080594D0 @ =0x08C11028
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _080594D4 @ =0x08C28508
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	adds r1, #0x18
	strh r1, [r0, #2]
	ldr r0, _080594D8 @ =0x082708B0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080594DC @ =0x082224D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080594CC: .4byte 0x0201774C
_080594D0: .4byte 0x08C11028
_080594D4: .4byte 0x08C28508
_080594D8: .4byte 0x082708B0
_080594DC: .4byte 0x082224D4

	thumb_func_start sub_080594E0
sub_080594E0: @ 0x080594E0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	ble _08059506
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805950C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08059506:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805950C: .4byte 0x0201774C

	thumb_func_start sub_08059510
sub_08059510: @ 0x08059510
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805954C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059550 @ =0x08C11040
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _08059554 @ =0x082708B0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08059558 @ =0x082224D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805954C: .4byte 0x0201774C
_08059550: .4byte 0x08C11040
_08059554: .4byte 0x082708B0
_08059558: .4byte 0x082224D4

	thumb_func_start sub_0805955C
sub_0805955C: @ 0x0805955C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_08059562:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl sub_08059588
	adds r4, #1
	cmp r4, #0x1f
	ble _08059562
	ldr r1, _08059584 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059584: .4byte 0x0201774C

	thumb_func_start sub_08059588
sub_08059588: @ 0x08059588
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r1, _08059618 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805961C @ =0x08C11058
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	strh r5, [r7, #0x2c]
	movs r0, #0x64
	strh r0, [r7, #0x2e]
	movs r0, #7
	mov r1, r8
	ands r0, r1
	mov r2, sp
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x29
	strb r0, [r1]
	ldr r0, _08059620 @ =0x08C28574
	movs r1, #0x78
	bl AnimCreate
	str r0, [r7, #0x60]
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r5, _08059624 @ =0x0000FFFF
	adds r0, r5, #0
	bl sub_08067AD4
	strh r0, [r7, #0x32]
	adds r0, r5, #0
	bl sub_08067AD4
	strh r0, [r7, #0x3a]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805962C
	adds r0, r5, #0
	bl sub_08067AD4
	ldr r2, _08059628 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _0805963E
	.align 2, 0
_08059618: .4byte 0x0201774C
_0805961C: .4byte 0x08C11058
_08059620: .4byte 0x08C28574
_08059624: .4byte 0x0000FFFF
_08059628: .4byte 0x000001FF
_0805962C:
	adds r0, r5, #0
	bl sub_08067AD4
	ldr r2, _08059688 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_0805963E:
	adds r0, r0, r1
	strh r0, [r7, #0x34]
	ldr r4, _0805968C @ =0x0000FF0F
	adds r0, r4, #0
	bl sub_08067AD4
	ldr r2, _08059690 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08059694 @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl sub_08067AD4
	strh r0, [r7, #0x36]
	adds r0, r4, #0
	bl sub_08067AD4
	strh r0, [r7, #0x3e]
	movs r0, #7
	mov r2, r8
	ands r0, r2
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059698
	adds r0, r4, #0
	bl sub_08067AD4
	ldr r2, _08059688 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _080596AA
	.align 2, 0
_08059688: .4byte 0x000001FF
_0805968C: .4byte 0x0000FF0F
_08059690: .4byte 0x000003FF
_08059694: .4byte 0xFFFFFF00
_08059698:
	adds r0, r4, #0
	bl sub_08067AD4
	ldr r2, _080596D0 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_080596AA:
	adds r0, r0, r1
	strh r0, [r7, #0x38]
	ldr r0, _080596D4 @ =0x0000FF0F
	bl sub_08067AD4
	ldr r2, _080596D8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _080596DC @ =0xFFFFFF00
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080596D0: .4byte 0x000001FF
_080596D4: .4byte 0x0000FF0F
_080596D8: .4byte 0x000003FF
_080596DC: .4byte 0xFFFFFF00

	thumb_func_start sub_080596E0
sub_080596E0: @ 0x080596E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x60]
	ldrh r2, [r4, #0x2c]
	adds r2, #1
	strh r2, [r4, #0x2c]
	lsls r1, r2, #0x10
	ldrh r5, [r4, #0x2e]
	lsls r0, r5, #0x10
	cmp r1, r0
	ble _08059710
	ldr r1, _0805970C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _08059790
	.align 2, 0
_0805970C: .4byte 0x0201774C
_08059710:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _08059754
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805972C
	ldr r0, _08059728 @ =0x08C285D4
	b _0805972E
	.align 2, 0
_08059728: .4byte 0x08C285D4
_0805972C:
	ldr r0, _08059750 @ =0x08C285DC
_0805972E:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x34]
	adds r0, r1, r2
	strh r0, [r4, #0x32]
	ldrh r5, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r1, r5, r2
	strh r1, [r4, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3a]
	b _0805978C
	.align 2, 0
_08059750: .4byte 0x08C285DC
_08059754:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059768
	ldr r0, _08059764 @ =0x08C285D4
	b _0805976A
	.align 2, 0
_08059764: .4byte 0x08C285D4
_08059768:
	ldr r0, _08059798 @ =0x08C285DC
_0805976A:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r5, [r4, #0x3e]
	ldrh r1, [r4, #0x38]
	adds r0, r5, r1
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r4, #0x3e]
	ldrh r2, [r4, #0x36]
	lsrs r0, r2, #8
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3e]
_0805978C:
	lsrs r0, r4, #8
	strh r0, [r3, #4]
_08059790:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059798: .4byte 0x08C285DC

	thumb_func_start sub_0805979C
sub_0805979C: @ 0x0805979C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _080597D4 @ =0x08C11070
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080597D4: .4byte 0x08C11070

	thumb_func_start sub_080597D8
sub_080597D8: @ 0x080597D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08059802
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_08059802:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08059828
	ldr r0, _08059870 @ =0x00000119
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_08059898
	adds r0, r5, #0
	bl sub_080599D4
_08059828:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x59
	cmp r1, r0
	bne _0805983E
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl sub_08059B08
_0805983E:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _08059874
	adds r0, r5, #0
	bl sub_08059948
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059890
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08059890
	.align 2, 0
_08059870: .4byte 0x00000119
_08059874:
	adds r0, r6, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _08059890
	adds r0, #5
	cmp r1, r0
	bne _08059890
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_08059890:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08059898
sub_08059898: @ 0x08059898
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080598D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080598D8 @ =0x08C11088
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080598DC @ =0x081EE088
	str r1, [r0, #0x48]
	ldr r1, _080598E0 @ =0x08C110CC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080598E4 @ =0x08C110A0
	str r1, [r0, #0x54]
	ldr r0, _080598E8 @ =0x082131F8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080598D4: .4byte 0x0201774C
_080598D8: .4byte 0x08C11088
_080598DC: .4byte 0x081EE088
_080598E0: .4byte 0x08C110CC
_080598E4: .4byte 0x08C110A0
_080598E8: .4byte 0x082131F8

	thumb_func_start sub_080598EC
sub_080598EC: @ 0x080598EC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08059928
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _0805993E
_08059928:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805993E
	ldr r1, _08059944 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
_0805993E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059944: .4byte 0x0201774C

	thumb_func_start sub_08059948
sub_08059948: @ 0x08059948
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08059964 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059968 @ =0x08C110F8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059964: .4byte 0x0201774C
_08059968: .4byte 0x08C110F8

	thumb_func_start sub_0805996C
sub_0805996C: @ 0x0805996C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldr r3, _080599A4 @ =0x08C265CC
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _080599A8 @ =0x082022A8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080599AC @ =0x08201E10
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080599A4: .4byte 0x08C265CC
_080599A8: .4byte 0x082022A8
_080599AC: .4byte 0x08201E10

	thumb_func_start sub_080599B0
sub_080599B0: @ 0x080599B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _080599D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080599D0: .4byte 0x0201774C

	thumb_func_start sub_080599D4
sub_080599D4: @ 0x080599D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080599F0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080599F4 @ =0x08C11120
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080599F0: .4byte 0x0201774C
_080599F4: .4byte 0x08C11120

	thumb_func_start sub_080599F8
sub_080599F8: @ 0x080599F8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	movs r1, #0x26
	bl sub_0804F7B8
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08059A2C
sub_08059A2C: @ 0x08059A2C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08059A88 @ =gPal
	ldr r4, _08059A8C @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059A80
	movs r0, #0
	strh r0, [r6, #0x2c]
	movs r0, #0xa
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl Proc_Break
_08059A80:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059A88: .4byte gPal
_08059A8C: .4byte 0x020165C8

	thumb_func_start sub_08059A90
sub_08059A90: @ 0x08059A90
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _08059B00 @ =gDispIo
	mov ip, r2
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059AF8
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, _08059B04 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08059AF8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059B00: .4byte gDispIo
_08059B04: .4byte 0x0201774C

	thumb_func_start sub_08059B08
sub_08059B08: @ 0x08059B08
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, _08059B3C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059B40 @ =gPal
	ldr r1, _08059B44 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, _08059B48 @ =0x08C11160
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059B3C: .4byte 0x0201774C
_08059B40: .4byte gPal
_08059B44: .4byte 0x020165C8
_08059B48: .4byte 0x08C11160

	thumb_func_start sub_08059B4C
sub_08059B4C: @ 0x08059B4C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r3, r0, #0
	ldr r4, _08059BA8 @ =0x020165C8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl EfxPalBlackInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059BA0
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08059BA0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059BA8: .4byte 0x020165C8

	thumb_func_start sub_08059BAC
sub_08059BAC: @ 0x08059BAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08059BE8 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059BE0
	ldr r1, _08059BEC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08059BE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059BE8: .4byte 0x020165C8
_08059BEC: .4byte 0x0201774C

	thumb_func_start nullsub_50
nullsub_50: @ 0x08059BF0
	bx lr
	.align 2, 0

	thumb_func_start sub_08059BF4
sub_08059BF4: @ 0x08059BF4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08059C2C @ =0x08C11180
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059C2C: .4byte 0x08C11180

	thumb_func_start sub_08059C30
sub_08059C30: @ 0x08059C30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08059C6C
	movs r0, #0x85
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_08059D20
	b _08059D1A
_08059C6C:
	cmp r0, #0x10
	bne _08059C78
	ldr r0, [r4, #0x5c]
	bl sub_08059EE4
	b _08059D1A
_08059C78:
	cmp r0, #0x4a
	bne _08059C88
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _08059D1A
_08059C88:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _08059C9E
	adds r0, r5, #0
	bl sub_08059F28
	str r0, [r4, #0x64]
	b _08059D1A
_08059C9E:
	adds r0, r2, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _08059CC4
	ldr r0, _08059CC0 @ =0x000002E1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	bl sub_08059DD0
	b _08059D1A
	.align 2, 0
_08059CC0: .4byte 0x000002E1
_08059CC4:
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _08059CD4
	ldr r0, [r4, #0x64]
	bl Proc_End
	b _08059D1A
_08059CD4:
	adds r0, r2, #0
	adds r0, #0x83
	cmp r1, r0
	bne _08059D04
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059D1A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08059D1A
_08059D04:
	adds r0, r2, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _08059D1A
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_08059D1A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059D20
sub_08059D20: @ 0x08059D20
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059D78 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059D7C @ =0x08C11198
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059D80 @ =0x081EE0CE
	str r0, [r5, #0x48]
	ldr r0, _08059D84 @ =0x08C111B0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059D88 @ =0x08C11254
	str r0, [r5, #0x54]
	ldr r0, _08059D8C @ =0x0822CD7C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08059D90 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059D9E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059D94
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08059D9E
	.align 2, 0
_08059D78: .4byte 0x0201774C
_08059D7C: .4byte 0x08C11198
_08059D80: .4byte 0x081EE0CE
_08059D84: .4byte 0x08C111B0
_08059D88: .4byte 0x08C11254
_08059D8C: .4byte 0x0822CD7C
_08059D90: .4byte gEkrDistanceType
_08059D94:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08059D9E:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059DB4
	ldr r0, _08059DB0 @ =gDispIo
	ldrh r1, [r0, #0x20]
	adds r1, #4
	b _08059DBA
	.align 2, 0
_08059DB0: .4byte gDispIo
_08059DB4:
	ldr r0, _08059DCC @ =gDispIo
	ldrh r1, [r0, #0x20]
	subs r1, #4
_08059DBA:
	strh r1, [r0, #0x20]
	adds r1, r0, #0
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059DCC: .4byte gDispIo

	thumb_func_start sub_08059DD0
sub_08059DD0: @ 0x08059DD0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059E50 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059E54 @ =0x08C11198
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059E58 @ =0x081EE100
	str r0, [r5, #0x48]
	ldr r0, _08059E5C @ =0x08C111B0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059E60 @ =0x08C11254
	str r0, [r5, #0x54]
	ldr r0, _08059E64 @ =0x0822CD9C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, _08059E68 @ =gDispIo
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
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08059E6C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059E7A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059E70
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08059E7A
	.align 2, 0
_08059E50: .4byte 0x0201774C
_08059E54: .4byte 0x08C11198
_08059E58: .4byte 0x081EE100
_08059E5C: .4byte 0x08C111B0
_08059E60: .4byte 0x08C11254
_08059E64: .4byte 0x0822CD9C
_08059E68: .4byte gDispIo
_08059E6C: .4byte gEkrDistanceType
_08059E70:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08059E7A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059E80
sub_08059E80: @ 0x08059E80
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08059EBC
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _08059EDA
_08059EBC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08059EDA
	bl SpellFx_ClearBG1
	ldr r1, _08059EE0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
_08059EDA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059EE0: .4byte 0x0201774C

	thumb_func_start sub_08059EE4
sub_08059EE4: @ 0x08059EE4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08059F1C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059F20 @ =0x08C112F8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _08059F24 @ =0x08C10828
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059F1C: .4byte 0x0201774C
_08059F20: .4byte 0x08C112F8
_08059F24: .4byte 0x08C10828

	thumb_func_start sub_08059F28
sub_08059F28: @ 0x08059F28
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08059F68 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059F6C @ =0x08C11340
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _08059F70 @ =0x08C10828
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08059F68: .4byte 0x0201774C
_08059F6C: .4byte 0x08C11340
_08059F70: .4byte 0x08C10828

	thumb_func_start sub_08059F74
sub_08059F74: @ 0x08059F74
	push {lr}
	ldr r2, _08059F88 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08059F88: .4byte 0x0201774C

	thumb_func_start sub_08059F8C
sub_08059F8C: @ 0x08059F8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08059FBC @ =0x08C28848
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08059FC0 @ =0x0822FED0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08059FC4 @ =0x0822F2D8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059FBC: .4byte 0x08C28848
_08059FC0: .4byte 0x0822FED0
_08059FC4: .4byte 0x0822F2D8

	thumb_func_start sub_08059FC8
sub_08059FC8: @ 0x08059FC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08059FF8 @ =0x08C289CC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08059FFC @ =0x0822FED0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805A000 @ =0x0822F6D8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059FF8: .4byte 0x08C289CC
_08059FFC: .4byte 0x0822FED0
_0805A000: .4byte 0x0822F6D8

	thumb_func_start sub_0805A004
sub_0805A004: @ 0x0805A004
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805A034 @ =0x08C28E80
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805A038 @ =0x0822FED0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805A03C @ =0x0822FB18
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A034: .4byte 0x08C28E80
_0805A038: .4byte 0x0822FED0
_0805A03C: .4byte 0x0822FB18

	thumb_func_start sub_0805A040
sub_0805A040: @ 0x0805A040
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805A068 @ =0x08C28DC4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	movs r0, #0x27
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A068: .4byte 0x08C28DC4

	thumb_func_start sub_0805A06C
sub_0805A06C: @ 0x0805A06C
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0805A08A
	ldr r0, _0805A08C @ =0x08C28DF8
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
_0805A08A:
	bx lr
	.align 2, 0
_0805A08C: .4byte 0x08C28DF8

	thumb_func_start sub_0805A090
sub_0805A090: @ 0x0805A090
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805A0C8 @ =0x08C11370
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A0C8: .4byte 0x08C11370

	thumb_func_start sub_0805A0CC
sub_0805A0CC: @ 0x0805A0CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805A102
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805A102:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _0805A160
	ldr r3, _0805A15C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl sub_080566F0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x23
	movs r2, #0x14
	movs r3, #0x10
	bl sub_080566F0
	adds r0, r6, #0
	bl sub_0805A29C
	movs r0, #0x92
	lsls r0, r0, #1
	b _0805A1AE
	.align 2, 0
_0805A15C: .4byte gDispIo
_0805A160:
	adds r0, r5, #0
	adds r0, #0xf
	cmp r1, r0
	bne _0805A198
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl sub_080560A4
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x1e
	bl sub_0805A594
	ldr r0, _0805A194 @ =gDispIo
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	movs r1, #0x2b
	movs r3, #0
	bl sub_080564B8
	b _0805A204
	.align 2, 0
_0805A194: .4byte gDispIo
_0805A198:
	adds r0, r5, #0
	adds r0, #0x3c
	cmp r1, r0
	bne _0805A1C4
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_0805A210
	ldr r0, _0805A1C0 @ =0x00000125
_0805A1AE:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl PlaySFX
	b _0805A204
	.align 2, 0
_0805A1C0: .4byte 0x00000125
_0805A1C4:
	adds r0, r5, #0
	adds r0, #0x41
	cmp r1, r0
	bne _0805A1EC
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimResireHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805A204
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _0805A204
_0805A1EC:
	adds r0, r5, #0
	adds r0, #0x6e
	cmp r1, r0
	beq _0805A204
	adds r0, #0x14
	cmp r1, r0
	bne _0805A204
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_0805A204:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A210
sub_0805A210: @ 0x0805A210
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805A270 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A274 @ =0x08C11388
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, _0805A278 @ =0x081EE176
	str r0, [r6, #0x48]
	ldr r0, _0805A27C @ =0x08C1149C
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, _0805A280 @ =0x08C113D0
	str r0, [r6, #0x54]
	ldr r0, _0805A284 @ =0x08238824
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805A288 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805A296
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805A28C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805A296
	.align 2, 0
_0805A270: .4byte 0x0201774C
_0805A274: .4byte 0x08C11388
_0805A278: .4byte 0x081EE176
_0805A27C: .4byte 0x08C1149C
_0805A280: .4byte 0x08C113D0
_0805A284: .4byte 0x08238824
_0805A288: .4byte gEkrDistanceType
_0805A28C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805A296:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A29C
sub_0805A29C: @ 0x0805A29C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805A30C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A310 @ =0x08C113B8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805A314 @ =0x081EE242
	str r0, [r5, #0x48]
	ldr r0, _0805A318 @ =0x08C1149C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805A31C @ =0x08C113D0
	str r0, [r5, #0x54]
	ldr r0, _0805A320 @ =0x08238824
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805A324 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _0805A328 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805A336
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805A32C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805A336
	.align 2, 0
_0805A30C: .4byte 0x0201774C
_0805A310: .4byte 0x08C113B8
_0805A314: .4byte 0x081EE242
_0805A318: .4byte 0x08C1149C
_0805A31C: .4byte 0x08C113D0
_0805A320: .4byte 0x08238824
_0805A324: .4byte gDispIo
_0805A328: .4byte gEkrDistanceType
_0805A32C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805A336:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A33C
sub_0805A33C: @ 0x0805A33C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805A378
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _0805A3BA
_0805A378:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805A3BA
	bl SpellFx_ClearBG1
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805A3AC
	ldr r1, _0805A3A8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl sub_080503A0
	adds r0, r7, #0
	bl Proc_End
	b _0805A3BA
	.align 2, 0
_0805A3A8: .4byte 0x0201774C
_0805A3AC:
	movs r0, #0
	strh r0, [r7, #0x2c]
	movs r0, #1
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl Proc_Break
_0805A3BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A3C0
sub_0805A3C0: @ 0x0805A3C0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0805A3E4 @ =0x02017750
	ldr r0, [r5]
	cmp r0, #2
	bne _0805A3EC
	ldr r1, _0805A3E8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_End
	b _0805A446
	.align 2, 0
_0805A3E4: .4byte 0x02017750
_0805A3E8: .4byte 0x0201774C
_0805A3EC:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble _0805A404
	strh r1, [r4, #0x2c]
_0805A404:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne _0805A446
	ldr r0, [r5]
	cmp r0, #1
	bne _0805A446
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, _0805A44C @ =0x081EE1E4
	str r0, [r4, #0x48]
	ldr r0, _0805A450 @ =0x08C1149C
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _0805A454 @ =0x08C113D0
	str r0, [r4, #0x54]
	ldr r0, _0805A458 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805A440
	bl GetSpellAnimationStartFrame
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805A440:
	adds r0, r4, #0
	bl Proc_Break
_0805A446:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A44C: .4byte 0x081EE1E4
_0805A450: .4byte 0x08C1149C
_0805A454: .4byte 0x08C113D0
_0805A458: .4byte gEkrDistanceType

	thumb_func_start sub_0805A45C
sub_0805A45C: @ 0x0805A45C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805A4C2
	ldr r0, _0805A498 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _0805A4A6
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805A49C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805A4A6
	.align 2, 0
_0805A498: .4byte gEkrDistanceType
_0805A49C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805A4A6:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r4, #0
	bl Proc_Break
_0805A4C2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A4C8
sub_0805A4C8: @ 0x0805A4C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805A504
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _0805A526
_0805A504:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805A526
	bl SpellFx_ClearBG1
	ldr r1, _0805A52C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl sub_080503A0
	adds r0, r7, #0
	bl Proc_Break
_0805A526:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A52C: .4byte 0x0201774C

	thumb_func_start sub_0805A530
sub_0805A530: @ 0x0805A530
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805A56C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _0805A58A
_0805A56C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805A58A
	bl SpellFx_ClearBG1
	ldr r1, _0805A590 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0805A58A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A590: .4byte 0x0201774C

	thumb_func_start sub_0805A594
sub_0805A594: @ 0x0805A594
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _0805A5BC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A5C0 @ =0x08C11568
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A5BC: .4byte 0x0201774C
_0805A5C0: .4byte 0x08C11568

	thumb_func_start sub_0805A5C4
sub_0805A5C4: @ 0x0805A5C4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805A600
	ldr r1, _0805A608 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805A600:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A608: .4byte 0x0201774C

	thumb_func_start sub_0805A60C
sub_0805A60C: @ 0x0805A60C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805A644 @ =0x08C11580
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A644: .4byte 0x08C11580

	thumb_func_start sub_0805A648
sub_0805A648: @ 0x0805A648
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805A672
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805A672:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805A696
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_0805A700
	b _0805A6F8
_0805A696:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _0805A6DC
	ldr r0, _0805A6D8 @ =0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805A6F8
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805A6F8
	.align 2, 0
_0805A6D8: .4byte 0x00000121
_0805A6DC:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq _0805A6F8
	adds r0, #1
	cmp r1, r0
	bne _0805A6F8
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805A6F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805A700
sub_0805A700: @ 0x0805A700
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805A754 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A758 @ =0x08C11598
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805A75C @ =0x081EE248
	str r0, [r5, #0x48]
	ldr r0, _0805A760 @ =0x08C116B8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805A764 @ =0x08C115B0
	str r0, [r5, #0x54]
	ldr r0, _0805A768 @ =0x08C11634
	str r0, [r5, #0x58]
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805A76C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805A77A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805A770
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805A77A
	.align 2, 0
_0805A754: .4byte 0x0201774C
_0805A758: .4byte 0x08C11598
_0805A75C: .4byte 0x081EE248
_0805A760: .4byte 0x08C116B8
_0805A764: .4byte 0x08C115B0
_0805A768: .4byte 0x08C11634
_0805A76C: .4byte gEkrDistanceType
_0805A770:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805A77A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A780
sub_0805A780: @ 0x0805A780
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805A808
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	ldr r0, _0805A7E8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805A826
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805A7F0
	ldr r0, _0805A7EC @ =gBg1Tm
	b _0805A7F4
	.align 2, 0
_0805A7E8: .4byte gEkrDistanceType
_0805A7EC: .4byte gBg1Tm
_0805A7F0:
	ldr r0, _0805A804 @ =0x0202349A
	movs r1, #0
_0805A7F4:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805A826
	.align 2, 0
_0805A804: .4byte 0x0202349A
_0805A808:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805A826
	bl SpellFx_ClearBG1
	ldr r1, _0805A834 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
_0805A826:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A834: .4byte 0x0201774C

	thumb_func_start sub_0805A838
sub_0805A838: @ 0x0805A838
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805A874 @ =0x08C1173C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r6, #0
	strh r6, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	ldr r0, _0805A878 @ =0x02020038
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A874: .4byte 0x08C1173C
_0805A878: .4byte 0x02020038

	thumb_func_start sub_0805A87C
sub_0805A87C: @ 0x0805A87C
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0805A898 @ =0x02020038
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A89C
	adds r1, #0xff
	movs r0, #0xfe
	bl PlaySFX
	b _0805A8A6
	.align 2, 0
_0805A898: .4byte 0x02020038
_0805A89C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl PlaySFX
_0805A8A6:
	ldr r1, _0805A8B4 @ =0x02020038
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805A8B4: .4byte 0x02020038

	thumb_func_start sub_0805A8B8
sub_0805A8B8: @ 0x0805A8B8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805A8E6
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805A8E6:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805A908
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804F7B8
	adds r0, r5, #0
	bl sub_0805A9E8
	adds r0, r5, #0
	bl sub_0805AAB4
	movs r0, #0x30
	b _0805A92E
_0805A908:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne _0805A91C
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804F7B8
	movs r0, #0xa0
	b _0805A92E
_0805A91C:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _0805A936
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804F7B8
	movs r0, #0x70
_0805A92E:
	movs r1, #0
	bl sub_0805A87C
	b _0805A9E0
_0805A936:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne _0805A96A
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804F7B8
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl sub_080566F0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl PlaySFX
	b _0805A9E0
_0805A96A:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805A9B0
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, _0805A9AC @ =0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805A9E0
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805A9E0
	.align 2, 0
_0805A9AC: .4byte 0x00000101
_0805A9B0:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne _0805A9CA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl sub_080566F0
	b _0805A9E0
_0805A9CA:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne _0805A9E0
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
_0805A9E0:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A9E8
sub_0805A9E8: @ 0x0805A9E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805AA20 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AA24 @ =0x08C11754
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805AA28 @ =0x081EE2CE
	str r1, [r0, #0x48]
	ldr r1, _0805AA2C @ =0x08C119DC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805AA30 @ =0x08C1176C
	str r1, [r0, #0x54]
	ldr r1, _0805AA34 @ =0x08C118A4
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA20: .4byte 0x0201774C
_0805AA24: .4byte 0x08C11754
_0805AA28: .4byte 0x081EE2CE
_0805AA2C: .4byte 0x08C119DC
_0805AA30: .4byte 0x08C1176C
_0805AA34: .4byte 0x08C118A4

	thumb_func_start sub_0805AA38
sub_0805AA38: @ 0x0805AA38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805AA86
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	b _0805AAA4
_0805AA86:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805AAA4
	bl SpellFx_ClearBG1
	ldr r1, _0805AAB0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
_0805AAA4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AAB0: .4byte 0x0201774C

	thumb_func_start sub_0805AAB4
sub_0805AAB4: @ 0x0805AAB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805AAE0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AAE4 @ =0x08C11B14
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #6
	str r1, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AAE0: .4byte 0x0201774C
_0805AAE4: .4byte 0x08C11B14

	thumb_func_start sub_0805AAE8
sub_0805AAE8: @ 0x0805AAE8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _0805AB44
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _0805AB4C @ =0x08C11B34
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl sub_0805AB54
	adds r0, r4, #0
	movs r1, #1
	bl sub_0805A87C
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble _0805AB44
	ldr r1, _0805AB50 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805AB44:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB4C: .4byte 0x08C11B34
_0805AB50: .4byte 0x0201774C

	thumb_func_start sub_0805AB54
sub_0805AB54: @ 0x0805AB54
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805ABAC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805ABB0 @ =0x08C11B6C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805ABB4 @ =0x08C2ACB0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _0805ABB8 @ =0x0826F94C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805ABBC @ =0x0826F688
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805ABAC: .4byte 0x0201774C
_0805ABB0: .4byte 0x08C11B6C
_0805ABB4: .4byte 0x08C2ACB0
_0805ABB8: .4byte 0x0826F94C
_0805ABBC: .4byte 0x0826F688

	thumb_func_start sub_0805ABC0
sub_0805ABC0: @ 0x0805ABC0
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0805ABD4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805ABD4: .4byte 0x0201774C

	thumb_func_start sub_0805ABD8
sub_0805ABD8: @ 0x0805ABD8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805AC10 @ =0x08C11B8C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AC10: .4byte 0x08C11B8C

	thumb_func_start sub_0805AC14
sub_0805AC14: @ 0x0805AC14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	mov r8, r0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805AC46
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805AC46:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #1
	cmp r1, r0
	bne _0805AC68
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_0805B32C
	ldr r0, _0805AC8C @ =0x000002CA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_0805AC68:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0x32
	movs r2, #0x29
	adds r2, r2, r6
	mov sb, r2
	cmp r1, r0
	bne _0805ACE6
	ldrb r0, [r2]
	cmp r0, #0
	bne _0805AC90
	adds r0, r5, #0
	movs r1, #0xcd
	movs r2, #0xa
	bl sub_080569B8
	b _0805AC9A
	.align 2, 0
_0805AC8C: .4byte 0x000002CA
_0805AC90:
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0xa
	bl sub_080569B8
_0805AC9A:
	adds r0, r5, #0
	movs r1, #0x28
	bl sub_0805B264
	ldr r3, _0805ADC4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_080566F0
	str r4, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #8
	movs r3, #0x10
	bl sub_080566F0
_0805ACE6:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0x64
	cmp r1, r0
	bne _0805AD02
	adds r0, r5, #0
	movs r1, #0x34
	bl sub_0805AE14
	adds r0, r5, #0
	movs r1, #0x34
	bl sub_0805AEE0
_0805AD02:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x78
	cmp r1, r0
	bne _0805AD18
	adds r0, r5, #0
	movs r1, #0x23
	movs r2, #0x19
	bl sub_0805B5D8
_0805AD18:
	mov r2, sb
	ldrb r7, [r2]
	cmp r7, #0
	bne _0805ADCC
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x9b
	cmp r1, r0
	bne _0805ADA8
	movs r0, #9
	movs r4, #0
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	ldrb r1, [r2]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_0805B04C
	ldr r3, _0805ADC4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	movs r0, #0xc
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0
	bl sub_080566F0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0x1e
	movs r3, #0xc
	bl sub_080566F0
	adds r0, r5, #0
	bl sub_0805AF74
	ldr r0, _0805ADC8 @ =0x000002CB
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_0805ADA8:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0xff
	cmp r1, r0
	bne _0805AE04
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
	b _0805AE04
	.align 2, 0
_0805ADC4: .4byte gDispIo
_0805ADC8: .4byte 0x000002CB
_0805ADCC:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x9b
	cmp r1, r0
	bne _0805ADEA
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	mov r2, sb
	ldrb r1, [r2]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
_0805ADEA:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0xa0
	cmp r1, r0
	bne _0805AE04
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
_0805AE04:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805AE14
sub_0805AE14: @ 0x0805AE14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805AE54 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AE58 @ =0x08C11BA4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805AE5C @ =0x081EE444
	str r1, [r0, #0x48]
	ldr r1, _0805AE60 @ =0x08C11BBC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805AE64 @ =0x08281F58
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE54: .4byte 0x0201774C
_0805AE58: .4byte 0x08C11BA4
_0805AE5C: .4byte 0x081EE444
_0805AE60: .4byte 0x08C11BBC
_0805AE64: .4byte 0x08281F58

	thumb_func_start sub_0805AE68
sub_0805AE68: @ 0x0805AE68
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805AEA6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0805AED4 @ =0x0202349C
	ldr r1, _0805AED8 @ =0x0000011F
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
_0805AEA6:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805AECC
	bl SpellFx_ClearBG1
	ldr r1, _0805AEDC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805AECC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AED4: .4byte 0x0202349C
_0805AED8: .4byte 0x0000011F
_0805AEDC: .4byte 0x0201774C

	thumb_func_start sub_0805AEE0
sub_0805AEE0: @ 0x0805AEE0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805AF18 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AF1C @ =0x08C11BEC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805AF20 @ =0x081EE476
	str r1, [r0, #0x48]
	ldr r1, _0805AF24 @ =0x082838A8
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AF18: .4byte 0x0201774C
_0805AF1C: .4byte 0x08C11BEC
_0805AF20: .4byte 0x081EE476
_0805AF24: .4byte 0x082838A8

	thumb_func_start sub_0805AF28
sub_0805AF28: @ 0x0805AF28
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805AF4C
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_0805AF4C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805AF6A
	ldr r1, _0805AF70 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805AF6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AF70: .4byte 0x0201774C

	thumb_func_start sub_0805AF74
sub_0805AF74: @ 0x0805AF74
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805AFB0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AFB4 @ =0x08C11C0C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805AFB8 @ =0x081EE488
	str r1, [r0, #0x48]
	ldr r1, _0805AFBC @ =0x08C11C24
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805AFC0 @ =0x08C11C38
	str r1, [r0, #0x54]
	ldr r0, _0805AFC4 @ =0x0828CE4C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AFB0: .4byte 0x0201774C
_0805AFB4: .4byte 0x08C11C0C
_0805AFB8: .4byte 0x081EE488
_0805AFBC: .4byte 0x08C11C24
_0805AFC0: .4byte 0x08C11C38
_0805AFC4: .4byte 0x0828CE4C

	thumb_func_start sub_0805AFC8
sub_0805AFC8: @ 0x0805AFC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805B020
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	ldr r0, _0805B018 @ =0x0202349C
	ldr r1, _0805B01C @ =0x0000011F
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	b _0805B03E
	.align 2, 0
_0805B018: .4byte 0x0202349C
_0805B01C: .4byte 0x0000011F
_0805B020:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805B03E
	bl SpellFx_ClearBG1
	ldr r1, _0805B048 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0805B03E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B048: .4byte 0x0201774C

	thumb_func_start sub_0805B04C
sub_0805B04C: @ 0x0805B04C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B08C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B090 @ =0x08C11C4C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r5, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _0805B094 @ =0x08293E50
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _0805B098 @ =0x082946D8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B08C: .4byte 0x0201774C
_0805B090: .4byte 0x08C11C4C
_0805B094: .4byte 0x08293E50
_0805B098: .4byte 0x082946D8

	thumb_func_start sub_0805B09C
sub_0805B09C: @ 0x0805B09C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805B0C4
	ldr r1, _0805B0C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _0805B108
	.align 2, 0
_0805B0C0: .4byte 0x0201774C
_0805B0C4:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _0805B108
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r0, #2
	str r0, [r4, #0x44]
	bl sub_08004BA0
	cmp r0, #4
	ble _0805B0F2
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805B110
_0805B0F2:
	bl sub_08004BA0
	cmp r0, #4
	ble _0805B108
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805B110
_0805B108:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805B110
sub_0805B110: @ 0x0805B110
	push {r4, r5, r6, r7, lr}
	sub sp, #0x90
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0805B17C @ =0x081EE53E
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	add r4, sp, #0x10
	ldr r1, _0805B180 @ =0x081EE54E
	adds r0, r4, #0
	movs r2, #0x80
	bl memcpy
	ldr r1, _0805B184 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B188 @ =0x08C11C64
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r5, [r7, #0x5c]
	movs r5, #0
	strh r5, [r7, #0x2c]
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r7, #0x2e]
	movs r0, #0xe0
	bl sub_08067AD4
	adds r0, #8
	strh r0, [r7, #0x32]
	strh r5, [r7, #0x3a]
	movs r1, #0
	movs r0, #0x3f
	ands r0, r6
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #5
	bhi _0805B1DC
	lsls r0, r0, #2
	ldr r1, _0805B18C @ =_0805B190
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B17C: .4byte 0x081EE53E
_0805B180: .4byte 0x081EE54E
_0805B184: .4byte 0x0201774C
_0805B188: .4byte 0x08C11C64
_0805B18C: .4byte _0805B190
_0805B190: @ jump table
	.4byte _0805B1A8 @ case 0
	.4byte _0805B1B0 @ case 1
	.4byte _0805B1B8 @ case 2
	.4byte _0805B1C0 @ case 3
	.4byte _0805B1C8 @ case 4
	.4byte _0805B1D0 @ case 5
_0805B1A8:
	ldr r0, _0805B1AC @ =0x08C417C4
	b _0805B1D2
	.align 2, 0
_0805B1AC: .4byte 0x08C417C4
_0805B1B0:
	ldr r0, _0805B1B4 @ =0x08C417BC
	b _0805B1D2
	.align 2, 0
_0805B1B4: .4byte 0x08C417BC
_0805B1B8:
	ldr r0, _0805B1BC @ =0x08C417B4
	b _0805B1D2
	.align 2, 0
_0805B1BC: .4byte 0x08C417B4
_0805B1C0:
	ldr r0, _0805B1C4 @ =0x08C417AC
	b _0805B1D2
	.align 2, 0
_0805B1C4: .4byte 0x08C417AC
_0805B1C8:
	ldr r0, _0805B1CC @ =0x08C417CC
	b _0805B1D2
	.align 2, 0
_0805B1CC: .4byte 0x08C417CC
_0805B1D0:
	ldr r0, _0805B1F0 @ =0x08C417A4
_0805B1D2:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r7, #0x60]
_0805B1DC:
	cmp r1, #0
	bne _0805B1F8
	ldr r1, _0805B1F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _0805B206
	.align 2, 0
_0805B1F0: .4byte 0x08C417A4
_0805B1F4: .4byte 0x0201774C
_0805B1F8:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r7, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r7, #0x3a]
	strh r0, [r1, #4]
_0805B206:
	add sp, #0x90
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805B210
sub_0805B210: @ 0x0805B210
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0805B240
	ldr r1, _0805B23C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _0805B25C
	.align 2, 0
_0805B23C: .4byte 0x0201774C
_0805B240:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #8
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_0805B25C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B264
sub_0805B264: @ 0x0805B264
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B2A8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B2AC @ =0x08C11C7C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805B2B0 @ =0x081EE5CE
	str r1, [r0, #0x48]
	ldr r1, _0805B2B4 @ =0x08C11C94
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805B2B8 @ =0x08C11CA0
	str r1, [r0, #0x54]
	ldr r0, _0805B2BC @ =0x0829311C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2A8: .4byte 0x0201774C
_0805B2AC: .4byte 0x08C11C7C
_0805B2B0: .4byte 0x081EE5CE
_0805B2B4: .4byte 0x08C11C94
_0805B2B8: .4byte 0x08C11CA0
_0805B2BC: .4byte 0x0829311C

	thumb_func_start sub_0805B2C0
sub_0805B2C0: @ 0x0805B2C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805B2FA
	ldr r1, [r6, #0x4c]
	ldr r2, [r6, #0x50]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
_0805B2FA:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805B320
	bl SpellFx_ClearBG1
	ldr r1, _0805B328 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r6, #0
	bl Proc_Break
_0805B320:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B328: .4byte 0x0201774C

	thumb_func_start sub_0805B32C
sub_0805B32C: @ 0x0805B32C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B370 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B374 @ =0x08C11CAC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r4, #0
	strh r4, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x44]
	str r4, [r0, #0x48]
	ldr r0, _0805B378 @ =0x082946F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _0805B37C @ =0x0829472C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805B380 @ =0x0202003C
	str r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B370: .4byte 0x0201774C
_0805B374: .4byte 0x08C11CAC
_0805B378: .4byte 0x082946F8
_0805B37C: .4byte 0x0829472C
_0805B380: .4byte 0x0202003C

	thumb_func_start sub_0805B384
sub_0805B384: @ 0x0805B384
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805B3B8
	ldr r1, _0805B3B0 @ =0x0202003C
	movs r0, #1
	str r0, [r1]
	ldr r1, _0805B3B4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _0805B3FC
	.align 2, 0
_0805B3B0: .4byte 0x0202003C
_0805B3B4: .4byte 0x0201774C
_0805B3B8:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _0805B3FC
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r0, #2
	str r0, [r4, #0x44]
	bl sub_08004BA0
	cmp r0, #4
	ble _0805B3E6
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805B404
_0805B3E6:
	bl sub_08004BA0
	cmp r0, #4
	ble _0805B3FC
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805B404
_0805B3FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805B404
sub_0805B404: @ 0x0805B404
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov r8, r0
	mov sl, r1
	ldr r1, _0805B4A0 @ =0x081EE5DC
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	add r5, sp, #0x10
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	bl memset
	movs r6, #0
	movs r0, #1
	strh r0, [r5, #4]
	strh r0, [r5, #0xa]
	add r0, sp, #0x20
	mov sb, r0
	ldr r1, _0805B4A4 @ =0x081EE5EC
	movs r2, #0x10
	bl memcpy
	add r4, sp, #0x30
	ldr r1, _0805B4A8 @ =0x081EE5FC
	adds r0, r4, #0
	movs r2, #0x10
	bl memcpy
	ldr r1, _0805B4AC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B4B0 @ =0x08C11CC4
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	mov r1, r8
	str r1, [r7, #0x5c]
	strh r6, [r7, #0x2c]
	movs r0, #7
	mov r2, sl
	ands r0, r2
	lsls r6, r0, #1
	mov r1, sp
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r7, #0x2e]
	movs r0, #0xff
	bl sub_08067AD4
	strh r0, [r7, #0x30]
	movs r0, #0x10
	bl sub_08067AD4
	adds r4, r4, r6
	ldrh r4, [r4]
	adds r0, r4, r0
	strh r0, [r7, #0x32]
	movs r0, #0x70
	strh r0, [r7, #0x3a]
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B4B4
	mov r2, sb
	adds r0, r2, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0805B4BE
	.align 2, 0
_0805B4A0: .4byte 0x081EE5DC
_0805B4A4: .4byte 0x081EE5EC
_0805B4A8: .4byte 0x081EE5FC
_0805B4AC: .4byte 0x0201774C
_0805B4B0: .4byte 0x08C11CC4
_0805B4B4:
	mov r2, sb
	adds r0, r2, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
_0805B4BE:
	str r0, [r7, #0x44]
	movs r1, #0
	movs r0, #7
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r5, r0
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0805B4DA
	cmp r0, #1
	beq _0805B4E4
	b _0805B4F0
_0805B4DA:
	ldr r0, _0805B4E0 @ =0x08C41828
	b _0805B4E6
	.align 2, 0
_0805B4E0: .4byte 0x08C41828
_0805B4E4:
	ldr r0, _0805B504 @ =0x08C4181C
_0805B4E6:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r7, #0x60]
_0805B4F0:
	cmp r1, #0
	bne _0805B50C
	ldr r1, _0805B508 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _0805B51A
	.align 2, 0
_0805B504: .4byte 0x08C4181C
_0805B508: .4byte 0x0201774C
_0805B50C:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r7, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r7, #0x3a]
	strh r0, [r1, #4]
_0805B51A:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805B52C
sub_0805B52C: @ 0x0805B52C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r0, _0805B560 @ =0x0202003C
	ldr r0, [r0]
	cmp r0, #1
	beq _0805B548
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0805B568
_0805B548:
	ldr r1, _0805B564 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
	b _0805B5CC
	.align 2, 0
_0805B560: .4byte 0x0202003C
_0805B564: .4byte 0x0201774C
_0805B568:
	movs r4, #0x2c
	ldrsh r3, [r5, r4]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x70
	bl Interpolate
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	ldr r4, _0805B5D4 @ =gSinLut
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x1a
	ldrh r1, [r5, #0x30]
	adds r1, #6
	movs r2, #0xff
	ands r1, r2
	strh r1, [r5, #0x30]
	ldr r2, [r5, #0x44]
	movs r1, #0xff
	ands r2, r1
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r7, #0
	ldrsh r1, [r1, r7]
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r2, [r2, r4]
	muls r1, r0, r1
	muls r0, r2, r0
	asrs r1, r1, #0xc
	asrs r0, r0, #0xc
	ldrh r7, [r5, #0x32]
	adds r3, r7, r3
	subs r3, r3, r1
	strh r3, [r6, #2]
	ldrh r5, [r5, #0x3a]
	subs r0, r5, r0
	strh r0, [r6, #4]
_0805B5CC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B5D4: .4byte gSinLut

	thumb_func_start sub_0805B5D8
sub_0805B5D8: @ 0x0805B5D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _0805B608 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B60C @ =0x08C11CDC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0804F7B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B608: .4byte 0x0201774C
_0805B60C: .4byte 0x08C11CDC

	thumb_func_start sub_0805B610
sub_0805B610: @ 0x0805B610
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0805B66C @ =gPal
	ldr r4, _0805B670 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805B664
	ldr r1, _0805B674 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0805B664:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B66C: .4byte gPal
_0805B670: .4byte 0x020165C8
_0805B674: .4byte 0x0201774C

	thumb_func_start sub_0805B678
sub_0805B678: @ 0x0805B678
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805B6B0 @ =0x08C11CF4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B6B0: .4byte 0x08C11CF4

	thumb_func_start sub_0805B6B4
sub_0805B6B4: @ 0x0805B6B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne _0805B6F8
	ldr r0, _0805B6F4 @ =0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_0805B7A4
	ldr r0, [r4, #0x5c]
	bl sub_0805B9D4
	b _0805B79E
	.align 2, 0
_0805B6F4: .4byte 0x00000127
_0805B6F8:
	cmp r2, #0x14
	bne _0805B70C
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805B738
_0805B70C:
	cmp r2, #0x32
	bne _0805B71C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _0805B79E
_0805B71C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805B744
	adds r0, r5, #0
	bl sub_0805B828
	ldr r0, _0805B740 @ =0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805B738:
	movs r3, #1
	bl PlaySFX
	b _0805B79E
	.align 2, 0
_0805B740: .4byte 0x00000129
_0805B744:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne _0805B756
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_0804F7B8
	b _0805B79E
_0805B756:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _0805B784
	adds r0, r5, #0
	bl sub_0805B8AC
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805B79E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805B79E
_0805B784:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq _0805B79E
	cmp r2, #0x64
	bne _0805B79E
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805B79E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B7A4
sub_0805B7A4: @ 0x0805B7A4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B7F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B7FC @ =0x08C11D0C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B800 @ =0x081EE60C
	str r0, [r5, #0x48]
	ldr r0, _0805B804 @ =0x08C11D74
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B808 @ =0x08C11D24
	str r0, [r5, #0x54]
	ldr r0, _0805B80C @ =0x08243F68
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805B810 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B81E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B814
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805B81E
	.align 2, 0
_0805B7F8: .4byte 0x0201774C
_0805B7FC: .4byte 0x08C11D0C
_0805B800: .4byte 0x081EE60C
_0805B804: .4byte 0x08C11D74
_0805B808: .4byte 0x08C11D24
_0805B80C: .4byte 0x08243F68
_0805B810: .4byte gEkrDistanceType
_0805B814:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805B81E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B828
sub_0805B828: @ 0x0805B828
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B87C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B880 @ =0x08C11D0C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B884 @ =0x081EE67A
	str r0, [r5, #0x48]
	ldr r0, _0805B888 @ =0x08C11DD0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B88C @ =0x08C11DC4
	str r0, [r5, #0x54]
	ldr r0, _0805B890 @ =0x08243F68
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805B894 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B8A2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B898
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805B8A2
	.align 2, 0
_0805B87C: .4byte 0x0201774C
_0805B880: .4byte 0x08C11D0C
_0805B884: .4byte 0x081EE67A
_0805B888: .4byte 0x08C11DD0
_0805B88C: .4byte 0x08C11DC4
_0805B890: .4byte 0x08243F68
_0805B894: .4byte gEkrDistanceType
_0805B898:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805B8A2:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B8AC
sub_0805B8AC: @ 0x0805B8AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B900 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B904 @ =0x08C11D0C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B908 @ =0x081EE688
	str r0, [r5, #0x48]
	ldr r0, _0805B90C @ =0x08C11E30
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B910 @ =0x08C11DDC
	str r0, [r5, #0x54]
	ldr r0, _0805B914 @ =0x08243F48
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805B918 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B926
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B91C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805B926
	.align 2, 0
_0805B900: .4byte 0x0201774C
_0805B904: .4byte 0x08C11D0C
_0805B908: .4byte 0x081EE688
_0805B90C: .4byte 0x08C11E30
_0805B910: .4byte 0x08C11DDC
_0805B914: .4byte 0x08243F48
_0805B918: .4byte gEkrDistanceType
_0805B91C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805B926:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B930
sub_0805B930: @ 0x0805B930
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805B9A8
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	ldr r0, _0805B988 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B9C6
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805B990
	ldr r0, _0805B98C @ =gBg1Tm
	b _0805B994
	.align 2, 0
_0805B988: .4byte gEkrDistanceType
_0805B98C: .4byte gBg1Tm
_0805B990:
	ldr r0, _0805B9A4 @ =0x0202349A
	movs r1, #0
_0805B994:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805B9C6
	.align 2, 0
_0805B9A4: .4byte 0x0202349A
_0805B9A8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805B9C6
	bl SpellFx_ClearBG1
	ldr r1, _0805B9D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0805B9C6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B9D0: .4byte 0x0201774C

	thumb_func_start sub_0805B9D4
sub_0805B9D4: @ 0x0805B9D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805BA14 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BA18 @ =0x08C11E84
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805BA1C @ =0x08C29458
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805BA20
	ldrh r0, [r6, #2]
	subs r0, #6
	b _0805BA24
	.align 2, 0
_0805BA14: .4byte 0x0201774C
_0805BA18: .4byte 0x08C11E84
_0805BA1C: .4byte 0x08C29458
_0805BA20:
	ldrh r0, [r6, #2]
	adds r0, #6
_0805BA24:
	strh r0, [r6, #2]
	ldr r0, _0805BA40 @ =0x08248128
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805BA44 @ =0x08247FBC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA40: .4byte 0x08248128
_0805BA44: .4byte 0x08247FBC

	thumb_func_start sub_0805BA48
sub_0805BA48: @ 0x0805BA48
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne _0805BA6E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805BA74 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805BA6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA74: .4byte 0x0201774C

	thumb_func_start sub_0805BA78
sub_0805BA78: @ 0x0805BA78
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805BAB0 @ =0x08C11E9C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BAB0: .4byte 0x08C11E9C

	thumb_func_start sub_0805BAB4
sub_0805BAB4: @ 0x0805BAB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805BAE8
	ldr r0, [r4, #0x5c]
	subs r1, #1
	bl sub_0804EC74
_0805BAE8:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805BB40
	adds r0, r5, #0
	bl sub_0805BC20
	ldr r3, _0805BB3C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r2, r8
	str r2, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl sub_080566F0
	adds r0, r5, #0
	movs r1, #0xaa
	bl sub_0805BEDC
	movs r0, #0x95
	lsls r0, r0, #1
	b _0805BB4A
	.align 2, 0
_0805BB3C: .4byte gDispIo
_0805BB40:
	ldr r2, _0805BB5C @ =0x0000011B
	adds r0, r6, r2
	cmp r1, r0
	bne _0805BB64
	ldr r0, _0805BB60 @ =0x0000012B
_0805BB4A:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805BC14
	.align 2, 0
_0805BB5C: .4byte 0x0000011B
_0805BB60: .4byte 0x0000012B
_0805BB64:
	ldr r2, _0805BB78 @ =0x0000013B
	adds r0, r6, r2
	cmp r1, r0
	bne _0805BB7C
	adds r0, r5, #0
	movs r1, #0x19
	bl sub_0805C0DC
	b _0805BC14
	.align 2, 0
_0805BB78: .4byte 0x0000013B
_0805BB7C:
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne _0805BBAE
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_0805092C
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805BC14
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805BC14
_0805BBAE:
	movs r2, #0xad
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805BBFC
	movs r0, #0x96
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #0xa
	bl sub_080569B8
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805BD1C
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805BE48
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_080566F0
	adds r0, r5, #0
	bl sub_0805C230
	b _0805BC14
_0805BBFC:
	movs r2, #0xf5
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805BC14
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805BC14:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805BC20
sub_0805BC20: @ 0x0805BC20
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805BC74 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BC78 @ =0x08C11EB4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805BC7C @ =0x081EE6DE
	str r0, [r5, #0x48]
	ldr r0, _0805BC80 @ =0x08C11EE0
	str r0, [r5, #0x4c]
	ldr r0, _0805BC84 @ =0x08C11ECC
	str r0, [r5, #0x54]
	ldr r0, _0805BC88 @ =0x0827FB18
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805BC8C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805BC9C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805BC90
	movs r0, #1
	movs r1, #0xf8
	b _0805BC94
	.align 2, 0
_0805BC74: .4byte 0x0201774C
_0805BC78: .4byte 0x08C11EB4
_0805BC7C: .4byte 0x081EE6DE
_0805BC80: .4byte 0x08C11EE0
_0805BC84: .4byte 0x08C11ECC
_0805BC88: .4byte 0x0827FB18
_0805BC8C: .4byte gEkrDistanceType
_0805BC90:
	movs r0, #1
	movs r1, #0x18
_0805BC94:
	movs r2, #0
	bl SetBgOffset
	b _0805BCB0
_0805BC9C:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805BCB0
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
_0805BCB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805BCB8
sub_0805BCB8: @ 0x0805BCB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805BCF2
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl sub_08050D38
	b _0805BD10
_0805BCF2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805BD10
	bl SpellFx_ClearBG1
	ldr r1, _0805BD18 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r6, #0
	bl Proc_Break
_0805BD10:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BD18: .4byte 0x0201774C

	thumb_func_start sub_0805BD1C
sub_0805BD1C: @ 0x0805BD1C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805BD64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BD68 @ =0x08C11EF4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	ldr r0, _0805BD6C @ =0x0827D620
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805BD70 @ =0x0827FB38
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BD64: .4byte 0x0201774C
_0805BD68: .4byte 0x08C11EF4
_0805BD6C: .4byte 0x0827D620
_0805BD70: .4byte 0x0827FB38

	thumb_func_start sub_0805BD74
sub_0805BD74: @ 0x0805BD74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r5, #0x2c]
	ands r0, r1
	cmp r0, #0
	beq _0805BDD0
	ldrh r2, [r5, #0x32]
	subs r2, #0xc
	strh r2, [r5, #0x32]
	ldrh r1, [r5, #0x3a]
	adds r1, #0xc
	strh r1, [r5, #0x3a]
	ldr r0, _0805BDC0 @ =gDispIo
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, _0805BDC4 @ =0x0827FDA0
	ldr r4, _0805BDC8 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0805BDCC @ =gBg1Tm
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	b _0805BE06
	.align 2, 0
_0805BDC0: .4byte gDispIo
_0805BDC4: .4byte 0x0827FDA0
_0805BDC8: .4byte gEkrTsaBuffer
_0805BDCC: .4byte gBg1Tm
_0805BDD0:
	ldrh r2, [r5, #0x34]
	adds r2, #8
	strh r2, [r5, #0x34]
	ldrh r1, [r5, #0x3c]
	adds r1, #8
	strh r1, [r5, #0x3c]
	ldr r0, _0805BE34 @ =gDispIo
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, _0805BE38 @ =0x0827FDA0
	ldr r4, _0805BE3C @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0805BE40 @ =gBg1Tm
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
_0805BE06:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805BE2C
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, _0805BE44 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805BE2C:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE34: .4byte gDispIo
_0805BE38: .4byte 0x0827FDA0
_0805BE3C: .4byte gEkrTsaBuffer
_0805BE40: .4byte gBg1Tm
_0805BE44: .4byte 0x0201774C

	thumb_func_start sub_0805BE48
sub_0805BE48: @ 0x0805BE48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805BE80 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BE84 @ =0x08C11F0C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805BE88 @ =0x081EE6F4
	str r1, [r0, #0x48]
	ldr r1, _0805BE8C @ =0x0827FB38
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE80: .4byte 0x0201774C
_0805BE84: .4byte 0x08C11F0C
_0805BE88: .4byte 0x081EE6F4
_0805BE8C: .4byte 0x0827FB38

	thumb_func_start sub_0805BE90
sub_0805BE90: @ 0x0805BE90
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805BEB4
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_0805BEB4:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805BED2
	ldr r1, _0805BED8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805BED2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BED8: .4byte 0x0201774C

	thumb_func_start sub_0805BEDC
sub_0805BEDC: @ 0x0805BEDC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805BF1C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BF20 @ =0x08C11F2C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #0xa
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _0805BF24 @ =0x08280864
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805BF28 @ =0x08280370
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BF1C: .4byte 0x0201774C
_0805BF20: .4byte 0x08C11F2C
_0805BF24: .4byte 0x08280864
_0805BF28: .4byte 0x08280370

	thumb_func_start sub_0805BF2C
sub_0805BF2C: @ 0x0805BF2C
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r3, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805BF54
	ldr r1, _0805BF50 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b _0805BF7A
	.align 2, 0
_0805BF50: .4byte 0x0201774C
_0805BF54:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne _0805BF7A
	movs r0, #0
	strh r0, [r3, #0x30]
	movs r0, #0xa
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl sub_0805BF80
_0805BF7A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805BF80
sub_0805BF80: @ 0x0805BF80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0805C00C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C010 @ =0x08C11F44
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x1e
	bl sub_08067AD4
	adds r0, #0x8c
	strh r0, [r4, #0x2e]
	movs r0, #0x1e
	bl sub_08067AD4
	adds r5, r0, #0
	movs r0, #0x1e
	bl sub_08067AD4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x46
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x28
	strh r0, [r4, #0x34]
	ldr r0, _0805C014 @ =0x0000FFEC
	strh r0, [r4, #0x3a]
	movs r0, #0xa0
	strh r0, [r4, #0x3c]
	ldr r0, _0805C018 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0805BFE0
	adds r0, r5, #0
	adds r0, #0x5e
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x40
	strh r0, [r4, #0x34]
_0805BFE0:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #1
	bne _0805BFF8
	movs r0, #0xf0
	ldrh r2, [r4, #0x32]
	subs r1, r0, r2
	strh r1, [r4, #0x32]
	ldrh r1, [r4, #0x34]
	subs r0, r0, r1
	strh r0, [r4, #0x34]
_0805BFF8:
	movs r0, #2
	bl sub_08067AD4
	cmp r0, #0
	beq _0805C020
	cmp r0, #1
	beq _0805C028
	ldr r0, _0805C01C @ =0x08C40B14
	b _0805C02A
	.align 2, 0
_0805C00C: .4byte 0x0201774C
_0805C010: .4byte 0x08C11F44
_0805C014: .4byte 0x0000FFEC
_0805C018: .4byte gEkrDistanceType
_0805C01C: .4byte 0x08C40B14
_0805C020:
	ldr r0, _0805C024 @ =0x08C40B04
	b _0805C02A
	.align 2, 0
_0805C024: .4byte 0x08C40B04
_0805C028:
	ldr r0, _0805C048 @ =0x08C40B0C
_0805C02A:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r1, #0
	bne _0805C050
	ldr r1, _0805C04C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_End
	b _0805C05E
	.align 2, 0
_0805C048: .4byte 0x08C40B0C
_0805C04C: .4byte 0x0201774C
_0805C050:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0805C05E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C064
sub_0805C064: @ 0x0805C064
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0805C094
	ldr r1, _0805C090 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
	b _0805C0D4
	.align 2, 0
_0805C090: .4byte 0x0201774C
_0805C094:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
_0805C0D4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C0DC
sub_0805C0DC: @ 0x0805C0DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0805C174 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C178 @ =0x08C11F5C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	movs r0, #0x5b
	strh r0, [r5, #0x32]
	movs r0, #0x3f
	strh r0, [r5, #0x34]
	ldr r0, _0805C17C @ =0x0000FFF6
	strh r0, [r5, #0x3a]
	movs r0, #0x64
	strh r0, [r5, #0x3c]
	ldr r0, _0805C180 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805C122
	movs r0, #0x73
	strh r0, [r5, #0x32]
	movs r0, #0x57
	strh r0, [r5, #0x34]
_0805C122:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #1
	bne _0805C13A
	movs r0, #0xf0
	ldrh r2, [r5, #0x32]
	subs r1, r0, r2
	strh r1, [r5, #0x32]
	ldrh r1, [r5, #0x34]
	subs r0, r0, r1
	strh r0, [r5, #0x34]
_0805C13A:
	ldr r3, _0805C184 @ =0x08C40B1C
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r3, _0805C188 @ =0x08C40B40
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x64]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C174: .4byte 0x0201774C
_0805C178: .4byte 0x08C11F5C
_0805C17C: .4byte 0x0000FFF6
_0805C180: .4byte gEkrDistanceType
_0805C184: .4byte 0x08C40B1C
_0805C188: .4byte 0x08C40B40

	thumb_func_start sub_0805C18C
sub_0805C18C: @ 0x0805C18C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, [r4, #0x60]
	ldr r5, [r4, #0x64]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r7, #0x34
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	movs r1, #0
	mov r8, r1
	strh r0, [r5, #2]
	strh r0, [r6, #2]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	movs r7, #0x3c
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	strh r0, [r6, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0805C1F2
	mov r0, r8
	strh r0, [r4, #0x2c]
	ldr r0, _0805C228 @ =0x08C40B40
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	mov r1, r8
	strh r1, [r6, #6]
_0805C1F2:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805C21C
	adds r0, r6, #0
	bl AnimDelete
	adds r0, r5, #0
	bl AnimDelete
	ldr r1, _0805C22C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805C21C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C228: .4byte 0x08C40B40
_0805C22C: .4byte 0x0201774C

	thumb_func_start sub_0805C230
sub_0805C230: @ 0x0805C230
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C258 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C25C @ =0x08C11F74
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C258: .4byte 0x0201774C
_0805C25C: .4byte 0x08C11F74

	thumb_func_start sub_0805C260
sub_0805C260: @ 0x0805C260
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	bne _0805C288
	ldr r1, _0805C284 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b _0805C2AE
	.align 2, 0
_0805C284: .4byte 0x0201774C
_0805C288:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne _0805C2AE
	movs r0, #0
	strh r0, [r3, #0x2e]
	movs r0, #1
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl sub_0805C2B4
_0805C2AE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805C2B4
sub_0805C2B4: @ 0x0805C2B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805C310 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C314 @ =0x08C11F8C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	movs r0, #0x78
	bl sub_08067AD4
	adds r1, r0, #0
	subs r1, #0x3c
	strh r1, [r5, #0x32]
	adds r0, #0xb4
	strh r0, [r5, #0x34]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #1
	adds r1, #0xc0
	strh r1, [r5, #0x3a]
	ldr r1, _0805C318 @ =0xFFFFFEB8
	adds r0, r0, r1
	strh r0, [r5, #0x3c]
	movs r0, #2
	bl sub_08067AD4
	cmp r0, #1
	bne _0805C320
	ldr r0, _0805C31C @ =0x08C40B8C
	b _0805C322
	.align 2, 0
_0805C310: .4byte 0x0201774C
_0805C314: .4byte 0x08C11F8C
_0805C318: .4byte 0xFFFFFEB8
_0805C31C: .4byte 0x08C40B8C
_0805C320:
	ldr r0, _0805C340 @ =0x08C40BA8
_0805C322:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
	cmp r1, #0
	bne _0805C348
	ldr r1, _0805C344 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_End
	b _0805C356
	.align 2, 0
_0805C340: .4byte 0x08C40BA8
_0805C344: .4byte 0x0201774C
_0805C348:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0805C356:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C35C
sub_0805C35C: @ 0x0805C35C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0805C38C
	ldr r1, _0805C388 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
	b _0805C3CC
	.align 2, 0
_0805C388: .4byte 0x0201774C
_0805C38C:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
_0805C3CC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start nullsub_51
nullsub_51: @ 0x0805C3D4
	bx lr
	.align 2, 0

	thumb_func_start sub_0805C3D8
sub_0805C3D8: @ 0x0805C3D8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C410 @ =0x08C11FA4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C410: .4byte 0x08C11FA4

	thumb_func_start sub_0805C414
sub_0805C414: @ 0x0805C414
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805C44A
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805C44A:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805C4BC
	ldr r3, _0805C4B8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl sub_080566F0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0xf
	movs r3, #0x10
	bl sub_080566F0
	ldr r0, [r6, #0x5c]
	bl sub_0805C5B4
	ldr r0, [r6, #0x5c]
	bl sub_0805C924
	movs r0, #0x9c
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _0805C5A8
	.align 2, 0
_0805C4B8: .4byte gDispIo
_0805C4BC:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805C4EA
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl sub_080560A4
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl sub_0805A594
	adds r0, r5, #0
	movs r1, #0x2b
	movs r2, #0
	bl sub_080565FC
	b _0805C5A8
_0805C4EA:
	adds r0, r4, #0
	adds r0, #0x78
	cmp r1, r0
	bne _0805C4FA
	adds r0, r5, #0
	bl sub_0805C624
	b _0805C5A8
_0805C4FA:
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _0805C518
	ldr r0, _0805C514 @ =0x00000139
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805C5A8
	.align 2, 0
_0805C514: .4byte 0x00000139
_0805C518:
	adds r0, r4, #0
	adds r0, #0x97
	cmp r1, r0
	bne _0805C528
	ldr r0, [r6, #0x5c]
	bl sub_0805C77C
	b _0805C5A8
_0805C528:
	adds r0, r4, #0
	adds r0, #0xe2
	cmp r1, r0
	bne _0805C570
	ldr r0, _0805C56C @ =0x000002E2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805C5A8
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805C5A8
	.align 2, 0
_0805C56C: .4byte 0x000002E2
_0805C570:
	adds r0, r4, #0
	adds r0, #0xec
	cmp r1, r0
	bne _0805C590
	adds r0, r5, #0
	bl sub_0805C6A8
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl sub_080566F0
	b _0805C5A8
_0805C590:
	movs r2, #0x87
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne _0805C5A8
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
_0805C5A8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C5B4
sub_0805C5B4: @ 0x0805C5B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C608 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C60C @ =0x08C11FBC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805C610 @ =0x081EE706
	str r1, [r0, #0x48]
	ldr r1, _0805C614 @ =0x08C11FD4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805C618 @ =0x08C12040
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805C61C @ =0x08238824
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805C620 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C608: .4byte 0x0201774C
_0805C60C: .4byte 0x08C11FBC
_0805C610: .4byte 0x081EE706
_0805C614: .4byte 0x08C11FD4
_0805C618: .4byte 0x08C12040
_0805C61C: .4byte 0x08238824
_0805C620: .4byte gDispIo

	thumb_func_start sub_0805C624
sub_0805C624: @ 0x0805C624
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C68C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C690 @ =0x08C11FBC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r4, #0
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805C694 @ =0x081EE70C
	str r1, [r0, #0x48]
	ldr r1, _0805C698 @ =0x08C11FD4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805C69C @ =0x08C12040
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805C6A0 @ =0x08250388
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, _0805C6A4 @ =gDispIo
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
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C68C: .4byte 0x0201774C
_0805C690: .4byte 0x08C11FBC
_0805C694: .4byte 0x081EE70C
_0805C698: .4byte 0x08C11FD4
_0805C69C: .4byte 0x08C12040
_0805C6A0: .4byte 0x08250388
_0805C6A4: .4byte gDispIo

	thumb_func_start sub_0805C6A8
sub_0805C6A8: @ 0x0805C6A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C6E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C6EC @ =0x08C11FBC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805C6F0 @ =0x081EE7AE
	str r1, [r0, #0x48]
	ldr r1, _0805C6F4 @ =0x08C11FD4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805C6F8 @ =0x08C12040
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805C6FC @ =0x082503A8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C6E8: .4byte 0x0201774C
_0805C6EC: .4byte 0x08C11FBC
_0805C6F0: .4byte 0x081EE7AE
_0805C6F4: .4byte 0x08C11FD4
_0805C6F8: .4byte 0x08C12040
_0805C6FC: .4byte 0x082503A8

	thumb_func_start sub_0805C700
sub_0805C700: @ 0x0805C700
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805C750
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0805C73A
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_0805C73A:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805C76E
_0805C750:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805C76E
	bl SpellFx_ClearBG1
	ldr r1, _0805C778 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805C76E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C778: .4byte 0x0201774C

	thumb_func_start sub_0805C77C
sub_0805C77C: @ 0x0805C77C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805C7D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C7D8 @ =0x08C120AC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805C7DC @ =0x08C10828
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, _0805C7E0 @ =0x0000F3FF
	ldrh r1, [r6, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805C7E4
	ldrh r0, [r6, #2]
	subs r0, #8
	b _0805C7E8
	.align 2, 0
_0805C7D4: .4byte 0x0201774C
_0805C7D8: .4byte 0x08C120AC
_0805C7DC: .4byte 0x08C10828
_0805C7E0: .4byte 0x0000F3FF
_0805C7E4:
	ldrh r0, [r6, #2]
	adds r0, #8
_0805C7E8:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C7F8
sub_0805C7F8: @ 0x0805C7F8
	push {lr}
	ldr r2, _0805C80C @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805C80C: .4byte 0x0201774C

	thumb_func_start sub_0805C810
sub_0805C810: @ 0x0805C810
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0805C854
	ldr r0, _0805C848 @ =0x08C29618
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _0805C84C @ =0x08253234
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C850 @ =0x082524D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b _0805C864
	.align 2, 0
_0805C848: .4byte 0x08C29618
_0805C84C: .4byte 0x08253234
_0805C850: .4byte 0x082524D4
_0805C854:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0805C864
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0805C864:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805C86C
sub_0805C86C: @ 0x0805C86C
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0805C8B0
	ldr r0, _0805C8A4 @ =0x08C29920
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _0805C8A8 @ =0x08253234
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C8AC @ =0x082529A0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b _0805C8C0
	.align 2, 0
_0805C8A4: .4byte 0x08C29920
_0805C8A8: .4byte 0x08253234
_0805C8AC: .4byte 0x082529A0
_0805C8B0:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0805C8C0
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0805C8C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805C8C8
sub_0805C8C8: @ 0x0805C8C8
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0805C90C
	ldr r0, _0805C900 @ =0x08C29C1C
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _0805C904 @ =0x08253234
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C908 @ =0x08252E38
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b _0805C91C
	.align 2, 0
_0805C900: .4byte 0x08C29C1C
_0805C904: .4byte 0x08253234
_0805C908: .4byte 0x08252E38
_0805C90C:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0805C91C
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0805C91C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805C924
sub_0805C924: @ 0x0805C924
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C95C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C960 @ =0x08C120F4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x2c
	strh r1, [r0, #0x30]
	ldr r0, _0805C964 @ =0x0822FED0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C968 @ =0x0822F2D8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C95C: .4byte 0x0201774C
_0805C960: .4byte 0x08C120F4
_0805C964: .4byte 0x0822FED0
_0805C968: .4byte 0x0822F2D8

	thumb_func_start sub_0805C96C
sub_0805C96C: @ 0x0805C96C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0805C9BE
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0805C9C4 @ =0x08C1210C
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r0, [r4, #0x5c]
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_0805C9CC
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0805C9BE
	ldr r1, _0805C9C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805C9BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C9C4: .4byte 0x08C1210C
_0805C9C8: .4byte 0x0201774C

	thumb_func_start sub_0805C9CC
sub_0805C9CC: @ 0x0805C9CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805CA14 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CA18 @ =0x08C12124
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805CA1C @ =0x08C28880
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA14: .4byte 0x0201774C
_0805CA18: .4byte 0x08C12124
_0805CA1C: .4byte 0x08C28880

	thumb_func_start sub_0805CA20
sub_0805CA20: @ 0x0805CA20
	push {lr}
	ldr r2, _0805CA34 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805CA34: .4byte 0x0201774C

	thumb_func_start sub_0805CA38
sub_0805CA38: @ 0x0805CA38
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805CA70 @ =0x08C12144
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA70: .4byte 0x08C12144

	thumb_func_start sub_0805CA74
sub_0805CA74: @ 0x0805CA74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CAAA
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805CAAA:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805CB3C
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805CC58
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805CD34
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl sub_080560A4
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl sub_080565FC
	ldr r3, _0805CB38 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl sub_080566F0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl sub_080566F0
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _0805CC4C
	.align 2, 0
_0805CB38: .4byte gDispIo
_0805CB3C:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne _0805CB54
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_0805CDCC
	ldr r0, _0805CB50 @ =0x00000131
	b _0805CBAC
	.align 2, 0
_0805CB50: .4byte 0x00000131
_0805CB54:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _0805CB64
	adds r0, r5, #0
	bl sub_0805CE60
	b _0805CC4C
_0805CB64:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq _0805CBA8
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	beq _0805CBA8
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq _0805CBA8
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	beq _0805CBA8
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq _0805CBA8
	adds r0, r4, #0
	adds r0, #0xb5
	cmp r1, r0
	beq _0805CBA8
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _0805CBA8
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	adds r0, #0xd1
	cmp r1, r0
	bne _0805CBBC
_0805CBA8:
	movs r0, #0x99
	lsls r0, r0, #1
_0805CBAC:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805CC4C
_0805CBBC:
	adds r0, r4, #0
	adds r0, #0xee
	cmp r1, r0
	bne _0805CC08
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804F7B8
	adds r0, r5, #0
	bl sub_0805D044
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, _0805CC04 @ =0x00000133
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805CC4C
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805CC4C
	.align 2, 0
_0805CC04: .4byte 0x00000133
_0805CC08:
	adds r0, r4, #0
	adds r0, #0xf8
	cmp r1, r0
	bne _0805CC2A
	adds r0, r5, #0
	bl sub_0805CEF0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl sub_080566F0
	b _0805CC4C
_0805CC2A:
	movs r2, #0x91
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	beq _0805CC4C
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	bne _0805CC4C
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
_0805CC4C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805CC58
sub_0805CC58: @ 0x0805CC58
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805CCCC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CCD0 @ =0x08C1215C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _0805CCD4 @ =0x08253254
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _0805CCD8 @ =0x08253B94
	ldr r4, _0805CCDC @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0805CCE0 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805CCE4 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CCCC: .4byte 0x0201774C
_0805CCD0: .4byte 0x08C1215C
_0805CCD4: .4byte 0x08253254
_0805CCD8: .4byte 0x08253B94
_0805CCDC: .4byte gEkrTsaBuffer
_0805CCE0: .4byte gBg1Tm
_0805CCE4: .4byte gDispIo

	thumb_func_start sub_0805CCE8
sub_0805CCE8: @ 0x0805CCE8
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _0805CD00 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0805CD00: .4byte 0x0201774C

	thumb_func_start sub_0805CD04
sub_0805CD04: @ 0x0805CD04
	push {lr}
	adds r2, r0, #0
	ldr r0, _0805CD30 @ =gDispIo
	ldrh r1, [r0, #0x22]
	adds r1, #1
	strh r1, [r0, #0x22]
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0805CD2C
	adds r0, r2, #0
	bl Proc_Break
_0805CD2C:
	pop {r0}
	bx r0
	.align 2, 0
_0805CD30: .4byte gDispIo

	thumb_func_start sub_0805CD34
sub_0805CD34: @ 0x0805CD34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805CD6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CD70 @ =0x08C1217C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805CD74 @ =0x081EE7E4
	str r1, [r0, #0x48]
	ldr r1, _0805CD78 @ =0x082539B4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD6C: .4byte 0x0201774C
_0805CD70: .4byte 0x08C1217C
_0805CD74: .4byte 0x081EE7E4
_0805CD78: .4byte 0x082539B4

	thumb_func_start sub_0805CD7C
sub_0805CD7C: @ 0x0805CD7C
	ldr r1, _0805CD88 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805CD88: .4byte 0x0201774C

	thumb_func_start sub_0805CD8C
sub_0805CD8C: @ 0x0805CD8C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805CDB0
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_0805CDB0:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805CDC6
	adds r0, r4, #0
	bl Proc_Break
_0805CDC6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0805CDCC
sub_0805CDCC: @ 0x0805CDCC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0805CE18 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CE1C @ =0x08C121A4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _0805CE20 @ =0x08C2A90C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _0805CE24 @ =0x0825CF18
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805CE28 @ =0x0825C39C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CE18: .4byte 0x0201774C
_0805CE1C: .4byte 0x08C121A4
_0805CE20: .4byte 0x08C2A90C
_0805CE24: .4byte 0x0825CF18
_0805CE28: .4byte 0x0825C39C

	thumb_func_start sub_0805CE2C
sub_0805CE2C: @ 0x0805CE2C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805CE54
	ldr r0, _0805CE5C @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805CE54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CE5C: .4byte 0x0201774C

	thumb_func_start sub_0805CE60
sub_0805CE60: @ 0x0805CE60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805CEC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CEC8 @ =0x08C121BC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _0805CECC @ =0x081EE822
	str r0, [r5, #0x48]
	ldr r0, _0805CED0 @ =0x08C122A0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805CED4 @ =0x08C121D4
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _0805CED8 @ =0x08257D54
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0805CEDC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805CEEA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805CEE0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805CEEA
	.align 2, 0
_0805CEC4: .4byte 0x0201774C
_0805CEC8: .4byte 0x08C121BC
_0805CECC: .4byte 0x081EE822
_0805CED0: .4byte 0x08C122A0
_0805CED4: .4byte 0x08C121D4
_0805CED8: .4byte 0x08257D54
_0805CEDC: .4byte gEkrDistanceType
_0805CEE0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805CEEA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805CEF0
sub_0805CEF0: @ 0x0805CEF0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805CF4C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CF50 @ =0x08C121BC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _0805CF54 @ =0x081EDF40
	str r0, [r5, #0x48]
	ldr r0, _0805CF58 @ =0x08C10EB4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805CF5C @ =0x08C10E60
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _0805CF60 @ =0x08257D74
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805CF64 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805CF72
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805CF68
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805CF72
	.align 2, 0
_0805CF4C: .4byte 0x0201774C
_0805CF50: .4byte 0x08C121BC
_0805CF54: .4byte 0x081EDF40
_0805CF58: .4byte 0x08C10EB4
_0805CF5C: .4byte 0x08C10E60
_0805CF60: .4byte 0x08257D74
_0805CF64: .4byte gEkrDistanceType
_0805CF68:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805CF72:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805CF78
sub_0805CF78: @ 0x0805CF78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805D014
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0805CFB4
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_0805CFB4:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0805CFF0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D032
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805CFF8
	ldr r0, _0805CFF4 @ =gBg1Tm
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805D008
	.align 2, 0
_0805CFF0: .4byte gEkrDistanceType
_0805CFF4: .4byte gBg1Tm
_0805CFF8:
	ldr r0, _0805D010 @ =0x0202349A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_0805D008:
	movs r0, #2
	bl EnableBgSync
	b _0805D032
	.align 2, 0
_0805D010: .4byte 0x0202349A
_0805D014:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805D032
	bl SpellFx_ClearBG1
	ldr r1, _0805D040 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805D032:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D040: .4byte 0x0201774C

	thumb_func_start sub_0805D044
sub_0805D044: @ 0x0805D044
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805D07C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D080 @ =0x08C1236C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _0805D084 @ =0x0825CF38
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805D088 @ =0x0825C39C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D07C: .4byte 0x0201774C
_0805D080: .4byte 0x08C1236C
_0805D084: .4byte 0x0825CF38
_0805D088: .4byte 0x0825C39C

	thumb_func_start sub_0805D08C
sub_0805D08C: @ 0x0805D08C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0805D0CC
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x44]
	bl sub_0805D0D8
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0805D0CC
	ldr r1, _0805D0D4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D0CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D0D4: .4byte 0x0201774C

	thumb_func_start sub_0805D0D8
sub_0805D0D8: @ 0x0805D0D8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0805D118 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D11C @ =0x08C12384
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, _0805D120 @ =0x08C1239C
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0805D124
	cmp r0, #1
	beq _0805D12C
	b _0805D138
	.align 2, 0
_0805D118: .4byte 0x0201774C
_0805D11C: .4byte 0x08C12384
_0805D120: .4byte 0x08C1239C
_0805D124:
	ldr r0, _0805D128 @ =0x08C2A8B4
	b _0805D12E
	.align 2, 0
_0805D128: .4byte 0x08C2A8B4
_0805D12C:
	ldr r0, _0805D154 @ =0x08C2A8E0
_0805D12E:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
_0805D138:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D154: .4byte 0x08C2A8E0

	thumb_func_start sub_0805D158
sub_0805D158: @ 0x0805D158
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r2, #0x96
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, _0805D1D0 @ =gSinLut
	ldr r2, [r6, #0x44]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	muls r0, r1, r0
	asrs r3, r3, #0xc
	ldrh r1, [r6, #0x32]
	adds r3, r1, r3
	strh r3, [r5, #2]
	asrs r0, r0, #0xc
	ldrh r2, [r6, #0x3a]
	adds r0, r2, r0
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r6, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0805D1C6
	ldr r0, _0805D1D4 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl AnimDelete
	adds r0, r6, #0
	bl Proc_Break
_0805D1C6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D1D0: .4byte gSinLut
_0805D1D4: .4byte 0x0201774C

	thumb_func_start sub_0805D1D8
sub_0805D1D8: @ 0x0805D1D8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805D1FC @ =0x08C123BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D1FC: .4byte 0x08C123BC

	thumb_func_start sub_0805D200
sub_0805D200: @ 0x0805D200
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805D232
	ldr r0, [r4, #0x5c]
	bl sub_0805DC18
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D2DC
_0805D232:
	cmp r0, #0x34
	bne _0805D298
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D824
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805DA04
	ldr r3, _0805D294 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D2DC
	.align 2, 0
_0805D294: .4byte gDispIo
_0805D298:
	cmp r0, #0x37
	bne _0805D2A6
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805D320
_0805D2A6:
	cmp r0, #0x71
	bne _0805D2E8
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D8E0
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805DA74
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	ldr r0, _0805D2E4 @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805D2DC:
	movs r3, #1
	bl PlaySFX
	b _0805D320
	.align 2, 0
_0805D2E4: .4byte 0x0000010F
_0805D2E8:
	cmp r0, #0xa6
	bne _0805D2F4
	adds r0, r5, #0
	bl sub_0804E474
	b _0805D320
_0805D2F4:
	cmp r0, #0xb5
	bne _0805D320
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805D31A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805D31A:
	adds r0, r4, #0
	bl Proc_Break
_0805D320:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D328
sub_0805D328: @ 0x0805D328
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805D34C @ =0x08C123D4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D34C: .4byte 0x08C123D4

	thumb_func_start sub_0805D350
sub_0805D350: @ 0x0805D350
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805D388
	ldr r0, [r4, #0x5c]
	bl sub_0805DC18
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D472
_0805D388:
	cmp r0, #0x34
	bne _0805D3F0
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805D824
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805DA04
	ldr r3, _0805D3EC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D472
	.align 2, 0
_0805D3EC: .4byte gDispIo
_0805D3F0:
	cmp r0, #0x37
	bne _0805D3FE
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805D4C4
_0805D3FE:
	cmp r0, #0x71
	bne _0805D40E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _0805D4C4
_0805D40E:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _0805D484
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805D8E0
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805DA74
	ldr r3, _0805D47C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	ldr r0, _0805D480 @ =0x00000111
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805D472:
	movs r3, #1
	bl PlaySFX
	b _0805D4C4
	.align 2, 0
_0805D47C: .4byte gDispIo
_0805D480: .4byte 0x00000111
_0805D484:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne _0805D494
	adds r0, r5, #0
	bl sub_0804E474
	b _0805D4C4
_0805D494:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne _0805D4C4
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805D4BE
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805D4BE:
	adds r0, r4, #0
	bl Proc_Break
_0805D4C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D4CC
sub_0805D4CC: @ 0x0805D4CC
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805D4F0 @ =0x08C123EC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D4F0: .4byte 0x08C123EC

	thumb_func_start sub_0805D4F4
sub_0805D4F4: @ 0x0805D4F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805D52C
	ldr r0, [r4, #0x5c]
	bl sub_0805DC18
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D616
_0805D52C:
	cmp r0, #0x34
	bne _0805D594
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805D824
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805DA04
	ldr r3, _0805D590 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	movs r0, #0x89
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D616
	.align 2, 0
_0805D590: .4byte gDispIo
_0805D594:
	cmp r0, #0x37
	bne _0805D5A2
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805D668
_0805D5A2:
	cmp r0, #0x71
	bne _0805D5B2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _0805D668
_0805D5B2:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _0805D628
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805D8E0
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805DA74
	ldr r3, _0805D620 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	ldr r0, _0805D624 @ =0x00000113
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805D616:
	movs r3, #1
	bl PlaySFX
	b _0805D668
	.align 2, 0
_0805D620: .4byte gDispIo
_0805D624: .4byte 0x00000113
_0805D628:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne _0805D638
	adds r0, r5, #0
	bl sub_0804E474
	b _0805D668
_0805D638:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne _0805D668
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805D662
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805D662:
	adds r0, r4, #0
	bl Proc_Break
_0805D668:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D670
sub_0805D670: @ 0x0805D670
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805D694 @ =0x08C12404
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D694: .4byte 0x08C12404

	thumb_func_start sub_0805D698
sub_0805D698: @ 0x0805D698
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805D6D8
	ldr r0, [r4, #0x5c]
	bl sub_0805DC18
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805DD78
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D7CA
_0805D6D8:
	cmp r0, #0x34
	bne _0805D740
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D824
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805DA04
	ldr r3, _0805D73C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805D7CA
	.align 2, 0
_0805D73C: .4byte gDispIo
_0805D740:
	cmp r0, #0x37
	bne _0805D74E
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805D81C
_0805D74E:
	cmp r0, #0x97
	bne _0805D766
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805DD78
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _0805D81C
_0805D766:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0xa1
	cmp r1, r0
	bne _0805D7DC
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D8E0
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805DA74
	ldr r3, _0805D7D4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805DB2C
	ldr r0, _0805D7D8 @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805D7CA:
	movs r3, #1
	bl PlaySFX
	b _0805D81C
	.align 2, 0
_0805D7D4: .4byte gDispIo
_0805D7D8: .4byte 0x0000010F
_0805D7DC:
	adds r0, r2, #0
	adds r0, #0xd3
	cmp r1, r0
	bne _0805D7EC
	adds r0, r5, #0
	bl sub_0804E474
	b _0805D81C
_0805D7EC:
	adds r0, r2, #0
	adds r0, #0xdd
	cmp r1, r0
	bne _0805D81C
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805D816
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805D816:
	adds r0, r4, #0
	bl Proc_Break
_0805D81C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D824
sub_0805D824: @ 0x0805D824
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _0805D86C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D870 @ =0x08C1241C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq _0805D884
	cmp r6, #2
	bhi _0805D8D6
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805D874 @ =0x081EE930
	str r0, [r5, #0x48]
	ldr r0, _0805D878 @ =0x082710C8
	str r0, [r5, #0x4c]
	ldr r0, _0805D87C @ =0x08271A28
	str r0, [r5, #0x50]
	ldr r0, _0805D880 @ =0x082708D0
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b _0805D8D6
	.align 2, 0
_0805D86C: .4byte 0x0201774C
_0805D870: .4byte 0x08C1241C
_0805D874: .4byte 0x081EE930
_0805D878: .4byte 0x082710C8
_0805D87C: .4byte 0x08271A28
_0805D880: .4byte 0x082708D0
_0805D884:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805D8BC @ =0x081EE924
	str r0, [r5, #0x48]
	ldr r0, _0805D8C0 @ =0x0826FAFC
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805D8C4 @ =0x0826F96C
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805D8C8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D8D6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D8CC
	movs r0, #1
	movs r1, #0x18
	b _0805D8D0
	.align 2, 0
_0805D8BC: .4byte 0x081EE924
_0805D8C0: .4byte 0x0826FAFC
_0805D8C4: .4byte 0x0826F96C
_0805D8C8: .4byte gEkrDistanceType
_0805D8CC:
	movs r0, #1
	movs r1, #0xe8
_0805D8D0:
	movs r2, #0
	bl SetBgOffset
_0805D8D6:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805D8E0
sub_0805D8E0: @ 0x0805D8E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _0805D928 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D92C @ =0x08C1241C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq _0805D940
	cmp r6, #2
	bhi _0805D98A
	ldr r0, _0805D930 @ =0x081EE936
	str r0, [r5, #0x48]
	ldr r0, _0805D934 @ =0x082710C8
	str r0, [r5, #0x4c]
	ldr r0, _0805D938 @ =0x08271A28
	str r0, [r5, #0x50]
	ldr r0, _0805D93C @ =0x082708D0
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b _0805D98A
	.align 2, 0
_0805D928: .4byte 0x0201774C
_0805D92C: .4byte 0x08C1241C
_0805D930: .4byte 0x081EE936
_0805D934: .4byte 0x082710C8
_0805D938: .4byte 0x08271A28
_0805D93C: .4byte 0x082708D0
_0805D940:
	ldr r0, _0805D970 @ =0x081EE92A
	str r0, [r5, #0x48]
	ldr r0, _0805D974 @ =0x0826FAFC
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805D978 @ =0x0826F96C
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805D97C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D98A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D980
	movs r0, #1
	movs r1, #0xe8
	b _0805D984
	.align 2, 0
_0805D970: .4byte 0x081EE92A
_0805D974: .4byte 0x0826FAFC
_0805D978: .4byte 0x0826F96C
_0805D97C: .4byte gEkrDistanceType
_0805D980:
	movs r0, #1
	movs r1, #0x18
_0805D984:
	movs r2, #0
	bl SetBgOffset
_0805D98A:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805D994
sub_0805D994: @ 0x0805D994
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805D9C6
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl sub_08050C54
	b _0805D9F8
_0805D9C6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805D9F8
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D9E0
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
_0805D9E0:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0805DA00 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D9F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DA00: .4byte 0x0201774C

	thumb_func_start sub_0805DA04
sub_0805DA04: @ 0x0805DA04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805DA2C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DA30 @ =0x08C12434
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0805DA38
	ldr r0, _0805DA34 @ =0x081EE93C
	b _0805DA46
	.align 2, 0
_0805DA2C: .4byte 0x0201774C
_0805DA30: .4byte 0x08C12434
_0805DA34: .4byte 0x081EE93C
_0805DA38:
	cmp r5, #1
	bne _0805DA44
	ldr r0, _0805DA40 @ =0x081EE9C0
	b _0805DA46
	.align 2, 0
_0805DA40: .4byte 0x081EE9C0
_0805DA44:
	ldr r0, _0805DA50 @ =0x081EE9F2
_0805DA46:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805DA58
	ldr r0, _0805DA54 @ =0x0827045C
	b _0805DA66
	.align 2, 0
_0805DA50: .4byte 0x081EE9F2
_0805DA54: .4byte 0x0827045C
_0805DA58:
	cmp r5, #1
	bne _0805DA64
	ldr r0, _0805DA60 @ =0x082725A8
	b _0805DA66
	.align 2, 0
_0805DA60: .4byte 0x082725A8
_0805DA64:
	ldr r0, _0805DA70 @ =0x08272388
_0805DA66:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DA70: .4byte 0x08272388

	thumb_func_start sub_0805DA74
sub_0805DA74: @ 0x0805DA74
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805DA9C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DAA0 @ =0x08C12434
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0805DAA8
	ldr r0, _0805DAA4 @ =0x081EE97E
	b _0805DAB6
	.align 2, 0
_0805DA9C: .4byte 0x0201774C
_0805DAA0: .4byte 0x08C12434
_0805DAA4: .4byte 0x081EE97E
_0805DAA8:
	cmp r5, #1
	bne _0805DAB4
	ldr r0, _0805DAB0 @ =0x081EE9C0
	b _0805DAB6
	.align 2, 0
_0805DAB0: .4byte 0x081EE9C0
_0805DAB4:
	ldr r0, _0805DAC0 @ =0x081EE9F2
_0805DAB6:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805DAC8
	ldr r0, _0805DAC4 @ =0x0827045C
	b _0805DAD6
	.align 2, 0
_0805DAC0: .4byte 0x081EE9F2
_0805DAC4: .4byte 0x0827045C
_0805DAC8:
	cmp r5, #1
	bne _0805DAD4
	ldr r0, _0805DAD0 @ =0x082725A8
	b _0805DAD6
	.align 2, 0
_0805DAD0: .4byte 0x082725A8
_0805DAD4:
	ldr r0, _0805DAE0 @ =0x08272388
_0805DAD6:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DAE0: .4byte 0x08272388

	thumb_func_start sub_0805DAE4
sub_0805DAE4: @ 0x0805DAE4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805DB0A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805DB20
_0805DB0A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805DB20
	ldr r1, _0805DB28 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805DB20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB28: .4byte 0x0201774C

	thumb_func_start sub_0805DB2C
sub_0805DB2C: @ 0x0805DB2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, _0805DB60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DB64 @ =0x08C12454
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB60: .4byte 0x0201774C
_0805DB64: .4byte 0x08C12454

	thumb_func_start sub_0805DB68
sub_0805DB68: @ 0x0805DB68
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805DB7E
	adds r0, r1, #0
	bl Proc_Break
_0805DB7E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805DB84
sub_0805DB84: @ 0x0805DB84
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0805DBAC
	ldr r1, _0805DBA8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _0805DC0A
	.align 2, 0
_0805DBA8: .4byte 0x0201774C
_0805DBAC:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805DBC8
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b _0805DBD8
_0805DBC8:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
_0805DBD8:
	bl Interpolate
	adds r5, r0, #0
	ldr r3, _0805DC14 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r5, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_0805DC0A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC14: .4byte gDispIo

	thumb_func_start sub_0805DC18
sub_0805DC18: @ 0x0805DC18
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805DC64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DC68 @ =0x08C12474
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _0805DC6C @ =0x08C2D9FC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _0805DC70 @ =0x082708B0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805DC74 @ =0x0827065C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC64: .4byte 0x0201774C
_0805DC68: .4byte 0x08C12474
_0805DC6C: .4byte 0x08C2D9FC
_0805DC70: .4byte 0x082708B0
_0805DC74: .4byte 0x0827065C

	thumb_func_start sub_0805DC78
sub_0805DC78: @ 0x0805DC78
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805DCC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DCCC @ =0x08C1248C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	movs r0, #0x34
	strh r0, [r4, #0x30]
	ldr r3, _0805DCD0 @ =0x08C2D9FC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _0805DCD4 @ =0x082708B0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805DCD8 @ =0x0827065C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DCC8: .4byte 0x0201774C
_0805DCCC: .4byte 0x08C1248C
_0805DCD0: .4byte 0x08C2D9FC
_0805DCD4: .4byte 0x082708B0
_0805DCD8: .4byte 0x0827065C

	thumb_func_start sub_0805DCDC
sub_0805DCDC: @ 0x0805DCDC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805DD04
	ldr r0, _0805DD0C @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805DD04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DD0C: .4byte 0x0201774C

	thumb_func_start sub_0805DD10
sub_0805DD10: @ 0x0805DD10
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r5, [r2, #0x2e]
	lsls r1, r5, #0x10
	cmp r0, r1
	bne _0805DD38
	ldr r0, _0805DD40 @ =0x08C2DA8C
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	strh r4, [r3, #6]
	strh r4, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_0805DD38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DD40: .4byte 0x08C2DA8C

	thumb_func_start sub_0805DD44
sub_0805DD44: @ 0x0805DD44
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805DD6C
	ldr r0, _0805DD74 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805DD6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DD74: .4byte 0x0201774C

	thumb_func_start sub_0805DD78
sub_0805DD78: @ 0x0805DD78
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805DDA8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DDAC @ =0x08C124AC
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _0805DDB0
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b _0805DDB6
	.align 2, 0
_0805DDA8: .4byte 0x0201774C
_0805DDAC: .4byte 0x08C124AC
_0805DDB0:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
_0805DDB6:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805DDC0
sub_0805DDC0: @ 0x0805DDC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805DE7E
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805DE26
	ldr r0, _0805DE08 @ =0x08C2EFA8
	mov r8, r0
	ldr r7, _0805DE0C @ =0x08C305A8
	ldr r0, _0805DE10 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805DE14
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x88
	cmp r0, #0
	bne _0805DE22
	movs r5, #0x68
	b _0805DE22
	.align 2, 0
_0805DE08: .4byte 0x08C2EFA8
_0805DE0C: .4byte 0x08C305A8
_0805DE10: .4byte gEkrDistanceType
_0805DE14:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x70
	cmp r0, #0
	bne _0805DE22
	movs r5, #0x80
_0805DE22:
	movs r6, #0x4e
	b _0805DE64
_0805DE26:
	ldr r2, _0805DE48 @ =0x08C2F01C
	mov r8, r2
	ldr r7, _0805DE4C @ =0x08C3061C
	ldr r0, _0805DE50 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805DE54
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x4c
	cmp r0, #0
	bne _0805DE62
	movs r5, #0xa4
	b _0805DE62
	.align 2, 0
_0805DE48: .4byte 0x08C2F01C
_0805DE4C: .4byte 0x08C3061C
_0805DE50: .4byte gEkrDistanceType
_0805DE54:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x64
	cmp r0, #0
	bne _0805DE62
	movs r5, #0x8c
_0805DE62:
	movs r6, #0x40
_0805DE64:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl Proc_Break
_0805DE7E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805DE8C
sub_0805DE8C: @ 0x0805DE8C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805DEB4
	ldr r0, _0805DEBC @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805DEB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DEBC: .4byte 0x0201774C

	thumb_func_start sub_0805DEC0
sub_0805DEC0: @ 0x0805DEC0
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805DEEC @ =0x08C124CC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DEEC: .4byte 0x08C124CC

	thumb_func_start sub_0805DEF0
sub_0805DEF0: @ 0x0805DEF0
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805DF1C @ =0x08C124CC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DF1C: .4byte 0x08C124CC

	thumb_func_start sub_0805DF20
sub_0805DF20: @ 0x0805DF20
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _0805DF50
	ldr r0, [r4, #0x5c]
	bl sub_0805DC78
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _0805DFE8
_0805DF50:
	cmp r1, #0x34
	bne _0805DF68
	ldr r0, [r4, #0x5c]
	bl sub_0805DFF4
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_0805E0C4
	b _0805DFE8
_0805DF68:
	cmp r1, #0xb7
	bne _0805DFD4
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	bl sub_0805E158
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_0805E31C
	ldr r3, _0805DFD0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl sub_0805DB2C
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl sub_0805DB2C
	b _0805DFE8
	.align 2, 0
_0805DFD0: .4byte gDispIo
_0805DFD4:
	ldr r0, _0805DFF0 @ =0x000001C5
	cmp r1, r0
	bne _0805DFE8
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805DFE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DFF0: .4byte 0x000001C5

	thumb_func_start sub_0805DFF4
sub_0805DFF4: @ 0x0805DFF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E030 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E034 @ =0x08C124E4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E038 @ =0x081EEA34
	str r1, [r0, #0x48]
	ldr r1, _0805E03C @ =0x08C124FC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805E040 @ =0x0826F96C
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E030: .4byte 0x0201774C
_0805E034: .4byte 0x08C124E4
_0805E038: .4byte 0x081EEA34
_0805E03C: .4byte 0x08C124FC
_0805E040: .4byte 0x0826F96C

	thumb_func_start sub_0805E044
sub_0805E044: @ 0x0805E044
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805E09C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl SpellFx_WriteBgMap
	ldr r0, _0805E094 @ =0x081EEA46
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, _0805E098 @ =0x081EEA4E
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl PlaySFX
	b _0805E0BA
	.align 2, 0
_0805E094: .4byte 0x081EEA46
_0805E098: .4byte 0x081EEA4E
_0805E09C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805E0BA
	bl SpellFx_ClearBG1
	ldr r1, _0805E0C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805E0BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805E0C0: .4byte 0x0201774C

	thumb_func_start sub_0805E0C4
sub_0805E0C4: @ 0x0805E0C4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805E0F0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E0F4 @ =0x08C1250C
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0805E0F8 @ =0x081EEA56
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805E100
	ldr r0, _0805E0FC @ =0x08273048
	b _0805E102
	.align 2, 0
_0805E0F0: .4byte 0x0201774C
_0805E0F4: .4byte 0x08C1250C
_0805E0F8: .4byte 0x081EEA56
_0805E0FC: .4byte 0x08273048
_0805E100:
	ldr r0, _0805E10C @ =0x08273248
_0805E102:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E10C: .4byte 0x08273248

	thumb_func_start sub_0805E110
sub_0805E110: @ 0x0805E110
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805E136
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805E14C
_0805E136:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805E14C
	ldr r1, _0805E154 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805E14C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E154: .4byte 0x0201774C

	thumb_func_start sub_0805E158
sub_0805E158: @ 0x0805E158
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r1, _0805E214 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E218 @ =0x08C1252C
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E21C @ =0x081EEB58
	str r1, [r0, #0x48]
	ldr r1, _0805E220 @ =0x08C12544
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805E224 @ =0x082708D0
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	ldr r6, _0805E228 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x14]
	ldrb r0, [r6, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x10]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	bl sub_08050F48
	ldr r2, _0805E22C @ =0x0000F3FF
	mov r8, r2
	mov r0, r8
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r2, #0
	orrs r0, r7
	strh r0, [r5, #8]
	ldr r4, _0805E230 @ =0x02000010
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	cmp r1, #0
	beq _0805E1EC
	mov r0, r8
	ldrh r2, [r1, #8]
	ands r0, r2
	orrs r0, r7
	strh r0, [r1, #8]
_0805E1EC:
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805E234 @ =0x0000FFE0
	ldrh r1, [r6, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0805E238 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #0x3c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E214: .4byte 0x0201774C
_0805E218: .4byte 0x08C1252C
_0805E21C: .4byte 0x081EEB58
_0805E220: .4byte 0x08C12544
_0805E224: .4byte 0x082708D0
_0805E228: .4byte gDispIo
_0805E22C: .4byte 0x0000F3FF
_0805E230: .4byte 0x02000010
_0805E234: .4byte 0x0000FFE0
_0805E238: .4byte 0x0000E0FF

	thumb_func_start sub_0805E23C
sub_0805E23C: @ 0x0805E23C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x5c]
	adds r0, r6, #0
	bl GetAnimAnotherSide
	adds r7, r0, #0
	ldr r4, _0805E298 @ =0x02000010
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _0805E26C
	ldr r0, _0805E29C @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_0805E26C:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805E2A0
	ldr r1, [r5, #0x4c]
	ldr r2, [r5, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r7, #0
	bl SpellFx_WriteBgMap
	b _0805E30A
	.align 2, 0
_0805E298: .4byte 0x02000010
_0805E29C: .4byte 0x0000F3FF
_0805E2A0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805E30A
	bl SpellFx_ClearBG1
	ldr r1, _0805E310 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, _0805E314 @ =gDispIo
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
	ldr r2, _0805E318 @ =0x0000F3FF
	adds r0, r2, #0
	ldrh r3, [r6, #8]
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r6, #8]
	cmp r4, #0
	beq _0805E300
	adds r0, r2, #0
	ldrh r2, [r4, #8]
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #8]
_0805E300:
	bl SpellFx_ClearColorEffects
	adds r0, r5, #0
	bl Proc_Break
_0805E30A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E310: .4byte 0x0201774C
_0805E314: .4byte gDispIo
_0805E318: .4byte 0x0000F3FF

	thumb_func_start sub_0805E31C
sub_0805E31C: @ 0x0805E31C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805E348 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E34C @ =0x08C12548
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0805E350 @ =0x081EEB5E
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805E358
	ldr r0, _0805E354 @ =0x0827045C
	b _0805E35A
	.align 2, 0
_0805E348: .4byte 0x0201774C
_0805E34C: .4byte 0x08C12548
_0805E350: .4byte 0x081EEB5E
_0805E354: .4byte 0x0827045C
_0805E358:
	ldr r0, _0805E364 @ =0x08273448
_0805E35A:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E364: .4byte 0x08273448

	thumb_func_start sub_0805E368
sub_0805E368: @ 0x0805E368
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805E38E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805E3A4
_0805E38E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805E3A4
	ldr r1, _0805E3AC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805E3A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3AC: .4byte 0x0201774C

	thumb_func_start sub_0805E3B0
sub_0805E3B0: @ 0x0805E3B0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805E3E8 @ =0x08C12568
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3E8: .4byte 0x08C12568

	thumb_func_start sub_0805E3EC
sub_0805E3EC: @ 0x0805E3EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E422
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805E422:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _0805E498
	adds r0, r6, #0
	bl sub_0805E510
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_080566F0
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl sub_080566F0
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_080566F0
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl sub_080566F0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl sub_080566F0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xfd
	movs r3, #1
	bl PlaySFX
	b _0805E504
_0805E498:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne _0805E4A8
	adds r0, r6, #0
	bl sub_0805E5C8
	b _0805E504
_0805E4A8:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _0805E4BE
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl sub_0804FD74
	b _0805E504
_0805E4BE:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne _0805E4E4
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_08050BBC
	adds r0, r6, #0
	movs r1, #0
	bl sub_0804FFEC
	b _0805E504
_0805E4E4:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _0805E504
	movs r0, #2
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805E504:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805E510
sub_0805E510: @ 0x0805E510
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E54C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E550 @ =0x08C12580
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E554 @ =0x081EEC3C
	str r1, [r0, #0x48]
	ldr r1, _0805E558 @ =0x08C12598
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805E55C @ =0x08C125CC
	str r1, [r0, #0x54]
	ldr r0, _0805E560 @ =0x08275ECC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E54C: .4byte 0x0201774C
_0805E550: .4byte 0x08C12580
_0805E554: .4byte 0x081EEC3C
_0805E558: .4byte 0x08C12598
_0805E55C: .4byte 0x08C125CC
_0805E560: .4byte 0x08275ECC

	thumb_func_start sub_0805E564
sub_0805E564: @ 0x0805E564
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805E5A0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0805E5BE
_0805E5A0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805E5BE
	bl SpellFx_ClearBG1
	ldr r1, _0805E5C4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805E5BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E5C4: .4byte 0x0201774C

	thumb_func_start sub_0805E5C8
sub_0805E5C8: @ 0x0805E5C8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805E604 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E608 @ =0x08C12600
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0805E60C @ =0x08C33390
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E610
	ldrh r0, [r6, #2]
	subs r0, #8
	b _0805E614
	.align 2, 0
_0805E604: .4byte 0x0201774C
_0805E608: .4byte 0x08C12600
_0805E60C: .4byte 0x08C33390
_0805E610:
	ldrh r0, [r6, #2]
	adds r0, #8
_0805E614:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, _0805E638 @ =0x0827BE0C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E63C @ =0x0827BC24
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805E638: .4byte 0x0827BE0C
_0805E63C: .4byte 0x0827BC24

	thumb_func_start sub_0805E640
sub_0805E640: @ 0x0805E640
	ldr r1, _0805E64C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E64C: .4byte 0x0201774C

	thumb_func_start sub_0805E650
sub_0805E650: @ 0x0805E650
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805E688 @ =0x08C12620
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E688: .4byte 0x08C12620

	thumb_func_start sub_0805E68C
sub_0805E68C: @ 0x0805E68C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E6D0
	ldr r0, [r4, #0x5c]
	bl sub_0805E878
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xfa
	movs r3, #1
	bl PlaySFX
_0805E6D0:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x29
	bne _0805E6E2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _0805E786
_0805E6E2:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x44
	cmp r1, r0
	bne _0805E716
	ldr r0, [r4, #0x5c]
	bl sub_0805E794
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xfb
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0x42
	movs r2, #0x14
	movs r3, #0x10
	bl sub_080566F0
	b _0805E786
_0805E716:
	adds r0, r6, #0
	adds r0, #0x86
	cmp r1, r0
	bne _0805E768
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r0, #0xfc
	movs r3, #1
	bl PlaySFX
	bl StopBGM1
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r5, #0
	bl sub_08050BBC
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_0804F7B8
	ldrb r0, [r6]
	cmp r0, #0
	bne _0805E786
	adds r0, r5, #0
	bl sub_0805001C
	cmp r0, #0
	bne _0805E786
	adds r0, r5, #0
	movs r1, #3
	bl sub_0804FFEC
	b _0805E786
_0805E768:
	adds r0, r6, #0
	adds r0, #0x9e
	cmp r1, r0
	bne _0805E786
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805E786:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805E794
sub_0805E794: @ 0x0805E794
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805E7F4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E7F8 @ =0x08C12638
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805E7FC @ =0x081EEC72
	str r0, [r5, #0x48]
	ldr r0, _0805E800 @ =0x08C12650
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805E804 @ =0x08278A10
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805E808 @ =0x08276B04
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805E80C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E81A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E810
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805E81A
	.align 2, 0
_0805E7F4: .4byte 0x0201774C
_0805E7F8: .4byte 0x08C12638
_0805E7FC: .4byte 0x081EEC72
_0805E800: .4byte 0x08C12650
_0805E804: .4byte 0x08278A10
_0805E808: .4byte 0x08276B04
_0805E80C: .4byte gEkrDistanceType
_0805E810:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805E81A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805E820
sub_0805E820: @ 0x0805E820
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805E84E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805E86C
_0805E84E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805E86C
	bl SpellFx_ClearBG1
	ldr r1, _0805E874 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805E86C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E874: .4byte 0x0201774C

	thumb_func_start sub_0805E878
sub_0805E878: @ 0x0805E878
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E8BC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E8C0 @ =0x08C12698
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E8C4 @ =0x08C3365C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _0805E8C8 @ =0x08278A10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E8CC @ =0x082784F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E8BC: .4byte 0x0201774C
_0805E8C0: .4byte 0x08C12698
_0805E8C4: .4byte 0x08C3365C
_0805E8C8: .4byte 0x08278A10
_0805E8CC: .4byte 0x082784F0

	thumb_func_start sub_0805E8D0
sub_0805E8D0: @ 0x0805E8D0
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0805E8E4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805E8E4: .4byte 0x0201774C

	thumb_func_start sub_0805E8E8
sub_0805E8E8: @ 0x0805E8E8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805E920 @ =0x08C126B8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E920: .4byte 0x08C126B8

	thumb_func_start sub_0805E924
sub_0805E924: @ 0x0805E924
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E968
	ldr r0, [r4, #0x5c]
	bl sub_0805EB08
	ldr r0, _0805E9BC @ =0x0000011B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0805E968:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x64
	bne _0805E978
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805E978:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #0
	adds r0, #0x82
	cmp r1, r0
	bne _0805E9C0
	adds r0, r5, #0
	bl sub_0805EB60
	adds r0, r5, #0
	bl sub_0805EBB4
	ldr r0, [r4, #0x5c]
	bl sub_0805EA24
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl sub_080566F0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xe6
	movs r2, #0x14
	movs r3, #0x10
	bl sub_080566F0
	b _0805EA16
	.align 2, 0
_0805E9BC: .4byte 0x0000011B
_0805E9C0:
	movs r3, #0xa5
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne _0805E9F6
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050BBC
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805EA16
	adds r0, r5, #0
	bl sub_0805001C
	cmp r0, #0
	bne _0805EA16
	adds r0, r5, #0
	movs r1, #2
	bl sub_0804FFEC
	b _0805EA16
_0805E9F6:
	movs r2, #0xb9
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805EA16
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805EA16:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805EA24
sub_0805EA24: @ 0x0805EA24
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805EA84 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EA88 @ =0x08C126D0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805EA8C @ =0x081EECBC
	str r0, [r5, #0x48]
	ldr r0, _0805EA90 @ =0x08C126E8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805EA94 @ =0x0827AE44
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805EA98 @ =0x08279F78
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805EA9C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805EAAA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805EAA0
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805EAAA
	.align 2, 0
_0805EA84: .4byte 0x0201774C
_0805EA88: .4byte 0x08C126D0
_0805EA8C: .4byte 0x081EECBC
_0805EA90: .4byte 0x08C126E8
_0805EA94: .4byte 0x0827AE44
_0805EA98: .4byte 0x08279F78
_0805EA9C: .4byte gEkrDistanceType
_0805EAA0:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805EAAA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805EAB0
sub_0805EAB0: @ 0x0805EAB0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805EADE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805EAFC
_0805EADE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805EAFC
	bl SpellFx_ClearBG1
	ldr r1, _0805EB04 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805EAFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB04: .4byte 0x0201774C

	thumb_func_start sub_0805EB08
sub_0805EB08: @ 0x0805EB08
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805EB4C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EB50 @ =0x08C12728
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805EB54 @ =0x08C3B52C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _0805EB58 @ =0x0827BE0C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EB5C @ =0x0827BC24
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB4C: .4byte 0x0201774C
_0805EB50: .4byte 0x08C12728
_0805EB54: .4byte 0x08C3B52C
_0805EB58: .4byte 0x0827BE0C
_0805EB5C: .4byte 0x0827BC24

	thumb_func_start sub_0805EB60
sub_0805EB60: @ 0x0805EB60
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805EB98 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EB9C @ =0x08C12748
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805EBA0 @ =0x08C3B3AC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #8
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB98: .4byte 0x0201774C
_0805EB9C: .4byte 0x08C12748
_0805EBA0: .4byte 0x08C3B3AC

	thumb_func_start sub_0805EBA4
sub_0805EBA4: @ 0x0805EBA4
	ldr r1, _0805EBB0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805EBB0: .4byte 0x0201774C

	thumb_func_start sub_0805EBB4
sub_0805EBB4: @ 0x0805EBB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805EBD0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EBD4 @ =0x08C12768
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EBD0: .4byte 0x0201774C
_0805EBD4: .4byte 0x08C12768

	thumb_func_start sub_0805EBD8
sub_0805EBD8: @ 0x0805EBD8
	push {r4, lr}
	movs r3, #0x8e
	lsls r3, r3, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r0, #0x5c]
	movs r4, #2
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	movs r3, #1
	bl PlaySFX
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805EBF8
sub_0805EBF8: @ 0x0805EBF8
	ldr r1, _0805EC04 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805EC04: .4byte 0x0201774C

	thumb_func_start sub_0805EC08
sub_0805EC08: @ 0x0805EC08
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805EC40 @ =0x08C127B0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EC40: .4byte 0x08C127B0

	thumb_func_start sub_0805EC44
sub_0805EC44: @ 0x0805EC44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805EC7A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805EC7A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _0805ECF4
	adds r0, r6, #0
	bl sub_0805ED64
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_080566F0
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl sub_080566F0
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_080566F0
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl sub_080566F0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl sub_080566F0
	ldr r0, _0805ECF0 @ =0x00000103
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl PlaySFX
	b _0805ED58
	.align 2, 0
_0805ECF0: .4byte 0x00000103
_0805ECF4:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne _0805ED04
	adds r0, r6, #0
	bl sub_0805EE1C
	b _0805ED58
_0805ED04:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _0805ED1A
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl sub_0804FD74
	b _0805ED58
_0805ED1A:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne _0805ED38
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_08050BBC
	b _0805ED58
_0805ED38:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _0805ED58
	movs r0, #2
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805ED58:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805ED64
sub_0805ED64: @ 0x0805ED64
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805EDA0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EDA4 @ =0x08C127C8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805EDA8 @ =0x081EEDBE
	str r1, [r0, #0x48]
	ldr r1, _0805EDAC @ =0x08C127E0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805EDB0 @ =0x08C12814
	str r1, [r0, #0x54]
	ldr r0, _0805EDB4 @ =0x08278A30
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EDA0: .4byte 0x0201774C
_0805EDA4: .4byte 0x08C127C8
_0805EDA8: .4byte 0x081EEDBE
_0805EDAC: .4byte 0x08C127E0
_0805EDB0: .4byte 0x08C12814
_0805EDB4: .4byte 0x08278A30

	thumb_func_start sub_0805EDB8
sub_0805EDB8: @ 0x0805EDB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805EDF4
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0805EE12
_0805EDF4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805EE12
	bl SpellFx_ClearBG1
	ldr r1, _0805EE18 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805EE12:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE18: .4byte 0x0201774C

	thumb_func_start sub_0805EE1C
sub_0805EE1C: @ 0x0805EE1C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805EE60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EE64 @ =0x08C12848
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805EE68 @ =0x08C36340
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _0805EE6C @ =0x0827BE2C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EE70 @ =0x0827BC24
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE60: .4byte 0x0201774C
_0805EE64: .4byte 0x08C12848
_0805EE68: .4byte 0x08C36340
_0805EE6C: .4byte 0x0827BE2C
_0805EE70: .4byte 0x0827BC24

	thumb_func_start sub_0805EE74
sub_0805EE74: @ 0x0805EE74
	ldr r1, _0805EE80 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805EE80: .4byte 0x0201774C

	thumb_func_start sub_0805EE84
sub_0805EE84: @ 0x0805EE84
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805EEBC @ =0x08C12868
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EEBC: .4byte 0x08C12868

	thumb_func_start sub_0805EEC0
sub_0805EEC0: @ 0x0805EEC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805EEEE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805EEEE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805EF3C
	adds r0, r5, #0
	bl sub_0805F1C4
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_0805EFA0
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_0805F124
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_080560A4
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl sub_080565FC
	movs r1, #2
	ldrsh r2, [r5, r1]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl PlaySFX
	b _0805EF96
_0805EF3C:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne _0805EF78
	adds r0, r5, #0
	movs r1, #5
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050BBC
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805EF96
	adds r0, r5, #0
	bl sub_0805001C
	cmp r0, #0
	bne _0805EF96
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804FFEC
	b _0805EF96
_0805EF78:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _0805EF96
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805EF96:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805EFA0
sub_0805EFA0: @ 0x0805EFA0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805F098 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F09C @ =0x08C12880
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _0805F0A0 @ =0x0827BE4C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805F0A4 @ =0x08279658
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805F0A8 @ =0x08279758
	ldr r1, _0805F0AC @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805F0B0 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r4, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
	mov r6, ip
	adds r6, #0x37
	movs r3, #0x20
	ldrb r1, [r6]
	orrs r1, r3
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r7, ip
	strb r0, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6]
	ldr r0, _0805F0B4 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0805F0B8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, ip
	adds r0, #0x3d
	ldrb r7, [r0]
	orrs r3, r7
	strb r3, [r0]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _0805F0BC @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F098: .4byte 0x0201774C
_0805F09C: .4byte 0x08C12880
_0805F0A0: .4byte 0x0827BE4C
_0805F0A4: .4byte 0x08279658
_0805F0A8: .4byte 0x08279758
_0805F0AC: .4byte gBg1Tm
_0805F0B0: .4byte gDispIo
_0805F0B4: .4byte 0x0000FFE0
_0805F0B8: .4byte 0x0000E0FF
_0805F0BC: .4byte 0x0000F3FF

	thumb_func_start sub_0805F0C0
sub_0805F0C0: @ 0x0805F0C0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _0805F114 @ =gDispIo
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805F10C
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r0, [r5, #0x1c]
	ldr r1, _0805F118 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _0805F11C @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	ldr r1, _0805F120 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805F10C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F114: .4byte gDispIo
_0805F118: .4byte 0xFFFFF7FF
_0805F11C: .4byte 0x0000F3FF
_0805F120: .4byte 0x0201774C

	thumb_func_start sub_0805F124
sub_0805F124: @ 0x0805F124
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805F148 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F14C @ =0x08C12898
	movs r1, #4
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F148: .4byte 0x0201774C
_0805F14C: .4byte 0x08C12898

	thumb_func_start sub_0805F150
sub_0805F150: @ 0x0805F150
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _0805F1AC @ =0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _0805F1B0 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805F1A2
	adds r0, r4, #0
	bl Proc_Break
_0805F1A2:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1AC: .4byte 0xFFFFF7FF
_0805F1B0: .4byte 0x0000F3FF

	thumb_func_start sub_0805F1B4
sub_0805F1B4: @ 0x0805F1B4
	ldr r1, _0805F1C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805F1C0: .4byte 0x0201774C

	thumb_func_start sub_0805F1C4
sub_0805F1C4: @ 0x0805F1C4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805F20C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F210 @ =0x08C128B8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _0805F214 @ =0x08C10828
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r1, _0805F218 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F20C: .4byte 0x0201774C
_0805F210: .4byte 0x08C128B8
_0805F214: .4byte 0x08C10828
_0805F218: .4byte 0x0000F3FF

	thumb_func_start sub_0805F21C
sub_0805F21C: @ 0x0805F21C
	push {lr}
	ldr r2, _0805F230 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805F230: .4byte 0x0201774C

	thumb_func_start sub_0805F234
sub_0805F234: @ 0x0805F234
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F264 @ =0x08C3BAE0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F268 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F26C @ =0x0827BE6C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F264: .4byte 0x08C3BAE0
_0805F268: .4byte 0x0827C724
_0805F26C: .4byte 0x0827BE6C

	thumb_func_start sub_0805F270
sub_0805F270: @ 0x0805F270
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F2A0 @ =0x08C3BAF4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F2A4 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F2A8 @ =0x0827BE6C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2A0: .4byte 0x08C3BAF4
_0805F2A4: .4byte 0x0827C724
_0805F2A8: .4byte 0x0827BE6C

	thumb_func_start sub_0805F2AC
sub_0805F2AC: @ 0x0805F2AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F2DC @ =0x08C3BB08
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F2E0 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F2E4 @ =0x0827BE6C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2DC: .4byte 0x08C3BB08
_0805F2E0: .4byte 0x0827C724
_0805F2E4: .4byte 0x0827BE6C

	thumb_func_start sub_0805F2E8
sub_0805F2E8: @ 0x0805F2E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F318 @ =0x08C3BB1C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F31C @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F320 @ =0x0827BE6C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F318: .4byte 0x08C3BB1C
_0805F31C: .4byte 0x0827C724
_0805F320: .4byte 0x0827BE6C

	thumb_func_start sub_0805F324
sub_0805F324: @ 0x0805F324
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F354 @ =0x08C3BB30
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F358 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F35C @ =0x0827BE6C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F354: .4byte 0x08C3BB30
_0805F358: .4byte 0x0827C724
_0805F35C: .4byte 0x0827BE6C

	thumb_func_start sub_0805F360
sub_0805F360: @ 0x0805F360
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F390 @ =0x08C3BEA4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F394 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F398 @ =0x0827C304
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F390: .4byte 0x08C3BEA4
_0805F394: .4byte 0x0827C724
_0805F398: .4byte 0x0827C304

	thumb_func_start sub_0805F39C
sub_0805F39C: @ 0x0805F39C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F3CC @ =0x08C3BEB0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F3D0 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F3D4 @ =0x0827C304
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F3CC: .4byte 0x08C3BEB0
_0805F3D0: .4byte 0x0827C724
_0805F3D4: .4byte 0x0827C304

	thumb_func_start sub_0805F3D8
sub_0805F3D8: @ 0x0805F3D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F408 @ =0x08C3BEBC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F40C @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F410 @ =0x0827C304
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F408: .4byte 0x08C3BEBC
_0805F40C: .4byte 0x0827C724
_0805F410: .4byte 0x0827C304

	thumb_func_start sub_0805F414
sub_0805F414: @ 0x0805F414
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F444 @ =0x08C3BEC8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F448 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F44C @ =0x0827C304
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F444: .4byte 0x08C3BEC8
_0805F448: .4byte 0x0827C724
_0805F44C: .4byte 0x0827C304

	thumb_func_start sub_0805F450
sub_0805F450: @ 0x0805F450
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F480 @ =0x08C3BED4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F484 @ =0x0827C724
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F488 @ =0x0827C304
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F480: .4byte 0x08C3BED4
_0805F484: .4byte 0x0827C724
_0805F488: .4byte 0x0827C304

	thumb_func_start sub_0805F48C
sub_0805F48C: @ 0x0805F48C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805F4C4 @ =0x08C12970
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F4C4: .4byte 0x08C12970

	thumb_func_start sub_0805F4C8
sub_0805F4C8: @ 0x0805F4C8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805F4F4
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805F4F4:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805F524
	ldr r0, [r5, #0x5c]
	bl sub_0805F594
	adds r0, r4, #0
	bl sub_0805F648
	adds r0, r4, #0
	bl sub_0805F6A0
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl PlaySFX
	b _0805F58E
_0805F524:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq _0805F534
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne _0805F53C
_0805F534:
	adds r0, r4, #0
	bl sub_0805F6A0
	b _0805F58E
_0805F53C:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _0805F552
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl sub_0804FD74
	b _0805F58E
_0805F552:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _0805F570
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_08050BBC
	b _0805F58E
_0805F570:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne _0805F58E
	movs r0, #2
	ldrh r3, [r4, #0x10]
	orrs r0, r3
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r5, #0
	bl Proc_Break
_0805F58E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805F594
sub_0805F594: @ 0x0805F594
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F5D8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F5DC @ =0x08C12988
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805F5E0 @ =0x081EEDF4
	str r1, [r0, #0x48]
	ldr r1, _0805F5E4 @ =0x08C129A0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805F5E8 @ =0x0827D0F0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805F5EC @ =0x0827C864
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F5D8: .4byte 0x0201774C
_0805F5DC: .4byte 0x08C12988
_0805F5E0: .4byte 0x081EEDF4
_0805F5E4: .4byte 0x08C129A0
_0805F5E8: .4byte 0x0827D0F0
_0805F5EC: .4byte 0x0827C864

	thumb_func_start sub_0805F5F0
sub_0805F5F0: @ 0x0805F5F0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805F61E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805F63C
_0805F61E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805F63C
	bl SpellFx_ClearBG1
	ldr r1, _0805F644 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805F63C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F644: .4byte 0x0201774C

	thumb_func_start sub_0805F648
sub_0805F648: @ 0x0805F648
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805F68C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F690 @ =0x08C129B4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805F694 @ =0x08C3FF94
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _0805F698 @ =0x0827D600
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F69C @ =0x0827BC24
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F68C: .4byte 0x0201774C
_0805F690: .4byte 0x08C129B4
_0805F694: .4byte 0x08C3FF94
_0805F698: .4byte 0x0827D600
_0805F69C: .4byte 0x0827BC24

	thumb_func_start sub_0805F6A0
sub_0805F6A0: @ 0x0805F6A0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805F6D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F6D8 @ =0x08C129D4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805F6DC @ =0x08C400E4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F6D4: .4byte 0x0201774C
_0805F6D8: .4byte 0x08C129D4
_0805F6DC: .4byte 0x08C400E4

	thumb_func_start sub_0805F6E0
sub_0805F6E0: @ 0x0805F6E0
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0805F6F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805F6F4: .4byte 0x0201774C

	thumb_func_start sub_0805F6F8
sub_0805F6F8: @ 0x0805F6F8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805F730 @ =0x08C129F4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F730: .4byte 0x08C129F4

	thumb_func_start sub_0805F734
sub_0805F734: @ 0x0805F734
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805F75E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0805F75E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805F772
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804F7B8
	b _0805F800
_0805F772:
	adds r0, r6, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0805F794
	adds r0, r5, #0
	bl sub_0805F8C4
	movs r0, #0xaf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805F800
_0805F794:
	adds r0, r6, #0
	adds r0, #0x17
	cmp r1, r0
	bne _0805F7AC
	adds r0, r5, #0
	movs r1, #5
	bl sub_0804F7B8
	adds r0, r5, #0
	bl sub_0805FA70
	b _0805F800
_0805F7AC:
	adds r0, r6, #0
	adds r0, #0x1d
	cmp r1, r0
	bne _0805F7C2
	adds r0, r5, #0
	bl sub_0805F808
	adds r0, r5, #0
	bl sub_0805F9E4
	b _0805F800
_0805F7C2:
	adds r0, r6, #0
	adds r0, #0x1e
	cmp r1, r0
	bne _0805F7EA
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805F800
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805F800
_0805F7EA:
	adds r0, r6, #0
	adds r0, #0x23
	cmp r1, r0
	bne _0805F800
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0805F800:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805F808
sub_0805F808: @ 0x0805F808
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F848 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F84C @ =0x08C12A0C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805F850 @ =0x081EEEBE
	str r1, [r0, #0x48]
	ldr r1, _0805F854 @ =0x08C12A24
	str r1, [r0, #0x4c]
	ldr r1, _0805F858 @ =0x08C12A28
	str r1, [r0, #0x50]
	ldr r1, _0805F85C @ =0x08C12A2C
	str r1, [r0, #0x54]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F848: .4byte 0x0201774C
_0805F84C: .4byte 0x08C12A0C
_0805F850: .4byte 0x081EEEBE
_0805F854: .4byte 0x08C12A24
_0805F858: .4byte 0x08C12A28
_0805F85C: .4byte 0x08C12A2C

	thumb_func_start sub_0805F860
sub_0805F860: @ 0x0805F860
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805F89C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _0805F8BA
_0805F89C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805F8BA
	bl SpellFx_ClearBG1
	ldr r1, _0805F8C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0805F8BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F8C0: .4byte 0x0201774C

	thumb_func_start sub_0805F8C4
sub_0805F8C4: @ 0x0805F8C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F920 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F924 @ =0x08C12A30
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805F928 @ =0x081EEEC4
	str r0, [r5, #0x48]
	ldr r0, _0805F92C @ =0x08C12A48
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805F930 @ =0x082965C8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805F934 @ =0x082962EC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805F938 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F946
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F93C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805F946
	.align 2, 0
_0805F920: .4byte 0x0201774C
_0805F924: .4byte 0x08C12A30
_0805F928: .4byte 0x081EEEC4
_0805F92C: .4byte 0x08C12A48
_0805F930: .4byte 0x082965C8
_0805F934: .4byte 0x082962EC
_0805F938: .4byte gEkrDistanceType
_0805F93C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805F946:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805F950
sub_0805F950: @ 0x0805F950
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805F9B8
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0805F998 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F9D6
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805F9A0
	ldr r0, _0805F99C @ =gBg1Tm
	b _0805F9A4
	.align 2, 0
_0805F998: .4byte gEkrDistanceType
_0805F99C: .4byte gBg1Tm
_0805F9A0:
	ldr r0, _0805F9B4 @ =0x0202349A
	movs r1, #0
_0805F9A4:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805F9D6
	.align 2, 0
_0805F9B4: .4byte 0x0202349A
_0805F9B8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805F9D6
	bl SpellFx_ClearBG1
	ldr r1, _0805F9E0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805F9D6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9E0: .4byte 0x0201774C

	thumb_func_start sub_0805F9E4
sub_0805F9E4: @ 0x0805F9E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FA18 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FA1C @ =0x08C12A6C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0805FA20 @ =0x081EEEEA
	str r1, [r0, #0x48]
	ldr r1, _0805FA24 @ =0x08295974
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA18: .4byte 0x0201774C
_0805FA1C: .4byte 0x08C12A6C
_0805FA20: .4byte 0x081EEEEA
_0805FA24: .4byte 0x08295974

	thumb_func_start sub_0805FA28
sub_0805FA28: @ 0x0805FA28
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805FA4E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805FA64
_0805FA4E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805FA64
	ldr r1, _0805FA6C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805FA64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA6C: .4byte 0x0201774C

	thumb_func_start sub_0805FA70
sub_0805FA70: @ 0x0805FA70
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FAA8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FAAC @ =0x08C12A8C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #2
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	ldr r0, _0805FAB0 @ =0x082972A0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805FAB4 @ =0x08296FDC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAA8: .4byte 0x0201774C
_0805FAAC: .4byte 0x08C12A8C
_0805FAB0: .4byte 0x082972A0
_0805FAB4: .4byte 0x08296FDC

	thumb_func_start sub_0805FAB8
sub_0805FAB8: @ 0x0805FAB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805FB54
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805FB08
	ldr r0, [r5, #0x5c]
	movs r4, #2
	ldrsh r3, [r0, r4]
	ldr r4, _0805FB04 @ =0x08C12AA4
	movs r6, #0x30
	ldrsh r2, [r5, r6]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	adds r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl sub_0805FB64
	b _0805FB34
	.align 2, 0
_0805FB04: .4byte 0x08C12AA4
_0805FB08:
	ldr r0, [r5, #0x5c]
	movs r6, #2
	ldrsh r3, [r0, r6]
	ldr r4, _0805FB5C @ =0x08C12AA4
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	subs r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl sub_0805FB64
_0805FB34:
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x30]
	adds r0, #2
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0805FB54
	ldr r1, _0805FB60 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805FB54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB5C: .4byte 0x08C12AA4
_0805FB60: .4byte 0x0201774C

	thumb_func_start sub_0805FB64
sub_0805FB64: @ 0x0805FB64
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805FBB0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FBB4 @ =0x08C12AB4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x46
	strh r0, [r4, #0x2e]
	ldr r3, _0805FBB8 @ =0x08C41AF8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FBB0: .4byte 0x0201774C
_0805FBB4: .4byte 0x08C12AB4
_0805FBB8: .4byte 0x08C41AF8

	thumb_func_start sub_0805FBBC
sub_0805FBBC: @ 0x0805FBBC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	bne _0805FBDE
	ldr r1, _0805FBE4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0805FBDE:
	pop {r0}
	bx r0
	.align 2, 0
_0805FBE4: .4byte 0x0201774C

	thumb_func_start sub_0805FBE8
sub_0805FBE8: @ 0x0805FBE8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _0805FC20 @ =0x08C12ACC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FC20: .4byte 0x08C12ACC

	thumb_func_start sub_0805FC24
sub_0805FC24: @ 0x0805FC24
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805FC58
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl sub_0804EC74
_0805FC58:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805FCF4
	adds r0, r5, #0
	bl sub_0805FE20
	ldr r6, _0805FCEC @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r1, r6, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r7, [r1]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl sub_080566F0
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0xf
	adds r3, r4, #0
	bl sub_080560A4
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x14
	bl sub_0806052C
	movs r1, #0x20
	ldrsh r2, [r6, r1]
	adds r0, r5, #0
	movs r1, #0x14
	movs r3, #0
	bl sub_080564B8
	ldr r0, _0805FCF0 @ =0x000002BD
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #1
	bl PlaySFX
	b _0805FE12
	.align 2, 0
_0805FCEC: .4byte gDispIo
_0805FCF0: .4byte 0x000002BD
_0805FCF4:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _0805FD24
	bl sub_0805FED4
	adds r0, r5, #0
	movs r1, #0x15
	movs r2, #1
	bl sub_080565FC
	adds r0, r5, #0
	bl sub_080602D0
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0x10
	bl sub_080566F0
	b _0805FE12
_0805FD24:
	adds r0, r4, #0
	adds r0, #0x37
	cmp r1, r0
	bne _0805FD44
	ldr r0, _0805FD40 @ =0x000002BE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #0
	bl PlaySFX
	b _0805FE12
	.align 2, 0
_0805FD40: .4byte 0x000002BE
_0805FD44:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805FDB0
	adds r0, r5, #0
	movs r1, #0x41
	bl sub_08060014
	adds r0, r5, #0
	movs r1, #0x41
	bl sub_08060150
	ldr r3, _0805FDAC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl sub_080566F0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #2
	movs r3, #0x80
	bl sub_080560A4
	adds r0, r5, #0
	movs r1, #0x44
	movs r2, #0
	bl sub_080565FC
	b _0805FE12
	.align 2, 0
_0805FDAC: .4byte gDispIo
_0805FDB0:
	adds r0, r4, #0
	adds r0, #0x87
	cmp r1, r0
	bne _0805FDE2
	adds r0, r5, #0
	movs r1, #5
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805FE12
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805FE12
_0805FDE2:
	adds r0, r4, #0
	adds r0, #0x8c
	cmp r1, r0
	bne _0805FDFC
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r6, #0x5c]
	bl sub_080601E8
	b _0805FE12
_0805FDFC:
	adds r0, r4, #0
	adds r0, #0xbe
	cmp r1, r0
	bne _0805FE12
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
_0805FE12:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805FE20
sub_0805FE20: @ 0x0805FE20
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FE64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FE68 @ =0x08C12AE4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805FE6C @ =0x081EEF04
	str r1, [r0, #0x48]
	ldr r1, _0805FE70 @ =0x08C12AFC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805FE74 @ =0x08297D90
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805FE78 @ =0x082972C0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FE64: .4byte 0x0201774C
_0805FE68: .4byte 0x08C12AE4
_0805FE6C: .4byte 0x081EEF04
_0805FE70: .4byte 0x08C12AFC
_0805FE74: .4byte 0x08297D90
_0805FE78: .4byte 0x082972C0

	thumb_func_start sub_0805FE7C
sub_0805FE7C: @ 0x0805FE7C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805FEAA
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805FEC8
_0805FEAA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805FEC8
	bl SpellFx_ClearBG1
	ldr r1, _0805FED0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805FEC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FED0: .4byte 0x0201774C

	thumb_func_start sub_0805FED4
sub_0805FED4: @ 0x0805FED4
	push {lr}
	ldr r0, _0805FEF0 @ =0x08C12B00
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl sub_0805FFB0
	pop {r0}
	bx r0
	.align 2, 0
_0805FEF0: .4byte 0x08C12B00

	thumb_func_start sub_0805FEF4
sub_0805FEF4: @ 0x0805FEF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r0, _0805FF58 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r5, _0805FF5C @ =0x0201FB2C
	cmp r0, #0
	bne _0805FF0A
	ldr r5, _0805FF60 @ =0x0201FC6C
_0805FF0A:
	ldr r3, _0805FF64 @ =0x0201FDB8
	cmp r0, #0
	bne _0805FF12
	ldr r3, _0805FF68 @ =0x0201FEF8
_0805FF12:
	movs r4, #0
	movs r6, #0
	ldr r0, _0805FF6C @ =0x08C12B30
	movs r1, #0xe0
	lsls r1, r1, #0xf
	mov r8, r1
	movs r2, #0x70
	mov ip, r2
	adds r7, r0, #0
	subs r7, #0x20
_0805FF26:
	cmp r4, #0xf
	bls _0805FF84
	cmp r4, #0x6f
	bhi _0805FF84
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, sb
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0805FF7C
	cmp r4, #0x3f
	bhi _0805FF74
	adds r0, r4, #0
	subs r0, #0x70
	cmp r1, r0
	bhs _0805FF7C
	ldr r1, _0805FF70 @ =0x0000FF90
	adds r0, r4, r1
	lsls r0, r0, #0x10
	b _0805FF7A
	.align 2, 0
_0805FF58: .4byte 0x0201FDAC
_0805FF5C: .4byte 0x0201FB2C
_0805FF60: .4byte 0x0201FC6C
_0805FF64: .4byte 0x0201FDB8
_0805FF68: .4byte 0x0201FEF8
_0805FF6C: .4byte 0x08C12B30
_0805FF70: .4byte 0x0000FF90
_0805FF74:
	cmp r1, ip
	bls _0805FF7C
	mov r0, r8
_0805FF7A:
	lsrs r2, r0, #0x10
_0805FF7C:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r3]
	b _0805FF8A
_0805FF84:
	strh r6, [r5]
	adds r5, #2
	strh r6, [r3]
_0805FF8A:
	adds r3, #2
	ldr r1, _0805FFAC @ =0xFFFF0000
	add r8, r1
	movs r2, #1
	rsbs r2, r2, #0
	add ip, r2
	adds r7, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _0805FF26
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FFAC: .4byte 0xFFFF0000

	thumb_func_start sub_0805FFB0
sub_0805FFB0: @ 0x0805FFB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805FFCC @ =0x08C12B18
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FFCC: .4byte 0x08C12B18

	thumb_func_start sub_0805FFD0
sub_0805FFD0: @ 0x0805FFD0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806000C
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806000C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08060014
sub_08060014: @ 0x08060014
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060078 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806007C @ =0x08C12BF0
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	ldr r0, _08060080 @ =0x08297EE0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060084 @ =0x08298640
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08060088 @ =0x08298820
	ldr r4, _0806008C @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060094
	ldr r1, _08060090 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	b _080600A8
	.align 2, 0
_08060078: .4byte 0x0201774C
_0806007C: .4byte 0x08C12BF0
_08060080: .4byte 0x08297EE0
_08060084: .4byte 0x08298640
_08060088: .4byte 0x08298820
_0806008C: .4byte gEkrTsaBuffer
_08060090: .4byte gBg1Tm
_08060094:
	ldr r1, _080600D4 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBG
_080600A8:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _080600D8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080600E6
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080600DC
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _080600E6
	.align 2, 0
_080600D4: .4byte gBg1Tm
_080600D8: .4byte gEkrDistanceType
_080600DC:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_080600E6:
	ldr r2, _08060104 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060104: .4byte gDispIo

	thumb_func_start sub_08060108
sub_08060108: @ 0x08060108
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060120 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060120: .4byte 0x0201774C

	thumb_func_start sub_08060124
sub_08060124: @ 0x08060124
	push {lr}
	adds r2, r0, #0
	ldr r1, _0806014C @ =gDispIo
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08060146
	adds r0, r2, #0
	bl Proc_Break
_08060146:
	pop {r0}
	bx r0
	.align 2, 0
_0806014C: .4byte gDispIo

	thumb_func_start sub_08060150
sub_08060150: @ 0x08060150
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060188 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806018C @ =0x08C12C10
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _08060190 @ =0x081EEF0A
	str r1, [r0, #0x48]
	ldr r1, _08060194 @ =0x08298640
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060188: .4byte 0x0201774C
_0806018C: .4byte 0x08C12C10
_08060190: .4byte 0x081EEF0A
_08060194: .4byte 0x08298640

	thumb_func_start sub_08060198
sub_08060198: @ 0x08060198
	ldr r1, _080601A4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080601A4: .4byte 0x0201774C

	thumb_func_start sub_080601A8
sub_080601A8: @ 0x080601A8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080601CC
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_080601CC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080601E2
	adds r0, r4, #0
	bl Proc_Break
_080601E2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080601E8
sub_080601E8: @ 0x080601E8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060240 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060244 @ =0x08C12C38
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08060248 @ =0x081EEF48
	str r0, [r5, #0x48]
	ldr r0, _0806024C @ =0x08C12C50
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060250 @ =0x08C12C80
	str r0, [r5, #0x54]
	ldr r0, _08060254 @ =0x0829B4C4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08060258 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060266
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806025C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08060266
	.align 2, 0
_08060240: .4byte 0x0201774C
_08060244: .4byte 0x08C12C38
_08060248: .4byte 0x081EEF48
_0806024C: .4byte 0x08C12C50
_08060250: .4byte 0x08C12C80
_08060254: .4byte 0x0829B4C4
_08060258: .4byte gEkrDistanceType
_0806025C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08060266:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0806026C
sub_0806026C: @ 0x0806026C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _080602A8
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _080602C6
_080602A8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _080602C6
	bl SpellFx_ClearBG1
	ldr r1, _080602CC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080602C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080602CC: .4byte 0x0201774C

	thumb_func_start sub_080602D0
sub_080602D0: @ 0x080602D0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_080602D6:
	ldr r0, _08060300 @ =0x08C12CB0
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls _080602D6
	ldr r0, _08060304 @ =0x0829C468
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060308 @ =0x0829C068
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060300: .4byte 0x08C12CB0
_08060304: .4byte 0x0829C468
_08060308: .4byte 0x0829C068

	thumb_func_start sub_0806030C
sub_0806030C: @ 0x0806030C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0806036C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r5, #0
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	ldr r1, [r4, #0x44]
	ldr r0, _08060370 @ =0x00002AAA
	muls r0, r1, r0
	strh r0, [r4, #0x30]
	ldr r3, _08060374 @ =0x08C41D18
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	strh r5, [r0, #6]
	ldr r1, _08060378 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806036C: .4byte 0x0201774C
_08060370: .4byte 0x00002AAA
_08060374: .4byte 0x08C41D18
_08060378: .4byte 0x0000F3FF

	thumb_func_start sub_0806037C
sub_0806037C: @ 0x0806037C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r7, #0x14
	str r7, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x32
	bl Interpolate
	ldrh r2, [r4, #0x30]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r6, #0
	strh r1, [r4, #0x30]
	lsrs r2, r1, #8
	ldr r3, _0806040C @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r4, #0x3a]
	adds r0, r3, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080603E4
	strh r7, [r4, #0x2c]
_080603E4:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08060404
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _08060410 @ =0x08C41F78
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_08060404:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806040C: .4byte gSinLut
_08060410: .4byte 0x08C41F78

	thumb_func_start sub_08060414
sub_08060414: @ 0x08060414
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r3, #0x32
	ldrh r1, [r4, #0x30]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r6, #0
	strh r0, [r4, #0x30]
	lsrs r0, r0, #8
	ldr r2, _0806048C @ =gSinLut
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r1, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r3, r0
	asrs r1, r1, #0xc
	ldrh r2, [r4, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0xc
	ldrh r2, [r4, #0x3a]
	adds r0, r2, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08060464
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
_08060464:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08060484
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _08060490 @ =0x08C41D50
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_08060484:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806048C: .4byte gSinLut
_08060490: .4byte 0x08C41D50

	thumb_func_start sub_08060494
sub_08060494: @ 0x08060494
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0xa
	str r6, [sp]
	movs r0, #1
	movs r1, #0x32
	movs r2, #0
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r2, r3
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, _08060524 @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _080604FA
	strh r6, [r5, #0x2c]
_080604FA:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0806051C
	ldr r0, _08060528 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r5, #0x60]
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
_0806051C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060524: .4byte gSinLut
_08060528: .4byte 0x0201774C

	thumb_func_start sub_0806052C
sub_0806052C: @ 0x0806052C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _08060554 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060558 @ =0x08C12CE0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060554: .4byte 0x0201774C
_08060558: .4byte 0x08C12CE0

	thumb_func_start sub_0806055C
sub_0806055C: @ 0x0806055C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08060598
	ldr r1, _080605A0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08060598:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080605A0: .4byte 0x0201774C

	thumb_func_start sub_080605A4
sub_080605A4: @ 0x080605A4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _080605DC @ =0x08C12CF8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080605DC: .4byte 0x08C12CF8

	thumb_func_start sub_080605E0
sub_080605E0: @ 0x080605E0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806060A
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0806060A:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08060626
	movs r0, #0xf
	bl sub_08060948
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #1
	bl sub_080565FC
	b _0806066C
_08060626:
	adds r0, r6, #2
	cmp r1, r0
	bne _08060650
	adds r0, r4, #0
	bl sub_08060730
	adds r0, r4, #0
	bl sub_080608B8
	ldr r0, _0806064C @ =0x000002BF
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl PlaySFX
	b _0806066C
	.align 2, 0
_0806064C: .4byte 0x000002BF
_08060650:
	adds r0, r6, #0
	adds r0, #0x2e
	cmp r1, r0
	bne _0806066C
	movs r0, #0xb0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0806066C:
	adds r7, r5, #0
	adds r7, #0x29
	ldrb r0, [r7]
	cmp r0, #0
	bne _080606F2
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x33
	cmp r1, r0
	bne _08060694
	adds r0, r4, #0
	bl sub_08060DD8
	adds r0, r4, #0
	bl sub_08060A80
	adds r0, r4, #0
	bl sub_08060BA0
_08060694:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x54
	cmp r1, r0
	bne _080606BE
	adds r0, r4, #0
	movs r1, #5
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r4, #0
	bl EfxPlayHittedSFX
_080606BE:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _080606D6
	adds r0, r4, #0
	bl sub_08060C2C
	adds r0, r4, #0
	bl sub_08060D4C
_080606D6:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x69
	cmp r1, r0
	bne _08060728
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r5, #0
	bl Proc_Break
	b _08060728
_080606F2:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	bne _0806070E
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
_0806070E:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x33
	cmp r1, r0
	bne _08060728
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r5, #0
	bl Proc_Break
_08060728:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08060730
sub_08060730: @ 0x08060730
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060784 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060788 @ =0x08C12D10
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	ldr r0, _0806078C @ =0x0829C488
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08060790 @ =0x0829CA18
	ldr r1, _08060794 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	bl SpellFx_SetSomeColorEffect
	ldr r2, _08060798 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060784: .4byte 0x0201774C
_08060788: .4byte 0x08C12D10
_0806078C: .4byte 0x0829C488
_08060790: .4byte 0x0829CA18
_08060794: .4byte gEkrTsaBuffer
_08060798: .4byte gDispIo

	thumb_func_start sub_0806079C
sub_0806079C: @ 0x0806079C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _080607B4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_080607B4: .4byte 0x0201774C

	thumb_func_start sub_080607B8
sub_080607B8: @ 0x080607B8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080607E8
	ldr r0, _080607E0 @ =gEkrTsaBuffer
	ldr r1, _080607E4 @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	b _080607FC
	.align 2, 0
_080607E0: .4byte gEkrTsaBuffer
_080607E4: .4byte gBg1Tm
_080607E8:
	ldr r0, _0806082C @ =gEkrTsaBuffer
	ldr r1, _08060830 @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
_080607FC:
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r4, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0806083E
	strh r2, [r4, #0x2c]
	movs r0, #6
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x32]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060834
	movs r0, #0x80
	b _08060836
	.align 2, 0
_0806082C: .4byte gEkrTsaBuffer
_08060830: .4byte gBg1Tm
_08060834:
	ldr r0, _08060848 @ =0x0000FF80
_08060836:
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_0806083E:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060848: .4byte 0x0000FF80

	thumb_func_start sub_0806084C
sub_0806084C: @ 0x0806084C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r1, _08060894 @ =gDispIo
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806088C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xc
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0806088C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060894: .4byte gDispIo

	thumb_func_start sub_08060898
sub_08060898: @ 0x08060898
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _080608B2
	adds r0, r2, #0
	bl Proc_Break
_080608B2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080608B8
sub_080608B8: @ 0x080608B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080608EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080608F0 @ =0x08C12D40
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080608F4 @ =0x081EEF7A
	str r1, [r0, #0x48]
	ldr r1, _080608F8 @ =0x0829C878
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080608EC: .4byte 0x0201774C
_080608F0: .4byte 0x08C12D40
_080608F4: .4byte 0x081EEF7A
_080608F8: .4byte 0x0829C878

	thumb_func_start sub_080608FC
sub_080608FC: @ 0x080608FC
	ldr r1, _08060908 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08060908: .4byte 0x0201774C

	thumb_func_start sub_0806090C
sub_0806090C: @ 0x0806090C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08060932
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08060940
_08060932:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08060940
	adds r0, r4, #0
	bl Proc_Break
_08060940:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08060948
sub_08060948: @ 0x08060948
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08060968 @ =0x08C12D68
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	adds r1, r4, #0
	bl sub_08060A1C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060968: .4byte 0x08C12D68

	thumb_func_start sub_0806096C
sub_0806096C: @ 0x0806096C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r0, _080609C8 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r5, _080609CC @ =0x0201FB2C
	cmp r0, #0
	bne _08060982
	ldr r5, _080609D0 @ =0x0201FC6C
_08060982:
	ldr r4, _080609D4 @ =0x0201FDB8
	cmp r0, #0
	bne _0806098A
	ldr r4, _080609D8 @ =0x0201FEF8
_0806098A:
	movs r3, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #0x10
	mov ip, r1
	movs r7, #0x80
	ldr r6, _080609DC @ =0x08C12D98
_0806099A:
	cmp r3, #0x7f
	bhi _080609F4
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r2, sb
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080609EC
	cmp r3, #0x3f
	bhi _080609E4
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bhs _080609EC
	ldr r1, _080609E0 @ =0x0000FF80
	adds r0, r3, r1
	lsls r0, r0, #0x10
	b _080609EA
	.align 2, 0
_080609C8: .4byte 0x0201FDAC
_080609CC: .4byte 0x0201FB2C
_080609D0: .4byte 0x0201FC6C
_080609D4: .4byte 0x0201FDB8
_080609D8: .4byte 0x0201FEF8
_080609DC: .4byte 0x08C12D98
_080609E0: .4byte 0x0000FF80
_080609E4:
	cmp r1, r7
	bls _080609EC
	mov r0, ip
_080609EA:
	lsrs r2, r0, #0x10
_080609EC:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r4]
	b _080609FC
_080609F4:
	mov r1, r8
	strh r1, [r5]
	adds r5, #2
	strh r1, [r4]
_080609FC:
	adds r4, #2
	ldr r2, _08060A18 @ =0xFFFF0000
	add ip, r2
	subs r7, #1
	adds r6, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _0806099A
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060A18: .4byte 0xFFFF0000

	thumb_func_start sub_08060A1C
sub_08060A1C: @ 0x08060A1C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08060A38 @ =0x08C12D80
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060A38: .4byte 0x08C12D80

	thumb_func_start sub_08060A3C
sub_08060A3C: @ 0x08060A3C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08060A78
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08060A78:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08060A80
sub_08060A80: @ 0x08060A80
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08060AC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060AC8 @ =0x08C12E98
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08060ACC @ =0x0829CBC4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08060AD0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08060ADC
	ldr r0, _08060AD4 @ =0x0829DCB0
	ldr r1, _08060AD8 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	b _08060AE4
	.align 2, 0
_08060AC4: .4byte 0x0201774C
_08060AC8: .4byte 0x08C12E98
_08060ACC: .4byte 0x0829CBC4
_08060AD0: .4byte gEkrDistanceType
_08060AD4: .4byte 0x0829DCB0
_08060AD8: .4byte gEkrTsaBuffer
_08060ADC:
	ldr r0, _08060B04 @ =0x0829E0E4
	ldr r1, _08060B08 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
_08060AE4:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060B10
	ldr r0, _08060B08 @ =gEkrTsaBuffer
	ldr r1, _08060B0C @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08060B24
	.align 2, 0
_08060B04: .4byte 0x0829E0E4
_08060B08: .4byte gEkrTsaBuffer
_08060B0C: .4byte gBg1Tm
_08060B10:
	ldr r0, _08060B58 @ =gEkrTsaBuffer
	ldr r1, _08060B5C @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08060B24:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060B60 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060B58: .4byte gEkrTsaBuffer
_08060B5C: .4byte gBg1Tm
_08060B60: .4byte gDispIo

	thumb_func_start sub_08060B64
sub_08060B64: @ 0x08060B64
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060B7C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060B7C: .4byte 0x0201774C

	thumb_func_start sub_08060B80
sub_08060B80: @ 0x08060B80
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08060B9A
	adds r0, r2, #0
	bl Proc_Break
_08060B9A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08060BA0
sub_08060BA0: @ 0x08060BA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060BD4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060BD8 @ =0x08C12EB8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08060BDC @ =0x081EEFB0
	str r1, [r0, #0x48]
	ldr r1, _08060BE0 @ =0x0829DC30
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060BD4: .4byte 0x0201774C
_08060BD8: .4byte 0x08C12EB8
_08060BDC: .4byte 0x081EEFB0
_08060BE0: .4byte 0x0829DC30

	thumb_func_start sub_08060BE4
sub_08060BE4: @ 0x08060BE4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08060C0A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08060C20
_08060C0A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08060C20
	ldr r1, _08060C28 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08060C20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060C28: .4byte 0x0201774C

	thumb_func_start sub_08060C2C
sub_08060C2C: @ 0x08060C2C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08060C70 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060C74 @ =0x08C12ED8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08060C78 @ =0x0829474C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08060C7C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08060C88
	ldr r0, _08060C80 @ =0x08295A34
	ldr r1, _08060C84 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	b _08060C90
	.align 2, 0
_08060C70: .4byte 0x0201774C
_08060C74: .4byte 0x08C12ED8
_08060C78: .4byte 0x0829474C
_08060C7C: .4byte gEkrDistanceType
_08060C80: .4byte 0x08295A34
_08060C84: .4byte gEkrTsaBuffer
_08060C88:
	ldr r0, _08060CB0 @ =0x08295E90
	ldr r1, _08060CB4 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
_08060C90:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060CBC
	ldr r0, _08060CB4 @ =gEkrTsaBuffer
	ldr r1, _08060CB8 @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08060CD0
	.align 2, 0
_08060CB0: .4byte 0x08295E90
_08060CB4: .4byte gEkrTsaBuffer
_08060CB8: .4byte gBg1Tm
_08060CBC:
	ldr r0, _08060D04 @ =gEkrTsaBuffer
	ldr r1, _08060D08 @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08060CD0:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060D0C @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060D04: .4byte gEkrTsaBuffer
_08060D08: .4byte gBg1Tm
_08060D0C: .4byte gDispIo

	thumb_func_start sub_08060D10
sub_08060D10: @ 0x08060D10
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060D28 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060D28: .4byte 0x0201774C

	thumb_func_start sub_08060D2C
sub_08060D2C: @ 0x08060D2C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08060D46
	adds r0, r2, #0
	bl Proc_Break
_08060D46:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08060D4C
sub_08060D4C: @ 0x08060D4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060D80 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060D84 @ =0x08C12EF8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08060D88 @ =0x081EEFC2
	str r1, [r0, #0x48]
	ldr r1, _08060D8C @ =0x0829E4D0
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060D80: .4byte 0x0201774C
_08060D84: .4byte 0x08C12EF8
_08060D88: .4byte 0x081EEFC2
_08060D8C: .4byte 0x0829E4D0

	thumb_func_start sub_08060D90
sub_08060D90: @ 0x08060D90
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08060DB6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08060DCC
_08060DB6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08060DCC
	ldr r1, _08060DD4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08060DCC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060DD4: .4byte 0x0201774C

	thumb_func_start sub_08060DD8
sub_08060DD8: @ 0x08060DD8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08060E30 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060E34 @ =0x08C12F18
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08060E38 @ =0x08C42AA4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #2]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldr r0, _08060E3C @ =0x0829E9AC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060E40 @ =0x0829E550
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060E30: .4byte 0x0201774C
_08060E34: .4byte 0x08C12F18
_08060E38: .4byte 0x08C42AA4
_08060E3C: .4byte 0x0829E9AC
_08060E40: .4byte 0x0829E550

	thumb_func_start sub_08060E44
sub_08060E44: @ 0x08060E44
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	bne _08060E66
	ldr r1, _08060E6C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_08060E66:
	pop {r0}
	bx r0
	.align 2, 0
_08060E6C: .4byte 0x0201774C

	thumb_func_start sub_08060E70
sub_08060E70: @ 0x08060E70
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08060EA8 @ =0x08C12F30
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060EA8: .4byte 0x08C12F30

	thumb_func_start sub_08060EAC
sub_08060EAC: @ 0x08060EAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08060EE0
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl sub_0804EC74
_08060EE0:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #1
	cmp r1, r0
	bne _08060F50
	adds r0, r5, #0
	bl sub_08061094
	adds r0, r5, #0
	bl sub_080614E4
	ldr r3, _08060F48 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl sub_080566F0
	mov r0, r8
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x32
	movs r2, #0xa
	movs r3, #0x10
	bl sub_080566F0
	ldr r0, _08060F4C @ =0x000002C7
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	b _08061050
	.align 2, 0
_08060F48: .4byte gDispIo
_08060F4C: .4byte 0x000002C7
_08060F50:
	adds r0, r4, #0
	adds r0, #0x45
	cmp r1, r0
	bne _08060FA8
	ldr r0, [r6, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_080569B8
	adds r0, r5, #0
	movs r1, #0x54
	bl sub_080611CC
	ldr r3, _08060FA4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl sub_080566F0
	movs r0, #0xb2
	lsls r0, r0, #2
	b _0806104A
	.align 2, 0
_08060FA4: .4byte gDispIo
_08060FA8:
	adds r0, r4, #0
	adds r0, #0x58
	cmp r1, r0
	bne _08060FBA
	adds r0, r5, #0
	movs r1, #0x32
	bl sub_08061448
	b _08061086
_08060FBA:
	adds r0, r4, #0
	adds r0, #0x5d
	cmp r1, r0
	beq _08060FCA
	adds r0, r4, #0
	adds r0, #0x6c
	cmp r1, r0
	bne _08060FD4
_08060FCA:
	adds r0, r5, #0
	movs r1, #5
	bl sub_0804F7B8
	b _08061086
_08060FD4:
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	bne _08061006
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08061086
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08061086
_08061006:
	adds r0, r4, #0
	adds r0, #0x9f
	cmp r1, r0
	bne _08061028
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08061086
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
	b _08061086
_08061028:
	adds r0, r4, #0
	adds r0, #0xa3
	cmp r1, r0
	bne _0806105C
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #9
	bl sub_080569B8
	adds r0, r5, #0
	movs r1, #0x1e
	bl sub_080612D4
	adds r0, r5, #0
	bl sub_080613B8
	ldr r0, _08061058 @ =0x000002C9
_0806104A:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
_08061050:
	movs r3, #1
	bl PlaySFX
	b _08061086
	.align 2, 0
_08061058: .4byte 0x000002C9
_0806105C:
	adds r0, r4, #0
	adds r0, #0xb3
	cmp r1, r0
	bne _08061070
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #8
	bl sub_080569B8
	b _08061086
_08061070:
	adds r0, r4, #0
	adds r0, #0xcc
	cmp r1, r0
	bne _08061086
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
_08061086:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08061094
sub_08061094: @ 0x08061094
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080610F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080610FC @ =0x08C12F48
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08061100 @ =0x081EEFD4
	str r0, [r5, #0x48]
	ldr r0, _08061104 @ =0x08C12F60
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061108 @ =0x0829E9CC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806110C @ =0x0829FBE4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08061110 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806111E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061114
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0806111E
	.align 2, 0
_080610F8: .4byte 0x0201774C
_080610FC: .4byte 0x08C12F48
_08061100: .4byte 0x081EEFD4
_08061104: .4byte 0x08C12F60
_08061108: .4byte 0x0829E9CC
_0806110C: .4byte 0x0829FBE4
_08061110: .4byte gEkrDistanceType
_08061114:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0806111E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08061128
sub_08061128: @ 0x08061128
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080611A0
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0806117C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080611BE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _08061184
	ldr r0, _08061180 @ =gBg1Tm
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _08061194
	.align 2, 0
_0806117C: .4byte gEkrDistanceType
_08061180: .4byte gBg1Tm
_08061184:
	ldr r0, _0806119C @ =0x0202349A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_08061194:
	movs r0, #2
	bl EnableBgSync
	b _080611BE
	.align 2, 0
_0806119C: .4byte 0x0202349A
_080611A0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080611BE
	bl SpellFx_ClearBG1
	ldr r1, _080611C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080611BE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080611C8: .4byte 0x0201774C

	thumb_func_start sub_080611CC
sub_080611CC: @ 0x080611CC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08061254 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061258 @ =0x08C12F90
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _0806125C @ =0x082A222C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08061260 @ =0x082A2C1C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08061264 @ =0x082A2C9C
	ldr r4, _08061268 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806126C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08061270 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061254: .4byte 0x0201774C
_08061258: .4byte 0x08C12F90
_0806125C: .4byte 0x082A222C
_08061260: .4byte 0x082A2C1C
_08061264: .4byte 0x082A2C9C
_08061268: .4byte gEkrTsaBuffer
_0806126C: .4byte gBg1Tm
_08061270: .4byte gDispIo

	thumb_func_start sub_08061274
sub_08061274: @ 0x08061274
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _0806128C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0806128C: .4byte 0x0201774C

	thumb_func_start sub_08061290
sub_08061290: @ 0x08061290
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080612AC
	ldr r1, _080612A8 @ =gDispIo
	ldrh r0, [r1, #0x20]
	adds r0, #2
	b _080612B2
	.align 2, 0
_080612A8: .4byte gDispIo
_080612AC:
	ldr r1, _080612D0 @ =gDispIo
	ldrh r0, [r1, #0x20]
	subs r0, #2
_080612B2:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080612CA
	adds r0, r4, #0
	bl Proc_Break
_080612CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080612D0: .4byte gDispIo

	thumb_func_start sub_080612D4
sub_080612D4: @ 0x080612D4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806135C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061360 @ =0x08C12FB0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08061364 @ =0x082A0E30
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08061368 @ =0x082A1C90
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _0806136C @ =0x082A1DD0
	ldr r4, _08061370 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08061374 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08061378 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806135C: .4byte 0x0201774C
_08061360: .4byte 0x08C12FB0
_08061364: .4byte 0x082A0E30
_08061368: .4byte 0x082A1C90
_0806136C: .4byte 0x082A1DD0
_08061370: .4byte gEkrTsaBuffer
_08061374: .4byte gBg1Tm
_08061378: .4byte gDispIo

	thumb_func_start sub_0806137C
sub_0806137C: @ 0x0806137C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08061394 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08061394: .4byte 0x0201774C

	thumb_func_start sub_08061398
sub_08061398: @ 0x08061398
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _080613B2
	adds r0, r2, #0
	bl Proc_Break
_080613B2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080613B8
sub_080613B8: @ 0x080613B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080613EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080613F0 @ =0x08C12FD0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080613F4 @ =0x081EF02A
	str r1, [r0, #0x48]
	ldr r1, _080613F8 @ =0x082A1C90
	str r1, [r0, #0x4c]
	ldr r0, _080613FC @ =0x082A0DB0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080613EC: .4byte 0x0201774C
_080613F0: .4byte 0x08C12FD0
_080613F4: .4byte 0x081EF02A
_080613F8: .4byte 0x082A1C90
_080613FC: .4byte 0x082A0DB0

	thumb_func_start sub_08061400
sub_08061400: @ 0x08061400
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08061426
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0806143C
_08061426:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806143C
	ldr r1, _08061444 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806143C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061444: .4byte 0x0201774C

	thumb_func_start sub_08061448
sub_08061448: @ 0x08061448
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0806149C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080614A0 @ =0x08C12FF0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _080614A4 @ =0x08C43190
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r0, _080614A8 @ =0x082A3700
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080614AC @ =0x082A2F14
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806149C: .4byte 0x0201774C
_080614A0: .4byte 0x08C12FF0
_080614A4: .4byte 0x08C43190
_080614A8: .4byte 0x082A3700
_080614AC: .4byte 0x082A2F14

	thumb_func_start sub_080614B0
sub_080614B0: @ 0x080614B0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _080614D8
	ldr r0, _080614E0 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080614D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080614E0: .4byte 0x0201774C

	thumb_func_start sub_080614E4
sub_080614E4: @ 0x080614E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08061540 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061544 @ =0x08C13008
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _08061548 @ =0x08C10828
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r1, _0806154C @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _08061550 @ =0x082A3A2C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08061554 @ =0x082A3720
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061540: .4byte 0x0201774C
_08061544: .4byte 0x08C13008
_08061548: .4byte 0x08C10828
_0806154C: .4byte 0x0000F3FF
_08061550: .4byte 0x082A3A2C
_08061554: .4byte 0x082A3720

	thumb_func_start sub_08061558
sub_08061558: @ 0x08061558
	push {lr}
	ldr r2, _0806156C @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0806156C: .4byte 0x0201774C

	thumb_func_start sub_08061570
sub_08061570: @ 0x08061570
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08061588 @ =0x08C435EC
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_08061588: .4byte 0x08C435EC

	thumb_func_start sub_0806158C
sub_0806158C: @ 0x0806158C
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _080615A4 @ =0x08C43640
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_080615A4: .4byte 0x08C43640

	thumb_func_start sub_080615A8
sub_080615A8: @ 0x080615A8
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _080615C0 @ =0x08C4364C
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_080615C0: .4byte 0x08C4364C

	thumb_func_start sub_080615C4
sub_080615C4: @ 0x080615C4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _080615FC @ =0x08C13050
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080615FC: .4byte 0x08C13050

	thumb_func_start sub_08061600
sub_08061600: @ 0x08061600
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806163C
	adds r0, r5, #0
	bl sub_08061758
	ldr r0, _08061638 @ =0x000002C1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0806169E
	.align 2, 0
_08061638: .4byte 0x000002C1
_0806163C:
	cmp r0, #0xe
	bne _08061648
	adds r0, r5, #0
	bl sub_080617EC
	b _0806174E
_08061648:
	cmp r0, #0x2c
	bne _08061660
	ldr r0, _0806165C @ =0x000002C2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0806169E
	.align 2, 0
_0806165C: .4byte 0x000002C2
_08061660:
	cmp r0, #0x53
	bne _08061678
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804F7B8
	b _0806174E
_08061678:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x5d
	cmp r1, r0
	bne _0806168C
	adds r0, r5, #0
	bl sub_08061880
	b _0806174E
_0806168C:
	adds r0, r2, #0
	adds r0, #0x67
	cmp r1, r0
	bne _080616AC
	ldr r0, _080616A8 @ =0x000002C3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0806169E:
	movs r3, #1
	bl PlaySFX
	b _0806174E
	.align 2, 0
_080616A8: .4byte 0x000002C3
_080616AC:
	adds r0, r2, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _080616C0
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	b _08061730
_080616C0:
	adds r0, r2, #0
	adds r0, #0x89
	cmp r1, r0
	bne _080616D6
	adds r0, r5, #0
	bl sub_0806196C
	adds r0, r5, #0
	bl sub_08061A8C
	b _0806174E
_080616D6:
	adds r0, r2, #0
	adds r0, #0x90
	cmp r1, r0
	bne _08061706
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804F7B8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806174E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0806174E
_08061706:
	adds r0, r2, #0
	adds r0, #0x9a
	cmp r1, r0
	bne _08061738
	ldr r0, [r4, #0x5c]
	movs r1, #0x55
	movs r2, #1
	bl sub_080565FC
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	bl sub_0805618C
	adds r0, r5, #0
	bl sub_08061B1C
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0xc
_08061730:
	movs r3, #0x10
	bl sub_080566F0
	b _0806174E
_08061738:
	adds r0, r2, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _0806174E
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r4, #0
	bl Proc_Break
_0806174E:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08061758
sub_08061758: @ 0x08061758
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080617BC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080617C0 @ =0x08C13068
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080617C4 @ =0x081EF07C
	str r0, [r5, #0x48]
	ldr r0, _080617C8 @ =0x08C13080
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080617CC @ =0x082A3A4C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080617D0 @ =0x082A43C4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080617D4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080617E2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080617D8
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _080617E2
	.align 2, 0
_080617BC: .4byte 0x0201774C
_080617C0: .4byte 0x08C13068
_080617C4: .4byte 0x081EF07C
_080617C8: .4byte 0x08C13080
_080617CC: .4byte 0x082A3A4C
_080617D0: .4byte 0x082A43C4
_080617D4: .4byte gEkrDistanceType
_080617D8:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_080617E2:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080617EC
sub_080617EC: @ 0x080617EC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08061850 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061854 @ =0x08C13068
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08061858 @ =0x081EF0AA
	str r0, [r5, #0x48]
	ldr r0, _0806185C @ =0x08C13080
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061860 @ =0x082A3A4C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08061864 @ =0x082A43C4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08061868 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061876
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806186C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08061876
	.align 2, 0
_08061850: .4byte 0x0201774C
_08061854: .4byte 0x08C13068
_08061858: .4byte 0x081EF0AA
_0806185C: .4byte 0x08C13080
_08061860: .4byte 0x082A3A4C
_08061864: .4byte 0x082A43C4
_08061868: .4byte gEkrDistanceType
_0806186C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08061876:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08061880
sub_08061880: @ 0x08061880
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080618E4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080618E8 @ =0x08C13068
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080618EC @ =0x081EF0DC
	str r0, [r5, #0x48]
	ldr r0, _080618F0 @ =0x08C13080
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080618F4 @ =0x082A3A4C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080618F8 @ =0x082A43C4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080618FC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806190A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061900
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0806190A
	.align 2, 0
_080618E4: .4byte 0x0201774C
_080618E8: .4byte 0x08C13068
_080618EC: .4byte 0x081EF0DC
_080618F0: .4byte 0x08C13080
_080618F4: .4byte 0x082A3A4C
_080618F8: .4byte 0x082A43C4
_080618FC: .4byte gEkrDistanceType
_08061900:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0806190A:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08061914
sub_08061914: @ 0x08061914
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08061942
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08061960
_08061942:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08061960
	bl SpellFx_ClearBG1
	ldr r1, _08061968 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08061960:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061968: .4byte 0x0201774C

	thumb_func_start sub_0806196C
sub_0806196C: @ 0x0806196C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080619B0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080619B4 @ =0x08C130F0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #5
	strh r0, [r5, #0x2e]
	ldr r0, _080619B8 @ =0x0829474C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _080619BC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080619C8
	ldr r0, _080619C0 @ =0x08295A34
	ldr r1, _080619C4 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	b _080619D0
	.align 2, 0
_080619B0: .4byte 0x0201774C
_080619B4: .4byte 0x08C130F0
_080619B8: .4byte 0x0829474C
_080619BC: .4byte gEkrDistanceType
_080619C0: .4byte 0x08295A34
_080619C4: .4byte gEkrTsaBuffer
_080619C8:
	ldr r0, _080619F0 @ =0x08295E90
	ldr r1, _080619F4 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
_080619D0:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080619FC
	ldr r0, _080619F4 @ =gEkrTsaBuffer
	ldr r1, _080619F8 @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08061A10
	.align 2, 0
_080619F0: .4byte 0x08295E90
_080619F4: .4byte gEkrTsaBuffer
_080619F8: .4byte gBg1Tm
_080619FC:
	ldr r0, _08061A44 @ =gEkrTsaBuffer
	ldr r1, _08061A48 @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08061A10:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08061A4C @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061A44: .4byte gEkrTsaBuffer
_08061A48: .4byte gBg1Tm
_08061A4C: .4byte gDispIo

	thumb_func_start sub_08061A50
sub_08061A50: @ 0x08061A50
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08061A68 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08061A68: .4byte 0x0201774C

	thumb_func_start sub_08061A6C
sub_08061A6C: @ 0x08061A6C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08061A86
	adds r0, r2, #0
	bl Proc_Break
_08061A86:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08061A8C
sub_08061A8C: @ 0x08061A8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061AC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061AC8 @ =0x08C13110
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	str r0, [r1, #0x44]
	ldr r0, _08061ACC @ =0x081EF0F6
	str r0, [r1, #0x48]
	ldr r0, _08061AD0 @ =0x08295974
	str r0, [r1, #0x4c]
	adds r0, #0x60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061AC4: .4byte 0x0201774C
_08061AC8: .4byte 0x08C13110
_08061ACC: .4byte 0x081EF0F6
_08061AD0: .4byte 0x08295974

	thumb_func_start sub_08061AD4
sub_08061AD4: @ 0x08061AD4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08061AFA
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08061B10
_08061AFA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08061B10
	ldr r1, _08061B18 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08061B10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061B18: .4byte 0x0201774C

	thumb_func_start sub_08061B1C
sub_08061B1C: @ 0x08061B1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061B64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061B68 @ =0x08C13130
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08061B6C @ =0x081EF108
	str r1, [r0, #0x48]
	ldr r1, _08061B70 @ =0x08C13148
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08061B74 @ =0x08C13178
	str r1, [r0, #0x54]
	ldr r0, _08061B78 @ =0x082B4BD4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061B64: .4byte 0x0201774C
_08061B68: .4byte 0x08C13130
_08061B6C: .4byte 0x081EF108
_08061B70: .4byte 0x08C13148
_08061B74: .4byte 0x08C13178
_08061B78: .4byte 0x082B4BD4

	thumb_func_start sub_08061B7C
sub_08061B7C: @ 0x08061B7C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08061BB8
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _08061BD6
_08061BB8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08061BD6
	bl SpellFx_ClearBG1
	ldr r1, _08061BDC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_08061BD6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061BDC: .4byte 0x0201774C

	thumb_func_start sub_08061BE0
sub_08061BE0: @ 0x08061BE0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_08050348
	bl SpellFx_ClearBG1Position
	ldr r0, _08061C18 @ =0x08C131A8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061C18: .4byte 0x08C131A8

	thumb_func_start sub_08061C1C
sub_08061C1C: @ 0x08061C1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08061C50
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl sub_0804EC74
_08061C50:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _08061C64
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804F7B8
	b _08061D76
_08061C64:
	adds r0, r4, #0
	adds r0, #0xb
	cmp r1, r0
	bne _08061C78
	adds r0, r5, #0
	bl sub_08061D84
	movs r0, #0xb1
	lsls r0, r0, #2
	b _08061D4E
_08061C78:
	adds r0, r4, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _08061CC8
	adds r0, r5, #0
	movs r1, #0x72
	bl sub_080620FC
	ldr r3, _08061CC0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0xa
	movs r3, #0
	bl sub_080566F0
	ldr r0, _08061CC4 @ =0x000002C5
	b _08061D4E
	.align 2, 0
_08061CC0: .4byte gDispIo
_08061CC4: .4byte 0x000002C5
_08061CC8:
	adds r0, r4, #0
	adds r0, #0x4c
	cmp r1, r0
	bne _08061CE2
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08061F48
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08061FC4
	b _08061D76
_08061CE2:
	adds r0, r4, #0
	adds r0, #0x56
	cmp r1, r0
	bne _08061CF6
	adds r0, r5, #0
	movs r1, #0x37
	movs r2, #0x2d
	bl sub_0806205C
	b _08061D76
_08061CF6:
	adds r0, r4, #0
	adds r0, #0x8d
	cmp r1, r0
	bne _08061D20
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08061D76
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08061D76
_08061D20:
	adds r0, r4, #0
	adds r0, #0x8e
	cmp r1, r0
	bne _08061D60
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #0xa
	bl sub_080569B8
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_08061E40
	mov r0, r8
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0x14
	movs r3, #0x10
	bl sub_080566F0
	ldr r0, _08061D5C @ =0x000002C6
_08061D4E:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _08061D76
	.align 2, 0
_08061D5C: .4byte 0x000002C6
_08061D60:
	adds r0, r4, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _08061D76
	bl SpellFx_Finish
	bl sub_080503A0
	adds r0, r6, #0
	bl Proc_Break
_08061D76:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08061D84
sub_08061D84: @ 0x08061D84
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061DD0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061DD4 @ =0x08C131C0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08061DD8 @ =0x081EF17A
	str r1, [r0, #0x48]
	ldr r1, _08061DDC @ =0x08C131D8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08061DE0 @ =0x082A3A4C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08061DE4 @ =0x082A43C4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061DD0: .4byte 0x0201774C
_08061DD4: .4byte 0x08C131C0
_08061DD8: .4byte 0x081EF17A
_08061DDC: .4byte 0x08C131D8
_08061DE0: .4byte 0x082A3A4C
_08061DE4: .4byte 0x082A43C4

	thumb_func_start sub_08061DE8
sub_08061DE8: @ 0x08061DE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08061E16
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08061E34
_08061E16:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08061E34
	bl SpellFx_ClearBG1
	ldr r1, _08061E3C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08061E34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061E3C: .4byte 0x0201774C

	thumb_func_start sub_08061E40
sub_08061E40: @ 0x08061E40
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08061EC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061ECC @ =0x08C13208
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08061ED0 @ =0x082B6970
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08061ED4 @ =0x082B6ED0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08061ED8 @ =0x082B6EF0
	ldr r4, _08061EDC @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08061EE0 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08061EE4 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061EC8: .4byte 0x0201774C
_08061ECC: .4byte 0x08C13208
_08061ED0: .4byte 0x082B6970
_08061ED4: .4byte 0x082B6ED0
_08061ED8: .4byte 0x082B6EF0
_08061EDC: .4byte gEkrTsaBuffer
_08061EE0: .4byte gBg1Tm
_08061EE4: .4byte gDispIo

	thumb_func_start sub_08061EE8
sub_08061EE8: @ 0x08061EE8
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08061F00 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08061F00: .4byte 0x0201774C

	thumb_func_start sub_08061F04
sub_08061F04: @ 0x08061F04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061F20
	ldr r1, _08061F1C @ =gDispIo
	ldrh r0, [r1, #0x20]
	adds r0, #0xc
	b _08061F26
	.align 2, 0
_08061F1C: .4byte gDispIo
_08061F20:
	ldr r1, _08061F44 @ =gDispIo
	ldrh r0, [r1, #0x20]
	subs r0, #0xc
_08061F26:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08061F3E
	adds r0, r4, #0
	bl Proc_Break
_08061F3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061F44: .4byte gDispIo

	thumb_func_start sub_08061F48
sub_08061F48: @ 0x08061F48
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08061FAC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061FB0 @ =0x08C13228
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08061FB4 @ =0x08C44720
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r1, _08061FB8 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _08061FBC @ =0x082B99D0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08061FC0 @ =0x082B96A0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061FAC: .4byte 0x0201774C
_08061FB0: .4byte 0x08C13228
_08061FB4: .4byte 0x08C44720
_08061FB8: .4byte 0x0000F3FF
_08061FBC: .4byte 0x082B99D0
_08061FC0: .4byte 0x082B96A0

	thumb_func_start sub_08061FC4
sub_08061FC4: @ 0x08061FC4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08062018 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806201C @ =0x08C13228
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08062020 @ =0x08C447B8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r1, _08062024 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062018: .4byte 0x0201774C
_0806201C: .4byte 0x08C13228
_08062020: .4byte 0x08C447B8
_08062024: .4byte 0x0000F3FF

	thumb_func_start sub_08062028
sub_08062028: @ 0x08062028
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08062050
	ldr r0, _08062058 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08062050:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062058: .4byte 0x0201774C

	thumb_func_start sub_0806205C
sub_0806205C: @ 0x0806205C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _0806208C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062090 @ =0x08C13240
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0804F7B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806208C: .4byte 0x0201774C
_08062090: .4byte 0x08C13240

	thumb_func_start sub_08062094
sub_08062094: @ 0x08062094
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _080620F0 @ =gPal
	ldr r4, _080620F4 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080620E8
	ldr r1, _080620F8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080620E8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080620F0: .4byte gPal
_080620F4: .4byte 0x020165C8
_080620F8: .4byte 0x0201774C

	thumb_func_start sub_080620FC
sub_080620FC: @ 0x080620FC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r1, _08062180 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062184 @ =0x08C13258
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	str r0, [r5, #0x44]
	ldr r0, _08062188 @ =0x081EF1AC
	str r0, [r5, #0x48]
	ldr r4, _0806218C @ =0x082B9224
	str r4, [r5, #0x4c]
	ldr r0, _08062190 @ =0x082B782C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	subs r4, #0x20
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r5, #0x5c]
	ldr r2, _08062194 @ =0x082B9244
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	ldr r0, _08062198 @ =gAnims
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _080621A0
	ldr r3, _0806219C @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	b _080621CC
	.align 2, 0
_08062180: .4byte 0x0201774C
_08062184: .4byte 0x08C13258
_08062188: .4byte 0x081EF1AC
_0806218C: .4byte 0x082B9224
_08062190: .4byte 0x082B782C
_08062194: .4byte 0x082B9244
_08062198: .4byte gAnims
_0806219C: .4byte gDispIo
_080621A0:
	ldr r3, _08062210 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x18]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x18]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
_080621CC:
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	ldr r6, _08062214 @ =0x0000F3FF
	adds r1, r6, #0
	ldrh r2, [r7, #8]
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r2, #0
	orrs r1, r5
	strh r1, [r7, #8]
	adds r1, r6, #0
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r5
	strh r1, [r0, #8]
	ldr r4, _08062218 @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	cmp r1, #0
	beq _08062208
	adds r0, r6, #0
	ldrh r2, [r1, #8]
	ands r0, r2
	orrs r0, r5
	strh r0, [r1, #8]
_08062208:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062210: .4byte gDispIo
_08062214: .4byte 0x0000F3FF
_08062218: .4byte 0x02000010

	thumb_func_start sub_0806221C
sub_0806221C: @ 0x0806221C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r4, _080622C4 @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _0806224A
	ldr r0, _080622C8 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_0806224A:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08062270
	ldr r0, [r5, #0x4c]
	ldr r1, _080622CC @ =0x02022862
	movs r2, #0xf
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_08050E58
_08062270:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08062340
	ldr r1, _080622D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, _080622D4 @ =gAnims
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _080622DC
	ldr r3, _080622D8 @ =gDispIo
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
	b _08062308
	.align 2, 0
_080622C4: .4byte 0x02000010
_080622C8: .4byte 0x0000F3FF
_080622CC: .4byte 0x02022862
_080622D0: .4byte 0x0201774C
_080622D4: .4byte gAnims
_080622D8: .4byte gDispIo
_080622DC:
	ldr r3, _08062348 @ =gDispIo
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
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
_08062308:
	ldr r1, [r5, #0x5c]
	ldr r3, _0806234C @ =0x0000F3FF
	adds r0, r3, #0
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	ldr r1, [r5, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	adds r0, r3, #0
	ldrh r1, [r6, #8]
	ands r0, r1
	orrs r0, r2
	strh r0, [r6, #8]
	cmp r4, #0
	beq _0806233A
	adds r0, r3, #0
	ldrh r1, [r4, #8]
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #8]
_0806233A:
	adds r0, r5, #0
	bl Proc_Break
_08062340:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062348: .4byte gDispIo
_0806234C: .4byte 0x0000F3FF

	thumb_func_start sub_08062350
sub_08062350: @ 0x08062350
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_080504F8
	bl SpellFx_ClearBG1Position
	ldr r0, _08062388 @ =0x08C13270
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062388: .4byte 0x08C13270

	thumb_func_start sub_0806238C
sub_0806238C: @ 0x0806238C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080623BA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_080623BA:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0x14
	cmp r1, r0
	bne _080623D4
	adds r0, r6, #0
	bl sub_08062A3C
	ldr r0, _080623D0 @ =0x000002FD
	b _08062474
	.align 2, 0
_080623D0: .4byte 0x000002FD
_080623D4:
	adds r0, r5, #0
	adds r0, #0x28
	cmp r1, r0
	bne _080623F4
	adds r0, r6, #0
	bl sub_080626F0
	adds r0, r6, #0
	bl sub_0806250C
	adds r0, r6, #0
	bl sub_08062658
	bl sub_08050530
	b _08062500
_080623F4:
	adds r0, r5, #0
	adds r0, #0x91
	cmp r1, r0
	bne _08062408
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0x14
	bl sub_080628F0
	b _08062500
_08062408:
	adds r0, r5, #0
	adds r0, #0xaf
	cmp r1, r0
	bne _08062430
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08062500
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08062500
_08062430:
	adds r0, r5, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _08062452
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062500
	bl SpellFx_Finish
	bl sub_08050548
	adds r0, r4, #0
	bl Proc_Break
	b _08062500
_08062452:
	adds r0, r5, #0
	adds r0, #0xb1
	cmp r1, r0
	bne _08062488
	ldr r0, [r4, #0x5c]
	movs r1, #0x50
	movs r2, #9
	bl sub_080569B8
	adds r0, r6, #0
	movs r1, #0x1e
	bl sub_080612D4
	adds r0, r6, #0
	bl sub_080613B8
	ldr r0, _08062484 @ =0x000002FE
_08062474:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _08062500
	.align 2, 0
_08062484: .4byte 0x000002FE
_08062488:
	adds r0, r5, #0
	adds r0, #0xcd
	cmp r1, r0
	bne _0806249A
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_0804F7B8
	b _08062500
_0806249A:
	adds r0, r5, #0
	adds r0, #0xd7
	cmp r1, r0
	bne _080624CC
	ldr r0, [r4, #0x5c]
	movs r1, #0x46
	movs r2, #1
	bl sub_080565FC
	ldr r0, [r4, #0x5c]
	movs r1, #0x32
	bl sub_0805618C
	ldr r0, [r4, #0x5c]
	bl sub_080627C4
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl sub_080566F0
	b _08062500
_080624CC:
	adds r0, r5, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _080624DC
	adds r0, r6, #0
	bl sub_080629CC
	b _08062500
_080624DC:
	adds r0, r5, #0
	adds r0, #0xf0
	cmp r1, r0
	bne _080624EA
	bl sub_08050548
	b _08062500
_080624EA:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	ldr r2, _08062508 @ =0x0000010B
	adds r0, r5, r2
	cmp r1, r0
	bne _08062500
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_08062500:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062508: .4byte 0x0000010B

	thumb_func_start sub_0806250C
sub_0806250C: @ 0x0806250C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062548 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806254C @ =0x08C13288
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #5
	str r1, [r0, #0x48]
	ldr r0, _08062550 @ =0x082DF474
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08062554 @ =0x082DF8E8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062548: .4byte 0x0201774C
_0806254C: .4byte 0x08C13288
_08062550: .4byte 0x082DF474
_08062554: .4byte 0x082DF8E8

	thumb_func_start sub_08062558
sub_08062558: @ 0x08062558
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x44]
	cmp r0, r1
	ble _080625BE
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r5, _080625C8 @ =0x08C132A8
	movs r0, #0x2e
	ldrsh r4, [r6, r0]
	lsls r0, r4, #4
	adds r0, r0, r5
	ldr r1, [r0]
	lsls r4, r4, #2
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r4, #2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	adds r4, #3
	lsls r4, r4, #2
	adds r4, r4, r5
	ldr r4, [r4]
	ldr r0, [r6, #0x60]
	str r4, [sp]
	bl sub_080625D0
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _080625BE
	ldr r1, _080625CC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080625BE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080625C8: .4byte 0x08C132A8
_080625CC: .4byte 0x0201774C

	thumb_func_start sub_080625D0
sub_080625D0: @ 0x080625D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x20]
	ldr r1, _08062630 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062634 @ =0x08C13390
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	ldr r0, _08062638 @ =0x08C13378
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	mov r1, r8
	strh r1, [r0, #2]
	mov r2, sb
	strh r2, [r0, #4]
	ldr r1, _0806263C @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r7
	strh r1, [r0, #8]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062630: .4byte 0x0201774C
_08062634: .4byte 0x08C13390
_08062638: .4byte 0x08C13378
_0806263C: .4byte 0x0000F3FF

	thumb_func_start sub_08062640
sub_08062640: @ 0x08062640
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _08062654 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08062654: .4byte 0x0201774C

	thumb_func_start sub_08062658
sub_08062658: @ 0x08062658
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080626AC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080626B0 @ =0x08C133B0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _080626B4 @ =0x08C46040
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x3c
	strh r1, [r0, #4]
	ldr r1, _080626B8 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl AnimSort
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080626AC: .4byte 0x0201774C
_080626B0: .4byte 0x08C133B0
_080626B4: .4byte 0x08C46040
_080626B8: .4byte 0x0000F3FF

	thumb_func_start sub_080626BC
sub_080626BC: @ 0x080626BC
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _080626D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080626D0: .4byte 0x0201774C

	thumb_func_start sub_080626D4
sub_080626D4: @ 0x080626D4
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _080626EC @ =0x08C46060
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_080626EC: .4byte 0x08C46060

	thumb_func_start sub_080626F0
sub_080626F0: @ 0x080626F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062730 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062734 @ =0x08C133E0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08062738 @ =0x081EF1EA
	str r1, [r0, #0x48]
	ldr r1, _0806273C @ =0x08C13420
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08062740 @ =0x08C133F8
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08062744 @ =0x082CB87C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062730: .4byte 0x0201774C
_08062734: .4byte 0x08C133E0
_08062738: .4byte 0x081EF1EA
_0806273C: .4byte 0x08C13420
_08062740: .4byte 0x08C133F8
_08062744: .4byte 0x082CB87C

	thumb_func_start sub_08062748
sub_08062748: @ 0x08062748
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08062798
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08062782
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08062782:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080627B6
_08062798:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080627B6
	bl SpellFx_ClearBG1
	ldr r1, _080627C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080627B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080627C0: .4byte 0x0201774C

	thumb_func_start sub_080627C4
sub_080627C4: @ 0x080627C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806280C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062810 @ =0x08C13448
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08062814 @ =0x081EF298
	str r1, [r0, #0x48]
	ldr r1, _08062818 @ =0x08C13488
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806281C @ =0x08C13460
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08062820 @ =0x082DDED4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806280C: .4byte 0x0201774C
_08062810: .4byte 0x08C13448
_08062814: .4byte 0x081EF298
_08062818: .4byte 0x08C13488
_0806281C: .4byte 0x08C13460
_08062820: .4byte 0x082DDED4

	thumb_func_start sub_08062824
sub_08062824: @ 0x08062824
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080628C0
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08062860
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08062860:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0806289C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080628DE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _080628A4
	ldr r0, _080628A0 @ =gBg1Tm
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _080628B4
	.align 2, 0
_0806289C: .4byte gEkrDistanceType
_080628A0: .4byte gBg1Tm
_080628A4:
	ldr r0, _080628BC @ =0x0202349A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_080628B4:
	movs r0, #2
	bl EnableBgSync
	b _080628DE
	.align 2, 0
_080628BC: .4byte 0x0202349A
_080628C0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080628DE
	bl SpellFx_ClearBG1
	ldr r1, _080628EC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080628DE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080628EC: .4byte 0x0201774C

	thumb_func_start sub_080628F0
sub_080628F0: @ 0x080628F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	ldr r1, _08062930 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062934 @ =0x08C134B0
	movs r1, #4
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08062938 @ =gPal
	ldr r1, _0806293C @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	strh r6, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062930: .4byte 0x0201774C
_08062934: .4byte 0x08C134B0
_08062938: .4byte gPal
_0806293C: .4byte 0x020165C8

	thumb_func_start sub_08062940
sub_08062940: @ 0x08062940
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0806295A
	ldrh r3, [r5, #0x2e]
	b _0806295C
_0806295A:
	ldrh r3, [r5, #0x2c]
_0806295C:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r7, _080629C0 @ =0x020165C8
	ldr r6, _080629C4 @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r7, #0
	adds r1, r6, #0
	bl CpuFastSet
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r4, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080629B4
	adds r0, r7, #0
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, _080629C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080629B4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080629C0: .4byte 0x020165C8
_080629C4: .4byte gPal
_080629C8: .4byte 0x0201774C

	thumb_func_start sub_080629CC
sub_080629CC: @ 0x080629CC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08062A18 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062A1C @ =0x08C134C8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08062A20 @ =0x08C463C4
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, _08062A24 @ =0x082DF908
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08062A28 @ =0x082DFEB4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062A18: .4byte 0x0201774C
_08062A1C: .4byte 0x08C134C8
_08062A20: .4byte 0x08C463C4
_08062A24: .4byte 0x082DF908
_08062A28: .4byte 0x082DFEB4

	thumb_func_start sub_08062A2C
sub_08062A2C: @ 0x08062A2C
	ldr r1, _08062A38 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062A38: .4byte 0x0201774C

	thumb_func_start sub_08062A3C
sub_08062A3C: @ 0x08062A3C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08062A88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062A8C @ =0x08C134E8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08062A90 @ =0x08C463DC
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, _08062A94 @ =0x082DF908
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08062A98 @ =0x082DFEB4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062A88: .4byte 0x0201774C
_08062A8C: .4byte 0x08C134E8
_08062A90: .4byte 0x08C463DC
_08062A94: .4byte 0x082DF908
_08062A98: .4byte 0x082DFEB4

	thumb_func_start sub_08062A9C
sub_08062A9C: @ 0x08062A9C
	ldr r1, _08062AA8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062AA8: .4byte 0x0201774C

	thumb_func_start sub_08062AAC
sub_08062AAC: @ 0x08062AAC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08062AE4 @ =0x08C13508
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062AE4: .4byte 0x08C13508

	thumb_func_start sub_08062AE8
sub_08062AE8: @ 0x08062AE8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08062B20 @ =0x08C13508
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #2
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062B20: .4byte 0x08C13508

	thumb_func_start sub_08062B24
sub_08062B24: @ 0x08062B24
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08062B5C @ =0x08C13508
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #3
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062B5C: .4byte 0x08C13508

	thumb_func_start sub_08062B60
sub_08062B60: @ 0x08062B60
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08062B98 @ =0x08C13508
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062B98: .4byte 0x08C13508

	thumb_func_start sub_08062B9C
sub_08062B9C: @ 0x08062B9C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne _08062C30
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	bl sub_080577AC
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	bl sub_08057888
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl sub_080565FC
	adds r0, r4, #0
	movs r1, #0x64
	bl sub_0805618C
	ldr r3, _08062C44 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_080566F0
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl sub_080566F0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl PlaySFX
_08062C30:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne _08062C48
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _08062C5E
	.align 2, 0
_08062C44: .4byte gDispIo
_08062C48:
	cmp r0, #0xa5
	bne _08062C5E
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08062C5E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08062C68
sub_08062C68: @ 0x08062C68
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08062C90 @ =0x08C13520
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r5, [r0]
	ldr r0, _08062C94 @ =0x081DFC50
	ldr r1, _08062C98 @ =0x06012000
	bl LZ77UnCompVram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062C90: .4byte 0x08C13520
_08062C94: .4byte 0x081DFC50
_08062C98: .4byte 0x06012000

	thumb_func_start sub_08062C9C
sub_08062C9C: @ 0x08062C9C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08062CBA
	ldr r0, [r1, #0x5c]
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_08062CC8
	b _08062CC4
_08062CBA:
	cmp r0, #0xa
	bne _08062CC4
	adds r0, r1, #0
	bl Proc_Break
_08062CC4:
	pop {r0}
	bx r0

	thumb_func_start sub_08062CC8
sub_08062CC8: @ 0x08062CC8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08062CEC @ =0x08C13538
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	cmp r4, #0
	bne _08062CF4
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _08062CF0 @ =0x08C0CD3C
	b _08062CFA
	.align 2, 0
_08062CEC: .4byte 0x08C13538
_08062CF0: .4byte 0x08C0CD3C
_08062CF4:
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _08062D34 @ =0x08C0CDB0
_08062CFA:
	adds r0, r5, #0
	bl GetAnimPosition
	movs r2, #0xa2
	lsls r2, r2, #7
	cmp r0, #0
	bne _08062D0C
	movs r2, #0xc2
	lsls r2, r2, #7
_08062D0C:
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r3, #4
	ldrsh r1, [r5, r3]
	subs r1, #0x28
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	adds r2, r4, #0
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x60]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062D34: .4byte 0x08C0CDB0

	thumb_func_start sub_08062D38
sub_08062D38: @ 0x08062D38
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08062D60
	ldr r0, [r4, #0x60]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08062D60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxPierceCritical
NewEfxPierceCritical: @ 0x08062D68
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_ClearBG1Position
	ldr r0, _08062D84 @ =0x08C13550
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062D84: .4byte 0x08C13550

	thumb_func_start sub_08062D88
sub_08062D88: @ 0x08062D88
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08062DA8
	ldr r0, [r4, #0x5c]
	bl sub_08062DB8
	ldr r0, [r4, #0x5c]
	bl sub_08062E30
	b _08062DB2
_08062DA8:
	cmp r0, #0x11
	bne _08062DB2
	adds r0, r4, #0
	bl Proc_Break
_08062DB2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08062DB8
sub_08062DB8: @ 0x08062DB8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08062DF4 @ =0x08C13568
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08062DF8 @ =0x081F74D8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08062DFC @ =0x081F85B8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, _08062E00 @ =0x081F87B8
	ldr r2, _08062E04 @ =0x081F8C58
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062DF4: .4byte 0x08C13568
_08062DF8: .4byte 0x081F74D8
_08062DFC: .4byte 0x081F85B8
_08062E00: .4byte 0x081F87B8
_08062E04: .4byte 0x081F8C58

	thumb_func_start sub_08062E08
sub_08062E08: @ 0x08062E08
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08062E28
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08062E28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08062E30
sub_08062E30: @ 0x08062E30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08062E54 @ =0x08C13580
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08062E58 @ =0x081EF2C4
	str r1, [r0, #0x48]
	ldr r1, _08062E5C @ =0x081F85B8
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062E54: .4byte 0x08C13580
_08062E58: .4byte 0x081EF2C4
_08062E5C: .4byte 0x081F85B8

	thumb_func_start sub_08062E60
sub_08062E60: @ 0x08062E60
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08062E86
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08062E94
_08062E86:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08062E94
	adds r0, r4, #0
	bl Proc_Break
_08062E94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxNormalEffect
NewEfxNormalEffect: @ 0x08062E9C
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_ClearBG1Position
	ldr r0, _08062EB8 @ =0x08C135A0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062EB8: .4byte 0x08C135A0

	thumb_func_start sub_08062EBC
sub_08062EBC: @ 0x08062EBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08062EE0
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_0804F7B8
	b _08062EF6
_08062EE0:
	cmp r0, #4
	bne _08062EEC
	adds r0, r1, #0
	bl sub_08062EFC
	b _08062EF6
_08062EEC:
	cmp r0, #0x18
	bne _08062EF6
	adds r0, r4, #0
	bl Proc_Break
_08062EF6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08062EFC
sub_08062EFC: @ 0x08062EFC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08062F5C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062F60 @ =0x08C135B8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08062F64 @ =0x081EF306
	str r0, [r5, #0x48]
	ldr r0, _08062F68 @ =0x08C135D0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08062F6C @ =0x081F9600
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08062F70 @ =0x081F9238
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08062F74 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08062F82
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062F78
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08062F82
	.align 2, 0
_08062F5C: .4byte 0x0201774C
_08062F60: .4byte 0x08C135B8
_08062F64: .4byte 0x081EF306
_08062F68: .4byte 0x08C135D0
_08062F6C: .4byte 0x081F9600
_08062F70: .4byte 0x081F9238
_08062F74: .4byte gEkrDistanceType
_08062F78:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08062F82:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08062F88
sub_08062F88: @ 0x08062F88
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08062FB6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08062FD4
_08062FB6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08062FD4
	bl SpellFx_ClearBG1
	ldr r1, _08062FDC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08062FD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062FDC: .4byte 0x0201774C

	thumb_func_start NewEfxYushaSpinShield
NewEfxYushaSpinShield: @ 0x08062FE0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08063004 @ =0x08C135F8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08063014
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063004: .4byte 0x08C135F8

	thumb_func_start sub_08063008
sub_08063008: @ 0x08063008
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063014
sub_08063014: @ 0x08063014
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0806303C @ =0x08C13610
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _08063048
	ldr r2, _08063040 @ =0x08C1CC3C
	ldr r3, _08063044 @ =0x08C1DEDC
	b _0806304C
	.align 2, 0
_0806303C: .4byte 0x08C13610
_08063040: .4byte 0x08C1CC3C
_08063044: .4byte 0x08C1DEDC
_08063048:
	ldr r2, _08063078 @ =0x08C1F1AC
	ldr r3, _0806307C @ =0x08C2047C
_0806304C:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_08050BF8
	adds r4, r0, #0
	str r4, [r5, #0x60]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0
	strh r0, [r4, #8]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08063080
	movs r1, #0xe4
	lsls r1, r1, #7
	b _08063084
	.align 2, 0
_08063078: .4byte 0x08C1F1AC
_0806307C: .4byte 0x08C2047C
_08063080:
	movs r1, #0x93
	lsls r1, r1, #8
_08063084:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08063094
sub_08063094: @ 0x08063094
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	bne _080630F2
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080630CC
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080630C4
	ldr r0, _080630C0 @ =0x08C1DFE0
	b _080630E2
	.align 2, 0
_080630C0: .4byte 0x08C1DFE0
_080630C4:
	ldr r0, _080630C8 @ =0x08C1CD40
	b _080630E2
	.align 2, 0
_080630C8: .4byte 0x08C1CD40
_080630CC:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080630E0
	ldr r0, _080630DC @ =0x08C20580
	b _080630E2
	.align 2, 0
_080630DC: .4byte 0x08C20580
_080630E0:
	ldr r0, _080630F8 @ =0x08C1F2B0
_080630E2:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_080630F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080630F8: .4byte 0x08C1F2B0

	thumb_func_start sub_080630FC
sub_080630FC: @ 0x080630FC
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	ldrh r2, [r0, #0x10]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0806311E
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0806311E
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0806311E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063124
sub_08063124: @ 0x08063124
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	bl sub_0804DD50
	cmp r0, #1
	bne _0806317E
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08063158
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08063150
	ldr r0, _0806314C @ =0x08C1E008
	b _0806316E
	.align 2, 0
_0806314C: .4byte 0x08C1E008
_08063150:
	ldr r0, _08063154 @ =0x08C1CD68
	b _0806316E
	.align 2, 0
_08063154: .4byte 0x08C1CD68
_08063158:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806316C
	ldr r0, _08063168 @ =0x08C205A8
	b _0806316E
	.align 2, 0
_08063168: .4byte 0x08C205A8
_0806316C:
	ldr r0, _08063184 @ =0x08C1F2D8
_0806316E:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806317E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063184: .4byte 0x08C1F2D8

	thumb_func_start sub_08063188
sub_08063188: @ 0x08063188
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080631AA
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080631AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxHurtmutEff00
NewEfxHurtmutEff00: @ 0x080631B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080631DC @ =0x0201774C
	ldr r5, [r0]
	cmp r5, #0
	bne _080631EE
	ldr r0, _080631E0 @ =0x08C13640
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	ldr r0, _080631E4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080631E8
	adds r0, r4, #0
	bl sub_08063200
	b _080631EE
	.align 2, 0
_080631DC: .4byte 0x0201774C
_080631E0: .4byte 0x08C13640
_080631E4: .4byte gEkrDistanceType
_080631E8:
	adds r0, r4, #0
	bl sub_08063300
_080631EE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080631F4
sub_080631F4: @ 0x080631F4
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063200
sub_08063200: @ 0x08063200
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063238 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806323C @ =0x08C13658
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08063240 @ =0x08C10828
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063238: .4byte 0x0201774C
_0806323C: .4byte 0x08C13658
_08063240: .4byte 0x08C10828

	thumb_func_start sub_08063244
sub_08063244: @ 0x08063244
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _0806325C
	ldr r0, _08063258 @ =0x08C1757C
	b _0806325E
	.align 2, 0
_08063258: .4byte 0x08C1757C
_0806325C:
	ldr r0, _08063284 @ =0x08C178E8
_0806325E:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08063288 @ =0x081F5F34
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806328C @ =0x081F4EB0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063284: .4byte 0x08C178E8
_08063288: .4byte 0x081F5F34
_0806328C: .4byte 0x081F4EB0

	thumb_func_start sub_08063290
sub_08063290: @ 0x08063290
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _080632A8
	ldr r0, _080632A4 @ =0x08C17BD0
	b _080632AA
	.align 2, 0
_080632A4: .4byte 0x08C17BD0
_080632A8:
	ldr r0, _080632D0 @ =0x08C17E2C
_080632AA:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _080632D4 @ =0x081F5F34
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080632D8 @ =0x081F5750
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080632D0: .4byte 0x08C17E2C
_080632D4: .4byte 0x081F5F34
_080632D8: .4byte 0x081F5750

	thumb_func_start sub_080632DC
sub_080632DC: @ 0x080632DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080632FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080632FC: .4byte 0x0201774C

	thumb_func_start sub_08063300
sub_08063300: @ 0x08063300
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063338 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806333C @ =0x08C13690
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08063340 @ =0x08C10828
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063338: .4byte 0x0201774C
_0806333C: .4byte 0x08C13690
_08063340: .4byte 0x08C10828

	thumb_func_start sub_08063344
sub_08063344: @ 0x08063344
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _0806335C
	ldr r0, _08063358 @ =0x08C175C4
	b _0806335E
	.align 2, 0
_08063358: .4byte 0x08C175C4
_0806335C:
	ldr r0, _08063384 @ =0x08C17930
_0806335E:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08063388 @ =0x081F5F34
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806338C @ =0x081F4EB0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063384: .4byte 0x08C17930
_08063388: .4byte 0x081F5F34
_0806338C: .4byte 0x081F4EB0

	thumb_func_start sub_08063390
sub_08063390: @ 0x08063390
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _080633A8
	ldr r0, _080633A4 @ =0x08C17BE0
	b _080633AA
	.align 2, 0
_080633A4: .4byte 0x08C17BE0
_080633A8:
	ldr r0, _080633D0 @ =0x08C17E3C
_080633AA:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _080633D4 @ =0x081F5F34
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080633D8 @ =0x081F5750
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080633D0: .4byte 0x08C17E3C
_080633D4: .4byte 0x081F5F34
_080633D8: .4byte 0x081F5750

	thumb_func_start sub_080633DC
sub_080633DC: @ 0x080633DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080633FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080633FC: .4byte 0x0201774C

	thumb_func_start NewEfxMagfcast
NewEfxMagfcast: @ 0x08063400
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08063444 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _08063458
	bl SpellFx_ClearBG1Position
	ldr r0, _08063448 @ =0x08C136C8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	strh r4, [r5, #0x2c]
	ldr r4, _0806344C @ =0x0203E066
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x57
	blt _08063450
	cmp r0, #0x58
	bgt _08063450
	ldr r0, [r5, #0x5c]
	adds r1, r7, #0
	bl sub_0806347C
	b _08063458
	.align 2, 0
_08063444: .4byte 0x0201774C
_08063448: .4byte 0x08C136C8
_0806344C: .4byte 0x0203E066
_08063450:
	ldr r0, [r5, #0x5c]
	adds r1, r7, #2
	bl sub_0806347C
_08063458:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063460
sub_08063460: @ 0x08063460
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08063478
	adds r0, r1, #0
	bl Proc_Break
_08063478:
	pop {r0}
	bx r0

	thumb_func_start sub_0806347C
sub_0806347C: @ 0x0806347C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _080634B0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080634B4 @ =0x08C136E0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	cmp r5, #1
	beq _080634C8
	cmp r5, #1
	blo _080634B8
	cmp r5, #2
	beq _080634D8
	cmp r5, #3
	beq _080634EC
	b _08063502
	.align 2, 0
_080634B0: .4byte 0x0201774C
_080634B4: .4byte 0x08C136E0
_080634B8:
	ldr r0, _080634C0 @ =0x081EF330
	str r0, [r4, #0x48]
	ldr r0, _080634C4 @ =0x08C136F8
	b _080634DE
	.align 2, 0
_080634C0: .4byte 0x081EF330
_080634C4: .4byte 0x08C136F8
_080634C8:
	ldr r0, _080634D0 @ =0x081EF346
	str r0, [r4, #0x48]
	ldr r0, _080634D4 @ =0x08C136F8
	b _080634DE
	.align 2, 0
_080634D0: .4byte 0x081EF346
_080634D4: .4byte 0x08C136F8
_080634D8:
	ldr r0, _080634E4 @ =0x081EF34C
	str r0, [r4, #0x48]
	ldr r0, _080634E8 @ =0x08C13710
_080634DE:
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	b _08063502
	.align 2, 0
_080634E4: .4byte 0x081EF34C
_080634E8: .4byte 0x08C13710
_080634EC:
	ldr r0, _08063538 @ =0x081EF36E
	str r0, [r4, #0x48]
	ldr r0, _0806353C @ =0x08C13710
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldrb r1, [r6, #0x14]
	adds r0, r1, r6
	ldrb r1, [r0, #0x14]
	adds r0, r6, #0
	bl EfxPlaySEwithCmdCtrl
_08063502:
	ldr r0, _08063540 @ =0x081FDFA0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08063544 @ =0x081FECF4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08063548 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08063556
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806354C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08063556
	.align 2, 0
_08063538: .4byte 0x081EF36E
_0806353C: .4byte 0x08C13710
_08063540: .4byte 0x081FDFA0
_08063544: .4byte 0x081FECF4
_08063548: .4byte gEkrDistanceType
_0806354C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08063556:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0806355C
sub_0806355C: @ 0x0806355C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806358A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080635A8
_0806358A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080635A8
	bl SpellFx_ClearBG1
	ldr r1, _080635B0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
_080635A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080635B0: .4byte 0x0201774C

	thumb_func_start NewEfxSunakemuri
NewEfxSunakemuri: @ 0x080635B4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080635DC @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _080635D6
	ldr r0, _080635E0 @ =0x08C13750
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080635F0
_080635D6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080635DC: .4byte 0x0201774C
_080635E0: .4byte 0x08C13750

	thumb_func_start sub_080635E4
sub_080635E4: @ 0x080635E4
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080635F0
sub_080635F0: @ 0x080635F0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _08063658 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806365C @ =0x08C13768
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _08063660 @ =0x08C2066C
	cmp r4, #0
	beq _0806361E
	ldr r2, _08063664 @ =0x08C208FC
	cmp r4, #1
	bne _0806361E
	ldr r2, _08063668 @ =0x08C207B4
_0806361E:
	ldr r3, _0806366C @ =0x08C20710
	cmp r4, #0
	beq _0806362C
	ldr r3, _08063670 @ =0x08C209A0
	cmp r4, #1
	bne _0806362C
	ldr r3, _08063674 @ =0x08C20858
_0806362C:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_08050BF8
	str r0, [r5, #0x60]
	ldr r4, _08063678 @ =0x0203E0B0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x40
	bls _0806364E
	b _080637B8
_0806364E:
	lsls r0, r0, #2
	ldr r1, _0806367C @ =_08063680
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063658: .4byte 0x0201774C
_0806365C: .4byte 0x08C13768
_08063660: .4byte 0x08C2066C
_08063664: .4byte 0x08C208FC
_08063668: .4byte 0x08C207B4
_0806366C: .4byte 0x08C20710
_08063670: .4byte 0x08C209A0
_08063674: .4byte 0x08C20858
_08063678: .4byte 0x0203E0B0
_0806367C: .4byte _08063680
_08063680: @ jump table
	.4byte _080637B8 @ case 0
	.4byte _08063784 @ case 1
	.4byte _08063784 @ case 2
	.4byte _08063784 @ case 3
	.4byte _08063784 @ case 4
	.4byte _08063784 @ case 5
	.4byte _080637B0 @ case 6
	.4byte _080637B0 @ case 7
	.4byte _080637B0 @ case 8
	.4byte _080637B0 @ case 9
	.4byte _08063784 @ case 10
	.4byte _080637B0 @ case 11
	.4byte _08063784 @ case 12
	.4byte _08063784 @ case 13
	.4byte _08063784 @ case 14
	.4byte _08063784 @ case 15
	.4byte _080637A0 @ case 16
	.4byte _08063784 @ case 17
	.4byte _08063784 @ case 18
	.4byte _08063784 @ case 19
	.4byte _0806378C @ case 20
	.4byte _080637A0 @ case 21
	.4byte _080637A0 @ case 22
	.4byte _080637B0 @ case 23
	.4byte _080637B0 @ case 24
	.4byte _08063784 @ case 25
	.4byte _08063784 @ case 26
	.4byte _08063784 @ case 27
	.4byte _08063784 @ case 28
	.4byte _080637B0 @ case 29
	.4byte _080637B0 @ case 30
	.4byte _080637B0 @ case 31
	.4byte _080637B0 @ case 32
	.4byte _080637B0 @ case 33
	.4byte _08063784 @ case 34
	.4byte _08063784 @ case 35
	.4byte _080637B0 @ case 36
	.4byte _08063784 @ case 37
	.4byte _08063784 @ case 38
	.4byte _08063784 @ case 39
	.4byte _08063784 @ case 40
	.4byte _08063784 @ case 41
	.4byte _08063784 @ case 42
	.4byte _08063784 @ case 43
	.4byte _080637B8 @ case 44
	.4byte _080637B0 @ case 45
	.4byte _080637B8 @ case 46
	.4byte _08063784 @ case 47
	.4byte _080637B0 @ case 48
	.4byte _080637B0 @ case 49
	.4byte _080637B0 @ case 50
	.4byte _08063784 @ case 51
	.4byte _080637B8 @ case 52
	.4byte _080637B8 @ case 53
	.4byte _080637A0 @ case 54
	.4byte _080637B0 @ case 55
	.4byte _08063784 @ case 56
	.4byte _08063784 @ case 57
	.4byte _08063784 @ case 58
	.4byte _08063784 @ case 59
	.4byte _080637A0 @ case 60
	.4byte _08063784 @ case 61
	.4byte _080637B0 @ case 62
	.4byte _08063784 @ case 63
	.4byte _08063784 @ case 64
_08063784:
	ldr r0, _08063788 @ =0x082010C8
	b _080637A2
	.align 2, 0
_08063788: .4byte 0x082010C8
_0806378C:
	ldr r0, [r5, #0x5c]
	bl IsAnimSoundInPositionMaybe
	cmp r0, #0
	beq _080637A0
	ldr r0, _0806379C @ =0x082010C8
	b _080637A2
	.align 2, 0
_0806379C: .4byte 0x082010C8
_080637A0:
	ldr r0, _080637AC @ =0x082010E8
_080637A2:
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	b _080637B8
	.align 2, 0
_080637AC: .4byte 0x082010E8
_080637B0:
	ldr r0, _080637CC @ =0x08201108
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
_080637B8:
	ldr r0, _080637D0 @ =0x08200C58
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080637CC: .4byte 0x08201108
_080637D0: .4byte 0x08200C58

	thumb_func_start sub_080637D4
sub_080637D4: @ 0x080637D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080637FA
	ldr r0, _08063800 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080637FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063800: .4byte 0x0201774C

	thumb_func_start NewEfxLokmsuna
NewEfxLokmsuna: @ 0x08063804
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08063828 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _08063822
	ldr r0, _0806382C @ =0x08C13780
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	bl sub_0806383C
_08063822:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063828: .4byte 0x0201774C
_0806382C: .4byte 0x08C13780

	thumb_func_start sub_08063830
sub_08063830: @ 0x08063830
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806383C
sub_0806383C: @ 0x0806383C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063888 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806388C @ =0x08C13798
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _08063890 @ =0x08C48524
	ldr r3, _08063894 @ =0x08C48648
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_08050BF8
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, _08063898 @ =0x00000FFF
	ldrh r1, [r6, #8]
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806389C
	movs r1, #0xe0
	lsls r1, r1, #7
	b _080638A0
	.align 2, 0
_08063888: .4byte 0x0201774C
_0806388C: .4byte 0x08C13798
_08063890: .4byte 0x08C48524
_08063894: .4byte 0x08C48648
_08063898: .4byte 0x00000FFF
_0806389C:
	movs r1, #0x90
	lsls r1, r1, #8
_080638A0:
	adds r0, r1, #0
	ldrh r1, [r6, #8]
	orrs r0, r1
	strh r0, [r6, #8]
	ldr r0, _080638BC @ =0x082E4074
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080638BC: .4byte 0x082E4074

	thumb_func_start sub_080638C0
sub_080638C0: @ 0x080638C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _080638E6
	ldr r0, _080638EC @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080638E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080638EC: .4byte 0x0201774C

	thumb_func_start NewEfxKingPika
NewEfxKingPika: @ 0x080638F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063908 @ =0x08C137B0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063908: .4byte 0x08C137B0

	thumb_func_start sub_0806390C
sub_0806390C: @ 0x0806390C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806392E
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x28
	movs r3, #0
	bl sub_0804FD74
	b _08063972
_0806392E:
	cmp r0, #0xa
	bne _0806393C
	adds r0, r6, #0
	movs r1, #0x14
	bl sub_0804F7B8
	b _08063972
_0806393C:
	cmp r0, #0x2d
	bne _08063972
	ldr r5, _08063978 @ =gAnims
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl Proc_Break
_08063972:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063978: .4byte gAnims

	thumb_func_start NewEfxFlashFX
NewEfxFlashFX: @ 0x0806397C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063994 @ =0x08C137C8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063994: .4byte 0x08C137C8

	thumb_func_start sub_08063998
sub_08063998: @ 0x08063998
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080639B6
	adds r0, r6, #0
	movs r1, #5
	bl sub_0804F7B8
	b _080639EC
_080639B6:
	cmp r0, #6
	bne _080639EC
	ldr r5, _080639F4 @ =gAnims
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl Proc_Break
_080639EC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080639F4: .4byte gAnims

	thumb_func_start sub_080639F8
sub_080639F8: @ 0x080639F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063A58 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063A5C @ =0x08C137E0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08063A60 @ =0x08C159AC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _08063A64 @ =0x081F1574
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063A68 @ =0x081F1400
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl PlaySFX
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063A58: .4byte 0x0201774C
_08063A5C: .4byte 0x08C137E0
_08063A60: .4byte 0x08C159AC
_08063A64: .4byte 0x081F1574
_08063A68: .4byte 0x081F1400

	thumb_func_start sub_08063A6C
sub_08063A6C: @ 0x08063A6C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _08063A90
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl PlaySFX
_08063A90:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _08063AB0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08063AB8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08063AB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063AB8: .4byte 0x0201774C

	thumb_func_start sub_08063ABC
sub_08063ABC: @ 0x08063ABC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063B1C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063B20 @ =0x08C137F8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x19
	strh r0, [r4, #0x2e]
	ldr r3, _08063B24 @ =0x08C1597C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_08050BF8
	str r0, [r4, #0x60]
	ldr r0, _08063B28 @ =0x081F1574
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063B2C @ =0x081F1400
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe1
	movs r3, #1
	bl PlaySFX
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063B1C: .4byte 0x0201774C
_08063B20: .4byte 0x08C137F8
_08063B24: .4byte 0x08C1597C
_08063B28: .4byte 0x081F1574
_08063B2C: .4byte 0x081F1400

	thumb_func_start sub_08063B30
sub_08063B30: @ 0x08063B30
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08063B58
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08063B60 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08063B58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063B60: .4byte 0x0201774C

	thumb_func_start NewEfxSpecalEffect
NewEfxSpecalEffect: @ 0x08063B64
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08063B98 @ =0x02017768
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08063BB2
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	strh r1, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08063BA0
	ldr r0, _08063B9C @ =gpEkrBattleUnitLeft
	b _08063BA2
	.align 2, 0
_08063B98: .4byte 0x02017768
_08063B9C: .4byte gpEkrBattleUnitLeft
_08063BA0:
	ldr r0, _08063BE0 @ =gpEkrBattleUnitRight
_08063BA2:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsWeaponLegency
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08063BE8
_08063BB2:
	ldr r4, _08063BE4 @ =gAnims
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	movs r1, #0x40
	ldrh r0, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	b _08063C0A
	.align 2, 0
_08063BE0: .4byte gpEkrBattleUnitRight
_08063BE4: .4byte gAnims
_08063BE8:
	ldr r0, _08063C10 @ =0x08C13810
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xf0
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r5, #0
	bl sub_08063C20
_08063C0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063C10: .4byte 0x08C13810

	thumb_func_start sub_08063C14
sub_08063C14: @ 0x08063C14
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063C20
sub_08063C20: @ 0x08063C20
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_ClearBG1Position
	ldr r0, _08063C3C @ =0x08C13828
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063C3C: .4byte 0x08C13828

	thumb_func_start sub_08063C40
sub_08063C40: @ 0x08063C40
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063C5A
	ldr r0, [r6, #0x5c]
	bl sub_08063CB0
	b _08063CA4
_08063C5A:
	cmp r0, #0x15
	bne _08063C6E
	ldr r0, [r6, #0x5c]
	movs r1, #0x2d
	movs r2, #1
	bl sub_080565FC
	bl sub_08063D24
	b _08063CA4
_08063C6E:
	cmp r0, #0x46
	bne _08063CA4
	ldr r5, _08063CAC @ =gAnims
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_08063CA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063CAC: .4byte gAnims

	thumb_func_start sub_08063CB0
sub_08063CB0: @ 0x08063CB0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08063CEC @ =0x08C13840
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08063CF0 @ =0x081F90B4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08063CF4 @ =0x081F9174
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r2, _08063CF8 @ =0x081F9194
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063CEC: .4byte 0x08C13840
_08063CF0: .4byte 0x081F90B4
_08063CF4: .4byte 0x081F9174
_08063CF8: .4byte 0x081F9194

	thumb_func_start sub_08063CFC
sub_08063CFC: @ 0x08063CFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08063D1C
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08063D1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063D24
sub_08063D24: @ 0x08063D24
	push {lr}
	ldr r0, _08063D40 @ =0x08C13858
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl sub_08063DC8
	pop {r0}
	bx r0
	.align 2, 0
_08063D40: .4byte 0x08C13858

	thumb_func_start sub_08063D44
sub_08063D44: @ 0x08063D44
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, _08063D8C @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _08063D90 @ =0x0201FDB8
	cmp r0, #0
	bne _08063D54
	ldr r4, _08063D94 @ =0x0201FEF8
_08063D54:
	movs r3, #0
	movs r7, #0x88
	lsls r7, r7, #0x10
	movs r6, #0x88
	ldr r5, _08063D98 @ =0x08C13888
_08063D5E:
	cmp r3, #0x77
	bhi _08063DAA
	movs r0, #0
	ldrsh r1, [r5, r0]
	mov r2, ip
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08063DA6
	cmp r3, #0x3b
	bhi _08063DA0
	adds r0, r3, #0
	subs r0, #0x88
	cmp r1, r0
	bhs _08063DA6
	ldr r1, _08063D9C @ =0x0000FF78
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08063DA6
	.align 2, 0
_08063D8C: .4byte 0x0201FDAC
_08063D90: .4byte 0x0201FDB8
_08063D94: .4byte 0x0201FEF8
_08063D98: .4byte 0x08C13888
_08063D9C: .4byte 0x0000FF78
_08063DA0:
	cmp r1, r6
	bls _08063DA6
	lsrs r2, r7, #0x10
_08063DA6:
	strh r2, [r4]
	b _08063DAE
_08063DAA:
	movs r0, #0
	strh r0, [r4]
_08063DAE:
	adds r4, #2
	ldr r2, _08063DC4 @ =0xFFFF0000
	adds r7, r7, r2
	subs r6, #1
	adds r5, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _08063D5E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063DC4: .4byte 0xFFFF0000

	thumb_func_start sub_08063DC8
sub_08063DC8: @ 0x08063DC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063DE4 @ =0x08C13870
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063DE4: .4byte 0x08C13870

	thumb_func_start sub_08063DE8
sub_08063DE8: @ 0x08063DE8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08063E24
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08063E24:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08063E2C
sub_08063E2C: @ 0x08063E2C
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_ClearBG1Position
	ldr r0, _08063E48 @ =0x08C13978
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063E48: .4byte 0x08C13978

	thumb_func_start sub_08063E4C
sub_08063E4C: @ 0x08063E4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08063E82
	ldr r0, [r5, #0x5c]
	movs r1, #0x49
	bl sub_08063E94
	movs r4, #0xa0
	lsls r4, r4, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	ldr r0, [r5, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08063E82:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x64
	bne _08063E8E
	adds r0, r5, #0
	bl Proc_Break
_08063E8E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08063E94
sub_08063E94: @ 0x08063E94
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08063F14 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063F18 @ =0x08C13990
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _08063F1C @ =0x081EF390
	str r1, [r0, #0x48]
	ldr r1, _08063F20 @ =0x08C139A8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08063F24 @ =0x082008AC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08063F28 @ =0x081FFC38
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r3, _08063F2C @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063F14: .4byte 0x0201774C
_08063F18: .4byte 0x08C13990
_08063F1C: .4byte 0x081EF390
_08063F20: .4byte 0x08C139A8
_08063F24: .4byte 0x082008AC
_08063F28: .4byte 0x081FFC38
_08063F2C: .4byte gDispIo

	thumb_func_start sub_08063F30
sub_08063F30: @ 0x08063F30
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08063F5C
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
_08063F5C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08063FAE
	ldr r3, _08063FB4 @ =gDispIo
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
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	bl SpellFx_ClearBG1
	ldr r1, _08063FB8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08063FAE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063FB4: .4byte gDispIo
_08063FB8: .4byte 0x0201774C

	thumb_func_start NewEfxMantBatabata
NewEfxMantBatabata: @ 0x08063FBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetAnimPosition
	ldr r1, _08063FE8 @ =0x0203E066
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x57
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1b
	bhi _080640B0
	lsls r0, r0, #2
	ldr r1, _08063FEC @ =_08063FF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063FE8: .4byte 0x0203E066
_08063FEC: .4byte _08063FF0
_08063FF0: @ jump table
	.4byte _08064060 @ case 0
	.4byte _08064060 @ case 1
	.4byte _08064070 @ case 2
	.4byte _080640B0 @ case 3
	.4byte _08064070 @ case 4
	.4byte _080640B0 @ case 5
	.4byte _080640B0 @ case 6
	.4byte _080640B0 @ case 7
	.4byte _080640B0 @ case 8
	.4byte _080640B0 @ case 9
	.4byte _080640B0 @ case 10
	.4byte _080640B0 @ case 11
	.4byte _080640B0 @ case 12
	.4byte _080640B0 @ case 13
	.4byte _080640B0 @ case 14
	.4byte _080640B0 @ case 15
	.4byte _080640B0 @ case 16
	.4byte _08064080 @ case 17
	.4byte _080640B0 @ case 18
	.4byte _080640B0 @ case 19
	.4byte _080640A0 @ case 20
	.4byte _080640A0 @ case 21
	.4byte _080640B0 @ case 22
	.4byte _080640B0 @ case 23
	.4byte _080640B0 @ case 24
	.4byte _080640B0 @ case 25
	.4byte _08064090 @ case 26
	.4byte _08064090 @ case 27
_08064060:
	ldr r5, _08064068 @ =0x08C20B34
	ldr r4, _0806406C @ =0x08C20CC8
	b _080640B4
	.align 2, 0
_08064068: .4byte 0x08C20B34
_0806406C: .4byte 0x08C20CC8
_08064070:
	ldr r5, _08064078 @ =0x08C20E74
	ldr r4, _0806407C @ =0x08C21020
	b _080640B4
	.align 2, 0
_08064078: .4byte 0x08C20E74
_0806407C: .4byte 0x08C21020
_08064080:
	ldr r5, _08064088 @ =0x08C211CC
	ldr r4, _0806408C @ =0x08C21374
	b _080640B4
	.align 2, 0
_08064088: .4byte 0x08C211CC
_0806408C: .4byte 0x08C21374
_08064090:
	ldr r5, _08064098 @ =0x08C214B0
	ldr r4, _0806409C @ =0x08C215E8
	b _080640B4
	.align 2, 0
_08064098: .4byte 0x08C214B0
_0806409C: .4byte 0x08C215E8
_080640A0:
	ldr r5, _080640A8 @ =0x08C2184C
	ldr r4, _080640AC @ =0x08C21AB4
	b _080640B4
	.align 2, 0
_080640A8: .4byte 0x08C2184C
_080640AC: .4byte 0x08C21AB4
_080640B0:
	ldr r5, _0806410C @ =0x08C21BD8
	ldr r4, _08064110 @ =0x08C21CFC
_080640B4:
	ldr r0, _08064114 @ =0x08C139B8
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r7, [r6, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r6, #0x2c]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08050BF8
	adds r4, r0, #0
	str r4, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08064118 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r6, #0x60]
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806411C
	movs r1, #0xe4
	lsls r1, r1, #7
	b _08064120
	.align 2, 0
_0806410C: .4byte 0x08C21BD8
_08064110: .4byte 0x08C21CFC
_08064114: .4byte 0x08C139B8
_08064118: .4byte 0x02000010
_0806411C:
	movs r1, #0x93
	lsls r1, r1, #8
_08064120:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064140
sub_08064140: @ 0x08064140
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldr r0, [r2, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldr r0, [r2, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08064166
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08064166
	adds r0, r2, #0
	bl Proc_Break
_08064166:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806416C
sub_0806416C: @ 0x0806416C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bl sub_0804DD50
	cmp r0, #1
	bne _080641A6
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _080641AC @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_080641A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641AC: .4byte 0x02000010

	thumb_func_start NewEfxChillEffect
NewEfxChillEffect: @ 0x080641B0
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_ClearBG1Position
	ldr r0, _080641CC @ =0x08C139D8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641CC: .4byte 0x08C139D8

	thumb_func_start sub_080641D0
sub_080641D0: @ 0x080641D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080641F0
	ldr r0, [r4, #0x5c]
	bl sub_08064214
	ldr r0, [r4, #0x5c]
	bl sub_080642C4
	b _0806420C
_080641F0:
	cmp r0, #3
	beq _080641F8
	cmp r0, #0x11
	bne _08064202
_080641F8:
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl sub_0804F834
	b _0806420C
_08064202:
	cmp r0, #0x24
	bne _0806420C
	adds r0, r4, #0
	bl Proc_Break
_0806420C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064214
sub_08064214: @ 0x08064214
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064258 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806425C @ =0x08C139F0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08064260 @ =0x081EF3AE
	str r1, [r0, #0x48]
	ldr r1, _08064264 @ =0x08C13A08
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08064268 @ =0x0829CBC4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064258: .4byte 0x0201774C
_0806425C: .4byte 0x08C139F0
_08064260: .4byte 0x081EF3AE
_08064264: .4byte 0x08C13A08
_08064268: .4byte 0x0829CBC4

	thumb_func_start sub_0806426C
sub_0806426C: @ 0x0806426C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806429A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080642B8
_0806429A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080642B8
	bl SpellFx_ClearBG1
	ldr r1, _080642C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080642B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080642C0: .4byte 0x0201774C

	thumb_func_start sub_080642C4
sub_080642C4: @ 0x080642C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080642E8 @ =0x08C13A14
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080642EC @ =0x081EF3BC
	str r1, [r0, #0x48]
	ldr r1, _080642F0 @ =0x082B99F0
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080642E8: .4byte 0x08C13A14
_080642EC: .4byte 0x081EF3BC
_080642F0: .4byte 0x082B99F0

	thumb_func_start sub_080642F4
sub_080642F4: @ 0x080642F4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806431A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08064328
_0806431A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064328
	adds r0, r4, #0
	bl Proc_Break
_08064328:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxChillAnime
NewEfxChillAnime: @ 0x08064330
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	cmp r1, #0
	bne _0806434C
	ldr r6, _08064344 @ =0x08C44990
	ldr r4, _08064348 @ =0x08C44B94
	b _08064350
	.align 2, 0
_08064344: .4byte 0x08C44990
_08064348: .4byte 0x08C44B94
_0806434C:
	ldr r6, _080643A8 @ =0x08C44F48
	ldr r4, _080643AC @ =0x08C452FC
_08064350:
	ldr r0, _080643B0 @ =0x08C13A34
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r6, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08050BF8
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _080643B4 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r5, #0x60]
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080643B8
	movs r1, #0xe4
	lsls r1, r1, #7
	b _080643BC
	.align 2, 0
_080643A8: .4byte 0x08C44F48
_080643AC: .4byte 0x08C452FC
_080643B0: .4byte 0x08C13A34
_080643B4: .4byte 0x02000010
_080643B8:
	movs r1, #0x93
	lsls r1, r1, #8
_080643BC:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080643DC
sub_080643DC: @ 0x080643DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08064448
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r6, #0x60]
	bl AnimDelete
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08064450 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r5, _08064454 @ =gAnims
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_08064448:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064450: .4byte 0x02000010
_08064454: .4byte gAnims

	thumb_func_start sub_08064458
sub_08064458: @ 0x08064458
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_ClearBG1Position
	ldr r0, _08064474 @ =0x08C13A4C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064474: .4byte 0x08C13A4C

	thumb_func_start sub_08064478
sub_08064478: @ 0x08064478
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080644C4
	adds r0, r1, #0
	bl sub_0806452C
	ldr r0, [r6, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _080644AA
	movs r0, #0xba
	lsls r0, r0, #2
	b _080644AC
_080644AA:
	ldr r0, _080644C0 @ =0x000002E3
_080644AC:
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08064520
	.align 2, 0
_080644C0: .4byte 0x000002E3
_080644C4:
	cmp r0, #0x1a
	bne _080644EA
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	bl sub_08064644
	adds r1, r0, #0
	ldr r0, [r6, #0x5c]
	movs r2, #0xa
	str r2, [sp]
	movs r3, #0x2d
	bl sub_080646EC
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	movs r2, #1
	bl sub_080565FC
	b _08064520
_080644EA:
	cmp r0, #0x6f
	bne _08064520
	ldr r5, _08064528 @ =gAnims
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_08064520:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064528: .4byte gAnims

	thumb_func_start sub_0806452C
sub_0806452C: @ 0x0806452C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080645A8 @ =0x08C13A64
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r4, #0
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _080645AC @ =0x081EF406
	str r0, [r5, #0x48]
	ldr r0, _080645B0 @ =0x08C13A7C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080645B4 @ =0x08C13AB0
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _080645B8 @ =0x082BE028
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, _080645BC @ =gDispIo
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
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #1
	movs r0, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _080645C0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080645CE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080645C4
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _080645CE
	.align 2, 0
_080645A8: .4byte 0x08C13A64
_080645AC: .4byte 0x081EF406
_080645B0: .4byte 0x08C13A7C
_080645B4: .4byte 0x08C13AB0
_080645B8: .4byte 0x082BE028
_080645BC: .4byte gDispIo
_080645C0: .4byte gEkrDistanceType
_080645C4:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_080645CE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080645D4
sub_080645D4: @ 0x080645D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064624
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0806460E
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_0806460E:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806463A
_08064624:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806463A
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0806463A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08064644
sub_08064644: @ 0x08064644
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08064668 @ =0x08C13AE4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [r0, #0x48]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08064668: .4byte 0x08C13AE4

	thumb_func_start sub_0806466C
sub_0806466C: @ 0x0806466C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _080646DC @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _080646E0 @ =0x0201FDB8
	cmp r0, #0
	bne _08064680
	ldr r4, _080646E4 @ =0x0201FEF8
_08064680:
	movs r3, #0
	ldr r0, [r2, #0x44]
	mov ip, r0
	ldr r1, _080646E8 @ =gSinLut
	mov r8, r1
	movs r6, #0xff
	ldr r5, [r2, #0x48]
_0806468E:
	lsls r0, r3, #1
	movs r7, #0x2e
	ldrsh r1, [r2, r7]
	adds r0, r0, r1
	ands r0, r6
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #9
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r0, r5, r0
	asrs r0, r0, #8
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0x4f
	bls _0806468E
	ldrh r0, [r2, #0x2e]
	adds r0, #2
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	bne _080646D0
	adds r0, r2, #0
	bl Proc_End
_080646D0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080646DC: .4byte 0x0201FDAC
_080646E0: .4byte 0x0201FDB8
_080646E4: .4byte 0x0201FEF8
_080646E8: .4byte gSinLut

	thumb_func_start sub_080646EC
sub_080646EC: @ 0x080646EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r0, _08064720 @ =0x08C13AFC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	str r7, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064720: .4byte 0x08C13AFC

	thumb_func_start sub_08064724
sub_08064724: @ 0x08064724
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	ldr r0, [r5, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r4, #0x48]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _0806475C
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806475C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08064764
sub_08064764: @ 0x08064764
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x48]
	cmp r0, r1
	ble _08064782
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_08064782:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064788
sub_08064788: @ 0x08064788
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	ldr r0, [r5, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x48]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x4c]
	cmp r0, r1
	ble _080647C0
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_080647C0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080647C8
sub_080647C8: @ 0x080647C8
	ldr r0, _080647D4 @ =0x0203E0CC
	movs r1, #0
	str r1, [r0]
	ldr r0, _080647D8 @ =0x0203E0D0
	str r1, [r0]
	bx lr
	.align 2, 0
_080647D4: .4byte 0x0203E0CC
_080647D8: .4byte 0x0203E0D0

	thumb_func_start sub_080647DC
sub_080647DC: @ 0x080647DC
	push {r4, lr}
	ldr r4, _080647F4 @ =0x0203E0CC
	ldr r0, [r4]
	cmp r0, #0
	beq _080647EE
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_080647EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080647F4: .4byte 0x0203E0CC

	thumb_func_start sub_080647F8
sub_080647F8: @ 0x080647F8
	push {r4, lr}
	ldr r4, _08064810 @ =0x0203E0D0
	ldr r0, [r4]
	cmp r0, #0
	beq _0806480A
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0806480A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064810: .4byte 0x0203E0D0

	thumb_func_start sub_08064814
sub_08064814: @ 0x08064814
	ldr r1, _0806481C @ =0x0203E0CC
	str r0, [r1]
	bx lr
	.align 2, 0
_0806481C: .4byte 0x0203E0CC

	thumb_func_start sub_08064820
sub_08064820: @ 0x08064820
	ldr r1, _08064828 @ =0x0203E0D0
	str r0, [r1]
	bx lr
	.align 2, 0
_08064828: .4byte 0x0203E0D0

	thumb_func_start sub_0806482C
sub_0806482C: @ 0x0806482C
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start sub_08064834
sub_08064834: @ 0x08064834
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064850
	ldr r0, _0806484C @ =0x081DE20D
	ldrh r1, [r4, #2]
	ldrb r0, [r0]
	subs r0, r1, r0
	b _08064858
	.align 2, 0
_0806484C: .4byte 0x081DE20D
_08064850:
	ldr r0, _08064888 @ =0x081DE212
	ldrb r0, [r0]
	ldrh r3, [r4, #2]
	subs r0, r0, r3
_08064858:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x58
	ldrh r4, [r4, #4]
	subs r2, r2, r4
	ldrh r0, [r5, #0x12]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r5, [r5, #4]
	subs r2, r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064888: .4byte 0x081DE212

	thumb_func_start sub_0806488C
sub_0806488C: @ 0x0806488C
	push {r4, lr}
	sub sp, #4
	bl sub_0806482C
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x14]
	ldr r2, _080648B8 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080648B8: .4byte 0x01000200

	thumb_func_start sub_080648BC
sub_080648BC: @ 0x080648BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_0806482C
	mov r8, r0
	cmp r4, #0
	bne _080648DC
	adds r0, r7, #0
	b _080648DE
_080648DC:
	adds r0, r6, #0
_080648DE:
	movs r1, #0x78
	bl AnimCreate
	adds r2, r0, #0
	mov r1, r8
	ldrh r1, [r1, #0x10]
	lsls r0, r1, #0xc
	mov r3, r8
	ldrh r3, [r3, #0xe]
	orrs r0, r3
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08064910
sub_08064910: @ 0x08064910
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r5, r3, #0
	bl sub_0806482C
	adds r4, r0, #0
	cmp r5, #1
	bne _08064932
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	bl LZ77UnCompWram
_08064932:
	adds r2, r6, #0
	cmp r5, #1
	bne _0806493A
	ldr r2, [r4, #0x1c]
_0806493A:
	cmp r7, #0
	bne _08064954
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08064968
_08064954:
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08064968:
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806497C
sub_0806497C: @ 0x0806497C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_0806482C
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	lsls r5, r0, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r5, r0
	ldr r1, [r4, #0x18]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x18]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080649AC
sub_080649AC: @ 0x080649AC
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0806482C
	ldrh r0, [r0, #0xc]
	lsls r1, r0, #5
	ldr r0, _080649D0 @ =gPal
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080649D0: .4byte gPal

	thumb_func_start sub_080649D4
sub_080649D4: @ 0x080649D4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_0806482C
	adds r4, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r5, r0, #5
	ldr r0, _08064A00 @ =0x06010000
	adds r5, r5, r0
	ldr r1, [r4, #0x20]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064A00: .4byte 0x06010000

	thumb_func_start sub_08064A04
sub_08064A04: @ 0x08064A04
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0806482C
	ldrh r0, [r0, #0x10]
	lsls r1, r0, #5
	ldr r0, _08064A28 @ =0x02022A60
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064A28: .4byte 0x02022A60

	thumb_func_start sub_08064A2C
sub_08064A2C: @ 0x08064A2C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0806482C
	ldr r1, _08064A4C @ =0x08C13B24
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064A4C: .4byte 0x08C13B24

	thumb_func_start nullsub_52
nullsub_52: @ 0x08064A50
	bx lr
	.align 2, 0

	thumb_func_start sub_08064A54
sub_08064A54: @ 0x08064A54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064A70 @ =0x08C13B44
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl sub_08064814
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064A70: .4byte 0x08C13B44

	thumb_func_start sub_08064A74
sub_08064A74: @ 0x08064A74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064A94
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064B40
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08064A94
sub_08064A94: @ 0x08064A94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_0806482C
	adds r6, r0, #0
	ldr r0, _08064AE0 @ =0x08C13B6C
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064AE4 @ =0x081EF4AC
	str r0, [r4, #0x48]
	ldr r0, _08064AE8 @ =0x08C13B84
	str r0, [r4, #0x4c]
	ldr r1, _08064AEC @ =0x08202F40
	adds r0, r5, #0
	bl sub_080649AC
	ldr r0, [r4, #0x5c]
	ldr r1, _08064AF0 @ =0x08202348
	bl sub_0806497C
	ldr r0, [r6, #0x24]
	bl _call_via_r0

	thumb_func_start sub_08064AD0
sub_08064AD0: @ 0x08064AD0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_08064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064AE0: .4byte 0x08C13B6C
_08064AE4: .4byte 0x081EF4AC
_08064AE8: .4byte 0x08C13B84
_08064AEC: .4byte 0x08202F40
_08064AF0: .4byte 0x08202348

	thumb_func_start sub_08064AF4
sub_08064AF4: @ 0x08064AF4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064B20
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_08064910
	b _08064B38
_08064B20:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064B38
	ldr r0, [r4, #0x5c]
	bl sub_0806488C
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064B38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064B40
sub_08064B40: @ 0x08064B40
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_0806482C
	adds r7, r0, #0
	ldr r0, _08064B7C @ =0x08C13BB4
	adds r1, r4, #0
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08064B80 @ =0x08C23A1C
	ldr r3, _08064B84 @ =0x08C23694
	adds r0, r5, #0
	movs r1, #1
	bl sub_080648BC
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064B88
	ldrh r0, [r5, #2]
	subs r0, #8
	b _08064B8C
	.align 2, 0
_08064B7C: .4byte 0x08C13BB4
_08064B80: .4byte 0x08C23A1C
_08064B84: .4byte 0x08C23694
_08064B88:
	ldrh r0, [r5, #2]
	adds r0, #8
_08064B8C:
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	adds r0, #8
	strh r0, [r4, #4]
	ldrh r2, [r4, #2]
	ldrh r3, [r7, #6]
	adds r1, r2, r3
	strh r1, [r4, #2]
	ldrh r7, [r7, #8]
	adds r0, r7, r0
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _08064BB8 @ =0x08204A74
	bl sub_08064A04
	ldr r0, [r6, #0x5c]
	ldr r1, _08064BBC @ =0x08204478
	bl sub_080649D4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064BB8: .4byte 0x08204A74
_08064BBC: .4byte 0x08204478

	thumb_func_start sub_08064BC0
sub_08064BC0: @ 0x08064BC0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08064BDE
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08064BDE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08064BE4
sub_08064BE4: @ 0x08064BE4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064C00 @ =0x08C13BCC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl sub_08064814
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064C00: .4byte 0x08C13BCC

	thumb_func_start sub_08064C04
sub_08064C04: @ 0x08064C04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064C2C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064D0C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064D80
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08064C2C
sub_08064C2C: @ 0x08064C2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0806482C
	adds r6, r0, #0
	ldr r0, _08064C74 @ =0x08C13BF4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064C78 @ =0x081EF4DE
	str r0, [r4, #0x48]
	ldr r0, _08064C7C @ =0x08C13C0C
	str r0, [r4, #0x4c]
	ldr r1, _08064C80 @ =0x082019E4
	adds r0, r5, #0
	bl sub_080649AC
	ldr r0, [r4, #0x5c]
	ldr r1, _08064C84 @ =0x08201128
	bl sub_0806497C
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_08064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064C74: .4byte 0x08C13BF4
_08064C78: .4byte 0x081EF4DE
_08064C7C: .4byte 0x08C13C0C
_08064C80: .4byte 0x082019E4
_08064C84: .4byte 0x08201128

	thumb_func_start sub_08064C88
sub_08064C88: @ 0x08064C88
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	ldr r0, [r4, #0x5c]
	bl sub_0806482C
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08064CEA
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	movs r3, #1
	bl sub_08064910
	cmp r5, #0
	bne _08064CCC
	ldrh r0, [r6, #0xa]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08064CCC:
	cmp r5, #1
	bne _08064CD8
	ldrh r0, [r6, #0xa]
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08064CD8:
	ldr r0, [r6, #0x14]
	adds r0, #0x3c
	ldrh r3, [r6, #0xc]
	str r7, [sp]
	movs r1, #2
	movs r2, #0x14
	bl FillBGRect
	b _08064D02
_08064CEA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08064D02
	ldr r0, [r4, #0x5c]
	bl sub_0806488C
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064D02:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064D0C
sub_08064D0C: @ 0x08064D0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064D34 @ =0x08C13C14
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_08064820
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064D38 @ =0x081EF4E8
	str r0, [r4, #0x48]
	ldr r0, _08064D3C @ =0x082019E4
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064D34: .4byte 0x08C13C14
_08064D38: .4byte 0x081EF4E8
_08064D3C: .4byte 0x082019E4

	thumb_func_start sub_08064D40
sub_08064D40: @ 0x08064D40
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08064D66
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_080649AC
	b _08064D78
_08064D66:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08064D78
	bl sub_080647F8
	adds r0, r4, #0
	bl Proc_Break
_08064D78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064D80
sub_08064D80: @ 0x08064D80
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_0806482C
	adds r7, r0, #0
	ldr r0, _08064DBC @ =0x08C13C34
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08064DC0 @ =0x08C2327C
	ldr r3, _08064DC4 @ =0x08C22750
	adds r0, r5, #0
	movs r1, #1
	bl sub_080648BC
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064DC8
	ldrh r0, [r5, #2]
	adds r0, #0x38
	b _08064DCC
	.align 2, 0
_08064DBC: .4byte 0x08C13C34
_08064DC0: .4byte 0x08C2327C
_08064DC4: .4byte 0x08C22750
_08064DC8:
	ldrh r0, [r5, #2]
	subs r0, #0x38
_08064DCC:
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r2, [r7, #6]
	adds r0, r1, r2
	strh r0, [r4, #2]
	ldrh r1, [r4, #4]
	ldrh r7, [r7, #8]
	adds r0, r1, r7
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _08064DF4 @ =0x082022A8
	bl sub_08064A04
	ldr r0, [r6, #0x5c]
	ldr r1, _08064DF8 @ =0x08201E10
	bl sub_080649D4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064DF4: .4byte 0x082022A8
_08064DF8: .4byte 0x08201E10

	thumb_func_start sub_08064DFC
sub_08064DFC: @ 0x08064DFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08064E1A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08064E1A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08064E20
sub_08064E20: @ 0x08064E20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08064E38 @ =0x08C13C4C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E38: .4byte 0x08C13C4C

	thumb_func_start sub_08064E3C
sub_08064E3C: @ 0x08064E3C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08065094
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064EB0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064F50
	ldr r3, _08064EAC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
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
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_08064FC4
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_08064FC4
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064EAC: .4byte gDispIo

	thumb_func_start sub_08064EB0
sub_08064EB0: @ 0x08064EB0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0806482C
	adds r6, r0, #0
	ldr r0, _08064EF4 @ =0x08C13C74
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_08064814
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064EF8 @ =0x081EF52A
	str r0, [r4, #0x48]
	ldr r0, _08064EFC @ =0x08C13C8C
	str r0, [r4, #0x4c]
	ldr r1, _08064F00 @ =0x0826F96C
	adds r0, r5, #0
	bl sub_0806497C
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_08064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064EF4: .4byte 0x08C13C74
_08064EF8: .4byte 0x081EF52A
_08064EFC: .4byte 0x08C13C8C
_08064F00: .4byte 0x0826F96C

	thumb_func_start sub_08064F04
sub_08064F04: @ 0x08064F04
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064F30
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #0
	bl sub_08064910
	b _08064F48
_08064F30:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064F48
	ldr r0, [r4, #0x5c]
	bl sub_0806488C
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064F48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064F50
sub_08064F50: @ 0x08064F50
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064F78 @ =0x08C13C90
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_08064820
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064F7C @ =0x081EF530
	str r0, [r4, #0x48]
	ldr r0, _08064F80 @ =0x0827045C
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064F78: .4byte 0x08C13C90
_08064F7C: .4byte 0x081EF530
_08064F80: .4byte 0x0827045C

	thumb_func_start sub_08064F84
sub_08064F84: @ 0x08064F84
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08064FAA
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_080649AC
	b _08064FBC
_08064FAA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08064FBC
	bl sub_080647F8
	adds r0, r4, #0
	bl Proc_Break
_08064FBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064FC4
sub_08064FC4: @ 0x08064FC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08064FF0 @ =0x08C13CB0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064FF0: .4byte 0x08C13CB0

	thumb_func_start sub_08064FF4
sub_08064FF4: @ 0x08064FF4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806500A
	adds r0, r1, #0
	bl Proc_Break
_0806500A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08065010
sub_08065010: @ 0x08065010
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0806502A
	adds r0, r4, #0
	bl Proc_Break
	b _08065088
_0806502A:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08065046
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b _08065056
_08065046:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
_08065056:
	bl Interpolate
	adds r5, r0, #0
	ldr r3, _08065090 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r5, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_08065088:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065090: .4byte gDispIo

	thumb_func_start sub_08065094
sub_08065094: @ 0x08065094
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0806482C
	adds r6, r0, #0
	ldr r0, _080650E8 @ =0x08C13CD0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _080650EC @ =0x08C2D9FC
	adds r0, r5, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_080648BC
	str r0, [r4, #0x60]
	ldrh r2, [r0, #2]
	ldrh r3, [r6, #6]
	adds r1, r2, r3
	strh r1, [r0, #2]
	ldrh r2, [r0, #4]
	ldrh r6, [r6, #8]
	adds r1, r2, r6
	strh r1, [r0, #4]
	ldr r0, [r4, #0x5c]
	ldr r1, _080650F0 @ =0x082708B0
	bl sub_08064A04
	ldr r0, [r4, #0x5c]
	ldr r1, _080650F4 @ =0x0827065C
	bl sub_080649D4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080650E8: .4byte 0x08C13CD0
_080650EC: .4byte 0x08C2D9FC
_080650F0: .4byte 0x082708B0
_080650F4: .4byte 0x0827065C

	thumb_func_start sub_080650F8
sub_080650F8: @ 0x080650F8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08065118
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08065118:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08065120
sub_08065120: @ 0x08065120
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806513C @ =0x08C13CE8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl sub_08064814
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806513C: .4byte 0x08C13CE8

	thumb_func_start sub_08065140
sub_08065140: @ 0x08065140
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08065158
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08065158
sub_08065158: @ 0x08065158
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_0806482C
	adds r6, r0, #0
	ldr r0, _0806519C @ =0x08C13D10
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080651A0 @ =0x081EF572
	str r0, [r4, #0x48]
	ldr r0, _080651A4 @ =0x08C13E30
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _080651A8 @ =0x08C13D28
	str r0, [r4, #0x54]
	ldr r0, _080651AC @ =0x08C13DAC
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_08064834
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806519C: .4byte 0x08C13D10
_080651A0: .4byte 0x081EF572
_080651A4: .4byte 0x08C13E30
_080651A8: .4byte 0x08C13D28
_080651AC: .4byte 0x08C13DAC

	thumb_func_start sub_080651B0
sub_080651B0: @ 0x080651B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _080651F4
	ldr r6, [r7, #0x4c]
	ldr r1, [r7, #0x54]
	ldr r5, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl sub_0806497C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	bl sub_080649AC
	ldr r0, [r7, #0x5c]
	adds r4, r4, r6
	ldr r2, [r4]
	movs r1, #0
	movs r3, #1
	bl sub_08064910
	b _0806520C
_080651F4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0806520C
	ldr r0, [r7, #0x5c]
	bl sub_0806488C
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0806520C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
