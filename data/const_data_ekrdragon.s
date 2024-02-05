    .section .rodata

    .global FrameLut_EkrDragonWingFlashingNormalAtk
FrameLut_EkrDragonWingFlashingNormalAtk:	@ 0x082E420C
    .SHORT 0, 6
    .SHORT 1, 6
    .SHORT 2, 6
    .SHORT 3, 6
    .SHORT -2

    .global FrameLut_EkrDragonWingFlashingCriticalAtk
FrameLut_EkrDragonWingFlashingCriticalAtk:	@ 0x082E421E
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT -6, 0
    .SHORT 0, 1
    .SHORT -1

    .global FrameLut_EkrDragonFlashingWingObjNormalAtk
FrameLut_EkrDragonFlashingWingObjNormalAtk:	@ 0x082E4318
    .SHORT 0, 1
    .SHORT -1

    .global FrameLut_EkrDragonFlashingWingObjCriticalAtk
FrameLut_EkrDragonFlashingWingObjCriticalAtk:	@ 0x082E431E
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT -5, 0
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT -5, 0
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT -5, 0
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT 4, 1
    .SHORT 5, 1
    .SHORT 6, 1
    .SHORT -6, 0
    .SHORT 0, 1
    .SHORT -1

    .global FrameLut_EkrDragon_082E4418
FrameLut_EkrDragon_082E4418:	@ 0x082E4418
    .SHORT 0, 1
    .SHORT -1

    .global FrameLut_EkrDragon_082E441E
FrameLut_EkrDragon_082E441E:	@ 0x082E441E
    .SHORT 0, 11
    .SHORT 1, 22
    .SHORT -4, 0
    .SHORT 0, 1
    .SHORT -1

    .global FrameLut_EkrDragon_082E4430
FrameLut_EkrDragon_082E4430:	@ 0x082E4430
    .SHORT 0, 69
    .SHORT 1, 22
    .SHORT -4, 0
    .SHORT 0, 1
    .SHORT -1

    .global FrameLut_EkrDragon_082E4442
FrameLut_EkrDragon_082E4442:	@ 0x082E4442
    .SHORT 0, 1
    .SHORT -5, 0
    .SHORT 0, 2
    .SHORT 1, 1
    .SHORT -6, 0
    .SHORT 0, 1
    .SHORT -1

    .global Img_EkrDragon_082E445C
Img_EkrDragon_082E445C:	@ 0x082E445C
    .incbin "FireEmblem7J.base.gba", 0x2E445C, 0x2E6C60 - 0x2E445C

.global Pals_EkrDragonFlashingWingBg
Pals_EkrDragonFlashingWingBg:
    .incbin "FireEmblem7J.base.gba", 0x2E6C60, 0x2E6D40 - 0x2E6C60

    .global Tsa_EkrDragon_DragonTail
Tsa_EkrDragon_DragonTail:	@ 0x082E6D40
    .incbin "FireEmblem7J.base.gba", 0x2E6D40, 0x2E6E8C - 0x2E6D40

    .global Tsa_EkrDragon_MainBg
Tsa_EkrDragon_MainBg:	@ 0x082E6E8C
    .incbin "FireEmblem7J.base.gba", 0x2E6E8C, 0x2E7170 - 0x2E6E8C

    .global Tsa_EkrDragon_082E7170
Tsa_EkrDragon_082E7170:	@ 0x082E7170
    .incbin "FireEmblem7J.base.gba", 0x2E7170, 0x2E7418 - 0x2E7170

    .global Tsa_EkrDragon_082E7418
Tsa_EkrDragon_082E7418:	@ 0x082E7418
    .incbin "FireEmblem7J.base.gba", 0x2E7418, 0x2E76A4 - 0x2E7418

    .global Img_EkrDragonTunkFace
Img_EkrDragonTunkFace:	@ 0x082E76A4
    .incbin "FireEmblem7J.base.gba", 0x2E76A4, 0x2E8584 - 0x2E76A4

    .global Img_EkrDragonSpark
Img_EkrDragonSpark:	@ 0x082E8584
    .incbin "FireEmblem7J.base.gba", 0x2E8584, 0x2E9240 - 0x2E8584

    .global Img_EfxDragonDeadFallHead
Img_EfxDragonDeadFallHead:	@ 0x082E9240
    .incbin "FireEmblem7J.base.gba", 0x2E9240, 0x2E9CD8 - 0x2E9240

    .global Pal_EkrDragonHead
Pal_EkrDragonHead:	@ 0x082E9CD8
    .incbin "FireEmblem7J.base.gba", 0x2E9CD8, 0x2E9CF8 - 0x2E9CD8

    .global Pals_EkrDragonFlashingWingObj
Pals_EkrDragonFlashingWingObj:	@ 0x082E9CF8
    .incbin "FireEmblem7J.base.gba", 0x2E9CF8, 0x2E9DD8 - 0x2E9CF8

    .global Img_EkrDragonFireBg3
Img_EkrDragonFireBg3:	@ 0x082E9DD8
    .incbin "FireEmblem7J.base.gba", 0x2E9DD8, 0x2EA7C8 - 0x2E9DD8

    .global Pal_EkrDragonFireBg3
Pal_EkrDragonFireBg3:	@ 0x082EA7C8
    .incbin "FireEmblem7J.base.gba", 0x2EA7C8, 0x2EA7E8 - 0x2EA7C8

    .global Tsa_EkrDragonFireBg3
Tsa_EkrDragonFireBg3:	@ 0x082EA7E8
    .incbin "FireEmblem7J.base.gba", 0x2EA7E8, 0x2EA9A4 - 0x2EA7E8

    .global Img_EkrDragonFireBG2
Img_EkrDragonFireBG2:	@ 0x082EA9A4
    .incbin "FireEmblem7J.base.gba", 0x2EA9A4, 0x2EB510 - 0x2EA9A4

.global Pal_EkrDragonFireBG2
Pal_EkrDragonFireBG2:
    .incbin "FireEmblem7J.base.gba", 0x2EB510, 0x20

    .global Tsa_EkrDragonFireBG2
Tsa_EkrDragonFireBG2:	@ 0x082EB530
    .incbin "FireEmblem7J.base.gba", 0x2EB530, 0x2EB740 - 0x2EB530
