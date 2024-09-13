#include "gbafe.h"

bool IsBattleDeamonActive();
bool IsTalkLocked();
bool IsEventRunning();
void ResumeTalk();
void EndTalk();
void sub_800515C(signed char, int);
void sub_800A3A4(struct Proc*);
void StartTalkMsg(int, int, int);
void sub_8005234(int, int, int, int);
void TalkBgSync(int bits);
void SetTalkFlag(int);
void sub_800EC84(int);
void sub_8007F68(int);
int sub_8007F58(int);

void sub_8014FB0(void (*)(), int);

extern struct ProcCmd gUnk_08BFFE18[];
extern struct ProcCmd gUnk_08BFFD3C;
extern struct ProcCmd gUnk_08BFFD4C[];
extern u16 gUnk_08BFFDB6[];
extern u16 gUnk_08BFFD9C[];
extern struct ProcCmd ProcScr_Talk[];

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
    /* 38 */ u16 flags;
    /* 3A */ // pad
    /* 3C */ int number;
    /* 40 */ char buf_number_str[0x20];
    /* 60 */ char buf_unk_str[0x20];
};

extern struct TalkSt * CONST_DATA sTalkSt;
extern int sTalkChoiceResult;
extern int CONST_DATA gUnk_08BFFD7C[];
extern u8* CONST_DATA gUnk_0818F93C[];

void sub_800981C()
{
    struct Proc * proc = Proc_Start(&gUnk_08BFFD3C, (void*)3);
    proc->unk64 = 0;
}

#if NONMATCHING

