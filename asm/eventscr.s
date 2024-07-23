	.include "macro.inc"

	.syntax unified

	thumb_func_start EventStartTalk
EventStartTalk: @ 0x0800B848
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _0800B85E
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
_0800B85E:
	adds r3, r5, #0
	adds r3, #0x68
	movs r0, #0xff
	strb r0, [r3]
	adds r4, r5, #0
	adds r4, #0x5e
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B890
	ldr r2, _0800B8C4 @ =gPlaySt
	adds r2, #0x40
	ldrb r1, [r2]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1e
	strb r0, [r3]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
_0800B890:
	movs r0, #1
	movs r1, #1
	adds r2, r6, #0
	bl StartTalkMsg
	movs r0, #0x80
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B8AA
	movs r0, #4
	bl SetTalkFlag
_0800B8AA:
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0800B8BA
	movs r0, #8
	bl SetTalkFlag
_0800B8BA:
	ldr r0, _0800B8C8 @ =EventEndTalk
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B8C4: .4byte gPlaySt
_0800B8C8: .4byte EventEndTalk

	thumb_func_start sub_800B8CC
sub_800B8CC: @ 0x0800B8CC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B8F4 @ =0x0000FFFD
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B8F8
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800B8FA
	.align 2, 0
_0800B8F4: .4byte 0x0000FFFD
_0800B8F8:
	movs r0, #0
_0800B8FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800B900
sub_800B900: @ 0x0800B900
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B930 @ =0x0000FFFD
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B934
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetTalkFlag
	movs r0, #2
	b _0800B936
	.align 2, 0
_0800B930: .4byte 0x0000FFFD
_0800B934:
	movs r0, #0
_0800B936:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800B93C
sub_800B93C: @ 0x0800B93C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800B958 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800B95C
	movs r0, #0
	b _0800B98E
	.align 2, 0
_0800B958: .4byte 0x0000FFFD
_0800B95C:
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r0, _0800B97C @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800B980
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800B98C
	.align 2, 0
_0800B97C: .4byte gPlaySt
_0800B980:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800B98C:
	movs r0, #2
