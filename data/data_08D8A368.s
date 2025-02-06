	.section .data

	.incbin "FireEmblem7J.base.gba", 0xD8A678, 0xD8A704 - 0xD8A678

	.global HelpInfo_StatScreenPersonalInfo_Pow
HelpInfo_StatScreenPersonalInfo_Pow:	@ 0x08D8A704
	.incbin "FireEmblem7J.base.gba", 0xD8A704, 0xD8A8E0 - 0xD8A704

	.global HelpInfo_StatScreenItems_ItemA
HelpInfo_StatScreenItems_ItemA:	@ 0x08D8A8E0
	.incbin "FireEmblem7J.base.gba", 0xD8A8E0, 0xD8AA84 - 0xD8A8E0

	.global HelpInfo_StatScreenWeaponExp_WExpA
HelpInfo_StatScreenWeaponExp_WExpA:	@ 0x08D8AA84
	.incbin "FireEmblem7J.base.gba", 0xD8AA84, 0xD8AB2C - 0xD8AA84

	.global gUnk_08D8AB2C
gUnk_08D8AB2C:	@ 0x08D8AB2C
	.incbin "FireEmblem7J.base.gba", 0xD8AB2C, 0xD8ABD4 - 0xD8AB2C

	.global gUnk_08D8ABD4
gUnk_08D8ABD4:	@ 0x08D8ABD4
	.incbin "FireEmblem7J.base.gba", 0xD8ABD4, 0xD8AC98 - 0xD8ABD4

	.global gUnk_08D8AC98
gUnk_08D8AC98:	@ 0x08D8AC98
	.incbin "FireEmblem7J.base.gba", 0xD8AC98, 0xD8AE00 - 0xD8AC98

	.global gChapTitleConfig
gChapTitleConfig:	@ 0x08D8AE00
	.4byte Img_TitleName_084090A4
	.4byte Img_TitleName_08409464
	.4byte Img_TitleName_084097C4
	.4byte Img_TitleName_08409B1C
	.4byte Img_TitleName_08409EF0
	.4byte Img_TitleName_0840A280
	.4byte Img_TitleName_0840A634
	.4byte Img_TitleName_0840A9B0
	.4byte Img_TitleName_0840AD04
	.4byte Img_TitleName_0840B084
	.4byte Img_TitleName_0840B3D8
	.4byte Img_TitleName_0840B748
	.4byte Img_TitleName_0840BB4C
	.4byte Img_TitleName_0840BEBC
	.4byte Img_TitleName_0840C230
	.4byte Img_TitleName_0840C61C
	.4byte Img_TitleName_0840CA8C
	.4byte Img_TitleName_0840CE98
	.4byte Img_TitleName_0840D290
	.4byte Img_TitleName_0840D5F0
	.4byte Img_TitleName_0840DA24
	.4byte Img_TitleName_0840DD5C
	.4byte Img_TitleName_0840E050
	.4byte Img_TitleName_0840E4E0
	.4byte Img_TitleName_0840E7B8
	.4byte Img_TitleName_0840EC00
	.4byte Img_TitleName_0840EF0C
	.4byte Img_TitleName_0840F2E4
	.4byte Img_TitleName_0840F768
	.4byte Img_TitleName_0840FB00
	.4byte Img_TitleName_0840FE98
	.4byte Img_TitleName_08410384
	.4byte Img_TitleName_0841071C
	.4byte Img_TitleName_08410AB4
	.4byte Img_TitleName_08410F38
	.4byte Img_TitleName_084113A8
	.4byte Img_TitleName_08411770
	.4byte Img_TitleName_08411AE8
	.4byte Img_TitleName_08411EE8
	.4byte Img_TitleName_0841230C
	.4byte Img_TitleName_084126B8
	.4byte Img_TitleName_08412928
	.4byte Img_TitleName_08412D04
	.4byte Img_TitleName_0841305C
	.4byte Img_TitleName_08413448
	.4byte Img_TitleName_084138B8
	.4byte Img_TitleName_08413CC4
	.4byte Img_TitleName_084140E4
	.4byte Img_TitleName_084144F0
	.4byte Img_TitleName_0841485C
	.4byte Img_TitleName_08414C74
	.4byte Img_TitleName_08414FA8
	.4byte Img_TitleName_084152A4
	.4byte Img_TitleName_0841571C
	.4byte Img_TitleName_08415B20
	.4byte Img_TitleName_08415DF4
	.4byte Img_TitleName_0841621C
	.4byte Img_TitleName_0841653C
	.4byte Img_TitleName_0841691C
	.4byte Img_TitleName_08416D8C
	.4byte Img_TitleName_08417104
	.4byte Img_TitleName_0841747C
	.4byte Img_TitleName_084177F4
	.4byte Img_TitleName_08417CE0
	.4byte Img_TitleName_0841805C
	.4byte Img_TitleName_084183D8
	.4byte Img_TitleName_08418860
	.4byte Img_TitleName_08418CDC
	.4byte Img_TitleName_08419094
	.4byte Img_TitleName_084194A4
	.4byte Img_TitleName_08419890
	.4byte Img_TitleName_08419C8C
	.4byte Img_TitleName_0841A038
	.4byte Img_TitleName_0841A454
	.4byte Img_TitleName_0841A6C4
	.4byte Img_TitleName_0841A964
	.4byte Img_TitleName_0841AB8C

	.global gUnk_08D8AF34
