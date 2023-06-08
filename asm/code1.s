	.include "macro.inc"
	.syntax unified

	thumb_func_start GetTextPrintDelay
GetTextPrintDelay: @ 0x0802E380
	push {lr}
	sub sp, #4
	ldr r1, _0802E3A4 @ =0x081C9814
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _0802E3A8 @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r0, [r0]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0802E3A4: .4byte 0x081C9814
_0802E3A8: .4byte gPlaySt

	thumb_func_start sub_0802E3AC
sub_0802E3AC: @ 0x0802E3AC
	push {lr}
	bl sub_0809F9D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E3BC
	movs r0, #1
	b _0802E3DA
_0802E3BC:
	ldr r1, _0802E3D4 @ =gPlaySt
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0802E3D8
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	b _0802E3DA
	.align 2, 0
_0802E3D4: .4byte gPlaySt
_0802E3D8:
	movs r0, #0
_0802E3DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802E3E0
sub_0802E3E0: @ 0x0802E3E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r7, _0802E4AC @ =gPlaySt
	ldr r2, _0802E4B0 @ =0x01000024
	adds r1, r7, #0
	bl CpuSet
	strb r4, [r7, #0xe]
	cmp r5, #0
	beq _0802E40C
	movs r0, #0x40
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
_0802E40C:
	movs r3, #0x42
	adds r3, r3, r7
	mov ip, r3
	movs r4, #7
	rsbs r4, r4, #0
	adds r3, r4, #0
	mov r5, ip
	ldrb r5, [r5]
	ands r3, r5
	movs r6, #3
	rsbs r6, r6, #0
	mov r8, r6
	mov r2, r8
	ldr r0, _0802E4B4 @ =0x0202BC34
	ldrb r0, [r0]
	ands r2, r0
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r2, r1
	movs r5, #0x11
	rsbs r5, r5, #0
	ands r2, r5
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r5, #0x7f
	ands r2, r5
	movs r6, #0x41
	adds r6, r6, r7
	mov sl, r6
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
	mov r1, sb
	ldrb r6, [r6]
	ands r1, r6
	mov r0, r8
	ands r1, r0
	movs r6, #0xd
	rsbs r6, r6, #0
	ands r1, r6
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	ands r1, r5
	adds r0, #0x28
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	ldr r0, _0802E4B8 @ =0xFFFFFE7F
	mov r3, ip
	ldrh r3, [r3]
	ands r0, r3
	mov r5, ip
	strh r0, [r5]
	adds r0, r7, #0
	adds r0, #0x43
	ldrb r6, [r0]
	ands r4, r6
	strb r4, [r0]
	mov r0, sb
	ands r2, r0
	ldr r3, _0802E4B4 @ =0x0202BC34
	strb r2, [r3]
	movs r5, #0x11
	rsbs r5, r5, #0
	ands r1, r5
	mov r6, sl
	strb r1, [r6]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E4AC: .4byte gPlaySt
_0802E4B0: .4byte 0x01000024
_0802E4B4: .4byte 0x0202BC34
_0802E4B8: .4byte 0xFFFFFE7F

	thumb_func_start sub_0802E4BC
sub_0802E4BC: @ 0x0802E4BC
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _0802E4E0 @ =gBmSt
	movs r5, #1
	ldrsb r5, [r4, r5]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0802E4E4 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E4E0: .4byte gBmSt
_0802E4E4: .4byte 0x01000020

	thumb_func_start sub_0802E4E8
sub_0802E4E8: @ 0x0802E4E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl sub_08002A44
	ldr r0, _0802E59C @ =OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0802E5A0 @ =OnVBlank
	bl SetInterrupt_LCDVBlank
	bl sub_0802E4BC
	bl sub_08015A48
	bl ApplyUnitSpritePalettes
	bl sub_08079FDC
	bl sub_08025184
	bl InitTraps
	ldr r4, _0802E5A4 @ =gPlaySt
	movs r5, #0
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r6, #0
	strh r5, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	bl sub_08015998
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl sub_0802C078
	bl GetGameTime
	str r0, [r4, #4]
	strh r5, [r4, #0x16]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl sub_08034AC4
	mov r0, r8
	bl sub_0802E848
	ldr r0, _0802E5A8 @ =0x02022860
	strh r5, [r0]
	bl EnablePalSync
	ldr r2, _0802E5AC @ =0x030027CC
	ldr r0, _0802E5B0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	strb r6, [r2, #8]
	strb r6, [r2, #9]
	movs r0, #0x10
	strb r0, [r2, #0xa]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E59C: .4byte OnGameLoopMain
_0802E5A0: .4byte OnVBlank
_0802E5A4: .4byte gPlaySt
_0802E5A8: .4byte 0x02022860
_0802E5AC: .4byte 0x030027CC
_0802E5B0: .4byte 0x0000FFE0

	thumb_func_start sub_0802E5B4
sub_0802E5B4: @ 0x0802E5B4
	push {r4, r5, lr}
	movs r0, #0
	bl sub_08002A44
	ldr r0, _0802E638 @ =OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0802E63C @ =OnVBlank
	bl SetInterrupt_LCDVBlank
	bl sub_08015A48
	bl ApplyUnitSpritePalettes
	bl sub_08025184
	bl InitTraps
	ldr r4, _0802E640 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	ldrb r0, [r0, #0x12]
	movs r5, #0
	strb r0, [r4, #0x15]
	bl sub_08015998
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl sub_0802C078
	bl sub_08034AC4
	bl sub_0802D864
	bl StartBmVSync
	ldr r0, _0802E644 @ =0x08C05464
	movs r1, #4
	bl Proc_Start
	ldr r0, _0802E648 @ =0x02022860
	strh r5, [r0]
	bl EnablePalSync
	ldr r2, _0802E64C @ =0x03002790
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E638: .4byte OnGameLoopMain
_0802E63C: .4byte OnVBlank
_0802E640: .4byte gPlaySt
_0802E644: .4byte 0x08C05464
_0802E648: .4byte 0x02022860
_0802E64C: .4byte 0x03002790

	thumb_func_start sub_0802E650
sub_0802E650: @ 0x0802E650
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802E6D0 @ =gPlaySt
	ldrb r0, [r4, #0xe]
	cmp r0, #0x30
	bne _0802E660
	bl sub_080A2B50
_0802E660:
	movs r0, #0
	bl sub_08002A44
	ldr r0, _0802E6D4 @ =OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0802E6D8 @ =OnVBlank
	bl SetInterrupt_LCDVBlank
	bl sub_0802E4BC
	ldrb r0, [r4, #0x12]
	ldrb r1, [r4, #0x13]
	bl sub_08015F0C
	bl sub_08015A48
	bl ApplyUnitSpritePalettes
	bl sub_08025184
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	ldr r4, _0802E6DC @ =gBmSt
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_0802E848
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_08015D98
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_08015DC0
	strh r0, [r4, #0xe]
	ldr r0, _0802E6E0 @ =gActionSt
	ldrb r0, [r0, #0x16]
	cmp r0, #9
	bhi _0802E736
	lsls r0, r0, #2
	ldr r1, _0802E6E4 @ =_0802E6E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E6D0: .4byte gPlaySt
_0802E6D4: .4byte OnGameLoopMain
_0802E6D8: .4byte OnVBlank
_0802E6DC: .4byte gBmSt
_0802E6E0: .4byte gActionSt
_0802E6E4: .4byte _0802E6E8
_0802E6E8: @ jump table
	.4byte _0802E718 @ case 0
	.4byte _0802E710 @ case 1
	.4byte _0802E718 @ case 2
	.4byte _0802E720 @ case 3
	.4byte _0802E728 @ case 4
	.4byte _0802E736 @ case 5
	.4byte _0802E736 @ case 6
	.4byte _0802E736 @ case 7
	.4byte _0802E736 @ case 8
	.4byte _0802E730 @ case 9
_0802E710:
	adds r0, r5, #0
	bl sub_0802EA08
	b _0802E736
_0802E718:
	adds r0, r5, #0
	bl sub_0802E9CC
	b _0802E736
_0802E720:
	adds r0, r5, #0
	bl sub_0802EA88
	b _0802E736
_0802E728:
	adds r0, r5, #0
	bl sub_0802EAC4
	b _0802E736
_0802E730:
	adds r0, r5, #0
	bl sub_0802EB40
_0802E736:
	ldr r2, _0802E760 @ =0x030027CC
	ldr r0, _0802E764 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	movs r0, #0x10
	strb r0, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E760: .4byte 0x030027CC
_0802E764: .4byte 0x0000FFE0

	thumb_func_start sub_0802E768
sub_0802E768: @ 0x0802E768
	push {lr}
	ldr r0, _0802E7D0 @ =OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0802E7D4 @ =OnVBlank
	bl SetInterrupt_LCDVBlank
	bl sub_08015A48
	bl ApplyUnitSpritePalettes
	bl ClearBg0Bg1
	ldr r3, _0802E7D8 @ =0x03002790
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #0
	bl sub_08001818
	ldr r0, _0802E7DC @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0802E7D0: .4byte OnGameLoopMain
_0802E7D4: .4byte OnVBlank
_0802E7D8: .4byte 0x03002790
_0802E7DC: .4byte 0x02023C60

	thumb_func_start sub_0802E7E0
sub_0802E7E0: @ 0x0802E7E0
	push {lr}
	bl sub_08015A0C
	ldr r0, _0802E7FC @ =gBattleActor
	bl sub_0806C2DC
	bl sub_0806C7CC
	ldr r0, _0802E800 @ =0x08C05540
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802E7FC: .4byte gBattleActor
_0802E800: .4byte 0x08C05540

	thumb_func_start sub_0802E804
sub_0802E804: @ 0x0802E804
	push {r4, lr}
	ldr r4, _0802E830 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_080195BC
	ldrb r0, [r4, #0x15]
	bl sub_0802D8E4
	bl RenderMap
	bl RefreshUnitSprites
	bl ApplyUnitSpritePalettes
	bl sub_08025A0C
	bl sub_08005904
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E830: .4byte gPlaySt

	thumb_func_start sub_0802E834
sub_0802E834: @ 0x0802E834
	push {lr}
	movs r0, #0
	bl sub_08002A44
	bl sub_08015A48
	bl sub_0802E804
	pop {r0}
	bx r0

	thumb_func_start sub_0802E848
sub_0802E848: @ 0x0802E848
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802E874 @ =0x08C01DBC
	movs r1, #2
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x54]
	adds r4, #0x28
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl StartBmVSync
	ldr r0, _0802E878 @ =0x08C05464
	movs r1, #4
	bl Proc_Start
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802E874: .4byte 0x08C01DBC
_0802E878: .4byte 0x08C05464

	thumb_func_start sub_0802E87C
sub_0802E87C: @ 0x0802E87C
	push {lr}
	movs r0, #1
	bl sub_08004710
	ldr r0, _0802E89C @ =0x08C01DBC
	bl Proc_Find
	ldr r1, [r0, #0x54]
	adds r1, #0x28
	ldrb r2, [r1]
	subs r2, #1
	strb r2, [r1]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0802E89C: .4byte 0x08C01DBC

	thumb_func_start sub_0802E8A0
sub_0802E8A0: @ 0x0802E8A0
	push {r4, r5, r6, r7, lr}
	movs r4, #0x41
_0802E8A4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0802E8BC
	ldr r0, [r1]
	cmp r0, #0
	beq _0802E8BC
	adds r0, r1, #0
	bl ClearUnit
_0802E8BC:
	adds r4, #1
	cmp r4, #0xbf
	ble _0802E8A4
	ldr r0, _0802E938 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	beq _0802E940
	movs r6, #1
_0802E8CC:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E930
	ldr r0, [r4]
	cmp r0, #0
	beq _0802E930
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	movs r5, #0
	strb r5, [r0]
	ldr r3, [r4, #0xc]
	ldr r0, _0802E93C @ =0x0631E004
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E920
	movs r0, #5
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
_0802E920:
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	strb r5, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
_0802E930:
	adds r6, #1
	cmp r6, #0x3f
	ble _0802E8CC
	b _0802E9B2
	.align 2, 0
_0802E938: .4byte gPlaySt
_0802E93C: .4byte 0x0631E004
_0802E940:
	movs r6, #1
_0802E942:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E9AC
	ldr r0, [r4]
	cmp r0, #0
	beq _0802E9AC
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r5, #0
	movs r7, #1
	strb r7, [r4, #0x11]
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r5, [r0]
	ldr r3, [r4, #0xc]
	ldr r0, _0802E9C4 @ =0x0631E00C
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E99E
	movs r0, #5
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
_0802E99E:
	ldr r0, [r4, #0xc]
	orrs r0, r7
	str r0, [r4, #0xc]
	strb r5, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
_0802E9AC:
	adds r6, #1
	cmp r6, #0x3f
	ble _0802E942
_0802E9B2:
	ldr r1, _0802E9C8 @ =gPlaySt
	movs r0, #0xef
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E9C4: .4byte 0x0631E00C
_0802E9C8: .4byte gPlaySt

	thumb_func_start sub_0802E9CC
sub_0802E9CC: @ 0x0802E9CC
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802EA04 @ =0x03002790
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
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA04: .4byte 0x03002790

	thumb_func_start sub_0802EA08
sub_0802EA08: @ 0x0802EA08
	push {r4, r5, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802EA78 @ =0x03002790
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
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	ldr r4, _0802EA7C @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r5, _0802EA80 @ =gActiveUnit
	str r0, [r5]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r2, _0802EA84 @ =gBmMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl HideUnitSprite
	ldr r0, [r5]
	bl sub_0806C2DC
	bl sub_0806C7CC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA78: .4byte 0x03002790
_0802EA7C: .4byte gActionSt
_0802EA80: .4byte gActiveUnit
_0802EA84: .4byte gBmMapUnit

	thumb_func_start sub_0802EA88
sub_0802EA88: @ 0x0802EA88
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802EAC0 @ =0x03002790
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
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EAC0: .4byte 0x03002790

	thumb_func_start sub_0802EAC4
sub_0802EAC4: @ 0x0802EAC4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0802EB30 @ =gActionSt
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldr r4, _0802EB34 @ =gActiveUnit
	str r0, [r4]
	bl sub_0802EF68
	ldr r0, [r4]
	bl sub_0802AB90
	bl sub_0802A860
	ldr r2, _0802EB38 @ =0x03002790
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
	bl RefreshEntityMaps
	ldr r0, _0802EB3C @ =gBmMapUnit
	ldr r1, [r0]
	ldrb r2, [r5, #0xf]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r5, [r5, #0xe]
	adds r0, r5, r0
	movs r1, #0
	strb r1, [r0]
	bl RefreshUnitSprites
	adds r0, r6, #0
	movs r1, #8
	bl Proc_Goto
	bl sub_080B34C8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EB30: .4byte gActionSt
_0802EB34: .4byte gActiveUnit
_0802EB38: .4byte 0x03002790
_0802EB3C: .4byte gBmMapUnit

	thumb_func_start sub_0802EB40
sub_0802EB40: @ 0x0802EB40
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802EB78 @ =0x03002790
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
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EB78: .4byte 0x03002790

	thumb_func_start sub_0802EB7C
sub_0802EB7C: @ 0x0802EB7C
	push {r4, lr}
	ldr r4, _0802EB9C @ =gPlaySt
	adds r0, r4, #0
	bl sub_080A05A0
	bl sub_080B7880
	bl sub_080A0054
	movs r0, #0x20
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EB9C: .4byte gPlaySt

	thumb_func_start sub_0802EBA0
sub_0802EBA0: @ 0x0802EBA0
	push {lr}
	movs r0, #2
	bl sub_08013200
	bl sub_080A0E48
	pop {r0}
	bx r0

	thumb_func_start sub_0802EBB0
sub_0802EBB0: @ 0x0802EBB0
	ldr r0, _0802EBB4 @ =0x0202BC14
	bx lr
	.align 2, 0
_0802EBB4: .4byte 0x0202BC14

	thumb_func_start sub_0802EBB8
sub_0802EBB8: @ 0x0802EBB8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802EBC8 @ =0x0202BC14
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_0802EBC8: .4byte 0x0202BC14

	thumb_func_start sub_0802EBCC
sub_0802EBCC: @ 0x0802EBCC
	ldr r0, _0802EBD0 @ =0x0203A71C
	bx lr
	.align 2, 0
_0802EBD0: .4byte 0x0203A71C

	thumb_func_start sub_0802EBD4
sub_0802EBD4: @ 0x0802EBD4
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0802EBF0 @ =0x0203A71C
	ldr r2, _0802EBF4 @ =0x01000064
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802EBF0: .4byte 0x0203A71C
_0802EBF4: .4byte 0x01000064

	thumb_func_start sub_0802EBF8
sub_0802EBF8: @ 0x0802EBF8
	push {r4, r5, r6, lr}
	ldr r6, _0802EC38 @ =0x02020140
	adds r4, r6, #0
	bl sub_0802EBCC
	adds r1, r0, #0
	movs r5, #0
_0802EC06:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0802EC10
	strh r0, [r4]
	adds r4, #2
_0802EC10:
	adds r1, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x63
	bls _0802EC06
	movs r0, #0
	strh r0, [r4]
	bl sub_0802EBD4
	bl sub_0802EBCC
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EC38: .4byte 0x02020140

	thumb_func_start sub_0802EC3C
sub_0802EC3C: @ 0x0802EC3C
	movs r3, #0
	ldr r2, _0802EC58 @ =0x0203A71C
	movs r1, #0x63
_0802EC42:
	ldrh r0, [r2]
	cmp r0, #0
	beq _0802EC4A
	adds r3, #1
_0802EC4A:
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0802EC42
	adds r0, r3, #0
	bx lr
	.align 2, 0
_0802EC58: .4byte 0x0203A71C

	thumb_func_start AddItemToConvoy
AddItemToConvoy: @ 0x0802EC5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0802EC78 @ =gBmSt
	movs r0, #0
	strh r0, [r1, #0x2e]
	movs r3, #0
	ldr r2, _0802EC7C @ =0x0203A71C
_0802EC6A:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0802EC80
	strh r4, [r2]
	adds r0, r3, #0
	b _0802EC8E
	.align 2, 0
_0802EC78: .4byte gBmSt
_0802EC7C: .4byte 0x0203A71C
_0802EC80:
	adds r2, #2
	adds r3, #1
	cmp r3, #0x63
	ble _0802EC6A
	strh r4, [r1, #0x2e]
	movs r0, #1
	rsbs r0, r0, #0
_0802EC8E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start RemoveItemFromConvoy
RemoveItemFromConvoy: @ 0x0802EC94
	push {lr}
	ldr r1, _0802ECA8 @ =0x0203A71C
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	bl sub_0802EBF8
	pop {r0}
	bx r0
	.align 2, 0
_0802ECA8: .4byte 0x0203A71C

	thumb_func_start GetConvoyItemSlot
GetConvoyItemSlot: @ 0x0802ECAC
	push {r4, r5, lr}
	adds r2, r0, #0
	bl GetItemIndex
	adds r2, r0, #0
	movs r1, #0
	movs r4, #0xff
	ldr r3, _0802ECCC @ =0x0203A71C
_0802ECBC:
	adds r0, r4, #0
	ldrh r5, [r3]
	ands r0, r5
	cmp r2, r0
	bne _0802ECD0
	adds r0, r1, #0
	b _0802ECDC
	.align 2, 0
_0802ECCC: .4byte 0x0203A71C
_0802ECD0:
	adds r3, #2
	adds r1, #1
	cmp r1, #0x63
	ble _0802ECBC
	movs r0, #1
	rsbs r0, r0, #0
_0802ECDC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802ECE4
sub_0802ECE4: @ 0x0802ECE4
	push {r4, lr}
	movs r4, #1
_0802ECE8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802ED20
	ldr r3, [r2]
	cmp r3, #0
	beq _0802ED20
	ldr r0, [r2, #0xc]
	ldr r1, _0802ED1C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0802ED20
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802ED20
	movs r0, #1
	b _0802ED28
	.align 2, 0
_0802ED1C: .4byte 0x0001000C
_0802ED20:
	adds r4, #1
	cmp r4, #0x3f
	ble _0802ECE8
	movs r0, #0
_0802ED28:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802ED30
sub_0802ED30: @ 0x0802ED30
	push {r4, lr}
	ldr r4, _0802ED54 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0802ED46
	movs r1, #1
_0802ED46:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0802ED58
	movs r0, #1
	b _0802ED5A
	.align 2, 0
_0802ED54: .4byte gPlaySt
_0802ED58:
	movs r0, #0
_0802ED5A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetSupplyUnit
GetSupplyUnit: @ 0x0802ED60
	push {r4, lr}
	movs r4, #1
_0802ED64:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802ED8C
	ldr r1, [r2]
	cmp r1, #0
	beq _0802ED8C
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802ED8C
	adds r0, r2, #0
	b _0802ED94
_0802ED8C:
	adds r4, #1
	cmp r4, #0x3f
	ble _0802ED64
	movs r0, #0
_0802ED94:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start InitUnitStack
InitUnitStack: @ 0x0802ED9C
	ldr r2, _0802EDAC @ =0x0203A7E4
	ldr r1, _0802EDB0 @ =0x0203A7E8
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0802EDB4 @ =0x0203A7EC
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802EDAC: .4byte 0x0203A7E4
_0802EDB0: .4byte 0x0203A7E8
_0802EDB4: .4byte 0x0203A7EC

	thumb_func_start PushUnit
PushUnit: @ 0x0802EDB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802EDE4 @ =0x0203A7E8
	ldr r1, [r4]
	movs r5, #0
	str r5, [r1]
	bl CopyUnit
	ldr r2, [r4]
	ldr r1, _0802EDE8 @ =0x0203A7EC
	ldrb r0, [r1]
	strb r0, [r2, #0xb]
	strb r5, [r6, #0x12]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x48
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EDE4: .4byte 0x0203A7E8
_0802EDE8: .4byte 0x0203A7EC

	thumb_func_start LoadPlayerUnitsFromUnitStack
LoadPlayerUnitsFromUnitStack: @ 0x0802EDEC
	push {r4, r5, lr}
	ldr r5, _0802EE20 @ =gUnitArrayBlue
	movs r4, #0x3d
_0802EDF2:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge _0802EDF2
	ldr r0, _0802EE24 @ =0x0203A7E4
	ldr r0, [r0]
	ldr r1, _0802EE20 @ =gUnitArrayBlue
	ldr r2, _0802EE28 @ =0x0203A7E8
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EE20: .4byte gUnitArrayBlue
_0802EE24: .4byte 0x0203A7E4
_0802EE28: .4byte 0x0203A7E8

	thumb_func_start LoadPlayerUnitsFromUnitStack2
LoadPlayerUnitsFromUnitStack2: @ 0x0802EE2C
	push {r4, r5, lr}
	ldr r5, _0802EE60 @ =gUnitArrayBlue
	movs r4, #0x3d
_0802EE32:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge _0802EE32
	ldr r0, _0802EE64 @ =0x0203A7E4
	ldr r0, [r0]
	ldr r1, _0802EE60 @ =gUnitArrayBlue
	ldr r2, _0802EE68 @ =0x0203A7E8
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EE60: .4byte gUnitArrayBlue
_0802EE64: .4byte 0x0203A7E4
_0802EE68: .4byte 0x0203A7E8

	thumb_func_start sub_0802EE6C
sub_0802EE6C: @ 0x0802EE6C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0802EED0 @ =gArenaSt
	str r4, [r5]
	ldr r0, _0802EED4 @ =0x0203A810
	str r0, [r5, #4]
	ldr r2, _0802EED8 @ =0x03002778
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	bl sub_0802EF8C
	strb r0, [r5, #0xd]
	ldrb r0, [r5, #0xd]
	bl sub_0802EFE4
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x10]
	bl GetClassData
	bl sub_0802EFB8
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #0xd]
	bl sub_0802F0B0
	strb r0, [r5, #0x13]
	ldrb r0, [r5, #0xe]
	bl sub_0802F0B0
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #8]
	strb r0, [r5, #0x11]
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _0802EEDC
	ldrb r0, [r5, #0x11]
	bl sub_0802F0C8
	b _0802EEE4
	.align 2, 0
_0802EED0: .4byte gArenaSt
_0802EED4: .4byte 0x0203A810
_0802EED8: .4byte 0x03002778
_0802EEDC:
	ldrb r0, [r5, #0x11]
	bl sub_0802F0C8
	adds r0, #7
_0802EEE4:
	strb r0, [r5, #0x12]
	bl sub_0802F154
	bl sub_0802F240
	movs r4, #0
	b _0802EEF4
_0802EEF2:
	adds r4, #1
_0802EEF4:
	cmp r4, #9
	bgt _0802EF02
	bl sub_0802F428
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EEF2
_0802EF02:
	movs r4, #0
	b _0802EF08
_0802EF06:
	adds r4, #1
_0802EF08:
	cmp r4, #4
	bgt _0802EF16
	bl sub_0802F2E0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EF06
_0802EF16:
	ldr r4, _0802EF48 @ =gArenaSt
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl sub_0802F0E4
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl sub_0802F0E4
	strh r0, [r4, #0x18]
	bl sub_0802F578
	movs r0, #1
	strb r0, [r4, #0xb]
	movs r0, #0
	bl sub_0802F5B8
	bl sub_0802F6A0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF48: .4byte gArenaSt

	thumb_func_start sub_0802EF4C
sub_0802EF4C: @ 0x0802EF4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802EF64 @ =0x0203A85E
	bl RandGetSt
	adds r0, r4, #0
	bl sub_0802EE6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF64: .4byte 0x0203A85E

	thumb_func_start sub_0802EF68
sub_0802EF68: @ 0x0802EF68
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802EF88 @ =0x0203A85E
	adds r0, r4, #0
	bl RandSetSt
	adds r0, r5, #0
	bl sub_0802EE6C
	subs r4, #6
	adds r0, r4, #0
	bl RandSetSt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF88: .4byte 0x0203A85E

	thumb_func_start sub_0802EF8C
sub_0802EF8C: @ 0x0802EF8C
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x28
_0802EF9A:
	cmp r1, #4
	beq _0802EFAA
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802EFAA
	adds r2, r0, #0
	adds r3, r1, #0
_0802EFAA:
	adds r1, #1
	cmp r1, #7
	ble _0802EF9A
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0802EFB8
sub_0802EFB8: @ 0x0802EFB8
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x2c
_0802EFC6:
	cmp r1, #4
	beq _0802EFD6
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802EFD6
	adds r2, r0, #0
	adds r3, r1, #0
_0802EFD6:
	adds r1, #1
	cmp r1, #7
	ble _0802EFC6
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0802EFE4
sub_0802EFE4: @ 0x0802EFE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	mov r8, r6
	cmp r0, #7
	bhi _0802F038
	lsls r0, r0, #2
	ldr r1, _0802EFFC @ =_0802F000
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EFFC: .4byte _0802F000
_0802F000: @ jump table
	.4byte _0802F020 @ case 0
	.4byte _0802F020 @ case 1
	.4byte _0802F020 @ case 2
	.4byte _0802F028 @ case 3
	.4byte _0802F038 @ case 4
	.4byte _0802F034 @ case 5
	.4byte _0802F034 @ case 6
	.4byte _0802F034 @ case 7
_0802F020:
	ldr r0, _0802F024 @ =0x08C05558
	b _0802F036
	.align 2, 0
_0802F024: .4byte 0x08C05558
_0802F028:
	ldr r1, _0802F030 @ =0x08C055A9
	mov r8, r1
	b _0802F038
	.align 2, 0
_0802F030: .4byte 0x08C055A9
_0802F034:
	ldr r0, _0802F080 @ =0x08C0557E
_0802F036:
	mov r8, r0
_0802F038:
	ldr r0, _0802F084 @ =gArenaSt
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r5, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r5, r0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r5, r0
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802F072
	mov r4, r8
_0802F056:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _0802F06A
	adds r6, #1
_0802F06A:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802F056
_0802F072:
	adds r0, r6, #0
	bl RandNext
	adds r7, r0, #0
	movs r6, #0
	mov r4, r8
	b _0802F08C
	.align 2, 0
_0802F080: .4byte 0x08C0557E
_0802F084: .4byte gArenaSt
_0802F088:
	adds r6, #1
_0802F08A:
	adds r4, #1
_0802F08C:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _0802F08A
	cmp r6, r7
	bne _0802F088
	ldrb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802F0B0
sub_0802F0B0: @ 0x0802F0B0
	cmp r0, #0
	blt _0802F0C6
	cmp r0, #3
	bgt _0802F0BC
	movs r0, #0
	b _0802F0C6
_0802F0BC:
	cmp r0, #7
	bgt _0802F0C6
	cmp r0, #5
	blt _0802F0C6
	movs r0, #1
_0802F0C6:
	bx lr

	thumb_func_start sub_0802F0C8
sub_0802F0C8: @ 0x0802F0C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #9
	bl RandNext
	adds r4, r4, r0
	subs r0, r4, #4
	cmp r0, #0
	bgt _0802F0DC
	movs r0, #1
_0802F0DC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802F0E4
sub_0802F0E4: @ 0x0802F0E4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0x12
	ldrsb r5, [r4, r5]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r5
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	adds r2, r2, r0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	adds r0, r0, r2
	lsls r5, r0, #1
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [r4]
	ldrb r2, [r2, #0x13]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r0, r2
	adds r5, r5, r0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0802F128
	adds r0, r4, #0
	bl GetUnitResistance
	b _0802F12E
_0802F128:
	adds r0, r4, #0
	bl GetUnitDefense
_0802F12E:
	lsls r0, r0, #1
	adds r5, r5, r0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802F14C
	adds r0, r4, #0
	bl GetUnitPower
	adds r5, r5, r0
_0802F14C:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0802F154
sub_0802F154: @ 0x0802F154
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0802F1D0 @ =0x0203A810
	mov r1, sp
	movs r2, #0
	movs r0, #0xfb
	strb r0, [r1]
	ldr r5, _0802F1D4 @ =gArenaSt
	ldrb r0, [r5, #0x10]
	strb r0, [r1, #1]
	mov r3, sp
	ldrb r0, [r3, #3]
	movs r1, #7
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #3]
	mov r4, sp
	ldrb r5, [r5, #0x12]
	lsls r3, r5, #3
	movs r0, #7
	ands r0, r1
	orrs r0, r3
	strb r0, [r4, #3]
	mov r3, sp
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #3]
	mov r0, sp
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	adds r0, r6, #0
	bl ClearUnit
	movs r0, #0x80
	strb r0, [r6, #0xb]
	adds r0, r6, #0
	mov r1, sp
	bl UnitInitFromDefinition
	ldr r1, [r6]
	adds r0, r6, #0
	bl UnitLoadStatsFromChracter
	movs r4, #8
	ldrsb r4, [r6, r4]
	ldr r1, _0802F1D8 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0802F1DC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	b _0802F1E2
	.align 2, 0
_0802F1D0: .4byte 0x0203A810
_0802F1D4: .4byte gArenaSt
_0802F1D8: .4byte gPlaySt
_0802F1DC:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
_0802F1E2:
	movs r1, #0xa
	bl __divsi3
	strb r0, [r6, #8]
	adds r0, r6, #0
	bl UnitAutolevel
	strb r4, [r6, #8]
	movs r2, #0
	adds r3, r6, #0
	adds r3, #0x28
	movs r4, #0xb5
_0802F1FA:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802F204
	strb r4, [r1]
_0802F204:
	adds r2, #1
	cmp r2, #7
	ble _0802F1FA
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bgt _0802F216
	movs r0, #1
	strb r0, [r6, #8]
_0802F216:
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0x14
	ble _0802F222
	movs r0, #0x14
	strb r0, [r6, #8]
_0802F222:
	adds r0, r6, #0
	bl UnitCheckStatCaps
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r6, #0
	bl SetUnitHp
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802F240
sub_0802F240: @ 0x0802F240
	push {r4, lr}
	sub sp, #8
	ldr r1, _0802F288 @ =0x081C9818
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r4, _0802F28C @ =gArenaSt
	ldrb r0, [r4, #0xd]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1a]
	ldrb r0, [r4, #0xe]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bne _0802F276
	movs r0, #2
	strb r0, [r4, #0xc]
_0802F276:
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	bne _0802F280
	movs r0, #2
	strb r0, [r4, #0xc]
_0802F280:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F288: .4byte 0x081C9818
_0802F28C: .4byte gArenaSt

	thumb_func_start sub_0802F290
sub_0802F290: @ 0x0802F290
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _0802F2A8 @ =0x081C9820
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	mov r4, sp
	b _0802F2D0
	.align 2, 0
_0802F2A8: .4byte 0x081C9820
_0802F2AC:
	adds r0, r5, #0
	bl GetItemIndex
	ldrb r1, [r4]
	cmp r0, r1
	bne _0802F2CE
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802F2CA
	bl MakeNewItem
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0802F2D6
_0802F2CA:
	adds r0, r5, #0
	b _0802F2D6
_0802F2CE:
	adds r4, #1
_0802F2D0:
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _0802F2AC
_0802F2D6:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802F2E0
sub_0802F2E0: @ 0x0802F2E0
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0802F308 @ =gArenaSt
	ldr r0, [r4]
	bl GetUnitPower
	ldr r5, _0802F30C @ =gBattleActor
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802F310
	ldr r0, [r4]
	bl GetUnitResistance
	b _0802F316
	.align 2, 0
_0802F308: .4byte gArenaSt
_0802F30C: .4byte gBattleActor
_0802F310:
	ldr r0, [r4]
	bl GetUnitDefense
_0802F316:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r4, _0802F340 @ =gArenaSt
	ldr r0, [r4, #4]
	bl GetUnitPower
	ldr r5, _0802F344 @ =gBattleTarget
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802F348
	ldr r0, [r4, #4]
	bl GetUnitResistance
	b _0802F34E
	.align 2, 0
_0802F340: .4byte gArenaSt
_0802F344: .4byte gBattleTarget
_0802F348:
	ldr r0, [r4, #4]
	bl GetUnitDefense
_0802F34E:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r0, _0802F39C @ =gBattleActor
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _0802F3A0 @ =gBattleTarget
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _0802F3A4 @ =gArenaSt
	ldr r0, [r5, #4]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _0802F3CE
	movs r6, #1
	movs r2, #0x13
	ldrsb r2, [r5, r2]
	cmp r2, #0
	beq _0802F3A8
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x18]
	subs r1, #4
	strb r1, [r0, #0x18]
	ldr r1, [r5, #4]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802F3BC
	movs r0, #0
	strb r0, [r1, #0x18]
	b _0802F3BC
	.align 2, 0
_0802F39C: .4byte gBattleActor
_0802F3A0: .4byte gBattleTarget
_0802F3A4: .4byte gArenaSt
_0802F3A8:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x17]
	subs r1, #4
	strb r1, [r0, #0x17]
	ldr r1, [r5, #4]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802F3BC
	strb r2, [r1, #0x17]
_0802F3BC:
	ldr r2, _0802F41C @ =gArenaSt
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #1
	strb r0, [r1, #0x15]
_0802F3CE:
	ldr r0, _0802F420 @ =gBattleTarget
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _0802F424 @ =gBattleActor
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _0802F41C @ =gArenaSt
	ldr r0, [r5]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _0802F414
	movs r6, #1
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x14]
	adds r0, #3
	strb r0, [r1, #0x14]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #2
	strb r0, [r1, #0x16]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #2
	strb r0, [r1, #0x15]
	ldrh r0, [r5, #0x1c]
	bl sub_0802F290
	strh r0, [r5, #0x1c]
_0802F414:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F41C: .4byte gArenaSt
_0802F420: .4byte gBattleTarget
_0802F424: .4byte gBattleActor

	thumb_func_start sub_0802F428
sub_0802F428: @ 0x0802F428
	push {r4, r5, r6, lr}
	ldr r4, _0802F454 @ =gArenaSt
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl sub_0802F0E4
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl sub_0802F0E4
	strh r0, [r4, #0x18]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	cmp r1, r0
	bls _0802F458
	ldrh r1, [r4, #0x16]
	b _0802F45A
	.align 2, 0
_0802F454: .4byte gArenaSt
_0802F458:
	ldrh r1, [r4, #0x18]
_0802F45A:
	ldr r6, _0802F478 @ =gArenaSt
	ldrh r4, [r6, #0x16]
	ldrh r5, [r6, #0x18]
	subs r2, r4, r5
	cmp r2, #0
	bge _0802F468
	subs r2, r5, r4
_0802F468:
	movs r0, #0x64
	muls r0, r2, r0
	bl __divsi3
	cmp r0, #0x14
	bgt _0802F47C
	movs r0, #0
	b _0802F572
	.align 2, 0
_0802F478: .4byte gArenaSt
_0802F47C:
	cmp r4, r5
	bhs _0802F4F8
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F498
	subs r0, r2, #1
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	subs r0, #1
	strb r0, [r1, #0x13]
_0802F498:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F4A8
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_0802F4A8:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F4B8
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_0802F4B8:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F4C8
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_0802F4C8:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F4D8
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_0802F4D8:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F4E8
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_0802F4E8:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F570
	subs r0, r2, #1
	b _0802F56E
_0802F4F8:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0x4f
	bgt _0802F510
	adds r0, r2, #2
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	adds r0, #2
	strb r0, [r1, #0x13]
_0802F510:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F520
	adds r0, r2, #1
	strb r0, [r1, #0x14]
_0802F520:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F530
	adds r0, r2, #1
	strb r0, [r1, #0x15]
_0802F530:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F540
	adds r0, r2, #1
	strb r0, [r1, #0x16]
_0802F540:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F550
	adds r0, r2, #1
	strb r0, [r1, #0x17]
_0802F550:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F560
	adds r0, r2, #1
	strb r0, [r1, #0x18]
_0802F560:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F570
	adds r0, r2, #1
_0802F56E:
	strb r0, [r1, #0x19]
_0802F570:
	movs r0, #1
_0802F572:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0802F578
sub_0802F578: @ 0x0802F578
	ldr r2, _0802F59C @ =gArenaSt
	ldrh r1, [r2, #0x18]
	ldrh r3, [r2, #0x16]
	subs r0, r1, r3
	lsrs r1, r0, #0x1f
	adds r1, r0, r1
	asrs r1, r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bgt _0802F598
	movs r0, #1
_0802F598:
	strh r0, [r2, #8]
	bx lr
	.align 2, 0
_0802F59C: .4byte gArenaSt

	thumb_func_start sub_0802F5A0
sub_0802F5A0: @ 0x0802F5A0
	ldr r0, _0802F5A8 @ =gArenaSt
	movs r1, #8
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0802F5A8: .4byte gArenaSt

	thumb_func_start sub_0802F5AC
sub_0802F5AC: @ 0x0802F5AC
	ldr r0, _0802F5B4 @ =gArenaSt
	ldrb r0, [r0, #0xa]
	bx lr
	.align 2, 0
_0802F5B4: .4byte gArenaSt

	thumb_func_start sub_0802F5B8
sub_0802F5B8: @ 0x0802F5B8
	ldr r1, _0802F5C0 @ =gArenaSt
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_0802F5C0: .4byte gArenaSt

	thumb_func_start sub_0802F5C4
sub_0802F5C4: @ 0x0802F5C4
	push {r4, r5, lr}
	ldr r0, _0802F610 @ =gBmSt
	adds r0, #0x3c
	ldrb r5, [r0]
	ldr r1, _0802F614 @ =gActionSt
	ldr r4, _0802F618 @ =gBattleTarget
	ldrb r0, [r4, #0x13]
	strb r0, [r1, #0x15]
	movs r0, #4
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	bl BattleUnwind
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802F5EE
	bl BattleApplyExpGains
_0802F5EE:
	ldr r0, _0802F61C @ =gArenaSt
	ldr r0, [r0]
	ldr r1, _0802F620 @ =gBattleActor
	bl sub_0802A1BC
	cmp r5, #0
	beq _0802F604
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802F608
_0802F604:
	bl PidStatsRecordBattleResult
_0802F608:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F610: .4byte gBmSt
_0802F614: .4byte gActionSt
_0802F618: .4byte gBattleTarget
_0802F61C: .4byte gArenaSt
_0802F620: .4byte gBattleActor

	thumb_func_start sub_0802F624
sub_0802F624: @ 0x0802F624
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0802F644
	adds r0, r2, #0
	bl sub_0802EF8C
	cmp r0, #0
	blt _0802F644
	movs r0, #1
	b _0802F646
_0802F644:
	movs r0, #0
_0802F646:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802F64C
sub_0802F64C: @ 0x0802F64C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0802F68C @ =0x081C9818
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802F696
	movs r1, #0
	ldr r2, [r5, #4]
_0802F670:
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F690
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4]
	b _0802F696
	.align 2, 0
_0802F68C: .4byte 0x081C9818
_0802F690:
	adds r1, #1
	cmp r1, #7
	ble _0802F670
_0802F696:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802F6A0
sub_0802F6A0: @ 0x0802F6A0
	push {r4, lr}
	ldr r4, _0802F6C0 @ =gArenaSt
	ldr r0, [r4]
	adds r1, r4, #0
	adds r1, #0x1a
	bl sub_0802F64C
	ldr r0, [r4, #4]
	adds r4, #0x1c
	adds r1, r4, #0
	bl sub_0802F64C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F6C0: .4byte gArenaSt

	thumb_func_start sub_0802F6C4
sub_0802F6C4: @ 0x0802F6C4
	push {lr}
	ldr r0, _0802F6D0 @ =gActionSt
	bl RandGetSt
	pop {r0}
	bx r0
	.align 2, 0
_0802F6D0: .4byte gActionSt

	thumb_func_start sub_0802F6D4
sub_0802F6D4: @ 0x0802F6D4
	push {lr}
	ldr r0, _0802F6E0 @ =gActionSt
	bl RandSetSt
	pop {r0}
	bx r0
	.align 2, 0
_0802F6E0: .4byte gActionSt

	thumb_func_start sub_0802F6E4
sub_0802F6E4: @ 0x0802F6E4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F708 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, _0802F70C @ =gActiveUnit
	str r0, [r1]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	cmp r0, #0x1a
	bhi _0802F7EA
	lsls r0, r0, #2
	ldr r1, _0802F710 @ =_0802F714
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802F708: .4byte gActionSt
_0802F70C: .4byte gActiveUnit
_0802F710: .4byte _0802F714
_0802F714: @ jump table
	.4byte _0802F780 @ case 0
	.4byte _0802F7AC @ case 1
	.4byte _0802F7E0 @ case 2
	.4byte _0802F7B4 @ case 3
	.4byte _0802F7EA @ case 4
	.4byte _0802F7CC @ case 5
	.4byte _0802F794 @ case 6
	.4byte _0802F79C @ case 7
	.4byte _0802F7EA @ case 8
	.4byte _0802F7EA @ case 9
	.4byte _0802F7EA @ case 10
	.4byte _0802F7BC @ case 11
	.4byte _0802F7C4 @ case 12
	.4byte _0802F7A4 @ case 13
	.4byte _0802F7A4 @ case 14
	.4byte _0802F7E0 @ case 15
	.4byte _0802F7EA @ case 16
	.4byte _0802F7E0 @ case 17
	.4byte _0802F7EA @ case 18
	.4byte _0802F7EA @ case 19
	.4byte _0802F7EA @ case 20
	.4byte _0802F7D4 @ case 21
	.4byte _0802F7E0 @ case 22
	.4byte _0802F7EA @ case 23
	.4byte _0802F7EA @ case 24
	.4byte _0802F7EA @ case 25
	.4byte _0802F780 @ case 26
_0802F780:
	ldr r0, _0802F790 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	b _0802F7EA
	.align 2, 0
_0802F790: .4byte gActiveUnit
_0802F794:
	adds r0, r5, #0
	bl sub_0802F7F4
	b _0802F7DA
_0802F79C:
	adds r0, r5, #0
	bl sub_0802F870
	b _0802F7DA
_0802F7A4:
	adds r0, r5, #0
	bl sub_0802F900
	b _0802F7DA
_0802F7AC:
	adds r0, r5, #0
	bl sub_0802F92C
	b _0802F7DA
_0802F7B4:
	adds r0, r5, #0
	bl sub_0802F990
	b _0802F7DA
_0802F7BC:
	adds r0, r5, #0
	bl sub_0802F9E0
	b _0802F7DA
_0802F7C4:
	adds r0, r5, #0
	bl sub_0802FA0C
	b _0802F7DA
_0802F7CC:
	adds r0, r5, #0
	bl sub_0802FAB4
	b _0802F7DA
_0802F7D4:
	adds r0, r5, #0
	bl sub_0802F97C
_0802F7DA:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802F7EC
_0802F7E0:
	adds r0, r5, #0
	bl sub_0802D4CC
	movs r0, #0
	b _0802F7EC
_0802F7EA:
	movs r0, #1
_0802F7EC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802F7F4
sub_0802F7F4: @ 0x0802F7F4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F844 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r4, r0, #0
	bl sub_08034C80
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl sub_0801D880
	adds r0, r5, #0
	adds r1, r4, #0
	bl UnitRescue
	adds r0, r4, #0
	bl HideUnitSprite
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F844: .4byte gActionSt

	thumb_func_start sub_0802F848
sub_0802F848: @ 0x0802F848
	push {lr}
	ldr r1, [r0, #0x54]
	bl sub_08034A74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0802F858
sub_0802F858: @ 0x0802F858
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl sub_08025A0C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802F870
sub_0802F870: @ 0x0802F870
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F8D8 @ =gActionSt
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _0802F8DC @ =gBmMapHidden
	ldr r1, [r0]
	ldrb r2, [r4, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x13]
	adds r1, r0, r1
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802F8E4
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	adds r3, r6, #0
	bl sub_0801D880
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	bl UnitDrop
	ldr r0, _0802F8E0 @ =0x08C055CC
	adds r1, r6, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x54]
	b _0802F8F2
	.align 2, 0
_0802F8D8: .4byte gActionSt
_0802F8DC: .4byte gBmMapHidden
_0802F8E0: .4byte 0x08C055CC
_0802F8E4:
	ldr r0, _0802F8FC @ =0x02033DFC
	movs r1, #0xa
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	bl sub_0806C7F8
_0802F8F2:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F8FC: .4byte 0x02033DFC

	thumb_func_start sub_0802F900
sub_0802F900: @ 0x0802F900
	push {r4, r5, lr}
	ldr r5, _0802F928 @ =gActionSt
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_080793E4
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F928: .4byte gActionSt

	thumb_func_start sub_0802F92C
sub_0802F92C: @ 0x0802F92C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0802F958 @ =gActionSt
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _0802F942
	bl sub_0802A704
_0802F942:
	ldrb r0, [r5, #0x12]
	cmp r0, #8
	bne _0802F95C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl BattleGenerateBallistaReal
	b _0802F968
	.align 2, 0
_0802F958: .4byte gActionSt
_0802F95C:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl BattleGenerateReal
_0802F968:
	ldr r0, _0802F978 @ =0x08C0561C
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F978: .4byte 0x08C0561C

	thumb_func_start sub_0802F97C
sub_0802F97C: @ 0x0802F97C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802F98C @ =0x08C05684
	bl Proc_StartBlocking
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802F98C: .4byte 0x08C05684

	thumb_func_start sub_0802F990
sub_0802F990: @ 0x0802F990
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F9D4 @ =gActionSt
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, _0802F9D8 @ =0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0802A964
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_0802AA10
	ldr r1, _0802F9DC @ =gBattleStats
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_0802AA80
	bl sub_0802A860
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F9D4: .4byte gActionSt
_0802F9D8: .4byte 0xFFFFFBBD
_0802F9DC: .4byte gBattleStats

	thumb_func_start sub_0802F9E0
sub_0802F9E0: @ 0x0802F9E0
	push {r4, r5, lr}
	ldr r4, _0802FA08 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r0, [r0]
	ldrb r5, [r0, #4]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl sub_08079210
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802FA08: .4byte gActionSt

	thumb_func_start sub_0802FA0C
sub_0802FA0C: @ 0x0802FA0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802FAAC @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0802FAB0 @ =gActiveUnit
	mov sb, r0
	ldr r0, [r0]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_08026C98
	adds r7, r0, #0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl sub_08026C98
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl sub_08026C04
	mov r2, sb
	ldr r0, [r2]
	adds r1, r7, #0
	bl sub_08026BD0
	adds r0, r4, #0
	mov r1, r8
	bl sub_08026BD0
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r6, [r1, #4]
	ldr r1, [r4]
	ldrb r5, [r1, #4]
	adds r1, r7, #0
	bl sub_08026B20
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08079250
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r4, #0x32
	add r4, r8
	ldrb r1, [r4]
	cmp r0, r1
	beq _0802FA9C
	cmp r0, r1
	ble _0802FA8E
	strb r0, [r4]
_0802FA8E:
	cmp r0, r1
	bge _0802FA9C
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	strb r1, [r0]
_0802FA9C:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802FAAC: .4byte gActionSt
_0802FAB0: .4byte gActiveUnit

	thumb_func_start sub_0802FAB4
sub_0802FAB4: @ 0x0802FAB4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802FB50 @ =gActionSt
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0802FAE4
	ldrb r4, [r4, #0x12]
	adds r0, r5, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _0802FAE4
	ldr r0, [r5, #0xc]
	ldr r1, _0802FB54 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r5, #0xc]
_0802FAE4:
	ldr r5, _0802FB50 @ =gActionSt
	ldrb r0, [r5, #0xd]
	bl GetUnit
	ldrb r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl UnitAddItem
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0802A964
	ldr r4, _0802FB58 @ =gBattleTarget
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl InitBattleUnit
	adds r4, #0x48
	strh r6, [r4]
	adds r0, r7, #0
	bl sub_0802AA80
	bl sub_0806D4A4
	bl sub_0806F8C8
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802FB50: .4byte gActionSt
_0802FB54: .4byte 0xFFFFEFFF
_0802FB58: .4byte gBattleTarget

	thumb_func_start sub_0802FB5C
sub_0802FB5C: @ 0x0802FB5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r7, r6, #0
	adds r7, #0x46
	movs r4, #0
	ldrsh r3, [r7, r4]
	adds r5, r6, #0
	adds r5, #0x48
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	mov r8, r0
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r4, #0
	ldrsh r3, [r7, r4]
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r2, r0, #0
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r2, r2, r0
	adds r3, r6, #0
	adds r3, #0x42
	ldrh r4, [r1]
	ldrh r0, [r3]
	adds r4, r4, r0
	strh r4, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r1, [r3]
	ldrh r0, [r0]
	adds r0, r1, r0
	strh r0, [r3]
	ldr r1, _0802FC00 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	mov r3, r8
	subs r4, r3, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r3, [r6, #0x2c]
	movs r0, #7
	adds r1, r4, #0
	bl sub_08026540
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	ldrh r5, [r5]
	lsls r1, r5, #0x10
	cmp r0, r1
	bne _0802FBF4
	adds r0, r6, #0
	bl Proc_Break
_0802FBF4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FC00: .4byte gBmSt

	thumb_func_start sub_0802FC04
sub_0802FC04: @ 0x0802FC04
	push {lr}
	ldr r1, [r0, #0x2c]
	bl sub_08034AB4
	pop {r0}
	bx r0

	thumb_func_start sub_0802FC10
sub_0802FC10: @ 0x0802FC10
	push {lr}
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802FC20
sub_0802FC20: @ 0x0802FC20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r6, r0, #0
	cmp r6, #0
	bne _0802FCC2
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802FCC2
	ldr r0, _0802FCC8 @ =0x08C055F4
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, r5, #0
	bl UnitGetDeathDropLocation
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r0, r5, #0
	bl UnitDrop
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	adds r0, r4, #0
	adds r0, #0x40
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldr r0, _0802FCCC @ =0x0000FFFB
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r1, #4
	movs r0, #0xb
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSMSId
	bl sub_08025278
	bl sub_08025A0C
	ldr r0, _0802FCD0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802FCC2
	movs r0, #0xac
	bl m4aSongNumStart
_0802FCC2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FCC8: .4byte 0x08C055F4
_0802FCCC: .4byte 0x0000FFFB
_0802FCD0: .4byte gPlaySt

	thumb_func_start sub_0802FCD4
sub_0802FCD4: @ 0x0802FCD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802FCFC
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	cmp r1, #0x86
	beq _0802FCFC
	ldrb r0, [r0, #4]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	movs r2, #2
	bl sub_080A08B4
	adds r0, r4, #0
	bl UnitKill
_0802FCFC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802FD04
sub_0802FD04: @ 0x0802FD04
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802FD22
	adds r0, r4, #0
	bl UnitKill
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #6
	bl sub_080A08B4
_0802FD22:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802FD28
sub_0802FD28: @ 0x0802FD28
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802FD5C @ =gBattleStats
	movs r0, #0x80
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802FD50
	ldr r0, _0802FD60 @ =gBattleActor
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802FD58
	ldr r0, _0802FD64 @ =gBattleTarget
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802FD58
_0802FD50:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_0802FD58:
	pop {r0}
	bx r0
	.align 2, 0
_0802FD5C: .4byte gBattleStats
_0802FD60: .4byte gBattleActor
_0802FD64: .4byte gBattleTarget

	thumb_func_start sub_0802FD68
sub_0802FD68: @ 0x0802FD68
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802FD80
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x86
	beq _0802FD80
	movs r0, #1
	b _0802FD82
_0802FD80:
	movs r0, #0
_0802FD82:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0802FD88
sub_0802FD88: @ 0x0802FD88
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x54]
	ldr r7, _0802FE10 @ =gBattleActor
	adds r0, r7, #0
	bl sub_0802FD68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802FDB2
	ldr r0, _0802FE14 @ =0x08D64F4C
	bl Proc_Find
	adds r4, r0, #0
	bl sub_0806DD98
	str r4, [r6, #0x54]
	adds r0, r7, #0
	bl sub_08034C80
_0802FDB2:
	ldr r5, _0802FE18 @ =gBattleTarget
	adds r0, r5, #0
	bl sub_0802FD68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802FE0A
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_08034C80
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl sub_0806C2DC
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl sub_0806FC64
	ldr r1, _0802FE1C @ =0x02033DFC
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl sub_0806C8F0
	adds r0, r4, #0
	bl sub_0806DD98
	str r4, [r6, #0x54]
_0802FE0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FE10: .4byte gBattleActor
_0802FE14: .4byte 0x08D64F4C
_0802FE18: .4byte gBattleTarget
_0802FE1C: .4byte 0x02033DFC

	thumb_func_start sub_0802FE20
sub_0802FE20: @ 0x0802FE20
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_0806D4BC
	pop {r0}
	bx r0

	thumb_func_start sub_0802FE2C
sub_0802FE2C: @ 0x0802FE2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0802FC20
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802FC20
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0802FCD4
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0802FCD4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0802FE70
sub_0802FE70: @ 0x0802FE70
	push {r4, lr}
	bl sub_08016318
	adds r4, r0, #0
	bl GetCurrentBgmSong
	cmp r0, r4
	beq _0802FE8A
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl sub_08003788
_0802FE8A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802FE90
sub_0802FE90: @ 0x0802FE90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r6, _0802FF20 @ =gBattleActor
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, _0802FF24 @ =gBattleTarget
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	mov r1, r8
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0802FECC
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
_0802FECC:
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802FEE8
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r5, r0, #0
_0802FEE8:
	cmp r7, #0
	beq _0802FF28
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0802FF28
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _0802FF28
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802FF28
	adds r0, r7, #0
	bl GetUnitLastItem
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	mov r2, r8
	bl sub_0800EE60
	movs r0, #0
	b _0802FF2A
	.align 2, 0
_0802FF20: .4byte gBattleActor
_0802FF24: .4byte gBattleTarget
_0802FF28:
	movs r0, #1
_0802FF2A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0802FF34
sub_0802FF34: @ 0x0802FF34
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802FF58 @ =gBattleTarget
	movs r0, #1
	strb r0, [r1, #0x12]
	strb r0, [r1, #0x13]
	ldr r0, _0802FF5C @ =gBattleActor
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802FF54
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_0802FF54:
	pop {r0}
	bx r0
	.align 2, 0
_0802FF58: .4byte gBattleTarget
_0802FF5C: .4byte gBattleActor

	thumb_func_start sub_0802FF60
sub_0802FF60: @ 0x0802FF60
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FF7C @ =gActiveUnit
	ldr r0, [r4]
	bl sub_0802FD04
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_0802FC20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF7C: .4byte gActiveUnit

	thumb_func_start sub_0802FF80
sub_0802FF80: @ 0x0802FF80
	ldr r3, _0802FF90 @ =0x08C05700
	ldr r2, [r3]
	adds r2, #0x29
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802FF90: .4byte 0x08C05700

	thumb_func_start sub_0802FF94
sub_0802FF94: @ 0x0802FF94
	push {r4, r5, r6, r7, lr}
	ldr r3, _08030030 @ =0x08C05700
	ldr r1, [r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _08030028
	subs r0, #1
	strb r0, [r2]
	ldr r2, [r3]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #0x29
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	strb r1, [r0]
	movs r5, #1
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bgt _08030028
	adds r7, r3, #0
_0802FFD6:
	bl GetWorkingMoveCosts
	ldr r3, [r7]
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	adds r5, r3, #0
	adds r5, #0x55
	adds r6, r5, r4
	subs r1, r4, #1
	adds r5, r5, r1
	adds r1, r3, #0
	adds r1, #0x41
	adds r1, r1, r4
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldr r1, _08030034 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r3, #0x2d
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r1, [r2]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r5, [r5]
	ldrb r0, [r0]
	subs r0, r5, r0
	strb r0, [r6]
	adds r4, #1
	lsls r4, r4, #0x18
	ldr r0, [r7]
	adds r0, #0x2c
	lsrs r5, r4, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	cmp r4, r0
	ble _0802FFD6
_08030028:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030030: .4byte 0x08C05700
_08030034: .4byte gBmMapTerrain

	thumb_func_start sub_08030038
sub_08030038: @ 0x08030038
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _080300B4 @ =0x08C05700
	ldr r0, [r6]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2d
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x41
	adds r0, r0, r1
	strb r4, [r0]
	bl GetWorkingMoveCosts
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, #0x55
	adds r3, r2, r1
	subs r1, #1
	adds r2, r2, r1
	lsls r4, r4, #0x18
	ldr r1, _080300B8 @ =gBmMapTerrain
	ldr r1, [r1]
	asrs r4, r4, #0x16
	adds r4, r4, r1
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r2, [r2]
	ldrb r0, [r0]
	subs r0, r2, r0
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080300B4: .4byte 0x08C05700
_080300B8: .4byte gBmMapTerrain

	thumb_func_start sub_080300BC
sub_080300BC: @ 0x080300BC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0
	ldr r0, _08030110 @ =0x08C05700
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r1, r3
	bgt _08030122
	mov ip, r2
	lsls r0, r4, #0x18
	asrs r7, r0, #0x18
	mov r6, ip
	adds r6, #0x41
	lsls r0, r5, #0x18
	asrs r5, r0, #0x18
	adds r4, r3, #0
_080300E8:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	mov r1, ip
	adds r1, #0x2d
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, #0
	cmp r1, r7
	bne _08030114
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _08030114
	adds r0, r2, #0
	b _08030126
	.align 2, 0
_08030110: .4byte 0x08C05700
_08030114:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	ble _080300E8
_08030122:
	movs r0, #1
	rsbs r0, r0, #0
_08030126:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0803012C
sub_0803012C: @ 0x0803012C
	push {r4, lr}
	movs r4, #0
_08030130:
	ldr r2, _08030158 @ =0x02033DFC
	adds r1, r4, #0
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xa
	bhi _08030130
	lsls r0, r0, #2
	ldr r1, _0803015C @ =_08030160
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030158: .4byte 0x02033DFC
_0803015C: .4byte _08030160
_08030160: @ jump table
	.4byte _08030224 @ case 0
	.4byte _0803018C @ case 1
	.4byte _080301A8 @ case 2
	.4byte _080301F8 @ case 3
	.4byte _080301D4 @ case 4
	.4byte _08030224 @ case 5
	.4byte _08030130 @ case 6
	.4byte _08030130 @ case 7
	.4byte _08030130 @ case 8
	.4byte _08030130 @ case 9
	.4byte _08030130 @ case 10
_0803018C:
	ldr r0, _080301A4 @ =0x08C05700
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	b _080301BC
	.align 2, 0
_080301A4: .4byte 0x08C05700
_080301A8:
	ldr r0, _080301D0 @ =0x08C05700
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #1
_080301BC:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08030038
	b _08030130
	.align 2, 0
_080301D0: .4byte 0x08C05700
_080301D4:
	ldr r0, _080301F4 @ =0x08C05700
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r1, #1
	b _08030216
	.align 2, 0
_080301F4: .4byte 0x08C05700
_080301F8:
	ldr r0, _08030220 @ =0x08C05700
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #1
_08030216:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08030038
	b _08030130
	.align 2, 0
_08030220: .4byte 0x08C05700
_08030224:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803022C
sub_0803022C: @ 0x0803022C
	push {r4, r5, r6, r7, lr}
	movs r6, #1
	ldr r2, _08030270 @ =0x08C05700
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r2, #0
	ldr r1, _08030274 @ =0x02033DFC
	mov ip, r1
	cmp r6, r0
	bgt _080302BE
	mov r5, ip
_08030248:
	ldr r4, [r2]
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x2d
	adds r1, r0, r3
	subs r2, r3, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08030278
	adds r1, r2, r5
	movs r0, #0
	b _080302A4
	.align 2, 0
_08030270: .4byte 0x08C05700
_08030274: .4byte 0x02033DFC
_08030278:
	cmp r1, r0
	ble _08030282
	adds r1, r2, r5
	movs r0, #1
	b _080302A4
_08030282:
	adds r0, r4, #0
	adds r0, #0x41
	adds r1, r0, r3
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080302A0
	adds r1, r2, r5
	movs r0, #3
	b _080302A4
_080302A0:
	adds r1, r2, r5
	movs r0, #2
_080302A4:
	strb r0, [r1]
	lsls r0, r6, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	adds r2, r7, #0
	ldr r1, [r2]
	adds r1, #0x2c
	lsrs r6, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	cmp r0, r1
	ble _08030248
_080302BE:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	add r0, ip
	movs r1, #4
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080302D0
sub_080302D0: @ 0x080302D0
	push {r4, lr}
	ldr r0, _0803030C @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, _08030310 @ =0x08C05700
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, #1
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r3, #0
	adds r2, #0x41
	adds r2, r2, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x55
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	bl sub_0801A090
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803030C: .4byte gActiveUnit
_08030310: .4byte 0x08C05700

	thumb_func_start sub_08030314
sub_08030314: @ 0x08030314
	push {lr}
	movs r0, #1
	bl sub_0802FF94
	bl sub_080302D0
	ldr r1, _08030338 @ =gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	ldr r2, _0803033C @ =0x02033DFC
	bl sub_0801A23C
	bl sub_0803012C
	pop {r0}
	bx r0
	.align 2, 0
_08030338: .4byte gBmSt
_0803033C: .4byte 0x02033DFC

	thumb_func_start sub_08030340
sub_08030340: @ 0x08030340
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803034C @ =0x08C05700
	ldr r0, [r0]
	adds r0, #0x2c
	ldrb r1, [r0]
	b _080303AC
	.align 2, 0
_0803034C: .4byte 0x08C05700
_08030350:
	asrs r4, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	lsls r7, r1, #0x18
	cmp r2, #0
	blt _080303A4
	ldr r0, _08030390 @ =0x08C05700
	ldr r1, [r0]
	adds r5, r1, #0
	adds r5, #0x2d
	adds r0, r5, r4
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, #0x41
	adds r4, r1, r4
_08030374:
	asrs r2, r2, #0x18
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bne _08030394
	adds r0, r1, r2
	ldrb r2, [r4]
	ldrb r0, [r0]
	cmp r2, r0
	bne _08030394
	movs r0, #0
	b _080303B4
	.align 2, 0
_08030390: .4byte 0x08C05700
_08030394:
	lsls r0, r3, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	cmp r2, #0
	bge _08030374
_080303A4:
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r7, r1
	lsrs r1, r0, #0x18
_080303AC:
	lsls r0, r1, #0x18
	cmp r0, #0
	bgt _08030350
	movs r0, #1
_080303B4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080303BC
sub_080303BC: @ 0x080303BC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0803042C @ =0x084048D4
	ldr r1, _08030430 @ =0x06015E00
	bl sub_08013688
	ldr r0, _08030434 @ =0x08404B0C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r4, #0
	bne _08030424
	ldr r5, _08030438 @ =0x08C05700
	ldr r2, [r5]
	ldr r4, _0803043C @ =gActiveUnit
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r0, r1, r0
	ldr r1, _08030440 @ =gActionSt
	ldrb r1, [r1, #0x10]
	subs r0, r0, r1
	adds r2, #0x2b
	strb r0, [r2]
	movs r0, #0
	bl sub_0802FF94
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08030038
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, #0x55
	strb r1, [r0]
	ldr r1, _08030444 @ =0x0000FFFF
	adds r0, r1, #0
	bl sub_0802FF80
	bl sub_08030448
_08030424:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803042C: .4byte 0x084048D4
_08030430: .4byte 0x06015E00
_08030434: .4byte 0x08404B0C
_08030438: .4byte 0x08C05700
_0803043C: .4byte gActiveUnit
_08030440: .4byte gActionSt
_08030444: .4byte 0x0000FFFF

	thumb_func_start sub_08030448
sub_08030448: @ 0x08030448
	push {r4, r5, r6, r7, lr}
	ldr r7, _080304CC @ =0x08C05700
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x29
	ldr r5, _080304D0 @ =gBmSt
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08030472
	adds r0, r2, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08030472
	b _080305F4
_08030472:
	ldrh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	bl sub_0802FF80
	ldr r0, _080304D4 @ =gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _080304D8 @ =0x03004100
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _080304A6
	b _080305F4
_080304A6:
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	bl sub_080300BC
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _080304DC
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	asrs r0, r0, #0x18
	bl sub_0802FF94
	b _080305F4
	.align 2, 0
_080304CC: .4byte 0x08C05700
_080304D0: .4byte gBmSt
_080304D4: .4byte gBmMapMovement
_080304D8: .4byte 0x03004100
_080304DC:
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, #0x55
	adds r4, r4, r0
	bl GetWorkingMoveCosts
	movs r1, #0x16
	ldrsh r6, [r5, r1]
	ldr r1, _0803054C @ =gBmMapTerrain
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	movs r2, #0x14
	ldrsh r3, [r5, r2]
	ldr r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _08030570
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r3
	cmp r2, #0
	bge _08030532
	subs r2, r3, r0
_08030532:
	adds r0, r4, #0
	adds r0, #0x41
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, r1, r6
	cmp r0, #0
	blt _08030550
	adds r0, r2, r0
	cmp r0, #1
	beq _08030558
	b _08030570
	.align 2, 0
_0803054C: .4byte gBmMapTerrain
_08030550:
	subs r0, r6, r1
	adds r0, r2, r0
	cmp r0, #1
	bne _08030570
_08030558:
	ldr r1, _0803056C @ =gBmSt
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08030038
	b _080305F4
	.align 2, 0
_0803056C: .4byte gBmSt
_08030570:
	ldr r0, _080305C8 @ =0x08C05700
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x55
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08030592
	movs r0, #1
	bl sub_0802FF94
_08030592:
	ldr r0, _080305CC @ =0x0202E3F0
	ldr r0, [r0]
	bl SetWorkingBmMap
	bl sub_080302D0
	ldr r2, _080305D0 @ =gBmSt
	movs r3, #0x16
	ldrsh r4, [r2, r3]
	ldr r0, _080305D4 @ =0x03004100
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r1, #0x14
	ldrsh r3, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080305D8
	bl sub_08030314
	b _080305F4
	.align 2, 0
_080305C8: .4byte 0x08C05700
_080305CC: .4byte 0x0202E3F0
_080305D0: .4byte gBmSt
_080305D4: .4byte 0x03004100
_080305D8:
	ldr r2, _080305FC @ =0x02033DFC
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_0801A23C
	bl sub_0803012C
	bl sub_08030340
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080305F4
	bl sub_08030314
_080305F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080305FC: .4byte 0x02033DFC

	thumb_func_start sub_08030600
sub_08030600: @ 0x08030600
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0803060E
	movs r0, #0
	b _0803065E
_0803060E:
	ldr r0, _08030630 @ =0x08C05700
	ldr r3, [r0]
	subs r4, r2, #1
	adds r0, r3, #0
	adds r0, #0x2d
	adds r1, r0, r4
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08030634
	movs r0, #3
	b _0803065E
	.align 2, 0
_08030630: .4byte 0x08C05700
_08030634:
	cmp r1, r0
	ble _0803063C
	movs r0, #1
	b _0803065E
_0803063C:
	adds r0, r3, #0
	adds r0, #0x41
	adds r1, r0, r4
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08030658
	movs r0, #4
	b _0803065E
_08030658:
	cmp r1, r0
	ble _0803065E
	movs r0, #2
_0803065E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08030664
sub_08030664: @ 0x08030664
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08030680 @ =0x08C05700
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r2, r0
	bne _08030684
	movs r0, #0
	b _080306CC
	.align 2, 0
_08030680: .4byte 0x08C05700
_08030684:
	adds r0, r3, #0
	adds r0, #0x2d
	adds r1, r0, r2
	adds r4, r2, #1
	adds r0, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080306A2
	movs r0, #1
	b _080306CC
_080306A2:
	cmp r1, r0
	ble _080306AA
	movs r0, #3
	b _080306CC
_080306AA:
	adds r0, r3, #0
	adds r0, #0x41
	adds r1, r0, r2
	adds r0, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080306C6
	movs r0, #2
	b _080306CC
_080306C6:
	cmp r1, r0
	ble _080306CC
	movs r0, #4
_080306CC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080306D4
sub_080306D4: @ 0x080306D4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0803070C @ =gBmSt
	movs r6, #0xe
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble _08030710
	cmp r1, #0x9f
	bgt _08030710
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmn r0, r5
	ble _08030710
	cmp r0, #0xef
	bgt _08030710
	movs r0, #1
	b _08030712
	.align 2, 0
_0803070C: .4byte gBmSt
_08030710:
	movs r0, #0
_08030712:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08030718
sub_08030718: @ 0x08030718
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _080307C4 @ =0x08C05700
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x2c
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080307B4
	ldrb r5, [r5]
	lsls r5, r5, #0x18
	cmp r5, #0
	blt _080307B4
	ldr r0, _080307C8 @ =0x08C056CC
	mov sb, r0
_0803073E:
	ldr r0, _080307C4 @ =0x08C05700
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_080306D4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080307AC
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_08030600
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08030664
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, sb
	ldrh r3, [r4]
	ldr r0, _080307CC @ =gBmSt
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r1, r7, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	mov r0, r8
	subs r2, r0, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, _080307D0 @ =0x08BFF768
	bl sub_08006884
_080307AC:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge _0803073E
_080307B4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080307C4: .4byte 0x08C05700
_080307C8: .4byte 0x08C056CC
_080307CC: .4byte gBmSt
_080307D0: .4byte 0x08BFF768

	thumb_func_start sub_080307D4
sub_080307D4: @ 0x080307D4
	push {lr}
	bl sub_08030448
	bl sub_08030718
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetPlayerLeaderUnitId
GetPlayerLeaderUnitId: @ 0x080307E4
	ldr r0, _080307F8 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08030806
	cmp r0, #2
	bgt _080307FC
	cmp r0, #1
	beq _08030802
	b _0803080E
	.align 2, 0
_080307F8: .4byte gPlaySt
_080307FC:
	cmp r0, #3
	beq _0803080A
	b _0803080E
_08030802:
	movs r0, #3
	b _08030810
_08030806:
	movs r0, #1
	b _08030810
_0803080A:
	movs r0, #2
	b _08030810
_0803080E:
	movs r0, #0
_08030810:
	bx lr
	.align 2, 0

	thumb_func_start sub_08030814
sub_08030814: @ 0x08030814
	push {r4, r5, lr}
	bl sub_08079A50
	adds r4, r0, #0
	ldr r5, _08030868 @ =0x0202E3E4
	ldr r0, [r5]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0803086C @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	bl sub_0808E794
	lsls r0, r0, #4
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803085C
	adds r3, r5, #0
	movs r2, #1
_08030844:
	ldr r1, [r3]
	ldrb r5, [r4, #7]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r1, [r4, #6]
	adds r0, r1, r0
	strb r2, [r0]
	adds r4, #0x10
	ldrb r0, [r4]
	cmp r0, #0
	bne _08030844
_0803085C:
	movs r0, #0x10
	bl sub_0801D6A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030868: .4byte 0x0202E3E4
_0803086C: .4byte gBmMapMovement

	thumb_func_start sub_08030870
sub_08030870: @ 0x08030870
	push {lr}
	bl sub_080909F8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803087C
sub_0803087C: @ 0x0803087C
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl Proc_Break
	bl sub_08030870
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08030890
sub_08030890: @ 0x08030890
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	str r0, [r5, #0x58]
	ldr r4, _080308C4 @ =gBmSt
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl sub_0801D758
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl sub_08015DE8
	adds r0, r5, #0
	bl Proc_Break
	bl sub_08030870
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080308C4: .4byte gBmSt

	thumb_func_start sub_080308C8
sub_080308C8: @ 0x080308C8
	push {lr}
	movs r1, #0x37
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080308D8
sub_080308D8: @ 0x080308D8
	push {lr}
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080308E8
sub_080308E8: @ 0x080308E8
	push {r4, r5, lr}
	bl GetSupplyUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803093C
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	ldr r5, _08030944 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _08030912
	movs r1, #1
_08030912:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _0803092C
	movs r1, #1
_0803092C:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_0803093C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030944: .4byte gPlaySt

	thumb_func_start sub_08030948
sub_08030948: @ 0x08030948
	push {lr}
	movs r1, #8
	str r1, [r0, #0x58]
	movs r1, #0x39
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_08030958
sub_08030958: @ 0x08030958
	push {lr}
	bl GetSupplyUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08030982
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xff
	ldrb r1, [r2, #0x10]
	orrs r1, r0
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x11]
	orrs r0, r1
	strb r0, [r2, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_08030982:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08030988
sub_08030988: @ 0x08030988
	push {lr}
	movs r1, #9
	str r1, [r0, #0x58]
	movs r1, #0x3b
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_08030998
sub_08030998: @ 0x08030998
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [r4, #0x58]
	bl sub_08030870
	ldr r0, _080309B8 @ =0x08C04B94
	bl StartMenu
	adds r0, r4, #0
	movs r1, #0x3a
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080309B8: .4byte 0x08C04B94

	thumb_func_start sub_080309BC
sub_080309BC: @ 0x080309BC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08030A00 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _080309D4
	movs r1, #1
_080309D4:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_08031A5C
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _080309EC
	movs r1, #1
_080309EC:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0801615C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030A00: .4byte gPlaySt

	thumb_func_start sub_08030A04
sub_08030A04: @ 0x08030A04
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl sub_08030B88
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08030A14
sub_08030A14: @ 0x08030A14
	push {lr}
	bl sub_08013BCC
	ldr r3, _08030A2C @ =0xFF00FFF0
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_08013C48
	pop {r0}
	bx r0
	.align 2, 0
_08030A2C: .4byte 0xFF00FFF0

	thumb_func_start sub_08030A30
sub_08030A30: @ 0x08030A30
	push {lr}
	sub sp, #0x14
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _08030A58 @ =0xFF00FFF0
	str r1, [sp, #8]
	movs r1, #0x40
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_08013EF8
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_08030A58: .4byte 0xFF00FFF0

	thumb_func_start sub_08030A5C
sub_08030A5C: @ 0x08030A5C
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl sub_08013BCC
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _08030A8C @ =0xFF00FFF0
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0xc0
	bl sub_08013EF8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030A8C: .4byte 0xFF00FFF0

	thumb_func_start sub_08030A90
sub_08030A90: @ 0x08030A90
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	movs r1, #0x8c
	adds r2, r4, #0
	bl sub_08082D1C
	ldr r0, _08030AB0 @ =0x0841D838
	ldr r1, _08030AB4 @ =0x06017000
	bl sub_08013688
	movs r0, #0
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030AB0: .4byte 0x0841D838
_08030AB4: .4byte 0x06017000

	thumb_func_start sub_08030AB8
sub_08030AB8: @ 0x08030AB8
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08030B3C @ =0x08BFF7A8
	ldr r0, _08030B40 @ =0x0000038D
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x8c
	adds r3, r4, #0
	bl sub_08006884
	ldr r0, _08030B44 @ =0x00000391
	str r0, [sp]
	movs r0, #4
	movs r1, #0x60
	movs r2, #0x8c
	adds r3, r4, #0
	bl sub_08006884
	ldr r3, _08030B48 @ =0x08BFF768
	ldr r0, _08030B4C @ =0x00000395
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8c
	bl sub_08006884
	ldr r5, _08030B50 @ =0x08BFF780
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x8c
	adds r3, r5, #0
	bl sub_08006884
	ldr r0, _08030B54 @ =0x00000397
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x8c
	adds r3, r4, #0
	bl sub_08006884
	ldr r0, _08030B58 @ =0x0000039B
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x8c
	adds r3, r4, #0
	bl sub_08006884
	ldr r0, _08030B5C @ =0x0000039F
	str r0, [sp]
	movs r0, #4
	movs r1, #0xe8
	movs r2, #0x8c
	adds r3, r5, #0
	bl sub_08006884
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030B3C: .4byte 0x08BFF7A8
_08030B40: .4byte 0x0000038D
_08030B44: .4byte 0x00000391
_08030B48: .4byte 0x08BFF768
_08030B4C: .4byte 0x00000395
_08030B50: .4byte 0x08BFF780
_08030B54: .4byte 0x00000397
_08030B58: .4byte 0x0000039B
_08030B5C: .4byte 0x0000039F

	thumb_func_start sub_08030B60
sub_08030B60: @ 0x08030B60
	push {lr}
	adds r1, r0, #0
	ldr r0, _08030B70 @ =0x08C05704
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08030B70: .4byte 0x08C05704

	thumb_func_start sub_08030B74
sub_08030B74: @ 0x08030B74
	push {lr}
	bl sub_08082D74
	ldr r0, _08030B84 @ =0x08C05704
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08030B84: .4byte 0x08C05704

	thumb_func_start sub_08030B88
sub_08030B88: @ 0x08030B88
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08082F74
	bl ResetText
	bl sub_0808667C
	bl sub_0801D6D8
	adds r0, r4, #0
	bl sub_08090788
	ldr r1, _08030C30 @ =sub_0803087C
	ldr r3, _08030C34 @ =0x00001143
	movs r0, #0xe2
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_08090800
	ldr r1, _08030C38 @ =sub_08030890
	ldr r3, _08030C3C @ =0x00001142
	ldr r0, _08030C40 @ =0x00000389
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl sub_08090800
	ldr r1, _08030C44 @ =sub_08030948
	movs r3, #0x8a
	lsls r3, r3, #5
	ldr r0, _08030C48 @ =0x00000387
	str r0, [sp]
	movs r0, #8
	movs r2, #0
	bl sub_08090800
	ldr r1, _08030C4C @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08030BFA
	ldr r1, _08030C50 @ =sub_08030988
	ldr r3, _08030C54 @ =0x00001134
	ldr r0, _08030C58 @ =0x00000383
	str r0, [sp]
	movs r0, #9
	movs r2, #0
	bl sub_08090800
_08030BFA:
	adds r0, r4, #0
	bl sub_08030B60
	ldr r0, _08030C5C @ =sub_080308D8
	bl sub_080907AC
	ldr r0, _08030C60 @ =sub_080308C8
	bl sub_080907C8
	ldr r0, _08030C64 @ =sub_08030B74
	bl sub_080907E4
	movs r0, #0xa
	movs r1, #2
	bl sub_08090930
	ldr r0, [r4, #0x58]
	bl sub_080908A8
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030C30: .4byte sub_0803087C
_08030C34: .4byte 0x00001143
_08030C38: .4byte sub_08030890
_08030C3C: .4byte 0x00001142
_08030C40: .4byte 0x00000389
_08030C44: .4byte sub_08030948
_08030C48: .4byte 0x00000387
_08030C4C: .4byte gPlaySt
_08030C50: .4byte sub_08030988
_08030C54: .4byte 0x00001134
_08030C58: .4byte 0x00000383
_08030C5C: .4byte sub_080308D8
_08030C60: .4byte sub_080308C8
_08030C64: .4byte sub_08030B74

	thumb_func_start sub_08030C68
sub_08030C68: @ 0x08030C68
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030C7E
	cmp r4, #0x28
	beq _08030C7E
	movs r0, #1
	b _08030C80
_08030C7E:
	movs r0, #0
_08030C80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08030C88
sub_08030C88: @ 0x08030C88
	adds r1, r0, #0
	adds r1, #0x4a
	movs r2, #0
	strh r2, [r1]
	str r2, [r0, #0x2c]
	str r2, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	ldr r1, _08030CAC @ =gBmMapSize
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08030CAC: .4byte gBmMapSize

	thumb_func_start sub_08030CB0
sub_08030CB0: @ 0x08030CB0
	movs r1, #0
	str r1, [r0, #0x34]
	movs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _08030CC8 @ =gBmMapSize
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08030CC8: .4byte gBmMapSize

	thumb_func_start sub_08030CCC
sub_08030CCC: @ 0x08030CCC
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x38]
	ldr r1, _08030CE8 @ =gBmMapSize
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08030CE8: .4byte gBmMapSize

	thumb_func_start sub_08030CEC
sub_08030CEC: @ 0x08030CEC
	movs r1, #0
	str r1, [r0, #0x34]
	subs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _08030D04 @ =gBmMapSize
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08030D04: .4byte gBmMapSize

	thumb_func_start sub_08030D08
sub_08030D08: @ 0x08030D08
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08030D50 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08030D22
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_08030D22:
	adds r0, r3, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, [r3, #0x2c]
	ldr r5, [r3, #0x30]
	cmp r0, #0
	beq _08030D54
	movs r1, #0xf
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08030D54
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08030D54
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08030D7C
	.align 2, 0
_08030D50: .4byte gpKeySt
_08030D54:
	ldr r2, [r3, #0x34]
	adds r2, r4, r2
	str r2, [r3, #0x2c]
	ldr r0, [r3, #0x38]
	adds r0, r5, r0
	str r0, [r3, #0x30]
	ldr r1, _08030D84 @ =gBmSt
	strh r2, [r1, #0xc]
	strh r0, [r1, #0xe]
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08030D7C
	adds r0, r3, #0
	bl Proc_Break
_08030D7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030D84: .4byte gBmSt

	thumb_func_start sub_08030D88
sub_08030D88: @ 0x08030D88
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08030DA4 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08030DA8
	adds r0, r4, #0
	bl Proc_End
	b _08030DF2
	.align 2, 0
_08030DA4: .4byte gPlaySt
_08030DA8:
	bl sub_08018D70
	movs r6, #0x10
	movs r0, #0x10
	ldrb r1, [r5, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08030DC6
	bl sub_0808EAF4
	bl sub_0800EFD4
	ldrb r0, [r5, #0x14]
	orrs r0, r6
	strb r0, [r5, #0x14]
_08030DC6:
	movs r0, #0
	bl sub_08015D98
	ldr r4, _08030DF8 @ =gBmSt
	strh r0, [r4, #0xc]
	movs r0, #0
	bl sub_08015DC0
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	orrs r0, r6
	strb r0, [r4, #4]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_08031A5C
	ldrb r0, [r0, #0xc]
	strb r0, [r5, #0xd]
	bl RefreshEntityMaps
	bl RenderMap
_08030DF2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030DF8: .4byte gBmSt

	thumb_func_start sub_08030DFC
sub_08030DFC: @ 0x08030DFC
	push {r4, lr}
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _08030E1C
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08015F0C
	b _08030E24
_08030E1C:
	movs r0, #0
	movs r1, #0
	bl sub_08015F0C
_08030E24:
	ldr r4, _08030E44 @ =gBmSt
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_08015D98
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_08015DC0
	strh r0, [r4, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030E44: .4byte gBmSt

	thumb_func_start sub_08030E48
sub_08030E48: @ 0x08030E48
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0801DA38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030E66
	ldr r0, [r4, #0x58]
	cmp r0, #2
	bne _08030E60
	bl sub_08030814
_08030E60:
	adds r0, r4, #0
	bl Proc_Break
_08030E66:
	ldr r1, _08030E7C @ =gBmSt
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl sub_08015DE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030E7C: .4byte gBmSt

	thumb_func_start sub_08030E80
sub_08030E80: @ 0x08030E80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0801C584
	bl sub_0801DA38
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08030E94
	b _080310E0
_08030E94:
	ldr r1, _08030ECC @ =gpKeySt
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _08030EDC
	ldr r1, _08030ED0 @ =gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_0801D758
	ldr r0, _08030ED4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08030EC2
	b _080310E0
_08030EC2:
	ldr r0, _08030ED8 @ =0x0000038B
	bl m4aSongNumStart
	b _080310E0
	.align 2, 0
_08030ECC: .4byte gpKeySt
_08030ED0: .4byte gBmSt
_08030ED4: .4byte gPlaySt
_08030ED8: .4byte 0x0000038B
_08030EDC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08030F40
	ldr r4, _08030F38 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r6, _08030F3C @ =gBmMapUnit
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08030F40
	bl sub_0806D4A4
	bl sub_0808667C
	movs r0, #0x1f
	bl sub_080807E4
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r5, #0
	bl sub_080821F8
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _080310F0
	.align 2, 0
_08030F38: .4byte gBmSt
_08030F3C: .4byte gBmMapUnit
_08030F40:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08030F74
	bl sub_0808667C
	ldr r4, _08030F6C @ =gPlaySt
	ldr r1, _08030F70 @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r4, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	adds r4, #0x41
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	b _0803103C
	.align 2, 0
_08030F6C: .4byte gPlaySt
_08030F70: .4byte gBmSt
_08030F74:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08030F7E
	b _080310BC
_08030F7E:
	ldr r2, _08030FB0 @ =gBmSt
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _08030FB4 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl sub_0801D270
	cmp r0, #4
	bls _08030FA6
	b _080310BC
_08030FA6:
	lsls r0, r0, #2
	ldr r1, _08030FB8 @ =_08030FBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030FB0: .4byte gBmSt
_08030FB4: .4byte gBmMapUnit
_08030FB8: .4byte _08030FBC
_08030FBC: @ jump table
	.4byte _08030FD0 @ case 0
	.4byte _08030FD0 @ case 1
	.4byte _08031050 @ case 2
	.4byte _08031098 @ case 3
	.4byte _08031078 @ case 4
_08030FD0:
	bl sub_0808667C
	ldr r3, _0803101C @ =gPlaySt
	ldr r2, _08031020 @ =gBmSt
	ldrh r0, [r2, #0x14]
	strb r0, [r3, #0x12]
	ldrh r0, [r2, #0x16]
	strb r0, [r3, #0x13]
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08031024 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	bgt _0803102C
	cmp r0, #6
	blt _0803102C
	adds r0, r3, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08031010
	ldr r0, _08031028 @ =0x0000038A
	bl m4aSongNumStart
_08031010:
	adds r0, r5, #0
	movs r1, #0x3c
	bl Proc_Goto
	b _080310F0
	.align 2, 0
_0803101C: .4byte gPlaySt
_08031020: .4byte gBmSt
_08031024: .4byte gBmMapTerrain
_08031028: .4byte 0x0000038A
_0803102C:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08031048 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
_0803103C:
	cmp r0, #0
	blt _080310F0
	ldr r0, _0803104C @ =0x00000389
	bl m4aSongNumStart
	b _080310F0
	.align 2, 0
_08031048: .4byte gPlaySt
_0803104C: .4byte 0x00000389
_08031050:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _08031074 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _080310AC
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080310F0
	.align 2, 0
_08031074: .4byte gActiveUnit
_08031078:
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _08031098
	ldr r0, _08031094 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080310F0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080310F0
	.align 2, 0
_08031094: .4byte gPlaySt
_08031098:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _080310B8 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
_080310AC:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _080310F0
	.align 2, 0
_080310B8: .4byte gActiveUnit
_080310BC:
	ldr r0, _080310DC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080310E0
	bl sub_0808667C
	bl sub_080A3EF8
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _080310F0
	.align 2, 0
_080310DC: .4byte gpKeySt
_080310E0:
	ldr r1, _080310F8 @ =gBmSt
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r3, #0x22
	ldrsh r1, [r1, r3]
	movs r2, #0
	bl sub_08015DE8
_080310F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080310F8: .4byte gBmSt

	thumb_func_start sub_080310FC
sub_080310FC: @ 0x080310FC
	push {lr}
	ldr r0, _08031110 @ =0x08C0571C
	bl Proc_Find
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08031110: .4byte 0x08C0571C

	thumb_func_start sub_08031114
sub_08031114: @ 0x08031114
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08031180 @ =0x08191D7C
	movs r1, #0
	bl StartSpriteAnim
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl sub_080128F0
	str r4, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x4a
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08031184 @ =gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x3c]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x40]
	ldr r0, _08031188 @ =0x000006F4
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08032A90
	ldr r0, _0803118C @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_0801615C
	ldr r0, _08031190 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08031178
	ldr r0, _08031194 @ =0x00000389
	bl m4aSongNumStart
_08031178:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031180: .4byte 0x08191D7C
_08031184: .4byte gBmSt
_08031188: .4byte 0x000006F4
_0803118C: .4byte gActiveUnit
_08031190: .4byte gPlaySt
_08031194: .4byte 0x00000389

	thumb_func_start sub_08031198
sub_08031198: @ 0x08031198
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, _08031230 @ =gBmSt
	movs r0, #0x16
	ldrsh r1, [r6, r0]
	ldr r0, _08031234 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r7, [r0]
	ldr r0, _08031238 @ =gBmMapUnit
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetUnit
	bl sub_0801D270
	cmp r0, #4
	bne _080311D0
	movs r7, #0
_080311D0:
	bl sub_0801C584
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	movs r5, #0xc
	ldrsh r1, [r6, r5]
	subs r5, r0, r1
	ldr r0, [r4, #0x40]
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0803120C
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0803120C
	subs r2, #0xc
	ldr r3, _0803123C @ =0x08BFF768
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl sub_08006884
_0803120C:
	ldr r0, _08031240 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08031260
	cmp r7, #0
	beq _08031244
	ldr r0, [r4, #0x54]
	bl sub_08012680
	adds r0, r4, #0
	bl Proc_Break
	bl sub_08032CCC
	b _080312DA
	.align 2, 0
_08031230: .4byte gBmSt
_08031234: .4byte 0x0202E3E4
_08031238: .4byte gBmMapUnit
_0803123C: .4byte 0x08BFF768
_08031240: .4byte gpKeySt
_08031244:
	ldr r0, _0803125C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080312DA
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080312DA
	.align 2, 0
_0803125C: .4byte gPlaySt
_08031260:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08031298
	ldr r0, [r4, #0x54]
	bl sub_08012680
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	bl sub_08032CCC
	ldr r0, _08031290 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080312DA
	ldr r0, _08031294 @ =0x0000038B
	bl m4aSongNumStart
	b _080312DA
	.align 2, 0
_08031290: .4byte gPlaySt
_08031294: .4byte 0x0000038B
_08031298:
	lsls r0, r7, #0x18
	asrs r3, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4a
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r3, r2
	beq _080312BA
	ldr r0, [r4, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _080312B6
	movs r1, #1
_080312B6:
	bl sub_080128F0
_080312BA:
	ldr r0, [r4, #0x54]
	ldr r3, _080312E4 @ =gBmSt
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	movs r4, #0xc
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	movs r4, #0x22
	ldrsh r2, [r3, r4]
	movs r4, #0xe
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	bl sub_08012694
	asrs r0, r6, #0x18
	strh r0, [r5]
_080312DA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080312E4: .4byte gBmSt

	thumb_func_start sub_080312E8
sub_080312E8: @ 0x080312E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08031314 @ =gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08015F0C
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_0801615C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031314: .4byte gActiveUnit

	thumb_func_start sub_08031318
sub_08031318: @ 0x08031318
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08031354 @ =gActiveUnit
	ldr r5, [r0]
	ldr r6, _08031358 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _0803135C @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08031360
	movs r0, #0x14
	ldrsh r2, [r6, r0]
	movs r1, #0x16
	ldrsh r3, [r6, r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_0801E804
	b _08031380
	.align 2, 0
_08031354: .4byte gActiveUnit
_08031358: .4byte gBmSt
_0803135C: .4byte gBmMapUnit
_08031360:
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_0801E804
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_0801E804
_08031380:
	ldr r0, _08031398 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08031392
	ldr r0, _0803139C @ =0x00000381
	bl m4aSongNumStart
_08031392:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031398: .4byte gPlaySt
_0803139C: .4byte 0x00000381

	thumb_func_start sub_080313A0
sub_080313A0: @ 0x080313A0
	push {lr}
	ldr r0, _080313B4 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080313AE
	bl RenderMapForFade
_080313AE:
	pop {r0}
	bx r0
	.align 2, 0
_080313B4: .4byte gPlaySt

	thumb_func_start sub_080313B8
sub_080313B8: @ 0x080313B8
	push {lr}
	ldr r0, _080313D0 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080313CC
	bl RenderMap
	movs r0, #0
	bl StartMapFade
_080313CC:
	pop {r0}
	bx r0
	.align 2, 0
_080313D0: .4byte gPlaySt

	thumb_func_start sub_080313D4
sub_080313D4: @ 0x080313D4
	push {lr}
	ldr r0, _080313E4 @ =0x08DAF4B8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080313E4: .4byte 0x08DAF4B8

	thumb_func_start sub_080313E8
sub_080313E8: @ 0x080313E8
	push {lr}
	sub sp, #0x1c
	ldr r0, _08031420 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031AEC
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r1, sp
	ldr r2, _08031424 @ =gBmSt
	ldrh r0, [r2, #0x14]
	strb r0, [r1, #0x18]
	ldrh r0, [r2, #0x16]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_080788FC
	cmp r0, #0
	beq _0803143A
	ldr r0, [sp, #0xc]
	cmp r0, #0x13
	beq _08031428
	cmp r0, #0x14
	beq _08031432
	b _0803143A
	.align 2, 0
_08031420: .4byte gPlaySt
_08031424: .4byte gBmSt
_08031428:
	ldr r1, [sp, #4]
	movs r0, #0
	bl sub_080B11FC
	b _0803143A
_08031432:
	ldr r1, [sp, #4]
	movs r0, #0
	bl sub_080B121C
_0803143A:
	add sp, #0x1c
	pop {r0}
	bx r0

	thumb_func_start sub_08031440
sub_08031440: @ 0x08031440
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0801C584
	ldr r0, _0803149C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080314B0
	bl sub_0806D4A4
	ldr r0, _080314A0 @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r1, _080314A4 @ =gBmSt
	movs r0, #0xf7
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bl sub_0801D6D8
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, _080314A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08031490
	ldr r0, _080314AC @ =0x0000038B
	bl m4aSongNumStart
_08031490:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0803155A
	.align 2, 0
_0803149C: .4byte gpKeySt
_080314A0: .4byte gActiveUnit
_080314A4: .4byte gBmSt
_080314A8: .4byte gPlaySt
_080314AC: .4byte 0x0000038B
_080314B0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08031504
	ldr r2, _08031560 @ =gBmSt
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _08031564 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _08031568 @ =gActiveUnitMoveOrigin
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _080314E2
	ldr r0, _0803156C @ =gActiveUnit
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_080314E2:
	cmp r4, #0
	beq _08031504
	bl sub_0806D4A4
	movs r0, #0x1f
	bl sub_080807E4
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl sub_080821F8
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
_08031504:
	ldr r0, _08031570 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803154A
	ldr r0, _0803156C @ =gActiveUnit
	ldr r0, [r0]
	cmp r0, #0
	beq _0803154A
	ldr r4, _08031568 @ =gActiveUnitMoveOrigin
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl sub_0801615C
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl sub_08015F0C
	ldr r0, _08031574 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803154A
	ldr r0, _08031578 @ =0x0000038B
	bl m4aSongNumStart
_0803154A:
	ldr r1, _08031560 @ =gBmSt
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl sub_08015DE8
_0803155A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031560: .4byte gBmSt
_08031564: .4byte gBmMapUnit
_08031568: .4byte gActiveUnitMoveOrigin
_0803156C: .4byte gActiveUnit
_08031570: .4byte gpKeySt
_08031574: .4byte gPlaySt
_08031578: .4byte 0x0000038B

	thumb_func_start sub_0803157C
sub_0803157C: @ 0x0803157C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_08002A44
	adds r0, r4, #0
	bl sub_080AAC88
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08031594
sub_08031594: @ 0x08031594
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080315B0 @ =gActiveUnit
	ldr r2, [r5]
	cmp r2, #0
	bne _080315B4
	bl sub_0802E834
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _08031606
	.align 2, 0
_080315B0: .4byte gActiveUnit
_080315B4:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _0803160C @ =gBmMapUnit
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl sub_0802E834
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_08031606:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803160C: .4byte gBmMapUnit

	thumb_func_start sub_08031610
sub_08031610: @ 0x08031610
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl sub_0800F070
	adds r0, r4, #0
	bl sub_080A5AF8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08031634
sub_08031634: @ 0x08031634
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start sub_08031648
sub_08031648: @ 0x08031648
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl sub_08003FD4
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_08031664
sub_08031664: @ 0x08031664
	push {r4, lr}
	ldr r1, _080316B8 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080316B2
	ldr r1, _080316BC @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080316B2
	ldr r0, _080316C0 @ =0x02020140
	bl InitUnitStack
	movs r4, #1
_08031686:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080316A8
	ldr r0, [r2]
	cmp r0, #0
	beq _080316A8
	ldr r0, [r2, #0xc]
	ldr r1, _080316C4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080316A8
	adds r0, r2, #0
	bl PushUnit
_080316A8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08031686
	bl LoadPlayerUnitsFromUnitStack2
_080316B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080316B8: .4byte gPlaySt
_080316BC: .4byte gBmSt
_080316C0: .4byte 0x02020140
_080316C4: .4byte 0x0001000C

	thumb_func_start sub_080316C8
sub_080316C8: @ 0x080316C8
	push {r4, lr}
	movs r4, #1
_080316CC:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0803170A
	ldr r3, [r2]
	cmp r3, #0
	beq _0803170A
	ldr r1, [r2, #0xc]
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, _08031700 @ =0x02010004
	ands r0, r1
	cmp r0, #0
	bne _0803170A
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08031704
	ldrb r0, [r3, #4]
	bl sub_080A0ADC
	b _0803170A
	.align 2, 0
_08031700: .4byte 0x02010004
_08031704:
	ldrb r0, [r3, #4]
	bl sub_080A09B8
_0803170A:
	adds r4, #1
	cmp r4, #0x3f
	ble _080316CC
	bl sub_08031664
	ldr r0, _08031734 @ =0x08C0571C
	bl sub_08004748
	ldr r2, _08031738 @ =gBmSt
	movs r1, #0xef
	adds r0, r1, #0
	ldrb r3, [r2, #4]
	ands r0, r3
	strb r0, [r2, #4]
	ldr r0, _0803173C @ =gPlaySt
	ldrb r2, [r0, #0x14]
	ands r1, r2
	strb r1, [r0, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031734: .4byte 0x08C0571C
_08031738: .4byte gBmSt
_0803173C: .4byte gPlaySt

	thumb_func_start sub_08031740
sub_08031740: @ 0x08031740
	push {lr}
	ldr r0, _08031754 @ =0x08C0571C
	bl Proc_Find
	cmp r0, #0
	beq _0803174E
	movs r0, #1
_0803174E:
	pop {r1}
	bx r1
	.align 2, 0
_08031754: .4byte 0x08C0571C

	thumb_func_start sub_08031758
sub_08031758: @ 0x08031758
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803176C @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031774
	b _080317D6
	.align 2, 0
_0803176C: .4byte gActiveUnit
_08031770:
	movs r0, #1
	b _080317D8
_08031774:
	ldr r0, _080317E0 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080317D6
_08031780:
	ldr r0, _080317E0 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _080317D0
	lsls r6, r5, #2
	lsls r7, r5, #0x18
_08031790:
	ldr r0, _080317E4 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080317CA
	ldr r0, _080317E8 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	beq _080317BC
	cmp r0, #5
	beq _080317BC
	cmp r0, #0x38
	beq _080317BC
	cmp r0, #0x37
	bne _080317CA
_080317BC:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r7, #0x18
	bl sub_080793A0
	cmp r0, #0xe
	beq _08031770
_080317CA:
	subs r4, #1
	cmp r4, #0
	bge _08031790
_080317D0:
	subs r5, #1
	cmp r5, #0
	bge _08031780
_080317D6:
	movs r0, #0
_080317D8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080317E0: .4byte gBmMapSize
_080317E4: .4byte gBmMapMovement
_080317E8: .4byte gBmMapTerrain

	thumb_func_start sub_080317EC
sub_080317EC: @ 0x080317EC
	push {r4, r5, r6, lr}
	ldr r0, _0803180C @ =gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803185A
	adds r0, r2, #0
	bl sub_08034D5C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08031814
	b _0803185A
	.align 2, 0
_0803180C: .4byte gActiveUnit
_08031810:
	movs r0, #1
	b _0803185C
_08031814:
	ldr r0, _08031864 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803185A
_08031820:
	ldr r0, _08031864 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _08031854
	lsls r6, r5, #0x18
_0803182E:
	ldr r0, _08031868 @ =gBmMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803184E
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r6, #0x18
	bl sub_080793A0
	cmp r0, #0xf
	beq _08031810
_0803184E:
	subs r4, #1
	cmp r4, #0
	bge _0803182E
_08031854:
	subs r5, #1
	cmp r5, #0
	bge _08031820
_0803185A:
	movs r0, #0
_0803185C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08031864: .4byte gBmMapSize
_08031868: .4byte gBmMapMovement

	thumb_func_start sub_0803186C
sub_0803186C: @ 0x0803186C
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _080318A4 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _080318A8 @ =gActiveUnit
	ldr r0, [r4]
	bl sub_0801A8B4
	ldr r1, _080318AC @ =0x02033E3C
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, _080318B0 @ =sub_080240AC
	bl sub_08023E3C
	bl sub_0804B950
	cmp r0, #0
	beq _0803189E
	movs r0, #1
_0803189E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080318A4: .4byte 0x0202E3E4
_080318A8: .4byte gActiveUnit
_080318AC: .4byte 0x02033E3C
_080318B0: .4byte sub_080240AC

	thumb_func_start sub_080318B4
sub_080318B4: @ 0x080318B4
	push {lr}
	ldr r0, _080318CC @ =gActiveUnit
	ldr r0, [r0]
	bl sub_080242C4
	bl sub_0804B950
	cmp r0, #0
	beq _080318C8
	movs r0, #1
_080318C8:
	pop {r1}
	bx r1
	.align 2, 0
_080318CC: .4byte gActiveUnit

	thumb_func_start sub_080318D0
sub_080318D0: @ 0x080318D0
	push {lr}
	ldr r0, _080318E8 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_080241F0
	bl sub_0804B950
	cmp r0, #0
	beq _080318E4
	movs r0, #1
_080318E4:
	pop {r1}
	bx r1
	.align 2, 0
_080318E8: .4byte gActiveUnit

	thumb_func_start sub_080318EC
sub_080318EC: @ 0x080318EC
	push {r4, lr}
	bl GetGameTime
	bl sub_08031758
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #9
	bl sub_080317EC
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	orrs r4, r0
	bl sub_0803186C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	orrs r4, r0
	bl sub_080318B4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	orrs r4, r0
	bl sub_080318D0
	lsls r0, r0, #0x18
	asrs r0, r0, #1
	orrs r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803192C
sub_0803192C: @ 0x0803192C
	push {lr}
	ldr r0, _08031950 @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrb r2, [r0, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r2, r1
	ldr r2, _08031954 @ =gActionSt
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08019FC0
	bl sub_080318EC
	pop {r1}
	bx r1
	.align 2, 0
_08031950: .4byte gActiveUnit
_08031954: .4byte gActionSt

	thumb_func_start sub_08031958
sub_08031958: @ 0x08031958
	push {r4, lr}
	ldr r4, _0803198C @ =gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08031990 @ =gActiveUnit
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl sub_080318EC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803198C: .4byte gBmMapMovement
_08031990: .4byte gActiveUnit

	thumb_func_start sub_08031994
sub_08031994: @ 0x08031994
	push {r4, r5, r6, r7, lr}
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_08017310
	adds r7, r0, #0
	ldr r0, _08031A48 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r5, #0x81
	ldr r6, _08031A4C @ =gActionSt
_080319AE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080319D0
	ldr r0, [r4]
	cmp r0, #0
	beq _080319D0
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0801B040
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x13]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #0x14]
_080319D0:
	adds r5, #1
	cmp r5, #0xbf
	ble _080319AE
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _08031A50 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _08031A42
_080319EA:
	ldr r0, _08031A50 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r6, #1
	cmp r4, #0
	blt _08031A3C
	lsls r5, r6, #2
_080319FA:
	ldr r0, _08031A54 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08031A36
	ldr r0, _08031A58 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08031A36
	ldr r0, _08031A48 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031A36
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl EnlistTarget
_08031A36:
	subs r4, #1
	cmp r4, #0
	bge _080319FA
_08031A3C:
	adds r6, r7, #0
	cmp r6, #0
	bge _080319EA
_08031A42:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031A48: .4byte 0x0202E3F0
_08031A4C: .4byte gActionSt
_08031A50: .4byte gBmMapSize
_08031A54: .4byte gBmMapMovement
_08031A58: .4byte gBmMapUnit

	thumb_func_start sub_08031A5C
sub_08031A5C: @ 0x08031A5C
	adds r1, r0, #0
	cmp r1, #0x30
	beq _08031A70
	movs r0, #0x94
	muls r0, r1, r0
	ldr r1, _08031A6C @ =0x08D62110
	adds r0, r0, r1
	b _08031A76
	.align 2, 0
_08031A6C: .4byte 0x08D62110
_08031A70:
	ldr r0, _08031A78 @ =0x08DAD298
	ldr r0, [r0]
	ldr r0, [r0]
_08031A76:
	bx lr
	.align 2, 0
_08031A78: .4byte 0x08DAD298

	thumb_func_start sub_08031A7C
sub_08031A7C: @ 0x08031A7C
	push {r4, r5, r6, lr}
	cmp r0, #0x30
	bne _08031AA8
	ldr r6, _08031AA0 @ =0x03005D90
	bl sub_080A2A50
	adds r4, r0, #0
	ldr r5, _08031AA4 @ =0x02020140
	bl sub_080A2A6C
	adds r2, r0, #0
	ldr r3, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r3
	adds r0, r5, #0
	b _08031AB6
	.align 2, 0
_08031AA0: .4byte 0x03005D90
_08031AA4: .4byte 0x02020140
_08031AA8:
	ldr r4, _08031ABC @ =0x08D648F4
	bl sub_08031A5C
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
_08031AB6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08031ABC: .4byte 0x08D648F4

	thumb_func_start sub_08031AC0
sub_08031AC0: @ 0x08031AC0
	push {r4, lr}
	cmp r0, #0x30
	bne _08031AD4
	ldr r0, _08031AD0 @ =0x08DAD298
	ldr r0, [r0]
	ldr r0, [r0, #4]
	b _08031AE2
	.align 2, 0
_08031AD0: .4byte 0x08DAD298
_08031AD4:
	ldr r4, _08031AE8 @ =0x08D648F4
	bl sub_08031A5C
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
_08031AE2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08031AE8: .4byte 0x08D648F4

	thumb_func_start sub_08031AEC
sub_08031AEC: @ 0x08031AEC
	push {r4, lr}
	cmp r0, #0x30
	bne _08031B00
	ldr r0, _08031AFC @ =0x08DAD298
	ldr r0, [r0]
	ldr r0, [r0, #8]
	b _08031B10
	.align 2, 0
_08031AFC: .4byte 0x08DAD298
_08031B00:
	ldr r4, _08031B18 @ =0x08D648F4
	bl sub_08031A5C
	adds r0, #0x74
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
_08031B10:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08031B18: .4byte 0x08D648F4

	thumb_func_start sub_08031B1C
sub_08031B1C: @ 0x08031B1C
	push {lr}
	cmp r0, #0x30
	bne _08031B30
	ldr r0, _08031B2C @ =0x08DAD298
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	b _08031B3A
	.align 2, 0
_08031B2C: .4byte 0x08DAD298
_08031B30:
	bl sub_08031A5C
	adds r0, #0x70
	bl DecodeMsg
_08031B3A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08031B40
sub_08031B40: @ 0x08031B40
	movs r1, #0
	ldr r0, _08031B50 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x43
	bne _08031B4C
	movs r1, #1
_08031B4C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08031B50: .4byte gPlaySt

	thumb_func_start sub_08031B54
sub_08031B54: @ 0x08031B54
	ldr r1, _08031B68 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_08031B68: .4byte gPlaySt

	thumb_func_start sub_08031B6C
sub_08031B6C: @ 0x08031B6C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _08031BD8 @ =0x081C983C
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, r4, #0
	adds r2, #0x62
	ldrb r2, [r2]
	adds r6, r2, r0
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	adds r0, #1
	lsls r5, r0, #3
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08031BE0
	bl GetGameTime
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08031BEE
	adds r1, r6, #0
	adds r1, #9
	adds r2, r5, #7
	ldr r3, _08031BDC @ =0x08BFF760
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r4, sp
	adds r4, r4, r0
	adds r4, #4
	movs r0, #0xf
	ldrh r4, [r4]
	ands r0, r4
	lsls r0, r0, #0xc
	adds r0, #3
	str r0, [sp]
	movs r0, #2
	bl sub_08006884
	b _08031BEE
	.align 2, 0
_08031BD8: .4byte 0x081C983C
_08031BDC: .4byte 0x08BFF760
_08031BE0:
	str r2, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_0802682C
_08031BEE:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08031BF8
sub_08031BF8: @ 0x08031BF8
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08031C20 @ =0x08C05C54
	bl Proc_Start
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #6
	bl sub_0800536C
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08031C20: .4byte 0x08C05C54

	thumb_func_start sub_08031C24
sub_08031C24: @ 0x08031C24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl sub_080054CC
	cmp r0, #0x27
	bgt _08031C4A
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #4
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x18
	b _08031C58
_08031C4A:
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #0
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x10
_08031C58:
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #0x10
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08031C6C
sub_08031C6C: @ 0x08031C6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	str r1, [sp, #4]
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _08031C90
	ldr r0, _08031D80 @ =0x08C05C54
	bl Proc_Find
	adds r5, r0, #0
	bl ClearBg0Bg1
_08031C90:
	ldr r0, [sp, #4]
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x60
	movs r1, #0
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r4, r7, #2
	ldr r3, [sp, #0x30]
	lsls r3, r3, #1
	adds r3, #2
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x2c]
	bl sub_0804A4CC
	lsls r0, r7, #5
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _08031D84 @ =0x02023460
	mov sb, r1
	add r0, sb
	ldr r1, _08031D88 @ =0x08191BD8
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	mov r8, r4
	adds r4, r5, #0
	adds r4, #0x30
	movs r2, #0x63
	adds r2, r2, r5
	mov sl, r2
	adds r0, r7, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0x2c]
	cmp r1, #0xa
	ble _08031D2C
	adds r3, r6, #0
	adds r3, #0xa
	adds r0, r6, r1
	subs r2, r0, #1
	mov sb, r0
	cmp r3, r2
	bge _08031D0C
	ldr r7, _08031D8C @ =0x0000100B
	mov ip, r7
	lsls r1, r3, #1
	mov r7, r8
	lsls r0, r7, #6
	ldr r7, _08031D84 @ =0x02023460
	adds r0, r0, r7
	adds r1, r1, r0
	subs r3, r2, r3
_08031D00:
	mov r0, ip
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08031D00
_08031D0C:
	mov r2, r8
	lsls r1, r2, #5
	adds r0, r1, #0
	adds r0, #9
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r7, _08031D84 @ =0x02023460
	adds r0, r0, r7
	ldr r2, _08031D90 @ =0x00001026
	strh r2, [r0]
	subs r1, #1
	add r1, sb
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r0, _08031D94 @ =0x0000100C
	strh r0, [r1]
_08031D2C:
	adds r0, r4, #0
	bl sub_080053B0
	adds r0, r5, #0
	bl sub_08031C24
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_08005444
	ldr r1, [sp, #4]
	ldr r0, [r1]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080055DC
	ldr r2, [sp, #8]
	lsls r1, r2, #5
	adds r1, #3
	adds r1, r1, r6
	lsls r1, r1, #1
	ldr r0, _08031D98 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005460
	movs r0, #3
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08031D80: .4byte 0x08C05C54
_08031D84: .4byte 0x02023460
_08031D88: .4byte 0x08191BD8
_08031D8C: .4byte 0x0000100B
_08031D90: .4byte 0x00001026
_08031D94: .4byte 0x0000100C
_08031D98: .4byte 0x02022C60

	thumb_func_start sub_08031D9C
sub_08031D9C: @ 0x08031D9C
	adds r2, r1, #0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _08031DB8 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r0, #0x77
	ble _08031DBC
	movs r0, #0
	b _08031DC0
	.align 2, 0
_08031DB8: .4byte gBmSt
_08031DBC:
	movs r0, #0x1e
	subs r0, r0, r2
_08031DC0:
	bx lr
	.align 2, 0

	thumb_func_start sub_08031DC4
sub_08031DC4: @ 0x08031DC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080053B0
	ldr r3, _08031E10 @ =0x081C9844
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_080059DC
	ldr r3, _08031E14 @ =0x081C984C
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl sub_080059DC
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl sub_08005A00
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_08005A00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031E10: .4byte 0x081C9844
_08031E14: .4byte 0x081C984C

	thumb_func_start sub_08031E18
sub_08031E18: @ 0x08031E18
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_080053B0
	ldr r3, _08031E54 @ =0x081C9850
	adds r0, r5, #0
	movs r1, #0
	movs r2, #3
	bl sub_080059DC
	ldr r0, [r4, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r3, r0
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_08005A00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031E54: .4byte 0x081C9850

	thumb_func_start sub_08031E58
sub_08031E58: @ 0x08031E58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080053B0
	ldr r3, _08031E88 @ =0x081C9858
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_080059DC
	adds r0, r5, #0
	bl GetUnitAid
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_08005A00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031E88: .4byte 0x081C9858

	thumb_func_start sub_08031E8C
sub_08031E8C: @ 0x08031E8C
	push {r4, lr}
	lsls r4, r2, #5
	adds r4, #4
	adds r4, r4, r1
	lsls r4, r4, #1
	ldr r1, _08031EBC @ =0x02022C60
	adds r4, r4, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl sub_08004D04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031EBC: .4byte 0x02022C60

	thumb_func_start sub_08031EC0
sub_08031EC0: @ 0x08031EC0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080053B0
	ldr r3, _08031EF0 @ =0x081C9860
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_080059DC
	adds r0, r5, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl sub_080059DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031EF0: .4byte 0x081C9860

	thumb_func_start sub_08031EF4
sub_08031EF4: @ 0x08031EF4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl sub_080053B0
	ldr r3, _08031F44 @ =0x081C9868
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_080059DC
	ldr r3, _08031F48 @ =0x081C9870
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl sub_080059DC
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r3, r3, r6
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_08005A00
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl sub_08005A00
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031F44: .4byte 0x081C9868
_08031F48: .4byte 0x081C9870

	thumb_func_start sub_08031F4C
sub_08031F4C: @ 0x08031F4C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080053B0
	ldr r3, _08031F7C @ =0x081C9868
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_080059DC
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_08005A00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031F7C: .4byte 0x081C9868

	thumb_func_start sub_08031F80
sub_08031F80: @ 0x08031F80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080053B0
	ldr r3, _08031FA8 @ =0x081C9874
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_080059DC
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	adds r3, r5, #0
	bl sub_08005A00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031FA8: .4byte 0x081C9874

	thumb_func_start sub_08031FAC
sub_08031FAC: @ 0x08031FAC
	push {r4, r5, lr}
	bl sub_08031BF8
	adds r4, r0, #0
	adds r4, #0x38
	movs r5, #4
_08031FB8:
	adds r0, r4, #0
	movs r1, #7
	bl sub_0800536C
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08031FB8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08031FD0
sub_08031FD0: @ 0x08031FD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	bl GetUnitItemCount
	mov sl, r0
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl sub_08031D9C
	adds r5, r0, #0
	movs r0, #0xd
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	cmp r0, #0
	bne _08031FFE
	movs r0, #1
	str r0, [sp, #4]
_08031FFE:
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r5, #0
	movs r3, #0
	bl sub_08031C6C
	adds r4, r0, #0
	mov r0, sl
	cmp r0, #0
	bne _08032040
	adds r4, #0x38
	adds r0, r4, #0
	bl sub_080053B0
	ldr r3, _08032038 @ =0x081C987C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_080059DC
	adds r1, r5, #0
	adds r1, #0x63
	lsls r1, r1, #1
	ldr r0, _0803203C @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005460
	b _080320C4
	.align 2, 0
_08032038: .4byte 0x081C987C
_0803203C: .4byte 0x02022C60
_08032040:
	movs r0, #0
	mov sb, r0
	cmp sb, sl
	bge _080320C4
	ldr r3, _080320D4 @ =0x02022C60
	adds r2, r5, #0
	adds r2, #0x61
	adds r1, r5, #0
	adds r1, #0x6b
	adds r0, r5, #0
	adds r0, #0x63
	adds r5, r4, #0
	adds r5, #0x38
	lsls r0, r0, #1
	adds r0, r0, r3
	mov r8, r0
	lsls r1, r1, #1
	adds r7, r1, r3
	lsls r2, r2, #1
	adds r6, r2, r3
_08032068:
	mov r0, sb
	lsls r1, r0, #1
	ldr r0, [sp, #8]
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r5, #0
	bl sub_080053B0
	adds r0, r4, #0
	bl sub_08017610
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_080055DC
	adds r0, r5, #0
	mov r1, r8
	bl sub_08005460
	adds r0, r4, #0
	bl sub_0801769C
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #2
	bl sub_08006074
	adds r0, r4, #0
	bl sub_08017808
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl sub_08004D04
	adds r6, #0x80
	adds r7, #0x80
	movs r0, #0x80
	add r8, r0
	adds r5, #8
	movs r0, #1
	add sb, r0
	cmp sb, sl
	blt _08032068
_080320C4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080320D4: .4byte 0x02022C60

	thumb_func_start sub_080320D8
sub_080320D8: @ 0x080320D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl sub_08031D9C
	str r0, [sp, #0x10]
	movs r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl sub_08031C6C
	movs r1, #0
	mov sl, r1
	ldr r1, [sp, #0xc]
	cmp sl, r1
	bge _080321D6
	ldr r1, [sp, #0x10]
	adds r1, #0x6b
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x10]
	adds r1, #0x63
	str r1, [sp, #0x18]
	movs r1, #0x60
	str r1, [sp, #0x1c]
	adds r7, r0, #0
	adds r7, #0x38
_08032128:
	mov r1, sl
	lsls r0, r1, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl sub_0801718C
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	bl sub_080053B0
	movs r1, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
	cmp r4, #0
	bne _08032154
	movs r1, #1
_08032154:
	adds r0, r7, #0
	bl sub_08005450
	adds r0, r6, #0
	bl sub_08017610
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_080055DC
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r0, _080321E8 @ =0x02022C60
	mov r8, r0
	add r1, r8
	adds r0, r7, #0
	bl sub_08005460
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	mov r1, r8
	adds r4, r0, r1
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	beq _0803218A
	movs r5, #2
_0803218A:
	adds r0, r6, #0
	bl sub_0801769C
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08006074
	ldr r4, [sp, #0x1c]
	adds r4, #1
	ldr r1, [sp, #0x10]
	adds r4, r4, r1
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl sub_08017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl sub_08004D04
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r1, #0x40
	str r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	adds r0, #0x40
	str r0, [sp, #0x1c]
	adds r7, #8
	movs r1, #1
	add sl, r1
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _08032128
_080321D6:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080321E8: .4byte 0x02022C60

	thumb_func_start sub_080321EC
sub_080321EC: @ 0x080321EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	movs r1, #0x10
	bl sub_08031D9C
	mov sb, r0
	movs r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	mov r2, sb
	movs r3, #0
	bl sub_08031C6C
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bge _08032310
	mov r1, sb
	adds r1, #0x6c
	str r1, [sp, #0x14]
	mov r2, sb
	adds r2, #0x63
	str r2, [sp, #0x18]
	movs r1, #0x60
	mov sl, r1
	adds r7, r0, #0
	adds r7, #0x38
_0803223C:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl sub_080171B4
	movs r5, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08032258
	movs r5, #1
_08032258:
	adds r0, r7, #0
	bl sub_080053B0
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08005450
	adds r0, r6, #0
	bl sub_08017610
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_080055DC
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r2, _08032328 @ =0x02022C60
	mov r8, r2
	add r1, r8
	adds r0, r7, #0
	bl sub_08005460
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	add r0, r8
	adds r1, r5, #0
	movs r2, #0x16
	bl sub_08005FEC
	adds r0, r6, #0
	bl sub_080171B4
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _080322A2
	movs r5, #2
_080322A2:
	mov r4, sl
	adds r4, #0xb
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl sub_0801769C
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08006074
	mov r4, sl
	adds r4, #0xe
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl sub_080176C4
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08006074
	mov r4, sl
	adds r4, #1
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl sub_08017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl sub_08004D04
	ldr r2, [sp, #0x14]
	adds r2, #0x40
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x40
	add sl, r1
	adds r7, #8
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _0803223C
_08032310:
	movs r0, #3
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032328: .4byte 0x02022C60

	thumb_func_start sub_0803232C
sub_0803232C: @ 0x0803232C
	push {lr}
	bl sub_08031BF8
	adds r0, #0x38
	movs r1, #8
	bl sub_0800536C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08032340
sub_08032340: @ 0x08032340
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl sub_08031D9C
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_08031C6C
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08031DC4
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08032388 @ =0x02022C60
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08005460
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032388: .4byte 0x02022C60

	thumb_func_start sub_0803238C
sub_0803238C: @ 0x0803238C
	push {r4, lr}
	bl sub_08031BF8
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl sub_0800536C
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl sub_0800536C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080323AC
sub_080323AC: @ 0x080323AC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl sub_08031D9C
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #0
	bl sub_08031C6C
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x38
	adds r0, r6, #0
	mov r1, r8
	bl sub_08031DC4
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r0, _0803241C @ =0x02022C60
	mov sb, r0
	add r1, sb
	adds r0, r6, #0
	bl sub_08005460
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, r8
	bl sub_08031EC0
	adds r4, #0xa1
	lsls r4, r4, #1
	add r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08005460
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803241C: .4byte 0x02022C60

	thumb_func_start sub_08032420
sub_08032420: @ 0x08032420
	push {lr}
	bl sub_08031BF8
	adds r0, #0x38
	movs r1, #8
	bl sub_0800536C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08032434
sub_08032434: @ 0x08032434
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl sub_08031D9C
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_08031C6C
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08031EF4
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08032488 @ =0x02022C60
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08005460
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032488: .4byte 0x02022C60

	thumb_func_start sub_0803248C
sub_0803248C: @ 0x0803248C
	push {r4, lr}
	bl sub_08031BF8
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl sub_0800536C
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl sub_0800536C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080324AC
sub_080324AC: @ 0x080324AC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	movs r1, #0xa
	bl sub_08031D9C
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_08031C6C
	adds r5, r0, #0
	movs r0, #0x38
	adds r0, r0, r5
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	mov r0, r8
	adds r1, r6, #0
	bl sub_08031F4C
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _08032528 @ =0x02022C60
	adds r1, r1, r6
	mov r0, r8
	bl sub_08005460
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, sb
	bl sub_08031F80
	adds r4, #0xa1
	lsls r4, r4, #1
	adds r4, r4, r6
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08005460
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032528: .4byte 0x02022C60

	thumb_func_start sub_0803252C
sub_0803252C: @ 0x0803252C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08031BF8
	ldr r4, _08032558 @ =0x0203A8E0
	str r0, [r4]
	adds r0, #0x38
	movs r1, #8
	bl sub_0800536C
	adds r0, r5, #0
	bl sub_08031BF8
	str r0, [r4, #4]
	adds r0, #0x38
	movs r1, #8
	bl sub_0800536C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032558: .4byte 0x0203A8E0

	thumb_func_start sub_0803255C
sub_0803255C: @ 0x0803255C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	bl sub_0803252C
	ldr r0, _08032590 @ =0x08BFF7F0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl sub_0800694C
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032590: .4byte 0x08BFF7F0

	thumb_func_start sub_08032594
sub_08032594: @ 0x08032594
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl sub_08031D9C
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldr r6, _0803263C @ =0x0203A8E0
	ldr r0, [r6]
	ldr r5, _08032640 @ =gActiveUnit
	ldr r1, [r5]
	movs r7, #0xa
	str r7, [sp]
	movs r2, #1
	mov sl, r2
	str r2, [sp, #4]
	adds r2, r4, #0
	movs r3, #0
	bl sub_08031C6C
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r5]
	bl sub_08031E58
	ldr r0, [r6]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r2, _08032644 @ =0x02022C60
	mov sb, r2
	add r1, sb
	bl sub_08005460
	ldr r0, [r5]
	adds r1, r4, #1
	movs r2, #3
	bl sub_08031E8C
	ldr r0, [r6, #4]
	str r7, [sp]
	mov r1, sl
	str r1, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl sub_08031C6C
	ldr r0, [r6, #4]
	adds r0, #0x38
	mov r1, r8
	bl sub_08031E18
	ldr r0, [r6, #4]
	adds r0, #0x38
	ldr r2, _08032648 @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, sb
	bl sub_08005460
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803263C: .4byte 0x0203A8E0
_08032640: .4byte gActiveUnit
_08032644: .4byte 0x02022C60
_08032648: .4byte 0x00000121

	thumb_func_start sub_0803264C
sub_0803264C: @ 0x0803264C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	bl sub_08031D9C
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r7, r0, #0
	ldr r6, _08032700 @ =0x0203A8E0
	ldr r0, [r6]
	ldr r5, _08032704 @ =gActiveUnit
	ldr r1, [r5]
	movs r2, #0xa
	mov sl, r2
	str r2, [sp]
	movs r2, #1
	mov sb, r2
	str r2, [sp, #4]
	adds r2, r4, #0
	movs r3, #0
	bl sub_08031C6C
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r5]
	bl sub_08031E58
	ldr r0, [r6]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r2, _08032708 @ =0x02022C60
	mov r8, r2
	add r1, r8
	bl sub_08005460
	ldr r0, [r5]
	adds r1, r4, #1
	movs r2, #3
	bl sub_08031E8C
	ldr r0, [r6, #4]
	mov r1, sl
	str r1, [sp]
	mov r2, sb
	str r2, [sp, #4]
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #6
	bl sub_08031C6C
	ldr r0, [r6, #4]
	adds r0, #0x38
	adds r1, r7, #0
	bl sub_08031E18
	ldr r0, [r6, #4]
	adds r0, #0x38
	ldr r2, _0803270C @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, r8
	bl sub_08005460
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032700: .4byte 0x0203A8E0
_08032704: .4byte gActiveUnit
_08032708: .4byte 0x02022C60
_0803270C: .4byte 0x00000121

	thumb_func_start sub_08032710
sub_08032710: @ 0x08032710
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	bl sub_0803252C
	ldr r0, _08032744 @ =0x08BFF768
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl sub_0800694C
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032744: .4byte 0x08BFF768

	thumb_func_start sub_08032748
sub_08032748: @ 0x08032748
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl sub_08031D9C
	adds r4, r0, #0
	ldr r0, _080327FC @ =gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl ClearBg0Bg1
	ldr r5, _08032800 @ =0x0203A8E0
	ldr r0, [r5]
	movs r1, #0xa
	mov sl, r1
	str r1, [sp]
	movs r2, #1
	mov sb, r2
	str r2, [sp, #4]
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_08031C6C
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r6, #0
	bl sub_08031E18
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _08032804 @ =0x02022C60
	adds r1, r1, r6
	bl sub_08005460
	ldr r0, [r5, #4]
	mov r1, sl
	str r1, [sp]
	mov r2, sb
	str r2, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl sub_08031C6C
	ldr r0, [r5, #4]
	adds r0, #0x38
	mov r1, r8
	bl sub_08031E58
	ldr r0, [r5, #4]
	adds r0, #0x38
	ldr r2, _08032808 @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	adds r1, r1, r6
	bl sub_08005460
	adds r1, r4, #1
	mov r0, r8
	movs r2, #9
	bl sub_08031E8C
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080327FC: .4byte gActiveUnit
_08032800: .4byte 0x0203A8E0
_08032804: .4byte 0x02022C60
_08032808: .4byte 0x00000121

	thumb_func_start sub_0803280C
sub_0803280C: @ 0x0803280C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	movs r5, #0
_08032816:
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #0x20
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #0x5c
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0x5e
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl __modsi3
	ldr r1, _08032864 @ =0x08C05C64
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08032868 @ =0x00004240
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r7, #0
	ldr r3, _0803286C @ =0x08BFF7A8
	bl sub_08006884
	adds r5, #1
	cmp r5, #8
	ble _08032816
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032864: .4byte 0x08C05C64
_08032868: .4byte 0x00004240
_0803286C: .4byte 0x08BFF7A8

	thumb_func_start sub_08032870
sub_08032870: @ 0x08032870
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x2c]
	adds r0, #0x30
	ldr r1, _08032934 @ =0x06014800
	movs r2, #0x14
	bl sub_08005ACC
	movs r0, #1
	bl sub_080052E0
	ldr r0, _08032938 @ =0x081901E8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #1
_0803289E:
	adds r0, r4, #0
	bl sub_08005B08
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005B8C
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005450
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _0803289E
	cmp r5, #0
	beq _08032922
	movs r0, #0x5e
	adds r0, r0, r7
	mov r8, r0
	adds r6, r7, #0
	adds r6, #0x5c
	ldrb r2, [r5]
	cmp r2, #1
	bls _08032910
	adds r4, r7, #0
	adds r4, #0x48
_080328D4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080056D8
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_08005440
	cmp r0, #0xe0
	ble _0803290A
	subs r5, #2
	adds r4, #8
	adds r0, r5, #0
	mov r1, sp
	bl sub_08005528
	adds r0, r7, #0
	adds r0, #0x48
	bl sub_08005440
	adds r1, r0, #0
	ldr r0, [sp]
	subs r1, r1, r0
	subs r1, #0xc0
	adds r0, r4, #0
	bl sub_08005444
_0803290A:
	ldrb r0, [r5]
	cmp r0, #1
	bhi _080328D4
_08032910:
	ldr r0, [r7, #0x2c]
	bl sub_080054CC
	adds r0, #0x10
	asrs r0, r0, #5
	adds r1, r0, #1
	mov r2, r8
	strh r1, [r2]
	strh r0, [r6]
_08032922:
	movs r0, #0
	bl sub_08005320
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032934: .4byte 0x06014800
_08032938: .4byte 0x081901E8

	thumb_func_start sub_0803293C
sub_0803293C: @ 0x0803293C
	ldr r0, _08032964 @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	subs r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bls _08032970
	ldr r2, _08032968 @ =0x04000050
	ldr r1, _0803296C @ =0x030027CC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strb r0, [r2]
	b _08032990
	.align 2, 0
_08032964: .4byte 0x04000006
_08032968: .4byte 0x04000050
_0803296C: .4byte 0x030027CC
_08032970:
	ldr r0, _08032994 @ =0x08C05C7E
	subs r1, #0x80
	adds r1, r1, r0
	ldr r0, _08032998 @ =gBmSt
	adds r0, #0x38
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r2, r1, r0
	cmp r2, #0
	bge _08032986
	movs r2, #0
_08032986:
	ldr r0, _0803299C @ =0x04000050
	movs r1, #0xec
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
_08032990:
	bx lr
	.align 2, 0
_08032994: .4byte 0x08C05C7E
_08032998: .4byte gBmSt
_0803299C: .4byte 0x04000050

	thumb_func_start sub_080329A0
sub_080329A0: @ 0x080329A0
	push {lr}
	ldr r0, _080329B4 @ =gBmSt
	adds r0, #0x38
	movs r1, #8
	strb r1, [r0]
	ldr r0, _080329B8 @ =sub_0803293C
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080329B4: .4byte gBmSt
_080329B8: .4byte sub_0803293C

	thumb_func_start sub_080329BC
sub_080329BC: @ 0x080329BC
	ldr r0, _080329D0 @ =gBmSt
	adds r1, r0, #0
	adds r1, #0x38
	ldrb r0, [r1]
	cmp r0, #0
	beq _080329CC
	subs r0, #1
	strb r0, [r1]
_080329CC:
	bx lr
	.align 2, 0
_080329D0: .4byte gBmSt

	thumb_func_start sub_080329D4
sub_080329D4: @ 0x080329D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080329FC @ =gBmSt
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _080329F6
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_080329F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080329FC: .4byte gBmSt

	thumb_func_start sub_08032A00
sub_08032A00: @ 0x08032A00
	push {lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0x1f
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _08032A1C @ =0x08C05CA0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08032A1C: .4byte 0x08C05CA0

	thumb_func_start sub_08032A20
sub_08032A20: @ 0x08032A20
	push {lr}
	ldr r0, _08032A3C @ =gBmSt
	ldrh r1, [r0, #0x2a]
	subs r1, #0x10
	strh r1, [r0, #0x2a]
	movs r0, #0
	bl sub_0801622C
	ldr r0, _08032A40 @ =0x08C05CA0
	bl sub_08004764
	pop {r0}
	bx r0
	.align 2, 0
_08032A3C: .4byte gBmSt
_08032A40: .4byte 0x08C05CA0

	thumb_func_start sub_08032A44
sub_08032A44: @ 0x08032A44
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08032A8C @ =0x08C05CC8
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_0803280C
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08032A6A
	subs r0, r1, #1
	strh r0, [r4]
_08032A6A:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032A86
	movs r0, #0x1f
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08032A86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032A8C: .4byte 0x08C05CC8

	thumb_func_start sub_08032A90
sub_08032A90: @ 0x08032A90
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08032AC4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #1
	beq _08032ABC
	ldr r0, _08032AC8 @ =0x08C05CD0
	adds r1, r2, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	bl sub_08032870
	bl sub_08019F20
	ldr r1, _08032ACC @ =gBmSt
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
_08032ABC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032AC4: .4byte gPlaySt
_08032AC8: .4byte 0x08C05CD0
_08032ACC: .4byte gBmSt

	thumb_func_start sub_08032AD0
sub_08032AD0: @ 0x08032AD0
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _08032B34 @ =0x0841DBCC
	ldr r1, _08032B38 @ =0x06015000
	bl sub_08013688
	ldr r0, _08032B3C @ =0x0841DE88
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08032B40 @ =0x08C05CA0
	movs r1, #3
	bl Proc_Start
	ldr r4, _08032B44 @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08032B10
	ldr r0, _08032B48 @ =0x0000038A
	bl m4aSongNumStart
_08032B10:
	adds r3, r4, #0
	adds r3, #0x42
	ldrb r2, [r3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1f
	movs r1, #1
	subs r1, r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032B34: .4byte 0x0841DBCC
_08032B38: .4byte 0x06015000
_08032B3C: .4byte 0x0841DE88
_08032B40: .4byte 0x08C05CA0
_08032B44: .4byte gPlaySt
_08032B48: .4byte 0x0000038A

	thumb_func_start sub_08032B4C
sub_08032B4C: @ 0x08032B4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0
	ldr r0, _08032BF0 @ =gPlaySt
	adds r0, #0x42
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1a
	cmp r0, #0
	bge _08032B68
	movs r1, #5
_08032B68:
	ldr r4, _08032BF4 @ =0x08BFF7A8
	lsls r5, r1, #0xc
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x38
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08006884
	movs r0, #0xa1
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x58
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08006884
	movs r0, #0xa2
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x78
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08006884
	ldr r4, _08032BF8 @ =0x08BFF768
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x98
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08006884
	ldr r7, _08032BFC @ =0x08BFF780
	ldr r0, _08032C00 @ =0x0000028E
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa8
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_08006884
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #0x1a
	cmp r0, #0
	blt _08032C08
	ldr r0, _08032C04 @ =0x0000028F
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08006884
	b _08032C2E
	.align 2, 0
_08032BF0: .4byte gPlaySt
_08032BF4: .4byte 0x08BFF7A8
_08032BF8: .4byte 0x08BFF768
_08032BFC: .4byte 0x08BFF780
_08032C00: .4byte 0x0000028E
_08032C04: .4byte 0x0000028F
_08032C08:
	ldr r0, _08032C3C @ =0x00000292
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08006884
	movs r0, #0xa5
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xc0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_08006884
_08032C2E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032C3C: .4byte 0x00000292

	thumb_func_start sub_08032C40
sub_08032C40: @ 0x08032C40
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08032C98 @ =0x08C05D08
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_08032B4C
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08032C64
	subs r0, r1, #1
	strh r0, [r4]
_08032C64:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1d
	bgt _08032C76
	adds r0, r2, #1
	strh r0, [r1]
_08032C76:
	ldrh r1, [r1]
	cmp r1, #0x1e
	bne _08032C90
	ldr r0, _08032C9C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08032C90
	adds r0, r5, #0
	bl Proc_Break
_08032C90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032C98: .4byte 0x08C05D08
_08032C9C: .4byte gpKeySt

	thumb_func_start sub_08032CA0
sub_08032CA0: @ 0x08032CA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08032CC4 @ =0x08C05D10
	bl Proc_StartBlocking
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_08032870
	bl sub_08019F20
	ldr r1, _08032CC8 @ =gBmSt
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_08032CC4: .4byte 0x08C05D10
_08032CC8: .4byte gBmSt

	thumb_func_start sub_08032CCC
sub_08032CCC: @ 0x08032CCC
	push {lr}
	ldr r0, _08032CD8 @ =0x08C05CD0
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08032CD8: .4byte 0x08C05CD0

	thumb_func_start sub_08032CDC
sub_08032CDC: @ 0x08032CDC
	push {lr}
	ldr r0, _08032CF0 @ =0x08C05CD0
	bl Proc_Find
	cmp r0, #0
	beq _08032CEA
	movs r0, #1
_08032CEA:
	pop {r1}
	bx r1
	.align 2, 0
_08032CF0: .4byte 0x08C05CD0

	thumb_func_start sub_08032CF4
sub_08032CF4: @ 0x08032CF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _08032D28 @ =0x08C05CD0
	adds r0, r5, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _08032D12
	adds r0, r5, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r4, r0, #0
_08032D12:
	str r7, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_08032870
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x1f
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032D28: .4byte 0x08C05CD0

	thumb_func_start sub_08032D2C
sub_08032D2C: @ 0x08032D2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	blt _08032D40
	adds r0, r4, #0
	bl SetUnitStatus
_08032D40:
	adds r0, r4, #0
	adds r1, r5, #0
	bl AddUnitHp
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08032D58
	adds r0, r4, #0
	bl UnitKill
_08032D58:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0802FC20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08032D68
sub_08032D68: @ 0x08032D68
	push {lr}
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08032D7E
	ldr r0, _08032D84 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08032D7E
	bl RenderMapForFade
_08032D7E:
	pop {r0}
	bx r0
	.align 2, 0
_08032D84: .4byte gPlaySt

	thumb_func_start BeginUnitHealAnim
BeginUnitHealAnim: @ 0x08032D88
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0802A964
	ldr r5, _08032DC8 @ =gBattleActor
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0x6b
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	ldr r0, _08032DCC @ =0x0203A508
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r5, [r5, #0x13]
	subs r0, r0, r5
	strb r0, [r1, #3]
	bl BattleHitTerminate
	bl sub_0802A860
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032DC8: .4byte gBattleActor
_08032DCC: .4byte 0x0203A508

	thumb_func_start sub_08032DD0
sub_08032DD0: @ 0x08032DD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0802A964
	ldr r5, _08032E2C @ =gBattleActor
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08032DF6
	movs r0, #0
	strb r0, [r5, #0x13]
_08032DF6:
	ldr r2, _08032E30 @ =0x0203A508
	ldr r0, [r2]
	adds r1, r5, #0
	adds r1, #0x72
	ldrb r1, [r1]
	ldrb r3, [r5, #0x13]
	subs r1, r1, r3
	strb r1, [r0, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08032E18
	ldr r1, [r2]
	movs r0, #2
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
_08032E18:
	bl BattleHitTerminate
	bl sub_0806F7B0
	adds r0, r6, #0
	bl sub_08032D68
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032E2C: .4byte gBattleActor
_08032E30: .4byte 0x0203A508

	thumb_func_start sub_08032E34
sub_08032E34: @ 0x08032E34
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0802A964
	ldr r5, _08032E98 @ =gBattleActor
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08032E5A
	movs r0, #0
	strb r0, [r5, #0x13]
_08032E5A:
	ldr r2, _08032E9C @ =0x0203A508
	ldr r0, [r2]
	adds r1, r5, #0
	adds r1, #0x72
	ldrb r1, [r1]
	ldrb r3, [r5, #0x13]
	subs r1, r1, r3
	strb r1, [r0, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08032E84
	ldr r1, [r2]
	movs r0, #1
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #2
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
_08032E84:
	bl BattleHitTerminate
	bl sub_0806F83C
	adds r0, r6, #0
	bl sub_08032D68
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032E98: .4byte gBattleActor
_08032E9C: .4byte 0x0203A508

	thumb_func_start sub_08032EA0
sub_08032EA0: @ 0x08032EA0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	movs r4, #0x81
_08032EAE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08032EDE
	ldr r0, [r2]
	cmp r0, #0
	beq _08032EDE
	ldr r0, [r2, #0xc]
	ldr r1, _08032EF4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08032EDE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0xb]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #0
	bl EnlistTarget
_08032EDE:
	adds r4, #1
	cmp r4, #0xbf
	ble _08032EAE
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032EF4: .4byte 0x0001000C

	thumb_func_start sub_08032EF8
sub_08032EF8: @ 0x08032EF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r4, [r6, r0]
	bl sub_0804B950
	cmp r4, r0
	bne _08032F16
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08032F8A
_08032F16:
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl sub_0804B95C
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl UnitKill
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	ldr r1, _08032F70 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r2, #0xf0
	bhi _08032F5A
	cmp r0, #0
	blt _08032F5A
	cmp r0, #0xa0
	ble _08032F74
_08032F5A:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08032F8A
	.align 2, 0
_08032F70: .4byte gBmSt
_08032F74:
	adds r0, r4, #0
	bl sub_0806C2DC
	bl sub_0806DD98
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r0, r5, #0
	bl Proc_Break
_08032F8A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08032F90
sub_08032F90: @ 0x08032F90
	push {r4, r5, r6, lr}
	bl ClearBg0Bg1
	ldr r0, _08032FE4 @ =0x08404B2C
	ldr r1, _08032FE8 @ =0x06005000
	bl sub_08013688
	ldr r0, _08032FEC @ =0x08404BB4
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08032FF0 @ =0x02022C60
	ldr r1, _08032FF4 @ =0x08404BD4
	movs r2, #0xca
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	adds r6, r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r4, #6
_08032FC0:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #4
	bl TmCopyRect_thm
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _08032FC0
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032FE4: .4byte 0x08404B2C
_08032FE8: .4byte 0x06005000
_08032FEC: .4byte 0x08404BB4
_08032FF0: .4byte 0x02022C60
_08032FF4: .4byte 0x08404BD4

	thumb_func_start sub_08032FF8
sub_08032FF8: @ 0x08032FF8
	push {r4, lr}
	ldr r1, _08033028 @ =gBmSt
	ldr r0, _0803302C @ =gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #4
	ldrh r1, [r1, #0xc]
	subs r4, r1, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetGameTime
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033028: .4byte gBmSt
_0803302C: .4byte gActiveUnit

	thumb_func_start sub_08033030
sub_08033030: @ 0x08033030
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _080330CC @ =gActiveUnit
	ldr r0, [r0]
	bl HideUnitSprite
	ldr r0, _080330D0 @ =0x03002790
	mov ip, r0
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r3, ip
	strb r0, [r3, #1]
	mov r7, ip
	adds r7, #0x36
	ldrb r0, [r7]
	ands r1, r0
	movs r2, #0x37
	add r2, ip
	mov r8, r2
	movs r0, #0x20
	ldrb r3, [r2]
	orrs r0, r3
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r1, r5
	movs r4, #5
	rsbs r4, r4, #0
	ands r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r7]
	movs r1, #1
	orrs r0, r1
	ands r0, r5
	ands r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080330D4 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080330D8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	adds r6, #0x4c
	movs r0, #0x40
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080330CC: .4byte gActiveUnit
_080330D0: .4byte 0x03002790
_080330D4: .4byte 0x0000FFE0
_080330D8: .4byte 0x0000E0FF

	thumb_func_start sub_080330DC
sub_080330DC: @ 0x080330DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0803312C @ =gActiveUnit
	ldr r4, [r0]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _08033130 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	movs r6, #0xe
	ldrsh r0, [r3, r6]
	subs r2, r2, r0
	movs r3, #0xa0
	lsls r3, r3, #6
	str r4, [sp]
	movs r0, #4
	bl sub_08026908
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08033122
	adds r0, r5, #0
	bl Proc_Break
_08033122:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803312C: .4byte gActiveUnit
_08033130: .4byte gBmSt

	thumb_func_start sub_08033134
sub_08033134: @ 0x08033134
	push {lr}
	ldr r0, _08033144 @ =gActiveUnit
	ldr r0, [r0]
	bl ShowUnitSprite
	pop {r0}
	bx r0
	.align 2, 0
_08033144: .4byte gActiveUnit

	thumb_func_start sub_08033148
sub_08033148: @ 0x08033148
	adds r2, r0, #0
	adds r2, #0x4c
	movs r3, #0
	movs r1, #0xf
	strh r1, [r2]
	str r3, [r0, #0x2c]
	movs r1, #1
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_0803315C
sub_0803315C: @ 0x0803315C
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	movs r1, #0x10
	str r1, [r0, #0x2c]
	subs r1, #0x11
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_08033170
sub_08033170: @ 0x08033170
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	adds r2, r2, r0
	str r2, [r4, #0x2c]
	ldr r0, _080331C4 @ =0x03002790
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	mov r2, ip
	adds r2, #0x45
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080331BC
	adds r0, r4, #0
	bl Proc_Break
_080331BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080331C4: .4byte 0x03002790

	thumb_func_start sub_080331C8
sub_080331C8: @ 0x080331C8
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080331E8 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0x40
	beq _08033204
	cmp r1, #0x40
	bgt _080331EC
	cmp r1, #0
	beq _080331F2
	b _08033206
	.align 2, 0
_080331E8: .4byte gActiveUnit
_080331EC:
	cmp r1, #0x80
	beq _080331FC
	b _08033206
_080331F2:
	ldr r2, _080331F8 @ =0x02022BE0
	b _08033206
	.align 2, 0
_080331F8: .4byte 0x02022BE0
_080331FC:
	ldr r2, _08033200 @ =0x02022C00
	b _08033206
	.align 2, 0
_08033200: .4byte 0x02022C00
_08033204:
	ldr r2, _08033220 @ =0x02022C20
_08033206:
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033220: .4byte 0x02022C20

	thumb_func_start sub_08033224
sub_08033224: @ 0x08033224
	push {lr}
	adds r3, r1, #0
	cmp r3, #0x1f
	ble _0803322E
	movs r3, #0x1f
_0803322E:
	cmp r3, #0
	bge _08033234
	movs r3, #0
_08033234:
	ldr r0, _0803324C @ =0x02022860
	lsls r1, r3, #0xa
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r2, _08033250 @ =0x0000025E
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_0803324C: .4byte 0x02022860
_08033250: .4byte 0x0000025E

	thumb_func_start sub_08033254
sub_08033254: @ 0x08033254
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_08033224
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0803327A
	adds r0, r5, #0
	bl Proc_Break
_0803327A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08033280
sub_08033280: @ 0x08033280
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_08033224
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080332A4
	adds r0, r5, #0
	bl Proc_Break
_080332A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080332AC
sub_080332AC: @ 0x080332AC
	push {lr}
	bl ClearBg0Bg1
	ldr r3, _08033300 @ =0x03002790
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x37
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08033300: .4byte 0x03002790

	thumb_func_start StartStatusHealEffect
StartStatusHealEffect: @ 0x08033304
	push {lr}
	adds r2, r1, #0
	ldr r1, _0803332C @ =gActiveUnit
	str r0, [r1]
	cmp r2, #0
	beq _08033338
	ldr r0, _08033330 @ =0x08C05E30
	adds r1, r2, #0
	bl Proc_StartBlocking
	ldr r0, _08033334 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033340
	movs r0, #0xaa
	bl m4aSongNumStart
	b _08033340
	.align 2, 0
_0803332C: .4byte gActiveUnit
_08033330: .4byte 0x08C05E30
_08033334: .4byte gPlaySt
_08033338:
	ldr r0, _08033344 @ =0x08C05E30
	movs r1, #3
	bl Proc_StartBlocking
_08033340:
	pop {r0}
	bx r0
	.align 2, 0
_08033344: .4byte 0x08C05E30

	thumb_func_start TerrainHealDisplay_Init
TerrainHealDisplay_Init: @ 0x08033348
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08033364 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	bl sub_08024774
	bl sub_0804B950
	cmp r0, #0
	bne _08033368
	adds r0, r4, #0
	bl Proc_End
	b _08033370
	.align 2, 0
_08033364: .4byte gPlaySt
_08033368:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08033370:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MassEffectDisplay_Check
MassEffectDisplay_Check: @ 0x08033378
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_0804B95C
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _080333B0 @ =gActionSt
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r5, r0]
	bl sub_0804B950
	cmp r4, r0
	bne _080333B4
	adds r0, r7, #0
	bl Proc_End
	b _080333FA
	.align 2, 0
_080333B0: .4byte gActionSt
_080333B4:
	ldr r0, _080333E0 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080333E8
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _080333E4 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080333E8
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _080333FA
	.align 2, 0
_080333E0: .4byte gPlaySt
_080333E4: .4byte 0x0202E3E8
_080333E8:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080333FA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_080333FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MassEffectDisplay_Watch
MassEffectDisplay_Watch: @ 0x08033400
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl sub_0801615C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TerrainHealDisplay_Display
TerrainHealDisplay_Display: @ 0x08033424
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08033450
	adds r0, r4, #0
	adds r1, r6, #0
	bl StartStatusHealEffect
	b _08033460
_08033450:
	adds r0, r4, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl BeginUnitHealAnim
_08033460:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FinishDamageDisplay
FinishDamageDisplay: @ 0x08033468
	push {lr}
	bl sub_0806D4A4
	ldr r0, _0803348C @ =gBattleActor
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033486
	ldr r0, _08033490 @ =gActionSt
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl ShowUnitSprite
_08033486:
	pop {r0}
	bx r0
	.align 2, 0
_0803348C: .4byte gBattleActor
_08033490: .4byte gActionSt

	thumb_func_start TerrainHealDisplay_Next
TerrainHealDisplay_Next: @ 0x08033494
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _080334C2
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_08032D2C
	b _080334D0
_080334C2:
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r5, #0
	bl sub_08032D2C
_080334D0:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start PoisonDamageDisplay_Init
PoisonDamageDisplay_Init: @ 0x080334E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08033504 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	bl sub_08024848
	movs r0, #4
	bl sub_08024F14
	bl sub_0804B950
	cmp r0, #0
	bne _08033508
	adds r0, r4, #0
	bl Proc_End
	b _08033510
	.align 2, 0
_08033504: .4byte gPlaySt
_08033508:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08033510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08033518
sub_08033518: @ 0x08033518
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl sub_08032DD0
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08033544
sub_08033544: @ 0x08033544
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_0804B95C
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	bl sub_08032D2C
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, _080335B0 @ =gActionSt
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08033594
	bl sub_08079910
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033594
	bl sub_08079950
_08033594:
	ldr r0, _080335B0 @ =gActionSt
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _080335A8
	bl RefreshUnitSprites
_080335A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080335B0: .4byte gActionSt

	thumb_func_start sub_080335B4
sub_080335B4: @ 0x080335B4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B950
	cmp r0, #0
	bne _080335C8
	adds r0, r4, #0
	bl Proc_End
	b _080335D0
_080335C8:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_080335D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080335D8
sub_080335D8: @ 0x080335D8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	adds r7, r0, #0
	ldr r4, _08033620 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1c
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	cmp r5, #4
	bgt _0803361A
	cmp r5, #1
	blt _0803361A
	movs r0, #2
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatusHealEffect
_0803361A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033620: .4byte gActionSt

	thumb_func_start sub_08033624
sub_08033624: @ 0x08033624
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08033644 @ =gActionSt
	ldrb r0, [r0, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033644: .4byte gActionSt

	thumb_func_start sub_08033648
sub_08033648: @ 0x08033648
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_08033650
sub_08033650: @ 0x08033650
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_0804B95C
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08033688 @ =gActionSt
	ldrb r0, [r5, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r4, r0]
	bl sub_0804B950
	cmp r4, r0
	bne _0803368C
	adds r0, r7, #0
	bl Proc_End
	b _080336DA
	.align 2, 0
_08033688: .4byte gActionSt
_0803368C:
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080336DA
	ldr r0, _080336C0 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080336C8
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _080336C4 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080336C8
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _080336DA
	.align 2, 0
_080336C0: .4byte gPlaySt
_080336C4: .4byte 0x0202E3E8
_080336C8:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080336DA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_080336DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080336E0
sub_080336E0: @ 0x080336E0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	adds r2, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	ldrh r1, [r2, #2]
	cmp r1, r0
	beq _0803370A
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl sub_0801615C
_0803370A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08033710
sub_08033710: @ 0x08033710
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	adds r4, r0, #0
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080337DE
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x64
	beq _08033768
	cmp r0, #0x64
	bgt _0803374A
	cmp r0, #6
	beq _080337BC
	cmp r0, #6
	bgt _08033744
	cmp r0, #4
	beq _08033758
	b _080337CA
_08033744:
	cmp r0, #7
	beq _080337B0
	b _080337CA
_0803374A:
	cmp r0, #0x66
	beq _0803378C
	cmp r0, #0x66
	blt _0803377A
	cmp r0, #0x67
	beq _0803379E
	b _080337CA
_08033758:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_0801F114
	b _080337CA
_08033768:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #3
	bl sub_0801F088
	b _080337CA
_0803377A:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #2
	bl sub_0801F088
	b _080337CA
_0803378C:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0801F088
	b _080337CA
_0803379E:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #1
	bl sub_0801F088
	b _080337CA
_080337B0:
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl sub_0801F2CC
	b _080337CA
_080337BC:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_0801F350
_080337CA:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0803381A
_080337DE:
	ldr r5, _08033808 @ =gActionSt
	strb r1, [r5, #0xc]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl HideUnitSprite
	ldrb r0, [r5, #0x15]
	cmp r0, #5
	bhi _0803380C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl sub_08032DD0
	b _0803381A
	.align 2, 0
_08033808: .4byte gActionSt
_0803380C:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl sub_08032E34
_0803381A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08033820
sub_08033820: @ 0x08033820
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0804B95C
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #5
	bgt _08033852
	adds r2, r0, #0
	rsbs r2, r2, #0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_08032D2C
	b _08033864
_08033852:
	movs r2, #3
	ldrsb r2, [r4, r2]
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08032D2C
_08033864:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08033872
	bl RefreshUnitSprites
_08033872:
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08033884
sub_08033884: @ 0x08033884
	ldr r0, _080338A0 @ =gBattleTarget
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _080338A4 @ =gBmSt
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	cmp r0, #0x6f
	bgt _080338A8
	movs r0, #1
	b _080338B4
	.align 2, 0
_080338A0: .4byte gBattleTarget
_080338A4: .4byte gBmSt
_080338A8:
	cmp r0, #0x70
	bgt _080338B0
	movs r0, #0
	b _080338B4
_080338B0:
	movs r0, #1
	rsbs r0, r0, #0
_080338B4:
	bx lr
	.align 2, 0

	thumb_func_start sub_080338B8
sub_080338B8: @ 0x080338B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	movs r1, #3
	bl sub_08004C20
	movs r1, #1
	ldr r0, _08033938 @ =0x02022860
	mov sb, r0
	movs r2, #0x1f
	mov ip, r2
	ldr r0, _0803393C @ =0x0200300C
	mov r8, r0
_080338D6:
	adds r0, r1, #0
	adds r0, #0x30
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	adds r4, r0, #0
	mov r2, ip
	ands r4, r2
	asrs r3, r0, #5
	ands r3, r2
	asrs r2, r0, #0xa
	mov r0, ip
	ands r2, r0
	lsls r0, r1, #1
	adds r7, r1, #1
	mov r1, r8
	adds r5, r0, r1
	movs r6, #7
_080338FA:
	lsls r0, r2, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r4
	strh r0, [r5]
	adds r4, #3
	cmp r4, #0x1f
	ble _0803390C
	movs r4, #0x1f
_0803390C:
	adds r3, #3
	cmp r3, #0x1f
	ble _08033914
	movs r3, #0x1f
_08033914:
	adds r2, #3
	cmp r2, #0x1f
	ble _0803391C
	movs r2, #0x1f
_0803391C:
	adds r5, #0x20
	subs r6, #1
	cmp r6, #0
	bge _080338FA
	adds r1, r7, #0
	cmp r1, #0xf
	ble _080338D6
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033938: .4byte 0x02022860
_0803393C: .4byte 0x0200300C

	thumb_func_start sub_08033940
sub_08033940: @ 0x08033940
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _08033974 @ =0x08C05FF0
_08033946:
	lsls r4, r5, #3
	ldr r0, _08033978 @ =0x02002FDC
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #4
	bl sub_08005344
	ldr r1, [r6]
	movs r0, #0x20
	bl sub_08005564
	adds r1, r0, #0
	ldm r6!, {r3}
	adds r0, r4, #0
	movs r2, #3
	bl sub_080059DC
	adds r5, #1
	cmp r5, #5
	ble _08033946
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033974: .4byte 0x08C05FF0
_08033978: .4byte 0x02002FDC

	thumb_func_start sub_0803397C
sub_0803397C: @ 0x0803397C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl sub_08005564
	adds r5, r0, #0
	adds r0, r6, #0
	bl sub_080053B0
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl sub_08005998
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080339C0
sub_080339C0: @ 0x080339C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	adds r0, r2, #0
	bl sub_08017610
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl sub_08005564
	adds r5, r0, #0
	adds r0, r6, #0
	bl sub_080053B0
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl sub_08005998
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08033A04
sub_08033A04: @ 0x08033A04
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	cmp r0, #0
	ble _08033A32
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	ldr r0, [r4, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08033A32
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
_08033A32:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08033A38
sub_08033A38: @ 0x08033A38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r7, _08033B38 @ =gBattleActor
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_0801769C
	str r0, [sp, #8]
	ldr r0, _08033B3C @ =gBattleTarget
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_0801769C
	str r0, [sp, #0xc]
	add r1, sp, #4
	mov r0, sp
	bl sub_080294EC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
	strb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08033A90
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033ACA
_08033A90:
	add r5, sp, #8
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08033A04
	mov r0, r8
	cmp r0, #0
	beq _08033AB0
	ldr r0, [sp]
	cmp r0, r7
	bne _08033AB0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08033A04
_08033AB0:
	ldr r0, _08033B38 @ =gBattleActor
	adds r0, #0x4a
	ldrh r0, [r0]
	ldr r1, _08033B3C @ =gBattleTarget
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033ACA
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_08033ACA:
	adds r4, r6, #0
	adds r4, #0x51
	movs r0, #0
	strb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x53
	strb r0, [r1]
	ldr r5, _08033B3C @ =gBattleTarget
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne _08033AF4
	adds r0, r5, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033B2A
_08033AF4:
	add r6, sp, #0xc
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_08033A04
	mov r0, r8
	cmp r0, #0
	beq _08033B14
	ldr r0, [sp]
	cmp r0, r5
	bne _08033B14
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_08033A04
_08033B14:
	ldr r0, _08033B3C @ =gBattleTarget
	adds r0, #0x4a
	ldrh r0, [r0]
	ldr r1, _08033B38 @ =gBattleActor
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033B2A
	movs r0, #1
	strb r0, [r7]
_08033B2A:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033B38: .4byte gBattleActor
_08033B3C: .4byte gBattleTarget

	thumb_func_start sub_08033B40
sub_08033B40: @ 0x08033B40
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08033BBC @ =0x0200373C
	ldr r1, _08033BC0 @ =0x08191780
	movs r2, #0x90
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r4, _08033BC4 @ =0x0200323C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xf
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r4, #0
	adds r0, #0x46
	adds r5, r6, #0
	adds r5, #0x38
	ldr r2, _08033BC8 @ =gBattleActor
	adds r1, r5, #0
	bl sub_0803397C
	ldr r1, _08033BCC @ =0x000002C2
	adds r0, r4, r1
	ldr r7, _08033BD0 @ =gBattleTarget
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_0803397C
	ldr r3, _08033BD4 @ =0x00000342
	adds r4, r4, r3
	adds r6, #0x48
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080339C0
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08033BD8
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08033BD8
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r2, r7, #0
	b _08033BF2
	.align 2, 0
_08033BBC: .4byte 0x0200373C
_08033BC0: .4byte 0x08191780
_08033BC4: .4byte 0x0200323C
_08033BC8: .4byte gBattleActor
_08033BCC: .4byte 0x000002C2
_08033BD0: .4byte gBattleTarget
_08033BD4: .4byte 0x00000342
_08033BD8:
	ldr r2, _08033C08 @ =gBattleTarget
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08033C0C @ =gBattleActor
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r1, r0
	cmp r4, #0
	bge _08033BF2
	movs r4, #0
_08033BF2:
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble _08033C14
	ldr r0, _08033C10 @ =0x02003300
	movs r1, #2
	movs r2, #0xff
	bl sub_08006094
	b _08033C22
	.align 2, 0
_08033C08: .4byte gBattleTarget
_08033C0C: .4byte gBattleActor
_08033C10: .4byte 0x02003300
_08033C14:
	ldr r0, _08033C8C @ =0x02003300
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl sub_08006094
_08033C22:
	ldr r5, _08033C90 @ =0x02003380
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl sub_08006094
	adds r0, r5, #0
	adds r0, #0x80
	ldr r4, _08033C94 @ =gBattleTarget
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	ldr r2, _08033C98 @ =gBattleActor
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r1, r0
	cmp r4, #0
	bge _08033C70
	movs r4, #0
_08033C70:
	adds r1, r2, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _08033C9C
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl sub_08006094
	b _08033CAA
	.align 2, 0
_08033C8C: .4byte 0x02003300
_08033C90: .4byte 0x02003380
_08033C94: .4byte gBattleTarget
_08033C98: .4byte gBattleActor
_08033C9C:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl sub_08006094
_08033CAA:
	ldr r5, _08033D4C @ =0x0200338C
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl sub_08006094
	adds r0, r5, #0
	adds r0, #0x80
	ldr r6, _08033D50 @ =gBattleActor
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	adds r0, r5, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, _08033D54 @ =0x02002FDC
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl sub_08005460
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl sub_08005460
	adds r4, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	adds r0, r4, #0
	bl sub_08005460
	movs r0, #0xbf
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _08033D58 @ =gBattleTarget
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl sub_08004D04
	ldr r1, _08033D5C @ =0xFFFFFEF2
	adds r4, r5, r1
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08017808
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl sub_08004D04
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033D4C: .4byte 0x0200338C
_08033D50: .4byte gBattleActor
_08033D54: .4byte 0x02002FDC
_08033D58: .4byte gBattleTarget
_08033D5C: .4byte 0xFFFFFEF2

	thumb_func_start sub_08033D60
sub_08033D60: @ 0x08033D60
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08033DE4 @ =0x0200373C
	ldr r1, _08033DE8 @ =0x081918C4
	movs r2, #0x90
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r7, _08033DEC @ =0x0200323C
	adds r0, r7, #0
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	adds r0, #0x46
	adds r4, r5, #0
	adds r4, #0x38
	ldr r2, _08033DF0 @ =gBattleActor
	adds r1, r4, #0
	bl sub_0803397C
	ldr r1, _08033DF4 @ =0x000003C2
	adds r0, r7, r1
	ldr r6, _08033DF8 @ =gBattleTarget
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_0803397C
	ldr r2, _08033DFC @ =0x00000442
	adds r0, r7, r2
	adds r5, #0x48
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r1, r5, #0
	bl sub_080339C0
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08033DC8
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_08033DC8:
	adds r2, r6, #0
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble _08033E00
	adds r0, r7, #0
	adds r0, #0xc4
	movs r1, #2
	movs r2, #0xff
	bl sub_08006094
	b _08033E10
	.align 2, 0
_08033DE4: .4byte 0x0200373C
_08033DE8: .4byte 0x081918C4
_08033DEC: .4byte 0x0200323C
_08033DF0: .4byte gBattleActor
_08033DF4: .4byte 0x000003C2
_08033DF8: .4byte gBattleTarget
_08033DFC: .4byte 0x00000442
_08033E00:
	adds r0, r7, #0
	adds r0, #0xc4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl sub_08006094
_08033E10:
	ldr r5, _08033E90 @ =0x02003380
	ldr r4, _08033E94 @ =gBattleTarget
	adds r0, r4, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	movs r1, #2
	bl sub_08006094
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	ldr r0, _08033E98 @ =gBattleActor
	adds r1, r0, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _08033E9C
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl sub_08006094
	b _08033EAA
	.align 2, 0
_08033E90: .4byte 0x02003380
_08033E94: .4byte gBattleTarget
_08033E98: .4byte gBattleActor
_08033E9C:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl sub_08006094
_08033EAA:
	ldr r5, _08033F94 @ =0x0200338C
	ldr r6, _08033F98 @ =gBattleActor
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #2
	bl sub_08006094
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r6, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_08006094
	adds r0, r5, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, _08033F9C @ =0x02002FF4
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl sub_08005460
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl sub_08005460
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	bl sub_08005460
	adds r0, r4, #0
	subs r0, #8
	movs r2, #0xbb
	lsls r2, r2, #1
	adds r1, r5, r2
	bl sub_08005460
	adds r0, r4, #0
	adds r0, #0x10
	movs r3, #0xfb
	lsls r3, r3, #1
	adds r1, r5, r3
	bl sub_08005460
	ldr r0, _08033FA0 @ =0x0000027E
	adds r4, r5, r0
	ldr r0, _08033FA4 @ =gBattleTarget
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl sub_08004D04
	ldr r1, _08033FA8 @ =0xFFFFFEF2
	adds r4, r5, r1
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08017808
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl sub_08004D04
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033F94: .4byte 0x0200338C
_08033F98: .4byte gBattleActor
_08033F9C: .4byte 0x02002FF4
_08033FA0: .4byte 0x0000027E
_08033FA4: .4byte gBattleTarget
_08033FA8: .4byte 0xFFFFFEF2

	thumb_func_start sub_08033FAC
sub_08033FAC: @ 0x08033FAC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x2c]
	adds r0, #0x34
	strb r1, [r0]
	subs r0, #2
	ldrb r0, [r0]
	cmp r0, #1
	beq _08033FC6
	cmp r0, #2
	beq _08033FD4
	b _08033FE0
_08033FC6:
	adds r0, r4, #0
	bl sub_08033A38
	adds r0, r4, #0
	bl sub_08033B40
	b _08033FE0
_08033FD4:
	adds r0, r4, #0
	bl sub_08033A38
	adds r0, r4, #0
	bl sub_08033D60
_08033FE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08033FE8
sub_08033FE8: @ 0x08033FE8
	cmp r0, #0x40
	beq _08034010
	cmp r0, #0x40
	bgt _08033FF6
	cmp r0, #0
	beq _08034000
	b _0803401A
_08033FF6:
	cmp r0, #0x80
	beq _08034008
	cmp r0, #0xc0
	beq _08034018
	b _0803401A
_08034000:
	ldr r0, _08034004 @ =0x08191700
	b _0803401A
	.align 2, 0
_08034004: .4byte 0x08191700
_08034008:
	ldr r0, _0803400C @ =0x08191720
	b _0803401A
	.align 2, 0
_0803400C: .4byte 0x08191720
_08034010:
	ldr r0, _08034014 @ =0x08191740
	b _0803401A
	.align 2, 0
_08034014: .4byte 0x08191740
_08034018:
	ldr r0, _0803401C @ =0x08191760
_0803401A:
	bx lr
	.align 2, 0
_0803401C: .4byte 0x08191760

	thumb_func_start sub_08034020
sub_08034020: @ 0x08034020
	push {r4, lr}
	ldr r0, _08034054 @ =gBattleActor
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0xc0
	ands r0, r4
	bl sub_08033FE8
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08034058 @ =gBattleTarget
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0803405C
	ands r0, r4
	bl sub_08033FE8
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0803406A
	.align 2, 0
_08034054: .4byte gBattleActor
_08034058: .4byte gBattleTarget
_0803405C:
	movs r0, #0xc0
	bl sub_08033FE8
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_0803406A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08034070
sub_08034070: @ 0x08034070
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080340E4 @ =0x08191410
	ldr r1, _080340E8 @ =0x06004000
	bl sub_08013688
	ldr r0, _080340EC @ =0x08191A58
	ldr r4, _080340F0 @ =0x02020140
	adds r1, r4, #0
	bl sub_08013688
	ldr r1, _080340F4 @ =0x06015D00
	adds r0, r4, #0
	movs r2, #4
	movs r3, #2
	bl sub_08013758
	ldr r0, _080340F8 @ =0x08191B04
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08005308
	bl InitIcons
	bl sub_080338B8
	bl sub_08033940
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #6
	bl sub_0800536C
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #6
	bl sub_0800536C
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #7
	bl sub_0800536C
	ldr r2, _080340FC @ =0x0000FFFF
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	adds r1, r5, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080340E4: .4byte 0x08191410
_080340E8: .4byte 0x06004000
_080340EC: .4byte 0x08191A58
_080340F0: .4byte 0x02020140
_080340F4: .4byte 0x06015D00
_080340F8: .4byte 0x08191B04
_080340FC: .4byte 0x0000FFFF

	thumb_func_start sub_08034100
sub_08034100: @ 0x08034100
	push {lr}
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_0804A30C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08034110
sub_08034110: @ 0x08034110
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0x32
	movs r4, #0x14
	ldrb r1, [r1]
	cmp r1, #1
	bne _08034120
	movs r4, #0x10
_08034120:
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08034158
	ldr r0, _08034148 @ =0x0200323C
	ldr r1, _0803414C @ =0x02022C60
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	ldr r0, _08034150 @ =0x0200373C
	ldr r1, _08034154 @ =0x02023460
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	b _08034170
	.align 2, 0
_08034148: .4byte 0x0200323C
_0803414C: .4byte 0x02022C60
_08034150: .4byte 0x0200373C
_08034154: .4byte 0x02023460
_08034158:
	ldr r0, _0803417C @ =0x0200323C
	ldr r1, _08034180 @ =0x02022C88
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	ldr r0, _08034184 @ =0x0200373C
	ldr r1, _08034188 @ =0x02023488
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
_08034170:
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803417C: .4byte 0x0200323C
_08034180: .4byte 0x02022C88
_08034184: .4byte 0x0200373C
_08034188: .4byte 0x02023488

	thumb_func_start sub_0803418C
sub_0803418C: @ 0x0803418C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	ldr r0, _08034228 @ =gBattleActor
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080341A4
	movs r6, #1
_080341A4:
	cmp r0, #0
	bge _080341AA
	movs r6, #2
_080341AA:
	ldr r0, _0803422C @ =gBattleTarget
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080341BA
	movs r5, #1
_080341BA:
	cmp r0, #0
	bge _080341C0
	movs r5, #2
_080341C0:
	cmp r5, #0
	beq _080341F0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #8
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0xb
	lsls r1, r0, #3
	movs r2, #0
	cmp r5, #2
	bne _080341EA
	movs r2, #1
_080341EA:
	adds r0, r3, #0
	bl sub_08015F24
_080341F0:
	cmp r6, #0
	beq _08034220
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #2
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	lsls r1, r0, #3
	movs r2, #0
	cmp r6, #2
	bne _0803421A
	movs r2, #1
_0803421A:
	adds r0, r3, #0
	bl sub_08015F24
_08034220:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034228: .4byte gBattleActor
_0803422C: .4byte gBattleTarget

	thumb_func_start sub_08034230
sub_08034230: @ 0x08034230
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	lsls r1, r1, #2
	movs r0, #0xff
	ldr r2, _080342C0 @ =0x080C0E98
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r6, r0, #0xa
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r5, r0, #0xb
	subs r1, r6, #3
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r6, r1, r0
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r7, #0
	adds r4, #0x50
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _08034296
	adds r1, r6, #0
	adds r1, #0x48
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _080342C4 @ =0x08BFF768
	ldr r4, _080342C8 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl sub_08006884
_08034296:
	adds r4, r7, #0
	adds r4, #0x51
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _080342B8
	adds r1, r6, #0
	adds r1, #0x18
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _080342C4 @ =0x08BFF768
	ldr r4, _080342C8 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl sub_08006884
_080342B8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080342C0: .4byte 0x080C0E98
_080342C4: .4byte 0x08BFF768
_080342C8: .4byte 0x000022E6

	thumb_func_start sub_080342CC
sub_080342CC: @ 0x080342CC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080342F0
	ldr r0, _080342EC @ =0x08C06008
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _080342F2
	.align 2, 0
_080342EC: .4byte 0x08C06008
_080342F0:
	movs r0, #0
_080342F2:
	lsls r0, r0, #5
	ldr r1, _0803431C @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08034324
	ldr r0, _08034320 @ =0x08C06008
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08034326
	.align 2, 0
_0803431C: .4byte 0x0200300C
_08034320: .4byte 0x08C06008
_08034324:
	movs r0, #0
_08034326:
	lsls r0, r0, #5
	ldr r1, _0803433C @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803433C: .4byte 0x0200300C

	thumb_func_start sub_08034340
sub_08034340: @ 0x08034340
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08034388
	bl sub_08033884
	adds r1, r0, #0
	cmp r1, #0
	beq _08034378
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _08034378
	adds r0, r4, #0
	bl Proc_Break
	b _080343A4
_08034378:
	adds r0, r4, #0
	bl sub_08033FAC
	adds r0, r4, #0
	bl sub_08034110
	bl sub_08034020
_08034388:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	bne _080343A4
	adds r0, r4, #0
	bl sub_0803418C
	adds r0, r4, #0
	bl sub_08034230
	adds r0, r4, #0
	bl sub_080342CC
_080343A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080343AC
sub_080343AC: @ 0x080343AC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08033FAC
	bl sub_08033884
	adds r1, r4, #0
	adds r1, #0x35
	movs r2, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x36
	strb r2, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080343D6
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	b _080343DE
_080343D6:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x14
	strb r0, [r1]
_080343DE:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	bl sub_08034020
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080343F0
sub_080343F0: @ 0x080343F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	movs r1, #0x14
	mov sb, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0803440C
	movs r2, #0x10
	mov sb, r2
_0803440C:
	ldr r0, _08034470 @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl sub_080017E8
	ldr r1, _08034474 @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl sub_080017E8
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08034478 @ =0x08C06028
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge _08034484
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0803447C @ =0x0200323C
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _08034480 @ =0x0200373C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	b _080344A6
	.align 2, 0
_08034470: .4byte 0x02022C60
_08034474: .4byte 0x02023460
_08034478: .4byte 0x08C06028
_0803447C: .4byte 0x0200323C
_08034480: .4byte 0x0200373C
_08034484:
	ldr r0, _080344CC @ =0x0200323C
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _080344D0 @ =0x0200373C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
_080344A6:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080344BE
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_080344BE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080344CC: .4byte 0x0200323C
_080344D0: .4byte 0x0200373C

	thumb_func_start sub_080344D4
sub_080344D4: @ 0x080344D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	movs r1, #0x14
	mov sb, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080344F0
	movs r2, #0x10
	mov sb, r2
_080344F0:
	ldr r0, _08034554 @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl sub_080017E8
	ldr r1, _08034558 @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl sub_080017E8
	movs r0, #3
	bl EnableBgSync
	ldr r1, _0803455C @ =0x08C0602C
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge _08034568
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08034560 @ =0x0200323C
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _08034564 @ =0x0200373C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	b _0803458A
	.align 2, 0
_08034554: .4byte 0x02022C60
_08034558: .4byte 0x02023460
_0803455C: .4byte 0x08C0602C
_08034560: .4byte 0x0200323C
_08034564: .4byte 0x0200373C
_08034568:
	ldr r0, _080345B0 @ =0x0200323C
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _080345B4 @ =0x0200373C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
_0803458A:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080345A2
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_080345A2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080345B0: .4byte 0x0200323C
_080345B4: .4byte 0x0200373C

	thumb_func_start sub_080345B8
sub_080345B8: @ 0x080345B8
	push {lr}
	ldr r0, _080345C8 @ =0x08BFFF78
	bl Proc_Find
	cmp r0, #0
	bne _080345CC
	movs r0, #0
	b _080345CE
	.align 2, 0
_080345C8: .4byte 0x08BFFF78
_080345CC:
	movs r0, #1
_080345CE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080345D4
sub_080345D4: @ 0x080345D4
	push {r4, lr}
	ldr r0, _080345EC @ =gPlaySt
	adds r4, r0, #0
	adds r4, #0x42
	ldrb r1, [r4]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _080345F0
	bl sub_08005308
	b _08034630
	.align 2, 0
_080345EC: .4byte gPlaySt
_080345F0:
	ldr r0, _08034614 @ =0x08C06030
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x33
	movs r0, #0
	strb r0, [r2]
	ldrb r4, [r4]
	lsls r0, r4, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08034618
	cmp r0, #1
	beq _0803461E
	b _08034624
	.align 2, 0
_08034614: .4byte 0x08C06030
_08034618:
	adds r1, #0x32
	movs r0, #1
	b _08034622
_0803461E:
	adds r1, #0x32
	movs r0, #2
_08034622:
	strb r0, [r1]
_08034624:
	ldr r0, _08034638 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
_08034630:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034638: .4byte gBmMapMovement

	thumb_func_start sub_0803463C
sub_0803463C: @ 0x0803463C
	push {lr}
	ldr r0, _08034660 @ =0x08C06030
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _0803465C
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803465C
	adds r1, #0x34
	movs r0, #1
	strb r0, [r1]
_0803465C:
	pop {r0}
	bx r0
	.align 2, 0
_08034660: .4byte 0x08C06030

	thumb_func_start sub_08034664
sub_08034664: @ 0x08034664
	push {r4, lr}
	ldr r0, _0803468C @ =0x08C06030
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08034698
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08034690
	bl ClearBg0Bg1
	adds r0, r4, #0
	bl Proc_End
	b _08034698
	.align 2, 0
_0803468C: .4byte 0x08C06030
_08034690:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08034698:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080346A0
sub_080346A0: @ 0x080346A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080346EC @ =0x08C06030
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08034710
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08034710
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r5, #0x14
	cmp r0, #0
	bge _080346D0
	movs r5, #0
_080346D0:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08082F74
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	beq _080346F0
	cmp r0, #2
	beq _08034704
	b _08034710
	.align 2, 0
_080346EC: .4byte 0x08C06030
_080346F0:
	ldr r0, _08034700 @ =0x08D8AB2C
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_08082A18
	b _08034710
	.align 2, 0
_08034700: .4byte 0x08D8AB2C
_08034704:
	ldr r0, _08034718 @ =0x08D8ABD4
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_08082A18
_08034710:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034718: .4byte 0x08D8ABD4

	thumb_func_start sub_0803471C
sub_0803471C: @ 0x0803471C
	lsls r1, r1, #0x18
	movs r2, #0
	cmp r1, #0
	beq _08034726
	movs r2, #3
_08034726:
	cmp r0, #0
	bge _0803472C
	adds r2, #2
_0803472C:
	cmp r0, #0
	ble _08034732
	adds r2, #1
_08034732:
	ldr r0, _0803473C @ =0x08C060A8
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_0803473C: .4byte 0x08C060A8

	thumb_func_start sub_08034740
sub_08034740: @ 0x08034740
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08034768 @ =0x08C06030
	bl Proc_Find
	ldr r1, _0803476C @ =gBattleActor
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x52
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl sub_0803471C
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034768: .4byte 0x08C06030
_0803476C: .4byte gBattleActor

	thumb_func_start sub_08034770
sub_08034770: @ 0x08034770
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08034798 @ =0x08C06030
	bl Proc_Find
	ldr r1, _0803479C @ =gBattleTarget
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x53
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl sub_0803471C
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034798: .4byte 0x08C06030
_0803479C: .4byte gBattleTarget

	thumb_func_start sub_080347A0
sub_080347A0: @ 0x080347A0
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0xa
	bgt _080347B6
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_080A07C8
_080347B6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080347BC
sub_080347BC: @ 0x080347BC
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_0801F114
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080347D4
sub_080347D4: @ 0x080347D4
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_0801F144
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080347EC
sub_080347EC: @ 0x080347EC
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08034810
	cmp r0, #1
	bgt _08034804
	cmp r0, #0
	beq _0803480A
	b _08034832
_08034804:
	cmp r0, #2
	beq _08034828
	b _08034832
_0803480A:
	bl sub_0806D4A4
	b _08034832
_08034810:
	bl sub_0806D4A4
	ldr r0, _08034824 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_0806C2DC
	bl sub_0806C7CC
	b _08034832
	.align 2, 0
_08034824: .4byte gActiveUnit
_08034828:
	adds r0, r4, #0
	bl sub_0806EAA4
	bl sub_0806D4BC
_08034832:
	ldr r1, _08034848 @ =gActionSt
	movs r0, #0xa
	strb r0, [r1, #0x15]
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_08032E34
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034848: .4byte gActionSt

	thumb_func_start sub_0803484C
sub_0803484C: @ 0x0803484C
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x54]
	movs r2, #0xa
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r4, #0
	bl sub_08032D2C
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803488A
	ldr r5, _08034890 @ =gActiveUnit
	ldr r6, [r5]
	str r4, [r5]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #3
	bl sub_080A08B4
	bl sub_08079910
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034888
	bl sub_08079950
_08034888:
	str r6, [r5]
_0803488A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034890: .4byte gActiveUnit

	thumb_func_start sub_08034894
sub_08034894: @ 0x08034894
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl sub_0802BF30
	cmp r0, #0
	beq _080348FE
	ldrb r3, [r0, #2]
	cmp r3, #4
	beq _080348BE
	cmp r3, #4
	bgt _080348B8
	cmp r3, #1
	beq _080348FE
	b _08034902
_080348B8:
	cmp r3, #0xb
	beq _080348D4
	b _08034902
_080348BE:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08034902
	movs r0, #0xe
	b _08034904
_080348D4:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _080348F6
	adds r0, r4, #0
	bl GetUnitItemCount
	cmp r0, #5
	beq _080348FE
	movs r0, #0xf
	b _08034904
_080348F6:
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08034902
_080348FE:
	movs r0, #0
	b _08034904
_08034902:
	adds r0, r3, #0
_08034904:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803490C
sub_0803490C: @ 0x0803490C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl sub_08034894
	cmp r0, #0xb
	beq _0803493C
	cmp r0, #0xb
	bgt _08034928
	cmp r0, #8
	beq _08034932
	b _080349E8
_08034928:
	cmp r0, #0xe
	beq _08034964
	cmp r0, #0xf
	beq _080349A4
	b _080349E8
_08034932:
	ldr r0, _08034938 @ =0x08C060B4
	b _08034950
	.align 2, 0
_08034938: .4byte 0x08C060B4
_0803493C:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	bl sub_0802BF58
	bl sub_0802BFD0
	ldr r0, _08034960 @ =0x08C06104
_08034950:
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x50
	strh r4, [r0]
	str r5, [r1, #0x54]
	b _080349E8
	.align 2, 0
_08034960: .4byte 0x08C06104
_08034964:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl sub_0802BF30
	bl sub_0802BFD0
	ldr r0, _080349A0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08034986
	movs r0, #0xb1
	bl m4aSongNumStart
_08034986:
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0xdd
	lsls r0, r0, #3
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0801F484
	b _080349E8
	.align 2, 0
_080349A0: .4byte gPlaySt
_080349A4:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl sub_0802BF30
	bl sub_0802BFD0
	ldr r0, _080349F0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080349C6
	movs r0, #0xb1
	bl m4aSongNumStart
_080349C6:
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _080349F4 @ =0x000006E9
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0801F484
	movs r0, #0x79
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
_080349E8:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080349F0: .4byte gPlaySt
_080349F4: .4byte 0x000006E9

	thumb_func_start sub_080349F8
sub_080349F8: @ 0x080349F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08034A18 @ =gActiveUnit
	ldr r0, [r4]
	bl GetUnitCurrentHp
	cmp r0, #0
	ble _08034A12
	ldr r0, [r4]
	bl sub_08034894
	cmp r0, #0
	bne _08034A1C
_08034A12:
	movs r0, #1
	b _08034A44
	.align 2, 0
_08034A18: .4byte gActiveUnit
_08034A1C:
	ldr r1, _08034A4C @ =gActionSt
	movs r0, #1
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x11]
	movs r0, #3
	bl WriteSuspendSave
	bl sub_0802A8E0
	cmp r0, #1
	bne _08034A36
	bl RefreshUnitSprites
_08034A36:
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0
	bl sub_0803490C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08034A44:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08034A4C: .4byte gActionSt

	thumb_func_start sub_08034A50
sub_08034A50: @ 0x08034A50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08034A70 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl sub_0803490C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08034A70: .4byte gActionSt

	thumb_func_start sub_08034A74
sub_08034A74: @ 0x08034A74
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl sub_08034894
	cmp r0, #0
	beq _08034A94
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl sub_0803490C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08034AAC
_08034A94:
	adds r0, r4, #0
	bl sub_0806EAA4
	bl sub_0806D4BC
	bl RenderMap
	bl RefreshEntityMaps
	bl sub_08025A0C
	movs r0, #1
_08034AAC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08034AB4
sub_08034AB4: @ 0x08034AB4
	push {lr}
	movs r2, #3
	bl sub_0803490C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08034AC4
sub_08034AC4: @ 0x08034AC4
	push {r4, r5, lr}
	sub sp, #4
	bl sub_080799C0
	adds r5, r0, #0
	b _08034B62
_08034AD0:
	ldrb r0, [r5]
	subs r1, r0, #1
	adds r2, r0, #0
	cmp r1, #0xa
	bhi _08034B60
	lsls r0, r1, #2
	ldr r1, _08034AE4 @ =_08034AE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08034AE4: .4byte _08034AE8
_08034AE8: @ jump table
	.4byte _08034B14 @ case 0
	.4byte _08034B60 @ case 1
	.4byte _08034B60 @ case 2
	.4byte _08034B20 @ case 3
	.4byte _08034B2E @ case 4
	.4byte _08034B60 @ case 5
	.4byte _08034B60 @ case 6
	.4byte _08034B40 @ case 7
	.4byte _08034B4A @ case 8
	.4byte _08034B60 @ case 9
	.4byte _08034B56 @ case 10
_08034B14:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl sub_08034C18
	b _08034B60
_08034B20:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #4]
	ldrb r3, [r5, #5]
	bl sub_0802BFE4
	b _08034B60
_08034B2E:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl sub_0802C000
	b _08034B60
_08034B40:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	bl sub_0802C058
	b _08034B60
_08034B4A:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl sub_0802C068
	b _08034B60
_08034B56:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	movs r3, #0
	bl sub_0802BF8C
_08034B60:
	adds r5, #6
_08034B62:
	ldrb r0, [r5]
	cmp r0, #0
	bne _08034AD0
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08034B70
sub_08034B70: @ 0x08034B70
	push {lr}
	bl sub_0802BF30
	adds r1, r0, #0
	cmp r1, #0
	beq _08034B82
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08034B86
_08034B82:
	movs r0, #0
	b _08034B88
_08034B86:
	movs r0, #1
_08034B88:
	cmp r0, #0
	beq _08034B94
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08034B98
_08034B94:
	movs r0, #0
	b _08034B9A
_08034B98:
	adds r0, r1, #0
_08034B9A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetBallistaItemAt
GetBallistaItemAt: @ 0x08034BA0
	push {lr}
	bl sub_0802BF30
	adds r2, r0, #0
	cmp r2, #0
	beq _08034BB2
	ldrb r0, [r2, #2]
	cmp r0, #1
	beq _08034BB6
_08034BB2:
	movs r1, #0
	b _08034BB8
_08034BB6:
	movs r1, #1
_08034BB8:
	cmp r1, #0
	beq _08034BD8
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08034BD8
	cmp r2, #0
	beq _08034BCE
	ldrb r1, [r2, #2]
	cmp r1, #1
	beq _08034BD2
_08034BCE:
	movs r1, #0
	b _08034BD4
_08034BD2:
	movs r1, #1
_08034BD4:
	cmp r1, #0
	bne _08034BDC
_08034BD8:
	movs r0, #0
	b _08034BE2
_08034BDC:
	lsls r0, r0, #8
	ldrb r2, [r2, #3]
	orrs r0, r2
_08034BE2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08034BE8
sub_08034BE8: @ 0x08034BE8
	push {lr}
	bl sub_0802BF30
	cmp r0, #0
	beq _08034BF8
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _08034BFC
_08034BF8:
	movs r1, #0
	b _08034BFE
_08034BFC:
	movs r1, #1
_08034BFE:
	cmp r1, #0
	beq _08034C08
	ldrb r1, [r0, #3]
	cmp r1, #0
	bne _08034C0C
_08034C08:
	movs r0, #0
	b _08034C12
_08034C0C:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r1, r0
_08034C12:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08034C18
sub_08034C18: @ 0x08034C18
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	movs r2, #1
	movs r3, #0
	bl sub_0802BF8C
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemIndex
	movs r6, #0
	strb r0, [r4, #3]
	adds r0, r5, #0
	bl MakeNewItem
	bl sub_0801769C
	strb r0, [r4, #6]
	strb r6, [r4, #5]
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08034C48
sub_08034C48: @ 0x08034C48
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl sub_0802BF30
	adds r4, r0, #0
	movs r0, #1
	strb r0, [r4, #5]
	bl RefreshUnitSprites
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	bl GetTrap
	subs r4, r4, r0
	asrs r4, r4, #3
	strb r4, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08034C80
sub_08034C80: @ 0x08034C80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08034CB0
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldr r1, [r4, #0xc]
	ldr r2, _08034CB8 @ =0xFFFFF7FF
	ands r1, r2
	str r1, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #5]
	strb r1, [r4, #0x1c]
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
	bl RefreshUnitSprites
_08034CB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034CB8: .4byte 0xFFFFF7FF

	thumb_func_start sub_08034CBC
sub_08034CBC: @ 0x08034CBC
	cmp r0, #0
	beq _08034CCA
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08034CCA
	movs r0, #1
	b _08034CCC
_08034CCA:
	movs r0, #0
_08034CCC:
	bx lr
	.align 2, 0

	thumb_func_start sub_08034CD0
sub_08034CD0: @ 0x08034CD0
	adds r1, r0, #0
	cmp r1, #0
	beq _08034CDC
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08034CE0
_08034CDC:
	movs r0, #0
	b _08034CE2
_08034CE0:
	movs r0, #1
_08034CE2:
	cmp r0, #0
	beq _08034CF2
	movs r0, #6
	ldrsb r0, [r1, r0]
	lsls r0, r0, #8
	ldrb r1, [r1, #3]
	orrs r0, r1
	b _08034CF4
_08034CF2:
	movs r0, #0
_08034CF4:
	bx lr
	.align 2, 0

	thumb_func_start sub_08034CF8
sub_08034CF8: @ 0x08034CF8
	cmp r0, #0
	beq _08034D02
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _08034D06
_08034D02:
	movs r1, #0
	b _08034D08
_08034D06:
	movs r1, #1
_08034D08:
	cmp r1, #0
	beq _08034D10
	ldrb r0, [r0, #3]
	b _08034D12
_08034D10:
	movs r0, #0
_08034D12:
	bx lr

	thumb_func_start sub_08034D14
sub_08034D14: @ 0x08034D14
	cmp r0, #0
	beq _08034D1E
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _08034D22
_08034D1E:
	movs r1, #0
	b _08034D24
_08034D22:
	movs r1, #1
_08034D24:
	cmp r1, #0
	beq _08034D30
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08034D32
_08034D30:
	movs r0, #0
_08034D32:
	bx lr

	thumb_func_start sub_08034D34
sub_08034D34: @ 0x08034D34
	movs r1, #0
	strb r1, [r0, #5]
	bx lr
	.align 2, 0

	thumb_func_start sub_08034D3C
sub_08034D3C: @ 0x08034D3C
	movs r1, #1
	strb r1, [r0, #5]
	bx lr
	.align 2, 0

	thumb_func_start GetCurrentPromotedLevelBonus
GetCurrentPromotedLevelBonus: @ 0x08034D44
	ldr r1, _08034D54 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08034D58
	movs r0, #9
	b _08034D5A
	.align 2, 0
_08034D54: .4byte gPlaySt
_08034D58:
	movs r0, #0x13
_08034D5A:
	bx lr

	thumb_func_start sub_08034D5C
sub_08034D5C: @ 0x08034D5C
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #2
	beq _08034D7A
	cmp r0, #2
	bgt _08034D6E
	cmp r0, #1
	beq _08034D76
	b _08034D7E
_08034D6E:
	cmp r0, #3
	bne _08034D7E
	movs r2, #1
	b _08034D80
_08034D76:
	movs r2, #2
	b _08034D80
_08034D7A:
	movs r2, #3
	b _08034D80
_08034D7E:
	movs r2, #0
_08034D80:
	ldr r0, _08034D94 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08034DA2
	cmp r0, #2
	bgt _08034D98
	cmp r0, #1
	beq _08034D9E
	b _08034DAA
	.align 2, 0
_08034D94: .4byte gPlaySt
_08034D98:
	cmp r0, #3
	beq _08034DA6
	b _08034DAA
_08034D9E:
	movs r1, #1
	b _08034DAC
_08034DA2:
	movs r1, #2
	b _08034DAC
_08034DA6:
	movs r1, #3
	b _08034DAC
_08034DAA:
	movs r1, #4
_08034DAC:
	movs r0, #0
	cmp r2, r1
	bne _08034DB4
	movs r0, #1
_08034DB4:
	bx lr
	.align 2, 0
