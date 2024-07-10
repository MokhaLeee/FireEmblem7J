	.section .data

	.global ProcScr_DragonGatefx
ProcScr_DragonGatefx:	@ 0x08D6F854
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word DragonGatefx_End
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonGatefx_DrawLight
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonGatefx_DrawDragon
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DragonGatefx_MergeDragon
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807BB48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonGatefxSetHBlank
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_DragonSpriteBlinking
ProcScr_DragonSpriteBlinking:	@ 0x08D6F8AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonSpriteBlinking_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DragonSpriteBlinking_Loop

	@ no end?