gUnk_08D8AF34:	@ 0x08D8AF34
	.incbin "FireEmblem7J.base.gba", 0xD8AF34, 0xD8AF5C - 0xD8AF34

	.global gUnk_08D8AF5C
gUnk_08D8AF5C:	@ 0x08D8AF5C
	.incbin "FireEmblem7J.base.gba", 0xD8AF5C, 0xD8AF84 - 0xD8AF5C

	.global gUnk_08D8AF84
gUnk_08D8AF84:	@ 0x08D8AF84
	.incbin "FireEmblem7J.base.gba", 0xD8AF84, 0xD8AFA4 - 0xD8AF84

	.global gUnk_08D8AFA4
gUnk_08D8AFA4:	@ 0x08D8AFA4
	.incbin "FireEmblem7J.base.gba", 0xD8AFA4, 0xD8AFD4 - 0xD8AFA4

	.global gUnk_08D8AFD4
gUnk_08D8AFD4:	@ 0x08D8AFD4
	.incbin "FireEmblem7J.base.gba", 0xD8AFD4, 0xD8AFE4 - 0xD8AFD4

	.global gUnk_08D8AFE4
gUnk_08D8AFE4:	@ 0x08D8AFE4
	.incbin "FireEmblem7J.base.gba", 0xD8AFE4, 0xD8AFEC - 0xD8AFE4

	.global gUnk_08D8AFEC
gUnk_08D8AFEC:	@ 0x08D8AFEC
	.incbin "FireEmblem7J.base.gba", 0xD8AFEC, 0xD8B04C - 0xD8AFEC

	.global gUnk_08D8B04C
gUnk_08D8B04C:	@ 0x08D8B04C
	.incbin "FireEmblem7J.base.gba", 0xD8B04C, 0xD8B06C - 0xD8B04C

	.global gUnk_08D8B06C
gUnk_08D8B06C:	@ 0x08D8B06C
	.incbin "FireEmblem7J.base.gba", 0xD8B06C, 0xD8B10C - 0xD8B06C

	.global gUnk_08D8B10C
gUnk_08D8B10C:	@ 0x08D8B10C
	.incbin "FireEmblem7J.base.gba", 0xD8B10C, 0xD8B124 - 0xD8B10C

	.global gUnk_08D8B124
gUnk_08D8B124:	@ 0x08D8B124
	.incbin "FireEmblem7J.base.gba", 0xD8B124, 0xD8B134 - 0xD8B124

	.global gUnk_08D8B134
