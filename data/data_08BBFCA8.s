	.section .data

	.incbin "FireEmblem7J.base.gba", 0xBBFCA8, 0xBFF760 - 0xBBFCA8

	.global Sprite_8x8
Sprite_8x8:
	.incbin "FireEmblem7J.base.gba", 0xBFF760, 0xBFF768 - 0xBFF760

	.global Sprite_16x16
Sprite_16x16:
	.incbin "FireEmblem7J.base.gba", 0xBFF768, 0xBFF770 - 0xBFF768

	.global Sprite_32x32
Sprite_32x32:
	.incbin "FireEmblem7J.base.gba", 0xBFF770, 0xBFF788 - 0xBFF770

	.global Sprite_16x32
Sprite_16x32:
	.incbin "FireEmblem7J.base.gba", 0xBFF788, 0xC01744 - 0xBFF788
