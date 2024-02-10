	.section .data

	.global gUnk_08C013F0
gUnk_08C013F0:	@ 0x08C013F0
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

	.global gUnk_08C01674
gUnk_08C01674:	@ 0x08C01674
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_SET_END_CB
	.short 0x4, 0x0
	.word sub_80122CC
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8012214
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_801227C
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global gUnk_08C0169C
gUnk_08C0169C:	@ 0x08C0169C
	.incbin "FireEmblem7J.base.gba", 0xC0169C, 0xC016FC - 0xC0169C

	.global gUnk_08C016FC
gUnk_08C016FC:	@ 0x08C016FC
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8012B64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012B38
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnk_08C01714
gUnk_08C01714:	@ 0x08C01714
	.incbin "FireEmblem7J.base.gba", 0xC01714, 0xC01744 - 0xC01714
