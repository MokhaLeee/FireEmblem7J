	.include "macro.inc"

	.syntax unified

	thumb_func_start DecodeMsg
DecodeMsg: @ 0x08013318
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0801333C @ =0x0202B5B0
	ldr r0, [r6]
	cmp r5, r0
	beq _08013348
	ldr r1, _08013340 @ =gMsgTable
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _08013344 @ =0x0202A5B0
	adds r1, r4, #0
	bl DecodeStringRam
	str r5, [r6]
	adds r0, r4, #0
	b _0801334A
	.align 2, 0
_0801333C: .4byte 0x0202B5B0
_08013340: .4byte gMsgTable
_08013344: .4byte 0x0202A5B0
_08013348:
	ldr r0, _08013350 @ =0x0202A5B0
_0801334A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08013350: .4byte 0x0202A5B0

	thumb_func_start DecodeMsgInBuffer
DecodeMsgInBuffer: @ 0x08013354
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08013370 @ =gMsgTable
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	bl DecodeStringRam
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08013370: .4byte gMsgTable

	thumb_func_start sub_8013374
sub_8013374: @ 0x08013374
	push {r4, r5, lr}
	ldr r5, _0801338C @ =0x0202A9B0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r5, r0
	ldr r0, _08013390 @ =0xFFFFFC00
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _0801346C
	.align 2, 0
_0801338C: .4byte 0x0202A9B0
_08013390: .4byte 0xFFFFFC00
_08013394:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _0801339E
	strb r1, [r4]
	b _0801343A
_0801339E:
	cmp r0, #0x80
	beq _080133A8
	strb r1, [r4]
	adds r5, #1
	b _08013434
_080133A8:
	adds r5, #1
	ldrb r0, [r5]
	subs r0, #0x12
	cmp r0, #0x10
	bhi _08013430
	lsls r0, r0, #2
	ldr r1, _080133BC @ =_080133C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080133BC: .4byte _080133C0
_080133C0: @ jump table
	.4byte _08013404 @ case 0
	.4byte _08013408 @ case 1
	.4byte _0801340C @ case 2
	.4byte _08013410 @ case 3
	.4byte _08013430 @ case 4
	.4byte _08013430 @ case 5
	.4byte _08013430 @ case 6
	.4byte _08013430 @ case 7
	.4byte _08013430 @ case 8
	.4byte _08013430 @ case 9
	.4byte _08013430 @ case 10
	.4byte _08013430 @ case 11
	.4byte _08013430 @ case 12
	.4byte _08013430 @ case 13
	.4byte _08013414 @ case 14
	.4byte _08013430 @ case 15
	.4byte _0801341A @ case 16
_08013404:
	movs r1, #0
	b _08013440
_08013408:
	movs r1, #1
	b _08013440
_0801340C:
	movs r1, #2
	b _08013440
_08013410:
	movs r1, #3
	b _08013440
_08013414:
	bl GetTacticianName
	b _08013422
_0801341A:
	ldr r0, _0801342C @ =gActionSt
	ldrh r0, [r0, #6]
	bl GetItemName
_08013422:
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	b _0801345A
	.align 2, 0
_0801342C: .4byte gActionSt
_08013430:
	movs r0, #0x80
	strb r0, [r4]
_08013434:
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_0801343A:
	adds r5, #1
	adds r4, #1
	b _0801346C
_08013440:
	ldr r0, _08013480 @ =gPlaySt
	adds r0, #0x1c
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
_0801345A:
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _0801346A
_08013462:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08013462
_0801346A:
	adds r5, r1, #0
_0801346C:
	ldrb r1, [r5]
	cmp r1, #0
	bne _08013394
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08013484 @ =0x0202ADB0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08013480: .4byte gPlaySt
_08013484: .4byte 0x0202ADB0

	thumb_func_start sub_8013488
sub_8013488: @ 0x08013488
	push {r4, r5, lr}
	ldr r5, _080134A0 @ =0x0202B3B0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _080134A4 @ =0xFFFFF200
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _080134F0
	.align 2, 0
_080134A0: .4byte 0x0202B3B0
_080134A4: .4byte 0xFFFFF200
_080134A8:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _080134B2
	strb r1, [r4]
	b _080134CC
_080134B2:
	cmp r0, #0x80
	beq _080134BC
	strb r1, [r4]
	adds r5, #1
	b _080134C6
_080134BC:
	adds r5, #1
	ldrb r1, [r5]
	cmp r1, #0x20
	beq _080134D2
	strb r0, [r4]
_080134C6:
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_080134CC:
	adds r5, #1
	adds r4, #1
	b _080134F0
_080134D2:
	bl GetTacticianName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _080134EE
_080134E6:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080134E6
_080134EE:
	adds r5, r1, #0
_080134F0:
	ldrb r1, [r5]
	cmp r1, #0
	bne _080134A8
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08013504 @ =0x0202B4B0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08013504: .4byte 0x0202B4B0
