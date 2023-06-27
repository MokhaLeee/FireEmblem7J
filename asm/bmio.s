	.include "macro.inc"
	.syntax unified

	thumb_func_start BmVSync_TsImgAnim
BmVSync_TsImgAnim: @ 0x0802D74C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0802D78A
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802D766
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	b _0802D78A
_0802D766:
	ldr r2, [r4, #0x30]
	ldrh r0, [r2]
	strh r0, [r4, #0x34]
	ldr r0, [r2, #4]
	ldr r1, _0802D790 @ =0x0600A000
	ldrh r2, [r2, #2]
	lsrs r2, r2, #2
	bl CpuFastSet
	ldr r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _0802D78A
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x30]
_0802D78A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D790: .4byte 0x0600A000

	thumb_func_start BmVSync_TsPalAnim
BmVSync_TsPalAnim: @ 0x0802D794
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0802D7D8
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802D7AE
	subs r0, r1, #1
	strh r0, [r4, #0x36]
	b _0802D7D8
_0802D7AE:
	ldr r3, [r4, #0x3c]
	ldrb r0, [r3, #4]
	strh r0, [r4, #0x36]
	ldr r0, [r3]
	ldrb r2, [r3, #6]
	lsls r1, r2, #1
	ldr r2, _0802D7E0 @ =0x02022920
	adds r1, r1, r2
	ldrb r2, [r3, #5]
	bl CpuSet
	bl EnablePalSync
	ldr r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x3c]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0802D7D8
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x3c]
_0802D7D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D7E0: .4byte 0x02022920

	thumb_func_start BmVSync_AnimInit
BmVSync_AnimInit: @ 0x0802D7E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	ldr r5, _0802D820 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldr r6, _0802D824 @ =0x08D648F4
	ldrb r0, [r0, #9]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x30]
	str r0, [r4, #0x2c]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D820: .4byte gPlaySt
_0802D824: .4byte 0x08D648F4

	thumb_func_start BmVSync_End
BmVSync_End: @ 0x0802D828
	push {lr}
	movs r0, #0
	bl SetOnHBlankB
	pop {r0}
	bx r0

	thumb_func_start BmVSync_Repeat
BmVSync_Repeat: @ 0x0802D834
	push {lr}
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start StartBmVSync
StartBmVSync: @ 0x0802D840
	push {lr}
	ldr r0, _0802D85C @ =0x08C05414
	movs r1, #0
	bl Proc_Start
	bl BmVSync_AnimInit
	bl sub_0802E220
	ldr r1, _0802D860 @ =gBmSt
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_0802D85C: .4byte 0x08C05414
_0802D860: .4byte gBmSt

	thumb_func_start sub_0802D864
sub_0802D864: @ 0x0802D864
	push {lr}
	ldr r0, _0802D870 @ =0x08C05414
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_0802D870: .4byte 0x08C05414

	thumb_func_start sub_0802D874
sub_0802D874: @ 0x0802D874
	push {lr}
	ldr r1, _0802D8A0 @ =gBmSt
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _0802D89C
	movs r0, #0
	bl SetOnHBlankB
	ldr r1, _0802D8A4 @ =gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	movs r0, #1
	bl sub_080046C4
_0802D89C:
	pop {r0}
	bx r0
	.align 2, 0
_0802D8A0: .4byte gBmSt
_0802D8A4: .4byte gPal

	thumb_func_start sub_0802D8A8
sub_0802D8A8: @ 0x0802D8A8
	push {lr}
	ldr r1, _0802D8DC @ =gBmSt
	ldrb r2, [r1, #2]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802D8D8
	subs r0, r2, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D8D8
	movs r0, #1
	bl sub_080046E8
	ldr r0, _0802D8E0 @ =0x08C05414
	bl Proc_Find
	cmp r0, #0
	beq _0802D8D8
	bl Proc_End
	bl StartBmVSync
_0802D8D8:
	pop {r0}
	bx r0
	.align 2, 0
_0802D8DC: .4byte gBmSt
_0802D8E0: .4byte 0x08C05414

	thumb_func_start sub_0802D8E4
sub_0802D8E4: @ 0x0802D8E4
	push {lr}
	subs r0, #1
	cmp r0, #5
	bhi _0802D924
	lsls r0, r0, #2
	ldr r1, _0802D8F8 @ =_0802D8FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D8F8: .4byte _0802D8FC
_0802D8FC: @ jump table
	.4byte _0802D914 @ case 0
	.4byte _0802D914 @ case 1
	.4byte _0802D924 @ case 2
	.4byte _0802D914 @ case 3
	.4byte _0802D91C @ case 4
	.4byte _0802D914 @ case 5
_0802D914:
	movs r0, #0x20
	bl InitOam
	b _0802D92A
_0802D91C:
	movs r0, #0x10
	bl InitOam
	b _0802D92A
_0802D924:
	movs r0, #0
	bl InitOam
_0802D92A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802D930
sub_0802D930: @ 0x0802D930
	push {lr}
	ldr r0, _0802D944 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	bl sub_0802D8E4
	movs r0, #0
	bl SetOnHBlankB
	pop {r0}
	bx r0
	.align 2, 0
_0802D944: .4byte gPlaySt

	thumb_func_start sub_0802D948
sub_0802D948: @ 0x0802D948
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, sp
	ldr r0, _0802D9B0 @ =0x081C9808
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, _0802D9B4 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	bl sub_0802D8E4
	movs r6, #0
	ldr r7, _0802D9B8 @ =0x081C97A8
	ldr r5, _0802D9BC @ =0x020027DC
_0802D962:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #9]
	adds r4, r0, #0
	lsls r0, r4, #2
	add r0, sp
	ldr r0, [r0]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802D962
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D9B0: .4byte 0x081C9808
_0802D9B4: .4byte gPlaySt
_0802D9B8: .4byte 0x081C97A8
_0802D9BC: .4byte 0x020027DC

	thumb_func_start sub_0802D9C0
sub_0802D9C0: @ 0x0802D9C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl GetOamSplice
	cmp r0, #0
	beq _0802DA6A
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802DA74 @ =0x020027DC
	adds r4, r1, r0
	mov r2, sp
	ldr r3, _0802DA78 @ =gBmSt
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _0802D9F2
	adds r0, #0xf
_0802D9F2:
	asrs r0, r0, #4
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r3, #0xe]
	strh r2, [r0, #2]
	mov r1, sp
	ldrh r0, [r3, #0xc]
	strh r0, [r1, #4]
	mov r0, sp
	strh r2, [r0, #6]
	mov r5, sp
	movs r7, #0xc
	ldrsh r1, [r3, r7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _0802DA18
	adds r0, #0xf
_0802DA18:
	asrs r0, r0, #4
	strh r0, [r5, #8]
	mov r0, sp
	strh r2, [r0, #0xa]
	movs r6, #0xff
	movs r5, #0x1f
_0802DA24:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r7, [r4, #6]
	adds r1, r3, r7
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrb r3, [r4, #9]
	lsls r2, r3, #2
	mov r7, sp
	adds r3, r7, r2
	movs r7, #0
	ldrsh r2, [r3, r7]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r7, #2
	ldrsh r2, [r3, r7]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r3, r3, r2
	ldr r2, _0802DA7C @ =0x08BFF760
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802DA24
_0802DA6A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA74: .4byte 0x020027DC
_0802DA78: .4byte gBmSt
_0802DA7C: .4byte 0x08BFF760

	thumb_func_start sub_0802DA80
sub_0802DA80: @ 0x0802DA80
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802DAD8 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	bl sub_0802D8E4
	movs r6, #0
	ldr r7, _0802DADC @ =0x081C97A8
	ldr r5, _0802DAE0 @ =0x020027DC
_0802DA90:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	lsls r1, r4, #1
	adds r1, r1, r7
	ldrh r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802DA90
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DAD8: .4byte gPlaySt
_0802DADC: .4byte 0x081C97A8
_0802DAE0: .4byte 0x020027DC

	thumb_func_start sub_0802DAE4
sub_0802DAE4: @ 0x0802DAE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetOamSplice
	cmp r0, #0
	beq _0802DB4C
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802DB58 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _0802DB5C @ =gBmSt
	movs r6, #0xff
	movs r5, #0x1f
	ldr r0, _0802DB60 @ =0x08C054C4
	mov r8, r0
_0802DB0E:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r2, [r4, #6]
	adds r1, r3, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	lsls r2, r3, #2
	add r2, r8
	ldr r2, [r2]
	movs r3, #0
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802DB0E
_0802DB4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB58: .4byte 0x020027DC
_0802DB5C: .4byte gBmSt
_0802DB60: .4byte 0x08C054C4

	thumb_func_start sub_0802DB64
sub_0802DB64: @ 0x0802DB64
	push {r4, r5, r6, lr}
	ldr r0, _0802DBC0 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	bl sub_0802D8E4
	ldr r0, _0802DBC4 @ =0x08194FAC
	ldr r4, _0802DBC8 @ =gBuf
	adds r1, r4, #0
	bl sub_08013688
	ldr r1, _0802DBCC @ =0x06010380
	adds r0, r4, #0
	movs r2, #4
	movs r3, #4
	bl sub_08013758
	movs r6, #0
	ldr r4, _0802DBD0 @ =0x020027DC
	movs r5, #0x3f
_0802DB8A:
	bl RandNextB
	strh r0, [r4]
	bl RandNextB
	movs r1, #0xa0
	bl __umodsi3
	adds r0, #0xf0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #2]
	bl RandNextB
	movs r1, #7
	ands r0, r1
	subs r0, #0x20
	strh r0, [r4, #4]
	strh r6, [r4, #6]
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802DB8A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBC0: .4byte gPlaySt
_0802DBC4: .4byte 0x08194FAC
_0802DBC8: .4byte gBuf
_0802DBCC: .4byte 0x06010380
_0802DBD0: .4byte 0x020027DC

	thumb_func_start sub_0802DBD4
sub_0802DBD4: @ 0x0802DBD4
	push {r4, r5, lr}
	bl GetOamSplice
	cmp r0, #0
	beq _0802DC18
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802DC20 @ =0x020027DC
	adds r4, r1, r0
	movs r5, #0x1f
_0802DBF2:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	movs r1, #0xff
	ands r0, r1
	subs r0, #0x10
	ldr r1, _0802DC24 @ =0x000001FF
	ands r0, r1
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _0802DC28 @ =0x08BFF770
	ldr r3, _0802DC2C @ =0x0000101C
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802DBF2
_0802DC18:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DC20: .4byte 0x020027DC
_0802DC24: .4byte 0x000001FF
_0802DC28: .4byte 0x08BFF770
_0802DC2C: .4byte 0x0000101C

	thumb_func_start sub_0802DC30
sub_0802DC30: @ 0x0802DC30
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, _0802DC9C @ =gPlaySt
	ldrb r0, [r0, #0x15]
	bl sub_0802D8E4
	ldr r0, _0802DCA0 @ =0x08195034
	ldr r4, _0802DCA4 @ =gBuf
	adds r1, r4, #0
	bl sub_08013688
	ldr r1, _0802DCA8 @ =0x06010300
	adds r0, r4, #0
	movs r2, #8
	movs r3, #4
	bl sub_08013758
	movs r6, #0
	ldr r5, _0802DCAC @ =0x020027DC
	ldr r0, _0802DCB0 @ =0x000001FF
	adds r7, r0, #0
_0802DC6C:
	movs r0, #7
	ands r0, r6
	add r0, sp
	ldrb r4, [r0]
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	bl RandNextB
	ldr r2, _0802DCB4 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _0802DCB8 @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r5, #6]
	strb r4, [r5, #8]
	cmp r4, #0
	beq _0802DCBC
	cmp r4, #1
	beq _0802DCCA
	b _0802DCDA
	.align 2, 0
_0802DC9C: .4byte gPlaySt
_0802DCA0: .4byte 0x08195034
_0802DCA4: .4byte gBuf
_0802DCA8: .4byte 0x06010300
_0802DCAC: .4byte 0x020027DC
_0802DCB0: .4byte 0x000001FF
_0802DCB4: .4byte 0x000003FF
_0802DCB8: .4byte 0xFFFFFF00
_0802DCBC:
	bl RandNextB
	ands r0, r7
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r0, r2
	b _0802DCD8
_0802DCCA:
	bl RandNextB
	ands r0, r7
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
	adds r0, r0, r1
_0802DCD8:
	strh r0, [r5, #4]
_0802DCDA:
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802DC6C
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802DCEC
sub_0802DCEC: @ 0x0802DCEC
	push {r4, r5, r6, r7, lr}
	bl GetOamSplice
	cmp r0, #0
	beq _0802DD4C
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802DD54 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _0802DD58 @ =gBmSt
	movs r6, #0xff
	movs r5, #0x1f
_0802DD0E:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r2, [r4, #6]
	adds r1, r3, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r2, [r4, #8]
	lsls r3, r2, #2
	ldr r2, _0802DD5C @ =0x00001018
	adds r3, r3, r2
	ldr r2, _0802DD60 @ =0x08BFF770
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802DD0E
_0802DD4C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD54: .4byte 0x020027DC
_0802DD58: .4byte gBmSt
_0802DD5C: .4byte 0x00001018
_0802DD60: .4byte 0x08BFF770

	thumb_func_start sub_0802DD64
sub_0802DD64: @ 0x0802DD64
	ldr r0, _0802DD98 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _0802DD74
	movs r3, #0
_0802DD74:
	ldr r0, _0802DD9C @ =gBmSt
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0802DDA0 @ =0x0000013F
	cmp r3, r0
	bls _0802DDA4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	b _0802DDB2
	.align 2, 0
_0802DD98: .4byte 0x04000006
_0802DD9C: .4byte gBmSt
_0802DDA0: .4byte 0x0000013F
_0802DDA4:
	movs r2, #0xa0
	lsls r2, r2, #0x13
	lsls r0, r3, #1
	ldr r1, _0802DDB4 @ =0x02002ADC
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0802DDB2:
	bx lr
	.align 2, 0
_0802DDB4: .4byte 0x02002ADC

	thumb_func_start sub_0802DDB8
sub_0802DDB8: @ 0x0802DDB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0802DDF0 @ =0x02002ADC
	movs r4, #0
	ldr r0, _0802DDF4 @ =sub_0802DD64
	mov r8, r0
	movs r7, #0x1f
	ldr r6, _0802DDF8 @ =0x0000013F
_0802DDCA:
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	subs r0, r7, r0
	lsls r0, r0, #0xa
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r6
	ble _0802DDCA
	mov r0, r8
	bl SetOnHBlankB
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DDF0: .4byte 0x02002ADC
_0802DDF4: .4byte sub_0802DD64
_0802DDF8: .4byte 0x0000013F

	thumb_func_start nullsub_9
nullsub_9: @ 0x0802DDFC
	bx lr
	.align 2, 0

	thumb_func_start sub_0802DE00
sub_0802DE00: @ 0x0802DE00
	push {lr}
	ldr r0, _0802DE38 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5f
	bls _0802DE32
	cmp r0, #0x9f
	bhi _0802DE32
	adds r2, r0, #0
	subs r2, #0x60
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _0802DE3C @ =0x02002ADC
	lsls r1, r2, #4
	adds r0, r1, r0
	movs r1, #7
	ands r1, r2
	lsls r1, r1, #4
	ldr r2, _0802DE40 @ =0x050000E0
	adds r1, r1, r2
	movs r2, #2
	bl CpuFastSet
_0802DE32:
	pop {r0}
	bx r0
	.align 2, 0
_0802DE38: .4byte 0x04000006
_0802DE3C: .4byte 0x02002ADC
_0802DE40: .4byte 0x050000E0

	thumb_func_start sub_0802DE44
sub_0802DE44: @ 0x0802DE44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _0802DEBC @ =gPal
	mov sl, r0
	movs r6, #0x1f
	ldr r3, _0802DEC0 @ =0x02002ADC
	mov sb, r3
_0802DE5A:
	movs r2, #0
	adds r0, r1, #7
	adds r3, r1, #1
	mov r8, r3
	lsls r0, r0, #4
	mov ip, r0
	lsls r7, r1, #4
_0802DE68:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r5, r2, #1
	adds r2, r7, r2
	lsls r2, r2, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r4, r0, r1
	add r2, sb
	movs r1, #7
_0802DE8E:
	adds r3, #2
	cmp r3, #0x1f
	ble _0802DE96
	movs r3, #0x1f
_0802DE96:
	adds r0, r4, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0802DE8E
	adds r2, r5, #0
	cmp r2, #0xf
	ble _0802DE68
	mov r1, r8
	cmp r1, #3
	ble _0802DE5A
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DEBC: .4byte gPal
_0802DEC0: .4byte 0x02002ADC

	thumb_func_start sub_0802DEC4
sub_0802DEC4: @ 0x0802DEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl sub_08019624
	movs r1, #0
	ldr r0, _0802DF48 @ =gPal
	mov sl, r0
	movs r6, #0x1f
	ldr r3, _0802DF4C @ =0x02002ADC
	mov sb, r3
_0802DEDE:
	movs r2, #0
	adds r0, r1, #7
	adds r3, r1, #1
	mov r8, r3
	lsls r0, r0, #4
	mov ip, r0
	lsls r7, r1, #4
_0802DEEC:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r5, r2, #1
	adds r2, r7, r2
	lsls r2, r2, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r4, r0, r1
	add r2, sb
	movs r1, #7
_0802DF12:
	adds r3, #2
	cmp r3, #0x1f
	ble _0802DF1A
	movs r3, #0x1f
_0802DF1A:
	adds r0, r4, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0802DF12
	adds r2, r5, #0
	cmp r2, #0xf
	ble _0802DEEC
	mov r1, r8
	cmp r1, #3
	ble _0802DEDE
	ldr r0, _0802DF50 @ =sub_0802DE00
	bl SetOnHBlankB
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DF48: .4byte gPal
_0802DF4C: .4byte 0x02002ADC
_0802DF50: .4byte sub_0802DE00

	thumb_func_start sub_0802DF54
sub_0802DF54: @ 0x0802DF54
	push {r4, r5, r6, lr}
	ldr r0, _0802DFA0 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	bl sub_0802D8E4
	ldr r0, _0802DFA4 @ =0x081950CC
	ldr r1, _0802DFA8 @ =0x06010300
	bl sub_08013688
	ldr r0, _0802DFAC @ =0x0819510C
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _0802DFB0 @ =0x081C97A8
	ldr r4, _0802DFB4 @ =0x020027DC
	movs r6, #0xf
_0802DF78:
	bl RandNextB
	strh r0, [r4]
	bl RandNextB
	strh r0, [r4, #2]
	ldrh r1, [r5]
	rsbs r0, r1, #0
	strh r0, [r4, #4]
	ldrh r1, [r5, #2]
	rsbs r0, r1, #0
	strh r0, [r4, #6]
	adds r5, #6
	adds r4, #0xc
	subs r6, #1
	cmp r6, #0
	bge _0802DF78
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DFA0: .4byte gPlaySt
_0802DFA4: .4byte 0x081950CC
_0802DFA8: .4byte 0x06010300
_0802DFAC: .4byte 0x0819510C
_0802DFB0: .4byte 0x081C97A8
_0802DFB4: .4byte 0x020027DC

	thumb_func_start sub_0802DFB8
sub_0802DFB8: @ 0x0802DFB8
	push {lr}
	bl sub_0802DEC4
	bl sub_0802DF54
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802DFC8
sub_0802DFC8: @ 0x0802DFC8
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802E028 @ =0x02022940
	ldr r1, _0802E02C @ =0x050000E0
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r5, #0xc
	subs r4, #0xe0
	mov ip, r4
	movs r6, #0x1f
	ldr r7, _0802E030 @ =0x02002ADC
_0802DFE0:
	adds r0, r5, #0
	adds r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r2, r5, #0
	adds r2, #0x20
	adds r4, r5, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r5, r0, r1
	lsls r2, r2, #1
	adds r2, r2, r7
	movs r1, #7
_0802E008:
	adds r3, #2
	cmp r3, #0x1f
	ble _0802E010
	movs r3, #0x1f
_0802E010:
	adds r0, r5, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0802E008
	adds r5, r4, #0
	cmp r5, #0xf
	ble _0802DFE0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E028: .4byte 0x02022940
_0802E02C: .4byte 0x050000E0
_0802E030: .4byte 0x02002ADC

	thumb_func_start sub_0802E034
sub_0802E034: @ 0x0802E034
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0802E0C0 @ =0x020027DC
	bl GetOamSplice
	cmp r0, #0
	beq _0802E0B4
	ldr r0, _0802E0C4 @ =gBmSt
	mov r8, r0
	movs r1, #0xff
	mov sb, r1
	movs r6, #0xf
_0802E050:
	ldrh r2, [r4]
	ldrh r3, [r4, #4]
	adds r5, r2, r3
	strh r5, [r4]
	ldrh r7, [r4, #2]
	ldrh r1, [r4, #6]
	adds r0, r7, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	mov r2, r8
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r2, r0, r1
	mov r7, sb
	ands r2, r7
	cmp r2, #0x3f
	ble _0802E0AC
	cmp r2, #0xa0
	bgt _0802E0AC
	adds r1, r2, #0
	subs r1, #0x40
	cmp r1, #0
	bge _0802E082
	adds r1, #7
_0802E082:
	asrs r1, r1, #3
	movs r0, #0x1f
	subs r3, r0, r1
	cmp r3, #0x17
	bgt _0802E08E
	movs r3, #0x18
_0802E08E:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x18
	mov r5, r8
	movs r7, #0xc
	ldrsh r1, [r5, r7]
	subs r0, r0, r1
	mov r1, sb
	ands r0, r1
	movs r5, #0xa0
	lsls r5, r5, #8
	adds r3, r3, r5
	adds r1, r2, #0
	ldr r2, _0802E0C8 @ =0x08BFF760
	bl PutOamLoRam
_0802E0AC:
	subs r6, #1
	adds r4, #0xc
	cmp r6, #0
	bge _0802E050
_0802E0B4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E0C0: .4byte 0x020027DC
_0802E0C4: .4byte gBmSt
_0802E0C8: .4byte 0x08BFF760

	thumb_func_start sub_0802E0CC
sub_0802E0CC: @ 0x0802E0CC
	push {lr}
	bl sub_0802DFC8
	bl sub_0802E034
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802E0DC
sub_0802E0DC: @ 0x0802E0DC
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0xd0
	lsls r0, r0, #1
	adds r2, r5, r0
	mov r1, sp
	movs r3, #7
_0802E0EC:
	ldm r2!, {r0}
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _0802E0EC
	movs r0, #0xd
	adds r6, r5, #0
	subs r6, #0x20
_0802E0FC:
	subs r4, r0, #1
	lsls r0, r0, #5
	adds r2, r0, r6
	movs r3, #7
_0802E104:
	ldr r1, [r2, #0x20]
	lsls r1, r1, #4
	ldr r0, [r2]
	lsrs r0, r0, #0x1c
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _0802E104
	adds r0, r4, #0
	cmp r0, #0
	bge _0802E0FC
	movs r6, #0x10
	rsbs r6, r6, #0
	adds r2, r5, #0
	mov r4, sp
	movs r3, #7
_0802E128:
	ldr r1, [r2]
	ands r1, r6
	str r1, [r2]
	ldm r4!, {r0}
	lsrs r0, r0, #0x1c
	orrs r1, r0
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bge _0802E128
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0802E144
sub_0802E144: @ 0x0802E144
	push {lr}
	movs r0, #0
	bl sub_0802D8E4
	ldr r0, _0802E164 @ =0x0819514C
	ldr r1, _0802E168 @ =0x020027DC
	bl sub_08013688
	ldr r0, _0802E16C @ =0x08195668
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0802E164: .4byte 0x0819514C
_0802E168: .4byte 0x020027DC
_0802E16C: .4byte 0x08195668

	thumb_func_start sub_0802E170
sub_0802E170: @ 0x0802E170
	push {r4, lr}
	ldr r4, _0802E18C @ =0x020027DC
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #7
	ands r1, r0
	cmp r1, #7
	bhi _0802E1E0
	lsls r0, r1, #2
	ldr r1, _0802E190 @ =_0802E194
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E18C: .4byte 0x020027DC
_0802E190: .4byte _0802E194
_0802E194: @ jump table
	.4byte _0802E1B4 @ case 0
	.4byte _0802E1E0 @ case 1
	.4byte _0802E1BC @ case 2
	.4byte _0802E1E0 @ case 3
	.4byte _0802E1C2 @ case 4
	.4byte _0802E1E0 @ case 5
	.4byte _0802E1C8 @ case 6
	.4byte _0802E1D4 @ case 7
_0802E1B4:
	adds r0, r4, #0
	bl sub_0802E0DC
	b _0802E1E0
_0802E1BC:
	movs r1, #0xe0
	lsls r1, r1, #1
	b _0802E1CC
_0802E1C2:
	movs r1, #0xe0
	lsls r1, r1, #2
	b _0802E1CC
_0802E1C8:
	movs r1, #0xa8
	lsls r1, r1, #3
_0802E1CC:
	adds r0, r4, r1
	bl sub_0802E0DC
	b _0802E1E0
_0802E1D4:
	ldr r1, _0802E1E8 @ =0x06010240
	adds r0, r4, #0
	movs r2, #0xe
	movs r3, #4
	bl sub_08013758
_0802E1E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E1E8: .4byte 0x06010240

	thumb_func_start sub_0802E1EC
sub_0802E1EC: @ 0x0802E1EC
	push {lr}
	sub sp, #4
	ldr r0, _0802E214 @ =gBmSt
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	movs r1, #5
	bl __divsi3
	adds r2, r0, #0
	rsbs r2, r2, #0
	ldr r3, _0802E218 @ =0x08C054D0
	ldr r0, _0802E21C @ =0x0000AC12
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	bl sub_08006884
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802E214: .4byte gBmSt
_0802E218: .4byte 0x08C054D0
_0802E21C: .4byte 0x0000AC12

	thumb_func_start sub_0802E220
sub_0802E220: @ 0x0802E220
	push {lr}
	ldr r0, _0802E234 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bhi _0802E28A
	lsls r0, r0, #2
	ldr r1, _0802E238 @ =_0802E23C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E234: .4byte gPlaySt
_0802E238: .4byte _0802E23C
_0802E23C: @ jump table
	.4byte _0802E25C @ case 0
	.4byte _0802E262 @ case 1
	.4byte _0802E26E @ case 2
	.4byte _0802E27A @ case 3
	.4byte _0802E274 @ case 4
	.4byte _0802E280 @ case 5
	.4byte _0802E268 @ case 6
	.4byte _0802E286 @ case 7
_0802E25C:
	bl sub_0802D930
	b _0802E28A
_0802E262:
	bl sub_0802D948
	b _0802E28A
_0802E268:
	bl sub_0802DB64
	b _0802E28A
_0802E26E:
	bl sub_0802DC30
	b _0802E28A
_0802E274:
	bl sub_0802DA80
	b _0802E28A
_0802E27A:
	bl sub_0802DDB8
	b _0802E28A
_0802E280:
	bl sub_0802DFB8
	b _0802E28A
_0802E286:
	bl sub_0802E144
_0802E28A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802E290
sub_0802E290: @ 0x0802E290
	push {lr}
	ldr r0, _0802E2A8 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	subs r0, #1
	cmp r0, #6
	bhi _0802E2F4
	lsls r0, r0, #2
	ldr r1, _0802E2AC @ =_0802E2B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E2A8: .4byte gPlaySt
_0802E2AC: .4byte _0802E2B0
_0802E2B0: @ jump table
	.4byte _0802E2CC @ case 0
	.4byte _0802E2D8 @ case 1
	.4byte _0802E2E4 @ case 2
	.4byte _0802E2DE @ case 3
	.4byte _0802E2EA @ case 4
	.4byte _0802E2D2 @ case 5
	.4byte _0802E2F0 @ case 6
_0802E2CC:
	bl sub_0802D9C0
	b _0802E2F4
_0802E2D2:
	bl sub_0802DBD4
	b _0802E2F4
_0802E2D8:
	bl sub_0802DCEC
	b _0802E2F4
_0802E2DE:
	bl sub_0802DAE4
	b _0802E2F4
_0802E2E4:
	bl nullsub_9
	b _0802E2F4
_0802E2EA:
	bl sub_0802E0CC
	b _0802E2F4
_0802E2F0:
	bl sub_0802E170
_0802E2F4:
	pop {r0}
	bx r0

	thumb_func_start sub_0802E2F8
sub_0802E2F8: @ 0x0802E2F8
	push {lr}
	ldr r0, _0802E30C @ =gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _0802E306
	bl sub_0802E1EC
_0802E306:
	pop {r0}
	bx r0
	.align 2, 0
_0802E30C: .4byte gPlaySt

	thumb_func_start sub_0802E310
sub_0802E310: @ 0x0802E310
	push {lr}
	ldr r0, _0802E328 @ =0x08C05414
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _0802E322
	movs r0, #0
	str r0, [r1, #0x38]
_0802E322:
	pop {r0}
	bx r0
	.align 2, 0
_0802E328: .4byte 0x08C05414

	thumb_func_start sub_0802E32C
sub_0802E32C: @ 0x0802E32C
	push {r4, lr}
	ldr r0, _0802E35C @ =0x08C05414
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E354
	ldr r0, _0802E360 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldr r1, _0802E364 @ =0x08D648F4
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_0802E354:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E35C: .4byte 0x08C05414
_0802E360: .4byte gPlaySt
_0802E364: .4byte 0x08D648F4

	thumb_func_start sub_0802E368
sub_0802E368: @ 0x0802E368
	push {lr}
	ldr r1, _0802E37C @ =gPlaySt
	strb r0, [r1, #0x15]
	bl sub_0802D8E4
	bl sub_0802E220
	pop {r0}
	bx r0
	.align 2, 0
_0802E37C: .4byte gPlaySt
