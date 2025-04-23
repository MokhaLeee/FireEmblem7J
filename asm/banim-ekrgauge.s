	.include "macro.inc"
	.syntax unified

	thumb_func_start NewEkrLvlupFan
NewEkrLvlupFan: @ 0x0804C890
	push {lr}
	ldr r0, _0804C8A8 @ =gUnk_08C09D30
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r0, #0x80
	bl SetBgmVolume
	pop {r0}
	bx r0
	.align 2, 0
_0804C8A8: .4byte gUnk_08C09D30

	thumb_func_start EkrLvupFanMain
EkrLvupFanMain: @ 0x0804C8AC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0804C8DC
	ldr r4, _0804C8D8 @ =0x0000037B
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	b _0804C8EE
	.align 2, 0
_0804C8D8: .4byte 0x0000037B
_0804C8DC:
	cmp r0, #0x74
	bne _0804C8EE
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
_0804C8EE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_804C8F4
sub_804C8F4: @ 0x0804C8F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r5, r7, #0
_0804C900:
	movs r0, #0xf
	ldrh r1, [r4]
	cmp r1, #0xff
	beq _0804C90A
	ldrh r0, [r4]
_0804C90A:
	lsls r0, r0, #5
	ldr r1, _0804C93C @ =gUnk_081DF024
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #2
	adds r5, #0x20
	adds r6, #1
	cmp r6, #0xa
	bls _0804C900
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r2, _0804C940 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C93C: .4byte gUnk_081DF024
_0804C940: .4byte 0x01000008

	thumb_func_start sub_804C944
