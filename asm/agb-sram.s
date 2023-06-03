	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadSramFast_Core
ReadSramFast_Core: @ 0x080C05B8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080C05F0 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080C05F4 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080C05E8
	adds r1, r0, #0
_080C05DA:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080C05DA
_080C05E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C05F0: .4byte 0x04000204
_080C05F4: .4byte 0x0000FFFC

	thumb_func_start WriteSramFast
WriteSramFast: @ 0x080C05F8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080C0630 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080C0634 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080C0628
	adds r1, r0, #0
_080C061A:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080C061A
_080C0628:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0630: .4byte 0x04000204
_080C0634: .4byte 0x0000FFFC

	thumb_func_start VerifySramFast_Core
VerifySramFast_Core: @ 0x080C0638
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080C066C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080C0670 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080C067A
	adds r2, r0, #0
_080C065A:
	ldrb r1, [r4]
	ldrb r0, [r5]
	adds r5, #1
	adds r4, #1
	cmp r1, r0
	beq _080C0674
	subs r0, r4, #1
	b _080C067C
	.align 2, 0
_080C066C: .4byte 0x04000204
_080C0670: .4byte 0x0000FFFC
_080C0674:
	subs r3, #1
	cmp r3, r2
	bne _080C065A
_080C067A:
	movs r0, #0
_080C067C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetSramFastFunc
SetSramFastFunc: @ 0x080C0684
	ldr r2, _080C0698 @ =ReadSramFast_Core
	movs r0, #1
	eors r2, r0
	ldr r3, _080C069C @ =0x030022F8
	ldr r0, _080C06A0 @ =WriteSramFast
	ldr r1, _080C0698 @ =ReadSramFast_Core
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080C06B0
	.align 2, 0
_080C0698: .4byte ReadSramFast_Core
_080C069C: .4byte 0x030022F8
_080C06A0: .4byte WriteSramFast
_080C06A4:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080C06B0:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080C06A4
	ldr r1, _080C06D0 @ =0x03005D90
	ldr r0, _080C06D4 @ =0x030022F9
	str r0, [r1]
	ldr r2, _080C06D8 @ =VerifySramFast_Core
	movs r0, #1
	eors r2, r0
	ldr r3, _080C06DC @ =0x03002258
	ldr r0, _080C06E0 @ =SetSramFastFunc
	ldr r1, _080C06D8 @ =VerifySramFast_Core
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080C06F0
	.align 2, 0
_080C06D0: .4byte 0x03005D90
_080C06D4: .4byte 0x030022F9
_080C06D8: .4byte VerifySramFast_Core
_080C06DC: .4byte 0x03002258
_080C06E0: .4byte SetSramFastFunc
_080C06E4:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080C06F0:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080C06E4
	ldr r1, _080C070C @ =0x03005D94
	ldr r0, _080C0710 @ =0x03002259
	str r0, [r1]
	ldr r2, _080C0714 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080C0718 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C070C: .4byte 0x03005D94
_080C0710: .4byte 0x03002259
_080C0714: .4byte 0x04000204
_080C0718: .4byte 0x0000FFFC

	thumb_func_start WriteAndVerifySramFast
WriteAndVerifySramFast: @ 0x080C071C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r7, #0
	b _080C072E
_080C0728:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_080C072E:
	cmp r7, #2
	bhi _080C0750
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl WriteSramFast
	ldr r0, _080C0758 @ =0x03005D94
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r3, r0, #0
	cmp r3, #0
	bne _080C0728
_080C0750:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C0758: .4byte 0x03005D94
