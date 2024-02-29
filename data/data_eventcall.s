	.section .data

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

	.global gUnk_08D7C3BC
gUnk_08D7C3BC:	@ 0x08D7C3BC
	.incbin "FireEmblem7J.base.gba", 0xD7C3BC, 0xD80D24 - 0xD7C3BC

	.global gUnk_08D80D24
gUnk_08D80D24:	@ 0x08D80D24
	.incbin "FireEmblem7J.base.gba", 0xD80D24, 0xD80D2E - 0xD80D24

	.global gUnk_08D80D2E
gUnk_08D80D2E:	@ 0x08D80D2E
	.incbin "FireEmblem7J.base.gba", 0xD80D2E, 0xD837E8 - 0xD80D2E

	.global gUnk_08D837E8
gUnk_08D837E8:	@ 0x08D837E8
	.incbin "FireEmblem7J.base.gba", 0xD837E8, 0xD837F8 - 0xD837E8

	.global gUnk_08D837F8
gUnk_08D837F8:	@ 0x08D837F8
	.incbin "FireEmblem7J.base.gba", 0xD837F8, 0xD84D44 - 0xD837F8

	.global EventSpriteAnimConf_NinianEffect
EventSpriteAnimConf_NinianEffect:	@ 0x08D84D44
	.word  0          @ pal
	.word  Img_EventSpriteAnim_NinianEffect    @ img
	.word  ApConf_EventSpriteAnim_NinianEffect @ ap_conf
	.short 0x0000	  @ oam0
	.short 0x0200     @ oam2
	.byte  0xC        @ pal_bank
	.byte  0x1        @ pal_size
	.align 2, 0

	.global gUnk_08D84D58
gUnk_08D84D58:	@ 0x08D84D58
	.incbin "FireEmblem7J.base.gba", 0xD84D58, 0xD87684 - 0xD84D58

	.global gUnk_08D87684
gUnk_08D87684:	@ 0x08D87684
	.incbin "FireEmblem7J.base.gba", 0xD87684, 0xD87F14 - 0xD87684

	.global EventSpriteAnimConf_NinianPray
EventSpriteAnimConf_NinianPray:	@ 0x08D87F14
	.word  gUnk_081ACA20          @ pal
	.word  gUnk_081AC808    @ img
	.word  0x081AD40C @ ap_conf
	.short 0x0000	  @ oam0
	.short 0x0280     @ oam2
	.byte  0x5        @ pal_bank
	.byte  0x1        @ pal_size
	.align 2, 0
