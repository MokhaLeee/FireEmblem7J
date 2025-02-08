	.include "macro.inc"
	.syntax unified

	thumb_func_start MenuScroll_Init
MenuScroll_Init: @ 0x08090AF8
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #0x2a]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #7
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr

	thumb_func_start MenuScroll_Loop
MenuScroll_Loop: @ 0x08090B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	mov sb, r0
	adds r0, r4, #0
	adds r0, #0x34
	ldrh r2, [r4, #0x32]
	ldrb r0, [r0]
	cmp r2, r0
	bhi _08090B50
	b _08090D62
_08090B50:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r3, r4, #0
	adds r3, #0x3a
	str r3, [sp, #0x14]
	adds r5, r4, #0
	adds r5, #0x3b
	str r5, [sp, #0x18]
	ldrb r0, [r0]
	cmp r6, r0
	bge _08090B8C
_08090B6A:
	ldrh r1, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	lsls r2, r6, #3
	ldrb r0, [r0]
	adds r2, r0, r2
	mov r3, sb
	str r3, [sp]
	movs r0, #4
	ldr r3, _08090C74 @ =Sprite_MenuScrollContainer
	bl PutSpriteExt
	adds r6, #1
	mov r5, sl
	ldrb r5, [r5]
	cmp r6, r5
	blt _08090B6A
_08090B8C:
	cmp r6, #0
	bne _08090B92
	b _08090D10
_08090B92:
	mov r6, sl
	ldrb r6, [r6]
	lsls r7, r6, #0x13
	ldrh r0, [r4, #0x2e]
	str r0, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r1, #0x2c
	adds r1, r1, r4
	mov r8, r1
	cmp r5, r6
	bhi _08090BB2
	b _08090CE4
_08090BB2:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _08090BF2
	ldrh r3, [r4, #0x2a]
	ldr r5, _08090C78 @ =0x00002001
	adds r1, r3, r5
	mov r6, r8
	ldrb r2, [r6]
	subs r2, #8
	ldr r3, _08090C7C @ =Sprites_08D8C7E8
	ldr r5, [sp, #0x14]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090BF2:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bhs _08090C28
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r7, r0, #0x14
_08090C06:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, _08090C80 @ =Sprites_08D8C794
	ldr r3, [r0, #0x20]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	blo _08090C06
_08090C28:
	ldrh r1, [r4, #0x2e]
	lsrs r0, r1, #4
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrh r3, [r4, #0x32]
	cmp r0, r3
	bne _08090C84
	mov r5, sl
	ldrb r5, [r5]
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r1, r2, #0
	muls r1, r3, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq _08090CE4
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r5, r2
	adds r2, r2, r3
	ldr r3, _08090C80 @ =Sprites_08D8C794
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _08090CE4
	.align 2, 0
_08090C74: .4byte Sprite_MenuScrollContainer
_08090C78: .4byte 0x00002001
_08090C7C: .4byte Sprites_08D8C7E8
_08090C80: .4byte Sprites_08D8C794
_08090C84:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq _08090CBA
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, _08090D74 @ =Sprites_08D8C794
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090CBA:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	adds r2, #1
	ldr r3, _08090D78 @ =Sprites_08D8C7E8
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090CE4:
	ldrh r1, [r4, #0x2a]
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, _08090D7C @ =Sprite_08D8C744
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	ldr r3, _08090D80 @ =Sprite_08D8C74C
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090D10:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _08090D38
	cmp r1, r0
	bls _08090D24
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_08090D24:
	ldrh r2, [r4, #0x30]
	ldrh r3, [r4, #0x2e]
	cmp r2, r3
	bhs _08090D34
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
_08090D34:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_08090D38:
	ldr r6, [sp, #0x14]
	ldrb r0, [r6]
	adds r0, #1
	movs r1, #0
	strb r0, [r6]
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r3, [r6]
	lsrs r0, r3, #3
	cmp r0, #5
	bls _08090D54
	strb r1, [r6]
_08090D54:
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	cmp r0, #5
	bls _08090D62
	ldr r6, [sp, #0x18]
	strb r1, [r6]
_08090D62:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090D74: .4byte Sprites_08D8C794
_08090D78: .4byte Sprites_08D8C7E8
_08090D7C: .4byte Sprite_08D8C744
_08090D80: .4byte Sprite_08D8C74C

	thumb_func_start LockMenuScrollBar
LockMenuScrollBar: @ 0x08090D84
	push {lr}
	ldr r0, _08090D9C @ =ProcScr_menu_scroll
	bl Proc_Find
	cmp r0, #0
	beq _08090D96
	movs r1, #1
	bl Proc_Goto
_08090D96:
	pop {r0}
	bx r0
	.align 2, 0
_08090D9C: .4byte ProcScr_menu_scroll

	thumb_func_start sub_8090DA0
sub_8090DA0: @ 0x08090DA0
	push {lr}
	ldr r0, _08090DB8 @ =ProcScr_menu_scroll
	bl Proc_Find
	cmp r0, #0
	beq _08090DB2
	movs r1, #0
	bl Proc_Goto
_08090DB2:
	pop {r0}
	bx r0
	.align 2, 0
_08090DB8: .4byte ProcScr_menu_scroll

	thumb_func_start EndMenuScrollBar
EndMenuScrollBar: @ 0x08090DBC
	push {lr}
	ldr r0, _08090DCC @ =ProcScr_menu_scroll
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08090DCC: .4byte ProcScr_menu_scroll

	thumb_func_start StartMenuScrollBar
StartMenuScrollBar: @ 0x08090DD0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08090DE0 @ =ProcScr_menu_scroll
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_08090DE0: .4byte ProcScr_menu_scroll

	thumb_func_start PutMenuScrollBarAt
PutMenuScrollBarAt: @ 0x08090DE4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090E00 @ =ProcScr_menu_scroll
	bl Proc_Find
	cmp r0, #0
	beq _08090DFA
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
_08090DFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090E00: .4byte ProcScr_menu_scroll

	thumb_func_start UpdateMenuScrollBarConfig
UpdateMenuScrollBarConfig: @ 0x08090E04
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _08090E34 @ =ProcScr_menu_scroll
	bl Proc_Find
	cmp r0, #0
	beq _08090E2E
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
_08090E2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090E34: .4byte ProcScr_menu_scroll

	thumb_func_start InitMenuScrollBarImg
InitMenuScrollBarImg: @ 0x08090E38
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090E70 @ =Pal_MenuScrollBar
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08090E74 @ =Img_MenuScrollBar
	ldr r2, _08090E78 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08090E7C @ =ProcScr_menu_scroll
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _08090E68
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
_08090E68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090E70: .4byte Pal_MenuScrollBar
_08090E74: .4byte Img_MenuScrollBar
_08090E78: .4byte 0x06010000
_08090E7C: .4byte ProcScr_menu_scroll
