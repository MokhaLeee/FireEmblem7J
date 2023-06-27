	.section .data

	.incbin "FireEmblem7J.base.gba", 0xBBFCA8, 0xC02144 - 0xBBFCA8

	.global StatusNameStringLut
StatusNameStringLut: @ 08C02144
	.incbin "FireEmblem7J.base.gba", 0xC02144, 0x28

	.global gUnitLut
gUnitLut: @ 08C0216C
	.incbin "FireEmblem7J.base.gba", 0xC0216C, 0x400

	.incbin "FireEmblem7J.base.gba", 0xC0256C, 0xC03528 - 0xC0256C