_0800B98E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800B994
sub_800B994: @ 0x0800B994
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B9B2
	ldr r0, [r2, #0x30]
	ldr r0, [r0, #4]
	bl sub_8007F38
	movs r0, #2
	b _0800B9B4
_0800B9B2:
	movs r0, #0
_0800B9B4:
	pop {r1}
	bx r1

	thumb_func_start sub_800B9B8
sub_800B9B8: @ 0x0800B9B8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B9E0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800B9E0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	movs r0, #2
	b _0800B9E2
_0800B9E0:
	movs r0, #0
_0800B9E2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800B9E8
sub_800B9E8: @ 0x0800B9E8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BA00
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BA04
_0800BA00:
	movs r0, #0
	b _0800BA2E
_0800BA04:
	ldr r0, _0800BA1C @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800BA20
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BA2C
	.align 2, 0
_0800BA1C: .4byte gPlaySt
_0800BA20:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #8]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
_0800BA2C:
	movs r0, #2
_0800BA2E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800BA34
sub_800BA34: @ 0x0800BA34
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BA54
	ldr r1, [r2, #0x48]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800BA56
_0800BA54:
	movs r0, #0
_0800BA56:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Event14_TalkContinue
Event14_TalkContinue: @ 0x0800BA5C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BA80
	bl ResumeTalk
	ldr r0, _0800BA7C @ =EventEndTalk
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800BA86
	.align 2, 0
_0800BA7C: .4byte EventEndTalk
_0800BA80:
	bl EndTalk
	movs r0, #0
_0800BA86:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800BA8C
sub_800BA8C: @ 0x0800BA8C
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800BAC4 @ =0x0000FFFD
	ldrh r4, [r1]
	ands r0, r4
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BACC
	ldr r0, _0800BAC8 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800BACE
	.align 2, 0
_0800BAC4: .4byte 0x0000FFFD
_0800BAC8: .4byte gActiveUnit
_0800BACC:
	movs r0, #0
_0800BACE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800BAD4
sub_800BAD4: @ 0x0800BAD4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BAF4 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BAF8
	movs r0, #0
	b _0800BB5E
	.align 2, 0
_0800BAF4: .4byte 0x0000FFFD
_0800BAF8:
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #4
	bhi _0800BB3C
	lsls r0, r0, #2
	ldr r1, _0800BB0C @ =_0800BB10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BB0C: .4byte _0800BB10
_0800BB10: @ jump table
	.4byte _0800BB24 @ case 0
	.4byte _0800BB2A @ case 1
	.4byte _0800BB30 @ case 2
	.4byte _0800BB36 @ case 3
	.4byte _0800BB3C @ case 4
_0800BB24:
	bl sub_80B7100
	b _0800BB40
_0800BB2A:
	bl sub_80B71F8
	b _0800BB40
_0800BB30:
	bl sub_80B7230
	b _0800BB40
_0800BB36:
	bl sub_80B7328
	b _0800BB40
_0800BB3C:
	bl sub_80B735C
_0800BB40:
	movs r1, #0
	cmp r0, #2
	bgt _0800BB4E
	movs r1, #1
	cmp r0, #1
	bgt _0800BB4E
	movs r1, #2
_0800BB4E:
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
_0800BB5E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800BB64
sub_800BB64: @ 0x0800BB64
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BB80 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BB84
	movs r0, #0
	b _0800BBAA
	.align 2, 0
_0800BB80: .4byte 0x0000FFFD
_0800BB84:
	bl sub_807AE3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BB9C
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BBA8
_0800BB9C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BBA8:
	movs r0, #2
_0800BBAA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800BBB0
sub_800BBB0: @ 0x0800BBB0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BBC8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BBCC
_0800BBC8:
	movs r0, #0
	b _0800BBF2
_0800BBCC:
	bl sub_807AE3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BBE4
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BBF0
_0800BBE4:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
_0800BBF0:
	movs r0, #2
_0800BBF2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800BBF8
sub_800BBF8: @ 0x0800BBF8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BC14 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BC18
	movs r0, #0
	b _0800BC42
	.align 2, 0
_0800BC14: .4byte 0x0000FFFD
_0800BC18:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BC34
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BC40
_0800BC34:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BC40:
	movs r0, #2
_0800BC42:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800BC48
sub_800BC48: @ 0x0800BC48
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BC64 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BC68
	movs r0, #0
	b _0800BC92
	.align 2, 0
_0800BC64: .4byte 0x0000FFFD
_0800BC68:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BC84
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BC90
_0800BC84:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BC90:
	movs r0, #2
_0800BC92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800BC98
sub_800BC98: @ 0x0800BC98
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BCB0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BCB4
_0800BCB0:
	movs r0, #0
	b _0800BCDE
_0800BCB4:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BCD0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BCDC
_0800BCD0:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
_0800BCDC:
	movs r0, #2
_0800BCDE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800BCE4
sub_800BCE4: @ 0x0800BCE4
	push {lr}
	bl sub_80095E4
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EventEndTalk
EventEndTalk: @ 0x0800BCF0 FE8U: Event1D_TEXTEND
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0800BD3C
	bl EndTalk
	adds r3, r4, #0
	adds r3, #0x68
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BD30
	ldr r2, _0800BD38 @ =gPlaySt
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0800BD30:
	movs r0, #0
	str r0, [r4, #0x40]
	b _0800BD78
	.align 2, 0
_0800BD38: .4byte gPlaySt
_0800BD3C:
	bl IsTalkActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD50
	bl IsTalkLocked
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD78
_0800BD50:
	adds r3, r4, #0
	adds r3, #0x68
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BD76
	ldr r2, _0800BD80 @ =gPlaySt
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0800BD76:
	str r5, [r4, #0x40]
_0800BD78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD80: .4byte gPlaySt

	thumb_func_start Event20
Event20: @ 0x0800BD84
	push {r4, r5, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	movs r0, #0xff
	ldrh r4, [r1, #2]
	ands r4, r0
	ldrb r5, [r1, #3]
	ands r5, r0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BDB2
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BDE0
_0800BDB2:
	add r3, sp, #4
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl StoreAdjustedCameraPositions
	ldr r1, _0800BDDC @ =gBmSt
	ldr r0, [sp]
	lsls r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	bl RenderMap
	movs r0, #0
	b _0800BDF4
	.align 2, 0
_0800BDDC: .4byte gBmSt
_0800BDE0:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoCenteredPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	movs r0, #2
_0800BDF4:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800BDFC
sub_800BDFC: @ 0x0800BDFC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	movs r0, #0xff
	ldrh r4, [r1, #2]
	ands r4, r0
	ldrb r5, [r1, #3]
	ands r5, r0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BE28
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BE50
_0800BE28:
	adds r6, r4, #0
	lsls r0, r6, #4
	bl GetCameraAdjustedX
	ldr r4, _0800BE4C @ =gBmSt
	strh r0, [r4, #0xc]
	lsls r0, r5, #4
	bl GetCameraAdjustedY
	strh r0, [r4, #0xe]
	adds r0, r6, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	bl RenderMap
	movs r0, #0
	b _0800BE64
	.align 2, 0
_0800BE4C: .4byte gBmSt
_0800BE50:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	movs r0, #2
_0800BE64:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800BE6C
sub_800BE6C: @ 0x0800BE6C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldrh r0, [r0, #2]
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BE96
	adds r0, r6, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BEC4
_0800BE96:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl GetCameraAdjustedX
	ldr r4, _0800BEE8 @ =gBmSt
	strh r0, [r4, #0xc]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl GetCameraAdjustedY
	strh r0, [r4, #0xe]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl SetMapCursorPosition
	bl RenderMap
	bl RenderMap
_0800BEC4:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r6, #0
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl SetMapCursorPosition
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800BEE8: .4byte gBmSt

	thumb_func_start sub_800BEEC
sub_800BEEC: @ 0x0800BEEC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800BF1C
sub_800BF1C: @ 0x0800BF1C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800BF4C
	ldr r0, _0800BF5C @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _0800BF60
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BF60
_0800BF4C:
	bl CanStartMu
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BF60
	movs r0, #1
	b _0800BF62
	.align 2, 0
_0800BF5C: .4byte ProcScr_CamMove
_0800BF60:
	movs r0, #0
_0800BF62:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_800BF68
sub_800BF68: @ 0x0800BF68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800BF94
	ldr r0, _0800BF90 @ =0x0000FFFF
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _0800BF9A
	.align 2, 0
_0800BF90: .4byte 0x0000FFFF
_0800BF94:
	movs r4, #1
	rsbs r4, r4, #0
	mov r8, r4
_0800BF9A:
	ldr r1, [r5, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r4, #1
	rsbs r4, r4, #0
	mov sl, r4
	cmp r0, #0
	bne _0800BFB2
	mov sl, r2
_0800BFB2:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800BFC8
	ldr r7, _0800BFC4 @ =0x0000FFFF
	ands r7, r2
	b _0800BFCC
	.align 2, 0
_0800BFC4: .4byte 0x0000FFFF
_0800BFC8:
	movs r7, #1
	rsbs r7, r7, #0
_0800BFCC:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, #0
	bne _0800BFE0
	mov sb, r1
_0800BFE0:
	ldr r0, _0800BFFC @ =gBmMapUnit
	ldr r1, [r0]
	mov r4, sl
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C000
	movs r0, #0
	b _0800C05A
	.align 2, 0
_0800BFFC: .4byte gBmMapUnit
_0800C000:
	ldrb r0, [r1]
	bl GetUnit
	adds r6, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C022
	adds r0, r5, #0
	adds r0, #0x4d
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq _0800C036
_0800C022:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sb
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C05A
_0800C036:
	adds r0, r5, #0
	mov r1, r8
	mov r2, sl
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C058
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, sb
	bl sub_800CA84
	movs r0, #0
	b _0800C05A
_0800C058:
	movs r0, #3
_0800C05A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C06C
sub_800C06C: @ 0x0800C06C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C094
	ldr r7, _0800C090 @ =0x0000FFFF
	ands r7, r1
	b _0800C098
	.align 2, 0
_0800C090: .4byte 0x0000FFFF
_0800C094:
	movs r7, #1
	rsbs r7, r7, #0
_0800C098:
	ldr r1, [r4, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	mov sb, r5
	cmp r0, #0
	bne _0800C0B0
	mov sb, r2
_0800C0B0:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800C0C4
	ldr r6, _0800C0C0 @ =0x0000FFFF
	ands r6, r2
	b _0800C0C8
	.align 2, 0
_0800C0C0: .4byte 0x0000FFFF
_0800C0C4:
	movs r6, #1
	rsbs r6, r6, #0
_0800C0C8:
	ldrh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	cmp r0, #0
	bne _0800C0DC
	mov r8, r2
_0800C0DC:
	ldrh r1, [r1, #0xc]
	mov sl, r1
	ldr r0, _0800C0F8 @ =gBmMapUnit
	ldr r1, [r0]
	mov r5, sb
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C0FC
	movs r0, #0
	b _0800C15A
	.align 2, 0
_0800C0F8: .4byte gBmMapUnit
_0800C0FC:
	ldrb r0, [r1]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C120
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C134
_0800C120:
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C15A
_0800C134:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C158
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_800CA84
	movs r0, #0
	b _0800C15A
_0800C158:
	movs r0, #3
_0800C15A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C16C
sub_800C16C: @ 0x0800C16C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C198
	ldr r7, _0800C194 @ =0x0000FFFF
	ands r7, r1
	b _0800C19C
	.align 2, 0
_0800C194: .4byte 0x0000FFFF
_0800C198:
	movs r7, #1
	rsbs r7, r7, #0
_0800C19C:
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	cmp r0, #0
	bne _0800C1B2
	mov r8, r1
_0800C1B2:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C1CC
	adds r0, r4, #0
	adds r0, #0x4d
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0800C1E0
_0800C1CC:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C208
_0800C1E0:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C206
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_800CA84
	movs r0, #0
	b _0800C208
_0800C206:
	movs r0, #3
_0800C208:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C214
sub_800C214: @ 0x0800C214
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C240
	ldr r6, _0800C23C @ =0x0000FFFF
	ands r6, r1
	b _0800C244
	.align 2, 0
_0800C23C: .4byte 0x0000FFFF
_0800C240:
	movs r6, #1
	rsbs r6, r6, #0
_0800C244:
	ldr r2, [r4, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800C258
	adds r7, r1, #0
_0800C258:
	ldrh r2, [r2, #0xc]
	mov r8, r2
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C278
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C28C
_0800C278:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C2B6
_0800C28C:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C2B4
	mov r0, r8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_800CA84
	movs r0, #0
	b _0800C2B6
_0800C2B4:
	movs r0, #3
_0800C2B6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C2C4
sub_800C2C4: @ 0x0800C2C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r7, #0x30]
	ldr r1, [r0, #8]
	ldrh r0, [r0, #0xc]
	mov r8, r0
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	cmp r1, #1
	beq _0800C304
	cmp r1, #1
	bgt _0800C2F6
	cmp r1, #0
	beq _0800C300
	b _0800C30E
_0800C2F6:
	cmp r1, #2
	beq _0800C308
	cmp r1, #3
	beq _0800C30C
	b _0800C30E
_0800C300:
	subs r5, #1
	b _0800C30E
_0800C304:
	adds r5, #1
	b _0800C30E
_0800C308:
	subs r4, #1
	b _0800C30E
_0800C30C:
	adds r4, #1
_0800C30E:
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C32A
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C33E
_0800C32A:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C368
_0800C33E:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r7, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C366
	mov r0, r8
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800CA84
	movs r0, #0
	b _0800C368
_0800C366:
	movs r0, #3
_0800C368:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C374
sub_800C374: @ 0x0800C374
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C3A4
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C3CE
_0800C3A4:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	add r1, sp, #4
	mov r0, sp
	adds r2, r6, #0
	bl ApplyMoveScriptToCoordinates
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C3F4
_0800C3CE:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C3F2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800CB6C
	movs r0, #0
	b _0800C3F4
_0800C3F2:
	movs r0, #3
_0800C3F4:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_800C3FC
sub_800C3FC: @ 0x0800C3FC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C41C
	ldr r0, _0800C418 @ =0x0000FFFF
	ands r1, r0
	str r1, [sp]
	b _0800C422
	.align 2, 0
_0800C418: .4byte 0x0000FFFF
_0800C41C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
_0800C422:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C434
	str r3, [sp, #4]
	b _0800C43A
_0800C434:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C43A:
	ldr r6, [r1, #8]
	ldr r0, _0800C490 @ =gBmMapUnit
	ldr r1, [r0]
	ldr r0, [sp, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C470
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C494
_0800C470:
	add r1, sp, #4
	mov r0, sp
	adds r2, r6, #0
	bl ApplyMoveScriptToCoordinates
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C4B6
	.align 2, 0
_0800C490: .4byte gBmMapUnit
_0800C494:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C4B4
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800CB6C
	movs r0, #0
	b _0800C4B6
_0800C4B4:
	movs r0, #3
_0800C4B6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C4C0
sub_800C4C0: @ 0x0800C4C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r7, #0x10
	ldrsb r7, [r4, r7]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C504
	adds r0, r5, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800C518
_0800C504:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C540
_0800C518:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C53E
	str r6, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_800CA84
	movs r0, #0
	b _0800C540
_0800C53E:
	movs r0, #3
_0800C540:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C54C
sub_800C54C: @ 0x0800C54C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C578
	ldr r7, _0800C574 @ =0x0000FFFF
	ands r7, r1
	b _0800C57C
	.align 2, 0
_0800C574: .4byte 0x0000FFFF
_0800C578:
	movs r7, #1
	rsbs r7, r7, #0
_0800C57C:
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	cmp r0, #0
	bne _0800C592
	mov r8, r1
_0800C592:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C5AC
	adds r0, r4, #0
	adds r0, #0x4d
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0800C5C0
_0800C5AC:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C5E8
_0800C5C0:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C5E6
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_800CA84
	movs r0, #0
	b _0800C5E8
_0800C5E6:
	movs r0, #3
_0800C5E8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C5F4
sub_800C5F4: @ 0x0800C5F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl sub_807A7B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x30]
	ldr r6, _0800C630 @ =0x0000FFFF
	ldrh r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C634
	ands r1, r6
	str r1, [sp, #4]
	b _0800C63A
	.align 2, 0
_0800C630: .4byte 0x0000FFFF
_0800C634:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C63A:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C64C
	str r3, [sp, #8]
	b _0800C652
_0800C64C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
_0800C652:
	ldrh r0, [r1, #6]
	mov sb, r0
	ldr r7, [r1, #0xc]
	mov r1, r8
	lsls r0, r1, #0x18
	adds r6, r0, #0
	cmp r6, #0
	beq _0800C67A
	ldr r1, [sp, #4]
	cmp r1, #0x63
	beq _0800C6FC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _0800C67A
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #8]
	cmp r0, r1
	beq _0800C6FC
_0800C67A:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C696
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C6C2
_0800C696:
	cmp r6, #0
	bne _0800C6B0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #8]
	add r1, sp, #8
	add r0, sp, #4
	adds r2, r7, #0
	bl ApplyMoveScriptToCoordinates
_0800C6B0:
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C9F8
	bl RefreshUnitSprites
	b _0800C6FC
_0800C6C2:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C6DA
	movs r0, #3
	b _0800C6FE
_0800C6DA:
	cmp r6, #0
	beq _0800C6F0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_800CA84
	b _0800C6FC
_0800C6F0:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CB6C
_0800C6FC:
	movs r0, #0
_0800C6FE:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C70C
sub_800C70C: @ 0x0800C70C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl sub_807A7B4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	mov r8, r1
	ldr r7, [r0, #0xc]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C750
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C788
_0800C750:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	cmp r6, #0
	bne _0800C76C
	add r1, sp, #4
	mov r0, sp
	adds r2, r7, #0
	bl ApplyMoveScriptToCoordinates
	b _0800C776
_0800C76C:
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl ApplyMoveScriptToCoordinates
_0800C776:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C9F8
	bl RefreshUnitSprites
	b _0800C7BE
_0800C788:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C7A0
	movs r0, #3
	b _0800C7C0
_0800C7A0:
	cmp r6, #0
	beq _0800C7B2
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	movs r3, #0
	bl sub_800CB6C
	b _0800C7BE
_0800C7B2:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CB6C
_0800C7BE:
	movs r0, #0
_0800C7C0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C7CC
sub_800C7CC: @ 0x0800C7CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C7EC
	ldr r0, _0800C7E8 @ =gBmMapUnit
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	b _0800C7F2
	.align 2, 0
_0800C7E8: .4byte gBmMapUnit
_0800C7EC:
	ldr r0, _0800C80C @ =gBmMapUnit
	ldr r0, [r0]
	subs r0, #4
_0800C7F2:
	ldr r1, [r0]
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C814
	ldr r0, _0800C810 @ =0x0000FFFF
	ands r2, r0
	adds r0, r1, r2
	b _0800C816
	.align 2, 0
_0800C80C: .4byte gBmMapUnit
_0800C810: .4byte 0x0000FFFF
_0800C814:
	subs r0, r1, #1
_0800C816:
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _0800C860
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C83C
	ldr r3, _0800C838 @ =0x0000FFFF
	ands r3, r2
	b _0800C840
	.align 2, 0
_0800C838: .4byte 0x0000FFFF
_0800C83C:
	movs r3, #1
	rsbs r3, r3, #0
_0800C840:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C852
	adds r2, r1, #0
_0800C852:
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
_0800C860:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800C868
sub_800C868: @ 0x0800C868
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C890
	ldr r1, _0800C88C @ =0x0000FFFF
	ands r1, r2
	b _0800C894
	.align 2, 0
_0800C88C: .4byte 0x0000FFFF
_0800C890:
	movs r1, #1
	rsbs r1, r1, #0
_0800C894:
	ldr r0, [r4, #0x30]
	ldrh r3, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C8A8
	adds r2, r3, #0
_0800C8A8:
	adds r0, r5, #0
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800C8BC
sub_800C8BC: @ 0x0800C8BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800C8F0
	bl GetPlayerLeaderUnitId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C91C
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, _0800C8EC @ =gPlaySt
	ldrb r2, [r0, #0x1b]
	b _0800C90C
	.align 2, 0
_0800C8EC: .4byte gPlaySt
_0800C8F0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C91C
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
_0800C90C:
	ldr r0, _0800C924 @ =0x0202A5A6
	adds r0, r2, r0
	ldrb r1, [r3, #0x10]
	strb r1, [r0]
	ldr r0, _0800C928 @ =0x0202A5AA
	adds r0, r2, r0
	ldrb r1, [r3, #0x11]
	strb r1, [r0]
_0800C91C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800C924: .4byte 0x0202A5A6
_0800C928: .4byte 0x0202A5AA

	thumb_func_start sub_800C92C
sub_800C92C: @ 0x0800C92C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800C964
	bl GetPlayerLeaderUnitId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C9B8
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, _0800C960 @ =gPlaySt
	ldrb r3, [r0, #0x1b]
	b _0800C980
	.align 2, 0
_0800C960: .4byte gPlaySt
_0800C964:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C9B8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r3, [r0, #8]
_0800C980:
	ldr r0, _0800C9BC @ =0x0202A5A6
	adds r0, r3, r0
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _0800C9C0 @ =0x0202A5AA
	adds r0, r3, r0
	ldrb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C9A8
	adds r0, r4, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800C9C4
_0800C9A8:
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #1
	bl sub_800C9F8
	bl RefreshUnitSprites
_0800C9B8:
	movs r0, #0
	b _0800C9EA
	.align 2, 0
_0800C9BC: .4byte 0x0202A5A6
_0800C9C0: .4byte 0x0202A5AA
_0800C9C4:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C9E8
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_800CA84
	b _0800C9B8
_0800C9E8:
	movs r0, #3
_0800C9EA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C9F8
sub_800C9F8: @ 0x0800C9F8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	cmp r5, #0xff
	bne _0800CA0C
	movs r5, #1
	rsbs r5, r5, #0
_0800CA0C:
	cmp r2, #0xff
	bne _0800CA14
	movs r2, #1
	rsbs r2, r2, #0
_0800CA14:
	lsls r6, r5, #0x10
	lsls r3, r2, #0x10
	lsrs r0, r6, #0x10
	orrs r0, r3
	str r0, [sp]
	ldr r0, _0800CA80 @ =gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CA50
	cmp r7, #0
	beq _0800CA50
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, r5
	bne _0800CA44
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	cmp r0, r2
	beq _0800CA50
_0800CA44:
	asrs r1, r6, #0x10
	asrs r2, r3, #0x10
	adds r0, r4, #0
	mov r3, sp
	bl sub_80373B0
_0800CA50:
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrh r0, [r0, #2]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitSyncMovement
	ldr r1, [r4, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CA78
	movs r0, #0xa
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
	bl RefreshEntityMaps
_0800CA78:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA80: .4byte gBmMapTerrain

	thumb_func_start sub_800CA84
sub_800CA84: @ 0x0800CA84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	mov sb, r0
	cmp r5, #0xff
	bne _0800CAAC
	movs r5, #1
	rsbs r5, r5, #0
_0800CAAC:
	cmp r4, #0xff
	bne _0800CAB4
	movs r4, #1
	rsbs r4, r4, #0
_0800CAB4:
	bl DisableAllLightRunes
	lsls r7, r5, #0x10
	lsls r2, r4, #0x10
	lsrs r0, r7, #0x10
	orrs r0, r2
	str r0, [sp]
	ldr r0, _0800CAE0 @ =gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r3, r0, r5
	ldrb r0, [r3]
	adds r4, r1, #0
	cmp r0, #0
	bne _0800CAE4
	movs r1, #1
	mov sb, r1
	mov r2, sb
	strb r2, [r3]
	b _0800CAF0
	.align 2, 0
_0800CAE0: .4byte gBmMapTerrain
_0800CAE4:
	asrs r1, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	mov r3, sp
	bl sub_80373B0
_0800CAF0:
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r2, [r6, #4]
	ldr r2, [r2, #0x38]
	bl GenerateExtendedMovementMapOnRange
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, sp
	movs r2, #2
	ldrsh r1, [r1, r2]
	ldr r7, _0800CB64 @ =0x02033DFC
	adds r2, r7, #0
	bl sub_801A23C
	mov r0, sb
	cmp r0, #0
	beq _0800CB28
	ldr r0, _0800CB68 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_0800CB28:
	mov r1, sl
	adds r1, #0x5e
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800CB40
	movs r0, #0x40
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800CB40:
	bl EnableAllLightRunes
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_800CB6C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CB64: .4byte 0x02033DFC
_0800CB68: .4byte gBmMapTerrain

	thumb_func_start sub_800CB6C
sub_800CB6C: @ 0x0800CB6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	adds r0, r5, #0
	bl StartMu
	adds r6, r0, #0
	adds r4, #0x5e
	movs r7, #1
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800CB9E
	adds r0, r6, #0
	bl sub_806C3D8
_0800CB9E:
	ldr r0, _0800CC1C @ =gUnk_08C00C18
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x54]
	adds r0, r5, #0
	bl HideUnitSprite
	ldr r0, [r5, #0xc]
	orrs r0, r7
	str r0, [r5, #0xc]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	str r2, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r7, _0800CC20 @ =0x0202E3F0
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl ApplyMoveScriptToCoordinates
	ldr r0, [sp]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #4]
	str r0, [r4, #0x30]
	adds r0, r6, #0
	mov r1, r8
	bl sub_806C8F0
	mov r0, sb
	cmp r0, #0
	beq _0800CBFA
	adds r0, r6, #0
	mov r1, sb
	bl sub_806DCB8
_0800CBFA:
	ldr r0, [sp, #4]
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r1, [r5, #0xb]
	strb r1, [r0]
	movs r0, #1
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CC1C: .4byte gUnk_08C00C18
_0800CC20: .4byte 0x0202E3F0

	thumb_func_start nullsub_26
nullsub_26: @ 0x0800CC24
	bx lr
	.align 2, 0

	thumb_func_start sub_800CC28
sub_800CC28: @ 0x0800CC28
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	adds r0, r4, #0
	bl sub_806C8B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800CC6E
	adds r0, r4, #0
	bl sub_806D4BC
	ldr r4, [r4, #0x2c]
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitSyncMovement
	adds r0, r4, #0
	bl ShowUnitSprite
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl Proc_Break
_0800CC6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_800CC74
sub_800CC74: @ 0x0800CC74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CCA0 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CCA8
	ldr r0, _0800CCA4 @ =sub_800CF2C
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CCB0
	.align 2, 0
_0800CCA0: .4byte 0x0202E3F0
_0800CCA4: .4byte sub_800CF2C
_0800CCA8:
	adds r0, r4, #0
	bl sub_800CF2C
	movs r0, #0
_0800CCB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CCB8
sub_800CCB8: @ 0x0800CCB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CCE4 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CCEC
	ldr r0, _0800CCE8 @ =sub_800CFA8
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CCF4
	.align 2, 0
_0800CCE4: .4byte 0x0202E3F0
_0800CCE8: .4byte sub_800CFA8
_0800CCEC:
	adds r0, r4, #0
	bl sub_800CFA8
	movs r0, #0
_0800CCF4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CCFC
sub_800CCFC: @ 0x0800CCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r1, _0800CD48 @ =0xFFFF0000
	ands r0, r1
	ldr r1, _0800CD4C @ =gPlaySt
	cmp r0, #0
	beq _0800CD18
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800CD5E
_0800CD18:
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bne _0800CD5E
	ldr r0, _0800CD50 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CD58
	ldr r0, _0800CD54 @ =sub_800CF2C
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CD60
	.align 2, 0
_0800CD48: .4byte 0xFFFF0000
_0800CD4C: .4byte gPlaySt
_0800CD50: .4byte 0x0202E3F0
_0800CD54: .4byte sub_800CF2C
_0800CD58:
	adds r0, r4, #0
	bl sub_800CF2C
_0800CD5E:
	movs r0, #0
_0800CD60:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CD68
sub_800CD68: @ 0x0800CD68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CD8C @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl sub_800D044
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CD8C: .4byte 0x0202E3F0

	thumb_func_start sub_800CD90
sub_800CD90: @ 0x0800CD90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800CDA4 @ =gPlaySt
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	beq _0800CDA8
	movs r0, #0
	b _0800CDC0
	.align 2, 0
_0800CDA4: .4byte gPlaySt
_0800CDA8:
	ldr r0, _0800CDC8 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl sub_800D044
	movs r0, #2
_0800CDC0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CDC8: .4byte 0x0202E3F0

	thumb_func_start sub_800CDCC
sub_800CDCC: @ 0x0800CDCC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CE04 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CDE8
	adds r4, #2
_0800CDE8:
	ldr r0, _0800CE08 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #1
	beq _0800CE0C
	cmp r4, #1
	ble _0800CE1E
	cmp r4, #2
	beq _0800CE12
	cmp r4, #3
	beq _0800CE18
	b _0800CE1E
	.align 2, 0
_0800CE04: .4byte gPlaySt
_0800CE08: .4byte 0x0202E3F0
_0800CE0C:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CE22
_0800CE12:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CE22
_0800CE18:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CE22
_0800CE1E:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CE22:
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0800CE4A
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CE44
	ldr r0, _0800CE40 @ =sub_800CF2C
	str r0, [r5, #0x40]
	movs r0, #2
	b _0800CE4C
	.align 2, 0
_0800CE40: .4byte sub_800CF2C
_0800CE44:
	adds r0, r5, #0
	bl sub_800CF2C
_0800CE4A:
	movs r0, #0
_0800CE4C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CE54
sub_800CE54: @ 0x0800CE54
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CE8C @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CE70
	adds r4, #2
_0800CE70:
	ldr r0, _0800CE90 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #1
	beq _0800CE94
	cmp r4, #1
	ble _0800CEA6
	cmp r4, #2
	beq _0800CE9A
	cmp r4, #3
	beq _0800CEA0
	b _0800CEA6
	.align 2, 0
_0800CE8C: .4byte gPlaySt
_0800CE90: .4byte 0x0202E3F0
_0800CE94:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CEAA
_0800CE9A:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CEAA
_0800CEA0:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CEAA
_0800CEA6:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CEAA:
	str r0, [r5, #0x44]
	adds r0, r5, #0
	bl sub_800D044
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CEBC
sub_800CEBC: @ 0x0800CEBC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x3f
	bgt _0800CEEA
_0800CEC4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800CEE4
	ldr r0, [r1]
	cmp r0, #0
	beq _0800CEE4
	ldr r0, [r1, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800CEE4
	adds r0, r4, #0
	b _0800CEEC
_0800CEE4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800CEC4
_0800CEEA:
	movs r0, #0
_0800CEEC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CEF4
sub_800CEF4: @ 0x0800CEF4
	adds r2, r0, #0
	ldr r0, _0800CF20 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r2, #4]
	ands r1, r3
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r1, r0
	bne _0800CF28
	ldr r0, _0800CF24 @ =gBmMapUnit
	ldr r1, [r0]
	ldrb r3, [r2, #5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r2, [r2, #4]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CF28
	movs r0, #1
	b _0800CF2A
	.align 2, 0
_0800CF20: .4byte 0x0000FFFF
_0800CF24: .4byte gBmMapUnit
_0800CF28:
	movs r0, #0
_0800CF2A:
	bx lr

	thumb_func_start sub_800CF2C
sub_800CF2C: @ 0x0800CF2C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800CF90
_0800CF34:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CF5C
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800CF68
	b _0800CF5C
_0800CF52:
	adds r0, r4, #0
	movs r1, #0
	bl LoadUnitCore
	adds r4, #0x10
_0800CF5C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CF52
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800CF9E
_0800CF68:
	adds r0, r4, #0
	bl sub_800CEF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800CF8C
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CF9A
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadUnitCore
_0800CF8C:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800CF90:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CF34
	ldr r0, _0800CFA4 @ =sub_800D204
	str r0, [r5, #0x40]
_0800CF9A:
	bl ForceSyncUnitSpriteSheet
_0800CF9E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CFA4: .4byte sub_800D204

	thumb_func_start sub_800CFA8
sub_800CFA8: @ 0x0800CFA8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800D02C
_0800CFB0:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r6, #4
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CFEA
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800CFF6
	b _0800CFEA
_0800CFD0:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800CFE8
	adds r0, r4, #0
	movs r1, #0
	bl LoadUnitCore
_0800CFE8:
	adds r4, #0x10
_0800CFEA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CFD0
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800D03A
_0800CFF6:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ands r0, r6
	cmp r0, #0
	bne _0800D028
	adds r0, r4, #0
	bl sub_800CEF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D028
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl sub_800BF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D036
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadUnitCore
_0800D028:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800D02C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800CFB0
	ldr r0, _0800D040 @ =sub_800D204
	str r0, [r5, #0x40]
_0800D036:
	bl ForceSyncUnitSpriteSheet
_0800D03A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D040: .4byte sub_800D204

	thumb_func_start sub_800D044
sub_800D044: @ 0x0800D044
	push {r4, r5, r6, lr}
	ldr r6, [r0, #0x44]
	movs r5, #0
	movs r4, #1
_0800D04C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800D06A
	ldr r0, [r1]
	cmp r0, #0
	beq _0800D06A
	ldr r0, [r1, #0xc]
	ldr r1, _0800D0C4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D06A
	adds r5, #1
_0800D06A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D04C
	cmp r5, #0
	ble _0800D086
	ldr r0, _0800D0C8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800D162
_0800D086:
	ldr r0, _0800D0C8 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800D0CC
	movs r4, #1
_0800D09A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D0BC
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D0BC
	ldr r1, [r2, #0xc]
	ldr r0, _0800D0C4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D0BC
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D0BC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D09A
	b _0800D0FA
	.align 2, 0
_0800D0C4: .4byte 0x00010004
_0800D0C8: .4byte gPlaySt
_0800D0CC:
	movs r4, #1
_0800D0CE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D0F4
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D0F4
	ldr r1, [r2, #0xc]
	ldr r0, _0800D100 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D0F4
	movs r0, #1
	orrs r1, r0
	subs r0, #0xa
	ands r1, r0
	str r1, [r2, #0xc]
_0800D0F4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D0CE
_0800D0FA:
	movs r4, #0
	b _0800D116
	.align 2, 0
_0800D100: .4byte 0x00010004
_0800D104:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	adds r4, #1
	adds r0, r6, #0
	bl sub_800A70C
	adds r6, #0x10
_0800D116:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800D128
	adds r0, r4, #0
	bl sub_800CEBC
	adds r4, r0, #0
	cmp r4, #0
	bne _0800D104
_0800D128:
	movs r4, #1
_0800D12A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D154
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D154
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D154
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D154
	movs r0, #8
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D154:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D12A
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_0800D162:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800D168
sub_800D168: @ 0x0800D168
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov sb, r1
	ldrb r3, [r0, #6]
	mov sl, r3
	ldrb r6, [r0, #8]
	ldrb r0, [r0, #0xa]
	mov r8, r0
	ldr r0, _0800D1FC @ =0x030040F0
	ldr r5, _0800D200 @ =gUnk_08C00C28
	ldrb r1, [r5, #2]
	strb r1, [r0, #2]
	ldrb r4, [r5, #3]
	lsls r2, r4, #0x1f
	lsrs r2, r2, #0x1f
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r0, #3]
	ands r1, r3
	orrs r1, r2
	movs r2, #6
	ands r2, r4
	movs r3, #7
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	lsrs r4, r4, #3
	lsls r4, r4, #3
	movs r2, #7
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #3]
	ldrb r1, [r5, #8]
	strb r1, [r0, #8]
	ldrb r1, [r5, #9]
	strb r1, [r0, #9]
	ldrb r1, [r5, #0xa]
	strb r1, [r0, #0xa]
	ldrb r1, [r5, #0xb]
	strb r1, [r0, #0xb]
	ldrb r1, [r5, #0xc]
	strb r1, [r0, #0xc]
	ldrb r1, [r5, #0xd]
	strb r1, [r0, #0xd]
	ldrb r1, [r5, #0xe]
	strb r1, [r0, #0xe]
	ldrb r1, [r5, #0xf]
	strb r1, [r0, #0xf]
	mov r1, sb
	strb r1, [r0]
	mov r3, sl
	strb r3, [r0, #1]
	strb r6, [r0, #4]
	mov r1, r8
	strb r1, [r0, #5]
	strb r6, [r0, #6]
	strb r1, [r0, #7]
	movs r1, #0
	bl LoadUnitCore
	movs r0, #2
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D1FC: .4byte 0x030040F0
_0800D200: .4byte gUnk_08C00C28

	thumb_func_start sub_800D204
sub_800D204: @ 0x0800D204
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_806C850
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0800D220
	ldr r0, _0800D228 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	str r4, [r5, #0x40]
_0800D220:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D228: .4byte 0x0202E3F0

	thumb_func_start sub_800D22C
sub_800D22C: @ 0x0800D22C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_806C850
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D23E
	movs r0, #3
	b _0800D262
_0800D23E:
	ldr r0, _0800D25C @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D260
	movs r0, #2
	b _0800D262
	.align 2, 0
_0800D25C: .4byte 0x0202E3F0
_0800D260:
	movs r0, #0
_0800D262:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800D268
sub_800D268: @ 0x0800D268
	adds r0, #0x5e
	movs r1, #1
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_800D278
sub_800D278: @ 0x0800D278
	adds r0, #0x5e
	ldr r1, _0800D288 @ =0x0000FFFE
	ldrh r2, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0800D288: .4byte 0x0000FFFE

	thumb_func_start Event3C_ASMC1
Event3C_ASMC1: @ 0x0800D28C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D2A8
	movs r0, #2
	b _0800D2AA
_0800D2A8:
	movs r0, #1
_0800D2AA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start Event3D_ASMC2
Event3D_ASMC2: @ 0x0800D2B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D2D6
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D2DA
_0800D2D6:
	movs r0, #0
	b _0800D2DC
_0800D2DA:
	movs r0, #1
_0800D2DC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Event3E_ASMC3
Event3E_ASMC3: @ 0x0800D2E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D310
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D310
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D314
_0800D310:
	movs r0, #0
	b _0800D316
_0800D314:
	movs r0, #1
_0800D316:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start Event3F_ASMC4
Event3F_ASMC4: @ 0x0800D31C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	beq _0800D33C
	movs r0, #1
	b _0800D346
_0800D33C:
	cmp r1, #0
	bne _0800D344
	movs r0, #3
	b _0800D346
_0800D344:
	movs r0, #0
_0800D346:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start Event40_ASMC5
Event40_ASMC5: @ 0x0800D34C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	beq _0800D36C
	movs r0, #1
	b _0800D376
_0800D36C:
	cmp r1, #0
	bne _0800D374
	movs r0, #0
	b _0800D376
_0800D374:
	movs r0, #3
_0800D376:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start Event41_Halt
Event41_Halt: @ 0x0800D37C
	movs r0, #3
	bx lr

	thumb_func_start Event42_Nop
Event42_Nop: @ 0x0800D380
	movs r0, #0
	bx lr

	thumb_func_start sub_800D384
sub_800D384: @ 0x0800D384
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	ldr r2, [r3, #0x2c]
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D3D6
	ldr r4, _0800D3B8 @ =0x0000FFFF
	ldr r5, _0800D3BC @ =gUnk_08C0024C
	ldr r0, _0800D3C0 @ =0xFFFFFDF0
	adds r7, r5, r0
_0800D39A:
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0x42
	bne _0800D3C4
	ldr r0, [r2, #4]
	cmp r0, r6
	bne _0800D3C4
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D3D8
	.align 2, 0
_0800D3B8: .4byte 0x0000FFFF
_0800D3BC: .4byte gUnk_08C0024C
_0800D3C0: .4byte 0xFFFFFDF0
_0800D3C4:
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r7
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D39A
_0800D3D6:
	movs r0, #2
_0800D3D8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Event43_Goto
Event43_Goto: @ 0x0800D3E0
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	bl sub_800D384
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D3F0
sub_800D3F0: @ 0x0800D3F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r6, [r0, #8]
	movs r4, #1
_0800D3FA:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D41E
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D41E
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D41E
	ldrb r0, [r2, #4]
	cmp r0, r6
	bne _0800D41E
	movs r0, #0
	b _0800D42E
_0800D41E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D3FA
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl sub_800D384
_0800D42E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_800D434
sub_800D434: @ 0x0800D434
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r6, [r0, #8]
	movs r4, #1
_0800D43E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D462
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D462
	ldr r0, [r0, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800D462
	ldrb r0, [r2, #4]
	cmp r0, r6
	bne _0800D462
	movs r0, #0
	b _0800D472
_0800D462:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D43E
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl sub_800D384
_0800D472:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_800D478
sub_800D478: @ 0x0800D478
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	bl _call_via_r0

	thumb_func_start sub_800D484
sub_800D484: @ 0x0800D484
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D48E
	movs r0, #0
	b _0800D498
_0800D48E:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_800D384
_0800D498:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D4A0
sub_800D4A0: @ 0x0800D4A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	bl _call_via_r0

	thumb_func_start sub_800D4AC
sub_800D4AC: @ 0x0800D4AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D4B6
	movs r0, #0
	b _0800D4C0
_0800D4B6:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_800D384
_0800D4C0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D4C8
sub_800D4C8: @ 0x0800D4C8
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #6
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D4DE
	movs r0, #0
	b _0800D4E8
_0800D4DE:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_800D384
_0800D4E8:
	pop {r1}
	bx r1

	thumb_func_start sub_800D4EC
sub_800D4EC: @ 0x0800D4EC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D502
	movs r0, #0
	b _0800D50C
_0800D502:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_800D384
_0800D50C:
	pop {r1}
	bx r1

	thumb_func_start sub_800D510
sub_800D510: @ 0x0800D510
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D544
	movs r0, #0
	b _0800D56E
_0800D52A:
	ldr r0, _0800D540 @ =gEventCmdTable
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D56E
	.align 2, 0
_0800D540: .4byte gEventCmdTable
_0800D544:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D56C
	ldr r3, _0800D574 @ =0x0000FFFF
	ldr r2, _0800D578 @ =gUnk_08C0003C
_0800D54E:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x42
	bne _0800D55C
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D52A
_0800D55C:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D54E
_0800D56C:
	movs r0, #2
_0800D56E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D574: .4byte 0x0000FFFF
_0800D578: .4byte gUnk_08C0003C

	thumb_func_start sub_800D57C
sub_800D57C: @ 0x0800D57C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D5B0
	movs r0, #0
	b _0800D5DA
_0800D596:
	ldr r0, _0800D5AC @ =gEventCmdTable
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D5DA
	.align 2, 0
_0800D5AC: .4byte gEventCmdTable
_0800D5B0:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D5D8
	ldr r3, _0800D5E0 @ =0x0000FFFF
	ldr r2, _0800D5E4 @ =gUnk_08C0003C
_0800D5BA:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x42
	bne _0800D5C8
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D596
_0800D5C8:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D5BA
_0800D5D8:
	movs r0, #2
_0800D5DA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D5E0: .4byte 0x0000FFFF
_0800D5E4: .4byte gUnk_08C0003C

	thumb_func_start sub_800D5E8
sub_800D5E8: @ 0x0800D5E8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	ldr r6, [r1, #4]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D610
	ldr r0, _0800D60C @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	beq _0800D640
	movs r0, #0
	b _0800D66A
	.align 2, 0
_0800D60C: .4byte gActiveUnit
_0800D610:
	ldr r0, _0800D624 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	bne _0800D640
	movs r0, #0
	b _0800D66A
	.align 2, 0
_0800D624: .4byte gActiveUnit
_0800D628:
	ldr r0, _0800D63C @ =gEventCmdTable
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D66A
	.align 2, 0
_0800D63C: .4byte gEventCmdTable
_0800D640:
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D668
	ldr r5, _0800D670 @ =0x0000FFFF
	ldr r4, _0800D674 @ =gUnk_08C0003C
_0800D64A:
	ldr r1, [r2]
	ands r1, r5
	cmp r1, #0x42
	bne _0800D658
	ldr r0, [r2, #4]
	cmp r0, r6
	beq _0800D628
_0800D658:
	lsls r0, r1, #3
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D64A
_0800D668:
	movs r0, #2
_0800D66A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D670: .4byte 0x0000FFFF
_0800D674: .4byte gUnk_08C0003C

	thumb_func_start sub_800D678
sub_800D678: @ 0x0800D678
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D688 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _0800D68C
	movs r0, #0
	b _0800D696
	.align 2, 0
_0800D688: .4byte gPlaySt
_0800D68C:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_800D384
_0800D696:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D69C
sub_800D69C: @ 0x0800D69C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D6AC @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800D6B0
	movs r0, #0
	b _0800D6BA
	.align 2, 0
_0800D6AC: .4byte gPlaySt
_0800D6B0:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl sub_800D384
_0800D6BA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D6C0
sub_800D6C0: @ 0x0800D6C0
	push {lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x30]
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _0800D6E0
	ldr r1, _0800D6DC @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0800D6FC
	b _0800D6EC
	.align 2, 0
_0800D6DC: .4byte gPlaySt
_0800D6E0:
	ldr r1, _0800D6F8 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D6FC
_0800D6EC:
	ldr r1, [r2, #4]
	adds r0, r3, #0
	bl sub_800D384
	b _0800D6FE
	.align 2, 0
_0800D6F8: .4byte gPlaySt
_0800D6FC:
	movs r0, #0
_0800D6FE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D704
sub_800D704: @ 0x0800D704
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0800D714
	movs r0, #0
	b _0800D71E
_0800D714:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_800D384
_0800D71E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800D724
sub_800D724: @ 0x0800D724
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0800D734
	movs r0, #0
	b _0800D73E
_0800D734:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_800D384
_0800D73E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800D744
sub_800D744: @ 0x0800D744
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800D768 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D75C
	bl sub_807AE5C
	cmp r0, #0
	beq _0800D76C
_0800D75C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_800D384
	b _0800D76E
	.align 2, 0
_0800D768: .4byte gPlaySt
_0800D76C:
	movs r0, #0
_0800D76E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800D774
sub_800D774: @ 0x0800D774
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldrh r7, [r0, #8]
	ldr r5, [r0, #0xc]
	movs r4, #1
_0800D780:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D7B6
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D7B6
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800D7B6
	ldrb r0, [r2, #4]
	cmp r0, r7
	bne _0800D7B6
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D7BC
	adds r0, r5, #0
	bl SetFlag
	movs r0, #0
	b _0800D7C6
_0800D7B6:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D780
_0800D7BC:
	ldr r0, [r6, #0x30]
	ldr r1, [r0, #4]
	adds r0, r6, #0
	bl sub_800D384
_0800D7C6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800D7CC
sub_800D7CC: @ 0x0800D7CC
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D7E0 @ =gPlaySt
	ldr r1, [r2, #0x30]
	ldrh r0, [r0, #0x10]
	ldrh r3, [r1, #2]
	cmp r0, r3
	bhs _0800D7E4
	movs r0, #0
	b _0800D7EC
	.align 2, 0
_0800D7E0: .4byte gPlaySt
_0800D7E4:
	ldr r1, [r1, #4]
	adds r0, r2, #0
	bl sub_800D384
_0800D7EC:
	pop {r1}
	bx r1

	thumb_func_start sub_800D7F0
sub_800D7F0: @ 0x0800D7F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D80C
	ldrb r0, [r1, #8]
	bl sub_807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D818
_0800D808:
	movs r0, #0
	b _0800D822
_0800D80C:
	ldrb r0, [r1, #8]
	bl sub_807A754
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D808
_0800D818:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_800D384
_0800D822:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800D828
sub_800D828: @ 0x0800D828
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	movs r0, #1
	bx lr

	thumb_func_start sub_800D834
sub_800D834: @ 0x0800D834
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0

	thumb_func_start sub_800D840
sub_800D840: @ 0x0800D840
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D850
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
_0800D850:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800D858
sub_800D858: @ 0x0800D858
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0

	thumb_func_start sub_800D864
sub_800D864: @ 0x0800D864
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D874
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
_0800D874:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800D87C
sub_800D87C: @ 0x0800D87C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #4]
	ldr r0, _0800D890 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_800D8DC
	pop {r1}
	bx r1
	.align 2, 0
_0800D890: .4byte gActiveUnit

	thumb_func_start sub_800D894
sub_800D894: @ 0x0800D894
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r2, [r0, #4]
	ldrh r5, [r0, #8]
	cmp r2, #0
	bne _0800D8A8
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r2, [r0]
_0800D8A8:
	adds r0, r2, #0
	bl GetUnitFromCharId
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_800D8DC
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800D8BC
sub_800D8BC: @ 0x0800D8BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #4]
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_800D8DC
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D8DC
sub_800D8DC: @ 0x0800D8DC
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800D8EE
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
_0800D8EE:
	adds r0, r3, #0
	bl sub_800EE60
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D8FC
sub_800D8FC: @ 0x0800D8FC
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800D918 @ =0x0000FFFF
	cmp r4, r0
	bne _0800D91C
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800D92C
	.align 2, 0
_0800D918: .4byte 0x0000FFFF
_0800D91C:
	ldr r0, _0800D968 @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800D92C:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800D96C
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800D94E
	subs r0, r4, #1
	bl sub_802C2A8
_0800D94E:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800D98A
	.align 2, 0
_0800D968: .4byte 0x00007FFF
_0800D96C:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800D97C
	subs r0, r4, #1
	bl sub_802C2A8
_0800D97C:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
_0800D98A:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800D994
sub_800D994: @ 0x0800D994
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800D9B0 @ =0x0000FFFF
	cmp r4, r0
	bne _0800D9B4
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800D9C4
	.align 2, 0
_0800D9B0: .4byte 0x0000FFFF
_0800D9B4:
	ldr r0, _0800D9FC @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800D9C4:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DA38
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DA04
	subs r0, r4, #1
	bl sub_802C2A8
	ldr r0, _0800DA00 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DA16
	movs r0, #0xbd
	bl m4aSongNumStart
	b _0800DA16
	.align 2, 0
_0800D9FC: .4byte 0x00007FFF
_0800DA00: .4byte gPlaySt
_0800DA04:
	ldr r0, _0800DA34 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DA16
	movs r0, #0xbe
	bl m4aSongNumStart
_0800DA16:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
	bl sub_8019428
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800DA5A
	.align 2, 0
_0800DA34: .4byte gPlaySt
_0800DA38:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DA48
	subs r0, r4, #1
	bl sub_802C2A8
_0800DA48:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
	bl sub_8019428
_0800DA5A:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800DA64
sub_800DA64: @ 0x0800DA64
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r4, [r0, #2]
	ldr r0, _0800DA98 @ =0x0000FFFF
	cmp r4, r0
	bne _0800DA78
	adds r0, r1, #0
	adds r0, #0x4f
	ldrb r4, [r0]
_0800DA78:
	adds r0, r4, #0
	bl ApplyMapChange
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
	bl RenderMap
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800DA98: .4byte 0x0000FFFF

	thumb_func_start sub_800DA9C
sub_800DA9C: @ 0x0800DA9C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DAB8 @ =0x0000FFFF
	cmp r4, r0
	bne _0800DABC
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DACC
	.align 2, 0
_0800DAB8: .4byte 0x0000FFFF
_0800DABC:
	ldr r0, _0800DAE0 @ =0x00007FFF
	ands r4, r0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DACC:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DAE4
	subs r0, r4, #1
	bl sub_802C2A8
	b _0800DAEA
	.align 2, 0
_0800DAE0: .4byte 0x00007FFF
_0800DAE4:
	adds r0, r4, #0
	bl AddMapChangeTrap
_0800DAEA:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800DAF4
sub_800DAF4: @ 0x0800DAF4
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshTerrainMap
	bl sub_802C300
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800DB0C
	bl sub_8019428
_0800DB0C:
	bl RenderMap
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800DB18
sub_800DB18: @ 0x0800DB18
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0]
	lsrs r0, r1, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0800DB3C
	adds r0, r5, #0
	adds r0, #0x4f
	ldrb r4, [r0]
_0800DB3C:
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DB6E
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800DB82
_0800DB6E:
	adds r0, r4, #0
	bl ApplyMapChange
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl sub_802C300
_0800DB82:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800DB8C
sub_800DB8C: @ 0x0800DB8C
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x30]
	ldrb r6, [r0, #4]
	ldr r5, [r0, #8]
	movs r4, #1
_0800DB96:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800DBC0
	ldr r3, [r2]
	cmp r3, #0
	beq _0800DBC0
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800DBC0
	ldrb r3, [r3, #4]
	cmp r3, r6
	bne _0800DBC0
	adds r0, r2, #0
	adds r1, r5, #0
	bl UnitChangeFaction
_0800DBC0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800DB96
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800DBD4
sub_800DBD4: @ 0x0800DBD4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DBEA
	movs r0, #0
	b _0800DC32
_0800DBEA:
	ldr r1, [r5, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DBFE
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DC00
_0800DBFE:
	ldr r0, _0800DC14 @ =0x0000FFFF
_0800DC00:
	adds r6, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DC18
	adds r4, r1, #0
	b _0800DC1A
	.align 2, 0
_0800DC14: .4byte 0x0000FFFF
_0800DC18:
	ldr r4, _0800DC38 @ =0x0000FFFF
_0800DC1A:
	ldr r0, _0800DC3C @ =gUnk_08C00C48
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r6, [r1]
	adds r0, #0x66
	strh r4, [r0]
	ldr r0, _0800DC40 @ =sub_800DC94
	str r0, [r5, #0x40]
	movs r0, #2
_0800DC32:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DC38: .4byte 0x0000FFFF
_0800DC3C: .4byte gUnk_08C00C48
_0800DC40: .4byte sub_800DC94

	thumb_func_start sub_800DC44
sub_800DC44: @ 0x0800DC44
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800DC8C
	ldr r0, _0800DC84 @ =gUnk_08C00C48
	adds r1, r4, #0
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	adds r1, r0, #0
	adds r1, #0x64
	strh r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, #0x66
	strh r1, [r0]
	ldr r0, _0800DC88 @ =sub_800DC94
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800DC8E
	.align 2, 0
_0800DC84: .4byte gUnk_08C00C48
_0800DC88: .4byte sub_800DC94
_0800DC8C:
	movs r0, #0
_0800DC8E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800DC94
sub_800DC94: @ 0x0800DC94
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DCB4
	ldr r0, _0800DCB0 @ =gUnk_08C00C48
	bl Proc_EndEach
	movs r0, #0
	b _0800DCBE
	.align 2, 0
_0800DCB0: .4byte gUnk_08C00C48
_0800DCB4:
	ldr r0, _0800DCC8 @ =gUnk_08C00C48
	bl Proc_Find
	cmp r0, #0
	bne _0800DCC0
_0800DCBE:
	str r0, [r4, #0x40]
_0800DCC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DCC8: .4byte gUnk_08C00C48

	thumb_func_start sub_800DCCC
sub_800DCCC: @ 0x0800DCCC
	movs r1, #0x3c
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0

	thumb_func_start sub_800DCD4
sub_800DCD4: @ 0x0800DCD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0
	bgt _0800DCE8
	adds r0, r4, #0
	bl Proc_Break
_0800DCE8:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	movs r2, #0
	bl sub_8015DE8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_800DD08
sub_800DD08: @ 0x0800DD08
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DD1E
	movs r0, #0
	b _0800DD62
_0800DD1E:
	ldr r1, [r3, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DD32
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DD34
_0800DD32:
	ldr r0, _0800DD48 @ =0x0000FFFF
_0800DD34:
	adds r5, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DD4C
	adds r4, r1, #0
	b _0800DD4E
	.align 2, 0
_0800DD48: .4byte 0x0000FFFF
_0800DD4C:
	ldr r4, _0800DD68 @ =0x0000FFFF
_0800DD4E:
	ldr r0, _0800DD6C @ =gUnk_08C00C60
	adds r1, r3, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r5, [r1]
	adds r0, #0x66
	strh r4, [r0]
	movs r0, #2
_0800DD62:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DD68: .4byte 0x0000FFFF
_0800DD6C: .4byte gUnk_08C00C60

	thumb_func_start sub_800DD70
sub_800DD70: @ 0x0800DD70
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r2, r2, #4
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r1, r1, #4
	adds r0, r2, #0
	movs r2, #0
	bl sub_8015DE8
	pop {r0}
	bx r0

	thumb_func_start sub_800DD90
sub_800DD90: @ 0x0800DD90
	push {lr}
	ldr r0, _0800DDA0 @ =gUnk_08C00C60
	bl Proc_EndEach
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800DDA0: .4byte gUnk_08C00C60

	thumb_func_start sub_800DDA4
sub_800DDA4: @ 0x0800DDA4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0800DDAC:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800DDC6
	ldr r0, [r0]
	cmp r0, #0
	beq _0800DDC6
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0800DDC6
	movs r0, #1
	b _0800DDCE
_0800DDC6:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800DDAC
	movs r0, #0
_0800DDCE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800DDD4
sub_800DDD4: @ 0x0800DDD4
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DDEC
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DDEE
_0800DDEC:
	ldr r0, _0800DE04 @ =0x0000FFFF
_0800DDEE:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DE08
	adds r0, r2, #0
	b _0800DE0A
	.align 2, 0
_0800DE04: .4byte 0x0000FFFF
_0800DE08:
	ldr r0, _0800DE3C @ =0x0000FFFF
_0800DE0A:
	lsls r2, r0, #0x10
	ldr r0, _0800DE40 @ =gBmMapUnit
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DE44
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DE4A
	.align 2, 0
_0800DE3C: .4byte 0x0000FFFF
_0800DE40: .4byte gBmMapUnit
_0800DE44:
	adds r0, r4, #0
	bl ClearUnit
_0800DE4A:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800DE5C
sub_800DE5C: @ 0x0800DE5C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl sub_800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DE82
	ldr r0, [r5, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r5, #0xc]
	b _0800DE88
_0800DE82:
	adds r0, r5, #0
	bl ClearUnit
_0800DE88:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800DE98
sub_800DE98: @ 0x0800DE98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DEB0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DEB2
_0800DEB0:
	ldr r0, _0800DEC8 @ =0x0000FFFF
_0800DEB2:
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DECC
	adds r0, r2, #0
	b _0800DECE
	.align 2, 0
_0800DEC8: .4byte 0x0000FFFF
_0800DECC:
	ldr r0, _0800DF10 @ =0x0000FFFF
_0800DECE:
	lsls r2, r0, #0x10
	ldr r0, _0800DF14 @ =gBmMapUnit
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DF28
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DF18
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DF1E
	.align 2, 0
_0800DF10: .4byte 0x0000FFFF
_0800DF14: .4byte gBmMapUnit
_0800DF18:
	adds r0, r4, #0
	bl ClearUnit
_0800DF1E:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	b _0800DF56
_0800DF28:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	adds r4, r0, #0
	bl MU_SetDefaultFacing_Auto
	adds r0, r4, #0
	bl sub_806DD98
	ldr r0, _0800DF60 @ =sub_800DFE0
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800DF56:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DF60: .4byte sub_800DFE0

	thumb_func_start sub_800DF64
sub_800DF64: @ 0x0800DF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DFB0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_800DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DFA0
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DFA6
_0800DFA0:
	adds r0, r4, #0
	bl ClearUnit
_0800DFA6:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	b _0800DFD4
_0800DFB0:
	adds r0, r4, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	adds r4, r0, #0
	bl MU_SetDefaultFacing_Auto
	adds r0, r4, #0
	bl sub_806DD98
	ldr r0, _0800DFDC @ =sub_800DFE0
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800DFD4:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DFDC: .4byte sub_800DFE0

	thumb_func_start sub_800DFE0
sub_800DFE0: @ 0x0800DFE0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x55
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl EndAllMus
	adds r0, r4, #0
	bl ClearUnit
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #0
	str r0, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E00C
sub_800E00C: @ 0x0800E00C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800E024
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800E026
_0800E024:
	ldr r0, _0800E03C @ =0x0000FFFF
_0800E026:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800E040
	adds r0, r2, #0
	b _0800E042
	.align 2, 0
_0800E03C: .4byte 0x0000FFFF
_0800E040:
	ldr r0, _0800E070 @ =0x0000FFFF
_0800E042:
	lsls r2, r0, #0x10
	ldr r0, _0800E074 @ =gBmMapUnit
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0800E070: .4byte 0x0000FFFF
_0800E074: .4byte gBmMapUnit

	thumb_func_start sub_800E078
sub_800E078: @ 0x0800E078
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start sub_800E098
sub_800E098: @ 0x0800E098
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	ldr r2, _0800E0B0 @ =0x04010000
	orrs r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E0B0: .4byte 0x04010000

	thumb_func_start sub_800E0B4
sub_800E0B4: @ 0x0800E0B4
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	ldr r2, _0800E0CC @ =0xFFBFFFFF
	ands r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E0CC: .4byte 0xFFBFFFFF

	thumb_func_start sub_800E0D0
sub_800E0D0: @ 0x0800E0D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	ldr r1, [r0, #0xc]
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800E0F8
sub_800E0F8: @ 0x0800E0F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	ldr r1, [r0, #0xc]
	bics r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800E120
sub_800E120: @ 0x0800E120
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r1, #0x14
	beq _0800E13C
	mov r3, ip
	adds r3, #0x42
	movs r0, #0
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x43
	strb r0, [r1]
_0800E13C:
	cmp r2, #0x23
	beq _0800E15C
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	cmp r2, #0xc
	bne _0800E15C
	movs r0, #8
	mov r1, ip
	ldrb r1, [r1, #0xa]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0xa]
_0800E15C:
	bx lr
	.align 2, 0

	thumb_func_start sub_800E160
sub_800E160: @ 0x0800E160
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov r8, r1
	ldr r1, [r0, #8]
	ldrb r7, [r0, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r6, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	movs r4, #1
_0800E182:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E1B0
	ldr r3, [r2]
	cmp r3, #0
	beq _0800E1B0
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E1B0
	ldrb r3, [r3, #4]
	cmp r3, r8
	bne _0800E1B0
	adds r0, r2, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_800E120
_0800E1B0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E182
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800E1C4
sub_800E1C4: @ 0x0800E1C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, [r0, #0x30]
	ldr r1, [r2, #8]
	ldrb r0, [r2, #8]
	mov sb, r0
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	mov r8, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	movs r4, #0x41
	movs r6, #4
	ldrsb r6, [r2, r6]
	movs r5, #6
	ldrsb r5, [r2, r5]
_0800E1F0:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E228
	ldr r0, [r2]
	cmp r0, #0
	beq _0800E228
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E228
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0800E228
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800E228
	adds r0, r2, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_800E120
_0800E228:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E1F0
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800E23C
sub_800E23C: @ 0x0800E23C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl SetFlag
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800E24C
sub_800E24C: @ 0x0800E24C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl ClearFlag
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800E25C
sub_800E25C: @ 0x0800E25C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E27E
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	movs r1, #1
	movs r2, #0
	bl sub_8003788
	movs r0, #2
	b _0800E280
_0800E27E:
	movs r0, #0
_0800E280:
	pop {r1}
	bx r1

	thumb_func_start sub_800E284
sub_800E284: @ 0x0800E284
	push {lr}
	ldr r2, [r0, #0x30]
	ldrh r3, [r2, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800E29A
	movs r0, #0
	b _0800E324
_0800E29A:
	ldr r0, [r2, #4]
	subs r0, #1
	cmp r0, #7
	bhi _0800E318
	lsls r0, r0, #2
	ldr r1, _0800E2AC @ =_0800E2B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E2AC: .4byte _0800E2B0
_0800E2B0: @ jump table
	.4byte _0800E2D0 @ case 0
	.4byte _0800E2D8 @ case 1
	.4byte _0800E2E0 @ case 2
	.4byte _0800E2E8 @ case 3
	.4byte _0800E2F0 @ case 4
	.4byte _0800E2F8 @ case 5
	.4byte _0800E300 @ case 6
	.4byte _0800E308 @ case 7
_0800E2D0:
	ldr r2, _0800E2D4 @ =0x03005C40
	b _0800E30A
	.align 2, 0
_0800E2D4: .4byte 0x03005C40
_0800E2D8:
	ldr r2, _0800E2DC @ =0x03005C80
	b _0800E30A
	.align 2, 0
_0800E2DC: .4byte 0x03005C80
_0800E2E0:
	ldr r2, _0800E2E4 @ =0x03005D50
	b _0800E30A
	.align 2, 0
_0800E2E4: .4byte 0x03005D50
_0800E2E8:
	ldr r2, _0800E2EC @ =0x03005CC0
	b _0800E30A
	.align 2, 0
_0800E2EC: .4byte 0x03005CC0
_0800E2F0:
	ldr r2, _0800E2F4 @ =0x030059B0
	b _0800E30A
	.align 2, 0
_0800E2F4: .4byte 0x030059B0
_0800E2F8:
	ldr r2, _0800E2FC @ =0x030059F0
	b _0800E30A
	.align 2, 0
_0800E2FC: .4byte 0x030059F0
_0800E300:
	ldr r2, _0800E304 @ =0x03005C00
	b _0800E30A
	.align 2, 0
_0800E304: .4byte 0x03005C00
_0800E308:
	ldr r2, _0800E314 @ =0x03005D10
_0800E30A:
	adds r0, r3, #0
	movs r1, #1
	bl sub_8003788
	b _0800E322
	.align 2, 0
_0800E314: .4byte 0x03005D10
_0800E318:
	ldr r2, _0800E328 @ =0x03005A30
	adds r0, r3, #0
	movs r1, #1
	bl sub_8003788
_0800E322:
	movs r0, #2
_0800E324:
	pop {r1}
	bx r1
	.align 2, 0
_0800E328: .4byte 0x03005A30

	thumb_func_start sub_800E32C
sub_800E32C: @ 0x0800E32C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E352
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl OverrideBgm
	adds r0, r4, #0
	movs r1, #0x21
	bl sub_80149B4
	movs r0, #2
	b _0800E354
_0800E352:
	movs r0, #0
_0800E354:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800E35C
sub_800E35C: @ 0x0800E35C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl sub_8003A68
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start sub_800E36C
sub_800E36C: @ 0x0800E36C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E38A
	ldr r1, [r2, #0x30]
	ldrh r0, [r1, #2]
	ldr r1, [r1, #4]
	movs r2, #0
	bl sub_8003858
_0800E38A:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800E390
sub_800E390: @ 0x0800E390
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E3AE
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl sub_8003550
	movs r0, #2
	b _0800E3B0
_0800E3AE:
	movs r0, #0
_0800E3B0:
	pop {r1}
	bx r1

	thumb_func_start sub_800E3B4
sub_800E3B4: @ 0x0800E3B4
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E3D6
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	movs r0, #2
	b _0800E3D8
_0800E3D6:
	movs r0, #0
_0800E3D8:
	pop {r1}
	bx r1

	thumb_func_start sub_800E3DC
sub_800E3DC: @ 0x0800E3DC
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E3FE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	movs r0, #2
	b _0800E408
_0800E3FE:
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	movs r0, #0
_0800E408:
	pop {r1}
	bx r1

	thumb_func_start sub_800E40C
sub_800E40C: @ 0x0800E40C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E432
	ldr r0, _0800E438 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800E432
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl m4aSongNumStart
_0800E432:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E438: .4byte gPlaySt

	thumb_func_start sub_800E43C
sub_800E43C: @ 0x0800E43C
	adds r0, #0x5e
	movs r1, #8
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_800E44C
sub_800E44C: @ 0x0800E44C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #2]
	bl EndAllMus
	adds r0, r5, #0
	bl sub_8013214
	movs r0, #1
	bl SetNextGameAction
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E47E
	adds r0, r4, #0
	bl StartSlowLockingFadeFromBlack
_0800E47E:
	cmp r5, #0x2f
	beq _0800E488
	movs r0, #4
	bl FadeBgmOut
_0800E488:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start Event80_CompleteGame
Event80_CompleteGame: @ 0x0800E490
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	bl SetNextGameAction
	adds r0, r4, #0
	bl sub_800E43C
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E4A8
sub_800E4A8: @ 0x0800E4A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	bl SetNextGameAction
	adds r0, r4, #0
	bl sub_800E43C
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E4C0
sub_800E4C0: @ 0x0800E4C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0800E508 @ =gPlaySt
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	strb r0, [r1, #0xe]
	bl RestartBattleMap
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	ldr r5, _0800E50C @ =gBmSt
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r5, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E508: .4byte gPlaySt
_0800E50C: .4byte gBmSt

	thumb_func_start sub_800E510
sub_800E510: @ 0x0800E510
	ldr r1, _0800E51C @ =gPlaySt
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	strb r0, [r1, #0xe]
	movs r0, #0
	bx lr
	.align 2, 0
_0800E51C: .4byte gPlaySt

	thumb_func_start sub_800E520
sub_800E520: @ 0x0800E520
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _0800E568 @ =0x0000FFFB
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	bl ApplySystemGraphics
	bl UnpackChapterMapPalette
	bl ApplyUnitSpritePalettes
	ldr r2, _0800E56C @ =gDispIo
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
	adds r1, r5, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E568: .4byte 0x0000FFFB
_0800E56C: .4byte gDispIo

	thumb_func_start sub_800E570
sub_800E570: @ 0x0800E570
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E588
	adds r0, r1, #0
	bl sub_800E520
_0800E588:
	movs r0, #0x40
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E598
sub_800E598: @ 0x0800E598
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E5B0
	adds r0, r1, #0
	bl sub_800E520
_0800E5B0:
	movs r0, #0xc0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E5C0
sub_800E5C0: @ 0x0800E5C0
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E5D8
	adds r0, r1, #0
	bl sub_800E520
_0800E5D8:
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E5EC
sub_800E5EC: @ 0x0800E5EC
	adds r2, r0, #0
	adds r2, #0x5e
	ldrh r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E608
	ldr r0, _0800E604 @ =0x0000FE1F
	ands r0, r1
	strh r0, [r2]
	movs r0, #2
	b _0800E60A
	.align 2, 0
_0800E604: .4byte 0x0000FE1F
_0800E608:
	movs r0, #0
_0800E60A:
	bx lr

	thumb_func_start sub_800E60C
sub_800E60C: @ 0x0800E60C
	adds r1, r0, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r2, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0800E622
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #2
	b _0800E624
_0800E622:
	movs r0, #0
_0800E624:
	bx lr
	.align 2, 0

	thumb_func_start sub_800E628
sub_800E628: @ 0x0800E628
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E640
	adds r0, r1, #0
	bl sub_800E520
_0800E640:
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800E652
	movs r0, #0x40
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
_0800E652:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800E65C
sub_800E65C: @ 0x0800E65C
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E674
	adds r0, r1, #0
	bl sub_800E520
_0800E674:
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E684
	movs r1, #0xa0
	lsls r1, r1, #1
	b _0800E688
_0800E684:
	movs r1, #0xe0
	lsls r1, r1, #1
_0800E688:
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E698
sub_800E698: @ 0x0800E698
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E6B0
	adds r0, r1, #0
	bl sub_800E520
_0800E6B0:
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E6C0
	movs r1, #0xc0
	lsls r1, r1, #1
	b _0800E6C4
_0800E6C0:
	movs r1, #0xe0
	lsls r1, r1, #1
_0800E6C4:
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E6D4
sub_800E6D4: @ 0x0800E6D4
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E6F2
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl StartLockingFadeFromBlack
	movs r0, #2
	b _0800E6F4
_0800E6F2:
	movs r0, #0
_0800E6F4:
	pop {r1}
	bx r1

	thumb_func_start sub_800E6F8
sub_800E6F8: @ 0x0800E6F8
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E716
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl sub_8014470
	movs r0, #2
	b _0800E718
_0800E716:
	movs r0, #0
_0800E718:
	pop {r1}
	bx r1

	thumb_func_start sub_800E71C
sub_800E71C: @ 0x0800E71C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E732
	movs r0, #0
	b _0800E74A
_0800E732:
	bl GetLynModeDeathFlag
	lsls r0, r0, #0x18
	movs r1, #4
	cmp r0, #0
	beq _0800E740
	movs r1, #0x10
_0800E740:
	adds r0, r1, #0
	adds r1, r4, #0
	bl StartLockingFadeFromBlack
	movs r0, #2
_0800E74A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800E750
sub_800E750: @ 0x0800E750
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E76E
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl sub_8014488
	movs r0, #2
	b _0800E770
_0800E76E:
	movs r0, #0
_0800E770:
	pop {r1}
	bx r1

	thumb_func_start sub_800E774
sub_800E774: @ 0x0800E774
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E792
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl sub_80144A0
	movs r0, #2
	b _0800E794
_0800E792:
	movs r0, #0
_0800E794:
	pop {r1}
	bx r1

	thumb_func_start sub_800E798
sub_800E798: @ 0x0800E798
	push {lr}
	bl sub_800F200
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800E7A4
sub_800E7A4: @ 0x0800E7A4
	push {lr}
	bl sub_800F208
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start Event93
Event93: @ 0x0800E7B0
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E7D2
	ldr r2, [r3, #0x30]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl sub_80AFB94
	movs r0, #2
	b _0800E7D4
_0800E7D2:
	movs r0, #0
_0800E7D4:
	pop {r1}
	bx r1

	thumb_func_start sub_800E7D8
sub_800E7D8: @ 0x0800E7D8
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E7FA
	ldr r2, [r3, #0x30]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl sub_80AFBE8
	movs r0, #2
	b _0800E7FC
_0800E7FA:
	movs r0, #0
_0800E7FC:
	pop {r1}
	bx r1

	thumb_func_start sub_800E800
sub_800E800: @ 0x0800E800
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r4, [r0, #4]
	cmp r4, #0
	bne _0800E80E
	ldr r4, [r5, #0x58]
_0800E80E:
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800E828
	bl GetGold
	adds r0, r0, r4
	bl SetGold
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_800ED9C
	b _0800E848
_0800E828:
	ldr r0, _0800E850 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800E840
	bl GetGold
	adds r0, r0, r4
	bl SetGold
_0800E840:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_800ED58
_0800E848:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E850: .4byte gActiveUnit

	thumb_func_start sub_800E854
sub_800E854: @ 0x0800E854
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl SetBattleScriptted
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	mov sb, r0
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitFromCharId
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r6, [r0, #0xc]
	movs r1, #0xff
	adds r4, r1, #0
	ldrh r2, [r0, #0x12]
	ands r4, r2
	ldrb r2, [r0, #0x13]
	ands r2, r1
	str r2, [sp]
	ldrh r7, [r0, #0x10]
	ldr r1, _0800E8A0 @ =gActionSt
	cmp r2, #0
	bne _0800E8A4
	str r6, [r1, #0x18]
	b _0800E8A8
	.align 2, 0
_0800E8A0: .4byte gActionSt
_0800E8A4:
	movs r0, #0
	str r0, [r1, #0x18]
_0800E8A8:
	mov r1, sb
	ldrh r0, [r1, #0x1e]
	bl GetItemType
	cmp r0, #4
	beq _0800E8B8
	cmp r7, #0
	beq _0800E8C8
_0800E8B8:
	mov r0, sb
	movs r1, #0
	bl BattleInitItemEffect
	mov r0, sl
	bl BattleInitItemEffectTarget
	b _0800E8DE
_0800E8C8:
	cmp r4, #0
	bne _0800E8D6
	mov r0, sb
	mov r1, sl
	bl BattleGenerateReal
	b _0800E8DE
_0800E8D6:
	mov r0, sb
	mov r1, sl
	bl BattleGenerateBallistaReal
_0800E8DE:
	ldr r4, _0800E994 @ =gBattleActor
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0
	strb r0, [r1]
	ldr r5, _0800E998 @ =gBattleTarget
	adds r1, r5, #0
	adds r1, #0x6e
	strb r0, [r1]
	mov r0, sb
	bl GetUnitEquippedWeapon
	ldr r2, _0800E99C @ =0x0203A434
	strh r0, [r2]
	adds r4, #0x4a
	strh r0, [r4]
	mov r0, sl
	bl GetUnitEquippedWeapon
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	cmp r7, #0
	beq _0800E92E
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r2, _0800E99C @ =0x0203A434
	strh r0, [r2]
	strh r0, [r4]
	cmp r7, #0x7f
	bgt _0800E92E
	cmp r7, #0x7c
	blt _0800E92E
	ldr r1, _0800E9A0 @ =gBattleStats
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
_0800E92E:
	mov r7, r8
	adds r7, #0x5e
	ldr r0, [sp]
	cmp r0, #0
	bne _0800E96C
	bl ClearBattleHits
	ldr r2, _0800E9A4 @ =gBattleHitIterator
	ldr r1, [r2]
	ldr r0, [r6]
	str r0, [r1]
	movs r0, #0x80
	ldrb r1, [r6, #2]
	ands r0, r1
	cmp r0, #0
	bne _0800E968
	adds r4, r2, #0
	movs r5, #0x80
_0800E952:
	bl BattleHitAdvance
	adds r6, #4
	ldr r1, [r4]
	ldr r0, [r6]
	str r0, [r1]
	adds r0, r5, #0
	ldrb r2, [r6, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800E952
_0800E968:
	bl BattleHitTerminate
_0800E96C:
	movs r0, #4
	ldrh r7, [r7]
	ands r0, r7
	cmp r0, #0
	bne _0800E984
	mov r0, r8
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800E9AC
_0800E984:
	bl BattleApplyUnitUpdates
	bl SetBattleUnscriptted
	ldr r1, _0800E9A8 @ =gActionSt
	movs r0, #0
	str r0, [r1, #0x18]
	b _0800E9F2
	.align 2, 0
_0800E994: .4byte gBattleActor
_0800E998: .4byte gBattleTarget
_0800E99C: .4byte 0x0203A434
_0800E9A0: .4byte gBattleStats
_0800E9A4: .4byte gBattleHitIterator
_0800E9A8: .4byte gActionSt
_0800E9AC:
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	adds r1, #0x52
	strh r0, [r1]
	ldr r0, _0800EA04 @ =sub_800EA10
	mov r1, r8
	str r0, [r1, #0x40]
	mov r0, sb
	bl UnitBeginAction
	ldr r4, _0800EA08 @ =gActiveUnit
	ldr r0, [r4]
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	bl BeginBattleAnimations
	mov r0, r8
	movs r1, #7
	bl sub_800463C
	ldr r1, _0800EA0C @ =0x0203A978
	mov r2, sb
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #2]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #3]
	movs r0, #2
_0800E9F2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800EA04: .4byte sub_800EA10
_0800EA08: .4byte gActiveUnit
_0800EA0C: .4byte 0x0203A978

	thumb_func_start sub_800EA10
sub_800EA10: @ 0x0800EA10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0800EA34
	ldr r0, _0800EA3C @ =sub_800EA44
	str r0, [r5, #0x40]
	bl BattleApplyUnitUpdates
	ldr r1, _0800EA40 @ =gActionSt
	movs r0, #0
	str r0, [r1, #0x18]
_0800EA34:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EA3C: .4byte sub_800EA44
_0800EA40: .4byte gActionSt

	thumb_func_start sub_800EA44
sub_800EA44: @ 0x0800EA44
	push {lr}
	movs r1, #0
	str r1, [r0, #0x40]
	movs r1, #6
	bl sub_800463C
	bl sub_8035714
	pop {r0}
	bx r0

	thumb_func_start sub_800EA58
sub_800EA58: @ 0x0800EA58
	adds r0, #0x5e
	movs r1, #0x10
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_800EA68
sub_800EA68: @ 0x0800EA68
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_800EA74
sub_800EA74: @ 0x0800EA74
	movs r1, #0
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr

	thumb_func_start sub_800EA7C
sub_800EA7C: @ 0x0800EA7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EA98 @ =gUnk_08C00C88
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EA98: .4byte gUnk_08C00C88

	thumb_func_start sub_800EA9C
sub_800EA9C: @ 0x0800EA9C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800EAB8
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl sub_802E368
	b _0800EAC8
_0800EAB8:
	ldr r0, _0800EAD0 @ =gUnk_08C00C88
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
_0800EAC8:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EAD0: .4byte gUnk_08C00C88

	thumb_func_start sub_800EAD4
sub_800EAD4: @ 0x0800EAD4
	push {lr}
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_802E368
	pop {r0}
	bx r0

	thumb_func_start sub_800EAE4
sub_800EAE4: @ 0x0800EAE4
	push {lr}
	ldr r1, [r0, #0x30]
	ldrh r2, [r1, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800EAFE
	adds r0, r2, #0
	bl sub_801DEFC
	b _0800EB04
_0800EAFE:
	adds r0, r2, #0
	bl sub_801DF38
_0800EB04:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800EB0C
sub_800EB0C: @ 0x0800EB0C
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl sub_801DF38
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800EB1C
sub_800EB1C: @ 0x0800EB1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r1, #4]
	ldrb r1, [r1, #8]
	bl sub_801759C
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	bl SetFlag
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800EB3C
sub_800EB3C: @ 0x0800EB3C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl StartEvent
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start Event00_
Event00_: @ 0x0800EB4C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0800EB66
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x30]
	str r5, [r4, #0x34]
	str r5, [r4, #0x38]
	movs r5, #1
	b _0800EB6C
_0800EB66:
	adds r0, r4, #0
	bl Proc_Break
_0800EB6C:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800EB90
	ldr r0, _0800EB8C @ =ProcScr_Face
	bl Proc_Find
	cmp r0, #0
	beq _0800EB9E
	bl ClearTalk
	b _0800EB9E
	.align 2, 0
_0800EB8C: .4byte ProcScr_Face
_0800EB90:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800EB9E
	adds r0, r4, #0
	bl EventClearTalkDisplayed
_0800EB9E:
	cmp r5, #0
	bne _0800EBA6
	movs r0, #2
	b _0800EBA8
_0800EBA6:
	movs r0, #1
_0800EBA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Event01
Event01: @ 0x0800EBB0
	push {lr}
	bl Event00_
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventClearTalkDisplayed
EventClearTalkDisplayed: @ 0x0800EBBC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800EBD2
	bl ClearTalk
	b _0800EBFA
_0800EBD2:
	ldr r5, _0800EC00 @ =ProcScr_Face
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _0800EBFA
	bl sub_80095E4
	ldr r1, _0800EC04 @ =StartFaceFadeOut
	adds r0, r5, #0
	bl Proc_ForEach
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl sub_80149B4
_0800EBFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC00: .4byte ProcScr_Face
_0800EC04: .4byte StartFaceFadeOut

	thumb_func_start ClearTalk
ClearTalk: @ 0x0800EC08
	push {lr}
	bl sub_80095E4
	ldr r0, _0800EC20 @ =ProcScr_Face
	bl Proc_EndEach
	bl InitFaces
	bl sub_8007C64
	pop {r0}
	bx r0
	.align 2, 0
_0800EC20: .4byte ProcScr_Face

	thumb_func_start nullsub_27
nullsub_27: @ 0x0800EC24
	bx lr
	.align 2, 0

	thumb_func_start nullsub_28
nullsub_28: @ 0x0800EC28
	bx lr
	.align 2, 0

	thumb_func_start IsEventRunning
IsEventRunning: @ 0x0800EC2C
	push {lr}
	movs r0, #6
	bl sub_80045D0
	cmp r0, #0
	beq _0800EC3A
	movs r0, #1
_0800EC3A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800EC40
sub_800EC40: @ 0x0800EC40
	push {lr}
	ldr r0, _0800EC54 @ =ProcScr_Event
	bl Proc_FindNonBlocked
	cmp r0, #0
	beq _0800EC4E
	movs r0, #1
_0800EC4E:
	pop {r1}
	bx r1
	.align 2, 0
_0800EC54: .4byte ProcScr_Event

	thumb_func_start sub_800EC58
sub_800EC58: @ 0x0800EC58
	push {lr}
	movs r0, #6
	bl Proc_EndEachMarked
	movs r0, #7
	bl Proc_EndEachMarked
	movs r0, #5
	bl Proc_EndEachMarked
	bl EndAllMus
	pop {r0}
	bx r0

	thumb_func_start sub_800EC74
sub_800EC74: @ 0x0800EC74
	push {lr}
	ldr r0, _0800EC80 @ =gUnk_08C00CC8
	bl SetFaceConfig
	pop {r0}
	bx r0
	.align 2, 0
_0800EC80: .4byte gUnk_08C00CC8

	thumb_func_start sub_800EC84
sub_800EC84: @ 0x0800EC84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EC98 @ =gUnk_08C00CE8
	bl StartEvent
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EC98: .4byte gUnk_08C00CE8

	thumb_func_start sub_800EC9C
sub_800EC9C: @ 0x0800EC9C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0800ECB4 @ =gUnk_08C00CF8
	bl StartEvent
	str r4, [r0, #0x48]
	str r5, [r0, #0x58]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800ECB4: .4byte gUnk_08C00CF8

	thumb_func_start sub_800ECB8
sub_800ECB8: @ 0x0800ECB8
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _0800ECC8
	movs r1, #0
	bl sub_800376C
	b _0800ECCE
_0800ECC8:
	movs r0, #0x90
	bl SetBgmVolume
_0800ECCE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800ECD4
sub_800ECD4: @ 0x0800ECD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800ECE8 @ =gUnk_08C00D20
	bl StartEvent
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800ECE8: .4byte gUnk_08C00D20

	thumb_func_start sub_800ECEC
sub_800ECEC: @ 0x0800ECEC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_800ACD0
	ldr r0, _0800ED0C @ =gUnk_08C00D44
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED0C: .4byte gUnk_08C00D44

	thumb_func_start sub_800ED10
sub_800ED10: @ 0x0800ED10
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_800ACD0
	ldr r0, _0800ED30 @ =gUnk_08C00D84
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED30: .4byte gUnk_08C00D84

	thumb_func_start sub_800ED34
sub_800ED34: @ 0x0800ED34
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_800ACD0
	ldr r0, _0800ED54 @ =gUnk_08C00DC4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED54: .4byte gUnk_08C00DC4

	thumb_func_start sub_800ED58
sub_800ED58: @ 0x0800ED58
	push {r4, lr}
	adds r4, r1, #0
	bl sub_800ACDC
	ldr r0, _0800ED7C @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800ED84
	ldr r0, _0800ED80 @ =gUnk_08C00DEC
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
	b _0800ED90
	.align 2, 0
_0800ED7C: .4byte gActiveUnit
_0800ED80: .4byte gUnk_08C00DEC
_0800ED84:
	ldr r0, _0800ED98 @ =gUnk_08C00E24
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
_0800ED90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED98: .4byte gUnk_08C00E24

	thumb_func_start sub_800ED9C
sub_800ED9C: @ 0x0800ED9C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_800ACDC
	ldr r0, _0800EDB8 @ =gUnk_08C00DEC
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EDB8: .4byte gUnk_08C00DEC

	thumb_func_start sub_800EDBC
sub_800EDBC: @ 0x0800EDBC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_800ACD0
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	cmp r0, #0
	bne _0800EDE8
	ldr r0, _0800EDE4 @ =gUnk_08C00E5C
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl sub_800ACE8
	b _0800EDF4
	.align 2, 0
_0800EDE4: .4byte gUnk_08C00E5C
_0800EDE8:
	ldr r0, _0800EDFC @ =gUnk_08C00E9C
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl sub_800ACE8
_0800EDF4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EDFC: .4byte gUnk_08C00E9C

	thumb_func_start StartStoleItemPopup
StartStoleItemPopup: @ 0x0800EE00
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_800ACD0
	ldr r0, _0800EE28 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800EE30
	ldr r0, _0800EE2C @ =gUnk_08C00EDC
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
	b _0800EE3C
	.align 2, 0
_0800EE28: .4byte gActiveUnit
_0800EE2C: .4byte gUnk_08C00EDC
_0800EE30:
	ldr r0, _0800EE44 @ =gUnk_08C00F1C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_800ACE8
_0800EE3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE44: .4byte gUnk_08C00F1C

	thumb_func_start sub_800EE48
sub_800EE48: @ 0x0800EE48
	push {lr}
	adds r3, r0, #0
	ldr r0, _0800EE5C @ =gUnk_08C00F5C
	movs r1, #0x60
	movs r2, #0
	bl sub_800ACE8
	pop {r0}
	bx r0
	.align 2, 0
_0800EE5C: .4byte gUnk_08C00F5C

	thumb_func_start sub_800EE60
sub_800EE60: @ 0x0800EE60
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r2, #7
	bhi _0800EE7C
	ldr r0, _0800EE78 @ =gUnk_08C00F7C
	adds r1, r2, #0
	bl Proc_Start
	b _0800EE84
	.align 2, 0
_0800EE78: .4byte gUnk_08C00F7C
_0800EE7C:
	ldr r0, _0800EEA4 @ =gUnk_08C00F7C
	adds r1, r2, #0
	bl Proc_StartBlocking
_0800EE84:
	str r5, [r0, #0x58]
	str r4, [r0, #0x54]
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _0800EE9C
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_0800EE9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEA4: .4byte gUnk_08C00F7C

	thumb_func_start sub_800EEA8
sub_800EEA8: @ 0x0800EEA8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x58]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_800EDBC
	pop {r0}
	bx r0

	thumb_func_start sub_800EEBC
sub_800EEBC: @ 0x0800EEBC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x58]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_801DCB4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_800EED8
sub_800EED8: @ 0x0800EED8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800EEF0 @ =gUnk_08C00FAC
	bl StartEvent
	adds r0, #0x5c
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEF0: .4byte gUnk_08C00FAC

	thumb_func_start sub_800EEF4
sub_800EEF4: @ 0x0800EEF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800EF18 @ =gUnk_08C00FC4
	bl StartEvent
	adds r1, r0, #0
	adds r1, #0x55
	strb r4, [r1]
	adds r0, #0x5c
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF18: .4byte gUnk_08C00FC4

	thumb_func_start sub_800EF1C
sub_800EF1C: @ 0x0800EF1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EF30 @ =gUnk_08C00FE0
	bl StartEvent
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF30: .4byte gUnk_08C00FE0

	thumb_func_start sub_800EF34
sub_800EF34: @ 0x0800EF34
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800EF4C @ =gUnk_08C00FF8
	bl StartEvent
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF4C: .4byte gUnk_08C00FF8

	thumb_func_start sub_800EF50
sub_800EF50: @ 0x0800EF50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0800EF74 @ =gUnk_08C01004
	bl StartEvent
	adds r1, r0, #0
	adds r1, #0x5c
	strh r4, [r1]
	adds r0, #0x4f
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF74: .4byte gUnk_08C01004

	thumb_func_start sub_800EF78
sub_800EF78: @ 0x0800EF78
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800EF94 @ =gUnk_08C01020
	bl StartEvent
	str r5, [r0, #0x58]
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF94: .4byte gUnk_08C01020

	thumb_func_start sub_800EF98
sub_800EF98: @ 0x0800EF98
	push {lr}
	ldr r0, _0800EFB4 @ =ProcScr_Event
	bl Proc_Find
	cmp r0, #0
	beq _0800EFAE
	adds r0, #0x5e
	movs r1, #2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_0800EFAE:
	pop {r0}
	bx r0
	.align 2, 0
_0800EFB4: .4byte ProcScr_Event

	thumb_func_start sub_800EFB8
sub_800EFB8: @ 0x0800EFB8
	push {lr}
	bl sub_8079A50
	adds r1, r0, #0
	movs r2, #0
	b _0800EFC8
_0800EFC4:
	adds r2, #1
	adds r1, #0x10
_0800EFC8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800EFC4
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800EFD4
sub_800EFD4: @ 0x0800EFD4
	push {r4, r5, r6, r7, lr}
	bl sub_8079A50
	adds r6, r0, #0
	movs r7, #1
_0800EFDE:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0800F062
	ldr r2, [r4]
	cmp r2, #0
	beq _0800F062
	ldrb r0, [r6]
	cmp r0, #0
	bne _0800EFFC
	movs r0, #0xff
	strb r0, [r4, #0x10]
	b _0800F062
_0800EFFC:
	ldr r0, [r4, #0xc]
	ldr r1, _0800F050 @ =0x0201000C
	ands r0, r1
	cmp r0, #0
	bne _0800F062
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800F058
	ldr r5, _0800F054 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0800F02C
	movs r1, #1
_0800F02C:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _0800F046
	movs r1, #1
_0800F046:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	b _0800F062
	.align 2, 0
_0800F050: .4byte 0x0201000C
_0800F054: .4byte gPlaySt
_0800F058:
	ldrb r0, [r6, #6]
	strb r0, [r4, #0x10]
	ldrb r0, [r6, #7]
	strb r0, [r4, #0x11]
	adds r6, #0x10
_0800F062:
	adds r7, #1
	cmp r7, #0x3f
	ble _0800EFDE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800F070
sub_800F070: @ 0x0800F070
	push {r4, r5, lr}
	movs r4, #1
	movs r5, #1
	rsbs r5, r5, #0
_0800F078:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800F0BE
	ldr r0, [r2]
	cmp r0, #0
	beq _0800F0BE
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800F0BE
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F0A8
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
	b _0800F0BE
_0800F0A8:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800F0BE
	adds r0, r2, #0
	bl sub_800F0CC
_0800F0BE:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800F078
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800F0CC
sub_800F0CC: @ 0x0800F0CC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_8079A50
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F176
	ldr r4, _0800F124 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0800F0FE
	movs r1, #1
_0800F0FE:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0800F118
	movs r1, #1
_0800F118:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7, #0x11]
	b _0800F17C
	.align 2, 0
_0800F124: .4byte gPlaySt
_0800F128:
	ldrb r0, [r4, #6]
	strb r0, [r7, #0x10]
	ldrb r0, [r4, #7]
	strb r0, [r7, #0x11]
	b _0800F17C
_0800F132:
	movs r6, #0
	movs r5, #1
	b _0800F13A
_0800F138:
	adds r5, #1
_0800F13A:
	cmp r5, #0x3f
	bgt _0800F170
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800F138
	ldr r0, [r2]
	cmp r0, #0
	beq _0800F138
	ldr r0, [r2, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800F138
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r1, [r4, #6]
	cmp r0, r1
	bne _0800F138
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0800F138
	movs r6, #1
_0800F170:
	cmp r6, #0
	beq _0800F128
	adds r4, #0x10
_0800F176:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800F132
_0800F17C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_29
nullsub_29: @ 0x0800F184
	bx lr
	.align 2, 0

	thumb_func_start sub_800F188
sub_800F188: @ 0x0800F188
	push {r4, r5, r6, lr}
	movs r6, #1
_0800F18C:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0800F1F0
	ldr r1, [r4]
	cmp r1, #0
	beq _0800F1F0
	ldr r0, [r4, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800F1F0
	ldr r5, _0800F1FC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0800F1C4
	movs r1, #1
_0800F1C4:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _0800F1DE
	movs r1, #1
_0800F1DE:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
_0800F1F0:
	adds r6, #1
	cmp r6, #0x3f
	ble _0800F18C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F1FC: .4byte gPlaySt

	thumb_func_start sub_800F200
sub_800F200: @ 0x0800F200
	adds r0, #0x4d
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_800F208
sub_800F208: @ 0x0800F208
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0800F222
	adds r0, r2, #0
	adds r0, #0x4d
	strb r1, [r0]
_0800F222:
	bx lr

	thumb_func_start sub_800F224
sub_800F224: @ 0x0800F224
	push {lr}
	movs r0, #0
	bl sub_802E368
	pop {r0}
	bx r0

	thumb_func_start sub_800F230
sub_800F230: @ 0x0800F230
	push {lr}
	movs r0, #6
	bl sub_802E368
	pop {r0}
	bx r0

	thumb_func_start sub_800F23C
sub_800F23C: @ 0x0800F23C
	push {lr}
	ldr r0, _0800F24C @ =0x03005C40
	movs r1, #3
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_0800F24C: .4byte 0x03005C40

	thumb_func_start sub_800F250
sub_800F250: @ 0x0800F250
	push {lr}
	ldr r0, _0800F260 @ =0x03005A30
	movs r1, #3
	bl m4aMPlayFadeOutPause
	pop {r0}
	bx r0
	.align 2, 0
_0800F260: .4byte 0x03005A30

	thumb_func_start sub_800F264
sub_800F264: @ 0x0800F264
	push {lr}
	ldr r0, _0800F274 @ =0x03005A30
	movs r1, #2
	bl m4aMPlayFadeInContinue
	pop {r0}
	bx r0
	.align 2, 0
_0800F274: .4byte 0x03005A30

	thumb_func_start sub_800F278
sub_800F278: @ 0x0800F278
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F298
	ldr r4, _0800F294 @ =0x0000FFFF
	ands r4, r2
	b _0800F29C
	.align 2, 0
_0800F294: .4byte 0x0000FFFF
_0800F298:
	movs r4, #1
	rsbs r4, r4, #0
_0800F29C:
	ldr r2, [r3, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F2B0
	adds r6, r1, #0
_0800F2B0:
	ldr r5, [r2, #0xc]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F2D8
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_80B6374
	adds r0, r5, #0
	bl sub_80B63DC
	movs r0, #2
	b _0800F2DA
_0800F2D8:
	movs r0, #0
_0800F2DA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F2E0
sub_800F2E0: @ 0x0800F2E0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F2FC
	adds r0, r2, #0
	bl StartSlowLockingFadeFromBlack
	movs r0, #2
	b _0800F31C
_0800F2FC:
	ldr r2, _0800F320 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	movs r0, #0
_0800F31C:
	pop {r1}
	bx r1
	.align 2, 0
_0800F320: .4byte gDispIo

	thumb_func_start sub_800F324
sub_800F324: @ 0x0800F324
	push {lr}
	bl sub_80B63AC
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800F330
sub_800F330: @ 0x0800F330
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F34C
	ldr r3, _0800F348 @ =0x0000FFFF
	ands r3, r2
	b _0800F350
	.align 2, 0
_0800F348: .4byte 0x0000FFFF
_0800F34C:
	movs r3, #1
	rsbs r3, r3, #0
_0800F350:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800F364
	adds r4, r2, #0
_0800F364:
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F37C
	adds r0, r3, #0
	adds r1, r4, #0
	bl nullsub_3
	movs r0, #2
	b _0800F37E
_0800F37C:
	movs r0, #0
_0800F37E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800F384
sub_800F384: @ 0x0800F384
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F39A
	bl nullsub_4
	movs r0, #2
	b _0800F39C
_0800F39A:
	movs r0, #0
_0800F39C:
	pop {r1}
	bx r1

	thumb_func_start sub_800F3A0
sub_800F3A0: @ 0x0800F3A0
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F3BC
	ldr r4, _0800F3B8 @ =0x0000FFFF
	ands r4, r2
	b _0800F3C0
	.align 2, 0
_0800F3B8: .4byte 0x0000FFFF
_0800F3BC:
	movs r4, #1
	rsbs r4, r4, #0
_0800F3C0:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F3D4
	adds r5, r2, #0
_0800F3D4:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F3F0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B5D98
	movs r0, #2
	b _0800F3F2
_0800F3F0:
	movs r0, #0
_0800F3F2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800F3F8
sub_800F3F8: @ 0x0800F3F8
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F414
	ldr r3, _0800F410 @ =0x0000FFFF
	ands r3, r2
	b _0800F418
	.align 2, 0
_0800F410: .4byte 0x0000FFFF
_0800F414:
	movs r3, #1
	rsbs r3, r3, #0
_0800F418:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800F42C
	adds r4, r2, #0
_0800F42C:
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F444
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_80B6964
	movs r0, #2
	b _0800F446
_0800F444:
	movs r0, #0
_0800F446:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800F44C
sub_800F44C: @ 0x0800F44C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80B698C
	adds r4, #0x5e
	movs r0, #4
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800F464
	movs r0, #2
	b _0800F466
_0800F464:
	movs r0, #0
_0800F466:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800F46C
sub_800F46C: @ 0x0800F46C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r4, [r1, #4]
	ldr r5, [r1, #8]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F4AE
	cmp r2, #0
	beq _0800F4A2
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80B6580
	b _0800F4AE
_0800F4A2:
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B5B6C
_0800F4AE:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start nullsub_13
nullsub_13: @ 0x0800F4B8
	bx lr
	.align 2, 0

	thumb_func_start nullsub_14
nullsub_14: @ 0x0800F4BC
	bx lr
	.align 2, 0

	thumb_func_start sub_800F4C0
sub_800F4C0: @ 0x0800F4C0
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r4, [r1, #8]
	ldr r3, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F4E4
	adds r0, r2, #0
	bl EndFaceById
	b _0800F504
_0800F4E4:
	cmp r3, #0
	beq _0800F4FA
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r0, r3, #0
	movs r1, #7
	movs r3, #0
	bl sub_80B6580
	b _0800F504
_0800F4FA:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_80B5CA8
_0800F504:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start nullsub_15
nullsub_15: @ 0x0800F510
	bx lr
	.align 2, 0

	thumb_func_start nullsub_16
nullsub_16: @ 0x0800F514
	bx lr
	.align 2, 0

	thumb_func_start sub_800F518
sub_800F518: @ 0x0800F518
	push {lr}
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800F528
sub_800F528: @ 0x0800F528
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _0800F53E
	movs r0, #0
	b _0800F55C
_0800F53E:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl sub_80B5E04
	ldr r0, _0800F564 @ =EventEndTalk
	str r0, [r4, #0x40]
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0800F55A
	movs r0, #4
	bl SetTalkFlag
_0800F55A:
	movs r0, #2
_0800F55C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800F564: .4byte EventEndTalk

	thumb_func_start sub_800F568
sub_800F568: @ 0x0800F568
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F580
	movs r0, #1
	bl sub_80B4B58
	movs r0, #2
	b _0800F582
_0800F580:
	movs r0, #0
_0800F582:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F588
sub_800F588: @ 0x0800F588
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F5A0
	movs r0, #0
	bl sub_80B4B58
	movs r0, #2
	b _0800F5A2
_0800F5A0:
	movs r0, #0
_0800F5A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F5A8
sub_800F5A8: @ 0x0800F5A8
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F5BE
	bl sub_80B4BB0
	movs r0, #2
	b _0800F5C0
_0800F5BE:
	movs r0, #0
_0800F5C0:
	pop {r1}
	bx r1

	thumb_func_start sub_800F5C4
sub_800F5C4: @ 0x0800F5C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r7, [r0, #4]
	ldr r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800F5E4
	ldr r4, _0800F5E0 @ =0x0000FFFF
	ands r4, r3
	b _0800F5E8
	.align 2, 0
_0800F5E0: .4byte 0x0000FFFF
_0800F5E4:
	movs r4, #1
	rsbs r4, r4, #0
_0800F5E8:
	ldr r1, [r2, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F5FC
	adds r5, r3, #0
_0800F5FC:
	ldr r6, [r1, #0xc]
	ldr r3, [r1, #0x10]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F632
	cmp r3, #0
	beq _0800F626
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r3, #0
	movs r1, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_80B6580
	b _0800F632
_0800F626:
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_80B5724
_0800F632:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800F63C
sub_800F63C: @ 0x0800F63C
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F672
	cmp r3, #0
	beq _0800F66C
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r3, #0
	movs r1, #1
	movs r3, #0
	bl sub_80B6580
	b _0800F672
_0800F66C:
	adds r0, r2, #0
	bl sub_80B58FC
_0800F672:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F67C
sub_800F67C: @ 0x0800F67C
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r4, [r1, #8]
	ldr r2, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F6B8
	cmp r2, #0
	beq _0800F6B0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r2, #0
	movs r1, #2
	adds r2, r3, #0
	adds r3, r4, #0
	bl sub_80B6580
	b _0800F6B8
_0800F6B0:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_80B4810
_0800F6B8:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F6C4
sub_800F6C4: @ 0x0800F6C4
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F6E2
	movs r0, #0
	b _0800F700
_0800F6E2:
	cmp r3, #0
	beq _0800F6F8
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r3, #0
	movs r1, #3
	movs r3, #0
	bl sub_80B6580
	b _0800F6FE
_0800F6F8:
	adds r0, r2, #0
	bl sub_80B4934
_0800F6FE:
	movs r0, #2
_0800F700:
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F708
sub_800F708: @ 0x0800F708
	movs r1, #0
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_800F710
sub_800F710: @ 0x0800F710
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F726
	bl sub_80B49A8
	movs r0, #2
	b _0800F728
_0800F726:
	movs r0, #0
_0800F728:
	pop {r1}
	bx r1

	thumb_func_start sub_800F72C
sub_800F72C: @ 0x0800F72C
	movs r1, #0
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_800F734
sub_800F734: @ 0x0800F734
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F74A
	bl sub_80B4A20
	movs r0, #2
	b _0800F74C
_0800F74A:
	movs r0, #0
_0800F74C:
	pop {r1}
	bx r1

	thumb_func_start sub_800F750
sub_800F750: @ 0x0800F750
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F788
	cmp r2, #0
	beq _0800F782
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xa
	movs r2, #0
	movs r3, #0
	bl sub_80B6580
	b _0800F788
_0800F782:
	adds r0, r3, #0
	bl sub_80B6664
_0800F788:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_800F790
sub_800F790: @ 0x0800F790
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F7C8
	cmp r2, #0
	beq _0800F7C2
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #9
	movs r2, #0
	movs r3, #0
	bl sub_80B6580
	b _0800F7C8
_0800F7C2:
	adds r0, r3, #0
	bl sub_80B6754
_0800F7C8:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_800F7D0
sub_800F7D0: @ 0x0800F7D0
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F808
	cmp r2, #0
	beq _0800F802
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xc
	movs r2, #0
	movs r3, #0
	bl sub_80B6580
	b _0800F808
_0800F802:
	adds r0, r3, #0
	bl sub_80B56B0
_0800F808:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_800F810
sub_800F810: @ 0x0800F810
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F848
	cmp r2, #0
	beq _0800F842
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xb
	movs r2, #0
	movs r3, #0
	bl sub_80B6580
	b _0800F848
_0800F842:
	adds r0, r3, #0
	bl sub_80B5648
_0800F848:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_800F850
sub_800F850: @ 0x0800F850
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F86C
	ldr r4, _0800F868 @ =0x0000FFFF
	ands r4, r2
	b _0800F870
	.align 2, 0
_0800F868: .4byte 0x0000FFFF
_0800F86C:
	movs r4, #1
	rsbs r4, r4, #0
_0800F870:
	ldr r2, [r1, #0x30]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F884
	adds r5, r3, #0
_0800F884:
	ldr r2, [r2, #8]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F89A
	adds r0, r4, #0
	adds r1, r5, #0
	bl nullsub_5
_0800F89A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F8A4
sub_800F8A4: @ 0x0800F8A4
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F8B6
	bl nullsub_6
_0800F8B6:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800F8BC
sub_800F8BC: @ 0x0800F8BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F8DC
	ldr r5, _0800F8D8 @ =0x0000FFFF
	ands r5, r2
	b _0800F8E0
	.align 2, 0
_0800F8D8: .4byte 0x0000FFFF
_0800F8DC:
	movs r5, #1
	rsbs r5, r5, #0
_0800F8E0:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F8F4
	adds r6, r3, #0
_0800F8F4:
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F930
	cmp r2, #0
	beq _0800F91E
	str r5, [sp]
	str r6, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #5
	adds r2, r7, #0
	movs r3, #0
	bl sub_80B6580
	b _0800F930
_0800F91E:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	bl sub_80B5A80
_0800F930:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F93C
sub_800F93C: @ 0x0800F93C
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F954
	adds r0, r2, #0
	bl sub_80B5B34
_0800F954:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F95C
sub_800F95C: @ 0x0800F95C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F97C
	ldr r5, _0800F978 @ =0x0000FFFF
	ands r5, r2
	b _0800F980
	.align 2, 0
_0800F978: .4byte 0x0000FFFF
_0800F97C:
	movs r5, #1
	rsbs r5, r5, #0
_0800F980:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F994
	adds r6, r3, #0
_0800F994:
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F9D0
	cmp r2, #0
	beq _0800F9BE
	str r5, [sp]
	str r6, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #4
	adds r2, r7, #0
	movs r3, #0
	bl sub_80B6580
	b _0800F9D0
_0800F9BE:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	bl sub_80B59AC
_0800F9D0:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F9DC
sub_800F9DC: @ 0x0800F9DC
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F9F4
	adds r0, r2, #0
	bl sub_80B5A48
_0800F9F4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800F9FC
sub_800F9FC: @ 0x0800F9FC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FA1C
	ldr r4, _0800FA18 @ =0x0000FFFF
	ands r4, r2
	b _0800FA20
	.align 2, 0
_0800FA18: .4byte 0x0000FFFF
_0800FA1C:
	movs r4, #1
	rsbs r4, r4, #0
_0800FA20:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FA34
	adds r5, r2, #0
_0800FA34:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800FA48
	movs r0, #0
	b _0800FA6A
_0800FA48:
	cmp r3, #0
	beq _0800FA60
	str r4, [sp]
	str r5, [sp, #4]
	str r2, [sp, #8]
	adds r0, r3, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0
	bl sub_80B6580
	b _0800FA68
_0800FA60:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B5DBC
_0800FA68:
	movs r0, #2
_0800FA6A:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800FA74
sub_800FA74: @ 0x0800FA74
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl SetkeyStIgnoredMask
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800FA84
sub_800FA84: @ 0x0800FA84
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl SetScriptedBattle
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800FA94
sub_800FA94: @ 0x0800FA94
	push {lr}
	bl sub_804B378
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800FAA0
sub_800FAA0: @ 0x0800FAA0
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FAB4 @ =sub_804B0DC
	movs r1, #1
	bl sub_804B3F8
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FAB4: .4byte sub_804B0DC

	thumb_func_start sub_800FAB8
sub_800FAB8: @ 0x0800FAB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FADC @ =sub_804B0D8
	movs r1, #1
	bl sub_804B3F8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FAE0 @ =sub_801B624
	movs r1, #2
	bl sub_804B3F8
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800FADC: .4byte sub_804B0D8
_0800FAE0: .4byte sub_801B624

	thumb_func_start sub_800FAE4
sub_800FAE4: @ 0x0800FAE4
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FAF8 @ =sub_804B0D4
	movs r1, #1
	bl sub_804B3F8
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FAF8: .4byte sub_804B0D4

	thumb_func_start sub_800FAFC
sub_800FAFC: @ 0x0800FAFC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x30]
	ldrh r6, [r3, #2]
	movs r4, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FB9A
	ldr r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FB2C
	ldr r3, _0800FB28 @ =0x0000FFFF
	ands r3, r1
	b _0800FB30
	.align 2, 0
_0800FB28: .4byte 0x0000FFFF
_0800FB2C:
	movs r3, #1
	rsbs r3, r3, #0
_0800FB30:
	ldr r1, [r2, #0x30]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FB44
	adds r5, r2, #0
_0800FB44:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8084000
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _0800FB5C
	movs r0, #0x10
	orrs r4, r0
_0800FB5C:
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0800FB6C
	movs r0, #0x80
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FB6C:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _0800FB80
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FB80:
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	beq _0800FB90
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FB90:
	cmp r6, #0
	beq _0800FB9A
	adds r0, r4, #0
	bl sub_8083B9C
_0800FB9A:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800FBA4
sub_800FBA4: @ 0x0800FBA4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FC36
	bl sub_807AE3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FBFC
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FBD8
	ldr r3, _0800FBD4 @ =0x0000FFFF
	ands r3, r2
	b _0800FBDC
	.align 2, 0
_0800FBD4: .4byte 0x0000FFFF
_0800FBD8:
	movs r3, #1
	rsbs r3, r3, #0
_0800FBDC:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FBEE
	adds r4, r2, #0
_0800FBEE:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8084000
	b _0800FC36
_0800FBFC:
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FC14
	ldr r3, _0800FC10 @ =0x0000FFFF
	ands r3, r2
	b _0800FC18
	.align 2, 0
_0800FC10: .4byte 0x0000FFFF
_0800FC14:
	movs r3, #1
	rsbs r3, r3, #0
_0800FC18:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FC2A
	adds r4, r2, #0
_0800FC2A:
	ldr r2, [r1, #0xc]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8084000
_0800FC36:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800FC40
sub_800FC40: @ 0x0800FC40
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FC54
	movs r0, #0
	bl sub_80850A8
_0800FC54:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800FC5C
sub_800FC5C: @ 0x0800FC5C
	push {lr}
	movs r0, #0
	bl sub_807B158
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800FC6C
sub_800FC6C: @ 0x0800FC6C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800FC7E
	movs r0, #1
	bl sub_807B158
	b _0800FC82
_0800FC7E:
	bl sub_807B158
_0800FC82:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_800FC88
sub_800FC88: @ 0x0800FC88
	push {r4, lr}
	bl sub_807A284
	ldr r4, _0800FCB8 @ =0x0202A5A0
	strb r0, [r4]
	bl sub_807A2E4
	strb r0, [r4, #1]
	bl sub_807A344
	strb r0, [r4, #2]
	bl sub_807A3A4
	strb r0, [r4, #3]
	bl sub_807A3DC
	strb r0, [r4, #4]
	bl sub_807A414
	strb r0, [r4, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FCB8: .4byte 0x0202A5A0

	thumb_func_start sub_800FCBC
sub_800FCBC: @ 0x0800FCBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r4, [r0, #4]
	ldr r0, _0800FCF0 @ =0x0202A5A0
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800FCFC
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r0, _0800FCF4 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #8]
	str r0, [r5, #0x44]
	ldr r0, _0800FCF8 @ =sub_800CF2C
	str r0, [r5, #0x40]
	movs r0, #2
	b _0800FCFE
	.align 2, 0
_0800FCF0: .4byte 0x0202A5A0
_0800FCF4: .4byte 0x0202E3F0
_0800FCF8: .4byte sub_800CF2C
_0800FCFC:
	movs r0, #0
_0800FCFE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800FD04
sub_800FD04: @ 0x0800FD04
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldr r5, [r0, #4]
	ldr r1, _0800FD3C @ =0x0202A5A0
	ldr r0, [r0, #8]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800FD36
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r6, #0
	adds r4, #0x5e
	ldr r0, _0800FD40 @ =0x0000FFFD
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800FD44
_0800FD36:
	movs r0, #0
	b _0800FD6E
	.align 2, 0
_0800FD3C: .4byte 0x0202A5A0
_0800FD40: .4byte 0x0000FFFD
_0800FD44:
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r2, [r5, #4]
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
	movs r0, #0x80
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0800FD68
	movs r0, #4
	bl SetTalkFlag
_0800FD68:
	ldr r0, _0800FD74 @ =EventEndTalk
	str r0, [r6, #0x40]
	movs r0, #2
_0800FD6E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800FD74: .4byte EventEndTalk

	thumb_func_start sub_800FD78
sub_800FD78: @ 0x0800FD78
	push {r4, r5, lr}
	ldr r0, [r0, #0x30]
	ldr r4, [r0, #4]
	ldr r1, _0800FDC0 @ =0x0202A5A0
	ldr r0, [r0, #8]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800FDB6
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	movs r5, #2
	orrs r1, r5
	str r1, [r0, #0xc]
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0800FDB2
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	orrs r1, r5
	str r1, [r0, #0xc]
_0800FDB2:
	bl RefreshUnitSprites
_0800FDB6:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800FDC0: .4byte 0x0202A5A0

	thumb_func_start sub_800FDC4
sub_800FDC4: @ 0x0800FDC4
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x2c]
	str r2, [r0, #0x34]
	adds r1, #8
	str r1, [r0, #0x38]
	str r3, [r0, #0x30]
	str r3, [r0, #0x2c]
	movs r0, #1
	bx lr

	thumb_func_start EventCD_Warp
EventCD_Warp: @ 0x0800FDD8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FDF8
	ldr r5, _0800FDF4 @ =0x0000FFFF
	ands r5, r2
	b _0800FDFC
	.align 2, 0
_0800FDF4: .4byte 0x0000FFFF
_0800FDF8:
	movs r5, #1
	rsbs r5, r5, #0
_0800FDFC:
	ldr r3, [r4, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800FE10
	adds r6, r1, #0
_0800FE10:
	ldr r3, [r3, #8]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0800FE28
	movs r0, #0
	b _0800FE58
_0800FE28:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800FE44
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartEventWarpAnim
	b _0800FE56
_0800FE44:
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartEventWarpAnim
_0800FE56:
	movs r0, #2
_0800FE58:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_800FE60
sub_800FE60: @ 0x0800FE60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #4
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0800FE88
	movs r0, #0
	b _0800FEBE
_0800FE88:
	movs r5, #0x10
	ldrsb r5, [r2, r5]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0800FEAC
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartEventWarpAnim
	b _0800FEBC
_0800FEAC:
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartEventWarpAnim
_0800FEBC:
	movs r0, #2
_0800FEBE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800FEC8
sub_800FEC8: @ 0x0800FEC8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FEE4
	ldr r2, _0800FEE0 @ =0x0000FFFF
	ands r2, r1
	b _0800FEE8
	.align 2, 0
_0800FEE0: .4byte 0x0000FFFF
_0800FEE4:
	movs r2, #1
	rsbs r2, r2, #0
_0800FEE8:
	ldr r3, [r5, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800FEFC
	adds r7, r1, #0
_0800FEFC:
	ldr r6, [r3, #8]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FF30
	adds r0, r2, #0
	bl sub_80B7084
	adds r4, r0, #0
	subs r4, #0x10
	adds r0, r7, #0
	bl sub_80B7094
	adds r2, r0, #0
	subs r2, #0x28
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8020ECC
	movs r0, #2
	b _0800FF32
_0800FF30:
	movs r0, #0
_0800FF32:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800FF38
sub_800FF38: @ 0x0800FF38
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0800FF70 @ =gUnk_080C86F4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x4a
	ldrh r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0xd
	str r2, [sp, #4]
	movs r2, #0
	bl StartSpriteAnimProc
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x38]
	str r0, [r4, #0x3c]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FF70: .4byte gUnk_080C86F4

	thumb_func_start sub_800FF74
sub_800FF74: @ 0x0800FF74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, _08010014 @ =gSinLut
	movs r0, #0x48
	adds r0, r0, r6
	mov r8, r0
	ldrh r3, [r0]
	lsls r1, r3, #3
	movs r0, #0xff
	mov ip, r0
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r4, [r0, r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r5, [r1, r0]
	ldr r0, [r6, #0x38]
	ldr r3, [r6, #0x40]
	adds r0, r0, r3
	str r0, [r6, #0x38]
	ldr r1, [r6, #0x3c]
	ldr r7, [r6, #0x44]
	adds r1, r1, r7
	str r1, [r6, #0x3c]
	adds r0, r0, r4
	asrs r0, r0, #0xa
	ldr r2, [r6, #0x30]
	adds r4, r2, r0
	adds r1, r1, r5
	asrs r1, r1, #0xa
	ldr r0, [r6, #0x34]
	adds r2, r0, r1
	lsls r0, r3, #3
	subs r0, r0, r3
	cmp r0, #0
	bge _0800FFCC
	adds r0, #7
_0800FFCC:
	asrs r0, r0, #3
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, r0, r7
	cmp r0, #0
	bge _0800FFDA
	adds r0, #7
_0800FFDA:
	asrs r0, r0, #3
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x2c]
	ldr r1, _08010018 @ =0x000001FF
	ands r4, r1
	mov r1, ip
	ands r2, r1
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r3, [r1]
	adds r1, r4, #0
	bl SetSpriteAnimProcParameters
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _0801000A
	adds r0, r6, #0
	bl Proc_Break
_0801000A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010014: .4byte gSinLut
_08010018: .4byte 0x000001FF

	thumb_func_start sub_801001C
sub_801001C: @ 0x0801001C
	push {lr}
	ldr r0, [r0, #0x2c]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0

	thumb_func_start sub_8010028
sub_8010028: @ 0x08010028
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r4, [sp, #0x1c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08010068 @ =gUnk_08C01094
	adds r1, r7, #0
	bl Proc_Start
	adds r7, r0, #0
	str r5, [r7, #0x30]
	str r6, [r7, #0x34]
	mov r0, r8
	str r0, [r7, #0x40]
	mov r0, sb
	str r0, [r7, #0x44]
	adds r0, r7, #0
	adds r0, #0x4a
	strh r4, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010068: .4byte gUnk_08C01094

	thumb_func_start sub_801006C
sub_801006C: @ 0x0801006C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08010094 @ =gUnk_08C010BC
	bl Proc_Start
	lsls r4, r4, #4
	ldr r1, _08010098 @ =gBmSt
	ldrh r2, [r1, #0xc]
	subs r4, r4, r2
	adds r4, #8
	strh r4, [r0, #0x2a]
	lsls r5, r5, #4
	ldrh r1, [r1, #0xe]
	subs r5, r5, r1
	strh r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010094: .4byte gUnk_08C010BC
_08010098: .4byte gBmSt

	thumb_func_start sub_801009C
sub_801009C: @ 0x0801009C
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080100B8
	ldr r4, _080100B4 @ =0x0000FFFF
	ands r4, r1
	b _080100BC
	.align 2, 0
_080100B4: .4byte 0x0000FFFF
_080100B8:
	movs r4, #1
	rsbs r4, r4, #0
_080100BC:
	ldr r0, [r2, #0x30]
	ldrh r3, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080100D0
	adds r1, r3, #0
_080100D0:
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #4
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _080100E8
	adds r0, r4, #0
	bl sub_801006C
	movs r0, #2
	b _080100EA
_080100E8:
	movs r0, #0
_080100EA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80100F0
sub_80100F0: @ 0x080100F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08010120 @ =gUnk_080C8174
	ldr r1, _08010124 @ =0x06014000
	bl Decompress
	ldr r0, _08010128 @ =gUnk_080C86D4
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0
	movs r2, #0
	movs r0, #0x82
	lsls r0, r0, #8
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x36
	strb r1, [r0]
	str r2, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010120: .4byte gUnk_080C8174
_08010124: .4byte 0x06014000
_08010128: .4byte gUnk_080C86D4

	thumb_func_start sub_801012C
sub_801012C: @ 0x0801012C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080101A8
	ldr r1, [r5, #0x38]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	str r0, [r5, #0x38]
	ldr r2, _080101C0 @ =gSinLut
	movs r1, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r4, [r0, r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r3, [r1, r0]
	lsls r0, r4, #1
	adds r0, r0, r4
	asrs r2, r0, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _08010178
	rsbs r1, r4, #0
_08010178:
	adds r0, r3, #0
	cmp r3, #0
	bge _08010180
	rsbs r0, r3, #0
_08010180:
	cmp r1, r0
	ble _0801018A
	adds r4, r4, r3
	subs r3, r4, r3
	subs r4, r4, r3
_0801018A:
	cmp r3, #0
	ble _08010190
	rsbs r3, r3, #0
_08010190:
	movs r1, #0x2a
	ldrsh r0, [r5, r1]
	adds r0, r0, r2
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	adds r1, #4
	ldrh r2, [r5, #0x34]
	str r2, [sp]
	str r5, [sp, #4]
	adds r2, r4, #0
	bl sub_8010028
_080101A8:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _080101B8
	adds r0, r5, #0
	bl Proc_Break
_080101B8:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080101C0: .4byte gSinLut

	thumb_func_start nullsub_30
nullsub_30: @ 0x080101C4
	bx lr
	.align 2, 0

	thumb_func_start sub_80101C8
sub_80101C8: @ 0x080101C8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _08010220 @ =Img_DragonFlameSmallFire
	ldr r1, _08010224 @ =0x06014000
	bl Decompress
	ldr r0, _08010228 @ =Pal_DragonFlameSmallFire
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r6, #0
	movs r0, #0
	mov r8, r0
	movs r3, #0x82
	lsls r3, r3, #8
	strh r3, [r5, #0x38]
	ldr r0, _0801022C @ =gUnk_08193CD8
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	movs r4, #1
	str r4, [sp]
	movs r4, #0xd
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x3a
	strb r6, [r0]
	mov r0, r8
	str r0, [r5, #0x3c]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010220: .4byte Img_DragonFlameSmallFire
_08010224: .4byte 0x06014000
_08010228: .4byte Pal_DragonFlameSmallFire
_0801022C: .4byte gUnk_08193CD8

	thumb_func_start sub_8010230
sub_8010230: @ 0x08010230
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	adds r5, r0, #0
	add r0, sp, #8
	ldr r1, _080102CC @ =gUnk_0818F960
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	adds r7, r5, #0
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r6, [r7]
	adds r0, r6, #0
	movs r1, #0x14
	bl __modsi3
	mov r8, r0
	cmp r0, #0
	bne _080102B0
	ldr r4, _080102D0 @ =gUnk_08193CD8
	mov sb, r4
	movs r0, #0x2a
	ldrsh r4, [r5, r0]
	adds r0, r6, #0
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #3
	mov r1, sp
	adds r1, r1, r0
	adds r1, #8
	ldr r1, [r1]
	lsls r1, r1, #4
	adds r4, r4, r1
	adds r4, #8
	ldr r1, _080102D4 @ =0x000001FF
	ands r4, r1
	movs r1, #0x2c
	ldrsh r2, [r5, r1]
	add r1, sp, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	movs r0, #0xff
	ands r2, r0
	ldrh r3, [r5, #0x38]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	mov r0, sb
	adds r1, r4, #0
	bl StartSpriteAnimProc
_080102B0:
	ldrb r7, [r7]
	cmp r7, #0x50
	ble _080102BC
	adds r0, r5, #0
	bl Proc_Break
_080102BC:
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080102CC: .4byte gUnk_0818F960
_080102D0: .4byte gUnk_08193CD8
_080102D4: .4byte 0x000001FF

	thumb_func_start nullsub_31
nullsub_31: @ 0x080102D8
	bx lr
	.align 2, 0

	thumb_func_start sub_80102DC
sub_80102DC: @ 0x080102DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08010308 @ =gUnk_08C010EC
	bl Proc_Start
	lsls r4, r4, #4
	ldr r1, _0801030C @ =gBmSt
	ldrh r2, [r1, #0xc]
	subs r4, r4, r2
	adds r4, #0x10
	strh r4, [r0, #0x2a]
	lsls r5, r5, #4
	ldrh r1, [r1, #0xe]
	subs r5, r5, r1
	adds r5, #0x10
	strh r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010308: .4byte gUnk_08C010EC
_0801030C: .4byte gBmSt

	thumb_func_start sub_8010310
sub_8010310: @ 0x08010310
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0801032C
	ldr r4, _08010328 @ =0x0000FFFF
	ands r4, r1
	b _08010330
	.align 2, 0
_08010328: .4byte 0x0000FFFF
_0801032C:
	movs r4, #1
	rsbs r4, r4, #0
_08010330:
	ldr r0, [r2, #0x30]
	ldrh r3, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _08010344
	adds r1, r3, #0
_08010344:
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #4
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _0801035C
	adds r0, r4, #0
	bl sub_80102DC
	movs r0, #2
	b _0801035E
_0801035C:
	movs r0, #0
_0801035E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8010364
sub_8010364: @ 0x08010364
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	bl ApplySystemObjectsGraphics
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	bl InitTalk
	movs r0, #1
	bl EnableBgSync
	cmp r4, #0
	beq _0801038E
	cmp r4, #1
	beq _080103A8
	b _080103C4
_0801038E:
	str r6, [sp]
	ldr r0, _080103F8 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #3
	movs r1, #2
	movs r2, #0x14
	movs r3, #4
	bl sub_8088584
_080103A8:
	str r6, [sp]
	ldr r0, _080103F8 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	movs r1, #0x12
	movs r2, #0x14
	movs r3, #4
	bl sub_8088584
_080103C4:
	ldr r0, _080103FC @ =sub_8010600
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080103DA
	movs r0, #0x40
	orrs r5, r0
_080103DA:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080103E8
	ldr r0, _08010400 @ =0x00002820
	orrs r5, r0
_080103E8:
	adds r0, r5, #0
	bl sub_8087E2C
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080103F8: .4byte 0x06011000
_080103FC: .4byte sub_8010600
_08010400: .4byte 0x00002820

	thumb_func_start sub_8010404
sub_8010404: @ 0x08010404
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08010434 @ =0x0000FFFD
	ldrh r5, [r1]
	ands r0, r5
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08010438
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_8010364
	movs r0, #2
	b _0801043A
	.align 2, 0
_08010434: .4byte 0x0000FFFD
_08010438:
	movs r0, #0
_0801043A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8010440
sub_8010440: @ 0x08010440
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	ldr r2, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08010474 @ =0x0000FFFD
	ldrh r6, [r1]
	ands r0, r6
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08010478
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8010364
	movs r0, #2
	b _0801047A
	.align 2, 0
_08010474: .4byte 0x0000FFFD
_08010478:
	movs r0, #0
_0801047A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8010480
sub_8010480: @ 0x08010480
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r0, #4]
	ldr r4, [r0, #8]
	adds r0, r3, #0
	adds r0, #0x5e
	ldrh r2, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _080104B0
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _080104B0
	adds r0, r1, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_8010364
	movs r0, #2
	b _080104B2
_080104B0:
	movs r0, #0
_080104B2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80104B8
sub_80104B8: @ 0x080104B8
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080104CE
	bl EndCgText
	movs r0, #2
	b _080104D0
_080104CE:
	movs r0, #0
_080104D0:
	pop {r1}
	bx r1

	thumb_func_start sub_80104D4
sub_80104D4: @ 0x080104D4
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080104F0
	movs r0, #0
	b _08010532
_080104F0:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08010508
	bl LockBmDisplay
	bl LockMus
_08010508:
	movs r0, #0x61
	strb r0, [r4]
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0801053C @ =gBg3Tm
	str r5, [sp]
	movs r2, #8
	movs r3, #8
	bl sub_80B7980
	movs r0, #8
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
_08010532:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801053C: .4byte gBg3Tm

	thumb_func_start sub_8010540
sub_8010540: @ 0x08010540
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0801054E
	movs r0, #0
_0801054E:
	bx lr

	thumb_func_start sub_8010550
sub_8010550: @ 0x08010550
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r3, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _0801056A
	movs r0, #0
	b _080105A2
_0801056A:
	cmp r3, #1
	beq _0801058A
	cmp r3, #1
	bgt _08010578
	cmp r3, #0
	beq _08010582
	b _080105A0
_08010578:
	cmp r3, #2
	beq _08010592
	cmp r3, #3
	beq _0801059A
	b _080105A0
_08010582:
	movs r0, #0x10
	bl NewBlockedFadeIn
	b _080105A0
_0801058A:
	movs r0, #8
	bl NewBlockedFadeIn
	b _080105A0
_08010592:
	movs r0, #4
	bl NewBlockedFadeIn
	b _080105A0
_0801059A:
	movs r0, #2
	bl NewBlockedFadeIn
_080105A0:
	movs r0, #2
_080105A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80105A8
sub_80105A8: @ 0x080105A8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r3, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080105C2
	movs r0, #0
	b _080105FA
_080105C2:
	cmp r3, #1
	beq _080105E2
	cmp r3, #1
	bgt _080105D0
	cmp r3, #0
	beq _080105DA
	b _080105F8
_080105D0:
	cmp r3, #2
	beq _080105EA
	cmp r3, #3
	beq _080105F2
	b _080105F8
_080105DA:
	movs r0, #0x10
	bl NewBlockedFadeOut
	b _080105F8
_080105E2:
	movs r0, #8
	bl NewBlockedFadeOut
	b _080105F8
_080105EA:
	movs r0, #4
	bl NewBlockedFadeOut
	b _080105F8
_080105F2:
	movs r0, #2
	bl NewBlockedFadeOut
_080105F8:
	movs r0, #2
_080105FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8010600
sub_8010600: @ 0x08010600
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801061A
	bl EndCgText
	movs r0, #0
	b _08010626
_0801061A:
	bl sub_80886E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08010628
_08010626:
	str r0, [r4, #0x40]
_08010628:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
