#include "gbafe.h"
#include "constants/msg.h"

void SetupDebugFontForOBJ(signed char, int);
void sub_8005234(int, int, int, int);

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkSt->top_text_num) % sTalkSt->lines)

extern int sTalkChoiceResult;
extern struct Text sTalkText[];
extern struct Font sTalkFont;

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
    sTalkSt->unk_38 = 0;
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

void sub_8007F38(ProcFunc func)
{
    sTalkSt->unk_38 = func;
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

void sub_80080A8(ProcPtr proc)
{
    if (sub_8008EB0())
        return;

    if (!sTalkSt->instant_print)
    {
        sTalkSt->print_clock++;

        if (sTalkSt->print_clock < sTalkSt->print_delay)
        {
            return;
        }
    }

    sTalkSt->print_clock = 0;

    while (1)
    {
        SetTalkFaceNoMouthMove(sTalkSt->active_talk_face);

        switch (TalkInterpret(proc))
        {
        case 0:
            Proc_Break(proc);
            return;

        case 2:
            if (sTalkSt->instant_print || sTalkSt->print_delay <= 0)
            {
                break;
            }

            return;

        case 3:
            sTalkSt->print_clock = sTalkSt->print_delay;
            sTalkSt->instant_print = FALSE;
            return;

        case 1:
        default:
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
                if (sub_8007F58(TALK_FLAG_7) != 0)
                {
                    PlaySoundEffect(0x39A);
                }
                else
                {
                    if ((GetTextPrintDelay() == 1) && !(GetGameTime() & 1))
                        break;

                    if (sTalkSt->instant_print != 0 && sTalkSt->unk_82 != 0)
                        break;

                    sTalkSt->unk_82 = 1;

                    PlaySoundEffect(0x38E);
                }
            }
        }

        if (!sTalkSt->instant_print && sTalkSt->print_delay > 0)
            return;
    }
}

