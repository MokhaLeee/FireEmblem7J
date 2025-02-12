#include "gbafe.h"

EWRAM_OVERLAY(0) struct Font gTactInfoFont = {};
EWRAM_OVERLAY(0) struct Text gTactInfoTexts[3] = {};

// tactician config position

CONST_DATA struct Vec4 TactInfoPos[] = {
	{ 0x6C, 0x28 },
	{ 0x44, 0x48 },
	{ 0x7C, 0x48 },
	{ 0xBC, 0x48 }
};

// tactician config msg
CONST_DATA int TactInfoHelpboxMsgs[] = {
	MSG_3E4, // 軍師の名前です
	MSG_3E5, // 軍師の血液型です
	MSG_3E6, // 軍師の生まれた月です
	MSG_3E7  // 軍師の性別です
};

struct ProcCmd CONST_DATA ProcScr_TactInfo[] = {
	PROC_YIELD,
	PROC_CALL(TactInfo_Init),
	PROC_CALL(TactInfo_CheckParticipantDialogue),
	PROC_YIELD,
	PROC_CALL(TactInfo_HandleCheckParticipantPrompt),
PROC_LABEL(0),
	PROC_CALL(TactInfo_SetupGfx),
	PROC_CALL_ARG(NewFadeIn, 4),
	PROC_WHILE(FadeInExists),
	PROC_CALL(TactInfo_IntroDialogue1),
	PROC_YIELD,
	PROC_CALL(TactInfo_IntroDialogue2),
	PROC_YIELD,
	PROC_CALL(TactInfo_HandleIntroDialoguePrompt),
PROC_LABEL(1),
	PROC_CALL(sub_80A77AC),
	PROC_YIELD,
	PROC_CALL(sub_80A77E8),
PROC_LABEL(2),
	PROC_CALL(sub_80A76C8),
	PROC_REPEAT(sub_80A7834),
PROC_LABEL(4),
	PROC_CALL_ARG(NewFadeOut, 8),
	PROC_WHILE(FadeOutExists),
	PROC_CALL(sub_80A781C),
	PROC_CALL(StartTacticianNameSelect),
	PROC_YIELD,
	PROC_CALL(TactInfo_SetupGfx),
	PROC_CALL_ARG(NewFadeIn, 8),
	PROC_WHILE(FadeInExists),
	PROC_GOTO(2),
PROC_LABEL(3),
	PROC_CALL_ARG(NewFadeOut, 4),
	PROC_WHILE(FadeOutExists),
	PROC_CALL(sub_80A781C),
PROC_LABEL(5),
	PROC_YIELD,
	PROC_CALL(sub_80A79B8),
	PROC_SLEEP(10),
	PROC_END,
};

void nullsub_84(void) {}

void TactInfo_StartHelpbox(struct ProcTactInfo *proc)
{
	if (proc->do_helpbox == false) {
		LoadHelpBoxGfx(OBJ_VRAM0 + 0x6000, 0xD);
		proc->do_helpbox = true;
	}

	StartHelpBox(
		TactInfoPos[proc->cur_index].x,
		TactInfoPos[proc->cur_index].y,
		TactInfoHelpboxMsgs[proc->cur_index]
	);
}

void TactInfo_CloseHelpbox(struct ProcTactInfo *proc)
{
	CloseHelpBox();
	proc->do_helpbox = false;
}

void sub_80A7388(void)
{
	if (sub_8032CDC() != false)
		sub_8032CCC();
}

void sub_80A739C(ProcPtr proc)
{
	if (sub_8032CDC() == false)
		sub_8032CF4(proc, DecodeMsg(MSG_79C));
}

void UpdateTactMainHandShadow(int index, ProcPtr proc)
{
	int shadow_lens[] = {
		8, 2, 3, 1
	};

	ShowSysHandCursor(
		TactInfoPos[index].x,
		TactInfoPos[index].y,
		shadow_lens[index],
		0x0C00);
}

void UpdateTactMainHandPosition(int index)
{
	SetUiCursorHandConfig(
		0,
		TactInfoPos[index].x,
		TactInfoPos[index].y,
		0);
}

