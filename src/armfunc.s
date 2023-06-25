	.include "macro.inc"

	.text

	.global ArmCodeStart
	.type ArmCodeStart, object
ArmCodeStart:

	.syntax unified
	.arm

.LPal: .4byte gPaletteBuffer
.LFadeComponents: .4byte 0x02022260
.LFadeComponentStep: .4byte 0x02022240

	function ColorFadeTick
ColorFadeTick:
	push {r4, r5, r6, r7}
	mov r7, #0x3e0

.Lpal_loop:
	ldr r0, .LFadeComponentStep @ =0x02022240
	add r0, r0, r7, lsr #5
	ldrsb r5, [r0]
	tst r5, r5
	beq .Lpal_loop_continue
	ldr r4, .LFadeComponents @ =0x02022260
	lsr r0, r7, #1
	add r0, r0, r0, lsl #1
	add r0, r0, #0x30
	add r4, r4, r0
	mov r6, #0x1e
.Lcolor_loop:
	sub r4, r4, #3
	ldrb r0, [r4]
	add r0, r0, r5
	strb r0, [r4]
	subs r0, r0, #0x20
	bpl 1f
	mov r0, #0
1:
	cmp r0, #0x20
	blo 1f
	mov r0, #0x1f
1:
	ldrb r1, [r4, #1]
	add r1, r1, r5
	strb r1, [r4, #1]
	subs r1, r1, #0x20
	bpl 1f
	mov r1, #0
1:
	cmp r1, #0x20
	blo 1f
	mov r1, #0x1f
1:
	ldrb r2, [r4, #2]
	add r2, r2, r5
	strb r2, [r4, #2]
	subs r2, r2, #0x20
	bpl 1f
	mov r2, #0
1:
	cmp r2, #0x20
	blo 1f
	mov r2, #0x1f
1:
	add r0, r0, r1, lsl #5
	add r0, r0, r2, lsl #10
	ldr r1, .LPal @ =gPaletteBuffer
	add r1, r1, r6
	strh r0, [r1, r7]
	subs r6, r6, #2
	bpl .Lcolor_loop
.Lpal_loop_continue:
	subs r7, r7, #0x20
	bpl .Lpal_loop
	pop {r4, r5, r6, r7}
	bx lr

	endfunction ColorFadeTick

	function ClearOam
ClearOam:
	lsr r1, r1, #4
	sub r1, r1, #1
	mov r2, #0xa0
_08000310:
	str r2, [r0]
	str r2, [r0, #8]
	str r2, [r0, #0x10]
	str r2, [r0, #0x18]
	str r2, [r0, #0x20]
	str r2, [r0, #0x28]
	str r2, [r0, #0x30]
	str r2, [r0, #0x38]
	str r2, [r0, #0x40]
	str r2, [r0, #0x48]
	str r2, [r0, #0x50]
	str r2, [r0, #0x58]
	str r2, [r0, #0x60]
	str r2, [r0, #0x68]
	str r2, [r0, #0x70]
	str r2, [r0, #0x78]
	add r0, r0, #0x80
	subs r1, r1, #1
	bpl _08000310
	bx lr
	endfunction ClearOam
