	.include "macro.inc"
	.syntax unified


	thumb_func_start ChapterIntro_LoopFadeToMap
ChapterIntro_LoopFadeToMap: @ 0x08020144
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08020156
	b _08020294
_08020156:
	bl ColorFadeTick_thm
	ldr r4, _080201E4 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0802016E
	bl ApplyFlamesWeatherGradient
_0802016E:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x87
	ldrb r6, [r0]
	cmp r6, #0
	beq _080201F0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _08020190
	movs r1, #2
_08020190:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _080201E8 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _080201BA
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _080201AE
	movs r1, #2
_080201AE:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_080201BA:
	adds r3, r7, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080201EC @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r5, r3, #0
	b _08020236
	.align 2, 0
_080201E4: .4byte gPlaySt
_080201E8: .4byte 0x0000FFFF
_080201EC: .4byte gDispIo
_080201F0:
	bl EnablePalSync
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r1, #7
	adds r5, r0, #0
	cmp r3, #0
	bge _08020206
	adds r3, #7
_08020206:
	asrs r3, r3, #3
	ldr r0, _0802029C @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0xc
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #4
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
_08020236:
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _08020282
	ldr r4, _080202A0 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _08020258
	movs r1, #2
_08020258:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _080202A4 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _08020282
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _08020276
	movs r1, #2
_08020276:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_08020282:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08020294
	bl EnableTilesetPalAnim
	adds r0, r7, #0
	bl Proc_Break
_08020294:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802029C: .4byte gDispIo
_080202A0: .4byte gPlaySt
_080202A4: .4byte 0x0000FFFF

	thumb_func_start sub_80202A8
sub_80202A8: @ 0x080202A8
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start sub_80202B0
sub_80202B0: @ 0x080202B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080202F8 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x50
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	subs r1, #1
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080202F0
	adds r0, r5, #0
	bl Proc_Break
_080202F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080202F8: .4byte gDispIo

	thumb_func_start sub_80202FC
sub_80202FC: @ 0x080202FC
	adds r0, #0x4c
	movs r1, #8
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8020304
sub_8020304: @ 0x08020304
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0802034C @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x50
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	subs r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _08020344
	adds r0, r5, #0
	bl Proc_Break
_08020344:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802034C: .4byte gDispIo

	thumb_func_start ChapterIntro_BeginFadeOut
ChapterIntro_BeginFadeOut: @ 0x08020350
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeInit
	ldr r0, _08020378 @ =gPal
	movs r3, #2
	rsbs r3, r3, #0
	movs r1, #0
	movs r2, #6
	bl sub_80020CC
	adds r4, #0x4c
	movs r0, #0xf
	strh r0, [r4]
	movs r0, #1
	bl Sound_FadeOutSE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020378: .4byte gPal

	thumb_func_start ChapterIntro_LoopFadeOut
ChapterIntro_LoopFadeOut: @ 0x0802037C
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080203C4
	ldr r2, _080203CC @ =gDispIo
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
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	adds r0, r4, #0
	bl Proc_Break
_080203C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080203CC: .4byte gDispIo

	thumb_func_start ChapterIntro_BeginFastFadeToMap
ChapterIntro_BeginFastFadeToMap: @ 0x080203D0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ClearUi
	bl ColorFadeInit
	ldr r5, _0802046C @ =gPal + 0xc0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #2
	bl sub_80020CC
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #2
	bl sub_80020CC
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r1, #0x10
	movs r2, #2
	movs r3, #2
	bl sub_80020CC
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #2
	bl sub_80020CC
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0xe
	strh r0, [r4]
	ldr r4, _08020470 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0802043C
	movs r1, #2
_0802043C:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _08020474 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _08020466
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0802045A
	movs r1, #2
_0802045A:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_08020466:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802046C: .4byte gPal + 0xc0
_08020470: .4byte gPlaySt
_08020474: .4byte 0x0000FFFF

	thumb_func_start ChapterIntro_LoopFastFadeToMap
ChapterIntro_LoopFastFadeToMap: @ 0x08020478
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	ldr r5, _080204CC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020494
	bl ApplyFlamesWeatherGradient
_08020494:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _080204D4
	adds r3, r4, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080204D0 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _080204DC
	.align 2, 0
_080204CC: .4byte gPlaySt
_080204D0: .4byte gDispIo
_080204D4:
	bl EnablePalSync
	adds r3, r4, #0
	adds r3, #0x4c
_080204DC:
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080204F2
	bl EnableTilesetPalAnim
	adds r0, r4, #0
	bl Proc_Break
_080204F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ChapterIntro_SetSkipTarget
ChapterIntro_SetSkipTarget: @ 0x080204F8
	adds r1, #0x50
	strh r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_8020500
sub_8020500: @ 0x08020500
	adds r1, #0x4c
	strh r0, [r1]
	bx lr
	.align 2, 0
