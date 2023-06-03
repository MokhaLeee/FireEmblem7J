	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearOam_thm
ClearOam_thm: @ 0x080C0C20
	bx pc
	.align
	.arm
	b ClearOam

	thumb_func_start TmApplyTsa_thm
TmApplyTsa_thm: @ 0x080C0C28
	bx pc
	.align
	.arm
	b TmApplyTsa

	thumb_func_start TmFillRect_thm
TmFillRect_thm: @ 0x080C0C30
	bx pc
	.align
	.arm
	b TmFillRect

	thumb_func_start ColorFadeTick_thm
ColorFadeTick_thm: @ 0x080C0C38
	bx pc
	.align
	.arm
	b ColorFadeTick

	thumb_func_start TmCopyRect_thm
TmCopyRect_thm: @ 0x080C0C40
	bx pc
	.align
	.arm
	b TmCopyRect

	thumb_func_start Checksum32_thm
Checksum32_thm: @ 0x080C0C48
	bx pc
	.align
	.arm
	b Checksum32
