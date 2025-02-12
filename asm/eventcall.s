	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80788D0
sub_80788D0: @ 0x080788D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080788EA
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _080788EA
	bl StartEvent
_080788EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80788F0
sub_80788F0: @ 0x080788F0
	push {lr}
	ldr r0, [r0, #8]
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_80788FC
sub_80788FC: @ 0x080788FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldr r6, _0807890C @ =gUnk_08D668E4
	adds r7, r6, #4
	b _0807891E
	.align 2, 0
_0807890C: .4byte gUnk_08D668E4
_08078910:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
_0807891E:
	ldr r0, [r4]
	ldrh r5, [r0]
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078910
	lsls r0, r5, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	cmp r0, #1
	bne _08078910
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _08078948
	movs r0, #0
	b _0807894A
_08078948:
	adds r0, r4, #0
_0807894A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078950
sub_8078950: @ 0x08078950
	push {r4, lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _0807895C
	movs r0, #0
	b _08078976
_0807895C:
	ldr r2, [r3]
	ldr r0, _0807897C @ =gUnk_08D668E4
	ldrh r4, [r2]
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r3, #0
	bl sub_80788FC
_08078976:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807897C: .4byte gUnk_08D668E4

	thumb_func_start sub_8078980
sub_8078980: @ 0x08078980
	movs r0, #1
	bx lr

	thumb_func_start sub_8078984
sub_8078984: @ 0x08078984
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807899A
	movs r0, #0
	b _080789A6
_0807899A:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_080789A6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80789AC
sub_80789AC: @ 0x080789AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _080789E0 @ =0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080789E4
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080789E4
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _080789E6
	.align 2, 0
_080789E0: .4byte 0xFFFF0000
_080789E4:
	movs r0, #0
_080789E6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80789EC
sub_80789EC: @ 0x080789EC
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r1, _08078A10 @ =gBmSt
	ldrb r5, [r1, #0x14]
	ldrb r4, [r1, #0x16]
	adds r6, r4, #0
	ldr r0, [r0]
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _08078A6C
	ldrh r0, [r0]
	cmp r0, #0xf
	beq _08078A14
	cmp r0, #0x10
	beq _08078A3C
_08078A0A:
	movs r0, #1
	b _08078A82
	.align 2, 0
_08078A10: .4byte gBmSt
_08078A14:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08078A80
_08078A1A:
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	cmp r5, r1
	bne _08078A2A
	ldrb r0, [r0, #1]
	cmp r6, r0
	beq _08078A0A
_08078A2A:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08078A1A
	b _08078A80
_08078A3C:
	ldr r0, _08078A68 @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _08078A80
	ldrb r0, [r2]
	cmp r5, r0
	blo _08078A80
	ldrb r1, [r2, #1]
	cmp r4, r1
	blo _08078A80
	ldrb r0, [r2, #4]
	cmp r5, r0
	bhi _08078A80
	ldrb r2, [r2, #5]
	cmp r4, r2
	bhi _08078A80
	b _08078A0A
	.align 2, 0
_08078A68: .4byte gBmMapMovement
_08078A6C:
	ldr r0, _08078A88 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r5, r0
	bne _08078A80
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r6, r0
	beq _08078A0A
_08078A80:
	movs r0, #0
_08078A82:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08078A88: .4byte gActiveUnit

	thumb_func_start sub_8078A8C
sub_8078A8C: @ 0x08078A8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _08078AC0 @ =0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078AC4
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078AC4
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _08078AC6
	.align 2, 0
_08078AC0: .4byte 0xFFFF0000
_08078AC4:
	movs r0, #0
_08078AC6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8078ACC
sub_8078ACC: @ 0x08078ACC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	ldrb r6, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	ldr r0, [r2, #0xc]
	subs r0, #1
	cmp r0, #4
	bhi _08078B80
	lsls r0, r0, #2
	ldr r1, _08078AF8 @ =_08078AFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078AF8: .4byte _08078AFC
_08078AFC: @ jump table
	.4byte _08078B10 @ case 0
	.4byte _08078B20 @ case 1
	.4byte _08078B38 @ case 2
	.4byte _08078B50 @ case 3
	.4byte _08078B68 @ case 4
_08078B10:
	ldr r1, _08078B1C @ =gPlaySt
	ldrb r0, [r1, #0x1b]
	cmp r0, #2
	bne _08078BBC
	b _08078B28
	.align 2, 0
_08078B1C: .4byte gPlaySt
_08078B20:
	ldr r1, _08078B34 @ =gPlaySt
	ldrb r2, [r1, #0x1b]
	cmp r2, #3
	bne _08078BBC
_08078B28:
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08078B74
	b _08078BBC
	.align 2, 0
_08078B34: .4byte gPlaySt
_08078B38:
	ldr r1, _08078B4C @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08078BBC
	ldrb r1, [r1, #0x1b]
	cmp r1, #2
	beq _08078B74
	b _08078BBC
	.align 2, 0
_08078B4C: .4byte gPlaySt
_08078B50:
	ldr r1, _08078B64 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08078BBC
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	beq _08078B74
	b _08078BBC
	.align 2, 0
_08078B64: .4byte gPlaySt
_08078B68:
	ldr r1, _08078B94 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08078BBC
_08078B74:
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078BBC
_08078B80:
	cmp r5, #0
	bne _08078B98
	ldr r0, _08078B94 @ =gPlaySt
	ldrh r1, [r0, #0x10]
	cmp r1, r6
	bne _08078BBC
	ldrb r0, [r0, #0xf]
	cmp r0, r7
	bne _08078BBC
	b _08078BAA
	.align 2, 0
_08078B94: .4byte gPlaySt
_08078B98:
	ldr r1, _08078BB8 @ =gPlaySt
	ldrh r0, [r1, #0x10]
	cmp r0, r6
	blt _08078BBC
	cmp r0, r5
	bgt _08078BBC
	ldrb r1, [r1, #0xf]
	cmp r1, r7
	bne _08078BBC
_08078BAA:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078BBE
	.align 2, 0
_08078BB8: .4byte gPlaySt
_08078BBC:
	movs r0, #0
_08078BBE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078BC4
sub_8078BC4: @ 0x08078BC4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r3, #0xff
	adds r5, r1, #0
	ands r5, r3
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	lsrs r6, r1, #8
	ldr r0, [r2, #0xc]
	adds r1, r0, #0
	ands r1, r3
	cmp r1, #2
	beq _08078C04
	cmp r1, #2
	bhi _08078BEE
	cmp r1, #1
	beq _08078BF4
	b _08078C20
_08078BEE:
	cmp r1, #3
	beq _08078C14
	b _08078C20
_08078BF4:
	ldr r0, _08078C00 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08078C20
	b _08078C3E
	.align 2, 0
_08078C00: .4byte gPlaySt
_08078C04:
	ldr r0, _08078C10 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _08078C20
	b _08078C3E
	.align 2, 0
_08078C10: .4byte gPlaySt
_08078C14:
	lsrs r0, r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078C3E
_08078C20:
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _08078C2A
	cmp r5, #0
	bne _08078C3E
_08078C2A:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _08078C3E
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078C40
_08078C3E:
	movs r0, #0
_08078C40:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078C48
sub_8078C48: @ 0x08078C48
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r2, #8]
	ldrb r5, [r2, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r6, r0, #8
	ldr r1, [r2, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078C86
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _08078C72
	cmp r5, #0
	bne _08078C86
_08078C72:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _08078C86
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078C88
_08078C86:
	movs r0, #0
_08078C88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078C90
sub_8078C90: @ 0x08078C90
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r1, r1, #0x10
	movs r6, #0
	str r6, [r3, #0x10]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _08078CD2
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _08078CD2
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldrh r0, [r4, #2]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	cmp r1, #0x12
	bne _08078CCE
	str r6, [r3, #0x14]
_08078CCE:
	movs r0, #1
	b _08078CD4
_08078CD2:
	movs r0, #0
_08078CD4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078CDC
sub_8078CDC: @ 0x08078CDC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8078C90
	movs r1, #3
	str r1, [r4, #0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078CF0
sub_8078CF0: @ 0x08078CF0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _08078D32
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _08078D32
	movs r0, #1
	str r0, [r2, #4]
	ldrh r0, [r3, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	ldrh r0, [r3, #4]
	str r0, [r2, #0x14]
	ldrh r0, [r3, #6]
	str r0, [r2, #0x10]
	movs r0, #1
	b _08078D34
_08078D32:
	movs r0, #0
_08078D34:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078D3C
sub_8078D3C: @ 0x08078D3C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _08078D78
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _08078D78
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r0, #1
	b _08078D7A
_08078D78:
	movs r0, #0
_08078D7A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8078D80
sub_8078D80: @ 0x08078D80
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _08078DBC
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _08078DBC
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r0, #1
	b _08078DBE
_08078DBC:
	movs r0, #0
_08078DBE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8078DC4
sub_8078DC4: @ 0x08078DC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r3, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	ldrb r2, [r2, #8]
	ldrb r0, [r4, #0x18]
	cmp r2, r0
	bne _08078E18
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r3, r0
	bne _08078E18
	cmp r5, #0x15
	bne _08078E02
	ldr r0, _08078E14 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x71
	bl GetUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08078E18
_08078E02:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	movs r0, #1
	b _08078E1A
	.align 2, 0
_08078E14: .4byte gActiveUnit
_08078E18:
	movs r0, #0
_08078E1A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8078E20
sub_8078E20: @ 0x08078E20
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08078E78 @ =gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x11]
	mov ip, r0
	ldr r3, [r5]
	ldr r1, [r3, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r4, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r7, r0, #0x10
	lsrs r6, r1, #0x18
	movs r0, #8
	ldrsb r0, [r3, r0]
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r0, r2
	bgt _08078E7C
	lsls r1, r4, #0x18
	mov r4, ip
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
	cmp r1, r0
	bgt _08078E7C
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	blt _08078E7C
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	blt _08078E7C
	ldr r0, [r3, #4]
	str r0, [r5, #4]
	ldrh r0, [r3, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _08078E7E
	.align 2, 0
_08078E78: .4byte gActiveUnit
_08078E7C:
	movs r0, #0
_08078E7E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078E84
sub_8078E84: @ 0x08078E84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078EA4 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _08078EA8
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078EA8
	adds r0, r4, #0
	bl sub_8078E20
	b _08078EAA
	.align 2, 0
_08078EA4: .4byte gPlaySt
_08078EA8:
	movs r0, #0
_08078EAA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8078EB0
sub_8078EB0: @ 0x08078EB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078ED0 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08078ED4
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078ED4
	adds r0, r4, #0
	bl sub_8078E20
	b _08078ED6
	.align 2, 0
_08078ED0: .4byte gPlaySt
_08078ED4:
	movs r0, #0
_08078ED6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8078EDC
sub_8078EDC: @ 0x08078EDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078EF4
	movs r0, #0
	b _08078F00
_08078EF4:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_08078F00:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078F08
sub_8078F08: @ 0x08078F08
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r3, #0x1a]
	cmp r0, r1
	bne _08078F2C
	ldrb r0, [r3, #0x1b]
	cmp r0, r2
	bne _08078F2C
	ldr r0, [r3]
	ldr r1, [r0, #4]
	str r1, [r3, #4]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	movs r0, #1
	b _08078F2E
_08078F2C:
	movs r0, #0
_08078F2E:
	bx lr

	thumb_func_start sub_8078F30
sub_8078F30: @ 0x08078F30
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, _08078F58 @ =gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r1, r0
	blt _08078F5C
	cmp r1, r4
	bgt _08078F5C
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r1, r5
	blt _08078F5C
	cmp r1, r3
	bgt _08078F5C
	movs r0, #1
	b _08078F5E
	.align 2, 0
_08078F58: .4byte gActiveUnit
_08078F5C:
	movs r0, #0
_08078F5E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8078F64
sub_8078F64: @ 0x08078F64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #1
_08078F74:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08078FB0
	ldr r0, [r2]
	cmp r0, #0
	beq _08078FB0
	ldr r0, [r2, #0xc]
	ldr r1, _08078FAC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08078FB0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _08078FB0
	cmp r0, r6
	bgt _08078FB0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _08078FB0
	cmp r0, r5
	bgt _08078FB0
	movs r0, #1
	b _08078FB8
	.align 2, 0
_08078FAC: .4byte 0x00010004
_08078FB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _08078F74
	movs r0, #0
_08078FB8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078FC4
sub_8078FC4: @ 0x08078FC4
	push {lr}
	ldr r0, _08078FE4 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078FE8
	movs r0, #0
	movs r1, #0xf
	movs r2, #0x19
	movs r3, #0x17
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078FE8
	movs r0, #1
	b _08078FEA
	.align 2, 0
_08078FE4: .4byte gPlaySt
_08078FE8:
	movs r0, #0
_08078FEA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078FF0
sub_8078FF0: @ 0x08078FF0
	push {lr}
	ldr r0, _08079034 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08079030
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x1b
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079038
	movs r0, #0
	movs r1, #0x15
	movs r2, #2
	movs r3, #0x17
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079038
	movs r0, #3
	movs r1, #0x14
	movs r2, #5
	movs r3, #0x16
	bl sub_8078F64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079038
_08079030:
	movs r0, #0
	b _0807903A
	.align 2, 0
_08079034: .4byte gPlaySt
_08079038:
	movs r0, #1
_0807903A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079040
sub_8079040: @ 0x08079040
	push {lr}
	movs r0, #0xc
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x18
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079058
sub_8079058: @ 0x08079058
	push {lr}
	ldr r0, _08079074 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08079078
	movs r0, #0x11
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x23
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807907A
	.align 2, 0
_08079074: .4byte gPlaySt
_08079078:
	movs r0, #0
_0807907A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079080
sub_8079080: @ 0x08079080
	push {lr}
	ldr r0, _0807909C @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080790A0
	movs r0, #0
	movs r1, #0xf
	movs r2, #8
	movs r3, #0x12
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080790A2
	.align 2, 0
_0807909C: .4byte gPlaySt
_080790A0:
	movs r0, #0
_080790A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80790A8
sub_80790A8: @ 0x080790A8
	push {lr}
	ldr r0, _080790C4 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080790C8
	movs r0, #0
	movs r1, #0x18
	movs r2, #0xc
	movs r3, #0x1b
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080790CA
	.align 2, 0
_080790C4: .4byte gPlaySt
_080790C8:
	movs r0, #0
_080790CA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80790D0
sub_80790D0: @ 0x080790D0
	push {lr}
	ldr r0, _080790EC @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080790F0
	movs r0, #0x15
	movs r1, #0
	movs r2, #0x1e
	movs r3, #6
	bl sub_8078F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080790F2
	.align 2, 0
_080790EC: .4byte gPlaySt
_080790F0:
	movs r0, #0
_080790F2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80790F8
sub_80790F8: @ 0x080790F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #0x81
_08079108:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08079144
	ldr r0, [r2]
	cmp r0, #0
	beq _08079144
	ldr r0, [r2, #0xc]
	ldr r1, _08079140 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08079144
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _08079144
	cmp r0, r6
	bgt _08079144
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _08079144
	cmp r0, r5
	bgt _08079144
	movs r0, #1
	b _0807914C
	.align 2, 0
_08079140: .4byte 0x00010004
_08079144:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079108
	movs r0, #0
_0807914C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAvailableTurnEvent
CheckAvailableTurnEvent: @ 0x08079158
	push {lr}
	sub sp, #0x1c
	ldr r0, _0807917C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	bne _08079180
	movs r0, #0
	b _08079182
	.align 2, 0
_0807917C: .4byte gPlaySt
_08079180:
	movs r0, #1
_08079182:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start StartAvailableTurnEvents
StartAvailableTurnEvents: @ 0x08079188
	push {lr}
	sub sp, #0x1c
	ldr r0, _080791B0 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _080791C4
	mov r0, sp
	bl sub_80788D0
	b _080791BA
	.align 2, 0
_080791B0: .4byte gPlaySt
_080791B4:
	mov r0, sp
	bl sub_80788D0
_080791BA:
	mov r0, sp
	bl sub_8078950
	cmp r0, #0
	bne _080791B4
_080791C4:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80791CC
sub_80791CC: @ 0x080791CC
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08079200 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_80788FC
	cmp r0, #0
	bne _08079204
	movs r0, #0
	b _08079206
	.align 2, 0
_08079200: .4byte gPlaySt
_08079204:
	movs r0, #1
_08079206:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079210
sub_8079210: @ 0x08079210
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0807924C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_80788FC
	cmp r0, #0
	beq _08079244
	mov r0, sp
	bl sub_80788D0
_08079244:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807924C: .4byte gPlaySt

	thumb_func_start sub_8079250
sub_8079250: @ 0x08079250
	push {r4, r5, r6, r7, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	ldr r0, _08079264 @ =gUnk_08D67934
	b _08079292
	.align 2, 0
_08079264: .4byte gUnk_08D67934
_08079268:
	adds r2, r1, #0
	ldrb r1, [r0, #1]
	cmp r2, r7
	bne _08079274
	cmp r1, r6
	beq _0807927C
_08079274:
	cmp r1, r7
	bne _08079290
	cmp r2, r6
	bne _08079290
_0807927C:
	cmp r4, #1
	bne _08079282
	ldr r5, [r0, #4]
_08079282:
	cmp r4, #2
	bne _08079288
	ldr r5, [r0, #8]
_08079288:
	cmp r4, #3
	bne _08079298
	ldr r5, [r0, #0xc]
	b _08079298
_08079290:
	adds r0, #0x14
_08079292:
	ldrb r1, [r0]
	cmp r1, #0
	bne _08079268
_08079298:
	cmp r5, #0
	beq _080792BC
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_807931C
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_800EC9C
	bl sub_800AD60
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_809F88C
_080792BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80792C4
sub_80792C4: @ 0x080792C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r5, #0
	ldr r1, _080792D4 @ =gUnk_08D67934
	b _08079302
	.align 2, 0
_080792D4: .4byte gUnk_08D67934
_080792D8:
	adds r0, r3, #0
	ldrb r3, [r1, #1]
	cmp r0, r6
	bne _080792E4
	cmp r3, r4
	beq _080792EC
_080792E4:
	cmp r3, r6
	bne _08079300
	cmp r0, r4
	bne _08079300
_080792EC:
	cmp r2, #1
	bne _080792F2
	ldr r5, [r1, #4]
_080792F2:
	cmp r2, #2
	bne _080792F8
	ldr r5, [r1, #8]
_080792F8:
	cmp r2, #3
	bne _08079308
	ldr r5, [r1, #0xc]
	b _08079308
_08079300:
	adds r1, #0x14
_08079302:
	ldrb r3, [r1]
	cmp r3, #0
	bne _080792D8
_08079308:
	cmp r5, #0
	beq _08079316
	adds r0, r5, #0
	bl sub_800ECD4
	bl sub_800AD60
_08079316:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_807931C
sub_807931C: @ 0x0807931C
	push {r4, r5, lr}
	adds r5, r3, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	bne _08079352
	ldr r2, _08079334 @ =gUnk_08D67934
	b _0807933A
	.align 2, 0
_08079334: .4byte gUnk_08D67934
_08079338:
	adds r2, #0x14
_0807933A:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08079352
	ldrb r1, [r2, #1]
	cmp r0, r4
	bne _0807934A
	cmp r1, r3
	beq _08079352
_0807934A:
	cmp r1, r4
	bne _08079338
	cmp r0, r3
	bne _08079338
_08079352:
	ldr r1, [r2, #0x10]
	cmp r1, #0
	beq _08079398
	subs r0, r5, #1
	lsls r0, r0, #3
	adds r3, r1, #0
	lsrs r3, r0
	movs r0, #0xff
	ands r3, r0
	cmp r3, #4
	bhi _08079398
	lsls r0, r3, #2
	ldr r1, _08079374 @ =_08079378
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079374: .4byte _08079378
_08079378: @ jump table
	.4byte _08079398 @ case 0
	.4byte _0807938C @ case 1
	.4byte _08079390 @ case 2
	.4byte _08079394 @ case 3
	.4byte _08079394 @ case 4
_0807938C:
	movs r0, #0x41
	b _0807939A
_08079390:
	movs r0, #0x4c
	b _0807939A
_08079394:
	movs r0, #0x6a
	b _0807939A
_08079398:
	movs r0, #0
_0807939A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80793A0
sub_80793A0: @ 0x080793A0
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080793D4 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_80788FC
	cmp r0, #0
	beq _080793D8
	ldr r0, [sp, #0xc]
	b _080793DA
	.align 2, 0
_080793D4: .4byte gPlaySt
_080793D8:
	movs r0, #0
_080793DA:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80793E4
sub_80793E4: @ 0x080793E4
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08079428 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_80788FC
	cmp r0, #0
	bne _08079414
	b _080795C2
_08079414:
	ldr r0, [sp, #0xc]
	cmp r0, #0x1d
	bls _0807941C
	b _080795C2
_0807941C:
	lsls r0, r0, #2
	ldr r1, _0807942C @ =_08079430
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079428: .4byte gPlaySt
_0807942C: .4byte _08079430
_08079430: @ jump table
	.4byte _080795C0 @ case 0
	.4byte _080795C2 @ case 1
	.4byte _080795C2 @ case 2
	.4byte _080795C2 @ case 3
	.4byte _080795C2 @ case 4
	.4byte _080795C2 @ case 5
	.4byte _080795C2 @ case 6
	.4byte _080795C2 @ case 7
	.4byte _080795C2 @ case 8
	.4byte _080795C2 @ case 9
	.4byte _080795C2 @ case 10
	.4byte _080795C2 @ case 11
	.4byte _080795C2 @ case 12
	.4byte _080795C2 @ case 13
	.4byte _080794A8 @ case 14
	.4byte _080794A8 @ case 15
	.4byte _080794D8 @ case 16
	.4byte _080794D8 @ case 17
	.4byte _0807950A @ case 18
	.4byte _0807958C @ case 19
	.4byte _0807959C @ case 20
	.4byte _080795AC @ case 21
	.4byte _080795BC @ case 22
	.4byte _080795C2 @ case 23
	.4byte _080795C2 @ case 24
	.4byte _080795C2 @ case 25
	.4byte _080795C2 @ case 26
	.4byte _080795C2 @ case 27
	.4byte _080795C2 @ case 28
	.4byte _080794B6 @ case 29
_080794A8:
	mov r0, sp
	bl sub_80788D0
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _080794B6
	b _080795C2
_080794B6:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_800EF34
_080794D2:
	bl sub_800AD60
	b _080795C2
_080794D8:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _08079502
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_800EF34
	ldr r0, [sp, #8]
	bl SetFlag
	b _080794D2
_08079502:
	mov r0, sp
	bl sub_80788D0
	b _080794D2
_0807950A:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	bne _08079534
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_800EF34
	mov r0, sp
	bl sub_80788D0
	b _08079580
_08079534:
	cmp r4, #0x76
	beq _0807955E
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_800EF50
	b _08079580
_0807955E:
	ldr r4, [sp, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_800EF78
_08079580:
	bl sub_800AD60
	ldr r0, [sp, #8]
	bl SetFlag
	b _080795C2
_0807958C:
	ldr r0, _08079598 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B11FC
	b _080795C2
	.align 2, 0
_08079598: .4byte gActiveUnit
_0807959C:
	ldr r0, _080795A8 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B121C
	b _080795C2
	.align 2, 0
_080795A8: .4byte gActiveUnit
_080795AC:
	ldr r0, _080795B8 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B123C
	b _080795C2
	.align 2, 0
_080795B8: .4byte gActiveUnit
_080795BC:
	mov r8, r8
	b _080795C2
_080795C0:
	mov r8, r8
_080795C2:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80795CC
sub_80795CC: @ 0x080795CC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793E4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80795E0
sub_80795E0: @ 0x080795E0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0xe
	beq _080795F6
	movs r0, #0
	b _080795F8
_080795F6:
	movs r0, #1
_080795F8:
	pop {r1}
	bx r1

	thumb_func_start sub_80795FC
sub_80795FC: @ 0x080795FC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80795E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807961C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_0807961C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079624
sub_8079624: @ 0x08079624
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r0, #0x18
	asrs r5, r0, #0x18
	lsrs r7, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793A0
	cmp r0, #0x13
	beq _08079680
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793A0
	cmp r0, #0x14
	beq _08079680
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793A0
	cmp r0, #0x15
	bne _08079668
	ldr r0, _0807967C @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x71
	bl GetUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08079680
_08079668:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x16
	beq _08079680
	movs r0, #0
	b _08079682
	.align 2, 0
_0807967C: .4byte gActiveUnit
_08079680:
	movs r0, #1
_08079682:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8079688
sub_8079688: @ 0x08079688
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8079624
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080796A8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_080796A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80796B0
sub_80796B0: @ 0x080796B0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x12
	beq _080796C6
	movs r0, #0
	b _080796C8
_080796C6:
	movs r0, #1
_080796C8:
	pop {r1}
	bx r1

	thumb_func_start sub_80796CC
sub_80796CC: @ 0x080796CC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80796B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080796EC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_080796EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80796F4
sub_80796F4: @ 0x080796F4
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x10
	beq _0807970A
	movs r0, #0
	b _0807970C
_0807970A:
	movs r0, #1
_0807970C:
	pop {r1}
	bx r1

	thumb_func_start sub_8079710
sub_8079710: @ 0x08079710
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80796F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079730
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_08079730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079738
sub_8079738: @ 0x08079738
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80793A0
	cmp r0, #0x11
	beq _0807974E
	movs r0, #0
	b _08079750
_0807974E:
	movs r0, #1
_08079750:
	pop {r1}
	bx r1

	thumb_func_start sub_8079754
sub_8079754: @ 0x08079754
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8079738
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079774
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80793E4
_08079774:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807977C
sub_807977C: @ 0x0807977C
	push {lr}
	bl sub_8079990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807978C
sub_807978C: @ 0x0807978C
	push {lr}
	bl sub_80799A0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079798
sub_8079798: @ 0x08079798
	push {lr}
	sub sp, #0x1c
	ldr r0, _080797CC @ =gPlaySt
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080797D0 @ =gUnk_08D6696C
	lsls r0, r1, #4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp]
	cmp r1, #0xb
	bhi _080797C4
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _080797C4
	mov r0, sp
	bl sub_80788D0
_080797C4:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_080797CC: .4byte gPlaySt
_080797D0: .4byte gUnk_08D6696C

	thumb_func_start sub_80797D4
sub_80797D4: @ 0x080797D4
	push {r4, lr}
	sub sp, #0x1c
	ldr r0, _08079818 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0807981C @ =gUnk_08D6696C
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r4, #0xb
	bhi _08079820
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _08079820
	mov r0, sp
	bl sub_80788D0
	cmp r4, #1
	bne _08079820
	bl sub_807D97C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079820
	movs r0, #1
	b _08079822
	.align 2, 0
_08079818: .4byte gPlaySt
_0807981C: .4byte gUnk_08D6696C
_08079820:
	movs r0, #0
_08079822:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807982C
sub_807982C: @ 0x0807982C
	push {lr}
	sub sp, #0x1c
	ldr r0, _0807986C @ =gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079870 @ =gUnk_08D6696C
	lsls r1, r2, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _0807987A
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _0807987A
	mov r0, sp
	bl sub_80789EC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08079874
	mov r0, sp
	bl sub_80788D0
	movs r0, #1
	b _0807987C
	.align 2, 0
_0807986C: .4byte gPlaySt
_08079870: .4byte gUnk_08D6696C
_08079874:
	mov r0, sp
	bl sub_80788F0
_0807987A:
	movs r0, #0
_0807987C:
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079884
sub_8079884: @ 0x08079884
	movs r0, #0
	bx lr

	thumb_func_start sub_8079888
sub_8079888: @ 0x08079888
	movs r0, #0
	bx lr

	thumb_func_start sub_807988C
sub_807988C: @ 0x0807988C
	movs r0, #0
	bx lr

	thumb_func_start sub_8079890
sub_8079890: @ 0x08079890
	movs r0, #0
	bx lr

	thumb_func_start sub_8079894
sub_8079894: @ 0x08079894
	push {lr}
	sub sp, #0x1c
	ldr r0, _080798CC @ =gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080798D0 @ =gUnk_08D6696C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _080798C2
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _080798C2
	mov r0, sp
	bl sub_80788D0
_080798C2:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_080798CC: .4byte gPlaySt
_080798D0: .4byte gUnk_08D6696C

	thumb_func_start sub_80798D4
sub_80798D4: @ 0x080798D4
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079900 @ =gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079904 @ =gUnk_08D6696C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _08079908
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _08079908
	movs r0, #1
	b _0807990A
	.align 2, 0
_08079900: .4byte gPlaySt
_08079904: .4byte gUnk_08D6696C
_08079908:
	movs r0, #0
_0807990A:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start CheckForWaitEvents
CheckForWaitEvents: @ 0x08079910
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079940 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _08079944 @ =gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	bne _08079948
	movs r0, #0
	b _0807994A
	.align 2, 0
_08079940: .4byte gPlaySt
_08079944: .4byte gActiveUnit
_08079948:
	movs r0, #1
_0807994A:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start RunWaitEvents
RunWaitEvents: @ 0x08079950
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079988 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _0807998C @ =gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_80788FC
	cmp r0, #0
	beq _08079982
	mov r0, sp
	bl sub_80788D0
_08079982:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
_08079988: .4byte gPlaySt
_0807998C: .4byte gActiveUnit

	thumb_func_start sub_8079990
sub_8079990: @ 0x08079990
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_80799A0
sub_80799A0: @ 0x080799A0
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080799BC
	bl sub_807977C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080799BC
	bl sub_807A208
_080799BC:
	pop {r0}
	bx r0

	thumb_func_start sub_80799C0
sub_80799C0: @ 0x080799C0
	push {r4, lr}
	ldr r4, _080799D8 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	beq _080799DC
	ldr r0, [r0, #0x10]
	b _080799DE
	.align 2, 0
_080799D8: .4byte gPlaySt
_080799DC:
	ldr r0, [r0, #0x14]
_080799DE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80799E4
sub_80799E4: @ 0x080799E4
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _08079A18 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventInfo
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	cmp r0, #0x27
	bne _08079A02
	bl sub_807E514
_08079A02:
	ldrb r0, [r5, #0x1b]
	cmp r0, #3
	bne _08079A20
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _08079A1C
	ldr r0, [r4, #0x24]
	b _08079A2C
	.align 2, 0
_08079A18: .4byte gPlaySt
_08079A1C:
	ldr r0, [r4, #0x20]
	b _08079A2C
_08079A20:
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _08079A34
	ldr r0, [r4, #0x1c]
_08079A2C:
	str r0, [sp, #4]
	bl LoadUnits
	b _08079A3C
_08079A34:
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	bl LoadUnits
_08079A3C:
	bl sub_807A198
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8079A50
sub_8079A50: @ 0x08079A50
	push {r4, lr}
	ldr r4, _08079A74 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	adds r1, r0, #0
	ldrb r0, [r4, #0x1b]
	cmp r0, #3
	bne _08079A7C
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	beq _08079A78
	ldr r0, [r1, #0x34]
	b _08079A8C
	.align 2, 0
_08079A74: .4byte gPlaySt
_08079A78:
	ldr r0, [r1, #0x30]
	b _08079A8C
_08079A7C:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _08079A8A
	ldr r0, [r1, #0x28]
	b _08079A8C
_08079A8A:
	ldr r0, [r1, #0x2c]
_08079A8C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079A94
sub_8079A94: @ 0x08079A94
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _08079AB0 @ =gUnk_08D66CE0
	ldr r1, _08079AB4 @ =gPlaySt
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08079AE0
	b _08079AE6
	.align 2, 0
_08079AB0: .4byte gUnk_08D66CE0
_08079AB4: .4byte gPlaySt
_08079AB8:
	adds r0, r3, #0
	b _08079AE8
_08079ABC:
	ldrb r2, [r3]
	cmp r5, r2
	bne _08079AC6
	cmp r4, r0
	beq _08079AD0
_08079AC6:
	ldrb r0, [r3, #1]
	cmp r5, r0
	bne _08079ADE
	cmp r4, r2
	bne _08079ADE
_08079AD0:
	ldrb r2, [r3, #2]
	cmp r2, #0x45
	beq _08079AB8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	cmp r0, r2
	beq _08079AB8
_08079ADE:
	adds r3, #0x10
_08079AE0:
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _08079ABC
_08079AE6:
	movs r0, #0
_08079AE8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079AF0
sub_8079AF0: @ 0x08079AF0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08079B2A
_08079AFA:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079B28
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079B28
	ldrb r1, [r4, #1]
	cmp r1, #0x45
	beq _08079B20
	ldr r0, _08079B24 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079B28
_08079B20:
	adds r0, r4, #0
	b _08079B32
	.align 2, 0
_08079B24: .4byte gPlaySt
_08079B28:
	adds r4, #0xc
_08079B2A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079AFA
	movs r0, #0
_08079B32:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8079B38
sub_8079B38: @ 0x08079B38
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08079B72
_08079B42:
	ldr r0, [r4, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079B70
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079B70
	ldrb r1, [r4, #1]
	cmp r1, #0x45
	beq _08079B68
	ldr r0, _08079B6C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079B70
_08079B68:
	adds r0, r4, #0
	b _08079B7A
	.align 2, 0
_08079B6C: .4byte gPlaySt
_08079B70:
	adds r4, #0x10
_08079B72:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079B42
	movs r0, #0
_08079B7A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8079B80
sub_8079B80: @ 0x08079B80
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08079BBA
_08079B8A:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079BB8
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079BB8
	ldrb r1, [r4, #1]
	cmp r1, #0x45
	beq _08079BB0
	ldr r0, _08079BB4 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079BB8
_08079BB0:
	adds r0, r4, #0
	b _08079BC2
	.align 2, 0
_08079BB4: .4byte gPlaySt
_08079BB8:
	adds r4, #0xc
_08079BBA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079B8A
	movs r0, #0
_08079BC2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CheckBattleTalk
CheckBattleTalk: @ 0x08079BC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	adds r0, r4, #0
	bl sub_8079A94
	cmp r0, #0
	beq _08079BEE
	ldr r0, [r0, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079C2C
	b _08079C1E
_08079BEE:
	ldr r6, _08079C24 @ =gUnk_08D66A34
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8079AF0
	cmp r0, #0
	bne _08079C1E
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8079AF0
	cmp r0, #0
	bne _08079C1E
	ldr r1, _08079C28 @ =gUnk_08D67070
	adds r0, r7, #0
	bl sub_8079AF0
	cmp r0, #0
	beq _08079C2C
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079C2C
_08079C1E:
	movs r0, #1
	b _08079C2E
	.align 2, 0
_08079C24: .4byte gUnk_08D66A34
_08079C28: .4byte gUnk_08D67070
_08079C2C:
	movs r0, #0
_08079C2E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start StartBattleTalk
StartBattleTalk: @ 0x08079C34
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r1, #0
	adds r0, r4, #0
	bl sub_8079A94
	adds r5, r0, #0
	cmp r5, #0
	beq _08079C78
	ldr r0, [r5, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079CD8
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _08079C66
	bl sub_800EC84
	b _08079C6C
_08079C66:
	ldr r0, [r5, #8]
	bl StartEvent
_08079C6C:
	bl sub_800AD60
	ldr r0, [r5, #0xc]
	bl SetFlag
	b _08079CD8
_08079C78:
	ldr r5, _08079CAC @ =gUnk_08D66A34
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8079AF0
	adds r4, r0, #0
	cmp r4, #0
	bne _08079C96
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8079AF0
	adds r4, r0, #0
	cmp r4, #0
	beq _08079CB0
_08079C96:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08079CA4
	bl sub_800EC84
	bl sub_800AD60
_08079CA4:
	ldr r0, [r4, #8]
	bl SetFlag
	b _08079CD8
	.align 2, 0
_08079CAC: .4byte gUnk_08D66A34
_08079CB0:
	ldr r1, _08079CE0 @ =gUnk_08D67070
	adds r0, r7, #0
	bl sub_8079AF0
	adds r4, r0, #0
	cmp r4, #0
	beq _08079CD8
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079CD8
	ldr r0, [r4, #4]
	bl sub_800EC84
	bl sub_800AD60
	ldr r0, [r4, #8]
	bl SetFlag
_08079CD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079CE0: .4byte gUnk_08D67070

	thumb_func_start sub_8079CE4
sub_8079CE4: @ 0x08079CE4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r1, _08079D20 @ =gUnk_08D6722C
	adds r0, r4, #0
	bl sub_8079B38
	cmp r0, #0
	bne _08079D1C
	ldr r6, _08079D24 @ =gPlaySt
	ldr r1, _08079D28 @ =gUnk_08D6716C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079D04
	ldr r1, _08079D2C @ =gUnk_08D670AC
_08079D04:
	adds r0, r4, #0
	bl sub_8079B80
	cmp r0, #0
	bne _08079D1C
	ldrb r6, [r6, #0x1b]
	cmp r6, #1
	beq _08079D30
	cmp r5, #0xf
	beq _08079D1C
	cmp r5, #0x15
	bne _08079D30
_08079D1C:
	movs r0, #1
	b _08079D32
	.align 2, 0
_08079D20: .4byte gUnk_08D6722C
_08079D24: .4byte gPlaySt
_08079D28: .4byte gUnk_08D6716C
_08079D2C: .4byte gUnk_08D670AC
_08079D30:
	movs r0, #0
_08079D32:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8079D38
sub_8079D38: @ 0x08079D38
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
_08079D42:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08079DE4
	ldr r0, [r4]
	cmp r0, #0
	beq _08079DE4
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _08079DE4
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079DE4
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #7
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl UnitKill
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _08079DDC @ =gBattleActor
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _08079D90
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_08079D90:
	ldr r0, _08079DE0 @ =gBattleTarget
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _08079DA2
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_08079DA2:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08079DBA
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_08079DBA:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08079DEA
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _08079DEA
	.align 2, 0
_08079DDC: .4byte gBattleActor
_08079DE0: .4byte gBattleTarget
_08079DE4:
	adds r5, #1
	cmp r5, #0x3f
	ble _08079D42
_08079DEA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079DF4
sub_8079DF4: @ 0x08079DF4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08079E44 @ =gPlaySt
	ldr r1, _08079E48 @ =gUnk_08D6716C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079E06
	ldr r1, _08079E4C @ =gUnk_08D670AC
_08079E06:
	adds r0, r5, #0
	bl sub_8079B80
	adds r4, r0, #0
	cmp r4, #0
	beq _08079E6A
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08079E1C
	bl StartEvent
_08079E1C:
	bl sub_800AD60
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #8]
	cmp r0, #0x65
	bne _08079E50
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	adds r1, r6, #0
	adds r1, #0x41
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	b _08079ECC
	.align 2, 0
_08079E44: .4byte gPlaySt
_08079E48: .4byte gUnk_08D6716C
_08079E4C: .4byte gUnk_08D670AC
_08079E50:
	adds r0, r5, #0
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08079ECC
	movs r0, #0x2c
	movs r1, #0
	bl StartBgm
	b _08079ECC
_08079E6A:
	ldr r1, _08079E84 @ =gUnk_08D6722C
	adds r0, r5, #0
	bl sub_8079B38
	adds r4, r0, #0
	cmp r4, #0
	beq _08079EB4
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08079E88
	bl sub_800EC84
	b _08079E92
	.align 2, 0
_08079E84: .4byte gUnk_08D6722C
_08079E88:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08079E92
	bl StartEvent
_08079E92:
	bl sub_800AD60
	ldr r0, [r4, #0xc]
	bl SetFlag
	adds r0, r5, #0
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08079EB4
	movs r0, #0x2c
	movs r1, #0
	bl StartBgm
_08079EB4:
	cmp r5, #0xf
	beq _08079EBE
	cmp r5, #0x15
	beq _08079EC6
	b _08079ECC
_08079EBE:
	movs r0, #0x15
	bl sub_8079D38
	b _08079ECC
_08079EC6:
	movs r0, #0xf
	bl sub_8079D38
_08079ECC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079ED4
sub_8079ED4: @ 0x08079ED4
	push {lr}
	movs r0, #0x65
	bl SetFlag
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	ldr r0, _08079EFC @ =gPlaySt
	adds r0, #0x41
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08079F00 @ =gUnk_08D6F71C
	bl StartEvent
	pop {r0}
	bx r0
	.align 2, 0
_08079EFC: .4byte gPlaySt
_08079F00: .4byte gUnk_08D6F71C

	thumb_func_start sub_8079F04
sub_8079F04: @ 0x08079F04
	movs r0, #0
	bx lr

	thumb_func_start nullsub_61
nullsub_61: @ 0x08079F08
	bx lr
	.align 2, 0

	thumb_func_start nullsub_62
nullsub_62: @ 0x08079F0C
	bx lr
	.align 2, 0

	thumb_func_start sub_8079F10
sub_8079F10: @ 0x08079F10
	movs r0, #0
	bx lr

	thumb_func_start nullsub_63
nullsub_63: @ 0x08079F14
	bx lr
	.align 2, 0

	thumb_func_start sub_8079F18
sub_8079F18: @ 0x08079F18
	movs r0, #0
	bx lr

	thumb_func_start sub_8079F1C
sub_8079F1C: @ 0x08079F1C
	movs r0, #0
	bx lr

	thumb_func_start nullsub_64
nullsub_64: @ 0x08079F20
	bx lr
	.align 2, 0

	thumb_func_start nullsub_65
nullsub_65: @ 0x08079F24
	bx lr
	.align 2, 0

	thumb_func_start nullsub_66
nullsub_66: @ 0x08079F28
	bx lr
	.align 2, 0

	thumb_func_start nullsub_67
nullsub_67: @ 0x08079F2C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_68
nullsub_68: @ 0x08079F30
	bx lr
	.align 2, 0

	thumb_func_start SetChapterFlag
SetChapterFlag: @ 0x08079F34
	adds r3, r0, #0
	cmp r3, #0
	beq _08079F5C
	subs r3, #1
	ldr r1, _08079F60 @ =0x030049F8
	adds r0, r3, #0
	cmp r3, #0
	bge _08079F46
	adds r0, r3, #7
_08079F46:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079F64 @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_08079F5C:
	bx lr
	.align 2, 0
_08079F60: .4byte 0x030049F8
_08079F64: .4byte gUnk_08D66A2C

	thumb_func_start CheckPermanentFlag
CheckPermanentFlag: @ 0x08079F68
	adds r3, r0, #0
	cmp r3, #0
	beq _08079F92
	subs r3, #1
	ldr r1, _08079F98 @ =0x030049F8
	adds r0, r3, #0
	cmp r3, #0
	bge _08079F7A
	adds r0, r3, #7
_08079F7A:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079F9C @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _08079FA0
_08079F92:
	movs r0, #0
	b _08079FA2
	.align 2, 0
_08079F98: .4byte 0x030049F8
_08079F9C: .4byte gUnk_08D66A2C
_08079FA0:
	movs r0, #1
_08079FA2:
	bx lr

	thumb_func_start ClearChapterFlag
ClearChapterFlag: @ 0x08079FA4
	adds r2, r0, #0
	cmp r2, #0
	beq _08079FD2
	subs r2, #1
	ldr r3, _08079FD4 @ =gUnk_08D66A2C
	adds r1, r2, #0
	cmp r2, #0
	bge _08079FB6
	adds r1, r2, #7
_08079FB6:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08079FD8 @ =0x030049F8
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_08079FD2:
	bx lr
	.align 2, 0
_08079FD4: .4byte gUnk_08D66A2C
_08079FD8: .4byte 0x030049F8

	thumb_func_start sub_8079FDC
sub_8079FDC: @ 0x08079FDC
	ldr r1, _08079FEC @ =0x030049F8
	movs r2, #0
	adds r0, r1, #5
_08079FE2:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08079FE2
	bx lr
	.align 2, 0
_08079FEC: .4byte 0x030049F8

	thumb_func_start SetPermanentFlag
SetPermanentFlag: @ 0x08079FF0
	adds r3, r0, #0
	cmp r3, #0x63
	ble _0807A01C
	cmp r3, #0x64
	beq _0807A01C
	subs r3, #0x65
	ldr r1, _0807A020 @ =0x030049F0
	adds r0, r3, #0
	cmp r3, #0
	bge _0807A006
	adds r0, r3, #7
_0807A006:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _0807A024 @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_0807A01C:
	bx lr
	.align 2, 0
_0807A020: .4byte 0x030049F0
_0807A024: .4byte gUnk_08D66A2C

	thumb_func_start CheckChapterFlag
CheckChapterFlag: @ 0x0807A028
	adds r3, r0, #0
	cmp r3, #0x64
	ble _0807A052
	subs r3, #0x65
	ldr r1, _0807A058 @ =0x030049F0
	adds r0, r3, #0
	cmp r3, #0
	bge _0807A03A
	adds r0, r3, #7
_0807A03A:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _0807A05C @ =gUnk_08D66A2C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _0807A060
_0807A052:
	movs r0, #0
	b _0807A062
	.align 2, 0
_0807A058: .4byte 0x030049F0
_0807A05C: .4byte gUnk_08D66A2C
_0807A060:
	movs r0, #1
_0807A062:
	bx lr

	thumb_func_start ClearPermanentFlag
ClearPermanentFlag: @ 0x0807A064
	adds r2, r0, #0
	cmp r2, #0x63
	ble _0807A096
	cmp r2, #0x64
	beq _0807A096
	subs r2, #0x65
	ldr r3, _0807A098 @ =gUnk_08D66A2C
	adds r1, r2, #0
	cmp r2, #0
	bge _0807A07A
	adds r1, r2, #7
_0807A07A:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0807A09C @ =0x030049F0
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0807A096:
	bx lr
	.align 2, 0
_0807A098: .4byte gUnk_08D66A2C
_0807A09C: .4byte 0x030049F0

	thumb_func_start sub_807A0A0
sub_807A0A0: @ 0x0807A0A0
	ldr r1, _0807A0B0 @ =0x030049F0
	movs r2, #0
	adds r0, r1, #7
_0807A0A6:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0807A0A6
	bx lr
	.align 2, 0
_0807A0B0: .4byte 0x030049F0

	thumb_func_start SetFlag
SetFlag: @ 0x0807A0B4
	push {lr}
	cmp r0, #0x63
	bgt _0807A0C0
	bl SetChapterFlag
	b _0807A0C4
_0807A0C0:
	bl SetPermanentFlag
_0807A0C4:
	pop {r0}
	bx r0

	thumb_func_start CheckFlag
CheckFlag: @ 0x0807A0C8
	push {lr}
	cmp r0, #0x63
	ble _0807A0D4
	bl CheckChapterFlag
	b _0807A0D8
_0807A0D4:
	bl CheckPermanentFlag
_0807A0D8:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start ClearFlag
ClearFlag: @ 0x0807A0E0
	push {lr}
	cmp r0, #0x63
	bgt _0807A0EC
	bl ClearChapterFlag
	b _0807A0F0
_0807A0EC:
	bl ClearPermanentFlag
_0807A0F0:
	pop {r0}
	bx r0

	thumb_func_start GetPermanentFlagBits
GetPermanentFlagBits: @ 0x0807A0F4
	ldr r0, _0807A0F8 @ =0x030049F0
	bx lr
	.align 2, 0
_0807A0F8: .4byte 0x030049F0

	thumb_func_start sub_807A0FC
sub_807A0FC: @ 0x0807A0FC
	movs r0, #8
	bx lr

	thumb_func_start sub_807A100
sub_807A100: @ 0x0807A100
	ldr r0, _0807A104 @ =0x030049F8
	bx lr
	.align 2, 0
_0807A104: .4byte 0x030049F8

	thumb_func_start sub_807A108
sub_807A108: @ 0x0807A108
	movs r0, #6
	bx lr

	thumb_func_start sub_807A10C
sub_807A10C: @ 0x0807A10C
	ldr r1, _0807A11C @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807A120
	movs r0, #0
	b _0807A122
	.align 2, 0
_0807A11C: .4byte gPlaySt
_0807A120:
	movs r0, #1
_0807A122:
	bx lr

	thumb_func_start sub_807A124
sub_807A124: @ 0x0807A124
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, _0807A14C @ =gUnk_08D68388
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807A158
	ldr r0, [r2]
	ldrb r3, [r0, #4]
	movs r4, #0x80
	lsls r4, r4, #9
_0807A138:
	ldrb r0, [r1, #1]
	cmp r3, r0
	bne _0807A150
	ldr r0, [r2, #0xc]
	ands r0, r4
	cmp r0, #0
	beq _0807A150
	movs r0, #1
	b _0807A15A
	.align 2, 0
_0807A14C: .4byte gUnk_08D68388
_0807A150:
	adds r1, #8
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807A138
_0807A158:
	movs r0, #0
_0807A15A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807A160
sub_807A160: @ 0x0807A160
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0807A16C @ =gUnk_08D6792C
	b _0807A17A
	.align 2, 0
_0807A16C: .4byte gUnk_08D6792C
_0807A170:
	cmp r1, r0
	bne _0807A178
	ldr r0, [r2, #4]
	b _0807A18E
_0807A178:
	adds r2, #8
_0807A17A:
	ldrb r1, [r2]
	cmp r1, #0
	bne _0807A170
	ldr r0, _0807A194 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x14]
_0807A18E:
	pop {r1}
	bx r1
	.align 2, 0
_0807A194: .4byte gPlaySt

	thumb_func_start sub_807A198
sub_807A198: @ 0x0807A198
	push {r4, r5, lr}
	ldr r1, _0807A1E0 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0807A1D8
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0807A1D8
	movs r5, #0x81
_0807A1AE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807A1D2
	ldr r0, [r4]
	cmp r0, #0
	beq _0807A1D2
	ldrb r0, [r0, #4]
	bl sub_807A160
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A1D2
	adds r0, r4, #0
	bl UnitApplyBonusLevels
_0807A1D2:
	adds r5, #1
	cmp r5, #0xbf
	ble _0807A1AE
_0807A1D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A1E0: .4byte gPlaySt

	thumb_func_start sub_807A1E4
sub_807A1E4: @ 0x0807A1E4
	ldr r1, _0807A1EC @ =gUnk_08D68478
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	b _0807A1FC
	.align 2, 0
_0807A1EC: .4byte gUnk_08D68478
_0807A1F0:
	ldrb r0, [r1]
	cmp r0, r2
	bne _0807A1FA
	movs r0, #1
	b _0807A204
_0807A1FA:
	adds r1, #1
_0807A1FC:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807A1F0
	movs r0, #0
_0807A204:
	bx lr
	.align 2, 0

	thumb_func_start sub_807A208
sub_807A208: @ 0x0807A208
	push {lr}
	ldr r0, _0807A228 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x3c]
	bl StartEvent
	movs r0, #0x91
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
_0807A228: .4byte gPlaySt

	thumb_func_start sub_807A22C
sub_807A22C: @ 0x0807A22C
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A25C @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807A254
	bl sub_807AE5C
	cmp r0, #0
	bne _0807A254
	movs r0, #0x9c
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
_0807A254:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A25C: .4byte gPlaySt

	thumb_func_start sub_807A260
sub_807A260: @ 0x0807A260
	push {lr}
	movs r0, #0x8f
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807A26C
sub_807A26C: @ 0x0807A26C
	push {lr}
	movs r0, #0x8f
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A27E
	movs r0, #0
	b _0807A280
_0807A27E:
	movs r0, #1
_0807A280:
	pop {r1}
	bx r1

	thumb_func_start sub_807A284
sub_807A284: @ 0x0807A284
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _0807A2D4 @ =gUnk_08D68480
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A2B8
	adds r4, r1, #0
	adds r4, #0xc
_0807A298:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807A2AE
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0807A2AE:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _0807A298
_0807A2B8:
	cmp r5, #0
	beq _0807A2D8
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _0807A2DA
	.align 2, 0
_0807A2D4: .4byte gUnk_08D68480
_0807A2D8:
	movs r0, #0xff
_0807A2DA:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A2E4
sub_807A2E4: @ 0x0807A2E4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _0807A334 @ =gUnk_08D68498
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A318
	adds r4, r1, #0
	adds r4, #0xc
_0807A2F8:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807A30E
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0807A30E:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _0807A2F8
_0807A318:
	cmp r5, #0
	beq _0807A338
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _0807A33A
	.align 2, 0
_0807A334: .4byte gUnk_08D68498
_0807A338:
	movs r0, #0xff
_0807A33A:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A344
sub_807A344: @ 0x0807A344
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _0807A394 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A378
	adds r4, r1, #0
	adds r4, #0xc
_0807A358:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807A36E
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0807A36E:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _0807A358
_0807A378:
	cmp r5, #0
	beq _0807A398
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _0807A39A
	.align 2, 0
_0807A394: .4byte gUnk_08D684B0
_0807A398:
	movs r0, #0xff
_0807A39A:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A3A4
sub_807A3A4: @ 0x0807A3A4
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A3D8 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A3BC
	adds r1, #0xc
_0807A3B2:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _0807A3B2
_0807A3BC:
	bl GetGameTime
	movs r1, #0xf
	ands r1, r0
	adds r0, r1, #0
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A3D8: .4byte gUnk_08D684B0

	thumb_func_start sub_807A3DC
sub_807A3DC: @ 0x0807A3DC
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A410 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A3F4
	adds r1, #0xc
_0807A3EA:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _0807A3EA
_0807A3F4:
	bl GetGameTime
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A410: .4byte gUnk_08D684B0

	thumb_func_start sub_807A414
sub_807A414: @ 0x0807A414
	push {r4, lr}
	movs r4, #0
	ldr r1, _0807A448 @ =gUnk_08D684B0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0807A42C
	adds r1, #0xc
_0807A422:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _0807A422
_0807A42C:
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A448: .4byte gUnk_08D684B0

	thumb_func_start sub_807A44C
sub_807A44C: @ 0x0807A44C
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #1
_0807A452:
	adds r0, r5, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A47A
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A47A
	ldr r0, [r0, #0xc]
	ldr r1, _0807A488 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0807A47A
	ldrb r0, [r2, #4]
	cmp r0, #0x14
	bne _0807A474
	adds r4, #1
_0807A474:
	cmp r0, #0x24
	bne _0807A47A
	adds r4, #1
_0807A47A:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807A452
	cmp r4, #2
	beq _0807A48C
	movs r0, #0
	b _0807A48E
	.align 2, 0
_0807A488: .4byte 0x00010004
_0807A48C:
	movs r0, #1
_0807A48E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A494
sub_807A494: @ 0x0807A494
	push {r4, lr}
	movs r4, #1
_0807A498:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A4C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A4C0
	ldr r0, [r0, #0xc]
	ldr r1, _0807A4BC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0807A4C0
	ldrb r2, [r2, #4]
	cmp r2, #5
	bne _0807A4C0
	movs r0, #1
	b _0807A4C8
	.align 2, 0
_0807A4BC: .4byte 0x00010004
_0807A4C0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A498
	movs r0, #0
_0807A4C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A4D0
sub_807A4D0: @ 0x0807A4D0
	movs r0, #1
	bx lr

	thumb_func_start sub_807A4D4
sub_807A4D4: @ 0x0807A4D4
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4D8
sub_807A4D8: @ 0x0807A4D8
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4DC
sub_807A4DC: @ 0x0807A4DC
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4E0
sub_807A4E0: @ 0x0807A4E0
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4E4
sub_807A4E4: @ 0x0807A4E4
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4E8
sub_807A4E8: @ 0x0807A4E8
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4EC
sub_807A4EC: @ 0x0807A4EC
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4F0
sub_807A4F0: @ 0x0807A4F0
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4F4
sub_807A4F4: @ 0x0807A4F4
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4F8
sub_807A4F8: @ 0x0807A4F8
	movs r0, #0
	bx lr

	thumb_func_start sub_807A4FC
sub_807A4FC: @ 0x0807A4FC
	movs r0, #0
	bx lr

	thumb_func_start sub_807A500
sub_807A500: @ 0x0807A500
	movs r0, #0
	bx lr

	thumb_func_start sub_807A504
sub_807A504: @ 0x0807A504
	movs r0, #0
	bx lr

	thumb_func_start sub_807A508
sub_807A508: @ 0x0807A508
	movs r0, #0
	bx lr

	thumb_func_start sub_807A50C
sub_807A50C: @ 0x0807A50C
	movs r0, #0
	bx lr

	thumb_func_start sub_807A510
sub_807A510: @ 0x0807A510
	movs r0, #0
	bx lr

	thumb_func_start sub_807A514
sub_807A514: @ 0x0807A514
	movs r0, #0
	bx lr

	thumb_func_start sub_807A518
sub_807A518: @ 0x0807A518
	movs r0, #0
	bx lr

	thumb_func_start sub_807A51C
sub_807A51C: @ 0x0807A51C
	movs r0, #0
	bx lr

	thumb_func_start sub_807A520
sub_807A520: @ 0x0807A520
	movs r0, #0
	bx lr

	thumb_func_start sub_807A524
sub_807A524: @ 0x0807A524
	movs r0, #0
	bx lr

	thumb_func_start sub_807A528
sub_807A528: @ 0x0807A528
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_0807A52E:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A54C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A54C
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A54C
	adds r5, #1
_0807A54C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A52E
	cmp r5, #3
	ble _0807A55A
	movs r0, #0
	b _0807A55C
_0807A55A:
	movs r0, #1
_0807A55C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A564
sub_807A564: @ 0x0807A564
	movs r0, #0
	bx lr

	thumb_func_start sub_807A568
sub_807A568: @ 0x0807A568
	push {lr}
	bl EndPlayerPhaseSideWindows
	ldr r0, _0807A58C @ =gPlaySt
	movs r1, #2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _0807A57A
	movs r1, #1
_0807A57A:
	adds r0, r1, #0
	bl GetUnitFromCharId
	movs r1, #0
	bl sub_802D148
	pop {r0}
	bx r0
	.align 2, 0
_0807A58C: .4byte gPlaySt

	thumb_func_start sub_807A590
sub_807A590: @ 0x0807A590
	push {r4, lr}
	movs r4, #1
_0807A594:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A5C2
	ldr r3, [r2]
	cmp r3, #0
	beq _0807A5C2
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A5C2
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _0807A5C2
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #0x13
	ble _0807A5C8
	movs r0, #1
	b _0807A5CA
_0807A5C2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A594
_0807A5C8:
	movs r0, #0
_0807A5CA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_807A5D0
sub_807A5D0: @ 0x0807A5D0
	push {r4, lr}
	bl sub_807A620
	movs r4, #1
_0807A5D8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A614
	ldr r3, [r2]
	cmp r3, #0
	beq _0807A614
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A614
	ldr r0, _0807A610 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807A614
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _0807A614
	adds r0, r2, #0
	bl UnitLevelUp
	movs r0, #0x90
	bl SetFlag
	b _0807A61A
	.align 2, 0
_0807A610: .4byte 0x0001000C
_0807A614:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A5D8
_0807A61A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807A620
sub_807A620: @ 0x0807A620
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _0807A63A
_0807A62C:
	cmp r0, #0xc
	bne _0807A638
	adds r0, r4, #0
	bl sub_802C6DC
	subs r4, #8
_0807A638:
	adds r4, #8
_0807A63A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0807A62C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807A648
sub_807A648: @ 0x0807A648
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	thumb_func_start sub_807A654
sub_807A654: @ 0x0807A654
	ldr r0, _0807A668 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807A66C
	movs r0, #1
	b _0807A66E
	.align 2, 0
_0807A668: .4byte gpKeySt
_0807A66C:
	movs r0, #0
_0807A66E:
	bx lr

	thumb_func_start sub_807A670
sub_807A670: @ 0x0807A670
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	thumb_func_start sub_807A67C
sub_807A67C: @ 0x0807A67C
	ldr r0, _0807A690 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807A694
	movs r0, #0
	b _0807A696
	.align 2, 0
_0807A690: .4byte gpKeySt
_0807A694:
	movs r0, #1
_0807A696:
	bx lr

	thumb_func_start sub_807A698
sub_807A698: @ 0x0807A698
	push {lr}
	movs r0, #0
	bl sub_801DEFC
	pop {r0}
	bx r0

	thumb_func_start sub_807A6A4
sub_807A6A4: @ 0x0807A6A4
	push {lr}
	bl GetGold
	ldr r1, _0807A6B8 @ =0x00001388
	adds r0, r0, r1
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_0807A6B8: .4byte 0x00001388

	thumb_func_start sub_807A6BC
sub_807A6BC: @ 0x0807A6BC
	push {r4, lr}
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _0807A6D2
	bl GetGold
	subs r0, r0, r4
	bl SetGold
_0807A6D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807A6D8
sub_807A6D8: @ 0x0807A6D8
	adds r1, r0, #0
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A6E8
	subs r0, r2, #1
	strb r0, [r1, #0x12]
_0807A6E8:
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A6F6
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_0807A6F6:
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A704
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_0807A704:
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A712
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_0807A712:
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A720
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_0807A720:
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A72E
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_0807A72E:
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0807A73C
	subs r0, r2, #1
	strb r0, [r1, #0x19]
_0807A73C:
	bx lr
	.align 2, 0

	thumb_func_start sub_807A740
sub_807A740: @ 0x0807A740
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitFromCharId
	bl sub_807A6D8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807A754
sub_807A754: @ 0x0807A754
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0807A75C:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A784
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A784
	ldr r0, [r0, #0xc]
	ldr r1, _0807A780 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807A784
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807A784
	movs r0, #1
	b _0807A78C
	.align 2, 0
_0807A780: .4byte 0x0001000C
_0807A784:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A75C
	movs r0, #0
_0807A78C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A794
sub_807A794: @ 0x0807A794
	push {lr}
	movs r0, #9
	bl sub_807A754
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A7A4
sub_807A7A4: @ 0x0807A7A4
	push {lr}
	movs r0, #0x28
	bl sub_807A754
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A7B4
sub_807A7B4: @ 0x0807A7B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0807A7BC:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A7E0
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A7E0
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A7E0
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807A7E0
	movs r0, #1
	b _0807A7E8
_0807A7E0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A7BC
	movs r0, #0
_0807A7E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807A7F0
sub_807A7F0: @ 0x0807A7F0
	push {lr}
	movs r0, #0x1a
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A800
sub_807A800: @ 0x0807A800
	push {lr}
	movs r0, #0xe
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A810
sub_807A810: @ 0x0807A810
	push {lr}
	movs r0, #0x28
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A820
sub_807A820: @ 0x0807A820
	push {lr}
	movs r0, #0x25
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A830
sub_807A830: @ 0x0807A830
	push {lr}
	movs r0, #0x23
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A840
sub_807A840: @ 0x0807A840
	push {lr}
	movs r0, #0x14
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A850
sub_807A850: @ 0x0807A850
	push {lr}
	movs r0, #0x24
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A860
sub_807A860: @ 0x0807A860
	push {lr}
	movs r0, #0x1b
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A870
sub_807A870: @ 0x0807A870
	push {lr}
	movs r0, #8
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A880
sub_807A880: @ 0x0807A880
	push {lr}
	movs r0, #0x11
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A890
sub_807A890: @ 0x0807A890
	push {lr}
	movs r0, #0x13
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8A0
sub_807A8A0: @ 0x0807A8A0
	push {lr}
	movs r0, #0x1c
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8B0
sub_807A8B0: @ 0x0807A8B0
	push {lr}
	movs r0, #0x17
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8C0
sub_807A8C0: @ 0x0807A8C0
	push {lr}
	movs r0, #0x2f
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8D0
sub_807A8D0: @ 0x0807A8D0
	push {lr}
	movs r0, #0x18
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8E0
sub_807A8E0: @ 0x0807A8E0
	push {lr}
	movs r0, #0x30
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A8F0
sub_807A8F0: @ 0x0807A8F0
	push {lr}
	movs r0, #0xd
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A900
sub_807A900: @ 0x0807A900
	push {lr}
	movs r0, #0x2e
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A910
sub_807A910: @ 0x0807A910
	push {lr}
	movs r0, #0x1d
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A920
sub_807A920: @ 0x0807A920
	push {lr}
	movs r0, #0x31
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A930
sub_807A930: @ 0x0807A930
	push {lr}
	movs r0, #0x33
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A940
sub_807A940: @ 0x0807A940
	push {lr}
	movs r0, #0x15
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A950
sub_807A950: @ 0x0807A950
	push {lr}
	movs r0, #0xf
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A960
sub_807A960: @ 0x0807A960
	push {lr}
	movs r0, #0x36
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A970
sub_807A970: @ 0x0807A970
	push {lr}
	movs r0, #0x22
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A980
sub_807A980: @ 0x0807A980
	push {lr}
	movs r0, #0x27
	bl sub_807A7B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A990
sub_807A990: @ 0x0807A990
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0807A998:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A9B2
	ldr r0, [r0]
	cmp r0, #0
	beq _0807A9B2
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0807A9B2
	movs r0, #1
	b _0807A9BA
_0807A9B2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A998
	movs r0, #0
_0807A9BA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A9C0
sub_807A9C0: @ 0x0807A9C0
	push {lr}
	movs r0, #0x11
	bl sub_807A990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A9D0
sub_807A9D0: @ 0x0807A9D0
	push {lr}
	movs r0, #0x13
	bl sub_807A990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A9E0
sub_807A9E0: @ 0x0807A9E0
	push {lr}
	movs r0, #0x1b
	bl sub_807A990
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807A9F0
sub_807A9F0: @ 0x0807A9F0
	push {r4, lr}
	movs r4, #0x81
_0807A9F4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AA14
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AA14
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AA14
	movs r0, #1
	b _0807AA1C
_0807AA14:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A9F4
	movs r0, #0
_0807AA1C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA24
sub_807AA24: @ 0x0807AA24
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_0807AA2A:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AA4C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AA4C
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AA4C
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807AA4C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807AA2A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA5C
sub_807AA5C: @ 0x0807AA5C
	push {lr}
	bl sub_807A9F0
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807AA6C
	movs r1, #1
_0807AA6C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA74
sub_807AA74: @ 0x0807AA74
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x41
_0807AA7C:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807AAA0
	ldr r2, [r0]
	cmp r2, #0
	beq _0807AAA0
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AAA0
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807AAA0
	movs r0, #1
	b _0807AAA8
_0807AAA0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807AA7C
	movs r0, #0
_0807AAA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AAB0
sub_807AAB0: @ 0x0807AAB0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807AAB6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AADC
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AADC
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807AADC
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0807AADC
	adds r5, #1
_0807AADC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807AAB6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AAEC
sub_807AAEC: @ 0x0807AAEC
	push {r4, lr}
	movs r4, #0x41
_0807AAF0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AB10
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AB10
	ldr r0, [r1, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0807AB10
	movs r0, #0
	b _0807AB18
_0807AB10:
	adds r4, #1
	cmp r4, #0x7f
	ble _0807AAF0
	movs r0, #1
_0807AB18:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AB20
sub_807AB20: @ 0x0807AB20
	push {lr}
	movs r0, #0x45
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB30
sub_807AB30: @ 0x0807AB30
	push {lr}
	movs r0, #0x3b
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB40
sub_807AB40: @ 0x0807AB40
	push {lr}
	movs r0, #0x7f
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB50
sub_807AB50: @ 0x0807AB50
	push {lr}
	movs r0, #0x80
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB60
sub_807AB60: @ 0x0807AB60
	push {lr}
	movs r0, #0x81
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB70
sub_807AB70: @ 0x0807AB70
	push {lr}
	movs r0, #0x82
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB80
sub_807AB80: @ 0x0807AB80
	push {lr}
	movs r0, #0x24
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AB90
sub_807AB90: @ 0x0807AB90
	push {lr}
	movs r0, #0x20
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABA0
sub_807ABA0: @ 0x0807ABA0
	push {lr}
	movs r0, #0x2b
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABB0
sub_807ABB0: @ 0x0807ABB0
	push {lr}
	movs r0, #0x37
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABC0
sub_807ABC0: @ 0x0807ABC0
	push {lr}
	movs r0, #0x11
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABD0
sub_807ABD0: @ 0x0807ABD0
	push {lr}
	movs r0, #0x13
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABE0
sub_807ABE0: @ 0x0807ABE0
	push {lr}
	movs r0, #8
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807ABF0
sub_807ABF0: @ 0x0807ABF0
	push {lr}
	movs r0, #0x4c
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC00
sub_807AC00: @ 0x0807AC00
	push {lr}
	movs r0, #0x65
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC10
sub_807AC10: @ 0x0807AC10
	push {lr}
	movs r0, #0x66
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC20
sub_807AC20: @ 0x0807AC20
	push {lr}
	movs r0, #0xa3
	bl sub_807AA74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AC30
sub_807AC30: @ 0x0807AC30
	push {lr}
	movs r0, #1
	movs r1, #0x2d
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC44
sub_807AC44: @ 0x0807AC44
	push {lr}
	movs r0, #1
	movs r1, #0x25
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC58
sub_807AC58: @ 0x0807AC58
	push {lr}
	movs r0, #1
	movs r1, #0x1e
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC6C
sub_807AC6C: @ 0x0807AC6C
	push {lr}
	movs r0, #2
	movs r1, #0x2d
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC80
sub_807AC80: @ 0x0807AC80
	push {lr}
	movs r0, #2
	movs r1, #0x31
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AC94
sub_807AC94: @ 0x0807AC94
	push {lr}
	movs r0, #2
	movs r1, #0x1f
	bl sub_8027090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807ACA8
sub_807ACA8: @ 0x0807ACA8
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	adds r4, r5, #1
	b _0807ACDA
_0807ACB6:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807ACD8
	ldr r2, [r0]
	cmp r2, #0
	beq _0807ACD8
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807ACD8
	ldrb r2, [r2, #4]
	cmp r2, r7
	bne _0807ACD8
	adds r6, #1
_0807ACD8:
	adds r4, #1
_0807ACDA:
	adds r0, r5, #0
	adds r0, #0x40
	cmp r4, r0
	blt _0807ACB6
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807ACEC
sub_807ACEC: @ 0x0807ACEC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _0807AD18
_0807ACF6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AD14
	ldr r0, [r1]
	cmp r0, #0
	beq _0807AD14
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AD14
	adds r6, #1
_0807AD14:
	adds r4, #1
	adds r0, r5, #0
_0807AD18:
	adds r0, #0x40
	cmp r4, r0
	blt _0807ACF6
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AD28
sub_807AD28: @ 0x0807AD28
	movs r1, #0
	ldr r0, _0807AD38 @ =gPlaySt
	ldrh r0, [r0, #0x10]
	cmp r0, #0x14
	bls _0807AD34
	movs r1, #1
_0807AD34:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD38: .4byte gPlaySt

	thumb_func_start sub_807AD3C
sub_807AD3C: @ 0x0807AD3C
	movs r1, #0
	ldr r0, _0807AD4C @ =gPlaySt
	ldrh r0, [r0, #0x10]
	cmp r0, #0x19
	bls _0807AD48
	movs r1, #1
_0807AD48:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD4C: .4byte gPlaySt

	thumb_func_start sub_807AD50
sub_807AD50: @ 0x0807AD50
	movs r1, #0
	ldr r0, _0807AD60 @ =gPlaySt
	ldrh r0, [r0, #0x10]
	cmp r0, #0x1e
	bls _0807AD5C
	movs r1, #1
_0807AD5C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD60: .4byte gPlaySt

	thumb_func_start sub_807AD64
sub_807AD64: @ 0x0807AD64
	movs r1, #0
	ldr r0, _0807AD74 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807AD70
	movs r1, #1
_0807AD70:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD74: .4byte gPlaySt

	thumb_func_start sub_807AD78
sub_807AD78: @ 0x0807AD78
	movs r1, #0
	ldr r0, _0807AD88 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _0807AD84
	movs r1, #1
_0807AD84:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AD88: .4byte gPlaySt

	thumb_func_start sub_807AD8C
sub_807AD8C: @ 0x0807AD8C
	ldr r0, _0807ADA4 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	lsrs r1, r1, #0xe
	movs r0, #1
	bics r0, r1
	bx lr
	.align 2, 0
_0807ADA4: .4byte gActiveUnit

	thumb_func_start sub_807ADA8
sub_807ADA8: @ 0x0807ADA8
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807ADC0 @ =0x0000270F
	cmp r0, r1
	ble _0807ADB8
	movs r2, #1
_0807ADB8:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807ADC0: .4byte 0x0000270F

	thumb_func_start sub_807ADC4
sub_807ADC4: @ 0x0807ADC4
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807ADDC @ =0x00001F3F
	cmp r0, r1
	ble _0807ADD4
	movs r2, #1
_0807ADD4:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807ADDC: .4byte 0x00001F3F

	thumb_func_start sub_807ADE0
sub_807ADE0: @ 0x0807ADE0
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807ADF8 @ =0x0000176F
	cmp r0, r1
	ble _0807ADF0
	movs r2, #1
_0807ADF0:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807ADF8: .4byte 0x0000176F

	thumb_func_start sub_807ADFC
sub_807ADFC: @ 0x0807ADFC
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807AE14 @ =0x00001387
	cmp r0, r1
	ble _0807AE0C
	movs r2, #1
_0807AE0C:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807AE14: .4byte 0x00001387

	thumb_func_start sub_807AE18
sub_807AE18: @ 0x0807AE18
	push {lr}
	bl GetTalkChoiceResult
	movs r1, #0
	cmp r0, #1
	bne _0807AE26
	movs r1, #1
_0807AE26:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807AE2C
sub_807AE2C: @ 0x0807AE2C
	ldr r0, _0807AE38 @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807AE38: .4byte gPlaySt

	thumb_func_start sub_807AE3C
sub_807AE3C: @ 0x0807AE3C
	ldr r0, _0807AE48 @ =gPlaySt
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807AE48: .4byte gPlaySt

	thumb_func_start sub_807AE4C
sub_807AE4C: @ 0x0807AE4C
	push {lr}
	movs r0, #0x9b
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_807AE5C
sub_807AE5C: @ 0x0807AE5C
	ldr r0, _0807AE68 @ =gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807AE68: .4byte gPlaySt

	thumb_func_start sub_807AE6C
sub_807AE6C: @ 0x0807AE6C
	push {lr}
	bl sub_809F9F8
	cmp r0, #0
	beq _0807AE78
	movs r0, #1
_0807AE78:
	pop {r1}
	bx r1

	thumb_func_start sub_807AE7C
sub_807AE7C: @ 0x0807AE7C
	push {lr}
	bl sub_807AA24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _0807AE8E
	movs r0, #0
	b _0807AE90
_0807AE8E:
	movs r0, #1
_0807AE90:
	pop {r1}
	bx r1

	thumb_func_start sub_807AE94
sub_807AE94: @ 0x0807AE94
	movs r1, #0
	ldr r0, _0807AEA4 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807AEA0
	movs r1, #1
_0807AEA0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AEA4: .4byte gPlaySt

	thumb_func_start sub_807AEA8
sub_807AEA8: @ 0x0807AEA8
	push {lr}
	ldr r0, _0807AEC0 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807AEBA
	movs r1, #1
_0807AEBA:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807AEC0: .4byte gActiveUnit

	thumb_func_start sub_807AEC4
sub_807AEC4: @ 0x0807AEC4
	movs r0, #0
	bx lr

	thumb_func_start sub_807AEC8
sub_807AEC8: @ 0x0807AEC8
	push {lr}
	ldr r1, _0807AEEC @ =gPlaySt
	movs r0, #8
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0807AEE2
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0807AEE8
_0807AEE2:
	movs r0, #4
	bl FadeBgmOut
_0807AEE8:
	pop {r0}
	bx r0
	.align 2, 0
_0807AEEC: .4byte gPlaySt

	thumb_func_start sub_807AEF0
sub_807AEF0: @ 0x0807AEF0
	ldr r0, _0807AF08 @ =gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807AF0C
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807AF0C
	movs r0, #0
	b _0807AF0E
	.align 2, 0
_0807AF08: .4byte gPlaySt
_0807AF0C:
	movs r0, #1
_0807AF0E:
	bx lr

	thumb_func_start sub_807AF10
sub_807AF10: @ 0x0807AF10
	movs r1, #0
	ldr r0, _0807AF20 @ =gActionSt
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	bne _0807AF1C
	movs r1, #1
_0807AF1C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807AF20: .4byte gActionSt

	thumb_func_start sub_807AF24
sub_807AF24: @ 0x0807AF24
	push {lr}
	movs r0, #0
	bl SetkeyStIgnoredMask
	pop {r0}
	bx r0

	thumb_func_start sub_807AF30
sub_807AF30: @ 0x0807AF30
	push {lr}
	movs r0, #2
	bl NewKeyStSetter
	pop {r0}
	bx r0

	thumb_func_start sub_807AF3C
sub_807AF3C: @ 0x0807AF3C
	push {lr}
	ldr r0, _0807AF4C @ =gUnk_08D6F770
	movs r1, #4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807AF4C: .4byte gUnk_08D6F770

	thumb_func_start sub_807AF50
sub_807AF50: @ 0x0807AF50
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807AF94 @ =gUnk_0843F164
	ldr r4, _0807AF98 @ =gPal + 0x240
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0807AF9C @ =0xFFFFFDC0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AF94: .4byte gUnk_0843F164
_0807AF98: .4byte gPal + 0x240
_0807AF9C: .4byte 0xFFFFFDC0

	thumb_func_start sub_807AFA0
sub_807AFA0: @ 0x0807AFA0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r0, _0807AFC4 @ =gUnk_08D6F7D4
	bl Proc_EndEach
	ldr r0, _0807AFC8 @ =gUnk_0843F164
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0807AFC4: .4byte gUnk_08D6F7D4
_0807AFC8: .4byte gUnk_0843F164

	thumb_func_start sub_807AFCC
sub_807AFCC: @ 0x0807AFCC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _0807B044
	movs r5, #0
	ldr r0, _0807B030 @ =0x0203E644
	ldrb r0, [r0]
	cmp r5, r0
	bge _0807B0D6
	ldr r6, _0807B034 @ =gBmSt
_0807AFE8:
	adds r0, r5, #0
	bl sub_804B95C
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	movs r3, #0xc
	ldrsh r2, [r6, r3]
	subs r4, r1, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807B038 @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807B03C @ =gUnk_08D6F798
	ldr r3, _0807B040 @ =0x00002822
	bl PutOamHiRam
	adds r5, #1
	ldr r0, _0807B030 @ =0x0203E644
	ldrb r0, [r0]
	cmp r5, r0
	blt _0807AFE8
	b _0807B0D6
	.align 2, 0
_0807B030: .4byte 0x0203E644
_0807B034: .4byte gBmSt
_0807B038: .4byte 0x000001FF
_0807B03C: .4byte gUnk_08D6F798
_0807B040: .4byte 0x00002822
_0807B044:
	cmp r1, #1
	bne _0807B094
	ldr r0, _0807B084 @ =gActiveUnit
	ldr r3, [r0]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	ldr r2, _0807B088 @ =gBmSt
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r4, r0, r1
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #1
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807B08C @ =gUnk_08D6F798
	ldr r3, _0807B090 @ =0x00002822
	bl PutOamHiRam
	b _0807B0D6
	.align 2, 0
_0807B084: .4byte gActiveUnit
_0807B088: .4byte gBmSt
_0807B08C: .4byte gUnk_08D6F798
_0807B090: .4byte 0x00002822
_0807B094:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0807B0D6
	ldr r6, _0807B118 @ =gBmSt
	adds r5, r1, #0
_0807B09E:
	ldrb r4, [r5]
	lsls r1, r4, #4
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	subs r4, r1, r0
	ldrb r3, [r5, #1]
	lsls r1, r3, #4
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r2, r1, r0
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807B11C @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807B120 @ =gUnk_08D6F798
	ldr r3, _0807B124 @ =0x00002822
	bl PutOamHiRam
	adds r5, #4
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0807B09E
_0807B0D6:
	bl GetGameTime
	adds r5, r0, #0
	movs r0, #1
	mov sb, r0
	ands r5, r0
	cmp r5, #0
	bne _0807B14C
	mov r6, r8
	adds r6, #0x66
	movs r1, #0
	ldrsh r7, [r6, r1]
	cmp r7, #0
	beq _0807B128
	mov r4, r8
	adds r4, #0x64
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r0, #0x10
	movs r1, #0
	bl sub_807AF50
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807B14C
	strh r5, [r4]
	strh r5, [r6]
	b _0807B14C
	.align 2, 0
_0807B118: .4byte gBmSt
_0807B11C: .4byte 0x000001FF
_0807B120: .4byte gUnk_08D6F798
_0807B124: .4byte 0x00002822
_0807B128:
	mov r4, r8
	adds r4, #0x64
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #0
	movs r1, #0x10
	bl sub_807AF50
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807B14C
	strh r7, [r4]
	mov r1, sb
	strh r1, [r6]
_0807B14C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807B158
sub_807B158: @ 0x0807B158
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0807B1A8 @ =gActiveUnit
	ldr r0, [r6]
	bl sub_8031994
	ldr r4, _0807B1AC @ =0x0203E644
	bl sub_804B950
	strb r0, [r4]
	cmp r5, #0
	bne _0807B1B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807B1CE
	ldr r0, _0807B1B0 @ =gUnk_08D6F7B4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x54]
	movs r0, #0
	bl sub_804B95C
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl EnsureCameraOntoPosition
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	b _0807B1CE
	.align 2, 0
_0807B1A8: .4byte gActiveUnit
_0807B1AC: .4byte 0x0203E644
_0807B1B0: .4byte gUnk_08D6F7B4
_0807B1B4:
	ldr r0, _0807B1D4 @ =gUnk_08D6F7B4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x54]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
_0807B1CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B1D4: .4byte gUnk_08D6F7B4

	thumb_func_start sub_807B1D8
sub_807B1D8: @ 0x0807B1D8
	adds r0, #0x64
	movs r1, #0xf
	strh r1, [r0]
	bx lr

	thumb_func_start sub_807B1E0
sub_807B1E0: @ 0x0807B1E0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807B20E
	bl sub_8083B80
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807B21A
	ldr r0, _0807B220 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0807B21A
_0807B20E:
	ldr r0, _0807B224 @ =gUnk_08D6F7B4
	bl Proc_EndEach
	adds r0, r4, #0
	bl Proc_Break
_0807B21A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B220: .4byte gpKeySt
_0807B224: .4byte gUnk_08D6F7B4

	thumb_func_start sub_807B228
sub_807B228: @ 0x0807B228
	push {r4, lr}
	bl sub_8083B80
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0807B23E
	ldr r0, _0807B248 @ =gUnk_08D6F7D4
	movs r1, #3
	bl Proc_Start
_0807B23E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807B248: .4byte gUnk_08D6F7D4

	thumb_func_start sub_807B24C
sub_807B24C: @ 0x0807B24C
	push {r4, r5, r6, r7, lr}
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r5, r0, #0
	movs r7, #0x10
	ldrsb r7, [r5, r7]
	movs r6, #0x11
	ldrsb r6, [r5, r6]
	movs r4, #1
_0807B262:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807B298
	ldr r0, [r2]
	cmp r0, #0
	beq _0807B298
	cmp r2, r5
	beq _0807B298
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _0807B298
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0807B298
	ldr r1, [r2, #0xc]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0807B298
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807B298:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807B262
	bl RefreshUnitSprites
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807B2A8
sub_807B2A8: @ 0x0807B2A8
	push {r4, lr}
	movs r4, #1
_0807B2AC:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807B2CE
	ldr r0, [r2]
	cmp r0, #0
	beq _0807B2CE
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807B2CE
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0807B2CE:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807B2AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B2DC
sub_807B2DC: @ 0x0807B2DC
	push {r4, lr}
	movs r4, #0x41
_0807B2E0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807B2F8
	ldr r0, [r1]
	cmp r0, #0
	beq _0807B2F8
	adds r0, r1, #0
	bl ClearUnit
_0807B2F8:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B2E0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807B304
sub_807B304: @ 0x0807B304
	push {r4, lr}
	movs r4, #0x81
_0807B308:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807B320
	ldr r0, [r1]
	cmp r0, #0
	beq _0807B320
	adds r0, r1, #0
	bl ClearUnit
_0807B320:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B308
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807B32C
sub_807B32C: @ 0x0807B32C
	push {r4, r5, r6, lr}
	movs r4, #0x41
_0807B330:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807B348
	ldr r0, [r1]
	cmp r0, #0
	beq _0807B348
	adds r0, r1, #0
	bl ClearUnit
_0807B348:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B330
	movs r5, #1
	movs r6, #0
_0807B352:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807B392
	ldr r0, [r4]
	cmp r0, #0
	beq _0807B392
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	ldr r0, _0807B3A8 @ =0x0671E00C
	ands r1, r0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0xc]
	strb r6, [r4, #0x1b]
_0807B392:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807B352
	bl RefreshEntityMaps
	bl EndAllMus
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B3A8: .4byte 0x0671E00C

	thumb_func_start sub_807B3AC
sub_807B3AC: @ 0x0807B3AC
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807B3CA
	bl LockBmDisplay
	bl LockMus
	movs r0, #0
	strb r0, [r4]
_0807B3CA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ImmediateDisplayMap
ImmediateDisplayMap: @ 0x0807B3D0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807B3F6
	movs r0, #0xff
	strb r0, [r2]
	bl RefreshBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	b _0807B3FA
_0807B3F6:
	bl RefreshBMapGraphics
_0807B3FA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B400
sub_807B400: @ 0x0807B400
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807B426
	movs r0, #0xff
	strb r0, [r2]
	bl InitMoreBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	b _0807B42A
_0807B426:
	bl InitMoreBMapGraphics
_0807B42A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TryLockParentProc
TryLockParentProc: @ 0x0807B430
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryLockProc
	pop {r0}
	bx r0

	thumb_func_start TryUnlockParentProc
TryUnlockParentProc: @ 0x0807B43C
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryUnlockProc
	pop {r0}
	bx r0

	thumb_func_start sub_807B448
sub_807B448: @ 0x0807B448
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r2, _0807B474 @ =gDispIo
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
	pop {r0}
	bx r0
	.align 2, 0
_0807B474: .4byte gDispIo

	thumb_func_start sub_807B478
sub_807B478: @ 0x0807B478
	push {r4, lr}
	movs r0, #0x26
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x25
	bl GetUnitFromCharId
	adds r1, r0, #0
	adds r0, r4, #0
	bl SwapUnitStats
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B498
sub_807B498: @ 0x0807B498
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl StartScreenFlashing
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B4C0
sub_807B4C0: @ 0x0807B4C0
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0x80
	lsls r1, r1, #2
	str r1, [sp]
	subs r1, #0xc0
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl StartScreenFlashing
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start sub_807B4E8
sub_807B4E8: @ 0x0807B4E8
	adds r0, #0x4d
	movs r3, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807B52C @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807B530 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #0x1f
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r3, [r2]
	orrs r0, r3
	strb r0, [r2]
	bx lr
	.align 2, 0
_0807B52C: .4byte gDispIo
_0807B530: .4byte 0x0000FFE0

	thumb_func_start sub_807B534
sub_807B534: @ 0x0807B534
	ldr r2, _0807B554 @ =gDispIo
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
	bx lr
	.align 2, 0
_0807B554: .4byte gDispIo

	thumb_func_start sub_807B558
sub_807B558: @ 0x0807B558
	ldr r2, _0807B574 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_0807B574: .4byte gDispIo

	.align 2, 0

