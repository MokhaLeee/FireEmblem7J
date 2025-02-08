	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80963FC
sub_80963FC: @ 0x080963FC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08096428 @ =0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_08096406:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809642C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08096406
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096428: .4byte 0x0000DFC0
_0809642C: .4byte Sprite_32x16

	thumb_func_start sub_8096430
sub_8096430: @ 0x08096430
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0809645C @ =sub_80963FC
	bl StartParallelWorker
	movs r0, #0xf0
	lsls r0, r0, #7
	ldr r1, _08096460 @ =gUnk_08D8D10C
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	movs r1, #0
	str r1, [sp]
	movs r1, #0xd
	movs r3, #1
	bl NewSysboxText
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809645C: .4byte sub_80963FC
_08096460: .4byte gUnk_08D8D10C

	thumb_func_start StoreConvoyWeaponIconGraphics
StoreConvoyWeaponIconGraphics: @ 0x08096464
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08096490 @ =gUnk_0841E7F4
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08096494 @ =Img_0841E49C
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08096498 @ =Img_0841E634
	ldr r1, _0809649C @ =0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096490: .4byte gUnk_0841E7F4
_08096494: .4byte Img_0841E49C
_08096498: .4byte Img_0841E634
_0809649C: .4byte 0x06000200

	thumb_func_start sub_80964A0
sub_80964A0: @ 0x080964A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, _080964E8 @ =Unk_Prep_02012466
	ldrh r0, [r1]
	cmp r0, #0
	bne _080964F0
	ldr r0, [sp]
	bl ClearText
	ldr r3, _080964EC @ =gUnk_0842D0C4
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl PutText
	b _0809659A
	.align 2, 0
_080964E8: .4byte Unk_Prep_02012466
_080964EC: .4byte gUnk_0842D0C4
_080964F0:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _0809659A
	ldrh r1, [r1]
	cmp r6, r1
	bge _0809659A
_080964FE:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _080965AC @ =gPrepScreenItemList
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov sb, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096528
	movs r0, #1
	mov sb, r0
_08096528:
	mov r0, r8
	bl ClearText
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, sb
	bl Text_InsertDrawString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl PutText
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	bne _08096578
	movs r5, #2
_08096578:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _0809659A
	ldr r0, _080965B0 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r6, r0
	blt _080964FE
_0809659A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080965AC: .4byte gPrepScreenItemList
_080965B0: .4byte Unk_Prep_02012466

	thumb_func_start sub_80965B4
sub_80965B4: @ 0x080965B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _08096604
	ldr r0, _08096610 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r5, r0
	bge _08096604
	ldr r1, _08096614 @ =gPrepScreenItemList
	lsls r0, r5, #2
	adds r6, r0, r1
_080965D4:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _08096604
	ldr r0, _08096610 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r5, r0
	blt _080965D4
_08096604:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096610: .4byte Unk_Prep_02012466
_08096614: .4byte gPrepScreenItemList

	thumb_func_start sub_8096618
sub_8096618: @ 0x08096618
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _080966C4 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, r2
	ble _080966B8
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _080966C8 @ =gPrepScreenItemList
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096658
	movs r0, #1
	mov r8, r0
_08096658:
	lsls r4, r4, #6
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertDrawString
	adds r5, r4, #2
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl PutIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl PutText
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _080966A8
	movs r5, #2
_080966A8:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
_080966B8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080966C4: .4byte Unk_Prep_02012466
_080966C8: .4byte gPrepScreenItemList

	thumb_func_start sub_80966CC
sub_80966CC: @ 0x080966CC
	ldr r0, _08096700 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080966DC
	movs r2, #0
_080966DC:
	cmp r2, #0xc
	bne _080966EC
	ldr r1, _08096704 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_080966EC:
	cmp r2, #0x34
	beq _080966F4
	cmp r2, #0
	bne _080966FE
_080966F4:
	ldr r0, _08096704 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_080966FE:
	bx lr
	.align 2, 0
_08096700: .4byte 0x04000006
_08096704: .4byte 0x04000050

	thumb_func_start sub_8096708
sub_8096708: @ 0x08096708
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08096726
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _0809672C
_08096726:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_0809672C:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809674C
	ldr r0, _08096748 @ =ProcScr_AtMenu
	bl Proc_Find
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	b _08096752
	.align 2, 0
