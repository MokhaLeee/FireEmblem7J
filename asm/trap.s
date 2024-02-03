	.include "macro.inc"
	.syntax unified

	thumb_func_start InitTraps
InitTraps: @ 0x0802BF08
	push {r4, lr}
	ldr r3, _0802BF28 @ =0x0203A714
	ldr r1, _0802BF2C @ =0x0203A514
	movs r2, #0
	movs r4, #0xfc
	lsls r4, r4, #1
	adds r0, r1, r4
_0802BF16:
	strb r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0802BF16
	movs r0, #0
	strb r0, [r3, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BF28: .4byte 0x0203A714
_0802BF2C: .4byte 0x0203A514

	thumb_func_start GetTrapAt
GetTrapAt: @ 0x0802BF30
	adds r3, r0, #0
	ldr r2, _0802BF38 @ =0x0203A514
	b _0802BF4E
	.align 2, 0
_0802BF38: .4byte 0x0203A514
_0802BF3C:
	ldrb r0, [r2]
	cmp r3, r0
	bne _0802BF4C
	ldrb r0, [r2, #1]
	cmp r1, r0
	bne _0802BF4C
	adds r0, r2, #0
	b _0802BF56
_0802BF4C:
	adds r2, #8
_0802BF4E:
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BF3C
	movs r0, #0
_0802BF56:
	bx lr

	thumb_func_start sub_802BF58
sub_802BF58: @ 0x0802BF58
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _0802BF60 @ =0x0203A514
	b _0802BF7C
	.align 2, 0
_0802BF60: .4byte 0x0203A514
_0802BF64:
	ldrb r0, [r3]
	cmp r0, r4
	bne _0802BF7A
	ldrb r0, [r3, #1]
	cmp r0, r1
	bne _0802BF7A
	ldrb r0, [r3, #2]
	cmp r0, r2
	bne _0802BF7A
	adds r0, r3, #0
	b _0802BF84
_0802BF7A:
	adds r3, #8
_0802BF7C:
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0802BF64
	movs r0, #0
_0802BF84:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802BF8C
sub_802BF8C: @ 0x0802BF8C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0802BF98 @ =0x0203A514
	b _0802BF9E
	.align 2, 0
_0802BF98: .4byte 0x0203A514
_0802BF9C:
	adds r1, #8
_0802BF9E:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802BF9C
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_802BFB4
sub_802BFB4: @ 0x0802BFB4
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	ldr r5, [sp, #0x14]
	ldr r6, [sp, #0x18]
	bl sub_802BF8C
	strb r4, [r0, #4]
	strb r5, [r0, #5]
	strb r4, [r0, #6]
	strb r6, [r0, #7]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802BFD0
sub_802BFD0: @ 0x0802BFD0
	adds r2, r0, #0
	b _0802BFDA
_0802BFD4:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0xc]
	stm r2!, {r0, r1}
_0802BFDA:
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BFD4
	bx lr
	.align 2, 0

	thumb_func_start sub_802BFE4
sub_802BFE4: @ 0x0802BFE4
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0xa
	str r2, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl sub_802BFB4
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C000
sub_802C000: @ 0x0802C000
	push {r4, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r2, [sp, #0x14]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	movs r2, #5
	adds r3, r4, #0
	bl sub_802BFB4
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_802C020
sub_802C020: @ 0x0802C020
	push {lr}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #0
	bl sub_802BFB4
	add sp, #0xc
	pop {r0}
	bx r0

	thumb_func_start sub_802C03C
sub_802C03C: @ 0x0802C03C
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl sub_802BFB4
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C058
sub_802C058: @ 0x0802C058
	push {lr}
	movs r2, #8
	movs r3, #0
	bl sub_802BF8C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C068
sub_802C068: @ 0x0802C068
	push {lr}
	adds r3, r2, #0
	movs r2, #9
	bl sub_802BF8C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C078
sub_802C078: @ 0x0802C078
	push {r4, r5, r6, lr}
	ldr r0, _0802C0AC @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802C0F8
_0802C086:
	ldr r0, _0802C0AC @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0802C0F2
_0802C094:
	ldr r0, _0802C0B0 @ =gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802C0B4
	cmp r0, #0x33
	beq _0802C0E0
	b _0802C0EC
	.align 2, 0
_0802C0AC: .4byte gBmMapSize
_0802C0B0: .4byte gBmMapTerrain
_0802C0B4:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802C0EC
	ldr r0, _0802C0DC @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_802BF8C
	b _0802C0EC
	.align 2, 0
_0802C0DC: .4byte gPlaySt
_0802C0E0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0x14
	bl sub_802BF8C
_0802C0EC:
	subs r4, #1
	cmp r4, #0
	bge _0802C094
_0802C0F2:
	adds r5, r6, #0
	cmp r5, #0
	bge _0802C086
_0802C0F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C100
sub_802C100: @ 0x0802C100
	push {r4, lr}
	ldr r4, _0802C108 @ =0x0203A514
	b _0802C132
	.align 2, 0
_0802C108: .4byte 0x0203A514
_0802C10C:
	ldrb r0, [r4, #2]
	cmp r0, #3
	beq _0802C118
	cmp r0, #6
	beq _0802C120
	b _0802C130
_0802C118:
	ldrb r0, [r4, #3]
	bl ApplyMapChange
	b _0802C130
_0802C120:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802C12A
	ldrb r0, [r4, #1]
	b _0802C12C
_0802C12A:
	ldrb r0, [r4]
_0802C12C:
	bl ApplyMapChange
_0802C130:
	adds r4, #8
_0802C132:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C10C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C140
sub_802C140: @ 0x0802C140
	push {r4, r5, lr}
	ldr r2, _0802C174 @ =0x0203A514
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802C16C
	ldr r4, _0802C178 @ =gBmMapTerrain
	movs r3, #0
_0802C14E:
	ldrb r0, [r2, #2]
	cmp r0, #0xc
	bne _0802C164
	ldr r0, [r4]
	ldrb r5, [r2, #1]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldrb r1, [r2]
	adds r0, r1, r0
	strb r3, [r0]
_0802C164:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802C14E
_0802C16C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C174: .4byte 0x0203A514
_0802C178: .4byte gBmMapTerrain

	thumb_func_start sub_802C17C
sub_802C17C: @ 0x0802C17C
	push {lr}
	bl GetTrapAt
	cmp r0, #0
	beq _0802C18A
	ldrb r0, [r0, #3]
	b _0802C18C
_0802C18A:
	movs r0, #0
_0802C18C:
	pop {r1}
	bx r1

	thumb_func_start sub_802C190
sub_802C190: @ 0x0802C190
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802C1A8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8031AC0
	adds r1, r0, #0
	cmp r1, #0
	bne _0802C1BA
	b _0802C1C2
	.align 2, 0
_0802C1A8: .4byte gPlaySt
_0802C1AC:
	adds r0, r1, #0
	b _0802C1C4
_0802C1B0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	beq _0802C1AC
	adds r1, #0xc
_0802C1BA:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802C1B0
_0802C1C2:
	movs r0, #0
_0802C1C4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetMapChangeIdAt
GetMapChangeIdAt: @ 0x0802C1CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _0802C1EC @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8031AC0
	adds r1, r0, #0
	cmp r1, #0
	beq _0802C21E
	b _0802C216
	.align 2, 0
_0802C1EC: .4byte gPlaySt
_0802C1F0:
	ldrb r0, [r1, #1]
	cmp r5, r0
	blt _0802C214
	ldrb r2, [r1, #2]
	cmp r4, r2
	blt _0802C214
	ldrb r3, [r1, #3]
	adds r0, r3, r0
	subs r0, #1
	cmp r0, r5
	blt _0802C214
	ldrb r3, [r1, #4]
	adds r0, r3, r2
	subs r0, #1
	cmp r0, r4
	blt _0802C214
	movs r6, #0
	ldrsb r6, [r1, r6]
_0802C214:
	adds r1, #0xc
_0802C216:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802C1F0
_0802C21E:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ApplyMapChange
ApplyMapChange: @ 0x0802C228
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	bl sub_802C190
	adds r3, r0, #0
	ldr r4, [r3, #8]
	ldrb r0, [r3, #4]
	cmp r6, r0
	bge _0802C282
	ldr r7, _0802C290 @ =gUnk_08C02570
	mov r8, r7
_0802C244:
	movs r5, #0
	adds r0, r6, #1
	mov sb, r0
	ldrb r7, [r3, #3]
	cmp r5, r7
	bge _0802C27A
	mov ip, r8
_0802C252:
	ldrh r2, [r4]
	cmp r2, #0
	beq _0802C270
	ldrb r0, [r3, #2]
	adds r1, r0, r6
	mov r7, ip
	ldr r0, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r7, [r3, #1]
	adds r0, r7, r5
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r2, [r0]
_0802C270:
	adds r4, #2
	adds r5, #1
	ldrb r0, [r3, #3]
	cmp r5, r0
	blt _0802C252
_0802C27A:
	mov r6, sb
	ldrb r7, [r3, #4]
	cmp r6, r7
	blt _0802C244
_0802C282:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C290: .4byte gUnk_08C02570

	thumb_func_start AddMapChangeTrap
AddMapChangeTrap: @ 0x0802C294
	push {lr}
	adds r3, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #3
	bl sub_802BF8C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C2A8
sub_802C2A8: @ 0x0802C2A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C2B0 @ =0x0203A514
	b _0802C2C6
	.align 2, 0
_0802C2B0: .4byte 0x0203A514
_0802C2B4:
	cmp r0, #3
	bne _0802C2C4
	ldrb r0, [r4, #3]
	cmp r0, r5
	bne _0802C2C4
	adds r0, r4, #0
	bl sub_802BFD0
_0802C2C4:
	adds r4, #8
_0802C2C6:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C2B4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitHideIfUnderRoof
UnitHideIfUnderRoof: @ 0x0802C2D4
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802C2FC @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0802C2F8
	ldr r0, [r2, #0xc]
	movs r1, #0x81
	orrs r0, r1
	str r0, [r2, #0xc]
_0802C2F8:
	bx lr
	.align 2, 0
_0802C2FC: .4byte gBmMapTerrain

	thumb_func_start sub_802C300
sub_802C300: @ 0x0802C300
	push {r4, r5, lr}
	movs r5, #1
_0802C304:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802C348
	ldr r0, [r4]
	cmp r0, #0
	beq _0802C348
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0802C348
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0802C35C @ =gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _0802C348
	movs r0, #0x82
	rsbs r0, r0, #0
	ands r3, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r3, r0
	str r3, [r4, #0xc]
_0802C348:
	adds r5, #1
	cmp r5, #0xbf
	ble _0802C304
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C35C: .4byte gBmMapTerrain

	thumb_func_start sub_802C360
sub_802C360: @ 0x0802C360
	push {r4, lr}
	adds r3, r2, #0
	ldr r2, _0802C37C @ =gBmMapUnit
	ldr r4, [r2]
	lsls r2, r1, #2
	adds r2, r2, r4
	ldr r2, [r2]
	adds r2, r2, r0
	ldrb r2, [r2]
	bl EnlistTarget
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C37C: .4byte gBmMapUnit

	thumb_func_start sub_802C380
sub_802C380: @ 0x0802C380
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	movs r4, #0
	b _0802C3AA
_0802C38A:
	ldr r0, _0802C3BC @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802C3A8
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl EnlistTarget
_0802C3A8:
	adds r4, #1
_0802C3AA:
	ldr r0, _0802C3C0 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r4, r0
	blt _0802C38A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C3BC: .4byte gBmMapUnit
_0802C3C0: .4byte gBmMapSize

	thumb_func_start sub_802C3C4
sub_802C3C4: @ 0x0802C3C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	movs r0, #0
	mov sb, r0
	movs r7, #0
	cmp r3, #1
	beq _0802C406
	cmp r3, #1
	bgt _0802C3E6
	cmp r3, #0
	beq _0802C400
	b _0802C40A
_0802C3E6:
	cmp r3, #2
	beq _0802C3F8
	cmp r3, #3
	bne _0802C40A
	movs r0, #0
	mov sb, r0
	movs r7, #1
	rsbs r7, r7, #0
	b _0802C40A
_0802C3F8:
	movs r0, #0
	mov sb, r0
	movs r7, #1
	b _0802C40A
_0802C400:
	movs r0, #1
	rsbs r0, r0, #0
	b _0802C408
_0802C406:
	movs r0, #1
_0802C408:
	mov sb, r0
_0802C40A:
	movs r6, #2
_0802C40C:
	add r5, sb
	adds r4, r4, r7
	ldr r0, _0802C440 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802C42E
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	mov r3, r8
	bl EnlistTarget
_0802C42E:
	subs r6, #1
	cmp r6, #0
	bge _0802C40C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C440: .4byte gBmMapUnit

	thumb_func_start sub_802C444
sub_802C444: @ 0x0802C444
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r4, #0
	movs r5, #1
	cmp r2, #1
	beq _0802C47A
	cmp r2, #1
	bgt _0802C45E
	cmp r2, #0
	beq _0802C474
	b _0802C47C
_0802C45E:
	cmp r2, #2
	beq _0802C46E
	cmp r2, #3
	bne _0802C47C
	movs r7, #0
	movs r4, #1
	rsbs r4, r4, #0
	b _0802C47C
_0802C46E:
	movs r7, #0
	movs r4, #1
	b _0802C47C
_0802C474:
	movs r7, #1
	rsbs r7, r7, #0
	b _0802C47C
_0802C47A:
	movs r7, #1
_0802C47C:
	ldr r0, _0802C4A8 @ =gBmMapUnit
	ldr r1, [r0]
	movs r2, #2
	lsls r0, r6, #2
	adds r1, r0, r1
	lsls r4, r4, #2
_0802C488:
	adds r3, r3, r7
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C498
	movs r5, #0
_0802C498:
	subs r2, #1
	cmp r2, #0
	bge _0802C488
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802C4A8: .4byte gBmMapUnit

	thumb_func_start sub_802C4AC
sub_802C4AC: @ 0x0802C4AC
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r4, _0802C4BC @ =0x0203A514
	b _0802C50A
	.align 2, 0
_0802C4BC: .4byte 0x0203A514
_0802C4C0:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802C508
	ldrb r0, [r4, #2]
	cmp r0, #5
	beq _0802C4FA
	cmp r0, #5
	bgt _0802C4D8
	cmp r0, #4
	beq _0802C4DE
	b _0802C508
_0802C4D8:
	cmp r0, #7
	beq _0802C4EC
	b _0802C508
_0802C4DE:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl sub_802C360
	b _0802C508
_0802C4EC:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl sub_802C380
	b _0802C508
_0802C4FA:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl sub_802C3C4
_0802C508:
	adds r4, #8
_0802C50A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C4C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802C518
sub_802C518: @ 0x0802C518
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r4, _0802C528 @ =0x0203A514
	b _0802C608
	.align 2, 0
_0802C528: .4byte 0x0203A514
_0802C52C:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802C606
	ldrb r3, [r4, #2]
	cmp r3, #5
	beq _0802C584
	cmp r3, #5
	bgt _0802C544
	cmp r3, #4
	beq _0802C54E
	b _0802C606
_0802C544:
	cmp r3, #6
	beq _0802C5EE
	cmp r3, #7
	beq _0802C5D4
	b _0802C606
_0802C54E:
	ldrb r2, [r4, #1]
	ldr r0, _0802C580 @ =gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C606
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	movs r3, #4
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl sub_802C360
	b _0802C606
	.align 2, 0
_0802C580: .4byte gBmMapUnit
_0802C584:
	ldrb r2, [r4, #3]
	cmp r2, #1
	beq _0802C5A8
	cmp r2, #1
	bgt _0802C594
	cmp r2, #0
	beq _0802C5A4
	b _0802C5AA
_0802C594:
	cmp r2, #2
	beq _0802C5A0
	cmp r2, #3
	bne _0802C5AA
	movs r5, #0x64
	b _0802C5AA
_0802C5A0:
	movs r5, #0x65
	b _0802C5AA
_0802C5A4:
	movs r5, #0x66
	b _0802C5AA
_0802C5A8:
	movs r5, #0x67
_0802C5AA:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_802C444
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C606
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	adds r3, r5, #0
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl sub_802C3C4
	b _0802C606
_0802C5D4:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	movs r3, #7
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl sub_802C380
	b _0802C606
_0802C5EE:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802C5F8
	ldrb r0, [r4]
	b _0802C5FA
_0802C5F8:
	ldrb r0, [r4, #1]
_0802C5FA:
	ldr r1, _0802C614 @ =0x0203A514
	subs r1, r4, r1
	asrs r1, r1, #3
	movs r2, #0
	bl EnlistTarget
_0802C606:
	adds r4, #8
_0802C608:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C52C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C614: .4byte 0x0203A514

	thumb_func_start sub_802C618
sub_802C618: @ 0x0802C618
	ldr r1, _0802C61C @ =0x0203A514
	b _0802C632
	.align 2, 0
_0802C61C: .4byte 0x0203A514
_0802C620:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802C630
	cmp r0, #4
	blt _0802C630
	ldrb r0, [r1, #6]
	subs r0, #1
	strb r0, [r1, #6]
_0802C630:
	adds r1, #8
_0802C632:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802C620
	bx lr
	.align 2, 0

	thumb_func_start sub_802C63C
sub_802C63C: @ 0x0802C63C
	ldr r1, _0802C640 @ =0x0203A514
	b _0802C65C
	.align 2, 0
_0802C640: .4byte 0x0203A514
_0802C644:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802C65A
	cmp r0, #4
	blt _0802C65A
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802C65A
	ldrb r0, [r1, #5]
	strb r0, [r1, #6]
_0802C65A:
	adds r1, #8
_0802C65C:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802C644
	bx lr

	thumb_func_start sub_802C664
sub_802C664: @ 0x0802C664
	push {r4, r5, lr}
	ldr r4, _0802C67C @ =gPlaySt
	ldrb r5, [r4, #0xf]
	movs r0, #0x80
	strb r0, [r4, #0xf]
	bl RefreshEntityMaps
	strb r5, [r4, #0xf]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C67C: .4byte gPlaySt

	thumb_func_start sub_802C680
sub_802C680: @ 0x0802C680
	push {lr}
	movs r0, #3
	bl sub_8024F14
	pop {r0}
	bx r0

	thumb_func_start sub_802C68C
sub_802C68C: @ 0x0802C68C
	push {lr}
	movs r0, #0x65
	bl CheckChapterFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C6A0
	ldr r0, _0802C6A4 @ =gUnk_08D6F71C
	bl sub_800AE98
_0802C6A0:
	pop {r0}
	bx r0
	.align 2, 0
_0802C6A4: .4byte gUnk_08D6F71C

	thumb_func_start sub_802C6A8
sub_802C6A8: @ 0x0802C6A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0802C6D8 @ =gBmMapTerrain
	ldr r0, [r6]
	lsls r4, r1, #2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc
	bl sub_802BF8C
	movs r2, #0
	movs r1, #3
	strb r1, [r0, #6]
	ldr r0, [r6]
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	strb r2, [r0]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802C6D8: .4byte gBmMapTerrain

	thumb_func_start sub_802C6DC
sub_802C6DC: @ 0x0802C6DC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_80197A4
	ldr r1, _0802C708 @ =gBmMapTerrain
	ldr r2, [r1]
	ldrb r3, [r4, #1]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldrb r2, [r4]
	adds r1, r2, r1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_802BFD0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802C708: .4byte gBmMapTerrain

	thumb_func_start sub_802C70C
sub_802C70C: @ 0x0802C70C
	push {r4, lr}
	ldr r4, _0802C714 @ =0x0203A514
	b _0802C74E
	.align 2, 0
_0802C714: .4byte 0x0203A514
_0802C718:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	beq _0802C724
	cmp r0, #0xc
	beq _0802C738
	b _0802C74C
_0802C724:
	ldrb r0, [r4, #3]
	subs r0, #1
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C74C
	adds r0, r4, #0
	bl sub_802BFD0
	b _0802C74A
_0802C738:
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C74C
	adds r0, r4, #0
	bl sub_802C6DC
_0802C74A:
	subs r4, #8
_0802C74C:
	adds r4, #8
_0802C74E:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C718
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DisableAllLightRunes
DisableAllLightRunes: @ 0x0802C75C
	push {r4, lr}
	ldr r4, _0802C764 @ =0x0203A514
	b _0802C78A
	.align 2, 0
_0802C764: .4byte 0x0203A514
_0802C768:
	ldrb r0, [r4, #2]
	cmp r0, #0xc
	bne _0802C788
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_80197A4
	ldr r1, _0802C798 @ =gBmMapTerrain
	ldr r2, [r1]
	ldrb r3, [r4, #1]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldrb r2, [r4]
	adds r1, r2, r1
	strb r0, [r1]
_0802C788:
	adds r4, #8
_0802C78A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C768
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C798: .4byte gBmMapTerrain

	thumb_func_start EnableAllLightRunes
EnableAllLightRunes: @ 0x0802C79C
	push {r4, r5, lr}
	ldr r2, _0802C7D0 @ =0x0203A514
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802C7C8
	ldr r4, _0802C7D4 @ =gBmMapTerrain
	movs r3, #0
_0802C7AA:
	ldrb r0, [r2, #2]
	cmp r0, #0xc
	bne _0802C7C0
	ldr r0, [r4]
	ldrb r5, [r2, #1]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldrb r1, [r2]
	adds r0, r1, r0
	strb r3, [r0]
_0802C7C0:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802C7AA
_0802C7C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C7D0: .4byte 0x0203A514
_0802C7D4: .4byte gBmMapTerrain

	thumb_func_start GetTrap
GetTrap: @ 0x0802C7D8
	lsls r0, r0, #3
	ldr r1, _0802C7E0 @ =0x0203A514
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802C7E0: .4byte 0x0203A514
