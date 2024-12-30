	.section .data

	.global gUnk_08C01B84
gUnk_08C01B84:	@ 0x08C01B84
	.incbin "FireEmblem7J.base.gba", 0xC01B84, 0xC01BA4 - 0xC01B84

	.global gUnk_08C01BA4
gUnk_08C01BA4:	@ 0x08C01BA4
	.incbin "FireEmblem7J.base.gba", 0xC01BA4, 0xC01BC4 - 0xC01BA4

	.global ProcScr_SpacialSeTest
ProcScr_SpacialSeTest:	@ 0x08C01BC4
	.incbin "FireEmblem7J.base.gba", 0xC01BC4, 0xC01BDC - 0xC01BC4

	.global gUnk_08C01BDC
gUnk_08C01BDC:	@ 0x08C01BDC
	.incbin "FireEmblem7J.base.gba", 0xC01BDC, 0xC01BF4 - 0xC01BDC

	.global gUnk_08C01BF4
gUnk_08C01BF4:	@ 0x08C01BF4
	.incbin "FireEmblem7J.base.gba", 0xC01BF4, 0xC01C14 - 0xC01BF4

	.global gUnk_08C01C14
gUnk_08C01C14:	@ 0x08C01C14
	.incbin "FireEmblem7J.base.gba", 0xC01C14, 0xC01C34 - 0xC01C14

	.global gUnk_08C01C34
gUnk_08C01C34:	@ 0x08C01C34
	.incbin "FireEmblem7J.base.gba", 0xC01C34, 0xC01C54 - 0xC01C34

	.global gUnk_08C01C54
gUnk_08C01C54:	@ 0x08C01C54
	.incbin "FireEmblem7J.base.gba", 0xC01C54, 0xC01C74 - 0xC01C54

	.global gUnk_08C01C74
gUnk_08C01C74:	@ 0x08C01C74
	.incbin "FireEmblem7J.base.gba", 0xC01C74, 0xC01CA4 - 0xC01C74

	.global gUnk_08C01CA4
gUnk_08C01CA4:	@ 0x08C01CA4
	.incbin "FireEmblem7J.base.gba", 0xC01CA4, 0xC01CBC - 0xC01CA4

	.global gUnk_08C01CBC
gUnk_08C01CBC:	@ 0x08C01CBC
	.incbin "FireEmblem7J.base.gba", 0xC01CBC, 0xC01CC0 - 0xC01CBC

	.global gUnk_08C01CC0
gUnk_08C01CC0:	@ 0x08C01CC0
	.incbin "FireEmblem7J.base.gba", 0xC01CC0, 0xC01CC4 - 0xC01CC0

	.global gUnk_08C01CC4
gUnk_08C01CC4:	@ 0x08C01CC4
	.incbin "FireEmblem7J.base.gba", 0xC01CC4, 0xC01CCC - 0xC01CC4

	.global gUnk_08C01CCC
gUnk_08C01CCC:	@ 0x08C01CCC
	.incbin "FireEmblem7J.base.gba", 0xC01CCC, 0xC01CDC - 0xC01CCC

	.global gUnk_08C01CDC
gUnk_08C01CDC:	@ 0x08C01CDC
	.incbin "FireEmblem7J.base.gba", 0xC01CDC, 0xC01CEC - 0xC01CDC

	.global gUnk_08C01CEC
gUnk_08C01CEC:	@ 0x08C01CEC
	.incbin "FireEmblem7J.base.gba", 0xC01CEC, 0xC01D0C - 0xC01CEC

	.global gUnk_08C01D0C
gUnk_08C01D0C:	@ 0x08C01D0C
	.incbin "FireEmblem7J.base.gba", 0xC01D0C, 0xC01DAC - 0xC01D0C

	.global gUnk_08C01DAC
gUnk_08C01DAC:	@ 0x08C01DAC
	.incbin "FireEmblem7J.base.gba", 0xC01DAC, 0xC01DBC - 0xC01DAC

	.global ProcScr_BmMain
ProcScr_BmMain:
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_19
        .short 0x19, 0x0
        .word 0x0
        @ PROC_19
        .short 0x19, 0x0
        .word 0x0
        @ PROC_MARK
        .short 0xf, 0x2
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BmMain_StartIntroFx
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8015918
        @ PROC_CALL
        .short 0x2, 0x0
        .word SetFlag_145
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8018CC4
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word CallChapterStartEventMaybe
        @ PROC_CALL
        .short 0x2, 0x0
        .word BmMain_SuspendBeforePhase
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c0571c
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c02d98
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_38
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ClearFlag_145
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word BmMain_ChangePhase
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8015900
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word 0x8c02920
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c02a68
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word 0x8c020f4
        @ PROC_CALL
        .short 0x2, 0x0
        .word TickActiveFactionTurn
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c05f30
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c05e68
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c05ec8
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c02920
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_8015840
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BmMain_StartPhase
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c0617c
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80158D4
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RenderMap
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartMidLockingFadeToBlack
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RenderMap
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartMidLockingFadeToBlack
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80158B0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c0617c
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80158B0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c0617c
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RenderMap
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartMidLockingFadeToBlack
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_GOTO
        .short 0xc, 0x7
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RenderMap
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartMidLockingFadeToBlack
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c0617c
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
