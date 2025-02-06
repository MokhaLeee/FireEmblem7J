	.section .data

	.global ProcScr_PrepMenu
ProcScr_PrepMenu:	@ 0x08D8C6E4
	.incbin "FireEmblem7J.base.gba", 0xD8C6E4, 0xD8C73C - 0xD8C6E4

	.global gUnk_08D8C73C
gUnk_08D8C73C:	@ 0x08D8C73C
	.incbin "FireEmblem7J.base.gba", 0xD8C73C, 0xD8C744 - 0xD8C73C

	.global gUnk_08D8C744
gUnk_08D8C744:	@ 0x08D8C744
	.incbin "FireEmblem7J.base.gba", 0xD8C744, 0xD8C74C - 0xD8C744

	.global gUnk_08D8C74C
gUnk_08D8C74C:	@ 0x08D8C74C
	.incbin "FireEmblem7J.base.gba", 0xD8C74C, 0xD8C794 - 0xD8C74C

	.global gUnk_08D8C794
gUnk_08D8C794:	@ 0x08D8C794
	.incbin "FireEmblem7J.base.gba", 0xD8C794, 0xD8C7E8 - 0xD8C794

	.global gUnk_08D8C7E8
gUnk_08D8C7E8:	@ 0x08D8C7E8
	.incbin "FireEmblem7J.base.gba", 0xD8C7E8, 0xD8C8AC - 0xD8C7E8

	.global gUnk_08D8C8AC
gUnk_08D8C8AC:	@ 0x08D8C8AC
	.incbin "FireEmblem7J.base.gba", 0xD8C8AC, 0xD8C8E4 - 0xD8C8AC

	.global gUnk_08D8C8E4
gUnk_08D8C8E4:	@ 0x08D8C8E4
	.incbin "FireEmblem7J.base.gba", 0xD8C8E4, 0xD8C904 - 0xD8C8E4

	.global gUnk_08D8C904
gUnk_08D8C904:	@ 0x08D8C904
	.incbin "FireEmblem7J.base.gba", 0xD8C904, 0xD8C94C - 0xD8C904

	.global gUnk_08D8C94C
gUnk_08D8C94C:	@ 0x08D8C94C
	.incbin "FireEmblem7J.base.gba", 0xD8C94C, 0xD8C96C - 0xD8C94C

	.global gUnk_08D8C96C
gUnk_08D8C96C:	@ 0x08D8C96C
	.incbin "FireEmblem7J.base.gba", 0xD8C96C, 0xD8C984 - 0xD8C96C

	.global gUnk_08D8C984
gUnk_08D8C984:	@ 0x08D8C984
	.incbin "FireEmblem7J.base.gba", 0xD8C984, 0xD8C9A8 - 0xD8C984

	.global gUnk_08D8C9A8
gUnk_08D8C9A8:	@ 0x08D8C9A8
	.incbin "FireEmblem7J.base.gba", 0xD8C9A8, 0xD8C9C0 - 0xD8C9A8

	.global gUnk_08D8C9C0
gUnk_08D8C9C0:	@ 0x08D8C9C0
	.incbin "FireEmblem7J.base.gba", 0xD8C9C0, 0xD8CDA8 - 0xD8C9C0

	.global gUnk_08D8CDA8
gUnk_08D8CDA8:	@ 0x08D8CDA8
	.incbin "FireEmblem7J.base.gba", 0xD8CDA8, 0xD8CDBC - 0xD8CDA8

	.global gUnk_08D8CDBC
gUnk_08D8CDBC:	@ 0x08D8CDBC
	.incbin "FireEmblem7J.base.gba", 0xD8CDBC, 0xD8CDD0 - 0xD8CDBC

	.global gUnk_08D8CDD0
gUnk_08D8CDD0:	@ 0x08D8CDD0
	.incbin "FireEmblem7J.base.gba", 0xD8CDD0, 0xD8CDE4 - 0xD8CDD0

	.global gUnk_08D8CDE4
gUnk_08D8CDE4:	@ 0x08D8CDE4
	.incbin "FireEmblem7J.base.gba", 0xD8CDE4, 0xD8CF74 - 0xD8CDE4

	.global gUnk_08D8CF74
gUnk_08D8CF74:	@ 0x08D8CF74
	.incbin "FireEmblem7J.base.gba", 0xD8CF74, 0xD8CFBC - 0xD8CF74

	.global ProcScr_PrepItemUseScreen
