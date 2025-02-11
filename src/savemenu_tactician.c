#include "gbafe.h"

EWRAM_OVERLAY(0) struct Font gTacticianConfigFont = {};
EWRAM_OVERLAY(0) struct Text gTacticianConfigTexts[3] = {};

#if 0
void sub_80A7424(void)
{
	int i;
	struct Font *font = &gTacticianConfigFont;

	InitSpriteTextFont(font, OBJ_VRAM0 + 0x1000, 0xF);
	SetTextFont(font);
	SetTextFontGlyphs(TEXT_GLYPHS_TALK);

	for (i = 0; i < 3; i++) {
		struct Text *text = gTacticianConfigTexts + i;

		InitSpriteText(text);
		SpriteText_DrawBackgroundExt(text, i);
	}
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
