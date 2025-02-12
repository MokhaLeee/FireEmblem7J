	.section .data

	.global ProcScr_TactBloodSelect
ProcScr_TactBloodSelect:	@ 0x08DADF68
	.incbin "FireEmblem7J.base.gba", 0xDADF68, 0xDADF98 - 0xDADF68

	.global gUnk_08DADF98
gUnk_08DADF98:	@ 0x08DADF98
	.incbin "FireEmblem7J.base.gba", 0xDADF98, 0xDADFC8 - 0xDADF98

	.global gUnk_08DADFC8
gUnk_08DADFC8:	@ 0x08DADFC8
	.incbin "FireEmblem7J.base.gba", 0xDADFC8, 0xDADFF8 - 0xDADFC8
