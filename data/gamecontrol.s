	.section .data

        .incbin "FireEmblem7J.base.gba", 0xC0172C, 0xC01744 - 0xC0172C

.global ProcScr_GameControl
ProcScr_GameControl: @ 0xC01744
        @ PROC_19
        .short 0x19, 0x0
        .word 0x0
        @ PROC_MARK
        .short 0xf, 0xb
        .word 0x0
        @ PROC_19
        .short 0x19, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_CheckSramResetKeyCombo
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_InitFastStartCheck
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GC_FastStartCheck
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ForceEnableSounds
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word ProcScr_OpeningSeqence
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_PostIntro
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_8012C64
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012E40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012D60
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012E40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ForceEnableSounds
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartTitleScreen_WithMusic
        @ PROC_GOTO
        .short 0xc, 0x17
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x15
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ForceEnableSounds
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartTitleScreen_FlagTrue
        @ PROC_GOTO
        .short 0xc, 0x17
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x16
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ForceEnableSounds
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartTitleScreen_FlagFalse
        @ PROC_GOTO
        .short 0xc, 0x17
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x17
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_PostIntro
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x12
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartTacticianInfo
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4 // L_GAMECTRL_MAINMENU
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ForceEnableSounds
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartMainMenu
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_PostMainMenu
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_CheckForGameEnded
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_InitDemo
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word ProcScr_StartWorldMapEvent
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_DarkenScreen_
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartBattleMap
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012FEC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_DarkenScreen
        @ PROC_LABEL
        .short 0xb, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_InitNextChapter
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80130C0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x13
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8db7eb0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FD9C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80130DC
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartModeSelect
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FE8C
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8db8088
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012F2C
        @ PROC_LABEL
        .short 0xb, 0x14
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8db8048
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_DarkenScreen_
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResumeChapterFromSuspend
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_InitDemo
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_PostLoadSuspend
        @ PROC_GOTO
        .short 0xc, 0x7
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012FB0
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartBattleMap
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012FEC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012FCC
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BAAB8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043290
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012D98
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xb
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80448B8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012D98
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xd
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_802EB7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013128
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xe
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013160
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word IsEventRunning
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_802EBA0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9C0C
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xf
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GC_InitSramResetScreen
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartMidLockingFadeToBlack
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043948
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartMidFadeFromBlack
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndMuralBackground
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