#if NONMATCHING
void sub_80A7424(void)
{
	int i;
	struct Font *font = &gTactInfoFont;

	InitSpriteTextFont(font, OBJ_VRAM0 + 0x1000, 0xF);
	SetTextFont(font);
	SetTextFontGlyphs(TEXT_GLYPHS_TALK);

	for (i = 0; i < 3; i++) {
		InitSpriteText(gTactInfoTexts + i);
		SpriteText_DrawBackgroundExt(gTactInfoTexts + i, 0);
	}

	ApplyPalette(Pal_08190268, 0x1F);

	Text_InsertDrawString(gTactInfoTexts, 0x00, TEXT_COLOR_SYSTEM_GREEN, GetTacticianName());
	Text_InsertDrawString(gTactInfoTexts, 0x40, TEXT_COLOR_SYSTEM_GREEN, DecodeMsg(TactGetMsg_Blood(gPlaySt.tact_blood)));
	Text_InsertDrawString(gTactInfoTexts, 0x60, TEXT_COLOR_SYSTEM_GREEN, DecodeMsg(TactGetMsg_Birth(gPlaySt.tact_birth)));
	Text_InsertDrawString(gTactInfoTexts, 0x80, TEXT_COLOR_SYSTEM_GREEN, DecodeMsg(TactGetMsg_Gender(gPlaySt.tact_gender)));

	PutIcon(
		gBg0Tm + TM_OFFSET(0xE, 0x5),
		TacticianAffins[gPlaySt.tact_birth][gPlaySt.tact_blood] + 0x79,
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
		ldr r4, _080A74F8 @ =gTactInfoFont\n\
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
		bl GetTacticianName\n\
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
		bl TactGetMsg_Blood\n\
		bl DecodeMsg\n\
		adds r3, r0, #0\n\
		adds r0, r5, #0\n\
		movs r1, #0x40\n\
		movs r2, #4\n\
		bl Text_InsertDrawString\n\
		ldrb r1, [r6]\n\
		lsrs r0, r1, #4\n\
		bl TactGetMsg_Birth\n\
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
		bl TactGetMsg_Gender\n\
		bl DecodeMsg\n\
		adds r3, r0, #0\n\
		adds r0, r5, #0\n\
		movs r1, #0x80\n\
		movs r2, #4\n\
		bl Text_InsertDrawString\n\
		ldr r0, _080A750C @ =gBg0Tm + 0x15c\n\
		ldr r3, _080A7510 @ =TacticianAffins\n\
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
	_080A74F8: .4byte gTactInfoFont\n\
	_080A74FC: .4byte 0x06011000\n\
	_080A7500: .4byte Pal_08190268\n\
	_080A7504: .4byte 0x02000084\n\
	_080A7508: .4byte gPlaySt\n\
	_080A750C: .4byte gBg0Tm + 0x15c\n\
	_080A7510: .4byte TacticianAffins\n\
		.syntax divided\n\
	");
}
#endif

void TactInfoFx_Thread(struct ProcTactInfo *proc)
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

void TactInfo_Init(struct ProcTactInfo *proc)
{
	proc->cur_index = 0;
	proc->do_helpbox = 0;

	SetTacticianName(DecodeMsg(MSG_79D));

	gPlaySt.tact_blood = 0;
	gPlaySt.tact_birth = 0;
	gPlaySt.tact_gender = 0;
}

void TactInfo_SetupGfx(struct ProcTactInfo *proc)
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

	Decompress(Img_TactInfoBg, (void *)(BG_VRAM + 0x1000));
	ApplyPalette(Pal_TactInfoBg, 0xF);
	TmApplyTsa(gBg2Tm, Tsa_TactInfoBg, 0xF080);

	StartUiCursorHand(proc);
	StartMuralBackgroundExt(
		NULL,
		(void *)(BG_VRAM + BGCHR_TACTICIAN_BGSCROLL * 0x20),
		BGPAL_TACTICIAN_BGSCROLL, 1);

	// ?
	sub_80A7424();
	StartParallelWorker(TactInfoFx_Thread, proc);
	StartHelpPromptSprite(0xB4, 0x10, proc);
}

void sub_80A76C8(struct ProcTactInfo *proc)
{
	EndSysHandCursor();
	ResetSysHandCursor(proc);
	DisplaySysHandCursorTextShadow(0x600, OBPAL_TACTICIAN_TEXTSHADOW);
	DisableUiCursorHand(0);
	sub_80A739C(proc);
	UpdateTactMainHandShadow(proc->cur_index, proc);
}

