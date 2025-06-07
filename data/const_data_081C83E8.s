	.section .rodata

	.global Img_MineFx
Img_MineFx:	@ 0x081C83E8
	.incbin "FireEmblem7J.base.gba", 0x1C83E8, 0x1C855C - 0x1C83E8

	.global SpritAnim_MineFx
SpritAnim_MineFx:	@ 0x081C855C
	.incbin "FireEmblem7J.base.gba", 0x1C855C, 0x1C85F0 - 0x1C855C

	.global Pal_MineFx
Pal_MineFx:	@ 0x081C85F0
	.incbin "FireEmblem7J.base.gba", 0x1C85F0, 0x1C8610 - 0x1C85F0

	.global Img_OneYearLater
Img_OneYearLater:	@ 0x081C8610
	.incbin "FireEmblem7J.base.gba", 0x1C8610, 0x1C8AF8 - 0x1C8610

	.global Pal_OneYearLater
Pal_OneYearLater:	@ 0x081C8AF8
	.incbin "FireEmblem7J.base.gba", 0x1C8AF8, 0x1C8B18 - 0x1C8AF8

	.global Tsa_OneYearLater
Tsa_OneYearLater:	@ 0x081C8B18
	.incbin "FireEmblem7J.base.gba", 0x1C8B18, 0x1C8FCC - 0x1C8B18

	.global TacticianAffins
TacticianAffins:
	.incbin "FireEmblem7J.base.gba", 0x1C8FCC, 0xC0

	.incbin "FireEmblem7J.base.gba", 0x1C908C, 0x1C9108 - 0x1C908C

	.global gUnk_081C9108
gUnk_081C9108:	@ 0x081C9108
	.incbin "FireEmblem7J.base.gba", 0x1C9108, 0x1C9150 - 0x1C9108

	.global gUnk_081C9150
gUnk_081C9150:	@ 0x081C9150
	.incbin "FireEmblem7J.base.gba", 0x1C9150, 0x1C9170 - 0x1C9150

	.global gUnk_081C9170
gUnk_081C9170:	@ 0x081C9170
	.incbin "FireEmblem7J.base.gba", 0x1C9170, 0x1C91A4 - 0x1C9170

	.global gUnk_081C91A4
gUnk_081C91A4:	@ 0x081C91A4
	.incbin "FireEmblem7J.base.gba", 0x1C91A4, 0x1C9228 - 0x1C91A4
