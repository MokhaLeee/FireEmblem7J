	.section .data

    .incbin "FireEmblem7J.base.gba", 0xC486EC, 0xC4C158 - 0xC486EC

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
	.incbin "FireEmblem7J.base.gba", 0xC52FA4, 0xDAD280 - 0xC52FA4
