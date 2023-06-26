	.include "macro.inc"
	.syntax unified

	thumb_func_start RefreshKeySt
RefreshKeySt: @ 0x08001BA0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001BEC @ =0x04000130
	ldrh r1, [r0]
	mvns r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0xf
	beq _08001BD4
	ldr r0, _08001BF0 @ =0x0300000E
	ldrh r1, [r0]
	mvns r0, r1
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r7, #4]
_08001BD4:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	ldr r0, [r7]
	bl RefreshKeyStFromKeys
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001BEC: .4byte 0x04000130
_08001BF0: .4byte 0x0300000E

	thumb_func_start ClearKeySt
ClearKeySt: @ 0x08001BF4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #6]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start InitKeySt
InitKeySt: @ 0x08001C28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #1]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #2]
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	ldr r0, _08001CA4 @ =0x0300000E
	movs r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CA4: .4byte 0x0300000E

	thumb_func_start sub_08001CA8
sub_08001CA8: @ 0x08001CA8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001CC0 @ =0x0300000E
	ldr r1, [r7]
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CC0: .4byte 0x0300000E

	thumb_func_start sub_08001CC4
sub_08001CC4: @ 0x08001CC4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08001D28 @ =gpKeySt
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r1, _08001D28 @ =gpKeySt
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _08001D28 @ =gpKeySt
	ldr r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001D28: .4byte gpKeySt

	thumb_func_start sub_08001D2C
sub_08001D2C: @ 0x08001D2C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08001D60 @ =0x08BBFC80
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Start
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001D60: .4byte 0x08BBFC80

	thumb_func_start SetBgOffset
SetBgOffset: @ 0x08001D64
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	adds r3, r0, #0
	adds r0, r2, #0
	adds r2, r7, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	cmp r0, #1
	beq _08001DC8
	cmp r0, #1
	bgt _08001D8C
	cmp r0, #0
	beq _08001D96
	b _08001E64
_08001D8C:
	cmp r0, #2
	beq _08001DFC
	cmp r0, #3
	beq _08001E30
	b _08001E64
_08001D96:
	ldr r0, _08001DC4 @ =gDispIo
	adds r1, r7, #2
	ldrh r2, [r0, #0x1c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x1c]
	ldr r0, _08001DC4 @ =gDispIo
	adds r1, r7, #4
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x1e]
	b _08001E64
	.align 2, 0
