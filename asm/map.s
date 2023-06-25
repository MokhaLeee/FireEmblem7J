	.include "macro.inc"
	.syntax unified

	thumb_func_start InitChapterMap
InitChapterMap: @ 0x08019170
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08019228 @ =0x02001000
	adds r1, r4, #0
	bl sub_0801955C
	adds r0, r4, #0
	bl sub_080195BC
	ldr r0, _0801922C @ =0x0202E3F4
	ldr r6, _08019230 @ =gBmMapUnit
	ldr r4, _08019234 @ =gBmMapSize
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r6, #0
	bl BmMapInit
	ldr r0, _08019238 @ =0x0202EBAC
	ldr r5, _0801923C @ =gBmMapTerrain
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r5, #0
	bl BmMapInit
	ldr r0, _08019240 @ =0x03000440
	ldr r1, _08019244 @ =gBmMapMovement
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019248 @ =0x03000BF8
	ldr r1, _0801924C @ =0x0202E3E4
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019250 @ =0x0202F364
	ldr r1, _08019254 @ =0x0202E3E8
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019258 @ =0x0202FB1C
	ldr r1, _0801925C @ =gBmMapHidden
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019260 @ =0x020302D4
	ldr r1, _08019264 @ =0x0202E3F0
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, [r6]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	movs r1, #0
	bl BmMapFillg
	bl sub_08019654
	bl sub_0802C100
	bl RefreshTerrainMap
	ldr r0, _08019268 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x26
	bne _08019220
	bl sub_080192D4
_08019220:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019228: .4byte 0x02001000
_0801922C: .4byte 0x0202E3F4
_08019230: .4byte gBmMapUnit
_08019234: .4byte gBmMapSize
_08019238: .4byte 0x0202EBAC
_0801923C: .4byte gBmMapTerrain
_08019240: .4byte 0x03000440
_08019244: .4byte gBmMapMovement
_08019248: .4byte 0x03000BF8
_0801924C: .4byte 0x0202E3E4
_08019250: .4byte 0x0202F364
_08019254: .4byte 0x0202E3E8
_08019258: .4byte 0x0202FB1C
_0801925C: .4byte gBmMapHidden
_08019260: .4byte 0x020302D4
_08019264: .4byte 0x0202E3F0
_08019268: .4byte gPlaySt

	thumb_func_start InitChapterPreviewMap
InitChapterPreviewMap: @ 0x0801926C
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r0, _080192BC @ =0x02001000
	bl sub_0801955C
	ldr r0, _080192C0 @ =0x0202E3F4
	ldr r6, _080192C4 @ =gBmMapUnit
	ldr r4, _080192C8 @ =gBmMapSize
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r6, #0
	bl BmMapInit
	ldr r0, _080192CC @ =0x0202EBAC
	ldr r5, _080192D0 @ =gBmMapTerrain
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r5, #0
	bl BmMapInit
	ldr r0, [r6]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	movs r1, #0
	bl BmMapFillg
	bl sub_08019654
	bl RefreshTerrainMap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080192BC: .4byte 0x02001000
_080192C0: .4byte 0x0202E3F4
_080192C4: .4byte gBmMapUnit
_080192C8: .4byte gBmMapSize
_080192CC: .4byte 0x0202EBAC
_080192D0: .4byte gBmMapTerrain

	thumb_func_start sub_080192D4
sub_080192D4: @ 0x080192D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	ldr r1, _080193AC @ =gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	mov sb, r1
	cmp r6, r0
	blt _080192EE
	b _0801941A
_080192EE:
	ldr r0, _080193B0 @ =0x08C02570
	mov sl, r0
_080192F2:
	movs r4, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r6, #1
	mov r8, r1
	cmp r4, r0
	blt _08019302
	b _0801940C
_08019302:
	ldr r2, _080193B4 @ =gBmMapTerrain
	mov ip, r2
	lsls r3, r6, #2
	mov r7, sl
	movs r5, #0
_0801930C:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x3c
	bne _080193FC
	movs r2, #0
	cmp r4, #0
	ble _0801933E
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0801932C
	movs r2, #1
