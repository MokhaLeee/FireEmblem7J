#pragma once

#include "global.h"

enum talk_vide {
    BGCHR_TALK = 0x80,

    BGPAL_TALK_BACKGROUND = 8,
};

enum talk_choice {
    TALK_RESULT_CANCEL,
    TALK_RESULT_YES,
    TALK_RESULT_NO,
};

enum talk_flag {
    TALK_FLAG_INSTANTSHIFT = 1 << 0,
    TALK_FLAG_NOBUBBLE = 1 << 1,
    TALK_FLAG_NOSKIP = 1 << 2,
    TALK_FLAG_NOFAST = 1 << 3,
    TALK_FLAG_OPAQUE = 1 << 4,
    TALK_FLAG_SPRITE = 1 << 5,
    TALK_FLAG_SILENT = 1 << 6,
    TALK_FLAG_7 = 1 << 7,
};

enum talk_face
{
    TALK_FACE_0,
    TALK_FACE_1,
    TALK_FACE_2,
    TALK_FACE_3,
    TALK_FACE_4,
    TALK_FACE_5,
    TALK_FACE_6,
    TALK_FACE_7,

    TALK_FACE_COUNT,

    TALK_FACE_NONE = 0xFF,
};

// ??? sub_8007C10
// ??? sub_8007C48
// ??? sub_8007C64
void InitTalk(int chr, int lines, bool unpack_bubble);
// ??? InitSpriteTalk
// ??? sub_8007DE0
void sub_8007DF4();
// ??? StartTalkExt
// ??? StartTalkMsg
// ??? StartTalkMsgExt
// ??? StartTalk
// ??? EndTalk
// ??? SetTalkLines
// ??? ClearAllTalkFlags
// ??? SetTalkFlag
// ??? sub_8007F38
// ??? sub_8007F44
// ??? sub_8007F58
// ??? sub_8007F68
// ??? sub_8007F84
// ??? sub_8007FC0
// ??? sub_8008074
// ??? sub_80080A8
bool sub_800821C(ProcPtr proc);
bool sub_8008308(ProcPtr proc);
// ??? LockTalk
// ??? IsTalkLocked
// ??? ResumeTalk
// ??? sub_800837C
// ??? TalkToggleInvertedPalette
int TalkInterpret(ProcPtr proc);
void sub_8008CB8(int);
// ??? sub_8008CC4
// ??? sub_8008DA8
// ??? sub_8008DC8
void sub_8008DFC(int talk_face, int toBack);
// ??? sub_8008E58
bool sub_8008EB0();
void sub_8008ECC(int talkFaceFrom, int talkFaceTo, bool isSwap);
// ??? sub_8008F24
// ??? sub_8008F80
// ??? sub_8009080
// ??? sub_800909C
// ??? sub_80090C0
// ??? nullsub_24
// ??? sub_800914C
// ??? sub_8009178
// ??? sub_80091AC
// ??? sub_8009218
// ??? sub_800925C
// ??? sub_8009310
// ??? sub_8009418
// ??? sub_8009458
// ??? sub_800954C
// ??? sub_8009564
// ??? sub_8009598
// ??? sub_80095D4
void sub_80095E4();
void sub_8009628();
// ??? sub_800968C
// ??? sub_80096E0
void sub_800981C();
// ??? sub_8009834
void sub_80098A0(int x, int y, int width, int height);
void sub_8009920(int bg, int x, int y, int kind);
void sub_8009AA8(int id, int x, int y, int width, int height);
// ??? nullsub_25
// ??? sub_8009BE8
// ??? sub_8009C58
// ??? sub_8009C8C
void sub_8009D0C(int talk_face, struct Proc* parent);
bool sub_8009D70();
int sub_8009D94(int talk_face);
// ??? SetTalkFaceDisp
void SetTalkFaceMouthMove(int face);
void SetTalkFaceNoMouthMove(int face);
// ??? IsTalkActive
// ??? FaceExists
// ??? GetTalkChoiceResult
// ??? SetTalkChoiceResult
// ??? SetTalkNumber
// ??? SetTalkUnkStr
// ??? PrintStringToTexts
// ??? TalkPutSpriteText_OnIdle
// ??? sub_8009F8C
// ??? sub_8009F98
int sub_8009FAC(char const * str, bool isBubbleOpen);
// ??? sub_800A378
// ??? sub_800A390
// ??? sub_800A3A4
// ??? StartTalkDebug
// ??? sub_800A3B8
// ??? sub_800A3C8
void TalkBgSync(int bits);

struct TalkSt
{
    char const * str;
    char const * str_back;
    u8 print_color;
    u8 line_active;
    u8 lines;
    u8 top_text_num;
    u8 x_text;
    u8 y_text;
    u8 active_width;
    s8 speak_talk_face;
    u8 speak_width;
    u8 active_talk_face;
    bool8 instant_print;
    s8 print_delay;
    s8 print_clock;
    u8 put_lines;
    u8 unk_16;
    u8 unk_17;
    struct FaceProc * faces[TALK_FACE_COUNT];
    u32 flags;
    int number;
    char buf_number_str[0x20];
    char buf_unk_str[0x20];
    u16 unk_80;
    u8 unk_82;
    u8 unk_83;
};

struct TalkChoiceEnt
{
    u16 msg;
    Func onSwitch;
};

struct TalkChoiceProc
{
    PROC_HEADER;

    short selectedChoice;
    short x_disp;
    short y_disp;
    int unused30;
    struct TalkChoiceEnt const * choices;
};

struct ProcTalkAdvance {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    void * dst;
    int unk50;
    int lines, _fill;

    STRUCT_PAD(0x5C, 0x64);

    s16 timer;
};

bool TalkAdvanceDeamon_Loop(ProcPtr proc);
void TalkAdvanceDeamon_End(ProcPtr proc);
void CleanTalkObjects(int chr, int lines, int default_val, ProcPtr parent);
void TalkAdvance_Init(struct ProcTalkAdvance * proc);
void TalkAdvance_Loop(struct ProcTalkAdvance * proc);

extern struct ProcCmd gUnk_08BFFB30[];
extern struct TalkSt * CONST_DATA sTalkSt;
extern struct ProcCmd gUnk_08BFFB6C[];
extern struct ProcCmd ProcScr_Talk[];
extern struct ProcCmd gUnk_08BFFBB4[];
extern struct ProcCmd gUnk_08BFFBBC[];
extern struct ProcCmd gUnk_08BFFBDC[];
extern struct ProcCmd gUnk_08BFFBFC[];
extern u16 const * CONST_DATA gUnk_08BFFC3C[];
extern struct ProcCmd gUnk_08BFFC7C[];
extern struct TalkChoiceEnt CONST_DATA gUnk_08BFFC9C[];
extern struct TalkChoiceEnt CONST_DATA gUnk_08BFFCAC[];
extern struct ProcCmd gUnk_08BFFCBC[];
extern struct ProcCmd gUnk_08BFFCD4[];
extern struct ProcCmd gUnk_08BFFCFC[];
extern int CONST_DATA gUnk_08BFFD2C[];
extern struct ProcCmd gUnk_08BFFD3C[];
extern struct ProcCmd gUnk_08BFFD4C[];
extern int CONST_DATA gUnk_08BFFD7C[];
extern u16 gUnk_08BFFD9C[];
extern u16 gUnk_08BFFDB6[];
extern struct ProcCmd gUnk_08BFFE18[];
extern struct ProcCmd ProcScr_TalkAdvanceDeamon[];
extern struct ProcCmd ProcScr_TalkAdvance[];