bool sub_800821C(ProcPtr proc)
{
    if (!sub_8009D70() && sTalkSt->active_talk_face != 0xFF && !sub_8007F58(2))
    {
        if (sTalkSt->str_back == NULL)
        {
            sTalkSt->active_width = Div(sub_8009FAC(sTalkSt->str, 0) + 7, 8) + 2;
        }
        else
        {
            sTalkSt->active_width = Div(sub_8009FAC(sTalkSt->str_back, 0) + 7, 8) + 2;
        }

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

int TalkInterpret(ProcPtr proc) {
    struct Proc* unkProc;
    int i;

    while (1) {
        switch (*sTalkSt->str) {
            case 0x12:
            case 0x13:
            case 0x14:
                sTalkSt->str++;
                sTalkSt->active_width = 2 + Div(sub_8009FAC(sTalkSt->str, sub_8009D70()) + 7, 8);
                continue;
        }
        break;
    }

    switch (*sTalkSt->str) {
        case 0x81:
            if (sTalkSt->str[1] == 0x40) {
                sTalkSt->str += 2;

                Text_Skip(TALK_TEXT_BY_LINE(sTalkSt->line_active), 6);

                if (sTalkSt->instant_print || sTalkSt->print_delay <= 0) {
                    return 2;
                }

                unkProc = Proc_StartBlocking(gUnk_08BFFBDC, proc);
                unkProc->unk64 = sub_80095D4(4);
                return 3;
            }

            return 1;

        case 0x00:
            if (sTalkSt->str_back == 0) {
                return 0;
            }

            sTalkSt->str = sTalkSt->str_back;
            sTalkSt->str += 2;
            sTalkSt->str_back = NULL;

            return TalkInterpret(proc);

        case 0x01:
            if (sTalkSt->put_lines == 1 || sTalkSt->line_active == 1) {
                sTalkSt->line_active++;
            }

            sTalkSt->put_lines = 0;
            sTalkSt->str++;
            return 2;

        case 0x02:
            if (sub_8007F58(TALK_FLAG_7)) {
                sub_8009598();
                sTalkSt->str++;
            } else if (!sub_8007F58(TALK_FLAG_INSTANTSHIFT)) {
                Proc_StartBlocking(gUnk_08BFFC7C, proc);
            } else {
                sub_800968C();
            }

            sTalkSt->str++;
            return 3;

        case 0x03:
            sub_800914C(
                proc,
                sTalkSt->x_text * 8 + Text_GetCursor(TALK_TEXT_BY_LINE(sTalkSt->line_active)) + 4,
                sTalkSt->y_text * 8 + sTalkSt->line_active * 16 + 8
            );

            sTalkSt->str++;

            return 3;

        case 0x04:
        case 0x05:
        case 0x06:
        case 0x07:
            if (sTalkSt->instant_print) {
                sTalkSt->str++;
                return 2;
            }

            unkProc = Proc_StartBlocking(gUnk_08BFFBDC, proc);
            unkProc->unk64 = sub_80095D4(*sTalkSt->str);

            sTalkSt->str++;
            return 3;

        case 0x15:
            sub_80095E4();
            sTalkSt->str++;
            return 3;

        case 0x16:
            sTalkSt->unk_16 = 1 - sTalkSt->unk_16;
            sTalkSt->str++;
            return 3;

        case 0x17:
            sTalkSt->unk_17 = 1 - sTalkSt->unk_17;
            sTalkSt->str++;
            return 3;

        case 0x10:
            while (1) {
                switch (*sTalkSt->str) {
                    case 0x08:
                    case 0x09:
                    case 0x0A:
                    case 0x0B:
                    case 0x0C:
                    case 0x0D:
                    case 0x0E:
                    case 0x0F:
                        sub_8008CB8(*sTalkSt->str - 8);
                        sTalkSt->str++;
                        continue;

                    case 0x10:
                        sTalkSt->str++;
                        sub_8008CC4(proc);
                        sTalkSt->str += 2;
                        continue;
                }
                break;
            }

            return 3;

        case 0x11:
            if (sub_8009D70()) {
                sub_80095E4();
            }

            StartFaceFadeOut(sTalkSt->faces[sTalkSt->active_talk_face]);
            sTalkSt->faces[sTalkSt->active_talk_face] = 0;
            sTalkSt->str++;
            sub_80149B4(proc, 16);
            return 3;

        case 0x1C:
            if (sub_8007F58(0x10))
            {
                sub_8007F44(TALK_FLAG_OPAQUE);
            }
            else
            {
                SetTalkFlag(TALK_FLAG_OPAQUE);
            }
            sTalkSt->str++;
            return 3;

        case 0x08:
        case 0x09:
        case 0x0A:
        case 0x0B:
        case 0x0C:
        case 0x0D:
        case 0x0E:
        case 0x0F:
            SetTalkFaceNoMouthMove(sTalkSt->active_talk_face);

            sub_8008CB8(*sTalkSt->str - 8);

            while (sTalkSt->str++) {
                if (sTalkSt->str == sTalkSt->str)
                    break;
            }

            return 3;

        case 0x18:
            sub_800925C(
                gUnk_08BFFC9C,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                1,
                sTalkSt->print_color,
                proc
            );

            sTalkSt->str++;
            return 3;

        case 0x19:
            sub_800925C(
                gUnk_08BFFC9C,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                2,
                sTalkSt->print_color,
                proc
            );

            sTalkSt->str++;
            return 3;

        case 0x1A:
            sub_800925C(
                gUnk_08BFFCAC,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                1,
                sTalkSt->print_color,
                proc
            );

            while (sTalkSt->str++) {
                if (sTalkSt->str == sTalkSt->str)
                    break;
            }

            return 3;

        case 0x1B:
            sub_800925C(
                gUnk_08BFFCAC,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                2,
                sTalkSt->print_color,
                proc
            );

            while (sTalkSt->str++) {
                if (sTalkSt->str == sTalkSt->str)
                    break;
            }

            return 3;

        case 0x80:
            switch (*++sTalkSt->str) {
                case 0x24:
                    if (sTalkSt->unk_38) {
                        sTalkSt->unk_38(proc);
                    }

                    sTalkSt->str++;
                    return 3;

                case 0x21:
                    sub_800837C();
                    sTalkSt->str++;
                    return TalkInterpret(proc);

                case 0x00:
                case 0x01:
                case 0x02:
                case 0x03:
                    sTalkSt->print_color = *++sTalkSt->str;

                    for (i = 0; i < sTalkSt->lines; i++) {
                        Text_SetColor(sTalkText + i, sTalkSt->print_color);
                    }

                    sTalkSt->str++;
                    return 3;
                case 0x25:
                    sTalkSt->unk_83 = 3 - (sTalkSt->unk_83 & 1);
                    sTalkSt->str++;
                    return 3;

                case 0x04:
                    LockTalk(proc);
                    sTalkSt->str++;
                    return 3;

                case 0x05:
                    sub_80149EC(sTalkSt->number, sTalkSt->buf_number_str);

                    sTalkSt->str--;
                    sTalkSt->str_back = sTalkSt->str;
                    sTalkSt->str = sTalkSt->buf_number_str;

                    return TalkInterpret(proc);

                case 0x20:
                    sTalkSt->str_back = sTalkSt->str;
                    sTalkSt->str_back--;
                    sTalkSt->str = GetTacticianName();

                    return TalkInterpret(proc);

                case 0x06:
                    sTalkSt->str--;

                    sTalkSt->str_back = sTalkSt->str;
                    sTalkSt->str = sTalkSt->buf_unk_str;

                    return TalkInterpret(proc);
                case 0x0A:
                case 0x0B:
                case 0x0C:
                case 0x0D:
                case 0x0E:
                case 0x0F:
                case 0x10:
                case 0x11:
                    sub_8008E58(sTalkSt->active_talk_face, *sTalkSt->str - 10);
                    sub_8008CB8(*sTalkSt->str - 10);

                    sTalkSt->str++;
                    return 3;

                case 0x07:
                case 0x08:
                    sTalkSt->str++;
                    return 3;

                case 0x16:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 0);
                    return 3;

                case 0x17:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 1);
                    return 3;

                case 0x18:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 3);
                    return 3;

                case 0x19:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 2);
                    return 3;

                case 0x1A:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 4);
                    return 3;

                case 0x1B:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 5);
                    return 3;

                case 0x1C:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 0);
                    return 3;

                case 0x1D:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 2);
                    return 3;

                case 0x1E:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 3);
                    return 3;

                case 0x1F:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 4);
                    return 3;

                default:
                    return 0;
            }
    }

    return 1;
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

