	.section .data

	.global gUnk_08C012BC
gUnk_08C012BC:	@ 0x08C012BC
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_80117DC
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_80118A8
	@ PROC_WHILE
	.short 0x14, 0x0
	.word CheckBmBgfxDone
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_8011900
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8011954
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0
