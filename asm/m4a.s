	.include "macro.inc"

	.syntax unified

	thumb_func_start MidiKey2fr
MidiKey2fr: @ 0x080BEFB0
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r7, r2, #0x18
	cmp r6, #0xb2
	bls _080BEFC4
	movs r6, #0xb2
	movs r7, #0xff
	lsls r7, r7, #0x18
_080BEFC4:
	ldr r3, _080BF00C @ =0x086C45F0
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _080BF010 @ =0x086C46A4
	movs r2, #0xf
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r5, #4
	ldr r5, [r0]
	lsrs r5, r1
	adds r0, r6, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r1, #4
	ldr r0, [r0]
	lsrs r0, r1
	mov r1, ip
	ldr r4, [r1, #4]
	subs r0, r0, r5
	adds r1, r7, #0
	bl MulByQ32
	adds r1, r0, #0
	adds r1, r5, r1
	adds r0, r4, #0
	bl MulByQ32
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BF00C: .4byte 0x086C45F0
_080BF010: .4byte 0x086C46A4

	thumb_func_start DummyFunc
DummyFunc: @ 0x080BF014
	bx lr
	.align 2, 0

	thumb_func_start MPlayContinue
MPlayContinue: @ 0x080BF018
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	ldr r0, _080BF02C @ =0x68736D53
	cmp r3, r0
	bne _080BF02A
	ldr r0, [r2, #4]
	ldr r1, _080BF030 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_080BF02A:
	bx lr
	.align 2, 0
_080BF02C: .4byte 0x68736D53
_080BF030: .4byte 0x7FFFFFFF

	thumb_func_start MPlayFadeOut
MPlayFadeOut: @ 0x080BF034
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080BF050 @ =0x68736D53
	cmp r3, r0
	bne _080BF04C
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x28]
_080BF04C:
	bx lr
	.align 2, 0
_080BF050: .4byte 0x68736D53

	thumb_func_start m4aSoundInit
m4aSoundInit: @ 0x080BF054
	push {r4, r5, r6, lr}
	ldr r0, _080BF0A8 @ =SoundMainRAM
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _080BF0AC @ =0x03002378
	ldr r2, _080BF0B0 @ =0x04000100
	bl CpuSet
	ldr r0, _080BF0B4 @ =0x03004A00
	bl SoundInit_rev01
	ldr r0, _080BF0B8 @ =0x03005B00
	bl MPlayExtender
	ldr r0, _080BF0BC @ =0x0094D700
	bl SoundMode_rev01
	ldr r0, _080BF0C0 @ =0x00000009
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080BF0A2
	ldr r5, _080BF0C4 @ =0x086EA858
	adds r6, r0, #0
_080BF086:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	bl MPlayOpen_rev01
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _080BF0C8 @ =0x03005D00
	str r0, [r4, #0x18]
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bne _080BF086
_080BF0A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF0A8: .4byte SoundMainRAM
_080BF0AC: .4byte 0x03002378
_080BF0B0: .4byte 0x04000100
_080BF0B4: .4byte 0x03004A00
_080BF0B8: .4byte 0x03005B00
_080BF0BC: .4byte 0x0094D700
_080BF0C0: .4byte 0x00000009
_080BF0C4: .4byte 0x086EA858
_080BF0C8: .4byte 0x03005D00

	thumb_func_start m4aSoundMain
m4aSoundMain: @ 0x080BF0CC
	push {lr}
	bl SoundMain
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aSongNumStart
m4aSongNumStart: @ 0x080BF0D8
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080BF0FC @ =0x086EA858
	ldr r1, _080BF100 @ =0x086EA8D0
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl MPlayStart_rev01
	pop {r0}
	bx r0
	.align 2, 0
_080BF0FC: .4byte 0x086EA858
_080BF100: .4byte 0x086EA8D0

	thumb_func_start m4aSongNumStartOrChange
m4aSongNumStartOrChange: @ 0x080BF104
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080BF130 @ =0x086EA858
	ldr r1, _080BF134 @ =0x086EA8D0
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _080BF138
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart_rev01
	b _080BF14C
	.align 2, 0
_080BF130: .4byte 0x086EA858
_080BF134: .4byte 0x086EA8D0
_080BF138:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _080BF144
	cmp r2, #0
	bge _080BF14C
_080BF144:
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart_rev01
_080BF14C:
	pop {r0}
	bx r0

	thumb_func_start m4aSongNumStartOrContinue
m4aSongNumStartOrContinue: @ 0x080BF150
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080BF17C @ =0x086EA858
	ldr r1, _080BF180 @ =0x086EA8D0
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _080BF184
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart_rev01
	b _080BF1A0
	.align 2, 0
_080BF17C: .4byte 0x086EA858
_080BF180: .4byte 0x086EA8D0
_080BF184:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _080BF196
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart_rev01
	b _080BF1A0
_080BF196:
	cmp r2, #0
	bge _080BF1A0
	adds r0, r1, #0
	bl MPlayContinue
_080BF1A0:
	pop {r0}
	bx r0

	thumb_func_start m4aSongNumStop
m4aSongNumStop: @ 0x080BF1A4
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080BF1D0 @ =0x086EA858
	ldr r1, _080BF1D4 @ =0x086EA8D0
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _080BF1CA
	adds r0, r2, #0
	bl MPlayStop_rev01
_080BF1CA:
	pop {r0}
	bx r0
	.align 2, 0
_080BF1D0: .4byte 0x086EA858
_080BF1D4: .4byte 0x086EA8D0

	thumb_func_start m4aSongNumContinue
m4aSongNumContinue: @ 0x080BF1D8
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080BF204 @ =0x086EA858
	ldr r1, _080BF208 @ =0x086EA8D0
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _080BF1FE
	adds r0, r2, #0
	bl MPlayContinue
_080BF1FE:
	pop {r0}
	bx r0
	.align 2, 0
_080BF204: .4byte 0x086EA858
_080BF208: .4byte 0x086EA8D0

	thumb_func_start m4aMPlayAllStop
m4aMPlayAllStop: @ 0x080BF20C
	push {r4, r5, lr}
	ldr r0, _080BF230 @ =0x00000009
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080BF22A
	ldr r5, _080BF234 @ =0x086EA858
	adds r4, r0, #0
_080BF21C:
	ldr r0, [r5]
	bl MPlayStop_rev01
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _080BF21C
_080BF22A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF230: .4byte 0x00000009
_080BF234: .4byte 0x086EA858

	thumb_func_start m4aMPlayContinue
m4aMPlayContinue: @ 0x080BF238
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aMPlayAllContinue
m4aMPlayAllContinue: @ 0x080BF244
	push {r4, r5, lr}
	ldr r0, _080BF268 @ =0x00000009
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080BF262
	ldr r5, _080BF26C @ =0x086EA858
	adds r4, r0, #0
_080BF254:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _080BF254
_080BF262:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF268: .4byte 0x00000009
_080BF26C: .4byte 0x086EA858

	thumb_func_start m4aMPlayFadeOut
m4aMPlayFadeOut: @ 0x080BF270
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl MPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aMPlayFadeOutPause
m4aMPlayFadeOutPause: @ 0x080BF280
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080BF298 @ =0x68736D53
	cmp r3, r0
	bne _080BF296
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _080BF29C @ =0x00000101
	strh r0, [r2, #0x28]
_080BF296:
	bx lr
	.align 2, 0
_080BF298: .4byte 0x68736D53
_080BF29C: .4byte 0x00000101

	thumb_func_start m4aMPlayFadeInContinue
m4aMPlayFadeInContinue: @ 0x080BF2A0
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080BF2C0 @ =0x68736D53
	cmp r3, r0
	bne _080BF2BE
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _080BF2C4 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_080BF2BE:
	bx lr
	.align 2, 0
_080BF2C0: .4byte 0x68736D53
_080BF2C4: .4byte 0x7FFFFFFF

	thumb_func_start m4aMPlayImmInit
m4aMPlayImmInit: @ 0x080BF2C8
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _080BF30A
	movs r7, #0x80
_080BF2D4:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080BF302
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080BF302
	adds r0, r4, #0
	bl Clear64byte_rev
	strb r7, [r4]
	movs r0, #2
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_080BF302:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _080BF2D4
_080BF30A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MPlayExtender
MPlayExtender: @ 0x080BF310
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080BF3D8 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _080BF3DC @ =0x04000080
	movs r2, #0
	strh r2, [r3]
	ldr r0, _080BF3E0 @ =0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _080BF3E4 @ =0x03007FF0
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _080BF3E8 @ =0x68736D53
	cmp r6, r0
	bne _080BF3D0
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _080BF3EC @ =0x03005A70
	ldr r0, _080BF3F0 @ =ply_memacc
	str r0, [r1, #0x20]
	ldr r0, _080BF3F4 @ =ply_lfos_rev01
	str r0, [r1, #0x44]
	ldr r0, _080BF3F8 @ =ply_mod_rev01
	str r0, [r1, #0x4c]
	ldr r0, _080BF3FC @ =ply_xcmd
	str r0, [r1, #0x70]
	ldr r0, _080BF400 @ =ply_endtie_rev01
	str r0, [r1, #0x74]
	ldr r0, _080BF404 @ =SampFreqSet_rev01
	str r0, [r1, #0x78]
	ldr r0, _080BF408 @ =TrackStop_rev01
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _080BF40C @ =FadeOutBody_rev01
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _080BF410 @ =TrkVolPitSet_rev01
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _080BF414 @ =CgbSound
	str r0, [r4, #0x28]
	ldr r0, _080BF418 @ =CgbOscOff
	str r0, [r4, #0x2c]
	ldr r0, _080BF41C @ =MidiKey2CgbFr
	str r0, [r4, #0x30]
	ldr r0, _080BF420 @ =0x00000000
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _080BF424 @ =0x05000040
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_080BF3D0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF3D8: .4byte 0x04000084
_080BF3DC: .4byte 0x04000080
_080BF3E0: .4byte 0x04000063
_080BF3E4: .4byte 0x03007FF0
_080BF3E8: .4byte 0x68736D53
_080BF3EC: .4byte 0x03005A70
_080BF3F0: .4byte ply_memacc
_080BF3F4: .4byte ply_lfos_rev01
_080BF3F8: .4byte ply_mod_rev01
_080BF3FC: .4byte ply_xcmd
_080BF400: .4byte ply_endtie_rev01
_080BF404: .4byte SampFreqSet_rev01
_080BF408: .4byte TrackStop_rev01
_080BF40C: .4byte FadeOutBody_rev01
_080BF410: .4byte TrkVolPitSet_rev01
_080BF414: .4byte CgbSound
_080BF418: .4byte CgbOscOff
_080BF41C: .4byte MidiKey2CgbFr
_080BF420: .4byte 0x00000000
_080BF424: .4byte 0x05000040

	thumb_func_start MusicPlayerJumpTableCopy
MusicPlayerJumpTableCopy: @ 0x080BF428
	svc #0x2a
	bx lr

	thumb_func_start ClearChain_rev
ClearChain_rev: @ 0x080BF42C
	push {lr}
	ldr r1, _080BF43C @ =0x03005AF8
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080BF43C: .4byte 0x03005AF8

	thumb_func_start Clear64byte_rev
Clear64byte_rev: @ 0x080BF440
	push {lr}
	ldr r1, _080BF450 @ =0x03005AFC
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080BF450: .4byte 0x03005AFC

	thumb_func_start SoundInit_rev01
SoundInit_rev01: @ 0x080BF454
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _080BF50C @ =0x040000C4
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _080BF470
	ldr r0, _080BF510 @ =0x84400004
	str r0, [r1]
_080BF470:
	ldr r1, _080BF514 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080BF47E
	ldr r0, _080BF510 @ =0x84400004
	str r0, [r1]
_080BF47E:
	ldr r0, _080BF518 @ =0x040000C6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _080BF51C @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _080BF520 @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080BF524 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080BF528 @ =0x040000BC
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080BF52C @ =0x040000A0
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080BF530 @ =0x040000A4
	str r0, [r1]
	ldr r0, _080BF534 @ =0x03007FF0
	str r5, [r0]
	str r3, [sp]
	ldr r2, _080BF538 @ =0x050003EC
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _080BF53C @ =ply_note_rev01
	str r0, [r5, #0x38]
	ldr r0, _080BF540 @ =DummyFunc_rev
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _080BF544 @ =0x03005A70
	adds r0, r4, #0
	bl MPlyJmpTblCopy
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl SampFreqSet_rev01
	ldr r0, _080BF548 @ =0x68736D53
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF50C: .4byte 0x040000C4
_080BF510: .4byte 0x84400004
_080BF514: .4byte 0x040000D0
_080BF518: .4byte 0x040000C6
_080BF51C: .4byte 0x04000084
_080BF520: .4byte 0x0000A90E
_080BF524: .4byte 0x04000089
_080BF528: .4byte 0x040000BC
_080BF52C: .4byte 0x040000A0
_080BF530: .4byte 0x040000A4
_080BF534: .4byte 0x03007FF0
_080BF538: .4byte 0x050003EC
_080BF53C: .4byte ply_note_rev01
_080BF540: .4byte DummyFunc_rev
_080BF544: .4byte 0x03005A70
_080BF548: .4byte 0x68736D53

	thumb_func_start SampFreqSet_rev01
SampFreqSet_rev01: @ 0x080BF54C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _080BF5CC @ =0x03007FF0
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _080BF5D0 @ =0x086C46D4
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl __divsi3
	strb r0, [r4, #0xb]
	ldr r0, _080BF5D4 @ =0x00091D1B
	muls r0, r5, r0
	ldr r1, _080BF5D8 @ =0x00001388
	adds r0, r0, r1
	ldr r1, _080BF5DC @ =0x00002710
	bl __divsi3
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl __divsi3
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _080BF5E0 @ =0x04000102
	strh r6, [r0]
	ldr r4, _080BF5E4 @ =0x04000100
	ldr r0, _080BF5E8 @ =0x00044940
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	bl SoundVSyncOn_rev01
	ldr r1, _080BF5EC @ =0x04000006
_080BF5B0:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _080BF5B0
	ldr r1, _080BF5EC @ =0x04000006
_080BF5B8:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _080BF5B8
	ldr r1, _080BF5E0 @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF5CC: .4byte 0x03007FF0
_080BF5D0: .4byte 0x086C46D4
_080BF5D4: .4byte 0x00091D1B
_080BF5D8: .4byte 0x00001388
_080BF5DC: .4byte 0x00002710
_080BF5E0: .4byte 0x04000102
_080BF5E4: .4byte 0x04000100
_080BF5E8: .4byte 0x00044940
_080BF5EC: .4byte 0x04000006

	thumb_func_start SoundMode_rev01
SoundMode_rev01: @ 0x080BF5F0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _080BF67C @ =0x03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _080BF680 @ =0x68736D53
	cmp r1, r0
	bne _080BF676
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _080BF612
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_080BF612:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _080BF632
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_080BF628:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _080BF628
_080BF632:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _080BF640
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_080BF640:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _080BF65E
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _080BF684 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_080BF65E:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _080BF672
	bl SoundVSyncOff_rev01
	adds r0, r4, #0
	bl SampFreqSet_rev01
_080BF672:
	ldr r0, _080BF680 @ =0x68736D53
	str r0, [r5]
_080BF676:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF67C: .4byte 0x03007FF0
_080BF680: .4byte 0x68736D53
_080BF684: .4byte 0x04000089

	thumb_func_start SoundClear_rev01
SoundClear_rev01: @ 0x080BF688
	push {r4, r5, r6, r7, lr}
	ldr r0, _080BF6D4 @ =0x03007FF0
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _080BF6D8 @ =0x68736D53
	cmp r1, r0
	bne _080BF6CE
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_080BF6A2:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _080BF6A2
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _080BF6CA
	movs r5, #1
	movs r7, #0
_080BF6B6:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl _call_via_r1
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _080BF6B6
_080BF6CA:
	ldr r0, _080BF6D8 @ =0x68736D53
	str r0, [r6]
_080BF6CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF6D4: .4byte 0x03007FF0
_080BF6D8: .4byte 0x68736D53

	thumb_func_start SoundVSyncOff_rev01
SoundVSyncOff_rev01: @ 0x080BF6DC
	push {lr}
	sub sp, #4
	ldr r0, _080BF73C @ =0x03007FF0
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _080BF740 @ =0x978C92AD
	adds r0, r1, r3
	cmp r0, #1
	bhi _080BF734
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _080BF744 @ =0x040000C4
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _080BF706
	ldr r0, _080BF748 @ =0x84400004
	str r0, [r1]
_080BF706:
	ldr r1, _080BF74C @ =0x040000D0
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _080BF714
	ldr r0, _080BF748 @ =0x84400004
	str r0, [r1]
_080BF714:
	ldr r0, _080BF750 @ =0x040000C6
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r2, _080BF754 @ =0x05000318
	mov r0, sp
	bl CpuSet
_080BF734:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BF73C: .4byte 0x03007FF0
_080BF740: .4byte 0x978C92AD
_080BF744: .4byte 0x040000C4
_080BF748: .4byte 0x84400004
_080BF74C: .4byte 0x040000D0
_080BF750: .4byte 0x040000C6
_080BF754: .4byte 0x05000318

	thumb_func_start SoundVSyncOn_rev01
SoundVSyncOn_rev01: @ 0x080BF758
	push {r4, lr}
	ldr r0, _080BF788 @ =0x03007FF0
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _080BF78C @ =0x68736D53
	cmp r3, r0
	beq _080BF780
	ldr r0, _080BF790 @ =0x040000C6
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r1, r4, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldrb r0, [r2, #4]
	movs r0, #0
	strb r0, [r2, #4]
	adds r0, r3, #0
	subs r0, #0xa
	str r0, [r2]
_080BF780:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF788: .4byte 0x03007FF0
_080BF78C: .4byte 0x68736D53
_080BF790: .4byte 0x040000C6

	thumb_func_start MPlayOpen_rev01
MPlayOpen_rev01: @ 0x080BF794
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _080BF7F8
	cmp r4, #0x10
	bls _080BF7A8
	movs r4, #0x10
_080BF7A8:
	ldr r0, _080BF800 @ =0x03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _080BF804 @ =0x68736D53
	cmp r1, r0
	bne _080BF7F8
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl Clear64byte_rev
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _080BF7DC
	movs r1, #0
_080BF7CE:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _080BF7CE
_080BF7DC:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _080BF7EC
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_080BF7EC:
	str r7, [r5, #0x24]
	ldr r0, _080BF808 @ =MPlayMain_rev01
	str r0, [r5, #0x20]
	ldr r0, _080BF804 @ =0x68736D53
	str r0, [r5]
	str r0, [r7, #0x34]
_080BF7F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF800: .4byte 0x03007FF0
_080BF804: .4byte 0x68736D53
_080BF808: .4byte MPlayMain_rev01

	thumb_func_start MPlayStart_rev01
MPlayStart_rev01: @ 0x080BF80C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _080BF8EC @ =0x68736D53
	cmp r1, r0
	bne _080BF8E2
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _080BF84E
	ldr r0, [r5]
	cmp r0, #0
	beq _080BF838
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080BF844
_080BF838:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _080BF84E
	cmp r1, #0
	blt _080BF84E
_080BF844:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _080BF8E2
_080BF84E:
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0
	str r1, [r5, #4]
	str r7, [r5]
	ldr r0, [r7, #4]
	str r0, [r5, #0x30]
	strb r2, [r5, #9]
	str r1, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x20]
	adds r0, #0x6a
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r6, #0
	ldr r4, [r5, #0x2c]
	ldrb r1, [r7]
	cmp r6, r1
	bge _080BF8AE
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _080BF8CE
	mov r8, r6
_080BF882:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop_rev01
	movs r0, #0xc0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, #0x20]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x40]
	adds r6, #1
	adds r4, #0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _080BF8AE
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _080BF882
_080BF8AE:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _080BF8CE
	movs r1, #0
	mov r8, r1
_080BF8B8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop_rev01
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _080BF8B8
_080BF8CE:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _080BF8DE
	ldrb r0, [r7, #3]
	bl SoundMode_rev01
_080BF8DE:
	ldr r0, _080BF8EC @ =0x68736D53
	str r0, [r5, #0x34]
_080BF8E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF8EC: .4byte 0x68736D53

	thumb_func_start MPlayStop_rev01
MPlayStop_rev01: @ 0x080BF8F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _080BF92C @ =0x68736D53
	cmp r1, r0
	bne _080BF926
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r6, #4]
	ldrb r4, [r6, #8]
	ldr r5, [r6, #0x2c]
	cmp r4, #0
	ble _080BF922
_080BF912:
	adds r0, r6, #0
	adds r1, r5, #0
	bl TrackStop_rev01
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _080BF912
_080BF922:
	ldr r0, _080BF92C @ =0x68736D53
	str r0, [r6, #0x34]
_080BF926:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF92C: .4byte 0x68736D53

	thumb_func_start FadeOutBody_rev01
FadeOutBody_rev01: @ 0x080BF930
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _080BF9F2
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _080BF970 @ =0x0000FFFF
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080BF9F2
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BF974
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _080BF9C6
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _080BF9C6
	.align 2, 0
_080BF970: .4byte 0x0000FFFF
_080BF974:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080BF9C6
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _080BF9A6
_080BF98A:
	adds r0, r6, #0
	adds r1, r4, #0
	bl TrackStop_rev01
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _080BF99E
	strb r0, [r4]
_080BF99E:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _080BF98A
_080BF9A6:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _080BF9BA
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _080BF9BE
_080BF9BA:
	movs r0, #0x80
	lsls r0, r0, #0x18
_080BF9BE:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _080BF9F2
_080BF9C6:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _080BF9F2
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_080BF9D4:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080BF9EA
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_080BF9EA:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _080BF9D4
_080BF9F2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TrkVolPitSet_rev01
TrkVolPitSet_rev01: @ 0x080BF9F8
	push {r4, lr}
	adds r2, r1, #0
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _080BFA5C
	ldrb r3, [r2, #0x13]
	ldrb r1, [r2, #0x12]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r3, r0, #5
	ldrb r4, [r2, #0x18]
	cmp r4, #1
	bne _080BFA20
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r3, r0, #7
_080BFA20:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, #2
	bne _080BFA36
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
_080BFA36:
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080BFA42
	adds r1, r0, #0
	b _080BFA48
_080BFA42:
	cmp r1, #0x7f
	ble _080BFA48
	movs r1, #0x7f
_080BFA48:
	adds r0, r1, #0
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x10]
	movs r0, #0x7f
	subs r0, r0, r1
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x11]
_080BFA5C:
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _080BFAA0
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xf]
	muls r0, r1, r0
	movs r1, #0xc
	ldrsb r1, [r2, r1]
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #0xd]
	adds r1, r0, r1
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _080BFA9A
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	adds r1, r1, r0
_080BFA9A:
	asrs r0, r1, #8
	strb r0, [r2, #8]
	strb r1, [r2, #9]
_080BFAA0:
	movs r0, #0xfa
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MidiKey2CgbFr
MidiKey2CgbFr: @ 0x080BFAAC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _080BFAE4
	cmp r5, #0x14
	bhi _080BFAC8
	movs r5, #0
	b _080BFAD6
_080BFAC8:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _080BFAD6
	movs r5, #0x3b
_080BFAD6:
	ldr r0, _080BFAE0 @ =0x086C4788
	adds r0, r5, r0
	ldrb r0, [r0]
	b _080BFB46
	.align 2, 0
_080BFAE0: .4byte 0x086C4788
_080BFAE4:
	cmp r5, #0x23
	bhi _080BFAF0
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _080BFB02
_080BFAF0:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _080BFB02
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_080BFB02:
	ldr r3, _080BFB4C @ =0x086C46EC
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _080BFB50 @ =0x086C4770
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_080BFB46:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BFB4C: .4byte 0x086C46EC
_080BFB50: .4byte 0x086C4770

	thumb_func_start CgbOscOff
CgbOscOff: @ 0x080BFB54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _080BFB7C
	cmp r0, #2
	bgt _080BFB68
	cmp r0, #1
	beq _080BFB6E
	b _080BFB90
_080BFB68:
	cmp r1, #3
	beq _080BFB84
	b _080BFB90
_080BFB6E:
	ldr r1, _080BFB78 @ =0x04000063
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _080BFB98
	.align 2, 0
_080BFB78: .4byte 0x04000063
_080BFB7C:
	ldr r1, _080BFB80 @ =0x04000069
	b _080BFB92
	.align 2, 0
_080BFB80: .4byte 0x04000069
_080BFB84:
	ldr r1, _080BFB8C @ =0x04000070
	movs r0, #0
	b _080BFB9A
	.align 2, 0
_080BFB8C: .4byte 0x04000070
_080BFB90:
	ldr r1, _080BFBA0 @ =0x04000079
_080BFB92:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_080BFB98:
	movs r0, #0x80
_080BFB9A:
	strb r0, [r1]
	bx lr
	.align 2, 0
_080BFBA0: .4byte 0x04000079

	thumb_func_start CgbModVol
CgbModVol: @ 0x080BFBA4
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	lsls r2, r0, #0x18
	lsrs r4, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _080BFBC4
	lsrs r0, r2, #0x19
	cmp r0, r3
	blo _080BFBD0
	movs r0, #0xf
	strb r0, [r1, #0x1b]
	b _080BFBDE
_080BFBC4:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _080BFBD0
	movs r0, #0xf0
	strb r0, [r1, #0x1b]
	b _080BFBDE
_080BFBD0:
	movs r0, #0xff
	strb r0, [r1, #0x1b]
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	b _080BFBEE
_080BFBDE:
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	strb r0, [r1, #0xa]
	cmp r0, #0xf
	bls _080BFBF0
	movs r0, #0xf
_080BFBEE:
	strb r0, [r1, #0xa]
_080BFBF0:
	ldrb r2, [r1, #6]
	ldrb r3, [r1, #0xa]
	adds r0, r2, #0
	muls r0, r3, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r1, #0x19]
	ldrb r0, [r1, #0x1c]
	ldrb r2, [r1, #0x1b]
	ands r0, r2
	strb r0, [r1, #0x1b]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CgbSound
CgbSound: @ 0x080BFC0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _080BFC2C @ =0x03007FF0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _080BFC30
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _080BFC36
	.align 2, 0
_080BFC2C: .4byte 0x03007FF0
_080BFC30:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_080BFC36:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_080BFC3C:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _080BFC52
	b _080C003C
_080BFC52:
	cmp r6, #2
	beq _080BFC84
	cmp r6, #2
	bgt _080BFC60
	cmp r6, #1
	beq _080BFC66
	b _080BFCBC
_080BFC60:
	cmp r6, #3
	beq _080BFC9C
	b _080BFCBC
_080BFC66:
	ldr r0, _080BFC78 @ =0x04000060
	str r0, [sp, #8]
	ldr r7, _080BFC7C @ =0x04000062
	ldr r2, _080BFC80 @ =0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080BFCCC
	.align 2, 0
_080BFC78: .4byte 0x04000060
_080BFC7C: .4byte 0x04000062
_080BFC80: .4byte 0x04000063
_080BFC84:
	ldr r0, _080BFC90 @ =0x04000061
	str r0, [sp, #8]
	ldr r7, _080BFC94 @ =0x04000068
	ldr r2, _080BFC98 @ =0x04000069
	b _080BFCC4
	.align 2, 0
_080BFC90: .4byte 0x04000061
_080BFC94: .4byte 0x04000068
_080BFC98: .4byte 0x04000069
_080BFC9C:
	ldr r0, _080BFCB0 @ =0x04000070
	str r0, [sp, #8]
	ldr r7, _080BFCB4 @ =0x04000072
	ldr r2, _080BFCB8 @ =0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080BFCCC
	.align 2, 0
_080BFCB0: .4byte 0x04000070
_080BFCB4: .4byte 0x04000072
_080BFCB8: .4byte 0x04000073
_080BFCBC:
	ldr r0, _080BFD1C @ =0x04000071
	str r0, [sp, #8]
	ldr r7, _080BFD20 @ =0x04000078
	ldr r2, _080BFD24 @ =0x04000079
_080BFCC4:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_080BFCCC:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080BFDC2
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _080BFDE6
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl CgbModVol
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _080BFD34
	cmp r6, #2
	bgt _080BFD28
	cmp r6, #1
	beq _080BFD2E
	b _080BFD88
	.align 2, 0
_080BFD1C: .4byte 0x04000071
_080BFD20: .4byte 0x04000078
_080BFD24: .4byte 0x04000079
_080BFD28:
	cmp r6, #3
	beq _080BFD40
	b _080BFD88
_080BFD2E:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_080BFD34:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _080BFD94
_080BFD40:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _080BFD68
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _080BFD7C @ =0x04000090
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_080BFD68:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080BFD80
	movs r0, #0xc0
	b _080BFDA2
	.align 2, 0
_080BFD7C: .4byte 0x04000090
_080BFD80:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _080BFDA4
_080BFD88:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_080BFD94:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080BFDA2
	movs r0, #0x40
_080BFDA2:
	strb r0, [r4, #0x1a]
_080BFDA4:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _080BFDBE
	b _080BFEFA
_080BFDBE:
	strb r2, [r4, #9]
	b _080BFF28
_080BFDC2:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080BFDF4
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _080BFDE6
	b _080BFF3A
_080BFDE6:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _080C0038
_080BFDF4:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _080BFE34
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080BFE34
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080BFE66
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080BFF28
	ldrb r2, [r4, #7]
	mov r8, r2
	b _080BFF28
_080BFE34:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _080BFF28
	cmp r6, #3
	bne _080BFE46
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_080BFE46:
	adds r0, r4, #0
	bl CgbModVol
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _080BFE9A
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080BFE96
_080BFE66:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BFDE6
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080BFF3A
	movs r2, #8
	mov r8, r2
	b _080BFF3A
_080BFE96:
	ldrb r0, [r4, #7]
	b _080BFF26
_080BFE9A:
	cmp r0, #1
	bne _080BFEA6
_080BFE9E:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _080BFF26
_080BFEA6:
	cmp r0, #2
	bne _080BFEEA
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _080BFEE6
_080BFEBE:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _080BFECE
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _080BFE66
_080BFECE:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080BFE9E
	movs r0, #8
	mov r8, r0
	b _080BFE9E
_080BFEE6:
	ldrb r0, [r4, #5]
	b _080BFF26
_080BFEEA:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _080BFF24
_080BFEFA:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080BFEBE
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _080BFF28
	ldrb r2, [r4, #5]
	mov r8, r2
	b _080BFF28
_080BFF24:
	ldrb r0, [r4, #4]
_080BFF26:
	strb r0, [r4, #0xb]
_080BFF28:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _080BFF3A
	subs r0, #1
	str r0, [sp]
	b _080BFE34
_080BFF3A:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _080BFFB2
	cmp r6, #3
	bgt _080BFF7A
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _080BFF7A
	ldr r0, _080BFF64 @ =0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _080BFF6C
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _080BFF68 @ =0x000007FC
	b _080BFF76
	.align 2, 0
_080BFF64: .4byte 0x04000089
_080BFF68: .4byte 0x000007FC
_080BFF6C:
	cmp r0, #0x7f
	bgt _080BFF7A
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _080BFF88 @ =0x000007FE
_080BFF76:
	ands r0, r1
	str r0, [r4, #0x20]
_080BFF7A:
	cmp r6, #4
	beq _080BFF8C
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _080BFF9A
	.align 2, 0
_080BFF88: .4byte 0x000007FE
_080BFF8C:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_080BFF9A:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080BFFB2:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _080C0038
	ldr r1, _080BFFFC @ =0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _080C0004
	ldr r0, _080C0000 @ =0x086C47C4
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _080C0038
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _080C0038
	.align 2, 0
_080BFFFC: .4byte 0x04000081
_080C0000: .4byte 0x086C47C4
_080C0004:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _080C0038
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080C0038
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080C0038:
	movs r0, #0
	strb r0, [r4, #0x1d]
_080C003C:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _080C0046
	b _080BFC3C
_080C0046:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MPlayTempoControl
MPlayTempoControl: @ 0x080C0058
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080C007C @ =0x68736D53
	cmp r3, r0
	bne _080C0074
	strh r1, [r2, #0x1e]
	ldrh r4, [r2, #0x1c]
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x20]
_080C0074:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C007C: .4byte 0x68736D53

	thumb_func_start MPlayVolumeControl
MPlayVolumeControl: @ 0x080C0080
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _080C00E4 @ =0x68736D53
	cmp r3, r0
	bne _080C00D8
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _080C00D4
	movs r0, #0x80
	mov r8, r0
	lsrs r6, r6, #0x12
	movs r0, #3
	mov ip, r0
_080C00B0:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _080C00CA
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _080C00CA
	strb r6, [r1, #0x13]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_080C00CA:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080C00B0
_080C00D4:
	ldr r0, _080C00E4 @ =0x68736D53
	str r0, [r4, #0x34]
_080C00D8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C00E4: .4byte 0x68736D53

	thumb_func_start MPlayPitchControl
MPlayPitchControl: @ 0x080C00E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _080C0158 @ =0x68736D53
	cmp r3, r0
	bne _080C014A
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r3, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _080C0146
	movs r0, #0x80
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r7, r0, #0x18
	movs r0, #0xc
	mov r8, r0
_080C0120:
	mov r0, ip
	ands r0, r5
	cmp r0, #0
	beq _080C013C
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _080C013C
	strb r7, [r3, #0xb]
	strb r6, [r3, #0xd]
	mov r0, r8
	orrs r0, r1
	strb r0, [r3]
_080C013C:
	subs r2, #1
	adds r3, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080C0120
_080C0146:
	ldr r0, _080C0158 @ =0x68736D53
	str r0, [r4, #0x34]
_080C014A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0158: .4byte 0x68736D53

	thumb_func_start MPlayPanpotControl
MPlayPanpotControl: @ 0x080C015C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r3, [r4, #0x34]
	ldr r0, _080C01C0 @ =0x68736D53
	cmp r3, r0
	bne _080C01B4
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _080C01B0
	movs r0, #0x80
	mov r8, r0
	movs r0, #3
	mov ip, r0
_080C018C:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _080C01A6
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _080C01A6
	strb r6, [r1, #0x15]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_080C01A6:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080C018C
_080C01B0:
	ldr r0, _080C01C0 @ =0x68736D53
	str r0, [r4, #0x34]
_080C01B4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C01C0: .4byte 0x68736D53

	thumb_func_start MP_clear_modM
MP_clear_modM: @ 0x080C01C4
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _080C01D8
	movs r0, #0xc
	b _080C01DA
_080C01D8:
	movs r0, #3
_080C01DA:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start MPlayModDepthSet
MPlayModDepthSet: @ 0x080C01E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _080C0254 @ =0x68736D53
	cmp r1, r0
	bne _080C0244
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _080C0240
	mov sb, r8
_080C0214:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _080C0236
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080C0236
	mov r0, r8
	strb r0, [r4, #0x17]
	mov r1, sb
	cmp r1, #0
	bne _080C0236
	adds r0, r4, #0
	bl MP_clear_modM
_080C0236:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _080C0214
_080C0240:
	ldr r0, _080C0254 @ =0x68736D53
	str r0, [r6, #0x34]
_080C0244:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0254: .4byte 0x68736D53

	thumb_func_start MPlayLFOSpeedSet
MPlayLFOSpeedSet: @ 0x080C0258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _080C02C8 @ =0x68736D53
	cmp r1, r0
	bne _080C02B8
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _080C02B4
	mov sb, r8
_080C0288:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _080C02AA
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080C02AA
	mov r0, r8
	strb r0, [r4, #0x19]
	mov r1, sb
	cmp r1, #0
	bne _080C02AA
	adds r0, r4, #0
	bl MP_clear_modM
_080C02AA:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _080C0288
_080C02B4:
	ldr r0, _080C02C8 @ =0x68736D53
	str r0, [r6, #0x34]
_080C02B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C02C8: .4byte 0x68736D53

	thumb_func_start ply_memacc
ply_memacc: @ 0x080C02CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _080C02F0
	b _080C041E
_080C02F0:
	lsls r0, r5, #2
	ldr r1, _080C02FC @ =_080C0300
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C02FC: .4byte _080C0300
_080C0300: @ jump table
	.4byte _080C0348 @ case 0
	.4byte _080C034C @ case 1
	.4byte _080C0354 @ case 2
	.4byte _080C035C @ case 3
	.4byte _080C0366 @ case 4
	.4byte _080C0374 @ case 5
	.4byte _080C0382 @ case 6
	.4byte _080C038A @ case 7
	.4byte _080C0392 @ case 8
	.4byte _080C039A @ case 9
	.4byte _080C03A2 @ case 10
	.4byte _080C03AA @ case 11
	.4byte _080C03B2 @ case 12
	.4byte _080C03C0 @ case 13
	.4byte _080C03CE @ case 14
	.4byte _080C03DC @ case 15
	.4byte _080C03EA @ case 16
	.4byte _080C03F8 @ case 17
_080C0348:
	strb r2, [r3]
	b _080C041E
_080C034C:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _080C041E
_080C0354:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _080C041E
_080C035C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _080C041E
_080C0366:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _080C041E
_080C0374:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _080C041E
_080C0382:
	ldrb r3, [r3]
	cmp r3, r2
	beq _080C0404
	b _080C0418
_080C038A:
	ldrb r3, [r3]
	cmp r3, r2
	bne _080C0404
	b _080C0418
_080C0392:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _080C0404
	b _080C0418
_080C039A:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _080C0404
	b _080C0418
_080C03A2:
	ldrb r3, [r3]
	cmp r3, r2
	bls _080C0404
	b _080C0418
_080C03AA:
	ldrb r3, [r3]
	cmp r3, r2
	blo _080C0404
	b _080C0418
_080C03B2:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _080C0404
	b _080C0418
_080C03C0:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _080C0404
	b _080C0418
_080C03CE:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _080C0404
	b _080C0418
_080C03DC:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080C0404
	b _080C0418
_080C03EA:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _080C0404
	b _080C0418
_080C03F8:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080C0418
_080C0404:
	ldr r0, _080C0414 @ =0x03005A74
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r2
	b _080C041E
	.align 2, 0
_080C0414: .4byte 0x03005A74
_080C0418:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_080C041E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ply_xcmd
ply_xcmd: @ 0x080C0424
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _080C0440 @ =0x086C4808
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080C0440: .4byte 0x086C4808

	thumb_func_start ply_xxx
ply_xxx: @ 0x080C0444
	push {lr}
	ldr r2, _080C0454 @ =0x03005A70
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080C0454: .4byte 0x03005A70

	thumb_func_start ply_xwave
ply_xwave: @ 0x080C0458
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _080C0490 @ =0xFFFFFF00
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _080C0494 @ =0xFFFF00FF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _080C0498 @ =0xFF00FFFF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _080C049C @ =0x00FFFFFF
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0490: .4byte 0xFFFFFF00
_080C0494: .4byte 0xFFFF00FF
_080C0498: .4byte 0xFF00FFFF
_080C049C: .4byte 0x00FFFFFF

	thumb_func_start ply_xtype
ply_xtype: @ 0x080C04A0
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xatta
ply_xatta: @ 0x080C04B4
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xdeca
ply_xdeca: @ 0x080C04C8
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xsust
ply_xsust: @ 0x080C04DC
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xrele
ply_xrele: @ 0x080C04F0
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xiecv
ply_xiecv: @ 0x080C0504
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start ply_xiecl
ply_xiecl: @ 0x080C0510
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start ply_xleng
ply_xleng: @ 0x080C051C
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xswee
ply_xswee: @ 0x080C0530
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x27
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start DummyFunc_rev
DummyFunc_rev: @ 0x080C0544
	bx lr
	.align 2, 0