void sub_8009310(struct TalkChoiceProc * proc)
{
    if (gpKeySt->pressed & 2)
    {
        PlaySoundEffect(0x38B);

        sTalkChoiceResult = 0;

        Proc_Break(proc);
        return;
    }
    else if (gpKeySt->pressed & 1)
    {
        PlaySoundEffect(0x38A);

        sTalkChoiceResult = proc->selectedChoice;

        Proc_Break(proc);
        return;
    }

    if ((gpKeySt->pressed & 32) && (proc->selectedChoice == 2))
    {
        PlaySoundEffect(0x387);

        proc->selectedChoice = 1;

        if (proc->choices[0].onSwitch)
            proc->choices[0].onSwitch();
    }

    if ((gpKeySt->pressed & 16) && (proc->selectedChoice == 1))
    {
        PlaySoundEffect(0x387);

        proc->selectedChoice = 2;

        if (proc->choices[1].onSwitch)
            proc->choices[1].onSwitch();
    }

    PutUiHand(proc->x_disp + (proc->selectedChoice - 1) * 40 - 4, proc->y_disp);
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

void sub_8009598()
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
    
    if (!(sTalkSt->unk_83 & 1))
    {
        sub_8009920(1, xTail, yAnchor, kind);
    }

    sub_80098A0(x, y, width, height);

    sub_800981C();

    TalkBgSync(BG1_SYNC_BIT);
}

void sub_800981C()
{
    struct Proc * proc = Proc_Start(gUnk_08BFFD3C, (ProcPtr)3);
    proc->unk64 = 0;
}

void sub_8009834(struct Proc * proc)
{
    u8 const * gUnk_0818F93C[] =
    {
        gUnk_084029FC,
        gUnk_084029AC,
        gUnk_08402958,
        gUnk_084028FC,
        gUnk_08402858,
        gUnk_084027B0 ,
        NULL,
    };

    if ((proc->unk64++) & 1)
        return;

    Decompress(gUnk_0818F93C[proc->unk64 >> 1],
        (u8 *) VRAM + GetBgChrOffset(1) + 0x10 * CHR_SIZE);

    if (gUnk_0818F93C[(proc->unk64 >> 1) + 1] == NULL)
        Proc_Break(proc);
}

void sub_80098A0(int x, int y, int width, int height)
{
    SetWinEnable(1, 0, 0);

    SetWin0Box((x + 1) * 8, (y + 1) * 8, (x + width - 1) * 8, (y + height - 1) * 8);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);
}

