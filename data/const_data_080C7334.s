	.section .rodata

	.incbin "FireEmblem7J.base.gba", 0x0C7334, 0x1900E8 - 0x0C7334

.global Pal_UnitSprites
Pal_UnitSprites:
	.incbin "FireEmblem7J.base.gba", 0x1900E8, 0x190168 - 0x1900E8

.global Pal_UnitSpritesPurple
Pal_UnitSpritesPurple:
	.incbin "FireEmblem7J.base.gba", 0x190168, 0x1C8FCC - 0x190168

	.global Unk_081C8FCC
Unk_081C8FCC:
	.incbin "FireEmblem7J.base.gba", 0x1C8FCC, 0xC0

	.incbin "FireEmblem7J.base.gba", 0x1C908C, 0x1C9228 - 0x1C908C
