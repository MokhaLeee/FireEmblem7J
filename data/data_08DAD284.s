	.section .data

	.global gUnk_08DAD284
gUnk_08DAD284:	@ 0x08DAD284
	.incbin "FireEmblem7J.base.gba", 0xDAD284, 0xDAD294 - 0xDAD284

	.global gpSramExtraData
gpSramExtraData:	@ 0x08DAD294
	.incbin "FireEmblem7J.base.gba", 0xDAD294, 0xDAD298 - 0xDAD294

	.global gExtraMapInfo
gExtraMapInfo:	@ 0x08DAD298
	.word 0x0203F000

	.global gUnk_08DAD29C
gUnk_08DAD29C:	@ 0x08DAD29C
	.incbin "FireEmblem7J.base.gba", 0xDAD29C, 0xDAD33C - 0xDAD29C

	.global gUnk_08DAD33C
gUnk_08DAD33C:	@ 0x08DAD33C
	.incbin "FireEmblem7J.base.gba", 0xDAD33C, 0xDAD354 - 0xDAD33C

	.global gUnk_08DAD354
gUnk_08DAD354:	@ 0x08DAD354
	.incbin "FireEmblem7J.base.gba", 0xDAD354, 0xDAD384 - 0xDAD354

	.global gUnk_08DAD384
gUnk_08DAD384:	@ 0x08DAD384
	.incbin "FireEmblem7J.base.gba", 0xDAD384, 0xDAD3A4 - 0xDAD384
