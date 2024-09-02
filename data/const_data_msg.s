	.section .rodata

	.incbin "FireEmblem7J.base.gba", 0xB36950, 0xBBB370 - 0xB36950

	.global gMsgTable
gMsgTable:	@ 0x08BBB370
	.incbin "FireEmblem7J.base.gba", 0xBBB370, 0xBBFC44 - 0xBBB370
