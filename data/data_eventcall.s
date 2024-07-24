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

	.global ProcScr_08D837F8
ProcScr_08D837F8:	@ 0x08D837F8
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_807E414
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_807E3E8
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word nullsub_70
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_807E428
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_807E3E8
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0
