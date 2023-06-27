	.section .data

	.incbin "FireEmblem7J.base.gba", 0x1C94C8, 0x1DE1E0 - 0x1C94C8

	.global gBanimRoundScripts
gBanimRoundScripts: @ 0x81DE1E0
	.incbin "FireEmblem7J.base.gba", 0x1DE1E0, 0x1DE208 - 0x1DE1E0

	.global gBanimScr_81DE208
gBanimScr_81DE208:
	.incbin "FireEmblem7J.base.gba", 0x1DE208, 5

	.incbin "FireEmblem7J.base.gba", 0x1DE20D, 0xBBFC7C - 0x1DE20D