ProcScr_PrepItemUseScreen:	@ 0x08D8CFBC
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8095824
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8095830
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_LABEL
	.short 0xb, 0x1
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_8095B64
	@ PROC_LABEL
	.short 0xb, 0x2
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8095D38
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_8095D58
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x3
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_HandleItemEffect
	@ PROC_START_CHILD_BLOCKING
	.short 0x6, 0x1
	.word ProcScr_PrepItemUseBooster
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x4
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80960C4
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_WHILE
	.short 0x14, 0x0
	.word MusicProc4Exists
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_ExecPromotionItem
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word PrepItemUse_WaitPromotionDone
	@ PROC_SLEEP
	.short 0xe, 0x8
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_ResetBgmAfterPromo
	@ PROC_SLEEP
	.short 0xe, 0x1e
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_PostPromotion
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8095830
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_WHILE
	.short 0x14, 0x0
	.word MusicProc4Exists
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x5
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_LABEL
	.short 0xb, 0x6
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8095C90
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global ProcScr_PrepItemUseBooster
ProcScr_PrepItemUseBooster:
	@ PROC_SET_END_CB
	.short 0x4, 0x0
	.word sub_8096374
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80961B8
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_8096330
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global gUnk_08D8D10C
gUnk_08D8D10C:	@ 0x08D8D10C
	.incbin "FireEmblem7J.base.gba", 0xD8D10C, 0xD8D118 - 0xD8D10C

	.global gUnk_08D8D118
gUnk_08D8D118:	@ 0x08D8D118
	.incbin "FireEmblem7J.base.gba", 0xD8D118, 0xD8D120 - 0xD8D118

	.global gUnk_08D8D120
gUnk_08D8D120:	@ 0x08D8D120
	.incbin "FireEmblem7J.base.gba", 0xD8D120, 0xD8D1F0 - 0xD8D120

	.global gUnk_08D8D1F0
gUnk_08D8D1F0:	@ 0x08D8D1F0
	.incbin "FireEmblem7J.base.gba", 0xD8D1F0, 0xD8D318 - 0xD8D1F0

	.global gUnk_08D8D318
gUnk_08D8D318:	@ 0x08D8D318
	.incbin "FireEmblem7J.base.gba", 0xD8D318, 0xD8D410 - 0xD8D318

	.global gUnk_08D8D410
gUnk_08D8D410:	@ 0x08D8D410
	.incbin "FireEmblem7J.base.gba", 0xD8D410, 0xD8D418 - 0xD8D410

	.global gUnk_08D8D418
gUnk_08D8D418:	@ 0x08D8D418
	.incbin "FireEmblem7J.base.gba", 0xD8D418, 0xD8D4E8 - 0xD8D418

	.global gUnk_08D8D4E8
gUnk_08D8D4E8:	@ 0x08D8D4E8
	.incbin "FireEmblem7J.base.gba", 0xD8D4E8, 0xD8D4F8 - 0xD8D4E8

	.global gUnk_08D8D4F8
gUnk_08D8D4F8:	@ 0x08D8D4F8
	.incbin "FireEmblem7J.base.gba", 0xD8D4F8, 0xD8D51C - 0xD8D4F8

	.global gUnk_08D8D51C
gUnk_08D8D51C:	@ 0x08D8D51C
	.incbin "FireEmblem7J.base.gba", 0xD8D51C, 0xD8D538 - 0xD8D51C

	.global gUnk_08D8D538
gUnk_08D8D538:	@ 0x08D8D538
	.incbin "FireEmblem7J.base.gba", 0xD8D538, 0xD8D5F8 - 0xD8D538

	.global gUnk_08D8D5F8
gUnk_08D8D5F8:	@ 0x08D8D5F8
	.incbin "FireEmblem7J.base.gba", 0xD8D5F8, 0xD8D60C - 0xD8D5F8

	.global gUnk_08D8D60C
gUnk_08D8D60C:	@ 0x08D8D60C
	.incbin "FireEmblem7J.base.gba", 0xD8D60C, 0xD8D620 - 0xD8D60C

	.global gUnk_08D8D620
gUnk_08D8D620:	@ 0x08D8D620
	.incbin "FireEmblem7J.base.gba", 0xD8D620, 0xD8D634 - 0xD8D620

	.global gUnk_08D8D634
gUnk_08D8D634:	@ 0x08D8D634
	.incbin "FireEmblem7J.base.gba", 0xD8D634, 0xD8D674 - 0xD8D634

	.global gUnk_08D8D674
gUnk_08D8D674:	@ 0x08D8D674
	.incbin "FireEmblem7J.base.gba", 0xD8D674, 0xD8D688 - 0xD8D674

	.global gUnk_08D8D688
gUnk_08D8D688:	@ 0x08D8D688
	.incbin "FireEmblem7J.base.gba", 0xD8D688, 0xD8D720 - 0xD8D688

	.global gUnk_08D8D720
gUnk_08D8D720:	@ 0x08D8D720
	.incbin "FireEmblem7J.base.gba", 0xD8D720, 0xD8D738 - 0xD8D720

	.global gUnk_08D8D738
gUnk_08D8D738:	@ 0x08D8D738
	.incbin "FireEmblem7J.base.gba", 0xD8D738, 0xD8D744 - 0xD8D738

	.global gUnk_08D8D744
gUnk_08D8D744:	@ 0x08D8D744
	.incbin "FireEmblem7J.base.gba", 0xD8D744, 0xD8D84C - 0xD8D744

	.global gUnk_08D8D84C
gUnk_08D8D84C:	@ 0x08D8D84C
	.incbin "FireEmblem7J.base.gba", 0xD8D84C, 0xD8DCD4 - 0xD8D84C

	.global gUnk_08D8DCD4
