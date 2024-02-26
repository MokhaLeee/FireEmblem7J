	.section .rodata

	.global Img_EventSpriteAnim_SpawnAssassin
Img_EventSpriteAnim_SpawnAssassin:	@ 0x081C778C
	.incbin "FireEmblem7J.base.gba", 0x1C778C, 0x1C82E0 - 0x1C778C

	.global ApConf_EventSpriteAnim_SpawnAssassin
ApConf_EventSpriteAnim_SpawnAssassin:	@ 0x081C82E0
	.incbin "FireEmblem7J.base.gba", 0x1C82E0, 0x1C83E8 - 0x1C82E0
