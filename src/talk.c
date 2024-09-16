#include "gbafe.h"
#include "constants/msg.h"

enum
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

enum
{
    TALK_FLAG_INSTANTSHIFT = (1 << 0),
    TALK_FLAG_NOBUBBLE = (1 << 1),
    TALK_FLAG_SPRITE = (1 << 5),
    TALK_FLAG_SILENT = (1 << 6),
    TALK_FLAG_7 = (1 << 7),
};

struct TalkSt
{
    /* 00 */ char const * str;
    /* 04 */ char const * str_back;
    /* 08 */ u8 print_color;
    /* 09 */ u8 line_active;
    /* 0A */ u8 lines;
    /* 0B */ u8 top_text_num;
    /* 0C */ u8 x_text;
    /* 0D */ u8 y_text;
    /* 0E */ u8 active_width;
    /* 0F */ s8 speak_talk_face;
    /* 10 */ u8 speak_width;
    /* 11 */ u8 active_talk_face;
    /* 12 */ bool8 instant_print;
    /* 13 */ s8 print_delay;
    /* 14 */ s8 print_clock;
    /* 15 */ u8 put_lines;
    /* 16 */ u8 unk_16;
    /* 17 */ u8 unk_17;
    /* 18 */ struct FaceProc * faces[TALK_FACE_COUNT];
    /* 38 */ u32 flags;
    /* 3A */ // pad
    /* 3C */ int number;
    /* 40 */ char buf_number_str[0x20];
    /* 60 */ char buf_unk_str[0x20];
    /* 80 */ u16 unk_80;
    /* 82 */ u8 unk_82;
    /* 83 */ u8 unk_83;
};

struct TalkChoiceEnt
{
    u16 msg;
    Func onSwitch;
};

struct TalkChoiceProc
{
    /* 00 */ PROC_HEADER;

    /* 2A */ short selectedChoice;
    /* 2C */ short x_disp;
    /* 2E */ short y_disp;
    /* 30 */ int unused30;
    /* 34 */ struct TalkChoiceEnt const * choices;
};

void TryUnlockProc(ProcPtr proc);
void sub_8007DF4();
void sub_8008CB8(int);
int sub_8009FAC(char const * str, bool isBubbleOpen);
void sub_800EF98();
void SetTalkFaceNoMouthMove(int face);
void sub_800EC74();
int sub_8009D94(int talk_face);
void sub_8008DFC(int talk_face, int toBack);
void sub_80149B4(ProcPtr proc, int arg_1);
void sub_8009628();
void TalkBgSync(int bits);
bool IsEventRunning();
int GetTextPrintDelay();
void sub_8008ECC(int talkFaceFrom, int talkFaceTo, bool isSwap);
void sub_8014FB0(void (*)(), int);
u8 sub_80149EC(int number, char * buf);
const char* sub_802EBB0();
void sub_800515C(signed char, int);
void sub_8005234(int, int, int, int);
void sub_800EC84(int);

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkSt->top_text_num) % sTalkSt->lines)

extern struct ProcCmd gUnk_08BFFE18[];
extern struct ProcCmd gUnk_08BFFD3C[];
extern struct ProcCmd gUnk_08BFFD4C[];
extern struct ProcCmd gUnk_08BFFCBC[];
extern struct ProcCmd gUnk_08BFFBFC[];
extern struct ProcCmd gUnk_08BFFB6C[];
extern struct ProcCmd gUnk_08BFFC7C[];
extern struct ProcCmd gUnk_08BFFBBC[];
extern struct ProcCmd gUnk_08BFFBDC[];
extern struct ProcCmd gUnk_08BFFBB4[];
extern struct ProcCmd gUnk_08BFFCFC[];
extern struct ProcCmd gUnk_08BFFCD4[];
extern struct ProcCmd gUnk_08BFFB30[];
extern u16 gUnk_08BFFDB6[];
extern u16 gUnk_08BFFD9C[];
extern struct ProcCmd ProcScr_Talk[];
extern struct TalkSt * CONST_DATA sTalkSt;
extern int sTalkChoiceResult;
extern int CONST_DATA gUnk_08BFFD7C[];
extern int CONST_DATA gUnk_08BFFD2C[];
extern u16 const * CONST_DATA gUnk_08BFFC3C[];
extern struct TalkChoiceEnt CONST_DATA gUnk_08BFFCAC[];
extern struct TalkChoiceEnt CONST_DATA gUnk_08BFFCAC[];
extern u16 gUnk_081902C8[];
extern u16 gUnk_081902A8[];
extern u16 gUnk_08402A4C[];
extern u16 gUnk_084027B0[];
extern struct Text sTalkText[];
extern struct Font sTalkFont;

struct UnkFaceProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct FaceProc * face_proc;
    /* 30 */ struct FaceInfo * info;
};

void sub_8007C10(struct UnkFaceProc * proc)
{
    if (proc->face_proc->eye_proc)
    {
        proc->face_proc->eye_proc->blink = proc->info->blink_type;
        Proc_Goto(proc->face_proc->eye_proc, 0);
        TryUnlockProc(proc->face_proc->eye_proc);
    }

    if (proc->face_proc->mouth_proc)
    {
        TryUnlockProc(proc->face_proc->mouth_proc);
    }
}

#if 0

void sub_8007C48(struct FaceProc* parent, int face_id)
{
    struct Proc * proc = Proc_Start(gUnk_08BFFB30, parent);
    proc->x = (int)parent; //???
    proc->unk34 = face_id;
}

#else

NAKEDFUNC
void sub_8007C48(struct FaceProc* parent, int face_id)
{
    asm("   .syntax unified\n\
    push {r4, r5, lr}\n\
    adds r4, r0, #0\n\
    adds r5, r1, #0\n\
    ldr r0, _08007C60 @ =gUnk_08BFFB30\n\
    adds r1, r4, #0\n\
    bl Proc_Start\n\
    str r4, [r0, #0x2c]\n\
    str r5, [r0, #0x34]\n\
    pop {r4, r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08007C60: .4byte gUnk_08BFFB30\n\
    .syntax divided\n\
");
}

#endif

void sub_8007C64()
{
    int i;

    for (i = 0; i < TALK_FACE_COUNT; i++)
    {
        sTalkSt->faces[i] = 0;
    }
}

void InitTalk(int chr, int lines, bool unpack_bubble)
{
    int i;

    InitTextFont(&sTalkFont, (u8 *) VRAM + GetBgChrOffset(0) + ((chr & 0x3FF) << 5), chr, BGPAL_TALK);
    sub_8007DF4();

    sTalkSt->lines = lines;

    for (i = 0; i < lines; ++i)
    {
        InitText(sTalkText + i, 30);
        Text_SetColor(sTalkText + i, TEXT_COLOR_0456);
    }

    if (unpack_bubble)
    {
        Decompress(gUnk_084027B0, (u8 *) VRAM + GetBgChrOffset(1) + 0x200);
        ApplyPalette(gUnk_08402A4C, BGPAL_TALK_BUBBLE);
    }

    sub_8007C64();
}

void InitSpriteTalk(int chr, int lines, int palid)
{
    int i;

    InitSpriteTextFont(&sTalkFont, (u8 *) VRAM + 0x10000 + ((chr & 0x3FF) << 5), palid);

    SetTextFont(&sTalkFont);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    ApplyPalette(Pal_Text+0x10, 0x10 + palid);

    PAL_OBJ_COLOR(palid, 4)  = RGB(7,  18, 28);
    PAL_OBJ_COLOR(palid, 14) = RGB(14, 13, 12);
    PAL_OBJ_COLOR(palid, 15) = RGB(31, 31, 31);

    sTalkSt->lines = lines;

    for (i = 0; i < lines; ++i)
    {
        InitSpriteText(sTalkText + i);

        SpriteText_DrawBackground(sTalkText + i);
        Text_SetColor(sTalkText + i, TEXT_COLOR_4DEF);
        Text_SetCursor(sTalkText + i, 4);
    }
}

void sub_8007DE0()
{
    ApplyPaletteExt(Pal_Text, 0x40, 0x20);
}

void sub_8007DF4()
{
    SetTextFont(&sTalkFont);
    InitTalkTextFont();
}

ProcPtr StartTalkExt(int x, int y, const char* msg, ProcPtr proc)
{
    sTalkSt->x_text = x;
    sTalkSt->y_text = y;
    sTalkSt->str = msg;
    sTalkSt->str_back = 0;
    sTalkSt->print_color = 1;
    sTalkSt->line_active = 0;
    sTalkSt->unk_82 = 0;
    sTalkSt->top_text_num = 0;
    sTalkSt->print_delay = GetTextPrintDelay();
    sTalkSt->print_clock = 0;
    sub_8008CB8(0xFF);
    sTalkSt->speak_talk_face = 0xff;
    sTalkSt->put_lines = 0;
    sTalkSt->instant_print = 0;
    sTalkSt->unk_16 = 1;
    sTalkSt->unk_17 = 0;
    sTalkSt->unk_80 = 0;
    sTalkSt->flags = 0;
    sTalkSt->unk_83 = 0;
    sTalkSt->active_width = Div(sub_8009FAC(sTalkSt->str, 0) + 7, 8) + 2;

    if (proc)
    {
        return Proc_StartBlocking(ProcScr_Talk, proc);
    }
    else
    {
        return Proc_Start(ProcScr_Talk, (ProcPtr)3);
    }
}

ProcPtr StartTalkMsg(int x, int y, int id)
{
    return StartTalkExt(x, y, DecodeMsg(id), 0);
}

ProcPtr StartTalkMsgExt(int x, int y, int id, ProcPtr proc)
{
    return StartTalkExt(x, y, DecodeMsg(id), proc);
}

ProcPtr StartTalk(int x, int y, const char* msg)
{
    return StartTalkExt(x, y, msg, 0);
}

void EndTalk()
{
    Proc_EndEach(ProcScr_Talk);
}

void SetTalkLines(u8 lines)
{
    sTalkSt->lines = lines;
}

void ClearAllTalkFlags()
{
    sTalkSt->unk_80 = 0;
}

void SetTalkFlag(int talk_flags)
{
    sTalkSt->unk_80 |= talk_flags;
}

void sub_8007F38(u32 flags)
{
    sTalkSt->flags = flags;
}

void sub_8007F44(int unk)
{
    sTalkSt->unk_80 &= (~unk);
}

int sub_8007F58(int flag)
{
    return sTalkSt->unk_80 & flag;
}

void sub_8007F68(s8 delay)
{
    sTalkSt->print_delay = delay;
    if (sTalkSt->print_delay < 0)
    {
        sTalkSt->print_delay = 0;
    }
}

void sub_8007F84(u8 color)
{
    int i;

    sTalkSt->print_color = color;

    for (i = 0; i < sTalkSt->lines; i++)
    {
        Text_SetColor(&sTalkText[i], sTalkSt->print_color);
    }
}

void sub_8007FC0(ProcPtr proc)
{
    if (!Proc_Find(gUnk_08BFFC7C) && !Proc_Find(gUnk_08BFFCD4))
    {
        if (!sub_8007F58(4) && (gpKeySt->pressed & 0xA))
        {
            sub_800EF98();
            SetTalkFaceNoMouthMove(sTalkSt->active_talk_face);
            Proc_End(proc);
            EndTalk();
            TmFill(gBg0Tm, 0);
            TmFill(gBg1Tm, 0);
            EnableBgSync(3);
        }
        else if (!Proc_Find(gUnk_08BFFBFC) && !sub_8007F58(8))
        {
            if (gpKeySt->pressed & 0xf3)
            {
                sTalkSt->instant_print = 1;
            }
        }
    }
}

void sub_8008074()
{
    if (!sub_8007F58(0x20))
    {
        ApplySystemObjectsGraphics();
        SetBgOffset(0, 0, 0);
        SetBgOffset(1, 0, 0);
    }

    Proc_Start(gUnk_08BFFB6C, (ProcPtr)3);
}

#if 0

void sub_80080A8(ProcPtr proc)
{
    int ti;
    bool b = sub_8008EB0();

    if (b)
        return;

    if (!sTalkSt->instant_print)
    {
        sTalkSt->print_clock++;

        if (sTalkSt->print_clock >= sTalkSt->print_delay)
        {
            return;
        }
    }

    sTalkSt->print_clock = b;

    for (;;)
    {
        SetTalkFaceNoMouthMove(sTalkSt->active_talk_face);

        switch (TalkInterpret(proc))
        {
        case 0:
            Proc_Break(proc);
            return;
        case 1:
            goto print_next_char;

        case 2:
            if (sTalkSt->instant_print || sTalkSt->print_delay <= 0)
            {
                break;
                goto reset_print_clock;
            }

            return;

        case 3:
        reset_print_clock:
            sTalkSt->print_clock = sTalkSt->print_delay;
            sTalkSt->instant_print = FALSE;
            return;

        default:
        print_next_char:
            if (!sub_8007F58(TALK_FLAG_SPRITE))
            {
                if (sub_800821C(proc) == TRUE)
                    return;
            }
            else
            {
                if (sub_8008308(proc) == TRUE)
                    return;
            }

            sTalkSt->str = Text_DrawCharacter(TALK_TEXT_BY_LINE(sTalkSt->line_active), sTalkSt->str);

            if (!sub_8007F58(TALK_FLAG_SILENT))
            {
                if (sub_8007F58(TALK_FLAG_7) >= 0)
                {
                    if (/*0x0202BC35*/)
                    {
                        m4aSongNumStart(0x39A);
                    }
                }
                else
                {
                    if ((GetTextPrintDelay() == 1) && !(GetGameTime() & 1))
                        break;

                    m4aSongNumStart(0x38E);
                }
            }
        }

        if (!sTalkSt->instant_print && sTalkSt->print_delay > 0)
            return;
    }
}

#else

