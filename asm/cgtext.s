	.include "macro.inc"
	.syntax unified

	thumb_func_start SetCgTextFlags
SetCgTextFlags: @ 0x08087E2C
	ldr r3, _08087E3C @ =0x0203E710
	lsls r0, r0, #0xa
	ldr r1, [r3, #0x48]
	ldr r2, _08087E40 @ =0x000003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x48]
	bx lr
	.align 2, 0
_08087E3C: .4byte 0x0203E710
_08087E40: .4byte 0x000003FF

	thumb_func_start SetCgTextFlag
SetCgTextFlag: @ 0x08087E44
	push {r4, lr}
	ldr r4, _08087E64 @ =0x0203E710
	ldr r3, [r4, #0x48]
	lsrs r2, r3, #0xa
	ldr r1, _08087E68 @ =0x003FFFFF
	ands r1, r0
	orrs r2, r1
	lsls r2, r2, #0xa
	ldr r0, _08087E6C @ =0x000003FF
	ands r0, r3
	orrs r0, r2
	str r0, [r4, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E64: .4byte 0x0203E710
_08087E68: .4byte 0x003FFFFF
_08087E6C: .4byte 0x000003FF

	thumb_func_start ClearCgTextFlag
ClearCgTextFlag: @ 0x08087E70
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _08087E8C @ =0x003FFFFF
	eors r0, r4
	ands r0, r1
	bl SetCgTextFlags
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E8C: .4byte 0x003FFFFF

	thumb_func_start GetCgTextFlags
GetCgTextFlags: @ 0x08087E90
	ldr r0, _08087E98 @ =0x0203E710
	ldr r0, [r0, #0x48]
	lsrs r0, r0, #0xa
	bx lr
	.align 2, 0
_08087E98: .4byte 0x0203E710

	thumb_func_start SetCgTextBlendControl
SetCgTextBlendControl: @ 0x08087E9C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x20
	orrs r1, r2
	ldr r2, _08087EB8 @ =0x0203E710
	lsls r1, r1, #8
	adds r1, #0x40
	adds r0, r0, r1
	adds r2, #0x4c
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087EB8: .4byte 0x0203E710

	thumb_func_start GetCgTextBlendControl
GetCgTextBlendControl: @ 0x08087EBC
	ldr r0, _08087EC4 @ =0x0203E710
	adds r0, #0x4c
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08087EC4: .4byte 0x0203E710

	thumb_func_start sub_8087EC8
sub_8087EC8: @ 0x08087EC8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _08087EDC @ =0x0203E710
	lsrs r1, r1, #8
	adds r0, r0, r1
	adds r2, #0x4e
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087EDC: .4byte 0x0203E710

	thumb_func_start sub_8087EE0
sub_8087EE0: @ 0x08087EE0
	ldr r0, _08087EE8 @ =0x0203E710
	adds r0, #0x4e
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08087EE8: .4byte 0x0203E710

	thumb_func_start sub_8087EEC
sub_8087EEC: @ 0x08087EEC
	push {r4, r5, lr}
	ldr r0, _08087F4C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa0
	bls _08087EFE
	movs r4, #0
_08087EFE:
	ldr r0, _08087F50 @ =0x0203E710
	adds r5, r0, #0
	adds r5, #0x48
	ldrb r1, [r5]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x18
	subs r0, #0x20
	cmp r4, r0
	bne _08087F20
	bl GetCgTextBlendControl
	ldr r1, _08087F54 @ =0x04000050
	strh r0, [r1]
	bl sub_8087EE0
	ldr r1, _08087F58 @ =0x04000052
	strh r0, [r1]
_08087F20:
	cmp r4, #0
	beq _08087F32
	ldrh r5, [r5]
	lsls r0, r5, #0x16
	lsrs r0, r0, #0x1b
	lsls r0, r0, #3
	adds r0, #4
	cmp r4, r0
	bne _08087F46
_08087F32:
	ldr r2, _08087F54 @ =0x04000050
	ldr r1, _08087F5C @ =0x030027CC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_08087F46:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087F4C: .4byte 0x04000006
_08087F50: .4byte 0x0203E710
_08087F54: .4byte 0x04000050
_08087F58: .4byte 0x04000052
_08087F5C: .4byte 0x030027CC

	thumb_func_start sub_8087F60
sub_8087F60: @ 0x08087F60
	push {r4, r5, lr}
	sub sp, #0x40
	adds r3, r0, #0
	add r2, sp, #0x18
	ldr r1, [r3, #0x2c]
	adds r5, r2, #0
	ldrb r0, [r1]
	cmp r0, #0x80
	bne _08088006
	ldrb r0, [r1, #1]
	cmp r0, #0x23
	bne _08088006
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	add r4, sp, #0x38
	b _08087F90
_08087F80:
	ldr r1, [r3, #0x2c]
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	adds r2, #2
_08087F90:
	ldrb r1, [r1, #2]
	cmp r1, #1
	bne _08087F80
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #9
	bl SetCgTextFlag
	ldr r1, _08088010 @ =0x06017800
	mov r0, sp
	movs r2, #0x12
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	ldr r0, _08088014 @ =Pal_Text
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08088018 @ =gUnk_08198D78
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808801C @ =gUnk_08198CC8
	ldr r1, _08088020 @ =0x06017900
	bl Decompress
_08088006:
	add sp, #0x40
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088010: .4byte 0x06017800
_08088014: .4byte Pal_Text
_08088018: .4byte gUnk_08198D78
_0808801C: .4byte gUnk_08198CC8
_08088020: .4byte 0x06017900

	thumb_func_start sub_8088024
sub_8088024: @ 0x08088024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bl GetCgTextFlags
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0808805E
	bl GetCgTextFlags
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	subs r0, #1
	b _08088062
_0808805E:
	bl GetTextPrintDelay
_08088062:
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r2, #0x7f
	cmp r0, #0
	beq _08088074
	movs r2, #1
_08088074:
	adds r0, r6, #0
	adds r0, #0x53
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_8087F60
	adds r0, r6, #0
	adds r0, #0x5b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	movs r0, #0x5c
	adds r0, r0, r6
	mov sb, r0
	cmp r1, #0
	blt _080880A8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080880DA
_080880A8:
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r6, #0x2c]
	add r2, sp, #8
	add r1, sp, #4
	bl sub_8088884
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp, #4]
	adds r0, r1, #7
	cmp r0, #0
	bge _080880C8
	adds r0, #7
_080880C8:
	asrs r0, r0, #3
	strb r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _080880D4
	adds r0, #7
_080880D4:
	asrs r0, r0, #3
	mov r1, sb
	strb r0, [r1]
_080880DA:
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080880E8
	b _08088234
_080880E8:
	movs r2, #0x58
	adds r2, r2, r6
	mov r8, r2
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrb r5, [r2]
	subs r0, r5, r0
	subs r0, #1
	str r0, [sp, #0x10]
	bl GetCgTextFlags
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08088186
	adds r5, r6, #0
	adds r5, #0x57
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r5]
	subs r0, r1, r0
	subs r0, #2
	str r0, [sp, #0xc]
	bl GetCgTextFlags
	movs r2, #0xc0
	lsls r2, r2, #8
	mov sl, r2
	ands r0, r2
	lsrs r0, r0, #0xe
	movs r3, #0
	ldrsb r3, [r7, r3]
	ldrb r7, [r5]
	subs r1, r7, r3
	subs r1, #2
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r7, r8
	ldrb r2, [r7]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl sub_8009AA8
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080881F8
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #3
	cmp r1, #0
	beq _0808816A
	movs r4, #5
_0808816A:
	bl GetCgTextFlags
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	subs r1, #1
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl sub_8009920
	b _080881F8
_08088186:
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	adds r0, #1
	str r0, [sp, #0xc]
	bl GetCgTextFlags
	movs r1, #0xc0
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	adds r1, #1
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r3, r8
	ldrb r2, [r3]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	movs r3, #0
	ldrsb r3, [r7, r3]
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl sub_8009AA8
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080881F8
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #2
	cmp r1, #0
	beq _080881E0
	movs r4, #5
_080881E0:
	bl GetCgTextFlags
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl sub_8009920
_080881F8:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _0808822E
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	ldr r7, [sp, #0x10]
	lsls r1, r7, #6
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r1, #6
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
_0808822E:
	movs r0, #0xf
	bl EnableBgSync
_08088234:
	adds r0, r6, #0
	bl sub_8088834
	ldr r0, _080882A8 @ =sub_8088A20
	adds r1, r6, #0
	bl StartParallelWorker
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r5, #0
	cmp r0, #0
	blt _08088286
_0808825E:
	lsls r0, r5, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r4, r4, r0
	ldr r0, [r4]
	bl InitSpriteText
	ldr r0, [r4]
	movs r1, #0xb
	bl Text_SetColor
	adds r5, #1
	mov r7, sb
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	ble _0808825E
_08088286:
	adds r0, r6, #0
	bl sub_8088718
	movs r0, #0
	bl SetTextFont
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080882AC
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0808838C
	.align 2, 0
_080882A8: .4byte sub_8088A20
_080882AC:
	bl GetCgTextFlags
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _080882CA
	movs r0, #0x10
	movs r1, #1
	bl sub_8087EC8
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _080882D2
_080882CA:
	movs r0, #0
	movs r1, #0x10
	bl sub_8087EC8
_080882D2:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08088300
	ldr r4, _080882FC @ =0x0203E710
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #5
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r5, [r2]
	ands r0, r5
	b _0808831A
	.align 2, 0
_080882FC: .4byte 0x0203E710
_08088300:
	ldr r4, _080883B4 @ =0x0203E710
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
_0808831A:
	orrs r0, r1
	strb r0, [r2]
	mov r0, sb
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r3, #0x1f
	mov r8, r3
	mov r5, r8
	ands r1, r5
	lsls r1, r1, #5
	ldr r0, _080883B8 @ =0xFFFFFC1F
	ldrh r7, [r2]
	ands r0, r7
	orrs r0, r1
	strh r0, [r2]
	bl GetCgTextFlags
	movs r6, #0xc0
	lsls r6, r6, #8
	ands r0, r6
	lsrs r0, r0, #0xe
	movs r4, #1
	adds r5, r4, #0
	lsls r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetCgTextFlags
	ands r0, r6
	lsrs r0, r0, #0xe
	lsls r4, r0
	mov r0, r8
	eors r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetCgTextBlendControl
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _0808838C
	movs r0, #0
	bl SetOnHBlankB
	ldr r0, _080883BC @ =sub_8087EEC
	bl SetOnHBlankB
_0808838C:
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080883B4: .4byte 0x0203E710
_080883B8: .4byte 0xFFFFFC1F
_080883BC: .4byte sub_8087EEC

	thumb_func_start sub_80883C0
sub_80883C0: @ 0x080883C0
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80883C8
sub_80883C8: @ 0x080883C8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _080883E6
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _080883E8
_080883E6:
	movs r1, #1
_080883E8:
	adds r0, r2, #0
	bl sub_8087EC8
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _080883FE
	adds r0, r4, #0
	bl Proc_Break
_080883FE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8088404
sub_8088404: @ 0x08088404
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8088718
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	bl sub_80893E0
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08088438
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08088440
_08088438:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0x10
	strb r0, [r1]
_08088440:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08088458
	ldr r0, _08088460 @ =ProcScr_Face
	bl Proc_Find
	bl StartFaceFadeOut
_08088458:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088460: .4byte ProcScr_Face

	thumb_func_start sub_8088464
sub_8088464: @ 0x08088464
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _08088482
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08088484
_08088482:
	movs r1, #1
_08088484:
	adds r0, r2, #0
	bl sub_8087EC8
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0
	bne _080884A2
	movs r0, #0x80
	lsls r0, r0, #9
	bl ClearCgTextFlag
	adds r0, r4, #0
	bl Proc_Break
_080884A2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80884A8
sub_80884A8: @ 0x080884A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080884DC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080884D6
	bl GetCgTextFlags
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _080884D6
	bl sub_800EF98
	bl sub_80893E0
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080884D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080884DC: .4byte gpKeySt

	thumb_func_start sub_80884E0
sub_80884E0: @ 0x080884E0
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r1, [r1]
	subs r1, #1
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r4, #0x5c
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #1
	movs r1, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xf
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088520
sub_8088520: @ 0x08088520
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	adds r0, r4, #0
	bl sub_80884E0
	movs r0, #0
	bl SetOnHBlankB
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8088548
sub_8088548: @ 0x08088548
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8088718
	adds r0, r5, #0
	adds r0, #0x54
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	bl SetTextFontGlyphs
	adds r1, r5, #0
	adds r1, #0x59
	strb r4, [r1]
	adds r2, r5, #0
	adds r2, #0x5a
	strb r4, [r2]
	ldr r0, [r5, #0x2c]
	bl sub_80887B4
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl sub_80893BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartCgText
StartCgText: @ 0x08088584
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, _080885D8 @ =gUnk_08D8B5F4
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080885E6
	ldr r0, [sp, #0x2c]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl _080889FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080885C2
	bl sub_8013374
	str r0, [r4, #0x2c]
_080885C2:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _080885DC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080886B0
	.align 2, 0
_080885D8: .4byte gUnk_08D8B5F4
_080885DC:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080886B0
_080885E6:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _080885F6
	adds r0, r6, #0
	ldr r1, [sp, #0x38]
	bl Proc_StartBlocking
	b _080885FE
_080885F6:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Start
_080885FE:
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	bl SetCgTextFlags
	bl ClearAllTalkFlags
	ldr r0, _080886C0 @ =0x0203E710
	str r0, [r4, #0x30]
	adds r3, r4, #0
	adds r3, #0x57
	adds r6, r4, #0
	adds r6, #0x58
	movs r1, #0x5b
	adds r1, r1, r4
	mov ip, r1
	movs r1, #0x5c
	adds r1, r1, r4
	mov r8, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov sb, r1
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, #0x40
	adds r1, r4, #0
	adds r1, #0x48
_08088634:
	str r0, [r1]
	subs r0, #8
	subs r1, #4
	cmp r1, r2
	bge _08088634
	mov r0, sl
	strb r0, [r3]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r6]
	mov r0, sp
	ldrb r1, [r0, #4]
	mov r0, ip
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #8]
	mov r0, r8
	strb r1, [r0]
	str r7, [r4, #0x4c]
	cmp r5, #0
	bge _08088660
	movs r5, #5
_08088660:
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	cmp r7, #0
	bne _08088670
	ldr r7, _080886C4 @ =0x06013000
_08088670:
	ldr r0, [r4, #0x30]
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFont
	ldr r0, _080886C8 @ =gUnk_08190228
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r6
	lsls r1, r5, #0xc
	adds r0, r0, r1
	mov r1, sb
	strh r0, [r1]
	ldr r0, [sp, #0x2c]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl _080889FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080886B0
	bl sub_8013374
	str r0, [r4, #0x2c]
_080886B0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080886C0: .4byte 0x0203E710
_080886C4: .4byte 0x06013000
_080886C8: .4byte gUnk_08190228

	thumb_func_start EndCgText
EndCgText: @ 0x080886CC
	push {lr}
	ldr r0, _080886DC @ =gUnk_08D8B5F4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080886DC: .4byte gUnk_08D8B5F4

	thumb_func_start sub_80886E0
sub_80886E0: @ 0x080886E0
	push {lr}
	ldr r0, _080886F0 @ =gUnk_08D8B5F4
	bl Proc_Find
	cmp r0, #0
	bne _080886F4
	movs r0, #0
	b _080886F6
	.align 2, 0
_080886F0: .4byte gUnk_08D8B5F4
_080886F4:
	movs r0, #1
_080886F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80886FC
sub_80886FC: @ 0x080886FC
	push {lr}
	ldr r0, _08088714 @ =gUnk_08D8B5F4
	bl Proc_Find
	cmp r0, #0
	beq _0808870E
	movs r1, #0
	bl Proc_Goto
_0808870E:
	pop {r0}
	bx r0
	.align 2, 0
_08088714: .4byte gUnk_08D8B5F4

	thumb_func_start sub_8088718
sub_8088718: @ 0x08088718
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _0808875C
_08088736:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _08088736
_0808875C:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8088768
sub_8088768: @ 0x08088768
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _080887AC
_08088786:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl Text_SetCursor
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _08088786
_080887AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80887B4
sub_80887B4: @ 0x080887B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r6, #0
	ldrb r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_080887CC:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _080887EE
	cmp r0, #4
	bge _08088800
	cmp r0, #1
	beq _08088804
	cmp r0, #1
	bgt _080887E4
	cmp r0, #0
	beq _08088820
	b _08088810
_080887E4:
	cmp r0, #2
	beq _08088800
	cmp r0, #3
	beq _08088820
	b _08088810
_080887EE:
	cmp r0, #0x19
	ble _080887F8
	cmp r0, #0x80
	beq _0808880C
	b _08088810
_080887F8:
	cmp r0, #0x18
	bge _08088820
	cmp r0, #0x16
	blt _08088810
_08088800:
	adds r4, #1
	b _080887CC
_08088804:
	adds r4, #1
	adds r5, #0x10
	movs r6, #0
	b _080887CC
_0808880C:
	adds r4, #2
	b _080887CC
_08088810:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r6, r6, r0
	b _080887CC
_08088820:
	mov r0, r8
	strb r6, [r0]
	strb r5, [r7]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088834
sub_8088834: @ 0x08088834
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808887C
	bl GetCgTextFlags
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08088862
	adds r1, r4, #0
	adds r1, #0x57
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r2, [r1]
	ldrb r0, [r0]
	subs r0, r2, r0
	subs r0, #1
	b _0808886A
_08088862:
	adds r1, r4, #0
	adds r1, #0x57
	ldrb r0, [r1]
	adds r0, #2
_0808886A:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r2, [r0]
	ldrb r1, [r1]
	subs r1, r2, r1
	strb r1, [r0]
_0808887C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088884
sub_8088884: @ 0x08088884
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r5, #0
	movs r6, #0x10
	str r5, [r1]
	str r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_080888A0:
	ldrb r2, [r4]
	cmp r2, #0x19
	bhi _0808892C
	lsls r0, r2, #2
	ldr r1, _080888B0 @ =_080888B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080888B0: .4byte _080888B4
_080888B4: @ jump table
	.4byte _0808891E @ case 0
	.4byte _0808891E @ case 1
	.4byte _0808891E @ case 2
	.4byte _0808891C @ case 3
	.4byte _0808892C @ case 4
	.4byte _0808892C @ case 5
	.4byte _0808892C @ case 6
	.4byte _0808892C @ case 7
	.4byte _0808892C @ case 8
	.4byte _0808892C @ case 9
	.4byte _0808892C @ case 10
	.4byte _0808892C @ case 11
	.4byte _0808892C @ case 12
	.4byte _0808892C @ case 13
	.4byte _0808892C @ case 14
	.4byte _0808892C @ case 15
	.4byte _0808892C @ case 16
	.4byte _0808892C @ case 17
	.4byte _0808892C @ case 18
	.4byte _0808892C @ case 19
	.4byte _0808892C @ case 20
	.4byte _0808892C @ case 21
	.4byte _0808892C @ case 22
	.4byte _0808892C @ case 23
	.4byte _0808891E @ case 24
	.4byte _0808891E @ case 25
_0808891C:
	adds r5, #8
_0808891E:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bge _08088928
	str r5, [r1]
_08088928:
	movs r5, #0
	ldrb r2, [r4]
_0808892C:
	cmp r2, #0x19
	bhi _080889B8
	lsls r0, r2, #2
	ldr r1, _0808893C @ =_08088940
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808893C: .4byte _08088940
_08088940: @ jump table
	.4byte _080889AC @ case 0
	.4byte _080889A8 @ case 1
	.4byte _080889AC @ case 2
	.4byte _080889B8 @ case 3
	.4byte _080889B8 @ case 4
	.4byte _080889B8 @ case 5
	.4byte _080889B8 @ case 6
	.4byte _080889B8 @ case 7
	.4byte _080889B8 @ case 8
	.4byte _080889B8 @ case 9
	.4byte _080889B8 @ case 10
	.4byte _080889B8 @ case 11
	.4byte _080889B8 @ case 12
	.4byte _080889B8 @ case 13
	.4byte _080889B8 @ case 14
	.4byte _080889B8 @ case 15
	.4byte _080889B8 @ case 16
	.4byte _080889B8 @ case 17
	.4byte _080889B8 @ case 18
	.4byte _080889B8 @ case 19
	.4byte _080889B8 @ case 20
	.4byte _080889B8 @ case 21
	.4byte _080889B8 @ case 22
	.4byte _080889B8 @ case 23
	.4byte _080889A8 @ case 24
	.4byte _080889A8 @ case 25
_080889A8:
	adds r6, #0x10
	b _080889B8
_080889AC:
	ldr r0, [r7]
	cmp r0, r6
	bge _080889B4
	str r6, [r7]
_080889B4:
	movs r6, #0
	ldrb r2, [r4]
_080889B8:
	adds r0, r2, #0
	cmp r0, #7
	bgt _080889C8
	cmp r0, #1
	bge _080889D6
	cmp r0, #0
	beq _080889EE
	b _080889DE
_080889C8:
	cmp r2, #0x16
	blt _080889DE
	cmp r2, #0x19
	ble _080889D6
	cmp r2, #0x80
	beq _080889DA
	b _080889DE
_080889D6:
	adds r4, #1
	b _080888A0
_080889DA:
	adds r4, #2
	b _080888A0
_080889DE:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _080888A0
_080889EE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080889FC:
	ldrb r1, [r0]
	cmp r1, #0
	beq _08088A08
	cmp r1, #0x80
	beq _08088A0C
	b _08088A18
_08088A08:
	movs r0, #0
	b _08088A1C
_08088A0C:
	adds r0, #1
	ldrb r1, [r0]
	cmp r1, #0x20
	bne _08088A18
	movs r0, #1
	b _08088A1C
_08088A18:
	adds r0, #1
	b _080889FC
_08088A1C:
	bx lr
	.align 2, 0

	thumb_func_start sub_8088A20
sub_8088A20: @ 0x08088A20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r6, r0, #3
	mov r0, r8
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r7, r0, #3
	movs r0, #0
	mov sb, r0
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #0x1f
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r1, [sp, #4]
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _08088A90
	cmp r1, r0
	bhi _08088A74
	cmp r1, #0
	beq _08088A82
	b _08088ABA
_08088A74:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _08088AA0
	cmp r1, r2
	beq _08088AB0
	b _08088ABA
_08088A82:
	ldr r0, _08088A8C @ =gDispIo
	ldrh r1, [r0, #0x1c]
	subs r6, r6, r1
	ldrh r0, [r0, #0x1e]
	b _08088AB8
	.align 2, 0
_08088A8C: .4byte gDispIo
_08088A90:
	ldr r0, _08088A9C @ =gDispIo
	ldrh r2, [r0, #0x20]
	subs r6, r6, r2
	ldrh r0, [r0, #0x22]
	b _08088AB8
	.align 2, 0
_08088A9C: .4byte gDispIo
_08088AA0:
	ldr r0, _08088AAC @ =gDispIo
	ldrh r3, [r0, #0x24]
	subs r6, r6, r3
	ldrh r0, [r0, #0x26]
	b _08088AB8
	.align 2, 0
_08088AAC: .4byte gDispIo
_08088AB0:
	ldr r0, _08088B28 @ =gDispIo
	ldrh r4, [r0, #0x28]
	subs r6, r6, r4
	ldrh r0, [r0, #0x2a]
_08088AB8:
	subs r7, r7, r0
_08088ABA:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08088AFE
	adds r1, r6, #0
	subs r1, #0x10
	ldr r5, _08088B2C @ =0x000001FF
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	movs r4, #0xff
	ands r2, r4
	ldr r3, _08088B30 @ =gUnk_08D8B5C0
	ldr r0, _08088B34 @ =0x000013C8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	adds r1, r6, #0
	subs r1, #8
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x14
	ands r2, r4
	ldr r3, _08088B38 @ =gUnk_08D8B5E6
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_08088AFE:
	movs r4, #0
	mov r0, r8
	adds r0, #0x5c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	str r0, [sp, #0xc]
	movs r5, #0x50
	add r5, r8
	mov sl, r5
	movs r0, #0x5b
	add r8, r0
	cmp r4, r1
	bge _08088B90
_08088B1E:
	movs r1, #0
	mov sb, r1
	adds r2, r4, #1
	str r2, [sp, #0x10]
	b _08088B6C
	.align 2, 0
_08088B28: .4byte gDispIo
_08088B2C: .4byte 0x000001FF
_08088B30: .4byte gUnk_08D8B5C0
_08088B34: .4byte 0x000013C8
_08088B38: .4byte gUnk_08D8B5E6
_08088B3C:
	mov r3, sb
	lsls r1, r3, #5
	adds r1, r6, r1
	ldr r0, _08088BB8 @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	lsls r0, r3, #2
	mov r5, sl
	ldrh r5, [r5]
	adds r0, r5, r0
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08088BBC @ =Sprite_32x16
	bl PutSpriteExt
	movs r5, #1
	add sb, r5
_08088B6C:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08088B78
	adds r0, #3
_08088B78:
	asrs r0, r0, #2
	cmp sb, r0
	blt _08088B3C
	ldr r4, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _08088B1E
_08088B90:
	movs r0, #3
	mov r3, r8
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0
	beq _08088C2E
	mov r4, r8
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08088BAA
	adds r0, r1, #3
_08088BAA:
	asrs r0, r0, #2
	lsls r5, r0, #2
	str r5, [sp, #8]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r4, #0
	b _08088C1E
	.align 2, 0
_08088BB8: .4byte 0x000001FF
_08088BBC: .4byte Sprite_32x16
_08088BC0:
	movs r2, #0
	mov sb, r2
	adds r3, r4, #1
	str r3, [sp, #0x10]
	b _08088C00
_08088BCA:
	mov r5, sb
	lsls r1, r5, #3
	adds r1, r6, r1
	ldr r0, _08088C6C @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r0, sl
	ldrh r3, [r0]
	ldr r0, [sp, #8]
	adds r3, r3, r0
	mov ip, r3
	mov r0, ip
	add r0, sb
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08088C70 @ =Sprite_8x16
	bl PutSpriteExt
	movs r5, #1
	add sb, r5
_08088C00:
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08088C0E
	adds r0, r1, #3
_08088C0E:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	blt _08088BCA
	ldr r4, [sp, #0x10]
_08088C1E:
	ldr r1, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _08088BC0
_08088C2E:
	mov r2, sb
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, _08088C6C @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	ldr r3, _08088C74 @ =Sprite_32x16
	mov r5, sb
	lsls r0, r5, #2
	mov r6, sl
	ldrh r6, [r6]
	adds r0, r6, r0
	lsls r4, r4, #6
	adds r0, r0, r4
	ldr r4, [sp, #4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088C6C: .4byte 0x000001FF
_08088C70: .4byte Sprite_8x16
_08088C74: .4byte Sprite_32x16

	thumb_func_start sub_8088C78
sub_8088C78: @ 0x08088C78
	push {lr}
	subs r0, #0x16
	cmp r0, #9
	bhi _08088D00
	lsls r0, r0, #2
	ldr r1, _08088C8C @ =_08088C90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088C8C: .4byte _08088C90
_08088C90: @ jump table
	.4byte _08088CB8 @ case 0
	.4byte _08088CBE @ case 1
	.4byte _08088CC4 @ case 2
	.4byte _08088CCA @ case 3
	.4byte _08088CD0 @ case 4
	.4byte _08088CD6 @ case 5
	.4byte _08088CE2 @ case 6
	.4byte _08088CE8 @ case 7
	.4byte _08088CEE @ case 8
	.4byte _08088CF4 @ case 9
_08088CB8:
	movs r0, #0
	movs r1, #0
	b _08088CDA
_08088CBE:
	movs r0, #0
	movs r1, #1
	b _08088CDA
_08088CC4:
	movs r0, #0
	movs r1, #3
	b _08088CDA
_08088CCA:
	movs r0, #0
	movs r1, #2
	b _08088CDA
_08088CD0:
	movs r0, #0
	movs r1, #4
	b _08088CDA
_08088CD6:
	movs r0, #0
	movs r1, #5
_08088CDA:
	bl SetFaceBlinkControlById
	movs r0, #1
	b _08088D02
_08088CE2:
	movs r0, #0
	movs r1, #0
	b _08088CF8
_08088CE8:
	movs r0, #0
	movs r1, #2
	b _08088CF8
_08088CEE:
	movs r0, #0
	movs r1, #3
	b _08088CF8
_08088CF4:
	movs r0, #0
	movs r1, #4
_08088CF8:
	bl SetFaceEyeStateById
	movs r0, #1
	b _08088D02
_08088D00:
	movs r0, #0
_08088D02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8088D08
sub_8088D08: @ 0x08088D08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08088D44 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08088D5A
	bl GetCgTextFlags
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08088D5A
	movs r0, #0x7f
	mov sl, r0
	b _08088D74
	.align 2, 0
_08088D44: .4byte gpKeySt
_08088D48:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _08089274
_08088D5A:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _08088D6C
	b _08089282
_08088D6C:
	adds r0, r6, #0
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1]
_08088D74:
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r2, #0
	mov sb, r2
	cmp sb, sl
	blt _08088D9A
	b _08089274
_08088D9A:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _08088DA6
	b _080891EA
_08088DA6:
	lsls r0, r1, #2
	ldr r1, _08088DB0 @ =_08088DB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088DB0: .4byte _08088DB4
_08088DB4: @ jump table
	.4byte _08089068 @ case 0
	.4byte _08089096 @ case 1
	.4byte _08089106 @ case 2
	.4byte _08089148 @ case 3
	.4byte _080890C2 @ case 4
	.4byte _080890CC @ case 5
	.4byte _080890D6 @ case 6
	.4byte _080890E0 @ case 7
	.4byte _080891EA @ case 8
	.4byte _080891EA @ case 9
	.4byte _080891EA @ case 10
	.4byte _080891EA @ case 11
	.4byte _080891EA @ case 12
	.4byte _080891EA @ case 13
	.4byte _080891EA @ case 14
	.4byte _080891EA @ case 15
	.4byte _080891EA @ case 16
	.4byte _080891EA @ case 17
	.4byte _080891EA @ case 18
	.4byte _080891EA @ case 19
	.4byte _080891EA @ case 20
	.4byte _080891EA @ case 21
	.4byte _080890EA @ case 22
	.4byte _080890F8 @ case 23
	.4byte _08088FB8 @ case 24
	.4byte _08089018 @ case 25
	.4byte _080891EA @ case 26
	.4byte _080891EA @ case 27
	.4byte _080891EA @ case 28
	.4byte _080891EA @ case 29
	.4byte _080891EA @ case 30
	.4byte _080891EA @ case 31
	.4byte _080891EA @ case 32
	.4byte _080891EA @ case 33
	.4byte _080891EA @ case 34
	.4byte _080891EA @ case 35
	.4byte _080891EA @ case 36
	.4byte _080891EA @ case 37
	.4byte _080891EA @ case 38
	.4byte _080891EA @ case 39
	.4byte _080891EA @ case 40
	.4byte _080891EA @ case 41
	.4byte _080891EA @ case 42
	.4byte _080891EA @ case 43
	.4byte _080891EA @ case 44
	.4byte _080891EA @ case 45
	.4byte _080891EA @ case 46
	.4byte _080891EA @ case 47
	.4byte _080891EA @ case 48
	.4byte _080891EA @ case 49
	.4byte _080891EA @ case 50
	.4byte _080891EA @ case 51
	.4byte _080891EA @ case 52
	.4byte _080891EA @ case 53
	.4byte _080891EA @ case 54
	.4byte _080891EA @ case 55
	.4byte _080891EA @ case 56
	.4byte _080891EA @ case 57
	.4byte _080891EA @ case 58
	.4byte _080891EA @ case 59
	.4byte _080891EA @ case 60
	.4byte _080891EA @ case 61
	.4byte _080891EA @ case 62
	.4byte _080891EA @ case 63
	.4byte _080891EA @ case 64
	.4byte _080891EA @ case 65
	.4byte _080891EA @ case 66
	.4byte _080891EA @ case 67
	.4byte _080891EA @ case 68
	.4byte _080891EA @ case 69
	.4byte _080891EA @ case 70
	.4byte _080891EA @ case 71
	.4byte _080891EA @ case 72
	.4byte _080891EA @ case 73
	.4byte _080891EA @ case 74
	.4byte _080891EA @ case 75
	.4byte _080891EA @ case 76
	.4byte _080891EA @ case 77
	.4byte _080891EA @ case 78
	.4byte _080891EA @ case 79
	.4byte _080891EA @ case 80
	.4byte _080891EA @ case 81
	.4byte _080891EA @ case 82
	.4byte _080891EA @ case 83
	.4byte _080891EA @ case 84
	.4byte _080891EA @ case 85
	.4byte _080891EA @ case 86
	.4byte _080891EA @ case 87
	.4byte _080891EA @ case 88
	.4byte _080891EA @ case 89
	.4byte _080891EA @ case 90
	.4byte _080891EA @ case 91
	.4byte _080891EA @ case 92
	.4byte _080891EA @ case 93
	.4byte _080891EA @ case 94
	.4byte _080891EA @ case 95
	.4byte _080891EA @ case 96
	.4byte _080891EA @ case 97
	.4byte _080891EA @ case 98
	.4byte _080891EA @ case 99
	.4byte _080891EA @ case 100
	.4byte _080891EA @ case 101
	.4byte _080891EA @ case 102
	.4byte _080891EA @ case 103
	.4byte _080891EA @ case 104
	.4byte _080891EA @ case 105
	.4byte _080891EA @ case 106
	.4byte _080891EA @ case 107
	.4byte _080891EA @ case 108
	.4byte _080891EA @ case 109
	.4byte _080891EA @ case 110
	.4byte _080891EA @ case 111
	.4byte _080891EA @ case 112
	.4byte _080891EA @ case 113
	.4byte _080891EA @ case 114
	.4byte _080891EA @ case 115
	.4byte _080891EA @ case 116
	.4byte _080891EA @ case 117
	.4byte _080891EA @ case 118
	.4byte _080891EA @ case 119
	.4byte _080891EA @ case 120
	.4byte _080891EA @ case 121
	.4byte _080891EA @ case 122
	.4byte _080891EA @ case 123
	.4byte _080891EA @ case 124
	.4byte _080891EA @ case 125
	.4byte _080891EA @ case 126
	.4byte _080891EA @ case 127
	.4byte _080891CA @ case 128
_08088FB8:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08089010 @ =gUnk_08D8B694
	cmp r1, #0
	beq _08088FD4
	ldr r5, _08089014 @ =gUnk_08D8B68C
_08088FD4:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
_08088FFC:
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r5, #0
	bl StartYesNoChoice
_08089008:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808913E
	.align 2, 0
_08089010: .4byte gUnk_08D8B694
_08089014: .4byte gUnk_08D8B68C
_08089018:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08089060 @ =gUnk_08D8B694
	cmp r1, #0
	beq _08089034
	ldr r5, _08089064 @ =gUnk_08D8B68C
_08089034:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #2
	b _08088FFC
	.align 2, 0
_08089060: .4byte gUnk_08D8B694
_08089064: .4byte gUnk_08D8B68C
_08089068:
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08089084
	movs r0, #4
	bl ClearCgTextFlag
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0808908C
_08089084:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_0808908C:
	mov r0, r8
	movs r1, #0x63
	bl Proc_Goto
	b _0808913E
_08089096:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	adds r3, r6, #0
	adds r3, #0x54
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r2, #1
	adds r0, r6, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _080890BA
	b _08088D48
_080890BA:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _0808926A
_080890C2:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #8
	strb r0, [r1]
	b _08089008
_080890CC:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x10
	strb r0, [r1]
	b _08089008
_080890D6:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x20
	strb r0, [r1]
	b _08089008
_080890E0:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x80
	strb r0, [r1]
	b _08089008
_080890EA:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldr r0, _080890F4 @ =0x0000FFF7
	ands r7, r0
	b _0808926A
	.align 2, 0
_080890F4: .4byte 0x0000FFF7
_080890F8:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	movs r0, #8
	orrs r7, r0
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	b _0808926A
_08089106:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldrb r2, [r2, #1]
	cmp r2, #1
	bne _08089114
	adds r0, #1
	str r0, [r6, #0x2c]
_08089114:
	bl GetCgTextFlags
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _0808912A
	mov r0, r8
	movs r1, #2
	bl Proc_Goto
	b _0808913E
_0808912A:
	adds r0, r6, #0
	adds r0, #0x54
	ldrb r1, [r0]
	adds r1, #1
	adds r0, #0xb
	strb r1, [r0]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
_0808913E:
	ldr r0, _08089144 @ =0x0000FFEF
	ands r7, r0
	b _08089274
	.align 2, 0
_08089144: .4byte 0x0000FFEF
_08089148:
	ldr r0, _08089190 @ =0x0000FFEF
	ands r7, r0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08089194
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	bl sub_8009178
	b _080891BE
	.align 2, 0
_08089190: .4byte 0x0000FFEF
_08089194:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	mov r0, r8
	bl sub_800914C
_080891BE:
	adds r1, r5, #0
	adds r2, r4, #0
	ldr r0, [r6, #0x2c]
	bl sub_80887B4
	b _08089274
_080891CA:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	ldrb r1, [r1, #1]
	cmp r1, #0x21
	bne _080891E2
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #1
	ldrb r2, [r1]
	subs r0, r0, r2
	strb r0, [r1]
_080891E2:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808926A
_080891EA:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808920E
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xc
	bl Text_SetColor
	b _08089226
_0808920E:
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xb
	bl Text_SetColor
_08089226:
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _0808924C
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _0808926A
_0808924C:
	bl GetCgTextFlags
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0808926A
	ldr r0, _08089294 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808926A
	ldr r0, _08089298 @ =0x0000038E
	bl m4aSongNumStart
_0808926A:
	movs r0, #1
	add sb, r0
	cmp sb, sl
	bge _08089274
	b _08088D9A
_08089274:
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	adds r1, r7, #0
	bl SetFaceDispById
_08089282:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089294: .4byte gPlaySt
_08089298: .4byte 0x0000038E

	thumb_func_start sub_808929C
sub_808929C: @ 0x0808929C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r1
	mov ip, r2
	adds r4, r0, #0
	movs r6, #0
	cmp r6, ip
	bge _080892F8
_080892B2:
	adds r1, r4, #0
	movs r2, #0
	adds r0, r6, #1
	mov sb, r0
	cmp r2, r8
	bge _080892EC
	mov r7, ip
	subs r7, #1
	mov sl, r2
_080892C4:
	adds r5, r2, #1
	movs r3, #6
_080892C8:
	ldr r0, [r1, #4]
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _080892C8
	cmp r6, r7
	bne _080892DA
	mov r0, sl
	b _080892E4
_080892DA:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0]
_080892E4:
	stm r1!, {r0}
	adds r2, r5, #0
	cmp r2, r8
	blt _080892C4
_080892EC:
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	mov r6, sb
	cmp r6, ip
	blt _080892B2
_080892F8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8089308
sub_8089308: @ 0x08089308
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8089310
sub_8089310: @ 0x08089310
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x14]
	adds r6, r5, #0
	adds r6, #0x54
	movs r2, #0
	ldrsb r2, [r6, r2]
	adds r2, #1
	lsls r2, r2, #1
	ldr r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x5b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808929C
	adds r0, r7, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r4, r5, #0
	adds r4, #0x5f
	ldrb r2, [r4]
	lsls r0, r2, #4
	cmp r1, r0
	bne _0808938A
	adds r0, r5, #0
	bl sub_8088768
	ldrb r0, [r4]
	subs r0, #1
	ldrb r1, [r6]
	subs r0, r1, r0
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x59
	mov r2, r8
	strb r2, [r1]
	subs r4, #5
	strb r2, [r4]
	ldr r0, [r5, #0x2c]
	adds r2, r4, #0
	bl sub_80887B4
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldrb r1, [r4]
	adds r0, r1, r0
	strb r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
_0808938A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8089394
sub_8089394: @ 0x08089394
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_8088718
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r1, #5
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x5a
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80887B4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80893BC
sub_80893BC: @ 0x080893BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080893DC @ =gUnk_08D8B69C
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080893DC: .4byte gUnk_08D8B69C

	thumb_func_start sub_80893E0
sub_80893E0: @ 0x080893E0
	push {lr}
	ldr r0, _080893F0 @ =gUnk_08D8B69C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080893F0: .4byte gUnk_08D8B69C

	thumb_func_start sub_80893F4
sub_80893F4: @ 0x080893F4
	push {lr}
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08089406
	movs r0, #0
	b _08089408
_08089406:
	movs r0, #1
_08089408:
	pop {r1}
	bx r1

	thumb_func_start sub_808940C
sub_808940C: @ 0x0808940C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08089438 @ =gpKeySt
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _08089444
	ldr r0, _0808943C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089432
	ldr r0, _08089440 @ =0x0000038B
	bl m4aSongNumStart
_08089432:
	movs r0, #0
	b _08089464
	.align 2, 0
_08089438: .4byte gpKeySt
_0808943C: .4byte gPlaySt
_08089440: .4byte 0x0000038B
_08089444:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08089478
	ldr r0, _08089470 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089460
	ldr r0, _08089474 @ =0x0000038A
	bl m4aSongNumStart
_08089460:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
_08089464:
	bl SetTalkChoiceResult
	adds r0, r4, #0
	bl Proc_Break
	b _080894DE
	.align 2, 0
_08089470: .4byte gPlaySt
_08089474: .4byte 0x0000038A
_08089478:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0808949A
	ldrh r2, [r4, #0x2a]
	cmp r2, #2
	bne _0808949A
	ldr r0, _080894E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089498
	ldr r0, _080894E8 @ =0x00000387
	bl m4aSongNumStart
_08089498:
	strh r6, [r4, #0x2a]
_0808949A:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080894C2
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	bne _080894C2
	ldr r0, _080894E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080894BE
	ldr r0, _080894E8 @ =0x00000387
	bl m4aSongNumStart
_080894BE:
	movs r0, #2
	strh r0, [r4, #0x2a]
_080894C2:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl PutUiHand
_080894DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080894E4: .4byte gPlaySt
_080894E8: .4byte 0x00000387

	thumb_func_start StartYesNoChoice
StartYesNoChoice: @ 0x080894EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x24]
	ldr r0, [r5]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x10
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, [r5, #4]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x38
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, _08089548 @ =gUnk_08D8B6FC
	adds r1, r7, #0
	bl Proc_StartBlocking
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x2a]
	adds r4, #0x10
	strh r4, [r0, #0x2c]
	mov r2, sb
	strh r2, [r0, #0x2e]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089548: .4byte gUnk_08D8B6FC
