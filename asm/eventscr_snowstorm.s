	.include "macro.inc"

	.syntax unified

	thumb_func_start SnowStormWeather_Init
SnowStormWeather_Init: @ 0x08011568
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r3, _08011604 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _08011608 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801160C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _08011610 @ =Img_SnowStormWeather
	ldr r1, _08011614 @ =0x06001000
	bl Decompress
	ldr r4, _08011618 @ =Pal_SnowStormWeather
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801161C @ =gBg2Tm
	ldr r1, _08011620 @ =Tsa_SnowStormWeather
	ldr r2, _08011624 @ =0x0000F080
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0xf
	bl StartMixPalette
	str r5, [r6, #0x30]
	movs r0, #0x20
	str r0, [r6, #0x34]
	str r5, [r6, #0x3c]
	str r5, [r6, #0x40]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011604: .4byte gDispIo
_08011608: .4byte 0x0000FFE0
_0801160C: .4byte 0x0000E0FF
_08011610: .4byte Img_SnowStormWeather
_08011614: .4byte 0x06001000
_08011618: .4byte Pal_SnowStormWeather
_0801161C: .4byte gBg2Tm
_08011620: .4byte Tsa_SnowStormWeather
_08011624: .4byte 0x0000F080

	thumb_func_start SnowStormWeather_Loop1
SnowStormWeather_Loop1: @ 0x08011628
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #1
	ldr r3, _080116A4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r5, [r0]
	movs r0, #0x10
	subs r0, r0, r5
	cmp r0, #0xd
	bge _08011658
	movs r0, #0xd
_08011658:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	cmp r5, #0x10
	bne _08011670
	str r2, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011670:
	ldr r3, [r4, #0x34]
	adds r3, #1
	str r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080116A4: .4byte gDispIo

	thumb_func_start SnowStormWeather_Loop2
SnowStormWeather_Loop2: @ 0x080116A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	cmp r0, r1
	blt _080116C2
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_080116C2:
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SnowStormWeather_Loop3
SnowStormWeather_Loop3: @ 0x080116F0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #3
	ldr r3, _08011768 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r5
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xd
	cmp r0, #0x10
	ble _08011722
	movs r0, #0x10
_08011722:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	cmp r5, #0x10
	bne _08011760
	adds r0, r4, #0
	bl Proc_Break
_08011760:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011768: .4byte gDispIo

	thumb_func_start SnowStormWeather_End
SnowStormWeather_End: @ 0x0801176C
	push {lr}
	ldr r0, _080117A4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r2, _080117A8 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080117A4: .4byte gBg2Tm
_080117A8: .4byte gDispIo

	thumb_func_start EventDF_SnowStormfx
EventDF_SnowStormfx: @ 0x080117AC
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _080117D4
	ldr r0, _080117D0 @ =ProcScr_SnowStormWeather
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r0, #2
	b _080117D6
	.align 2, 0
_080117D0: .4byte ProcScr_SnowStormWeather
_080117D4:
	movs r0, #0
_080117D6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80117DC
sub_80117DC: @ 0x080117DC
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r6, _08011894 @ =gDispIo
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r1, r6, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08011898 @ =0x0000FFE0
	ldrh r2, [r6, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801189C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #0x3c]
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_80780E0
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080118A0 @ =HBlank_Scanline_8078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r0, [r6, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, #0x14]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	movs r0, #7
	bl EnableBgSync
	str r4, [r5, #0x30]
	ldr r0, _080118A4 @ =BmBgfxConf_08DBA258
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011894: .4byte gDispIo
_08011898: .4byte 0x0000FFE0
_0801189C: .4byte 0x0000E0FF
_080118A0: .4byte HBlank_Scanline_8078098
_080118A4: .4byte BmBgfxConf_08DBA258

	thumb_func_start sub_80118A8
sub_80118A8: @ 0x080118A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	asrs r4, r0, #1
	ldr r2, _080118D8 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r3, r2, #0
	cmp r4, #6
	bgt _080118DC
	movs r0, #0x10
	subs r1, r0, r4
	b _080118DE
	.align 2, 0
_080118D8: .4byte gDispIo
_080118DC:
	movs r1, #0xa
_080118DE:
	adds r0, r3, #0
	adds r0, #0x45
	movs r3, #0
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x46
	strb r3, [r0]
	cmp r4, #0x10
	bne _080118F8
	str r3, [r5, #0x30]
	adds r0, r5, #0
	bl Proc_Break
_080118F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8011900
sub_8011900: @ 0x08011900
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	asrs r4, r0, #1
	ldr r3, _08011950 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xa
	cmp r0, #0x10
	ble _08011932
	movs r0, #0x10
_08011932:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	cmp r4, #0x10
	bne _08011948
	adds r0, r5, #0
	bl Proc_Break
_08011948:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011950: .4byte gDispIo

	thumb_func_start sub_8011954
sub_8011954: @ 0x08011954
	push {lr}
	ldr r0, _080119BC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _080119C0 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x45
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	subs r1, #4
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
	pop {r0}
	bx r0
	.align 2, 0
_080119BC: .4byte gBg2Tm
_080119C0: .4byte gDispIo

	thumb_func_start sub_80119C4
sub_80119C4: @ 0x080119C4
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _080119E4
	ldr r0, _080119E0 @ =gUnk_08C012BC
	bl Proc_StartBlocking
	movs r0, #2
	b _080119E6
	.align 2, 0
_080119E0: .4byte gUnk_08C012BC
_080119E4:
	movs r0, #0
_080119E6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventE1
EventE1: @ 0x080119EC
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08011A10
	ldr r0, _08011A0C @ =gUnk_08C012BC
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	movs r0, #2
	b _08011A1C
	.align 2, 0
_08011A0C: .4byte gUnk_08C012BC
_08011A10:
	ldr r0, _08011A20 @ =gUnk_08C012BC
	bl Proc_Find
	bl Proc_End
	movs r0, #0
_08011A1C:
	pop {r1}
	bx r1
	.align 2, 0
_08011A20: .4byte gUnk_08C012BC
