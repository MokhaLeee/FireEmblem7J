	.section .data

	.global ProcScr_SaveDrawCursor
ProcScr_SaveDrawCursor:	@ 0x08DADA8C
	@ PROC_19
	.short 0x19, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveDrawCursor_Init
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word SaveDrawCursor_Loop
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global gUnk_08DADAAC
gUnk_08DADAAC:	@ 0x08DADAAC
	.incbin "FireEmblem7J.base.gba", 0xDADAAC, 0xDADAC8 - 0xDADAAC

	.global gUnk_08DADAC8
gUnk_08DADAC8:	@ 0x08DADAC8
	.incbin "FireEmblem7J.base.gba", 0xDADAC8, 0xDADAE8 - 0xDADAC8

	.global ProcScr_SaveBgUp
ProcScr_SaveBgUp:	@ 0x08DADAE8
	.incbin "FireEmblem7J.base.gba", 0xDADAE8, 0xDADD34 - 0xDADAE8

	.global gUnk_08DADD34
gUnk_08DADD34:	@ 0x08DADD34
	.incbin "FireEmblem7J.base.gba", 0xDADD34, 0xDADD50 - 0xDADD34

	.global gUnk_08DADD50
gUnk_08DADD50:	@ 0x08DADD50
	.incbin "FireEmblem7J.base.gba", 0xDADD50, 0xDADD78 - 0xDADD50

	.global gUnk_08DADD78
gUnk_08DADD78:	@ 0x08DADD78
	.incbin "FireEmblem7J.base.gba", 0xDADD78, 0xDADD84 - 0xDADD78

	.global gUnk_08DADD84
gUnk_08DADD84:	@ 0x08DADD84
	.incbin "FireEmblem7J.base.gba", 0xDADD84, 0xDADD90 - 0xDADD84

	.global gUnk_08DADD90
gUnk_08DADD90:	@ 0x08DADD90
	.incbin "FireEmblem7J.base.gba", 0xDADD90, 0xDADDB0 - 0xDADD90

	.global gUnk_08DADDB0
gUnk_08DADDB0:	@ 0x08DADDB0
	.incbin "FireEmblem7J.base.gba", 0xDADDB0, 0xDADDC0 - 0xDADDB0
