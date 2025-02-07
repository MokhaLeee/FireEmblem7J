	.include "macro.inc"
	.syntax unified

	thumb_func_start IsCharacterForceDeployed
IsCharacterForceDeployed: @ 0x0808E6A4
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E78A
	ldr r0, _0808E6C4 @ =gPlaySt
	ldrb r1, [r0, #0x1b]
	cmp r1, #2
	beq _0808E6D6
	cmp r1, #2
	bgt _0808E6C8
	cmp r1, #1
	beq _0808E6CE
	b _0808E6E0
	.align 2, 0
_0808E6C4: .4byte gPlaySt
_0808E6C8:
	cmp r1, #3
	beq _0808E6DC
	b _0808E6E0
_0808E6CE:
	cmp r4, #3
	bne _0808E6E0
_0808E6D2:
	movs r0, #1
	b _0808E78C
_0808E6D6:
	cmp r4, #1
	bne _0808E6E0
	b _0808E6D2
_0808E6DC:
	cmp r4, #2
	beq _0808E6D2
_0808E6E0:
	ldrb r0, [r0, #0xe]
	subs r0, #0x1a
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bhi _0808E78A
	lsls r0, r0, #2
	ldr r1, _0808E6F8 @ =_0808E6FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E6F8: .4byte _0808E6FC
_0808E6FC: @ jump table
	.4byte _0808E762 @ case 0
	.4byte _0808E750 @ case 1
	.4byte _0808E762 @ case 2
	.4byte _0808E78A @ case 3
	.4byte _0808E756 @ case 4
	.4byte _0808E78A @ case 5
	.4byte _0808E78A @ case 6
	.4byte _0808E78A @ case 7
	.4byte _0808E762 @ case 8
	.4byte _0808E78A @ case 9
	.4byte _0808E78A @ case 10
	.4byte _0808E78A @ case 11
	.4byte _0808E75C @ case 12
	.4byte _0808E78A @ case 13
	.4byte _0808E78A @ case 14
	.4byte _0808E78A @ case 15
	.4byte _0808E762 @ case 16
	.4byte _0808E78A @ case 17
	.4byte _0808E770 @ case 18
	.4byte _0808E78A @ case 19
	.4byte _0808E776 @ case 20
_0808E750:
	cmp r4, #1
	bne _0808E78A
	b _0808E6D2
_0808E756:
	cmp r4, #0x22
	bne _0808E78A
	b _0808E6D2
_0808E75C:
	cmp r4, #0x14
	bne _0808E78A
	b _0808E6D2
_0808E762:
	cmp r4, #0x2d
	beq _0808E6D2
	cmp r4, #1
	beq _0808E6D2
	cmp r4, #2
	bne _0808E78A
	b _0808E6D2
_0808E770:
	cmp r4, #0x26
	bne _0808E78A
	b _0808E6D2
_0808E776:
	cmp r4, #0x2d
	beq _0808E6D2
	cmp r4, #1
	beq _0808E6D2
	cmp r4, #2
	beq _0808E6D2
	cmp r4, #0x26
	beq _0808E6D2
	cmp r4, #0x27
	beq _0808E6D2
_0808E78A:
	movs r0, #0
_0808E78C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CalcForceDeployedUnitCounts
CalcForceDeployedUnitCounts: @ 0x0808E794
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0808E79A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808E7C2
	ldr r2, [r0]
	cmp r2, #0
	beq _0808E7C2
	ldr r0, [r0, #0xc]
	ldr r1, _0808E7D0 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808E7C2
	ldrb r0, [r2, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E7C2
	adds r5, #1
_0808E7C2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E79A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808E7D0: .4byte 0x00010004

	thumb_func_start sub_808E7D4
sub_808E7D4: @ 0x0808E7D4
	adds r1, r0, #0
	ldr r0, _0808E7F0 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x2b
	bgt _0808E818
	cmp r0, #0x2a
	bge _0808E80C
	cmp r0, #9
	beq _0808E7F4
	cmp r0, #0x29
	beq _0808E800
	b _0808E818
	.align 2, 0
_0808E7F0: .4byte gPlaySt
_0808E7F4:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x23
	bne _0808E818
	movs r0, #1
	b _0808E81A
_0808E800:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0xb
	bne _0808E818
	movs r0, #1
	b _0808E81A
_0808E80C:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	bne _0808E818
	movs r0, #1
	b _0808E81A
_0808E818:
	movs r0, #0
_0808E81A:
	bx lr

	thumb_func_start IsUnitInCurrentRoster
IsUnitInCurrentRoster: @ 0x0808E81C
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0808E840 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808E848
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0808E844
	movs r0, #1
	b _0808E84A
	.align 2, 0
_0808E840: .4byte 0x00010004
_0808E844:
	movs r0, #8
	str r0, [r2, #0xc]
_0808E848:
	movs r0, #0
_0808E84A:
	bx lr
