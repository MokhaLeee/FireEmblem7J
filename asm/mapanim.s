	.include "macro.inc"
	.syntax unified

	thumb_func_start Manim_StoleItemPopup
Manim_StoleItemPopup: @ 0x0806EAE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EB00 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EB04
	b _0806EB06
	.align 2, 0
_0806EB00: .4byte gManimSt
_0806EB04:
	b _0806EB08
_0806EB06:
	b _0806EB1A
_0806EB08:
	ldr r0, _0806EB24 @ =gManimSt
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl StartStoleItemPopup
_0806EB1A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB24: .4byte gManimSt

	thumb_func_start Manim_WeaponBrokePopup
Manim_WeaponBrokePopup: @ 0x0806EB28
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EB7C @ =gBattleActor
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponBroke
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EB48
	ldr r0, _0806EB7C @ =gBattleActor
	str r0, [r7, #4]
_0806EB48:
	ldr r1, _0806EB80 @ =gBattleTarget
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponBroke
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EB5C
	ldr r0, _0806EB80 @ =gBattleTarget
	str r0, [r7, #4]
_0806EB5C:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806EB72
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_800ECEC
_0806EB72:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB7C: .4byte gBattleActor
_0806EB80: .4byte gBattleTarget

	thumb_func_start ManimShouldBuDisplayWeaponBroke
ManimShouldBuDisplayWeaponBroke: @ 0x0806EB84
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806EBAA
	ldr r0, [r7]
	bl DidBattleUnitBreakWeapon
	lsls r2, r0, #0x18
	asrs r1, r2, #0x18
	adds r0, r1, #0
	b _0806EBAE
_0806EBAA:
	movs r0, #0
	b _0806EBAE
_0806EBAE:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Manim_WeaponLevelGainedPopup
Manim_WeaponLevelGainedPopup: @ 0x0806EBB8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EC0C @ =gBattleActor
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponLevelGained
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EBD8
	ldr r0, _0806EC0C @ =gBattleActor
	str r0, [r7, #4]
_0806EBD8:
	ldr r1, _0806EC10 @ =gBattleTarget
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponLevelGained
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EBEC
	ldr r0, _0806EC10 @ =gBattleTarget
	str r0, [r7, #4]
_0806EBEC:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806EC02
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_800ED34
_0806EC02:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC0C: .4byte gBattleActor
_0806EC10: .4byte gBattleTarget

	thumb_func_start ManimShouldBuDisplayWeaponLevelGained
ManimShouldBuDisplayWeaponLevelGained: @ 0x0806EC14
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806EC3E
	ldr r0, [r7]
	bl HasBattleUnitGainedWeaponLevel
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EC3E
	movs r0, #1
	b _0806EC42
_0806EC3E:
	movs r0, #0
	b _0806EC42
_0806EC42:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Manim_PrepareBattleTalk
Manim_PrepareBattleTalk: @ 0x0806EC4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetText
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start Manim_Finish
Manim_Finish: @ 0x0806EC60
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetMuAnims
	bl ResetTextFont
	bl EndManimInfoWindow
	bl InitBmBgLayers
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl IsEventRunning
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EC90
	bl EndAllMus
_0806EC90:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806EC98
sub_806EC98: @ 0x0806EC98
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806ED74 @ =gManimSt
	ldr r1, _0806ED74 @ =gManimSt
	ldr r2, [r1, #0x50]
	ldrb r1, [r2, #2]
	lsrs r2, r1, #3
	adds r1, r2, #0
	movs r2, #1
	ands r1, r2
	adds r2, r0, #0
	adds r0, #0x58
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806ED74 @ =gManimSt
	ldr r2, _0806ED74 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x59
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806ED74 @ =gManimSt
	ldr r2, _0806ED74 @ =gManimSt
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806ED74 @ =gManimSt
	ldr r2, _0806ED74 @ =gManimSt
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806ED74 @ =gManimSt
	ldr r2, _0806ED74 @ =gManimSt
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5d
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #3]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _0806ED74 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806ED62
	ldr r0, _0806ED74 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806ED74 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0806ED62:
	ldr r1, _0806ED74 @ =gManimSt
	ldr r0, _0806ED74 @ =gManimSt
	ldr r1, _0806ED74 @ =gManimSt
	ldr r2, [r1, #0x50]
	adds r1, r2, #4
	str r1, [r0, #0x50]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED74: .4byte gManimSt

	thumb_func_start sub_806ED78
sub_806ED78: @ 0x0806ED78
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806EDA4 @ =gManimSt
	ldr r1, [r0, #0x50]
	ldrb r0, [r1, #2]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EDAC
	ldr r0, [r7]
	bl Proc_Break
	ldr r1, _0806EDA8 @ =gUnk_08D6561C
	ldr r0, [r7]
	bl sub_8004634
	b _0806EDB6
	.align 2, 0
_0806EDA4: .4byte gManimSt
_0806EDA8: .4byte gUnk_08D6561C
_0806EDAC:
	bl sub_806EC98
	ldr r0, [r7]
	bl Proc_Break
_0806EDB6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EDC0
sub_806EDC0: @ 0x0806EDC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8075E08
	adds r1, r0, #0
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EDE0
sub_806EDE0: @ 0x0806EDE0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EE2C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x40
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806EE22
	ldr r0, _0806EE2C @ =gManimSt
	ldr r2, _0806EE2C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071DF8
	ldr r0, [r7]
	movs r1, #0x64
	bl sub_80149B4
_0806EE22:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE2C: .4byte gManimSt

	thumb_func_start sub_806EE30
sub_806EE30: @ 0x0806EE30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806EE58 @ =gManimSt
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806EE58 @ =gManimSt
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE58: .4byte gManimSt

	thumb_func_start sub_806EE5C
sub_806EE5C: @ 0x0806EE5C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EE74 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806EE78
	b _0806EE8E
	.align 2, 0
_0806EE74: .4byte gManimSt
_0806EE78:
	ldr r0, _0806EE98 @ =gManimSt
	ldr r2, [r0, #0x14]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806EE98 @ =gManimSt
	ldr r3, [r0, #0x14]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
_0806EE8E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE98: .4byte gManimSt

	thumb_func_start sub_806EE9C
sub_806EE9C: @ 0x0806EE9C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EEBC @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EED0
	cmp r0, #2
	beq _0806EEC0
	b _0806EEE4
	.align 2, 0
_0806EEBC: .4byte gManimSt
_0806EEC0:
	ldr r1, _0806EEE0 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806EED0
	movs r0, #1
	str r0, [r7, #4]
_0806EED0:
	ldr r0, _0806EEE0 @ =gManimSt
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806EEDC
	movs r0, #0
	str r0, [r7, #4]
_0806EEDC:
	b _0806EEE4
	.align 2, 0
_0806EEE0: .4byte gManimSt
_0806EEE4:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806EF2E
	ldr r0, _0806EF38 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrb r1, [r0, #4]
	str r1, [r7, #8]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl sub_8079CE4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806EF2E
	bl EndManimInfoWindow
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl sub_8079DF4
	bl sub_800AD60
_0806EF2E:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF38: .4byte gManimSt

	thumb_func_start sub_806EF3C
sub_806EF3C: @ 0x0806EF3C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806EF5C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EF70
	cmp r0, #2
	beq _0806EF60
	b _0806EF84
	.align 2, 0
_0806EF5C: .4byte gManimSt
_0806EF60:
	ldr r1, _0806EF80 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806EF70
	movs r0, #1
	str r0, [r7, #4]
_0806EF70:
	ldr r0, _0806EF80 @ =gManimSt
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806EF7C
	movs r0, #0
	str r0, [r7, #4]
_0806EF7C:
	b _0806EF84
	.align 2, 0
_0806EF80: .4byte gManimSt
_0806EF84:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806EFA4
	ldr r0, _0806EFAC @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806DD98
_0806EFA4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EFAC: .4byte gManimSt

	thumb_func_start sub_806EFB0
sub_806EFB0: @ 0x0806EFB0
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #8]
	ldr r1, _0806EFD0 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EFE8
	cmp r0, #2
	beq _0806EFD4
	b _0806F004
	.align 2, 0
_0806EFD0: .4byte gManimSt
_0806EFD4:
	ldr r0, _0806F000 @ =gManimSt
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806EFE8
	movs r0, #1
	str r0, [r7, #8]
_0806EFE8:
	ldr r0, _0806F000 @ =gManimSt
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806EFFC
	movs r0, #0
	str r0, [r7, #8]
_0806EFFC:
	b _0806F004
	.align 2, 0
_0806F000: .4byte gManimSt
_0806F004:
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _0806F0B4
	ldr r1, _0806F0BC @ =gUnk_08D65760
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _0806F0C0 @ =gManimSt
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, _0806F0C0 @ =gManimSt
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	ldr r2, _0806F0C0 @ =gManimSt
	ldr r3, [r7, #8]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, #4
	adds r3, r2, r3
	ldr r4, [r3]
	adds r2, r4, #0
	adds r3, r4, #0
	adds r3, #0x6e
	movs r4, #0
	ldrsb r4, [r3, r4]
	adds r2, r4, #0
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806F0B4:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0BC: .4byte gUnk_08D65760
_0806F0C0: .4byte gManimSt

	thumb_func_start sub_806F0C4
sub_806F0C4: @ 0x0806F0C4
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F128 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806F12C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #2
	bgt _0806F132
	cmp r0, #1
	blt _0806F132
	b _0806F130
	.align 2, 0
_0806F128: .4byte gDispIo
_0806F12C: .4byte gManimSt
_0806F130:
	b _0806F276
_0806F132:
	b _0806F134
_0806F134:
	ldr r0, _0806F150 @ =gManimSt
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C208
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0806F154
	b _0806F276
	.align 2, 0
_0806F150: .4byte gManimSt
_0806F154:
	ldr r1, _0806F184 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806F196
	ldr r0, _0806F184 @ =gManimSt
	ldr r1, [r0]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	lsls r0, r2, #4
	ldr r1, _0806F188 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0x6f
	ble _0806F18C
	ldr r0, [r7, #4]
	adds r1, r0, #0
	subs r1, #0x28
	str r1, [r7, #4]
	b _0806F194
	.align 2, 0
_0806F184: .4byte gManimSt
_0806F188: .4byte gBmSt
_0806F18C:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x18
	str r1, [r7, #4]
_0806F194:
	b _0806F262
_0806F196:
	movs r0, #0
	str r0, [r7, #0x10]
_0806F19A:
	ldr r1, _0806F1AC @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0x10]
	cmp r1, r0
	blt _0806F1B0
	b _0806F1EC
	.align 2, 0
_0806F1AC: .4byte gManimSt
_0806F1B0:
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, _0806F1E4 @ =gManimSt
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	lsls r1, r3, #4
	ldr r2, _0806F1E8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _0806F19A
	.align 2, 0
_0806F1E4: .4byte gManimSt
_0806F1E8: .4byte gBmSt
_0806F1EC:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	blt _0806F202
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806F20E
	b _0806F214
_0806F202:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806F20E
	b _0806F214
_0806F20E:
	movs r0, #0x40
	str r0, [r7, #4]
	b _0806F262
_0806F214:
	movs r0, #0
	ldr r1, [r7, #8]
	ldr r2, [r7, #0xc]
	cmp r1, r2
	bgt _0806F220
	movs r0, #1
_0806F220:
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	cmp r1, #0x6f
	ble _0806F24E
	movs r0, #1
	ldr r1, [r7, #0x14]
	subs r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	subs r0, #0x28
	str r0, [r7, #4]
	b _0806F262
_0806F24E:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r7, #4]
_0806F262:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	cmp r0, #0
	bge _0806F26C
	adds r0, #7
_0806F26C:
	asrs r1, r0, #3
	movs r0, #0xf
	ldr r2, [r7]
	bl StartManimInfoWindow
_0806F276:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806F280
sub_806F280: @ 0x0806F280
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806F298 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806F29C
	b _0806F2B8
	.align 2, 0
_0806F298: .4byte gManimSt
_0806F29C:
	ldr r0, _0806F2B4 @ =gManimSt
	ldr r1, [r0]
	ldr r2, [r1]
	ldrb r0, [r2, #4]
	ldr r1, _0806F2B4 @ =gManimSt
	ldr r2, [r1, #0x14]
	ldr r1, [r2]
	ldrb r2, [r1, #4]
	adds r1, r2, #0
	bl StartBattleTalk
	b _0806F2BA
	.align 2, 0
_0806F2B4: .4byte gManimSt
_0806F2B8:
	b _0806F2BA
_0806F2BA:
	bl sub_800AD60
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806F2C8
sub_806F2C8: @ 0x0806F2C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F2D8
sub_806F2D8: @ 0x0806F2D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806F2F4 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806F2FE
	cmp r0, #2
	beq _0806F2F8
	b _0806F304
	.align 2, 0
_0806F2F4: .4byte gManimSt
_0806F2F8:
	movs r0, #1
	bl sub_806F2C8
_0806F2FE:
	movs r0, #0
	bl sub_806F2C8
_0806F304:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F30C
sub_806F30C: @ 0x0806F30C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806F32C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806F326
	movs r0, #0xa0
	bl m4aSongNumStart
_0806F326:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F32C: .4byte gPlaySt

	thumb_func_start InitManimActor
InitManimActor: @ 0x0806F330
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806F344
	b _0806F3F8
_0806F344:
	ldr r0, _0806F3DC @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #8]
	str r1, [r0]
	ldr r0, _0806F3DC @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r0, [r7, #4]
	str r0, [r1]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl StartMu
	ldr r1, _0806F3DC @ =gManimSt
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #8
	adds r2, r1, r2
	str r0, [r2]
	ldr r0, _0806F3DC @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806F3DC @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x1b
	beq _0806F3E0
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x33
	beq _0806F3E0
	b _0806F3F8
	.align 2, 0
_0806F3DC: .4byte gManimSt
_0806F3E0:
	ldr r0, _0806F400 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E2A0
_0806F3F8:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F400: .4byte gManimSt

	thumb_func_start sub_806F404
sub_806F404: @ 0x0806F404
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #1
	beq _0806F49C
	cmp r0, #1
	bgt _0806F420
	cmp r0, #0
	beq _0806F426
	b _0806F506
_0806F420:
	cmp r0, #2
	beq _0806F4BC
	b _0806F506
_0806F426:
	ldr r0, _0806F498 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806F498 @ =gManimSt
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _0806F498 @ =gManimSt
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r3, _0806F498 @ =gManimSt
	ldr r4, [r7, #4]
	adds r6, r4, #0
	lsls r5, r6, #2
	adds r5, r5, r4
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetFacingFromTo
	str r0, [r7, #0xc]
	ldr r0, _0806F498 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl sub_806C738
	b _0806F506
	.align 2, 0
_0806F498: .4byte gManimSt
_0806F49C:
	ldr r0, _0806F4B8 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806C790
	b _0806F506
	.align 2, 0
_0806F4B8: .4byte gManimSt
_0806F4BC:
	ldr r0, _0806F510 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806F510 @ =gManimSt
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0
	movs r3, #0
	bl GetFacingFromTo
	str r0, [r7, #0xc]
	ldr r0, _0806F510 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl sub_806C738
_0806F506:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F510: .4byte gManimSt

	thumb_func_start InitManimActorFacings
InitManimActorFacings: @ 0x0806F514
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _0806F548 @ =gManimSt
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C218
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7]
	bl sub_806F598
	ldr r1, _0806F548 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806F580
	cmp r0, #2
	beq _0806F54C
	b _0806F590
	.align 2, 0
_0806F548: .4byte gManimSt
_0806F54C:
	ldr r0, _0806F58C @ =gBattleHitArray
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F576
	movs r0, #2
	movs r1, #1
	ldr r2, [r7]
	bl sub_806F404
	movs r0, #3
	movs r1, #1
	ldr r2, [r7]
	bl sub_806F404
_0806F576:
	movs r0, #1
	movs r1, #0
	ldr r2, [r7]
	bl sub_806F404
_0806F580:
	movs r0, #0
	movs r1, #1
	ldr r2, [r7]
	bl sub_806F404
	b _0806F590
	.align 2, 0
_0806F58C: .4byte gBattleHitArray
_0806F590:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F598
sub_806F598: @ 0x0806F598
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	ldr r1, _0806F5BC @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	str r0, [r7, #0x14]
	ldr r1, _0806F5BC @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806F5E4
	cmp r0, #2
	beq _0806F5C0
	b _0806F5E6
	.align 2, 0
_0806F5BC: .4byte gManimSt
_0806F5C0:
	ldr r0, _0806F5E0 @ =gBattleHitArray
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F5DC
	ldr r0, [r7, #0x14]
	adds r1, r0, #2
	str r1, [r7, #0x14]
_0806F5DC:
	b _0806F5E6
	.align 2, 0
_0806F5E0: .4byte gBattleHitArray
_0806F5E4:
	b _0806F5E6
_0806F5E6:
	movs r0, #0
	str r0, [r7, #8]
_0806F5EA:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806F5F4
	b _0806F614
_0806F5F4:
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806F5EA
_0806F614:
	movs r0, #0
	str r0, [r7, #8]
_0806F618:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #8]
	cmp r1, r0
	blt _0806F624
	b _0806F758
_0806F624:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #0xc]
_0806F62A:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806F634
	b _0806F750
_0806F634:
	movs r0, #0
	str r0, [r7, #0x10]
	ldr r0, _0806F6B4 @ =gManimSt
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806F6B4 @ =gManimSt
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0806F6B8
	ldr r0, _0806F6B4 @ =gManimSt
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806F6B4 @ =gManimSt
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806F6B2
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806F6B2:
	b _0806F6F8
	.align 2, 0
_0806F6B4: .4byte gManimSt
_0806F6B8:
	ldr r0, _0806F74C @ =gManimSt
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806F74C @ =gManimSt
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806F6F8
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806F6F8:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _0806F742
	adds r0, r7, #4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	ldr r2, [r7, #0xc]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	adds r1, r7, #4
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0806F742:
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806F62A
	.align 2, 0
_0806F74C: .4byte gManimSt
_0806F750:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806F618
_0806F758:
	movs r0, #0
	str r0, [r7, #8]
_0806F75C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806F766
	b _0806F7A8
_0806F766:
	ldr r0, _0806F7A0 @ =gManimSt
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldr r1, _0806F7A4 @ =gUnk_08402BF0
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806F75C
	.align 2, 0
_0806F7A0: .4byte gManimSt
_0806F7A4: .4byte gUnk_08402BF0
_0806F7A8:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806F7B0
sub_806F7B0: @ 0x0806F7B0
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F828 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x6b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F82C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F82C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F82C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F82C @ =gManimSt
	ldr r1, _0806F830 @ =gBattleHitArray
	str r1, [r0, #0x50]
	bl sub_806EC98
	ldr r0, _0806F828 @ =gBattleActor
	ldr r1, _0806F834 @ =gBattleTarget
	ldr r2, _0806F830 @ =gBattleHitArray
	bl InitManimActors
	ldr r1, _0806F838 @ =gUnk_08D653CC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F828: .4byte gBattleActor
_0806F82C: .4byte gManimSt
_0806F830: .4byte gBattleHitArray
_0806F834: .4byte gBattleTarget
_0806F838: .4byte gUnk_08D653CC

	thumb_func_start sub_806F83C
sub_806F83C: @ 0x0806F83C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F8B4 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x6b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F8B8 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F8B8 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F8B8 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F8B8 @ =gManimSt
	ldr r1, _0806F8BC @ =gBattleHitArray
	str r1, [r0, #0x50]
	bl sub_806EC98
	ldr r0, _0806F8B4 @ =gBattleActor
	ldr r1, _0806F8C0 @ =gBattleTarget
	ldr r2, _0806F8BC @ =gBattleHitArray
	bl InitManimActors
	ldr r1, _0806F8C4 @ =gUnk_08D6540C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F8B4: .4byte gBattleActor
_0806F8B8: .4byte gManimSt
_0806F8BC: .4byte gBattleHitArray
_0806F8C0: .4byte gBattleTarget
_0806F8C4: .4byte gUnk_08D6540C

	thumb_func_start sub_806F8C8
sub_806F8C8: @ 0x0806F8C8
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F968 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F96C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F96C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F96C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F96C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F96C @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F968 @ =gBattleActor
	ldr r1, _0806F970 @ =gBattleTarget
	ldr r2, _0806F974 @ =gBattleHitArray
	bl InitManimActors
	ldr r1, _0806F978 @ =gUnk_08D6544C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F968: .4byte gBattleActor
_0806F96C: .4byte gManimSt
_0806F970: .4byte gBattleTarget
_0806F974: .4byte gBattleHitArray
_0806F978: .4byte gUnk_08D6544C

	thumb_func_start sub_806F97C
sub_806F97C: @ 0x0806F97C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806FA14 @ =gBattleActor
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x4e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806FA18 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA18 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA14 @ =gBattleActor
	ldr r1, _0806FA1C @ =gBattleTarget
	ldr r2, _0806FA20 @ =gBattleHitArray
	bl InitManimActors
	ldr r1, _0806FA24 @ =gUnk_08D6551C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA14: .4byte gBattleActor
_0806FA18: .4byte gManimSt
_0806FA1C: .4byte gBattleTarget
_0806FA20: .4byte gBattleHitArray
_0806FA24: .4byte gUnk_08D6551C

	thumb_func_start StartBattleManim
StartBattleManim: @ 0x0806FA28
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806FA48 @ =gBattleStats
	ldrh r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806FA4C
	bl sub_806F97C
	b _0806FA8A
	.align 2, 0
_0806FA48: .4byte gBattleStats
_0806FA4C:
	ldr r0, _0806FA90 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA90 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FA94 @ =gBattleActor
	ldr r1, _0806FA98 @ =gBattleTarget
	ldr r2, _0806FA9C @ =gBattleHitArray
	bl InitManimHits
	ldr r0, _0806FA94 @ =gBattleActor
	ldr r1, _0806FA98 @ =gBattleTarget
	ldr r2, _0806FA9C @ =gBattleHitArray
	bl InitManimActors
	ldr r1, _0806FAA0 @ =gUnk_08D65574
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_0806FA8A:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA90: .4byte gManimSt
_0806FA94: .4byte gBattleActor
_0806FA98: .4byte gBattleTarget
_0806FA9C: .4byte gBattleHitArray
_0806FAA0: .4byte gUnk_08D65574

	thumb_func_start InitManimHits
InitManimHits: @ 0x0806FAA4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetWeaponAnimActorCount
	ldr r1, _0806FAF4 @ =gManimSt
	adds r2, r1, #0
	adds r1, #0x5e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _0806FAF4 @ =gManimSt
	ldr r1, [r7, #8]
	str r1, [r0, #0x50]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetWeaponAnimManimSpecialScr
	ldr r1, _0806FAF4 @ =gManimSt
	str r0, [r1, #0x54]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FAF4: .4byte gManimSt

	thumb_func_start InitManimActors
InitManimActors: @ 0x0806FAF8
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #0
	ldr r1, [r7]
	ldr r2, [r7]
	bl InitManimActor
	ldr r1, _0806FB88 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bls _0806FB2C
	ldr r1, _0806FB8C @ =gBattleTarget
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r1, [r7, #4]
	ldr r2, [r7, #4]
	movs r0, #1
	bl InitManimActor
_0806FB2C:
	ldr r0, _0806FB90 @ =gBattleHitArray
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806FB6E
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r2, [r0, #0x10]
	movs r0, #2
	ldr r1, [r7]
	bl InitManimActor
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r2, [r0, #0x14]
	movs r0, #3
	ldr r1, [r7]
	bl InitManimActor
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r1, [r0, #0x10]
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r0, _0806FB94 @ =gBattleStats
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	bl HideUnitSprite
_0806FB6E:
	bl InitManimActorFacings
	movs r0, #0
	str r0, [r7, #0xc]
_0806FB76:
	ldr r1, _0806FB88 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _0806FB98
	b _0806FC10
	.align 2, 0
_0806FB88: .4byte gManimSt
_0806FB8C: .4byte gBattleTarget
_0806FB90: .4byte gBattleHitArray
_0806FB94: .4byte gBattleStats
_0806FB98:
	ldr r0, _0806FC0C @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _0806FC0C @ =gManimSt
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r1, [r2]
	adds r2, r1, #0
	adds r1, #0x72
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
	ldr r0, _0806FC0C @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl GetUnitMaxHp
	ldr r1, _0806FC0C @ =gManimSt
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806FB76
	.align 2, 0
_0806FC0C: .4byte gManimSt
_0806FC10:
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FC60 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FC60: .4byte gDispIo

	thumb_func_start GetFacingFromTo
GetFacingFromTo: @ 0x0806FC64
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806FC8A
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
	b _0806FC96
_0806FC8A:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
_0806FC96:
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806FCAC
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806FCB8
	b _0806FCCC
_0806FCAC:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806FCB8
	b _0806FCCC
_0806FCB8:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	cmp r0, r2
	bge _0806FCC6
	movs r0, #2
	b _0806FCDE
_0806FCC4:
	b _0806FCCA
_0806FCC6:
	movs r0, #3
	b _0806FCDE
_0806FCCA:
	b _0806FCDE
_0806FCCC:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	cmp r0, r2
	bge _0806FCDA
	movs r0, #1
	b _0806FCDE
_0806FCD8:
	b _0806FCDE
_0806FCDA:
	movs r0, #0
	b _0806FCDE
_0806FCDE:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UnpackManimWindowDigits
UnpackManimWindowDigits: @ 0x0806FCE8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r4, _0806FD18 @ =Img_ManimInfoWindowDigits
	movs r0, #0
	bl GetBgChrOffset
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r2, r3
	adds r2, r0, r1
	adds r0, r4, #0
	adds r1, r2, #0
	bl Decompress
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD18: .4byte Img_ManimInfoWindowDigits

	thumb_func_start PutManimWindowNumber
PutManimWindowNumber: @ 0x0806FD1C
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x30]
	adds r1, r7, #0
	adds r1, #0x10
	strh r0, [r1]
	movs r0, #7
	str r0, [r7, #0x1c]
_0806FD36:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bge _0806FD3E
	b _0806FDB2
_0806FD3E:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x1c]
	adds r4, r0, r1
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r1, [r4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806FDAA
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x20]
_0806FD7E:
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _0806FD86
	b _0806FDA8
_0806FD86:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x20]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x20]
	subs r1, r0, #1
	str r1, [r7, #0x20]
	b _0806FD7E
_0806FDA8:
	b _0806FDB2
_0806FDAA:
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806FD36
_0806FDB2:
	adds r0, r7, #0
	adds r0, #0x14
	adds r1, r0, #7
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	bl PutDigits
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
_0806FDC8:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bgt _0806FDD0
	b _0806FDFE
_0806FDD0:
	adds r0, r7, #0
	adds r0, #0x14
	movs r1, #7
	ldr r2, [r7, #0x1c]
	subs r1, r1, r2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0x20
	beq _0806FDE4
	b _0806FDFE
_0806FDE4:
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	subs r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806FDC8
_0806FDFE:
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnpackManimWindowGraphics
UnpackManimWindowGraphics: @ 0x0806FE08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x20
	bl UnpackManimWindowDigits
	ldr r1, _0806FE34 @ =0x06000540
	ldr r0, [r7]
	bl Decompress
	ldr r1, _0806FE38 @ =Pal_ManimWindowHpBar
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE34: .4byte 0x06000540
_0806FE38: .4byte Pal_ManimWindowHpBar

	thumb_func_start PutManimWindowBarTile
PutManimWindowBarTile: @ 0x0806FE3C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	ble _0806FE5A
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	b _0806FE60
_0806FE5A:
	ldr r0, [r7, #4]
	ldr r1, [r0]
	str r1, [r7, #0x10]
_0806FE60:
	ldr r0, [r7]
	ldr r2, [r7, #0x1c]
	adds r1, r2, #0
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #8]
	adds r2, r3, #0
	lsls r3, r2, #0xc
	adds r2, r3, #0
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	ldr r2, [r7, #0xc]
	subs r1, r1, r2
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _0806FE96
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_0806FE96:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutManimWindowBar
PutManimWindowBar: @ 0x0806FEA0
	push {r4, r7, lr}
	sub sp, #0x20
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806FEB6:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806FEC0
	b _0806FED4
_0806FEC0:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #0x18]
	ldrh r2, [r1]
	adds r0, r0, r2
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806FEB6
_0806FED4:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _0806FEE8
	ldr r0, [r7, #0x14]
	str r0, [r7, #0x10]
	b _0806FEFC
_0806FEE8:
	ldr r0, [r7, #0x14]
	lsls r1, r0, #8
	adds r0, r1, #0
	ldr r1, [r7, #4]
	bl __divsi3
	ldr r1, [r7, #8]
	muls r0, r1, r0
	asrs r1, r0, #8
	str r1, [r7, #0x10]
_0806FEFC:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0806FF0E
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _0806FF0E
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806FF0E:
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806FF12:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806FF1C
	b _0806FF50
_0806FF1C:
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, _0806FF4C @ =gManimWindowBarPalTable
	ldr r2, [r7, #0xc]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r7, #0x18]
	ldrh r3, [r0]
	ldr r4, [r7, #0x18]
	adds r0, r4, #2
	ldrh r4, [r0]
	str r4, [sp]
	ldr r0, [r7]
	bl PutManimWindowBarTile
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806FF12
	.align 2, 0
_0806FF4C: .4byte gManimWindowBarPalTable
_0806FF50:
	add sp, #0x20
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start EndManimInfoWindow
EndManimInfoWindow: @ 0x0806FF58
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806FF6C @ =ProcScr_ManimInfoWindow
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF6C: .4byte ProcScr_ManimInfoWindow

	thumb_func_start StartManimInfoWindow
StartManimInfoWindow: @ 0x0806FF70
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0806FFC8 @ =ProcScr_ManimInfoWindow
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x30]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FFC8: .4byte ProcScr_ManimInfoWindow

	thumb_func_start ManimWindow_Clear
ManimWindow_Clear: @ 0x0806FFCC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetOnHBlankA
	bl ClearUi
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806FFE8
sub_806FFE8: @ 0x0806FFE8
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08070030 @ =gUnk_083FAAE4
	movs r0, #1
	bl GetBgChrOffset
	ldr r2, _08070034 @ =0x06000020
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08070038 @ =gUnk_084009F0
	adds r0, r1, #0
	bl UnpackManimWindowGraphics
	ldr r1, _0807003C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _08070040
	cmp r0, #2
	beq _0807004E
	b _080700B4
	.align 2, 0
_08070030: .4byte gUnk_083FAAE4
_08070034: .4byte 0x06000020
_08070038: .4byte gUnk_084009F0
_0807003C: .4byte gManimSt
_08070040:
	movs r2, #5
	rsbs r2, r2, #0
	ldr r0, [r7]
	movs r1, #0
	bl sub_8070390
	b _080700B4
_0807004E:
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _08070070 @ =gManimSt
	ldr r0, [r1]
	ldr r1, _08070070 @ =gManimSt
	ldr r2, [r1, #0x14]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r0, r1
	ble _08070074
	movs r0, #1
	str r0, [r7, #4]
	b _08070094
	.align 2, 0
_08070070: .4byte gManimSt
_08070074:
	ldr r0, _080700B0 @ =gManimSt
	ldr r1, [r0]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, _080700B0 @ =gManimSt
	ldr r2, [r1, #0x14]
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r2, #0xc0
	ands r1, r2
	cmp r0, r1
	ble _08070094
	movs r0, #1
	str r0, [r7, #4]
_08070094:
	ldr r1, [r7, #4]
	movs r2, #0xa
	rsbs r2, r2, #0
	ldr r0, [r7]
	bl sub_8070390
	movs r0, #1
	ldr r2, [r7, #4]
	subs r1, r0, r2
	ldr r0, [r7]
	movs r2, #0
	bl sub_8070390
	b _080700B4
	.align 2, 0
_080700B0: .4byte gManimSt
_080700B4:
	bl InitScanlineEffect
	ldr r0, _080700F4 @ =gManimSt
	ldrb r1, [r0, #0x11]
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, _080700F4 @ =gManimSt
	ldrb r2, [r1, #0x11]
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #0x20
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r3, _080700F8 @ =gPal
	ldrh r2, [r3, #0x22]
	ldr r4, _080700F8 @ =gPal
	adds r3, r4, #0
	adds r4, #0x42
	ldrh r3, [r4]
	bl StartManimFrameGradientScanlineEffect2
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080700F4: .4byte gManimSt
_080700F8: .4byte gPal

	thumb_func_start sub_80700FC
sub_80700FC: @ 0x080700FC
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #4]
_08070110:
	ldr r1, _08070120 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _08070124
	b _08070224
	.align 2, 0
_08070120: .4byte gManimSt
_08070124:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08070218 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _08070218 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	ble _08070168
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #0
	subs r1, #0x10
	adds r2, r1, #0
	strh r2, [r0]
_08070168:
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _08070218 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	bge _080701C2
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #4
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080701C2
	ldr r1, _0807021C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080701C2
	ldr r1, _08070220 @ =0x00000395
	adds r0, r1, #0
	bl m4aSongNumStart
_080701C2:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08070218 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1, #0xe]
	cmp r0, r1
	beq _08070210
	ldr r0, _08070218 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8070258
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #1
	strb r1, [r0]
_08070210:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08070110
	.align 2, 0
_08070218: .4byte gManimSt
_0807021C: .4byte gPlaySt
_08070220: .4byte 0x00000395
_08070224:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0807024C
	ldr r1, _08070254 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807024C
	ldr r0, _08070254 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0807024C:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070254: .4byte gManimSt

	thumb_func_start sub_8070258
sub_8070258: @ 0x08070258
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08070328 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, _08070328 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807032C @ =gBg0Tm
	adds r0, r0, r1
	ldr r1, _08070328 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	lsrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	ldr r2, _08070330 @ =0x00005020
	movs r3, #0
	str r3, [sp]
	movs r3, #3
	bl PutManimWindowNumber
	ldr r0, _08070328 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, _08070328 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807032C @ =gBg0Tm
	adds r0, r0, r1
	ldr r1, _08070328 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r3, r1, r2
	ldrb r1, [r3, #0xc]
	ldr r2, _08070328 @ =gManimSt
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldrh r3, [r2, #0xe]
	lsrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, _08070334 @ =gUnk_08D656B4
	str r3, [sp]
	movs r3, #0
	bl PutManimWindowBar
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070328: .4byte gManimSt
_0807032C: .4byte gBg0Tm
_08070330: .4byte 0x00005020
_08070334: .4byte gUnk_08D656B4

	thumb_func_start sub_8070338
sub_8070338: @ 0x08070338
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0x40
	beq _08070374
	cmp r0, #0x40
	bgt _0807035A
	cmp r0, #0
	beq _08070364
	b _08070384
_0807035A:
	cmp r0, #0x80
	beq _0807036C
	cmp r0, #0xc0
	beq _0807037C
	b _08070384
_08070364:
	ldr r0, _08070368 @ =gUnk_083FAC48
	b _08070388
	.align 2, 0
_08070368: .4byte gUnk_083FAC48
_0807036C:
	ldr r0, _08070370 @ =gUnk_083FAC68
	b _08070388
	.align 2, 0
_08070370: .4byte gUnk_083FAC68
_08070374:
	ldr r0, _08070378 @ =gUnk_083FAC88
	b _08070388
	.align 2, 0
_08070378: .4byte gUnk_083FAC88
_0807037C:
	ldr r0, _08070380 @ =gUnk_083FACA8
	b _08070388
	.align 2, 0
_08070380: .4byte gUnk_083FACA8
_08070384:
	movs r0, #0
	b _08070388
_08070388:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8070390
sub_8070390: @ 0x08070390
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08070520 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x2e
	ldr r3, [r7, #8]
	adds r2, r3, #0
	ldrb r3, [r1]
	adds r1, r2, r3
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x10]
	ldr r0, _08070520 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x2f
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x11]
	ldr r0, _08070520 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8070338
	ldr r2, [r7, #4]
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08070524 @ =gUnk_08D656D8
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	ldr r3, _08070520 @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x5e
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _08070528 @ =gBuf
	adds r0, r1, #0
	adds r1, r2, #0
	bl Decompress
	ldr r0, _08070520 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	lsls r0, r1, #5
	ldr r1, _08070520 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807052C @ =gBg1Tm
	adds r0, r0, r1
	ldr r1, _08070528 @ =gBuf
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #0xc
	adds r2, r3, #0
	movs r3, #1
	orrs r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl TmApplyTsa_thm
	movs r0, #2
	bl EnableBgSync
	ldr r0, _08070520 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	lsls r2, r1, #5
	adds r0, r2, #1
	ldr r1, _08070520 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08070530 @ =gBg0Tm
	adds r4, r0, r1
	ldr r0, _08070520 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl sub_8014AB0
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08070520 @ =gManimSt
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08070520 @ =gManimSt
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r3, [r1, #0xd]
	adds r2, r3, #0
	lsls r1, r2, #4
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_8070258
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070520: .4byte gManimSt
_08070524: .4byte gUnk_08D656D8
_08070528: .4byte gBuf
_0807052C: .4byte gBg1Tm
_08070530: .4byte gBg0Tm

	thumb_func_start sub_8070534
sub_8070534: @ 0x08070534
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x2a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7]
	bl sub_8070620
	ldr r0, _0807061C @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807061C @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807061C @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807061C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807061C: .4byte gDispIo

	thumb_func_start sub_8070620
sub_8070620: @ 0x08070620
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08070700 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070700 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08070700 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070700 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x2a]
	adds r1, r2, #2
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x2a]
	ldr r0, [r7]
	movs r2, #0x2a
	ldrsh r1, [r0, r2]
	cmp r1, #0x10
	ble _080706F8
	ldr r0, _08070700 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070700 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070700 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	bl Proc_Break
_080706F8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070700: .4byte gDispIo

	thumb_func_start sub_8070704
sub_8070704: @ 0x08070704
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08070764 @ =gBg0Tm
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r2, _08070768 @ =0x0000521F
	ldr r3, _0807076C @ =0x00005229
	str r3, [sp]
	movs r3, #2
	bl PutManimWindowNumber
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08070764 @ =gBg0Tm
	adds r0, r0, r1
	ldr r2, [r7, #8]
	ldr r1, _08070770 @ =gUnk_08D65728
	str r1, [sp]
	movs r1, #0x63
	movs r3, #0
	bl PutManimWindowBar
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070764: .4byte gBg0Tm
_08070768: .4byte 0x0000521F
_0807076C: .4byte 0x00005229
_08070770: .4byte gUnk_08D65728

	thumb_func_start sub_8070774
sub_8070774: @ 0x08070774
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08070804 @ =gUnk_081DF464
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070808 @ =0x06004000
	adds r1, r0, r2
	adds r0, r4, #0
	movs r2, #0xe0
	bl RegisterDataMove
	ldr r4, _0807080C @ =gUnk_081DF764
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070810 @ =0x060040E0
	adds r1, r0, r2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r4, _08070814 @ =gUnk_081DFA64
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070818 @ =0x060043E0
	adds r1, r0, r2
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r1, _0807081C @ =gUnk_081DFC30
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08070820 @ =gBg0Tm + 0x20c
	ldr r1, _08070824 @ =gUnk_083FA9B8
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_8070704
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070804: .4byte gUnk_081DF464
_08070808: .4byte 0x06004000
_0807080C: .4byte gUnk_081DF764
_08070810: .4byte 0x060040E0
_08070814: .4byte gUnk_081DFA64
_08070818: .4byte 0x060043E0
_0807081C: .4byte gUnk_081DFC30
_08070820: .4byte gBg0Tm + 0x20c
_08070824: .4byte gUnk_083FA9B8

	thumb_func_start sub_8070828
sub_8070828: @ 0x08070828
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08070854 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807084A
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStart
_0807084A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070854: .4byte gPlaySt

	thumb_func_start sub_8070858
sub_8070858: @ 0x08070858
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	ble _080708A4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_080708A4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_8070704
	ldr r1, [r7]
	adds r0, r1, #0
	adds r4, r1, #0
	adds r4, #0x64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	movs r1, #0x64
	bl __modsi3
	adds r1, r0, #0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	bne _080708EE
	ldr r0, [r7]
	bl Proc_Break
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStop
_080708EE:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80708F8
sub_80708F8: @ 0x080708F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl sub_80709E8
	ldr r0, _080709E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080709E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080709E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080709E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080709E4: .4byte gDispIo

	thumb_func_start sub_80709E8
sub_80709E8: @ 0x080709E8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08070AC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070AC0 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r3, [r2]
	adds r1, r3, #0
	movs r2, #0x4c
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08070AC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070AC0 @ =gDispIo
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r1, [r2]
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x6a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6a
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc
	ble _08070AB8
	ldr r0, _08070AC0 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070AC0 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070AC0 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	bl Proc_Break
_08070AB8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070AC0: .4byte gDispIo

	thumb_func_start sub_8070AC4
sub_8070AC4: @ 0x08070AC4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	bgt _08070ADC
	b _08070AEE
_08070ADC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_8075098
_08070AEE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070AF8
sub_8070AF8: @ 0x08070AF8
	push {r7, lr}
	mov r7, sp
	ldr r1, _08070B0C @ =gUnk_08D6587C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070B0C: .4byte gUnk_08D6587C

	thumb_func_start sub_8070B10
sub_8070B10: @ 0x08070B10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x30
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetCharacterData
	str r0, [r7, #0xc]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r4, #0xe
	ldrsh r1, [r0, r4]
	adds r0, r1, #0
	bl GetClassData
	str r0, [r7, #0x10]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r5, #8
	ldrsh r1, [r0, r5]
	str r1, [r7, #0x14]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0xe
	ldrsh r1, [r0, r6]
	str r1, [r7, #0x18]
	ldr r1, _08070B9C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x1c]
	ldr r0, [r7, #4]
	cmp r0, #9
	bls _08070B8E
	b _08070F64
_08070B8E:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08070BA0 @ =_08070BA4
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08070B9C: .4byte gUnk_08D65878
_08070BA0: .4byte _08070BA4
_08070BA4: @ jump table
	.4byte _08070BCC @ case 0
	.4byte _08070C54 @ case 1
	.4byte _08070CD0 @ case 2
	.4byte _08070D4C @ case 3
	.4byte _08070DD4 @ case 4
	.4byte _08070E68 @ case 5
	.4byte _08070E68 @ case 6
	.4byte _08070E68 @ case 7
	.4byte _08070E68 @ case 8
	.4byte _08070E68 @ case 9
_08070BCC:
	ldr r0, _08070C4C @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x14
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070C4C @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x14
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x14]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0xc]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	ldr r1, _08070C4C @ =gUnk_08D65878
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x14
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070C50 @ =gBg0Tm + 0xc
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070C4C: .4byte gUnk_08D65878
_08070C50: .4byte gBg0Tm + 0xc
_08070C54:
	ldr r0, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x1c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r2, [r7, #8]
	ldr r3, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r4, #0xa
	ldrsh r3, [r1, r4]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070CC8 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _08070CCC @ =gBg0Tm + 0x8e
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070CC8: .4byte gUnk_08D65878
_08070CCC: .4byte gBg0Tm + 0x8e
_08070CD0:
	ldr r0, _08070D44 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x24
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070D44 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r2, [r7, #8]
	ldr r3, _08070D44 @ =gUnk_08D65878
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r5, #0xc
	ldrsh r3, [r1, r5]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070D44 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _08070D48 @ =gBg0Tm + 0x94
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070D44: .4byte gUnk_08D65878
_08070D48: .4byte gBg0Tm + 0x94
_08070D4C:
	ldr r0, _08070DCC @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x2c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070DCC @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x2c
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x18]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0x10]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	ldr r1, _08070DCC @ =gUnk_08D65878
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x2c
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070DD0 @ =gBg0Tm + 0x10c
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070DCC: .4byte gUnk_08D65878
_08070DD0: .4byte gBg0Tm + 0x10c
_08070DD4:
	ldr r0, _08070E60 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x34
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070E60 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x34
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x1c]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r1, _08070E60 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0x10
	ldrsh r1, [r0, r6]
	adds r0, r1, #0
	bl GetItemName
	ldr r1, _08070E60 @ =gUnk_08D65878
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x34
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070E64 @ =gBg0Tm + 0x18c
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070E60: .4byte gUnk_08D65878
_08070E64: .4byte gBg0Tm + 0x18c
_08070E68:
	ldr r0, _08070F58 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070F58 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #8]
	ldr r3, _08070F58 @ =gUnk_08D65878
	ldr r1, [r3]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	ldr r4, [r7]
	movs r5, #0x64
	muls r4, r5, r4
	adds r3, r3, r4
	adds r1, #8
	adds r4, r1, r3
	movs r1, #0
	ldrsh r3, [r4, r1]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070F58 @ =gUnk_08D65878
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #4]
	subs r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #0
	adds r2, #8
	lsls r3, r2, #5
	adds r1, r3, #7
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, _08070F5C @ =gBg0Tm
	adds r1, r1, r2
	ldr r2, [r7, #8]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08070F60 @ =gUnk_08D657D8
	ldr r5, _08070F58 @ =gUnk_08D65878
	ldr r4, [r5]
	ldr r5, [r7, #4]
	adds r6, r5, #0
	lsls r5, r6, #1
	str r5, [r7, #0x20]
	ldr r6, [r7]
	str r6, [r7, #0x24]
	movs r5, #0x64
	mov r8, r5
	ldr r5, [r7, #0x24]
	mov r6, r8
	muls r6, r5, r6
	str r6, [r7, #0x24]
	ldr r6, [r7, #0x20]
	ldr r5, [r7, #0x24]
	adds r6, r6, r5
	str r6, [r7, #0x20]
	adds r4, #8
	ldr r6, [r7, #0x20]
	adds r5, r4, r6
	movs r6, #0
	ldrsh r4, [r5, r6]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	str r4, [sp, #4]
	movs r3, #0x10
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070F64
	.align 2, 0
_08070F58: .4byte gUnk_08D65878
_08070F5C: .4byte gBg0Tm
_08070F60: .4byte gUnk_08D657D8
_08070F64:
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8070F70
sub_8070F70: @ 0x08070F70
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071164 @ =gUnk_08C025F8
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x10]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x10]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0xc]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x72
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x6c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x6e
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x70
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x16]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, _08071168 @ =gUnk_08D65878
	ldr r0, [r1]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x78
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071168 @ =gUnk_08D65878
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7e
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071164: .4byte gUnk_08C025F8
_08071168: .4byte gUnk_08D65878

	thumb_func_start sub_807116C
sub_807116C: @ 0x0807116C
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	bl EndAllMus
	bl ResetText
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08071268 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _0807126C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071264 @ =0x030027CC
	ldr r1, _08071264 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071260 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08071260 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08071260 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_804A4CC
	movs r0, #0
	str r0, [r7, #4]
_0807124E:
	ldr r0, _08071270 @ =gUnk_08D65850
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	bne _08071274
	b _080712A8
	.align 2, 0
_08071260: .4byte gDispIo
_08071264: .4byte 0x030027CC
_08071268: .4byte 0x0000FFE0
_0807126C: .4byte 0x0000E0FF
_08071270: .4byte gUnk_08D65850
_08071274:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r2, _080712A0 @ =gBg0Tm + 0x2
	adds r0, r1, r2
	ldr r1, _080712A4 @ =gUnk_08D65850
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	bl sub_8014B14
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807124E
	.align 2, 0
_080712A0: .4byte gBg0Tm + 0x2
_080712A4: .4byte gUnk_08D65850
_080712A8:
	movs r0, #0
	str r0, [r7, #4]
_080712AC:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _080712B4
	b _0807133E
_080712B4:
	movs r0, #0
	str r0, [r7, #8]
_080712B8:
	ldr r0, [r7, #8]
	cmp r0, #1
	ble _080712C0
	b _08071336
_080712C0:
	ldr r0, _0807131C @ =gUnk_08D65878
	ldr r1, [r7, #8]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r1, _08071320 @ =gUnk_08D65800
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	bl sub_800536C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #8]
	cmp r1, r0
	bne _08071324
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #4]
	cmp r1, r0
	bne _08071324
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #0
	bl sub_8070B10
	b _0807132E
	.align 2, 0
_0807131C: .4byte gUnk_08D65878
_08071320: .4byte gUnk_08D65800
_08071324:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #1
	bl sub_8070B10
_0807132E:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080712B8
_08071336:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080712AC
_0807133E:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807134C
sub_807134C: @ 0x0807134C
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r0, [r1, r3]
	str r0, [r7, #8]
	ldr r1, _08071390 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0807139A
	bl sub_8071960
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _08071394
	b _08071860
	.align 2, 0
_08071390: .4byte gpKeySt
_08071394:
	ldr r0, [r7]
	bl Proc_Break
_0807139A:
	ldr r1, _080713B8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080713BC
	movs r0, #0xa
	str r0, [r7, #0xc]
	b _080713C0
	.align 2, 0
_080713B8: .4byte gpKeySt
_080713BC:
	movs r0, #1
	str r0, [r7, #0xc]
_080713C0:
	ldr r1, _080714D8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080713D8
	b _08071534
_080713D8:
	ldr r1, _080714DC @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r5, #0
	ldrsh r2, [r3, r5]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _080714DC @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _080714DC @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _080714E0 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #6]
	cmp r0, r2
	blt _08071534
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _080714E4
	ldr r1, _080714DC @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _080714E0 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08071534
	.align 2, 0
_080714D8: .4byte gpKeySt
_080714DC: .4byte gUnk_08D65878
_080714E0: .4byte gUnk_08D65800
_080714E4:
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08071654 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08071534:
	ldr r1, _08071658 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0807154C
	b _080716A8
_0807154C:
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _08071650 @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _08071654 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	cmp r0, r2
	bge _080716A8
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _0807165C
	ldr r1, _08071650 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08071654 @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080716A8
	.align 2, 0
_08071650: .4byte gUnk_08D65878
_08071654: .4byte gUnk_08D65800
_08071658: .4byte gpKeySt
_0807165C:
	ldr r1, _08071868 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080716A8:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0807171A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _080716EE
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080716EE:
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #3
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_0807171A:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0807178C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #1
	beq _08071760
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08071760:
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #4
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_0807178C:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080717CE
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #1
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080717CE:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071810
	ldr r0, [r7]
	ldr r1, _0807186C @ =gUnk_08D65800
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #2
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08071810:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071830
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	movs r2, #1
	bl sub_8070B10
_08071830:
	ldr r1, _08071870 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071860
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	bl sub_8070B10
_08071860:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071868: .4byte gUnk_08D65878
_0807186C: .4byte gUnk_08D65800
_08071870: .4byte gpKeySt

	thumb_func_start sub_8071874
sub_8071874: @ 0x08071874
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x72
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x3c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x12]
	ldr r1, _0807195C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7, #4]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetCharacterData
	ldr r1, [r7]
	str r0, [r1]
	ldr r1, _0807195C @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r1, [r7, #4]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetClassData
	ldr r1, [r7]
	str r0, [r1, #4]
	ldr r0, [r7]
	ldr r2, _0807195C @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, [r7]
	ldr r2, _0807195C @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r1, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r0, [r7]
	ldr r2, _0807195C @ =gUnk_08D65878
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807195C: .4byte gUnk_08D65878

	thumb_func_start sub_8071960
sub_8071960: @ 0x08071960
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	ldr r0, _08071994 @ =gBattleHitArray
	str r0, [r7, #0xc]
	ldr r1, _08071998 @ =gBattleActor
	adds r0, r1, #0
	movs r1, #0
	bl sub_8071874
	ldr r1, _0807199C @ =gBattleTarget
	adds r0, r1, #0
	movs r1, #1
	bl sub_8071874
	bl ClearBattleHits
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7]
_0807198A:
	ldr r0, [r7]
	cmp r0, #4
	ble _080719A0
	b _080719F0
	.align 2, 0
_08071994: .4byte gBattleHitArray
_08071998: .4byte gBattleActor
_0807199C: .4byte gBattleTarget
_080719A0:
	movs r0, #0
	str r0, [r7, #4]
_080719A4:
	ldr r0, [r7, #4]
	cmp r0, #1
	ble _080719AC
	b _080719E0
_080719AC:
	ldr r1, _080719D4 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080719D8
	movs r0, #1
	str r0, [r7, #0x10]
	b _080719E0
	.align 2, 0
_080719D4: .4byte gUnk_08D65878
_080719D8:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080719A4
_080719E0:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080719E8
	b _080719F0
_080719E8:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0807198A
_080719F0:
	ldr r0, [r7]
	cmp r0, #5
	bne _08071A00
	ldr r0, [r7, #4]
	cmp r0, #2
	bne _08071A00
	movs r0, #0
	b _08071BCE
_08071A00:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #8]
_08071A0C:
	ldr r0, [r7, #8]
	cmp r0, #9
	ble _08071A14
	b _08071BAE
_08071A14:
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	str r0, [r7]
	ldr r0, [r7, #8]
	movs r1, #1
	ands r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _08071A70 @ =gUnk_08D65878
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	cmp r0, #8
	bhi _08071B02
	lsls r1, r0, #2
	ldr r2, _08071A74 @ =_08071A78
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071A70: .4byte gUnk_08D65878
_08071A74: .4byte _08071A78
_08071A78: @ jump table
	.4byte _08071ACE @ case 0
	.4byte _08071ACE @ case 1
	.4byte _08071ACE @ case 2
	.4byte _08071ACE @ case 3
	.4byte _08071A9C @ case 4
	.4byte _08071A9C @ case 5
	.4byte _08071A9C @ case 6
	.4byte _08071A9C @ case 7
	.4byte _08071AE4 @ case 8
_08071A9C:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071B02
_08071ACE:
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071B02
_08071AE4:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B02
_08071B02:
	ldr r1, [r7, #0x10]
	subs r0, r1, #2
	cmp r0, #6
	bhi _08071B96
	lsls r1, r0, #2
	ldr r2, _08071B14 @ =_08071B18
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071B14: .4byte _08071B18
_08071B18: @ jump table
	.4byte _08071B34 @ case 0
	.4byte _08071B54 @ case 1
	.4byte _08071B76 @ case 2
	.4byte _08071B96 @ case 3
	.4byte _08071B34 @ case 4
	.4byte _08071B54 @ case 5
	.4byte _08071B76 @ case 6
_08071B34:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B96
_08071B52:
	b _08071B96
_08071B54:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B96
_08071B74:
	b _08071B96
_08071B76:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071B96
_08071B94:
	b _08071B96
_08071B96:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08071B9E
	b _08071BA0
_08071B9E:
	b _08071BA6
_08071BA0:
	ldr r0, [r7, #0xc]
	adds r1, r0, #4
	str r1, [r7, #0xc]
_08071BA6:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08071A0C
_08071BAE:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #2]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	movs r0, #1
	b _08071BCE
_08071BCE:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8071BD8
sub_8071BD8: @ 0x08071BD8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071C08 @ =gBg0Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _08071C0C @ =gBg1Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	bl StartBattleManim
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071C08: .4byte gBg0Tm
_08071C0C: .4byte gBg1Tm

	thumb_func_start sub_8071C10
sub_8071C10: @ 0x08071C10
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071C7C @ =gUnk_083F95C8
	ldr r1, _08071C80 @ =0x06013000
	bl Decompress
	ldr r0, _08071C84 @ =gUnk_083F96B8
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071C88 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	ldr r3, [r7]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08071C88 @ =gBmSt
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #3
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071C7C: .4byte gUnk_083F95C8
_08071C80: .4byte 0x06013000
_08071C84: .4byte gUnk_083F96B8
_08071C88: .4byte gBmSt

	thumb_func_start sub_8071C8C
sub_8071C8C: @ 0x08071C8C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071CF8 @ =gUnk_083F9820
	ldr r1, _08071CFC @ =0x06013000
	bl Decompress
	ldr r0, _08071D00 @ =gUnk_083F9964
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071D04 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	ldr r3, [r7]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08071D04 @ =gBmSt
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #3
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071CF8: .4byte gUnk_083F9820
_08071CFC: .4byte 0x06013000
_08071D00: .4byte gUnk_083F9964
_08071D04: .4byte gBmSt

	thumb_func_start sub_8071D08
sub_8071D08: @ 0x08071D08
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _08071D94 @ =gUnk_08D658DC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071D98 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071D98 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	subs r1, #8
	str r1, [r0, #0x34]
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	movs r2, #1
	eors r1, r2
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071D94: .4byte gUnk_08D658DC
_08071D98: .4byte gBmSt

	thumb_func_start sub_8071D9C
sub_8071D9C: @ 0x08071D9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071DE8 @ =gUnk_083FAEE0
	ldr r1, _08071DEC @ =0x06013000
	bl Decompress
	ldr r0, _08071DF0 @ =gUnk_083FB16C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08071DF4 @ =gUnk_083F44FC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc6
	lsls r3, r3, #6
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x48
	movs r6, #0
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071DE8: .4byte gUnk_083FAEE0
_08071DEC: .4byte 0x06013000
_08071DF0: .4byte gUnk_083FB16C
_08071DF4: .4byte gUnk_083F44FC

	thumb_func_start sub_8071DF8
sub_8071DF8: @ 0x08071DF8
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071E60 @ =gUnk_08D658FC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071E64 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071E64 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071E60: .4byte gUnk_08D658FC
_08071E64: .4byte gBmSt

	thumb_func_start sub_8071E68
sub_8071E68: @ 0x08071E68
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xb7
	bl sub_80151FC
	ldr r0, _08071EB8 @ =gUnk_083FB310
	ldr r1, _08071EBC @ =0x06013800
	bl Decompress
	ldr r0, _08071EC0 @ =gUnk_083FB664
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08071EC4 @ =gUnk_083F4464
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #8
	ldr r3, _08071EC8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071EB8: .4byte gUnk_083FB310
_08071EBC: .4byte 0x06013800
_08071EC0: .4byte gUnk_083FB664
_08071EC4: .4byte gUnk_083F4464
_08071EC8: .4byte 0x000041C0

	thumb_func_start sub_8071ECC
sub_8071ECC: @ 0x08071ECC
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071F34 @ =gUnk_08D6591C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071F38 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071F38 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071F34: .4byte gUnk_08D6591C
_08071F38: .4byte gBmSt

	thumb_func_start sub_8071F3C
sub_8071F3C: @ 0x08071F3C
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	bl sub_807456C
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08072058 @ =gUnk_083FCDB0
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _0807205C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072068 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _0807206C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072064 @ =0x030027CC
	ldr r1, _08072064 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072070 @ =gUnk_083FD3D8
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl sub_8014BA4
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072058: .4byte gUnk_083FCDB0
_0807205C: .4byte 0x06002800
_08072060: .4byte gDispIo
_08072064: .4byte 0x030027CC
_08072068: .4byte 0x0000FFE0
_0807206C: .4byte 0x0000E0FF
_08072070: .4byte gUnk_083FD3D8

	thumb_func_start sub_8072074
sub_8072074: @ 0x08072074
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #2
	bls _080720FC
	bl sub_8014B58
	ldr r0, _080720F0 @ =gUnk_083FD3D8
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_8014BBC
	ldr r4, _080720F4 @ =gUnk_083FD418
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080720F8 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _080720BA
	adds r0, #7
_080720BA:
	asrs r1, r0, #3
	subs r0, r1, #4
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _080720CA
	adds r1, #7
_080720CA:
	asrs r2, r1, #3
	subs r1, r2, #4
	movs r2, #0
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #8
	movs r3, #0x3c
	bl sub_8072320
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8c
	bl sub_80151FC
	b _08072196
	.align 2, 0
_080720F0: .4byte gUnk_083FD3D8
_080720F4: .4byte gUnk_083FD418
_080720F8: .4byte 0x06002800
_080720FC:
	ldr r0, _080721A0 @ =gUnk_08D65954
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #4]
	ldr r0, _080721A0 @ =gUnk_08D65954
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _0807213A
	adds r0, #7
_0807213A:
	asrs r0, r0, #3
	ldr r2, [r7, #4]
	adds r1, r0, r2
	subs r0, r1, #3
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _0807214E
	adds r1, #7
_0807214E:
	asrs r1, r1, #3
	ldr r3, [r7, #8]
	adds r2, r1, r3
	subs r1, r2, #3
	movs r2, #8
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #6
	movs r3, #0xa
	bl sub_8072320
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x89
	bl sub_80151FC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08072196:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080721A0: .4byte gUnk_08D65954

	thumb_func_start sub_80721A4
sub_80721A4: @ 0x080721A4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080721C4 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080721C4: .4byte gBg2Tm

	thumb_func_start sub_80721C8
sub_80721C8: @ 0x080721C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8014B58
	ldr r1, _0807223C @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072240 @ =0x030027CC
	ldr r1, _08072240 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072244 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072240 @ =0x030027CC
	ldr r1, _08072240 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0x1f
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072248 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl sub_807224C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807223C: .4byte gBg2Tm
_08072240: .4byte 0x030027CC
_08072244: .4byte 0x0000FFE0
_08072248: .4byte gDispIo

	thumb_func_start sub_807224C
sub_807224C: @ 0x0807224C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	asrs r2, r1, #2
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x46
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08072312
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807231C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08072312:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807231C: .4byte gDispIo

	thumb_func_start sub_8072320
sub_8072320: @ 0x08072320
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08072370 @ =gUnk_08D6597C
	ldr r1, [r7, #0x20]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x58]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072370: .4byte gUnk_08D6597C

	thumb_func_start sub_8072374
sub_8072374: @ 0x08072374
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08072394 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072394: .4byte gBg2Tm

	thumb_func_start sub_8072398
sub_8072398: @ 0x08072398
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080723B8 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080723B8: .4byte gBg2Tm

	thumb_func_start sub_80723BC
sub_80723BC: @ 0x080723BC
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08072450 @ =gBg2Tm
	ldr r2, [r7]
	ldr r1, [r2, #0x2c]
	ldr r3, [r7]
	ldr r2, [r3, #0x30]
	ldr r3, _08072454 @ =0x00004140
	ldr r4, [r7]
	ldr r5, [r4, #0x54]
	str r5, [sp]
	ldr r4, [r7]
	ldr r5, [r4, #0x54]
	str r5, [sp, #4]
	bl sub_8014C38
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072458 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072450: .4byte gBg2Tm
_08072454: .4byte 0x00004140
_08072458: .4byte gDispIo

	thumb_func_start sub_807245C
sub_807245C: @ 0x0807245C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072510 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072510 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072510 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072510 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #7
	ble _08072506
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08072506:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072510: .4byte gDispIo

	thumb_func_start sub_8072514
sub_8072514: @ 0x08072514
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x44
	ldr r1, [r7]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x44
	ldrh r3, [r2]
	subs r0, r3, #1
	adds r2, r1, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r0, #0
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	movs r1, #1
	cmn r0, r1
	bne _08072554
	ldr r0, [r7]
	bl Proc_Break
_08072554:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807255C
sub_807255C: @ 0x0807255C
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	cmp r1, #0
	bne _08072574
	ldr r0, [r7]
	bl Proc_Break
	b _08072628
_08072574:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	str r1, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, _08072630 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072630 @ =gDispIo
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072630 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072630 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	cmp r0, r2
	blt _08072628
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _08072634 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7]
	bl Proc_Break
_08072628:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072630: .4byte gDispIo
_08072634: .4byte gBg2Tm

	thumb_func_start sub_8072638
sub_8072638: @ 0x08072638
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _080726B0 @ =gUnk_08D659BC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080726B4 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080726B4 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #0x50]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080726B0: .4byte gUnk_08D659BC
_080726B4: .4byte gBmSt

	thumb_func_start sub_80726B8
sub_80726B8: @ 0x080726B8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xb6
	bl sub_80151FC
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080727B4 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldr r4, [r0, #0x50]
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080727B8 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_807456C
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080727B4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080727B4: .4byte gDispIo
_080727B8: .4byte 0x06002800

	thumb_func_start sub_80727BC
sub_80727BC: @ 0x080727BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08072874 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080727D6
	adds r1, #7
_080727D6:
	asrs r2, r1, #3
	subs r1, r2, #3
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _080727E6
	adds r2, #7
_080727E6:
	asrs r3, r2, #3
	subs r2, r3, #3
	ldr r3, _08072878 @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0807287C @ =gUnk_083FC770
	str r4, [sp, #8]
	ldr r4, _08072880 @ =gUnk_08D659EC
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014D78
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072880 @ =gUnk_08D659EC
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08072866
	ldr r0, [r7]
	bl Proc_Break
_08072866:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072874: .4byte gBg2Tm
_08072878: .4byte 0x00004140
_0807287C: .4byte gUnk_083FC770
_08072880: .4byte gUnk_08D659EC

	thumb_func_start sub_8072884
sub_8072884: @ 0x08072884
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080728E8 @ =gUnk_08D65A04
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080728EC @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080728EC @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080728E8: .4byte gUnk_08D65A04
_080728EC: .4byte gBmSt

	thumb_func_start sub_80728F0
sub_80728F0: @ 0x080728F0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807290C @ =0x0000010F
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	bl sub_80151FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807290C: .4byte 0x0000010F

	thumb_func_start sub_8072910
sub_8072910: @ 0x08072910
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	adds r0, r3, #0
	adds r1, r7, #0
	adds r1, #0xc
	strh r0, [r1]
	ldr r1, _08072968 @ =gUnk_08D65A24
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	str r1, [r0, #0x50]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0xc
	adds r2, r0, #0
	adds r0, #0x58
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072968: .4byte gUnk_08D65A24

	thumb_func_start sub_807296C
sub_807296C: @ 0x0807296C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _08072A98 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldr r4, [r0, #0x50]
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08072A9C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08072AA0 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072AA4 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08072AA4 @ =gBmSt
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	subs r2, r3, #2
	ldr r3, _08072AA8 @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	bl sub_8014C38
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	ldr r0, [r1, #0x54]
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_8014BBC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x58
	ldrh r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072AA4 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	bl sub_80151FC
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072A98: .4byte gDispIo
_08072A9C: .4byte 0x06002800
_08072AA0: .4byte gBg2Tm
_08072AA4: .4byte gBmSt
_08072AA8: .4byte 0x00004140

	thumb_func_start sub_8072AAC
sub_8072AAC: @ 0x08072AAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x10
	bne _08072AEC
	ldr r0, [r7]
	bl Proc_Break
_08072AEC:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r1, [r2]
	movs r2, #0x16
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #0x10
	bls _08072B32
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08072B32:
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072C00 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08072C00 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072C08 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072C0C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C04 @ =0x030027CC
	ldr r1, _08072C04 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072C00 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072C00: .4byte gDispIo
_08072C04: .4byte 0x030027CC
_08072C08: .4byte 0x0000FFE0
_08072C0C: .4byte 0x0000E0FF

	thumb_func_start sub_8072C10
sub_8072C10: @ 0x08072C10
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0
	bne _08072C50
	ldr r0, [r7]
	bl Proc_Break
_08072C50:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r1, [r2]
	movs r2, #0x16
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #0x10
	bls _08072C96
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08072C96:
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072D64 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08072D64 @ =gDispIo
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072D6C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08072D70 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D68 @ =0x030027CC
	ldr r1, _08072D68 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072D64 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072D64: .4byte gDispIo
_08072D68: .4byte 0x030027CC
_08072D6C: .4byte 0x0000FFE0
_08072D70: .4byte 0x0000E0FF

	thumb_func_start sub_8072D74
sub_8072D74: @ 0x08072D74
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8014B58
	ldr r1, _08072E04 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E08 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072E08 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072E08 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072E04: .4byte gBg2Tm
_08072E08: .4byte gDispIo

	thumb_func_start sub_8072E0C
sub_8072E0C: @ 0x08072E0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetOnHBlankA
	bl sub_8014B58
	ldr r1, _08072EA4 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072EA8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072EA8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08072EA8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072EA4: .4byte gBg2Tm
_08072EA8: .4byte gDispIo

	thumb_func_start sub_8072EAC
sub_8072EAC: @ 0x08072EAC
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08072F10 @ =gUnk_08D65A5C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072F14 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08072F14 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x34]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072F10: .4byte gUnk_08D65A5C
_08072F14: .4byte gBmSt

	thumb_func_start sub_8072F18
sub_8072F18: @ 0x08072F18
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08072F64 @ =gUnk_083FB684
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08072F68 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08072F6C @ =gUnk_083FB8E4
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_8075A98
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072F64: .4byte gUnk_083FB684
_08072F68: .4byte 0x06002800
_08072F6C: .4byte gUnk_083FB8E4

	thumb_func_start sub_8072F70
sub_8072F70: @ 0x08072F70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08073070 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	subs r1, r2, #1
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	subs r2, r3, #3
	ldr r3, _08073074 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _08073078 @ =gUnk_083FB904
	str r4, [sp, #8]
	ldr r4, _0807307C @ =gUnk_08D65A8C
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014D78
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0807307C @ =gUnk_08D65A8C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08073006
	ldr r0, [r7]
	bl Proc_Break
_08073006:
	bl sub_807456C
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073080 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073070: .4byte gBg2Tm
_08073074: .4byte 0x00004140
_08073078: .4byte gUnk_083FB904
_0807307C: .4byte gUnk_08D65A8C
_08073080: .4byte gDispIo

	thumb_func_start sub_8073084
sub_8073084: @ 0x08073084
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080730D0 @ =gUnk_08D65AA4
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r1, _080730D4 @ =gActionSt
	ldrb r2, [r1, #0x13]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080730D8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r1, _080730D4 @ =gActionSt
	ldrb r2, [r1, #0x14]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080730D8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730D0: .4byte gUnk_08D65AA4
_080730D4: .4byte gActionSt
_080730D8: .4byte gBmSt

	thumb_func_start sub_80730DC
sub_80730DC: @ 0x080730DC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r1, _080731D8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080730FA
	movs r0, #0xb3
	bl m4aSongNumStart
_080730FA:
	ldr r0, _080731DC @ =gUnk_083FD7F4
	ldr r1, _080731E0 @ =0x06013800
	bl Decompress
	ldr r0, _080731E4 @ =gUnk_083FDAAC
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl sub_801419C
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080731E8 @ =0x06002800
	adds r1, r0, r2
	ldr r2, _080731EC @ =0x0000FFFF
	adds r0, r1, #0
	movs r1, #0x10
	bl sub_8015010
	ldr r0, _080731F0 @ =gBg2Tm
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _080731F4 @ =0x00004140
	bl sub_8015010
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080731F8 @ =gUnk_083F371C
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #4
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080731FC @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	bl InitScanlineEffect
	bl sub_807706C
	bl sub_807456C
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073200 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080731D8: .4byte gPlaySt
_080731DC: .4byte gUnk_083FD7F4
_080731E0: .4byte 0x06013800
_080731E4: .4byte gUnk_083FDAAC
_080731E8: .4byte 0x06002800
_080731EC: .4byte 0x0000FFFF
_080731F0: .4byte gBg2Tm
_080731F4: .4byte 0x00004140
_080731F8: .4byte gUnk_083F371C
_080731FC: .4byte 0x000041C0
_08073200: .4byte gDispIo

	thumb_func_start sub_8073204
sub_8073204: @ 0x08073204
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r3, [r1]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	adds r1, #8
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r1, r0, #0
	lsls r2, r1, #4
	adds r0, r2, #0
	movs r1, #0x28
	bl __divsi3
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08073280
	movs r0, #0x10
	str r0, [r7, #8]
_08073280:
	ldr r0, _080732F8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080732F8 @ =gDispIo
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _080732F8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080732F8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x27
	bls _080732EE
	ldr r0, [r7]
	bl Proc_Break
	bl EndEachSpriteAnimProc
_080732EE:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080732F8: .4byte gDispIo

	thumb_func_start sub_80732FC
sub_80732FC: @ 0x080732FC
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r3, [r1]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	adds r1, #8
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r1, r0, #0
	subs r1, #0x28
	adds r0, r1, #0
	lsls r1, r0, #4
	adds r0, r1, #0
	movs r1, #0x1e
	bl __divsi3
	movs r1, #0x10
	subs r0, r1, r0
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bgt _08073380
	movs r0, #0
	str r0, [r7, #8]
_08073380:
	ldr r0, _080733F4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080733F4 @ =gDispIo
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _080733F4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080733F4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x45
	bls _080733EA
	ldr r0, [r7]
	bl Proc_Break
_080733EA:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080733F4: .4byte gDispIo

	thumb_func_start sub_80733F8
sub_80733F8: @ 0x080733F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_80771D0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807340C
sub_807340C: @ 0x0807340C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073474 @ =gUnk_08D65AEC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073478 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073478 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073474: .4byte gUnk_08D65AEC
_08073478: .4byte gBmSt

	thumb_func_start sub_807347C
sub_807347C: @ 0x0807347C
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x87
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _080734E8 @ =gUnk_083FF230
	ldr r1, _080734EC @ =0x06013800
	bl Decompress
	ldr r0, _080734F0 @ =gUnk_083FF508
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080734F4 @ =gUnk_083FF528
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080734F8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080734E8: .4byte gUnk_083FF230
_080734EC: .4byte 0x06013800
_080734F0: .4byte gUnk_083FF508
_080734F4: .4byte gUnk_083FF528
_080734F8: .4byte 0x000041C0

	thumb_func_start sub_80734FC
sub_80734FC: @ 0x080734FC
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073560 @ =gUnk_08D65B14
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073564 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073564 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073560: .4byte gUnk_08D65B14
_08073564: .4byte gBmSt

	thumb_func_start sub_8073568
sub_8073568: @ 0x08073568
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x86
	bl sub_80151FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073584
sub_8073584: @ 0x08073584
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073638 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r4, _0807363C @ =gUnk_083FDEF0
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08073640 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08073644 @ =gUnk_08278A30
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073638: .4byte gDispIo
_0807363C: .4byte gUnk_083FDEF0
_08073640: .4byte 0x06002800
_08073644: .4byte gUnk_08278A30

	thumb_func_start sub_8073648
sub_8073648: @ 0x08073648
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _080736DC @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08073664
	adds r1, #7
_08073664:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08073674
	adds r2, #7
_08073674:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #9
	ldr r3, _080736E0 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xb
	str r4, [sp, #4]
	ldr r4, _080736E4 @ =gUnk_083FEBC4
	str r4, [sp, #8]
	ldr r4, _080736E8 @ =gUnk_08402F68
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _080736E8 @ =gUnk_08402F68
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _080736CE
	ldr r0, [r7]
	bl Proc_Break
_080736CE:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080736DC: .4byte gBg2Tm
_080736E0: .4byte 0x00004140
_080736E4: .4byte gUnk_083FEBC4
_080736E8: .4byte gUnk_08402F68

	thumb_func_start sub_80736EC
sub_80736EC: @ 0x080736EC
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _080737A4 @ =gUnk_08402F84
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x13
	bl memcpy
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r7, #4
	ldr r2, [r7]
	adds r3, r2, #0
	adds r2, #0x4a
	ldrh r3, [r2]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r2]
	lsls r3, r3, #0x10
	asrs r2, r3, #0x10
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4a
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _0807379C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_0807379C:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080737A4: .4byte gUnk_08402F84
_080737A8: .4byte gDispIo

	thumb_func_start sub_80737AC
sub_80737AC: @ 0x080737AC
	push {r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _08073848 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _08073848 @ =gDispIo
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _08073848 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073848 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1e
	ble _0807383E
	ldr r0, [r7]
	bl Proc_Break
_0807383E:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073848: .4byte gDispIo

	thumb_func_start sub_807384C
sub_807384C: @ 0x0807384C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080738AC @ =gUnk_08D65B54
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080738B0 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080738B0 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080738AC: .4byte gUnk_08D65B54
_080738B0: .4byte gBmSt

	thumb_func_start sub_80738B4
sub_80738B4: @ 0x080738B4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	bl sub_80151FC
	ldr r1, _080738DC @ =gUnk_08275ECC
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080738DC: .4byte gUnk_08275ECC

	thumb_func_start sub_80738E0
sub_80738E0: @ 0x080738E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08073974 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080738FC
	adds r1, #7
_080738FC:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _0807390C
	adds r2, #7
_0807390C:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #9
	ldr r3, _08073978 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xb
	str r4, [sp, #4]
	ldr r4, _0807397C @ =gUnk_083FDC84
	str r4, [sp, #8]
	ldr r4, _08073980 @ =gUnk_08402FB0
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073980 @ =gUnk_08402FB0
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08073966
	ldr r0, [r7]
	bl Proc_Break
_08073966:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073974: .4byte gBg2Tm
_08073978: .4byte 0x00004140
_0807397C: .4byte gUnk_083FDC84
_08073980: .4byte gUnk_08402FB0

	thumb_func_start sub_8073984
sub_8073984: @ 0x08073984
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080739E4 @ =gUnk_08D65B94
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080739E8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080739E8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080739E4: .4byte gUnk_08D65B94
_080739E8: .4byte gBmSt

	thumb_func_start sub_80739EC
sub_80739EC: @ 0x080739EC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _08073A44 @ =gUnk_0827BC24
	ldr r1, _08073A48 @ =0x06013800
	bl Decompress
	ldr r0, _08073A4C @ =gUnk_0827BE0C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073A50 @ =gUnk_083FEE30
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, _08073A54 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073A44: .4byte gUnk_0827BC24
_08073A48: .4byte 0x06013800
_08073A4C: .4byte gUnk_0827BE0C
_08073A50: .4byte gUnk_083FEE30
_08073A54: .4byte 0x000041C0

	thumb_func_start sub_8073A58
sub_8073A58: @ 0x08073A58
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl sub_80151FC
	ldr r0, _08073A90 @ =gUnk_083FEE30
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	subs r2, #8
	ldr r3, _08073A94 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073A90: .4byte gUnk_083FEE30
_08073A94: .4byte 0x000041C0

	thumb_func_start sub_8073A98
sub_8073A98: @ 0x08073A98
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl sub_80151FC
	ldr r0, _08073ACC @ =gUnk_083FEE30
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08073AD0 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073ACC: .4byte gUnk_083FEE30
_08073AD0: .4byte 0x000041C0

	thumb_func_start sub_8073AD4
sub_8073AD4: @ 0x08073AD4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073B38 @ =gUnk_08D65BD4
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073B3C @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073B3C @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #0x12
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073B38: .4byte gUnk_08D65BD4
_08073B3C: .4byte gBmSt

	thumb_func_start sub_8073B40
sub_8073B40: @ 0x08073B40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xfd
	bl sub_80151FC
	bl InitScanlineEffect
	bl sub_807706C
	ldr r1, _08073C0C @ =sub_8077248
	adds r0, r1, #0
	bl SetOnHBlankA
	bl sub_807456C
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C10 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C14 @ =gBg2Tm
	ldr r1, _08073C18 @ =gBuf
	ldr r2, _08073C1C @ =0x00004140
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #1
	ldr r3, [r7]
	bl sub_80746E0
	ldr r1, _08073C20 @ =gUnk_08D668CC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073C0C: .4byte sub_8077248
_08073C10: .4byte gDispIo
_08073C14: .4byte gBg2Tm
_08073C18: .4byte gBuf
_08073C1C: .4byte 0x00004140
_08073C20: .4byte gUnk_08D668CC

	thumb_func_start sub_8073C24
sub_8073C24: @ 0x08073C24
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xb
	ble _08073C66
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08073C66:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldr r3, [r7]
	ldr r4, [r7]
	adds r2, r4, #0
	adds r4, #0x48
	ldrh r5, [r4]
	adds r2, r5, #1
	adds r4, r3, #0
	adds r3, #0x48
	ldrh r4, [r3]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r2, #0
	orrs r5, r4
	adds r4, r5, #0
	strh r4, [r3]
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _08073CAC @ =gUnk_08D65C1C
	str r3, [sp]
	movs r3, #0xc
	bl sub_807755C
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073CAC: .4byte gUnk_08D65C1C

	thumb_func_start sub_8073CB0
sub_8073CB0: @ 0x08073CB0
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bgt _08073CF2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08073CF2:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldr r3, [r7]
	ldr r4, [r7]
	adds r2, r4, #0
	adds r4, #0x48
	ldrh r5, [r4]
	subs r2, r5, #1
	adds r4, r3, #0
	adds r3, #0x48
	ldrh r4, [r3]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r2, #0
	orrs r5, r4
	adds r4, r5, #0
	strh r4, [r3]
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _08073D38 @ =gUnk_08D65C1C
	str r3, [sp]
	movs r3, #0xc
	bl sub_807755C
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D38: .4byte gUnk_08D65C1C

	thumb_func_start sub_8073D3C
sub_8073D3C: @ 0x08073D3C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08073D9C @ =gUnk_08D65C24
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073DA0 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073DA0 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D9C: .4byte gUnk_08D65C24
_08073DA0: .4byte gBmSt

	thumb_func_start sub_8073DA4
sub_8073DA4: @ 0x08073DA4
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x83
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r4, _08073EB0 @ =gUnk_083FFA38
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08073EB4 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08073EB8 @ =gUnk_083FF5F8
	ldr r1, _08073EBC @ =0x06013800
	bl Decompress
	ldr r1, _08073EC0 @ =gUnk_083FFB48
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073EC0 @ =gUnk_083FFB48
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073EC4 @ =gUnk_083FFB68
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, _08073EC8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073ECC @ =0x030027CC
	ldr r1, _08073ECC @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08073ED0 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073ECC @ =0x030027CC
	ldr r1, _08073ECC @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073ED4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073EB0: .4byte gUnk_083FFA38
_08073EB4: .4byte 0x06002800
_08073EB8: .4byte gUnk_083FF5F8
_08073EBC: .4byte 0x06013800
_08073EC0: .4byte gUnk_083FFB48
_08073EC4: .4byte gUnk_083FFB68
_08073EC8: .4byte 0x000041C0
_08073ECC: .4byte 0x030027CC
_08073ED0: .4byte 0x0000FFE0
_08073ED4: .4byte gDispIo

	thumb_func_start sub_8073ED8
sub_8073ED8: @ 0x08073ED8
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x84
	bl sub_80151FC
	ldr r0, _08073FB0 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08073EF8
	adds r1, #7
_08073EF8:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08073F08
	adds r2, #7
_08073F08:
	asrs r3, r2, #3
	subs r2, r3, #2
	ldr r3, _08073FB4 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_8014C38
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073FB8 @ =0x030027CC
	ldr r1, _08073FB8 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _08073FBC @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073FB8 @ =0x030027CC
	ldr r1, _08073FB8 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073FC0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073FB0: .4byte gBg2Tm
_08073FB4: .4byte 0x00004140
_08073FB8: .4byte 0x030027CC
_08073FBC: .4byte 0x0000FFE0
_08073FC0: .4byte gDispIo

	thumb_func_start sub_8073FC4
sub_8073FC4: @ 0x08073FC4
	push {r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _08074060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _08074060 @ =gDispIo
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _08074060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074060 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _08074056
	ldr r0, [r7]
	bl Proc_Break
_08074056:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074060: .4byte gDispIo

	thumb_func_start sub_8074064
sub_8074064: @ 0x08074064
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080740C4 @ =gUnk_08D65C64
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080740C8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080740C8 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080740C4: .4byte gUnk_08D65C64
_080740C8: .4byte gBmSt

	thumb_func_start sub_80740CC
sub_80740CC: @ 0x080740CC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x88
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_807456C
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807418C @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r4, _08074190 @ =gUnk_083FFCA0
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08074194 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08074198 @ =gUnk_0827D0F0
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807418C: .4byte gDispIo
_08074190: .4byte gUnk_083FFCA0
_08074194: .4byte 0x06002800
_08074198: .4byte gUnk_0827D0F0

	thumb_func_start sub_807419C
sub_807419C: @ 0x0807419C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08074230 @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080741B8
	adds r1, #7
_080741B8:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _080741C8
	adds r2, #7
_080741C8:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #8
	ldr r3, _08074234 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	ldr r4, _08074238 @ =gUnk_0840085C
	str r4, [sp, #8]
	ldr r4, _0807423C @ =gUnk_08403050
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0807423C @ =gUnk_08403050
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08074222
	ldr r0, [r7]
	bl Proc_Break
_08074222:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074230: .4byte gBg2Tm
_08074234: .4byte 0x00004140
_08074238: .4byte gUnk_0840085C
_0807423C: .4byte gUnk_08403050

	thumb_func_start sub_8074240
sub_8074240: @ 0x08074240
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _080742A0 @ =gUnk_08D65C8C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _080742A4 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	ldr r2, [r7]
	subs r1, r2, r1
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r1, _080742A4 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	ldr r2, [r7, #4]
	subs r1, r2, r1
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080742A0: .4byte gUnk_08D65C8C
_080742A4: .4byte gBmSt

	thumb_func_start sub_80742A8
sub_80742A8: @ 0x080742A8
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080742D8 @ =gActionSt
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r1, _080742D8 @ =gActionSt
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	ldr r1, _080742D8 @ =gActionSt
	movs r2, #0x14
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	bl sub_8079710
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080742D8: .4byte gActionSt

	thumb_func_start sub_80742DC
sub_80742DC: @ 0x080742DC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080742FC @ =gActionSt
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	bics r0, r1
	str r0, [r4, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080742FC: .4byte gActionSt

	thumb_func_start sub_8074300
sub_8074300: @ 0x08074300
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8d
	bl sub_80151FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08074414 @ =gUnk_083FDB40
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08074418 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807441C @ =gBg2Tm
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _0807433C
	adds r1, #7
_0807433C:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _0807434C
	adds r2, #7
_0807434C:
	asrs r3, r2, #3
	subs r2, r3, #2
	ldr r3, _08074420 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	ldr r4, _08074424 @ =gUnk_083FDC60
	str r4, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	bl sub_8014E24
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08074428 @ =gUnk_083FDACC
	ldr r1, _0807442C @ =0x06013800
	bl Decompress
	ldr r0, _08074430 @ =gUnk_083FDB20
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074434 @ =gUnk_083FDC40
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_8014BA4
	bl InitScanlineEffect
	bl sub_807706C
	bl sub_807456C
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074438 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074414: .4byte gUnk_083FDB40
_08074418: .4byte 0x06002800
_0807441C: .4byte gBg2Tm
_08074420: .4byte 0x00004140
_08074424: .4byte gUnk_083FDC60
_08074428: .4byte gUnk_083FDACC
_0807442C: .4byte 0x06013800
_08074430: .4byte gUnk_083FDB20
_08074434: .4byte gUnk_083FDC40
_08074438: .4byte gDispIo

	thumb_func_start sub_807443C
sub_807443C: @ 0x0807443C
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0x10
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _080744E6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _080744F0 @ =gUnk_083F3778
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080744F4 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _080744F0 @ =gUnk_083F3778
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080744F4 @ =0x000041C0
	movs r4, #1
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
_080744E6:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080744F0: .4byte gUnk_083F3778
_080744F4: .4byte 0x000041C0

	thumb_func_start sub_80744F8
sub_80744F8: @ 0x080744F8
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	bl sub_807719C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _08074562
	ldr r0, [r7]
	bl Proc_Break
_08074562:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807456C
sub_807456C: @ 0x0807456C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080746D0 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080746D8 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080746DC @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D4 @ =0x030027CC
	ldr r1, _080746D4 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080746D0 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080746D0: .4byte gDispIo
_080746D4: .4byte 0x030027CC
_080746D8: .4byte 0x0000FFE0
_080746DC: .4byte 0x0000E0FF

	thumb_func_start sub_80746E0
sub_80746E0: @ 0x080746E0
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08074758 @ =gUnk_08D65CE4
	ldr r1, [r7, #0xc]
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x58]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074758: .4byte gUnk_08D65CE4

	thumb_func_start sub_807475C
sub_807475C: @ 0x0807475C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08074770 @ =gUnk_08D65CE4
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074770: .4byte gUnk_08D65CE4

	thumb_func_start sub_8074774
sub_8074774: @ 0x08074774
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x68
	ldrh r2, [r3]
	bl SetBgOffset
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	ldrh r1, [r1]
	ldrh r2, [r3]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x68
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x6a
	ldrh r1, [r1]
	ldrh r2, [r3]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80747F4
sub_80747F4: @ 0x080747F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08074894 @ =gBg1Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r5, _08074898 @ =gUnk_081E0C60
	movs r0, #1
	bl GetBgChrOffset
	ldr r2, _0807489C @ =0x06004000
	adds r1, r0, r2
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080748A0 @ =gUnk_081E0EAC
	ldr r1, _080748A4 @ =gBuf
	bl Decompress
	ldr r0, _080748A4 @ =gBuf
	ldr r1, _08074894 @ =gBg1Tm
	movs r2, #0xe0
	lsls r2, r2, #2
	movs r3, #0xa4
	lsls r3, r3, #7
	bl sub_80150CC
	ldr r1, _080748A8 @ =gUnk_081E0FA8
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r7, #8]
	lsls r0, r1, #5
	adds r1, r0, #1
	ldr r2, [r7, #4]
	adds r0, r1, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080748AC @ =gBg0Tm
	adds r5, r0, r1
	ldr r0, _080748B0 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_8014B14
	movs r0, #0
	str r0, [r7, #0xc]
_0807487E:
	ldr r0, _080748B4 @ =gUnk_08D65CF4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _080748B8
	b _08074954
	.align 2, 0
_08074894: .4byte gBg1Tm
_08074898: .4byte gUnk_081E0C60
_0807489C: .4byte 0x06004000
_080748A0: .4byte gUnk_081E0EAC
_080748A4: .4byte gBuf
_080748A8: .4byte gUnk_081E0FA8
_080748AC: .4byte gBg0Tm
_080748B0: .4byte gManimSt
_080748B4: .4byte gUnk_08D65CF4
_080748B8:
	ldr r0, _08074928 @ =gUnk_08D65CF4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldr r0, [r7, #8]
	adds r1, r1, r0
	lsls r0, r1, #5
	ldr r1, _08074928 @ =gUnk_08D65CF4
	ldr r2, [r7, #0xc]
	adds r5, r2, #0
	lsls r3, r5, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	ldr r3, [r7, #4]
	adds r1, r2, r3
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0807492C @ =gBg0Tm
	adds r5, r0, r1
	ldr r0, _08074930 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl UnitHasMagicRank
	strb r0, [r7, #0x10]
	bl GetLang
	ldr r1, _08074928 @ =gUnk_08D65CF4
	ldr r2, [r7, #0xc]
	mov r8, r2
	mov r6, r8
	lsls r3, r6, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r4, r2, #0
	ldrb r2, [r7, #0x10]
	lsls r3, r2, #0x18
	asrs r2, r3, #0x18
	cmp r2, #1
	bne _08074934
	adds r2, r4, #4
	b _08074936
	.align 2, 0
_08074928: .4byte gUnk_08D65CF4
_0807492C: .4byte gBg0Tm
_08074930: .4byte gManimSt
_08074934:
	adds r2, r4, #0
_08074936:
	adds r3, r1, #4
	adds r1, r3, r2
	lsls r2, r0, #2
	ldr r1, [r1]
	adds r0, r2, r1
	ldr r3, [r0]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #3
	bl sub_8014AB0
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0807487E
_08074954:
	movs r0, #3
	bl EnableBgSync
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8074968
sub_8074968: @ 0x08074968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x28]
	adds r1, r7, #0
	adds r1, #0x10
	strb r0, [r1]
	ldr r0, _080749E8 @ =gUnk_08D65CF4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldr r2, [r7, #8]
	adds r0, r1, r2
	lsls r1, r0, #5
	adds r0, r1, #4
	ldr r1, _080749E8 @ =gUnk_08D65CF4
	ldr r2, [r7, #0xc]
	adds r5, r2, #0
	lsls r3, r5, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	ldr r3, [r7, #4]
	adds r1, r2, r3
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080749EC @ =gBg0Tm
	adds r5, r0, r1
	ldr r1, [r7, #0xc]
	ldr r0, [r7]
	bl sub_8074B68
	adds r4, r0, #0
	adds r6, r4, #0
	adds r0, r7, #0
	adds r0, #0x10
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080749D6
	ldr r1, [r7, #0xc]
	ldr r0, [r7]
	bl sub_80749F0
	adds r6, r6, r0
_080749D6:
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080749E8: .4byte gUnk_08D65CF4
_080749EC: .4byte gBg0Tm

	thumb_func_start sub_80749F0
sub_80749F0: @ 0x080749F0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #8
	bls _08074A02
	b _08074B5C
_08074A02:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08074A10 @ =_08074A14
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08074A10: .4byte _08074A14
_08074A14: @ jump table
	.4byte _08074A38 @ case 0
	.4byte _08074A3C @ case 1
	.4byte _08074A60 @ case 2
	.4byte _08074A84 @ case 3
	.4byte _08074AA8 @ case 4
	.4byte _08074ACC @ case 5
	.4byte _08074AF0 @ case 6
	.4byte _08074B14 @ case 7
	.4byte _08074B38 @ case 8
_08074A38:
	movs r0, #1
	b _08074B60
_08074A3C:
	ldr r0, _08074A5C @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x73
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074A5C: .4byte gManimSt
_08074A60:
	ldr r0, _08074A80 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x74
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074A80: .4byte gManimSt
_08074A84:
	ldr r0, _08074AA4 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x75
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074AA4: .4byte gManimSt
_08074AA8:
	ldr r0, _08074AC8 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x76
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074AC8: .4byte gManimSt
_08074ACC:
	ldr r0, _08074AEC @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x79
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074AEC: .4byte gManimSt
_08074AF0:
	ldr r0, _08074B10 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x77
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074B10: .4byte gManimSt
_08074B14:
	ldr r0, _08074B34 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x78
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074B34: .4byte gManimSt
_08074B38:
	ldr r0, _08074B58 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x7a
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074B60
	.align 2, 0
_08074B58: .4byte gManimSt
_08074B5C:
	movs r0, #0
	b _08074B60
_08074B60:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8074B68
sub_8074B68: @ 0x08074B68
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08074BA4 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl GetUnit
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #8
	bhi _08074C50
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08074BA8 @ =_08074BAC
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08074BA4: .4byte gManimSt
_08074BA8: .4byte _08074BAC
_08074BAC: @ jump table
	.4byte _08074BD0 @ case 0
	.4byte _08074BF4 @ case 1
	.4byte _08074BFE @ case 2
	.4byte _08074C08 @ case 3
	.4byte _08074C12 @ case 4
	.4byte _08074C1C @ case 5
	.4byte _08074C26 @ case 6
	.4byte _08074C30 @ case 7
	.4byte _08074C3A @ case 8
_08074BD0:
	ldr r0, _08074BF0 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x70
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074C54
	.align 2, 0
_08074BF0: .4byte gManimSt
_08074BF4:
	ldr r0, [r7, #8]
	movs r1, #0x12
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074BFE:
	ldr r0, [r7, #8]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C08:
	ldr r0, [r7, #8]
	movs r1, #0x15
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C12:
	ldr r0, [r7, #8]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C1C:
	ldr r0, [r7, #8]
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C26:
	ldr r0, [r7, #8]
	movs r1, #0x17
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C30:
	ldr r0, [r7, #8]
	movs r1, #0x18
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074C54
_08074C3A:
	ldr r0, [r7, #8]
	ldr r2, [r0, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r7, #8]
	ldr r2, [r0]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
	adds r0, r1, #0
	b _08074C54
_08074C50:
	movs r0, #0
	b _08074C54
_08074C54:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8074C5C
sub_8074C5C: @ 0x08074C5C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8074C70
sub_8074C70: @ 0x08074C70
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08074D24 @ =gUnk_08D65D6C
	ldr r1, [r7, #0xc]
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	ldr r0, _08074D28 @ =gUnk_083F9F2C
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074D2C @ =0x06010000
	adds r1, r2, r3
	bl Decompress
	ldr r0, _08074D30 @ =gUnk_083F9ECC
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074D30 @ =gUnk_083F9ECC
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x11
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074D34 @ =gUnk_08D65D7C
	ldr r1, [r7, #0x10]
	bl Proc_Start
	str r0, [r7, #0x14]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D24: .4byte gUnk_08D65D6C
_08074D28: .4byte gUnk_083F9F2C
_08074D2C: .4byte 0x06010000
_08074D30: .4byte gUnk_083F9ECC
_08074D34: .4byte gUnk_08D65D7C

	thumb_func_start sub_8074D38
sub_8074D38: @ 0x08074D38
	push {r7, lr}
	mov r7, sp
	ldr r1, _08074D4C @ =gUnk_08D65D6C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D4C: .4byte gUnk_08D65D6C

	thumb_func_start sub_8074D50
sub_8074D50: @ 0x08074D50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08074DD0 @ =gUnk_083FA1B8
	str r0, [r7, #0x20]
	ldr r1, _08074DD4 @ =gUnk_08D65D6C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldrh r1, [r0, #0x2a]
	str r1, [r7, #0x14]
	ldr r1, [r7, #0x1c]
	ldrh r0, [r1, #0x2a]
	ldr r2, [r7, #8]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _08074DDC
	ldr r0, _08074DD8 @ =gUnk_083F28D0
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x14]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	b _08074F30
	.align 2, 0
_08074DD0: .4byte gUnk_083FA1B8
_08074DD4: .4byte gUnk_08D65D6C
_08074DD8: .4byte gUnk_083F28D0
_08074DDC:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08074DE8
	movs r0, #0
	str r0, [r7, #0x10]
	b _08074DEC
_08074DE8:
	movs r0, #1
	str r0, [r7, #0x10]
_08074DEC:
	ldr r0, _08074F38 @ =gUnk_083F28D0
	ldr r2, [r7, #4]
	ldr r1, [r7, #0x1c]
	ldrh r3, [r1, #0x2c]
	ldr r4, [r7, #0x10]
	adds r1, r3, r4
	movs r3, #0xf
	ands r1, r3
	adds r3, r1, #0
	lsls r1, r3, #0xc
	ldr r3, [r7, #0x14]
	adds r1, r1, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2e]
	movs r5, #3
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r5, r4, #0xa
	adds r3, r1, r5
	ldr r1, [r7, #0x10]
	adds r4, r1, #1
	str r4, [sp]
	movs r1, #2
	str r1, [sp, #4]
	ldr r1, [r7]
	bl StartSpriteAnimProc
	ldr r0, _08074F38 @ =gUnk_083F28D0
	ldr r2, [r7]
	subs r1, r2, #3
	ldr r2, [r7, #4]
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x18]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	ldr r4, [r7, #0x10]
	adds r5, r4, #3
	str r5, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _08074EBA
	ldr r0, _08074F38 @ =gUnk_083F28D0
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x14]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
_08074EBA:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08074EDE
	ldr r1, [r7, #0x20]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x4c
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074F3C @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
_08074EDE:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08074EE6
	rsbs r0, r0, #0
_08074EE6:
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x20]
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x2d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074F3C @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08074F0E
	rsbs r0, r0, #0
_08074F0E:
	adds r0, #0x20
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x20]
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x4d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074F3C @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
_08074F30:
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074F38: .4byte gUnk_083F28D0
_08074F3C: .4byte 0x06010000

	thumb_func_start sub_8074F40
sub_8074F40: @ 0x08074F40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08075088 @ =gUnk_083FA1B8
	str r0, [r7, #0x18]
	ldr r1, _0807508C @ =gUnk_08D65D6C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	ldrh r1, [r0, #0x2a]
	str r1, [r7, #0xc]
	ldr r1, [r7, #0x14]
	ldrh r0, [r1, #0x2a]
	ldr r2, [r7, #8]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08075090 @ =gUnk_083F28D0
	ldr r2, [r7, #4]
	ldr r1, [r7, #0x14]
	ldrh r3, [r1, #0x2c]
	movs r4, #0xf
	adds r1, r3, #0
	ands r1, r4
	adds r4, r1, #0
	lsls r3, r4, #0x10
	lsrs r1, r3, #0x10
	adds r3, r1, #0
	lsls r1, r3, #0xc
	ldr r3, [r7, #0xc]
	adds r1, r1, r3
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2e]
	movs r5, #3
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r5, r4, #0xa
	adds r3, r1, r5
	movs r1, #5
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	ldr r1, [r7]
	bl StartSpriteAnimProc
	ldr r0, _08075090 @ =gUnk_083F28D0
	ldr r2, [r7]
	subs r1, r2, #3
	ldr r2, [r7, #4]
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x10]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #3
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _08075090 @ =gUnk_083F28D0
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0xc]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7, #8]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x2d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08075094 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0x20
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x4d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08075094 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl sub_8015068
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075088: .4byte gUnk_083FA1B8
_0807508C: .4byte gUnk_08D65D6C
_08075090: .4byte gUnk_083F28D0
_08075094: .4byte 0x06010000

	thumb_func_start sub_8075098
sub_8075098: @ 0x08075098
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080750C8 @ =gUnk_08D65D94
	ldr r1, [r7, #4]
	bl Proc_StartBlocking
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080750C8: .4byte gUnk_08D65D94

	thumb_func_start sub_80750CC
sub_80750CC: @ 0x080750CC
	push {r7, lr}
	mov r7, sp
	ldr r0, _080751EC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080751EC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080751EC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x30
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080751EC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080751EC: .4byte gDispIo

	thumb_func_start sub_80751F0
sub_80751F0: @ 0x080751F0
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075220 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08075220 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08075220 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075220: .4byte gDispIo

	thumb_func_start sub_8075224
sub_8075224: @ 0x08075224
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	bl ResetTextFont
	ldr r1, _08075258 @ =gBg0Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	movs r1, #1
	movs r2, #1
	bl sub_80747F4
	movs r0, #0
	str r0, [r7, #4]
_0807524E:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _0807525C
	b _08075278
	.align 2, 0
_08075258: .4byte gBg0Tm
_0807525C:
	ldr r1, [r7]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #4]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	movs r2, #1
	bl sub_8074968
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807524E
_08075278:
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrh r1, [r0, #0x32]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _080753E0 @ =0x0000FF70
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x32]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080753E4 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080753E8 @ =gManimSt
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r0, [r7]
	movs r3, #0x32
	ldrsh r2, [r0, r3]
	movs r0, #0x20
	subs r3, r0, r2
	ldr r0, _080753EC @ =0x00001042
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	bl StartFace
	ldr r1, _080753F0 @ =gFaces
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #3
	movs r2, #1
	ldr r3, [r7]
	bl sub_8074C70
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753E0: .4byte 0x0000FF70
_080753E4: .4byte gDispIo
_080753E8: .4byte gManimSt
_080753EC: .4byte 0x00001042
_080753F0: .4byte gFaces

	thumb_func_start sub_80753F4
sub_80753F4: @ 0x080753F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x54]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807540C
sub_807540C: @ 0x0807540C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075434 @ =gUnk_083F9AF0
	str r0, [r7, #8]
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x54]
	adds r1, r2, #1
	str r1, [r0, #0x54]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	movs r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08075438
	b _08075494
	.align 2, 0
_08075434: .4byte gUnk_083F9AF0
_08075438:
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	asrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	adds r2, #0x10
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	adds r1, #0x12
	movs r2, #0xe
	bl ApplyPaletteExt
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, [r7, #8]
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x40
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	adds r2, #0x11
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	adds r1, #0x12
	movs r2, #0xe
	bl ApplyPaletteExt
_08075494:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807549C
sub_807549C: @ 0x0807549C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	adds r1, r2, #0
	adds r1, #8
	ldrh r2, [r0, #0x32]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x32]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r1, _0807550C @ =gFaces
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	ldr r0, [r7]
	movs r2, #0x32
	ldrsh r1, [r0, r2]
	movs r0, #0x30
	cmn r1, r0
	blt _08075504
	ldr r0, [r7]
	bl Proc_Break
_08075504:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807550C: .4byte gFaces

	thumb_func_start sub_8075510
sub_8075510: @ 0x08075510
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	adds r1, r2, #0
	subs r1, #8
	ldrh r2, [r0, #0x32]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x32]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r1, _08075580 @ =gFaces
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	ldr r0, [r7]
	movs r2, #0x32
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	cmn r1, r0
	bgt _08075578
	ldr r0, [r7]
	bl Proc_Break
_08075578:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075580: .4byte gFaces

	thumb_func_start sub_8075584
sub_8075584: @ 0x08075584
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0
	beq _080755C0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x31
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x31
	ldrb r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _080756BA
_080755C0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	str r0, [r7, #4]
_080755CA:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _080755D2
	b _080755F0
_080755D2:
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_80749F0
	cmp r0, #0
	beq _080755E8
	b _080755F0
_080755E8:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080755CA
_080755F0:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _080755FE
	ldr r0, [r7]
	bl Proc_Break
	b _080756BA
_080755FE:
	ldr r1, [r7]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #4]
	movs r1, #1
	str r1, [sp]
	movs r1, #1
	movs r2, #1
	bl sub_8074968
	movs r0, #1
	bl EnableBgSync
	ldr r0, _080756C4 @ =gUnk_08D65CF4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r4, r1, #0
	adds r4, #0x3e
	ldr r0, _080756C4 @ =gUnk_08D65CF4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	adds r2, r1, #0
	lsls r0, r2, #3
	ldr r1, [r7]
	movs r3, #0x32
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	subs r1, #0x17
	subs r5, r0, r1
	ldr r6, [r7, #4]
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_80749F0
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8074D50
	ldr r1, _080756C8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08075686
	ldr r1, _080756CC @ =0x00000396
	adds r0, r1, #0
	bl m4aSongNumStart
_08075686:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	adds r1, r2, #1
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_080756BA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080756C4: .4byte gUnk_08D65CF4
_080756C8: .4byte gPlaySt
_080756CC: .4byte 0x00000396

	thumb_func_start sub_80756D0
sub_80756D0: @ 0x080756D0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x10
	ldr r3, [r7]
	bl StartBgmVolumeChange
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80756F0
sub_80756F0: @ 0x080756F0
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08075844 @ =gUnk_083F9CB8
	ldr r1, _08075848 @ =0x06013800
	bl Decompress
	ldr r0, _0807584C @ =gUnk_083F9ECC
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _08075850 @ =gManimSt
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x10
	str r0, [r7, #4]
	ldr r0, _08075850 @ =gManimSt
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	subs r0, #8
	str r0, [r7, #8]
	ldr r0, _08075850 @ =gManimSt
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #3
	bgt _080757AA
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7, #8]
_080757AA:
	ldr r0, _08075850 @ =gManimSt
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #3
	bgt _080757DC
	movs r0, #0x30
	str r0, [r7, #4]
_080757DC:
	ldr r0, _08075850 @ =gManimSt
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075854 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #0x19
	ble _0807580E
	movs r0, #0xd0
	str r0, [r7, #4]
_0807580E:
	ldr r0, _08075858 @ =gUnk_083F2F90
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	movs r3, #0xc7
	lsls r3, r3, #6
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, _0807585C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807583C
	ldr r1, _08075860 @ =0x0000037B
	adds r0, r1, #0
	bl m4aSongNumStart
_0807583C:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075844: .4byte gUnk_083F9CB8
_08075848: .4byte 0x06013800
_0807584C: .4byte gUnk_083F9ECC
_08075850: .4byte gManimSt
_08075854: .4byte gBmSt
_08075858: .4byte gUnk_083F2F90
_0807585C: .4byte gPlaySt
_08075860: .4byte 0x0000037B

	thumb_func_start sub_8075864
sub_8075864: @ 0x08075864
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075878
sub_8075878: @ 0x08075878
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	ldr r3, [r7]
	bl StartBgmVolumeChange
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075898
sub_8075898: @ 0x08075898
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ClearTalk
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80758AC
sub_80758AC: @ 0x080758AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080758CC
	ldr r1, _080758C8 @ =gUnk_08D65E54
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _080758D6
	.align 2, 0
_080758C8: .4byte gUnk_08D65E54
_080758CC:
	ldr r1, _080758E0 @ =gUnk_08D65E54
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_080758D6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080758E0: .4byte gUnk_08D65E54

	thumb_func_start sub_80758E4
sub_80758E4: @ 0x080758E4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075904 @ =gPal + 0xc0
	ldr r1, _08075908 @ =0x030048B0
	movs r2, #0x50
	bl CpuFastSet
	movs r0, #0
	str r0, [r7, #4]
_080758FA:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _0807590C
	b _08075930
	.align 2, 0
_08075904: .4byte gPal + 0xc0
_08075908: .4byte 0x030048B0
_0807590C:
	ldr r0, _0807592C @ =gUnk_08C01CEC
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0x3c
	ldr r3, [r7]
	bl StartPalFade
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xf
	bl sub_8014090
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080758FA
	.align 2, 0
_0807592C: .4byte gUnk_08C01CEC
_08075930:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075938
sub_8075938: @ 0x08075938
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _08075958
	ldr r1, _08075954 @ =gUnk_08D65E6C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _08075962
	.align 2, 0
_08075954: .4byte gUnk_08D65E6C
_08075958:
	ldr r1, _0807596C @ =gUnk_08D65E6C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_08075962:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807596C: .4byte gUnk_08D65E6C

	thumb_func_start sub_8075970
sub_8075970: @ 0x08075970
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_0807597C:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _08075984
	b _080759A8
_08075984:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #5
	ldr r1, _080759A4 @ =0x030048B0
	adds r0, r0, r1
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0xf
	ldr r3, [r7]
	bl StartPalFade
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807597C
	.align 2, 0
_080759A4: .4byte 0x030048B0
_080759A8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80759B0
sub_80759B0: @ 0x080759B0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080759C4 @ =gUnk_08D65E84
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080759C4: .4byte gUnk_08D65E84

	thumb_func_start sub_80759C8
sub_80759C8: @ 0x080759C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80759E8
sub_80759E8: @ 0x080759E8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl SetBgOffset
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	ble _08075A90
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	bl Proc_Break
_08075A90:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075A98
sub_8075A98: @ 0x08075A98
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075AB8 @ =gUnk_083FBC04
	ldr r1, _08075ABC @ =0x06013800
	bl Decompress
	ldr r0, _08075AC0 @ =gUnk_083FBC24
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075AB8: .4byte gUnk_083FBC04
_08075ABC: .4byte 0x06013800
_08075AC0: .4byte gUnk_083FBC24

	thumb_func_start sub_8075AC4
sub_8075AC4: @ 0x08075AC4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	movs r1, #4
	cmn r0, r1
	bge _08075AD8
	b _08075B0A
_08075AD8:
	ldr r0, [r7]
	cmp r0, #0xeb
	ble _08075AE0
	b _08075B0A
_08075AE0:
	ldr r0, [r7, #4]
	movs r1, #4
	cmn r0, r1
	bge _08075AEA
	b _08075B0A
_08075AEA:
	ldr r0, [r7, #4]
	cmp r0, #0x9b
	ble _08075AF2
	b _08075B0A
_08075AF2:
	ldr r1, [r7]
	subs r0, r1, #4
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	ldr r2, [r7, #4]
	subs r1, r2, #4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08075B14 @ =Sprite_8x8
	ldr r3, _08075B18 @ =0x000041C0
	bl PutOamHiRam
_08075B0A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075B14: .4byte Sprite_8x8
_08075B18: .4byte 0x000041C0

	thumb_func_start sub_8075B1C
sub_8075B1C: @ 0x08075B1C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08075B78 @ =gSinLut
	ldr r1, [r7, #0xc]
	movs r2, #0xff
	ands r1, r2
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r1, r0, #0xc
	ldr r2, [r7]
	adds r0, r1, r2
	ldr r1, _08075B78 @ =gSinLut
	ldr r2, [r7, #0xc]
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	adds r3, #0x40
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	asrs r2, r1, #0xc
	ldr r3, [r7, #4]
	adds r1, r2, r3
	bl sub_8075AC4
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075B78: .4byte gSinLut

	thumb_func_start sub_8075B7C
sub_8075B7C: @ 0x08075B7C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl sub_8075A98
	movs r0, #0
	str r0, [r7, #4]
_08075B8C:
	ldr r0, [r7, #4]
	cmp r0, #0xf
	ble _08075B94
	b _08075BE0
_08075B94:
	ldr r0, _08075BDC @ =0x03004830
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08075BDC @ =0x03004830
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	lsls r1, r2, #4
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08075B8C
	.align 2, 0
_08075BDC: .4byte 0x03004830
_08075BE0:
	ldr r0, [r7]
	ldrh r1, [r0, #0x36]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x36]
	ldr r0, [r7]
	ldrh r1, [r0, #0x38]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x38]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0x3a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0x3c]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x3a]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075C18
sub_8075C18: @ 0x08075C18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	movs r3, #0x30
	ldrsh r2, [r0, r3]
	ldr r0, [r7]
	ldrh r3, [r0, #0x3a]
	ldr r0, [r7]
	ldrh r4, [r0, #0x3e]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	lsls r1, r0, #4
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x36]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	asrs r2, r1, #0x1f
	lsrs r3, r2, #0x1f
	adds r2, r1, r3
	asrs r1, r2, #1
	ldrh r2, [r0, #0x38]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x38]
	movs r0, #0
	str r0, [r7, #4]
_08075C74:
	ldr r0, [r7, #4]
	cmp r0, #0xf
	ble _08075C7C
	b _08075CC0
_08075C7C:
	ldr r1, [r7]
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	ldrh r2, [r3, #0x36]
	ldr r3, _08075CBC @ =0x03004830
	ldr r4, [r7, #4]
	adds r5, r4, #0
	lsls r4, r5, #3
	adds r3, r3, r4
	ldrh r4, [r3]
	adds r3, r2, r4
	asrs r2, r3, #4
	ldr r4, [r7]
	ldrh r3, [r4, #0x38]
	ldr r4, _08075CBC @ =0x03004830
	ldr r5, [r7, #4]
	adds r6, r5, #0
	lsls r5, r6, #3
	adds r4, r4, r5
	ldrh r5, [r4, #2]
	adds r4, r3, r5
	asrs r3, r4, #4
	bl sub_8075B1C
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08075C74
	.align 2, 0
_08075CBC: .4byte 0x03004830
_08075CC0:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x3a]
	adds r1, r2, #1
	ldrh r2, [r0, #0x3a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x3a]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r0, [r0, #0x3a]
	ldrh r1, [r2]
	cmp r0, r1
	bls _08075CF0
	ldr r0, [r7]
	bl Proc_Break
_08075CF0:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075CF8
sub_8075CF8: @ 0x08075CF8
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, _08075DAC @ =gUnk_08D65E9C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrh r2, [r0, #0x30]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x1c]
	adds r1, r2, #0
	ldrh r2, [r0, #0x3c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x3c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x20]
	adds r1, r2, #0
	ldrh r2, [r0, #0x3e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x3e]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x24]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075DAC: .4byte gUnk_08D65E9C

	thumb_func_start sub_8075DB0
sub_8075DB0: @ 0x08075DB0
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0x28
	str r0, [sp, #8]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0xc8
	bl sub_8075CF8
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075DDC
sub_8075DDC: @ 0x08075DDC
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0x37
	str r0, [sp, #8]
	ldr r0, [r7]
	movs r2, #0xc8
	movs r3, #1
	bl sub_8075CF8
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075E08
sub_8075E08: @ 0x08075E08
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075E18 @ =gManimSt
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _08075E20
	ldr r0, _08075E1C @ =gUnk_08D65ECC
	b _08075E2C
	.align 2, 0
_08075E18: .4byte gManimSt
_08075E1C: .4byte gUnk_08D65ECC
_08075E20:
	ldr r0, _08075E28 @ =gManimSt
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	b _08075E2C
	.align 2, 0
_08075E28: .4byte gManimSt
_08075E2C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8075E34
sub_8075E34: @ 0x08075E34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075E64 @ =gManimSt
	ldr r2, _08075E64 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E4A0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075E64: .4byte gManimSt

	thumb_func_start sub_8075E68
sub_8075E68: @ 0x08075E68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075E98 @ =gManimSt
	ldr r2, _08075E98 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E51C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075E98: .4byte gManimSt

	thumb_func_start sub_8075E9C
sub_8075E9C: @ 0x08075E9C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075ED0 @ =gManimSt
	ldr r2, _08075ED0 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r1, [r0, #4]
	cmp r1, #0x40
	bne _08075ED8
	ldr r1, _08075ED4 @ =sub_8075F68
	adds r0, r1, #0
	movs r1, #9
	bl sub_8014FB0
	b _08075EE2
	.align 2, 0
_08075ED0: .4byte gManimSt
_08075ED4: .4byte sub_8075F68
_08075ED8:
	ldr r1, _08075F60 @ =sub_8075FAC
	adds r0, r1, #0
	movs r1, #0xc
	bl sub_8014FB0
_08075EE2:
	ldr r0, _08075F64 @ =gManimSt
	ldr r2, _08075F64 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _08075F64 @ =gManimSt
	ldr r2, _08075F64 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _08075F64 @ =gManimSt
	ldr r2, _08075F64 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #5
	bl SetSpriteAnimId
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075F60: .4byte sub_8075FAC
_08075F64: .4byte gManimSt

	thumb_func_start sub_8075F68
sub_8075F68: @ 0x08075F68
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08075FA0 @ =0x000002D5
	ldr r1, _08075FA4 @ =gManimSt
	ldr r3, _08075FA4 @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075FA8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FA0: .4byte 0x000002D5
_08075FA4: .4byte gManimSt
_08075FA8: .4byte gBmSt

	thumb_func_start sub_8075FAC
sub_8075FAC: @ 0x08075FAC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08075FE4 @ =0x000002D6
	ldr r1, _08075FE8 @ =gManimSt
	ldr r3, _08075FE8 @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075FEC @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FE4: .4byte 0x000002D6
_08075FE8: .4byte gManimSt
_08075FEC: .4byte gBmSt

	thumb_func_start sub_8075FF0
sub_8075FF0: @ 0x08075FF0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076048 @ =gManimSt
	ldr r2, _08076048 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _08076048 @ =gManimSt
	ldr r2, _08076048 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076048: .4byte gManimSt

	thumb_func_start sub_807604C
sub_807604C: @ 0x0807604C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807607C @ =gManimSt
	ldr r2, _0807607C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E5C0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807607C: .4byte gManimSt

	thumb_func_start sub_8076080
sub_8076080: @ 0x08076080
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r4, [r7, #4]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _080760DA
	adds r3, r0, #0
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4c
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _080760D8
	subs r3, #0x10
_080760D8:
	b _080760E0
_080760DA:
	adds r4, r0, #0
	adds r4, #0x10
	adds r3, r4, #0
_080760E0:
	adds r4, r2, #0
	adds r2, #0x4c
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r3, #0
	ldrsh r1, [r4, r3]
	ldr r4, [r7, #4]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _08076142
	adds r3, r1, #0
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4e
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08076140
	subs r3, #0x10
_08076140:
	b _08076148
_08076142:
	adds r4, r1, #0
	adds r4, #0x10
	adds r3, r4, #0
_08076148:
	adds r4, r2, #0
	adds r2, #0x4e
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076164
sub_8076164: @ 0x08076164
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _080761BE
	adds r3, r0, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4c
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _080761BC
	subs r3, #0x10
_080761BC:
	b _080761C4
_080761BE:
	adds r4, r0, #0
	adds r4, #0x10
	adds r3, r4, #0
_080761C4:
	adds r4, r2, #0
	adds r2, #0x4c
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r3, #0
	ldrsh r1, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _08076226
	adds r3, r1, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4e
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08076224
	subs r3, #0x10
_08076224:
	b _0807622C
_08076226:
	adds r4, r1, #0
	adds r4, #0x10
	adds r3, r4, #0
_0807622C:
	adds r4, r2, #0
	adds r2, #0x4e
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076248
sub_8076248: @ 0x08076248
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _080762C8 @ =gManimSt
	ldr r2, _080762C8 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #4]
	ldr r0, _080762C8 @ =gManimSt
	ldr r2, _080762C8 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076080
	ldr r1, _080762C8 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080762C0
	ldr r0, _080762C8 @ =gManimSt
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076080
	ldr r0, _080762C8 @ =gManimSt
	ldr r1, [r0, #0x44]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076080
_080762C0:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080762C8: .4byte gManimSt

	thumb_func_start sub_80762CC
sub_80762CC: @ 0x080762CC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807634C @ =gManimSt
	ldr r2, _0807634C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #4]
	ldr r0, _0807634C @ =gManimSt
	ldr r2, _0807634C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076164
	ldr r1, _0807634C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08076344
	ldr r0, _0807634C @ =gManimSt
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076164
	ldr r0, _0807634C @ =gManimSt
	ldr r1, [r0, #0x44]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_8076164
_08076344:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807634C: .4byte gManimSt

	thumb_func_start sub_8076350
sub_8076350: @ 0x08076350
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807639C @ =gManimSt
	ldr r2, _0807639C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0807639C @ =gManimSt
	ldr r3, _0807639C @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807639C: .4byte gManimSt

	thumb_func_start sub_80763A0
sub_80763A0: @ 0x080763A0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080763EC @ =gManimSt
	ldr r2, _080763EC @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _080763EC @ =gManimSt
	ldr r3, _080763EC @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080763EC: .4byte gManimSt

	thumb_func_start sub_80763F0
sub_80763F0: @ 0x080763F0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076458 @ =gManimSt
	ldr r1, _0807645C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076458 @ =gManimSt
	ldr r1, _0807645C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x74
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _08076458 @ =gManimSt
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r2, _08076458 @ =gManimSt
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x61
	ldrb r2, [r3]
	ldr r0, [r7]
	bl sub_801615C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076458: .4byte gManimSt
_0807645C: .4byte gBattleTarget

	thumb_func_start sub_8076460
sub_8076460: @ 0x08076460
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076494 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #8]
	ldr r1, _08076494 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08076498
	ldr r1, _08076494 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #0xc]
	b _080764A2
	.align 2, 0
_08076494: .4byte gManimSt
_08076498:
	ldr r1, _080764F8 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x59
	ldrb r0, [r1]
	str r0, [r7, #0xc]
_080764A2:
	ldr r0, _080764F8 @ =gManimSt
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C208
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080764FC
	ldr r1, _080764F8 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080764F6
	ldr r0, _080764F8 @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071C10
_080764F6:
	b _0807680E
	.align 2, 0
_080764F8: .4byte gManimSt
_080764FC:
	ldr r0, _08076560 @ =gManimSt
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, _08076560 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl sub_8076820
	ldr r1, _08076560 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08076550
	ldr r0, [r7, #8]
	ldr r2, _08076560 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r2, r1, #0
	adds r1, r2, #0
	bl sub_8076820
_08076550:
	ldr r1, _08076560 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08076564
	b _0807680E
	.align 2, 0
_08076560: .4byte gManimSt
_08076564:
	ldr r1, _080765B8 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080765C0
	ldr r0, _080765B8 @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _080765BC @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xc8
	bl sub_80151FC
	ldr r0, _080765B8 @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071C10
	b _0807680E
	.align 2, 0
_080765B8: .4byte gManimSt
_080765BC: .4byte gBmSt
_080765C0:
	ldr r1, _0807660C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08076618
	ldr r0, _08076610 @ =0x000002CE
	ldr r1, _0807660C @ =gManimSt
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08076614 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	ldr r0, _0807660C @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071C8C
	b _0807680E
	.align 2, 0
_0807660C: .4byte gManimSt
_08076610: .4byte 0x000002CE
_08076614: .4byte gBmSt
_08076618:
	movs r0, #0
	ldr r1, _08076658 @ =gManimSt
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x1b
	beq _0807665C
	ldr r1, _08076658 @ =gManimSt
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x33
	beq _0807665C
	b _0807665E
	.align 2, 0
_08076658: .4byte gManimSt
_0807665C:
	movs r0, #1
_0807665E:
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080766C4
	ldr r1, _0807669C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080766A0
	movs r0, #0xaf
	str r0, [r7, #4]
	ldr r0, _0807669C @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #1
	bl sub_8071D08
	b _080766BC
	.align 2, 0
_0807669C: .4byte gManimSt
_080766A0:
	movs r0, #0xb0
	str r0, [r7, #4]
	ldr r0, _080766C0 @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0
	bl sub_8071D08
_080766BC:
	b _080766E8
	.align 2, 0
_080766C0: .4byte gManimSt
_080766C4:
	ldr r1, _080766E0 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _080766E4
	movs r0, #0xd5
	str r0, [r7, #4]
	b _080766E8
	.align 2, 0
_080766E0: .4byte gManimSt
_080766E4:
	movs r0, #0xd2
	str r0, [r7, #4]
_080766E8:
	ldr r1, _080767A4 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080767AC
	ldr r0, [r7, #4]
	ldr r1, _080767A4 @ =gManimSt
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _080767A8 @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	ldr r0, _080767A4 @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _080767A4 @ =gManimSt
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C228
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl sub_806E630
	bl sub_80759B0
	ldr r0, _080767A4 @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _080767A8 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xd8
	bl sub_80151FC
	ldr r0, _080767A4 @ =gManimSt
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E5C0
	b _0807680E
	.align 2, 0
_080767A4: .4byte gManimSt
_080767A8: .4byte gBmSt
_080767AC:
	ldr r0, [r7, #4]
	ldr r1, _08076818 @ =gManimSt
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _0807681C @ =gBmSt
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_80151FC
	ldr r0, _08076818 @ =gManimSt
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _08076818 @ =gManimSt
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C228
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl sub_806E840
_0807680E:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076818: .4byte gManimSt
_0807681C: .4byte gBmSt

	thumb_func_start sub_8076820
sub_8076820: @ 0x08076820
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0807685C @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xd]
	ldr r0, [r7, #4]
	cmp r1, r0
	bgt _08076860
	ldr r0, _0807685C @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xd]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xd]
	b _08076894
	.align 2, 0
_0807685C: .4byte gManimSt
_08076860:
	ldr r0, _080768F0 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080768F0 @ =gManimSt
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrb r3, [r1, #0xd]
	subs r1, r3, r2
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
_08076894:
	ldr r0, _080768F0 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080768F0 @ =gManimSt
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r0, [r0, #0xd]
	ldrb r1, [r1, #0xc]
	cmp r0, r1
	bls _080768E6
	ldr r0, _080768F0 @ =gManimSt
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080768F0 @ =gManimSt
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #0xc]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
_080768E6:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080768F0: .4byte gManimSt

	thumb_func_start sub_80768F4
sub_80768F4: @ 0x080768F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0807690C @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08076910
	b _08076916
	.align 2, 0
_0807690C: .4byte gManimSt
_08076910:
	ldr r0, [r7]
	bl Proc_Break
_08076916:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076920
sub_8076920: @ 0x08076920
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807694C @ =gManimSt
	ldr r2, _0807694C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071DF8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807694C: .4byte gManimSt

	thumb_func_start sub_8076950
sub_8076950: @ 0x08076950
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807697C @ =gManimSt
	ldr r2, _0807697C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8073D3C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807697C: .4byte gManimSt

	thumb_func_start sub_8076980
sub_8076980: @ 0x08076980
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080769AC @ =gManimSt
	ldr r2, _080769AC @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8074064
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769AC: .4byte gManimSt

	thumb_func_start sub_80769B0
sub_80769B0: @ 0x080769B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080769DC @ =gManimSt
	ldr r2, _080769DC @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8071ECC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769DC: .4byte gManimSt

	thumb_func_start sub_80769E0
sub_80769E0: @ 0x080769E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076A10 @ =gManimSt
	ldr r2, _08076A10 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076A14 @ =gUnk_083FBC64
	ldr r2, _08076A18 @ =gUnk_083FCD90
	bl sub_8072638
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A10: .4byte gManimSt
_08076A14: .4byte gUnk_083FBC64
_08076A18: .4byte gUnk_083FCD90

	thumb_func_start sub_8076A1C
sub_8076A1C: @ 0x08076A1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076A4C @ =gManimSt
	ldr r2, _08076A4C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076A50 @ =gUnk_083FBC64
	ldr r2, _08076A54 @ =gUnk_083FCD70
	bl sub_8072638
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A4C: .4byte gManimSt
_08076A50: .4byte gUnk_083FBC64
_08076A54: .4byte gUnk_083FCD70

	thumb_func_start sub_8076A58
sub_8076A58: @ 0x08076A58
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076A88 @ =gManimSt
	ldr r2, _08076A88 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076A8C @ =gUnk_083FD11C
	ldr r2, _08076A90 @ =gUnk_083FD3D8
	movs r3, #0x8b
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A88: .4byte gManimSt
_08076A8C: .4byte gUnk_083FD11C
_08076A90: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076A94
sub_8076A94: @ 0x08076A94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076AC4 @ =gManimSt
	ldr r2, _08076AC4 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076AC8 @ =gUnk_083FCDB0
	ldr r2, _08076ACC @ =gUnk_083FD3D8
	movs r3, #0x89
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076AC4: .4byte gManimSt
_08076AC8: .4byte gUnk_083FCDB0
_08076ACC: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076AD0
sub_8076AD0: @ 0x08076AD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076B00 @ =gManimSt
	ldr r2, _08076B00 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076B04 @ =gUnk_083FCF24
	ldr r2, _08076B08 @ =gUnk_083FD3D8
	movs r3, #0x8a
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B00: .4byte gManimSt
_08076B04: .4byte gUnk_083FCF24
_08076B08: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076B0C
sub_8076B0C: @ 0x08076B0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076B3C @ =gManimSt
	ldr r2, _08076B3C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076B40 @ =gUnk_083FD11C
	ldr r2, _08076B44 @ =gUnk_083FD3D8
	movs r3, #0x8b
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B3C: .4byte gManimSt
_08076B40: .4byte gUnk_083FD11C
_08076B44: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076B48
sub_8076B48: @ 0x08076B48
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076B78 @ =gManimSt
	ldr r2, _08076B78 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076B7C @ =gUnk_083FCDB0
	ldr r2, _08076B80 @ =gUnk_083FD3D8
	movs r3, #0x89
	bl sub_8072910
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B78: .4byte gManimSt
_08076B7C: .4byte gUnk_083FCDB0
_08076B80: .4byte gUnk_083FD3D8

	thumb_func_start sub_8076B84
sub_8076B84: @ 0x08076B84
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076C34 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08076BA2
	movs r0, #0xb4
	bl m4aSongNumStart
_08076BA2:
	ldr r0, _08076C38 @ =gManimSt
	ldr r1, _08076C3C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076C38 @ =gManimSt
	ldr r1, _08076C3C @ =gBattleTarget
	adds r2, r1, #0
	adds r1, #0x74
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076C38 @ =gManimSt
	ldr r2, _08076C38 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076C38 @ =gManimSt
	ldr r3, _08076C38 @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08076C38 @ =gManimSt
	ldr r4, _08076C38 @ =gManimSt
	adds r3, r4, #0
	adds r4, #0x59
	ldrb r3, [r4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	bl sub_8072EAC
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076C34: .4byte gPlaySt
_08076C38: .4byte gManimSt
_08076C3C: .4byte gBattleTarget

	thumb_func_start sub_8076C40
sub_8076C40: @ 0x08076C40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076C7C @ =gManimSt
	ldr r2, _08076C7C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r2, _08076C7C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r3, _08076C7C @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x61
	ldrb r2, [r3]
	bl sub_8072EAC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076C7C: .4byte gManimSt

	thumb_func_start sub_8076C80
sub_8076C80: @ 0x08076C80
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076CAC @ =gManimSt
	ldr r2, _08076CAC @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8073084
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076CAC: .4byte gManimSt

	thumb_func_start sub_8076CB0
sub_8076CB0: @ 0x08076CB0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076CD4 @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	ldr r2, _08076CD4 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	bl sub_8074240
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076CD4: .4byte gManimSt

	thumb_func_start sub_8076CD8
sub_8076CD8: @ 0x08076CD8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D04 @ =gManimSt
	ldr r2, _08076D04 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_807340C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D04: .4byte gManimSt

	thumb_func_start sub_8076D08
sub_8076D08: @ 0x08076D08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D34 @ =gManimSt
	ldr r2, _08076D34 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_807384C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D34: .4byte gManimSt

	thumb_func_start sub_8076D38
sub_8076D38: @ 0x08076D38
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D64 @ =gManimSt
	ldr r2, _08076D64 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_8073984
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D64: .4byte gManimSt

	thumb_func_start sub_8076D68
sub_8076D68: @ 0x08076D68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076D94 @ =gManimSt
	ldr r2, _08076D94 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_80734FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D94: .4byte gManimSt

	thumb_func_start sub_8076D98
sub_8076D98: @ 0x08076D98
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076DC8 @ =gManimSt
	ldr r2, _08076DC8 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	movs r1, #0
	bl sub_806E380
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076DC8: .4byte gManimSt

	thumb_func_start sub_8076DCC
sub_8076DCC: @ 0x08076DCC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076DFC @ =gManimSt
	ldr r2, _08076DFC @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E400
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076DFC: .4byte gManimSt

	thumb_func_start sub_8076E00
sub_8076E00: @ 0x08076E00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076E30 @ =gManimSt
	ldr r2, _08076E30 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E2A0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076E30: .4byte gManimSt

	thumb_func_start sub_8076E34
sub_8076E34: @ 0x08076E34
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076EA0 @ =gManimSt
	ldr r2, _08076EA0 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08076EA4 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08076EA0 @ =gManimSt
	ldr r3, _08076EA0 @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08076EA4 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	bl sub_8075DB0
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076EA0: .4byte gManimSt
_08076EA4: .4byte gBmSt

	thumb_func_start sub_8076EA8
sub_8076EA8: @ 0x08076EA8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076F28 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08076EC6
	movs r0, #0xb5
	bl m4aSongNumStart
_08076EC6:
	ldr r0, _08076F2C @ =gManimSt
	ldr r2, _08076F2C @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08076F30 @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _08076F2C @ =gManimSt
	ldr r3, _08076F2C @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08076F30 @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	bl sub_8075DDC
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076F28: .4byte gPlaySt
_08076F2C: .4byte gManimSt
_08076F30: .4byte gBmSt

	thumb_func_start sub_8076F34
sub_8076F34: @ 0x08076F34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076F64 @ =gManimSt
	ldr r2, _08076F64 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_806E2C8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076F64: .4byte gManimSt

	thumb_func_start sub_8076F68
sub_8076F68: @ 0x08076F68
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076FF8 @ =gManimSt
	ldr r2, _08076FF8 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, _08076FF8 @ =gManimSt
	ldr r2, _08076FF8 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r2, _08076FF8 @ =gManimSt
	adds r1, r2, #0
	adds r2, #0x60
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r3, _08076FF8 @ =gManimSt
	adds r2, r3, #0
	adds r3, #0x61
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #4
	bl SetMuScreenPosition
	ldr r0, [r7, #4]
	ldr r1, _08076FF8 @ =gManimSt
	adds r2, r1, #0
	adds r1, #0x60
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x10]
	ldr r0, [r7, #4]
	ldr r1, _08076FF8 @ =gManimSt
	adds r2, r1, #0
	adds r1, #0x61
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x11]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076FF8: .4byte gManimSt

	thumb_func_start sub_8076FFC
sub_8076FFC: @ 0x08076FFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_80758AC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8077014
sub_8077014: @ 0x08077014
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8075938
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
