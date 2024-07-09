	.section .data

	.global BmBgfxConf_08C013F0
BmBgfxConf_08C013F0:	@ 0x08C013F0
	.incbin "FireEmblem7J.base.gba", 0xC013F0, 0xC015DC - 0xC013F0

	.global gUnk_08C015DC
gUnk_08C015DC:	@ 0x08C015DC
	.incbin "FireEmblem7J.base.gba", 0xC015DC, 0xC0162C - 0xC015DC

	.global gUnk_08C0162C
gUnk_08C0162C:	@ 0x08C0162C
	.incbin "FireEmblem7J.base.gba", 0xC0162C, 0xC01654 - 0xC0162C

	.global gUnk_08C01654
gUnk_08C01654:	@ 0x08C01654
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80120D8
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80120E0
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0
