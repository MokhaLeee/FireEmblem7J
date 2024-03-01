	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_801B5C4
sub_801B5C4: @ 0x0801B5C4
	push {r4, lr}
	sub sp, #8
	bl GetGameTime
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl FormatTime
	movs r0, #1
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #3
	cmp r0, #0
	bne _0801B5E8
	movs r1, #2
_0801B5E8:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801B5F4
sub_801B5F4: @ 0x0801B5F4
	push {r4, lr}
	sub sp, #8
	bl GetGameTime
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl FormatTime
	movs r0, #1
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #3
	cmp r0, #0
	beq _0801B618
	movs r1, #2
_0801B618:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801B624
sub_801B624: @ 0x0801B624
	movs r0, #8
	bx lr

	thumb_func_start sub_801B628
sub_801B628: @ 0x0801B628
	movs r0, #0x17
	bx lr

	thumb_func_start nullsub_38
nullsub_38: @ 0x0801B62C
	bx lr
	.align 2, 0

	thumb_func_start sub_801B630
sub_801B630: @ 0x0801B630
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801B64C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #4
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801B648
	adds r0, r2, #0
	bl Proc_Break
_0801B648:
	pop {r0}
	bx r0
	.align 2, 0
_0801B64C: .4byte gpKeySt

	thumb_func_start sub_801B650
sub_801B650: @ 0x0801B650
	push {lr}
	movs r0, #0x10
	bl NewKeyStSetter
	pop {r0}
	bx r0

	thumb_func_start nullsub_39
nullsub_39: @ 0x0801B65C
	bx lr
	.align 2, 0

	thumb_func_start sub_801B660
