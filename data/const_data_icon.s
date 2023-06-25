	.section .rodata

	.global Img_Icons
Img_Icons:
	.incbin "FireEmblem7J.base.gba", 0x0C12F4, (0x0C72F4 - 0x0C12F4)

	.global Pal_Icons
Pal_Icons:
	.incbin "FireEmblem7J.base.gba", 0x0C72F4, 0x40
