	.include "macro.inc"

	.syntax unified

	thumb_func_start OnVBlank
OnVBlank: @ 0x080156C8
	push {lr}
	ldr r1, _0801570C @ =0x03007FF8
	movs r0, #1
	strh r0, [r1]
	bl IncGameTime
	bl SoundVSync_rev01
	ldr r0, _08015710 @ =0x02026A28
	ldr r0, [r0]
	bl Proc_Run
	bl SyncLoOam
	ldr r1, _08015714 @ =gBmSt
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08015702
	movs r0, #0
	strb r0, [r1]
	bl SyncDispIo
	bl SyncBgsAndPal
	bl ApplyDataMoves
	bl SyncHiOam
_08015702:
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_0801570C: .4byte 0x03007FF8
_08015710: .4byte 0x02026A28
_08015714: .4byte gBmSt

	thumb_func_start OnMain
OnMain: @ 0x08015718
	push {r4, lr}
	ldr r0, _08015774 @ =gpKeySt
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, _08015778 @ =0x02026A28
	ldr r0, [r4, #4]
	bl Proc_Run
	bl sub_80157A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801573E
	ldr r0, [r4, #8]
	bl Proc_Run
_0801573E:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PushSpriteLayerObjects
	ldr r0, [r4, #0x10]
	bl Proc_Run
	movs r0, #0xd
	bl PushSpriteLayerObjects
	ldr r1, _0801577C @ =gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08015780 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015774: .4byte gpKeySt
_08015778: .4byte 0x02026A28
_0801577C: .4byte gBmSt
_08015780: .4byte 0x04000006

	thumb_func_start sub_8015784
sub_8015784: @ 0x08015784
	ldr r1, _08015790 @ =gBmSt
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08015790: .4byte gBmSt

	thumb_func_start sub_8015794
sub_8015794: @ 0x08015794
	ldr r1, _080157A0 @ =gBmSt
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_080157A0: .4byte gBmSt

	thumb_func_start sub_80157A4
sub_80157A4: @ 0x080157A4
	ldr r0, _080157AC @ =gBmSt
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_080157AC: .4byte gBmSt

	thumb_func_start HandleChangePhase
HandleChangePhase: @ 0x080157B0
	push {lr}
	ldr r2, _080157C4 @ =gPlaySt
	ldrb r0, [r2, #0xf]
	cmp r0, #0x40
	beq _080157DA
	cmp r0, #0x40
	bgt _080157C8
	cmp r0, #0
	beq _080157CE
	b _080157EE
	.align 2, 0
_080157C4: .4byte gPlaySt
_080157C8:
	cmp r0, #0x80
	beq _080157D4
	b _080157EE
_080157CE:
	movs r0, #0x80
	strb r0, [r2, #0xf]
	b _080157EE
_080157D4:
	movs r0, #0x40
	strb r0, [r2, #0xf]
	b _080157EE
_080157DA:
	movs r0, #0
	strb r0, [r2, #0xf]
	ldrh r1, [r2, #0x10]
	ldr r0, _080157F4 @ =0x000003E6
	cmp r1, r0
	bhi _080157EA
	adds r0, r1, #1
	strh r0, [r2, #0x10]
_080157EA:
	bl sub_8026D24
_080157EE:
	pop {r0}
	bx r0
	.align 2, 0
_080157F4: .4byte 0x000003E6

	thumb_func_start CallChapterStartEventMaybe
CallChapterStartEventMaybe: @ 0x080157F8
	push {lr}
	ldr r0, _08015814 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x38]
	bl StartEvent
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08015814: .4byte gPlaySt

	thumb_func_start BmMain_ChangePhase
BmMain_ChangePhase: @ 0x08015818
	push {lr}
	bl ClearActiveFactionGrayedStates
	bl RefreshUnitSprites
	bl HandleChangePhase
	bl CheckAvailableTurnEvent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08015836
	movs r0, #1
	b _0801583C
_08015836:
	bl StartAvailableTurnEvents
	movs r0, #0
_0801583C:
	pop {r1}
	bx r1

	thumb_func_start sub_8015840
sub_8015840: @ 0x08015840
	push {lr}
	bl sub_80798D4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08015852
	movs r0, #1
	b _08015858
_08015852:
	bl sub_8079894
	movs r0, #0
_08015858:
	pop {r1}
	bx r1

	thumb_func_start BmMain_StartPhase
BmMain_StartPhase: @ 0x0801585C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08015874 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _08015898
	cmp r0, #0x40
	bgt _08015878
	cmp r0, #0
	beq _0801587E
	b _080158A0
	.align 2, 0
_08015874: .4byte gPlaySt
_08015878:
	cmp r0, #0x80
	beq _08015888
	b _080158A0
_0801587E:
	ldr r0, _08015884 @ =gUnk_08C02630
	b _0801588A
	.align 2, 0
_08015884: .4byte gUnk_08C02630
_08015888:
	ldr r0, _08015894 @ =gUnk_08C06154
_0801588A:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080158A0
	.align 2, 0
_08015894: .4byte gUnk_08C06154
_08015898:
	ldr r0, _080158AC @ =gUnk_08C06154
	adds r1, r4, #0
	bl Proc_StartBlocking
_080158A0:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080158AC: .4byte gUnk_08C06154

	thumb_func_start sub_80158B0
sub_80158B0: @ 0x080158B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080158D0 @ =gUnk_08C02630
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r1, #7
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080158D0: .4byte gUnk_08C02630

	thumb_func_start sub_80158D4
sub_80158D4: @ 0x080158D4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080158F0 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	bne _080158F8
	ldr r0, _080158F4 @ =gUnk_08C03834
	bl Proc_StartBlocking
	bl sub_802C70C
	movs r0, #0
	b _080158FA
	.align 2, 0
_080158F0: .4byte gPlaySt
_080158F4: .4byte gUnk_08C03834
_080158F8:
	movs r0, #1
_080158FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8015900
sub_8015900: @ 0x08015900
	push {lr}
	ldr r1, _08015914 @ =gActionSt
	movs r0, #9
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_08015914: .4byte gActionSt

	thumb_func_start sub_8015918
sub_8015918: @ 0x08015918
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801593C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08015936
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_08015936:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801593C: .4byte gPlaySt

	thumb_func_start BmMain_StartIntroFx
BmMain_StartIntroFx: @ 0x08015940
	push {lr}
	adds r1, r0, #0
	ldr r0, _08015970 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	bne _08015978
	ldr r2, _08015974 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	b _0801597E
	.align 2, 0
_08015970: .4byte gPlaySt
_08015974: .4byte gDispIo
_08015978:
	ldr r0, _08015984 @ =gUnk_08C02BF0
	bl Proc_StartBlocking
_0801597E:
	pop {r0}
	bx r0
	.align 2, 0
_08015984: .4byte gUnk_08C02BF0

	thumb_func_start BmMain_SuspendBeforePhase
BmMain_SuspendBeforePhase: @ 0x08015988
	push {lr}
	bl sub_807B2A8
	movs r0, #0x91
	bl ClearFlag
	pop {r0}
	bx r0

	thumb_func_start InitBmBgLayers
InitBmBgLayers: @ 0x08015998
	ldr r0, _080159D0 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _080159D8
	ldr r3, _080159D4 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	orrs r2, r1
	strb r2, [r3, #0x18]
	b _08015A04
	.align 2, 0
_080159D0: .4byte gPlaySt
_080159D4: .4byte gDispIo
_080159D8:
	ldr r3, _08015A08 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
_08015A04:
	bx lr
	.align 2, 0
_08015A08: .4byte gDispIo

	thumb_func_start ApplySystemObjectsGraphics
ApplySystemObjectsGraphics: @ 0x08015A0C
	push {r4, lr}
	ldr r0, _08015A38 @ =gUnk_0818F9F0
	ldr r4, _08015A3C @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08015A40 @ =0x06010000
	adds r0, r4, #0
	movs r2, #0x12
	movs r3, #4
	bl Copy2dChr
	ldr r0, _08015A44 @ =gUnk_0818FE70
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015A38: .4byte gUnk_0818F9F0
_08015A3C: .4byte gBuf
_08015A40: .4byte 0x06010000
_08015A44: .4byte gUnk_0818FE70

	thumb_func_start ApplySystemGraphics
ApplySystemGraphics: @ 0x08015A48
	push {lr}
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitFaces
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ApplySystemObjectsGraphics
	pop {r0}
	bx r0

	thumb_func_start HandleMapCursorInput
HandleMapCursorInput: @ 0x08015A68
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov ip, r1
	lsrs r7, r0, #0x14
	movs r0, #0xf
	ands r7, r0
	ldr r3, _08015B68 @ =gBmSt
	ldr r4, _08015B6C @ =gUnk_08C01FE4
	lsls r2, r7, #1
	adds r0, r2, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r3, #0x14]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	adds r0, r4, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldrh r2, [r3, #0x16]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r6, r1, #0x10
	orrs r6, r0
	movs r0, #2
	ldrb r1, [r3, #4]
	ands r0, r1
	adds r5, r3, #0
	cmp r0, #0
	beq _08015AE6
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	ldr r1, _08015B70 @ =gBmMapMovement
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x14
	ldrsh r1, [r5, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _08015AE6
	asrs r0, r6, #0x10
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bls _08015AE6
	movs r0, #0xf0
	ldr r1, _08015B74 @ =gpKeySt
	ldr r2, [r1]
	mov r1, ip
	ands r1, r0
	ldrh r2, [r2, #8]
	ands r0, r2
	cmp r1, r0
	bne _08015B8A
_08015AE6:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08015B10
	ldr r0, _08015B78 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _08015B10
	lsls r0, r7, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r3, [r5, #0x1c]
	adds r0, r3, r0
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	strh r0, [r5, #0x18]
	strh r6, [r5, #0x14]
_08015B10:
	asrs r2, r6, #0x10
	adds r1, r2, #0
	cmp r1, #0
	blt _08015B3C
	ldr r0, _08015B78 @ =gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _08015B3C
	lsls r0, r7, #1
	adds r1, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r1, [r5, #0x1e]
	adds r0, r1, r0
	strh r0, [r5, #0x1e]
	ldrh r0, [r5, #0x16]
	strh r0, [r5, #0x1a]
	strh r2, [r5, #0x16]
_08015B3C:
	ldrb r1, [r5, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08015B84
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #0x18]
	cmp r1, r0
	beq _08015B8A
	ldr r0, _08015B7C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08015B60
	ldr r0, _08015B80 @ =0x00000385
	bl m4aSongNumStart
_08015B60:
	movs r0, #4
	ldrb r2, [r5, #4]
	orrs r0, r2
	b _08015B88
	.align 2, 0
_08015B68: .4byte gBmSt
_08015B6C: .4byte gUnk_08C01FE4
_08015B70: .4byte gBmMapMovement
_08015B74: .4byte gpKeySt
_08015B78: .4byte gBmMapSize
_08015B7C: .4byte gPlaySt
_08015B80: .4byte 0x00000385
_08015B84:
	movs r0, #0xfb
	ands r0, r1
_08015B88:
	strb r0, [r5, #4]
_08015B8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8015B90
sub_8015B90: @ 0x08015B90
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08015BE0 @ =gBmSt
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bge _08015BA8
	adds r0, r3, r4
	strh r0, [r2, #0x20]
_08015BA8:
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	ble _08015BBA
	subs r0, r3, r4
	strh r0, [r2, #0x20]
_08015BBA:
	ldrh r3, [r2, #0x22]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r5, #0x1e
	ldrsh r1, [r2, r5]
	cmp r0, r1
	bge _08015BCC
	adds r0, r3, r4
	strh r0, [r2, #0x22]
_08015BCC:
	ldrh r3, [r2, #0x22]
	movs r5, #0x22
	ldrsh r0, [r2, r5]
	cmp r0, r1
	ble _08015BDA
	subs r0, r3, r4
	strh r0, [r2, #0x22]
_08015BDA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015BE0: .4byte gBmSt

	thumb_func_start sub_8015BE4
sub_8015BE4: @ 0x08015BE4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r2, _08015C0C @ =gBmSt
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r3, #0x22
	ldrsh r5, [r2, r3]
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	adds r0, #0x30
	cmp r0, r1
	ble _08015C28
	adds r0, r1, #0
	subs r0, #0x30
	cmp r0, #0
	bge _08015C10
	strh r6, [r2, #0xc]
	b _08015C28
	.align 2, 0
_08015C0C: .4byte gBmSt
_08015C10:
	movs r6, #1
	ldrh r3, [r2, #0xc]
	subs r0, r3, r4
	strh r0, [r2, #0xc]
	rsbs r0, r4, #0
	adds r3, r2, #0
	adds r3, #0x36
	strb r0, [r3]
	movs r0, #0xf
	ldrh r3, [r2, #0xc]
	ands r0, r3
	strh r0, [r2, #0x32]
_08015C28:
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	adds r0, #0xb0
	cmp r0, r1
	bge _08015C58
	subs r1, #0xb0
	movs r3, #0x28
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08015C42
	ldrh r0, [r2, #0x28]
	strh r0, [r2, #0xc]
	b _08015C58
_08015C42:
	movs r6, #1
	ldrh r1, [r2, #0xc]
	adds r0, r1, r4
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x36
	strb r4, [r0]
	movs r0, #0xf
	ldrh r3, [r2, #0xc]
	ands r0, r3
	strh r0, [r2, #0x32]
_08015C58:
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	adds r0, #0x20
	cmp r0, r5
	ble _08015C88
	adds r0, r5, #0
	subs r0, #0x20
	cmp r0, #0
	bge _08015C70
	movs r0, #0
	strh r0, [r2, #0xe]
	b _08015C88
_08015C70:
	movs r6, #1
	ldrh r3, [r2, #0xe]
	subs r0, r3, r4
	strh r0, [r2, #0xe]
	rsbs r0, r4, #0
	adds r1, r2, #0
	adds r1, #0x37
	strb r0, [r1]
	movs r0, #0xf
	ldrh r1, [r2, #0xe]
	ands r0, r1
	strh r0, [r2, #0x34]
_08015C88:
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	adds r0, #0x70
	cmp r0, r5
	bge _08015CBA
	adds r1, r5, #0
	subs r1, #0x70
	movs r3, #0x2a
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08015CA4
	ldrh r0, [r2, #0x2a]
	strh r0, [r2, #0xe]
	b _08015CBA
_08015CA4:
	movs r6, #1
	ldrh r1, [r2, #0xe]
	adds r0, r1, r4
	strh r0, [r2, #0xe]
	adds r0, r2, #0
	adds r0, #0x37
	strb r4, [r0]
	movs r0, #0xf
	ldrh r3, [r2, #0xe]
	ands r0, r3
	strh r0, [r2, #0x34]
_08015CBA:
	cmp r6, #0
	bne _08015D08
	adds r3, r2, #0
	ldrh r1, [r3, #0x32]
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _08015CE4
	adds r4, r3, #0
	adds r4, #0x36
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r3, #0x32]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrh r1, [r3, #0xc]
	adds r0, r1, r0
	strh r0, [r3, #0xc]
_08015CE4:
	ldrh r1, [r2, #0x34]
	movs r3, #0x34
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08015D08
	adds r3, r2, #0
	adds r3, #0x37
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrh r4, [r2, #0xe]
	adds r0, r4, r0
	strh r0, [r2, #0xe]
_08015D08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015D10
sub_8015D10: @ 0x08015D10
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08015D50 @ =gBmSt
	movs r1, #0xc
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x30
	adds r4, r0, #0
	cmp r1, r3
	ble _08015D2E
	adds r2, r3, #0
	subs r2, #0x30
	cmp r2, #0
	bge _08015D2E
	movs r2, #0
_08015D2E:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	adds r0, #0xb0
	cmp r0, r3
	bge _08015D46
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0xb0
	cmp r2, r0
	ble _08015D46
	adds r2, r0, #0
_08015D46:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015D50: .4byte gBmSt

	thumb_func_start sub_8015D54
sub_8015D54: @ 0x08015D54
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08015D94 @ =gBmSt
	movs r1, #0xe
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x20
	adds r4, r0, #0
	cmp r1, r3
	ble _08015D72
	adds r2, r3, #0
	subs r2, #0x20
	cmp r2, #0
	bge _08015D72
	movs r2, #0
_08015D72:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	adds r0, #0x70
	cmp r0, r3
	bge _08015D8A
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0x70
	cmp r2, r0
	ble _08015D8A
	adds r2, r0, #0
_08015D8A:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015D94: .4byte gBmSt

	thumb_func_start GetCameraCenteredX
GetCameraCenteredX: @ 0x08015D98
	adds r1, r0, #0
	subs r1, #0x78
	cmp r1, #0
	bge _08015DA2
	movs r1, #0
_08015DA2:
	ldr r0, _08015DBC @ =gBmSt
	movs r2, #0x28
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015DAE
	adds r1, r0, #0
_08015DAE:
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08015DBC: .4byte gBmSt

	thumb_func_start GetCameraCenteredY
GetCameraCenteredY: @ 0x08015DC0
	adds r1, r0, #0
	subs r1, #0x50
	cmp r1, #0
	bge _08015DCA
	movs r1, #0
_08015DCA:
	ldr r0, _08015DE4 @ =gBmSt
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015DD6
	adds r1, r0, #0
_08015DD6:
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08015DE4: .4byte gBmSt

	thumb_func_start sub_8015DE8
sub_8015DE8: @ 0x08015DE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	mov r8, r0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	cmp r5, #4
	bhi _08015EA2
	lsls r0, r5, #2
	ldr r1, _08015E18 @ =_08015E1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015E18: .4byte _08015E1C
_08015E1C: @ jump table
	.4byte _08015E30 @ case 0
	.4byte _08015E30 @ case 1
	.4byte _08015E40 @ case 2
	.4byte _08015E88 @ case 3
	.4byte _08015E98 @ case 4
_08015E30:
	movs r1, #2
	mov sb, r1
	ldr r1, _08015E3C @ =gUnk_08C0206C
	lsls r0, r4, #2
	adds r0, r0, r1
	b _08015E9E
	.align 2, 0
_08015E3C: .4byte gUnk_08C0206C
_08015E40:
	bl GetGameTime
	subs r0, #1
	ldr r5, _08015E7C @ =0x0202BC40
	ldr r1, [r5]
	cmp r0, r1
	bne _08015E60
	ldr r0, _08015E80 @ =0x0202BC3C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r6, r1
	asrs r6, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r7, r0
	asrs r7, r0, #1
_08015E60:
	movs r2, #0x24
	mov sb, r2
	ldr r1, _08015E84 @ =gUnk_08C0206C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _08015E80 @ =0x0202BC3C
	strh r6, [r0]
	strh r7, [r0, #2]
	bl GetGameTime
	str r0, [r5]
	b _08015EA2
	.align 2, 0
_08015E7C: .4byte 0x0202BC40
_08015E80: .4byte 0x0202BC3C
_08015E84: .4byte gUnk_08C0206C
_08015E88:
	movs r0, #2
	mov sb, r0
	ldr r1, _08015E94 @ =gUnk_08C02052
	mov r8, r1
	b _08015EA2
	.align 2, 0
_08015E94: .4byte gUnk_08C02052
_08015E98:
	movs r2, #0x24
	mov sb, r2
	ldr r0, _08015ED0 @ =gUnk_08C0206C
_08015E9E:
	ldr r0, [r0]
	mov r8, r0
_08015EA2:
	ldr r0, _08015ED4 @ =gBmSt
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r6, r6, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	subs r7, r7, r0
	mov r2, sb
	str r2, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015ED0: .4byte gUnk_08C0206C
_08015ED4: .4byte gBmSt

	thumb_func_start DisplayBmTextShadow
DisplayBmTextShadow: @ 0x08015ED8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	movs r2, #2
	ldr r1, _08015F08 @ =gUnk_08C0206C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015F08: .4byte gUnk_08C0206C

	thumb_func_start SetMapCursorPosition
SetMapCursorPosition: @ 0x08015F0C
	ldr r2, _08015F20 @ =gBmSt
	strh r0, [r2, #0x14]
	strh r1, [r2, #0x16]
	lsls r0, r0, #4
	strh r0, [r2, #0x1c]
	lsls r1, r1, #4
	strh r1, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r1, [r2, #0x22]
	bx lr
	.align 2, 0
_08015F20: .4byte gBmSt

	thumb_func_start sub_8015F24
sub_8015F24: @ 0x08015F24
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	cmp r4, #0
	beq _08015F48
	ldr r1, _08015F44 @ =gUnk_08C020E8
	b _08015F4A
	.align 2, 0
_08015F44: .4byte gUnk_08C020E8
_08015F48:
	ldr r1, _08015F68 @ =gUnk_08C020DC
_08015F4A:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015F68: .4byte gUnk_08C020DC

	thumb_func_start sub_8015F6C
sub_8015F6C: @ 0x08015F6C
	push {r4, r5, r6, lr}
	mov ip, r0
	movs r5, #1
	movs r1, #0x2c
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r0, [r0, r3]
	subs r1, r2, r0
	cmp r1, #0
	bge _08015F82
	subs r1, r0, r2
_08015F82:
	mov r4, ip
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge _08015F94
	subs r2, r0, r3
_08015F94:
	cmp r1, r2
	ble _08015FA4
	mov r0, ip
	adds r0, #0x40
	strb r5, [r0]
	mov r3, ip
	strh r1, [r3, #0x38]
	b _08015FB0
_08015FA4:
	mov r1, ip
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	mov r4, ip
	strh r2, [r4, #0x38]
_08015FB0:
	mov r0, ip
	movs r1, #0x38
	ldrsh r3, [r0, r1]
	movs r4, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	ldr r6, _08015FC8 @ =0x0202BC44
	cmp r0, #0
	bge _08015FCC
	strb r3, [r6]
	b _08015FF2
	.align 2, 0
_08015FC8: .4byte 0x0202BC44
_08015FCC:
	lsls r1, r5, #0x18
	asrs r2, r1, #0x18
	asrs r1, r1, #0x19
	subs r3, r3, r1
	adds r0, r4, r6
	strb r1, [r0]
	cmp r2, #0xf
	bgt _08015FE2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08015FE2:
	adds r4, #1
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	cmp r0, #0
	bge _08015FCC
	adds r0, r4, r6
	strb r3, [r0]
_08015FF2:
	mov r2, ip
	str r4, [r2, #0x3c]
	ldrh r0, [r2, #0x38]
	strh r0, [r2, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8016000
sub_8016000: @ 0x08016000
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x3c]
	cmp r1, #0
	bne _08016020
	ldr r0, _0801601C @ =gBmSt
	ldrh r1, [r0, #0xc]
	strh r1, [r5, #0x2c]
	ldrh r0, [r0, #0xe]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_End
	b _08016072
	.align 2, 0
_0801601C: .4byte gBmSt
_08016020:
	ldr r0, _08016078 @ =0x0202BC44
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r5, #0x3a]
	subs r0, r2, r0
	strh r0, [r5, #0x3a]
	subs r0, r1, #1
	str r0, [r5, #0x3c]
	ldr r4, _0801607C @ =gBmSt
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2c]
	adds r0, r1, r0
	strh r0, [r4, #0xc]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r5, [r5, #0x2e]
	adds r0, r5, r0
	strh r0, [r4, #0xe]
_08016072:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016078: .4byte 0x0202BC44
_0801607C: .4byte gBmSt

	thumb_func_start sub_8016080
sub_8016080: @ 0x08016080
	push {r4, r5, lr}
	adds r4, r2, #0
	subs r0, #7
	str r0, [r4]
	subs r1, #5
	str r1, [r3]
	ldr r0, [r4]
	cmp r0, #0
	bge _08016096
	movs r0, #0
	str r0, [r4]
_08016096:
	ldr r0, [r3]
	cmp r0, #0
	bge _080160A0
	movs r0, #0
	str r0, [r3]
_080160A0:
	ldr r1, [r4]
	adds r1, #8
	ldr r5, _080160D0 @ =gBmMapSize
	movs r0, #0
	ldrsh r2, [r5, r0]
	subs r0, r2, #1
	cmp r1, r0
	ble _080160B4
	subs r0, #0xe
	str r0, [r4]
_080160B4:
	ldr r0, [r3]
	adds r0, #4
	movs r1, #2
	ldrsh r2, [r5, r1]
	subs r1, r2, #1
	cmp r0, r1
	ble _080160C8
	adds r0, r2, #0
	subs r0, #0xa
	str r0, [r3]
_080160C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080160D0: .4byte gBmMapSize

	thumb_func_start sub_80160D4
sub_80160D4: @ 0x080160D4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	add r3, sp, #4
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sp
	bl sub_8016080
	ldr r1, [sp]
	lsls r1, r1, #4
	str r1, [sp]
	ldr r0, [sp, #4]
	lsls r2, r0, #4
	str r2, [sp, #4]
	ldr r3, _08016118 @ =gBmSt
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _08016108
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r2, r0
	beq _08016114
_08016108:
	ldr r4, _0801611C @ =ProcScr_CamMove
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08016120
_08016114:
	movs r0, #0
	b _08016150
	.align 2, 0
_08016118: .4byte gBmSt
_0801611C: .4byte ProcScr_CamMove
_08016120:
	cmp r5, #0
	beq _0801612E
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08016136
_0801612E:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08016136:
	adds r2, r0, #0
	ldr r1, _08016158 @ =gBmSt
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldr r0, [sp]
	strh r0, [r2, #0x2c]
	ldr r0, [sp, #4]
	strh r0, [r2, #0x2e]
	strh r6, [r2, #0x34]
	strh r7, [r2, #0x36]
	movs r0, #1
_08016150:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016158: .4byte gBmSt

	thumb_func_start sub_801615C
sub_801615C: @ 0x0801615C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	lsls r0, r1, #4
	bl sub_8015D10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, sb
	lsls r0, r1, #4
	bl sub_8015D54
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _080161A4 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r7, r0
	bne _08016192
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r6, r0
	beq _0801619E
_08016192:
	ldr r4, _080161A8 @ =ProcScr_CamMove
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _080161AC
_0801619E:
	movs r0, #0
	b _080161DC
	.align 2, 0
_080161A4: .4byte gBmSt
_080161A8: .4byte ProcScr_CamMove
_080161AC:
	cmp r5, #0
	beq _080161BA
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _080161C2
_080161BA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_080161C2:
	adds r2, r0, #0
	ldr r0, _080161E8 @ =gBmSt
	ldrh r1, [r0, #0xc]
	strh r1, [r2, #0x30]
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #0x32]
	strh r7, [r2, #0x2c]
	strh r6, [r2, #0x2e]
	mov r0, r8
	strh r0, [r2, #0x34]
	mov r1, sb
	strh r1, [r2, #0x36]
	movs r0, #1
_080161DC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080161E8: .4byte gBmSt

	thumb_func_start sub_80161EC
sub_80161EC: @ 0x080161EC
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #4
	bl sub_8015D10
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #4
	adds r0, r5, #0
	bl sub_8015D54
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08016220 @ =gBmSt
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _08016224
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r2, r0
	bne _08016224
	movs r0, #0
	b _08016226
	.align 2, 0
_08016220: .4byte gBmSt
_08016224:
	movs r0, #1
_08016226:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_801622C
sub_801622C: @ 0x0801622C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08016250 @ =gBmSt
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0801624A
	ldr r4, _08016254 @ =ProcScr_CamMove
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08016258
_0801624A:
	movs r0, #0
	b _08016284
	.align 2, 0
_08016250: .4byte gBmSt
_08016254: .4byte ProcScr_CamMove
_08016258:
	cmp r5, #0
	beq _08016266
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _0801626E
_08016266:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_0801626E:
	adds r2, r0, #0
	ldr r1, _0801628C @ =gBmSt
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x2c]
	ldrh r0, [r1, #0x2a]
	strh r0, [r2, #0x2e]
	movs r0, #1
_08016284:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801628C: .4byte gBmSt

	thumb_func_start sub_8016290
sub_8016290: @ 0x08016290
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	ldr r4, [r7, #0x34]
	muls r0, r4, r0
	ldr r5, [r7, #0x38]
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	bl sub_8015DE8
	ldr r0, [r7, #0x34]
	subs r0, #1
	str r0, [r7, #0x34]
	cmp r0, #0
	bge _080162D8
	adds r0, r7, #0
	bl Proc_Break
_080162D8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80162E0
sub_80162E0: @ 0x080162E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08016310 @ =gUnk_08C0211C
	movs r1, #3
	bl Proc_Start
	ldr r2, _08016314 @ =gBmSt
	ldrh r3, [r2, #0x14]
	lsls r1, r3, #4
	strh r1, [r0, #0x2c]
	ldrh r2, [r2, #0x16]
	lsls r1, r2, #4
	strh r1, [r0, #0x2e]
	lsls r4, r4, #4
	strh r4, [r0, #0x30]
	lsls r5, r5, #4
	strh r5, [r0, #0x32]
	str r6, [r0, #0x38]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08016310: .4byte gUnk_08C0211C
_08016314: .4byte gBmSt

	thumb_func_start sub_8016318
sub_8016318: @ 0x08016318
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801634C @ =gPlaySt
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08016326
	movs r1, #3
_08016326:
	adds r4, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r1, #6
	cmp r0, #0
	bne _08016338
	adds r1, r4, #0
_08016338:
	adds r7, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016350
	adds r1, r4, #1
	b _08016352
	.align 2, 0
_0801634C: .4byte gPlaySt
_08016350:
	movs r1, #7
_08016352:
	adds r6, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016364
	adds r4, #2
	b _08016366
_08016364:
	movs r4, #6
_08016366:
	ldr r5, _08016378 @ =gPlaySt
	ldrb r0, [r5, #0xf]
	cmp r0, #0x40
	beq _08016392
	cmp r0, #0x40
	bgt _0801637C
	cmp r0, #0
	beq _080163A4
	b _080163F4
	.align 2, 0
_08016378: .4byte gPlaySt
_0801637C:
	cmp r0, #0x80
	bne _080163F4
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r6, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080163F4
_08016392:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r4, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080163F4
_080163A4:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080163E0
	ldr r1, _080163DC @ =0x0001000C
	movs r0, #0x80
	bl CountFactionUnitsWithoutFlags
	adds r4, r0, #0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bgt _080163E0
	movs r0, #9
	b _080163F4
	.align 2, 0
_080163DC: .4byte 0x0001000C
_080163E0:
	ldr r0, _080163FC @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
_080163F4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080163FC: .4byte gPlaySt

	thumb_func_start sub_8016400
sub_8016400: @ 0x08016400
	push {lr}
	bl sub_8016318
	movs r1, #0
	bl sub_800376C
	pop {r0}
	bx r0

	thumb_func_start sub_8016410
sub_8016410: @ 0x08016410
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r6, #0x2e
	ldrsh r2, [r5, r6]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r1, _08016468 @ =gBmSt
	strh r4, [r1, #0xc]
	strh r0, [r1, #0xe]
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _0801645E
	adds r0, r5, #0
	bl Proc_End
_0801645E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08016468: .4byte gBmSt

	thumb_func_start nullsub_37
nullsub_37: @ 0x0801646C
	bx lr
	.align 2, 0