_08001DC4: .4byte gDispIo
_08001DC8:
	ldr r0, _08001DF8 @ =gDispIo
	adds r1, r7, #2
	ldrh r2, [r0, #0x20]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x20]
	ldr r0, _08001DF8 @ =gDispIo
	adds r1, r7, #4
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	b _08001E64
	.align 2, 0
_08001DF8: .4byte gDispIo
_08001DFC:
	ldr r0, _08001E2C @ =gDispIo
	adds r1, r7, #2
	ldrh r2, [r0, #0x24]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x24]
	ldr r0, _08001E2C @ =gDispIo
	adds r1, r7, #4
	ldrh r2, [r0, #0x26]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x26]
	b _08001E64
	.align 2, 0
_08001E2C: .4byte gDispIo
_08001E30:
	ldr r0, _08001E60 @ =gDispIo
	adds r1, r7, #2
	ldrh r2, [r0, #0x28]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x28]
	ldr r0, _08001E60 @ =gDispIo
	adds r1, r7, #4
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x2a]
	b _08001E64
	.align 2, 0
_08001E60: .4byte gDispIo
_08001E64:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08001E6C
sub_08001E6C: @ 0x08001E6C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001E94 @ =0x03000014
	ldr r1, _08001E98 @ =0x03000015
	movs r2, #0
	strb r2, [r1]
	movs r1, #0
	strb r1, [r0]
	ldr r1, _08001E9C @ =gBg0Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001E94: .4byte 0x03000014
_08001E98: .4byte 0x03000015
_08001E9C: .4byte gBg0Tm

	thumb_func_start sub_08001EA0
sub_08001EA0: @ 0x08001EA0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r7, #0
	strb r2, [r1]
	adds r1, r7, #1
	strb r0, [r1]
	ldr r0, _08001ECC @ =0x03000014
	adds r1, r7, #0
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, _08001ED0 @ =0x03000015
	adds r1, r7, #1
	ldrb r2, [r1]
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001ECC: .4byte 0x03000014
_08001ED0: .4byte 0x03000015

	thumb_func_start sub_08001ED4
sub_08001ED4: @ 0x08001ED4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08001EEC @ =0x0000027F
	str r0, [r7, #8]
_08001EE2:
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _08001EF0
	b _08001F0A
	.align 2, 0
_08001EEC: .4byte 0x0000027F
_08001EF0:
	ldr r0, [r7]
	adds r1, r7, #4
	ldr r2, [r1]
	ldrh r3, [r2]
	strh r3, [r0]
	adds r2, #2
	str r2, [r1]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #8]
	subs r1, r0, #1
	str r1, [r7, #8]
	b _08001EE2
_08001F0A:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08001F14
sub_08001F14: @ 0x08001F14
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r2, #8
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #9
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x15
	ldr r1, [r7, #4]
	ldr r2, [r1]
	lsrs r1, r2, #8
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x15
	ldrb r2, [r1]
	strb r2, [r0]
_08001F5A:
	adds r0, r7, #0
	adds r0, #0x17
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001F68
	b _08001FE6
_08001F68:
	adds r1, r7, #0
	adds r1, #0x17
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r1, r7, #0
	adds r1, #9
	ldrb r2, [r1]
	lsls r0, r2
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x14
	ldrb r2, [r1]
	strb r2, [r0]
_08001F8A:
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001F98
	b _08001FD0
_08001F98:
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r0]
	adds r2, r7, #0
	adds r2, #0xc
	ldr r3, [r2]
	adds r4, r7, #0
	adds r4, #8
	ldrb r5, [r3]
	ldrb r4, [r4]
	adds r5, r5, r4
	adds r4, r5, #0
	strb r4, [r1]
	adds r3, #1
	str r3, [r2]
	adds r1, #1
	str r1, [r0]
	adds r1, r7, #0
	adds r1, #0x16
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x16
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001F8A
_08001FD0:
	adds r1, r7, #0
	adds r1, #0x17
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x17
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001F5A
_08001FE6:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08001FF0
sub_08001FF0: @ 0x08001FF0
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0xc]
	ldr r0, [r7, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	asrs r0, r1, #8
	adds r1, r0, #0
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #0x18]
_08002034:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _0800203E
	b _0800208C
_0800203E:
	ldr r1, [r7, #0x18]
	lsls r0, r1, #5
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x14]
_08002050:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	blt _0800205A
	b _08002084
_0800205A:
	adds r0, r7, #4
	ldr r1, [r0]
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #0x1c]
	adds r2, r3, r2
	str r2, [r7, #0x1c]
	adds r1, #2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	ldr r1, [r0]
	ldr r3, [r7, #0x1c]
	adds r2, r3, #0
	strh r2, [r1]
	adds r1, #2
	str r1, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002050
_08002084:
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _08002034
_0800208C:
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002094
sub_08002094: @ 0x08002094
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_0800209E:
	ldr r0, [r7]
	cmp r0, #0
	bge _080020A6
	b _080020C4
_080020A6:
	ldr r0, _080020C0 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _0800209E
	.align 2, 0
_080020C0: .4byte 0x02022240
_080020C4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080020CC
sub_080020CC: @ 0x080020CC
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _080020E4
	movs r0, #0x20
	b _080020E6
_080020E4:
	movs r0, #0
_080020E6:
	str r0, [r7, #0x18]
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #4
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_080020F8:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _08002102
	b _080021E8
_08002102:
	ldr r0, _0800212C @ =0x02022240
	ldr r1, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_08002122:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002130
	b _080021E0
	.align 2, 0
_0800212C: .4byte 0x02022240
_08002130:
	ldr r2, _080021DC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080021DC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080021DC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002122
	.align 2, 0
_080021DC: .4byte 0x02022260
_080021E0:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _080020F8
_080021E8:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080021F0
sub_080021F0: @ 0x080021F0
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08002220 @ =gPal
	adds r0, r1, r0
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_08002216:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _08002224
	b _08002308
	.align 2, 0
_08002220: .4byte gPal
_08002224:
	ldr r0, _0800224C @ =0x02022240
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_08002244:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002250
	b _08002300
	.align 2, 0
_0800224C: .4byte 0x02022240
_08002250:
	ldr r2, _080022FC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080022FC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _080022FC @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #2
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002244
	.align 2, 0
_080022FC: .4byte 0x02022260
_08002300:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08002216
_08002308:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002310
sub_08002310: @ 0x08002310
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	str r0, [r7, #0xc]
_08002320:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _0800232E
	b _08002354
_0800232E:
	ldr r0, _08002350 @ =0x02022240
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08002320
	.align 2, 0
_08002350: .4byte 0x02022240
_08002354:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0800235C
sub_0800235C: @ 0x0800235C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_0800236A:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08002372
	b _0800248C
_08002372:
	ldr r0, _08002398 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_08002390:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _0800239C
	b _08002484
	.align 2, 0
_08002398: .4byte 0x02022240
_0800239C:
	ldr r0, _0800247C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002480 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0800247C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002480 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0800247C @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002480 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08002390
	.align 2, 0
_0800247C: .4byte 0x02022260
_08002480: .4byte gPal
_08002484:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _0800236A
_0800248C:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002494
sub_08002494: @ 0x08002494
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_080024A2:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080024AA
	b _080025B4
_080024AA:
	ldr r0, _080024D0 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_080024C8:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _080024D4
	b _080025AC
	.align 2, 0
_080024D0: .4byte 0x02022240
_080024D4:
	ldr r0, _080025A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _080025A8 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080025A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _080025A8 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080025A4 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080025A8 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080024C8
	.align 2, 0
_080025A4: .4byte 0x02022260
_080025A8: .4byte gPal
_080025AC:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080024A2
_080025B4:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080025BC
sub_080025BC: @ 0x080025BC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_080025CA:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080025D2
	b _080026EC
_080025D2:
	ldr r0, _080025F8 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_080025F0:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _080025FC
	b _080026E4
	.align 2, 0
_080025F8: .4byte 0x02022240
_080025FC:
	ldr r0, _080026DC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _080026E0 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080026DC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _080026E0 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080026DC @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _080026E0 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _080025F0
	.align 2, 0
_080026DC: .4byte 0x02022260
_080026E0: .4byte gPal
_080026E4:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080025CA
_080026EC:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080026F4
sub_080026F4: @ 0x080026F4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_08002702:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0800270A
	b _08002824
_0800270A:
	ldr r0, _08002730 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_08002728:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08002734
	b _0800281C
	.align 2, 0
_08002730: .4byte 0x02022240
_08002734:
	ldr r0, _08002814 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002818 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002814 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002818 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002814 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002818 @ =gPal
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x40
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08002728
	.align 2, 0
_08002814: .4byte 0x02022260
_08002818: .4byte gPal
_0800281C:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08002702
_08002824:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0800282C
sub_0800282C: @ 0x0800282C
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_08002836:
	ldr r0, [r7]
	cmp r0, #0
	bge _0800283E
	b _08002A38
_0800283E:
	ldr r0, _08002850 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08002854
	b _08002A30
	.align 2, 0
_08002850: .4byte 0x02022240
_08002854:
	movs r0, #0xf
	str r0, [r7, #4]
_08002858:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08002860
	b _08002A30
_08002860:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08002A24 @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	ldr r2, _08002A28 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A24 @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	ldr r2, _08002A28 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A24 @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	ldr r2, _08002A28 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _08002942
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0x1f
	strh r1, [r0]
_08002942:
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _08002956
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strh r1, [r0]
_08002956:
	adds r0, r7, #0
	adds r0, #0xa
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _0800298A
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0x1f
	strh r1, [r0]
_0800298A:
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _0800299E
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strh r1, [r0]
_0800299E:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, _08002A24 @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _080029D2
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0x1f
	strh r1, [r0]
_080029D2:
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _080029E6
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
_080029E6:
	ldr r0, _08002A2C @ =gPal
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	lsls r1, r2, #0xa
	adds r2, r7, #0
	adds r2, #0xa
	ldrh r3, [r2]
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r2, r7, #0
	adds r2, #8
	ldrh r2, [r2]
	adds r1, r1, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08002858
	.align 2, 0
_08002A24: .4byte 0x02022260
_08002A28: .4byte 0x02022240
_08002A2C: .4byte gPal
_08002A30:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _08002836
_08002A38:
	bl EnablePalSync
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08002A44
sub_08002A44: @ 0x08002A44
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08002A8C @ =0x080C0E1C
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x18
	bl memcpy
	ldr r0, [r7]
	cmp r0, #0
	bne _08002A66
	adds r0, r7, #4
	str r0, [r7]
_08002A66:
	ldr r0, _08002A90 @ =0x0300279C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002A94 @ =0x030027A0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002A98 @ =0x030027A4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002A9C @ =0x030027A8
	movs r1, #0
	strh r1, [r0]
	movs r0, #0
	str r0, [r7, #0x1c]
_08002A82:
	ldr r0, [r7, #0x1c]
	cmp r0, #3
	ble _08002AA0
	b _08002B18
	.align 2, 0
_08002A8C: .4byte 0x080C0E1C
_08002A90: .4byte 0x0300279C
_08002A94: .4byte 0x030027A0
_08002A98: .4byte 0x030027A4
_08002A9C: .4byte 0x030027A8
_08002AA0:
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl SetBgChrOffset
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl SetBgTilemapOffset
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl SetBgScreenSize
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl sub_08002BC0
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	str r0, [r7, #0x20]
	adds r4, r7, #0
	adds r4, #0x20
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	ldr r2, _08002B14 @ =0x01000010
	adds r0, r4, #0
	bl CpuFastSet
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	b _08002A82
	.align 2, 0
_08002B14: .4byte 0x01000010
_08002B18:
	bl sub_08015998
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #0
	bl InitOam
	ldr r0, _08002BB8 @ =gPal
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	bl EnablePalSync
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0]
	movs r2, #0xf8
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BBC @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002BB8: .4byte gPal
_08002BBC: .4byte gDispIo

	thumb_func_start sub_08002BC0
sub_08002BC0: @ 0x08002BC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002BD8 @ =0x08BBFC98
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002BDC
	.align 2, 0
_08002BD8: .4byte 0x08BBFC98
_08002BDC:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08002BE4
sub_08002BE4: @ 0x08002BE4
	push {r7, lr}
	mov r7, sp
	ldr r1, _08002BFC @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	ldr r0, _08002C00 @ =0x00000303
	cmp r1, r0
	bne _08002C04
	movs r0, #0xff
	bl sub_080C0584
	b _08002C1C
	.align 2, 0
_08002BFC: .4byte gpKeySt
_08002C00: .4byte 0x00000303
_08002C04:
	ldr r1, _08002C18 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	cmp r1, #0xf
	bne _08002C1C
	movs r0, #0xff
	bl sub_080C0584
	b _08002C1C
	.align 2, 0
_08002C18: .4byte gpKeySt
_08002C1C:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08002C24
sub_08002C24: @ 0x08002C24
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r1, _08002C94 @ =0x04000200
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08002C98 @ =0x04000132
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r3, _08002C9C @ =0xFFFFC000
	adds r2, r1, r3
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08002C94 @ =0x04000200
	ldr r1, _08002C94 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002CA0 @ =0x0000DF7F
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08002C94 @ =0x04000200
	ldr r1, _08002C94 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	bl SoundBiasReset
	svc #3
	bl SoundBiasSet
	ldr r0, _08002C94 @ =0x04000200
	adds r1, r7, #4
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C94: .4byte 0x04000200
_08002C98: .4byte 0x04000132
_08002C9C: .4byte 0xFFFFC000
_08002CA0: .4byte 0x0000DF7F

	thumb_func_start sub_08002CA4
sub_08002CA4: @ 0x08002CA4
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08002CD0 @ =0x03002844
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CB8
	ldr r0, _08002CD0 @ =0x03002844
	ldr r4, [r0]
	bl _call_via_r4
_08002CB8:
	ldr r0, _08002CD4 @ =0x03002E58
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CC8
	ldr r0, _08002CD4 @ =0x03002E58
	ldr r4, [r0]
	bl _call_via_r4
_08002CC8:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002CD0: .4byte 0x03002844
_08002CD4: .4byte 0x03002E58

	thumb_func_start sub_08002CD8
sub_08002CD8: @ 0x08002CD8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
	ldr r0, _08002D10 @ =0x03002844
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CF0
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_08002CF0:
	ldr r0, _08002D14 @ =0x03002E58
	ldr r1, [r0]
	cmp r1, #0
	beq _08002CFE
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
_08002CFE:
	ldr r0, [r7]
	cmp r0, #1
	beq _08002D4C
	cmp r0, #1
	bgt _08002D18
	cmp r0, #0
	beq _08002D22
	b _08002DE8
	.align 2, 0
_08002D10: .4byte 0x03002844
_08002D14: .4byte 0x03002E58
_08002D18:
	cmp r0, #2
	beq _08002D80
	cmp r0, #3
	beq _08002DB4
	b _08002DE8
_08002D22:
	ldr r0, _08002D40 @ =gDispIo
	ldrb r1, [r0, #4]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002D44 @ =0x04000200
	ldr r1, _08002D44 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002D48 @ =0x0000FFFD
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002D40: .4byte gDispIo
_08002D44: .4byte 0x04000200
_08002D48: .4byte 0x0000FFFD
_08002D4C:
	ldr r0, _08002D74 @ =gDispIo
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002D78 @ =0x03002844
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002D7C @ =0x04000200
	ldr r1, _08002D7C @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002D74: .4byte gDispIo
_08002D78: .4byte 0x03002844
_08002D7C: .4byte 0x04000200
_08002D80:
	ldr r0, _08002DA8 @ =gDispIo
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002DAC @ =0x03002E58
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002DB0 @ =0x04000200
	ldr r1, _08002DB0 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002DA8: .4byte gDispIo
_08002DAC: .4byte 0x03002E58
_08002DB0: .4byte 0x04000200
_08002DB4:
	ldr r0, _08002DDC @ =gDispIo
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r1, _08002DE0 @ =sub_08002CA4
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002DE4 @ =0x04000200
	ldr r1, _08002DE4 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002DE8
	.align 2, 0
_08002DDC: .4byte gDispIo
_08002DE0: .4byte sub_08002CA4
_08002DE4: .4byte 0x04000200
_08002DE8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetOnHBlankA
SetOnHBlankA: @ 0x08002DF0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002E0C @ =0x03002844
	ldr r1, [r7]
	str r1, [r0]
	bl sub_08002CD8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002E0C: .4byte 0x03002844

	thumb_func_start SetOnHBlankB
SetOnHBlankB: @ 0x08002E10
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002E2C @ =0x03002E58
	ldr r1, [r7]
	str r1, [r0]
	bl sub_08002CD8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002E2C: .4byte 0x03002E58

	thumb_func_start sub_08002E30
sub_08002E30: @ 0x08002E30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08002E4C @ =gBg0Tm
	cmp r0, r1
	blo _08002E54
	ldr r0, [r7]
	ldr r1, _08002E50 @ =gBg1Tm
	cmp r0, r1
	bhs _08002E54
	movs r0, #0
	b _08002EAE
	.align 2, 0
_08002E4C: .4byte gBg0Tm
_08002E50: .4byte gBg1Tm
_08002E54:
	ldr r0, [r7]
	ldr r1, _08002E68 @ =gBg1Tm
	cmp r0, r1
	blo _08002E70
	ldr r0, [r7]
	ldr r1, _08002E6C @ =gBg2Tm
	cmp r0, r1
	bhs _08002E70
	movs r0, #1
	b _08002EAE
	.align 2, 0
_08002E68: .4byte gBg1Tm
_08002E6C: .4byte gBg2Tm
_08002E70:
	ldr r0, [r7]
	ldr r1, _08002E84 @ =gBg2Tm
	cmp r0, r1
	blo _08002E8C
	ldr r0, [r7]
	ldr r1, _08002E88 @ =gBg3Tm
	cmp r0, r1
	bhs _08002E8C
	movs r0, #2
	b _08002EAE
	.align 2, 0
_08002E84: .4byte gBg2Tm
_08002E88: .4byte gBg3Tm
_08002E8C:
	ldr r0, [r7]
	ldr r1, _08002EA0 @ =gBg3Tm
	cmp r0, r1
	blo _08002EA8
	ldr r0, [r7]
	ldr r1, _08002EA4 @ =gBgMapVramTable
	cmp r0, r1
	bhs _08002EA8
	movs r0, #3
	b _08002EAE
	.align 2, 0
_08002EA0: .4byte gBg3Tm
_08002EA4: .4byte gBgMapVramTable
_08002EA8:
	movs r0, #1
	rsbs r0, r0, #0
	b _08002EAE
_08002EAE:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ClearMoveList
ClearMoveList: @ 0x08002EB8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _08002ED8 @ =0x02024C8C
	movs r1, #0
	str r1, [r0]
	ldr r0, _08002ED8 @ =0x02024C8C
	movs r1, #0
	str r1, [r0, #4]
	movs r0, #0
	str r0, [r7]
_08002ECE:
	ldr r0, [r7]
	cmp r0, #0x1f
	ble _08002EDC
	b _08002F40
	.align 2, 0
_08002ED8: .4byte 0x02024C8C
_08002EDC:
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	movs r0, #0
	str r0, [r1]
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _08002F3C @ =0x02024C94
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08002ECE
	.align 2, 0
_08002F3C: .4byte 0x02024C94
_08002F40:
	ldr r0, _08002F50 @ =0x02024C94
	movs r1, #0
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F50: .4byte 0x02024C94

	thumb_func_start RegisterDataMove
RegisterDataMove: @ 0x08002F54
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r0, [r1]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	ldr r1, _08002FD4 @ =0x02024C94
	adds r0, r1, r0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #4]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [r7, #8]
	movs r3, #0x1f
	ands r2, r3
	cmp r2, #0
	bne _08002FA2
	movs r1, #1
_08002FA2:
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _08002FD0 @ =0x02024C8C
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r2, [r1, #4]
	ldr r1, [r7, #8]
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r0, _08002FD0 @ =0x02024C8C
	ldr r1, _08002FD0 @ =0x02024C8C
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002FD0: .4byte 0x02024C8C
_08002FD4: .4byte 0x02024C94

	thumb_func_start RegisterDataFill
RegisterDataFill: @ 0x08002FD8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0800304C @ =0x02024C8C
	ldr r0, [r1]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	ldr r1, _08003050 @ =0x02024C94
	adds r0, r1, r0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #4]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _0800304C @ =0x02024C8C
	ldr r1, _0800304C @ =0x02024C8C
	ldr r2, [r1, #4]
	ldr r1, [r7, #8]
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _0800304C @ =0x02024C8C
	ldr r0, _0800304C @ =0x02024C8C
	ldr r1, _0800304C @ =0x02024C8C
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800304C: .4byte 0x02024C8C
_08003050: .4byte 0x02024C94

	thumb_func_start ApplyDataMoves
ApplyDataMoves: @ 0x08003054
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	ldr r0, _08003070 @ =0x02024C94
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_08003062:
	ldr r0, _08003074 @ =0x02024C8C
	ldr r1, [r7, #4]
	ldr r0, [r0]
	cmp r1, r0
	blt _08003078
	b _080030FA
	.align 2, 0
_08003070: .4byte 0x02024C94
_08003074: .4byte 0x02024C8C
_08003078:
	ldr r1, [r7]
	ldrh r0, [r1, #0xa]
	cmp r0, #1
	beq _080030AA
	cmp r0, #1
	bgt _0800308A
	cmp r0, #0
	beq _08003090
	b _080030EA
_0800308A:
	cmp r0, #2
	beq _080030C4
	b _080030EA
_08003090:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #1
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuSet
	b _080030EA
_080030AA:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuFastSet
	b _080030EA
_080030C4:
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7, #8]
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #0x11
	orrs r2, r3
	bl CpuFastSet
	b _080030EA
_080030EA:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08003062
_080030FA:
	bl ClearMoveList
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start InitOam
InitOam: @ 0x08003108
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003198 @ =0x03000028
	ldr r1, _0800319C @ =0x03002850
	str r1, [r0]
	ldr r0, _08003198 @ =0x03000028
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r0, _08003198 @ =0x03000028
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _08003198 @ =0x03000028
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _080031A0 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldr r2, _0800319C @ =0x03002850
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080031A0 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	movs r3, #0xe0
	lsls r3, r3, #0x13
	adds r2, r1, r3
	str r2, [r0, #4]
	ldr r0, _080031A0 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r0, _080031A0 @ =0x03000018
	ldr r2, [r7]
	adds r1, r2, #0
	movs r2, #0x80
	subs r1, r2, r1
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003198: .4byte 0x03000028
_0800319C: .4byte 0x03002850
_080031A0: .4byte 0x03000018

	thumb_func_start GetOamSplice
GetOamSplice: @ 0x080031A4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080031B0 @ =0x03000028
	ldrh r1, [r0, #0xa]
	adds r0, r1, #0
	b _080031B4
	.align 2, 0
_080031B0: .4byte 0x03000028
_080031B4:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SyncHiOam
SyncHiOam: @ 0x080031BC
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08003200 @ =0x03000018
	ldr r0, [r1]
	ldr r2, _08003200 @ =0x03000018
	ldr r1, [r2, #4]
	ldr r2, _08003200 @ =0x03000018
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _08003200 @ =0x03000018
	ldr r0, [r1]
	ldr r1, _08003200 @ =0x03000018
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl ClearOam_thm
	ldr r0, _08003204 @ =0x03002E54
	ldr r1, _08003200 @ =0x03000018
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08003208 @ =0x03003868
	ldr r1, _0800320C @ =0x03002850
	str r1, [r0]
	ldr r0, _08003210 @ =0x0300283C
	movs r1, #0
	strh r1, [r0]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003200: .4byte 0x03000018
_08003204: .4byte 0x03002E54
_08003208: .4byte 0x03003868
_0800320C: .4byte 0x03002850
_08003210: .4byte 0x0300283C

	thumb_func_start SyncLoOam
SyncLoOam: @ 0x08003214
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08003224 @ =0x03000028
	ldrh r1, [r0, #0xa]
	cmp r1, #0
	bne _08003228
	b _08003256
	.align 2, 0
_08003224: .4byte 0x03000028
_08003228:
	ldr r1, _0800325C @ =0x03000028
	ldr r0, [r1]
	ldr r2, _0800325C @ =0x03000028
	ldr r1, [r2, #4]
	ldr r2, _0800325C @ =0x03000028
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _0800325C @ =0x03000028
	ldr r0, [r1]
	ldr r1, _0800325C @ =0x03000028
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl ClearOam_thm
	ldr r0, _08003260 @ =0x03002780
	ldr r1, _0800325C @ =0x03000028
	ldr r2, [r1]
	str r2, [r0]
_08003256:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800325C: .4byte 0x03000028
_08003260: .4byte 0x03002780

	thumb_func_start SetObjAffine
SetObjAffine: @ 0x08003264
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r3, #0
	ldr r0, [r7, #0x18]
	adds r3, r7, #4
	strh r4, [r3]
	adds r3, r7, #6
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #8
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xa
	strh r0, [r1]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #3
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #7
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	adds r2, #0xb
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003328 @ =0x03002850
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	adds r2, #0xf
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003328: .4byte 0x03002850

	thumb_func_start PutUnkSprite
PutUnkSprite: @ 0x0800332C
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_08003338:
	b _0800333C
_0800333A:
	b _080033B0
_0800333C:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #1
	beq _08003358
	ldr r0, _08003350 @ =0x03002E54
	ldr r1, [r0]
	ldr r0, _08003354 @ =0x03002950
	cmp r1, r0
	bhs _08003358
	b _0800335A
	.align 2, 0
_08003350: .4byte 0x03002E54
_08003354: .4byte 0x03002950
_08003358:
	b _080033B0
_0800335A:
	ldr r0, [r7]
	movs r2, #6
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, r2
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	str r0, [r7, #0xc]
	ldr r0, [r7]
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #8]
	adds r0, r1, r2
	movs r1, #0xff
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r0, _080033AC @ =0x03002E54
	ldr r1, [r0]
	ldr r2, [r7]
	ldr r4, [r7, #0xc]
	lsls r3, r4, #0x10
	ldr r4, [r2]
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, [r7, #0x10]
	orrs r2, r3
	str r2, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, _080033AC @ =0x03002E54
	ldr r1, [r0]
	ldr r2, [r7]
	ldrh r3, [r2, #4]
	strh r3, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	b _08003338
	.align 2, 0
_080033AC: .4byte 0x03002E54
_080033B0:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
