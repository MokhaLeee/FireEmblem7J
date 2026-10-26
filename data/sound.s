	.section .data

	.global ProcScr_MusicFadeIn
ProcScr_MusicFadeIn:	@ 0x08BBFCA8
	.incbin "FireEmblem7J.base.gba", 0xBBFCA8, 0xBBFCC0 - 0xBBFCA8

	.global ProcScr_MusicVolumeChange
ProcScr_MusicVolumeChange:	@ 0x08BBFCC0
	.incbin "FireEmblem7J.base.gba", 0xBBFCC0, 0xBBFCD8 - 0xBBFCC0

	.global gUnk_08BBFCD8
gUnk_08BBFCD8:	@ 0x08BBFCD8
	.incbin "FireEmblem7J.base.gba", 0xBBFCD8, 0xBBFCE8 - 0xBBFCD8

	.global ProcScr_MusicChange
ProcScr_MusicChange:	@ 0x08BBFCE8
	.incbin "FireEmblem7J.base.gba", 0xBBFCE8, 0xBBFD28 - 0xBBFCE8
