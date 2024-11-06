	.section .data

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

	.global ProcScr_08DB9378
ProcScr_08DB9378:	@ 0x08DB9378
	.incbin "FireEmblem7J.base.gba", 0xDB9378, 0xDB9398 - 0xDB9378

	.global ProcScr_08DB9398
ProcScr_08DB9398:	@ 0x08DB9398
	.incbin "FireEmblem7J.base.gba", 0xDB9398, 0xDB93B0 - 0xDB9398

	.global gUnk_08DB93B0
gUnk_08DB93B0:	@ 0x08DB93B0
	.incbin "FireEmblem7J.base.gba", 0xDB93B0, 0xDB93D0 - 0xDB93B0

	.global ProcScr_08DB93D0
ProcScr_08DB93D0:	@ 0x08DB93D0
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
