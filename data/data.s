	.section .data

	.incbin "FireEmblem7J.base.gba", 0xC01B84, 0xC01DBC - 0xC01B84

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
        .word sub_08015918
        @ PROC_CALL
        .short 0x2, 0x0
        .word SetFlag_145
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_08018CC4
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
        .word sub_08015900
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
        .word sub_08015840
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
        .word sub_080158D4
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
        .word sub_08016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_080144DC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_080147B8
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
        .word sub_08016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_080144DC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_080147B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_080158B0
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
        .word sub_080158B0
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
        .word sub_08016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_080144DC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_080147B8
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
        .word sub_08016400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_080144DC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_080147B8
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c0617c
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.incbin "FireEmblem7J.base.gba", 0xC01FE4, 0xC02144 - 0xC01FE4

	.global StatusNameStringLut
StatusNameStringLut: @ 08C02144
	.incbin "FireEmblem7J.base.gba", 0xC02144, 0x28

	.global gUnitLut
gUnitLut: @ 08C0216C
	.incbin "FireEmblem7J.base.gba", 0xC0216C, 0x400

	.incbin "FireEmblem7J.base.gba", 0xC0256C, 0xC0328C - 0xC0256C

	.global SleepIconSprites
SleepIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC0328C, 0xC032F0 - 0xC0328C

	.global BerserkIconSprites
BerserkIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC032F0, 0xC03330 - 0xC032F0

	.global SilenceIconSprites
SilenceIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC03330, 0xC033D0 - 0xC03330

	.global PoisonIconSprites
PoisonIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC033D0, 0xC03400 - 0xC033D0

	.global UnkStatusIconSprites
UnkStatusIconSprites:
	.incbin "FireEmblem7J.base.gba", 0xC03400, 0xC03528 - 0xC03400
