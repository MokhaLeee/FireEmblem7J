	.section .data

	.global gUnk_08DBAD14
gUnk_08DBAD14:	@ 0x08DBAD14
	.incbin "FireEmblem7J.base.gba", 0xDBAD14, 0xDC0390 - 0xDBAD14

	.global gUnk_08DC0390
gUnk_08DC0390:	@ 0x08DC0390
	.incbin "FireEmblem7J.base.gba", 0xDC0390, 0xE00008 - 0xDC0390

	.global banim_data
banim_data:	@ 0x08E00008
	.incbin "FireEmblem7J.base.gba", 0xE00008, 0xFC0008 - 0xE00008

	.global battle_terrain_table
battle_terrain_table:	@ 0x08FC0008
	.incbin "FireEmblem7J.base.gba", 0xFC0008, 0xFD8008 - 0xFC0008

	.global character_battle_animation_palette_table
character_battle_animation_palette_table:	@ 0x08FD8008
	.incbin "FireEmblem7J.base.gba", 0xFD8008, 0x1000000 - 0xFD8008
