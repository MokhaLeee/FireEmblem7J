	.section .data

	.incbin "FireEmblem7J.base.gba", 0xC01B84, 0xC02144 - 0xC01B84

	.global StatusNameStringLut
StatusNameStringLut: @ 08C02144
	.incbin "FireEmblem7J.base.gba", 0xC02144, 0x28

	.global gUnitLut
gUnitLut: @ 08C0216C
	.incbin "FireEmblem7J.base.gba", 0xC0216C, 0x400

	.incbin "FireEmblem7J.base.gba", 0xC0256C, 0xC0328C - 0xC0256C

	.global SleepIconSprites
SleepIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC0328C, 0xC032F0 - 0xC0328C

	.global BerserkIconSprites
BerserkIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC032F0, 0xC03330 - 0xC032F0

	.global SilenceIconSprites
SilenceIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC03330, 0xC033D0 - 0xC03330

	.global PoisonIconSprites
PoisonIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC033D0, 0xC03400 - 0xC033D0

	.global UnkStatusIconSprites
UnkStatusIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC03400, 0xC03528 - 0xC03400
