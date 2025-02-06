	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_8090148
sub_8090148: @ 0x08090148
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08090194
	subs r6, #4
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _0809018C @ =Sprite_08D8C55E
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r0, _08090190 @ =Sprites_08D8C5D8
	ldr r3, [r0, #0x28]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _080901B4
	.align 2, 0
_0809018C: .4byte Sprite_08D8C55E
_08090190: .4byte Sprites_08D8C5D8
_08090194:
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _080901E0 @ =Sprite_08D8C544
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r3, _080901E4 @ =Sprite_08D8C53C
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
_080901B4:
	ldr r3, _080901E8 @ =Sprite_08D8C52E
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	asrs r4, r4, #1
	mov sb, r4
	cmp r4, #9
	bgt _080901F0
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _080901EC @ =Sprites_08D8C5D8
	ldr r3, [r0, #0x2c]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _08090210
	.align 2, 0
_080901E0: .4byte Sprite_08D8C544
_080901E4: .4byte Sprite_08D8C53C
_080901E8: .4byte Sprite_08D8C52E
_080901EC: .4byte Sprites_08D8C5D8
_080901F0:
	adds r5, r6, #0
	adds r5, #0x28
	ldr r4, _08090240 @ =Sprites_08D8C5D8
	mov r0, sb
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
_08090210:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _08090240 @ =Sprites_08D8C5D8
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090240: .4byte Sprites_08D8C5D8

	thumb_func_start sub_8090244
sub_8090244: @ 0x08090244
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080902C8
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08090270
	adds r2, r0, #0
	movs r3, #0xc7
	lsls r3, r3, #7
	movs r0, #0x70
	movs r1, #4
	bl sub_8090148
_08090270:
	movs r0, #0x32
	adds r0, r0, r7
	mov r8, r0
	ldr r6, _080902BC @ =0x0000B680
	movs r5, #0x80
	movs r4, #2
_0809027C:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _080902C0 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809027C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne _080902A8
	ldrh r7, [r7, #0x34]
	lsrs r0, r7, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080902DA
_080902A8:
	ldr r3, _080902C4 @ =gUnk_08D8CDBC
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
	b _080902DA
	.align 2, 0
_080902BC: .4byte 0x0000B680
_080902C0: .4byte Sprite_32x16
_080902C4: .4byte gUnk_08D8CDBC
_080902C8:
	ldr r3, _080902E8 @ =gUnk_08D8CDD0
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
_080902DA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080902E8: .4byte gUnk_08D8CDD0

	thumb_func_start nullsub_77
nullsub_77: @ 0x080902EC
	bx lr
	.align 2, 0

	thumb_func_start ProcPrepSpChar_OnInit
ProcPrepSpChar_OnInit: @ 0x080902F0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x34]
	bl ForceSyncUnitSpriteSheet
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08090330
	ldr r0, _0809032C @ =gUnk_0841ECD0
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	b _08090368
	.align 2, 0
_0809032C: .4byte gUnk_0841ECD0
_08090330:
	ldr r0, _08090380 @ =gUnk_0841ECD0
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	ldr r4, _08090384 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0809035C
	movs r1, #1
_0809035C:
	adds r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_08090368:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r1, #7
	movs r0, #1
	strb r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090380: .4byte gUnk_0841ECD0
_08090384: .4byte gPlaySt

	thumb_func_start ProcPrepSpChar_Idle
ProcPrepSpChar_Idle: @ 0x08090388
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8090244
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProcPrepSpChar_OnEnd
ProcPrepSpChar_OnEnd: @ 0x0809039C
	push {lr}
	ldr r0, [r0, #0x38]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0

	thumb_func_start PrepSpecialChar_BlinkButtonStart
PrepSpecialChar_BlinkButtonStart: @ 0x080903A8
	push {lr}
	ldr r0, _080903C0 @ =ProcScr_PrepSpecialCharEff
	bl Proc_Find
	cmp r0, #0
	beq _080903BC
	adds r1, r0, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
_080903BC:
	pop {r0}
	bx r0
	.align 2, 0
_080903C0: .4byte ProcScr_PrepSpecialCharEff

	thumb_func_start PrepSpecialChar_BlinkButtonB
PrepSpecialChar_BlinkButtonB: @ 0x080903C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080903E4 @ =ProcScr_PrepSpecialCharEff
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080903E4: .4byte ProcScr_PrepSpecialCharEff

	thumb_func_start EndPrepSpecialCharEffect
EndPrepSpecialCharEffect: @ 0x080903E8
	push {lr}
	ldr r0, _080903F8 @ =ProcScr_PrepSpecialCharEff
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080903F8: .4byte ProcScr_PrepSpecialCharEff
