	.section .data

	.global gUnk_08C01B84
gUnk_08C01B84:	@ 0x08C01B84
	.incbin "FireEmblem7J.base.gba", 0xC01B84, 0xC01BA4 - 0xC01B84

	.global gUnk_08C01BA4
gUnk_08C01BA4:	@ 0x08C01BA4
	.incbin "FireEmblem7J.base.gba", 0xC01BA4, 0xC01BC4 - 0xC01BA4

	.global gUnk_08C01BC4
gUnk_08C01BC4:	@ 0x08C01BC4
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
        .word WhileFadeExists
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
        .word WhileFadeExists
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
        .word WhileFadeExists
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
        .word WhileFadeExists
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x8c0617c
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnk_08C01FE4
gUnk_08C01FE4:	@ 0x08C01FE4
	.incbin "FireEmblem7J.base.gba", 0xC01FE4, 0xC02052 - 0xC01FE4

	.global gUnk_08C02052
gUnk_08C02052:	@ 0x08C02052
	.incbin "FireEmblem7J.base.gba", 0xC02052, 0xC0206C - 0xC02052

	.global gUnk_08C0206C
gUnk_08C0206C:	@ 0x08C0206C
	.incbin "FireEmblem7J.base.gba", 0xC0206C, 0xC020DC - 0xC0206C

	.global gUnk_08C020DC
gUnk_08C020DC:	@ 0x08C020DC
	.incbin "FireEmblem7J.base.gba", 0xC020DC, 0xC020E8 - 0xC020DC

	.global gUnk_08C020E8
gUnk_08C020E8:	@ 0x08C020E8
	.incbin "FireEmblem7J.base.gba", 0xC020E8, 0xC020F4 - 0xC020E8

	.global ProcScr_CamMove
ProcScr_CamMove:	@ 0x08C020F4
	.incbin "FireEmblem7J.base.gba", 0xC020F4, 0xC0211C - 0xC020F4

	.global gUnk_08C0211C
gUnk_08C0211C:	@ 0x08C0211C
	.incbin "FireEmblem7J.base.gba", 0xC0211C, 0xC0212C - 0xC0211C

	.global gUnk_08C0212C
gUnk_08C0212C:	@ 0x08C0212C
	.incbin "FireEmblem7J.base.gba", 0xC0212C, 0xC02144 - 0xC0212C

	.global StatusNameStringLut
StatusNameStringLut: @ 08C02144
	.incbin "FireEmblem7J.base.gba", 0xC02144, 0x28

	.global gUnitLut
gUnitLut: @ 08C0216C
	.incbin "FireEmblem7J.base.gba", 0xC0216C, 0x400

	.global gUnk_08C0256C
gUnk_08C0256C:	@ 0x08C0256C
	.incbin "FireEmblem7J.base.gba", 0xC0256C, 0xC02570 - 0xC0256C

	.global gUnk_08C02570
gUnk_08C02570:	@ 0x08C02570
	.incbin "FireEmblem7J.base.gba", 0xC02570, 0xC025F8 - 0xC02570

	.global gUnk_08C025F8
gUnk_08C025F8:	@ 0x08C025F8
	.incbin "FireEmblem7J.base.gba", 0xC025F8, 0xC02600 - 0xC025F8

	.global gUnk_08C02600
gUnk_08C02600:	@ 0x08C02600
	.incbin "FireEmblem7J.base.gba", 0xC02600, 0xC02618 - 0xC02600

	.global gUnk_08C02618
gUnk_08C02618:	@ 0x08C02618
	.incbin "FireEmblem7J.base.gba", 0xC02618, 0xC02630 - 0xC02618

	.global gUnk_08C02630
gUnk_08C02630:	@ 0x08C02630
	.incbin "FireEmblem7J.base.gba", 0xC02630, 0xC02828 - 0xC02630

	.global gUnk_08C02828
gUnk_08C02828:	@ 0x08C02828
	.incbin "FireEmblem7J.base.gba", 0xC02828, 0xC02870 - 0xC02828

	.global gUnk_08C02870
gUnk_08C02870:	@ 0x08C02870
	.incbin "FireEmblem7J.base.gba", 0xC02870, 0xC028A8 - 0xC02870

	.global gUnk_08C028A8
gUnk_08C028A8:	@ 0x08C028A8
	.incbin "FireEmblem7J.base.gba", 0xC028A8, 0xC028C0 - 0xC028A8

	.global gUnk_08C028C0
gUnk_08C028C0:	@ 0x08C028C0
	.incbin "FireEmblem7J.base.gba", 0xC028C0, 0xC028E8 - 0xC028C0

	.global gUnk_08C028E8
