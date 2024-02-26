	.section .data

	.global gUnk_08D6FAC4
gUnk_08D6FAC4:	@ 0x08D6FAC4
	.incbin "FireEmblem7J.base.gba", 0xD6FAC4, 0xD6FAE4 - 0xD6FAC4

	.global gUnk_08D6FAE4
gUnk_08D6FAE4:	@ 0x08D6FAE4
	.incbin "FireEmblem7J.base.gba", 0xD6FAE4, 0xD6FB1C - 0xD6FAE4

	.global gUnk_08D6FB1C
gUnk_08D6FB1C:	@ 0x08D6FB1C
	.incbin "FireEmblem7J.base.gba", 0xD6FB1C, 0xD6FB5C - 0xD6FB1C

	.global gUnk_08D6FB5C
gUnk_08D6FB5C:	@ 0x08D6FB5C
	.incbin "FireEmblem7J.base.gba", 0xD6FB5C, 0xD6FC14 - 0xD6FB5C

	.global gUnk_08D6FC14
gUnk_08D6FC14:	@ 0x08D6FC14
	.incbin "FireEmblem7J.base.gba", 0xD6FC14, 0xD6FC44 - 0xD6FC14

	.global gUnk_08D6FC44
gUnk_08D6FC44:	@ 0x08D6FC44
	.incbin "FireEmblem7J.base.gba", 0xD6FC44, 0xD7C3A8 - 0xD6FC44

	.global EventSpriteAnimConf_SpawnAssassin
EventSpriteAnimConf_SpawnAssassin:	@ 0x08D7C3A8
	.word  0          @ pal
	.word  Img_EventSpriteAnim_SpawnAssassin    @ img
	.word  ApConf_EventSpriteAnim_SpawnAssassin @ ap_conf
	.short 0x0000	  @ oam0
	.short 0x0200     @ oam2
	.byte  0xB        @ pal_bank
	.byte  0x1        @ pal_size
	.align 2, 0