void TactInfo_IntroDialogue1(struct ProcTactInfo *proc)
{
	if (!IsGamePlayedThrough()) {
		EndSysHandCursor();
		sub_80A7388();
		StartBoxDialogueExt(0x30, 0x5A, MSG_79E, OBJ_VRAM0 + 0x6000, 0xD, proc);
		SetDialogueBoxConfig(0x70);
	}
}

void TactInfo_IntroDialogue2(struct ProcTactInfo *proc)
{
	EndSysHandCursor();
	sub_80A7388();
	StartBoxDialogueExt(0x70, 0x5A, MSG_79F, OBJ_VRAM0 + 0x6000, 0xD, proc);
	SetDialogueBoxConfig(0x70);
	SetTalkChoiceResult(TALK_RESULT_YES);
}

void TactInfo_HandleIntroDialoguePrompt(struct ProcTactInfo *proc)
{
	if (GetTalkChoiceResult() == TALK_RESULT_YES)
		Proc_Goto(proc, PL_TACTINFO_2);

	if (GetTalkChoiceResult() == TALK_RESULT_NO || GetTalkChoiceResult() == TALK_RESULT_CANCEL)
		Proc_Goto(proc, PL_TACTINFO_3);
}

void sub_80A77AC(struct ProcTactInfo *proc)
{
	EndSysHandCursor();
	sub_80A7388();
	StartBoxDialogueExt(0x60, 0x5A, MSG_7A0, OBJ_VRAM0 + 0x6000, 0xD, proc);
	SetDialogueBoxConfig(0xF0);
	SetTalkChoiceResult(TALK_RESULT_YES);
}

void sub_80A77E8(struct ProcTactInfo *proc)
{
	if (GetTalkChoiceResult() == TALK_RESULT_NO || GetTalkChoiceResult() == TALK_RESULT_CANCEL)
		Proc_Goto(proc, PL_TACTINFO_2);

	if (GetTalkChoiceResult() == TALK_RESULT_YES)
		Proc_Goto(proc, PL_TACTINFO_3);
}

void sub_80A781C(struct ProcTactInfo *proc)
{
	EndMuralBackground();
	EndMuralBackground_();
	EndAllProcChildren(proc);
}

void sub_80A7834(struct ProcTactInfo *proc)
{
	int index_pre = proc->cur_index;

	if (proc->do_helpbox == false) {
		if (gpKeySt->pressed & A_BUTTON) {
			PlaySoundEffect(SONG_38A);

			switch (proc->cur_index) {
			case TACTINFO_IDX_NAME:
				Proc_Goto(proc, PL_TACTINFO_4);
				return;

			case TACTINFO_IDX_BLOOD:
				StartTactBloodSelect(proc);
				break;

			case TACTINFO_IDX_BIRTH:
				StartTactBirthSelect(proc);
				break;

			case TACTINFO_IDX_GENDER:
				StartTactGenderSelect(proc);
				break;

			default:
				return;
			}

			UpdateTactMainHandPosition(proc->cur_index);
			Proc_Goto(proc, PL_TACTINFO_2);
			return;
		}

		if (gpKeySt->pressed & (B_BUTTON | START_BUTTON)) {
			Proc_Goto(proc, PL_TACTINFO_1);
			PlaySoundEffect(SONG_38A);
			return;
		}

		if (gpKeySt->pressed & R_BUTTON) {
			TactInfo_StartHelpbox(proc);
			return;
		}
	} else if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
		TactInfo_CloseHelpbox(proc);

	if (gpKeySt->repeated & DPAD_DOWN) {
		if (proc->cur_index == TACTINFO_IDX_NAME)
			proc->cur_index = TACTINFO_IDX_BIRTH;
	}

	if (gpKeySt->repeated & DPAD_UP) {
		if (proc->cur_index > TACTINFO_IDX_NAME)
			proc->cur_index = TACTINFO_IDX_NAME;
	}

	if (gpKeySt->repeated & DPAD_LEFT) {
		if (proc->cur_index != TACTINFO_IDX_NAME && proc->cur_index > TACTINFO_IDX_BLOOD)
			proc->cur_index--;
	}

	if (gpKeySt->repeated & DPAD_RIGHT) {
		u32 tmp = proc->cur_index - 1;

		if (tmp <= 1)
			proc->cur_index++;
	}

	if (index_pre != proc->cur_index) {
		if (proc->do_helpbox != false)
			TactInfo_StartHelpbox(proc);

		UpdateTactMainHandShadow(proc->cur_index, proc);
		PlaySoundEffect(SONG_385);
	}
}