NAKEDFUNC
void sub_80080A8(ProcPtr proc)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    adds r6, r0, #0\n\
    bl sub_8008EB0\n\
    lsls r0, r0, #0x18\n\
    asrs r3, r0, #0x18\n\
    cmp r3, #0\n\
    beq _080080BE\n\
    b _0800820E_THE_END\n\
_080080BE:\n\
    ldr r2, _08008108 @ =sTalkSt\n\
    ldr r1, [r2]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    bne _080080E2\n\
    ldrb r0, [r1, #0x14]\n\
    adds r0, #1\n\
    strb r0, [r1, #0x14]\n\
    ldr r0, [r2]\n\
    movs r1, #0x14\n\
    ldrsb r1, [r0, r1]\n\
    ldrb r0, [r0, #0x13]\n\
    lsls r0, r0, #0x18\n\
    asrs r0, r0, #0x18\n\
    cmp r1, r0\n\
    bge _080080E2\n\
    b _0800820E_THE_END\n\
_080080E2:\n\
    ldr r0, [r2]\n\
    strb r3, [r0, #0x14]\n\
_080080E6:\n\
    ldr r7, _08008108 @ =sTalkSt\n\
    ldr r0, _0800810C @ =0x0202BC35\n\
    mov r8, r0\n\
_080080EC:\n\
    ldr r0, [r7]\n\
    ldrb r0, [r0, #0x11]\n\
    bl SetTalkFaceNoMouthMove\n\
    adds r0, r6, #0\n\
    bl TalkInterpret\n\
    cmp r0, #1\n\
    beq _08008144\n\
    cmp r0, #1\n\
    bgt _08008110\n\
    cmp r0, #0\n\
    beq _0800811A\n\
    b _08008144\n\
    .align 2, 0\n\
_08008108: .4byte sTalkSt\n\
_0800810C: .4byte 0x0202BC35\n\
_08008110:\n\
    cmp r0, #2\n\
    beq _08008122\n\
    cmp r0, #3\n\
    beq _08008136\n\
    b _08008144\n\
_0800811A:\n\
    adds r0, r6, #0\n\
    bl Proc_Break\n\
    b _0800820E_THE_END\n\
_08008122:\n\
    ldr r1, [r7]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    bne _080080E6\n\
    movs r0, #0x13\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    ble _080081F8\n\
    b _0800820E_THE_END\n\
_08008136:\n\
    ldr r0, [r7]\n\
    ldrb r1, [r0, #0x13]\n\
    movs r2, #0\n\
    strb r1, [r0, #0x14]\n\
    ldr r0, [r7]\n\
    strb r2, [r0, #0x12]\n\
    b _0800820E_THE_END\n\
_08008144:\n\
    movs r0, #0x20\n\
    bl sub_8007F58\n\
    cmp r0, #0\n\
    bne _08008156\n\
    adds r0, r6, #0\n\
    bl sub_800821C\n\
    b _0800815C\n\
_08008156:\n\
    adds r0, r6, #0\n\
    bl sub_8008308\n\
_0800815C:\n\
    lsls r0, r0, #0x18\n\
    asrs r0, r0, #0x18\n\
    cmp r0, #1\n\
    beq _0800820E_THE_END\n\
    ldr r5, _080081AC @ =sTalkSt\n\
    ldr r4, [r5]\n\
    ldrb r1, [r4, #0xb]\n\
    ldrb r2, [r4, #9]\n\
    adds r0, r1, r2\n\
    ldrb r1, [r4, #0xa]\n\
    bl __modsi3\n\
    lsls r0, r0, #3\n\
    ldr r1, _080081B0 @ =0x030000C8\n\
    adds r0, r0, r1\n\
    ldr r1, [r4]\n\
    bl Text_DrawCharacter\n\
    ldr r1, [r5]\n\
    str r0, [r1]\n\
    movs r0, #0x40\n\
    bl sub_8007F58\n\
    cmp r0, #0\n\
    bne _080081F8\n\
    movs r0, #0x80\n\
    bl sub_8007F58\n\
    cmp r0, #0\n\
    beq _080081B8\n\
    mov r1, r8\n\
    ldrb r1, [r1]\n\
    lsls r0, r1, #0x1e\n\
    cmp r0, #0\n\
    blt _080081F8\n\
    ldr r0, _080081B4 @ =0x0000039A\n\
    bl m4aSongNumStart\n\
    b _080081F8\n\
    .align 2, 0\n\
_080081AC: .4byte sTalkSt\n\
_080081B0: .4byte 0x030000C8\n\
_080081B4: .4byte 0x0000039A\n\
_080081B8:\n\
    bl GetTextPrintDelay\n\
    adds r4, r0, #0\n\
    cmp r4, #1\n\
    bne _080081CC\n\
    bl GetGameTime\n\
    ands r0, r4\n\
    cmp r0, #0\n\
    beq _080081F8\n\
_080081CC:\n\
    ldr r1, [r5]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    beq _080081E0\n\
    adds r0, r1, #0\n\
    adds r0, #0x82\n\
    ldrb r0, [r0]\n\
    cmp r0, #0\n\
    bne _080081F8\n\
_080081E0:\n\
    adds r0, r1, #0\n\
    adds r0, #0x82\n\
    movs r1, #1\n\
    strb r1, [r0]\n\
    mov r2, r8\n\
    ldrb r2, [r2]\n\
    lsls r0, r2, #0x1e\n\
    cmp r0, #0\n\
    blt _080081F8\n\
    ldr r0, _08008218 @ =0x0000038E\n\
    bl m4aSongNumStart\n\
_080081F8:\n\
    ldr r1, [r7]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    beq _08008204\n\
    b _080080EC\n\
_08008204:\n\
    movs r0, #0x13\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    bgt _0800820E_THE_END\n\
    b _080080EC\n\
_0800820E_THE_END:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08008218: .4byte 0x0000038E\n\
    .syntax divided\n\
");
}

#endif

#if NONMATCHING

// missing useless ldr r4, _08008284 @ =sTalkSt

bool sub_800821C(ProcPtr proc)
{
    if (!sub_8009D70() && sTalkSt->active_talk_face != 0xFF && !sub_8007F58(2))
    {
        const char* str = sTalkSt->str_back;
        if (str == NULL)
        {
            str = sTalkSt->str;
        }

        sTalkSt->active_width = Div(sub_8009FAC(str, 0) + 7, 8) + 2;
        sub_80095E4();
        sub_8009D0C(sTalkSt->active_talk_face, proc);
        sub_8008DFC(sTalkSt->active_talk_face, sub_8007F58(16));
        return TRUE;
    }
    
    if (sTalkSt->line_active >= sTalkSt->lines)
    {
        sTalkSt->instant_print = 0;
        Proc_StartBlocking(gUnk_08BFFCD4, proc);
        return TRUE;
    }

    if (sTalkSt->put_lines == 0)
    {
        u32 r0 = (sTalkSt->line_active + sTalkSt->top_text_num) % sTalkSt->lines;
        PutText(&sTalkText[r0], &gBg0Tm[((sTalkSt->y_text + (sTalkSt->line_active << 1)) << 5) + sTalkSt->x_text]);
        TalkBgSync(1);
        sTalkSt->put_lines = 1;
    }

    if (sTalkSt->unk_16)
    {
        SetTalkFaceMouthMove(sTalkSt->active_talk_face);
    }

    return FALSE;
}

#else

NAKEDFUNC
bool sub_800821C(ProcPtr proc)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    adds r7, r0, #0\n\
    bl sub_8009D70\n\
    lsls r0, r0, #0x18\n\
    cmp r0, #0\n\
    bne _08008288\n\
    ldr r4, _08008284 @ =sTalkSt\n\
    ldr r0, [r4]\n\
    ldrb r0, [r0, #0x11]\n\
    cmp r0, #0xff\n\
    beq _08008288\n\
    movs r0, #2\n\
    bl sub_8007F58\n\
    cmp r0, #0\n\
    bne _08008288\n\
    ldr r1, [r4]\n\
    ldr r0, [r1, #4]\n\
    cmp r0, #0\n\
    bne _08008248\n\
    ldr r0, [r1]\n\
_08008248:\n\
    movs r1, #0\n\
    bl sub_8009FAC\n\
    adds r0, #7\n\
    movs r1, #8\n\
    bl Div\n\
    ldr r1, [r4]\n\
    adds r0, #2\n\
    strb r0, [r1, #0xe]\n\
    bl sub_80095E4\n\
    ldr r4, _08008284 @ =sTalkSt\n\
    ldr r0, [r4]\n\
    ldrb r0, [r0, #0x11]\n\
    adds r1, r7, #0\n\
    bl sub_8009D0C\n\
    ldr r0, [r4]\n\
    ldrb r4, [r0, #0x11]\n\
    movs r0, #0x10\n\
    bl sub_8007F58\n\
    adds r1, r0, #0\n\
    adds r0, r4, #0\n\
    bl sub_8008DFC\n\
    movs r0, #1\n\
    b _080082F8\n\
    .align 2, 0\n\
_08008284: .4byte sTalkSt\n\
_08008288: // if sub_8009D70()\n\
    ldr r6, _080082A4 @ =sTalkSt\n\
    ldr r5, [r6]\n\
    ldrb r0, [r5, #9]\n\
    ldrb r1, [r5, #0xa]\n\
    cmp r0, r1\n\
    blo _080082AC\n\
    movs r0, #0\n\
    strb r0, [r5, #0x12]\n\
    ldr r0, _080082A8 @ =gUnk_08BFFCD4\n\
    adds r1, r7, #0\n\
    bl Proc_StartBlocking\n\
    movs r0, #1\n\
    b _080082F8\n\
    .align 2, 0\n\
_080082A4: .4byte sTalkSt\n\
_080082A8: .4byte gUnk_08BFFCD4\n\
_080082AC:\n\
    ldrb r0, [r5, #0x15]\n\
    cmp r0, #0\n\
    bne _080082E8\n\
    ldrb r4, [r5, #9]\n\
    ldrb r1, [r5, #0xb]\n\
    adds r0, r1, r4\n\
    ldrb r1, [r5, #0xa]\n\
    bl __modsi3\n\
    lsls r0, r0, #3\n\
    ldr r1, _08008300 @ =0x030000C8\n\
    adds r0, r0, r1\n\
    lsls r4, r4, #1\n\
    ldrb r1, [r5, #0xd]\n\
    adds r4, r1, r4\n\
    lsls r4, r4, #5\n\
    ldrb r5, [r5, #0xc]\n\
    adds r4, r5, r4\n\
    lsls r4, r4, #1\n\
    ldr r1, _08008304 @ =gBg0Tm\n\
    adds r4, r4, r1\n\
    adds r1, r4, #0\n\
    bl PutText\n\
    movs r0, #1\n\
    bl TalkBgSync\n\
    ldr r1, [r6]\n\
    movs r0, #1\n\
    strb r0, [r1, #0x15]\n\
_080082E8:\n\
    ldr r1, [r6]\n\
    ldrb r0, [r1, #0x16]\n\
    cmp r0, #0\n\
    beq _080082F6\n\
    ldrb r0, [r1, #0x11]\n\
    bl SetTalkFaceMouthMove\n\
_080082F6:\n\
    movs r0, #0\n\
_080082F8:\n\
    pop {r4, r5, r6, r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n\
    .align 2, 0\n\
_08008300: .4byte 0x030000C8\n\
_08008304: .4byte gBg0Tm\n\
");
}

#endif

bool sub_8008308(ProcPtr proc)
{
    u8 line_active = sTalkSt->line_active;
    u8 lines = sTalkSt->lines;

    if (line_active >= lines)
    {
        sTalkSt->instant_print = 0;
        Proc_StartBlocking(gUnk_08BFFCFC, proc);
        return TRUE;
    }
    else
    {
        if (sTalkSt->put_lines == 0)
        {
            sTalkSt->put_lines = 1;
        }
        return FALSE;
    }
}

void LockTalk(ProcPtr proc)
{
    Proc_StartBlocking(gUnk_08BFFBB4, proc);
}

bool IsTalkLocked()
{
    return Proc_Exists(gUnk_08BFFBB4);
}

void ResumeTalk()
{
    Proc_EndEach(gUnk_08BFFBB4);
}

void sub_800837C()
{
    if (sTalkSt->print_color == 1)
    {
        int i;
        for (i = 0; i < sTalkSt->lines; i++)
        {
            u32 r0 = (sTalkSt->top_text_num + i) % sTalkSt->lines;
            Text_SetColor(&sTalkText[r0], 4);
        }

        sTalkSt->print_color = 4;
    }
    else
    {
        int i;
        for (i = 0; i < sTalkSt->lines; i++)
        {
            u32 r0 = (sTalkSt->top_text_num + i) % sTalkSt->lines;
            Text_SetColor(&sTalkText[r0], 1);
        }

        sTalkSt->print_color = 1;
    }
}

void TalkToggleInvertedPalette(int id)
{
    if (id != 0)
    {
        ApplyPaletteExt(gUnk_081902C8, 0x60, 0x20);
        ApplyPaletteExt(gUnk_081902A8, 0x40, 0x20);
    }
    else
    {
        ApplyPaletteExt(gUnk_08402A4C, 0x60, 0x20);
        ApplyPaletteExt(Pal_Text, 0x40, 0x20);
    }
}

NAKEDFUNC
int TalkInterpret(ProcPtr proc)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    sub sp, #8\n\
    mov r8, r0\n\
_08008456:\n\
    ldr r7, _0800848C @ =sTalkSt\n\
    adds r5, r7, #0\n\
_0800845A:\n\
    ldr r1, [r5]\n\
    ldr r4, [r1]\n\
    ldrb r0, [r4]\n\
    cmp r0, #0x14\n\
    bgt _08008490\n\
    cmp r0, #0x12\n\
    blt _08008490\n\
    adds r4, #1\n\
    str r4, [r1]\n\
    bl sub_8009D70\n\
    adds r1, r0, #0\n\
    lsls r1, r1, #0x18\n\
    asrs r1, r1, #0x18\n\
    adds r0, r4, #0\n\
    bl sub_8009FAC\n\
    adds r0, #7\n\
    movs r1, #8\n\
    bl Div\n\
    ldr r1, [r5]\n\
    adds r0, #2\n\
    strb r0, [r1, #0xe]\n\
    b _0800845A\n\
    .align 2, 0\n\
_0800848C: .4byte sTalkSt\n\
_08008490:\n\
    ldr r0, [r7]\n\
    ldr r0, [r0]\n\
    ldrb r0, [r0]\n\
    cmp r0, #0x81\n\
    bls _0800849E\n\
    bl _08008CA8\n\
_0800849E:\n\
    lsls r0, r0, #2\n\
    ldr r1, _080084A8 @ =_080084AC\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080084A8: .4byte _080084AC\n\
_080084AC: @ jump table\n\
    .4byte _08008714 @ case 0\n\
    .4byte _0800872A @ case 1\n\
    .4byte _08008748 @ case 2\n\
    .4byte _08008790 @ case 3\n\
    .4byte _080087CC @ case 4\n\
    .4byte _080087CC @ case 5\n\
    .4byte _080087CC @ case 6\n\
    .4byte _080087CC @ case 7\n\
    .4byte _080088D0 @ case 8\n\
    .4byte _080088D0 @ case 9\n\
    .4byte _080088D0 @ case 10\n\
    .4byte _080088D0 @ case 11\n\
    .4byte _080088D0 @ case 12\n\
    .4byte _080088D0 @ case 13\n\
    .4byte _080088D0 @ case 14\n\
    .4byte _080088D0 @ case 15\n\
    .4byte _08008828 @ case 16\n\
    .4byte _08008868 @ case 17\n\
    .4byte _08008CA8 @ case 18\n\
    .4byte _08008CA8 @ case 19\n\
    .4byte _08008CA8 @ case 20\n\
    .4byte _08008800 @ case 21\n\
    .4byte _08008810 @ case 22\n\
    .4byte _0800881C @ case 23\n\
    .4byte _080088E2 @ case 24\n\
    .4byte _0800892C @ case 25\n\
    .4byte _08008978 @ case 26\n\
    .4byte _080089C4 @ case 27\n\
    .4byte _080088AC @ case 28\n\
    .4byte _08008CA8 @ case 29\n\
    .4byte _08008CA8 @ case 30\n\
    .4byte _08008CA8 @ case 31\n\
    .4byte _08008CA8 @ case 32\n\
    .4byte _08008CA8 @ case 33\n\
    .4byte _08008CA8 @ case 34\n\
    .4byte _08008CA8 @ case 35\n\
    .4byte _08008CA8 @ case 36\n\
    .4byte _08008CA8 @ case 37\n\
    .4byte _08008CA8 @ case 38\n\
    .4byte _08008CA8 @ case 39\n\
    .4byte _08008CA8 @ case 40\n\
    .4byte _08008CA8 @ case 41\n\
    .4byte _08008CA8 @ case 42\n\
    .4byte _08008CA8 @ case 43\n\
    .4byte _08008CA8 @ case 44\n\
    .4byte _08008CA8 @ case 45\n\
    .4byte _08008CA8 @ case 46\n\
    .4byte _08008CA8 @ case 47\n\
    .4byte _08008CA8 @ case 48\n\
    .4byte _08008CA8 @ case 49\n\
    .4byte _08008CA8 @ case 50\n\
    .4byte _08008CA8 @ case 51\n\
    .4byte _08008CA8 @ case 52\n\
    .4byte _08008CA8 @ case 53\n\
    .4byte _08008CA8 @ case 54\n\
    .4byte _08008CA8 @ case 55\n\
    .4byte _08008CA8 @ case 56\n\
    .4byte _08008CA8 @ case 57\n\
    .4byte _08008CA8 @ case 58\n\
    .4byte _08008CA8 @ case 59\n\
    .4byte _08008CA8 @ case 60\n\
    .4byte _08008CA8 @ case 61\n\
    .4byte _08008CA8 @ case 62\n\
    .4byte _08008CA8 @ case 63\n\
    .4byte _08008CA8 @ case 64\n\
    .4byte _08008CA8 @ case 65\n\
    .4byte _08008CA8 @ case 66\n\
    .4byte _08008CA8 @ case 67\n\
    .4byte _08008CA8 @ case 68\n\
    .4byte _08008CA8 @ case 69\n\
    .4byte _08008CA8 @ case 70\n\
    .4byte _08008CA8 @ case 71\n\
    .4byte _08008CA8 @ case 72\n\
    .4byte _08008CA8 @ case 73\n\
    .4byte _08008CA8 @ case 74\n\
    .4byte _08008CA8 @ case 75\n\
    .4byte _08008CA8 @ case 76\n\
    .4byte _08008CA8 @ case 77\n\
    .4byte _08008CA8 @ case 78\n\
    .4byte _08008CA8 @ case 79\n\
    .4byte _08008CA8 @ case 80\n\
    .4byte _08008CA8 @ case 81\n\
    .4byte _08008CA8 @ case 82\n\
    .4byte _08008CA8 @ case 83\n\
    .4byte _08008CA8 @ case 84\n\
    .4byte _08008CA8 @ case 85\n\
    .4byte _08008CA8 @ case 86\n\
    .4byte _08008CA8 @ case 87\n\
    .4byte _08008CA8 @ case 88\n\
    .4byte _08008CA8 @ case 89\n\
    .4byte _08008CA8 @ case 90\n\
    .4byte _08008CA8 @ case 91\n\
    .4byte _08008CA8 @ case 92\n\
    .4byte _08008CA8 @ case 93\n\
    .4byte _08008CA8 @ case 94\n\
    .4byte _08008CA8 @ case 95\n\
    .4byte _08008CA8 @ case 96\n\
    .4byte _08008CA8 @ case 97\n\
    .4byte _08008CA8 @ case 98\n\
    .4byte _08008CA8 @ case 99\n\
    .4byte _08008CA8 @ case 100\n\
    .4byte _08008CA8 @ case 101\n\
    .4byte _08008CA8 @ case 102\n\
    .4byte _08008CA8 @ case 103\n\
    .4byte _08008CA8 @ case 104\n\
    .4byte _08008CA8 @ case 105\n\
    .4byte _08008CA8 @ case 106\n\
    .4byte _08008CA8 @ case 107\n\
    .4byte _08008CA8 @ case 108\n\
    .4byte _08008CA8 @ case 109\n\
    .4byte _08008CA8 @ case 110\n\
    .4byte _08008CA8 @ case 111\n\
    .4byte _08008CA8 @ case 112\n\
    .4byte _08008CA8 @ case 113\n\
    .4byte _08008CA8 @ case 114\n\
    .4byte _08008CA8 @ case 115\n\
    .4byte _08008CA8 @ case 116\n\
    .4byte _08008CA8 @ case 117\n\
    .4byte _08008CA8 @ case 118\n\
    .4byte _08008CA8 @ case 119\n\
    .4byte _08008CA8 @ case 120\n\
    .4byte _08008CA8 @ case 121\n\
    .4byte _08008CA8 @ case 122\n\
    .4byte _08008CA8 @ case 123\n\
    .4byte _08008CA8 @ case 124\n\
    .4byte _08008CA8 @ case 125\n\
    .4byte _08008CA8 @ case 126\n\
    .4byte _08008CA8 @ case 127\n\
    .4byte _08008A10 @ case 128\n\
    .4byte _080086B4 @ case 129\n\
_080086B4:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    ldrb r2, [r0, #1]\n\
    cmp r2, #0x40\n\
    beq _080086C0\n\
    b _08008CA8\n\
_080086C0:\n\
    adds r0, #2\n\
    str r0, [r1]\n\
    ldrb r3, [r1, #0xb]\n\
    ldrb r2, [r1, #9]\n\
    adds r0, r3, r2\n\
    ldrb r1, [r1, #0xa]\n\
    bl __modsi3\n\
    lsls r0, r0, #3\n\
    ldr r1, _0800870C @ =0x030000C8\n\
    adds r0, r0, r1\n\
    movs r1, #6\n\
    bl Text_Skip\n\
    ldr r1, [r7]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    beq _080086E8\n\
    b _080087DC\n\
_080086E8:\n\
    movs r0, #0x13\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    ble _080087DC\n\
    ldr r0, _08008710 @ =gUnk_08BFFBDC\n\
    mov r1, r8\n\
    bl Proc_StartBlocking\n\
    adds r4, r0, #0\n\
    movs r0, #4\n\
    bl sub_80095D4\n\
    adds r1, r4, #0\n\
    adds r1, #0x64\n\
    strh r0, [r1]\n\
_08008706:\n\
    movs r0, #3\n\
    b _08008CAA\n\
    .align 2, 0\n\
_0800870C: .4byte 0x030000C8\n\
_08008710: .4byte gUnk_08BFFBDC\n\
_08008714:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1, #4]\n\
    cmp r0, #0\n\
    bne _08008720\n\
_0800871C:\n\
    movs r0, #0\n\
    b _08008CAA\n\
_08008720:\n\
    adds r0, #2\n\
    str r0, [r1]\n\
    movs r0, #0\n\
    str r0, [r1, #4]\n\
    b _08008456\n\
_0800872A:\n\
    ldr r1, [r7]\n\
    ldrb r3, [r1, #0x15]\n\
    cmp r3, #1\n\
    beq _08008738\n\
    ldrb r0, [r1, #9]\n\
    cmp r0, #1\n\
    bne _0800873E\n\
_08008738:\n\
    ldrb r0, [r1, #9]\n\
    adds r0, #1\n\
    strb r0, [r1, #9]\n\
_0800873E:\n\
    ldr r1, [r7]\n\
    movs r0, #0\n\
    strb r0, [r1, #0x15]\n\
    ldr r1, [r7]\n\
    b _080087D6\n\
_08008748:\n\
    movs r0, #0x80\n\
    bl sub_8007F58\n\
    cmp r0, #0\n\
    beq _08008768\n\
    bl sub_8009598\n\
    ldr r0, _08008764 @ =sTalkSt\n\
    ldr r1, [r0]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    b _08008784\n\
    .align 2, 0\n\
_08008764: .4byte sTalkSt\n\
_08008768:\n\
    movs r0, #1\n\
    bl sub_8007F58\n\
    cmp r0, #0\n\
    bne _08008780\n\
    ldr r0, _0800877C @ =gUnk_08BFFC7C\n\
    mov r1, r8\n\
    bl Proc_StartBlocking\n\
    b _08008784\n\
    .align 2, 0\n\
_0800877C: .4byte gUnk_08BFFC7C\n\
_08008780:\n\
    bl sub_800968C\n\
_08008784:\n\
    ldr r0, _0800878C @ =sTalkSt\n\
    ldr r1, [r0]\n\
    b _08008BBC\n\
    .align 2, 0\n\
_0800878C: .4byte sTalkSt\n\
_08008790:\n\
    ldr r1, [r7]\n\
    ldrb r2, [r1, #0xb]\n\
    ldrb r3, [r1, #9]\n\
    adds r0, r2, r3\n\
    ldrb r1, [r1, #0xa]\n\
    bl __modsi3\n\
    lsls r0, r0, #3\n\
    ldr r1, _080087C8 @ =0x030000C8\n\
    adds r0, r0, r1\n\
    bl Text_GetCursor\n\
    ldr r3, [r7]\n\
    ldrb r2, [r3, #0xc]\n\
    lsls r1, r2, #3\n\
    adds r1, r1, r0\n\
    adds r1, #4\n\
    ldrb r0, [r3, #0xd]\n\
    lsls r2, r0, #3\n\
    ldrb r3, [r3, #9]\n\
    lsls r0, r3, #4\n\
    adds r2, r2, r0\n\
    adds r2, #8\n\
    mov r0, r8\n\
    bl sub_800914C\n\
    b _08008BBA\n\
    .align 2, 0\n\
_080087C8: .4byte 0x030000C8\n\
_080087CC:\n\
    ldr r1, [r7]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    beq _080087E0\n\
_080087D6:\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
_080087DC:\n\
    movs r0, #2\n\
    b _08008CAA\n\
_080087E0:\n\
    ldr r0, _080087FC @ =gUnk_08BFFBDC\n\
    mov r1, r8\n\
    bl Proc_StartBlocking\n\
    adds r4, r0, #0\n\
    ldr r0, [r7]\n\
    ldr r0, [r0]\n\
    ldrb r0, [r0]\n\
    bl sub_80095D4\n\
    adds r1, r4, #0\n\
    adds r1, #0x64\n\
    strh r0, [r1]\n\
    b _08008BBA\n\
    .align 2, 0\n\
_080087FC: .4byte gUnk_08BFFBDC\n\
_08008800:\n\
    bl sub_80095E4\n\
    ldr r0, _0800880C @ =sTalkSt\n\
    ldr r1, [r0]\n\
    b _08008BBC\n\
    .align 2, 0\n\
_0800880C: .4byte sTalkSt\n\
_08008810:\n\
    ldr r1, [r7]\n\
    movs r0, #1\n\
    ldrb r2, [r1, #0x16]\n\
    subs r0, r0, r2\n\
    strb r0, [r1, #0x16]\n\
    b _08008BBA\n\
_0800881C:\n\
    ldr r1, [r7]\n\
    movs r0, #1\n\
    ldrb r3, [r1, #0x17]\n\
    subs r0, r0, r3\n\
    strb r0, [r1, #0x17]\n\
    b _08008BBA\n\
_08008828:\n\
    ldr r4, _08008840 @ =sTalkSt\n\
_0800882A:\n\
    ldr r2, [r4]\n\
    ldr r1, [r2]\n\
    ldrb r0, [r1]\n\
    cmp r0, #8\n\
    bge _08008836\n\
    b _08008706\n\
_08008836:\n\
    cmp r0, #0xf\n\
    ble _08008844\n\
    cmp r0, #0x10\n\
    beq _08008854\n\
    b _08008706\n\
    .align 2, 0\n\
_08008840: .4byte sTalkSt\n\
_08008844:\n\
    subs r0, #8\n\
    bl sub_8008CB8\n\
    ldr r1, [r4]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    b _0800882A\n\
_08008854:\n\
    adds r0, r1, #1\n\
    str r0, [r2]\n\
    mov r0, r8\n\
    bl sub_8008CC4\n\
    ldr r1, [r4]\n\
    ldr r0, [r1]\n\
    adds r0, #2\n\
    str r0, [r1]\n\
    b _0800882A\n\
_08008868:\n\
    bl sub_8009D70\n\
    lsls r0, r0, #0x18\n\
    cmp r0, #0\n\
    beq _08008876\n\
    bl sub_80095E4\n\
_08008876:\n\
    ldr r4, _080088A8 @ =sTalkSt\n\
    ldr r0, [r4]\n\
    ldrb r2, [r0, #0x11]\n\
    lsls r1, r2, #2\n\
    adds r0, #0x18\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    bl StartFaceFadeOut\n\
    ldr r2, [r4]\n\
    ldrb r3, [r2, #0x11]\n\
    lsls r1, r3, #2\n\
    adds r0, r2, #0\n\
    adds r0, #0x18\n\
    adds r0, r0, r1\n\
    movs r1, #0\n\
    str r1, [r0]\n\
    ldr r0, [r2]\n\
    adds r0, #1\n\
    str r0, [r2]\n\
    mov r0, r8\n\
    movs r1, #0x10\n\
    bl sub_80149B4\n\
    b _08008706\n\
    .align 2, 0\n\
_080088A8: .4byte sTalkSt\n\
_080088AC:\n\
    movs r0, #0x10\n\
    bl sub_8007F58\n\
    cmp r0, #0\n\
    beq _080088BE\n\
    movs r0, #0x10\n\
    bl sub_8007F44\n\
    b _080088C4\n\
_080088BE:\n\
    movs r0, #0x10\n\
    bl SetTalkFlag\n\
_080088C4:\n\
    ldr r0, _080088CC @ =sTalkSt\n\
    ldr r1, [r0]\n\
    b _08008BBC\n\
    .align 2, 0\n\
_080088CC: .4byte sTalkSt\n\
_080088D0:\n\
    ldr r0, [r7]\n\
    ldrb r0, [r0, #0x11]\n\
    bl SetTalkFaceNoMouthMove\n\
    ldr r0, [r7]\n\
    ldr r0, [r0]\n\
    ldrb r0, [r0]\n\
    subs r0, #8\n\
    b _08008BB6\n\
_080088E2:\n\
    ldr r6, _08008920 @ =gUnk_08BFFC9C\n\
    ldr r5, [r7]\n\
    ldrb r4, [r5, #9]\n\
    ldrb r1, [r5, #0xb]\n\
    adds r0, r1, r4\n\
    ldrb r1, [r5, #0xa]\n\
    bl __modsi3\n\
    adds r1, r0, #0\n\
    lsls r1, r1, #3\n\
    ldr r0, _08008924 @ =0x030000C8\n\
    adds r1, r1, r0\n\
    lsls r4, r4, #1\n\
    ldrb r2, [r5, #0xd]\n\
    adds r4, r2, r4\n\
    lsls r4, r4, #5\n\
    ldrb r3, [r5, #0xc]\n\
    adds r4, r3, r4\n\
    lsls r4, r4, #1\n\
    ldr r0, _08008928 @ =gBg0Tm\n\
    adds r4, r4, r0\n\
    ldrb r0, [r5, #8]\n\
    str r0, [sp]\n\
    mov r0, r8\n\
    str r0, [sp, #4]\n\
    adds r0, r6, #0\n\
    adds r2, r4, #0\n\
    movs r3, #1\n\
    bl sub_800925C\n\
    b _08008BBA\n\
    .align 2, 0\n\
_08008920: .4byte gUnk_08BFFC9C\n\
_08008924: .4byte 0x030000C8\n\
_08008928: .4byte gBg0Tm\n\
_0800892C:\n\
    ldr r6, _0800896C @ =gUnk_08BFFC9C\n\
    ldr r5, [r7]\n\
    ldrb r4, [r5, #9]\n\
    ldrb r1, [r5, #0xb]\n\
    adds r0, r1, r4\n\
    ldrb r1, [r5, #0xa]\n\
    bl __modsi3\n\
    adds r1, r0, #0\n\
    lsls r1, r1, #3\n\
    ldr r0, _08008970 @ =0x030000C8\n\
    adds r1, r1, r0\n\
    lsls r4, r4, #1\n\
    ldrb r2, [r5, #0xd]\n\
    adds r4, r2, r4\n\
    lsls r4, r4, #5\n\
    ldrb r3, [r5, #0xc]\n\
    adds r4, r3, r4\n\
    lsls r4, r4, #1\n\
    ldr r0, _08008974 @ =gBg0Tm\n\
    adds r4, r4, r0\n\
    ldrb r0, [r5, #8]\n\
    str r0, [sp]\n\
    mov r0, r8\n\
    str r0, [sp, #4]\n\
    adds r0, r6, #0\n\
    adds r2, r4, #0\n\
    movs r3, #2\n\
    bl sub_800925C\n\
    b _08008BBA\n\
    .align 2, 0\n\
_0800896C: .4byte gUnk_08BFFC9C\n\
_08008970: .4byte 0x030000C8\n\
_08008974: .4byte gBg0Tm\n\
_08008978:\n\
    ldr r6, _080089B8 @ =gUnk_08BFFCAC\n\
    ldr r5, [r7]\n\
    ldrb r4, [r5, #9]\n\
    ldrb r1, [r5, #0xb]\n\
    adds r0, r1, r4\n\
    ldrb r1, [r5, #0xa]\n\
    bl __modsi3\n\
    adds r1, r0, #0\n\
    lsls r1, r1, #3\n\
    ldr r0, _080089BC @ =0x030000C8\n\
    adds r1, r1, r0\n\
    lsls r4, r4, #1\n\
    ldrb r2, [r5, #0xd]\n\
    adds r4, r2, r4\n\
    lsls r4, r4, #5\n\
    ldrb r3, [r5, #0xc]\n\
    adds r4, r3, r4\n\
    lsls r4, r4, #1\n\
    ldr r0, _080089C0 @ =gBg0Tm\n\
    adds r4, r4, r0\n\
    ldrb r0, [r5, #8]\n\
    str r0, [sp]\n\
    mov r0, r8\n\
    str r0, [sp, #4]\n\
    adds r0, r6, #0\n\
    adds r2, r4, #0\n\
    movs r3, #1\n\
    bl sub_800925C\n\
    b _08008BBA\n\
    .align 2, 0\n\
_080089B8: .4byte gUnk_08BFFCAC\n\
_080089BC: .4byte 0x030000C8\n\
_080089C0: .4byte gBg0Tm\n\
_080089C4:\n\
    ldr r6, _08008A04 @ =gUnk_08BFFCAC\n\
    ldr r5, [r7]\n\
    ldrb r4, [r5, #9]\n\
    ldrb r1, [r5, #0xb]\n\
    adds r0, r1, r4\n\
    ldrb r1, [r5, #0xa]\n\
    bl __modsi3\n\
    adds r1, r0, #0\n\
    lsls r1, r1, #3\n\
    ldr r0, _08008A08 @ =0x030000C8\n\
    adds r1, r1, r0\n\
    lsls r4, r4, #1\n\
    ldrb r2, [r5, #0xd]\n\
    adds r4, r2, r4\n\
    lsls r4, r4, #5\n\
    ldrb r3, [r5, #0xc]\n\
    adds r4, r3, r4\n\
    lsls r4, r4, #1\n\
    ldr r0, _08008A0C @ =gBg0Tm\n\
    adds r4, r4, r0\n\
    ldrb r0, [r5, #8]\n\
    str r0, [sp]\n\
    mov r0, r8\n\
    str r0, [sp, #4]\n\
    adds r0, r6, #0\n\
    adds r2, r4, #0\n\
    movs r3, #2\n\
    bl sub_800925C\n\
    b _08008BBA\n\
    .align 2, 0\n\
_08008A04: .4byte gUnk_08BFFCAC\n\
_08008A08: .4byte 0x030000C8\n\
_08008A0C: .4byte gBg0Tm\n\
_08008A10:\n\
    ldr r0, [r7]\n\
    ldr r2, [r0]\n\
    adds r1, r2, #1\n\
    str r1, [r0]\n\
    ldrb r0, [r2, #1]\n\
    cmp r0, #0x25\n\
    bls _08008A20\n\
    b _0800871C\n\
_08008A20:\n\
    lsls r0, r0, #2\n\
    ldr r1, _08008A2C @ =_08008A30\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08008A2C: .4byte _08008A30\n\
_08008A30: @ jump table\n\
    .4byte _08008AEC @ case 0\n\
    .4byte _08008AEC @ case 1\n\
    .4byte _08008AEC @ case 2\n\
    .4byte _08008AEC @ case 3\n\
    .4byte _08008B3E @ case 4\n\
    .4byte _08008B50 @ case 5\n\
    .4byte _08008B88 @ case 6\n\
    .4byte _08008BBA @ case 7\n\
    .4byte _08008BBA @ case 8\n\
    .4byte _0800871C @ case 9\n\
    .4byte _08008BA0 @ case 10\n\
    .4byte _08008BA0 @ case 11\n\
    .4byte _08008BA0 @ case 12\n\
    .4byte _08008BA0 @ case 13\n\
    .4byte _08008BA0 @ case 14\n\
    .4byte _08008BA0 @ case 15\n\
    .4byte _08008BA0 @ case 16\n\
    .4byte _08008BA0 @ case 17\n\
    .4byte _0800871C @ case 18\n\
    .4byte _0800871C @ case 19\n\
    .4byte _0800871C @ case 20\n\
    .4byte _0800871C @ case 21\n\
    .4byte _08008BC4 @ case 22\n\
    .4byte _08008BDA @ case 23\n\
    .4byte _08008BF0 @ case 24\n\
    .4byte _08008C06 @ case 25\n\
    .4byte _08008C1C @ case 26\n\
    .4byte _08008C32 @ case 27\n\
    .4byte _08008C4C @ case 28\n\
    .4byte _08008C62 @ case 29\n\
    .4byte _08008C78 @ case 30\n\
    .4byte _08008C8E @ case 31\n\
    .4byte _08008B70 @ case 32\n\
    .4byte _08008AD8 @ case 33\n\
    .4byte _0800871C @ case 34\n\
    .4byte _0800871C @ case 35\n\
    .4byte _08008AC8 @ case 36\n\
    .4byte _08008B2C @ case 37\n\
_08008AC8:\n\
    ldr r0, [r7]\n\
    ldr r1, [r0, #0x38]\n\
    cmp r1, #0\n\
    beq _08008BBA\n\
    mov r0, r8\n\
    bl _call_via_r1\n\
    b _08008BBA\n\
_08008AD8:\n\
    bl sub_800837C\n\
    ldr r0, _08008AE8 @ =sTalkSt\n\
    ldr r1, [r0]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    b _08008456\n\
    .align 2, 0\n\
_08008AE8: .4byte sTalkSt\n\
_08008AEC:\n\
    ldr r3, _08008B24 @ =sTalkSt\n\
    ldr r1, [r3]\n\
    ldr r2, [r1]\n\
    adds r0, r2, #1\n\
    str r0, [r1]\n\
    ldrb r0, [r2, #1]\n\
    strb r0, [r1, #8]\n\
    movs r4, #0\n\
    ldr r0, [r3]\n\
    ldrb r0, [r0, #0xa]\n\
    cmp r4, r0\n\
    bge _08008B1E\n\
    adds r6, r3, #0\n\
    ldr r5, _08008B28 @ =0x030000C8\n\
_08008B08:\n\
    ldr r0, [r6]\n\
    ldrb r1, [r0, #8]\n\
    adds r0, r5, #0\n\
    bl Text_SetColor\n\
    adds r5, #8\n\
    adds r4, #1\n\
    ldr r0, [r6]\n\
    ldrb r0, [r0, #0xa]\n\
    cmp r4, r0\n\
    blt _08008B08\n\
_08008B1E:\n\
    ldr r0, _08008B24 @ =sTalkSt\n\
    ldr r1, [r0]\n\
    b _08008BBC\n\
    .align 2, 0\n\
_08008B24: .4byte sTalkSt\n\
_08008B28: .4byte 0x030000C8\n\
_08008B2C:\n\
    ldr r2, [r7]\n\
    adds r2, #0x83\n\
    movs r1, #1\n\
    ldrb r3, [r2]\n\
    ands r1, r3\n\
    movs r0, #3\n\
    subs r0, r0, r1\n\
    strb r0, [r2]\n\
    b _08008BBA\n\
_08008B3E:\n\
    mov r0, r8\n\
    bl LockTalk\n\
    ldr r0, _08008B4C @ =sTalkSt\n\
    ldr r1, [r0]\n\
    b _08008BBC\n\
    .align 2, 0\n\
_08008B4C: .4byte sTalkSt\n\
_08008B50:\n\
    ldr r4, _08008B6C @ =sTalkSt\n\
    ldr r1, [r4]\n\
    ldr r0, [r1, #0x3c]\n\
    adds r1, #0x40\n\
    bl sub_80149EC\n\
    ldr r1, [r4]\n\
    ldr r0, [r1]\n\
    subs r0, #1\n\
    str r0, [r1, #4]\n\
    adds r0, r1, #0\n\
    adds r0, #0x40\n\
    str r0, [r1]\n\
    b _08008456\n\
    .align 2, 0\n\
_08008B6C: .4byte sTalkSt\n\
_08008B70:\n\
    ldr r4, _08008B84 @ =sTalkSt\n\
    ldr r1, [r4]\n\
    ldr r0, [r1]\n\
    subs r0, #1\n\
    str r0, [r1, #4]\n\
    bl sub_802EBB0\n\
    ldr r1, [r4]\n\
    str r0, [r1]\n\
    b _08008456\n\
    .align 2, 0\n\
_08008B84: .4byte sTalkSt\n\
_08008B88:\n\
    ldr r0, _08008B9C @ =sTalkSt\n\
    ldr r1, [r0]\n\
    ldr r0, [r1]\n\
    subs r0, #1\n\
    str r0, [r1, #4]\n\
    adds r0, r1, #0\n\
    adds r0, #0x60\n\
    str r0, [r1]\n\
    b _08008456\n\
    .align 2, 0\n\
_08008B9C: .4byte sTalkSt\n\
_08008BA0:\n\
    ldr r1, [r7]\n\
    ldrb r0, [r1, #0x11]\n\
    ldr r1, [r1]\n\
    ldrb r1, [r1]\n\
    subs r1, #0xa\n\
    bl sub_8008E58\n\
    ldr r0, [r7]\n\
    ldr r0, [r0]\n\
    ldrb r0, [r0]\n\
    subs r0, #0xa\n\
_08008BB6:\n\
    bl sub_8008CB8\n\
_08008BBA:\n\
    ldr r1, [r7]\n\
_08008BBC:\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    b _08008706\n\
_08008BC4:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r2, [r1, #0x11]\n\
    lsls r0, r2, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #0\n\
    b _08008C46\n\
_08008BDA:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r3, [r1, #0x11]\n\
    lsls r0, r3, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #1\n\
    b _08008C46\n\
_08008BF0:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r2, [r1, #0x11]\n\
    lsls r0, r2, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #3\n\
    b _08008C46\n\
_08008C06:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r3, [r1, #0x11]\n\
    lsls r0, r3, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #2\n\
    b _08008C46\n\
_08008C1C:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r2, [r1, #0x11]\n\
    lsls r0, r2, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #4\n\
    b _08008C46\n\
_08008C32:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r3, [r1, #0x11]\n\
    lsls r0, r3, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #5\n\
_08008C46:\n\
    bl SetFaceBlinkControl\n\
    b _08008706\n\
_08008C4C:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r2, [r1, #0x11]\n\
    lsls r0, r2, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #0\n\
    b _08008CA2\n\
_08008C62:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r3, [r1, #0x11]\n\
    lsls r0, r3, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #2\n\
    b _08008CA2\n\
_08008C78:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r2, [r1, #0x11]\n\
    lsls r0, r2, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #3\n\
    b _08008CA2\n\
_08008C8E:\n\
    ldr r1, [r7]\n\
    ldr r0, [r1]\n\
    adds r0, #1\n\
    str r0, [r1]\n\
    ldrb r3, [r1, #0x11]\n\
    lsls r0, r3, #2\n\
    adds r1, #0x18\n\
    adds r1, r1, r0\n\
    ldr r0, [r1]\n\
    movs r1, #4\n\
_08008CA2:\n\
    bl SetFaceEyeState\n\
    b _08008706\n\
_08008CA8:\n\
    movs r0, #1\n\
_08008CAA:\n\
    add sp, #8\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4, r5, r6, r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n\
    .align 2, 0\n\
");
}

void sub_8008CB8(int face)
{
    sTalkSt->active_talk_face = face;
}

void sub_8008CC4(ProcPtr proc)
{
    int faceDisp = 0;
    int fid;

    if (sTalkSt->active_talk_face == TALK_FACE_NONE)
        sub_8008CB8(TALK_FACE_1);

    if (IsBattleDeamonActive())
        sub_800EC74();
    else
        faceDisp |= FACE_DISP_KIND(FACE_96x80);

    if (sub_8009D94(sTalkSt->active_talk_face) <= 14)
        faceDisp |= FACE_DISP_FLIPPED;

    fid = (sTalkSt->str[0]);
    fid = (sTalkSt->str[1] * 0x100) + fid;

    if (fid == UINT16_MAX)
        fid = GetUnitPortraitId(gActiveUnit);
    else
        fid = fid - 0x100;

    if (sTalkSt->faces[sTalkSt->active_talk_face] != NULL)
    {
        sub_8007C48(sTalkSt->faces[sTalkSt->active_talk_face], fid);
    }
    else
    {
        sTalkSt->faces[sTalkSt->active_talk_face] = StartFaceAuto(fid,
            sub_8009D94(sTalkSt->active_talk_face)*8, 80, faceDisp);

        StartFaceFadeIn(sTalkSt->faces[sTalkSt->active_talk_face]);

        sub_8008DFC(sTalkSt->active_talk_face, sub_8007F58(0x10));
        sub_80149B4(proc, 8);
    }
}

struct FaceProc * sub_8008DA8(int fid, int x, int y, int disp, int talk_face)
{
    return sTalkSt->faces[talk_face] = StartFaceAuto(fid, x, y, disp);
}

int sub_8008DC8(int x)
{
    int i;

    for (i = 0; i < 4; ++i)
    {
        if (gFaces[i] == NULL)
            continue;

        if (gFaces[i]->x_disp == x)
            return i;
    }

    return -1;
}

void sub_8008DFC(int talk_face, int toBack)
{
    int i;

    int argLayer, otherLayer;
    int iStart, iEnd;

    if (toBack)
    {
        argLayer = 6;
        otherLayer = 5;
    }
    else
    {
        argLayer = 5;
        otherLayer = 6;
    }

    switch (talk_face)
    {

    case TALK_FACE_0 ... TALK_FACE_2:
    default:
        iStart = TALK_FACE_0;
        iEnd = TALK_FACE_2;

        break;

    case TALK_FACE_3 ... TALK_FACE_5:
        iStart = TALK_FACE_3;
        iEnd = TALK_FACE_5;

        break;

    }

    for (i = iStart; i <= iEnd; ++i)
    {
        if (!sTalkSt->faces[i])
            continue;

        if (i == talk_face)
            sTalkSt->faces[i]->sprite_layer = argLayer;
        else
            sTalkSt->faces[i]->sprite_layer = otherLayer;
    }
}

void sub_8008E58(int talkFaceFrom, int talkFaceTo)
{
    struct FaceProc * face;
    bool isSwap = FALSE;

    if (sTalkSt->faces[talkFaceTo] != NULL)
    {
        isSwap = TRUE;
        sub_8008ECC(talkFaceTo, talkFaceFrom, isSwap);
    }

    sub_8008ECC(talkFaceFrom, talkFaceTo, isSwap);

    face = sTalkSt->faces[talkFaceFrom];
    sTalkSt->faces[talkFaceFrom] = sTalkSt->faces[talkFaceTo];
    sTalkSt->faces[talkFaceTo] = face;
}

bool sub_8008EB0()
{
    if (Proc_Find(gUnk_08BFFBBC) != NULL)
        return TRUE;

    return FALSE;
}

void sub_8008ECC(int talkFaceFrom, int talkFaceTo, bool isSwap)
{
    struct Proc * proc;

    int slot = sub_8008DC8(sub_8009D94(talkFaceFrom) * 8);

    if (slot == -1)
        return;

    proc = Proc_Start(gUnk_08BFFBBC, gFaces[slot]);

    proc->unk64 = slot;
    proc->unk66 = talkFaceTo;
    proc->unk68 = gFaces[slot]->x_disp;
    proc->unk6A = isSwap;
}

void sub_8008F24(struct Proc * proc)
{
    proc->unk58 = 0;

    if (((proc->unk68 - sub_8009D94(proc->unk66)*8) < 0)
        ? (sub_8009D94(proc->unk66)*8 - proc->unk68) > 24
        : (proc->unk68 - sub_8009D94(proc->unk66)*8) > 24)
    {
        proc->unk5C = 32;
    }
    else
    {
        proc->unk5C = 16;
    }
}

void sub_8008F80(struct Proc * proc)
{
    if (proc->unk5C > 16)
    {
        if (proc->unk58 == proc->unk5C / 8)
            gFaces[proc->unk64]->y_disp++;

        if (proc->unk58 == proc->unk5C / 2)
            gFaces[proc->unk64]->y_disp--;

        if (proc->unk58 == proc->unk5C * 5 / 8)
            gFaces[proc->unk64]->y_disp++;
    }
    else
    {
        if (proc->unk58 == proc->unk5C / 2)
            gFaces[proc->unk64]->y_disp++;
    }

    if (proc->unk58 >= proc->unk5C)
    {
        gFaces[proc->unk64]->y_disp--;
        Proc_Break(proc);
    }
    else
    {
        gFaces[proc->unk64]->x_disp = Interpolate(INTERPOLATE_RSQUARE,
            proc->unk68, sub_8009D94(proc->unk66)*8,
            proc->unk58++, proc->unk5C);
    }
}

void sub_8009080(struct Proc * proc)
{
    Proc_EndEach(gUnk_08BFFB6C);
    Proc_EndEach(gUnk_08BFFC7C);
}

void sub_800909C(struct Proc * proc)
{
    if (proc->unk64 == 0)
    {
        Proc_Break(proc);
        return;
    }

    proc->unk64--;
}

void sub_80090C0(struct Proc * proc)
{
    int frame = (GetGameTime() / 2) % 0x10;

    if (!sub_8007F58(0x80))
    {
        PutSprite(2,
            proc->unk64, proc->unk66,
            gUnk_08BFFC3C[frame], OAM2_CHR(4));
    }
    else
    {
        PutSprite(0,
            proc->unk64, proc->unk66,
            gUnk_08BFFC3C[frame], OAM2_CHR(0x2BF) + OAM2_PAL(11));
    }

    if (gpKeySt->pressed & 0xf3)
        Proc_Break(proc);
}

void nullsub_24()
{
}

void sub_800914C(struct Proc * parent, int x, int y)
{
    struct Proc * proc = Proc_StartBlocking(gUnk_08BFFBFC, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = 0;
}

void sub_8009178(ProcPtr parent, int x, int y, int z)
{
    struct Proc * proc = Proc_StartBlocking(gUnk_08BFFBFC, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = z;
}

void sub_80091AC(struct Proc * proc)
{
    TmFillRect(&gBg0Tm[((sTalkSt->y_text + 4) << 5) + sTalkSt->x_text],
        sTalkSt->active_width-2, sTalkSt->lines*2, 0);

    TalkBgSync(BG0_SYNC_BIT);

    proc->unk64 = 0;

    if (sTalkSt->line_active == 0)
    {
        proc->unk66 = 16;
    }
    else if (sTalkSt->line_active + 1 >= sTalkSt->lines)
    {
        proc->unk66 = sTalkSt->lines * 16;
    }
    else
    {
        proc->unk66 = (sTalkSt->line_active + 1) * 16;
    }
}

void sub_8009218(struct Proc * proc)
{
    proc->unk64++;

    SetBgOffset(0, 0, proc->unk64);

    if (proc->unk64 >= proc->unk66)
    {
        SetBgOffset(0, 0, 0);
        sub_8009628();

        Proc_Break(proc);
    }
}

void sub_800925C(struct TalkChoiceEnt const * choices, struct Text * text, u16 * tm, int defaultChoice, int color, struct Proc * parent)
{
    struct TalkChoiceProc * proc;

    int x = Text_GetCursor(text) + 16;

    Text_InsertDrawString(text, x,      color, DecodeMsg(choices[0].msg));
    Text_InsertDrawString(text, x + 40, color, DecodeMsg(choices[1].msg));

    PutText(text, tm);

    TalkBgSync(BG0_SYNC_BIT);

    proc = Proc_StartBlocking(gUnk_08BFFCBC, parent);

    proc->selectedChoice = defaultChoice;

    proc->x_disp = (((tm - gBg0Tm) & 0x1F) * 8) - gDispIo.bg_off[0].x + x;
    proc->y_disp = (((tm - gBg0Tm) / 0x20) * 8) - gDispIo.bg_off[0].y;

    proc->choices = choices;

    if (proc->choices[defaultChoice - 1].onSwitch)
        proc->choices[defaultChoice - 1].onSwitch();
}

NAKEDFUNC
void sub_8009310()
{
    asm("   .syntax unified\n\
    push {r4, r5, lr}\n\
    adds r4, r0, #0\n\
    ldr r0, _0800933C @ =gpKeySt\n\
    ldr r0, [r0]\n\
    ldrh r1, [r0, #8]\n\
    movs r0, #2\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _0800934C\n\
    ldr r0, _08009340 @ =gPlaySt\n\
    adds r0, #0x41\n\
    ldrb r0, [r0]\n\
    lsls r0, r0, #0x1e\n\
    cmp r0, #0\n\
    blt _08009334\n\
    ldr r0, _08009344 @ =0x0000038B\n\
    bl m4aSongNumStart\n\
_08009334:\n\
    ldr r1, _08009348 @ =sTalkChoiceResult\n\
    movs r0, #0\n\
    b _0800936E\n\
    .align 2, 0\n\
_0800933C: .4byte gpKeySt\n\
_08009340: .4byte gPlaySt\n\
_08009344: .4byte 0x0000038B\n\
_08009348: .4byte sTalkChoiceResult\n\
_0800934C:\n\
    movs r5, #1\n\
    adds r0, r5, #0\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _08009384\n\
    ldr r0, _08009378 @ =gPlaySt\n\
    adds r0, #0x41\n\
    ldrb r0, [r0]\n\
    lsls r0, r0, #0x1e\n\
    cmp r0, #0\n\
    blt _08009368\n\
    ldr r0, _0800937C @ =0x0000038A\n\
    bl m4aSongNumStart\n\
_08009368:\n\
    ldr r1, _08009380 @ =sTalkChoiceResult\n\
    movs r2, #0x2a\n\
    ldrsh r0, [r4, r2]\n\
_0800936E:\n\
    str r0, [r1]\n\
    adds r0, r4, #0\n\
    bl Proc_Break\n\
    b _08009404\n\
    .align 2, 0\n\
_08009378: .4byte gPlaySt\n\
_0800937C: .4byte 0x0000038A\n\
_08009380: .4byte sTalkChoiceResult\n\
_08009384:\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _080093B2\n\
    ldrh r0, [r4, #0x2a]\n\
    cmp r0, #2\n\
    bne _080093B2\n\
    ldr r0, _0800940C @ =gPlaySt\n\
    adds r0, #0x41\n\
    ldrb r0, [r0]\n\
    lsls r0, r0, #0x1e\n\
    cmp r0, #0\n\
    blt _080093A4\n\
    ldr r0, _08009410 @ =0x00000387\n\
    bl m4aSongNumStart\n\
_080093A4:\n\
    strh r5, [r4, #0x2a]\n\
    ldr r0, [r4, #0x34]\n\
    ldr r0, [r0, #4]\n\
    cmp r0, #0\n\
    beq _080093B2\n\
    bl _call_via_r0\n\
_080093B2:\n\
    ldr r0, _08009414 @ =gpKeySt\n\
    ldr r1, [r0]\n\
    movs r0, #0x10\n\
    ldrh r1, [r1, #8]\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _080093E8\n\
    ldrh r1, [r4, #0x2a]\n\
    cmp r1, #1\n\
    bne _080093E8\n\
    ldr r0, _0800940C @ =gPlaySt\n\
    adds r0, #0x41\n\
    ldrb r0, [r0]\n\
    lsls r0, r0, #0x1e\n\
    cmp r0, #0\n\
    blt _080093D8\n\
    ldr r0, _08009410 @ =0x00000387\n\
    bl m4aSongNumStart\n\
_080093D8:\n\
    movs r0, #2\n\
    strh r0, [r4, #0x2a]\n\
    ldr r0, [r4, #0x34]\n\
    ldr r0, [r0, #0xc]\n\
    cmp r0, #0\n\
    beq _080093E8\n\
    bl _call_via_r0\n\
_080093E8:\n\
    movs r2, #0x2c\n\
    ldrsh r0, [r4, r2]\n\
    movs r1, #0x2a\n\
    ldrsh r2, [r4, r1]\n\
    subs r2, #1\n\
    lsls r1, r2, #2\n\
    adds r1, r1, r2\n\
    lsls r1, r1, #3\n\
    adds r0, r0, r1\n\
    subs r0, #4\n\
    movs r2, #0x2e\n\
    ldrsh r1, [r4, r2]\n\
    bl PutUiHand\n\
_08009404:\n\
    pop {r4, r5}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
    .align 2, 0\n\
_0800940C: .4byte gPlaySt\n\
_08009410: .4byte 0x00000387\n\
_08009414: .4byte gpKeySt\n\
");
}

void sub_8009418(struct Proc * proc)
{
    TmFillRect_thm(&gBg0Tm[((sTalkSt->y_text + 4) << 5) + sTalkSt->x_text],
        sTalkSt->active_width - 2, sTalkSt->lines * 2, 0);
    TalkBgSync(1);
    proc->unk64 = 0;
}

void sub_8009458(struct Proc * proc)
{
    proc->unk64++;

    SetBgOffset(0, 0, proc->unk64);

    if (proc->unk64 >= 16)
    {
        int i;

        sTalkSt->line_active--;
        sTalkSt->top_text_num++;

        SetBgOffset(0, 0, 0);

        for (i = 0; i < sTalkSt->lines - 1; ++i)
        {
            PutText(TALK_TEXT_BY_LINE(i),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + 2*i));
        }

        TmFillRect(gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + (sTalkSt->lines - 1)*2),
            sTalkSt->active_width - 2, 2, 0);

        ClearText(TALK_TEXT_BY_LINE(sTalkSt->lines - 1));
        Text_SetColor(TALK_TEXT_BY_LINE(sTalkSt->lines - 1), sTalkSt->print_color);

        TalkBgSync(BG0_SYNC_BIT);

        Proc_Break(proc);
    }
}

void sub_800954C(struct Proc * proc)
{
    CleanTalkObjects(0x200, 0x19, 0x44444444, proc);
}

void sub_8009564(ProcPtr proc)
{
    sTalkSt->line_active--;

    SpriteText_DrawBackground(sTalkText + 1);

    Text_SetColor(sTalkText + 1, TEXT_COLOR_4DEF);
    Text_SetCursor(sTalkText + 1, 4);
}

void sub_8009598(ProcPtr proc)
{
    int i;

    sTalkSt->line_active = 0;

    for (i = 0; i < 2; i++)
    {
        SpriteText_DrawBackground(&sTalkText[i]);

        Text_SetColor(&sTalkText[i], TEXT_COLOR_4DEF);
        Text_SetCursor(&sTalkText[i], 4);
    }
}

int sub_80095D4(int cmd)
{
    return gUnk_08BFFD2C[cmd - 4];
}

void sub_80095E4()
{
    sTalkSt->speak_talk_face = -1;
    TmFill(gBg1Tm, 0);
    TalkBgSync(2);
    sub_8009628();
    SetWinEnable(0, 0, 0);
}

void sub_8009628()
{
    int i;

    TmFill(gBg0Tm, 0);
    TalkBgSync(BG0_SYNC_BIT);

    sTalkSt->line_active = 0;
    sTalkSt->unk_82 = 0;
    sTalkSt->put_lines = 0;
    sTalkSt->top_text_num = 0;

    for (i = 0; i < sTalkSt->lines; ++i)
    {
        ClearText(sTalkText + i);
        Text_SetColor(sTalkText + i, sTalkSt->print_color);
    }
}

void sub_800968C()
{
    int i;

    sTalkSt->line_active = FALSE;
    sTalkSt->unk_82 = 0;
    sTalkSt->put_lines = 0;
    sTalkSt->top_text_num = 0;

    for (i = 0; i < sTalkSt->lines; i++)
    {
        ClearText(sTalkText + i);
        Text_SetColor(sTalkText + i, sTalkSt->print_color);
    }
}

#if NONMATCHING

/*
what is this???
ldr r1, [sp, #4]
str r1, [sp]
*/

void sub_80096E0(int xAnchor, int yAnchor, int width, int height)
{
    int xTail;
    int kind;
    int tmp;
    int x, y;

    xTail = 0;

    x = 0;
    y = 0;

    TmFill(gBg1Tm, 0);

    if (xAnchor < 16)
        kind = 0;
    else
        kind = 1;

    if (IsBattleDeamonActive())
        kind += 2;

    y = yAnchor - height + 1;

    switch (kind)
    {

    case 0:
        xTail = xAnchor + 3;

        tmp = xTail - width / 2;

        if (tmp <= 0)
            x = 1;
        else
            x = tmp;

        break;

    case 1:
        xTail = xAnchor - 5;

        tmp = xTail + (width + 1) / 2;

        if (tmp > 29)
            x = 29 - width;
        else
            x = xTail - width / 2;

        break;

    case 2:
        x = 9;
        y = 14;

        width = 20;
        xTail = x - 1;
        yAnchor = y + 2;

        break;

    case 3:
        x = 1;
        y = 14;

        width = 20;
        xTail = x + width - 1;
        yAnchor = y + 2;

        break;
    }

    sTalkSt->x_text = x + 1;
    sTalkSt->y_text = y + 1;

    sub_8009AA8(1, x, y, width, height);
    
    if (sTalkSt->unk_83 & 2)
    {
        TalkToggleInvertedPalette(sTalkSt->unk_83 & 1);

        sTalkSt->unk_83 ^= 2;
    }
    
    if (sTalkSt->unk_83 & 1)
    {
        sub_8009920(1, xTail, yAnchor, kind);
    }

    sub_80098A0(x, y, width, height);

    sub_800981C();

    TalkBgSync(BG1_SYNC_BIT);
}

#else

NAKEDFUNC
void sub_80096E0()
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, sb\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    sub sp, #8\n\
    adds r5, r0, #0\n\
    mov sl, r1\n\
    adds r4, r2, #0\n\
    str r3, [sp, #4]\n\
    movs r0, #0\n\
    mov r8, r0\n\
    movs r6, #0\n\
    ldr r0, _08009730 @ =gBg1Tm\n\
    movs r1, #0\n\
    bl TmFill\n\
    movs r7, #1\n\
    cmp r5, #0xf\n\
    bgt _0800970A\n\
    movs r7, #0\n\
_0800970A:\n\
    bl IsBattleDeamonActive\n\
    lsls r0, r0, #0x18\n\
    cmp r0, #0\n\
    beq _08009716\n\
    adds r7, #2\n\
_08009716:\n\
    mov r1, sl\n\
    ldr r2, [sp, #4]\n\
    subs r0, r1, r2\n\
    adds r0, #1\n\
    mov sb, r0\n\
    cmp r7, #1\n\
    beq _08009752\n\
    cmp r7, #1\n\
    bgt _08009734\n\
    cmp r7, #0\n\
    beq _0800973E\n\
    b _08009796\n\
    .align 2, 0\n\
_08009730: .4byte gBg1Tm\n\
_08009734:\n\
    cmp r7, #2\n\
    beq _08009776\n\
    cmp r7, #3\n\
    beq _08009788\n\
    b _08009796\n\
_0800973E:\n\
    adds r5, #3\n\
    mov r8, r5\n\
    lsrs r0, r4, #0x1f\n\
    adds r0, r4, r0\n\
    asrs r0, r0, #1\n\
    subs r6, r5, r0\n\
    cmp r6, #0\n\
    bgt _08009796\n\
    movs r6, #1\n\
    b _08009796\n\
_08009752:\n\
    subs r5, #5\n\
    mov r8, r5\n\
    adds r0, r4, #1\n\
    lsrs r1, r0, #0x1f\n\
    adds r0, r0, r1\n\
    asrs r0, r0, #1\n\
    add r0, r8\n\
    cmp r0, #0x1d\n\
    ble _0800976A\n\
    movs r0, #0x1d\n\
    subs r6, r0, r4\n\
    b _08009796\n\
_0800976A:\n\
    lsrs r0, r4, #0x1f\n\
    adds r0, r4, r0\n\
    asrs r0, r0, #1\n\
    mov r1, r8\n\
    subs r6, r1, r0\n\
    b _08009796\n\
_08009776:\n\
    movs r6, #9\n\
    movs r2, #0xe\n\
    mov sb, r2\n\
    movs r4, #0x14\n\
    movs r0, #8\n\
    mov r8, r0\n\
    movs r1, #0x10\n\
    mov sl, r1\n\
    b _08009796\n\
_08009788:\n\
    movs r6, #1\n\
    movs r2, #0xe\n\
    mov sb, r2\n\
    movs r4, #0x14\n\
    mov r8, r4\n\
    movs r0, #0x10\n\
    mov sl, r0\n\
_08009796:\n\
    ldr r5, _08009818 @ =sTalkSt\n\
    ldr r1, [r5]\n\
    adds r0, r6, #1\n\
    strb r0, [r1, #0xc]\n\
    ldr r1, [r5]\n\
    mov r0, sb\n\
    adds r0, #1\n\
    strb r0, [r1, #0xd]\n\
    ldr r1, [sp, #4]\n\
    str r1, [sp]\n\
    movs r0, #1\n\
    adds r1, r6, #0\n\
    mov r2, sb\n\
    adds r3, r4, #0\n\
    bl sub_8009AA8\n\
    ldr r0, [r5]\n\
    adds r0, #0x83\n\
    ldrb r1, [r0]\n\
    movs r0, #2\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _080097D8\n\
    movs r0, #1\n\
    ands r0, r1\n\
    bl TalkToggleInvertedPalette\n\
    ldr r1, [r5]\n\
    adds r1, #0x83\n\
    movs r0, #2\n\
    ldrb r2, [r1]\n\
    eors r0, r2\n\
    strb r0, [r1]\n\
_080097D8:\n\
    ldr r1, [r5]\n\
    adds r1, #0x83\n\
    movs r0, #1\n\
    ldrb r1, [r1]\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _080097F2\n\
    movs r0, #1\n\
    mov r1, r8\n\
    mov r2, sl\n\
    adds r3, r7, #0\n\
    bl sub_8009920\n\
_080097F2:\n\
    adds r0, r6, #0\n\
    mov r1, sb\n\
    adds r2, r4, #0\n\
    ldr r3, [sp, #4]\n\
    bl sub_80098A0\n\
    bl sub_800981C\n\
    movs r0, #2\n\
    bl TalkBgSync\n\
    add sp, #8\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
    .align 2, 0\n\
_08009818: .4byte sTalkSt\n\
");
}

#endif


void sub_800981C()
{
    struct Proc * proc = Proc_Start(gUnk_08BFFD3C, (ProcPtr)3);
    proc->unk64 = 0;
}

#if 0

void sub_8009834(struct Proc * proc)
{
    // missing those symbols
    u8 const * gUnk_0818F93C[] =
    {
        Img_TalkBubbleOpeningA,
        Img_TalkBubbleOpeningB,
        Img_TalkBubbleOpeningC,
        Img_TalkBubbleOpeningD,
        Img_TalkBubbleOpeningE,
        Img_TalkBubble,
        NULL,
    };

    if ((proc->unk64++) & 1)
        return;

    Decompress(gUnk_0818F93C[proc->unk64 >> 1],
        (u8 *) VRAM + GetBgChrOffset(1) + 0x10 * CHR_SIZE);

    if (gUnk_0818F93C[(proc->unk64 >> 1) + 1] == NULL)
        Proc_Break(proc);
}

#else

NAKEDFUNC
void sub_8009834(struct Proc * proc)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, lr}\n\
    sub sp, #0x1c\n\
    adds r6, r0, #0\n\
    mov r1, sp\n\
    ldr r0, _08009898 @ =gUnk_0818F93C\n\
    ldm r0!, {r2, r3, r4}\n\
    stm r1!, {r2, r3, r4}\n\
    ldm r0!, {r2, r3, r4}\n\
    stm r1!, {r2, r3, r4}\n\
    ldr r0, [r0]\n\
    str r0, [r1]\n\
    adds r5, r6, #0\n\
    adds r5, #0x64\n\
    ldrh r1, [r5]\n\
    adds r2, r1, #1\n\
    strh r2, [r5]\n\
    movs r0, #1\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08009890\n\
    lsls r0, r2, #0x10\n\
    asrs r0, r0, #0x11\n\
    lsls r0, r0, #2\n\
    add r0, sp\n\
    ldr r4, [r0]\n\
    movs r0, #1\n\
    bl GetBgChrOffset\n\
    adds r1, r0, #0\n\
    ldr r0, _0800989C @ =0x06000200\n\
    adds r1, r1, r0\n\
    adds r0, r4, #0\n\
    bl Decompress\n\
    ldrh r5, [r5]\n\
    lsls r0, r5, #0x10\n\
    asrs r0, r0, #0x11\n\
    adds r0, #1\n\
    lsls r0, r0, #2\n\
    add r0, sp\n\
    ldr r0, [r0]\n\
    cmp r0, #0\n\
    bne _08009890\n\
    adds r0, r6, #0\n\
    bl Proc_Break\n\
_08009890:\n\
    add sp, #0x1c\n\
    pop {r4, r5, r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08009898: .4byte gUnk_0818F93C\n\
_0800989C: .4byte 0x06000200\n\
    .syntax divided\n\
");
}

#endif

void sub_80098A0(int x, int y, int width, int height)
{
    SetWinEnable(1, 0, 0);

    SetWin0Box((x + 1) * 8, (y + 1) * 8, (x + width - 1) * 8, (y + height - 1) * 8);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);
}

NAKEDFUNC
void sub_8009920(int a, int b, int c, int d)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, lr}\n\
    adds r5, r1, #0\n\
    adds r4, r2, #0\n\
    adds r6, r3, #0\n\
    bl GetBgTilemap\n\
    adds r3, r0, #0\n\
    cmp r6, #5\n\
    bls _08009934\n\
    b _08009A96\n\
_08009934:\n\
    lsls r0, r6, #2\n\
    ldr r1, _08009940 @ =_08009944\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08009940: .4byte _08009944\n\
_08009944: @ jump table\n\
    .4byte _0800995C @ case 0\n\
    .4byte _08009990 @ case 1\n\
    .4byte _080099C8 @ case 2\n\
    .4byte _080099FC @ case 3\n\
    .4byte _08009A34 @ case 4\n\
    .4byte _08009A6C @ case 5\n\
_0800995C:\n\
    lsls r0, r4, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r2, _08009984 @ =0x00003014\n\
    adds r1, r2, #0\n\
    strh r1, [r0]\n\
    ldr r2, _08009988 @ =0x00003414\n\
    adds r1, r2, #0\n\
    strh r1, [r0, #2]\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r3, _0800998C @ =0x00003416\n\
    adds r1, r3, #0\n\
    strh r1, [r0]\n\
    adds r2, #1\n\
    b _08009A92\n\
    .align 2, 0\n\
_08009984: .4byte 0x00003014\n\
_08009988: .4byte 0x00003414\n\
_0800998C: .4byte 0x00003416\n\
_08009990:\n\
    lsls r0, r4, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r2, _080099B8 @ =0x00003014\n\
    adds r1, r2, #0\n\
    strh r1, [r0]\n\
    ldr r2, _080099BC @ =0x00003414\n\
    adds r1, r2, #0\n\
    strh r1, [r0, #2]\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r3, _080099C0 @ =0x00003015\n\
    adds r1, r3, #0\n\
    strh r1, [r0]\n\
    ldr r2, _080099C4 @ =0x00003016\n\
    b _08009A92\n\
    .align 2, 0\n\
_080099B8: .4byte 0x00003014\n\
_080099BC: .4byte 0x00003414\n\
_080099C0: .4byte 0x00003015\n\
_080099C4: .4byte 0x00003016\n\
_080099C8:\n\
    lsls r2, r4, #5\n\
    adds r2, r5, r2\n\
    lsls r2, r2, #1\n\
    adds r2, r2, r3\n\
    ldr r1, _080099F0 @ =0x00003418\n\
    adds r0, r1, #0\n\
    strh r0, [r2]\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r3, _080099F4 @ =0x00003419\n\
    adds r1, r3, #0\n\
    strh r1, [r0]\n\
    subs r3, #2\n\
    adds r1, r3, #0\n\
    strh r1, [r2, #2]\n\
    ldr r2, _080099F8 @ =0x00003C17\n\
    b _08009A92\n\
    .align 2, 0\n\
_080099F0: .4byte 0x00003418\n\
_080099F4: .4byte 0x00003419\n\
_080099F8: .4byte 0x00003C17\n\
_080099FC:\n\
    lsls r2, r4, #5\n\
    adds r2, r5, r2\n\
    lsls r2, r2, #1\n\
    adds r2, r2, r3\n\
    ldr r1, _08009A24 @ =0x00003017\n\
    adds r0, r1, #0\n\
    strh r0, [r2]\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r3, _08009A28 @ =0x00003817\n\
    adds r1, r3, #0\n\
    strh r1, [r0]\n\
    ldr r3, _08009A2C @ =0x00003018\n\
    adds r1, r3, #0\n\
    strh r1, [r2, #2]\n\
    ldr r2, _08009A30 @ =0x00003019\n\
    b _08009A92\n\
    .align 2, 0\n\
_08009A24: .4byte 0x00003017\n\
_08009A28: .4byte 0x00003817\n\
_08009A2C: .4byte 0x00003018\n\
_08009A30: .4byte 0x00003019\n\
_08009A34:\n\
    lsls r2, r4, #5\n\
    adds r2, r5, r2\n\
    lsls r2, r2, #1\n\
    adds r2, r2, r3\n\
    ldr r1, _08009A5C @ =0x00003C19\n\
    adds r0, r1, #0\n\
    strh r0, [r2]\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r3, _08009A60 @ =0x00003C18\n\
    adds r1, r3, #0\n\
    strh r1, [r0]\n\
    ldr r3, _08009A64 @ =0x00003417\n\
    adds r1, r3, #0\n\
    strh r1, [r2, #2]\n\
    ldr r2, _08009A68 @ =0x00003C17\n\
    b _08009A92\n\
    .align 2, 0\n\
_08009A5C: .4byte 0x00003C19\n\
_08009A60: .4byte 0x00003C18\n\
_08009A64: .4byte 0x00003417\n\
_08009A68: .4byte 0x00003C17\n\
_08009A6C:\n\
    lsls r2, r4, #5\n\
    adds r2, r5, r2\n\
    lsls r2, r2, #1\n\
    adds r2, r2, r3\n\
    ldr r1, _08009A9C @ =0x00003017\n\
    adds r0, r1, #0\n\
    strh r0, [r2]\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #5\n\
    adds r0, r5, r0\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r3\n\
    ldr r3, _08009AA0 @ =0x00003817\n\
    adds r1, r3, #0\n\
    strh r1, [r0]\n\
    adds r3, #2\n\
    adds r1, r3, #0\n\
    strh r1, [r2, #2]\n\
    ldr r2, _08009AA4 @ =0x00003818\n\
_08009A92:\n\
    adds r1, r2, #0\n\
    strh r1, [r0, #2]\n\
_08009A96:\n\
    pop {r4, r5, r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08009A9C: .4byte 0x00003017\n\
_08009AA0: .4byte 0x00003817\n\
_08009AA4: .4byte 0x00003818\n\
    .syntax divided\n\
");
}

#if NONMATCHING

// adds r0, r1, r6
// instead of
// adds r0, r6, r1

void sub_8009AA8(int id, int x, int y, int width, int height)
{
    int i, j;

    u16 * tilemap = GetBgTilemap(id);
    width--;
    height--;

    for (i = x; i < x + width; ++i)
    {
        tilemap[TM_OFFSET(i, y)]          = TILEREF(0x10 + 1, BGPAL_TALK_BUBBLE);
        tilemap[TM_OFFSET(i, y + height)] = TILEREF(0x10 + 1, BGPAL_TALK_BUBBLE) + TILE_VFLIP;
    }

    for (i = y; i < y + height; ++i)
    {
        tilemap[TM_OFFSET(x, i)]         = TILEREF(0x10 + 2, BGPAL_TALK_BUBBLE);
        tilemap[TM_OFFSET(x + width, i)] = TILEREF(0x10 + 2, BGPAL_TALK_BUBBLE) + TILE_HFLIP;
    }

    for (i = x + 1; i < x + width; ++i)
        for (j = y + 1; j < y + height; ++j)
            tilemap[TM_OFFSET(i, j)] = TILEREF(0x10 + 3, BGPAL_TALK_BUBBLE);

    tilemap[TM_OFFSET(x,         y)]          = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE);
    tilemap[TM_OFFSET(x + width, y)]          = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_HFLIP;
    tilemap[TM_OFFSET(x,         y + height)] = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_VFLIP;
    tilemap[TM_OFFSET(x + width, y + height)] = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_HFLIP + TILE_VFLIP;
}

#else

NAKEDFUNC
void sub_8009AA8(int id, int x, int y, int width, int height)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, sb\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    sub sp, #8\n\
    mov r8, r1\n\
    str r2, [sp]\n\
    adds r5, r3, #0\n\
    ldr r4, [sp, #0x28]\n\
    bl GetBgTilemap\n\
    adds r7, r0, #0\n\
    subs r5, #1\n\
    subs r4, #1\n\
    mov r0, r8\n\
    adds r3, r0, r5\n\
    cmp r8, r3\n\
    bge _08009B00\n\
    ldr r1, _08009BC0 @ =0x00003011\n\
    mov sb, r1\n\
    ldr r2, [sp]\n\
    adds r0, r2, r4\n\
    mov r6, r8\n\
    lsls r1, r6, #1\n\
    lsls r0, r0, #6\n\
    adds r0, r0, r7\n\
    adds r2, r1, r0\n\
    ldr r6, [sp]\n\
    lsls r0, r6, #6\n\
    adds r0, r0, r7\n\
    adds r1, r1, r0\n\
    ldr r6, _08009BC4 @ =0x00003811\n\
    adds r0, r6, #0\n\
    mov r6, r8\n\
    subs r3, r3, r6\n\
_08009AF0:\n\
    mov r6, sb\n\
    strh r6, [r1]\n\
    strh r0, [r2]\n\
    adds r2, #2\n\
    adds r1, #2\n\
    subs r3, #1\n\
    cmp r3, #0\n\
    bne _08009AF0\n\
_08009B00:\n\
    ldr r3, [sp]\n\
    add r5, r8\n\
    mov ip, r5\n\
    lsls r0, r3, #5\n\
    str r0, [sp, #4]\n\
    adds r4, r4, r3\n\
    mov sb, r4\n\
    movs r1, #1\n\
    add r1, r8\n\
    mov sl, r1\n\
    cmp r3, sb\n\
    bge _08009B44\n\
    ldr r2, _08009BC8 @ =0x00003012\n\
    adds r6, r2, #0\n\
    ldr r4, _08009BCC @ =0x00003412\n\
    adds r5, r4, #0\n\
    lsls r0, r3, #6\n\
    mov r2, ip\n\
    lsls r1, r2, #1\n\
    adds r1, r1, r7\n\
    adds r2, r0, r1\n\
    mov r4, r8\n\
    lsls r1, r4, #1\n\
    adds r1, r1, r7\n\
    adds r0, r0, r1\n\
    mov r1, sb\n\
    subs r3, r1, r3\n\
_08009B36:\n\
    strh r6, [r0]\n\
    strh r5, [r2]\n\
    adds r2, #0x40\n\
    adds r0, #0x40\n\
    subs r3, #1\n\
    cmp r3, #0\n\
    bne _08009B36\n\
_08009B44:\n\
    mov r3, sl\n\
    cmp r3, ip\n\
    bge _08009B76\n\
    mov r5, sb\n\
    mov sl, ip\n\
_08009B4E:\n\
    ldr r2, [sp]\n\
    adds r2, #1\n\
    adds r4, r3, #1\n\
    cmp r2, r5\n\
    bge _08009B70\n\
    ldr r0, _08009BD0 @ =0x00003013\n\
    adds r6, r0, #0\n\
    lsls r1, r2, #6\n\
    lsls r0, r3, #1\n\
    adds r0, r0, r7\n\
    adds r0, r1, r0\n\
    subs r2, r5, r2\n\
_08009B66:\n\
    strh r6, [r0]\n\
    adds r0, #0x40\n\
    subs r2, #1\n\
    cmp r2, #0\n\
    bne _08009B66\n\
_08009B70:\n\
    adds r3, r4, #0\n\
    cmp r3, sl\n\
    blt _08009B4E\n\
_08009B76:\n\
    ldr r0, [sp, #4]\n\
    add r0, r8\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r7\n\
    ldr r2, _08009BD4 @ =0x00003010\n\
    adds r1, r2, #0\n\
    strh r1, [r0]\n\
    ldr r0, [sp, #4]\n\
    add r0, ip\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r7\n\
    ldr r3, _08009BD8 @ =0x00003410\n\
    adds r1, r3, #0\n\
    strh r1, [r0]\n\
    mov r4, sb\n\
    lsls r1, r4, #5\n\
    mov r6, r8\n\
    adds r0, r6, r1\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r7\n\
    ldr r3, _08009BDC @ =0x00003810\n\
    adds r2, r3, #0\n\
    strh r2, [r0]\n\
    add r1, ip\n\
    lsls r1, r1, #1\n\
    adds r1, r1, r7\n\
    ldr r4, _08009BE0 @ =0x00003C10\n\
    adds r0, r4, #0\n\
    strh r0, [r1]\n\
    add sp, #8\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
    .align 2, 0\n\
_08009BC0: .4byte 0x00003011\n\
_08009BC4: .4byte 0x00003811\n\
_08009BC8: .4byte 0x00003012\n\
_08009BCC: .4byte 0x00003412\n\
_08009BD0: .4byte 0x00003013\n\
_08009BD4: .4byte 0x00003010\n\
_08009BD8: .4byte 0x00003410\n\
_08009BDC: .4byte 0x00003810\n\
_08009BE0: .4byte 0x00003C10\n\
");
}

#endif

void nullsub_25()
{
}

void sub_8009BE8(struct Proc* proc)
{
    proc->unk58 = 0;

    if (!sub_8007F58(0x100))
    {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);

        SetBlendBackdropB(1);

        gDispIo.win_ct.win0_enable_blend = 1;
        gDispIo.win_ct.wout_enable_blend = 1;

        SetBlendAlpha(0, 0x10);
    }
}

void sub_8009C58(struct Proc* proc)
{
    sub_80096E0(proc->unk64, proc->unk66, proc->unk68, proc->unk6A);
    Proc_Break(proc);
}

void sub_8009C8C(struct Proc* proc)
{
    int var;

    proc->unk58++;

    var = Interpolate(4, -30, 0, proc->unk58, 12);
    SetBgOffset(1, 0, var / 2);

    if (!sub_8007F58(0x100))
    {
        SetBlendAlpha(var/2 + 0x10, 1 - var/2);
    }

    if (proc->unk58 == 12)
    {
        Proc_Break(proc);
    }
}

int sub_8009D94(int talk_face);
void sub_8009D0C(int talk_face, struct Proc* parent)
{
    struct Proc* proc = Proc_StartBlocking(gUnk_08BFFD4C, parent);

    proc->unk64 = sub_8009D94(talk_face);
    proc->unk66 = 8;
    proc->unk68 = sTalkSt->active_width;
    proc->unk6A = 6;

    if (proc->unk64 < 0)
        proc->unk64 = 0;

    if (proc->unk64 > 29)
        proc->unk64 = 30;

    sTalkSt->speak_talk_face = talk_face;
    sTalkSt->speak_width = sTalkSt->active_width;
}

bool sub_8009D70()
{
    if (sTalkSt->speak_talk_face == sTalkSt->active_talk_face && sTalkSt->speak_width == sTalkSt->active_width)
    {
        return TRUE;
    }

    return FALSE;
}

int sub_8009D94(int talk_face)
{
    if (IsBattleDeamonActive())
    {
        if (talk_face < 3)
        {
            return 4;
        }
        else
        {
            return 0x1a;
        }
    }
    else
    {
        return gUnk_08BFFD7C[talk_face];
    }
}

#if NONMATCHING

// 'cause gUnk_0818F958

void SetTalkFaceDisp(int talk_face, int faceDisp)
{
    int gUnk_0818F958[] = { 0, FACE_DISP_SMILE };
    int disp;

    if (talk_face == TALK_FACE_NONE)
        return;

    disp = GetFaceDisp(sTalkSt->faces[talk_face]);
    disp &= ~(FACE_DISP_SMILE | FACE_DISP_TALK_1 | FACE_DISP_TALK_2);

    SetFaceDisp(sTalkSt->faces[talk_face], disp | faceDisp | gUnk_0818F958[sTalkSt->unk_17]);
}

#else

NAKEDFUNC
void SetTalkFaceDisp(int talk_face, int faceDisp)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, lr}\n\
    sub sp, #8\n\
    adds r5, r0, #0\n\
    adds r6, r1, #0\n\
    ldr r0, _08009E10 @ =gUnk_0818F958\n\
    ldr r1, [r0, #4]\n\
    ldr r0, [r0]\n\
    str r0, [sp]\n\
    str r1, [sp, #4]\n\
    cmp r5, #0xff\n\
    beq _08009E06\n\
    ldr r4, _08009E14 @ =sTalkSt\n\
    ldr r0, [r4]\n\
    lsls r5, r5, #2\n\
    adds r0, #0x18\n\
    adds r0, r0, r5\n\
    ldr r0, [r0]\n\
    bl GetFaceDisp\n\
    movs r1, #0x39\n\
    rsbs r1, r1, #0\n\
    ands r1, r0\n\
    ldr r2, [r4]\n\
    adds r0, r2, #0\n\
    adds r0, #0x18\n\
    adds r0, r0, r5\n\
    ldr r0, [r0]\n\
    orrs r1, r6\n\
    ldrb r2, [r2, #0x17]\n\
    lsls r2, r2, #2\n\
    add r2, sp\n\
    ldr r2, [r2]\n\
    orrs r1, r2\n\
    bl SetFaceDisp\n\
_08009E06:\n\
    add sp, #8\n\
    pop {r4, r5, r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
    .align 2, 0\n\
_08009E10: .4byte gUnk_0818F958\n\
_08009E14: .4byte sTalkSt");
}

#endif

void SetTalkFaceMouthMove(int face)
{
    SetTalkFaceDisp(face, 0x10);
}

void SetTalkFaceNoMouthMove(int face)
{
    SetTalkFaceDisp(face, 0);
}

bool IsTalkActive(void)
{
    return Proc_Exists(ProcScr_Talk);
}

bool FaceExists(void)
{
    return Proc_Exists(ProcScr_Face);
}

int GetTalkChoiceResult(void)
{
    return sTalkChoiceResult;
}

void SetTalkChoiceResult(int res)
{
    sTalkChoiceResult = res;
}

void SetTalkNumber(int number)
{
    sTalkSt->number = number;
}

void SetTalkUnkStr(char* buffer)
{
    strcpy(sTalkSt->buf_unk_str, buffer);
}

NAKEDFUNC
void PrintStringToTexts(struct Text ** texts, char const * str, u16 * buffer, int x, int y)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, sb\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    sub sp, #4\n\
    mov sl, r0\n\
    adds r4, r1, #0\n\
    str r2, [sp]\n\
    mov sb, r3\n\
    movs r6, #0\n\
    mov r7, sl\n\
    adds r5, r2, #0\n\
    b _08009EC2\n\
_08009EB8:\n\
    ldr r0, [r7]\n\
    adds r1, r4, #0\n\
    bl Text_DrawCharacter\n\
    adds r4, r0, #0\n\
_08009EC2:\n\
    movs r0, #0\n\
    mov r8, r0\n\
    ldrb r0, [r4]\n\
    cmp r0, #0\n\
    beq _08009EE8\n\
    cmp r0, #1\n\
    bne _08009EE2\n\
    ldm r7!, {r0}\n\
    adds r1, r5, #0\n\
    bl PutText\n\
    adds r5, #0x80\n\
    adds r6, #1\n\
    adds r4, #1\n\
    cmp r6, sb\n\
    bge _08009EF8\n\
_08009EE2:\n\
    mov r2, r8\n\
    cmp r2, #0\n\
    beq _08009EB8\n\
_08009EE8:\n\
    lsls r0, r6, #2\n\
    add r0, sl\n\
    ldr r0, [r0]\n\
    lsls r1, r6, #7\n\
    ldr r2, [sp]\n\
    adds r1, r2, r1\n\
    bl PutText\n\
_08009EF8:\n\
    add sp, #4\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
");
}

void TalkPutSpriteText_OnIdle(struct Proc * proc)
{
    PutSprite(3,
        proc->x, proc->y, gUnk_08BFFDB6,
        OAM2_CHR(proc->unk52) | OAM2_PAL(proc->unk64));

    PutSprite(3,
        proc->x, proc->y, gUnk_08BFFD9C,
        OAM2_CHR(proc->unk52) | OAM2_PAL(sTalkFont.palid));
}

void sub_8009F8C()
{
    SetOnHBlankA(0);
}

void sub_8009F98()
{
    sub_8014FB0(&sub_8009F8C, 1);
}

int sub_8009FAC(char const * str, bool isBubbleOpen)
{
    char buf[0x20];

    int speakFace = sTalkSt->speak_talk_face;
    int activeFace = sTalkSt->active_talk_face;

    s32 chrlen;

    int currentLineLen = 0;
    int maxLineLen = 24;

    for (;TRUE;)
    {
        switch (*str)
        {

        case 0x00: // end
            if (currentLineLen > maxLineLen)
                maxLineLen = currentLineLen;

            currentLineLen = 0;

            goto ret;

        case 0x01 ... 0x02:
            if (currentLineLen > maxLineLen)
                maxLineLen = currentLineLen;

            currentLineLen = 0;

            str++;
            break;

        case 0x03:
            currentLineLen += 12;
            str++;
            break;

        case 0x04 ... 0x07:
            str++;
            break;

        case 0x08 ... 0x0F:
            activeFace = *str - 0x08;
            str++;
            break;

        case 0x10:
            for (;TRUE;)
            {
                switch (*str)
                {

                case 0x08 ... 0x0F:
                    activeFace = *str - 0x08;
                    str++;
                    continue;

                case 0x10:
                    str++;
                    str++;
                    str++;

                    continue;

                }

                break;
            }

            break;

        case 0x11: 
            if (activeFace == speakFace)
            {
                if (currentLineLen > maxLineLen)
                    maxLineLen = currentLineLen;

                currentLineLen = 0;

                goto ret;
            }

            str++;
            break;

        case 0x12 ... 0x15:
            if (!isBubbleOpen)
            {
                if (currentLineLen > maxLineLen)
                    maxLineLen = currentLineLen;

                currentLineLen = 0;

                goto ret;
            }

            str++;
            break;

        case 0x16 ... 0x17:
            str++;
            break;

        case 0x18 ... 0x1B: // choice
            currentLineLen += 128;
            str++;
            break;

        case 0x1C:
            str++;
            break;

        case 0x80:
            str++;

            switch (*str)
            {

            case 0x00 ... 0x04:
            case 0x07 ... 0x09:
            case 0x16 ... 0x1F:
            case 0x21:
            case 0x24:
            case 0x25:
                str++;
                break;

            case 0x05:
                sub_80149EC(sTalkSt->number, buf);
                currentLineLen += sub_8009FAC(buf, isBubbleOpen);

                str++;
                break;

            case 0x20:
                currentLineLen += GetStringTextLen(sub_802EBB0());

                str++;
                break;

            case 0x06:
                currentLineLen += sub_8009FAC(sTalkSt->buf_unk_str, isBubbleOpen);

                str++;
                break;

            case 0x0A ... 0x11:
                activeFace = *str - 0x0A;
                str++;
                break;

            case 0x12 ... 0x15:
            case 0x22 ... 0x23:
                break;

            default:
                break;

            }

            break;

        case 0x81:
            if (str[1] == 0x40)
            {
                str += 2;
                currentLineLen += 6;
                break;
            }

            // fallthrough

        default:
            if ((activeFace != speakFace) && (activeFace != TALK_FACE_NONE))
            {
                if (!isBubbleOpen)
                {
                    isBubbleOpen = TRUE;
                    speakFace = activeFace;
                }
                else
                {
                    if (currentLineLen > maxLineLen)
                        maxLineLen = currentLineLen;

                    currentLineLen = 0;

                    goto ret;
                }
            }

            str = GetCharTextLen(str, &chrlen);
            currentLineLen += chrlen;
        }
    }

ret:
    return maxLineLen;
}

bool sub_800A378()
{
	return Proc_Exists(gUnk_08BFFE18);
}

void sub_800A390()
{
	Proc_Start(gUnk_08BFFE18, (ProcPtr)3);
}

void sub_800A3A4(struct Proc* proc)
{
	proc->unk34 = 1;
}

void StartTalkDebug()
{
	DisplayBackground(0x1c);
}

void sub_800A3B8(struct Proc* proc)
{
	proc->x = 0;
	sub_800A3A4(proc);
}

void sub_800A3C8(struct Proc* proc)
{
	int x = proc->x;
	if (IsTalkLocked())
	{
		ResumeTalk();
	}

	if (IsEventRunning())
	{
		return;
	}

	if (!proc->unk34)
	{
		sub_800515C(-1, 9);
		sub_800A3A4(proc);
	}

	sub_8005234(0x70, 0x64, x, 4);

	if ((gpKeySt->pressed & 4) != 0)
	{
		Proc_Break(proc);
	}
	else
	{
		if ((gpKeySt->repeated & DPAD_UP) != 0)
		{
			x++;
		}
		if ((gpKeySt->repeated & DPAD_DOWN) != 0)
		{
			x--;
		}
		if ((gpKeySt->repeated & DPAD_RIGHT) != 0)
		{
			x += 10;
		}
		if ((gpKeySt->repeated & DPAD_LEFT) != 0)
		{
			x -= 10;
		}
		if ((gpKeySt->repeated & R_BUTTON) != 0)
		{
			x += 100;
		}
		if ((gpKeySt->repeated & L_BUTTON) != 0)
		{
			x -= 100;
		}
		if (x < 0)
		{
			x = 0;
		}

		if (x > MSG_1234)
		{
			x = MSG_1234;
		}

		if (x != proc->x)
		{
			ClearTalk();
			EndTalk();
			sub_800515C(-1, 9);
			proc->x = x;
			InitTalk(0x80, 2, 1);
			StartTalkMsg(1, 1, proc->x);
			SetTalkFlag(1);
			SetTalkFlag(2);
			SetTalkFlag(4);
			sub_8007F68(-1);
			TalkBgSync(1);
		}
		else
		{
			if (gpKeySt->pressed & 1)
			{
				ClearTalk();
				EndTalk();
				proc->unk34 = 0;
				sub_800EC84(proc->x);
			}
		}
	}
}

void TalkBgSync(int bits)
{
	if (!sub_8007F58(0x20))
	{
		EnableBgSync(bits);
	}
}
