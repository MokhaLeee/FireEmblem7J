	.section .data

	.global gUnk_08D6FB5C
gUnk_08D6FB5C:	@ 0x08D6FB5C
	.incbin "FireEmblem7J.base.gba", 0xD6FB5C, 0xD6FC14 - 0xD6FB5C

	.global gUnk_08D6FC14
gUnk_08D6FC14:	@ 0x08D6FC14
	.incbin "FireEmblem7J.base.gba", 0xD6FC14, 0xD6FC44 - 0xD6FC14

	.global gUnk_08D6FC44
gUnk_08D6FC44:	@ 0x08D6FC44
	.incbin "FireEmblem7J.base.gba", 0xD6FC44, 0xD7690C - 0xD6FC44

	.global EventSpriteAnimConf_SpawnThief
EventSpriteAnimConf_SpawnThief:		@ 08D7690C
	.word  0          @ pal
	.word  Img_EventSpriteAnim_SpawnThief       @ img
	.word  ApConf_EventSpriteAnim_SpawnAssassin @ ap_conf
	.short 0x0000	  @ oam0
	.short 0x0200     @ oam2
	.byte  0xA        @ pal_bank
	.byte  0x1        @ pal_size
	.align 2, 0

	.incbin "FireEmblem7J.base.gba", 0xD76920, 0xD7C3A8 - 0xD76920
