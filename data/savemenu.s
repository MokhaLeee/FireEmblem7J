	.section .data

	.global ProcScr_SaveMenu
ProcScr_SaveMenu:	@ 0x08DAD3A4
	@ PROC_19
	.short 0x19, 0x0
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x0
	.word 0x0
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveMenu_Init
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word ProcSaveMenu_InitScreen
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveMenu_LoadExtraMenuGraphics
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x8
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_WHILE
	.short 0x14, 0x0
	.word MusicProc4Exists
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveMenu_080A465C
	@ PROC_LABEL
	.short 0xb, 0x2
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word Loop6C_savemenu
	@ PROC_GOTO
	.short 0xc, 0xf
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5868
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A5920
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A9578
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5980
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5868
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A58C4
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5A40
	@ PROC_LABEL
	.short 0xb, 0x5
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5A60
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A4B10
	@ PROC_GOTO
	.short 0xc, 0xf
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x7
	.word 0x0
	@ PROC_SLEEP
	.short 0xe, 0x5
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A4D64
	@ PROC_GOTO
	.short 0xc, 0x5
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x6
	.word 0x0
	@ PROC_SLEEP
	.short 0xe, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A4D70
	@ PROC_SLEEP
	.short 0xe, 0x1
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A4D80
	@ PROC_GOTO
	.short 0xc, 0x5
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x3
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A5058
	@ PROC_GOTO
	.short 0xc, 0x5
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x4
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5A94
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A50A0
	@ PROC_GOTO
	.short 0xc, 0x2
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x8
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A50F0
	@ PROC_LABEL
	.short 0xb, 0x9
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A5138
	@ PROC_LABEL
	.short 0xb, 0xc
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A517C
	@ PROC_LABEL
	.short 0xb, 0xd
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A51CC
	@ PROC_LABEL
	.short 0xb, 0xa
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A5218
	@ PROC_LABEL
	.short 0xb, 0xb
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5A80
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80A54C8
	@ PROC_LABEL
	.short 0xb, 0xe
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x8
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_WHILE
	.short 0x14, 0x0
	.word sub_8003F04
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A57BC
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveMenu_Init
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word ProcSaveMenu_InitScreen
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveMenu_LoadExtraMenuGraphics
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x8
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_WHILE
	.short 0x14, 0x0
	.word sub_8003F04
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80A5838
	@ PROC_LABEL
	.short 0xb, 0x15
	.word 0x0
	@ PROC_BLOCK
	.short 0x10, 0x0
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x12
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x4
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_GOTO
	.short 0xc, 0xf
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x11
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x8
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_LABEL
	.short 0xb, 0xf
	.word 0x0
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveMenu_Finish
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global gUnk_08DAD674
gUnk_08DAD674:	@ 0x08DAD674
	.incbin "FireEmblem7J.base.gba", 0xDAD674, 0xDAD784 - 0xDAD674

	.global gUnk_08DAD784
gUnk_08DAD784:	@ 0x08DAD784
	.incbin "FireEmblem7J.base.gba", 0xDAD784, 0xDAD844 - 0xDAD784

	.global gUnk_08DAD844
gUnk_08DAD844:	@ 0x08DAD844
	.incbin "FireEmblem7J.base.gba", 0xDAD844, 0xDAD848 - 0xDAD844

	.global gUnk_08DAD848
gUnk_08DAD848:	@ 0x08DAD848
	.incbin "FireEmblem7J.base.gba", 0xDAD848, 0xDAD8A8 - 0xDAD848

	.global gUnk_08DAD8A8
gUnk_08DAD8A8:	@ 0x08DAD8A8
	.incbin "FireEmblem7J.base.gba", 0xDAD8A8, 0xDAD8C2 - 0xDAD8A8

	.global gUnk_08DAD8C2
gUnk_08DAD8C2:	@ 0x08DAD8C2
	.incbin "FireEmblem7J.base.gba", 0xDAD8C2, 0xDAD8FC - 0xDAD8C2

	.global gUnk_08DAD8FC
gUnk_08DAD8FC:	@ 0x08DAD8FC
	.incbin "FireEmblem7J.base.gba", 0xDAD8FC, 0xDAD904 - 0xDAD8FC

	.global gUnk_08DAD904
gUnk_08DAD904:	@ 0x08DAD904
	.incbin "FireEmblem7J.base.gba", 0xDAD904, 0xDAD90C - 0xDAD904

	.global gUnk_08DAD90C
gUnk_08DAD90C:	@ 0x08DAD90C
	.incbin "FireEmblem7J.base.gba", 0xDAD90C, 0xDAD9D6 - 0xDAD90C

	.global gUnk_08DAD9D6
gUnk_08DAD9D6:	@ 0x08DAD9D6
	.incbin "FireEmblem7J.base.gba", 0xDAD9D6, 0xDAD9E4 - 0xDAD9D6

	.global gUnk_08DAD9E4
gUnk_08DAD9E4:	@ 0x08DAD9E4
	.incbin "FireEmblem7J.base.gba", 0xDAD9E4, 0xDADA10 - 0xDAD9E4

	.global gUnk_08DADA10
gUnk_08DADA10:	@ 0x08DADA10
	.incbin "FireEmblem7J.base.gba", 0xDADA10, 0xDADA3C - 0xDADA10

	.global ProcScr_SaveDraw
ProcScr_SaveDraw:	@ 0x08DADA3C
	@ PROC_19
	.short 0x19, 0x0
	.word 0x0
	@ PROC_MARK
	.short 0xf, 0xc
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word SaveDraw_Init
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word SaveDraw_Loop
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0
