	.section .rodata

	.global Img_Icons
Img_Icons:
	.incbin "FireEmblem7J.base.gba", 0x0C12F4, (0x0C72F4 - 0x0C12F4)

	.global Pal_Icons
Pal_Icons:
	.incbin "FireEmblem7J.base.gba", 0x0C72F4, 0x40

	.global Img_FactionMiniCard
Img_FactionMiniCard:
	.incbin "FireEmblem7J.base.gba", 0x0C7334, 0x0C8134 - 0x0C7334

	.global Pal_FactionMiniCard
Pal_FactionMiniCard:
	.incbin "FireEmblem7J.base.gba", 0x0C8134, 0x0C8174 - 0x0C8134
