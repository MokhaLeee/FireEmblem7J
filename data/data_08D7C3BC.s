	.section .data

	.incbin "FireEmblem7J.base.gba", 0xD87F80, 0xD891C8 - 0xD87F80

	.global EventScr_DeathQuoteOnEnd
EventScr_DeathQuoteOnEnd:	@ 0x08D891C8
	.incbin "FireEmblem7J.base.gba", 0xD891C8, 0xD8977C - 0xD891C8

	.global ProcScr_NilsEpilogueIntro
ProcScr_NilsEpilogueIntro:	@ 0x08D8977C
	.incbin "FireEmblem7J.base.gba", 0xD8977C, 0xD897EC - 0xD8977C

	.global ProcScr_NilsEpilogueOutro
ProcScr_NilsEpilogueOutro:	@ 0x08D897EC
	.incbin "FireEmblem7J.base.gba", 0xD897EC, 0xD8A0E0 - 0xD897EC

	.global gUnk_08D8A0E0
gUnk_08D8A0E0:	@ 0x08D8A0E0
	.incbin "FireEmblem7J.base.gba", 0xD8A0E0, 0xD8A114 - 0xD8A0E0

	.global gUnk_08D8A114
gUnk_08D8A114:	@ 0x08D8A114
	.incbin "FireEmblem7J.base.gba", 0xD8A114, 0xD8A148 - 0xD8A114

	.global gUnk_08D8A148
gUnk_08D8A148:	@ 0x08D8A148
	.incbin "FireEmblem7J.base.gba", 0xD8A148, 0xD8A1B4 - 0xD8A148

	.global gUnk_08D8A1B4
gUnk_08D8A1B4:	@ 0x08D8A1B4
	.incbin "FireEmblem7J.base.gba", 0xD8A1B4, 0xD8A220 - 0xD8A1B4
