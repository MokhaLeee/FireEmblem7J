	.section .data

	.global gUnk_08BBFD90
gUnk_08BBFD90:	@ 0x08BBFD90
	.incbin "FireEmblem7J.base.gba", 0xBBFD90, 0xBC0590 - 0xBBFD90

	.global TextColorLutTable
TextColorLutTable:	@ 0x08BC0590
	.incbin "FireEmblem7J.base.gba", 0xBC0590, 0xBC05C4 - 0xBC0590

	.global ProcScr_TextPrint
ProcScr_TextPrint:	@ 0x08BC05C4
	.incbin "FireEmblem7J.base.gba", 0xBC05C4, 0xBC05D4 - 0xBC05C4

	.global ProcScr_GreenTextColor
ProcScr_GreenTextColor:	@ 0x08BC05D4
	.incbin "FireEmblem7J.base.gba", 0xBC05D4, 0xBC1FEC - 0xBC05D4

	.global TextGlyphs_System
TextGlyphs_System:	@ 0x08BC1FEC
	.incbin "FireEmblem7J.base.gba", 0xBC1FEC, 0xBDC134 - 0xBC1FEC

	.global TextGlyphs_Special
TextGlyphs_Special:	@ 0x08BDC134
	.incbin "FireEmblem7J.base.gba", 0xBDC134, 0xBDC1E0 - 0xBDC134

	.global TextGlyphs_Talk
TextGlyphs_Talk:	@ 0x08BDC1E0
	.incbin "FireEmblem7J.base.gba", 0xBDC1E0, 0xBFF760 - 0xBDC1E0
