	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_8012BC0
sub_8012BC0: @ 0x08012BC0
	push {r4, r5, r6, lr}
	sub sp, #0x48
	bl GetGlobalCompletionCount
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r0
	movs r5, #0
	mov r6, sp
_08012BD4:
	adds r0, r5, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012C02
	adds r0, r5, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	movs r2, #0xe
	ldrsb r2, [r6, r2]
	ldrh r0, [r6, #0x2e]
	lsls r1, r0, #0x14
	lsrs r1, r1, #0x1b
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r2, r2, r0
	cmp r4, r2
	bge _08012C02
	adds r4, r2, #0
_08012C02:
	adds r5, #1
	cmp r5, #2
	ble _08012BD4
	cmp r4, #4
	bgt _08012C10
	movs r0, #0
	b _08012C5A
_08012C10:
	cmp r4, #0xa
	bgt _08012C18
	movs r0, #1
	b _08012C5A
_08012C18:
	cmp r4, #0x12
	bgt _08012C20
	movs r0, #2
	b _08012C5A
_08012C20:
	cmp r4, #0x1a
	bgt _08012C28
	movs r0, #3
	b _08012C5A
_08012C28:
	cmp r4, #0x44
	bgt _08012C30
	movs r0, #4
	b _08012C5A
_08012C30:
	cmp r4, #0x49
	bgt _08012C38
	movs r0, #5
	b _08012C5A
_08012C38:
	cmp r4, #0x4f
	bgt _08012C40
	movs r0, #6
	b _08012C5A
_08012C40:
	cmp r4, #0x57
	bgt _08012C48
	movs r0, #7
	b _08012C5A
_08012C48:
	cmp r4, #0x5f
	bgt _08012C50
	movs r0, #8
	b _08012C5A
_08012C50:
	cmp r4, #0x89
	ble _08012C58
	movs r0, #0xa
	b _08012C5A
_08012C58:
	movs r0, #9
_08012C5A:
	add sp, #0x48
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8012C64
sub_8012C64: @ 0x08012C64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8012BC0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl StartLordSelect
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GC_CheckSramResetKeyCombo
GC_CheckSramResetKeyCombo: @ 0x08012C80
	push {lr}
	adds r2, r0, #0
	ldr r0, _08012CA0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	cmp r1, r0
	bne _08012C9A
	adds r0, r2, #0
	movs r1, #0xf
	bl Proc_Goto
_08012C9A:
	pop {r0}
	bx r0
	.align 2, 0
_08012CA0: .4byte gpKeySt

	thumb_func_start GC_InitSramResetScreen
GC_InitSramResetScreen: @ 0x08012CA4
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	ldr r2, _08012CD4 @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #3
	movs r1, #0
	bl StartMuralBackgroundAlt
	pop {r0}
	bx r0
	.align 2, 0
_08012CD4: .4byte gPlaySt

	thumb_func_start GC_InitFastStartCheck
GC_InitFastStartCheck: @ 0x08012CD8
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

	thumb_func_start GC_FastStartCheck
GC_FastStartCheck: @ 0x08012CE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08012CFC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08012D00
	adds r0, r4, #0
	bl Proc_Break
	b _08012D44
	.align 2, 0
_08012CFC: .4byte gpKeySt
_08012D00:
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08012D44
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012D28
	movs r0, #3
	bl ReadSuspendSave
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _08012D44
_08012D28:
	movs r0, #0x5a
	movs r1, #0
	bl sub_8003684
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08012D44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8012D4C
sub_8012D4C: @ 0x08012D4C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x26
	ldrb r1, [r1]
	cmp r1, #0xb
	beq _08012D5C
	bl Proc_End
_08012D5C:
	pop {r0}
	bx r0

	thumb_func_start sub_8012D60
sub_8012D60: @ 0x08012D60
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08012D88 @ =gPal
	ldr r2, _08012D8C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _08012D90 @ =sub_8012D4C
	bl sub_8004648
	ldr r0, _08012D94 @ =OnMain
	bl SetMainFunc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08012D88: .4byte gPal
_08012D8C: .4byte 0x01000100
_08012D90: .4byte sub_8012D4C
_08012D94: .4byte OnMain

	thumb_func_start sub_8012D98
sub_8012D98: @ 0x08012D98
	push {lr}
	movs r0, #0x5a
	movs r1, #0
	bl sub_8003684
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8012DB4
sub_8012DB4: @ 0x08012DB4
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start GC_PostIntro
GC_PostIntro: @ 0x08012DC8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	cmp r1, #1
	beq _08012E02
	cmp r1, #1
	bgt _08012DDE
	cmp r1, #0
	beq _08012DF2
	b _08012E38
_08012DDE:
	cmp r1, #2
	beq _08012DE8
	cmp r1, #3
	beq _08012E30
	b _08012E38
_08012DE8:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08012E38
_08012DF2:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	bl sub_8012DB4
	b _08012E38
_08012E02:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r2, [r0]
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _08012E16
	cmp r1, #1
	beq _08012E20
	b _08012E28
_08012E16:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _08012E28
_08012E20:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08012E28:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08012E38
_08012E30:
	adds r0, r4, #0
	movs r1, #0x15
	bl Proc_Goto
_08012E38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8012E40
sub_8012E40: @ 0x08012E40
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _08012E52
	cmp r1, #1
	beq _08012E5A
	b _08012E60
_08012E52:
	movs r1, #3
	bl Proc_Goto
	b _08012E60
_08012E5A:
	movs r1, #0
	bl Proc_Goto
_08012E60:
	pop {r0}
	bx r0

	thumb_func_start GC_PostMainMenu
GC_PostMainMenu: @ 0x08012E64
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #8
	bhi _08012F24
	lsls r0, r0, #2
	ldr r1, _08012E7C @ =_08012E80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012E7C: .4byte _08012E80
_08012E80: @ jump table
	.4byte _08012EA4 @ case 0
	.4byte _08012EA4 @ case 1
	.4byte _08012EA4 @ case 2
	.4byte _08012EA4 @ case 3
	.4byte _08012EF4 @ case 4
	.4byte _08012EFE @ case 5
	.4byte _08012F08 @ case 6
	.4byte _08012F12 @ case 7
	.4byte _08012F1C @ case 8
_08012EA4:
	bl sub_80A0580
	cmp r0, #0xb
	bne _08012EB6
	adds r0, r4, #0
	movs r1, #0x14
	bl Proc_Goto
	b _08012F24
_08012EB6:
	bl GetTacticianName
	ldrb r0, [r0]
	cmp r0, #0
	bne _08012EE6
	ldr r1, _08012ED8 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08012EDC
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _08012F24
	.align 2, 0
_08012ED8: .4byte gPlaySt
_08012EDC:
	ldr r0, _08012EF0 @ =0x00000569
	bl DecodeMsg
	bl SetTacticianName
_08012EE6:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08012F24
	.align 2, 0
_08012EF0: .4byte 0x00000569
_08012EF4:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _08012F24
_08012EFE:
	adds r0, r4, #0
	movs r1, #0x16
	bl Proc_Goto
	b _08012F24
_08012F08:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08012F24
_08012F12:
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	b _08012F24
_08012F1C:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
_08012F24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8012F2C
sub_8012F2C: @ 0x08012F2C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #5
	bne _08012F3E
	movs r1, #3
	bl Proc_Goto
_08012F3E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8012F44
sub_8012F44: @ 0x08012F44
	push {lr}
	movs r1, #3
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_8012F50
sub_8012F50: @ 0x08012F50
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _08012F66
	cmp r1, #1
	bne _08012F66
	movs r1, #0x10
	bl Proc_Goto
_08012F66:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8012F6C
sub_8012F6C: @ 0x08012F6C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne _08012F82
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08012FA6
_08012F82:
	movs r0, #0
	bl InitPlayConfig
	ldr r4, _08012FAC @ =gPlaySt
	movs r0, #8
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl sub_807A0A0
	bl sub_8079FDC
	bl InitUnits
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
_08012FA6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012FAC: .4byte gPlaySt

	thumb_func_start sub_8012FB0
sub_8012FB0: @ 0x08012FB0
	push {lr}
	bl sub_80A2BFC
	bl ClearPidStats
	bl CleanupUnitsBeforeChapter
	ldr r1, _08012FC8 @ =gPlaySt
	movs r0, #0x30
	strb r0, [r1, #0xe]
	pop {r0}
	bx r0
	.align 2, 0
_08012FC8: .4byte gPlaySt

	thumb_func_start sub_8012FCC
sub_8012FCC: @ 0x08012FCC
	push {lr}
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r1, _08012FE8 @ =gPlaySt
	adds r1, #0x41
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08012FE8: .4byte gPlaySt

	thumb_func_start sub_8012FEC
sub_8012FEC: @ 0x08012FEC
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllMus
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0801304A
	lsls r0, r0, #2
	ldr r1, _08013008 @ =_0801300C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013008: .4byte _0801300C
_0801300C: @ jump table
	.4byte _08013024 @ case 0
	.4byte _0801304A @ case 1
	.4byte _0801302E @ case 2
	.4byte _08013038 @ case 3
	.4byte _08013042 @ case 4
	.4byte _08013042 @ case 5
_08013024:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0801304A
_0801302E:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _0801304A
_08013038:
	adds r0, r4, #0
	movs r1, #0x13
	bl Proc_Goto
	b _0801304A
_08013042:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_0801304A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GC_CheckForGameEnded
GC_CheckForGameEnded: @ 0x08013050
	push {lr}
	adds r2, r0, #0
	ldr r1, _0801306C @ =gPlaySt
	movs r0, #0x20
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08013068
	adds r0, r2, #0
	movs r1, #0xe
	bl Proc_Goto
_08013068:
	pop {r0}
	bx r0
	.align 2, 0
_0801306C: .4byte gPlaySt

	thumb_func_start GC_PostLoadSuspend
GC_PostLoadSuspend: @ 0x08013070
	push {lr}
	adds r2, r0, #0
	ldr r1, _0801308C @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08013090
	adds r0, r2, #0
	movs r1, #8
	bl Proc_Goto
	b _08013098
	.align 2, 0
_0801308C: .4byte gPlaySt
_08013090:
	adds r0, r2, #0
	movs r1, #7
	bl Proc_Goto
_08013098:
	pop {r0}
	bx r0

	thumb_func_start GC_InitNextChapter
GC_InitNextChapter: @ 0x0801309C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080130BC @ =gPlaySt
	adds r0, r5, #0
	bl RegisterChapterStats
	bl ComputeChapterRankings
	adds r4, #0x2a
	ldrb r0, [r4]
	strb r0, [r5, #0xe]
	bl CleanupUnitsBeforeChapter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080130BC: .4byte gPlaySt

	thumb_func_start sub_80130C0
sub_80130C0: @ 0x080130C0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080130D8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	beq _080130D2
	adds r0, r1, #0
	bl sub_80A5AF8
_080130D2:
	pop {r0}
	bx r0
	.align 2, 0
_080130D8: .4byte gPlaySt

	thumb_func_start sub_80130DC
sub_80130DC: @ 0x080130DC
	ldr r1, _080130E4 @ =gPlaySt
	movs r0, #2
	strb r0, [r1, #0x1b]
	bx lr
	.align 2, 0
_080130E4: .4byte gPlaySt

	thumb_func_start GC_DarkenScreen_
GC_DarkenScreen_: @ 0x080130E8
	ldr r3, _08013120 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08013124 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08013120: .4byte gDispIo
_08013124: .4byte 0x0000FFE0

	thumb_func_start sub_8013128
sub_8013128: @ 0x08013128
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _08013140 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08013144
	cmp r0, #3
	beq _08013150
	b _08013156
	.align 2, 0
_08013140: .4byte gPlaySt
_08013144:
	ldr r0, _0801314C @ =gUnk_08D8A0E0
	bl StartEvent
	b _08013156
	.align 2, 0
_0801314C: .4byte gUnk_08D8A0E0
_08013150:
	ldr r0, _0801315C @ =gUnk_08D8A114
	bl StartEvent
_08013156:
	pop {r0}
	bx r0
	.align 2, 0
_0801315C: .4byte gUnk_08D8A114

	thumb_func_start sub_8013160
sub_8013160: @ 0x08013160
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _08013178 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _0801317C
	cmp r0, #3
	beq _08013188
	b _0801318E
	.align 2, 0
_08013178: .4byte gPlaySt
_0801317C:
	ldr r0, _08013184 @ =gUnk_08D8A148
	bl StartEvent
	b _0801318E
	.align 2, 0
_08013184: .4byte gUnk_08D8A148
_08013188:
	ldr r0, _08013194 @ =gUnk_08D8A1B4
	bl StartEvent
_0801318E:
	pop {r0}
	bx r0
	.align 2, 0
_08013194: .4byte gUnk_08D8A1B4

	thumb_func_start GC_InitDemo
GC_InitDemo: @ 0x08013198
	ldr r1, _080131A4 @ =gPlaySt
	ldrb r1, [r1, #0xe]
	adds r0, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_080131A4: .4byte gPlaySt

	thumb_func_start GC_DarkenScreen
GC_DarkenScreen: @ 0x080131A8
	ldr r1, _080131B4 @ =gPlaySt
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
_080131B4: .4byte gPlaySt

	thumb_func_start StartGame
StartGame: @ 0x080131B8
	push {lr}
	ldr r0, _080131E4 @ =OnMain
	bl SetMainFunc
	ldr r0, _080131E8 @ =OnVBlank
	bl SetOnVBlank
	ldr r0, _080131EC @ =ProcScr_GameControl
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080131E4: .4byte OnMain
_080131E8: .4byte OnVBlank
_080131EC: .4byte ProcScr_GameControl

	thumb_func_start sub_80131F0
sub_80131F0: @ 0x080131F0
	push {lr}
	ldr r0, _080131FC @ =ProcScr_GameControl
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080131FC: .4byte ProcScr_GameControl

	thumb_func_start SetNextGameAction
SetNextGameAction: @ 0x08013200
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80131F0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetNextChapterId
SetNextChapterId: @ 0x08013214
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80131F0
	adds r0, #0x2a
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013228
sub_8013228: @ 0x08013228
	push {lr}
	bl sub_80131F0
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r2, [r1]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8013240
sub_8013240: @ 0x08013240
	push {r4, lr}
	ldr r4, _08013260 @ =ProcScr_GameControl
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013260: .4byte ProcScr_GameControl

	thumb_func_start sub_8013264
sub_8013264: @ 0x08013264
	push {r4, lr}
	ldr r4, _08013284 @ =ProcScr_GameControl
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #6
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013284: .4byte ProcScr_GameControl

	thumb_func_start sub_8013288
sub_8013288: @ 0x08013288
	push {r4, lr}
	ldr r4, _080132A8 @ =ProcScr_GameControl
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #0xf
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080132A8: .4byte ProcScr_GameControl

	thumb_func_start ForceEnableSounds
ForceEnableSounds: @ 0x080132AC
	ldr r0, _080132C4 @ =gPlaySt
	adds r0, #0x41
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080132C4: .4byte gPlaySt

	thumb_func_start sub_80132C8
sub_80132C8: @ 0x080132C8
	push {r4, r5, lr}
	ldr r1, _08013314 @ =gPlaySt
	adds r2, r1, #0
	adds r2, #0x42
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r5, r1, #0
	adds r5, #0x40
	movs r2, #0x61
	rsbs r2, r2, #0
	ldrb r0, [r5]
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r3, r1, #0
	adds r3, #0x41
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ands r2, r4
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013314: .4byte gPlaySt

	thumb_func_start DecodeMsg
DecodeMsg: @ 0x08013318
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0801333C @ =0x0202B5B0
	ldr r0, [r6]
	cmp r5, r0
	beq _08013348
	ldr r1, _08013340 @ =gMsgTable
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _08013344 @ =0x0202A5B0
	adds r1, r4, #0
	bl DecodeStringRam
	str r5, [r6]
	adds r0, r4, #0
	b _0801334A
	.align 2, 0
_0801333C: .4byte 0x0202B5B0
_08013340: .4byte gMsgTable
_08013344: .4byte 0x0202A5B0
_08013348:
	ldr r0, _08013350 @ =0x0202A5B0
_0801334A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08013350: .4byte 0x0202A5B0

	thumb_func_start DecodeMsgInBuffer
DecodeMsgInBuffer: @ 0x08013354
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08013370 @ =gMsgTable
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	bl DecodeStringRam
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08013370: .4byte gMsgTable

	thumb_func_start sub_8013374
sub_8013374: @ 0x08013374
	push {r4, r5, lr}
	ldr r5, _0801338C @ =0x0202A9B0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r5, r0
	ldr r0, _08013390 @ =0xFFFFFC00
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _0801346C
	.align 2, 0
_0801338C: .4byte 0x0202A9B0
_08013390: .4byte 0xFFFFFC00
_08013394:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _0801339E
	strb r1, [r4]
	b _0801343A
_0801339E:
	cmp r0, #0x80
	beq _080133A8
	strb r1, [r4]
	adds r5, #1
	b _08013434
_080133A8:
	adds r5, #1
	ldrb r0, [r5]
	subs r0, #0x12
	cmp r0, #0x10
	bhi _08013430
	lsls r0, r0, #2
	ldr r1, _080133BC @ =_080133C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080133BC: .4byte _080133C0
_080133C0: @ jump table
	.4byte _08013404 @ case 0
	.4byte _08013408 @ case 1
	.4byte _0801340C @ case 2
	.4byte _08013410 @ case 3
	.4byte _08013430 @ case 4
	.4byte _08013430 @ case 5
	.4byte _08013430 @ case 6
	.4byte _08013430 @ case 7
	.4byte _08013430 @ case 8
	.4byte _08013430 @ case 9
	.4byte _08013430 @ case 10
	.4byte _08013430 @ case 11
	.4byte _08013430 @ case 12
	.4byte _08013430 @ case 13
	.4byte _08013414 @ case 14
	.4byte _08013430 @ case 15
	.4byte _0801341A @ case 16
_08013404:
	movs r1, #0
	b _08013440
_08013408:
	movs r1, #1
	b _08013440
_0801340C:
	movs r1, #2
	b _08013440
_08013410:
	movs r1, #3
	b _08013440
_08013414:
	bl GetTacticianName
	b _08013422
_0801341A:
	ldr r0, _0801342C @ =gActionSt
	ldrh r0, [r0, #6]
	bl GetItemName
_08013422:
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	b _0801345A
	.align 2, 0
_0801342C: .4byte gActionSt
_08013430:
	movs r0, #0x80
	strb r0, [r4]
_08013434:
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_0801343A:
	adds r5, #1
	adds r4, #1
	b _0801346C
_08013440:
	ldr r0, _08013480 @ =gPlaySt
	adds r0, #0x1c
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
_0801345A:
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _0801346A
_08013462:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08013462
_0801346A:
	adds r5, r1, #0
_0801346C:
	ldrb r1, [r5]
	cmp r1, #0
	bne _08013394
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08013484 @ =0x0202ADB0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08013480: .4byte gPlaySt
_08013484: .4byte 0x0202ADB0

	thumb_func_start sub_8013488
sub_8013488: @ 0x08013488
	push {r4, r5, lr}
	ldr r5, _080134A0 @ =0x0202B3B0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _080134A4 @ =0xFFFFF200
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _080134F0
	.align 2, 0
_080134A0: .4byte 0x0202B3B0
_080134A4: .4byte 0xFFFFF200
_080134A8:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _080134B2
	strb r1, [r4]
	b _080134CC
_080134B2:
	cmp r0, #0x80
	beq _080134BC
	strb r1, [r4]
	adds r5, #1
	b _080134C6
_080134BC:
	adds r5, #1
	ldrb r1, [r5]
	cmp r1, #0x20
	beq _080134D2
	strb r0, [r4]
_080134C6:
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_080134CC:
	adds r5, #1
	adds r4, #1
	b _080134F0
_080134D2:
	bl GetTacticianName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _080134EE
_080134E6:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080134E6
_080134EE:
	adds r5, r1, #0
_080134F0:
	ldrb r1, [r5]
	cmp r1, #0
	bne _080134A8
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08013504 @ =0x0202B4B0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08013504: .4byte 0x0202B4B0