void sub_80A79B8(struct ProcTactInfo *proc)
{
	WriteGameSave(ReadLastGameSaveId());
}

void TactInfo_CheckParticipantDialogue(struct ProcTactInfo *proc)
{
	if (gPlaySt.chapterModeIndex == 1) {
		Proc_Goto(proc, PL_TACTINFO_0);
		return;
	}

	InitBgs(NULL);
	ApplySystemObjectsGraphics();
	SetBlendNone();
	SetDispEnable(1, 1, 1, 1, 1);

	/**
	 * 軍師を参加させますか？
	 */
	StartBoxDialogueExt(0x38, 0x20, MSG_7A1, OBJ_VRAM0 + 0x6000, 0xD, proc);
	SetDialogueBoxConfig(0xF0);
	SetTalkChoiceResult(TALK_RESULT_NO);
}

void TactInfo_HandleCheckParticipantPrompt(struct ProcTactInfo *proc)
{
	if (GetTalkChoiceResult() == TALK_RESULT_NO || GetTalkChoiceResult() == TALK_RESULT_CANCEL) {
		gPlaySt.tact_enabled = false;
		Proc_Goto(proc, PL_TACTINFO_END);
	}
}

void StartTacticianInfo(ProcPtr parent)
{
	Proc_StartBlocking(ProcScr_TactInfo, parent);
}

CONST_DATA int Msgs_TactBlood[] = {
	MSG_7AE, // Ａ
	MSG_7AF, // Ｂ
	MSG_7B1, // Ｏ
	MSG_7B0  // ＡＢ
};

int TactGetMsg_Blood(int index)
{
	return Msgs_TactBlood[index];
}

CONST_DATA int Msgs_TactBirth[] = {
	MSG_7A2, // １月
	MSG_7A3, // ２月
	MSG_7A4,
	MSG_7A5,
	MSG_7A6,
	MSG_7A7,
	MSG_7A8,
	MSG_7A9,
	MSG_7AA,
	MSG_7AB,
	MSG_7AC,
	MSG_7AD
};

int TactGetMsg_Birth(int index)
{
	return Msgs_TactBirth[index];
}

CONST_DATA int Msgs_TactGender[] = {
	MSG_7B2, // 男
	MSG_7B3  // 女
};

int TactGetMsg_Gender(int index)
{
	return Msgs_TactGender[index];
}

CONST_DATA int Msgs_TactAffin[] = {
	MSG_000,
	MSG_1117, // 炎
	MSG_1118, // 雷
	MSG_1119,
	MSG_111A,
	MSG_111B,
	MSG_111C,
	MSG_111D
};

int TactGetMsg_Affin(int index)
{
	return Msgs_TactAffin[index];
}

void Tact_ClearNrVrams(void *vram, u32 chr, u32 nr_chrs)
{
	CpuFastFill(0, vram + chr * CHR_SIZE, nr_chrs * CHR_SIZE);
	CpuFastFill(0, vram + chr * CHR_SIZE + CHR_LINE * CHR_SIZE, nr_chrs * CHR_SIZE);
}

void TactBlood_Init(struct ProcTactBlood *proc)
{
	int i;

	proc->cur_index = gPlaySt.tact_blood;
	DrawUiFrame2(3, 11, 14, 4, 0);
	EnableBgSync(BG1_SYNC_BIT);
	ShowSysHandCursor(0x22 + proc->cur_index * 0x18, 0x60, 2, 0x800);
	SetTextFont(&gTactInfoFont);
	SetTextFontGlyphs(0);

	for (i = 0; i < 4; i++) {
		Text_InsertDrawString(
			&gTactInfoTexts[1],
			0x18 * i,
			TEXT_COLOR_SYSTEM_WHITE,
			DecodeMsg(TactGetMsg_Blood(i))
		);
	}

	SetTextFont(NULL);
}
