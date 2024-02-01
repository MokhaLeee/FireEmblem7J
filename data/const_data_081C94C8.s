	.section .rodata

	.incbin "FireEmblem7J.base.gba", 0x1C94C8, 0x1DE1E0 - 0x1C94C8

	.global gBanimRoundScripts
gBanimRoundScripts: @ 0x81DE1E0
	.incbin "FireEmblem7J.base.gba", 0x1DE1E0, 0x1DE208 - 0x1DE1E0

	.global gBanimScr_81DE208
gBanimScr_81DE208:
	.incbin "FireEmblem7J.base.gba", 0x1DE208, 5

    .incbin "FireEmblem7J.base.gba", 0x1DE20D, 0x1DF444 - 0x1DE20D

.global Pal_EkrDragon
Pal_EkrDragon:
	.incbin "FireEmblem7J.base.gba", 0x1DF444, 0x20

	.incbin "FireEmblem7J.base.gba", 0x1DF464, 0x2E6C60 - 0x1DF464

.global Pal_EkrDragon_082E6C60
Pal_EkrDragon_082E6C60:
	.incbin "FireEmblem7J.base.gba", 0x2E6C60, 0x20

	.incbin "FireEmblem7J.base.gba", 0x2E6C80, 0x2EB510 - 0x2E6C80

.global Pal_EkrDragon_082EB510
Pal_EkrDragon_082EB510:
	.incbin "FireEmblem7J.base.gba", 0x2EB510, 0x20

	.incbin "FireEmblem7J.base.gba", 0x2EB530, 0x42D268 - 0x2EB530
