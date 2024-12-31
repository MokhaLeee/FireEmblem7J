	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_8025114
sub_8025114: @ 0x08025114
	ldr r1, _08025120 @ =gUnitSpriteSyncRequest
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08025120: .4byte gUnitSpriteSyncRequest

	thumb_func_start ApplyUnitSpritePalettes
ApplyUnitSpritePalettes: @ 0x08025124
	push {lr}
	ldr r0, _0802514C @ =Pal_UnitSprites
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r1, _08025150 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08025158
	ldr r0, _08025154 @ =Pal_UnitSpritesPurple
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08025164
	.align 2, 0
_0802514C: .4byte Pal_UnitSprites
_08025150: .4byte gBmSt
_08025154: .4byte Pal_UnitSpritesPurple
_08025158:
	ldr r0, _08025168 @ =gUnk_08190188
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
_08025164:
	pop {r0}
	bx r0
	.align 2, 0
_08025168: .4byte gUnk_08190188

	thumb_func_start sub_802516C
sub_802516C: @ 0x0802516C
	push {lr}
	ldr r0, _08025180 @ =gUnk_081901A8
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08025180: .4byte gUnk_081901A8

	thumb_func_start ResetUnitSprites
ResetUnitSprites: @ 0x08025184
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _080251AC @ =gUnitSpriteLargeAllocCount
	ldr r6, _080251B0 @ =gUnitSpriteSmallAllocCount
	ldr r4, _080251B4 @ =gUnitSpriteSlots
	movs r3, #0xff
_08025190:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08025190
	movs r0, #0
	str r0, [r5]
	movs r0, #0x3f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080251AC: .4byte gUnitSpriteLargeAllocCount
_080251B0: .4byte gUnitSpriteSmallAllocCount
_080251B4: .4byte gUnitSpriteSlots

	thumb_func_start ResetUnitSpritesB
ResetUnitSpritesB: @ 0x080251B8
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _080251E0 @ =gUnitSpriteLargeAllocCount
	ldr r6, _080251E4 @ =gUnitSpriteSmallAllocCount
	ldr r4, _080251E8 @ =gUnitSpriteSlots
	movs r3, #0xff
_080251C4:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _080251C4
	movs r0, #0
	str r0, [r5]
	movs r0, #0x5f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080251E0: .4byte gUnitSpriteLargeAllocCount
_080251E4: .4byte gUnitSpriteSmallAllocCount
_080251E8: .4byte gUnitSpriteSlots

	thumb_func_start UseUnitSprite
UseUnitSprite: @ 0x080251EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r1, _08025228 @ =gUnk_08C03104
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r5, _0802522C @ =gUnk_08D613B8
	movs r4, #0x7f
	ands r4, r7
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08025230 @ =gUnk_08C03100
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08025244
	cmp r0, #1
	bgt _08025234
	cmp r0, #0
	beq _0802523A
	b _08025262
	.align 2, 0
_08025228: .4byte gUnk_08C03104
_0802522C: .4byte gUnk_08D613B8
_08025230: .4byte gUnk_08C03100
_08025234:
	cmp r0, #2
	beq _0802524E
	b _08025262
_0802523A:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage16x16
	b _08025256
_08025244:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage16x32
	b _08025256
_0802524E:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage32x32
_08025256:
	ldr r2, _08025274 @ =gUnitSpriteSlots
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_08025262:
	ldr r0, _08025274 @ =gUnitSpriteSlots
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08025274: .4byte gUnitSpriteSlots

	thumb_func_start StartUiSMS
StartUiSMS: @ 0x08025278
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _080252B0 @ =gUnitSpriteSlots
	adds r7, r6, r0
	ldrb r1, [r7]
	cmp r1, #0xff
	bne _0802532C
	ldr r5, _080252B4 @ =gUnk_08D613B8
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _080252B8 @ =gUnk_08C03100
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _080252E0
	cmp r0, #1
	bgt _080252BC
	cmp r0, #0
	beq _080252C2
	b _08025322
	.align 2, 0
_080252B0: .4byte gUnitSpriteSlots
_080252B4: .4byte gUnk_08D613B8
_080252B8: .4byte gUnk_08C03100
_080252BC:
	cmp r0, #2
	beq _080252FC
	b _08025322
_080252C2:
	ldr r4, _080252DC @ =gUnitSpriteSmallAllocCount
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_8025344
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	subs r0, #1
	b _08025320
	.align 2, 0
_080252DC: .4byte gUnitSpriteSmallAllocCount
_080252E0:
	ldr r4, _080252F8 @ =gUnitSpriteLargeAllocCount
	ldr r0, [r4]
	adds r1, r6, #0
	bl ApplyUnitSpriteImage16x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #2
	b _08025320
	.align 2, 0
_080252F8: .4byte gUnitSpriteLargeAllocCount
_080252FC:
	ldr r4, _08025338 @ =gUnitSpriteLargeAllocCount
	ldr r1, [r4]
	movs r0, #0x1e
	ands r0, r1
	cmp r0, #0x1e
	bne _0802530C
	adds r0, r1, #2
	str r0, [r4]
_0802530C:
	ldr r0, [r4]
	adds r1, r6, #0
	bl ApplyUnitSpriteImage32x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #4
_08025320:
	str r0, [r4]
_08025322:
	ldr r1, _0802533C @ =gUnitSpriteSyncRequest
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08025340 @ =gUnitSpriteSlots
_0802532C:
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08025338: .4byte gUnitSpriteLargeAllocCount
_0802533C: .4byte gUnitSpriteSyncRequest
_08025340: .4byte gUnitSpriteSlots

	thumb_func_start sub_8025344
sub_8025344: @ 0x08025344
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _080253CC @ =gUnk_08C03114
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	mov sb, r0
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r6, #0
	ldr r0, _080253D0 @ =gUnk_08C03100
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #3
	add r0, sb
	ldr r2, _080253D4 @ =0x02033F10
	adds r4, r0, r2
	movs r3, #0x40
	mov r8, r3
	movs r7, #0
	lsls r5, r1, #7