sub_801B660: @ 0x0801B660
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	ldr r1, [r0, #0x2c]
	mov r8, r1
	ldr r4, [r0, #0x30]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r5, [r1]
	ldr r6, [r0, #0x54]
	add r0, sp, #4
	adds r1, r5, #0
	bl InitText
	add r0, sp, #4
	adds r1, r6, #0
	bl Text_DrawString
	adds r5, #2
	movs r0, #0
	str r0, [sp]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl sub_804A4CC
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _0801B6C0 @ =gBg0Tm
	adds r4, r4, r0
	add r0, sp, #4
	adds r1, r4, #0
	bl PutText
	movs r0, #3
	bl EnableBgSync
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B6C0: .4byte gBg0Tm

	thumb_func_start sub_801B6C4
sub_801B6C4: @ 0x0801B6C4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, _0801B6F0 @ =gUnk_08C02600
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	str r4, [r0, #0x54]
	adds r0, #0x52
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B6F0: .4byte gUnk_08C02600

	thumb_func_start sub_801B6F4
sub_801B6F4: @ 0x0801B6F4
	push {lr}
	bl sub_804AC0C
	bl ClearBg0Bg1
	ldr r0, _0801B714 @ =gUnk_08C04B94
	bl StartMenu
	movs r0, #2
	movs r1, #0
	bl DebugInitBg
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0801B714: .4byte gUnk_08C04B94

	thumb_func_start sub_801B718
sub_801B718: @ 0x0801B718
	push {r4, r5, lr}
	adds r2, r1, #0
	ldr r3, _0801B798 @ =gpKeySt
	ldr r1, [r3]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B734
	adds r1, r2, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B734:
	ldr r1, [r3]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r2, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801B74A
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801B74A:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x44
	ble _0801B758
	movs r0, #0x44
	strb r0, [r1]
_0801B758:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801B764
	movs r0, #0
	strb r0, [r1]
_0801B764:
	ldr r1, [r3]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B790
	ldr r4, _0801B79C @ =gBg0Tm + 0xce
	ldr r1, _0801B7A0 @ =gUnk_081C9238
	adds r0, r4, #0
	bl sub_8004E4C
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8004E4C
	movs r0, #1
	bl EnableBgSync
_0801B790:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B798: .4byte gpKeySt
_0801B79C: .4byte gBg0Tm + 0xce
_0801B7A0: .4byte gUnk_081C9238

	thumb_func_start sub_801B7A4
sub_801B7A4: @ 0x0801B7A4
	push {r4, lr}
	adds r4, r1, #0
	bl EndMapMain
	ldr r1, _0801B7C4 @ =gPlaySt
	adds r4, #0x3c
	ldrb r0, [r4]
	strb r0, [r1, #0xe]
	bl CleanupUnitsBeforeChapter
	bl sub_8013240
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B7C4: .4byte gPlaySt

	thumb_func_start sub_801B7C8
sub_801B7C8: @ 0x0801B7C8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl sub_80ABC60
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x3c
	movs r0, #0
	strb r0, [r6]
	bl GetCurrentBgmSong
	movs r1, #0
	cmp r1, r4
	bge _0801B7FC
	cmp r0, #0
	bne _0801B7EC
	strb r1, [r6]
	b _0801B7FC
_0801B7EC:
	adds r1, #1
	cmp r1, r4
	bge _0801B7FC
	cmp r0, r1
	bne _0801B7EC
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
_0801B7FC:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0801B844 @ =gUnk_08DAE514
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B848 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B844: .4byte gUnk_08DAE514
_0801B848: .4byte gBg0Tm

	thumb_func_start sub_801B84C
sub_801B84C: @ 0x0801B84C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _0801B8F0 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B868
	adds r1, r6, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B868:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801B87E
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801B87E:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801B88C
	movs r0, #0
	strb r0, [r1]
_0801B88C:
	ldr r7, _0801B8F4 @ =gUnk_08DAE514
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bge _0801B8A2
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0801B8A2:
	ldr r1, [r2]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B8E8
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B8F8 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_0801B8E8:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B8F0: .4byte gpKeySt
_0801B8F4: .4byte gUnk_08DAE514
_0801B8F8: .4byte gBg0Tm

	thumb_func_start sub_801B8FC
sub_801B8FC: @ 0x0801B8FC
	push {lr}
	ldr r2, _0801B928 @ =gUnk_08DAE514
	ldr r0, _0801B92C @ =gUnk_08DAEB64
	cmp r2, r0
	bne _0801B934
	ldr r0, _0801B930 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801B94C
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStart
	b _0801B94C
	.align 2, 0
_0801B928: .4byte gUnk_08DAE514
_0801B92C: .4byte gUnk_08DAEB64
_0801B930: .4byte gPlaySt
_0801B934:
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	movs r2, #0
	bl sub_8003788
_0801B94C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801B954
sub_801B954: @ 0x0801B954
	push {lr}
	bl sub_804AC0C
	movs r0, #0
	bl EndFaceById
	bl ClearBg0Bg1
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801B96C
sub_801B96C: @ 0x0801B96C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r1, #0
	ldr r0, _0801B9D4 @ =gUnk_081C9254
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0801B9D8 @ =gUnk_08C025F8
	bl Proc_Find
	adds r4, r0, #0
	adds r5, r6, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl ClearText
	ldr r3, _0801B9DC @ =gUnk_081C925C
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r3, [r0]
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B9E0 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B9D4: .4byte gUnk_081C9254
_0801B9D8: .4byte gUnk_08C025F8
_0801B9DC: .4byte gUnk_081C925C
_0801B9E0: .4byte gBg0Tm

	thumb_func_start sub_801B9E4
sub_801B9E4: @ 0x0801B9E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801BA28 @ =gUnk_08C025F8
	bl Proc_Find
	adds r2, r0, #0
	ldr r0, _0801BA2C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801BA1E
	adds r0, r2, #0
	adds r0, #0x66
	movs r1, #1
	ldrh r2, [r0]
	eors r1, r2
	strh r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_801B96C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl sub_800515C
_0801BA1E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BA28: .4byte gUnk_08C025F8
_0801BA2C: .4byte gpKeySt

	thumb_func_start sub_801BA30
sub_801BA30: @ 0x0801BA30
	movs r0, #0
	bx lr

	thumb_func_start sub_801BA34
sub_801BA34: @ 0x0801BA34
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801BAA4 @ =gUnk_081C9294
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0801BAA8 @ =gUnk_08C025F8
	bl Proc_Find
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r3, _0801BAAC @ =gUnk_081C92B0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, [r6, #0x58]
	movs r1, #7
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BAB0 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BAA4: .4byte gUnk_081C9294
_0801BAA8: .4byte gUnk_08C025F8
_0801BAAC: .4byte gUnk_081C92B0
_0801BAB0: .4byte gBg0Tm

	thumb_func_start sub_801BAB4
sub_801BAB4: @ 0x0801BAB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0801BAF4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801BB52
	ldr r0, _0801BAF8 @ =gUnk_08C025F8
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_801BA34
	ldr r0, [r4, #0x58]
	movs r1, #7
	bl __modsi3
	cmp r0, #6
	bhi _0801BB52
	lsls r0, r0, #2
	ldr r1, _0801BAFC @ =_0801BB00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801BAF4: .4byte gpKeySt
_0801BAF8: .4byte gUnk_08C025F8
_0801BAFC: .4byte _0801BB00
_0801BB00: @ jump table
	.4byte _0801BB1C @ case 0
	.4byte _0801BB24 @ case 1
	.4byte _0801BB2C @ case 2
	.4byte _0801BB34 @ case 3
	.4byte _0801BB3C @ case 4
	.4byte _0801BB44 @ case 5
	.4byte _0801BB4C @ case 6
_0801BB1C:
	movs r0, #0
	bl sub_802E368
	b _0801BB52
_0801BB24:
	movs r0, #6
	bl sub_802E368
	b _0801BB52
_0801BB2C:
	movs r0, #1
	bl sub_802E368
	b _0801BB52
_0801BB34:
	movs r0, #2
	bl sub_802E368
	b _0801BB52
_0801BB3C:
	movs r0, #4
	bl sub_802E368
	b _0801BB52
_0801BB44:
	movs r0, #3
	bl sub_802E368
	b _0801BB52
_0801BB4C:
	movs r0, #5
	bl sub_802E368
_0801BB52:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801BB5C
sub_801BB5C: @ 0x0801BB5C
	movs r0, #0
	bx lr

	thumb_func_start sub_801BB60
sub_801BB60: @ 0x0801BB60
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r3, _0801BBB8 @ =gUnk_081C92B8
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _0801BBBC @ =gUnk_081C92C0
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertDrawString
	bl sub_80A0D74
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BBC0 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BBB8: .4byte gUnk_081C92B8
_0801BBBC: .4byte gUnk_081C92C0
_0801BBC0: .4byte gBg0Tm

	thumb_func_start sub_801BBC4
sub_801BBC4: @ 0x0801BBC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r4, _0801BC40 @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801BC5C
	bl sub_80A0D74
	adds r5, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801BBF2
	cmp r5, #0
	blt _0801BBF2
	subs r5, #1
_0801BBF2:
	ldr r0, _0801BC40 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801BC06
	cmp r5, #0xb
	bgt _0801BC06
	adds r5, #1
_0801BC06:
	mov r0, sp
	bl ReadGlobalSaveInfo
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
_0801BC14:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0801BC14
	movs r4, #0
	cmp r4, r5
	bge _0801BC30
_0801BC22:
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl sub_80A0D94
	cmp r4, r5
	blt _0801BC22
_0801BC30:
	cmp r5, #0
	bne _0801BC44
	mov r1, sp
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1, #0xe]
	ands r0, r2
	b _0801BC4C
	.align 2, 0
_0801BC40: .4byte gpKeySt
_0801BC44:
	mov r1, sp
	movs r0, #1
	ldrb r2, [r1, #0xe]
	orrs r0, r2
_0801BC4C:
	strb r0, [r1, #0xe]
	mov r0, sp
	bl WriteGlobalSaveInfo
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_801BB60
_0801BC5C:
	movs r0, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801BC68
sub_801BC68: @ 0x0801BC68
	movs r0, #0x17
	bx lr

	thumb_func_start sub_801BC6C
sub_801BC6C: @ 0x0801BC6C
	push {lr}
	bl ClearBg0Bg1
	ldr r0, _0801BC80 @ =gUnk_08C04B04
	bl StartMenu
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_0801BC80: .4byte gUnk_08C04B04

	thumb_func_start sub_801BC84
sub_801BC84: @ 0x0801BC84
	push {lr}
	bl WriteCompletedPlaythroughSaveData
	ldr r0, _0801BCAC @ =gPlaySt
	movs r1, #0xef
	ldrb r2, [r0, #0x14]
	ands r1, r2
	strb r1, [r0, #0x14]
	bl CleanupUnitsBeforeChapter
	bl ReadLastGameSaveId
	bl WriteGameSave
	movs r0, #0xff
	bl SoftReset
	pop {r1}
	bx r1
	.align 2, 0
_0801BCAC: .4byte gPlaySt

	thumb_func_start sub_801BCB0
sub_801BCB0: @ 0x0801BCB0
	push {r4, lr}
	ldr r4, _0801BCD0 @ =gBg0Tm + 0xce
	movs r0, #0
	bl GetROMChapterStruct
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8004E4C
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BCD0: .4byte gBg0Tm + 0xce

	thumb_func_start sub_801BCD4
sub_801BCD4: @ 0x0801BCD4
	push {r4, lr}
	ldr r0, _0801BD24 @ =OnMain
	bl SetMainFunc
	ldr r0, _0801BD28 @ =OnVBlank
	bl SetOnVBlank
	bl sub_802E834
	movs r0, #2
	movs r1, #0
	bl DebugInitBg
	ldr r0, _0801BD2C @ =gUnk_081C92C8
	bl sub_8009E84
	ldr r0, _0801BD30 @ =gUnk_08C04B4C
	bl StartMenu
	ldr r4, _0801BD34 @ =gBmSt
	movs r1, #0x40
	ldrb r2, [r4, #4]
	orrs r1, r2
	strb r1, [r4, #4]
	ldr r1, _0801BD38 @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	bl StartMuralBackgroundAlt
	movs r0, #0xbf
	ldrb r1, [r4, #4]
	ands r0, r1
	strb r0, [r4, #4]
	ldr r0, _0801BD3C @ =gBg2Tm + 0x40
	bl PutBuildInfo
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BD24: .4byte OnMain
_0801BD28: .4byte OnVBlank
_0801BD2C: .4byte gUnk_081C92C8
_0801BD30: .4byte gUnk_08C04B4C
_0801BD34: .4byte gBmSt
_0801BD38: .4byte 0x0600B000
_0801BD3C: .4byte gBg2Tm + 0x40

	thumb_func_start sub_801BD40
sub_801BD40: @ 0x0801BD40
	push {lr}
	sub sp, #0x14
	ldr r0, [r0, #0x44]
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl EnableBgSync
	add r0, sp, #4
	movs r1, #3
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801BD70
	ldr r0, [sp, #0x10]
	lsrs r1, r0, #0x10
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0801BD90
_0801BD70:
	ldr r0, _0801BD8C @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0xb7
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb6
	b _0801BDAA
	.align 2, 0
_0801BD8C: .4byte 0x00000103
_0801BD90:
	ldr r0, _0801BDBC @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0xb4
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb2
_0801BDAA:
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	movs r0, #0
	add sp, #0x14
	pop {r1}
	bx r1
	.align 2, 0
_0801BDBC: .4byte 0x00000103

	thumb_func_start sub_801BDC0
sub_801BDC0: @ 0x0801BDC0
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	ldr r2, _0801BDFC @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _0801BE00 @ =gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	pop {r1}
	bx r1
	.align 2, 0
_0801BDFC: .4byte gDispIo
_0801BE00: .4byte gPal

	thumb_func_start sub_801BE04
sub_801BE04: @ 0x0801BE04
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, #2
	mov ip, r1
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r0, #0
	adds r7, #0xa
	ldr r1, _0801BE48 @ =gpKeySt
	ldr r3, [r1]
	movs r5, #0x10
	adds r0, r5, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _0801BE5A
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x43
	bgt _0801BE4C
	adds r0, r2, #1
	b _0801BE58
	.align 2, 0
_0801BE48: .4byte gpKeySt
_0801BE4C:
	adds r0, r5, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _0801BE5A
	movs r0, #0
_0801BE58:
	strb r0, [r1]
_0801BE5A:
	ldr r2, [r6]
	movs r3, #0x20
	adds r0, r3, #0
	ldrh r1, [r2, #6]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801BE88
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _0801BE7A
	subs r0, r1, #1
	b _0801BE86
_0801BE7A:
	adds r0, r3, #0
	ldrh r2, [r2, #8]
	ands r0, r2
	cmp r0, #0
	beq _0801BE88
	movs r0, #0x44
_0801BE86:
	strb r0, [r5]
_0801BE88:
	ldr r1, [r6]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801BEBC
	lsls r4, r7, #5
	add r4, ip
	lsls r4, r4, #1
	ldr r0, _0801BEE0 @ =gBg0Tm
	adds r4, r4, r0
	ldr r1, _0801BEE4 @ =gUnk_081C9238
	adds r0, r4, #0
	bl sub_8004E4C
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8004E4C
	movs r0, #1
	bl EnableBgSync
_0801BEBC:
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801BEF0
	ldr r1, _0801BEE8 @ =gPlaySt
	movs r0, #3
	strb r0, [r1, #0x1b]
	ldr r0, _0801BEEC @ =Pal_MuralBackground
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0801BF02
	.align 2, 0
_0801BEE0: .4byte gBg0Tm
_0801BEE4: .4byte gUnk_081C9238
_0801BEE8: .4byte gPlaySt
_0801BEEC: .4byte Pal_MuralBackground
_0801BEF0:
	ldr r1, _0801BF1C @ =gPlaySt
	movs r0, #2
	strb r0, [r1, #0x1b]
	ldr r0, _0801BF20 @ =Pal_LinkArenaMuralBackground
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
_0801BF02:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	bgt _0801BF10
	ldr r1, _0801BF1C @ =gPlaySt
	movs r0, #1
	strb r0, [r1, #0x1b]
_0801BF10:
	bl EnablePalSync
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BF1C: .4byte gPlaySt
_0801BF20: .4byte Pal_LinkArenaMuralBackground

	thumb_func_start sub_801BF24
sub_801BF24: @ 0x0801BF24
	push {r4, lr}
	adds r4, r1, #0
	bl GetGameTime
	bl RandInit
	bl InitUnits
	ldr r0, _0801BF50 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801BF54
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl WriteNewGameSave
	b _0801BF5E
	.align 2, 0
_0801BF50: .4byte gpKeySt
_0801BF54:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl WriteNewGameSave
_0801BF5E:
	ldr r0, _0801BF88 @ =0x00000569
	bl DecodeMsg
	bl sub_802EBB8
	ldr r1, _0801BF8C @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	movs r0, #0
	bl WriteGameSave
	bl CleanupUnitsBeforeChapter
	bl sub_8013240
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BF88: .4byte 0x00000569
_0801BF8C: .4byte gPlaySt

	thumb_func_start sub_801BF90
sub_801BF90: @ 0x0801BF90
	push {lr}
	ldr r0, _0801BFA0 @ =gUnk_08C04B70
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BFA0: .4byte gUnk_08C04B70

	thumb_func_start sub_801BFA4
sub_801BFA4: @ 0x0801BFA4
	push {lr}
	ldr r0, _0801BFB4 @ =gUnk_08C04B28
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BFB4: .4byte gUnk_08C04B28

	thumb_func_start sub_801BFB8
sub_801BFB8: @ 0x0801BFB8
	push {lr}
	movs r0, #3
	bl sub_80A5AF8
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801BFC8
sub_801BFC8: @ 0x0801BFC8
	movs r0, #2
	bx lr

	thumb_func_start sub_801BFCC
sub_801BFCC: @ 0x0801BFCC
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _0801BFE0
	movs r0, #4
	bl WriteSuspendSave
	movs r0, #0x17
	b _0801BFE2
_0801BFE0:
	movs r0, #8
_0801BFE2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801BFE8
sub_801BFE8: @ 0x0801BFE8
	push {lr}
	movs r0, #4
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801BFFA
	movs r1, #1
_0801BFFA:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_801C000
sub_801C000: @ 0x0801C000
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	beq _0801C00E
	movs r0, #8
	b _0801C028
_0801C00E:
	ldr r0, _0801C02C @ =ProcScr_BmMain
	bl Proc_Find
	cmp r0, #0
	beq _0801C01C
	bl EndMapMain
_0801C01C:
	movs r0, #4
	bl ReadSuspendSave
	bl sub_8013264
	movs r0, #0x17
_0801C028:
	pop {r1}
	bx r1
	.align 2, 0
_0801C02C: .4byte ProcScr_BmMain

	thumb_func_start sub_801C030
sub_801C030: @ 0x0801C030
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	beq _0801C03E
	movs r0, #8
	b _0801C052
_0801C03E:
	ldr r0, _0801C058 @ =ProcScr_BmMain
	bl Proc_Find
	cmp r0, #0
	beq _0801C04C
	bl EndMapMain
_0801C04C:
	bl sub_8013288
	movs r0, #0x17
_0801C052:
	pop {r1}
	bx r1
	.align 2, 0
_0801C058: .4byte ProcScr_BmMain

	thumb_func_start sub_801C05C
sub_801C05C: @ 0x0801C05C
	push {lr}
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801C06E
	movs r1, #1
_0801C06E:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_801C074
sub_801C074: @ 0x0801C074
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _0801C08C
	movs r0, #3
	bl ReadSuspendSave
	bl sub_8013264
	movs r0, #0x17
	b _0801C08E
_0801C08C:
	movs r0, #8
_0801C08E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801C094
sub_801C094: @ 0x0801C094
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r0, _0801C0F8 @ =gUnk_081C92DC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r3, _0801C0FC @ =gUnk_081C92E4
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _0801C100 @ =gPlaySt
	ldrb r2, [r1, #0xd]
	rsbs r0, r2, #0
	orrs r0, r2
	asrs r0, r0, #0x1f
	movs r1, #4
	ands r0, r1
	add r0, sp
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801C104 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801C0F8: .4byte gUnk_081C92DC
_0801C0FC: .4byte gUnk_081C92E4
_0801C100: .4byte gPlaySt
_0801C104: .4byte gBg0Tm

	thumb_func_start sub_801C108
sub_801C108: @ 0x0801C108
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_801DA38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C156
	ldr r0, _0801C140 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C156
	ldr r1, _0801C144 @ =gPlaySt
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _0801C148
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	bl sub_801DEFC
	b _0801C14E
	.align 2, 0
_0801C140: .4byte gpKeySt
_0801C144: .4byte gPlaySt
_0801C148:
	movs r0, #0
	bl sub_801DEFC
_0801C14E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_801C094
_0801C156:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801C160
sub_801C160: @ 0x0801C160
	movs r0, #0
	bx lr

	thumb_func_start sub_801C164
sub_801C164: @ 0x0801C164
	push {lr}
	bl StartGame
	movs r0, #7
	pop {r1}
	bx r1

	thumb_func_start sub_801C170
sub_801C170: @ 0x0801C170
	push {lr}
	movs r0, #0xc0
	lsls r0, r0, #2
	bl sub_8002C24
	movs r0, #0x17
	pop {r1}
	bx r1

	thumb_func_start sub_801C180
sub_801C180: @ 0x0801C180
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801C1A8 @ =gUnk_081C9304
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801C1B0
	ldr r0, _0801C1AC @ =gPlaySt
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801C1B8
	.align 2, 0
_0801C1A8: .4byte gUnk_081C9304
_0801C1AC: .4byte gPlaySt
_0801C1B0:
	ldr r0, _0801C214 @ =gPlaySt
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801C1B8:
	lsrs r6, r0, #0x1e
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _0801C218 @ =gUnk_081C9318
	cmp r0, #0
	beq _0801C1D6
	ldr r3, _0801C21C @ =gUnk_081C9310
_0801C1D6:
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	lsls r0, r6, #2
	add r0, sp
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801C220 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801C214: .4byte gPlaySt
_0801C218: .4byte gUnk_081C9318
_0801C21C: .4byte gUnk_081C9310
_0801C220: .4byte gBg0Tm

	thumb_func_start sub_801C224
sub_801C224: @ 0x0801C224
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r2, _0801C254 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C2CC
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _0801C25C
	ldr r1, _0801C258 @ =gPlaySt
	adds r0, r1, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801C266
	.align 2, 0
_0801C254: .4byte gpKeySt
_0801C258: .4byte gPlaySt
_0801C25C:
	ldr r1, _0801C2AC @ =gPlaySt
	adds r0, r1, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801C266:
	lsrs r3, r0, #0x1e
	ldr r0, [r2]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801C276
	subs r3, #1
_0801C276:
	movs r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0801C280
	adds r3, #1
_0801C280:
	cmp r3, #2
	ble _0801C286
	movs r3, #2
_0801C286:
	cmp r3, #0
	bge _0801C28C
	movs r3, #0
_0801C28C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0801C2B0
	adds r2, r1, #0
	adds r2, #0x43
	movs r0, #3
	ands r3, r0
	lsls r1, r3, #1
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0801C2C4
	.align 2, 0
_0801C2AC: .4byte gPlaySt
_0801C2B0:
	adds r2, r1, #0
	adds r2, #0x42
	movs r0, #3
	ands r3, r0
	lsls r1, r3, #7
	ldr r0, _0801C2D4 @ =0xFFFFFE7F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_0801C2C4:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_801C180
_0801C2CC:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801C2D4: .4byte 0xFFFFFE7F

	thumb_func_start sub_801C2D8
sub_801C2D8: @ 0x0801C2D8
	push {lr}
	bl sub_8013240
	ldr r0, _0801C2F0 @ =ProcScr_GameControl
	bl Proc_Find
	movs r1, #0xf
	bl Proc_Goto
	pop {r1}
	bx r1
	.align 2, 0
_0801C2F0: .4byte ProcScr_GameControl

	thumb_func_start sub_801C2F4
sub_801C2F4: @ 0x0801C2F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801C3E8 @ =gUnk_081C9334
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r3, _0801C3EC @ =gBg0Tm
	mov r8, r3
	add r0, r8
	movs r1, #8
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _0801C3F0 @ =gPlaySt
	adds r7, r6, #0
	adds r7, #0x2b
	movs r0, #1
	ldrb r4, [r7]
	ands r0, r4
	cmp r0, #0
	beq _0801C3F8
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldrb r1, [r7]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	lsls r0, r0, #2
	add r0, sp
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #0
	bl Text_InsertDrawString
	ldrb r2, [r7]
	lsrs r3, r2, #4
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #0
	bl Text_InsertDrawNumberOrBlank
	ldrh r0, [r6, #0x2c]
	lsls r3, r0, #0x13
	lsrs r3, r3, #0x17
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldrh r6, [r6, #0x2c]
	lsls r0, r6, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0xa
	ble _0801C396
	movs r3, #0xa
_0801C396:
	adds r0, r4, #0
	movs r1, #0x58
	movs r2, #3
	bl Text_InsertDrawNumberOrBlank
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	lsls r1, r1, #5
	movs r3, #0x2a
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, r8
	adds r0, r4, #0
	bl PutText
	movs r4, #0x2c
	ldrsh r0, [r5, r4]
	lsls r0, r0, #5
	adds r0, #1
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	ldr r3, _0801C3F4 @ =Unk_081C8FCC
	ldrb r2, [r7]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	lsrs r2, r2, #4
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _0801C424
	.align 2, 0
_0801C3E8: .4byte gUnk_081C9334
_0801C3EC: .4byte gBg0Tm
_0801C3F0: .4byte gPlaySt
_0801C3F4: .4byte Unk_081C8FCC
_0801C3F8:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r3, _0801C438 @ =gUnk_081C9344
	adds r0, r4, #0
	movs r1, #8
	movs r2, #1
	bl Text_InsertDrawString
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, r8
	adds r0, r4, #0
	bl PutText
_0801C424:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C438: .4byte gUnk_081C9344

	thumb_func_start sub_801C43C
sub_801C43C: @ 0x0801C43C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0801C508 @ =gpKeySt
	ldr r0, [r1]
	ldrh r2, [r0, #6]
	movs r0, #0xcd
	lsls r0, r0, #2
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0801C54A
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801C480
	ldr r3, _0801C50C @ =gPlaySt
	ldrh r2, [r3, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	cmp r0, #0
	ble _0801C480
	subs r1, r0, #1
	cmp r1, #0xff
	ble _0801C470
	movs r1, #0xff
_0801C470:
	ldr r7, _0801C510 @ =0x000001FF
	adds r0, r7, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _0801C514 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x2c]
_0801C480:
	ldr r1, [r4]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801C4AC
	ldr r3, _0801C50C @ =gPlaySt
	ldrh r2, [r3, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	adds r1, r0, #1
	cmp r1, #0xff
	ble _0801C49C
	movs r1, #0xff
_0801C49C:
	ldr r7, _0801C510 @ =0x000001FF
	adds r0, r7, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _0801C514 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x2c]
_0801C4AC:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801C4C8
	ldr r1, _0801C50C @ =gPlaySt
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0801C4C8:
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r0, #0
	beq _0801C4E2
	ldr r1, _0801C50C @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
	strb r0, [r1]
_0801C4E2:
	movs r0, #4
	ldrh r2, [r2, #6]
	ands r0, r2
	cmp r0, #0
	beq _0801C542
	ldr r0, _0801C50C @ =gPlaySt
	adds r4, r0, #0
	adds r4, #0x2b
	ldrb r2, [r4]
	lsrs r1, r2, #4
	cmp r1, #0xa
	bgt _0801C518
	adds r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	b _0801C540
	.align 2, 0
_0801C508: .4byte gpKeySt
_0801C50C: .4byte gPlaySt
_0801C510: .4byte 0x000001FF
_0801C514: .4byte 0xFFFFE00F
_0801C518:
	movs r3, #0xf
	ands r3, r2
	strb r3, [r4]
	lsls r1, r3, #0x1c
	lsrs r0, r1, #0x1d
	cmp r0, #2
	bhi _0801C53A
	adds r0, #1
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r4]
	b _0801C542
_0801C53A:
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r3
_0801C540:
	strb r0, [r4]
_0801C542:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_801C2F4
_0801C54A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801C554
sub_801C554: @ 0x0801C554
	movs r0, #0x17
	bx lr

	thumb_func_start sub_801C558
sub_801C558: @ 0x0801C558
	push {lr}
	ldr r0, _0801C568 @ =gUnk_08C02618
	movs r1, #3
	bl Proc_Start
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801C568: .4byte gUnk_08C02618
