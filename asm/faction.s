	.include "macro.inc"
	.syntax unified

	thumb_func_start CountFactionUnitsWithoutFlags
CountFactionUnitsWithoutFlags: @ 0x08023D00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r4, r5, #1
	b _08023D2C
_08023D0C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08023D28
	ldr r0, [r1]
	cmp r0, #0
	beq _08023D28
	ldr r0, [r1, #0xc]
	ands r0, r7
	cmp r0, #0
	bne _08023D28
	adds r6, #1
_08023D28:
	adds r4, #1
	adds r0, r5, #0
_08023D2C:
	adds r0, #0x40
	cmp r4, r0
	blt _08023D0C
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AreUnitIdsAllied
AreUnitIdsAllied: @ 0x08023D3C
	movs r2, #0x80
	ands r1, r2
	movs r3, #0
	ands r2, r0
	cmp r2, r1
	bne _08023D4A
	movs r3, #1
_08023D4A:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start AreUnitIdsSameFaction
AreUnitIdsSameFaction: @ 0x08023D50
	movs r2, #0xc0
	ands r1, r2
	movs r3, #0
	ands r2, r0
	cmp r2, r1
	bne _08023D5E
	movs r3, #1
_08023D5E:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start GetActiveFactionAlliance
GetActiveFactionAlliance: @ 0x08023D64
	ldr r1, _08023D74 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08023D74: .4byte gPlaySt

	thumb_func_start GetActiveFactionOpposingAlliance
GetActiveFactionOpposingAlliance: @ 0x08023D78
	ldr r1, _08023D8C @ =gPlaySt
	movs r2, #0x80
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	eors r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08023D8C: .4byte gPlaySt
