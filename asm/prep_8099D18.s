	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_8099D18
sub_8099D18: @ 0x08099D18
	push {r4, lr}
	ldr r4, _08099DBC @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
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
	movs r2, #4
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099DBC: .4byte gDispIo

	thumb_func_start sub_8099DC0
sub_8099DC0: @ 0x08099DC0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8099DC8
sub_8099DC8: @ 0x08099DC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #3
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _08099E0E
	movs r0, #0
	ldrsh r4, [r4, r0]
	cmp r4, #0
	bge _08099DEA
	adds r4, #3
_08099DEA:
	asrs r4, r4, #2
	lsls r0, r4, #5
	ldr r1, _08099E14 @ =gUnk_0842B4BC
	adds r0, r0, r1
	ldr r1, [r5, #0x58]
	lsls r1, r1, #5
	ldr r2, _08099E18 @ =gPal + 0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	cmp r4, #5
	bne _08099E0E
	adds r0, r5, #0
	bl Proc_Break
_08099E0E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099E14: .4byte gUnk_0842B4BC
_08099E18: .4byte gPal + 0x200

	thumb_func_start sub_8099E1C
sub_8099E1C: @ 0x08099E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099E30 @ =gUnk_08D8D688
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099E30: .4byte gUnk_08D8D688

	thumb_func_start sub_8099E34
sub_8099E34: @ 0x08099E34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	ldr r1, [r0, #0x2c]
	asrs r0, r1, #3
	cmp r0, #5
	bgt _08099E5C
	adds r0, r1, #2
	mov r1, sb
	str r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r0, #6
	bne _08099E5C
	movs r0, #0xf
	bl sub_8099E1C
_08099E5C:
	mov r6, sb
	adds r6, #0x34
	movs r2, #9
	str r2, [sp, #8]
	movs r3, #4
	mov r8, r3
_08099E68:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _08099EBE
	movs r5, #0
	ldrb r7, [r6]
	cmp r5, r7
	bgt _08099EBE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	bge _08099EBE
	movs r4, #0x50
	ldr r2, _08099F5C @ =gUnk_08D8D674
	mov sl, r2
_08099E86:
	lsls r1, r5, #9
	adds r1, r4, r1
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldr r3, [r3]
	mov ip, r3
	ldr r0, _08099F60 @ =0x0000F380
	str r0, [sp]
	movs r0, #4
	ldr r7, [sp, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	mov r3, ip
	bl PutSpriteExt
	adds r4, #0xf
	adds r5, #1
	ldrb r7, [r6]
	cmp r5, r7
	bgt _08099EBE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	blt _08099E86
_08099EBE:
	adds r6, #1
	ldr r2, [sp, #8]
	adds r2, #0x10
	str r2, [sp, #8]
	movs r3, #1
	rsbs r3, r3, #0
	add r8, r3
	mov r7, r8
	cmp r7, #0
	bge _08099E68
	movs r0, #0
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r1, _08099F64 @ =gSinLut
	mov sl, r1
_08099EDE:
	mov r2, r8
	adds r2, #1
	lsls r1, r2, #3
	mov r3, sb
	ldr r0, [r3, #0x2c]
	subs r0, r0, r1
	lsls r4, r0, #5
	str r2, [sp, #4]
	cmp r4, r7
	ble _08099EF6
	movs r4, #0x80
	lsls r4, r4, #1
_08099EF6:
	cmp r4, #0x20
	ble _08099F6C
	ldr r1, _08099F68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r3, sl
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _08099F68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _08099FCA
	.align 2, 0
_08099F5C: .4byte gUnk_08D8D674
_08099F60: .4byte 0x0000F380
_08099F64: .4byte gSinLut
_08099F68: .4byte gCosLut
_08099F6C:
	ldr r3, _08099FE4 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _08099FE4 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08099FCA:
	ldr r2, [sp, #4]
	mov r8, r2
	cmp r2, #4
	ble _08099EDE
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099FE4: .4byte gCosLut

	thumb_func_start sub_8099FE8
sub_8099FE8: @ 0x08099FE8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _0809A038 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	movs r6, #0
	movs r5, #0x80
	ldr r7, _0809A03C @ =gUnk_08D8D634
_0809A000:
	adds r0, r4, #0
	bl ClearText
	ldm r7!, {r0}
	bl DecodeMsg
	adds r3, r4, #0
	adds r4, #8
	ldr r1, _0809A040 @ =gBg2Tm + 0x8
	adds r1, r5, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0x80
	adds r6, #1
	cmp r6, #4
	ble _0809A000
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A038: .4byte 0x020129A8
_0809A03C: .4byte gUnk_08D8D634
_0809A040: .4byte gBg2Tm + 0x8

	thumb_func_start sub_809A044
sub_809A044: @ 0x0809A044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_80B7100
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #0
	strb r0, [r5]
	bl sub_80B71F8
	movs r1, #0x35
	adds r1, r1, r7
	mov sl, r1
	strb r0, [r1]
	bl sub_80B735C
	movs r2, #0x36
	adds r2, r2, r7
	mov sb, r2
	strb r0, [r2]
	bl sub_80B7230
	movs r3, #0x37
	adds r3, r3, r7
	mov r8, r3
	strb r0, [r3]
	bl sub_80B7328
	adds r4, r7, #0
	adds r4, #0x38
	strb r0, [r4]
	ldrb r0, [r5]
	mov r5, sl
	ldrb r1, [r5]
	mov r3, sb
	ldrb r2, [r3]
	mov r5, r8
	ldrb r3, [r5]
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	str r6, [r7, #0x2c]
	ldr r0, _0809A0D8 @ =gUnk_0842B374
	ldr r1, _0809A0DC @ =0x06017000
	bl Decompress
	ldr r0, _0809A0E0 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809A0E4 @ =sub_8099E34
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A0D8: .4byte gUnk_0842B374
_0809A0DC: .4byte 0x06017000
_0809A0E0: .4byte gUnk_0842B4BC
_0809A0E4: .4byte sub_8099E34

	thumb_func_start sub_809A0E8
sub_809A0E8: @ 0x0809A0E8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8099D18
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809A1E4 @ =gBg1Tm
	ldr r1, _0809A1E8 @ =gUnk_0842B57C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _0809A1EC @ =gDispIo
	mov ip, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r6]
	orrs r0, r2
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r5, _0809A1F0 @ =0x020129A8
	movs r4, #5
_0809A1AC:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A1AC
	ldr r0, _0809A1F4 @ =0x02012A90
	movs r1, #8
	bl InitText
	bl sub_8099FE8
	ldr r0, _0809A1F8 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0809A1FC
	movs r0, #0
	str r0, [sp]
	movs r0, #0x29
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
	b _0809A20C
	.align 2, 0
_0809A1E4: .4byte gBg1Tm
_0809A1E8: .4byte gUnk_0842B57C
_0809A1EC: .4byte gDispIo
_0809A1F0: .4byte 0x020129A8
_0809A1F4: .4byte 0x02012A90
_0809A1F8: .4byte gPlaySt
_0809A1FC:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
_0809A20C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809A214
sub_809A214: @ 0x0809A214
	adds r2, r0, #0
	ldr r3, _0809A234 @ =gPlaySt
	adds r1, r3, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809A248
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _0809A23C
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A238 @ =0x00000F73
	b _0809A262
	.align 2, 0
_0809A234: .4byte gPlaySt
_0809A238: .4byte 0x00000F73
_0809A23C:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A244 @ =0x00000F67
	b _0809A262
	.align 2, 0
_0809A244: .4byte 0x00000F67
_0809A248:
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _0809A25C
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A258 @ =0x00000F79
	b _0809A262
	.align 2, 0
_0809A258: .4byte 0x00000F79
_0809A25C:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A26C @ =0x00000F6D
_0809A262:
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r2, #0x30]
	bx lr
	.align 2, 0
_0809A26C: .4byte 0x00000F6D

	thumb_func_start sub_809A270
sub_809A270: @ 0x0809A270
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809A294
sub_809A294: @ 0x0809A294
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80893F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A2AA
	adds r0, r4, #0
	bl Proc_Break
	b _0809A2D2
_0809A2AA:
	ldr r0, _0809A2D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809A2D2
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _0809A2DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A2D2
	ldr r0, _0809A2E0 @ =0x0000038B
	bl m4aSongNumStart
_0809A2D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A2D8: .4byte gpKeySt
_0809A2DC: .4byte gPlaySt
_0809A2E0: .4byte 0x0000038B

	thumb_func_start sub_809A2E4
sub_809A2E4: @ 0x0809A2E4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, [r4, #0x30]
	str r0, [sp]
	ldr r0, _0809A320 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	movs r0, #0x4e
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A320: .4byte 0x06011000

	thumb_func_start sub_809A324
sub_809A324: @ 0x0809A324
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A3E6
	movs r0, #0
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov sb, r1
	adds r2, r7, #0
	adds r2, #0x3e
	str r2, [sp, #4]
_0809A34A:
	mov r3, sb
	add r3, r8
	ldrb r0, [r3]
	movs r4, #1
	add r4, r8
	mov sl, r4
	cmp r0, #0xff
	beq _0809A3AC
	adds r0, r7, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r0, #0
	adds r2, #0x34
	ldr r0, _0809A3F8 @ =0x000001FF
	ands r2, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r4, #0
	ldrsh r1, [r0, r4]
	mov r4, r8
	lsls r0, r4, #4
	adds r0, #0x19
	adds r6, r1, r0
	movs r0, #0xff
	ands r6, r0
	movs r5, #0
	ldrb r3, [r3]
	cmp r5, r3
	bgt _0809A3AC
	adds r4, r2, #0
_0809A388:
	lsls r0, r5, #2
	ldr r1, _0809A3FC @ =gUnk_08D8D674
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _0809A400 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r4, #0xa
	adds r5, #1
	mov r0, sb
	add r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	ble _0809A388
_0809A3AC:
	mov r8, sl
	mov r0, r8
	cmp r0, #4
	ble _0809A34A
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809A3E6
	adds r0, r7, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, #0xc0
	ldr r0, _0809A3F8 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r2, #0x1c
	movs r0, #0xff
	ands r2, r0
	ldr r0, _0809A3FC @ =gUnk_08D8D674
	ldr r3, [r0]
	ldr r0, _0809A400 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_0809A3E6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A3F8: .4byte 0x000001FF
_0809A3FC: .4byte gUnk_08D8D674
_0809A400: .4byte 0x0000F380

	thumb_func_start sub_809A404
sub_809A404: @ 0x0809A404
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r2, #0
	mov r1, sp
	ldr r0, _0809A428 @ =gUnk_0842D18C
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A42C
	movs r2, #1
	b _0809A44C
	.align 2, 0
_0809A428: .4byte gUnk_0842D18C
_0809A42C:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _0809A44C
	cmp r0, #1
	bgt _0809A440
	cmp r0, #0
	beq _0809A446
	b _0809A44C
_0809A440:
	cmp r0, #2
	beq _0809A44A
	b _0809A44C
_0809A446:
	movs r2, #3
	b _0809A44C
_0809A44A:
	movs r2, #2
_0809A44C:
	lsls r0, r2, #2
	add r0, sp
	ldr r0, [r0]
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A474
	movs r0, #0x20
	bl ArchivePalette
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_8013B4C
_0809A474:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809A47C
sub_809A47C: @ 0x0809A47C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x14
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	ldr r6, _0809A510 @ =gUnk_0842B374
	adds r3, r4, #0
	adds r3, #0x34
	movs r5, #0xff
_0809A4A8:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809A4A8
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, _0809A514 @ =0x06017000
	adds r0, r6, #0
	bl Decompress
	ldr r0, _0809A518 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _0809A51C @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0809A520 @ =sub_809A324
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl StartGreenText
	ldr r2, _0809A524 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r1, #0x21
	rsbs r1, r1, #0
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
_0809A510: .4byte gUnk_0842B374
_0809A514: .4byte 0x06017000
_0809A518: .4byte gUnk_0842B4BC
_0809A51C: .4byte gPlaySt
_0809A520: .4byte sub_809A324
_0809A524: .4byte gDispIo

	thumb_func_start sub_809A528
sub_809A528: @ 0x0809A528
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x14]
	cmp r2, #0
	ble _0809A554
	lsls r0, r1, #5
	adds r0, r4, r0
	ldr r1, _0809A55C @ =gBg2Tm
	adds r5, r2, #0
	lsls r0, r0, #1
	adds r4, r0, r1
_0809A542:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSpecialChar
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _0809A542
_0809A554:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A55C: .4byte gBg2Tm

	thumb_func_start sub_809A560
sub_809A560: @ 0x0809A560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	bl ResetText
	ldr r4, _0809A6EC @ =gBg2Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r7, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A594
	b _0809A7FC
_0809A594:
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0xc
	str r0, [sp]
	ldr r2, _0809A6F0 @ =gUnk_08D8D738
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #0x40
	adds r0, r0, r7
	mov sb, r0
	adds r1, r7, #0
	adds r1, #0x41
	str r1, [sp, #0x10]
	adds r2, r7, #0
	adds r2, #0x42
	str r2, [sp, #0x14]
	adds r3, r7, #0
	adds r3, #0x39
	str r3, [sp, #8]
	movs r5, #0x3d
	adds r5, r5, r7
	mov sl, r5
	adds r0, r7, #0
	adds r0, #0x4e
	str r0, [sp, #0x18]
	subs r1, #3
	str r1, [sp, #0xc]
	movs r6, #0x80
	lsls r6, r6, #1
	ldr r2, _0809A6F4 @ =gUnk_08D8D634
	mov r8, r2
	movs r5, #4
_0809A5E8:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r0}
	bl DecodeMsg
	ldr r4, _0809A6F8 @ =gBg2Tm + 0x4
	adds r1, r6, r4
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r6, #0x80
	subs r5, #1
	cmp r5, #0
	bge _0809A5E8
	movs r5, #5
	movs r0, #0xef
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r6, #4
	str r6, [sp]
	ldr r0, _0809A6FC @ =gUnk_0842D1C0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r7, #0x58]
	movs r1, #2
	bl PutNumber
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r4, r2
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	ldr r3, _0809A700 @ =0x0000025E
	adds r1, r4, r3
	str r6, [sp]
	ldr r0, _0809A704 @ =gUnk_0842D1C8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r1, _0809A708 @ =0x0000026A
	adds r0, r4, r1
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r2, #0x9c
	lsls r2, r2, #2
	adds r0, r4, r2
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r0, r4, r3
	mov r1, sb
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r2, _0809A70C @ =0x0000026E
	adds r0, r4, r2
	ldr r3, [sp, #0x10]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_800625C
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r3, [sp, #0x14]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_800625C
	adds r1, r4, #0
	adds r1, #0x4e
	str r5, [sp]
	ldr r0, _0809A710 @ =gUnk_0842D1D0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	adds r0, #0x56
	ldr r2, _0809A714 @ =gUnk_08D8D720
	ldr r5, [sp, #8]
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #4
	bl PutSpecialChar
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809A71C
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	ldr r0, _0809A718 @ =gUnk_0842D1D8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _0809A730
	.align 2, 0
_0809A6EC: .4byte gBg2Tm
_0809A6F0: .4byte gUnk_08D8D738
_0809A6F4: .4byte gUnk_08D8D634
_0809A6F8: .4byte gBg2Tm + 0x4
_0809A6FC: .4byte gUnk_0842D1C0
_0809A700: .4byte 0x0000025E
_0809A704: .4byte gUnk_0842D1C8
_0809A708: .4byte 0x0000026A
_0809A70C: .4byte 0x0000026E
_0809A710: .4byte gUnk_0842D1D0
_0809A714: .4byte gUnk_08D8D720
_0809A718: .4byte gUnk_0842D1D8
_0809A71C:
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	ldr r0, _0809A7AC @ =gUnk_0842D1E4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_0809A730:
	ldr r5, _0809A7B0 @ =gBg2Tm + 0x6c
	movs r4, #2
	str r4, [sp]
	ldr r0, _0809A7B4 @ =gUnk_0842D1EC
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #4
	ldr r3, [sp, #0x18]
	ldrb r2, [r3]
	movs r1, #2
	bl PutNumber
	adds r1, r5, #6
	str r4, [sp]
	ldr r0, _0809A7B8 @ =gUnk_0842D1F0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809A7C0
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #3
	str r0, [sp]
	ldr r0, _0809A7BC @ =gUnk_0842D1F4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r1, r5, #0
	adds r1, #0xba
	movs r0, #6
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x43
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #0
	adds r0, #0xcc
	adds r1, r7, #0
	adds r1, #0x3a
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
	b _0809A95C
	.align 2, 0
_0809A7AC: .4byte gUnk_0842D1E4
_0809A7B0: .4byte gBg2Tm + 0x6c
_0809A7B4: .4byte gUnk_0842D1EC
_0809A7B8: .4byte gUnk_0842D1F0
_0809A7BC: .4byte gUnk_0842D1F4
_0809A7C0:
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #5
	str r0, [sp]
	ldr r0, _0809A7F8 @ =gUnk_0842D1F4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r4, #3
	str r4, [sp]
	movs r0, #0x13
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	str r4, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	b _0809A95C
	.align 2, 0
_0809A7F8: .4byte gUnk_0842D1F4
_0809A7FC:
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0xc
	str r0, [sp]
	ldr r2, _0809A8F8 @ =gUnk_08D8D738
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r5, #0
	adds r7, #0x3d
	mov sl, r7
	movs r6, #0x80
	lsls r6, r6, #1
	movs r4, #4
_0809A82A:
	ldr r1, _0809A8FC @ =gUnk_08D8D634
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	ldr r7, _0809A900 @ =gBg2Tm + 0x4
	adds r1, r6, r7
	movs r2, #5
	mov sb, r2
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r3, #3
	mov r8, r3
	str r3, [sp]
	movs r0, #8
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	adds r6, #0x80
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809A82A
	movs r5, #0xef
	lsls r5, r5, #1
	adds r1, r7, r5
	movs r4, #4
	str r4, [sp]
	ldr r0, _0809A904 @ =gUnk_0842D1C0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	str r0, [sp]
	movs r0, #0x16
	movs r1, #7
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	ldr r2, _0809A908 @ =0x0000025E
	adds r1, r7, r2
	str r4, [sp]
	ldr r0, _0809A90C @ =gUnk_0842D1C8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r3, r8
	str r3, [sp]
	movs r0, #0x16
	movs r1, #9
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	adds r1, r7, #0
	adds r1, #0x4e
	mov r5, sb
	str r5, [sp]
	ldr r0, _0809A910 @ =gUnk_0842D1D0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809A918
	adds r1, r7, #0
	adds r1, #0x5c
	str r4, [sp]
	ldr r0, _0809A914 @ =gUnk_0842D1D8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	b _0809A92C
	.align 2, 0
_0809A8F8: .4byte gUnk_08D8D738
_0809A8FC: .4byte gUnk_08D8D634
_0809A900: .4byte gBg2Tm + 0x4
_0809A904: .4byte gUnk_0842D1C0
_0809A908: .4byte 0x0000025E
_0809A90C: .4byte gUnk_0842D1C8
_0809A910: .4byte gUnk_0842D1D0
_0809A914: .4byte gUnk_0842D1D8
_0809A918:
	adds r1, r7, #0
	adds r1, #0x5c
	str r4, [sp]
	ldr r0, _0809A974 @ =gUnk_0842D1E4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
_0809A92C:
	movs r0, #4
	str r0, [sp]
	movs r0, #0x16
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	movs r0, #5
	str r0, [sp]
	movs r0, #0x11
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	movs r0, #3
	str r0, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
_0809A95C:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A974: .4byte gUnk_0842D1E4

	thumb_func_start sub_809A978
sub_809A978: @ 0x0809A978
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8099D18
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #3
	bl SetUiSpinningArrowConfig
	movs r0, #0
	movs r1, #0x40
	movs r2, #0xe8
	movs r3, #0x40
	bl SetUiSpinningArrowPositions
	ldr r3, _0809A9F8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #6
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
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A9F8: .4byte gDispIo

	thumb_func_start sub_809A9FC
sub_809A9FC: @ 0x0809A9FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r0, sp, #0x28
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809AB18 @ =0x0100000C
	add r1, sp, #0x10
	bl CpuSet
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	add r0, sp, #0x10
	bl sub_809FC60
	add r0, sp, #0x10
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	cmp r0, #0
	bne _0809AA3A
	b _0809AB8C
_0809AA3A:
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	adds r3, r6, #0
	adds r3, #0x34
	strb r0, [r3]
	add r0, sp, #0x10
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	movs r1, #0x35
	adds r1, r1, r6
	mov r8, r1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	movs r2, #0x36
	adds r2, r2, r6
	mov ip, r2
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	adds r7, r6, #0
	adds r7, #0x37
	strb r1, [r7]
	add r0, sp, #0x10
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r6, #0
	adds r4, #0x38
	strb r0, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	movs r0, #0x3e
	adds r0, r0, r6
	mov sb, r0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	lsrs r0, r0, #7
	adds r1, r6, #0
	adds r1, #0x40
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #0x18]
	ldr r1, _0809AB1C @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r6, #0x58]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x17]
	adds r5, r6, #0
	adds r5, #0x3f
	strb r0, [r5]
	ldrb r0, [r3]
	mov r2, r8
	ldrb r1, [r2]
	mov r3, ip
	ldrb r2, [r3]
	ldrb r3, [r7]
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r6, #0
	adds r1, #0x39
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	adds r2, r6, #0
	adds r2, #0x4e
	strb r0, [r2]
	add r0, sp, #0x10
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	subs r2, #0x14
	strb r0, [r2]
	mov r2, sb
	ldrb r0, [r2]
	adds r7, r1, #0
	cmp r0, #0
	beq _0809AB20
	adds r4, r6, #0
	adds r4, #0x43
	add r1, sp, #0x1c
	adds r0, r4, #0
	bl strcpy
	adds r0, r4, #0
	bl SetTacticianName
	b _0809AB2A
	.align 2, 0
_0809AB18: .4byte 0x0100000C
_0809AB1C: .4byte 0x001FFFFF
_0809AB20:
	ldr r0, _0809AB68 @ =0x00000569
	bl DecodeMsg
	bl SetTacticianName
_0809AB2A:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809AB4C
	ldrb r1, [r7]
	bl sub_809B214
	cmp r0, #0
	bne _0809AB3C
	strb r0, [r5]
_0809AB3C:
	ldrb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r3, _0809AB6C @ =gBg1Tm
	mov r8, r3
	ldr r7, _0809AB70 @ =gUnk_0842BA30
	cmp r0, #0
	bne _0809ABAA
_0809AB4C:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809AB74
	movs r0, #0x2d
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r0, _0809AB6C @ =gBg1Tm
	mov r8, r0
	ldr r7, _0809AB70 @ =gUnk_0842BA30
	b _0809ABAA
	.align 2, 0
_0809AB68: .4byte 0x00000569
_0809AB6C: .4byte gBg1Tm
_0809AB70: .4byte gUnk_0842BA30
_0809AB74:
	movs r0, #0x28
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r1, _0809AB84 @ =gBg1Tm
	mov r8, r1
	ldr r7, _0809AB88 @ =gUnk_0842BA30
	b _0809ABAA
	.align 2, 0
_0809AB84: .4byte gBg1Tm
_0809AB88: .4byte gUnk_0842BA30
_0809AB8C:
	movs r2, #0
	adds r4, r1, #0
	ldr r3, _0809AC48 @ =gBg1Tm
	mov r8, r3
	ldr r7, _0809AC4C @ =gUnk_0842BA30
	adds r3, r6, #0
	adds r3, #0x34
	movs r5, #0xff
_0809AB9C:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809AB9C
_0809ABAA:
	movs r2, #0xa5
	lsls r2, r2, #7
	mov r0, r8
	adds r1, r7, #0
	bl TmApplyTsa_thm
	adds r0, r6, #0
	bl sub_809A560
	adds r0, r6, #0
	bl sub_809A404
	movs r0, #7
	bl EnableBgSync
	movs r0, #0
	bl EndFaceById
	bl EndCgText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809AC38
	adds r4, r6, #0
	adds r4, #0x3f
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809AC38
	ldr r2, _0809AC50 @ =gCharacterData
	ldrb r1, [r4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r0, #0xc1
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0xd8
	movs r3, #0x58
	bl StartBmFace
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r1, [r1]
	bl sub_809B214
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r4, [sp]
	ldr r0, _0809AC54 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	ldr r0, _0809AC58 @ =0x000809FE
	bl SetCgTextFlags
_0809AC38:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AC48: .4byte gBg1Tm
_0809AC4C: .4byte gUnk_0842BA30
_0809AC50: .4byte gCharacterData
_0809AC54: .4byte 0x06011000
_0809AC58: .4byte 0x000809FE

	thumb_func_start sub_809AC5C
sub_809AC5C: @ 0x0809AC5C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4f
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r1, _0809ACA8 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0809ACB4
	ldr r0, _0809ACAC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC8E
	ldr r0, _0809ACB0 @ =0x0000038B
	bl m4aSongNumStart
_0809AC8E:
	movs r1, #0x80
	lsls r1, r1, #1
	str r5, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809AD4C
	.align 2, 0
_0809ACA8: .4byte gpKeySt
_0809ACAC: .4byte gPlaySt
_0809ACB0: .4byte 0x0000038B
_0809ACB4:
	movs r0, #4
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0809AD00
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	subs r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809AD06
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bls _0809AD06
	ldr r0, _0809ACF8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ACEE
	ldr r0, _0809ACFC @ =0x0000038A
	bl m4aSongNumStart
_0809ACEE:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809AD4C
	.align 2, 0
_0809ACF8: .4byte gPlaySt
_0809ACFC: .4byte 0x0000038A
_0809AD00:
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
_0809AD06:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r2, r4, #0
	adds r2, #0x4f
	cmp r0, #0
	beq _0809AD1C
	movs r0, #0xff
	strb r0, [r2]
_0809AD1C:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809AD2E
	movs r0, #1
	strb r0, [r2]
_0809AD2E:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0809AD44
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809AD4C
_0809AD44:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0809AD4C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809AD54
sub_809AD54: @ 0x0809AD54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r6, #0x5c
	ldrh r0, [r6]
	bl sub_809B2A0
	adds r7, r0, #0
	cmp r7, #0
	bne _0809AD72
	strh r7, [r6]
	movs r0, #0
	bl sub_809B2A0
	adds r7, r0, #0
_0809AD72:
	ldrh r0, [r6]
	bl sub_809B248
	adds r5, r0, #0
	ldrh r0, [r6]
	adds r0, #1
	movs r4, #0
	strh r0, [r6]
	movs r0, #0
	bl EndFaceById
	ldr r2, _0809ADD0 @ =gCharacterData
	subs r1, r7, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	str r4, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r5, [sp]
	ldr r0, _0809ADD4 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	ldr r0, _0809ADD8 @ =0x0002000A
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ADD0: .4byte gCharacterData
_0809ADD4: .4byte 0x06011000
_0809ADD8: .4byte 0x0002000A

	thumb_func_start sub_809ADDC
sub_809ADDC: @ 0x0809ADDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0809AECC @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r4, #0xc]
	ands r1, r3
	movs r3, #1
	mov r8, r3
	mov r3, r8
	orrs r1, r3
	strb r1, [r4, #0xc]
	movs r1, #3
	ldrb r3, [r4, #0x10]
	orrs r1, r3
	strb r1, [r4, #0x10]
	adds r1, r2, #0
	ldrb r3, [r4, #0x14]
	ands r1, r3
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	ands r2, r1
	strb r2, [r4, #0x18]
	movs r5, #0
	str r5, [r0, #0x2c]
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x45
	movs r7, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _0809AED0 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809AED4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	ldr r0, _0809AED8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AE66
	movs r0, #0xc8
	bl m4aSongNumStart
_0809AE66:
	movs r0, #0x20
	ldrb r3, [r4, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r2, r4, #0
	adds r2, #0x34
	mov r0, r8
	ldrb r1, [r2]
	orrs r0, r1
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AECC: .4byte gDispIo
_0809AED0: .4byte 0x0000FFE0
_0809AED4: .4byte 0x0000E0FF
_0809AED8: .4byte gPlaySt

	thumb_func_start sub_809AEDC
sub_809AEDC: @ 0x0809AEDC
	push {r4, lr}
	movs r1, #0
	movs r4, #0xf0
	cmp r0, #0
	ble _0809AEE8
	adds r1, r0, #0
_0809AEE8:
	cmp r0, #0
	bge _0809AEF2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r0, r2
_0809AEF2:
	cmp r4, #0xf0
	bgt _0809AF00
	adds r0, r4, #0
	cmp r0, #0
	bge _0809AF02
	movs r0, #0
	b _0809AF02
_0809AF00:
	movs r0, #0xf0
_0809AF02:
	adds r4, r0, #0
	cmp r1, #0xf0
	bgt _0809AF10
	cmp r1, #0
	bge _0809AF12
	movs r1, #0
	b _0809AF12
_0809AF10:
	movs r1, #0xf0
_0809AF12:
	ldr r2, _0809AF34 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x2d
	movs r0, #0
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x31
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF34: .4byte gDispIo

	thumb_func_start sub_809AF38
sub_809AF38: @ 0x0809AF38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r5, #0
	muls r1, r0, r1
	mov r8, r1
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r7, r5, #0
	muls r7, r0, r7
	ldr r4, _0809B024 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	adds r2, #9
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r1, [r0]
	mov r0, r8
	lsls r5, r0, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	adds r2, r7, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, r8
	rsbs r0, r1, #0
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	rsbs r1, r7, #0
	adds r2, r6, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_809AEDC
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809B00C
	movs r1, #0xd8
	mov r0, r8
	subs r1, r1, r0
	movs r2, #0x58
	subs r2, r2, r7
	movs r0, #0
	bl sub_8007B80
_0809B00C:
	ldr r0, [r6, #0x2c]
	cmp r0, #0xa
	bne _0809B018
	adds r0, r6, #0
	bl Proc_Break
_0809B018:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B024: .4byte gDispIo

	thumb_func_start sub_809B028
sub_809B028: @ 0x0809B028
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x2c]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809B060
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809B05C
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #1
	ldrb r3, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	strb r5, [r2]
	b _0809B060
_0809B05C:
	adds r0, #1
	strb r0, [r2]
_0809B060:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0809B092
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809B08E
	adds r0, r4, #0
	adds r0, #0x3d
	movs r1, #1
	ldrb r3, [r0]
	subs r1, r1, r3
	strb r1, [r0]
	movs r0, #2
	b _0809B090
_0809B08E:
	subs r0, #1
_0809B090:
	strb r0, [r2]
_0809B092:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809B098
sub_809B098: @ 0x0809B098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	adds r0, #1
	str r0, [r7, #0x2c]
	movs r5, #0xa
	subs r5, r5, r0
	lsls r0, r5, #3
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	lsls r0, r5, #4
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x10
	subs r2, r2, r0
	lsls r4, r4, #3
	subs r4, #0x40
	adds r0, r7, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r4, #0
	muls r3, r0, r3
	mov r8, r3
	ldr r6, _0809B1EC @ =gDispIo
	movs r0, #0x3c
	adds r0, r0, r6
	mov sl, r0
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r3, sl
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	movs r1, #0
	ldr r3, _0809B1F0 @ =0x030027D4
	strb r0, [r3]
	ldr r0, _0809B1F4 @ =0x030027D5
	strb r2, [r0]
	ldr r2, _0809B1F8 @ =0x030027D6
	strb r1, [r2]
	mov r3, sb
	lsls r5, r3, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r4, r0, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	mov r2, r8
	adds r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, sb
	rsbs r0, r1, #0
	adds r1, r7, #0
	adds r1, #0x52
	movs r4, #0
	strh r0, [r1]
	mov r2, r8
	rsbs r1, r2, #0
	adds r2, r7, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_809AEDC
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809B17E
	movs r1, #0xd8
	mov r3, sb
	subs r1, r1, r3
	movs r2, #0x58
	mov r0, r8
	subs r2, r2, r0
	movs r0, #0
	bl sub_8007B80
_0809B17E:
	ldr r0, [r7, #0x2c]
	cmp r0, #0xa
	bne _0809B1DE
	adds r0, r7, #0
	bl Proc_Break
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0xc]
	movs r2, #3
	ldrb r0, [r6, #0x10]
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r3, [r6, #0x14]
	ands r1, r3
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r0, [r6, #0x18]
	orrs r2, r0
	strb r2, [r6, #0x18]
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	mov r2, sl
	strb r0, [r2]
	ldr r3, _0809B1F0 @ =0x030027D4
	strb r4, [r3]
	ldr r0, _0809B1F4 @ =0x030027D5
	strb r4, [r0]
	ldr r1, _0809B1F8 @ =0x030027D6
	strb r4, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
_0809B1DE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B1EC: .4byte gDispIo
_0809B1F0: .4byte 0x030027D4
_0809B1F4: .4byte 0x030027D5
_0809B1F8: .4byte 0x030027D6

	thumb_func_start sub_809B1FC
sub_809B1FC: @ 0x0809B1FC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	bl sub_809EDF0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809B214
sub_809B214: @ 0x0809B214
	adds r3, r0, #0
	ldr r2, _0809B21C @ =gUnk_08D8D84C
	b _0809B23C
	.align 2, 0
_0809B21C: .4byte gUnk_08D8D84C
_0809B220:
	ldr r0, [r2]
	cmp r3, r0
	bne _0809B23A
	cmp r1, #3
	ble _0809B22E
	ldr r0, [r2, #4]
	b _0809B244
_0809B22E:
	cmp r1, #1
	ble _0809B236
	ldr r0, [r2, #8]
	b _0809B244
_0809B236:
	ldr r0, [r2, #0xc]
	b _0809B244
_0809B23A:
	adds r2, #0x10
_0809B23C:
	ldr r0, [r2]
	cmp r0, #0
	bne _0809B220
	movs r0, #0
_0809B244:
	bx lr
	.align 2, 0

	thumb_func_start sub_809B248
sub_809B248: @ 0x0809B248
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _0809B26C
	ldr r4, _0809B268 @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #4
	b _0809B292
	.align 2, 0
_0809B268: .4byte gUnk_08D8D84C
_0809B26C:
	cmp r0, #1
	beq _0809B284
	ldr r4, _0809B280 @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #0xc
	b _0809B292
	.align 2, 0
_0809B280: .4byte gUnk_08D8D84C
_0809B284:
	ldr r4, _0809B29C @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #8
_0809B292:
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809B29C: .4byte gUnk_08D8D84C

	thumb_func_start sub_809B2A0
sub_809B2A0: @ 0x0809B2A0
	push {r4, lr}
	ldr r4, _0809B2B8 @ =gUnk_08D8D84C
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B2B8: .4byte gUnk_08D8D84C

	thumb_func_start sub_809B2BC
sub_809B2BC: @ 0x0809B2BC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r2, [r0, #0x30]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x90
	movs r1, #3
	bl sub_8090148
	movs r6, #0x9c
	lsls r6, r6, #5
	movs r5, #0x94
	movs r4, #2
_0809B2D6:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x12
	ldr r3, _0809B2F8 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809B2D6
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B2F8: .4byte Sprite_32x16

	thumb_func_start sub_809B2FC
sub_809B2FC: @ 0x0809B2FC
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0809B374 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	ldr r0, _0809B378 @ =0x06010000
	adds r5, r5, r0
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	bl InitSpriteTextFont
	ldr r0, _0809B37C @ =Pal_Text
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0x60
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B374: .4byte gPlaySt
_0809B378: .4byte 0x06010000
_0809B37C: .4byte Pal_Text

	thumb_func_start sub_809B380
sub_809B380: @ 0x0809B380
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl GetChapterDivinationPortrait
	adds r6, r0, #0
	ldr r4, _0809B4B0 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r2, _0809B4B4 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #7
	bl EnableBgSync
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _0809B4B8 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x10
	movs r3, #0
	bl EnableSysBrownBox
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	bl sub_809B2FC
	ldr r4, _0809B4BC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0809B478
	movs r1, #1
_0809B478:
	adds r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r5, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl DrawAtMenuUpfx
	ldr r0, _0809B4C0 @ =sub_809B2BC
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	ldrb r0, [r4, #0xe]
	cmp r0, #0x2e
	bne _0809B4C4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809B4F4
	.align 2, 0
_0809B4B0: .4byte gDispIo
_0809B4B4: .4byte 0x0000FFFC
_0809B4B8: .4byte 0x02012A90
_0809B4BC: .4byte gPlaySt
_0809B4C0: .4byte sub_809B2BC
_0809B4C4:
	cmp r6, #0x4b
	bne _0809B4D0
	movs r0, #0x99
	bl SetFlag
	b _0809B4F4
_0809B4D0:
	movs r0, #0x99
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B4F4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x2a
	bgt _0809B4F4
	movs r6, #0x4b
	movs r0, #0x99
	bl ClearFlag
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_0809B4F4:
	ldr r3, _0809B50C @ =0x00000202
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_8008DA8
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B50C: .4byte 0x00000202

	thumb_func_start sub_809B510
sub_809B510: @ 0x0809B510
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl GetChapterDivinationTextIdBeginning
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B54C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B550 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B54C: .4byte 0x06011000
_0809B550: .4byte 0x0004004E

	thumb_func_start sub_809B554
sub_809B554: @ 0x0809B554
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl GetChapterDivinationTextIdHectorStory
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B590 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B594 @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B590: .4byte 0x06011000
_0809B594: .4byte 0x0004000A

	thumb_func_start sub_809B598
sub_809B598: @ 0x0809B598
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B5B0 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B5B8
	ldr r0, _0809B5B4 @ =0x00000FAD
	b _0809B5BA
	.align 2, 0
_0809B5B0: .4byte gPlaySt
_0809B5B4: .4byte 0x00000FAD
_0809B5B8:
	ldr r0, _0809B5EC @ =0x00000FAE
_0809B5BA:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B5F0 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B5F4 @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B5EC: .4byte 0x00000FAE
_0809B5F0: .4byte 0x06011000
_0809B5F4: .4byte 0x0004000A

	thumb_func_start sub_809B5F8
sub_809B5F8: @ 0x0809B5F8
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B610 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B618
	ldr r0, _0809B614 @ =0x00000FAF
	b _0809B61C
	.align 2, 0
_0809B610: .4byte gPlaySt
_0809B614: .4byte 0x00000FAF
_0809B618:
	movs r0, #0xfb
	lsls r0, r0, #4
_0809B61C:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B64C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B650 @ =0x0006000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B64C: .4byte 0x06011000
_0809B650: .4byte 0x0006000A

	thumb_func_start sub_809B654
sub_809B654: @ 0x0809B654
	push {lr}
	sub sp, #4
	ldr r3, _0809B670 @ =0x00000202
	movs r0, #0
	str r0, [sp]
	movs r0, #0x41
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_8008DA8
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809B670: .4byte 0x00000202

	thumb_func_start sub_809B674
sub_809B674: @ 0x0809B674
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B68C @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B694
	ldr r0, _0809B690 @ =0x00000FB1
	b _0809B696
	.align 2, 0
_0809B68C: .4byte gPlaySt
_0809B690: .4byte 0x00000FB1
_0809B694:
	ldr r0, _0809B6C8 @ =0x00000FB2
_0809B696:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B6CC @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B6D0 @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B6C8: .4byte 0x00000FB2
_0809B6CC: .4byte 0x06011000
_0809B6D0: .4byte 0x0004000A

	thumb_func_start sub_809B6D4
sub_809B6D4: @ 0x0809B6D4
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809B6F8
sub_809B6F8: @ 0x0809B6F8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099C44
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B734 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B738 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B734: .4byte 0x06011000
_0809B738: .4byte 0x0004004E

	thumb_func_start sub_809B73C
sub_809B73C: @ 0x0809B73C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809B78A
	bl sub_8099C60
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _0809B780
	cmp r4, #0
	ble _0809B772
	rsbs r0, r4, #0
	bl AddGold
	ldr r0, _0809B77C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B772
	movs r0, #0xb9
	bl m4aSongNumStart
_0809B772:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0809B792
	.align 2, 0
_0809B77C: .4byte gPlaySt
_0809B780:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0809B792
_0809B78A:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0809B792:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809B798
sub_809B798: @ 0x0809B798
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809B7AE
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809B7B6
_0809B7AE:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0809B7B6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809B7BC
sub_809B7BC: @ 0x0809B7BC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B7D4
	ldr r0, _0809B7D0 @ =0x00000F61
	b _0809B7D6
	.align 2, 0
_0809B7D0: .4byte 0x00000F61
_0809B7D4:
	ldr r0, _0809B80C @ =0x00000F5F
_0809B7D6:
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, _0809B810 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B814 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B80C: .4byte 0x00000F5F
_0809B810: .4byte 0x06011000
_0809B814: .4byte 0x0004004E

	thumb_func_start sub_809B818
sub_809B818: @ 0x0809B818
	push {lr}
	sub sp, #0x10
	movs r1, #0xf6
	lsls r1, r1, #4
	str r1, [r0, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r1, [sp]
	ldr r0, _0809B850 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B854 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B850: .4byte 0x06011000
_0809B854: .4byte 0x0004004E

	thumb_func_start sub_809B858
sub_809B858: @ 0x0809B858
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_809B874
sub_809B874: @ 0x0809B874
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_809B890
sub_809B890: @ 0x0809B890
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0809B8C8 @ =gPal + 0x142
	ldr r5, _0809B8CC @ =gPlaySt
	adds r1, r4, #0
	adds r1, #0x2c
	movs r2, #0xe
_0809B89E:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0809B89E
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B8BE
	movs r0, #0xee
	bl m4aSongNumStart
_0809B8BE:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B8C8: .4byte gPal + 0x142
_0809B8CC: .4byte gPlaySt

	thumb_func_start sub_809B8D0
sub_809B8D0: @ 0x0809B8D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B964 @ =gPal + 0x142
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809B8F8:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809B91E
	movs r3, #0x1f
_0809B91E:
	cmp r2, #0x1f
	ble _0809B924
	movs r2, #0x1f
_0809B924:
	cmp r0, #0x1f
	ble _0809B92A
	movs r0, #0x1f
_0809B92A:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809B8F8
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _0809B956
	adds r0, r6, #0
	bl Proc_Break
_0809B956:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B964: .4byte gPal + 0x142

	thumb_func_start sub_809B968
sub_809B968: @ 0x0809B968
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B9FC @ =gPal + 0x142
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	subs r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809B990:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809B9B6
	movs r3, #0x1f
_0809B9B6:
	cmp r2, #0x1f
	ble _0809B9BC
	movs r2, #0x1f
_0809B9BC:
	cmp r0, #0x1f
	ble _0809B9C2
	movs r0, #0x1f
_0809B9C2:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809B990
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0
	bne _0809B9EE
	adds r0, r6, #0
	bl Proc_Break
_0809B9EE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B9FC: .4byte gPal + 0x142

	thumb_func_start sub_809BA00
sub_809BA00: @ 0x0809BA00
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809BA10 @ =gUnk_08D8DCD4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0809BA10: .4byte gUnk_08D8DCD4
