	.include "macro.inc"

	.syntax unified

	thumb_func_start Interpolate
Interpolate: @ 0x08013508
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, [sp, #0x10]
	cmp r5, #0
	bne _08013516
	adds r0, r2, #0
	b _080135CA
_08013516:
	cmp r0, #5
	bhi _080135C8
	lsls r0, r0, #2
	ldr r1, _08013524 @ =_08013528
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013524: .4byte _08013528
_08013528: @ jump table
	.4byte _08013540 @ case 0
	.4byte _0801354C @ case 1
	.4byte _0801355C @ case 2
	.4byte _08013570 @ case 3
	.4byte _08013594 @ case 4
	.4byte _080135A6 @ case 5
_08013540:
	subs r0, r2, r6
	adds r2, r0, #0
	muls r2, r3, r2
	adds r0, r2, #0
	adds r1, r5, #0
	b _0801358C
_0801354C:
	adds r0, r3, #0
	muls r0, r3, r0
	subs r1, r2, r6
	adds r2, r0, #0
	muls r2, r1, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _0801358A
_0801355C:
	adds r0, r3, #0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	b _08013586
_08013570:
	adds r0, r3, #0
	muls r0, r3, r0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	muls r0, r5, r0
_08013586:
	adds r1, r0, #0
	muls r1, r5, r1
_0801358A:
	adds r0, r2, #0
_0801358C:
	bl Div
	adds r0, r6, r0
	b _080135CA
_08013594:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _080135BC
_080135A6:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r0, #0
	muls r1, r5, r1
_080135BC:
	adds r0, r2, #0
	bl Div
	adds r4, r6, r4
	subs r0, r4, r0
	b _080135CA
_080135C8:
	movs r0, #0
_080135CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start nullsub_33
nullsub_33: @ 0x080135D0
	bx lr
	.align 2, 0

	thumb_func_start StringEquals
StringEquals: @ 0x080135D4
	push {r4, lr}
	adds r4, r0, #0
	b _080135E6
_080135DA:
	adds r1, #1
	adds r4, #1
	cmp r2, r3
	beq _080135E6
	movs r0, #0
	b _080135F4
_080135E6:
	ldrb r2, [r4]
	ldrb r3, [r1]
	adds r0, r3, #0
	orrs r0, r2
	cmp r0, #0
	bne _080135DA
	movs r0, #1
_080135F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StringCopy
StringCopy: @ 0x080135FC
	adds r3, r0, #0
	b _08013606
_08013600:
	strb r2, [r3]
	adds r1, #1
	adds r3, #1
_08013606:
	ldrb r2, [r1]
	cmp r2, #0
	bne _08013600
	ldrb r0, [r1]
	strb r0, [r3]
	bx lr
	.align 2, 0

	thumb_func_start sub_8013614
sub_8013614: @ 0x08013614
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetDataSize
	adds r2, r0, #0
	subs r1, r2, #4
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _0801363C
	adds r0, r4, #4
	lsrs r2, r1, #0x1f
	adds r2, r1, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r1, r5, #0
	bl CpuSet
	b _08013652
_0801363C:
	adds r3, r4, #4
	adds r0, r1, #0
	cmp r0, #0
	bge _08013646
	subs r0, r2, #1
_08013646:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r3, #0
	adds r1, r5, #0
	bl CpuFastSet
_08013652:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8013658
sub_8013658: @ 0x08013658
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08013684 @ =gBuf
	adds r1, r6, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetDataSize
	cmp r0, #0
	bge _08013672
	adds r0, #3
_08013672:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013684: .4byte gBuf

	thumb_func_start Decompress
Decompress: @ 0x08013688
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0xfa
	lsls r0, r0, #0x18
	adds r1, r4, r0
	ldr r0, _080136C0 @ =0x00017FFF
	movs r2, #1
	cmp r1, r0
	bhi _0801369E
	movs r2, #0
_0801369E:
	ldr r0, _080136C4 @ =gUnk_08C01B84
	movs r1, #0xf0
	ldrb r5, [r3]
	ands r1, r5
	lsrs r1, r1, #3
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080136C0: .4byte 0x00017FFF
_080136C4: .4byte gUnk_08C01B84

	thumb_func_start GetDataSize
GetDataSize: @ 0x080136C8
	ldr r0, [r0]
	lsrs r0, r0, #8
	bx lr
	.align 2, 0

	thumb_func_start sub_80136D0
sub_80136D0: @ 0x080136D0
	adds r3, r2, #0
	str r3, [r0]
	ldr r2, _080136E4 @ =0x0000FFE0
	ands r1, r2
	asrs r1, r1, #5
	ands r2, r3
	asrs r3, r2, #5
	subs r1, r3, r1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_080136E4: .4byte 0x0000FFE0

	thumb_func_start sub_80136E8
sub_80136E8: @ 0x080136E8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5]
	adds r0, r4, #0
	bl Decompress
	adds r0, r4, #0
	bl GetDataSize
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	ldr r1, [r5, #4]
	cmp r0, #0
	bge _0801370A
	adds r0, #0x1f
_0801370A:
	asrs r0, r0, #5
	adds r0, r1, r0
	str r0, [r5, #4]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8013718
sub_8013718: @ 0x08013718
	lsls r3, r1, #5
	ldr r2, [r0]
	adds r2, r2, r3
	str r2, [r0]
	ldr r2, [r0, #4]
	adds r1, r2, r1
	str r1, [r0, #4]
	adds r0, r2, #0
	bx lr
	.align 2, 0

	thumb_func_start Register2dChrMove
Register2dChrMove: @ 0x0801372C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _08013752
	adds r4, r3, #0
_0801373A:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl RegisterDataMove
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _0801373A
_08013752:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Copy2dChr
Copy2dChr: @ 0x08013758
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #5
	cmp r3, #0
	ble _08013788
	adds r5, r3, #0
_08013766:
	adds r2, r4, #0
	cmp r4, #0
	bge _0801376E
	adds r2, r4, #3
_0801376E:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r7, #0
	adds r1, r6, #0
	bl CpuFastSet
	adds r7, r7, r4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	subs r5, #1
	cmp r5, #0
	bne _08013766
_08013788:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ApplyBitmap
ApplyBitmap: @ 0x08013790
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	ble _080137C0
	lsls r0, r7, #6
	mov sb, r0
	adds r4, r3, #0
	lsls r0, r7, #5
	mov r8, r0
_080137AC:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ApplyBitmapLine
	add r6, sb
	add r5, r8
	subs r4, #1
	cmp r4, #0
	bne _080137AC
_080137C0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ApplyBitmapLine
ApplyBitmapLine: @ 0x080137CC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r7, #0
	ble _080137EE
	adds r4, r7, #0
_080137DA:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_80137F4
	adds r6, #8
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bne _080137DA
_080137EE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80137F4
sub_80137F4: @ 0x080137F4
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r1, #7
_080137FC:
	ldrb r5, [r3, #7]
	lsls r0, r5, #4
	ldrb r5, [r3, #6]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #5]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #4]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #3]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #2]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #1]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3]
	orrs r0, r5
	stm r4!, {r0}
	lsls r0, r2, #3
	adds r3, r3, r0
	subs r1, #1
	cmp r1, #0
	bge _080137FC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutAppliedBitmap
PutAppliedBitmap: @ 0x0801383C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	cmp r0, r3
	bge _08013868
_0801384A:
	adds r2, r0, #1
	cmp r5, #0
	ble _08013862
	lsls r0, r0, #6
	adds r0, r0, r6
	adds r1, r5, #0
_08013856:
	strh r4, [r0]
	adds r4, #1
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _08013856
_08013862:
	adds r0, r2, #0
	cmp r0, r3
	blt _0801384A
_08013868:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutDigits
PutDigits: @ 0x08013870
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #0
	ble _08013894
	movs r2, #0
_0801387C:
	strh r2, [r0]
	subs r0, #2
	subs r3, #1
	cmp r3, #0
	bne _0801387C
	b _08013894
_08013888:
	ldrb r2, [r1]
	adds r0, r2, r5
	subs r0, #0x30
	strh r0, [r4]
	subs r4, #2
	subs r1, #1
_08013894:
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _08013888
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80138A0
sub_80138A0: @ 0x080138A0
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_80138A8
sub_80138A8: @ 0x080138A8
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _080138B8 @ =0x00007FFF
	ands r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_080138B8: .4byte 0x00007FFF

	thumb_func_start sub_80138BC
sub_80138BC: @ 0x080138BC
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_80138C8
sub_80138C8: @ 0x080138C8
	push {r4, lr}
	movs r1, #0x9f
	movs r3, #0xf0
	movs r4, #1
	rsbs r4, r4, #0
	adds r2, r4, #0
_080138D4:
	strh r3, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080138D4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80138E8
sub_80138E8: @ 0x080138E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r6, [sp, #0x18]
	cmp r4, r6
	ble _08013906
	adds r1, r3, #0
	adds r3, r5, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r6, r4, #0
	adds r4, r1, #0
_08013906:
	subs r0, r3, r5
	lsls r0, r0, #0x10
	subs r1, r6, r4
	bl __divsi3
	mov ip, r0
	lsls r5, r5, #0x10
	cmp r6, #0xa0
	ble _0801391A
	movs r6, #0xa0
_0801391A:
	cmp r4, #0
	bge _0801392A
	rsbs r0, r4, #0
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	adds r5, r5, r0
	movs r4, #0
_0801392A:
	cmp r4, r6
	bge _08013964
	lsls r0, r4, #2
	mov r2, r8
	adds r1, r0, r2
	adds r2, r1, #0
_08013936:
	asrs r3, r5, #0x10
	cmp r3, #0xf0
	ble _0801393E
	movs r3, #0xf0
_0801393E:
	cmp r3, #0
	bge _08013944
	movs r3, #0
_08013944:
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, r3
	ble _0801394E
	strh r3, [r1]
_0801394E:
	movs r7, #2
	ldrsh r0, [r2, r7]
	cmp r0, r3
	bge _08013958
	strh r3, [r2, #2]
_08013958:
	add r5, ip
	adds r1, #4
	adds r2, #4
	adds r4, #1
	cmp r4, r6
	blt _08013936
_08013964:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013970
sub_8013970: @ 0x08013970
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	str r6, [sp]
	cmp r6, #0x50
	ble _08013988
	movs r0, #0x50
	str r0, [sp]
_08013988:
	adds r2, r6, #0
	movs r1, #0
	mov sb, r1
	cmp r2, #0
	blt _08013A80
	movs r3, #0
	str r3, [sp, #4]
	ldr r4, [sp]
	lsls r0, r4, #2
	ldr r7, _08013A94 @ =gBuf
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp, #8]
	rsbs r1, r2, #0
	str r1, [sp, #0xc]
	lsls r0, r2, #2
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	str r0, [sp, #0x14]
_080139B4:
	ldr r0, [sp]
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi _080139C6
	mov r7, sl
	strh r2, [r7, #2]
_080139C6:
	ldr r0, [sp]
	mov r1, sb
	subs r0, r0, r1
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bhi _080139DA
	ldr r3, [sp, #8]
	strh r2, [r3, #2]
_080139DA:
	ldr r7, [sp]
	adds r7, r7, r2
	mov ip, r7
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bhi _080139EE
	mov r1, sb
	ldr r0, [sp, #0x14]
	strh r1, [r0, #2]
_080139EE:
	ldr r7, [sp]
	subs r5, r7, r2
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bhi _08013A00
	mov r7, sb
	ldr r0, [sp, #0x10]
	strh r7, [r0, #2]
_08013A00:
	ldr r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi _08013A0E
	mov r7, sp
	ldrh r0, [r7, #0xc]
	mov r7, sl
	strh r0, [r7]
_08013A0E:
	cmp r4, #0x9f
	bhi _08013A20
	mov r4, r8
	lsls r0, r4, #2
	ldr r7, _08013A94 @ =gBuf
	adds r0, r0, r7
	mov r4, sp
	ldrh r4, [r4, #0xc]
	strh r4, [r0]
_08013A20:
	cmp r3, #0x9f
	bhi _08013A32
	mov r7, ip
	lsls r0, r7, #2
	ldr r3, _08013A94 @ =gBuf
	adds r0, r0, r3
	mov r4, sp
	ldrh r4, [r4, #4]
	strh r4, [r0]
_08013A32:
	cmp r1, #0x9f
	bhi _08013A42
	lsls r0, r5, #2
	ldr r7, _08013A94 @ =gBuf
	adds r0, r0, r7
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0]
_08013A42:
	adds r1, r6, #1
	mov r3, sb
	lsls r0, r3, #1
	subs r6, r1, r0
	cmp r6, #0
	bge _08013A68
	subs r1, r2, #1
	lsls r0, r1, #1
	adds r6, r6, r0
	ldr r4, [sp, #0xc]
	adds r4, #1
	str r4, [sp, #0xc]
	ldr r7, [sp, #0x10]
	adds r7, #4
	str r7, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r0, #4
	str r0, [sp, #0x14]
	adds r2, r1, #0
_08013A68:
	ldr r1, [sp, #4]
	subs r1, #1
	str r1, [sp, #4]
	movs r3, #4
	add sl, r3
	ldr r4, [sp, #8]
	subs r4, #4
	str r4, [sp, #8]
	movs r7, #1
	add sb, r7
	cmp r2, sb
	bge _080139B4
_08013A80:
	ldr r0, _08013A94 @ =gBuf
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08013A94: .4byte gBuf

	thumb_func_start sub_8013A98
sub_8013A98: @ 0x08013A98
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r7, _08013AB4 @ =gBuf
	movs r6, #0
	adds r5, r7, #0
	ldr r4, _08013AB8 @ =gPal
_08013AA4:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, r3
	blt _08013ABC
	subs r1, r1, r3
	b _08013AC0
	.align 2, 0
_08013AB4: .4byte gBuf
_08013AB8: .4byte gPal
_08013ABC:
	ldr r0, _08013AD0 @ =0x0000FFE0
	ands r1, r0
_08013AC0:
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsls r2, r3, #5
	cmp r0, r2
	blt _08013AD4
	subs r1, r1, r2
	b _08013AD8
	.align 2, 0
_08013AD0: .4byte 0x0000FFE0
_08013AD4:
	ldr r0, _08013AE8 @ =0x0000FC1F
	ands r1, r0
_08013AD8:
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsls r2, r3, #0xa
	cmp r0, r2
	blt _08013AEC
	subs r1, r1, r2
	b _08013AF0
	.align 2, 0
_08013AE8: .4byte 0x0000FC1F
_08013AEC:
	ldr r0, _08013B18 @ =0x000003FF
	ands r1, r0
_08013AF0:
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	adds r6, #1
	ldr r0, _08013B1C @ =0x000001FF
	cmp r6, r0
	ble _08013AA4
	bl DisablePalSync
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, #0
	bl RegisterDataMove
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013B18: .4byte 0x000003FF
_08013B1C: .4byte 0x000001FF

	thumb_func_start nullsub_34
nullsub_34: @ 0x08013B20
	bx lr
	.align 2, 0

	thumb_func_start sub_8013B24
sub_8013B24: @ 0x08013B24
	push {lr}
	sub sp, #0x10
	ldr r1, _08013B40 @ =gUnk_0818F980
	mov r0, sp
	movs r2, #0xd
	bl memcpy
	mov r0, sp
	bl sub_8013B24
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08013B40: .4byte gUnk_0818F980

	thumb_func_start GetPalFadeSt
GetPalFadeSt: @ 0x08013B44
	ldr r0, _08013B48 @ =0x0202B5B4
	bx lr
	.align 2, 0
_08013B48: .4byte 0x0202B5B4

	thumb_func_start sub_8013B4C
sub_8013B4C: @ 0x08013B4C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	bl SetPalFadeStClkEnd1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd2
	adds r0, r5, #0
	bl SetPalFadeStClkEnd3
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SetPalFadeStClkEnd1
SetPalFadeStClkEnd1: @ 0x08013B68
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	strh r4, [r0, #0x2a]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SetPalFadeStClkEnd2
SetPalFadeStClkEnd2: @ 0x08013B78
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	adds r0, #0x5a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetPalFadeStClkEnd3
SetPalFadeStClkEnd3: @ 0x08013B8C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	adds r0, #0x8a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetPalFadeStClkEnd1
GetPalFadeStClkEnd1: @ 0x08013BA0
	push {lr}
	bl GetPalFadeSt
	ldrh r0, [r0, #0x2a]
	pop {r1}
	bx r1

	thumb_func_start GetPalFadeStClkEnd2
GetPalFadeStClkEnd2: @ 0x08013BAC
	push {lr}
	bl GetPalFadeSt
	adds r0, #0x5a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetPalFadeStClkEnd3
GetPalFadeStClkEnd3: @ 0x08013BBC
	push {lr}
	bl GetPalFadeSt
	adds r0, #0x8a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ArchiveCurrentPalettes
ArchiveCurrentPalettes: @ 0x08013BCC
	push {r4, r5, lr}
	bl GetPalFadeSt
	ldr r3, _08013C14 @ =gPal
	movs r1, #0
_08013BD6:
	adds r5, r0, #0
	adds r5, #0x30
	adds r4, r1, #1
	adds r1, r0, #0
	movs r2, #0xf
_08013BE0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08013BE0
	adds r0, r5, #0
	adds r1, r4, #0
	cmp r1, #0x1f
	ble _08013BD6
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd2
	adds r0, r4, #0
	bl SetPalFadeStClkEnd3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013C14: .4byte gPal

	thumb_func_start ArchivePalette
ArchivePalette: @ 0x08013C18
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	lsls r2, r4, #5
	ldr r1, _08013C44 @ =gPal
	adds r2, r2, r1
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, r1, r0
	movs r3, #0xf
_08013C30:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08013C30
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013C44: .4byte gPal

	thumb_func_start WriteFadedPaletteFromArchive
WriteFadedPaletteFromArchive: @ 0x08013C48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	str r2, [sp]
	mov sl, r3
	bl SetPalFadeStClkEnd1
	mov r0, r8
	bl SetPalFadeStClkEnd2
	ldr r0, [sp]
	bl SetPalFadeStClkEnd3
	bl GetPalFadeSt
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r7, r0
	ble _08013CCC
	ldr r0, _08013CC4 @ =0xFFFFFF00
	adds r7, r7, r0
	movs r5, #0
	mov ip, r5
_08013C82:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08013CB8
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r1, _08013CC8 @ =gPal
	adds r2, r0, r1
_08013C9C:
	adds r1, r6, #0
	ldrh r0, [r3]
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	ands r1, r6
	strh r1, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013C9C
_08013CB8:
	movs r1, #0x30
	add ip, r1
	adds r5, #1
	cmp r5, #0x1f
	ble _08013C82
	b _08013D0C
	.align 2, 0
_08013CC4: .4byte 0xFFFFFF00
_08013CC8: .4byte gPal
_08013CCC:
	movs r5, #0
	mov ip, r5
_08013CD0:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	cmp r0, #0
	beq _08013D02
	movs r4, #0
	movs r3, #0x1f
	mov r2, ip
	add r2, sb
	lsls r0, r5, #5
	ldr r6, _08013D68 @ =gPal
	adds r1, r0, r6
_08013CEA:
	adds r0, r3, #0
	ldrh r6, [r2]
	ands r0, r6
	muls r0, r7, r0
	asrs r0, r0, #8
	ands r0, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013CEA
_08013D02:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _08013CD0
_08013D0C:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble _08013D70
	ldr r1, _08013D6C @ =0xFFFFFF00
	add r8, r1
	movs r5, #0
	mov ip, r5
_08013D1C:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	cmp r0, #0
	beq _08013D5C
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r7, _08013D68 @ =gPal
	adds r2, r0, r7
_08013D38:
	adds r0, r6, #0
	ldrh r1, [r3]
	ands r0, r1
	subs r1, r6, r0
	mov r7, r8
	muls r7, r1, r7
	adds r1, r7, #0
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013D38
_08013D5C:
	movs r6, #0x30
	add ip, r6
	adds r5, #1
	cmp r5, #0x1f
	ble _08013D1C
	b _08013DB8
	.align 2, 0
_08013D68: .4byte gPal
_08013D6C: .4byte 0xFFFFFF00
_08013D70:
	movs r5, #0
	movs r6, #0
_08013D74:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _08013DB0
	movs r4, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	mov r0, sb
	adds r2, r6, r0
	lsls r0, r5, #5
	ldr r7, _08013E18 @ =gPal
	adds r1, r0, r7
_08013D90:
	adds r0, r3, #0
	ldrh r7, [r2]
	ands r0, r7
	mov r7, r8
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	ands r0, r3
	ldrh r7, [r1]
	orrs r0, r7
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013D90
_08013DB0:
	adds r6, #0x30
	adds r5, #1
	cmp r5, #0x1f
	ble _08013D74
_08013DB8:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp]
	cmp r1, r0
	ble _08013E20
	ldr r5, _08013E1C @ =0xFFFFFF00
	adds r1, r1, r5
	str r1, [sp]
	movs r5, #0
_08013DCA:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	adds r7, r5, #1
	cmp r0, #0
	beq _08013E10
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, sb
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, _08013E18 @ =gPal
	adds r2, r0, r5
_08013DEE:
	adds r0, r6, #0
	ldrh r1, [r3]
	ands r0, r1
	subs r1, r6, r0
	ldr r5, [sp]
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013DEE
_08013E10:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _08013DCA
	b _08013E6A
	.align 2, 0
_08013E18: .4byte gPal
_08013E1C: .4byte 0xFFFFFF00
_08013E20:
	movs r5, #0
_08013E22:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	adds r7, r5, #1
	cmp r0, #0
	beq _08013E64
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r1, sb
	adds r2, r0, r1
	lsls r0, r5, #5
	ldr r5, _08013E80 @ =gPal
	adds r1, r0, r5
_08013E46:
	adds r0, r3, #0
	ldrh r6, [r2]
	ands r0, r6
	ldr r5, [sp]
	muls r0, r5, r0
	asrs r0, r0, #8
	ands r0, r3
	ldrh r6, [r1]
	orrs r0, r6
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013E46
_08013E64:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _08013E22
_08013E6A:
	bl EnablePalSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013E80: .4byte gPal

	thumb_func_start sub_8013E84
sub_8013E84: @ 0x08013E84
	movs r1, #0
	str r1, [r0, #0x44]
	bx lr
	.align 2, 0

	thumb_func_start sub_8013E8C
sub_8013E8C: @ 0x08013E8C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r3, r7, r2
	ldr r0, [r4, #0x2c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x38]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08013EB0
	adds r0, #0xff
_08013EB0:
	asrs r6, r0, #8
	ldr r0, [r4, #0x30]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x3c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _08013EC4
	adds r1, #0xff
_08013EC4:
	asrs r5, r1, #8
	ldr r0, [r4, #0x34]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _08013ED8
	adds r1, #0xff
_08013ED8:
	asrs r2, r1, #8
	ldr r3, [r4, #0x4c]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x44]
	cmp r0, r7
	bne _08013EF0
	adds r0, r4, #0
	bl Proc_Break
_08013EF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013EF8
sub_8013EF8: @ 0x08013EF8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r0, _08013F38 @ =gUnk_08C01BA4
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	mov r1, sb
	str r1, [r0, #0x38]
	str r7, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x40]
	str r4, [r0, #0x48]
	ldr r1, [sp, #0x24]
	str r1, [r0, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013F38: .4byte gUnk_08C01BA4

	thumb_func_start sub_8013F3C
sub_8013F3C: @ 0x08013F3C
	push {lr}
	ldr r0, _08013F4C @ =gUnk_08C01BA4
	bl Proc_Find
	cmp r0, #0
	bne _08013F50
	movs r0, #0
	b _08013F52
	.align 2, 0
_08013F4C: .4byte gUnk_08C01BA4
_08013F50:
	movs r0, #1
_08013F52:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpacialSeTest_OnInit
SpacialSeTest_OnInit: @ 0x08013F58
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x66
	movs r1, #0x5a
	strh r1, [r0]
	bx lr

	thumb_func_start SpacialSeTest_OnLoop
SpacialSeTest_OnLoop: @ 0x08013F68
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r5, _08013FCC @ =gpKeySt
	ldr r1, [r5]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08013F86
	adds r1, r3, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08013F86:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _08013FC6
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08013FAE
	adds r0, r3, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r4, r0, #0
_08013FAE:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013FBE
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r4, [r0, r1]
_08013FBE:
	movs r0, #0x9a
	adds r1, r4, #0
	bl PlaySeSpacial
_08013FC6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013FCC: .4byte gpKeySt

	thumb_func_start StartSpacialSeTest
StartSpacialSeTest: @ 0x08013FD0
	push {lr}
	ldr r0, _08013FE0 @ =ProcScr_SpacialSeTest
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08013FE0: .4byte ProcScr_SpacialSeTest

	thumb_func_start nullsub_35
nullsub_35: @ 0x08013FE4
	bx lr
	.align 2, 0

	thumb_func_start StartPalFadeToBlack
StartPalFadeToBlack: @ 0x08013FE8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08014000 @ =gUnk_08C01CEC
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014000: .4byte gUnk_08C01CEC

	thumb_func_start StartPalFadeToWhite
StartPalFadeToWhite: @ 0x08014004
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _0801401C @ =gUnk_08C01D0C
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801401C: .4byte gUnk_08C01D0C

	thumb_func_start StartPalFade
StartPalFade: @ 0x08014020
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	ldr r0, _08014074 @ =0x0202B5B4
	adds r4, r4, r0
	ldr r0, _08014078 @ =gUnk_08C01BDC
	bl Proc_Start
	mov r8, r0
	lsls r5, r5, #5
	ldr r0, _0801407C @ =gPal
	adds r5, r5, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	str r5, [r4, #0x24]
	mov r0, sb
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x28]
	strh r6, [r4, #0x2a]
	adds r6, #1
	strh r6, [r4, #0x2c]
	mov r0, r8
	str r4, [r0, #0x2c]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014074: .4byte 0x0202B5B4
_08014078: .4byte gUnk_08C01BDC
_0801407C: .4byte gPal

	thumb_func_start sub_8014080
sub_8014080: @ 0x08014080
	push {lr}
	ldr r0, _0801408C @ =gUnk_08C01BDC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801408C: .4byte gUnk_08C01BDC

	thumb_func_start sub_8014090
sub_8014090: @ 0x08014090
	strh r1, [r0, #0x2c]
	bx lr

	thumb_func_start sub_8014094
sub_8014094: @ 0x08014094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sl, r0
	ldr r1, [r0, #0x20]
	str r1, [sp, #8]
	ldr r1, [r0, #0x24]
	ldrh r0, [r0, #0x28]
	mov r2, sl
	ldrh r2, [r2, #0x2c]
	cmp r0, r2
	beq _080140BE
	mov r3, sl
	ldrh r3, [r3, #0x2a]
	cmp r0, r3
	bls _080140C6
_080140BE:
	adds r0, r7, #0
	bl Proc_End
	b _0801416C
_080140C6:
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #0xc]
_080140CC:
	ldr r1, [sp, #4]
	lsls r2, r1, #1
	mov r3, sl
	adds r0, r2, r3
	ldrh r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov sb, r3
	ands r3, r0
	mov sb, r3
	ldr r0, [sp, #8]
	adds r2, r2, r0
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	bl Interpolate
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #4]
	cmp r2, #0xf
	ble _080140CC
	bl EnablePalSync
	ldr r1, [r7, #0x2c]
	ldrh r0, [r1, #0x28]
	adds r0, #1
	strh r0, [r1, #0x28]
_0801416C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SetBlackPal
SetBlackPal: @ 0x0801417C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014194 @ =gUnk_08C01CEC
	lsls r1, r1, #5
	ldr r2, _08014198 @ =gPal
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08014194: .4byte gUnk_08C01CEC
_08014198: .4byte gPal

	thumb_func_start sub_801419C
sub_801419C: @ 0x0801419C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080141B4 @ =gUnk_08C01D0C
	lsls r1, r1, #5
	ldr r2, _080141B8 @ =gPal
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_080141B4: .4byte gUnk_08C01D0C
_080141B8: .4byte gPal

	thumb_func_start sub_80141BC
sub_80141BC: @ 0x080141BC
	push {r4, lr}
	movs r4, #0
_080141C0:
	adds r0, r4, #0
	bl SetBlackPal
	adds r4, #1
	cmp r4, #0x1f
	ble _080141C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80141D4
sub_80141D4: @ 0x080141D4
	push {r4, lr}
	movs r4, #0
_080141D8:
	adds r0, r4, #0
	bl SetBlackPal
	adds r4, #1
	cmp r4, #0x1f
	ble _080141D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80141EC
sub_80141EC: @ 0x080141EC
	push {r4, r5, r6, lr}
	ldr r1, _0801425C @ =gDispIo
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r5, #0
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	ldr r1, _08014260 @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x66
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801425C: .4byte gDispIo
_08014260: .4byte 0x0000FFE0

	thumb_func_start sub_8014264
sub_8014264: @ 0x08014264
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801427C @ =gDispIo
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _08014280
	adds r0, r2, #0
	bl Proc_End
	b _080142A4
	.align 2, 0
_0801427C: .4byte gDispIo
_08014280:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0801429E
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0801429E:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_080142A4:
	pop {r0}
	bx r0

	thumb_func_start sub_80142A8
sub_80142A8: @ 0x080142A8
	push {r4, r5, r6, lr}
	ldr r1, _08014328 @ =gDispIo
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	movs r5, #0x10
	strb r5, [r1]
	ldr r1, _0801432C @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	ldr r2, _08014330 @ =0x0000E0FF
	ands r1, r2
	movs r6, #0xf8
	lsls r6, r6, #5
	adds r2, r6, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r1, r0, #0
	adds r1, #0x64
	strh r5, [r1]
	adds r0, #0x66
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014328: .4byte gDispIo
_0801432C: .4byte 0x0000FFE0
_08014330: .4byte 0x0000E0FF

	thumb_func_start sub_8014334
sub_8014334: @ 0x08014334
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801434C @ =gDispIo
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0
	bne _08014350
	adds r0, r2, #0
	bl Proc_End
	b _08014370
	.align 2, 0
_0801434C: .4byte gDispIo
_08014350:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0801436A
	movs r0, #0
	strh r0, [r1]
_0801436A:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_08014370:
	pop {r0}
	bx r0

	thumb_func_start sub_8014374
sub_8014374: @ 0x08014374
	push {lr}
	bl sub_80141EC
	ldr r3, _080143A0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080143A0: .4byte gDispIo

	thumb_func_start sub_80143A4
sub_80143A4: @ 0x080143A4
	push {lr}
	bl sub_80142A8
	ldr r3, _080143D4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080143D4: .4byte gDispIo

	thumb_func_start FadeExists
FadeExists: @ 0x080143D8
	push {lr}
	ldr r0, _08014408 @ =gUnk_08C01C14
	bl Proc_Find
	cmp r0, #0
	bne _08014418
	ldr r0, _0801440C @ =gUnk_08C01BF4
	bl Proc_Find
	cmp r0, #0
	bne _08014418
	ldr r0, _08014410 @ =gUnk_08C01C54
	bl Proc_Find
	cmp r0, #0
	bne _08014418
	ldr r0, _08014414 @ =gUnk_08C01C34
	bl Proc_Find
	cmp r0, #0
	bne _08014418
	movs r0, #0
	b _0801441A
	.align 2, 0
_08014408: .4byte gUnk_08C01C14
_0801440C: .4byte gUnk_08C01BF4
_08014410: .4byte gUnk_08C01C54
_08014414: .4byte gUnk_08C01C34
_08014418:
	movs r0, #1
_0801441A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartFadeFromBlack
StartFadeFromBlack: @ 0x08014420
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08014438 @ =gUnk_08C01BF4
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014438: .4byte gUnk_08C01BF4

	thumb_func_start StartLockingFadeToBlack
StartLockingFadeToBlack: @ 0x0801443C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08014454 @ =gUnk_08C01C14
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014454: .4byte gUnk_08C01C14

	thumb_func_start StartLockingFadeFromBlack
StartLockingFadeFromBlack: @ 0x08014458
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801446C @ =gUnk_08C01BF4
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801446C: .4byte gUnk_08C01BF4

	thumb_func_start sub_8014470
sub_8014470: @ 0x08014470
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08014484 @ =gUnk_08C01C14
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014484: .4byte gUnk_08C01C14

	thumb_func_start sub_8014488
sub_8014488: @ 0x08014488
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801449C @ =gUnk_08C01C34
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801449C: .4byte gUnk_08C01C34

	thumb_func_start sub_80144A0
sub_80144A0: @ 0x080144A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080144B4 @ =gUnk_08C01C54
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080144B4: .4byte gUnk_08C01C54

	thumb_func_start StartMidFadeFromBlack
StartMidFadeFromBlack: @ 0x080144B8
	push {lr}
	movs r0, #0x10
	bl StartFadeFromBlack
	pop {r0}
	bx r0

	thumb_func_start StartSlowFadeFromBlack
StartSlowFadeFromBlack: @ 0x080144C4
	push {lr}
	movs r0, #4
	bl StartFadeFromBlack
	pop {r0}
	bx r0

	thumb_func_start StartFastFadeFromBlack
StartFastFadeFromBlack: @ 0x080144D0
	push {lr}
	movs r0, #0x40
	bl StartFadeFromBlack
	pop {r0}
	bx r0

	thumb_func_start StartMidLockingFadeToBlack
StartMidLockingFadeToBlack: @ 0x080144DC
	push {lr}
	movs r0, #0x10
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0

	thumb_func_start StartSlowLockingFadeToBlack
StartSlowLockingFadeToBlack: @ 0x080144E8
	push {lr}
	movs r0, #4
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0

	thumb_func_start StartFastLockingFadeToBlack
StartFastLockingFadeToBlack: @ 0x080144F4
	push {lr}
	movs r0, #0x40
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0

	thumb_func_start StartMidLockingFadeFromBlack
StartMidLockingFadeFromBlack: @ 0x08014500
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSlowLockingFadeFromBlack
StartSlowLockingFadeFromBlack: @ 0x08014510
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartFastLockingFadeFromBlack
StartFastLockingFadeFromBlack: @ 0x08014520
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014530
sub_8014530: @ 0x08014530
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl sub_8014470
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014540
sub_8014540: @ 0x08014540
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8014470
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014550
sub_8014550: @ 0x08014550
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_8014470
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014560
sub_8014560: @ 0x08014560
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8014488
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014570
sub_8014570: @ 0x08014570
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_80144A0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014580
sub_8014580: @ 0x08014580
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014594 @ =sub_8014900
	movs r0, #1
	movs r1, #4
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014594: .4byte sub_8014900

	thumb_func_start sub_8014598
sub_8014598: @ 0x08014598
	push {lr}
	adds r2, r0, #0
	ldr r3, _080145AC @ =sub_8014900
	movs r0, #1
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080145AC: .4byte sub_8014900

	thumb_func_start sub_80145B0
sub_80145B0: @ 0x080145B0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080145C4 @ =sub_8014900
	movs r0, #1
	movs r1, #0x10
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080145C4: .4byte sub_8014900

	thumb_func_start sub_80145C8
sub_80145C8: @ 0x080145C8
	push {lr}
	adds r2, r0, #0
	ldr r3, _080145DC @ =sub_8014900
	movs r0, #1
	movs r1, #0x20
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080145DC: .4byte sub_8014900

	thumb_func_start sub_80145E0
sub_80145E0: @ 0x080145E0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080145F4 @ =sub_8014900
	movs r0, #1
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080145F4: .4byte sub_8014900

	thumb_func_start sub_80145F8
sub_80145F8: @ 0x080145F8
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801460C
sub_801460C: @ 0x0801460C
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014620
sub_8014620: @ 0x08014620
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x20
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014634
sub_8014634: @ 0x08014634
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x40
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014648
sub_8014648: @ 0x08014648
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801465C @ =sub_8014900
	movs r0, #3
	movs r1, #4
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801465C: .4byte sub_8014900

	thumb_func_start sub_8014660
sub_8014660: @ 0x08014660
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014674 @ =sub_8014900
	movs r0, #3
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014674: .4byte sub_8014900

	thumb_func_start sub_8014678
sub_8014678: @ 0x08014678
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801468C @ =sub_8014900
	movs r0, #3
	movs r1, #0x10
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801468C: .4byte sub_8014900

	thumb_func_start sub_8014690
sub_8014690: @ 0x08014690
	push {lr}
	adds r2, r0, #0
	ldr r3, _080146A4 @ =sub_8014900
	movs r0, #3
	movs r1, #0x20
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080146A4: .4byte sub_8014900

	thumb_func_start sub_80146A8
sub_80146A8: @ 0x080146A8
	push {lr}
	adds r2, r0, #0
	ldr r3, _080146BC @ =sub_8014900
	movs r0, #3
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080146BC: .4byte sub_8014900

	thumb_func_start sub_80146C0
sub_80146C0: @ 0x080146C0
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #4
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80146D4
sub_80146D4: @ 0x080146D4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80146E8
sub_80146E8: @ 0x080146E8
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	bl sub_80148C0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014700
sub_8014700: @ 0x08014700
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014714
sub_8014714: @ 0x08014714
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x20
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014728
sub_8014728: @ 0x08014728
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x40
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801473C
sub_801473C: @ 0x0801473C
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014750
sub_8014750: @ 0x08014750
	push {lr}
	adds r2, r0, #0
	movs r0, #7
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014764
sub_8014764: @ 0x08014764
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014778
sub_8014778: @ 0x08014778
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #4
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801478C
sub_801478C: @ 0x0801478C
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80147A0
sub_80147A0: @ 0x080147A0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080147B4 @ =sub_8014970
	movs r0, #7
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080147B4: .4byte sub_8014970

	thumb_func_start WaitForFade
WaitForFade: @ 0x080147B8
	push {r4, lr}
	adds r4, r0, #0
	bl FadeExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080147CC
	adds r0, r4, #0
	bl Proc_Break
_080147CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80147D4
sub_80147D4: @ 0x080147D4
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #3
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartFadeCore
StartFadeCore: @ 0x080147E8
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	adds r5, r3, #0
	ldr r7, _0801482C @ =gUnk_0818F990
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r6, r2, #2
	adds r0, r6, r7
	ldr r2, [r0]
	ldr r0, _08014830 @ =gUnk_08C01C74
	bl _call_via_r2
	str r4, [r0, #0x54]
	str r5, [r0, #0x4c]
	asrs r4, r4, #4
	cmp r4, #0
	bne _0801480E
	movs r4, #1
_0801480E:
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl _call_via_r1
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801482C: .4byte gUnk_0818F990
_08014830: .4byte gUnk_08C01C74

	thumb_func_start sub_8014834
sub_8014834: @ 0x08014834
	push {lr}
	ldr r0, _08014840 @ =gUnk_08C01C74
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08014840: .4byte gUnk_08C01C74

	thumb_func_start sub_8014844
sub_8014844: @ 0x08014844
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	str r1, [r0, #0x4c]
	bx lr
	.align 2, 0

	thumb_func_start sub_8014850
sub_8014850: @ 0x08014850
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8014874
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801486E
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08014868
	bl _call_via_r0
_08014868:
	adds r0, r4, #0
	bl Proc_Break
_0801486E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8014874
sub_8014874: @ 0x08014874
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	ldr r2, [r4, #0x54]
	adds r1, r0, r2
	str r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r0, r0, r2
	str r0, [r4, #0x5c]
	cmp r1, #0xf
	bgt _08014892
	cmp r0, r2
	beq _08014898
_0801488E:
	movs r0, #1
	b _080148B0
_08014892:
	adds r0, r1, #0
	subs r0, #0x10
	str r0, [r4, #0x58]
_08014898:
	bl ColorFadeTick_thm
	ldr r1, _080148B8 @ =gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	ldr r1, [r4, #0x5c]
	ldr r0, _080148BC @ =0x000001FF
	cmp r1, r0
	ble _0801488E
	movs r0, #0
_080148B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080148B8: .4byte gPal
_080148BC: .4byte 0x000001FF

	thumb_func_start sub_80148C0
sub_80148C0: @ 0x080148C0
	push {lr}
	movs r0, #0x10
	movs r1, #0x10
	movs r2, #0
	bl sub_8002310
	bl sub_80148E4
	pop {r0}
	bx r0

	thumb_func_start sub_80148D4
sub_80148D4: @ 0x080148D4
	push {lr}
	movs r2, #0
	bl sub_8002310
	bl sub_80148E4
	pop {r0}
	bx r0

	thumb_func_start sub_80148E4
sub_80148E4: @ 0x080148E4
	push {lr}
	ldr r0, _080148FC @ =gUnk_08C01C74
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080148F6
	movs r0, #0
	str r0, [r1, #0x4c]
_080148F6:
	pop {r0}
	bx r0
	.align 2, 0
_080148FC: .4byte gUnk_08C01C74

	thumb_func_start sub_8014900
sub_8014900: @ 0x08014900
	push {r4, lr}
	ldr r4, _08014964 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	movs r3, #0
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08014968 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801496C @ =gPal
	strh r3, [r0]
	bl EnablePalSync
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014964: .4byte gDispIo
_08014968: .4byte 0x0000FFE0
_0801496C: .4byte gPal

	thumb_func_start sub_8014970
sub_8014970: @ 0x08014970
	ldr r3, _080149AC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080149B0 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080149AC: .4byte gDispIo
_080149B0: .4byte 0x0000FFE0

	thumb_func_start sub_80149B4
sub_80149B4: @ 0x080149B4
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080149CC @ =gUnk_08C01CA4
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080149CC: .4byte gUnk_08C01CA4

	thumb_func_start sub_80149D0
sub_80149D0: @ 0x080149D0
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne _080149E2
	adds r0, r1, #0
	bl Proc_Break
	b _080149E6
_080149E2:
	subs r0, #1
	str r0, [r1, #0x58]
_080149E6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80149EC
sub_80149EC: @ 0x080149EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r4, #0
	bne _08014A14
	ldr r0, _08014A10 @ =gUnk_08C01CBC
	ldrb r1, [r0]
	strb r1, [r6]
	adds r6, #1
	ldrb r0, [r0, #1]
	strb r0, [r6]
	strb r4, [r6, #1]
	movs r0, #1
	b _08014AA0
	.align 2, 0
_08014A10: .4byte gUnk_08C01CBC
_08014A14:
	cmp r4, #0
	bge _08014A26
	ldr r0, _08014A30 @ =gUnk_08C01CC0
	ldrb r1, [r0]
	strb r1, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #1]
	rsbs r4, r4, #0
	movs r5, #2
_08014A26:
	ldr r0, _08014A34 @ =0x0001869F
	cmp r4, r0
	ble _08014A38
	adds r5, #0xa
	b _08014A66
	.align 2, 0
_08014A30: .4byte gUnk_08C01CC0
_08014A34: .4byte 0x0001869F
_08014A38:
	ldr r0, _08014A44 @ =0x0000270F
	cmp r4, r0
	ble _08014A48
	adds r5, #8
	b _08014A66
	.align 2, 0
_08014A44: .4byte 0x0000270F
_08014A48:
	ldr r0, _08014A54 @ =0x000003E7
	cmp r4, r0
	ble _08014A58
	adds r5, #6
	b _08014A66
	.align 2, 0
_08014A54: .4byte 0x000003E7
_08014A58:
	cmp r4, #0x63
	ble _08014A60
	adds r5, #4
	b _08014A66
_08014A60:
	cmp r4, #9
	ble _08014A66
	adds r5, #2
_08014A66:
	mov r8, r5
	cmp r4, #0
	ble _08014A92
	ldr r7, _08014AAC @ =gUnk_08C01CBC
_08014A6E:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r6, r5
	ldrb r1, [r7]
	strb r1, [r2]
	ldrb r1, [r7, #1]
	adds r0, r1, r0
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bgt _08014A6E
_08014A92:
	mov r0, r8
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #2]
	mov r1, r8
	asrs r0, r1, #1
	adds r0, #1
_08014AA0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014AAC: .4byte gUnk_08C01CBC

	thumb_func_start sub_8014AB0
sub_8014AB0: @ 0x08014AB0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, _08014B10 @ =0x03000430
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitText
	adds r0, r6, #0
	bl GetStringTextLen
	lsls r4, r4, #3
	subs r4, r4, r0
	subs r4, #1
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, r8
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_DrawString
	adds r0, r5, #0
	mov r1, sb
	bl PutText
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014B10: .4byte 0x03000430

	thumb_func_start sub_8014B14
sub_8014B14: @ 0x08014B14
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, _08014B54 @ =0x03000430
	adds r0, r5, #0
	bl GetStringTextLen
	adds r1, r0, #7
	cmp r1, #0
	bge _08014B2C
	adds r1, #7
_08014B2C:
	asrs r1, r1, #3
	adds r0, r4, #0
	bl InitText
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014B54: .4byte 0x03000430

	thumb_func_start sub_8014B58
sub_8014B58: @ 0x08014B58
	push {lr}
	ldr r0, _08014B64 @ =gUnk_08C01CC4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08014B64: .4byte gUnk_08C01CC4

	thumb_func_start sub_8014B68
sub_8014B68: @ 0x08014B68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r1, [sp, #0x14]
	ldr r0, _08014BA0 @ =gUnk_08C01CC4
	bl Proc_Start
	str r5, [r0, #0x2c]
	movs r2, #0
	mov r1, r8
	strh r1, [r0, #0x30]
	lsrs r1, r4, #0x1f
	adds r4, r4, r1
	asrs r4, r4, #1
	strh r4, [r0, #0x32]
	strh r6, [r0, #0x36]
	strh r6, [r0, #0x34]
	strh r2, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014BA0: .4byte gUnk_08C01CC4

	thumb_func_start sub_8014BA4
sub_8014BA4: @ 0x08014BA4
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl sub_8014B68
	movs r1, #0
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8014BBC
sub_8014BBC: @ 0x08014BBC
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl sub_8014B68
	movs r1, #1
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8014BD4
sub_8014BD4: @ 0x08014BD4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	blo _08014C30
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x32]
	bl DivRem
	adds r5, r0, #0
	ldrh r0, [r4, #0x3a]
	cmp r0, #0
	beq _08014C02
	ldrh r2, [r4, #0x32]
	subs r0, r2, r5
	subs r5, r0, #1
_08014C02:
	lsls r6, r5, #1
	ldr r0, [r4, #0x2c]
	adds r0, r0, r6
	ldrh r1, [r4, #0x30]
	ldrh r3, [r4, #0x32]
	subs r2, r3, r5
	lsls r2, r2, #1
	bl ApplyPaletteExt
	cmp r5, #0
	ble _08014C2A
	ldr r0, [r4, #0x2c]
	ldrh r2, [r4, #0x32]
	lsls r1, r2, #1
	ldrh r3, [r4, #0x30]
	adds r1, r3, r1
	subs r1, r1, r6
	adds r2, r6, #0
	bl ApplyPaletteExt
_08014C2A:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08014C30:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014C38
sub_8014C38: @ 0x08014C38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	ldr r0, [sp, #0x24]
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r3, r2, #0
	adds r0, r3, r0
	cmp r3, r0
	bge _08014C90
	mov r8, r0
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_08014C5C:
	mov r1, sl
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	adds r6, r3, #1
	cmp r1, r0
	bge _08014C8A
	adds r5, r0, #0
	lsls r0, r3, #6
	add r0, sb
	mov r7, ip
	adds r2, r7, r0
_08014C72:
	cmp r1, #0x1f
	bhi _08014C7C
	cmp r3, #0x1f
	bhi _08014C7C
	strh r4, [r2]
_08014C7C:
	adds r2, #2
	adds r1, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, r5
	blt _08014C72
_08014C8A:
	adds r3, r6, #0
	cmp r3, r8
	blt _08014C5C
_08014C90:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014CA0
sub_8014CA0: @ 0x08014CA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08014D20
	movs r5, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	bge _08014D68
_08014CD0:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _08014D16
	lsls r3, r5, #6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08014CE0:
	adds r0, r7, r2
	adds r4, r2, #1
	cmp r0, #0x1f
	bhi _08014D10
	mov r2, sl
	adds r1, r2, r5
	cmp r1, #0x1f
	bhi _08014D10
	lsls r1, r1, #6
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	adds r1, r1, r0
	mov r2, ip
	subs r0, r2, r4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	add r0, sb
	mov r2, r8
	eors r0, r2
	strh r0, [r1]
_08014D10:
	adds r2, r4, #0
	cmp r2, ip
	blt _08014CE0
_08014D16:
	adds r5, r6, #0
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _08014CD0
	b _08014D68
_08014D20:
	movs r5, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	bge _08014D68
	lsls r2, r7, #1
	mov r8, r2
_08014D2C:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _08014D60
	lsls r0, r5, #6
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r3, [sp]
	add r3, r8
_08014D3E:
	adds r0, r7, r2
	cmp r0, #0x1f
	bhi _08014D56
	mov r1, sl
	adds r0, r1, r5
	cmp r0, #0x1f
	bhi _08014D56
	lsls r0, r0, #6
	adds r0, r0, r3
	ldrh r1, [r4]
	add r1, sb
	strh r1, [r0]
_08014D56:
	adds r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, ip
	blt _08014D3E
_08014D60:
	adds r5, r6, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	blt _08014D2C
_08014D68:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8014D78
sub_8014D78: @ 0x08014D78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sb, r1
	str r2, [sp, #4]
	ldr r7, [sp, #0x28]
	ldr r5, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldr r0, [sp, #0x30]
	mov r8, r0
	movs r0, #0x20
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivRem
	adds r1, r7, #0
	muls r1, r0, r1
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [sp, #0x2c]
	adds r0, r6, #0
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	cmp r5, r2
	bge _08014E12
	mov r0, sb
	lsls r0, r0, #1
	mov ip, r0
_08014DD4:
	movs r4, #0
	adds r6, r5, #1
	cmp r4, r7
	bge _08014E0A
	lsls r0, r5, #6
	mov r1, r8
	adds r3, r1, r0
	ldr r2, [sp]
	add r2, ip
_08014DE6:
	mov r1, sb
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi _08014E00
	ldr r1, [sp, #4]
	adds r0, r1, r5
	cmp r0, #0x1f
	bhi _08014E00
	lsls r0, r0, #6
	adds r0, r0, r2
	ldrh r1, [r3]
	add r1, sl
	strh r1, [r0]
_08014E00:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r7
	blt _08014DE6
_08014E0A:
	adds r5, r6, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	blt _08014DD4
_08014E12:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014E24
sub_8014E24: @ 0x08014E24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	ldr r0, [sp, #0x34]
	mov r8, r0
	ldr r4, [sp, #0x40]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	ldr r1, [sp, #0x3c]
	ldrb r2, [r1]
	adds r2, #1
	mov sb, r2
	adds r1, #2
	str r1, [sp, #0xc]
	mov r0, sb
	mov r1, r8
	bl Div
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl Div
	adds r1, r5, #0
	muls r1, r0, r1
	subs r4, r4, r1
	mov r1, r8
	muls r1, r4, r1
	lsls r1, r1, #1
	ldr r6, [sp, #0xc]
	adds r1, r6, r1
	ldr r7, [sp, #0x38]
	muls r0, r7, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	str r1, [sp, #0xc]
	movs r5, #0
	cmp r5, r7
	bge _08014ED4
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_08014E86:
	movs r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x10]
	cmp r4, r8
	bge _08014ECC
	ldr r2, [sp, #0x38]
	subs r0, r2, r5
	subs r0, #1
	mov r6, sb
	muls r6, r0, r6
	adds r0, r6, #0
	lsls r0, r0, #1
	ldr r7, [sp, #0xc]
	adds r3, r7, r0
	ldr r2, [sp]
	add r2, ip
_08014EA6:
	mov r1, sl
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi _08014EC2
	ldr r6, [sp, #4]
	adds r0, r6, r5
	cmp r0, #0x1f
	bhi _08014EC2
	lsls r0, r0, #6
	adds r0, r0, r2
	ldrh r7, [r3]
	ldr r6, [sp, #8]
	adds r1, r7, r6
	strh r1, [r0]
_08014EC2:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r8
	blt _08014EA6
_08014ECC:
	ldr r5, [sp, #0x10]
	ldr r7, [sp, #0x38]
	cmp r5, r7
	blt _08014E86
_08014ED4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8014EE4
sub_8014EE4: @ 0x08014EE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r5, r1, #0
	mov ip, r2
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, r3, #2
	movs r1, #0xff
	ldr r0, [r3]
	ldrb r3, [r3]
	mov sb, r3
	lsrs r3, r0, #8
	ands r3, r1
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	blt _08014F52
_08014F0E:
	asrs r0, r1, #0x10
	add r0, ip
	lsls r4, r3, #0x10
	cmp r0, #0x1f
	bhi _08014F46
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	mov r3, r8
	adds r1, r3, r0
	mov r7, sb
	lsls r3, r7, #0x10
	asrs r0, r3, #0x10
	cmp r0, #0
	blt _08014F46
_08014F2C:
	asrs r3, r3, #0x10
	adds r0, r5, r3
	cmp r0, #0x1f
	bhi _08014F3A
	ldrh r7, [r2]
	adds r0, r7, r6
	strh r0, [r1]
_08014F3A:
	subs r0, r3, #1
	adds r2, #2
	adds r1, #2
	lsls r3, r0, #0x10
	cmp r3, #0
	bge _08014F2C
_08014F46:
	ldr r1, _08014F60 @ =0xFFFF0000
	adds r0, r4, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	cmp r1, #0
	bge _08014F0E
_08014F52:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014F60: .4byte 0xFFFF0000

	thumb_func_start sub_8014F64
sub_8014F64: @ 0x08014F64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08014F82
	ldr r0, [r4, #0x2c]
	bl _call_via_r0
	adds r0, r4, #0
	bl Proc_Break
_08014F82:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8014F88
sub_8014F88: @ 0x08014F88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08014FA8
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_08014FA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014FB0
sub_8014FB0: @ 0x08014FB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08014FC8 @ =gUnk_08C01CCC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014FC8: .4byte gUnk_08C01CCC

	thumb_func_start sub_8014FCC
sub_8014FCC: @ 0x08014FCC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08014FE8 @ =gUnk_08C01CDC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014FE8: .4byte gUnk_08C01CDC

	thumb_func_start sub_8014FEC
sub_8014FEC: @ 0x08014FEC
	cmp r1, #0
	ble _08014FFC
	movs r2, #0
_08014FF2:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _08014FF2
_08014FFC:
	bx lr
	.align 2, 0

	thumb_func_start sub_8015000
sub_8015000: @ 0x08015000
	cmp r1, #0
	ble _0801500E
_08015004:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _08015004
_0801500E:
	bx lr

	thumb_func_start sub_8015010
sub_8015010: @ 0x08015010
	cmp r1, #0
	ble _0801501E
_08015014:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bgt _08015014
_0801501E:
	bx lr

	thumb_func_start sub_8015020
sub_8015020: @ 0x08015020
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08015040 @ =gUnk_08C01DAC
	bl Proc_StartBlocking
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015040: .4byte gUnk_08C01DAC

	thumb_func_start sub_8015044
sub_8015044: @ 0x08015044
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _08015062
	adds r0, r4, #0
	bl Proc_Break
_08015062:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8015068
sub_8015068: @ 0x08015068
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _08015086
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuSet
	b _08015098
_08015086:
	adds r2, r3, #0
	cmp r2, #0
	bge _0801508E
	adds r2, #3
_0801508E:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
_08015098:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80150A0
sub_80150A0: @ 0x080150A0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _080150C6
	adds r4, r3, #0
_080150AE:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_8015068
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080150AE
_080150C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80150CC
sub_80150CC: @ 0x080150CC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r2, #0
	ble _080150E8
_080150D8:
	ldrh r5, [r4]
	adds r0, r5, r3
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r2, #2
	cmp r2, #0
	bgt _080150D8
_080150E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80150F0
sub_80150F0: @ 0x080150F0
	cmp r0, #1
	beq _08015118
	cmp r0, #1
	bgt _080150FE
	cmp r0, #0
	beq _08015108
	b _08015148
_080150FE:
	cmp r0, #2
	beq _08015128
	cmp r0, #3
	beq _08015138
	b _08015148
_08015108:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08015114 @ =gBg0Tm
	adds r0, r0, r1
	b _0801514A
	.align 2, 0
_08015114: .4byte gBg0Tm
_08015118:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08015124 @ =gBg1Tm
	adds r0, r0, r1
	b _0801514A
	.align 2, 0
_08015124: .4byte gBg1Tm
_08015128:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08015134 @ =gBg2Tm
	adds r0, r0, r1
	b _0801514A
	.align 2, 0
_08015134: .4byte gBg2Tm
_08015138:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08015144 @ =gBg3Tm
	adds r0, r0, r1
	b _0801514A
	.align 2, 0
_08015144: .4byte gBg3Tm
_08015148:
	movs r0, #0
_0801514A:
	bx lr

	thumb_func_start sub_801514C
sub_801514C: @ 0x0801514C
	push {r4, r5, lr}
	ldr r4, _080151D0 @ =gDispIo
	movs r5, #0x80
	adds r0, r5, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08015170
	movs r0, #0
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8015010
_08015170:
	adds r0, r5, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	cmp r0, #0
	bne _0801518E
	movs r0, #1
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8015010
_0801518E:
	adds r0, r5, #0
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080151AC
	movs r0, #2
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8015010
_080151AC:
	adds r0, r5, #0
	ldrb r4, [r4, #0x18]
	ands r0, r4
	cmp r0, #0
	bne _080151CA
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8015010
_080151CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080151D0: .4byte gDispIo

	thumb_func_start sub_80151D4
sub_80151D4: @ 0x080151D4
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _080151E2
	movs r0, #0x60
	rsbs r0, r0, #0
	b _080151F8
_080151E2:
	cmp r1, #0xef
	bgt _080151F6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0xf0
	bl Div
	subs r0, #0x60
	b _080151F8
_080151F6:
	movs r0, #0x5f
_080151F8:
	pop {r1}
	bx r1

	thumb_func_start PlaySeSpacial
PlaySeSpacial: @ 0x080151FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _0801524C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08015216
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08015216:
	ldr r2, _08015250 @ =gUnk_086EA858
	ldr r0, _08015254 @ =gUnk_086EA8D0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08015258 @ =0x0000FFFF
	adds r0, r6, #0
	bl sub_80151D4
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayPanpotControl
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801524C: .4byte gPlaySt
_08015250: .4byte gUnk_086EA858
_08015254: .4byte gUnk_086EA8D0
_08015258: .4byte 0x0000FFFF

	thumb_func_start sub_801525C
sub_801525C: @ 0x0801525C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08015270 @ =sub_8015274
	adds r1, r3, #0
	bl sub_8014FCC
	pop {r0}
	bx r0
	.align 2, 0
_08015270: .4byte sub_8015274

	thumb_func_start sub_8015274
sub_8015274: @ 0x08015274
	push {lr}
	adds r1, r0, #0
	ldr r0, _08015290 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801528C
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_0801528C:
	pop {r0}
	bx r0
	.align 2, 0
_08015290: .4byte gPlaySt

	thumb_func_start sub_8015294
sub_8015294: @ 0x08015294
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	bl sub_800376C
	pop {r0}
	bx r0

	thumb_func_start sub_80152A4
sub_80152A4: @ 0x080152A4
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80152B4
sub_80152B4: @ 0x080152B4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #5
	ldr r1, _08015308 @ =gPal
	movs r2, #0x1f
	mov ip, r2
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r4, r0, r1
	movs r5, #0xf
_080152CA:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	lsrs r0, r0, #2
	lsls r2, r0, #1
	adds r2, r2, r0
	adds r0, r7, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r3, r0, #1
	adds r3, r3, r0
	adds r0, r6, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r1, r0, #1
	adds r1, r1, r0
	mov r0, ip
	ands r2, r0
	ands r3, r7
	orrs r2, r3
	ands r1, r6
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080152CA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015308: .4byte gPal

	thumb_func_start sub_801530C
sub_801530C: @ 0x0801530C
	adds r3, r0, #0
	cmp r2, #0
	beq _08015320
_08015312:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bne _08015312
_08015320:
	bx lr
	.align 2, 0

	thumb_func_start sub_8015324
sub_8015324: @ 0x08015324
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov sb, r1
	adds r5, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x18]
	mov r0, r8
	bl GetStringTextLen
	adds r1, r0, #0
	lsls r4, r4, #3
	subs r4, r4, r1
	asrs r1, r4, #1
	adds r0, r6, #0
	bl Text_SetCursor
	adds r0, r6, #0
	mov r1, r8
	bl Text_DrawString
	lsls r5, r5, #5
	add r5, sb
	lsls r5, r5, #1
	ldr r0, _08015370 @ =gBg0Tm
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015370: .4byte gBg0Tm

	thumb_func_start sub_8015374
sub_8015374: @ 0x08015374
	push {r4, r5, r6, lr}
	ldr r6, [r0]
	ldr r3, [r1]
	muls r3, r6, r3
	ldr r5, [r0, #4]
	ldr r4, [r1, #0xc]
	muls r4, r5, r4
	adds r3, r3, r4
	ldr r4, [r0, #8]
	ldr r0, [r1, #0x18]
	muls r0, r4, r0
	adds r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r0, [r1, #4]
	muls r0, r6, r0
	ldr r3, [r1, #0x10]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r3, [r1, #0x1c]
	muls r3, r4, r3
	adds r0, r0, r3
	asrs r0, r0, #0xc
	str r0, [r2, #4]
	ldr r0, [r1, #8]
	muls r0, r6, r0
	ldr r3, [r1, #0x14]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r1, [r1, #0x20]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80153C0
sub_80153C0: @ 0x080153C0
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r3, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r3, r6
	beq _080153D2
	cmp r4, r6
	bne _080153D6
_080153D2:
	mov r5, sp
	b _080153D8
_080153D6:
	adds r5, r6, #0
_080153D8:
	ldr r1, [r3]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5]
	ldr r1, [r3]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #4]
	ldr r1, [r3]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #8]
	ldr r1, [r3, #0xc]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0xc]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x10]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x14]
	ldr r1, [r3, #0x18]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x18]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x1c]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x20]
	ldr r1, [r3]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0xc]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x18]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x24]
	adds r0, r0, r1
	str r0, [r5, #0x24]
	ldr r1, [r3, #4]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0x28]
	ldr r1, [r3, #8]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x2c]
	adds r0, r0, r1
	str r0, [r5, #0x2c]
	cmp r5, r13
	bne _08015528
	mov r0, sp
	adds r1, r6, #0
	bl sub_8015550
_08015528:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8015530
sub_8015530: @ 0x08015530
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [r0]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	bx lr

	thumb_func_start sub_8015550
sub_8015550: @ 0x08015550
	ldr r2, [r0]
	str r2, [r1]
	ldr r2, [r0, #4]
	str r2, [r1, #4]
	ldr r2, [r0, #8]
	str r2, [r1, #8]
	ldr r2, [r0, #0xc]
	str r2, [r1, #0xc]
	ldr r2, [r0, #0x10]
	str r2, [r1, #0x10]
	ldr r2, [r0, #0x14]
	str r2, [r1, #0x14]
	ldr r2, [r0, #0x18]
	str r2, [r1, #0x18]
	ldr r2, [r0, #0x1c]
	str r2, [r1, #0x1c]
	ldr r2, [r0, #0x20]
	str r2, [r1, #0x20]
	ldr r2, [r0, #0x24]
	str r2, [r1, #0x24]
	ldr r2, [r0, #0x28]
	str r2, [r1, #0x28]
	ldr r0, [r0, #0x2c]
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start sub_8015584
sub_8015584: @ 0x08015584
	push {r4, lr}
	ldr r3, _080155CC @ =gSinLut
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r4, [r1]
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0]
	movs r3, #0
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x10]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r1, r2, #0
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080155CC: .4byte gSinLut

	thumb_func_start sub_80155D0
sub_80155D0: @ 0x080155D0
	push {r4, lr}
	ldr r3, _08015614 @ =gSinLut
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r3, #0
	ldrsh r4, [r1, r3]
	str r4, [r0]
	movs r3, #0
	str r3, [r0, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r1, r2, #0
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r3, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015614: .4byte gSinLut

	thumb_func_start sub_8015618
sub_8015618: @ 0x08015618
	push {r4, lr}
	ldr r3, _0801565C @ =gSinLut
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r4, #0
	ldrsh r3, [r1, r4]
	str r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r1, r2, #0
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801565C: .4byte gSinLut

	thumb_func_start nullsub_36
nullsub_36: @ 0x08015660
	bx lr
	.align 2, 0

	thumb_func_start sub_8015664
sub_8015664: @ 0x08015664
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r1]
	muls r0, r2, r0
	ldr r3, [r4, #4]
	ldr r2, [r1, #4]
	muls r2, r3, r2
	adds r0, r0, r2
	ldr r2, [r4, #8]
	ldr r1, [r1, #8]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8015688
sub_8015688: @ 0x08015688
	push {r4, r5, r6, lr}
	ldr r6, [r0, #4]
	ldr r3, [r1, #8]
	muls r3, r6, r3
	ldr r5, [r0, #8]
	ldr r4, [r1, #4]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r3, [r1]
	muls r3, r5, r3
	ldr r4, [r0]
	ldr r0, [r1, #8]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2, #4]
	ldr r0, [r1, #4]
	muls r0, r4, r0
	ldr r1, [r1]
	muls r1, r6, r1
	subs r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80156C0
sub_80156C0: @ 0x080156C0
	muls r0, r3, r0
	muls r1, r2, r1
	subs r0, r0, r1
	bx lr
