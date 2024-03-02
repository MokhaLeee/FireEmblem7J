	.section .rodata

	.global gStatScreenPersonalInfoLabelsInfo
gStatScreenPersonalInfoLabelsInfo:	@ 0x0841CBB8
	.incbin "FireEmblem7J.base.gba", 0x41CBB8, 0x41CC78 - 0x41CBB8

	.global gStatScreenEquipmentLabelsInfo
gStatScreenEquipmentLabelsInfo:	@ 0x0841CC78
	.incbin "FireEmblem7J.base.gba", 0x41CC78, 0x41CCD8 - 0x41CC78

	.global gStatScreenWeaponExpLabelsPhysicalInfo
gStatScreenWeaponExpLabelsPhysicalInfo:	@ 0x0841CCD8
	.incbin "FireEmblem7J.base.gba", 0x41CCD8, 0x41CD28 - 0x41CCD8

	.global gStatScreenWeaponExpLabelsMagicalInfo
gStatScreenWeaponExpLabelsMagicalInfo:	@ 0x0841CD28
	.incbin "FireEmblem7J.base.gba", 0x41CD28, 0x41CD78 - 0x41CD28
