
.macro arm_func_start name
	.align 2, 0
	.global \name
	.arm
	.type \name, function
.endm

.macro arm_func_end name
	.size \name, .-\name
.endm

.set NULL, 0

.macro thumb_func_start name
	.align 2, 0
	.global \name
	.THUMB
	.THUMB_FUNC
	.type \name, function
.endm

.macro non_word_aligned_thumb_func_start name
	.global \name
	.THUMB
	.THUMB_FUNC
	.type \name, function
.endm

.macro thumb_func_end name
	.size \name, .-\name
.endm

.macro function name
    .align 2, 0
    .global \name
    .type \name , function
.endm

.macro endfunction name
    .size \name , . - \name
.endm

@ Generates a glue function to be used when calling
@ the specified arm function from THUMB code.
.macro thumb_interwork_veneer name
	.SECTION .glue_7t
	.global \name\()_t
	.THUMB
	.align 2, 0
	\name\()_t:
	bx pc			@ Use a bx instruction to switch into arm mode. The value of PC is
	nop				@ 4 bytes ahead of the current instruction, so we pad with a nop.
	.arm
	b \name			@ Now in arm mode, jump to the actual function
	.SECTION .text
.endm

@ For hack
.macro blh to, reg=r4
        push {\reg}
        ldr \reg, =\to
        mov r14, \reg
        pop {\reg}
        .short 0xF800
.endm