void sub_8009920(int bg, int x, int y, int kind)
{
    u16* buf = GetBgTilemap(bg);

    switch (kind)
    {
        case 0:
            buf[TM_OFFSET_(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TM_OFFSET_(x + 1, y    )] = TILEREF(0x10 + 4, 3) + TILE_HFLIP;
            buf[TM_OFFSET_(x    , y + 1)] = TILEREF(0x10 + 6, 3) + TILE_HFLIP;
            buf[TM_OFFSET_(x + 1, y + 1)] = TILEREF(0x10 + 5, 3) + TILE_HFLIP;

            break;

        case 1:
            buf[TM_OFFSET_(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TM_OFFSET_(x + 1, y    )] = TILEREF(0x10 + 4, 3) + TILE_HFLIP;
            buf[TM_OFFSET_(x    , y + 1)] = TILEREF(0x10 + 5, 3);
            buf[TM_OFFSET_(x + 1, y + 1)] = TILEREF(0x10 + 6, 3);

            break;

        case 2:
            buf[TM_OFFSET_(x    , y    )] = TILEREF(0x10 + 8, 3) + TILE_HFLIP;
            buf[TM_OFFSET_(x    , y + 1)] = TILEREF(0x10 + 9, 3) + TILE_HFLIP;
            buf[TM_OFFSET_(x + 1, y    )] = TILEREF(0x10 + 7, 3) + TILE_HFLIP;
            buf[TM_OFFSET_(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + TILE_HFLIP + TILE_VFLIP;

            break;

        case 3:
            buf[TM_OFFSET_(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TM_OFFSET_(x    , y + 1)] = TILEREF(0x10 + 7, 3) + TILE_VFLIP;
            buf[TM_OFFSET_(x + 1, y    )] = TILEREF(0x10 + 8, 3);
            buf[TM_OFFSET_(x + 1, y + 1)] = TILEREF(0x10 + 9, 3);

            break;

        case 4:
            buf[TM_OFFSET_(x    , y    )] = TILEREF(0x10 + 9, 3) + TILE_HFLIP + TILE_VFLIP;
            buf[TM_OFFSET_(x    , y + 1)] = TILEREF(0x10 + 8, 3) + TILE_HFLIP + TILE_VFLIP;
            buf[TM_OFFSET_(x + 1, y    )] = TILEREF(0x10 + 7, 3) + TILE_HFLIP;
            buf[TM_OFFSET_(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + TILE_HFLIP + TILE_VFLIP;

            break;

        case 5:
            buf[TM_OFFSET_(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TM_OFFSET_(x    , y + 1)] = TILEREF(0x10 + 7, 3) + TILE_VFLIP;
            buf[TM_OFFSET_(x + 1, y    )] = TILEREF(0x10 + 9, 3) + TILE_VFLIP;
            buf[TM_OFFSET_(x + 1, y + 1)] = TILEREF(0x10 + 8, 3) + TILE_VFLIP;

            break;
    }
}

void sub_8009AA8(int id, int x, int y, int width, int height)
{
    int i, j;

    u16 * tilemap = GetBgTilemap(id);
    width--;
    height--;

    for (i = x; i < x + width; ++i)
    {
        tilemap[TM_OFFSET_(i, y)]          = TILEREF(0x10 + 1, BGPAL_TALK_BUBBLE);
        tilemap[TM_OFFSET_(i, y + height)] = TILEREF(0x10 + 1, BGPAL_TALK_BUBBLE) + TILE_VFLIP;
    }

    for (i = y; i < y + height; ++i)
    {
        tilemap[TM_OFFSET_(x, i)]         = TILEREF(0x10 + 2, BGPAL_TALK_BUBBLE);
        tilemap[TM_OFFSET_(x + width, i)] = TILEREF(0x10 + 2, BGPAL_TALK_BUBBLE) + TILE_HFLIP;
    }

    for (i = x + 1; i < x + width; ++i)
        for (j = y + 1; j < y + height; ++j)
            tilemap[TM_OFFSET(i, j)] = TILEREF(0x10 + 3, BGPAL_TALK_BUBBLE);

    tilemap[TM_OFFSET_(x,         y)]          = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE);
    tilemap[TM_OFFSET_(x + width, y)]          = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_HFLIP;
    tilemap[TM_OFFSET_(x,         y + height)] = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_VFLIP;
    tilemap[TM_OFFSET_(x + width, y + height)] = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_HFLIP + TILE_VFLIP;
}

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

void PrintStringToTexts(struct Text ** texts, char const * str, u16 * tm, int unk)
{
    int uh;

    int line = 0;

    while (1) {
        uh = 0;

        switch (*str) {
            case 0:
                uh += 1;
                break;

            case 1:
                PutText(texts[line], tm + line * 0x40);

                line++;
                str++;

                if (line >= unk) {
                    return;
                }

                break;
        }

        if (uh != 0) {
            break;
        }

        str = Text_DrawCharacter(texts[line], str);
        continue;
    }

    PutText(texts[line], tm + line * 0x40);
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
    CallDelayed(&sub_8009F8C, 1);
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
                currentLineLen += GetStringTextLen(GetTacticianName());

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
		SetupDebugFontForOBJ(-1, 9);
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
			SetupDebugFontForOBJ(-1, 9);
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