sub_804C944: @ 0x0804C944
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _0804C960
	movs r0, #0xb
	strh r0, [r5]
	movs r0, #0xa
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	b _0804C9A6
_0804C960:
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	movs r0, #0x64
	ldrh r1, [r5]
	adds r4, r1, #0
	muls r4, r0, r4
	subs r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	strh r0, [r5, #2]
	lsls r0, r0, #2
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	lsls r0, r0, #1
	subs r4, r4, r0
	strh r4, [r5, #4]
	adds r1, r2, #0
	ldrh r2, [r5]
	adds r0, r1, r2
	cmp r0, #0
	bne _0804C99C
	movs r0, #0xb
	strh r0, [r5, #2]
_0804C99C:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0804C9A6
	movs r0, #0xb
	strh r0, [r5]
_0804C9A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NewEkrGauge
NewEkrGauge: @ 0x0804C9AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _0804C9F8 @ =0x02000068
	ldr r0, _0804C9FC @ =gUnk_08C09D48
	movs r1, #1
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	bl EkrGauge_0804CC68
	bl EkrGauge_0804CC28
	bl DisableEkrGauge
	bl EkrGauge_ClrInitFlag
	ldr r1, _0804CA00 @ =gEkrBg0QuakeVec
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl EkrGauge_0804CC78
	ldr r0, _0804CA04 @ =gEkrPairHpInitial
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804CA10
	ldr r0, _0804CA08 @ =gUnk_081DF3A4
	ldr r1, _0804CA0C @ =gPal + 0x360
	movs r2, #0x10
	bl CpuSet
	b _0804CA24
	.align 2, 0
_0804C9F8: .4byte 0x02000068
_0804C9FC: .4byte gUnk_08C09D48
_0804CA00: .4byte gEkrBg0QuakeVec
_0804CA04: .4byte gEkrPairHpInitial
_0804CA08: .4byte gUnk_081DF3A4
_0804CA0C: .4byte gPal + 0x360
_0804CA10:
	ldr r0, _0804CA3C @ =gBanimFactionPal
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804CA40 @ =gUnk_081DF224
	adds r0, r0, r1
	ldr r1, _0804CA44 @ =gPal + 0x360
	movs r2, #0x10
	bl CpuSet
_0804CA24:
	ldr r0, _0804CA48 @ =gEkrPairHpInitial
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804CA54
	ldr r0, _0804CA4C @ =gUnk_081DF3A4
	ldr r1, _0804CA50 @ =gPal + 0x380
	movs r2, #0x10
	bl CpuSet
	b _0804CA68
	.align 2, 0
_0804CA3C: .4byte gBanimFactionPal
_0804CA40: .4byte gUnk_081DF224
_0804CA44: .4byte gPal + 0x360
_0804CA48: .4byte gEkrPairHpInitial
_0804CA4C: .4byte gUnk_081DF3A4
_0804CA50: .4byte gPal + 0x380
_0804CA54:
	ldr r0, _0804CBB8 @ =gBanimFactionPal
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804CBBC @ =gUnk_081DF224
	adds r0, r0, r1
	ldr r1, _0804CBC0 @ =gPal + 0x380
	movs r2, #0x10
	bl CpuSet
_0804CA68:
	ldr r1, _0804CBC4 @ =0x0203E098
	ldr r2, _0804CBC8 @ =0x0000FFFF
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r2, r0
	strh r2, [r1]
	ldrh r2, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldr r0, _0804CBCC @ =gUnk_081DEC94
	ldr r1, _0804CBD0 @ =0x06013800
	bl LZ77UnCompVram
	ldr r0, _0804CBD4 @ =gUnk_081DED34
	ldr r1, _0804CBD8 @ =0x06013C00
	bl LZ77UnCompVram
	ldr r6, _0804CBB8 @ =gBanimFactionPal
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804CBDC @ =gUnk_081DEFA4
	adds r0, r0, r5
	ldr r4, _0804CBE0 @ =gPal + 0x2a0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r6, _0804CBE4 @ =0x0203E09C
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, _0804CBE8 @ =0x02017700
	adds r1, r7, #0
	bl sub_804C944
	ldr r5, _0804CBEC @ =0x0203E0A0
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl sub_804C944
	ldr r4, _0804CBF0 @ =0x0203E0A4
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl sub_804C944
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl sub_804C944
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl sub_804C944
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl sub_804C944
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804CBF4 @ =0x020169C8
	ldr r2, _0804CBF8 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	movs r6, #0
	mov sb, r7
_0804CB14:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
_0804CB1E:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _0804CBFC @ =gUnk_081DEDE4
	adds r0, r0, r1
	ldr r7, _0804CBF4 @ =0x020169C8
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl CpuSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls _0804CB1E
	mov r6, r8
	cmp r6, #5
	bls _0804CB14
	ldr r1, _0804CC00 @ =0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterDataMove
	adds r0, r7, r4
	ldr r1, _0804CC04 @ =0x06013E00
	adds r2, r4, #0
	bl RegisterDataMove
	bl InitIcons
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, _0804CC08 @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xee
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804CC0C @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xef
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804CC10 @ =Pal_MiscUiGraphics
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CBB8: .4byte gBanimFactionPal
_0804CBBC: .4byte gUnk_081DF224
_0804CBC0: .4byte gPal + 0x380
_0804CBC4: .4byte 0x0203E098
_0804CBC8: .4byte 0x0000FFFF
_0804CBCC: .4byte gUnk_081DEC94
_0804CBD0: .4byte 0x06013800
_0804CBD4: .4byte gUnk_081DED34
_0804CBD8: .4byte 0x06013C00
_0804CBDC: .4byte gUnk_081DEFA4
_0804CBE0: .4byte gPal + 0x2a0
_0804CBE4: .4byte 0x0203E09C
_0804CBE8: .4byte 0x02017700
_0804CBEC: .4byte 0x0203E0A0
_0804CBF0: .4byte 0x0203E0A4
_0804CBF4: .4byte 0x020169C8
_0804CBF8: .4byte 0x01000100
_0804CBFC: .4byte gUnk_081DEDE4
_0804CC00: .4byte 0x06013A00
_0804CC04: .4byte 0x06013E00
_0804CC08: .4byte gpEkrBattleUnitLeft
_0804CC0C: .4byte gpEkrBattleUnitRight
_0804CC10: .4byte Pal_MiscUiGraphics

	thumb_func_start EndEkrGauge
EndEkrGauge: @ 0x0804CC14
	push {lr}
	ldr r0, _0804CC24 @ =0x02000068
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804CC24: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC28
EkrGauge_0804CC28: @ 0x0804CC28
	ldr r0, _0804CC34 @ =0x02000068
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CC34: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC38
EkrGauge_0804CC38: @ 0x0804CC38
	ldr r0, _0804CC44 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CC44: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC48
EkrGauge_0804CC48: @ 0x0804CC48
	ldr r0, _0804CC54 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804CC54: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC58
EkrGauge_0804CC58: @ 0x0804CC58
	ldr r0, _0804CC64 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CC64: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC68
EkrGauge_0804CC68: @ 0x0804CC68
	lsls r0, r0, #0x10
	ldr r1, _0804CC74 @ =0x02000068
	ldr r1, [r1]
	lsrs r0, r0, #6
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_0804CC74: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC78
EkrGauge_0804CC78: @ 0x0804CC78
	ldr r2, _0804CC88 @ =0x02000068
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_0804CC88: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC8C
EkrGauge_0804CC8C: @ 0x0804CC8C
	ldr r2, _0804CC9C @ =0x02000068
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804CC9C: .4byte 0x02000068

	thumb_func_start EkrGauge_SetInitFlag
EkrGauge_SetInitFlag: @ 0x0804CCA0
	ldr r0, _0804CCAC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCAC: .4byte 0x02000068

	thumb_func_start EkrGauge_ClrInitFlag
EkrGauge_ClrInitFlag: @ 0x0804CCB0
	ldr r0, _0804CCBC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCBC: .4byte 0x02000068

	thumb_func_start EnableEkrGauge
EnableEkrGauge: @ 0x0804CCC0
	ldr r0, _0804CCCC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCCC: .4byte 0x02000068

	thumb_func_start DisableEkrGauge
DisableEkrGauge: @ 0x0804CCD0
	ldr r0, _0804CCDC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCDC: .4byte 0x02000068

	thumb_func_start sub_804CCE0
sub_804CCE0: @ 0x0804CCE0
	adds r3, r0, #0
	cmp r1, #0
	ble _0804CD08
	cmp r2, #1
	beq _0804CCF8
	cmp r2, #1
	bhs _0804CD00
	ldr r0, _0804CCF4 @ =gUnk_08C09E68
	b _0804CD22
	.align 2, 0
_0804CCF4: .4byte gUnk_08C09E68
_0804CCF8:
	ldr r0, _0804CCFC @ =gUnk_08C09E80
	b _0804CD22
	.align 2, 0
_0804CCFC: .4byte gUnk_08C09E80
_0804CD00:
	ldr r0, _0804CD04 @ =gUnk_08C09E98
	b _0804CD22
	.align 2, 0
_0804CD04: .4byte gUnk_08C09E98
_0804CD08:
	cmp r2, #1
	beq _0804CD18
	cmp r2, #1
	bhs _0804CD20
	ldr r0, _0804CD14 @ =gUnk_08C09EB0
	b _0804CD22
	.align 2, 0
_0804CD14: .4byte gUnk_08C09EB0
_0804CD18:
	ldr r0, _0804CD1C @ =gUnk_08C09EC8
	b _0804CD22
	.align 2, 0
_0804CD1C: .4byte gUnk_08C09EC8
_0804CD20:
	ldr r0, _0804CD28 @ =gUnk_08C09EE0
_0804CD22:
	str r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_0804CD28: .4byte gUnk_08C09EE0

	thumb_func_start ekrGaugeMain
ekrGaugeMain: @ 0x0804CD2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x120
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0xd8]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl DivRem
	str r0, [sp, #0xe4]
	mov r0, sb
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804CD58
	b _0804D4FC
_0804CD58:
	mov r0, sb
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x108]
	cmp r1, #0
	bne _0804CE46
	mov r1, sb
	ldrh r1, [r1, #0x3a]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge _0804CD7A
	movs r7, #0
_0804CD7A:
	adds r6, r4, #7
	cmp r6, #7
	ble _0804CD82
	movs r6, #7
_0804CD82:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804CDA4 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _0804CDA8
	cmp r0, #2
	bgt _0804CDA8
	movs r4, #0
	movs r0, #0xf
	str r0, [sp, #0xdc]
	b _0804CDAE
	.align 2, 0
_0804CDA4: .4byte gEkrDistanceType
_0804CDA8:
	movs r1, #8
	str r1, [sp, #0xdc]
	movs r4, #8
_0804CDAE:
	ldr r2, _0804CE94 @ =gBg0Tm + 0x340
	mov r8, r2
	movs r0, #0x9f
	str r0, [sp]
	mov r0, r8
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl FillBGRect
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804CE00
	ldr r0, _0804CE98 @ =gUnk_081DEA10
	add r0, sl
	lsls r5, r7, #1
	lsls r1, r4, #1
	ldr r2, _0804CE9C @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_8067128
_0804CE00:
	mov r4, sb
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0804CE40
	ldr r0, _0804CEA0 @ =gUnk_081DEAE4
	add r0, sl
	lsls r5, r7, #1
	ldr r2, [sp, #0xdc]
	lsls r1, r2, #1
	ldr r2, _0804CE9C @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl sub_8067128
_0804CE40:
	movs r0, #1
	bl EnableBgSync
_0804CE46:
	ldr r1, _0804CEA4 @ =0x0203E098
	ldr r0, _0804CEA8 @ =gEkrPairHpInitial
	ldrh r2, [r0]
	adds r5, r0, #0
	ldrh r3, [r1]
	ldrh r4, [r5]
	cmp r3, r4
	beq _0804CE5A
	movs r0, #1
	str r0, [sp, #0xd8]
_0804CE5A:
	ldrh r0, [r5, #2]
	ldrh r3, [r1, #2]
	cmp r3, r0
	beq _0804CE66
	movs r4, #1
	str r4, [sp, #0xd8]
_0804CE66:
	strh r2, [r1]
	strh r0, [r1, #2]
	ldrh r7, [r5]
	ldr r0, _0804CEAC @ =0x0203E094
	ldrh r6, [r0]
	ldrh r1, [r5, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	str r0, [sp, #0xd4]
	ldr r0, _0804CEB0 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #3
	beq _0804CEB4
	cmp r0, #3
	bgt _0804CED4
	cmp r0, #0
	blt _0804CED4
	mov r3, sb
	movs r4, #0x32
	ldrsh r3, [r3, r4]
	mov sl, r3
	b _0804CEDE
	.align 2, 0
_0804CE94: .4byte gBg0Tm + 0x340
_0804CE98: .4byte gUnk_081DEA10
_0804CE9C: .4byte 0xFFFFFCC0
_0804CEA0: .4byte gUnk_081DEAE4
_0804CEA4: .4byte 0x0203E098
_0804CEA8: .4byte gEkrPairHpInitial
_0804CEAC: .4byte 0x0203E094
_0804CEB0: .4byte gEkrDistanceType
_0804CEB4:
	ldr r0, _0804CEC8 @ =gBanimValid
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804CECC
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	adds r0, #0x38
	b _0804CEDC
	.align 2, 0
_0804CEC8: .4byte gBanimValid
_0804CECC:
	mov r3, sb
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	b _0804CEDA
_0804CED4:
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
_0804CEDA:
	subs r0, #0x38
_0804CEDC:
	mov sl, r0
_0804CEDE:
	ldr r3, [sp, #0x108]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804CEF8
	ldr r4, _0804CEF4 @ =0x0000FFF8
	mov r0, sb
	ldrh r1, [r0, #0x3a]
	ands r1, r4
	str r1, [sp, #0xe0]
	b _0804CF00
	.align 2, 0
_0804CEF4: .4byte 0x0000FFF8
_0804CEF8:
	mov r2, sb
	movs r3, #0x3a
	ldrsh r2, [r2, r3]
	str r2, [sp, #0xe0]
_0804CF00:
	adds r4, r5, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	add r2, sp, #0x68
	strh r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r3, [r4]
	subs r1, r3, r1
	strh r1, [r2, #2]
	lsls r0, r0, #0x10
	adds r3, r2, #0
	cmp r0, #0
	bne _0804CF28
	movs r0, #0xb
	strh r0, [r3]
_0804CF28:
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	str r3, [sp, #0x11c]
	bl Div
	ldr r3, [sp, #0x11c]
	strh r0, [r3, #4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r2, [r4, #2]
	subs r1, r2, r1
	strh r1, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804CF4E
	movs r0, #0xb
	strh r0, [r3, #4]
_0804CF4E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _0804CF5C
	movs r0, #0xc
	strh r0, [r3]
	strh r0, [r3, #2]
_0804CF5C:
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x50
	ble _0804CF6A
	movs r0, #0xc
	strh r0, [r3, #4]
	strh r0, [r3, #6]
_0804CF6A:
	mov r4, sl
	adds r4, #9
	str r4, [sp, #0xf4]
	ldr r0, [sp, #0xe0]
	adds r0, #0x91
	str r0, [sp, #0x114]
	mov r1, sl
	adds r1, #0x81
	str r1, [sp, #0x110]
	lsls r2, r7, #0x10
	str r2, [sp, #0xf8]
	lsls r6, r6, #0x10
	str r6, [sp, #0xfc]
	adds r4, #0x14
	str r4, [sp, #0x10c]
	mov r0, r8
	lsls r0, r0, #0x10
	str r0, [sp, #0x100]
	ldr r1, [sp, #0xd4]
	lsls r1, r1, #0x10
	str r1, [sp, #0x104]
	mov r2, sl
	adds r2, #0x95
	str r2, [sp, #0x118]
	ldr r4, [sp, #0xd8]
	cmp r4, #1
	bne _0804CFFC
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, _0804D034 @ =0x02016DC8
	ldr r2, _0804D038 @ =0x01000020
	str r3, [sp, #0x11c]
	bl CpuFastSet
	movs r0, #0
	ldr r3, [sp, #0x11c]
_0804CFB4:
	adds r1, r0, #1
	mov r8, r1
	lsls r5, r0, #6
	lsls r0, r0, #2
	adds r4, r0, r3
	movs r6, #1
_0804CFC0:
	ldrh r2, [r4]
	lsls r0, r2, #5
	ldr r1, _0804D03C @ =gUnk_081DEDE4
	adds r0, r0, r1
	ldr r7, _0804D034 @ =0x02016DC8
	adds r1, r5, r7
	movs r2, #0x10
	str r3, [sp, #0x11c]
	bl CpuSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	ldr r3, [sp, #0x11c]
	cmp r6, #0
	bge _0804CFC0
	mov r0, r8
	cmp r0, #1
	ble _0804CFB4
	ldr r1, _0804D040 @ =0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0804D044 @ =0x06013DC0
	movs r2, #0x40
	bl RegisterDataMove
_0804CFFC:
	add r0, sp, #8
	movs r4, #0
	ldr r1, _0804D048 @ =0x000051CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf4
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl EkrEfxIsUnitHittedNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804D050
	ldr r0, _0804D04C @ =gUnk_08C09D90
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804D07A
	.align 2, 0
_0804D034: .4byte 0x02016DC8
_0804D038: .4byte 0x01000020
_0804D03C: .4byte gUnk_081DEDE4
_0804D040: .4byte 0x060139C0
_0804D044: .4byte 0x06013DC0
_0804D048: .4byte 0x000051CE
_0804D04C: .4byte gUnk_08C09D90
_0804D050:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804D0C4 @ =gUnk_08C09D90
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
_0804D07A:
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804D088
	add r0, sp, #8
	bl AnimDisplay
_0804D088:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, _0804D0C8 @ =0x000061EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0x110
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl EkrEfxIsUnitHittedNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804D0CC
	ldr r0, _0804D0C4 @ =gUnk_08C09D90
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804D0F6
	.align 2, 0
_0804D0C4: .4byte gUnk_08C09D90
_0804D0C8: .4byte 0x000061EE
_0804D0CC:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804D1F0 @ =gUnk_08C09D90
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
_0804D0F6:
	mov r3, sb
	ldr r0, [r3, #0x50]
	cmp r0, #0
	bne _0804D104
	add r0, sp, #8
	bl AnimDisplay
_0804D104:
	ldr r4, [sp, #0xf8]
	ldr r0, _0804D1F4 @ =0xFFD80000
	adds r1, r4, r0
	ldr r2, [sp, #0xfc]
	adds r0, r2, r0
	lsrs r5, r0, #0x10
	lsrs r7, r4, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804D120
	movs r6, #0x28
_0804D120:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D12A
	movs r5, #0x28
_0804D12A:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804D132
	movs r6, #0
_0804D132:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804D13A
	movs r5, #0
_0804D13A:
	lsls r0, r7, #0x10

	thumb_func_start sub_804D13C
sub_804D13C: @ 0x0804D13C
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D144
	movs r7, #0x28
_0804D144:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D152
	movs r4, #0x28
	mov r8, r4
_0804D152:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x10c
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804D1F8 @ =gUnk_08C09D60
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	str r2, [sp, #0xe8]
	cmp r2, #0
	bne _0804D228
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804D1C2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_806748C
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804D19E
	ldr r1, _0804D1FC @ =0x02016E48
	adds r0, r4, #0
	bl sub_804C8F4
_0804D19E:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	add r1, sp, #0xe8
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl AnimDisplay
_0804D1C2:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_806748C
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804D1E0
	ldr r1, _0804D200 @ =0x02017248
	adds r0, r4, #0
	bl sub_804C8F4
_0804D1E0:
	cmp r5, #0
	beq _0804D204
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804D20C
	.align 2, 0
_0804D1F0: .4byte gUnk_08C09D90
_0804D1F4: .4byte 0xFFD80000
_0804D1F8: .4byte gUnk_08C09D60
_0804D1FC: .4byte 0x02016E48
_0804D200: .4byte 0x02017248
_0804D204:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804D20C:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_0804D228:
	ldr r2, [sp, #0x100]
	ldr r3, _0804D320 @ =0xFFD80000
	adds r1, r2, r3
	ldr r4, [sp, #0x104]
	adds r0, r4, r3
	lsrs r5, r0, #0x10
	lsrs r7, r2, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804D244
	movs r6, #0x28
_0804D244:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D24E
	movs r5, #0x28
_0804D24E:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804D256
	movs r6, #0
_0804D256:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804D25E
	movs r5, #0
_0804D25E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D268
	movs r7, #0x28
_0804D268:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D276
	movs r2, #0x28
	mov r8, r2
_0804D276:
	add r0, sp, #8
	movs r3, #0
	mov ip, r3
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	add r4, sp, #0xec
	strh r3, [r4]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, ip
	str r0, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x118
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804D324 @ =gUnk_08C09D60
	str r0, [sp, #0x44]
	mov r2, sb
	ldr r2, [r2, #0x50]
	str r2, [sp, #0xf0]
	cmp r2, #0
	bne _0804D354
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804D2F2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_806748C
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804D2CE
	ldr r1, _0804D328 @ =0x02017048
	adds r0, r4, #0
	bl sub_804C8F4
_0804D2CE:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf0
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl AnimDisplay
_0804D2F2:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_806748C
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804D310
	ldr r1, _0804D32C @ =0x02017448
	adds r0, r4, #0
	bl sub_804C8F4
_0804D310:
	cmp r5, #0
	beq _0804D330
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804D338
	.align 2, 0
_0804D320: .4byte 0xFFD80000
_0804D324: .4byte gUnk_08C09D60
_0804D328: .4byte 0x02017048
_0804D32C: .4byte 0x02017448
_0804D330:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804D338:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_0804D354:
	ldr r2, [sp, #0xd8]
	cmp r2, #1
	bne _0804D366
	ldr r0, _0804D50C @ =0x02016E48
	ldr r1, _0804D510 @ =0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
_0804D366:
	mov r3, sb
	ldr r4, [r3, #0x4c]
	cmp r4, #0
	bne _0804D3C4
	str r4, [sp, #0x24]
	ldr r0, _0804D514 @ =gUnk_08C09DA8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D518 @ =0x000051D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xf
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _0804D51C @ =gUnk_08C09DD8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D520 @ =0x000051C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804D3C4:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804D424
	str r4, [sp, #0x24]
	ldr r0, _0804D514 @ =gUnk_08C09DA8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D524 @ =0x000061F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xd7
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _0804D528 @ =gUnk_08C09E14
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D52C @ =0x000061C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804D424:
	mov r0, sb
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne _0804D490
	str r4, [sp, #0x24]
	ldr r1, _0804D530 @ =0x0203E0B8
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804D46A
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_804CCE0
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x36
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804D46A:
	ldr r0, _0804D534 @ =gUnk_08C09E50
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D538 @ =0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x2c
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804D490:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804D4FC
	str r4, [sp, #0x24]
	ldr r1, _0804D530 @ =0x0203E0B8
	movs r2, #2
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804D4D6
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_804CCE0
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x85
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804D4D6:
	ldr r0, _0804D534 @ =gUnk_08C09E50
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D53C @ =0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x7b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804D4FC:
	add sp, #0x120
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D50C: .4byte 0x02016E48
_0804D510: .4byte 0x06013000
_0804D514: .4byte gUnk_08C09DA8
_0804D518: .4byte 0x000051D0
_0804D51C: .4byte gUnk_08C09DD8
_0804D520: .4byte 0x000051C0
_0804D524: .4byte 0x000061F0
_0804D528: .4byte gUnk_08C09E14
_0804D52C: .4byte 0x000061C0
_0804D530: .4byte 0x0203E0B8
_0804D534: .4byte gUnk_08C09E50
_0804D538: .4byte 0x0000D1DC
_0804D53C: .4byte 0x0000E1DE

	thumb_func_start NewEkrDispUP
NewEkrDispUP: @ 0x0804D540
	push {r4, lr}
	ldr r4, _0804D568 @ =gpProcEkrDispUP
	ldr r0, _0804D56C @ =ProcScr_ekrDispUP
	movs r1, #5
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_SetPositionUnsync
	bl EkrDispUP_0804D584
	bl UnAsyncEkrDispUP
	bl UnsyncEkrDispUP
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D568: .4byte gpProcEkrDispUP
_0804D56C: .4byte ProcScr_ekrDispUP

	thumb_func_start EndEkrDispUP
EndEkrDispUP: @ 0x0804D570
	push {lr}
	ldr r0, _0804D580 @ =gpProcEkrDispUP
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804D580: .4byte gpProcEkrDispUP

	thumb_func_start EkrDispUP_0804D584
EkrDispUP_0804D584: @ 0x0804D584
	ldr r0, _0804D590 @ =gpProcEkrDispUP
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804D590: .4byte gpProcEkrDispUP

	thumb_func_start EkrDispUP_0804D594
EkrDispUP_0804D594: @ 0x0804D594
	ldr r0, _0804D5A0 @ =gpProcEkrDispUP
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804D5A0: .4byte gpProcEkrDispUP

	thumb_func_start EkrDispUP_0804D5A4
EkrDispUP_0804D5A4: @ 0x0804D5A4
	ldr r0, _0804D5B0 @ =gpProcEkrDispUP
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804D5B0: .4byte gpProcEkrDispUP

	thumb_func_start EkrDispUP_0804D5B4
EkrDispUP_0804D5B4: @ 0x0804D5B4
	ldr r0, _0804D5C0 @ =gpProcEkrDispUP
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804D5C0: .4byte gpProcEkrDispUP

	thumb_func_start EkrDispUP_SetPositionUnsync
EkrDispUP_SetPositionUnsync: @ 0x0804D5C4
	ldr r2, _0804D5D4 @ =gpProcEkrDispUP
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_0804D5D4: .4byte gpProcEkrDispUP

	thumb_func_start EkrDispUP_SetPositionSync
EkrDispUP_SetPositionSync: @ 0x0804D5D8
	ldr r2, _0804D5E8 @ =gpProcEkrDispUP
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804D5E8: .4byte gpProcEkrDispUP

	thumb_func_start SyncEkrDispUP
SyncEkrDispUP: @ 0x0804D5EC
	ldr r0, _0804D5F8 @ =gpProcEkrDispUP
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D5F8: .4byte gpProcEkrDispUP

	thumb_func_start UnsyncEkrDispUP
UnsyncEkrDispUP: @ 0x0804D5FC
	ldr r0, _0804D608 @ =gpProcEkrDispUP
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D608: .4byte gpProcEkrDispUP

	thumb_func_start AsyncEkrDispUP
AsyncEkrDispUP: @ 0x0804D60C
	ldr r0, _0804D618 @ =gpProcEkrDispUP
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D618: .4byte gpProcEkrDispUP

	thumb_func_start UnAsyncEkrDispUP
UnAsyncEkrDispUP: @ 0x0804D61C
	ldr r0, _0804D628 @ =gpProcEkrDispUP
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D628: .4byte gpProcEkrDispUP

	thumb_func_start ekrDispUPMain
ekrDispUPMain: @ 0x0804D62C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804D71C
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804D71C
	ldrh r1, [r7, #0x3a]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	lsls r2, r0, #5
	mov r8, r2
	cmp r2, #0
	bge _0804D65E
	movs r1, #0
	mov r8, r1
_0804D65E:
	adds r6, r0, #7
	cmp r6, #6
	ble _0804D666
	movs r6, #6
_0804D666:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804D684 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _0804D688
	cmp r0, #2
	bgt _0804D688
	movs r4, #0
	b _0804D68A
	.align 2, 0
_0804D684: .4byte gEkrDistanceType
_0804D688:
	movs r4, #0xf
_0804D68A:
	ldr r0, _0804D72C @ =gBg0Tm
	mov sb, r0
	movs r0, #0x9f
	str r0, [sp]
	mov r0, sb
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl FillBGRect
	cmp r6, #0
	ble _0804D716
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _0804D6DC
	ldr r0, _0804D730 @ =gUnk_081DE8A8
	add r0, sl
	mov r1, r8
	lsls r5, r1, #1
	lsls r1, r4, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_8067128
_0804D6DC:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne _0804D716
	ldr r0, _0804D734 @ =gUnk_081DE95C
	add r0, sl
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl sub_8067128
_0804D716:
	movs r0, #1
	bl EnableBgSync
_0804D71C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D72C: .4byte gBg0Tm
_0804D730: .4byte gUnk_081DE8A8
_0804D734: .4byte gUnk_081DE95C

	thumb_func_start sub_804D738
sub_804D738: @ 0x0804D738
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, _0804D82C @ =gDispIo
	movs r2, #8
	rsbs r2, r2, #0
	ldrb r0, [r4]
	ands r2, r0
	movs r5, #1
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	strb r2, [r4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #1
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBgTilemapOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, _0804D830 @ =gBg0Tm
	ldr r5, _0804D834 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _0804D838 @ =gBg1Tm
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, _0804D83C @ =gBg2Tm
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0804D840
	bl sub_804D894
	b _0804D84C
	.align 2, 0
_0804D82C: .4byte gDispIo
_0804D830: .4byte gBg0Tm
_0804D834: .4byte 0x01000200
_0804D838: .4byte gBg1Tm
_0804D83C: .4byte gBg2Tm
_0804D840:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
_0804D84C:
	bl EfxPrepareScreenFx
	bl EnablePalSync
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	ldr r3, _0804D890 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D890: .4byte gDispIo

	thumb_func_start sub_804D894
sub_804D894: @ 0x0804D894
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0804D8D4 @ =EkrMainMiniConf_0201FAD0
	ldr r2, _0804D8D8 @ =0x0203E000
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, _0804D8DC @ =battle_terrain_table
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, _0804D8E0 @ =gEkrDistanceType
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt _0804D8E8
	cmp r1, #1
	bge _0804D90C
	cmp r1, #0
	beq _0804D8F0
	ldr r0, _0804D8E4 @ =0x020145C8
	b _0804D91E
	.align 2, 0
_0804D8D4: .4byte EkrMainMiniConf_0201FAD0
_0804D8D8: .4byte 0x0203E000
_0804D8DC: .4byte battle_terrain_table
_0804D8E0: .4byte gEkrDistanceType
_0804D8E4: .4byte 0x020145C8
_0804D8E8:
	ldr r7, _0804D904 @ =0x020145C8
	mov ip, r7
	cmp r1, #4
	bne _0804D920
_0804D8F0:
	ldr r0, _0804D908 @ =0x0200003C
	ldr r1, _0804D904 @ =0x020145C8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b _0804D920
	.align 2, 0
_0804D904: .4byte 0x020145C8
_0804D908: .4byte 0x0200003C
_0804D90C:
	ldr r0, _0804D990 @ =0x0200003C
	ldr r1, _0804D994 @ =0x02014DC8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, _0804D998 @ =0xFFFFF800
	adds r0, r0, r1
_0804D91E:
	mov ip, r0
_0804D920:
	ldr r0, _0804D99C @ =gPlaySt
	ldrb r0, [r0, #0x15]
	ldr r0, _0804D9A0 @ =0x0200004C
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, _0804D9A4 @ =0x02000044
	ldr r1, _0804D9A8 @ =TsaConfs_BanimTmA
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, _0804D9AC @ =0x0203DFE6
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8055718
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D990: .4byte 0x0200003C
_0804D994: .4byte 0x02014DC8
_0804D998: .4byte 0xFFFFF800
_0804D99C: .4byte gPlaySt
_0804D9A0: .4byte 0x0200004C
_0804D9A4: .4byte 0x02000044
_0804D9A8: .4byte TsaConfs_BanimTmA
_0804D9AC: .4byte 0x0203DFE6

	thumb_func_start EfxPrepareScreenFx
EfxPrepareScreenFx: @ 0x0804D9B0
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0804D9F0 @ =Pal_Text
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0804D9F4 @ =0x02017648
	ldr r1, _0804D9F8 @ =0x06001400
	movs r2, #0xa0
	movs r3, #2
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, _0804D9FC @ =gUnk_081DE528
	ldr r1, _0804DA00 @ =0x06001000
	bl LZ77UnCompVram
	ldr r0, _0804DA04 @ =gBanimValid
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DA0C
	ldr r5, _0804DA08 @ =gUnk_08C09CE4
	b _0804DA1A
	.align 2, 0
_0804D9F0: .4byte Pal_Text
_0804D9F4: .4byte 0x02017648
_0804D9F8: .4byte 0x06001400
_0804D9FC: .4byte gUnk_081DE528
_0804DA00: .4byte 0x06001000
_0804DA04: .4byte gBanimValid
_0804DA08: .4byte gUnk_08C09CE4
_0804DA0C:
	ldr r0, _0804DA54 @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
_0804DA1A:
	ldr r4, _0804DA58 @ =0x02017660
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804DA5C @ =gUnk_081DE730
	ldr r1, _0804DA60 @ =0x06001400
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804DA64 @ =gBanimValid
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DA6C
	ldr r5, _0804DA68 @ =gUnk_08C09CE4
	b _0804DA7A
	.align 2, 0
_0804DA54: .4byte gpEkrBattleUnitLeft
_0804DA58: .4byte 0x02017660
_0804DA5C: .4byte gUnk_081DE730
_0804DA60: .4byte 0x06001400
_0804DA64: .4byte gBanimValid
_0804DA68: .4byte gUnk_08C09CE4
_0804DA6C:
	ldr r0, _0804DAB4 @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804DA7A:
	ldr r4, _0804DAB8 @ =0x02017670
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804DABC @ =gUnk_081DE780
	ldr r1, _0804DAC0 @ =0x06001580
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804DAC4 @ =gBanimValid
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DACC
	ldr r5, _0804DAC8 @ =gUnk_08C09CE4
	b _0804DADA
	.align 2, 0
_0804DAB4: .4byte gpEkrBattleUnitLeft
_0804DAB8: .4byte 0x02017670
_0804DABC: .4byte gUnk_081DE780
_0804DAC0: .4byte 0x06001580
_0804DAC4: .4byte gBanimValid
_0804DAC8: .4byte gUnk_08C09CE4
_0804DACC:
	ldr r0, _0804DB14 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
_0804DADA:
	ldr r4, _0804DB18 @ =0x02017678
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804DB1C @ =gUnk_081DE7EC
	ldr r1, _0804DB20 @ =0x06001740
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804DB24 @ =gBanimValid
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DB2C
	ldr r5, _0804DB28 @ =gUnk_08C09CE4
	b _0804DB3A
	.align 2, 0
_0804DB14: .4byte gpEkrBattleUnitRight
_0804DB18: .4byte 0x02017678
_0804DB1C: .4byte gUnk_081DE7EC
_0804DB20: .4byte 0x06001740
_0804DB24: .4byte gBanimValid
_0804DB28: .4byte gUnk_08C09CE4
_0804DB2C:
	ldr r0, _0804DBF0 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804DB3A:
	ldr r4, _0804DBF4 @ =0x02017668
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804DBF8 @ =gUnk_081DE83C
	ldr r1, _0804DBFC @ =0x060018C0
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r4, _0804DC00 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0x9f
	bl TmFill
	ldr r0, _0804DC04 @ =gUnk_081DEBC4
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl EfxTmCpyBG
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl sub_8067128
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl sub_8067128
	movs r0, #1
	bl EnableBgSync
	ldr r6, _0804DC08 @ =gBanimFactionPal
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804DC0C @ =gUnk_081DEC14
	adds r0, r0, r5
	ldr r4, _0804DC10 @ =gPal + 0x40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r1, _0804DC14 @ =gEkrBg0QuakeVec
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DBF0: .4byte gpEkrBattleUnitRight
_0804DBF4: .4byte 0x02017668
_0804DBF8: .4byte gUnk_081DE83C
_0804DBFC: .4byte 0x060018C0
_0804DC00: .4byte gBg0Tm
_0804DC04: .4byte gUnk_081DEBC4
_0804DC08: .4byte gBanimFactionPal
_0804DC0C: .4byte gUnk_081DEC14
_0804DC10: .4byte gPal + 0x40
_0804DC14: .4byte gEkrBg0QuakeVec

	thumb_func_start sub_804DC18
sub_804DC18: @ 0x0804DC18
	push {r4, r5, lr}
	ldr r0, _0804DC30 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804DC58
	lsls r0, r0, #2
	ldr r1, _0804DC34 @ =_0804DC38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DC30: .4byte gEkrDistanceType
_0804DC34: .4byte _0804DC38
_0804DC38: @ jump table
	.4byte _0804DCA0 @ case 0
	.4byte _0804DC4C @ case 1
	.4byte _0804DC58 @ case 2
	.4byte _0804DCA0 @ case 3
	.4byte _0804DCA0 @ case 4
_0804DC4C:
	ldr r0, _0804DC54 @ =gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0804DCA2
	.align 2, 0
_0804DC54: .4byte gEkrInitialHitSide
_0804DC58:
	movs r1, #0
	movs r5, #0
	ldr r0, _0804DC88 @ =gEkrDebugModeMaybe
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804DC80
	ldr r4, _0804DC8C @ =gEkrPids
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_0804DC80:
	cmp r5, #1
	bne _0804DC90
	movs r0, #0
	b _0804DCA2
	.align 2, 0
_0804DC88: .4byte gEkrDebugModeMaybe
_0804DC8C: .4byte gEkrPids
_0804DC90:
	cmp r1, #1
	beq _0804DCA0
	ldr r0, _0804DC9C @ =gEkrInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0804DCA2
	.align 2, 0
_0804DC9C: .4byte gEkrInitialHitSide
_0804DCA0:
	movs r0, #1
_0804DCA2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EkrEfxStatusClear
EkrEfxStatusClear: @ 0x0804DCA8
	ldr r1, _0804DD04 @ =gEkrHpBarCount
	movs r0, #0
	str r0, [r1]
	ldr r1, _0804DD08 @ =gEfxSpellAnimExists
	str r0, [r1]
	ldr r1, _0804DD0C @ =0x02017730
	str r0, [r1]
	ldr r1, _0804DD10 @ =0x02017738
	str r0, [r1]
	ldr r1, _0804DD14 @ =0x0201773C
	str r0, [r1]
	ldr r1, _0804DD18 @ =0x02017740
	str r0, [r1]
	ldr r1, _0804DD1C @ =0x02017748
	str r0, [r1]
	ldr r1, _0804DD20 @ =gEfxBgSemaphore
	str r0, [r1]
	ldr r1, _0804DD24 @ =0x02017750
	str r0, [r1]
	ldr r1, _0804DD28 @ =0x02017754
	str r0, [r1]
	ldr r1, _0804DD2C @ =0x02017758
	str r0, [r1]
	ldr r1, _0804DD30 @ =0x0201775C
	str r0, [r1]
	ldr r1, _0804DD34 @ =gEkrBg2QuakeVec
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD38 @ =0x02017764
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD3C @ =0x02017768
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD40 @ =gEkrHitEfxBool
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD44 @ =gpProcEfxStatusUnits
	str r0, [r1]
	str r0, [r1, #4]
	ldr r1, _0804DD48 @ =gpProcEfxSpellCast
	str r0, [r1]
	ldr r1, _0804DD4C @ =gpProcEfxHpBarColorChange
	str r0, [r1]
	bx lr
	.align 2, 0
_0804DD04: .4byte gEkrHpBarCount
_0804DD08: .4byte gEfxSpellAnimExists
_0804DD0C: .4byte 0x02017730
_0804DD10: .4byte 0x02017738
_0804DD14: .4byte 0x0201773C
_0804DD18: .4byte 0x02017740
_0804DD1C: .4byte 0x02017748
_0804DD20: .4byte gEfxBgSemaphore
_0804DD24: .4byte 0x02017750
_0804DD28: .4byte 0x02017754
_0804DD2C: .4byte 0x02017758
_0804DD30: .4byte 0x0201775C
_0804DD34: .4byte gEkrBg2QuakeVec
_0804DD38: .4byte 0x02017764
_0804DD3C: .4byte 0x02017768
_0804DD40: .4byte gEkrHitEfxBool
_0804DD44: .4byte gpProcEfxStatusUnits
_0804DD48: .4byte gpProcEfxSpellCast
_0804DD4C: .4byte gpProcEfxHpBarColorChange
