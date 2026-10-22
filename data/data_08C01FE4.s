	.section .data

	.global gUnk_08C0212C
gUnk_08C0212C:	@ 0x08C0212C
	.incbin "FireEmblem7J.base.gba", 0xC0212C, 0xC02144 - 0xC0212C

	.global StatusNameStringLut
StatusNameStringLut: @ 08C02144
	.incbin "FireEmblem7J.base.gba", 0xC02144, 0x28

	.global gUnitLut
gUnitLut: @ 08C0216C
	.incbin "FireEmblem7J.base.gba", 0xC0216C, 0x400

	.global gUnk_08C0256C
gUnk_08C0256C:	@ 0x08C0256C
	.incbin "FireEmblem7J.base.gba", 0xC0256C, 0xC02570 - 0xC0256C

	.global gUnk_08C02570
gUnk_08C02570:	@ 0x08C02570
	.incbin "FireEmblem7J.base.gba", 0xC02570, 0xC025F8 - 0xC02570

	.global gUnk_08C025F8
gUnk_08C025F8:	@ 0x08C025F8
	.incbin "FireEmblem7J.base.gba", 0xC025F8, 0xC02600 - 0xC025F8

	.global gUnk_08C02600
gUnk_08C02600:	@ 0x08C02600
	.incbin "FireEmblem7J.base.gba", 0xC02600, 0xC02618 - 0xC02600

	.global gUnk_08C02618
gUnk_08C02618:	@ 0x08C02618
	.incbin "FireEmblem7J.base.gba", 0xC02618, 0xC02630 - 0xC02618

	.global ProcScr_PlayerPhase
ProcScr_PlayerPhase:	@ 0x08C02630
	.incbin "FireEmblem7J.base.gba", 0xC02630, 0xC02828 - 0xC02630
