	.include "macro.inc"

	.syntax unified

	thumb_func_start InitRamFuncs
InitRamFuncs: @ 0x08004158
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080041D8 @ =ArmCodeEnd
	ldr r1, _080041DC @ =ArmCodeStart
	subs r0, r0, r1
	str r0, [r7]
	ldr r0, _080041DC @ =ArmCodeStart
	ldr r1, _080041E0 @ =0x03002E60
	ldr r2, [r7]
	asrs r3, r2, #0x1f
	lsrs r4, r3, #0x1f
	adds r3, r2, r4
	asrs r2, r3, #1
	lsls r3, r2, #0xb
	lsrs r2, r3, #0xb
	bl CpuSet
	ldr r0, _080041E4 @ =0x03002E50
	ldr r1, _080041E8 @ =DrawGlyph
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080041EC @ =0x03003860
	ldr r1, _080041F0 @ =DecodeString
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080041F4 @ =0x03002840
	ldr r1, _080041F8 @ =PutOamHi
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080041FC @ =0x03003864
	ldr r1, _08004200 @ =PutOamLo
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004204 @ =0x03004070
	ldr r1, _08004208 @ =MapFloodCoreStep
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _0800420C @ =0x03002838
	ldr r1, _08004210 @ =MapFloodCore
	ldr r2, _080041DC @ =ArmCodeStart
	subs r1, r1, r2
	ldr r2, _080041E0 @ =0x03002E60
	adds r1, r2, r1
	str r1, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080041D8: .4byte ArmCodeEnd
_080041DC: .4byte ArmCodeStart
_080041E0: .4byte 0x03002E60
_080041E4: .4byte 0x03002E50
_080041E8: .4byte DrawGlyph
_080041EC: .4byte 0x03003860
_080041F0: .4byte DecodeString
_080041F4: .4byte 0x03002840
_080041F8: .4byte PutOamHi
_080041FC: .4byte 0x03003864
_08004200: .4byte PutOamLo
_08004204: .4byte 0x03004070
_08004208: .4byte MapFloodCoreStep
_0800420C: .4byte 0x03002838
_08004210: .4byte MapFloodCore

	thumb_func_start DrawGlyphRam
DrawGlyphRam: @ 0x08004214
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _0800423C @ =0x03002E50
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800423C: .4byte 0x03002E50

	thumb_func_start DecodeStringRam
DecodeStringRam: @ 0x08004240
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08004260 @ =0x03003860
	ldr r1, [r7, #4]
	ldr r2, [r0]
	ldr r0, [r7]
	bl _call_via_r2
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004260: .4byte 0x03003860

	thumb_func_start PutOamHiRam
PutOamHiRam: @ 0x08004264
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _0800428C @ =0x03002840
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800428C: .4byte 0x03002840

	thumb_func_start PutOamLoRam
PutOamLoRam: @ 0x08004290
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080042B8 @ =0x03003864
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r4, [r0]
	ldr r0, [r7]
	bl _call_via_r4
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042B8: .4byte 0x03003864

	thumb_func_start MapFloodCoreStepRam
MapFloodCoreStepRam: @ 0x080042BC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080042E0 @ =0x03004070
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r3, [r0]
	ldr r0, [r7]
	bl _call_via_r3
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042E0: .4byte 0x03004070

	thumb_func_start MapFloodCoreRam
MapFloodCoreRam: @ 0x080042E4
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080042F8 @ =0x03002838
	ldr r4, [r0]
	bl _call_via_r4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042F8: .4byte 0x03002838