_0801932C:
	cmp r0, #0x2d
	bne _08019332
	movs r2, #1
_08019332:
	cmp r0, #0x20
	bne _08019338
	movs r2, #1
_08019338:
	cmp r0, #0x21
	bne _0801933E
	movs r2, #1
_0801933E:
	cmp r6, #0
	ble _08019368
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08019356
	adds r2, #2
_08019356:
	cmp r0, #0x2d
	bne _0801935C
	adds r2, #2
_0801935C:
	cmp r0, #0x20
	bne _08019362
	adds r2, #2
_08019362:
	cmp r0, #0x21
	bne _08019368
	adds r2, #2
_08019368:
	cmp r4, #0
	ble _0801939C
	cmp r6, #0
	ble _0801939C
	mov r1, ip
	ldr r0, [r1]
	adds r1, r3, r0
	ldr r0, [r1]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0801939C
	ldr r0, [r1, #4]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _0801939C
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _0801939C
	movs r2, #4
_0801939C:
	cmp r2, #2
	beq _080193D0
	cmp r2, #2
	bgt _080193B8
	cmp r2, #1
	beq _080193C2
	b _080193FC
	.align 2, 0
_080193AC: .4byte gBmMapSize
_080193B0: .4byte 0x08C02570
_080193B4: .4byte gBmMapTerrain
_080193B8:
	cmp r2, #3
	beq _080193DE
	cmp r2, #4
	beq _080193EC
	b _080193FC
_080193C2:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb7
	lsls r2, r2, #2
	b _080193F8
_080193D0:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb6
	lsls r2, r2, #2
	b _080193F8
_080193DE:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd6
	lsls r2, r2, #2
	b _080193F8
_080193EC:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd7
	lsls r2, r2, #2
_080193F8:
	adds r1, r2, #0
	strh r1, [r0]
_080193FC:
	adds r5, #2
	adds r4, #1
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _0801940C
	b _0801930C
_0801940C:
	mov r6, r8
	mov r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bge _0801941A
	b _080192F2
_0801941A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08019428
sub_08019428: @ 0x08019428
	push {lr}
	ldr r0, _0801944C @ =0x02001000
	ldr r1, _08019450 @ =gPlaySt
	ldrb r1, [r1, #0xe]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_0801955C
	bl sub_08019654
	bl sub_0802C100
	bl RefreshTerrainMap
	bl sub_080192D4
	pop {r0}
	bx r0
	.align 2, 0
_0801944C: .4byte 0x02001000
_08019450: .4byte gPlaySt

	thumb_func_start BmMapInit
BmMapInit: @ 0x08019454
	push {r4, r5, r6, r7, lr}
	mov ip, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r2, _08019490 @ =0x03000438
	str r0, [r2]
	adds r6, #2
	adds r5, #4
	lsls r1, r5, #2
	adds r4, r0, r1
	movs r3, #0
	adds r7, r2, #0
	cmp r3, r5
	bge _08019480
_08019470:
	ldr r1, [r2]
	lsls r0, r3, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r4, r4, r6
	adds r3, #1
	cmp r3, r5
	blt _08019470
_08019480:
	ldr r0, [r7]
	adds r0, #8
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019490: .4byte 0x03000438

	thumb_func_start BmMapFillg
BmMapFillg: @ 0x08019494
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r3, r1, #0
	ldr r0, _080194EC @ =gBmMapSize
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r1, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #2
	adds r4, r1, #0
	muls r4, r0, r4
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080194B8
	subs r4, #1
_080194B8:
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #8
	adds r3, r3, r0
	mov r0, sp
	strh r3, [r0]
	adds r0, r5, #0
	subs r0, #8
	ldr r1, [r0]
	lsrs r2, r4, #0x1f
	adds r2, r4, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuSet
	adds r0, r5, #0
	bl SetWorkingBmMap
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080194EC: .4byte gBmMapSize

	thumb_func_start sub_080194F0
sub_080194F0: @ 0x080194F0
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _08019558 @ =gBmMapSize
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r4, r1
	bge _08019524
	adds r5, r7, #0
	adds r2, r6, #0
_0801950A:
	ldr r0, [r2]
	strb r3, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldm r2!, {r1}
	adds r0, r0, r1
	subs r0, #1
	strb r3, [r0]
	adds r4, #1
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _0801950A
_08019524:
	movs r1, #0
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r1, r0
	bge _08019550
	adds r2, r7, #0
_08019530:
	ldr r0, [r6]
	adds r0, r0, r1
	strb r3, [r0]
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r6
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
	adds r1, #1
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	blt _08019530
_08019550:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019558: .4byte gBmMapSize

	thumb_func_start sub_0801955C
sub_0801955C: @ 0x0801955C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl sub_08031A7C
	adds r1, r4, #0
	bl sub_08013688
	ldr r5, _080195AC @ =gBmMapSize
	ldrb r0, [r4]
	strh r0, [r5]
	ldrb r0, [r4, #1]
	strh r0, [r5, #2]
	ldr r4, _080195B0 @ =0x08D648F4
	adds r0, r6, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #7]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080195B4 @ =0x02030A8C
	bl sub_08013688
	ldr r1, _080195B8 @ =gBmSt
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xf0
	strh r0, [r1, #0x28]
	movs r2, #2
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xa0
	strh r0, [r1, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080195AC: .4byte gBmMapSize
_080195B0: .4byte 0x08D648F4
_080195B4: .4byte 0x02030A8C
_080195B8: .4byte gBmSt

	thumb_func_start sub_080195BC
sub_080195BC: @ 0x080195BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08019618 @ =0x08D648F4
	bl GetROMChapterStruct
	ldrb r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _0801961C @ =0x06008000
	bl sub_08013688
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080195FA
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019620 @ =0x0600C000
	bl sub_08013688
_080195FA:
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019618: .4byte 0x08D648F4
_0801961C: .4byte 0x06008000
_08019620: .4byte 0x0600C000

	thumb_func_start sub_08019624
sub_08019624: @ 0x08019624
	push {r4, lr}
	ldr r4, _0801964C @ =0x08D648F4
	ldr r0, _08019650 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801964C: .4byte 0x08D648F4
_08019650: .4byte gPlaySt

	thumb_func_start sub_08019654
sub_08019654: @ 0x08019654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08019708 @ =0x08C02570
	ldr r0, [r3]
	mov sb, r0
	ldr r5, _0801970C @ =0x02001000
	ldr r1, _08019710 @ =gBmMapSize
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	adds r5, #2
	movs r4, #2
	ldrsh r2, [r1, r4]
	lsls r0, r2, #2
	add r0, sb
	mov ip, r0
	movs r4, #0
	mov sl, r1
	cmp r4, r2
	bge _080196CA
	mov r7, sl
_08019684:
	lsls r3, r4, #2
	mov r1, sb
	adds r0, r3, r1
	mov r1, ip
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #1
	add ip, r0
	movs r2, #0
	adds r6, r4, #1
	cmp r2, r1
	bge _080196C0
	ldr r1, _08019708 @ =0x08C02570
	mov r8, r1
	adds r4, r3, #0
_080196A4:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r5]
	strh r1, [r0]
	adds r5, #2
	adds r2, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r2, r0
	blt _080196A4
_080196C0:
	adds r4, r6, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r4, r0
	blt _08019684
_080196CA:
	ldr r1, _08019708 @ =0x08C02570
	ldr r0, [r1]
	lsls r1, r4, #2
	adds r1, r1, r0
	subs r1, #4
	ldr r5, [r1]
	movs r2, #0
	mov r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bge _080196F2
	movs r1, #0
_080196E4:
	strh r1, [r5]
	adds r5, #2
	adds r2, #1
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	blt _080196E4
_080196F2:
	mov r1, sl
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r1, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019708: .4byte 0x08C02570
_0801970C: .4byte 0x02001000
_08019710: .4byte gBmMapSize

	thumb_func_start RefreshTerrainMap
RefreshTerrainMap: @ 0x08019714
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _08019794 @ =gBmMapSize
	mov sb, r0
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _08019782
	mov r8, sb
	ldr r3, _08019798 @ =0x08C02570
	mov sl, r3
_08019732:
	movs r3, #0
	mov r4, r8
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r6, r1, #1
	cmp r3, r0
	bge _08019776
	ldr r4, _0801979C @ =gBmMapTerrain
	mov ip, r4
	lsls r4, r1, #2
	ldr r5, _080197A0 @ =0x08C0256C
	mov r7, sl
_0801974A:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, [r0]
	adds r2, r2, r3
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r1, r0, #2
	ldr r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r3, r0
	blt _0801974A
_08019776:
	adds r1, r6, #0
	mov r2, sb
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _08019732
_08019782:
	bl sub_0802C140
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019794: .4byte gBmMapSize
_08019798: .4byte 0x08C02570
_0801979C: .4byte gBmMapTerrain
_080197A0: .4byte 0x08C0256C

	thumb_func_start sub_080197A4
sub_080197A4: @ 0x080197A4
	ldr r2, _080197C0 @ =0x08C02570
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r1, r0, #2
	ldr r0, _080197C4 @ =0x08C0256C
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080197C0: .4byte 0x08C02570
_080197C4: .4byte 0x08C0256C

	thumb_func_start sub_080197C8
sub_080197C8: @ 0x080197C8
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r2, r2, #7
	adds r0, r0, r2
	lsls r1, r1, #2
	adds r5, r0, r1
	ldr r0, _0801982C @ =0x08C02570
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	ldr r0, _08019830 @ =0x02030A8C
	adds r2, r1, r0
	ldr r0, _08019834 @ =0x0202E3E8
	ldr r0, [r0]
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r3, #0xb0
	lsls r3, r3, #8
	cmp r0, #0
	beq _08019802
	movs r3, #0xc0
	lsls r3, r3, #7
_08019802:
	ldrh r1, [r2]
	adds r0, r1, r3
	strh r0, [r5]
	adds r2, #2
	ldrh r4, [r2]
	adds r0, r4, r3
	strh r0, [r5, #2]
	adds r2, #2
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r4, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r1, #2
	ldrh r2, [r2, #2]
	adds r0, r2, r3
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801982C: .4byte 0x08C02570
_08019830: .4byte 0x02030A8C
_08019834: .4byte 0x0202E3E8

	thumb_func_start nullsub_7
nullsub_7: @ 0x08019838
	bx lr
	.align 2, 0

	thumb_func_start sub_0801983C
sub_0801983C: @ 0x0801983C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x10]
	lsls r0, r0, #5
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r4, r4, r0
	cmp r4, #0
	bne _08019856
	bl nullsub_7
_08019856:
	ldr r0, _08019878 @ =gBmMapMovement
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08019880
	movs r1, #0x85
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _0801987C @ =0x00004281
	b _080198BA
	.align 2, 0
_08019878: .4byte gBmMapMovement
_0801987C: .4byte 0x00004281
_08019880:
	ldr r0, _080198A4 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080198D8
	ldrh r0, [r4]
	cmp r0, #0
	beq _080198B0
	ldr r1, _080198A8 @ =0x00005284
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _080198AC @ =0x00005285
	b _080198BA
	.align 2, 0
_080198A4: .4byte 0x0202E3E4
_080198A8: .4byte 0x00005284
_080198AC: .4byte 0x00005285
_080198B0:
	movs r1, #0xa5
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _080198D4 @ =0x00005281
_080198BA:
	adds r0, r2, #0
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	b _080198E6
	.align 2, 0
_080198D4: .4byte 0x00005281
_080198D8:
	strh r1, [r4]
	strh r1, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_080198E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start RenderMap
RenderMap: @ 0x080198EC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08019960 @ =gBmSt
	ldrh r2, [r0, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x24]
	ldrh r2, [r0, #0xe]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x26]
	movs r5, #9
	adds r7, r0, #0
_08019906:
	movs r4, #0xe
	subs r6, r5, #1
_0801990A:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _08019964 @ =0x02024460
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080197C8
	subs r4, #1
	cmp r4, #0
	bge _0801990A
	adds r5, r6, #0
	cmp r5, #0
	bge _08019906
	movs r0, #8
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08019968 @ =0x03002790
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
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019960: .4byte gBmSt
_08019964: .4byte 0x02024460
_08019968: .4byte 0x03002790

	thumb_func_start RenderMapForFade
RenderMapForFade: @ 0x0801996C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl sub_0800140C
	ldr r1, _080199D0 @ =gBmSt
	ldrh r2, [r1, #0xc]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x26]
	movs r5, #9
	adds r7, r1, #0
_08019990:
	movs r4, #0xe
	subs r6, r5, #1
_08019994:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _080199D4 @ =gBG2TilemapBuffer
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080197C8
	subs r4, #1
	cmp r4, #0
	bge _08019994
	adds r5, r6, #0
	cmp r5, #0
	bge _08019990
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080199D0: .4byte gBmSt
_080199D4: .4byte gBG2TilemapBuffer

	thumb_func_start sub_080199D8
sub_080199D8: @ 0x080199D8
	push {r4, r5, lr}
	ldr r2, _08019A08 @ =gBmSt
	ldrh r4, [r2, #0xc]
	movs r0, #0xc
	ldrsh r3, [r2, r0]
	ldrh r0, [r2, #0x10]
	movs r5, #0x10
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019A1C
	cmp r3, r1
	ble _08019A0C
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A1C
	movs r0, #0xf
	bl sub_08019AB8
	b _08019A1C
	.align 2, 0
_08019A08: .4byte gBmSt
_08019A0C:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A1C
	movs r0, #0
	bl sub_08019AB8
_08019A1C:
	ldr r2, _08019A4C @ =gBmSt
	ldrh r4, [r2, #0xe]
	movs r5, #0xe
	ldrsh r3, [r2, r5]
	ldrh r0, [r2, #0x12]
	movs r5, #0x12
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019A60
	cmp r3, r1
	ble _08019A50
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A60
	movs r0, #0xa
	bl sub_08019B84
	b _08019A60
	.align 2, 0
_08019A4C: .4byte gBmSt
_08019A50:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A60
	movs r0, #0
	bl sub_08019B84
_08019A60:
	ldr r4, _08019AB4 @ =gBmSt
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldrh r5, [r4, #0x24]
	lsls r1, r5, #4
	ldrh r0, [r4, #0xc]
	subs r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #0x26]
	lsls r2, r3, #4
	ldrh r5, [r4, #0xe]
	subs r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
	movs r0, #1
	ldrb r1, [r4, #4]
	ands r0, r1
	cmp r0, #0
	beq _08019AAC
	ldrh r3, [r4, #0x24]
	lsls r1, r3, #4
	ldrh r5, [r4, #0xc]
	subs r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x26]
	lsls r2, r0, #4
	ldrh r4, [r4, #0xe]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
_08019AAC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019AB4: .4byte gBmSt

	thumb_func_start sub_08019AB8
sub_08019AB8: @ 0x08019AB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019B2C @ =gBmSt
	ldrh r1, [r4, #0xc]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r2, [r4, #0xe]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	lsls r2, r1, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	ldrh r2, [r4, #0x24]
	subs r3, r3, r2
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	ldrh r0, [r4, #0x26]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r0, #1
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	bne _08019B34
	movs r6, #0xa
	movs r4, #0xf
_08019B06:
	mov r1, sb
	adds r2, r1, r6
	ands r2, r4
	mov r1, sl
	adds r0, r1, r6
	str r0, [sp]
	ldr r0, _08019B30 @ =0x02024460
	adds r1, r7, #0
	mov r3, r8
	bl sub_080197C8
	subs r6, #1
	cmp r6, #0
	bge _08019B06
	movs r0, #8
	bl EnableBgSync
	b _08019B6A
	.align 2, 0
_08019B2C: .4byte gBmSt
_08019B30: .4byte 0x02024460
_08019B34:
	movs r6, #0xa
_08019B36:
	mov r2, sb
	adds r4, r2, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	str r5, [sp]
	ldr r0, _08019B7C @ =0x02024460
	adds r1, r7, #0
	adds r2, r4, #0
	mov r3, r8
	bl sub_080197C8
	str r4, [sp]
	ldr r0, _08019B80 @ =gBG2TilemapBuffer
	mov r1, r8
	adds r2, r5, #0
	adds r3, r7, #0
	bl sub_0801983C
	subs r6, #1
	cmp r6, #0
	bge _08019B36
	movs r0, #0xc
	bl EnableBgSync
_08019B6A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019B7C: .4byte 0x02024460
_08019B80: .4byte gBG2TilemapBuffer

	thumb_func_start sub_08019B84
sub_08019B84: @ 0x08019B84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019BF8 @ =gBmSt
	ldrh r1, [r4, #0xc]
	lsls r2, r1, #0x10
	asrs r2, r2, #0x14
	lsls r1, r2, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r1, [r4, #0xe]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r4, #0x24]
	subs r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldrh r1, [r4, #0x26]
	subs r3, r3, r1
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	movs r0, #1
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	bne _08019C00
	movs r6, #0xf
	movs r4, #0xf
_08019BD2:
	mov r0, sb
	adds r1, r0, r6
	ands r1, r4
	mov r0, sl
	adds r3, r0, r6
	mov r0, r8
	str r0, [sp]
	ldr r0, _08019BFC @ =0x02024460
	adds r2, r7, #0
	bl sub_080197C8
	subs r6, #1
	cmp r6, #0
	bge _08019BD2
	movs r0, #8
	bl EnableBgSync
	b _08019C38
	.align 2, 0
_08019BF8: .4byte gBmSt
_08019BFC: .4byte 0x02024460
_08019C00:
	movs r6, #0xf
_08019C02:
	mov r1, sb
	adds r4, r1, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	mov r1, r8
	str r1, [sp]
	ldr r0, _08019C48 @ =0x02024460
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_080197C8
	str r7, [sp]
	ldr r0, _08019C4C @ =gBG2TilemapBuffer
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl sub_0801983C
	subs r6, #1
	cmp r6, #0
	bge _08019C02
	movs r0, #0xc
	bl EnableBgSync
_08019C38:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019C48: .4byte 0x02024460
_08019C4C: .4byte gBG2TilemapBuffer

	thumb_func_start sub_08019C50
sub_08019C50: @ 0x08019C50
	push {r4, r5, r6, r7, lr}
	movs r7, #1
_08019C54:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019CA8
	ldr r0, [r6]
	cmp r0, #0
	beq _08019CA8
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019CA8
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _08019D38 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
	ldr r0, _08019D3C @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08019CA8
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	adds r0, r6, #0
	bl GetUnitFogViewRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A6B4
_08019CA8:
	adds r7, #1
	cmp r7, #0x7f
	ble _08019C54
	ldr r0, _08019D3C @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	beq _08019D80
	movs r7, #0x81
_08019CB8:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019D6E
	ldr r2, [r6]
	cmp r2, #0
	beq _08019D6E
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019D6E
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08019CF8
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_08019CF8:
	ldr r0, _08019D3C @ =gPlaySt
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019D48
	ldr r0, _08019D40 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r2, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019D48
	ldr r0, _08019D44 @ =gBmMapHidden
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r6, #0xc]
	b _08019D6E
	.align 2, 0
_08019D38: .4byte gBmMapUnit
_08019D3C: .4byte gPlaySt
_08019D40: .4byte 0x0202E3E8
_08019D44: .4byte gBmMapHidden
_08019D48:
	ldr r0, _08019D78 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
	ldr r1, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019D6E
	ldr r0, _08019D7C @ =0xFFFFFDFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
	str r1, [r6, #0xc]
_08019D6E:
	adds r7, #1
	cmp r7, #0xc5
	ble _08019CB8
	b _08019E14
	.align 2, 0
_08019D78: .4byte gBmMapUnit
_08019D7C: .4byte 0xFFFFFDFF
_08019D80:
	movs r7, #0x81
_08019D82:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019E0E
	ldr r2, [r6]
	cmp r2, #0
	beq _08019E0E
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019E0E
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08019DC2
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_08019DC2:
	ldr r0, _08019DF0 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019E00
	ldr r0, _08019DF4 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019DF8
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	b _08019DFE
	.align 2, 0
_08019DF0: .4byte gPlaySt
_08019DF4: .4byte 0x0202E3E8
_08019DF8:
	ldr r0, [r6, #0xc]
	ldr r1, _08019E1C @ =0xFFFFFDFF
	ands r0, r1
_08019DFE:
	str r0, [r6, #0xc]
_08019E00:
	ldr r0, _08019E20 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
_08019E0E:
	adds r7, #1
	cmp r7, #0xc5
	ble _08019D82
_08019E14:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019E1C: .4byte 0xFFFFFDFF
_08019E20: .4byte gBmMapUnit

	thumb_func_start sub_08019E24
sub_08019E24: @ 0x08019E24
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _08019E44
_08019E30:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	bne _08019E42
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #3]
	movs r3, #1
	bl sub_0801A6B4
_08019E42:
	adds r4, #8
_08019E44:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08019E30
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08019E50
sub_08019E50: @ 0x08019E50
	push {r4, r5, lr}
	movs r0, #0
	bl GetTrap
	adds r2, r0, #0
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08019E96
	ldr r5, _08019E9C @ =gBmMapUnit
	ldr r4, _08019EA0 @ =gBmMapHidden
_08019E64:
	ldrb r0, [r2, #2]
	cmp r0, #0xb
	bne _08019E8E
	ldr r0, [r5]
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldrb r3, [r2]
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019E8E
	ldr r0, [r4]
	adds r0, r1, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #2
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
_08019E8E:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _08019E64
_08019E96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019E9C: .4byte gBmMapUnit
_08019EA0: .4byte gBmMapHidden

	thumb_func_start RefreshEntityMaps
RefreshEntityMaps: @ 0x08019EA4
	push {lr}
	ldr r0, _08019EE0 @ =gBmMapUnit
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08019EE4 @ =gBmMapHidden
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08019EE8 @ =0x0202E3E8
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08019EEC @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08019ECA
	movs r1, #1
_08019ECA:
	adds r0, r2, #0
	bl BmMapFillg
	bl sub_08019E24
	bl sub_08019C50
	bl sub_08019E50
	pop {r0}
	bx r0
	.align 2, 0
_08019EE0: .4byte gBmMapUnit
_08019EE4: .4byte gBmMapHidden
_08019EE8: .4byte 0x0202E3E8
_08019EEC: .4byte gPlaySt

	thumb_func_start sub_08019EF0
sub_08019EF0: @ 0x08019EF0
	ldr r1, _08019EFC @ =0x08C542F0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08019EFC: .4byte 0x08C542F0

	thumb_func_start GetTerrainHealAmount
GetTerrainHealAmount: @ 0x08019F00
	ldr r1, _08019F0C @ =0x08C53AD0
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019F0C: .4byte 0x08C53AD0

	thumb_func_start GetTerrainHealsStatus
GetTerrainHealsStatus: @ 0x08019F10
	ldr r1, _08019F1C @ =0x08C53B11
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019F1C: .4byte 0x08C53B11

	thumb_func_start sub_08019F20
sub_08019F20: @ 0x08019F20
	push {r4, r5, r6, lr}
	ldr r4, _08019F74 @ =0x02030A8C
	ldr r5, _08019F78 @ =0x000003FF
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r0, r6
	adds r4, #2
	bl sub_08001818
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	adds r0, r0, r6
	adds r4, #2
	bl sub_08001818
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	adds r0, r0, r6
	adds r4, #2
	bl sub_08001818
	ldrh r4, [r4]
	ands r5, r4
	adds r5, r5, r6
	adds r0, r5, #0
	bl sub_08001818
	ldr r1, _08019F7C @ =gPaletteBuffer
	movs r0, #0x86
	lsls r0, r0, #7
	strh r0, [r1]
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019F74: .4byte 0x02030A8C
_08019F78: .4byte 0x000003FF
_08019F7C: .4byte gPaletteBuffer

	thumb_func_start RevertMapChange
RevertMapChange: @ 0x08019F80
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _08019FB8 @ =gBmMapMovement
	ldr r1, [r0]
	ldr r0, _08019FBC @ =0x03004100
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019FB8: .4byte gBmMapMovement
_08019FBC: .4byte 0x03004100
