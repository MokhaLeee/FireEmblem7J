#include "gbafe.h"

EWRAM_OVERLAY(0) struct Font gTacticianConfigFont = {};
EWRAM_OVERLAY(0) struct Text gTacticianConfigTexts[3] = {};

// tactician config position
struct Vec4u { int x, y; };
CONST_DATA struct Vec4u gUnk_08DADD90[] = {
	{ 0x6C, 0x28 },
	{ 0x44, 0x48 },
	{ 0x7C, 0x48 },
	{ 0xBC, 0x48 }
};

// tactician config msg
CONST_DATA int gUnk_08DADDB0[] = {
	MSG_3E4,
	MSG_3E5,
	MSG_3E6,
	MSG_3E7
};

void sub_80A7404(int index)
{
	SetUiCursorHandConfig(0, gUnk_08DADD90[index].x, gUnk_08DADD90[index].y, 0);
}

#if NONMATCHING
void sub_80A7424(void)
{
	int i;
	struct Font *font = &gTacticianConfigFont;

	InitSpriteTextFont(font, OBJ_VRAM0 + 0x1000, 0xF);
	SetTextFont(font);
	SetTextFontGlyphs(TEXT_GLYPHS_TALK);

	for (i = 0; i < 3; i++) {
		InitSpriteText(gTacticianConfigTexts + i);
		SpriteText_DrawBackgroundExt(gTacticianConfigTexts + i, 0);
	}

	ApplyPalette(Pal_08190268, 0x1F);

	Text_InsertDrawString(gTacticianConfigTexts, 0x00, TEXT_COLOR_SYSTEM_GREEN, sub_802EBB0());
	Text_InsertDrawString(gTacticianConfigTexts, 0x40, TEXT_COLOR_SYSTEM_GREEN, DecodeMsg(sub_80A7AA8(gPlaySt.unk_2B_01)));
	Text_InsertDrawString(gTacticianConfigTexts, 0x60, TEXT_COLOR_SYSTEM_GREEN, DecodeMsg(sub_80A7AB8(gPlaySt.unk_2B_04)));
	Text_InsertDrawString(gTacticianConfigTexts, 0x80, TEXT_COLOR_SYSTEM_GREEN, DecodeMsg(sub_80A7AC8(gPlaySt.unk2C_00)));

	PutIcon(
		gBg0Tm + TM_OFFSET(0xE, 0x5),
		Unk_081C8FCC[gPlaySt.unk_2B_04][gPlaySt.unk_2B_01] + 0x79,
		0x5000
	);

	SetTextFont(NULL);
}
#else
NAKEDFUNC
void sub_80A7424(void)
{
	asm("\
		.syntax unified\n\
		push {r4, r5, r6, lr}\n\
		ldr r4, _080A74F8 @ =gTacticianConfigFont\n\
		ldr r1, _080A74FC @ =0x06011000\n\
		adds r0, r4, #0\n\
		movs r2, #0xf\n\
		bl InitSpriteTextFont\n\
		adds r0, r4, #0\n\
		bl SetTextFont\n\
		movs r0, #1\n\
		bl SetTextFontGlyphs\n\
		adds r4, #0x18\n\
		movs r5, #2\n\
	_080A7442:\n\
		adds r0, r4, #0\n\
		bl InitSpriteText\n\
		adds r0, r4, #0\n\
		movs r1, #0\n\
		bl SpriteText_DrawBackgroundExt\n\
		adds r4, #8\n\
		subs r5, #1\n\
		cmp r5, #0\n\
		bge _080A7442\n\
		ldr r0, _080A7500 @ =Pal_08190268\n\
		movs r1, #0xf8\n\
		lsls r1, r1, #2\n\
		movs r2, #0x20\n\
		bl ApplyPaletteExt\n\
		ldr r5, _080A7504 @ =0x02000084\n\
		bl sub_802EBB0\n\
		adds r3, r0, #0\n\
		adds r0, r5, #0\n\
		movs r1, #0\n\
		movs r2, #4\n\
		bl Text_InsertDrawString\n\
		ldr r4, _080A7508 @ =gPlaySt\n\
		adds r6, r4, #0\n\
		adds r6, #0x2b\n\
		ldrb r1, [r6]\n\
		lsls r0, r1, #0x1c\n\
		lsrs r0, r0, #0x1d\n\
		bl sub_80A7AA8\n\
		bl DecodeMsg\n\
		adds r3, r0, #0\n\
		adds r0, r5, #0\n\
		movs r1, #0x40\n\
		movs r2, #4\n\
		bl Text_InsertDrawString\n\
		ldrb r1, [r6]\n\
		lsrs r0, r1, #4\n\
		bl sub_80A7AB8\n\
		bl DecodeMsg\n\
		adds r3, r0, #0\n\
		adds r0, r5, #0\n\
		movs r1, #0x60\n\
		movs r2, #4\n\
		bl Text_InsertDrawString\n\
		adds r4, #0x2c\n\
		ldrb r4, [r4]\n\
		lsls r0, r4, #0x1f\n\
		lsrs r0, r0, #0x1f\n\
		bl sub_80A7AC8\n\
		bl DecodeMsg\n\
		adds r3, r0, #0\n\
		adds r0, r5, #0\n\
		movs r1, #0x80\n\
		movs r2, #4\n\
		bl Text_InsertDrawString\n\
		ldr r0, _080A750C @ =gBg0Tm + 0x15c\n\
		ldr r3, _080A7510 @ =Unk_081C8FCC\n\
		ldrb r2, [r6]\n\
		lsls r1, r2, #0x1c\n\
		lsrs r1, r1, #0x1d\n\
		lsls r1, r1, #2\n\
		lsrs r2, r2, #4\n\
		lsls r2, r2, #4\n\
		adds r1, r1, r2\n\
		adds r1, r1, r3\n\
		ldr r1, [r1]\n\
		adds r1, #0x79\n\
		movs r2, #0xa0\n\
		lsls r2, r2, #7\n\
		bl PutIcon\n\
		movs r0, #0\n\
		bl SetTextFont\n\
		pop {r4, r5, r6}\n\
		pop {r0}\n\
		bx r0\n\
		.align 2, 0\n\
	_080A74F8: .4byte gTacticianConfigFont\n\
	_080A74FC: .4byte 0x06011000\n\
	_080A7500: .4byte Pal_08190268\n\
	_080A7504: .4byte 0x02000084\n\
	_080A7508: .4byte gPlaySt\n\
	_080A750C: .4byte gBg0Tm + 0x15c\n\
	_080A7510: .4byte Unk_081C8FCC\n\
		.syntax divided\n\
	");
}
#endif

