	.section .data

	.global EventScr_Ch27_Beginning
EventScr_Ch27_Beginning:
	.incbin "FireEmblem7J.base.gba", 0xD83854, 0xD84D44 - 0xD83854

	.global EventSpriteAnimConf_NinianDragonDead
EventSpriteAnimConf_NinianDragonDead:	@ 0x08D84D44
	.word  0          @ pal
	.word  Img_EventSpriteAnim_NinianDragonDead    @ img
	.word  ApConf_EventSpriteAnim_NinianDragonDead @ ap_conf
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
	.word  Pal_NinianDispfx     @ pal
	.word  Img_NinianDispfx     @ img
	.word  SpritAnim_NinianPray @ ap_conf
	.short 0x0000	  @ oam0
	.short 0x0280     @ oam2
	.byte  0x5        @ pal_bank
	.byte  0x1        @ pal_size
	.align 2, 0
