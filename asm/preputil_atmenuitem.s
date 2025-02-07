	.include "macro.inc"
	.syntax unified

	thumb_func_start AtMenu_AddPrepScreenSupportMenuItem
AtMenu_AddPrepScreenSupportMenuItem: @ 0x0808E84C
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r1, r0, #0
	adds r1, #0x2f
	strb r6, [r1]
	ldr r2, _0808E87C @ =gPlaySt
	movs r0, #0x80
	ldrb r3, [r2, #0x14]
	ands r0, r3
	cmp r0, #0
	bne _0808E8B8
	ldrb r2, [r2, #0x1b]
	cmp r2, #1
	bne _0808E888
	ldr r1, _0808E880 @ =PrepScreenMenu_OnSupport
	ldr r3, _0808E884 @ =0x0000113A
	str r6, [sp]
	movs r0, #4
	movs r2, #1
	bl SetPrepScreenMenuItem
	b _0808E8B8
	.align 2, 0
_0808E87C: .4byte gPlaySt
_0808E880: .4byte PrepScreenMenu_OnSupport
_0808E884: .4byte 0x0000113A
_0808E888:
	movs r4, #0
	adds r5, r1, #0
_0808E88C:
	adds r0, r4, #0
	bl sub_8099BB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E8A2
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_0808E8A2:
	adds r4, #1
	cmp r4, #3
	ble _0808E88C
	ldr r1, _0808E8C0 @ =PrepScreenMenu_OnSupport
	ldr r3, _0808E8C4 @ =0x0000113A
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl SetPrepScreenMenuItem
_0808E8B8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E8C0: .4byte PrepScreenMenu_OnSupport
_0808E8C4: .4byte 0x0000113A

	thumb_func_start CanPrepScreenCheckMap
CanPrepScreenCheckMap: @ 0x0808E8C8
	ldr r0, _0808E8D4 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2e
	beq _0808E8D8
	movs r0, #1
	b _0808E8DA
	.align 2, 0
_0808E8D4: .4byte gPlaySt
_0808E8D8:
	movs r0, #0
_0808E8DA:
	bx lr

	thumb_func_start InitPrepScreenMainMenu
InitPrepScreenMainMenu: @ 0x0808E8DC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl StartPrepScreenMenu
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0808E98C
	ldr r1, _0808E930 @ =PrepScreenMenu_OnPickUnits
	ldr r3, _0808E934 @ =0x00001131
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808E938 @ =PrepScreenMenu_OnItems
	ldr r3, _0808E93C @ =0x00001132
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	adds r0, r5, #0
	bl AtMenu_AddPrepScreenSupportMenuItem
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E948
	ldr r1, _0808E940 @ =PrepScreenMenu_OnCheckMap
	ldr r3, _0808E944 @ =0x00001135
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl SetPrepScreenMenuItem
	b _0808E956
	.align 2, 0
_0808E930: .4byte PrepScreenMenu_OnPickUnits
_0808E934: .4byte 0x00001131
_0808E938: .4byte PrepScreenMenu_OnItems
_0808E93C: .4byte 0x00001132
_0808E940: .4byte PrepScreenMenu_OnCheckMap
_0808E944: .4byte 0x00001135
_0808E948:
	ldr r1, _0808E978 @ =PrepScreenMenu_OnCheckMap
	ldr r3, _0808E97C @ =0x00001135
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl SetPrepScreenMenuItem
_0808E956:
	ldr r1, _0808E980 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0808E9B8
	ldr r1, _0808E984 @ =PrepScreenMenu_OnSave
	ldr r3, _0808E988 @ =0x00001134
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl SetPrepScreenMenuItem
	b _0808E9B8
	.align 2, 0
_0808E978: .4byte PrepScreenMenu_OnCheckMap
_0808E97C: .4byte 0x00001135
_0808E980: .4byte gPlaySt
_0808E984: .4byte PrepScreenMenu_OnSave
_0808E988: .4byte 0x00001134
_0808E98C:
	ldr r1, _0808E9F8 @ =PrepScreenMenu_OnPickUnits
	ldr r3, _0808E9FC @ =0x00001131
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808EA00 @ =PrepScreenMenu_OnItems
	ldr r3, _0808EA04 @ =0x00001132
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808EA08 @ =PrepScreenMenu_808E57C
	ldr r3, _0808EA0C @ =0x00001146
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	bl SetPrepScreenMenuItem
_0808E9B8:
	ldr r0, _0808EA10 @ =PrepScreenMenu_OnBPress
	bl SetPrepScreenMenuOnBPress
	ldr r0, _0808EA14 @ =PrepScreenMenu_OnStartPress
	bl SetPrepScreenMenuOnStartPress
	ldr r0, _0808EA18 @ =gBg0Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808EA1C @ =gBg1Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	movs r1, #4
	bl DrawPrepScreenMenuFrameAt
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl SetPrepScreenMenuSelectedItem
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E9F8: .4byte PrepScreenMenu_OnPickUnits
_0808E9FC: .4byte 0x00001131
_0808EA00: .4byte PrepScreenMenu_OnItems
_0808EA04: .4byte 0x00001132
_0808EA08: .4byte PrepScreenMenu_808E57C
_0808EA0C: .4byte 0x00001146
_0808EA10: .4byte PrepScreenMenu_OnBPress
_0808EA14: .4byte PrepScreenMenu_OnStartPress
_0808EA18: .4byte gBg0Tm
_0808EA1C: .4byte gBg1Tm
