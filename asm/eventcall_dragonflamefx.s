	.include "macro.inc"
	.syntax unified

    .section .data

	.global ProcScr_DragonFlamefx
ProcScr_DragonFlamefx:	@ 0x08D6F8BC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonFlamefx_Init
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DragonFlamefx_Rotation
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0

	/* flashing out */
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word TryLockParentProc
        @ PROC_CALL
        .short 0x2, 0x0
        .word DragonFlamefx_EndRing
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DragonFlamefx_RefrainBlendAlpha
        @ PROC_WHILE
        .short 0x14, 0x0
        .word CheckBmBgfxDone
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C170
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807BFEC
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807C108
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C170
        @ PROC_CALL
        .short 0x2, 0x0
        .word TryUnlockParentProc
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_DeadDragonFlamefx
ProcScr_DeadDragonFlamefx:	@ 0x08D6F95C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word DeadDragonFlame_Init
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DeadDragonFlame_Rotation
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807C3E8
        @ PROC_WHILE
        .short 0x14, 0x0
        .word CheckBmBgfxDone
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C490
        @ PROC_LABEL
        .short 0xb, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807C58C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807C5A4
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8013F3C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
