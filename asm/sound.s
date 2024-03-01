	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCurrentBgmSong
GetCurrentBgmSong: @ 0x080033B8
	push {r7, lr}
	mov r7, sp
	ldr r0, _080033C4 @ =0x02024E14
	ldrh r1, [r0, #4]
	adds r0, r1, #0
	b _080033C8
	.align 2, 0
_080033C4: .4byte 0x02024E14
_080033C8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80033D0
sub_80033D0: @ 0x080033D0
	push {r7, lr}
	mov r7, sp
	ldr r0, _080033E0 @ =0x02024E14
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _080033E4
	.align 2, 0
_080033E0: .4byte 0x02024E14
_080033E4:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80033EC
sub_80033EC: @ 0x080033EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800346C @ =0x03005C80
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003474 @ =0x03005D50
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003478 @ =0x03005CC0
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _0800347C @ =0x030059B0
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003480 @ =0x030059F0
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003484 @ =0x03005C00
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003488 @ =0x03005D10
	ldr r1, _08003470 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800346C: .4byte 0x03005C80
_08003470: .4byte 0x0000FFFF
_08003474: .4byte 0x03005D50
_08003478: .4byte 0x03005CC0
_0800347C: .4byte 0x030059B0
_08003480: .4byte 0x030059F0
_08003484: .4byte 0x03005C00
_08003488: .4byte 0x03005D10

	thumb_func_start SetBgmVolume
SetBgmVolume: @ 0x0800348C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080034BC @ =0x03005A30
	ldr r1, _080034C0 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _080034C4 @ =0x03005C40
	ldr r1, _080034C0 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080034BC: .4byte 0x03005A30
_080034C0: .4byte 0x0000FFFF
_080034C4: .4byte 0x03005C40

	thumb_func_start FadeBgmOut
FadeBgmOut: @ 0x080034C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _080034DA
	movs r0, #6
	str r0, [r7]
_080034DA:
	ldr r0, _0800353C @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _080034F2
	ldr r0, _0800353C @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _0800353C @ =0x03000038
	movs r1, #0
	str r1, [r0]
_080034F2:
	ldr r0, _08003540 @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800350A
	ldr r0, _08003540 @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _08003540 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_0800350A:
	ldr r0, _08003544 @ =0x03005A30
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003548 @ =0x03005C40
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800354C @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800353C: .4byte 0x03000038
_08003540: .4byte 0x0300003C
_08003544: .4byte 0x03005A30
_08003548: .4byte 0x03005C40
_0800354C: .4byte 0x02024E14

	thumb_func_start sub_8003550
sub_8003550: @ 0x08003550
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _08003562
	movs r0, #6
	str r0, [r7]
_08003562:
	ldr r0, _080035D8 @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _0800357A
	ldr r0, _080035D8 @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _080035D8 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_0800357A:
	ldr r0, _080035DC @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _08003592
	ldr r0, _080035DC @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _080035DC @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_08003592:
	ldr r0, _080035E0 @ =0x03005A30
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _080035E4 @ =0x03005C40
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOutPause
	ldr r0, _080035E8 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _080035E8 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080035D8: .4byte 0x03000038
_080035DC: .4byte 0x0300003C
_080035E0: .4byte 0x03005A30
_080035E4: .4byte 0x03005C40
_080035E8: .4byte 0x02024E14

	thumb_func_start Sound_FadeOutSE
Sound_FadeOutSE: @ 0x080035EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _080035FE
	movs r0, #6
	str r0, [r7]
_080035FE:
	ldr r0, _08003668 @ =0x03005C80
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800366C @ =0x03005D50
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003670 @ =0x03005CC0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003674 @ =0x030059B0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003678 @ =0x030059F0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800367C @ =0x03005C00
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003680 @ =0x03005D10
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003668: .4byte 0x03005C80
_0800366C: .4byte 0x03005D50
_08003670: .4byte 0x03005CC0
_08003674: .4byte 0x030059B0
_08003678: .4byte 0x030059F0
_0800367C: .4byte 0x03005C00
_08003680: .4byte 0x03005D10

	thumb_func_start sub_8003684
sub_8003684: @ 0x08003684
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080036E4 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _080036E4 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _080036E4 @ =0x02024E14
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl PlaySongCore
	ldr r1, _080036E8 @ =0x03005A30
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _080036EC @ =0x03005C40
	adds r0, r1, #0
	bl m4aMPlayImmInit
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080036E4: .4byte 0x02024E14
_080036E8: .4byte 0x03005A30
_080036EC: .4byte 0x03005C40

	thumb_func_start sub_80036F0
sub_80036F0: @ 0x080036F0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _08003714 @ =0x02024E14
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _08003718
	bl GetCurrentBgmSong
	ldr r1, [r7]
	cmp r0, r1
	bne _08003718
	b _08003764
	.align 2, 0
_08003714: .4byte 0x02024E14
_08003718:
	ldr r1, _0800372C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003730
	b _08003764
	.align 2, 0
_0800372C: .4byte gPlaySt
_08003730:
	bl sub_80040F8
	ldr r0, _08003758 @ =0x02024E14
	movs r1, #6
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _0800375C
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl FadeBgmOut
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_8003D7C
	b _08003764
	.align 2, 0
_08003758: .4byte 0x02024E14
_0800375C:
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl sub_8003684
_08003764:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800376C
sub_800376C: @ 0x0800376C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7, #4]
	ldr r0, [r7]
	movs r1, #3
	bl sub_80036F0
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8003788
sub_8003788: @ 0x08003788
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl sub_80036F0
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80037A8
sub_80037A8: @ 0x080037A8
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, _08003848 @ =0x03005A30
	ldr r1, _0800384C @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003850 @ =0x03005C40
	ldr r1, _0800384C @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4c
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _0800383E
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08003854 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_0800383E:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003848: .4byte 0x03005A30
_0800384C: .4byte 0x0000FFFF
_08003850: .4byte 0x03005C40
_08003854: .4byte 0x03000038

	thumb_func_start sub_8003858
sub_8003858: @ 0x08003858
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08003878 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _0800387C
	b _0800392A
	.align 2, 0
_08003878: .4byte gPlaySt
_0800387C:
	ldr r0, _08003934 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003934 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003934 @ =0x02024E14
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, _08003938 @ =gUnk_08BBFCA8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r1, _0800393C @ =0x03005A30
	adds r0, r1, #0
	bl MPlayStop_rev01
	ldr r1, _08003940 @ =0x03005C40
	adds r0, r1, #0
	bl MPlayStop_rev01
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl PlaySongCore
	ldr r1, _0800393C @ =0x03005A30
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _08003940 @ =0x03005C40
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r0, _0800393C @ =0x03005A30
	ldr r1, _08003944 @ =0x0000FFFF
	movs r2, #0
	bl MPlayVolumeControl
	ldr r0, _08003940 @ =0x03005C40
	ldr r1, _08003944 @ =0x0000FFFF
	movs r2, #0
	bl MPlayVolumeControl
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003948 @ =0x03000038
	ldr r1, [r7, #0xc]
	str r1, [r0]
_0800392A:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003934: .4byte 0x02024E14
_08003938: .4byte gUnk_08BBFCA8
_0800393C: .4byte 0x03005A30
_08003940: .4byte 0x03005C40
_08003944: .4byte 0x0000FFFF
_08003948: .4byte 0x03000038

	thumb_func_start sub_800394C
sub_800394C: @ 0x0800394C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08003968 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _0800396C
	b _080039BE
	.align 2, 0
_08003968: .4byte gPlaySt
_0800396C:
	ldr r0, _080039C8 @ =0x02024E14
	ldr r1, _080039C8 @ =0x02024E14
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, _080039C8 @ =0x02024E14
	movs r1, #7
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08003996
	ldr r1, _080039CC @ =0x03005C40
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOutPause
_08003996:
	ldr r0, _080039C8 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _080039C8 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080039BE
	ldr r2, _080039D0 @ =0x03005A30
	ldr r0, [r7]
	movs r1, #0x20
	bl sub_8003D7C
_080039BE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080039C8: .4byte 0x02024E14
_080039CC: .4byte 0x03005C40
_080039D0: .4byte 0x03005A30

	thumb_func_start RestoreBgm
RestoreBgm: @ 0x080039D4
	push {r7, lr}
	mov r7, sp
	ldr r1, _080039EC @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _080039F0
	b _08003A56
	.align 2, 0
_080039EC: .4byte gPlaySt
_080039F0:
	ldr r0, _080039FC @ =0x02024E14
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003A00
	b _08003A56
	.align 2, 0
_080039FC: .4byte 0x02024E14
_08003A00:
	ldr r1, _08003A5C @ =0x03005A30
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r1, _08003A60 @ =0x03005C40
	adds r0, r1, #0
	movs r1, #6
	bl m4aMPlayFadeInContinue
	ldr r0, _08003A64 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003A64 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003A64 @ =0x02024E14
	ldr r1, _08003A64 @ =0x02024E14
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003A64 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003A56:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A5C: .4byte 0x03005A30
_08003A60: .4byte 0x03005C40
_08003A64: .4byte 0x02024E14

	thumb_func_start sub_8003A68
sub_8003A68: @ 0x08003A68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r1, _08003A84 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003A88
	b _08003AF0
	.align 2, 0
_08003A84: .4byte gPlaySt
_08003A88:
	ldr r0, _08003A94 @ =0x02024E14
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003A98
	b _08003AF0
	.align 2, 0
_08003A94: .4byte 0x02024E14
_08003A98:
	ldr r1, _08003AF8 @ =0x03005A30
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _08003AFC @ =0x03005C40
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	bl m4aMPlayFadeInContinue
	ldr r0, _08003B00 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003B00 @ =0x02024E14
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003B00 @ =0x02024E14
	ldr r1, _08003B00 @ =0x02024E14
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003B00 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003AF0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003AF8: .4byte 0x03005A30
_08003AFC: .4byte 0x03005C40
_08003B00: .4byte 0x02024E14

	thumb_func_start MakeBgmOverridePersist
MakeBgmOverridePersist: @ 0x08003B04
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003B1C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003B20
	b _08003B42
	.align 2, 0
_08003B1C: .4byte gPlaySt
_08003B20:
	ldr r0, _08003B48 @ =0x02024E14
	ldr r1, _08003B48 @ =0x02024E14
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003B48 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003B42:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B48: .4byte 0x02024E14

	thumb_func_start StartBgmVolumeChange
StartBgmVolumeChange: @ 0x08003B4C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08003B70
	ldr r0, _08003B6C @ =gUnk_08BBFCC0
	ldr r1, [r7, #0xc]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	b _08003B7C
	.align 2, 0
_08003B6C: .4byte gUnk_08BBFCC0
_08003B70:
	ldr r1, _08003BF4 @ =gUnk_08BBFCC0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_08003B7C:
	ldr r1, [r7, #0x10]
	ldr r2, [r7]
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
	ldr r0, [r7]
	cmp r0, #0
	bne _08003BDE
	movs r0, #1
	str r0, [r7]
_08003BDE:
	ldr r0, [r7]
	bl SetBgmVolume
	ldr r0, _08003BF8 @ =0x0300003C
	ldr r1, [r7, #0x10]
	str r1, [r0]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003BF4: .4byte gUnk_08BBFCC0
_08003BF8: .4byte 0x0300003C

	thumb_func_start MusicVc_OnLoop
MusicVc_OnLoop: @ 0x08003BFC
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x64
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	ldr r0, [r7]
	adds r3, r0, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r0]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	ldr r4, [r7]
	adds r0, r4, #0
	adds r4, #0x6a
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetBgmVolume
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x68
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08003CD8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bne _08003CB8
	bl GetCurrentBgmSong
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	bl m4aSongNumStop
	ldr r0, _08003CB4 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003CB4 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003CB4 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08003CB4 @ =0x02024E14
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	b _08003CCC
	.align 2, 0
_08003CB4: .4byte 0x02024E14
_08003CB8:
	ldr r0, _08003CE0 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
_08003CCC:
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08003CE4 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_08003CD8:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003CE0: .4byte 0x02024E14
_08003CE4: .4byte 0x0300003C

	thumb_func_start DelaySong_OnLoop
DelaySong_OnLoop: @ 0x08003CE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x4c
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
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	blt _08003D26
	b _08003D6E
_08003D26:
	ldr r0, _08003D78 @ =0x02024E14
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003D78 @ =0x02024E14
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4a
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x54]
	adds r1, r2, #0
	bl PlaySongCore
	ldr r0, [r7]
	bl Proc_End
_08003D6E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003D78: .4byte 0x02024E14

	thumb_func_start sub_8003D7C
sub_8003D7C: @ 0x08003D7C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08003D9C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003DA0
	b _08003DE2
	.align 2, 0
_08003D9C: .4byte gPlaySt
_08003DA0:
	ldr r1, _08003DEC @ =gUnk_08BBFCD8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
_08003DE2:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003DEC: .4byte gUnk_08BBFCD8

	thumb_func_start PlaySongCore
PlaySongCore: @ 0x08003DF0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	cmp r0, #0x7f
	bgt _08003E0E
	ldr r0, [r7]
	bl sub_8003E9C
	movs r0, #0
	ldr r1, [r7]
	bl sub_80A0184
_08003E0E:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08003E30
	ldr r0, [r7, #4]
	ldr r1, _08003E2C @ =gUnk_086EA8D0
	ldr r2, [r7]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldr r2, [r1]
	adds r1, r2, #0
	bl MPlayStart_rev01
	b _08003E3E
	.align 2, 0
_08003E2C: .4byte gUnk_086EA8D0
_08003E30:
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl m4aSongNumStart
_08003E3E:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8003E48
sub_8003E48: @ 0x08003E48
	push {r7, lr}
	mov r7, sp
	movs r0, #7
	bl sub_8003E68
	ldr r0, _08003E64 @ =0x02024E14
	ldrb r1, [r0, #8]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #8]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003E64: .4byte 0x02024E14

	thumb_func_start sub_8003E68
sub_8003E68: @ 0x08003E68
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003E98 @ =0x02024E14
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #8]
	ldr r0, [r7]
	lsls r1, r0, #8
	adds r0, r1, #0
	bl SoundMode_rev01
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003E98: .4byte 0x02024E14

	thumb_func_start sub_8003E9C
sub_8003E9C: @ 0x08003E9C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x5a
	beq _08003ECC
	cmp r0, #0x5a
	bgt _08003EB8
	cmp r0, #0x2a
	bgt _08003EE4
	cmp r0, #0x29
	blt _08003EE4
	b _08003ECC
_08003EB8:
	cmp r0, #0x5f
	beq _08003ECC
	cmp r0, #0x5f
	bgt _08003EC6
	cmp r0, #0x5c
	beq _08003ECC
	b _08003EE4
_08003EC6:
	cmp r0, #0x74
	beq _08003ECC
	b _08003EE4
_08003ECC:
	ldr r0, _08003EE0 @ =0x02024E14
	movs r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #8
	beq _08003EDC
	movs r0, #8
	bl sub_8003E68
_08003EDC:
	b _08003EFC
	.align 2, 0
_08003EE0: .4byte 0x02024E14
_08003EE4:
	ldr r0, _08003EF8 @ =0x02024E14
	movs r1, #8
	ldrsb r1, [r0, r1]
	movs r0, #1
	cmn r1, r0
	beq _08003EF4
	bl sub_8003E48
_08003EF4:
	b _08003EFC
	.align 2, 0
_08003EF8: .4byte 0x02024E14
_08003EFC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8003F04
sub_8003F04: @ 0x08003F04
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003F18 @ =gUnk_08BBFCC0
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _08003F1C
	movs r0, #1
	b _08003F20
	.align 2, 0
_08003F18: .4byte gUnk_08BBFCC0
_08003F1C:
	movs r0, #0
	b _08003F20
_08003F20:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8003F28
sub_8003F28: @ 0x08003F28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_80033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08003F8A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08003F8A
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	movs r0, #1
	cmn r1, r0
	bne _08003F74
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	ldr r2, [r3, #0x58]
	ldr r3, [r7]
	bl StartBgmVolumeChange
	b _08003F8A
_08003F74:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	movs r1, #0
	ldr r3, [r7]
	bl StartBgmVolumeChange
_08003F8A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8003F94
sub_8003F94: @ 0x08003F94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	ble _08003FC2
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	adds r0, r1, #0
	movs r1, #0
	bl sub_800376C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	bl SetBgmVolume
	b _08003FCA
_08003FC2:
	ldr r0, [r7]
	movs r1, #0
	bl Proc_Goto
_08003FCA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CallSomeSoundMaybe
CallSomeSoundMaybe: @ 0x08003FD4
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	bl sub_80033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08004008
	ldr r0, _08004004 @ =0x02024E14
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _08004008
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _08004008
	b _08004092
	.align 2, 0
_08004004: .4byte 0x02024E14
_08004008:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _08004020
	ldr r1, _0800401C @ =gUnk_08BBFCE8
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	b _0800402C
	.align 2, 0
_0800401C: .4byte gUnk_08BBFCE8
_08004020:
	ldr r1, _08004054 @ =gUnk_08BBFCE8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_0800402C:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x58]
	bl sub_80033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0800405C
	ldr r0, _08004058 @ =0x02024E14
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _0800405C
	ldr r0, [r7, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x5c]
	b _08004062
	.align 2, 0
_08004054: .4byte gUnk_08BBFCE8
_08004058: .4byte 0x02024E14
_0800405C:
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x5c]
_08004062:
	ldr r1, [r7, #0x10]
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
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
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
_08004092:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800409C
sub_800409C: @ 0x0800409C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080040B0 @ =gUnk_08BBFCE8
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _080040B4
	movs r0, #1
	b _080040B8
	.align 2, 0
_080040B0: .4byte gUnk_08BBFCE8
_080040B4:
	movs r0, #0
	b _080040B8
_080040B8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80040C0
sub_80040C0: @ 0x080040C0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080040F4 @ =0x02024E14
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	beq _080040EC
	bl sub_80033D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080040E4
	movs r0, #0
	bl SetBgmVolume
_080040E4:
	ldr r0, [r7]
	movs r1, #0
	bl sub_8003684
_080040EC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080040F4: .4byte 0x02024E14

	thumb_func_start sub_80040F8
sub_80040F8: @ 0x080040F8
	push {r7, lr}
	mov r7, sp
	ldr r1, _0800410C @ =gUnk_08BBFCD8
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800410C: .4byte gUnk_08BBFCD8

	thumb_func_start sub_8004110
sub_8004110: @ 0x08004110
	push {r7, lr}
	mov r7, sp
	bl sub_80040F8
	ldr r1, _0800414C @ =0x03005A30
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r1, _08004150 @ =0x03005C40
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r0, _08004154 @ =0x02024E14
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08004154 @ =0x02024E14
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800414C: .4byte 0x03005A30
_08004150: .4byte 0x03005C40
_08004154: .4byte 0x02024E14