gUnk_08D8DCD4:	@ 0x08D8DCD4
	.incbin "FireEmblem7J.base.gba", 0xD8DCD4, 0xD8DD0C - 0xD8DCD4

	.global gUnk_08D8DD0C
gUnk_08D8DD0C:	@ 0x08D8DD0C
	.incbin "FireEmblem7J.base.gba", 0xD8DD0C, 0xD8DD68 - 0xD8DD0C

	.global gUnk_08D8DD68
gUnk_08D8DD68:	@ 0x08D8DD68
	.incbin "FireEmblem7J.base.gba", 0xD8DD68, 0xD8DE48 - 0xD8DD68

	.global gUnk_08D8DE48
gUnk_08D8DE48:	@ 0x08D8DE48
	.incbin "FireEmblem7J.base.gba", 0xD8DE48, 0xD8DEB0 - 0xD8DE48

	.global gUnk_08D8DEB0
gUnk_08D8DEB0:	@ 0x08D8DEB0
	.incbin "FireEmblem7J.base.gba", 0xD8DEB0, 0xD8DEB8 - 0xD8DEB0

	.global gUnk_08D8DEB8
gUnk_08D8DEB8:	@ 0x08D8DEB8
	.incbin "FireEmblem7J.base.gba", 0xD8DEB8, 0xD8DEC6 - 0xD8DEB8

	.global gUnk_08D8DEC6
gUnk_08D8DEC6:	@ 0x08D8DEC6
	.incbin "FireEmblem7J.base.gba", 0xD8DEC6, 0xD8DED4 - 0xD8DEC6

	.global gUnk_08D8DED4
gUnk_08D8DED4:	@ 0x08D8DED4
	.incbin "FireEmblem7J.base.gba", 0xD8DED4, 0xD8DEE2 - 0xD8DED4

	.global gUnk_08D8DEE2
gUnk_08D8DEE2:	@ 0x08D8DEE2
	.incbin "FireEmblem7J.base.gba", 0xD8DEE2, 0xD8DEF8 - 0xD8DEE2

	.global gUnk_08D8DEF8
gUnk_08D8DEF8:	@ 0x08D8DEF8
	.incbin "FireEmblem7J.base.gba", 0xD8DEF8, 0xD8E040 - 0xD8DEF8

	.global gUnk_08D8E040
gUnk_08D8E040:	@ 0x08D8E040
	.incbin "FireEmblem7J.base.gba", 0xD8E040, 0xD8E084 - 0xD8E040

	.global gUnk_08D8E084
gUnk_08D8E084:	@ 0x08D8E084
	.incbin "FireEmblem7J.base.gba", 0xD8E084, 0xDA4190 - 0xD8E084

	.global gUnk_08DA4190
gUnk_08DA4190:	@ 0x08DA4190
	.incbin "FireEmblem7J.base.gba", 0xDA4190, 0xDA41B0 - 0xDA4190

	.global gUnk_08DA41B0
gUnk_08DA41B0:	@ 0x08DA41B0
	.incbin "FireEmblem7J.base.gba", 0xDA41B0, 0xDA9A98 - 0xDA41B0

	.global gUnk_08DA9A98
gUnk_08DA9A98:	@ 0x08DA9A98
	.incbin "FireEmblem7J.base.gba", 0xDA9A98, 0xDA9AB8 - 0xDA9A98

	.global gUnk_08DA9AB8
gUnk_08DA9AB8:	@ 0x08DA9AB8
	.incbin "FireEmblem7J.base.gba", 0xDA9AB8, 0xDA9AD8 - 0xDA9AB8

	.global gUnk_08DA9AD8
gUnk_08DA9AD8:	@ 0x08DA9AD8
	.incbin "FireEmblem7J.base.gba", 0xDA9AD8, 0xDA9AF8 - 0xDA9AD8

	.global gUnk_08DA9AF8
gUnk_08DA9AF8:	@ 0x08DA9AF8
	.incbin "FireEmblem7J.base.gba", 0xDA9AF8, 0xDA9B78 - 0xDA9AF8

	.global gUnk_08DA9B78
gUnk_08DA9B78:	@ 0x08DA9B78
	.incbin "FireEmblem7J.base.gba", 0xDA9B78, 0xDA9B98 - 0xDA9B78

	.global gUnk_08DA9B98
gUnk_08DA9B98:	@ 0x08DA9B98
	.incbin "FireEmblem7J.base.gba", 0xDA9B98, 0xDA9BB8 - 0xDA9B98

	.global gUnk_08DA9BB8
gUnk_08DA9BB8:	@ 0x08DA9BB8
	.incbin "FireEmblem7J.base.gba", 0xDA9BB8, 0xDA9D18 - 0xDA9BB8

	.global gUnk_08DA9D18
gUnk_08DA9D18:	@ 0x08DA9D18
	.incbin "FireEmblem7J.base.gba", 0xDA9D18, 0xDA9D38 - 0xDA9D18

	.global gUnk_08DA9D38
gUnk_08DA9D38:	@ 0x08DA9D38
	.incbin "FireEmblem7J.base.gba", 0xDA9D38, 0xDAD280 - 0xDA9D38
