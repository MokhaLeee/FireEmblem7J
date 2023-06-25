	.section .data

	.incbin "FireEmblem7J.base.gba", 0x1C94C8, 0xBBFC7C - 0x1C94C8

	.global gpKeySt
gpKeySt: @ 08BBFC7C
	.word 0x02024C78

	.incbin "FireEmblem7J.base.gba", 0xBBFC80, 0xC02144 - 0xBBFC80

	.global StatusNameStringLut
StatusNameStringLut: @ 08C02144
	.incbin "FireEmblem7J.base.gba", 0xC02144, 0x28

	.global gUnitLut
gUnitLut: @ 08C0216C
	.incbin "FireEmblem7J.base.gba", 0xC0216C, 0x400

	.incbin "FireEmblem7J.base.gba", 0xC0256C, 0xC03528 - 0xC0256C
