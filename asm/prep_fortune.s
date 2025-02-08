	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_8099840
sub_8099840: @ 0x08099840
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _08099870 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl StartCgText
	movs r0, #0x7c
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08099870: .4byte 0x06011000

	thumb_func_start FortuneSubMenu_Init_Null
FortuneSubMenu_Init_Null: @ 0x08099874
	bx lr
	.align 2, 0

	thumb_func_start nullsub_79
nullsub_79: @ 0x08099878
	bx lr
	.align 2, 0

	thumb_func_start FortuneSubMenu_Unused_SetAvailableOptions
FortuneSubMenu_Unused_SetAvailableOptions: @ 0x0809987C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl sub_8099CB4
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_8099CF0
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FortuneSubMenu_Unused_SetupText
FortuneSubMenu_Unused_SetupText: @ 0x080998A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r6, _08099968 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	ldr r0, _0809996C @ =gBg0Tm + 0x280
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r4, #0
_080998D0:
	adds r0, r6, #0
	bl ClearText
	ldr r1, _08099970 @ =gUnk_08D8D60C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _08099974 @ =gBg0Tm
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, sb
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809991A
	movs r2, #1
_0809991A:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r4, #1
	cmp r4, #3
	ble _080998D0
	ldr r0, _08099968 @ =0x020129A8
	adds r6, r0, #0
	adds r6, #0xe8
	adds r0, r6, #0
	bl ClearText
	ldr r0, _08099978 @ =gUnk_08D8D5F8
	ldr r0, [r0, #0x10]
	bl DecodeMsg
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099968: .4byte 0x020129A8
_0809996C: .4byte gBg0Tm + 0x280
_08099970: .4byte gUnk_08D8D60C
_08099974: .4byte gBg0Tm
_08099978: .4byte gUnk_08D8D5F8

	thumb_func_start sub_809997C
sub_809997C: @ 0x0809997C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _08099A0C @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999A0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080999A0
	subs r0, r4, #1
	strb r0, [r3]
_080999A0:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _080999BE
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080999BE
	adds r0, r1, #1
	strb r0, [r3]
_080999BE:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999D6
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _080999D6
	adds r0, r1, #2
	strb r0, [r3]
_080999D6:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999EE
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _080999EE
	subs r0, r1, #2
	strb r0, [r3]
_080999EE:
	ldrb r3, [r3]
	cmp r4, r3
	beq _08099A18
	ldr r0, _08099A10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099A06
	ldr r0, _08099A14 @ =0x00000385
	bl m4aSongNumStart
_08099A06:
	movs r0, #1
	b _08099A1A
	.align 2, 0
_08099A0C: .4byte gpKeySt
_08099A10: .4byte gPlaySt
_08099A14: .4byte 0x00000385
_08099A18:
	movs r0, #0
_08099A1A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8099A20
sub_8099A20: @ 0x08099A20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08099A54 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08099AB4
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08099A98
	cmp r1, #1
	beq _08099A74
	cmp r1, #1
	bgt _08099A58
	cmp r1, #0
	beq _08099A62
	b _08099A98
	.align 2, 0
_08099A54: .4byte gpKeySt
_08099A58:
	cmp r1, #2
	beq _08099A68
	cmp r1, #3
	beq _08099A6E
	b _08099A98
_08099A62:
	adds r0, r4, #0
	movs r1, #2
	b _08099A78
_08099A68:
	adds r0, r4, #0
	movs r1, #3
	b _08099A78
_08099A6E:
	adds r0, r4, #0
	movs r1, #4
	b _08099A78
_08099A74:
	adds r0, r4, #0
	movs r1, #5
_08099A78:
	bl Proc_Goto
	ldr r0, _08099A90 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	ldr r0, _08099A94 @ =0x0000038A
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099A90: .4byte gPlaySt
_08099A94: .4byte 0x0000038A
_08099A98:
	ldr r0, _08099AB0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099AB0: .4byte gPlaySt
_08099AB4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099AE0
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099AD8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	ldr r0, _08099ADC @ =0x0000038B
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099AD8: .4byte gPlaySt
_08099ADC: .4byte 0x0000038B
_08099AE0:
	adds r0, r4, #0
	bl sub_809997C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099B20
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r2, r6, #0
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x1c
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x50
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #8
	bl ShowSysHandCursor
	ldr r1, _08099B28 @ =gUnk_08D8D620
	ldrb r5, [r5]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8099840
_08099B20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099B28: .4byte gUnk_08D8D620

	thumb_func_start sub_8099B2C
sub_8099B2C: @ 0x08099B2C
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

	thumb_func_start sub_8099B50
sub_8099B50: @ 0x08099B50
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	beq _08099B88
	cmp r1, #1
	bgt _08099B66
	cmp r1, #0
	beq _08099B70
	b _08099B8E
_08099B66:
	cmp r1, #2
	beq _08099B78
	cmp r1, #3
	beq _08099B80
	b _08099B8E
_08099B70:
	movs r1, #2
	bl Proc_Goto
	b _08099B8E
_08099B78:
	movs r1, #3
	bl Proc_Goto
	b _08099B8E
_08099B80:
	movs r1, #4
	bl Proc_Goto
	b _08099B8E
_08099B88:
	movs r1, #5
	bl Proc_Goto
_08099B8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartFortuneSubMenu
StartFortuneSubMenu: @ 0x08099B94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099BAC @ =ProcScr_FortuneSubMenu
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099BAC: .4byte ProcScr_FortuneSubMenu

	thumb_func_start sub_8099BB0
sub_8099BB0: @ 0x08099BB0
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _08099BDC
	cmp r1, #1
	bgt _08099BC2
	cmp r1, #0
	beq _08099BE8
	b _08099BF0
_08099BC2:
	cmp r1, #2
	beq _08099BCC
	cmp r1, #3
	beq _08099BD2
	b _08099BF0
_08099BCC:
	bl sub_8099CB4
	b _08099BD6
_08099BD2:
	bl sub_8099CF0
_08099BD6:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08099BF2
_08099BDC:
	ldr r0, _08099BEC @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08099BF0
_08099BE8:
	movs r0, #1
	b _08099BF2
	.align 2, 0
_08099BEC: .4byte gPlaySt
_08099BF0:
	movs r0, #0
_08099BF2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetChapterDivinationTextIdHectorStory
GetChapterDivinationTextIdHectorStory: @ 0x08099BF8
	push {lr}
	ldr r0, _08099C10 @ =gPlaySt
	ldrb r1, [r0, #0x1b]
	cmp r1, #3
	bne _08099C14
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x78
	b _08099C20
	.align 2, 0
_08099C10: .4byte gPlaySt
_08099C14:
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7a
_08099C20:
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetChapterDivinationTextIdBeginning
GetChapterDivinationTextIdBeginning: @ 0x08099C28
	push {lr}
	ldr r0, _08099C40 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x76
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C40: .4byte gPlaySt

	thumb_func_start sub_8099C44
sub_8099C44: @ 0x08099C44
	push {lr}
	ldr r0, _08099C5C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7c
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C5C: .4byte gPlaySt

	thumb_func_start sub_8099C60
sub_8099C60: @ 0x08099C60
	push {lr}
	ldr r0, _08099C78 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7f
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C78: .4byte gPlaySt

	thumb_func_start GetChapterDivinationPortrait
GetChapterDivinationPortrait: @ 0x08099C7C
	push {lr}
	ldr r0, _08099C94 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C94: .4byte gPlaySt

	thumb_func_start sub_8099C98
sub_8099C98: @ 0x08099C98
	push {lr}
	bl GetChapterDivinationTextIdHectorStory
	cmp r0, #0
	beq _08099CAE
	bl GetChapterDivinationTextIdBeginning
	cmp r0, #0
	bne _08099CAE
	movs r0, #1
	b _08099CB0
_08099CAE:
	movs r0, #0
_08099CB0:
	pop {r1}
	bx r1

	thumb_func_start sub_8099CB4
sub_8099CB4: @ 0x08099CB4
	push {lr}
	ldr r1, _08099CD0 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08099CCA
	bl GetChapterDivinationTextIdHectorStory
	cmp r0, #0
	bne _08099CD4
_08099CCA:
	movs r0, #0
	b _08099CD6
	.align 2, 0
_08099CD0: .4byte gPlaySt
_08099CD4:
	movs r0, #1
_08099CD6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099CDC
sub_8099CDC: @ 0x08099CDC
	push {lr}
	bl GetChapterDivinationPortrait
	cmp r0, #0x41
	beq _08099CEA
	movs r0, #0
	b _08099CEC
_08099CEA:
	movs r0, #1
_08099CEC:
	pop {r1}
	bx r1

	thumb_func_start sub_8099CF0
sub_8099CF0: @ 0x08099CF0
	push {lr}
	bl sub_8099CDC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099D00
sub_8099D00: @ 0x08099D00
	ldr r0, _08099D10 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x12
	bgt _08099D14
	movs r0, #0
	b _08099D16
	.align 2, 0
_08099D10: .4byte gPlaySt
_08099D14:
	movs r0, #1
_08099D16:
	bx lr
