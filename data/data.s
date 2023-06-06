	.section .data

	.incbin "FireEmblem7J.base.gba", 0x1C9238, 0xBBFC7C - 0x1C9238

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

	.incbin "FireEmblem7J.base.gba", 0xC0256C, 0xC4C158 - 0xC0256C

	.global gCharacterData
gCharacterData: @ 08C4C158
	.incbin "FireEmblem7J.base.gba", 0xC4C158, 0x34 * 0xFD

	.global gClassData
gClassData: @ 08C4F4BC
	.incbin "FireEmblem7J.base.gba", 0xC4F4BC, 0x40 * 0x63

	@ ?
	.incbin "FireEmblem7J.base.gba", 0xC50D7C, 0xC5155C - 0xC50D7C

	.global gItemData
gItemData: @ 08C5155C
	.incbin "FireEmblem7J.base.gba", 0xC5155C, 0x24 * 0x9E

	.incbin "FireEmblem7J.base.gba", 0xC52B94, 0xC52F22 - 0xC52B94

	.global MoveTable_Flying
MoveTable_Flying: @ 08C52F22
	.incbin "FireEmblem7J.base.gba", 0xC52F22, 0xC52FA4 - 0xC52F22

	.global MoveTable_Ballista
MoveTable_Ballista: @ 08C52FA4
	.incbin "FireEmblem7J.base.gba", 0xC52FA4, 0x1000000 - 0xC52FA4