_08096748: .4byte ProcScr_AtMenu
_0809674C:
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0
_08096752:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_0809676E:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809676E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8096784
sub_8096784: @ 0x08096784
	push {r4, lr}
	ldr r4, _080967B4 @ =0x02012B50
	ldr r1, _080967B8 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _080967BC @ =Pal_Text
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080967B4: .4byte 0x02012B50
_080967B8: .4byte 0x06011000
_080967BC: .4byte Pal_Text

	thumb_func_start sub_80967C0
sub_80967C0: @ 0x080967C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetConvoyItemCount_
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _08096824 @ =0x02012B50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r2, #0
	cmp r5, #0x64
	beq _080967FA
	cmp r6, #0
	bne _080967FC
_080967FA:
	movs r2, #1
_080967FC:
	ldr r3, _08096828 @ =gUnk_0842D0D4
	movs r1, #0
	bl Text_InsertDrawString
	ldr r0, _0809682C @ =0x02012BE0
	movs r2, #0
	cmp r6, #5
	bne _0809680E
	movs r2, #1
_0809680E:
	ldr r3, _08096830 @ =gUnk_0842D0E0
	movs r1, #0x40
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096824: .4byte 0x02012B50
_08096828: .4byte gUnk_0842D0D4
_0809682C: .4byte 0x02012BE0
_08096830: .4byte gUnk_0842D0E0

	thumb_func_start sub_8096834
sub_8096834: @ 0x08096834
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r6, _080968D8 @ =gBg0Tm + 0x68
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _080968DC @ =0x02012B68
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	ldr r0, _080968E0 @ =gUnk_0842D0EC
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	movs r3, #2
	bl PutFaceChibi
	adds r4, #8
	str r5, [sp]
	ldr r0, _080968E4 @ =gUnk_0842D0F4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r5, r6, #0
	adds r5, #0xa
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _080968A0
	movs r4, #4
_080968A0:
	bl GetConvoyItemCount_
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080968D8: .4byte gBg0Tm + 0x68
_080968DC: .4byte 0x02012B68
_080968E0: .4byte gUnk_0842D0EC
_080968E4: .4byte gUnk_0842D0F4

	thumb_func_start sub_80968E8
sub_80968E8: @ 0x080968E8
	push {r4, lr}
	sub sp, #4
	ldr r0, _08096928 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #4
	bl sub_80935C4
	ldr r4, _0809692C @ =Sprite_32x16
	ldr r0, _08096930 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08096934 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096928: .4byte 0x0000A980
_0809692C: .4byte Sprite_32x16
_08096930: .4byte 0x0000B080
_08096934: .4byte 0x0000B088

	thumb_func_start sub_8096938
sub_8096938: @ 0x08096938
	push {lr}
	sub sp, #4
	ldr r0, _08096964 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #2
	bl sub_80935C4
	ldr r3, _08096968 @ =Sprite_32x16
	ldr r0, _0809696C @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08096964: .4byte 0x0000A980
_08096968: .4byte Sprite_32x16
_0809696C: .4byte 0x0000B080

	thumb_func_start sub_8096970
sub_8096970: @ 0x08096970
	push {lr}
	sub sp, #4
	ldr r0, _0809699C @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x32
	movs r2, #5
	movs r3, #2
	bl sub_80935C4
	ldr r3, _080969A0 @ =Sprite_32x16
	ldr r0, _080969A4 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809699C: .4byte 0x0000A980
_080969A0: .4byte Sprite_32x16
_080969A4: .4byte 0x0000B088

	thumb_func_start sub_80969A8
sub_80969A8: @ 0x080969A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08096A20 @ =gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08096A24 @ =gUnk_08421C24
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08096A28 @ =0x000002DA
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08096A2C @ =gUnk_08D8D4F8
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0xc5
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08096A30 @ =gUnk_08D8D4E8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _08096A34 @ =Unk_Prep_02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096A20: .4byte gPal
_08096A24: .4byte gUnk_08421C24
_08096A28: .4byte 0x000002DA
_08096A2C: .4byte gUnk_08D8D4F8
_08096A30: .4byte gUnk_08D8D4E8
_08096A34: .4byte Unk_Prep_02012466

	thumb_func_start sub_8096A38