gUnk_08C028E8:	@ 0x08C028E8
	.incbin "FireEmblem7J.base.gba", 0xC028E8, 0xC02938 - 0xC028E8

	.global gUnk_08C02938
gUnk_08C02938:	@ 0x08C02938
	.incbin "FireEmblem7J.base.gba", 0xC02938, 0xC02958 - 0xC02938

	.global gUnk_08C02958
gUnk_08C02958:	@ 0x08C02958
	.incbin "FireEmblem7J.base.gba", 0xC02958, 0xC029A8 - 0xC02958

	.global gUnk_08C029A8
gUnk_08C029A8:	@ 0x08C029A8
	.incbin "FireEmblem7J.base.gba", 0xC029A8, 0xC029C0 - 0xC029A8

	.global gUnk_08C029C0
gUnk_08C029C0:	@ 0x08C029C0
	.incbin "FireEmblem7J.base.gba", 0xC029C0, 0xC029E8 - 0xC029C0

	.global gUnk_08C029E8
gUnk_08C029E8:	@ 0x08C029E8
	.incbin "FireEmblem7J.base.gba", 0xC029E8, 0xC02A28 - 0xC029E8

	.global gUnk_08C02A28
gUnk_08C02A28:	@ 0x08C02A28
	.incbin "FireEmblem7J.base.gba", 0xC02A28, 0xC02A48 - 0xC02A28

	.global gUnk_08C02A48
gUnk_08C02A48:	@ 0x08C02A48
	.incbin "FireEmblem7J.base.gba", 0xC02A48, 0xC02AB0 - 0xC02A48

	.global gUnk_08C02AB0
gUnk_08C02AB0:	@ 0x08C02AB0
	.incbin "FireEmblem7J.base.gba", 0xC02AB0, 0xC02AD0 - 0xC02AB0

	.global gUnk_08C02AD0
gUnk_08C02AD0:	@ 0x08C02AD0
	.incbin "FireEmblem7J.base.gba", 0xC02AD0, 0xC02AF0 - 0xC02AD0

	.global gUnk_08C02AF0
gUnk_08C02AF0:	@ 0x08C02AF0
	.incbin "FireEmblem7J.base.gba", 0xC02AF0, 0xC02B30 - 0xC02AF0

	.global gUnk_08C02B30
gUnk_08C02B30:	@ 0x08C02B30
	.incbin "FireEmblem7J.base.gba", 0xC02B30, 0xC02B58 - 0xC02B30

	.global gUnk_08C02B58
gUnk_08C02B58:	@ 0x08C02B58
	.incbin "FireEmblem7J.base.gba", 0xC02B58, 0xC02B88 - 0xC02B58

	.global gUnk_08C02B88
gUnk_08C02B88:	@ 0x08C02B88
	.incbin "FireEmblem7J.base.gba", 0xC02B88, 0xC02BA8 - 0xC02B88

	.global gUnk_08C02BA8
gUnk_08C02BA8:	@ 0x08C02BA8
	.incbin "FireEmblem7J.base.gba", 0xC02BA8, 0xC02BF0 - 0xC02BA8

	.global gUnk_08C02BF0
gUnk_08C02BF0:	@ 0x08C02BF0
	.incbin "FireEmblem7J.base.gba", 0xC02BF0, 0xC02DD8 - 0xC02BF0

	.global gUnk_08C02DD8
gUnk_08C02DD8:	@ 0x08C02DD8
	.incbin "FireEmblem7J.base.gba", 0xC02DD8, 0xC02E30 - 0xC02DD8

	.global gUnk_08C02E30
gUnk_08C02E30:	@ 0x08C02E30
	.incbin "FireEmblem7J.base.gba", 0xC02E30, 0xC02E50 - 0xC02E30

	.global gUnk_08C02E50
gUnk_08C02E50:	@ 0x08C02E50
	.incbin "FireEmblem7J.base.gba", 0xC02E50, 0xC02E88 - 0xC02E50

	.global gUnk_08C02E88
gUnk_08C02E88:	@ 0x08C02E88
	.incbin "FireEmblem7J.base.gba", 0xC02E88, 0xC02ECC - 0xC02E88

	.global gUnk_08C02ECC
gUnk_08C02ECC:	@ 0x08C02ECC
	.incbin "FireEmblem7J.base.gba", 0xC02ECC, 0xC02F10 - 0xC02ECC

	.global gUnk_08C02F10
gUnk_08C02F10:	@ 0x08C02F10
	.incbin "FireEmblem7J.base.gba", 0xC02F10, 0xC02F38 - 0xC02F10

	.global gUnk_08C02F38
gUnk_08C02F38:	@ 0x08C02F38
	.incbin "FireEmblem7J.base.gba", 0xC02F38, 0xC02F60 - 0xC02F38

	.global gUnk_08C02F60
