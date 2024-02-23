	.include "macro.inc"

	.syntax unified

	thumb_func_start PutObjectAffine
PutObjectAffine: @ 0x0800680C
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _0800683C @ =gOam
	lsls r0, r0, #4
	adds r4, r0, #3
	lsls r4, r4, #1
	adds r4, r4, r5
	strh r1, [r4]
	adds r1, r0, #7
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, #0xf
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800683C: .4byte gOam

	thumb_func_start ClearSprites
ClearSprites: @ 0x08006840
	push {r4, r5, r6, lr}
	movs r3, #0xf
	ldr r2, _08006878 @ =0x0202A480
	ldr r6, _0800687C @ =0x030040B0
	ldr r5, _08006880 @ =0x02029C80
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r0, r2, #0
	adds r0, #0xf0
_08006856:
	str r1, [r0]
	str r4, [r0, #0xc]
	subs r1, #0x10
	subs r0, #0x10
	subs r3, #1
	cmp r3, #0
	bge _08006856
	adds r0, r2, #0
	adds r0, #0xf0
	movs r1, #0
	str r1, [r0]
	subs r0, #0x30
	str r1, [r0]
	str r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006878: .4byte 0x0202A480
_0800687C: .4byte 0x030040B0
_08006880: .4byte 0x02029C80

	thumb_func_start PutSprite
PutSprite: @ 0x08006884
	push {r4, r5, r6, r7, lr}
	ldr r6, _080068B8 @ =0x030040B0
	ldr r5, [r6]
	ldr r4, _080068BC @ =0x0202A480
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r4, [r0]
	str r4, [r5]
	ldr r7, _080068C0 @ =0x000001FF
	adds r4, r7, #0
	ands r1, r4
	strh r1, [r5, #4]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r5, #6]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r5, #8]
	str r3, [r5, #0xc]
	str r5, [r0]
	adds r5, #0x10
	str r5, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080068B8: .4byte 0x030040B0
_080068BC: .4byte 0x0202A480
_080068C0: .4byte 0x000001FF

	thumb_func_start PutSpriteExt
PutSpriteExt: @ 0x080068C4
	push {r4, r5, r6, r7, lr}
	ldr r7, [sp, #0x14]
	ldr r6, _080068EC @ =0x030040B0
	ldr r4, [r6]
	ldr r5, _080068F0 @ =0x0202A480
	lsls r0, r0, #4
	adds r0, r0, r5
	ldr r5, [r0]
	str r5, [r4]
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	strh r7, [r4, #8]
	str r3, [r4, #0xc]
	str r4, [r0]
	adds r4, #0x10
	str r4, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080068EC: .4byte 0x030040B0
_080068F0: .4byte 0x0202A480

	thumb_func_start PushSpriteLayerObjects
PushSpriteLayerObjects: @ 0x080068F4
	push {r4, lr}
	lsls r0, r0, #4
	ldr r1, _08006920 @ =0x0202A480
	adds r4, r0, r1
	cmp r4, #0
	beq _0800691A
_08006900:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _08006914
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r3, #6
	ldrsh r1, [r4, r3]
	ldrh r3, [r4, #8]
	bl PutOamHiRam
_08006914:
	ldr r4, [r4]
	cmp r4, #0
	bne _08006900
_0800691A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006920: .4byte 0x0202A480

	thumb_func_start sub_8006924
sub_8006924: @ 0x08006924
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, [r0, #0x54]
	adds r0, #0x52
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800694C
sub_800694C: @ 0x0800694C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	beq _08006964
	ldr r0, _08006960 @ =gUnk_08BFF7F8
	adds r1, r4, #0
	b _08006968
	.align 2, 0
_08006960: .4byte gUnk_08BFF7F8
_08006964:
	ldr r0, _0800698C @ =gUnk_08BFF7F8
	movs r1, #3
_08006968:
	bl Proc_Start
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	adds r0, r1, #0
	adds r0, #0x50
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	str r0, [r1, #0x54]
	adds r2, r1, #0
	adds r2, #0x52
	ldr r0, [sp, #0x18]
	strh r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800698C: .4byte gUnk_08BFF7F8

	thumb_func_start MoveSpriteRefresher
MoveSpriteRefresher: @ 0x08006990
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bne _080069A0
	ldr r0, _080069AC @ =gUnk_08BFF7F8
	bl Proc_Find
_080069A0:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080069AC: .4byte gUnk_08BFF7F8
