	.section .data

	.global ProcScr_TacticianConfig
ProcScr_TacticianConfig:	@ 0x08DADDC0
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word TacticianConfig_Init
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A79C8
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A7A60
	@ PROC_LABEL
	.short 0xb, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word TacticianConfig_SetupGfx
	@ PROC_CALL_ARG
	.short 0x18, 0x4
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A76FC
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A773C
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A7778
	@ PROC_LABEL
	.short 0xb, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A77AC
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A77E8
	@ PROC_LABEL
	.short 0xb, 0x2
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A76C8
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A7834
	@ PROC_LABEL
	.short 0xb, 0x4
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x8
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A781C
	@ PROC_CALL
	.short 0x2, 0x0
	.word StartTacticianNameSelect
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word TacticianConfig_SetupGfx
	@ PROC_CALL_ARG
	.short 0x18, 0x8
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_GOTO
	.short 0xc, 0x2
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x3
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x4
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A781C
	@ PROC_LABEL
	.short 0xb, 0x5
	.word 0x0
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A79B8
	@ PROC_SLEEP
	.short 0xe, 0xa
	.word 0x0
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global gUnk_08DADF00
gUnk_08DADF00:	@ 0x08DADF00
	.incbin "FireEmblem7J.base.gba", 0xDADF00, 0xDADF10 - 0xDADF00

	.global gUnk_08DADF10
gUnk_08DADF10:	@ 0x08DADF10
	.incbin "FireEmblem7J.base.gba", 0xDADF10, 0xDADF40 - 0xDADF10

	.global gUnk_08DADF40
gUnk_08DADF40:	@ 0x08DADF40
	.incbin "FireEmblem7J.base.gba", 0xDADF40, 0xDADF48 - 0xDADF40

	.global gUnk_08DADF48
gUnk_08DADF48:	@ 0x08DADF48
	.incbin "FireEmblem7J.base.gba", 0xDADF48, 0xDADF68 - 0xDADF48

	.global gUnk_08DADF68
gUnk_08DADF68:	@ 0x08DADF68
	.incbin "FireEmblem7J.base.gba", 0xDADF68, 0xDADF98 - 0xDADF68

	.global gUnk_08DADF98
gUnk_08DADF98:	@ 0x08DADF98
	.incbin "FireEmblem7J.base.gba", 0xDADF98, 0xDADFC8 - 0xDADF98

	.global gUnk_08DADFC8
gUnk_08DADFC8:	@ 0x08DADFC8
	.incbin "FireEmblem7J.base.gba", 0xDADFC8, 0xDADFF8 - 0xDADFC8
