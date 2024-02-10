	.include "macro.inc"

	.syntax unified

	thumb_func_start Proc_Init
Proc_Init: @ 0x080042FC
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _08004360 @ =0x02024E20
	ldr r5, _08004364 @ =0x02026920
	ldr r0, _08004368 @ =0x02026A24
	mov ip, r0
	movs r2, #0
	adds r6, r5, #0
	movs r3, #0
_0800430E:
	adds r1, r3, r7
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	str r2, [r1, #0x18]
	str r2, [r1, #0x1c]
	str r2, [r1, #0x20]
	strh r2, [r1, #0x24]
	adds r0, r1, #0
	adds r0, #0x26
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	stm r6!, {r1}
	adds r3, #0x6c
	adds r4, #1
	cmp r4, #0x3f
	ble _0800430E
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	mov r0, ip
	str r5, [r0]
	ldr r1, _0800436C @ =0x02026A28
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08004352:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08004352
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004360: .4byte 0x02024E20
_08004364: .4byte 0x02026920
_08004368: .4byte 0x02026A24
_0800436C: .4byte 0x02026A28

	thumb_func_start Proc_Start
Proc_Start: @ 0x08004370
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl AllocateProcess
	adds r5, r0, #0
	str r4, [r5]
	str r4, [r5, #4]
	movs r0, #0
	str r0, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	str r0, [r5, #0x1c]
	str r0, [r5, #0x20]
	movs r1, #0
	strh r0, [r5, #0x24]
	adds r0, r5, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	cmp r6, #7
	bgt _080043B2
	adds r0, r5, #0
	adds r1, r6, #0
	bl InsertRootProcess
	b _080043BA
_080043B2:
	adds r0, r5, #0
	adds r1, r6, #0
	bl InsertChildProcess
_080043BA:
	adds r0, r5, #0
	bl sub_8004A60
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #0xf7
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start Proc_StartBlocking
Proc_StartBlocking: @ 0x080043D4
	push {lr}
	bl Proc_Start
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _080043FC
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #2
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [r2, #0x14]
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	adds r0, r2, #0
	b _080043FE
_080043FC:
	movs r0, #0
_080043FE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DeleteProcessRecursive
DeleteProcessRecursive: @ 0x08004404
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004412
	bl DeleteProcessRecursive
_08004412:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0800441C
	bl DeleteProcessRecursive
_0800441C:
	adds r6, r4, #0
	adds r6, #0x27
	movs r5, #1
	ldrb r0, [r6]
	ands r5, r0
	cmp r5, #0
	bne _0800445A
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _08004436
	adds r0, r4, #0
	bl _call_via_r1
_08004436:
	adds r0, r4, #0
	bl FreeProcess
	str r5, [r4]
	str r5, [r4, #0xc]
	movs r0, #1
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800445A
	ldr r0, [r4, #0x14]
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
_0800445A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Proc_End
Proc_End: @ 0x08004460
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08004472
	bl UnlinkProcess
	adds r0, r4, #0
	bl DeleteProcessRecursive
_08004472:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start AllocateProcess
AllocateProcess: @ 0x08004478
	ldr r1, _08004484 @ =0x02026A24
	ldr r2, [r1]
	ldm r2!, {r0}
	str r2, [r1]
	bx lr
	.align 2, 0
_08004484: .4byte 0x02026A24

	thumb_func_start FreeProcess
FreeProcess: @ 0x08004488
	ldr r2, _08004494 @ =0x02026A24
	ldr r1, [r2]
	subs r1, #4
	str r1, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
_08004494: .4byte 0x02026A24

	thumb_func_start InsertRootProcess
InsertRootProcess: @ 0x08004498
	adds r2, r0, #0
	adds r3, r1, #0
	lsls r1, r3, #2
	ldr r0, _080044B4 @ =0x02026A28
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080044AC
	str r2, [r0, #0x1c]
	str r0, [r2, #0x20]
_080044AC:
	str r3, [r2, #0x14]
	str r2, [r1]
	bx lr
	.align 2, 0
_080044B4: .4byte 0x02026A28

	thumb_func_start InsertChildProcess
InsertChildProcess: @ 0x080044B8
	adds r2, r0, #0
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _080044C6
	str r2, [r0, #0x1c]
	ldr r0, [r1, #0x18]
	str r0, [r2, #0x20]
_080044C6:
	str r2, [r1, #0x18]
	str r1, [r2, #0x14]
	bx lr

	thumb_func_start UnlinkProcess
UnlinkProcess: @ 0x080044CC
	adds r2, r0, #0
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	beq _080044D8
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x20]
_080044D8:
	ldr r1, [r2, #0x20]
	cmp r1, #0
	beq _080044E2
	ldr r0, [r2, #0x1c]
	str r0, [r1, #0x1c]
_080044E2:
	ldr r1, [r2, #0x14]
	cmp r1, #8
	ble _080044F4
	ldr r0, [r1, #0x18]
	cmp r0, r2
	bne _08004504
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x18]
	b _08004504
_080044F4:
	lsls r0, r1, #2
	ldr r1, _0800450C @ =0x02026A28
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, r2
	bne _08004504
	ldr r0, [r2, #0x20]
	str r0, [r1]
_08004504:
	movs r0, #0
	str r0, [r2, #0x1c]
	str r0, [r2, #0x20]
	bx lr
	.align 2, 0
_0800450C: .4byte 0x02026A28

	thumb_func_start RunProcessRecursive
RunProcessRecursive: @ 0x08004510
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0800451E
	bl RunProcessRecursive
_0800451E:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800455C
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #8
	ldrb r2, [r1]
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	bne _0800455C
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _0800454A
	adds r0, r4, #0
	bl sub_8004A60
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08004552
_0800454A:
	ldr r1, [r4, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
_08004552:
	movs r0, #1
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	bne _08004566
_0800455C:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08004566
	bl RunProcessRecursive
_08004566:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start Proc_Run
Proc_Run: @ 0x0800456C
	push {lr}
	cmp r0, #0
	beq _08004576
	bl RunProcessRecursive
_08004576:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Proc_Break
Proc_Break: @ 0x0800457C
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start Proc_Find
Proc_Find: @ 0x08004584
	adds r3, r0, #0
	ldr r1, _08004594 @ =0x02024E20
	movs r2, #0
_0800458A:
	ldr r0, [r1]
	cmp r0, r3
	bne _08004598
	adds r0, r1, #0
	b _080045A2
	.align 2, 0
_08004594: .4byte 0x02024E20
_08004598:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _0800458A
	movs r0, #0
_080045A2:
	bx lr

	thumb_func_start Proc_FindNonBlocked
Proc_FindNonBlocked: @ 0x080045A4
	adds r3, r0, #0
	ldr r1, _080045C0 @ =0x02024E20
	movs r2, #0
_080045AA:
	ldr r0, [r1]
	cmp r0, r3
	bne _080045C4
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _080045C4
	adds r0, r1, #0
	b _080045CE
	.align 2, 0
_080045C0: .4byte 0x02024E20
_080045C4:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _080045AA
	movs r0, #0
_080045CE:
	bx lr

	thumb_func_start sub_80045D0
sub_80045D0: @ 0x080045D0
	adds r3, r0, #0
	ldr r1, _080045EC @ =0x02024E20
	movs r2, #0
_080045D6:
	ldr r0, [r1]
	cmp r0, #0
	beq _080045F0
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r3
	bne _080045F0
	adds r0, r1, #0
	b _080045FA
	.align 2, 0
_080045EC: .4byte 0x02024E20
_080045F0:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _080045D6
	movs r0, #0
_080045FA:
	bx lr

	thumb_func_start Proc_Goto
Proc_Goto: @ 0x080045FC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	ldr r2, [r1]
	ldrh r3, [r2]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	beq _0800462E
	movs r5, #0
_08004610:
	cmp r3, #0xb
	bne _08004622
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _08004622
	str r2, [r1, #4]
	str r5, [r1, #0xc]
	b _0800462E
_08004622:
	adds r2, #8
	ldrh r3, [r2]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r0, #0
	bne _08004610
_0800462E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8004634
sub_8004634: @ 0x08004634
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start sub_800463C
sub_800463C: @ 0x0800463C
	adds r0, #0x26
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_8004644
sub_8004644: @ 0x08004644
	str r1, [r0, #8]
	bx lr

	thumb_func_start sub_8004648
sub_8004648: @ 0x08004648
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0800466C @ =0x02024E20
	movs r5, #0x3f
_08004650:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800465C
	adds r0, r4, #0
	bl _call_via_r6
_0800465C:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08004650
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800466C: .4byte 0x02024E20

	thumb_func_start sub_8004670
sub_8004670: @ 0x08004670
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _08004694 @ =0x02024E20
	movs r5, #0x3f
_0800467A:
	ldr r0, [r4]
	cmp r0, r7
	bne _08004686
	adds r0, r4, #0
	bl _call_via_r6
_08004686:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _0800467A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004694: .4byte 0x02024E20

	thumb_func_start sub_8004698
sub_8004698: @ 0x08004698
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _080046C0 @ =0x02024E20
	movs r5, #0x3f
_080046A2:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r7
	bne _080046B2
	adds r0, r4, #0
	bl _call_via_r6
_080046B2:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _080046A2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080046C0: .4byte 0x02024E20

	thumb_func_start sub_80046C4
sub_80046C4: @ 0x080046C4
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _080046E4 @ =0x02024E20
	adds r1, r0, #0
	adds r1, #0x26
_080046CE:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080046DA
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
_080046DA:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _080046CE
	bx lr
	.align 2, 0
_080046E4: .4byte 0x02024E20

	thumb_func_start sub_80046E8
sub_80046E8: @ 0x080046E8
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _0800470C @ =0x02024E20
	adds r1, r0, #0
	adds r1, #0x26
_080046F2:
	ldrb r0, [r1]
	cmp r0, r3
	bne _08004702
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08004702
	subs r0, #1
	strb r0, [r1, #2]
_08004702:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _080046F2
	bx lr
	.align 2, 0
_0800470C: .4byte 0x02024E20

	thumb_func_start sub_8004710
sub_8004710: @ 0x08004710
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08004738 @ =0x02024E20
	movs r5, #0x3f
_08004718:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r6
	bne _08004728
	adds r0, r4, #0
	bl Proc_End
_08004728:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08004718
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004738: .4byte 0x02024E20

	thumb_func_start sub_800473C
sub_800473C: @ 0x0800473C
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8004748
sub_8004748: @ 0x08004748
	push {lr}
	ldr r1, _08004754 @ =sub_800473C
	bl sub_8004670
	pop {r0}
	bx r0
	.align 2, 0
_08004754: .4byte sub_800473C

	thumb_func_start sub_8004758
sub_8004758: @ 0x08004758
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8004764
sub_8004764: @ 0x08004764
	push {lr}
	ldr r1, _08004770 @ =sub_8004758
	bl sub_8004670
	pop {r0}
	bx r0
	.align 2, 0
_08004770: .4byte sub_8004758

	thumb_func_start sub_8004774
sub_8004774: @ 0x08004774
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004784
	bl sub_8004774
_08004784:
	adds r0, r4, #0
	bl _call_via_r5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08004796
	adds r1, r5, #0
	bl sub_8004774
_08004796:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_800479C
sub_800479C: @ 0x0800479C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl _call_via_r5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _080047B2
	adds r1, r5, #0
	bl sub_8004774
_080047B2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80047B8
sub_80047B8: @ 0x080047B8
	push {lr}
	bl Proc_End
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_80047C4
sub_80047C4: @ 0x080047C4
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0x10]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_80047D4
sub_80047D4: @ 0x080047D4
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl _call_via_r2
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start sub_80047E8
sub_80047E8: @ 0x080047E8
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl _call_via_r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004800
sub_8004800: @ 0x08004800
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #4]
	ldrh r0, [r2, #2]
	ldr r3, [r2, #4]
	adds r2, #8
	str r2, [r1, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl _call_via_r3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004820
sub_8004820: @ 0x08004820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, #8
	str r0, [r4, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800483E
	movs r0, #1
	b _08004846
_0800483E:
	ldr r0, [r4, #4]
	subs r0, #8
	str r0, [r4, #4]
	movs r0, #0
_08004846:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_800484C
sub_800484C: @ 0x0800484C
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0xc]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_800485C
sub_800485C: @ 0x0800485C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_8004644
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8004878
sub_8004878: @ 0x08004878
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8004894
sub_8004894: @ 0x08004894
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80048B0
sub_80048B0: @ 0x080048B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	bl Proc_Start
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80048D0
sub_80048D0: @ 0x080048D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _080048EE
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	b _080048F0
_080048EE:
	movs r0, #0
_080048F0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80048F8
sub_80048F8: @ 0x080048F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl sub_8004748
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004914
sub_8004914: @ 0x08004914
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl sub_8004764
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004930
sub_8004930: @ 0x08004930
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_800493C
sub_800493C: @ 0x0800493C
	push {lr}
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	bl sub_8004634
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start sub_800494C
sub_800494C: @ 0x0800494C
	push {lr}
	ldr r1, [r0, #4]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004960
sub_8004960: @ 0x08004960
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x24]
	subs r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08004976
	adds r0, r1, #0
	bl Proc_Break
_08004976:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800497C
sub_800497C: @ 0x0800497C
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08004990
	strh r2, [r1, #0x24]
	ldr r0, _0800499C @ =sub_8004960
	str r0, [r1, #0xc]
_08004990:
	ldr r0, [r1, #4]
	adds r0, #8
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.align 2, 0
_0800499C: .4byte sub_8004960

	thumb_func_start sub_80049A0
sub_80049A0: @ 0x080049A0
	ldr r1, [r0, #4]
	ldrh r1, [r1, #2]
	adds r2, r0, #0
	adds r2, #0x26
	strb r1, [r2]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr

	thumb_func_start sub_80049B4
sub_80049B4: @ 0x080049B4
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_80049C0
sub_80049C0: @ 0x080049C0
	movs r0, #0
	bx lr

	thumb_func_start sub_80049C4
sub_80049C4: @ 0x080049C4
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _080049F0 @ =0x02024E20
	movs r4, #0
	ldr r5, [r3]
	movs r1, #0x3f
_080049D0:
	ldr r0, [r2]
	cmp r0, r5
	bne _080049D8
	adds r4, #1
_080049D8:
	subs r1, #1
	adds r2, #0x6c
	cmp r1, #0
	bge _080049D0
	cmp r4, #1
	bgt _080049F4
	ldr r0, [r3, #4]
	adds r0, #8
	str r0, [r3, #4]
	movs r0, #1
	b _080049FC
	.align 2, 0
_080049F0: .4byte 0x02024E20
_080049F4:
	adds r0, r3, #0
	bl Proc_End
	movs r0, #0
_080049FC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8004A04
sub_8004A04: @ 0x08004A04
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08004A10 @ =0x02024E20
	movs r3, #0
	b _08004A18
	.align 2, 0
_08004A10: .4byte 0x02024E20
_08004A14:
	adds r3, #1
	adds r2, #0x6c
_08004A18:
	cmp r3, #0x3f
	bgt _08004A2E
	cmp r2, r4
	beq _08004A14
	ldr r1, [r2]
	ldr r0, [r4]
	cmp r1, r0
	bne _08004A14
	adds r0, r2, #0
	bl Proc_End
_08004A2E:
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8004A3C
sub_8004A3C: @ 0x08004A3C
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_8004A48
sub_8004A48: @ 0x08004A48
	adds r2, r0, #0
	adds r2, #0x27
	movs r1, #4
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_8004A60
sub_8004A60: @ 0x08004A60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _08004AA2
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08004AA2
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _08004AA2
	ldr r5, _08004A80 @ =gUnk_08BBFD28
	b _08004A8A
	.align 2, 0
_08004A80: .4byte gUnk_08BBFD28
_08004A84:
	ldr r0, [r4]
	cmp r0, #0
	beq _08004AA2
_08004A8A:
	ldr r0, [r4, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08004A84
_08004AA2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start nullsub_2
nullsub_2: @ 0x08004AA8
	bx lr
	.align 2, 0

	thumb_func_start sub_8004AAC
sub_8004AAC: @ 0x08004AAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004ABC
	bl sub_8004AAC
_08004ABC:
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08004ADC
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	adds r0, r1, #0
	adds r1, r5, #0
	bl sub_8004AAC
	ldr r0, [r5]
	subs r0, #2
	str r0, [r5]
_08004ADC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8004AE4
sub_8004AE4: @ 0x08004AE4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08004B0E
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sp
	bl sub_8004AAC
	ldr r0, [sp]
	subs r0, #2
	str r0, [sp]
_08004B0E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_22
nullsub_22: @ 0x08004B18
	bx lr
	.align 2, 0

	thumb_func_start sub_8004B1C
sub_8004B1C: @ 0x08004B1C
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start sub_8004B20
sub_8004B20: @ 0x08004B20
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_8004B2C
sub_8004B2C: @ 0x08004B2C
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start Proc_FindAfter
Proc_FindAfter: @ 0x08004B38
	adds r3, r0, #0
	cmp r1, #0
	bne _08004B4C
	ldr r1, _08004B44 @ =0x02024E20
	b _08004B4E
	.align 2, 0
_08004B44: .4byte 0x02024E20
_08004B48:
	adds r0, r1, #0
	b _08004B64
_08004B4C:
	adds r1, #0x6c
_08004B4E:
	ldr r0, _08004B68 @ =0x02026920
	cmp r1, r0
	bhs _08004B62
	adds r2, r0, #0
_08004B56:
	ldr r0, [r1]
	cmp r0, r3
	beq _08004B48
	adds r1, #0x6c
	cmp r1, r2
	blo _08004B56
_08004B62:
	movs r0, #0
_08004B64:
	bx lr
	.align 2, 0
_08004B68: .4byte 0x02026920

	thumb_func_start Proc_FindAfterWithParent
Proc_FindAfterWithParent: @ 0x08004B6C
	adds r2, r0, #0
	cmp r2, #0
	bne _08004B80
	ldr r2, _08004B78 @ =0x02024E20
	b _08004B82
	.align 2, 0
_08004B78: .4byte 0x02024E20
_08004B7C:
	adds r0, r2, #0
	b _08004B98
_08004B80:
	adds r2, #0x6c
_08004B82:
	ldr r0, _08004B9C @ =0x02026920
	cmp r2, r0
	bhs _08004B96
	adds r3, r0, #0
_08004B8A:
	ldr r0, [r2, #0x14]
	cmp r0, r1
	beq _08004B7C
	adds r2, #0x6c
	cmp r2, r3
	blo _08004B8A
_08004B96:
	movs r0, #0
_08004B98:
	bx lr
	.align 2, 0
_08004B9C: .4byte 0x02026920

	thumb_func_start sub_8004BA0
sub_8004BA0: @ 0x08004BA0
	movs r2, #0x40
	ldr r1, _08004BBC @ =0x02024E20
	ldr r0, _08004BC0 @ =0x00001A94
	adds r3, r1, r0
_08004BA8:
	ldr r0, [r1]
	cmp r0, #0
	beq _08004BB0
	subs r2, #1
_08004BB0:
	adds r1, #0x6c
	cmp r1, r3
	ble _08004BA8
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08004BBC: .4byte 0x02024E20
_08004BC0: .4byte 0x00001A94