gUnk_08D8B134:	@ 0x08D8B134
	.incbin "FireEmblem7J.base.gba", 0xD8B134, 0xD8B154 - 0xD8B134

	.global gUnk_08D8B154
gUnk_08D8B154:	@ 0x08D8B154
	.incbin "FireEmblem7J.base.gba", 0xD8B154, 0xD8B15A - 0xD8B154

	.global gUnk_08D8B15A
gUnk_08D8B15A:	@ 0x08D8B15A
	.incbin "FireEmblem7J.base.gba", 0xD8B15A, 0xD8B16C - 0xD8B15A

	.global gUnk_08D8B16C
gUnk_08D8B16C:	@ 0x08D8B16C
	.incbin "FireEmblem7J.base.gba", 0xD8B16C, 0xD8B172 - 0xD8B16C

	.global gUnk_08D8B172
gUnk_08D8B172:	@ 0x08D8B172
	.incbin "FireEmblem7J.base.gba", 0xD8B172, 0xD8B178 - 0xD8B172

	.global gUnk_08D8B178
gUnk_08D8B178:	@ 0x08D8B178
	.incbin "FireEmblem7J.base.gba", 0xD8B178, 0xD8B190 - 0xD8B178

	.global gUnk_08D8B190
gUnk_08D8B190:	@ 0x08D8B190
	.incbin "FireEmblem7J.base.gba", 0xD8B190, 0xD8B194 - 0xD8B190

	.global gUnk_08D8B194
gUnk_08D8B194:	@ 0x08D8B194
	.incbin "FireEmblem7J.base.gba", 0xD8B194, 0xD8B197 - 0xD8B194

	.global gUnk_08D8B197
gUnk_08D8B197:	@ 0x08D8B197
	.incbin "FireEmblem7J.base.gba", 0xD8B197, 0xD8B19A - 0xD8B197

	.global gUnk_08D8B19A
gUnk_08D8B19A:	@ 0x08D8B19A
	.incbin "FireEmblem7J.base.gba", 0xD8B19A, 0xD8B1A0 - 0xD8B19A

	.global gUnk_08D8B1A0
gUnk_08D8B1A0:	@ 0x08D8B1A0
	.incbin "FireEmblem7J.base.gba", 0xD8B1A0, 0xD8B200 - 0xD8B1A0

	.global gUnk_08D8B200
gUnk_08D8B200:	@ 0x08D8B200
	.incbin "FireEmblem7J.base.gba", 0xD8B200, 0xD8B288 - 0xD8B200

	.global gUnk_08D8B288
gUnk_08D8B288:	@ 0x08D8B288
	.incbin "FireEmblem7J.base.gba", 0xD8B288, 0xD8B2B8 - 0xD8B288

	.global gUnk_08D8B2B8
gUnk_08D8B2B8:	@ 0x08D8B2B8
	.incbin "FireEmblem7J.base.gba", 0xD8B2B8, 0xD8B2D0 - 0xD8B2B8

	.global gUnk_08D8B2D0
gUnk_08D8B2D0:	@ 0x08D8B2D0
	.incbin "FireEmblem7J.base.gba", 0xD8B2D0, 0xD8B2D5 - 0xD8B2D0

	.global gUnk_08D8B2D5
gUnk_08D8B2D5:	@ 0x08D8B2D5
	.incbin "FireEmblem7J.base.gba", 0xD8B2D5, 0xD8B2D8 - 0xD8B2D5

	.global gUnk_08D8B2D8
gUnk_08D8B2D8:	@ 0x08D8B2D8
	.incbin "FireEmblem7J.base.gba", 0xD8B2D8, 0xD8B338 - 0xD8B2D8

	.global gUnk_08D8B338
gUnk_08D8B338:	@ 0x08D8B338
	.incbin "FireEmblem7J.base.gba", 0xD8B338, 0xD8B398 - 0xD8B338

	.global gUnk_08D8B398
gUnk_08D8B398:	@ 0x08D8B398
	.incbin "FireEmblem7J.base.gba", 0xD8B398, 0xD8B3A6 - 0xD8B398

	.global gUnk_08D8B3A6
