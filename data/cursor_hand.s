	.section .data

	.global Sprite_UiSpinningArrows_Horizontal
Sprite_UiSpinningArrows_Horizontal:	@ 0x08DAE214
	.incbin "FireEmblem7J.base.gba", 0xDAE214, 0xDAE222 - 0xDAE214

	.global Sprite_UiSpinningArrows_Vertical
Sprite_UiSpinningArrows_Vertical:	@ 0x08DAE222
	.incbin "FireEmblem7J.base.gba", 0xDAE222, 0xDAE22C - 0xDAE222

	.global ProcScr_UiSpinningArrows
ProcScr_UiSpinningArrows:	@ 0x08DAE22C
	.incbin "FireEmblem7J.base.gba", 0xDAE22C, 0xDAE24C - 0xDAE22C
