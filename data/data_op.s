	.section .data

	.global ProcScr_TitleAnimSpriteCtrl
ProcScr_TitleAnimSpriteCtrl:	@ 0x08DB8FA0
	.incbin "FireEmblem7J.base.gba", 0xDB8FA0, 0xDB8FC0 - 0xDB8FA0

	.global gUnk_08DB8FC0
gUnk_08DB8FC0:	@ 0x08DB8FC0
	.incbin "FireEmblem7J.base.gba", 0xDB8FC0, 0xDB8FC4 - 0xDB8FC0

	.global gUnk_08DB8FC4
gUnk_08DB8FC4:	@ 0x08DB8FC4
	.incbin "FireEmblem7J.base.gba", 0xDB8FC4, 0xDB8FC8 - 0xDB8FC4

	.global gUnk_08DB8FC8
gUnk_08DB8FC8:	@ 0x08DB8FC8
	.incbin "FireEmblem7J.base.gba", 0xDB8FC8, 0xDB8FCC - 0xDB8FC8

	.global gUnk_08DB8FCC
gUnk_08DB8FCC:	@ 0x08DB8FCC
	.incbin "FireEmblem7J.base.gba", 0xDB8FCC, 0xDB8FD0 - 0xDB8FCC

	.global gUnk_08DB8FD0
gUnk_08DB8FD0:	@ 0x08DB8FD0
	.incbin "FireEmblem7J.base.gba", 0xDB8FD0, 0xDB9010 - 0xDB8FD0

	.global gUnk_08DB9010
gUnk_08DB9010:	@ 0x08DB9010
	.incbin "FireEmblem7J.base.gba", 0xDB9010, 0xDB9030 - 0xDB9010

	.global ProcScr_08DB9030
ProcScr_08DB9030:	@ 0x08DB9030
	.incbin "FireEmblem7J.base.gba", 0xDB9030, 0xDB9058 - 0xDB9030

	.global ProcScr_OpeningSeqence
ProcScr_OpeningSeqence:	@ 0x08DB9058
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC240
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC398
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC4D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BC53C
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BC448
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD36C
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC5B0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC5C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BC8B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BCAAC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BCACC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BCB6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BCC0C
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BCC9C
        @ PROC_LABEL
        .short 0xb, 0x62
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BCD34
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BCE9C
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word NewFadeInWhite
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BCEBC
        @ PROC_WHILE
        .short 0x14, 0x0
        .word CheckBmBgfxDone
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BCB0C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_08DB91A8
ProcScr_08DB91A8:	@ 0x08DB91A8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BCF98
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_08DB91C0
ProcScr_08DB91C0:	@ 0x08DB91C0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD000
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BD19C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD1F0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BD2CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BD304
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD358
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_08DB9208
ProcScr_08DB9208:	@ 0x08DB9208
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD3A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BD3B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnk_08DB9228
gUnk_08DB9228:	@ 0x08DB9228
	.incbin "FireEmblem7J.base.gba", 0xDB9228, 0xDB9248 - 0xDB9228

	.global gUnk_08DB9248
gUnk_08DB9248:	@ 0x08DB9248
	.incbin "FireEmblem7J.base.gba", 0xDB9248, 0xDB92C8 - 0xDB9248

	.global gUnk_08DB92C8
gUnk_08DB92C8:	@ 0x08DB92C8
	.incbin "FireEmblem7J.base.gba", 0xDB92C8, 0xDB9320 - 0xDB92C8

	.global gUnk_08DB9320
gUnk_08DB9320:	@ 0x08DB9320
	.incbin "FireEmblem7J.base.gba", 0xDB9320, 0xDB9378 - 0xDB9320

	.global gUnk_08DB9378
gUnk_08DB9378:	@ 0x08DB9378
	.incbin "FireEmblem7J.base.gba", 0xDB9378, 0xDB9398 - 0xDB9378

	.global gUnk_08DB9398
gUnk_08DB9398:	@ 0x08DB9398
	.incbin "FireEmblem7J.base.gba", 0xDB9398, 0xDB93B0 - 0xDB9398

	.global gUnk_08DB93B0
gUnk_08DB93B0:	@ 0x08DB93B0
	.incbin "FireEmblem7J.base.gba", 0xDB93B0, 0xDB93D0 - 0xDB93B0

	.global gUnk_08DB93D0
gUnk_08DB93D0:	@ 0x08DB93D0
	.incbin "FireEmblem7J.base.gba", 0xDB93D0, 0xDB93F0 - 0xDB93D0

	.global gUnk_08DB93F0
gUnk_08DB93F0:	@ 0x08DB93F0
	.incbin "FireEmblem7J.base.gba", 0xDB93F0, 0xDB941C - 0xDB93F0

	.global gUnk_08DB941C
gUnk_08DB941C:	@ 0x08DB941C
	.incbin "FireEmblem7J.base.gba", 0xDB941C, 0xDB947C - 0xDB941C

	.global gUnk_08DB947C
gUnk_08DB947C:	@ 0x08DB947C
	.incbin "FireEmblem7J.base.gba", 0xDB947C, 0xDB9548 - 0xDB947C

	.global gUnk_08DB9548
gUnk_08DB9548:	@ 0x08DB9548
	.incbin "FireEmblem7J.base.gba", 0xDB9548, 0xDB95D8 - 0xDB9548

	.global gUnk_08DB95D8
gUnk_08DB95D8:	@ 0x08DB95D8
	.incbin "FireEmblem7J.base.gba", 0xDB95D8, 0xDB9674 - 0xDB95D8

	.global gUnk_08DB9674
gUnk_08DB9674:	@ 0x08DB9674
	.incbin "FireEmblem7J.base.gba", 0xDB9674, 0xDB9794 - 0xDB9674

	.global gUnk_08DB9794
gUnk_08DB9794:	@ 0x08DB9794
	.incbin "FireEmblem7J.base.gba", 0xDB9794, 0xDB9A7C - 0xDB9794

	.global gUnk_08DB9A7C
gUnk_08DB9A7C:	@ 0x08DB9A7C
	.incbin "FireEmblem7J.base.gba", 0xDB9A7C, 0xDB9A84 - 0xDB9A7C