gUnk_08D8B3A6:	@ 0x08D8B3A6
	.incbin "FireEmblem7J.base.gba", 0xD8B3A6, 0xD8B3AE - 0xD8B3A6

	.global gUnk_08D8B3AE
gUnk_08D8B3AE:	@ 0x08D8B3AE
	.incbin "FireEmblem7J.base.gba", 0xD8B3AE, 0xD8B3BC - 0xD8B3AE

	.global gUnk_08D8B3BC
gUnk_08D8B3BC:	@ 0x08D8B3BC
	.incbin "FireEmblem7J.base.gba", 0xD8B3BC, 0xD8B3CA - 0xD8B3BC

	.global gUnk_08D8B3CA
gUnk_08D8B3CA:	@ 0x08D8B3CA
	.incbin "FireEmblem7J.base.gba", 0xD8B3CA, 0xD8B3D2 - 0xD8B3CA

	.global gUnk_08D8B3D2
gUnk_08D8B3D2:	@ 0x08D8B3D2
	.incbin "FireEmblem7J.base.gba", 0xD8B3D2, 0xD8B3E6 - 0xD8B3D2

	.global gUnk_08D8B3E6
gUnk_08D8B3E6:	@ 0x08D8B3E6
	.incbin "FireEmblem7J.base.gba", 0xD8B3E6, 0xD8B3EE - 0xD8B3E6

	.global gUnk_08D8B3EE
gUnk_08D8B3EE:	@ 0x08D8B3EE
	.incbin "FireEmblem7J.base.gba", 0xD8B3EE, 0xD8B3F6 - 0xD8B3EE

	.global gUnk_08D8B3F6
gUnk_08D8B3F6:	@ 0x08D8B3F6
	.incbin "FireEmblem7J.base.gba", 0xD8B3F6, 0xD8B3FE - 0xD8B3F6

	.global gUnk_08D8B3FE
gUnk_08D8B3FE:	@ 0x08D8B3FE
	.incbin "FireEmblem7J.base.gba", 0xD8B3FE, 0xD8B40C - 0xD8B3FE

	.global gUnk_08D8B40C
gUnk_08D8B40C:	@ 0x08D8B40C
	.incbin "FireEmblem7J.base.gba", 0xD8B40C, 0xD8B428 - 0xD8B40C

	.global gUnk_08D8B428
gUnk_08D8B428:	@ 0x08D8B428
	.incbin "FireEmblem7J.base.gba", 0xD8B428, 0xD8B440 - 0xD8B428

	.global gUnk_08D8B440
gUnk_08D8B440:	@ 0x08D8B440
	.incbin "FireEmblem7J.base.gba", 0xD8B440, 0xD8B4F8 - 0xD8B440

	.global gUnk_08D8B4F8
gUnk_08D8B4F8:	@ 0x08D8B4F8
	.incbin "FireEmblem7J.base.gba", 0xD8B4F8, 0xD8B578 - 0xD8B4F8

	.global gUnk_08D8B578
gUnk_08D8B578:	@ 0x08D8B578
	.incbin "FireEmblem7J.base.gba", 0xD8B578, 0xD8B5A0 - 0xD8B578

	.global gUnk_08D8B5A0
gUnk_08D8B5A0:	@ 0x08D8B5A0
	.incbin "FireEmblem7J.base.gba", 0xD8B5A0, 0xD8B5C0 - 0xD8B5A0

	.global gUnk_08D8B5C0
gUnk_08D8B5C0:	@ 0x08D8B5C0
	.incbin "FireEmblem7J.base.gba", 0xD8B5C0, 0xD8B5E6 - 0xD8B5C0

	.global gUnk_08D8B5E6
gUnk_08D8B5E6:	@ 0x08D8B5E6
	.incbin "FireEmblem7J.base.gba", 0xD8B5E6, 0xD8B5F4 - 0xD8B5E6

	.global gUnk_08D8B5F4