void sub_8009834(struct Proc * proc)
{
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
void sub_8009920()
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

NAKEDFUNC
void sub_8009AA8(int bg, u16 * a1, u16 * a2, int len)
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

void sub_80096E0(short, short, short, short);
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
void PrintStringToTexts(struct Text ** texts, char const * str, int x, int y)
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

NAKEDFUNC
void TalkPutSpriteText_OnIdle(struct Proc * proc)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, sb\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    sub sp, #4\n\
    adds r7, r0, #0\n\
    ldr r1, [r7, #0x2c]\n\
    ldr r2, [r7, #0x30]\n\
    ldr r0, _08009F7C @ =gUnk_08BFFDB6\n\
    mov ip, r0\n\
    movs r3, #0x52\n\
    adds r3, r3, r7\n\
    mov sb, r3\n\
    ldr r4, _08009F80 @ =0x000003FF\n\
    mov sl, r4\n\
    ldrh r6, [r3]\n\
    ands r4, r6\n\
    movs r0, #0x64\n\
    adds r0, r0, r7\n\
    mov r8, r0\n\
    movs r5, #0xf\n\
    adds r0, r5, #0\n\
    mov r3, r8\n\
    ldrh r3, [r3]\n\
    ands r0, r3\n\
    lsls r0, r0, #0xc\n\
    orrs r4, r0\n\
    str r4, [sp]\n\
    movs r0, #3\n\
    mov r3, ip\n\
    bl PutSprite\n\
    ldr r1, [r7, #0x2c]\n\
    ldr r2, [r7, #0x30]\n\
    ldr r3, _08009F84 @ =gUnk_08BFFD9C\n\
    mov r6, sl\n\
    mov r4, sb\n\
    ldrh r4, [r4]\n\
    ands r6, r4\n\
    ldr r0, _08009F88 @ =0x030000E8\n\
    ldrh r0, [r0, #0x14]\n\
    ands r5, r0\n\
    lsls r5, r5, #0xc\n\
    orrs r6, r5\n\
    str r6, [sp]\n\
    movs r0, #3\n\
    bl PutSprite\n\
    add sp, #4\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
    .align 2, 0\n\
_08009F7C: .4byte gUnk_08BFFDB6\n\
_08009F80: .4byte 0x000003FF\n\
_08009F84: .4byte gUnk_08BFFD9C\n\
_08009F88: .4byte 0x030000E8\n\
");
}

void sub_8009F8C()
{
    SetOnHBlankA(0);
}

void sub_8009F98()
{
    sub_8014FB0(&sub_8009F8C, 1);
}

NAKEDFUNC
int sub_8009FAC(char const * str, bool isBubbleOpen)
{
    asm("\n\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sb\n\
    mov r6, r8\n\
    push {r6, r7}\n\
    sub sp, #0x24\n\
    adds r4, r0, #0\n\
    lsls r1, r1, #0x18\n\
    lsrs r1, r1, #0x18\n\
    mov r8, r1\n\
    ldr r0, _08009FE0 @ =sTalkSt\n\
    ldr r0, [r0]\n\
    movs r1, #0xf\n\
    ldrsb r1, [r0, r1]\n\
    mov sb, r1\n\
    ldrb r5, [r0, #0x11]\n\
    movs r6, #0\n\
    movs r7, #0x18\n\
_08009FCE:\n\
    ldrb r0, [r4]\n\
    cmp r0, #0x81\n\
    bls _08009FD6\n\
    b _0800A342\n\
_08009FD6:\n\
    lsls r0, r0, #2\n\
    ldr r1, _08009FE4 @ =_08009FE8\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08009FE0: .4byte sTalkSt\n\
_08009FE4: .4byte _08009FE8\n\
_08009FE8: @ jump table\n\
    .4byte _0800A1F0 @ case 0\n\
    .4byte _0800A1FA @ case 1\n\
    .4byte _0800A1FA @ case 2\n\
    .4byte _0800A206 @ case 3\n\
    .4byte _0800A202 @ case 4\n\
    .4byte _0800A202 @ case 5\n\
    .4byte _0800A202 @ case 6\n\
    .4byte _0800A202 @ case 7\n\
    .4byte _0800A20A @ case 8\n\
    .4byte _0800A20A @ case 9\n\
    .4byte _0800A20A @ case 10\n\
    .4byte _0800A20A @ case 11\n\
    .4byte _0800A20A @ case 12\n\
    .4byte _0800A20A @ case 13\n\
    .4byte _0800A20A @ case 14\n\
    .4byte _0800A20A @ case 15\n\
    .4byte _0800A210 @ case 16\n\
    .4byte _0800A22E @ case 17\n\
    .4byte _0800A234 @ case 18\n\
    .4byte _0800A234 @ case 19\n\
    .4byte _0800A234 @ case 20\n\
    .4byte _0800A234 @ case 21\n\
    .4byte _0800A202 @ case 22\n\
    .4byte _0800A202 @ case 23\n\
    .4byte _0800A23C @ case 24\n\
    .4byte _0800A23C @ case 25\n\
    .4byte _0800A23C @ case 26\n\
    .4byte _0800A23C @ case 27\n\
    .4byte _0800A202 @ case 28\n\
    .4byte _0800A342 @ case 29\n\
    .4byte _0800A342 @ case 30\n\
    .4byte _0800A342 @ case 31\n\
    .4byte _0800A342 @ case 32\n\
    .4byte _0800A342 @ case 33\n\
    .4byte _0800A342 @ case 34\n\
    .4byte _0800A342 @ case 35\n\
    .4byte _0800A342 @ case 36\n\
    .4byte _0800A342 @ case 37\n\
    .4byte _0800A342 @ case 38\n\
    .4byte _0800A342 @ case 39\n\
    .4byte _0800A342 @ case 40\n\
    .4byte _0800A342 @ case 41\n\
    .4byte _0800A342 @ case 42\n\
    .4byte _0800A342 @ case 43\n\
    .4byte _0800A342 @ case 44\n\
    .4byte _0800A342 @ case 45\n\
    .4byte _0800A342 @ case 46\n\
    .4byte _0800A342 @ case 47\n\
    .4byte _0800A342 @ case 48\n\
    .4byte _0800A342 @ case 49\n\
    .4byte _0800A342 @ case 50\n\
    .4byte _0800A342 @ case 51\n\
    .4byte _0800A342 @ case 52\n\
    .4byte _0800A342 @ case 53\n\
    .4byte _0800A342 @ case 54\n\
    .4byte _0800A342 @ case 55\n\
    .4byte _0800A342 @ case 56\n\
    .4byte _0800A342 @ case 57\n\
    .4byte _0800A342 @ case 58\n\
    .4byte _0800A342 @ case 59\n\
    .4byte _0800A342 @ case 60\n\
    .4byte _0800A342 @ case 61\n\
    .4byte _0800A342 @ case 62\n\
    .4byte _0800A342 @ case 63\n\
    .4byte _0800A342 @ case 64\n\
    .4byte _0800A342 @ case 65\n\
    .4byte _0800A342 @ case 66\n\
    .4byte _0800A342 @ case 67\n\
    .4byte _0800A342 @ case 68\n\
    .4byte _0800A342 @ case 69\n\
    .4byte _0800A342 @ case 70\n\
    .4byte _0800A342 @ case 71\n\
    .4byte _0800A342 @ case 72\n\
    .4byte _0800A342 @ case 73\n\
    .4byte _0800A342 @ case 74\n\
    .4byte _0800A342 @ case 75\n\
    .4byte _0800A342 @ case 76\n\
    .4byte _0800A342 @ case 77\n\
    .4byte _0800A342 @ case 78\n\
    .4byte _0800A342 @ case 79\n\
    .4byte _0800A342 @ case 80\n\
    .4byte _0800A342 @ case 81\n\
    .4byte _0800A342 @ case 82\n\
    .4byte _0800A342 @ case 83\n\
    .4byte _0800A342 @ case 84\n\
    .4byte _0800A342 @ case 85\n\
    .4byte _0800A342 @ case 86\n\
    .4byte _0800A342 @ case 87\n\
    .4byte _0800A342 @ case 88\n\
    .4byte _0800A342 @ case 89\n\
    .4byte _0800A342 @ case 90\n\
    .4byte _0800A342 @ case 91\n\
    .4byte _0800A342 @ case 92\n\
    .4byte _0800A342 @ case 93\n\
    .4byte _0800A342 @ case 94\n\
    .4byte _0800A342 @ case 95\n\
    .4byte _0800A342 @ case 96\n\
    .4byte _0800A342 @ case 97\n\
    .4byte _0800A342 @ case 98\n\
    .4byte _0800A342 @ case 99\n\
    .4byte _0800A342 @ case 100\n\
    .4byte _0800A342 @ case 101\n\
    .4byte _0800A342 @ case 102\n\
    .4byte _0800A342 @ case 103\n\
    .4byte _0800A342 @ case 104\n\
    .4byte _0800A342 @ case 105\n\
    .4byte _0800A342 @ case 106\n\
    .4byte _0800A342 @ case 107\n\
    .4byte _0800A342 @ case 108\n\
    .4byte _0800A342 @ case 109\n\
    .4byte _0800A342 @ case 110\n\
    .4byte _0800A342 @ case 111\n\
    .4byte _0800A342 @ case 112\n\
    .4byte _0800A342 @ case 113\n\
    .4byte _0800A342 @ case 114\n\
    .4byte _0800A342 @ case 115\n\
    .4byte _0800A342 @ case 116\n\
    .4byte _0800A342 @ case 117\n\
    .4byte _0800A342 @ case 118\n\
    .4byte _0800A342 @ case 119\n\
    .4byte _0800A342 @ case 120\n\
    .4byte _0800A342 @ case 121\n\
    .4byte _0800A342 @ case 122\n\
    .4byte _0800A342 @ case 123\n\
    .4byte _0800A342 @ case 124\n\
    .4byte _0800A342 @ case 125\n\
    .4byte _0800A342 @ case 126\n\
    .4byte _0800A342 @ case 127\n\
    .4byte _0800A240 @ case 128\n\
    .4byte _0800A336 @ case 129\n\
_0800A1F0:\n\
    cmp r6, r7\n\
    bgt _0800A1F6\n\
    b _0800A368\n\
_0800A1F6:\n\
    adds r7, r6, #0\n\
    b _0800A368\n\
_0800A1FA:\n\
    cmp r6, r7\n\
    ble _0800A200\n\
    adds r7, r6, #0\n\
_0800A200:\n\
    movs r6, #0\n\
_0800A202:\n\
    adds r4, #1\n\
    b _08009FCE\n\
_0800A206:\n\
    adds r6, #0xc\n\
    b _0800A202\n\
_0800A20A:\n\
    ldrb r5, [r4]\n\
    subs r5, #8\n\
    b _0800A202\n\
_0800A210:\n\
    ldrb r0, [r4]\n\
    cmp r0, #8\n\
    bge _0800A218\n\
    b _08009FCE\n\
_0800A218:\n\
    cmp r0, #0xf\n\
    ble _0800A222\n\
    cmp r0, #0x10\n\
    beq _0800A22A\n\
    b _08009FCE\n\
_0800A222:\n\
    adds r5, r0, #0\n\
    subs r5, #8\n\
    adds r4, #1\n\
    b _0800A210\n\
_0800A22A:\n\
    adds r4, #3\n\
    b _0800A210\n\
_0800A22E:\n\
    cmp r5, sb\n\
    beq _0800A1F0\n\
    b _0800A202\n\
_0800A234:\n\
    mov r2, r8\n\
    cmp r2, #0\n\
    beq _0800A1F0\n\
    b _0800A202\n\
_0800A23C:\n\
    adds r6, #0x80\n\
    b _0800A202\n\
_0800A240:\n\
    adds r4, #1\n\
    ldrb r0, [r4]\n\
    cmp r0, #0x25\n\
    bls _0800A24A\n\
    b _08009FCE\n\
_0800A24A:\n\
    lsls r0, r0, #2\n\
    ldr r1, _0800A254 @ =_0800A258\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_0800A254: .4byte _0800A258\n\
_0800A258: @ jump table\n\
    .4byte _0800A202 @ case 0\n\
    .4byte _0800A202 @ case 1\n\
    .4byte _0800A202 @ case 2\n\
    .4byte _0800A202 @ case 3\n\
    .4byte _0800A202 @ case 4\n\
    .4byte _0800A2F0 @ case 5\n\
    .4byte _0800A316 @ case 6\n\
    .4byte _0800A202 @ case 7\n\
    .4byte _0800A202 @ case 8\n\
    .4byte _0800A202 @ case 9\n\
    .4byte _0800A330 @ case 10\n\
    .4byte _0800A330 @ case 11\n\
    .4byte _0800A330 @ case 12\n\
    .4byte _0800A330 @ case 13\n\
    .4byte _0800A330 @ case 14\n\
    .4byte _0800A330 @ case 15\n\
    .4byte _0800A330 @ case 16\n\
    .4byte _0800A330 @ case 17\n\
    .4byte _08009FCE @ case 18\n\
    .4byte _08009FCE @ case 19\n\
    .4byte _08009FCE @ case 20\n\
    .4byte _08009FCE @ case 21\n\
    .4byte _0800A202 @ case 22\n\
    .4byte _0800A202 @ case 23\n\
    .4byte _0800A202 @ case 24\n\
    .4byte _0800A202 @ case 25\n\
    .4byte _0800A202 @ case 26\n\
    .4byte _0800A202 @ case 27\n\
    .4byte _0800A202 @ case 28\n\
    .4byte _0800A202 @ case 29\n\
    .4byte _0800A202 @ case 30\n\
    .4byte _0800A202 @ case 31\n\
    .4byte _0800A30C @ case 32\n\
    .4byte _0800A202 @ case 33\n\
    .4byte _08009FCE @ case 34\n\
    .4byte _08009FCE @ case 35\n\
    .4byte _0800A202 @ case 36\n\
    .4byte _0800A202 @ case 37\n\
_0800A2F0:\n\
    ldr r0, _0800A308 @ =sTalkSt\n\
    ldr r0, [r0]\n\
    ldr r0, [r0, #0x3c]\n\
    mov r1, sp\n\
    bl sub_80149EC\n\
    mov r0, r8\n\
    lsls r1, r0, #0x18\n\
    asrs r1, r1, #0x18\n\
    mov r0, sp\n\
    b _0800A322\n\
    .align 2, 0\n\
_0800A308: .4byte sTalkSt\n\
_0800A30C:\n\
    bl sub_802EBB0\n\
    bl GetStringTextLen\n\
    b _0800A326\n\
_0800A316:\n\
    ldr r0, _0800A32C @ =sTalkSt\n\
    ldr r0, [r0]\n\
    adds r0, #0x60\n\
    mov r2, r8\n\
    lsls r1, r2, #0x18\n\
    asrs r1, r1, #0x18\n\
_0800A322:\n\
    bl sub_8009FAC\n\
_0800A326:\n\
    adds r6, r6, r0\n\
    b _0800A202\n\
    .align 2, 0\n\
_0800A32C: .4byte sTalkSt\n\
_0800A330:\n\
    ldrb r5, [r4]\n\
    subs r5, #0xa\n\
    b _0800A202\n\
_0800A336:\n\
    ldrb r0, [r4, #1]\n\
    cmp r0, #0x40\n\
    bne _0800A342\n\
    adds r4, #2\n\
    adds r6, #6\n\
    b _08009FCE\n\
_0800A342:\n\
    cmp r5, sb\n\
    beq _0800A358\n\
    cmp r5, #0xff\n\
    beq _0800A358\n\
    mov r1, r8\n\
    cmp r1, #0\n\
    beq _0800A352\n\
    b _0800A1F0\n\
_0800A352:\n\
    movs r2, #1\n\
    mov r8, r2\n\
    mov sb, r5\n\
_0800A358:\n\
    add r1, sp, #0x20\n\
    adds r0, r4, #0\n\
    bl GetCharTextLen\n\
    adds r4, r0, #0\n\
    ldr r0, [sp, #0x20]\n\
    adds r6, r6, r0\n\
    b _08009FCE\n\
_0800A368:\n\
    adds r0, r7, #0\n\
    add sp, #0x24\n\
    pop {r3, r4}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    pop {r4, r5, r6, r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n\
");
}

bool sub_800A378()
{
	return Proc_Exists(gUnk_08BFFE18);
}

void sub_800A390()
{
	Proc_Start(gUnk_08BFFE18, (void*)3);
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

		if (x > 0x1234)
		{
			x = 0x1234;
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