sub_8096A38: @ 0x08096A38
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, _08096A74 @ =0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
_08096A5A:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble _08096A5A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096A74: .4byte 0x0001FFFF

	thumb_func_start sub_8096A78
sub_8096A78: @ 0x08096A78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r7, _08096D54 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	movs r4, #1
	orrs r0, r4
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	movs r2, #2
	mov sb, r2
	mov r6, sb
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sl
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08096D58 @ =0x06016000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08096D5C @ =gBg1Tm
	ldr r1, _08096D60 @ =gUnk_0842A0A4
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	mov r6, sl
	str r6, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r0, [r6, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	mov r0, sl
	bl StartUiCursorHand
	mov r0, sl
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r5, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	ldr r1, _08096D64 @ =0x030027C4
	ldrb r0, [r1]
	orrs r0, r4
	mov r2, sb
	orrs r0, r2
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	movs r6, #0x36
	adds r6, r6, r7
	mov ip, r6
	ldrb r1, [r6]
	orrs r4, r1
	mov r6, sb
	orrs r4, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r4, r1
	orrs r4, r3
	orrs r4, r2
	orrs r0, r5
	ldr r1, _08096D64 @ =0x030027C4
	strb r0, [r1]
	orrs r4, r5
	mov r2, ip
	strb r4, [r2]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	mov r0, sl
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, sl
	bl StartHelpPromptSprite
	ldr r4, _08096D68 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	bl InitText
	bl sub_8096784
	adds r4, #0x10
	movs r5, #4
_08096C62:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096C62
	mov r6, sl
	adds r6, #0x35
	mov r7, sl
	adds r7, #0x4c
	ldr r4, _08096D6C @ =0x02012BA0
	movs r5, #7
_08096C7E:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096C7E
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _08096D70 @ =sub_80966CC
	bl SetOnHBlankA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r5, _08096D74 @ =gBg0Tm + 0xde
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_8096A38
	ldr r0, _08096D78 @ =gUnk_0841E0A4
	ldr r1, _08096D7C @ =0x06015000
	bl Decompress
	mov r0, sl
	bl StartMenuScrollBar
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #6
	bl InitMenuScrollBarImg
	movs r0, #0xe2
	movs r1, #0x30
	bl PutMenuScrollBarAt
	bl TryHideMenuScrollBar
	mov r2, sl
	ldr r0, [r2, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r4, _08096D6C @ =0x02012BA0
	ldr r1, _08096D80 @ =gBg2Tm + 0x1e
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r7, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	mov r6, sl
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r6, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	bl sub_8096834
	mov r0, sl
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _08096D84 @ =sub_80969A8
	mov r1, sl
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096D54: .4byte gDispIo
_08096D58: .4byte 0x06016000
_08096D5C: .4byte gBg1Tm
_08096D60: .4byte gUnk_0842A0A4
_08096D64: .4byte 0x030027C4
_08096D68: .4byte 0x02012B68
_08096D6C: .4byte 0x02012BA0
_08096D70: .4byte sub_80966CC
_08096D74: .4byte gBg0Tm + 0xde
_08096D78: .4byte gUnk_0841E0A4
_08096D7C: .4byte 0x06015000
_08096D80: .4byte gBg2Tm + 0x1e
_08096D84: .4byte sub_80969A8

	thumb_func_start sub_8096D88
sub_8096D88: @ 0x08096D88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_8096430
	movs r0, #0
	bl sub_80A998C
	adds r0, r4, #0
	bl sub_80967C0
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldr r0, _08096DE0 @ =sub_8096938
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096DE4 @ =sub_8096970
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096DE8 @ =sub_80968E8
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096DE0: .4byte sub_8096938
_08096DE4: .4byte sub_8096970
_08096DE8: .4byte sub_80968E8

	thumb_func_start sub_8096DEC
sub_8096DEC: @ 0x08096DEC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _08096DFE
	b _08096F58
_08096DFE:
	ldr r1, _08096E1C @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _08096E12
	b _08096F08
_08096E12:
	cmp r6, #0
	beq _08096E20
	cmp r6, #1
	beq _08096E8C
	b _0809700C
	.align 2, 0
_08096E1C: .4byte gpKeySt
_08096E20:
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _08096EEC
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _08096EEC
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _08096E7C @ =sub_80968E8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096E80 @ =sub_8096938
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl sub_8096430
	ldr r0, _08096E84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096E72
	ldr r0, _08096E88 @ =0x0000038A
	bl m4aSongNumStart
_08096E72:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809700C
	.align 2, 0
_08096E7C: .4byte sub_80968E8
_08096E80: .4byte sub_8096938
_08096E84: .4byte gPlaySt
_08096E88: .4byte 0x0000038A
_08096E8C:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08096EEC
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _08096EDC @ =sub_80968E8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096EE0 @ =sub_8096970
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl sub_8096430
	ldr r0, _08096EE4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096ED2
	ldr r0, _08096EE8 @ =0x0000038A
	bl m4aSongNumStart
_08096ED2:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809700C
	.align 2, 0
_08096EDC: .4byte sub_80968E8
_08096EE0: .4byte sub_8096970
_08096EE4: .4byte gPlaySt
_08096EE8: .4byte 0x0000038A
_08096EEC:
	ldr r0, _08096F04 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096EFA
	b _0809700C
_08096EFA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809700C
	.align 2, 0
_08096F04: .4byte gPlaySt
_08096F08:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08096F34
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08096F2C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809700C
	ldr r0, _08096F30 @ =0x0000038B
	bl m4aSongNumStart
	b _0809700C
	.align 2, 0
_08096F2C: .4byte gPlaySt
_08096F30: .4byte 0x0000038B
_08096F34:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08096F78
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _08096F54 @ =gUnk_08D8D118
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _0809700C
	.align 2, 0
_08096F54: .4byte gUnk_08D8D118
_08096F58:
	ldr r2, _08096F74 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096F78
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _0809700C
	.align 2, 0
_08096F74: .4byte gpKeySt
_08096F78:
	ldr r3, [r2]
	movs r1, #0x40
	adds r0, r1, #0
	ldrh r4, [r3, #6]
	ands r0, r4
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _08096FA2
	ldrb r0, [r4]
	cmp r0, #0
	beq _08096F94
	subs r0, #1
	b _08096FA0
_08096F94:
	adds r0, r1, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08096FA2
	movs r0, #1
_08096FA0:
	strb r0, [r4]
_08096FA2:
	ldr r1, [r2]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _08096FC8
	ldrb r0, [r4]
	cmp r0, #0
	bne _08096FBA
	adds r0, #1
	b _08096FC6
_08096FBA:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096FC8
	movs r0, #0
_08096FC6:
	strb r0, [r4]
_08096FC8:
	ldrb r0, [r4]
	cmp r6, r0
	beq _0809700C
	ldr r0, _08097014 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096FE0
	ldr r0, _08097018 @ =0x00000386
	bl m4aSongNumStart
_08096FE0:
	ldrb r3, [r4]
	lsls r1, r3, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809700C
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _0809701C @ =gUnk_08D8D118
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_0809700C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097014: .4byte gPlaySt
_08097018: .4byte 0x00000386
_0809701C: .4byte gUnk_08D8D118

	thumb_func_start sub_8097020
sub_8097020: @ 0x08097020
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r0, _080970B0 @ =0x02012BA0
	ldr r1, _080970B4 @ =gBg2Tm + 0x1e
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_80964A0
	ldr r0, _080970B8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080970CC
	ldr r0, _080970BC @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080970C4
	ldr r2, _080970C0 @ =gPrepScreenItemList
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _080970CA
	.align 2, 0
_080970B0: .4byte 0x02012BA0
_080970B4: .4byte gBg2Tm + 0x1e
_080970B8: .4byte gBg0Tm + 0x244
_080970BC: .4byte Unk_Prep_02012466
_080970C0: .4byte gPrepScreenItemList
_080970C4:
	bl CloseHelpBox
	movs r0, #0xff
_080970CA:
	strh r0, [r4, #0x38]
_080970CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80970D4
sub_80970D4: @ 0x080970D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _08097100
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_08097100:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _08097120
	ldrb r0, [r5]
	cmp r0, #0
	bne _08097112
	movs r0, #8
	b _08097114
_08097112:
	subs r0, #1
_08097114:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_8097020
	ldr r3, [sp]
_08097120:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _08097140
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_08097140:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809716E
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0809716E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8097178
sub_8097178: @ 0x08097178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _080971AA
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_080971AA:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne _080971C6
	ldrb r0, [r5]
	cmp r0, #8
	bne _080971BC
	movs r0, #0
	b _080971BE
_080971BC:
	adds r0, #1
_080971BE:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8097020
_080971C6:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt _080971EA
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	rsbs r6, r0, #0
_080971EA:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809721A
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
_0809721A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8097224
sub_8097224: @ 0x08097224
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809724C @ =Unk_Prep_02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _08097250
	mov r3, ip
	adds r3, #0x35
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809726E
	.align 2, 0
_0809724C: .4byte Unk_Prep_02012466
_08097250:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _0809726E
	strh r4, [r0]
_0809726E:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809728C
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809728C
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809728C:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80972A8
sub_80972A8: @ 0x080972A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _080972D6
	cmp r3, #0
	beq _080972D6
	adds r0, r3, #1
	strh r0, [r4]
_080972D6:
	mov r4, ip
	adds r4, #0x35
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809730A
	ldr r0, _08097338 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809730A
	subs r0, r5, #1
	strh r0, [r6]
_0809730A:
	mov r0, ip
	bl sub_8097224
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097338: .4byte Unk_Prep_02012466

	thumb_func_start sub_809733C
sub_809733C: @ 0x0809733C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _080973D4 @ =gBg2Tm + 0x1e
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_80965B4
	ldr r0, _080973D8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _0809738E
	ldr r0, _080973DC @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_0809738E:
	cmp r7, #0
	ble _080973A8
	ldr r0, _080973DC @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_080973A8:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080973D4: .4byte gBg2Tm + 0x1e
_080973D8: .4byte gBg0Tm + 0x244
_080973DC: .4byte 0x02012BA0

	thumb_func_start sub_80973E0
sub_80973E0: @ 0x080973E0
	push {lr}
	bl sub_8096834
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80973EC
sub_80973EC: @ 0x080973EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08097408
	ldr r0, _08097420 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08097428
_08097408:
	ldr r0, _08097424 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08097416
	b _0809753A
_08097416:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809753A
	.align 2, 0
_08097420: .4byte Unk_Prep_02012466
_08097424: .4byte gPlaySt
_08097428:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _08097508 @ =gPrepScreenItemList
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_8091B48
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_8097224
	bl InitIcons
	ldr r0, _0809750C @ =gBg0Tm + 0x244
	ldr r4, _08097510 @ =0x02012B78
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08097514 @ =gBg2Tm + 0x1e
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08097518 @ =sub_80973E0
	movs r1, #1
	adds r2, r7, #0
	bl StartParallelFiniteLoop
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r6, r6, r0
	ldrh r6, [r6]
	lsls r1, r6, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r1, _0809751C @ =gActionSt
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08097528
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097520 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809753A
	ldr r0, _08097524 @ =0x0000038B
	bl m4aSongNumStart
	b _0809753A
	.align 2, 0
_08097508: .4byte gPrepScreenItemList
_0809750C: .4byte gBg0Tm + 0x244
_08097510: .4byte 0x02012B78
_08097514: .4byte gBg2Tm + 0x1e
_08097518: .4byte sub_80973E0
_0809751C: .4byte gActionSt
_08097520: .4byte gPlaySt
_08097524: .4byte 0x0000038B
_08097528:
	ldr r0, _08097544 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809753A
	ldr r0, _08097548 @ =0x0000038A
	bl m4aSongNumStart
_0809753A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097544: .4byte gPlaySt
_08097548: .4byte 0x0000038A

	thumb_func_start sub_809754C
sub_809754C: @ 0x0809754C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r1, r0, #1
	movs r2, #0x3a
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sl, r0
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r1
	movs r3, #0xf
	ldrh r0, [r6]
	ands r0, r3
	mov sb, r0
	cmp r0, #0
	beq _08097580
	b _08097778
_08097580:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809758A
	cmp r0, #0xff
	bne _0809762C
_0809758A:
	ldr r1, _080975C4 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080975EC
	ldr r0, _080975C8 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080975D0
	ldr r1, _080975CC @ =gPrepScreenItemList
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sl
	lsls r1, r3, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _080978CA
	.align 2, 0
_080975C4: .4byte gpKeySt
_080975C8: .4byte Unk_Prep_02012466
_080975CC: .4byte gPrepScreenItemList
_080975D0:
	ldr r0, _080975E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080975DE
	b _080978CA
_080975DE:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080978CA
	.align 2, 0
_080975E8: .4byte gPlaySt
_080975EC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080975FC
	adds r0, r4, #0
	bl sub_80973EC
	b _080978CA
_080975FC:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809764C
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097624 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809761E
	ldr r0, _08097628 @ =0x0000038B
	bl m4aSongNumStart
_0809761E:
	mov r0, sb
	strh r0, [r4, #0x38]
	b _080978CA
	.align 2, 0
_08097624: .4byte gPlaySt
_08097628: .4byte 0x0000038B
_0809762C:
	ldr r2, _08097648 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809764C
	bl CloseHelpBox
	mov r1, sb
	strh r1, [r4, #0x38]
	b _080978CA
	.align 2, 0
_08097648: .4byte gpKeySt
_0809764C:
	mov r3, r8
	ldr r2, [r3]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08097698
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08097690 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097676
	ldr r0, _08097694 @ =0x00000387
	bl m4aSongNumStart
_08097676:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80970D4
	b _080978CA
	.align 2, 0
_08097690: .4byte gPlaySt
_08097694: .4byte 0x00000387
_08097698:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080976D8
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080976D0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080976B8
	ldr r0, _080976D4 @ =0x00000387
	bl m4aSongNumStart
_080976B8:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8097178
	b _080978CA
	.align 2, 0
_080976D0: .4byte gPlaySt
_080976D4: .4byte 0x00000387
_080976D8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _080976EC
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _080976F2
_080976EC:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_080976F2:
	strb r0, [r1]
	adds r5, r1, #0
	mov r0, r8
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _0809771E
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x35
	adds r6, r4, #0
	adds r6, #0x3a
	cmp r0, #0
	beq _0809773A
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809773A
_0809771E:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _0809773A
	subs r0, r1, #1
	strh r0, [r3]
_0809773A:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _0809775A
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080977D6
	ldrb r5, [r5]
	cmp r5, #8
	bne _080977D6
_0809775A:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _08097774 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080977D6
	adds r0, r1, #1
	strh r0, [r2]
	b _080977D6
	.align 2, 0
_08097774: .4byte Unk_Prep_02012466
_08097778:
	mov r2, sl
	lsls r0, r2, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _08097796
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_08097796:
	ldrb r3, [r7]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _080977BE
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_080977BE:
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	mov r6, r8
_080977D6:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _080978CA
	ldr r1, _0809783C @ =gPrepScreenItemList
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r0, _08097840 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080977FE
	ldr r0, _08097844 @ =0x00000386
	bl m4aSongNumStart
_080977FE:
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4c
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _08097848
	cmp r5, #0
	beq _08097848
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809782E
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_0809782E:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _08097880
	.align 2, 0
_0809783C: .4byte gPrepScreenItemList
_08097840: .4byte gPlaySt
_08097844: .4byte 0x00000386
_08097848:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809788C
	ldr r0, _08097888 @ =Unk_Prep_02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809788C
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08097878
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_08097878:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_08097880:
	adds r0, r4, #0
	bl sub_809733C
	b _080978CA
	.align 2, 0
_08097888: .4byte Unk_Prep_02012466
_0809788C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080978AC
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_080978AC:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_080978CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80978D8
sub_80978D8: @ 0x080978D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08097908 @ =gpKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809791E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809790C
	subs r0, #1
	strb r0, [r2]
	b _0809794E
	.align 2, 0
_08097908: .4byte gpKeySt
_0809790C:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	subs r0, r3, #1
	strb r0, [r2]
	b _0809794E
_0809791E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _08097940
	adds r0, r1, #1
	strb r0, [r2]
	b _0809794E
_08097940:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	strb r5, [r2]
_0809794E:
	ldr r0, _08097964 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097960
	ldr r0, _08097968 @ =0x00000386
	bl m4aSongNumStart
_08097960:
	movs r0, #1
	b _0809796E
	.align 2, 0
_08097964: .4byte gPlaySt
_08097968: .4byte 0x00000386
_0809796C:
	movs r0, #0
_0809796E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8097974
sub_8097974: @ 0x08097974
	push {lr}
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8097990
sub_8097990: @ 0x08097990
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r1, [r7]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r0, [r5, #0x2c]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl GetPrepPageForItem
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r5, #0
	bl sub_8097224
	bl InitIcons
	ldr r0, _08097A58 @ =gBg0Tm + 0x244
	ldr r4, _08097A5C @ =0x02012B78
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08097A60 @ =gBg2Tm + 0x1e
	ldrb r6, [r6]
	lsls r2, r6, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08097A64 @ =sub_80973E0
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _08097A68 @ =gActionSt
	movs r0, #0x19
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _08097A3A
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _08097A74
_08097A3A:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097A6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097AA0
	ldr r0, _08097A70 @ =0x0000038B
	bl m4aSongNumStart
	b _08097AA0
	.align 2, 0
_08097A58: .4byte gBg0Tm + 0x244
_08097A5C: .4byte 0x02012B78
_08097A60: .4byte gBg2Tm + 0x1e
_08097A64: .4byte sub_80973E0
_08097A68: .4byte gActionSt
_08097A6C: .4byte gPlaySt
_08097A70: .4byte 0x0000038B
_08097A74:
	ldr r0, _08097AA8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097A86
	ldr r0, _08097AAC @ =0x0000038A
	bl m4aSongNumStart
_08097A86:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _08097AA0
	subs r0, r4, #1
	strb r0, [r7]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_08097AA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097AA8: .4byte gPlaySt
_08097AAC: .4byte 0x0000038A

	thumb_func_start sub_8097AB0
sub_8097AB0: @ 0x08097AB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _08097AD8
	ldr r0, _08097AD4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08097B74
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _08097BB6
	.align 2, 0
_08097AD4: .4byte gpKeySt
_08097AD8:
	ldr r0, _08097B0C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097B10
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08097BB6
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _08097BB6
	.align 2, 0
_08097B0C: .4byte gpKeySt
_08097B10:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097B48
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_8091828
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097B40
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08097B3C @ =0x000003B3
	adds r0, r1, #0
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _08097BB6
	.align 2, 0
_08097B3C: .4byte 0x000003B3
_08097B40:
	adds r0, r4, #0
	bl sub_8097990
	b _08097BB6
_08097B48:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08097B74
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097B6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097BB6
	ldr r0, _08097B70 @ =0x0000038B
	bl m4aSongNumStart
	b _08097BB6
	.align 2, 0
_08097B6C: .4byte gPlaySt
_08097B70: .4byte 0x0000038B
_08097B74:
	adds r0, r4, #0
	bl sub_80978D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097BB6
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _08097BB6
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08097BB6
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08097BB6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8097BBC
sub_8097BBC: @ 0x08097BBC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08097BD8
	ldr r0, _08097BF0 @ =ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
	strb r1, [r0]
_08097BD8:
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097BF0: .4byte ProcScr_AtMenu

	thumb_func_start StartPrepItemSupplyProc
StartPrepItemSupplyProc: @ 0x08097BF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C0C @ =ProcScr_PrepItemSupplyScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C0C: .4byte ProcScr_PrepItemSupplyScreen

	thumb_func_start sub_8097C10
sub_8097C10: @ 0x08097C10
	push {r4, lr}
	ldr r4, _08097C2C @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _08097C24
	bl EndAllMus
	ldr r0, [r4]
	bl ShowUnitSprite
_08097C24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C2C: .4byte gActiveUnit

	thumb_func_start sub_8097C30
sub_8097C30: @ 0x08097C30
	push {r4, lr}
	ldr r4, _08097C50 @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _08097C48
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
_08097C48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C50: .4byte gActiveUnit

	thumb_func_start StartBmSupply
StartBmSupply: @ 0x08097C54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C70 @ =ProcScr_BmSupplyScreen
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C70: .4byte ProcScr_BmSupplyScreen

	thumb_func_start MaybeStartSelectConvoyItemProc
MaybeStartSelectConvoyItemProc: @ 0x08097C74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C90 @ =ProcScr_BmSupplyScreen
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C90: .4byte ProcScr_BmSupplyScreen