gUnk_08C02F60:	@ 0x08C02F60
	.incbin "FireEmblem7J.base.gba", 0xC02F60, 0xC02F78 - 0xC02F60

	.global gUnk_08C02F78
gUnk_08C02F78:	@ 0x08C02F78
	.incbin "FireEmblem7J.base.gba", 0xC02F78, 0xC02F90 - 0xC02F78

	.global gUnk_08C02F90
gUnk_08C02F90:	@ 0x08C02F90
	.incbin "FireEmblem7J.base.gba", 0xC02F90, 0xC02FA8 - 0xC02F90

	.global gUnk_08C02FA8
gUnk_08C02FA8:	@ 0x08C02FA8
	.incbin "FireEmblem7J.base.gba", 0xC02FA8, 0xC02FC8 - 0xC02FA8

	.global gUnk_08C02FC8
gUnk_08C02FC8:	@ 0x08C02FC8
	.incbin "FireEmblem7J.base.gba", 0xC02FC8, 0xC03000 - 0xC02FC8

	.global gUnk_08C03000
gUnk_08C03000:	@ 0x08C03000
	.incbin "FireEmblem7J.base.gba", 0xC03000, 0xC03018 - 0xC03000

	.global gUnk_08C03018
gUnk_08C03018:	@ 0x08C03018
	.incbin "FireEmblem7J.base.gba", 0xC03018, 0xC03060 - 0xC03018

	.global gUnk_08C03060
gUnk_08C03060:	@ 0x08C03060
	.incbin "FireEmblem7J.base.gba", 0xC03060, 0xC03098 - 0xC03060

	.global gUnk_08C03098
gUnk_08C03098:	@ 0x08C03098
	.incbin "FireEmblem7J.base.gba", 0xC03098, 0xC030C8 - 0xC03098

	.global gUnk_08C030C8
gUnk_08C030C8:	@ 0x08C030C8
	.incbin "FireEmblem7J.base.gba", 0xC030C8, 0xC03100 - 0xC030C8

	.global gUnk_08C03100
gUnk_08C03100:	@ 0x08C03100
	.incbin "FireEmblem7J.base.gba", 0xC03100, 0xC03104 - 0xC03100

	.global gUnk_08C03104
gUnk_08C03104:	@ 0x08C03104
	.incbin "FireEmblem7J.base.gba", 0xC03104, 0xC03114 - 0xC03104

	.global gUnk_08C03114
gUnk_08C03114:	@ 0x08C03114
	.incbin "FireEmblem7J.base.gba", 0xC03114, 0xC031D4 - 0xC03114

	.global gUnk_08C031D4
gUnk_08C031D4:	@ 0x08C031D4
	.incbin "FireEmblem7J.base.gba", 0xC031D4, 0xC0328C - 0xC031D4

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
	.incbin "FireEmblem7J.base.gba", 0xC03400, 0xC0340E - 0xC03400

	.global gUnk_08C0340E
gUnk_08C0340E:	@ 0x08C0340E
	.incbin "FireEmblem7J.base.gba", 0xC0340E, 0xC03416 - 0xC0340E

	.global gUnk_08C03416
gUnk_08C03416:	@ 0x08C03416
	.incbin "FireEmblem7J.base.gba", 0xC03416, 0xC0341E - 0xC03416

	.global gUnk_08C0341E
gUnk_08C0341E:	@ 0x08C0341E
	.incbin "FireEmblem7J.base.gba", 0xC0341E, 0xC03426 - 0xC0341E

	.global gUnk_08C03426
gUnk_08C03426:	@ 0x08C03426
	.incbin "FireEmblem7J.base.gba", 0xC03426, 0xC0342E - 0xC03426

	.global gUnk_08C0342E
gUnk_08C0342E:	@ 0x08C0342E
	.incbin "FireEmblem7J.base.gba", 0xC0342E, 0xC03436 - 0xC0342E

	.global gUnk_08C03436
gUnk_08C03436:	@ 0x08C03436
	.incbin "FireEmblem7J.base.gba", 0xC03436, 0xC03440 - 0xC03436

	.global gUnk_08C03440
gUnk_08C03440:	@ 0x08C03440
	.incbin "FireEmblem7J.base.gba", 0xC03440, 0xC03450 - 0xC03440

	.global gUnk_08C03450
gUnk_08C03450:	@ 0x08C03450
	.incbin "FireEmblem7J.base.gba", 0xC03450, 0xC034D0 - 0xC03450

	.global gUnk_08C034D0
gUnk_08C034D0:	@ 0x08C034D0
	.incbin "FireEmblem7J.base.gba", 0xC034D0, 0xC03528 - 0xC034D0
