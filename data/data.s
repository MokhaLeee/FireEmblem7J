	.section .data

	.incbin "FireEmblem7J.base.gba", 0x0C0CB8, (0xBBFC7C - 0x0C0CB8)

	.global gpKeySt
gpKeySt: @ 08BBFC7C
	.word 0x02024C78

	.incbin "FireEmblem7J.base.gba", 0xBBFC80, (0xC0216C - 0xBBFC80)

	.global gUnitLut
gUnitLut: @ 08C0216C
	.incbin "FireEmblem7J.base.gba", 0xC0216C, 0x400

	.incbin "FireEmblem7J.base.gba", 0xC0256C, (0x1000000 - 0xC0256C)