gUnk_08D8B5F4:	@ 0x08D8B5F4
	.incbin "FireEmblem7J.base.gba", 0xD8B5F4, 0xD8B68C - 0xD8B5F4

	.global gUnk_08D8B68C
gUnk_08D8B68C:	@ 0x08D8B68C
	.incbin "FireEmblem7J.base.gba", 0xD8B68C, 0xD8B694 - 0xD8B68C

	.global gUnk_08D8B694
gUnk_08D8B694:	@ 0x08D8B694
	.incbin "FireEmblem7J.base.gba", 0xD8B694, 0xD8B69C - 0xD8B694

	.global gUnk_08D8B69C
gUnk_08D8B69C:	@ 0x08D8B69C
	.incbin "FireEmblem7J.base.gba", 0xD8B69C, 0xD8B6FC - 0xD8B69C

	.global gUnk_08D8B6FC
gUnk_08D8B6FC:	@ 0x08D8B6FC
	.incbin "FireEmblem7J.base.gba", 0xD8B6FC, 0xD8B71C - 0xD8B6FC

	.global gUnk_08D8B71C
gUnk_08D8B71C:	@ 0x08D8B71C
	.incbin "FireEmblem7J.base.gba", 0xD8B71C, 0xD8B82C - 0xD8B71C

	.global gUnk_08D8B82C
gUnk_08D8B82C:	@ 0x08D8B82C
	.incbin "FireEmblem7J.base.gba", 0xD8B82C, 0xD8B8F4 - 0xD8B82C

	.global gUnk_08D8B8F4
gUnk_08D8B8F4:	@ 0x08D8B8F4
	.incbin "FireEmblem7J.base.gba", 0xD8B8F4, 0xD8B98C - 0xD8B8F4

	.global gUnk_08D8B98C
gUnk_08D8B98C:	@ 0x08D8B98C
	.incbin "FireEmblem7J.base.gba", 0xD8B98C, 0xD8B9B4 - 0xD8B98C

	.global gUnk_08D8B9B4
gUnk_08D8B9B4:	@ 0x08D8B9B4
	.incbin "FireEmblem7J.base.gba", 0xD8B9B4, 0xD8B9BA - 0xD8B9B4

	.global gUnk_08D8B9BA
gUnk_08D8B9BA:	@ 0x08D8B9BA
	.incbin "FireEmblem7J.base.gba", 0xD8B9BA, 0xD8BA04 - 0xD8B9BA

	.global gUnk_08D8BA04
gUnk_08D8BA04:	@ 0x08D8BA04
	.incbin "FireEmblem7J.base.gba", 0xD8BA04, 0xD8BA10 - 0xD8BA04

	.global gUnk_08D8BA10
gUnk_08D8BA10:	@ 0x08D8BA10
	.incbin "FireEmblem7J.base.gba", 0xD8BA10, 0xD8BA18 - 0xD8BA10

	.global gUnk_08D8BA18
gUnk_08D8BA18:	@ 0x08D8BA18
	.incbin "FireEmblem7J.base.gba", 0xD8BA18, 0xD8BA20 - 0xD8BA18

	.global gUnk_08D8BA20
gUnk_08D8BA20:	@ 0x08D8BA20
	.incbin "FireEmblem7J.base.gba", 0xD8BA20, 0xD8BAD8 - 0xD8BA20

	.global gUnk_08D8BAD8
gUnk_08D8BAD8:	@ 0x08D8BAD8
	.incbin "FireEmblem7J.base.gba", 0xD8BAD8, 0xD8BB00 - 0xD8BAD8

	.global gUnk_08D8BB00
gUnk_08D8BB00:	@ 0x08D8BB00
	.incbin "FireEmblem7J.base.gba", 0xD8BB00, 0xD8C0A0 - 0xD8BB00

	.global gBgConfig_PrepScreen
gBgConfig_PrepScreen:	@ 0x08D8C0A0
	.incbin "FireEmblem7J.base.gba", 0xD8C0A0, 0xD8C0B8 - 0xD8C0A0