void TacticianConfigFx_Thread(struct ProcTacticianConfig *proc)
{
	int i;

	for (i = 0; i < 2; i++) {
		PutSpriteExt(
			4,
			0x80 + 0x20 * i,
			0x28,
			Sprite_32x16,
			0xF880 + 4 * i
		);
	}

	PutSpriteExt(4, 0x48, 0x48, Sprite_32x16, 0xF888);
	PutSpriteExt(4, 0x80, 0x48, Sprite_32x16, 0xF88C);
	PutSpriteExt(4, 0xC0, 0x48, Sprite_32x16, 0xF890);
}

void TacticianConfig_Init(struct ProcTacticianConfig *proc)
{
	proc->state = 0;
	proc->unk_30 = 0;

	SetTacticianName(DecodeMsg(MSG_79D));

	gPlaySt.unk_2B_01 = 0;
	gPlaySt.unk_2B_04 = 0;
	gPlaySt.unk2C_00 = 0;
}

void TacticianConfig_SetupGfx(struct ProcTacticianConfig *proc)
{
	InitBgs(NULL);
	ApplySystemObjectsGraphics();
	SetBlendNone();
	ResetText();
	UnpackUiWindowFrameGraphics();
	InitIcons();
	ApplyIconPalettes(4);

	gDispIo.bg0_ct.priority = 0;
	gDispIo.bg1_ct.priority = 2;
	gDispIo.bg2_ct.priority = 3;
	gDispIo.bg3_ct.priority = 3;
	SetBlendNone();

	Decompress(Img_TacticianConfigBg, (void *)(BG_VRAM + 0x1000));
	ApplyPalette(Pal_TacticianConfigBg, 0xF);
	TmApplyTsa(gBg2Tm, Tsa_TacticianConfigBg, 0xF080);

	StartUiCursorHand(proc);
	StartMuralBackgroundExt(NULL, (void *)(BG_VRAM + 0x8000), 0xA, 1);

	// ?
	sub_80A7424();
	StartParallelWorker(TacticianConfigFx_Thread, proc);
	StartHelpPromptSprite(0xB4, 0x10, proc);
}
