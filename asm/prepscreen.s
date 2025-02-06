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
	bl SetPrepScreenMenuPosition
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

	thumb_func_start GetLatestUnitIndexInPrepListByUId
GetLatestUnitIndexInPrepListByUId: @ 0x0808EA20
	push {r4, r5, lr}
	movs r5, #0
	b _0808EA42
_0808EA26:
	bl GetLastStatScreenUnitId
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _0808EA40
	adds r0, r5, #0
	b _0808EA4C
_0808EA40:
	adds r5, #1
_0808EA42:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808EA26
	movs r0, #0
_0808EA4C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PrepGetLatestUnitIndex
PrepGetLatestUnitIndex: @ 0x0808EA54
	push {r4, r5, lr}
	movs r5, #0
	b _0808EA72
_0808EA5A:
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl PrepGetLatestCharId
	cmp r4, r0
	bne _0808EA70
	adds r0, r5, #0
	b _0808EA7C
_0808EA70:
	adds r5, #1
_0808EA72:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808EA5A
	movs r0, #0
_0808EA7C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ReorderPlayerUnitsBasedOnDeployment
ReorderPlayerUnitsBasedOnDeployment: @ 0x0808EA84
	push {r4, lr}
	ldr r0, _0808EAEC @ =0x020106DC
	bl InitUnitStack
	movs r4, #1
_0808EA8E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808EAB0
	ldr r0, [r2]
	cmp r0, #0
	beq _0808EAB0
	ldr r0, [r2, #0xc]
	ldr r1, _0808EAF0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808EAB0
	adds r0, r2, #0
	bl PushUnit
_0808EAB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EA8E
	movs r4, #1
_0808EAB8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808EADA
	ldr r0, [r2]
	cmp r0, #0
	beq _0808EADA
	ldr r0, [r2, #0xc]
	ldr r1, _0808EAF0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0808EADA
	adds r0, r2, #0
	bl PushUnit
_0808EADA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EAB8
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EAEC: .4byte 0x020106DC
_0808EAF0: .4byte 0x0001000C

	thumb_func_start SortPlayerUnitsForPrepScreen
SortPlayerUnitsForPrepScreen: @ 0x0808EAF4
	push {r4, r5, r6, r7, lr}
	bl GetChapterAllyUnitCount
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0808EBB8 @ =0x020106DC
	bl InitUnitStack
	movs r5, #1
_0808EB06:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EB40
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EB40
	ldr r0, [r4, #0xc]
	ldr r1, _0808EBBC @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB40
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB40
	adds r0, r4, #0
	bl PushUnit
_0808EB40:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB06
	movs r5, #1
_0808EB48:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EB7A
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EB7A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB74
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EB7A
_0808EB74:
	adds r0, r4, #0
	bl PushUnit
_0808EB7A:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB48
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_0808EB86:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EBDE
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EBDE
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EBDE
	adds r0, r4, #0
	bl sub_808E7D4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EBC4
	ldr r0, [r4, #0xc]
	ldr r1, _0808EBC0 @ =0x02000008
	b _0808EBDA
	.align 2, 0
_0808EBB8: .4byte 0x020106DC
_0808EBBC: .4byte 0xFDFFFFFF
_0808EBC0: .4byte 0x02000008
_0808EBC4:
	cmp r7, r6
	ble _0808EBD6
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _0808EBDE
_0808EBD6:
	ldr r0, [r4, #0xc]
	movs r1, #8
_0808EBDA:
	orrs r0, r1
	str r0, [r4, #0xc]
_0808EBDE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB86
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RemoveSomeUnitItems
RemoveSomeUnitItems: @ 0x0808EBEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r4, #1
_0808EBF6:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov r8, r4
	cmp r5, #0
	beq _0808EC5C
	ldr r0, [r5]
	cmp r0, #0
	beq _0808EC5C
	movs r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	str r2, [sp]
	bl GetUnitItemCount
	adds r7, r0, #0
	movs r6, #0
	ldr r2, [sp]
	cmp r2, r7
	bge _0808EC52
_0808EC28:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r4, r1, r0
	ldrh r0, [r4]
	str r2, [sp]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r0, #0x80
	blt _0808EC4C
	cmp r0, #0x83
	ble _0808EC46
	cmp r0, #0x8a
	bne _0808EC4C
_0808EC46:
	movs r0, #0
	strh r0, [r4]
	movs r2, #1
_0808EC4C:
	adds r6, #1
	cmp r6, r7
	blt _0808EC28
_0808EC52:
	cmp r2, #0
	beq _0808EC5C
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_0808EC5C:
	mov r4, r8
	cmp r4, #0x3f
	ble _0808EBF6
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MakePrepUnitList
MakePrepUnitList: @ 0x0808EC70
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #1
_0808EC76:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EC9E
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EC9E
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EC9E
	adds r0, r6, #0
	adds r1, r4, #0
	bl RegisterPrepUnitList
	adds r6, #1
_0808EC9E:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EC76
	adds r0, r6, #0
	bl PrepSetUnitAmount
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start UnitGetIndexInPrepList
UnitGetIndexInPrepList: @ 0x0808ECB0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _0808ECCC
_0808ECB8:
	adds r0, r4, #0
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0808ECCA
	adds r0, r4, #0
	b _0808ECD6
_0808ECCA:
	adds r4, #1
_0808ECCC:
	bl PrepGetUnitAmount
	cmp r4, r0
	blt _0808ECB8
	movs r0, #0
_0808ECD6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start PrepUpdateSMS
PrepUpdateSMS: @ 0x0808ECDC
	push {r4, lr}
	bl ResetUnitSprites
	movs r4, #0
	b _0808ED12
_0808ECE6:
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0808ED00
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	b _0808ED04
_0808ED00:
	movs r0, #0xa
	orrs r1, r0
_0808ED04:
	str r1, [r2, #0xc]
	adds r0, r2, #0
	bl GetUnitSMSId
	bl StartUiSMS
	adds r4, #1
_0808ED12:
	bl PrepGetUnitAmount
	cmp r4, r0
	blt _0808ECE6
	bl ForceSyncUnitSpriteSheet
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepAutoCapDeployUnits
PrepAutoCapDeployUnits: @ 0x0808ED24
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	movs r6, #0
	adds r7, r1, #0
	b _0808ED6C
_0808ED3A:
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r5, #8
	ands r0, r5
	cmp r0, #0
	bne _0808ED64
	adds r2, r4, #0
	adds r2, #0x2b
	adds r1, r4, #0
	adds r1, #0x2a
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0808ED60
	str r5, [r3, #0xc]
	b _0808ED64
_0808ED60:
	adds r0, #1
	strb r0, [r2]
_0808ED64:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	adds r6, #1
_0808ED6C:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _0808ED3A
	adds r2, r4, #0
	adds r2, #0x29
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r2, [r2]
	ldrb r1, [r0]
	cmp r2, r1
	bhs _0808ED86
	strb r2, [r0]
_0808ED86:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
