	.section .data

	.global sDirKeysToOffsetLut
sDirKeysToOffsetLut:	@ 0x08C01FE4
	.incbin "FireEmblem7J.base.gba", 0xC01FE4, 0xC02052 - 0xC01FE4

	.global Sprite_MapCursorStretched
Sprite_MapCursorStretched:	@ 0x08C02052
	.incbin "FireEmblem7J.base.gba", 0xC02052, 0xC0206C - 0xC02052

	.global sMapCursorSpriteLut
sMapCursorSpriteLut:	@ 0x08C0206C
	.incbin "FireEmblem7J.base.gba", 0xC0206C, 0xC020DC - 0xC0206C

	.global gSysUpArrowSpriteLut
gSysUpArrowSpriteLut:	@ 0x08C020DC
	.incbin "FireEmblem7J.base.gba", 0xC020DC, 0xC020E8 - 0xC020DC

	.global gSysDownArrowSpriteLut
gSysDownArrowSpriteLut:	@ 0x08C020E8
	.incbin "FireEmblem7J.base.gba", 0xC020E8, 0xC020F4 - 0xC020E8

	.global ProcScr_CamMove
ProcScr_CamMove:	@ 0x08C020F4
	.incbin "FireEmblem7J.base.gba", 0xC020F4, 0xC0211C - 0xC020F4

	.global gUnk_08C0211C
gUnk_08C0211C:	@ 0x08C0211C
	.incbin "FireEmblem7J.base.gba", 0xC0211C, 0xC0212C - 0xC0211C

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

	.global gUnk_08C02828
gUnk_08C02828:	@ 0x08C02828
	.incbin "FireEmblem7J.base.gba", 0xC02828, 0xC02870 - 0xC02828

	.global gUnk_08C02870
gUnk_08C02870:	@ 0x08C02870
	.incbin "FireEmblem7J.base.gba", 0xC02870, 0xC028A8 - 0xC02870

	.global gUnk_08C028A8
gUnk_08C028A8:	@ 0x08C028A8
	.incbin "FireEmblem7J.base.gba", 0xC028A8, 0xC028C0 - 0xC028A8

	.global gUnk_08C028C0
gUnk_08C028C0:	@ 0x08C028C0
	.incbin "FireEmblem7J.base.gba", 0xC028C0, 0xC028E8 - 0xC028C0

	.global gUnk_08C028E8
gUnk_08C028E8:	@ 0x08C028E8
	.incbin "FireEmblem7J.base.gba", 0xC028E8, 0xC02938 - 0xC028E8

	.global gUnk_08C02938
gUnk_08C02938:	@ 0x08C02938
	.incbin "FireEmblem7J.base.gba", 0xC02938, 0xC02958 - 0xC02938

	.global gUnk_08C02958
gUnk_08C02958:	@ 0x08C02958
	.incbin "FireEmblem7J.base.gba", 0xC02958, 0xC029A8 - 0xC02958

	.global gUnk_08C029A8
gUnk_08C029A8:	@ 0x08C029A8
	.incbin "FireEmblem7J.base.gba", 0xC029A8, 0xC029C0 - 0xC029A8

	.global gUnk_08C029C0
gUnk_08C029C0:	@ 0x08C029C0
	.incbin "FireEmblem7J.base.gba", 0xC029C0, 0xC029E8 - 0xC029C0

	.global gUnk_08C029E8
gUnk_08C029E8:	@ 0x08C029E8
	.incbin "FireEmblem7J.base.gba", 0xC029E8, 0xC02A28 - 0xC029E8

	.global gUnk_08C02A28
gUnk_08C02A28:	@ 0x08C02A28
	.incbin "FireEmblem7J.base.gba", 0xC02A28, 0xC02A48 - 0xC02A28

	.global gUnk_08C02A48
gUnk_08C02A48:	@ 0x08C02A48
	.incbin "FireEmblem7J.base.gba", 0xC02A48, 0xC02A68 - 0xC02A48

	.global ProcScr_BmMain_08C02A68
ProcScr_BmMain_08C02A68:	@ 0x08C02A68
	.incbin "FireEmblem7J.base.gba", 0xC02A68, 0xC02AB0 - 0xC02A68

	.global gUnk_08C02AB0
gUnk_08C02AB0:	@ 0x08C02AB0
	.incbin "FireEmblem7J.base.gba", 0xC02AB0, 0xC02AD0 - 0xC02AB0

	.global gUnk_08C02AD0
gUnk_08C02AD0:	@ 0x08C02AD0
	.incbin "FireEmblem7J.base.gba", 0xC02AD0, 0xC02AF0 - 0xC02AD0

	.global gUnk_08C02AF0
gUnk_08C02AF0:	@ 0x08C02AF0
	.incbin "FireEmblem7J.base.gba", 0xC02AF0, 0xC02B30 - 0xC02AF0

	.global gUnk_08C02B30
gUnk_08C02B30:	@ 0x08C02B30
	.incbin "FireEmblem7J.base.gba", 0xC02B30, 0xC02B58 - 0xC02B30

	.global gUnk_08C02B58
gUnk_08C02B58:	@ 0x08C02B58
	.incbin "FireEmblem7J.base.gba", 0xC02B58, 0xC02B88 - 0xC02B58

	.global gUnk_08C02B88
gUnk_08C02B88:	@ 0x08C02B88
	.incbin "FireEmblem7J.base.gba", 0xC02B88, 0xC02BA8 - 0xC02B88

	.global gUnk_08C02BA8
gUnk_08C02BA8:	@ 0x08C02BA8
	.incbin "FireEmblem7J.base.gba", 0xC02BA8, 0xC02BC8 - 0xC02BA8
