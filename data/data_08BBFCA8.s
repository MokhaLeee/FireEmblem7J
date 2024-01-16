	.section .data

	.incbin "FireEmblem7J.base.gba", 0xBBFCA8, 0xBFF760 - 0xBBFCA8

	.global Sprite_8x8
Sprite_8x8:
	.incbin "FireEmblem7J.base.gba", 0xBFF760, 8

	.global Sprite_16x16
Sprite_16x16:
	.incbin "FireEmblem7J.base.gba", 0xBFF768, 8

	.global Sprite_32x32
Sprite_32x32:
	.incbin "FireEmblem7J.base.gba", 0xBFF770, 8

	.global Sprite_64x64
Sprite_64x64:
	.incbin "FireEmblem7J.base.gba", 0xBFF778, 8

	.global Sprite_8x16
Sprite_8x16:
	.incbin "FireEmblem7J.base.gba", 0xBFF780, 8

	.global Sprite_16x32
Sprite_16x32:
	.incbin "FireEmblem7J.base.gba", 0xBFF788, 8

	.global Sprite_32x64
Sprite_32x64:
	.incbin "FireEmblem7J.base.gba", 0xBFF790, 8

	.global Sprite_16x8
Sprite_16x8:
	.incbin "FireEmblem7J.base.gba", 0xBFF798, 8

	.global Sprite_32x16
Sprite_32x16:
	.incbin "FireEmblem7J.base.gba", 0xBFF7A0, 8

	.global Sprite_64x32
Sprite_64x32:
	.incbin "FireEmblem7J.base.gba", 0xBFF7A8, 8

	.global Sprite_32x8
Sprite_32x8:
	.incbin "FireEmblem7J.base.gba", 0xBFF7B0, 8

	.global Sprite_8x32
Sprite_8x32:
	.incbin "FireEmblem7J.base.gba", 0xBFF7B8, 0xC01744 - 0xBFF7B8