_0802537E:
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	lsls r1, r6, #0xd
	ldr r2, _080253D4 @ =0x02033F10
	add r2, sb
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuFastSet
	mov r2, sl
	ldr r0, [r2]
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r4, r4, r3
	add r8, r5
	adds r7, r7, r5
	adds r6, #1
	cmp r6, #2
	ble _0802537E
	ldr r0, _080253CC @ =gUnk_08C03114
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080253CC: .4byte gUnk_08C03114
_080253D0: .4byte gUnk_08C03100
_080253D4: .4byte 0x02033F10

	thumb_func_start ApplyUnitSpriteImage16x16
ApplyUnitSpriteImage16x16: @ 0x080253D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	mov sb, r1
	ldr r1, _080254A4 @ =gUnk_08C03114
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r5, r0, #5
	mov r1, sb
	lsrs r0, r1, #7
	movs r2, #1
	mov sb, r2
	mov r1, sb
	bics r1, r0
	mov sb, r1
	movs r7, #0
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0xc]
	ldr r0, _080254A8 @ =0x02033F10
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r5, r1
	mov r2, r8
	adds r6, r0, r2
	movs r0, #0x40
	str r0, [sp, #0x10]
	movs r1, #0
	mov sl, r1
_0802541E:
	movs r2, #0
	str r2, [sp]
	lsls r4, r7, #0xd
	mov r0, r8
	adds r1, r5, r0
	adds r1, r4, r1
	mov r0, sp
	ldr r2, _080254AC @ =0x01000010
	bl CpuFastSet
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	adds r1, r4, r1
	adds r1, r1, r5
	ldr r0, [sp, #0xc]
	ldr r2, _080254AC @ =0x01000010
	bl CpuFastSet
	ldr r2, _080254B0 @ =gUnk_08C03100
	ldr r0, [r2]
	add r0, sl
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	adds r4, r4, r1
	adds r4, r4, r5
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _080254B0 @ =gUnk_08C03100
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	add sl, r0
	adds r7, #1
	cmp r7, #2
	ble _0802541E
	ldr r0, _080254A4 @ =gUnk_08C03114
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080254A4: .4byte gUnk_08C03114
_080254A8: .4byte 0x02033F10
_080254AC: .4byte 0x01000010
_080254B0: .4byte gUnk_08C03100

	thumb_func_start ApplyUnitSpriteImage16x32
ApplyUnitSpriteImage16x32: @ 0x080254B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08025598 @ =gUnk_08C03114
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov sb, r0
	ldr r2, _0802559C @ =gUnk_08C03100
	mov r8, r2
	ldr r3, _080255A0 @ =0x02033F10
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	str r3, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r2, #0x40
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #8
_080254FA:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, sb
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x10
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x10
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #2
	ble _080254FA
	ldr r0, _08025598 @ =gUnk_08C03114
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08025598: .4byte gUnk_08C03114
_0802559C: .4byte gUnk_08C03100
_080255A0: .4byte 0x02033F10

	thumb_func_start ApplyUnitSpriteImage32x32
ApplyUnitSpriteImage32x32: @ 0x080255A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _0802568C @ =gUnk_08C03114
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov sb, r0
	ldr r2, _08025690 @ =gUnk_08C03100
	mov r8, r2
	ldr r3, _08025694 @ =0x02033F10
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	lsls r3, r3, #1
	str r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r2, #0x80
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #9
_080255EE:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, sb
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x20
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x20
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #2
	ble _080255EE
	ldr r0, _0802568C @ =gUnk_08C03114
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802568C: .4byte gUnk_08C03114
_08025690: .4byte gUnk_08C03100
_08025694: .4byte 0x02033F10

	thumb_func_start TornOutUnitSprite
TornOutUnitSprite: @ 0x08025698
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	bl GetUnitSMSId
	str r0, [sp, #4]
	bl StartUiSMS
	lsls r6, r0, #5
	ldr r1, _08025700 @ =gUnk_08C031D4
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x43
	ble _080256D0
	movs r4, #1
_080256D0:
	cmp r1, #0x23
	ble _080256D6
	movs r4, #2
_080256D6:
	cmp r1, #0x1f
	ble _080256DC
	movs r4, #1
_080256DC:
	cmp r1, #0
	blt _080256E2
	movs r4, #0
_080256E2:
	ldr r1, _08025704 @ =gUnk_08D613B8
	movs r0, #0x7f
	ldr r3, [sp, #4]
	ands r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08025790
	cmp r0, #1
	bgt _08025708
	cmp r0, #0
	beq _08025710
	b _0802596A
	.align 2, 0
_08025700: .4byte gUnk_08C031D4
_08025704: .4byte gUnk_08D613B8
_08025708:
	cmp r0, #2
	bne _0802570E
	b _08025888
_0802570E:
	b _0802596A
_08025710:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r7, _08025784 @ =0x02033F10
	mov sb, r7
	lsrs r7, r5, #1
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r4, #0xf
	lsls r4, r0
_08025726:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r0, r6, r7
	adds r0, r0, r3
	mov r1, sb
	adds r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r7, r1
	adds r0, r6, r0
	adds r0, r0, r3
	mov r3, sb
	adds r1, r0, r3
_08025744:
	adds r0, r4, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r2, #0x20
	adds r1, #0x20
	adds r5, #1
	cmp r5, #1
	ble _08025744
	mov r1, r8
	cmp r1, #2
	ble _08025726
	ldr r7, _08025784 @ =0x02033F10
	adds r0, r6, r7
	add r0, sl
	ldr r2, _08025788 @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	add r0, sl
	adds r0, r0, r6
	ldr r7, _0802578C @ =0x06011400
	adds r1, r6, r7
	b _0802586C
	.align 2, 0
_08025784: .4byte 0x02033F10
_08025788: .4byte 0x06011000
_0802578C: .4byte 0x06011400
_08025790:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r2, _08025874 @ =0x02033F10
	mov sb, r2
	lsrs r3, r5, #1
	str r3, [sp, #8]
	bics r0, r5
	lsls r0, r0, #2
	movs r7, #0xf
	mov ip, r7
	mov r2, ip
	lsls r2, r0
	mov ip, r2
_080257AC:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r4, r3, #0
	ldr r3, [sp, #8]
	adds r0, r6, r3
	adds r0, r0, r4
	mov r7, sb
	adds r3, r0, r7
_080257C0:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r2, r7
	adds r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #1
	ble _080257C0
	mov r1, r8
	cmp r1, #2
	ble _080257AC
	ldr r1, _08025874 @ =0x02033F10
	adds r0, r6, r1
	add r0, sl
	ldr r2, _08025878 @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _08025874 @ =0x02033F10
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _0802587C @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _08025874 @ =0x02033F10
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025880 @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _08025874 @ =0x02033F10
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025884 @ =0x06011C00
	adds r1, r6, r2
_0802586C:
	movs r2, #0x10
	bl CpuFastSet
	b _0802596A
	.align 2, 0
_08025874: .4byte 0x02033F10
_08025878: .4byte 0x06011000
_0802587C: .4byte 0x06011400
_08025880: .4byte 0x06011800
_08025884: .4byte 0x06011C00
_08025888:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r3, _0802598C @ =0x02033F10
	mov sb, r3
	lsrs r7, r5, #1
	str r7, [sp, #8]
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r2, #0xf
	mov ip, r2
	mov r3, ip
	lsls r3, r0
	mov ip, r3
_080258A6:
	movs r5, #0
	adds r7, r1, #1
	mov r8, r7
	lsls r4, r1, #0xd
	ldr r1, [sp, #8]
	adds r0, r6, r1
	adds r0, r0, r4
	mov r2, sb
	adds r3, r0, r2
_080258B8:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r7, [r3]
	ands r0, r7
	strb r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #3
	ble _080258B8
	mov r1, r8
	cmp r1, #2
	ble _080258A6
	ldr r1, _0802598C @ =0x02033F10
	adds r0, r6, r1
	add r0, sl
	ldr r2, _08025990 @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _0802598C @ =0x02033F10
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025994 @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _0802598C @ =0x02033F10
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025998 @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _0802598C @ =0x02033F10
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _0802599C @ =0x06011C00
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
_0802596A:
	ldr r3, [sp]
	cmp r3, #0x3f
	bne _0802597A
	ldr r0, _080259A0 @ =gUnitSpriteSlots
	ldr r7, [sp, #4]
	adds r0, r7, r0
	movs r1, #0xff
	strb r1, [r0]
_0802597A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802598C: .4byte 0x02033F10
_08025990: .4byte 0x06011000
_08025994: .4byte 0x06011400
_08025998: .4byte 0x06011800
_0802599C: .4byte 0x06011C00
_080259A0: .4byte gUnitSpriteSlots

	thumb_func_start sub_80259A4
sub_80259A4: @ 0x080259A4
	push {r4, r5, lr}
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r4, r0, #0
	adds r5, r4, #0
	cmp r4, #0
	bne _080259C4
	ldr r0, _080259FC @ =0x02033F10
	ldr r1, _08025A00 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_080259C4:
	cmp r4, #0x20
	bne _080259D4
	ldr r0, _08025A04 @ =0x02035F10
	ldr r1, _08025A00 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_080259D4:
	cmp r4, #0x24
	bne _080259E4
	ldr r0, _08025A08 @ =0x02037F10
	ldr r1, _08025A00 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_080259E4:
	cmp r5, #0x44
	bne _080259F4
	ldr r0, _08025A04 @ =0x02035F10
	ldr r1, _08025A00 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_080259F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080259FC: .4byte 0x02033F10
_08025A00: .4byte 0x06011000
_08025A04: .4byte 0x02035F10
_08025A08: .4byte 0x02037F10

	thumb_func_start ForceSyncUnitSpriteSheet
ForceSyncUnitSpriteSheet: @ 0x08025A0C
	push {lr}
	ldr r0, _08025A2C @ =gUnitSpriteSyncRequest
	movs r1, #0
	str r1, [r0]
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r0, #0x43
	bgt _08025A38
	cmp r0, #0x23
	ble _08025A34
	ldr r0, _08025A30 @ =0x02037F10
	b _08025A3A
	.align 2, 0
_08025A2C: .4byte gUnitSpriteSyncRequest
_08025A30: .4byte 0x02037F10
_08025A34:
	cmp r0, #0x1f
	ble _08025A50
_08025A38:
	ldr r0, _08025A48 @ =0x02035F10
_08025A3A:
	ldr r1, _08025A4C @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
	b _08025A60
	.align 2, 0
_08025A48: .4byte 0x02035F10
_08025A4C: .4byte 0x06011000
_08025A50:
	cmp r1, #0
	blt _08025A60
	ldr r0, _08025A64 @ =0x02033F10
	ldr r1, _08025A68 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
_08025A60:
	pop {r0}
	bx r0
	.align 2, 0
_08025A64: .4byte 0x02033F10
_08025A68: .4byte 0x06011000

	thumb_func_start sub_8025A6C
sub_8025A6C: @ 0x08025A6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0
	bne _08025A86
	ldr r2, _08025AD0 @ =0x02033F10
_08025A86:
	cmp r0, #0x20
	bne _08025A8C
	ldr r2, _08025AD4 @ =0x02035F10
_08025A8C:
	cmp r0, #0x24
	bne _08025A92
	ldr r2, _08025AD8 @ =0x02037F10
_08025A92:
	cmp r1, #0x44
	bne _08025A98
	ldr r2, _08025AD4 @ =0x02035F10
_08025A98:
	cmp r2, #0
	beq _08025AC8
	ldr r1, _08025ADC @ =gUnk_08C03104
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_08025AB0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _08025AB0
_08025AC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025AD0: .4byte 0x02033F10
_08025AD4: .4byte 0x02035F10
_08025AD8: .4byte 0x02037F10
_08025ADC: .4byte gUnk_08C03104

	thumb_func_start sub_8025AE0
sub_8025AE0: @ 0x08025AE0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0x43
	bgt _08025B08
	cmp r0, #0x23
	ble _08025B04
	ldr r2, _08025B00 @ =0x02037F10
	b _08025B16
	.align 2, 0
_08025B00: .4byte 0x02037F10
_08025B04:
	cmp r0, #0x1f
	ble _08025B10
_08025B08:
	ldr r2, _08025B0C @ =0x02035F10
	b _08025B16
	.align 2, 0
_08025B0C: .4byte 0x02035F10
_08025B10:
	cmp r1, #0
	blt _08025B16
	ldr r2, _08025B4C @ =0x02033F10
_08025B16:
	cmp r2, #0
	beq _08025B46
	ldr r1, _08025B50 @ =gUnk_08C03104
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_08025B2E:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataMove
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _08025B2E
_08025B46:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025B4C: .4byte 0x02033F10
_08025B50: .4byte gUnk_08C03104

	thumb_func_start sub_8025B54
sub_8025B54: @ 0x08025B54
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08025B68
	movs r0, #0xb
	b _08025B7A
_08025B68:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08025B78
	adds r0, r2, #0
	bl sub_8025B80
	b _08025B7A
_08025B78:
	movs r0, #0xf
_08025B7A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8025B80
sub_8025B80: @ 0x08025B80
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0x40
	beq _08025BA6
	cmp r1, #0x40
	bgt _08025B94
	cmp r1, #0
	beq _08025B9E
	b _08025BAC
_08025B94:
	cmp r1, #0x80
	beq _08025BA2
	cmp r1, #0xc0
	beq _08025BAA
	b _08025BAC
_08025B9E:
	movs r0, #0xc
	b _08025BAC
_08025BA2:
	movs r0, #0xd
	b _08025BAC
_08025BA6:
	movs r0, #0xe
	b _08025BAC
_08025BAA:
	movs r0, #0xb
_08025BAC:
	bx lr
	.align 2, 0

	thumb_func_start RefreshUnitSprites
RefreshUnitSprites: @ 0x08025BB0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _08025CB8 @ =0x0203A3C8
	ldr r1, _08025CBC @ =gUnitSprites
	mov r2, r8
	str r2, [r1]
	movs r2, #0x80
	lsls r2, r2, #3
	strh r2, [r1, #6]
	adds r1, #0xc
	str r1, [r0]
	movs r7, #1
_08025BD0:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08025C7A
	ldr r0, [r6]
	cmp r0, #0
	beq _08025C7A
	movs r0, #0
	str r0, [r6, #0x3c]
	ldr r0, [r6, #0xc]
	ldr r1, _08025CC0 @ =0x00000201
	ands r0, r1
	cmp r0, #0
	bne _08025C7A
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	ldr r0, _08025CC4 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025C7A
	lsls r0, r2, #4
	bl AddUnitSprite
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl GetUnitSMSId
	bl StartUiSMS
	adds r4, r0, #0
	adds r0, r6, #0
	bl sub_8025B54
	adds r4, #0x80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r4, r4, r1
	strh r4, [r5, #8]
	adds r0, r6, #0
	bl GetUnitSMSId
	ldr r2, _08025CC8 @ =gUnk_08D613B8
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #2]
	adds r2, r0, #0
	strb r0, [r5, #0xb]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08025C66
	adds r0, r2, #3
	strb r0, [r5, #0xb]
_08025C66:
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08025C78
	ldrb r0, [r5, #0xb]
	adds r0, #0x40
	strb r0, [r5, #0xb]
_08025C78:
	str r5, [r6, #0x3c]
_08025C7A:
	adds r7, #1
	cmp r7, #0xc5
	ble _08025BD0
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08025D44
	ldr r1, _08025CCC @ =0xFFFFC080
	adds r6, r1, #0
	ldr r7, _08025CD0 @ =gUnk_08D6164A
	movs r2, #0x28
	adds r2, r2, r7
	mov sb, r2
_08025C9A:
	cmp r0, #1
	bne _08025D0E
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08025D0E
	ldrb r0, [r4, #3]
	cmp r0, #0x35
	beq _08025CDE
	cmp r0, #0x35
	bgt _08025CD4
	cmp r0, #0x34
	beq _08025CDA
	b _08025CF0
	.align 2, 0
_08025CB8: .4byte 0x0203A3C8
_08025CBC: .4byte gUnitSprites
_08025CC0: .4byte 0x00000201
_08025CC4: .4byte gBmMapUnit
_08025CC8: .4byte gUnk_08D613B8
_08025CCC: .4byte 0xFFFFC080
_08025CD0: .4byte gUnk_08D6164A
_08025CD4:
	cmp r0, #0x36
	beq _08025CE2
	b _08025CF0
_08025CDA:
	movs r0, #0x52
	b _08025CE4
_08025CDE:
	movs r0, #0x53
	b _08025CE4
_08025CE2:
	movs r0, #0x54
_08025CE4:
	bl StartUiSMS
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08025CF0:
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	mov r2, r8
	strh r2, [r5, #8]
	ldrh r0, [r7]
	strb r0, [r5, #0xb]
_08025D0E:
	ldrb r0, [r4, #2]
	cmp r0, #0xc
	bne _08025D3C
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	movs r0, #0x57
	bl StartUiSMS
	ldr r2, _08025D5C @ =0xFFFFB080
	adds r0, r0, r2
	strh r0, [r5, #8]
	mov r1, sb
	ldrh r0, [r1]
	strb r0, [r5, #0xb]
_08025D3C:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08025C9A
_08025D44:
	ldr r0, _08025D60 @ =gUnitSpriteSyncRequest
	ldr r0, [r0]
	cmp r0, #0
	beq _08025D50
	bl ForceSyncUnitSpriteSheet
_08025D50:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025D5C: .4byte 0xFFFFB080
_08025D60: .4byte gUnitSpriteSyncRequest

	thumb_func_start AddUnitSprite
AddUnitSprite: @ 0x08025D64
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08025D80 @ =gUnitSprites
	ldr r3, _08025D84 @ =0x0203A3C8
_08025D6C:
	ldr r1, [r2]
	cmp r1, #0
	beq _08025D88
	movs r5, #6
	ldrsh r0, [r1, r5]
	cmp r0, r4
	blt _08025D88
	adds r2, r1, #0
	b _08025D6C
	.align 2, 0
_08025D80: .4byte gUnitSprites
_08025D84: .4byte 0x0203A3C8
_08025D88:
	ldr r0, [r3]
	str r1, [r0]
	str r0, [r2]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r3]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PutUnitSpritesOam
PutUnitSpritesOam: @ 0x08025D9C
	push {r4, r5, r6, lr}
	ldr r0, _08025E10 @ =gUnitSprites
	ldr r6, [r0]
	bl PutUnitSpriteIconsOam
	cmp r6, #0
	bne _08025DAC
	b _08025F1E
_08025DAC:
	movs r3, #0
	movs r0, #4
	ldrsh r1, [r6, r0]
	ldr r2, _08025E14 @ =gBmSt
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r5, #6
	ldrsh r1, [r6, r5]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _08025DD2
	b _08025F16
_08025DD2:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bls _08025DDC
	b _08025F16
_08025DDC:
	movs r0, #0x80
	ldrb r1, [r6, #0xb]
	ands r0, r1
	cmp r0, #0
	beq _08025DE8
	b _08025F16
_08025DE8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08025DFA
	bl GetGameTime
	adds r3, r0, #0
	movs r0, #2
	ands r3, r0
_08025DFA:
	movs r0, #0xf
	ldrb r2, [r6, #0xb]
	ands r0, r2
	cmp r0, #5
	bls _08025E06
	b _08025F16
_08025E06:
	lsls r0, r0, #2
	ldr r1, _08025E18 @ =_08025E1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025E10: .4byte gUnitSprites
_08025E14: .4byte gBmSt
_08025E18: .4byte _08025E1C
_08025E1C: @ jump table
	.4byte _08025E34 @ case 0
	.4byte _08025E5C @ case 1
	.4byte _08025E80 @ case 2
	.4byte _08025EA8 @ case 3
	.4byte _08025EC8 @ case 4
	.4byte _08025EF0 @ case 5
_08025E34:
	adds r0, r4, r3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r1, _08025E54 @ =0x000001FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025E58 @ =Sprite_16x16
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025EE4
	.align 2, 0
_08025E54: .4byte 0x000001FF
_08025E58: .4byte Sprite_16x16
_08025E5C:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025E7C @ =Sprite_16x32
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025EE4
	.align 2, 0
_08025E7C: .4byte Sprite_16x32
_08025E80:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025EA4 @ =Sprite_32x32
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025EE4
	.align 2, 0
_08025EA4: .4byte Sprite_32x32
_08025EA8:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025EC4 @ =Sprite_16x16
	b _08025EDE
	.align 2, 0
_08025EC4: .4byte Sprite_16x16
_08025EC8:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025EEC @ =Sprite_16x32
_08025EDE:
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
_08025EE4:
	adds r3, r4, r5
	bl PutOamHiRam
	b _08025F16
	.align 2, 0
_08025EEC: .4byte Sprite_16x32
_08025EF0:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025F24 @ =Sprite_32x32
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
	adds r3, r4, r5
	bl PutOamHiRam
_08025F16:
	ldr r6, [r6]
	cmp r6, #0
	beq _08025F1E
	b _08025DAC
_08025F1E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025F24: .4byte Sprite_32x32

	thumb_func_start PutChapterMarkedTileIconOam
PutChapterMarkedTileIconOam: @ 0x08025F28
	push {r4, r5, lr}
	ldr r4, _08025FC4 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x8f
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x90
	ldrb r4, [r0]
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08025F54
	movs r2, #1
_08025F54:
	cmp r5, #0xff
	beq _08025FBE
	cmp r2, #0
	beq _08025FBE
	ldr r0, _08025FC8 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025FBE
	ldr r0, _08025FCC @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _08025FBE
	lsls r1, r5, #4
	ldr r2, _08025FD0 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	lsls r1, r4, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r2, r1, r0
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025FBE
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025FBE
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r3, r1
	subs r1, #5
	ands r0, r1
	ldr r3, _08025FD4 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025FD8 @ =Sprite_8x8
	ldr r3, _08025FDC @ =0x00000C51
	bl PutOamHiRam
_08025FBE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025FC4: .4byte gPlaySt
_08025FC8: .4byte 0x0202E3E8
_08025FCC: .4byte gBmMapTerrain
_08025FD0: .4byte gBmSt
_08025FD4: .4byte 0x00000107
_08025FD8: .4byte Sprite_8x8
_08025FDC: .4byte 0x00000C51

	thumb_func_start PutUnitSpriteIconsOam
PutUnitSpriteIconsOam: @ 0x08025FE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _080260B8 @ =gUnk_081C9474
	mov r0, sp
	movs r2, #6
	bl memcpy
	ldr r0, _080260BC @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrb r0, [r0]
	str r0, [sp, #8]
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08026018
	movs r2, #1
_08026018:
	adds r7, r2, #0
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #0xc
	bl __umodsi3
	str r0, [sp, #0xc]
	bl GetGameTime
	lsrs r0, r0, #4
	movs r1, #7
	bl __umodsi3
	str r0, [sp, #0x10]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #9
	bl __umodsi3
	mov sl, r0
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0x12
	bl __umodsi3
	mov sb, r0
	movs r0, #0x91
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026060
	b _080263EE
_08026060:
	bl PutChapterMarkedTileIconOam
	movs r0, #1
	mov r8, r0
_08026068:
	mov r0, r8
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08026076
	b _080263E2
_08026076:
	ldr r0, [r4]
	cmp r0, #0
	bne _0802607E
	b _080263E2
_0802607E:
	ldr r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802608A
	b _080263E2
_0802608A:
	adds r0, r4, #0
	bl GetUnitSpriteHideFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026098
	b _080263E2
_08026098:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	lsls r6, r7, #0x18
	cmp r0, #7
	bls _080260AC
	b _0802628A
_080260AC:
	lsls r0, r0, #2
	ldr r1, _080260C0 @ =_080260C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080260B8: .4byte gUnk_081C9474
_080260BC: .4byte gPlaySt
_080260C0: .4byte _080260C4
_080260C4: @ jump table
	.4byte _080260E4 @ case 0
	.4byte _0802618C @ case 1
	.4byte _08026138 @ case 2
	.4byte _080261DC @ case 3
	.4byte _0802623C @ case 4
	.4byte _0802623C @ case 5
	.4byte _0802623C @ case 6
	.4byte _0802623C @ case 7
_080260E4:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08026130 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _0802610E
	b _0802628A
_0802610E:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08026118
	b _0802628A
_08026118:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08026134 @ =PoisonIconSprites
	ldr r5, [sp, #0xc]
	b _08026220
	.align 2, 0
_08026130: .4byte gBmSt
_08026134: .4byte PoisonIconSprites
_08026138:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08026184 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _08026162
	b _0802628A
_08026162:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _0802616C
	b _0802628A
_0802616C:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08026188 @ =SilenceIconSprites
	mov r5, sb
	b _08026220
	.align 2, 0
_08026184: .4byte gBmSt
_08026188: .4byte SilenceIconSprites
_0802618C:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080261D0 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r0, r3, #0
	adds r0, #0x10
	movs r5, #0x80
	lsls r5, r5, #1
	lsls r6, r7, #0x18
	cmp r0, r5
	bhi _0802628A
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _0802628A
	ldr r1, _080261D4 @ =0x00000202
	adds r0, r3, r1
	subs r1, #3
	ands r0, r1
	adds r1, r2, r5
	movs r2, #0xff
	ands r1, r2
	ldr r3, _080261D8 @ =SleepIconSprites
	ldr r5, [sp, #0x10]
	b _08026220
	.align 2, 0
_080261D0: .4byte gBmSt
_080261D4: .4byte 0x00000202
_080261D8: .4byte SleepIconSprites
_080261DC:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08026230 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bhi _0802628A
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _0802628A
	ldr r1, _08026234 @ =0x00000201
	adds r0, r3, r1
	subs r1, #2
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08026238 @ =BerserkIconSprites
	mov r5, sl
_08026220:
	lsls r2, r5, #2
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl PutOamHiRam
	b _0802628A
	.align 2, 0
_08026230: .4byte gBmSt
_08026234: .4byte 0x00000201
_08026238: .4byte BerserkIconSprites
_0802623C:
	lsls r0, r7, #0x18
	adds r6, r0, #0
	cmp r6, #0
	bne _08026246
	b _080263E2
_08026246:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080262FC @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802628A
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _0802628A
	ldr r1, _08026300 @ =0x000001FF
	adds r0, r3, r1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08026304 @ =UnkStatusIconSprites
	movs r3, #0
	bl PutOamHiRam
_0802628A:
	cmp r6, #0
	bne _08026290
	b _080263E2
_08026290:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08026318
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080262FC @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _080262C2
	b _080263E2
_080262C2:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _080262CC
	b _080263E2
_080262CC:
	ldr r1, _08026308 @ =0x00000209
	adds r0, r3, r1
	subs r1, #0xa
	ands r0, r1
	ldr r3, _0802630C @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08026310 @ =Sprite_8x8
	ldrb r4, [r4, #0x1b]
	lsrs r3, r4, #6
	lsls r3, r3, #1
	mov r5, sp
	adds r4, r5, r3
	movs r3, #0xf
	ldrh r4, [r4]
	ands r3, r4
	lsls r3, r3, #0xc
	ldr r4, _08026314 @ =0x00000803
	adds r3, r3, r4
	bl PutOamHiRam
	b _080263E2
	.align 2, 0
_080262FC: .4byte gBmSt
_08026300: .4byte 0x000001FF
_08026304: .4byte UnkStatusIconSprites
_08026308: .4byte 0x00000209
_0802630C: .4byte 0x00000107
_08026310: .4byte Sprite_8x8
_08026314: .4byte 0x00000803
_08026318:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	ldr r2, [r4]
	cmp r0, #0
	beq _08026394
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08026394
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08026380 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080263E2
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080263E2
	ldr r5, _08026384 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _08026388 @ =0x000001FF
	ands r0, r1
	ldr r3, _0802638C @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08026390 @ =Sprite_8x8
	movs r3, #0x81
	lsls r3, r3, #4
	bl PutOamHiRam
	b _080263E2
	.align 2, 0
_08026380: .4byte gBmSt
_08026384: .4byte 0x00000209
_08026388: .4byte 0x000001FF
_0802638C: .4byte 0x00000107
_08026390: .4byte Sprite_8x8
_08026394:
	ldr r5, [sp, #8]
	ldrb r2, [r2, #4]
	cmp r5, r2
	bne _080263E2
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08026400 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080263E2
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080263E2
	ldr r5, _08026404 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _08026408 @ =0x000001FF
	ands r0, r1
	ldr r3, _0802640C @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08026410 @ =Sprite_8x8
	ldr r3, _08026414 @ =0x00000811
	bl PutOamHiRam
_080263E2:
	movs r4, #1
	add r8, r4
	mov r5, r8
	cmp r5, #0xbf
	bgt _080263EE
	b _08026068
_080263EE:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026400: .4byte gBmSt
_08026404: .4byte 0x00000209
_08026408: .4byte 0x000001FF
_0802640C: .4byte 0x00000107
_08026410: .4byte Sprite_8x8
_08026414: .4byte 0x00000811

	thumb_func_start sub_8026418
sub_8026418: @ 0x08026418
	ldr r1, _08026420 @ =gBmSt
	ldr r0, _08026424 @ =0x0000FFFF
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08026420: .4byte gBmSt
_08026424: .4byte 0x0000FFFF

	thumb_func_start sub_8026428
sub_8026428: @ 0x08026428
	ldr r1, _08026430 @ =0x0203A3D0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08026430: .4byte 0x0203A3D0

	thumb_func_start UnitSpriteHoverUpdate
UnitSpriteHoverUpdate: @ 0x08026434
	push {r4, lr}
	ldr r2, _08026498 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0802649C @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080264A4
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080264A4
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080264A4
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _080264A4
	cmp r1, #2
	beq _080264A4
	ldr r1, _080264A0 @ =0x0203A3D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #5
	bne _080264A4
	adds r0, r4, #0
	bl StartMu
	adds r0, r4, #0
	bl HideUnitSprite
	b _080264DE
	.align 2, 0
_08026498: .4byte gBmSt
_0802649C: .4byte gBmMapUnit
_080264A0: .4byte 0x0203A3D0
_080264A4:
	ldr r2, _080264E4 @ =gBmSt
	ldr r1, [r2, #0x18]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	beq _080264DE
	ldr r1, _080264E8 @ =0x0203A3D0
	movs r0, #0
	str r0, [r1]
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	ldr r1, _080264EC @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x18
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080264DE
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_080264DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080264E4: .4byte gBmSt
_080264E8: .4byte 0x0203A3D0
_080264EC: .4byte gBmMapUnit

	thumb_func_start sub_80264F0
sub_80264F0: @ 0x080264F0
	push {lr}
	ldr r2, _08026534 @ =gBmMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08026538
	ldr r0, [r2, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08026538
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08026538
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08026538
	cmp r1, #2
	beq _08026538
	movs r0, #1
	b _0802653A
	.align 2, 0
_08026534: .4byte gBmMapUnit
_08026538:
	movs r0, #0
_0802653A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8026540
sub_8026540: @ 0x08026540
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r7, r2, #0
	adds r4, r3, #0
	adds r0, r4, #0
	bl GetUnitSMSId
	adds r5, r0, #0
	bl StartUiSMS
	adds r6, r0, #0
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026616
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026616
	ldr r1, _08026590 @ =gUnk_08D613B8
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _080265C4
	cmp r0, #1
	bgt _08026594
	cmp r0, #0
	beq _0802659A
	b _08026616
	.align 2, 0
_08026590: .4byte gUnk_08D613B8
_08026594:
	cmp r0, #2
	beq _080265F0
	b _08026616
_0802659A:
	adds r0, r4, #0
	bl sub_8025B54
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	ldr r3, _080265C0 @ =Sprite_16x16
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	bl PutSprite
	b _08026616
	.align 2, 0
_080265C0: .4byte Sprite_16x16
_080265C4:
	adds r0, r4, #0
	bl sub_8025B54
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _080265EC @ =Sprite_16x32
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _08026616
	.align 2, 0
_080265EC: .4byte Sprite_16x32
_080265F0:
	adds r0, r4, #0
	bl sub_8025B54
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r1, #0x88
	lsls r1, r1, #4
	adds r0, r6, r1
	adds r4, r4, r0
	mov r1, r8
	subs r1, #8
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08026624 @ =Sprite_32x32
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_08026616:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026624: .4byte Sprite_32x32

	thumb_func_start sub_8026628
sub_8026628: @ 0x08026628
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	mov r8, r0
	bl StartUiSMS
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080266C8
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _080266C8
	ldr r1, _0802667C @ =gUnk_08D613B8
	movs r0, #0x7f
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _0802669C
	cmp r0, #1
	bgt _08026680
	cmp r0, #0
	beq _08026686
	b _080266C8
	.align 2, 0
_0802667C: .4byte gUnk_08D613B8
_08026680:
	cmp r0, #2
	beq _080266B4
	b _080266C8
_08026686:
	ldr r3, _08026698 @ =Sprite_16x16
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	bl PutSprite
	b _080266C8
	.align 2, 0
_08026698: .4byte Sprite_16x16
_0802669C:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _080266B0 @ =Sprite_16x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	bl PutSprite
	b _080266C8
	.align 2, 0
_080266B0: .4byte Sprite_16x32
_080266B4:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _080266D8 @ =Sprite_32x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	bl PutSprite
_080266C8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080266D8: .4byte Sprite_32x32

	thumb_func_start sub_80266DC
sub_80266DC: @ 0x080266DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	bl GetClassSMSId
	adds r6, r0, #0
	bl StartUiSMS
	adds r7, r0, #0
	adds r7, #0x80
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026780
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026780
	ldr r1, _08026728 @ =gUnk_08D613B8
	movs r0, #0x7f
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026740
	cmp r0, #1
	bgt _0802672C
	cmp r0, #0
	beq _08026732
	b _08026780
	.align 2, 0
_08026728: .4byte gUnk_08D613B8
_0802672C:
	cmp r0, #2
	beq _08026760
	b _08026780
_08026732:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r4, r0
	ldr r3, _0802673C @ =Sprite_16x16
	b _08026750
	.align 2, 0
_0802673C: .4byte Sprite_16x16
_08026740:
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _0802675C @ =Sprite_16x32
_08026750:
	str r7, [sp]
	mov r0, r8
	adds r1, r5, #0
	bl PutSpriteExt
	b _08026780
	.align 2, 0
_0802675C: .4byte Sprite_16x32
_08026760:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _0802678C @ =0x000001FF
	ands r1, r0
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08026790 @ =Sprite_32x32
	str r7, [sp]
	mov r0, r8
	bl PutSpriteExt
_08026780:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802678C: .4byte 0x000001FF
_08026790: .4byte Sprite_32x32

	thumb_func_start sub_8026794
sub_8026794: @ 0x08026794
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	adds r2, r0, #0
	ldr r0, _080267E8 @ =gUnk_08C03104
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r4, r0, #1
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802681C
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802681C
	ldr r1, _080267EC @ =gUnk_08D613B8
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	blt _0802681C
	cmp r0, #1
	ble _080267F0
	cmp r0, #2
	beq _08026808
	b _0802681C
	.align 2, 0
_080267E8: .4byte gUnk_08C03104
_080267EC: .4byte gUnk_08D613B8
_080267F0:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026804 @ =Sprite_16x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	bl PutSprite
	b _0802681C
	.align 2, 0
_08026804: .4byte Sprite_16x32
_08026808:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026828 @ =Sprite_32x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	bl PutSprite
_0802681C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026828: .4byte Sprite_32x32

	thumb_func_start sub_802682C
sub_802682C: @ 0x0802682C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r4, r0, #0
	bl StartUiSMS
	adds r5, r0, #0
	adds r5, #0x80
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080268F6
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _080268F6
	ldr r1, _0802687C @ =gUnk_08D613B8
	movs r0, #0x7f
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _080268AC
	cmp r0, #1
	bgt _08026880
	cmp r0, #0
	beq _08026886
	b _080268F6
	.align 2, 0
_0802687C: .4byte gUnk_08D613B8
_08026880:
	cmp r0, #2
	beq _080268D4
	b _080268F6
_08026886:
	ldr r0, [sp, #0x20]
	bl sub_8025B80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	ldr r3, _080268A8 @ =Sprite_16x16
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r6, #0
	bl PutSprite
	b _080268F6
	.align 2, 0
_080268A8: .4byte Sprite_16x16
_080268AC:
	ldr r0, [sp, #0x20]
	bl sub_8025B80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _080268D0 @ =Sprite_16x32
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _080268F6
	.align 2, 0
_080268D0: .4byte Sprite_16x32
_080268D4:
	ldr r0, [sp, #0x20]
	bl sub_8025B80
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r4, r7, r4
	adds r4, r4, r5
	mov r1, r8
	subs r1, #8
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08026904 @ =Sprite_32x32
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_080268F6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026904: .4byte Sprite_32x32

	thumb_func_start sub_8026908
sub_8026908: @ 0x08026908
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r5, r0, #0
	bl StartUiSMS
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r7, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080269DC
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _080269DC
	ldr r1, _08026958 @ =gUnk_08D613B8
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _0802698C
	cmp r0, #1
	bgt _0802695C
	cmp r0, #0
	beq _08026962
	b _080269DC
	.align 2, 0
_08026958: .4byte gUnk_08D613B8
_0802695C:
	cmp r0, #2
	beq _080269B8
	b _080269DC
_08026962:
	ldr r3, _08026984 @ =gUnk_08C0340E
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _08026988 @ =gUnk_08C03426
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	b _080269DC
	.align 2, 0
_08026984: .4byte gUnk_08C0340E
_08026988: .4byte gUnk_08C03426
_0802698C:
	adds r5, r6, #0
	subs r5, #0x10
	ldr r3, _080269B0 @ =gUnk_08C03416
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	ldr r3, _080269B4 @ =gUnk_08C0342E
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	b _080269DC
	.align 2, 0
_080269B0: .4byte gUnk_08C03416
_080269B4: .4byte gUnk_08C0342E
_080269B8:
	adds r5, r7, #0
	subs r5, #8
	subs r6, #0x10
	ldr r3, _080269EC @ =gUnk_08C0341E
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _080269F0 @ =gUnk_08C03436
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
_080269DC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080269EC: .4byte gUnk_08C0341E
_080269F0: .4byte gUnk_08C03436

	thumb_func_start sub_80269F4
sub_80269F4: @ 0x080269F4
	ldr r1, _080269FC @ =gUnitSprites
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080269FC: .4byte gUnitSprites

	thumb_func_start HideUnitSprite
HideUnitSprite: @ 0x08026A00
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08026A0C
	bl RefreshUnitSprites
_08026A0C:
	ldr r1, [r4, #0x3c]
	cmp r1, #0
	beq _08026A1E
	movs r2, #0x80
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r2, [r1, #0xb]
	orrs r0, r2
	strb r0, [r1, #0xb]
_08026A1E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ShowUnitSprite
ShowUnitSprite: @ 0x08026A24
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _08026A32
	movs r0, #0x7f
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
_08026A32:
	bx lr

	thumb_func_start GetUnitSpriteHideFlag
GetUnitSpriteHideFlag: @ 0x08026A34
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _08026A48
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08026A4A
_08026A48:
	movs r0, #0x80
_08026A4A:
	bx lr

	thumb_func_start sub_8026A4C
sub_8026A4C: @ 0x08026A4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r5, r1, #0
	mov sb, r2
	ldr r0, _08026AB0 @ =gUnk_08C031D4
	lsls r3, r3, #1
	adds r3, r3, r0
	ldrh r6, [r3]
	movs r3, #0
	cmp r3, sb
	bge _08026AA4
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #2
	movs r1, #0xf
	mov ip, r1
	mov r7, ip
	lsls r7, r0
	mov ip, r7
_08026A78:
	adds r4, r3, #1
	cmp r5, #0
	ble _08026A9E
	mov r0, ip
	mvns r2, r0
	asrs r1, r6, #3
	lsls r1, r1, #2
	lsls r0, r3, #0xa
	adds r3, r5, #0
	adds r0, r0, r1
	mov r7, r8
	adds r1, r7, r0
_08026A90:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x20
	subs r3, #1
	cmp r3, #0
	bne _08026A90
_08026A9E:
	adds r3, r4, #0
	cmp r3, sb
	blt _08026A78
_08026AA4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026AB0: .4byte gUnk_08C031D4
