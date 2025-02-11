#include "gbafe.h"

struct ModeSelectProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ s32 rotateTimer;
    /* 30 */ u16 unk_30;
    /* 32 */ u16 unk_32;
    /* 34 */ s32 unk_34;
    /* 38 */ void * unk_38;
    /* 3C */ void * pFaceProc; // pFaceProc
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u8 unk_42;
    /* 43 */ u8 unk_43[3];
    /* 46 */ STRUCT_PAD(0x46, 0x49);
    /* 49 */ u8 unk_49[3];
    /* 4C */ u8 activeLordCount;
    /* 50 */ s32 unk_50;
};

struct ModeSelectSpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ s32 unk_2c;
    /* 30 */ s32 unk_30;
    /* 34 */ s32 unk_34;
    /* 38 */ s32 unk_38;
    /* 3C */ u8 unk_3c;
    /* 3E */ u16 unk_3e;
    /* 40 */ s32 unk_40;
    /* 44 */ s32 unk_44;
    /* 48 */ s32 unk_48;
    /* 4C */ u8 unk_4c;
    /* 4D */ u8 unk_4d;
    /* 4E */ u8 unk_4e;
};

struct UnkProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
};

extern struct AnimBuffer gUnk_0201E8D4[];
extern struct AnimMagicFxBuffer gUnk_0201E97C[];

extern u8 Img_ModeSelect_Menu[];
extern u16 Pal_ModeSelect_Menu[];

extern u8 Img_ModeSelect_Sprites[];
extern u16 Pal_ModeSelect_Sprites[];

struct Unk_020000A4
{
    struct Font font;
    struct Text text[7];
};
extern struct Unk_020000A4 gUnk_020000A4;

extern u16 gUnk_0201E9F4[];

// clang-format off

u8 * CONST_DATA gUnk_08DADFF8[] = {
    (u8 *)0x020000F4,
    (u8 *)0x020020F4,
    (u8 *)0x020040F4,
};

u8 * CONST_DATA gUnk_08DAE004[] = {
    (u8 *)0x020060F4,
    (u8 *)0x0200B8F4,
    (u8 *)0x020110F4,
};

u8 * CONST_DATA gUnk_08DAE010[] = {
    (u8 *)0x020168F4,
    (u8 *)0x02016994,
    (u8 *)0x02016A34,
};

u8 * CONST_DATA gUnk_08DAE01C[] = {
    (u8 *)0x02016AD4,
    (u8 *)0x020194D4,
    (u8 *)0x0201BED4,
};

u16 CONST_DATA Sprite_ModeSelect_Mode[] = {
    4,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0x40),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x44),
};

u16 CONST_DATA Sprite_ModeSelect_Select[] = {
    6,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x8),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0xC),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(64), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0x60),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x64),
    OAM0_SHAPE_8x8 + OAM0_Y(16), OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x68),
};

u16 CONST_DATA Sprite_ModeSelect_PressStart[] = {
    5,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x11),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8, OAM2_CHR(0x49),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x31),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x4D),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(64), OAM2_CHR(0x55),
};

u16 CONST_DATA Sprite_ModeSelect_Change[] = {
    1,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x51),
};

u16 CONST_DATA Sprite_ModeSelect_ChapterRange[] = {
    4,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16, OAM2_CHR(0x16),
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x1A),
    OAM0_SHAPE_16x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x1E),
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(80), OAM2_CHR(0x56),
};

// clang-format on

void InitModeSelectAnims(s32 count, u8 * arg_1)
{
    s32 gUnk_08439348[] = {
        0x0E,
        0x00,
        0x06,
    };

    s32 i;

    for (i = 0; i < count; i++)
    {
        gUnk_0201E8D4[i].xPos = 320;
        gUnk_0201E8D4[i].yPos = 88;
        gUnk_0201E8D4[i].animId = gUnk_08439348[arg_1[i]];
        gUnk_0201E8D4[i].roundType = 6;
        gUnk_0201E8D4[i].genericPalId = 0;
        gUnk_0201E8D4[i].state2 = 1;
        gUnk_0201E8D4[i].oam2Tile = (i * 0x2000 + 0x2000) >> 5;
        gUnk_0201E8D4[i].oam2Pal = i + 0xd;

        gUnk_0201E8D4[i].pImgSheetBuf = gUnk_08DADFF8[i];
        gUnk_0201E8D4[i].unk_24 = gUnk_08DAE004[i];
        gUnk_0201E8D4[i].unk_20 = gUnk_08DAE010[i];
        gUnk_0201E8D4[i].unk_28 = gUnk_08DAE01C[i];

        gUnk_0201E8D4[i].charPalId = 0xffff;

        gUnk_0201E8D4[i].unk_30 = &gUnk_0201E97C[i];

        gUnk_0201E97C[i].magic_func_idx = 0;
        gUnk_0201E97C[i].x_offset_bg = 0;
        gUnk_0201E97C[i].y_offset_bg = 0;
        gUnk_0201E97C[i].x_offset_obj = 0;
        gUnk_0201E97C[i].y_offset_obj = 0;
        gUnk_0201E97C[i].obj_chr = 0;
        gUnk_0201E97C[i].obj_pal_id = 0;
        gUnk_0201E97C[i].bg_chr = 0;
        gUnk_0201E97C[i].bg_pal_id = 0;
        gUnk_0201E97C[i].bg = 0;

        gUnk_0201E97C[i].bg_tm_buf = 0;
        gUnk_0201E97C[i].bg_img_buf = 0;
        gUnk_0201E97C[i].bg_tsa_buf = 0;
        gUnk_0201E97C[i].obj_img_buf = 0;
        gUnk_0201E97C[i].reset_callback = 0;

        NewEkrUnitMainMini(&gUnk_0201E8D4[i]);
    }

    return;
}

const char gUnk_08439354[] = JTEXT("使用武器：");
const char gUnk_08439360[] = JTEXT("");
const char gUnk_08439364[] = JTEXT("主人公：");
const char gUnk_08439370[] = JTEXT("斧");
const char gUnk_08439374[] = JTEXT("オスティア侯弟");
const char gUnk_08439384[] = JTEXT("ヘクトル");
const char gUnk_08439390[] = JTEXT("フェレ侯公子");
const char gUnk_084393A0[] = JTEXT("エリウッド");
const char gUnk_084393AC[] = JTEXT("剣");
const char gUnk_084393B0[] = JTEXT("サカの剣士");
const char gUnk_084393BC[] = JTEXT("リン");

const char * CONST_DATA gUnk_08DAE0AC[][3] = {
    {
        gUnk_084393BC,
        gUnk_084393B0,
        gUnk_084393AC,
    },

    {
        gUnk_084393A0,
        gUnk_08439390,
        gUnk_084393AC,
    },
    {
        gUnk_08439384,
        gUnk_08439374,
        gUnk_08439370,
    },
    {
        gUnk_08439364,
        gUnk_08439360,
        gUnk_08439354,
    },
};

void EndModeSelectAnims(s32 count)
{
    s32 i;

    for (i = 0; i < count; i++)
    {
        sub_80556D8(&gUnk_0201E8D4[i]);
    }

    return;
}

void PutModeSelectLabelText(void)
{
    ClearText(&gUnk_020000A4.text[5]);
    ClearText(&gUnk_020000A4.text[6]);

    PutDrawText(&gUnk_020000A4.text[5], gBg1Tm + TM_OFFSET(14, 10), TEXT_COLOR_SYSTEM_WHITE, 0, 0, gUnk_08DAE0AC[3][0]);
    PutDrawText(&gUnk_020000A4.text[6], gBg1Tm + TM_OFFSET(14, 14), TEXT_COLOR_SYSTEM_WHITE, 0, 0, gUnk_08DAE0AC[3][2]);

    EnableBgSync(BG1_SYNC_BIT);

    return;
}

void PutModeSelectCharacterText(s32 index)
{
    ClearText(&gUnk_020000A4.text[2]);
    ClearText(&gUnk_020000A4.text[3]);
    ClearText(&gUnk_020000A4.text[4]);

    PutDrawText(
        &gUnk_020000A4.text[2], gBg1Tm + TM_OFFSET(18, 10), TEXT_COLOR_SYSTEM_BLUE, 0, 0, gUnk_08DAE0AC[index][0]);
    PutDrawText(
        &gUnk_020000A4.text[3], gBg1Tm + TM_OFFSET(14, 12), TEXT_COLOR_SYSTEM_BLUE, 0, 0, gUnk_08DAE0AC[index][1]);
    PutDrawText(
        &gUnk_020000A4.text[4], gBg1Tm + TM_OFFSET(19, 14), TEXT_COLOR_SYSTEM_BLUE, 0, 0, gUnk_08DAE0AC[index][2]);

    EnableBgSync(BG1_SYNC_BIT);

    return;
}

void PutModeSelectDifficultyText(struct ModeSelectProc * proc)
{
    s32 unk = proc->unk_43[proc->unk_41];

    ClearText(&gUnk_020000A4.text[0]);
    ClearText(&gUnk_020000A4.text[1]);

    PutDrawText(
        &gUnk_020000A4.text[0], gBg1Tm + TM_OFFSET(15, 6), unk == 0 ? TEXT_COLOR_SYSTEM_GOLD : TEXT_COLOR_SYSTEM_GRAY,
        0, 0, JTEXT("ノーマル"));

    EnableBgSync(BG1_SYNC_BIT);

    switch (proc->unk_49[proc->unk_41])
    {
        case 0:
            if (!(1 & proc->unk_40))
            {
                return;
            }

            break;

        case 1:
            if (!(4 & proc->unk_40))
            {
                return;
            }

            break;

        case 2:
            if (!(0x10 & proc->unk_40))
            {
                return;
            }

            break;
    }

    PutDrawText(
        &gUnk_020000A4.text[1], gBg1Tm + TM_OFFSET(15, 8), unk == 1 ? TEXT_COLOR_SYSTEM_GOLD : TEXT_COLOR_SYSTEM_GRAY,
        0, 0, JTEXT("ハード"));

    return;
}

struct FaceProc * StartModeSelectFace(s32 index)
{
    s32 fids[3] = {
        0x16,
        0x02,
        0x0C,
    };

    struct FaceProc * pFaceProc =
        StartBmFace(0, fids[index], 204, 72, (FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_0)));
    StartFaceFadeIn(pFaceProc);

    return pFaceProc;
}

extern u8 Img_08435C64[];
extern u8 Img_08435D54[];
extern u8 Img_08435E44[];
extern u8 Img_08435EA8[];

extern u8 Img_08435F00[];
extern u8 Img_08436000[];
extern u8 Img_084360F4[];
extern u8 Img_08436158[];

extern u8 Img_084361B0[];
extern u8 Img_084362B0[];
extern u8 Img_084363A4[];
extern u8 Img_08436408[];

void LoadModeSelectChapterGfx(s32 index)
{
    u8 * gUnk_084393E4[3][4] = {
        {
            Img_08435C64,
            Img_08435D54,
            Img_08435E44,
            Img_08435EA8,
        },
        {
            Img_08435F00,
            Img_08436000,
            Img_084360F4,
            Img_08436158,
        },
        {
            Img_084361B0,
            Img_084362B0,
            Img_084363A4,
            Img_08436408,
        },
    };

    Decompress(gUnk_084393E4[index][0], (void *)0x60102C0);
    Decompress(gUnk_084393E4[index][1], (void *)0x60106C0);
    Decompress(gUnk_084393E4[index][2], (void *)0x6010AC0);
    Decompress(gUnk_084393E4[index][3], (void *)0x6010EC0);

    return;
}

void sub_80A8774(s32 palId)
{
    s32 i;

    u16 * palIt = gPal + (palId + 0xd) * 0x10 + 0x101;

    for (i = 0; i < 0xf; i++)
    {
        gUnk_0201E9F4[i + palId * 0xf] = *palIt++;
    }

    return;
}

void sub_80A87A4(s32 palId, s32 amt)
{
    s32 i;

    u16 * r5 = (gPal + (palId + 0xd) * 0x10 + 0x101);

    if (amt > 0x40)
    {
        amt = 0x40;
    }

    amt = amt + (gUnk_Savemenu_02000001 - 10) * 2;

    for (i = 0; i < 0xf; i++)
    {
        s32 accum = 0;
        s32 r;
        s32 g;
        s32 b;

        r = (amt * (gUnk_0201E9F4[i + palId * 0xf] & (0x1f << 0))) >> 6;

        if (r <= 0x1f)
        {
            if (r < 0)
                r = 0;

            accum += r & 0x1f;
        }
        else
            accum += 0x1f;

        g = (amt * (gUnk_0201E9F4[i + palId * 0xf] & 0x3e0)) >> 6;

        if (g <= 0x3e0)
        {
            if (g < 0)
                g = 0;

            accum += g & 0x3e0;
        }
        else
            accum += 0x3e0;

        b = (amt * (gUnk_0201E9F4[i + palId * 0xf] & 0x7c00)) >> 6;

        if (b <= 0x7c00)
        {
            if (b < 0)
                b = 0;

            *r5 = accum + (b & 0x7c00);
        }
        else
        {
            *r5 = accum + 0x7c00;
        }

        r5++;
    }

    EnablePalSync();

    return;
}

void sub_80A8850(s32 palId, s32 b)
{
    s32 b_ = (b & 0xff);
    s32 tmp = (((b_ >= 0x81) ? b_ - 0x80 : 0x80 - b_) * 0x30 >> 7);
    sub_80A87A4(palId, tmp + 0x10);

    return;
}

void ModeSelectSpriteDraw_Init(struct ModeSelectSpriteDrawProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_3e = 0;
    proc->unk_3c = 0;
    proc->unk_34 = 120;
    proc->unk_38 = 160;
    proc->unk_40 = 0;
    proc->unk_44 = 0;
    proc->unk_3c = 0;
    proc->unk_48 = 0;
    proc->unk_4c = 0;
    proc->unk_2c = 0;
    proc->unk_4e = 0;

    return;
}

void ModeSelectSpriteDraw_Loop(struct ModeSelectSpriteDrawProc * proc)
{
    s32 i;

    if (proc->unk_3c != 0)
    {
        for (i = 0; i < proc->unk_40; i++)
        {
            s32 angle = ((proc->unk_3e >> 4) + i * proc->unk_44 + 0x28);
            s32 x = (proc->unk_34 << 0xc) + (SIN_Q12(angle) * 0x46);
            s32 y = (((proc->unk_38 << 0xc) + (COS_Q12(angle) * 0x1c)) >> 0xc) - 0x10;

            sub_80555F8(&gUnk_0201E8D4[i], x >> 0xc, y);

            sub_80A8850(i, (proc->unk_3e >> 4) + i * proc->unk_44);
        }
    }

    BgAffinRotScaling(2, proc->unk_3e, 0, 0, 0x160, 0x160);
    BgAffinScaling(2, 0x280, 0x100);
    BgAffinAnchoring(2, proc->unk_34, proc->unk_38, 0x4c, 0x4c);

    gUnk_Savemenu_02000001 = sub_80A95B4(8, 8, 0x10, 0x10, proc->unk_48);

    if (proc->unk_4c == 0)
    {
        proc->unk_48 += 8;

        if (proc->unk_48 >= 0x400)
        {
            proc->unk_4c = 1;
        }
    }
    else
    {
        proc->unk_48 -= 8;

        if (proc->unk_48 <= 0)
        {
            proc->unk_4c = 0;
        }
    }

    if (proc->unk_4e & 2)
    {
        DisplayFrozenUiHandExt(108, (proc->unk_4d & 1) * 16 + 56, 0xbc0);
    }
    else
    {
        DisplayUiHandExt(108, proc->unk_4d * 16 + 56, 0xbc0);
    }

    PutSpriteExt(0xd, 0, 8, Sprite_ModeSelect_Mode, OAM2_PAL(11));
    PutSpriteExt(0xd, 20, 28, Sprite_ModeSelect_Select, OAM2_PAL(11));
    PutSpriteExt(0xd, 40, 64, Sprite_ModeSelect_Change, OAM2_PAL(11));

    if ((proc->unk_2c >> 2 & 1) == 0)
    {
        PutSpriteExt(0xd, 8, 130, Sprite_ModeSelect_PressStart, OAM2_PAL(11));
    }

    if (proc->unk_2c != 0)
    {
        proc->unk_2c++;
    }

    PutSpriteExt(0xd, 108, 24, Sprite_ModeSelect_ChapterRange, OAM2_PAL(10));

    sub_80A8304(proc->unk_30);
    proc->unk_30++;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ModeSelectSpriteDraw[] =
{
    PROC_CALL(ModeSelectSpriteDraw_Init),
    PROC_YIELD,

    PROC_REPEAT(ModeSelectSpriteDraw_Loop),

    PROC_END,
};

// clang-format on

void sub_80A8A90(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_2c = 1;
    }

    return;
}

void sub_80A8AAC(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_3c = 1;
    }

    return;
}

void sub_80A8AC8(s32 arg_0)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_40 = arg_0;
        proc->unk_44 = 0x100 / arg_0;
    }

    return;
}

void sub_80A8AF0(s32 arg_0, s32 arg_1)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_34 = arg_0;
        proc->unk_38 = arg_1;
    }

    gUnk_Savemenu_02000000 = arg_1 - 60;

    return;
}

void sub_80A8B1C(u16 arg_0)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_3e = arg_0;
    }

    return;
}

void sub_80A8B38(u8 arg_0, u8 arg_1)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_4d = arg_0;
        proc->unk_4e = arg_1;
    }

    return;
}

s32 sub_80A8B60(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);
    return proc->unk_44;
}

void sub_80A8B74(struct UnkProc * proc, s32 arg_1, s32 arg_2)
{
    if (proc != NULL)
    {
        proc->unk_34 = arg_1;
        proc->unk_36 = arg_2;
    }

    return;
}

void ModeSelect_InitGfxMaybe(struct ModeSelectProc * proc)
{
    if (proc->unk_42 & 1)
    {
        sub_80A5B44();
    }

    return;
}

struct FaceVramEnt CONST_DATA FaceConfig_ModeSelect[] = {
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
};

void ModeSelect_Init(struct ModeSelectProc * proc)
{
    s32 i;

    ApplySystemObjectsGraphics();

    SetBgOffset(1, 8, -8);

    Proc_BlockEachMarked(0xC);
    Proc_BlockEachMarked(0xD);

    gUnk_Savemenu_02000000 = 100;

    SetFaceConfig(FaceConfig_ModeSelect);

    ApplyPalette(Pal_ModeSelect_Menu, 0xF);

    Decompress(Img_ModeSelect_Menu, (void *)(0x6000000 + GetBgChrOffset(1)));
    TmApplyTsa_thm(gBg0Tm, Tsa_ModeSelect_Menu, 0);
    TmApplyTsa_thm(gBg1Tm, Tsa_084352FC, 0xf000); // this loads the "claw menu" and bg of the chapters
    ApplyPalette(Pal_08434448, 0x1B);

    Decompress(Img_ModeSelect_Sprites, (void *)0x6010000);
    ApplyPalette(Pal_ModeSelect_Sprites, 0x1A);

    NewEfxAnimeDrvProc();
    sub_80647C8();

    proc->unk_38 = Proc_Start(ProcScr_ModeSelectSpriteDraw, proc);
    sub_80A8AF0(0, 0x70);

    proc->unk_41 = 0;
    proc->activeLordCount = 0;

    proc->unk_40 = sub_809F40C();

    if ((proc->unk_42 & 1) != 0)
    {
        s32 gUnk_08439414[] = {
            4,
            0x10,
        };

        proc->activeLordCount = 2;
        proc->unk_49[0] = 1;
        proc->unk_49[1] = 2;

        for (i = 0; i < proc->activeLordCount; i++)
        {
            if ((gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            {
                if ((proc->unk_40 & gUnk_08439414[i]))
                    proc->unk_43[i] = 1;
                else
                    proc->unk_43[i] = 0;
            }
            else
            {
                proc->unk_43[i] = 0;
            }
        }
    }
    else
    {
        proc->unk_49[0] = 0;
        proc->activeLordCount++;

        if ((proc->unk_40 & 2) != 0)
        {
            proc->unk_49[proc->activeLordCount] = 1;
            proc->activeLordCount++;
        }

        if ((proc->unk_40 & 8) != 0)
        {
            proc->unk_49[proc->activeLordCount] = 2;
            proc->activeLordCount++;
        }

        for (i = 0; i < proc->activeLordCount; i++)
        {
            proc->unk_43[i] = 0;
        }
    }

    sub_80A8AC8(proc->activeLordCount);
    InitModeSelectAnims(proc->activeLordCount, proc->unk_49);

    for (i = 0; i < proc->activeLordCount; i++)
    {
        sub_80A8774(i);
    }

    sub_80A8AAC();
    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0xd20, 9);
    LoadUiSpinningArrowGfx(0, 0xd20, 9);
    SetUiSpinningArrowPositions(30, 61, 68, 61);
    SetUiSpinningArrowConfig(3);

    InitTextFont(&gUnk_020000A4.font, (void *)0x600E000, 0x100, 0xe);

    InitText(&gUnk_020000A4.text[0], 5);
    InitText(&gUnk_020000A4.text[1], 9);
    InitText(&gUnk_020000A4.text[2], 5);
    InitText(&gUnk_020000A4.text[3], 8);
    InitText(&gUnk_020000A4.text[4], 2);
    InitText(&gUnk_020000A4.text[5], 4);
    InitText(&gUnk_020000A4.text[6], 5);

    proc->unk_30 = proc->unk_41 * sub_80A8B60() * 0x10;

    proc->pFaceProc = StartModeSelectFace(proc->unk_49[proc->unk_41]);
    PutModeSelectLabelText();
    PutModeSelectCharacterText(proc->unk_49[proc->unk_41]);
    PutModeSelectDifficultyText(proc);
    sub_80A8B38(proc->unk_43[proc->unk_41], proc->unk_42);
    sub_80A8B1C(proc->unk_30);

    EnableBgSync(3);

    proc->rotateTimer = 0;
    proc->unk_50 = 0;

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin0Box(0, 0x50, 0xf0, 0x50);
    SetWOutLayers(0, 0, 0, 0, 0);

    LoadModeSelectChapterGfx(proc->unk_49[proc->unk_41]);

    SetObjAffineAuto(0, 0, 0x100, 0x100);

    return;
}

void ModeSelect_TransitionSplitOpen(struct ModeSelectProc * proc)
{
    s32 tmp;
    s32 unk_2c;

    unk_2c = proc->rotateTimer + 1;
    proc->rotateTimer = unk_2c;

    SetDispEnable(1, 1, 1, 1, 1);

    tmp = 0x48 - (((0x10 - unk_2c) * 0x48) * (0x10 - unk_2c) / 256);

    SetWin0Box(0, 0x50 - tmp, 0xf0, (tmp) + 0x50);

    if (unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

void ModeSelect_TransitionSplitClose(struct ModeSelectProc * proc)
{
    s32 tmp;
    s32 timer;

    timer = proc->rotateTimer + 1;
    proc->rotateTimer = timer;

    tmp = 0x48 - (((0x10 - timer) * 0x48) * (0x10 - timer) / 256);

    SetWin0Box(0, tmp + 8, 0xf0, -0x68 - (tmp));

    if (timer == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

void sub_80A9034(struct ModeSelectProc * proc)
{
    s32 i;

    for (i = 0; i < proc->activeLordCount; i++)
    {
        sub_8055644(&gUnk_0201E8D4[i]);
    }

    proc->unk_50 = 0;

    return;
}

void sub_80A9064(struct ModeSelectProc * proc, s32 arg_1)
{
    proc->unk_43[proc->unk_41] = arg_1;

    PutModeSelectDifficultyText(proc);
    sub_80A8B38(arg_1, proc->unk_42);

    return;
}

void ModeSelect_Loop_KeyHandler(struct ModeSelectProc * proc)
{
    if (((gpKeySt->repeated & DPAD_UP) != 0) && (proc->unk_43[proc->unk_41]) == 1)
    {
        PlaySoundEffect(0x386);
        sub_80A9064(proc, 0);
        return;
    }

    if ((gpKeySt->repeated & DPAD_DOWN) != 0)
    {
        if (proc->unk_43[proc->unk_41] == 0)
        {
            if ((proc->unk_49[proc->unk_41] == 0) && ((proc->unk_40 & 1) == 0))
            {
                PlaySoundEffect(0x38c);
                return;
            }

            if ((proc->unk_49[proc->unk_41] == 1) && ((proc->unk_40 & 4) == 0))
            {
                PlaySoundEffect(0x38c);
                return;
            }

            if ((proc->unk_49[proc->unk_41] == 2) && ((proc->unk_40 & 0x10) == 0))
            {
                PlaySoundEffect(0x38c);
                return;
            }

            PlaySoundEffect(0x386);
            sub_80A9064(proc, 1);

            return;
        }
    }

    if ((gpKeySt->held & (DPAD_LEFT | L_BUTTON)) != 0)
    {
        Proc_Goto(proc, 1);

        SetUiSpinningArrowFastMaybe(0);

        PlaySoundEffect(0x387);

        sub_80A9034(proc);

        return;
    }

    if ((gpKeySt->held & (DPAD_RIGHT | R_BUTTON)) != 0)
    {
        Proc_Goto(proc, 2);

        SetUiSpinningArrowFastMaybe(1);

        PlaySoundEffect(0x387);

        sub_80A9034(proc);

        return;
    }

    if ((gpKeySt->pressed & (START_BUTTON | A_BUTTON)) != 0)
    {
        proc->rotateTimer = 0;

        PlaySoundEffect(0x38a);

        Proc_Goto(proc, 3);

        gUnk_0201E8D4[proc->unk_41].roundType = 0;
        sub_8055474(&gUnk_0201E8D4[proc->unk_41]);

        if ((proc->unk_42 & 1) != 0)
        {
            if (proc->unk_41 == 0)
            {
                gPlaySt.chapterModeIndex = 2;
            }

            if (proc->unk_41 == 1)
            {
                gPlaySt.chapterModeIndex = 3;
            }

            if (proc->unk_43[proc->unk_41] != 0)
            {
                gPlaySt.chapterStateBits |= PLAY_FLAG_HARD;
            }
            else
            {
                gPlaySt.chapterStateBits &= ~PLAY_FLAG_HARD;
            }
        }
        else
        {
            sub_80A5B20(proc->unk_49[proc->unk_41], proc->unk_43[proc->unk_41]);
            sub_80A8B38(proc->unk_43[proc->unk_41], proc->unk_42 | 2);
        }

        sub_80A8A90();
        return;
    }

    if (((gpKeySt->pressed & B_BUTTON) != 0) && ((proc->unk_42 & 1) == 0))
    {
        proc->rotateTimer = 0;
        PlaySoundEffect(0x38b);

        Proc_Goto(proc, 4);
        sub_80A5B20(3, 0);
    }

    proc->unk_50++;

    if ((proc->unk_50 & 0x1ff) == 0x20)
    {
        gUnk_0201E8D4[proc->unk_41].roundType = 2;
        sub_8055474(&gUnk_0201E8D4[proc->unk_41]);
    }

    if ((proc->unk_50 & 0x1ff) != 0x80)
    {
        return;
    }

    sub_8055644(&gUnk_0201E8D4[proc->unk_41]);

    return;
}

void ModeSelect_RotateRight(struct ModeSelectProc * proc)
{
    proc->unk_34 = -1;
    proc->rotateTimer = 0;

    StartFaceFadeOut(proc->pFaceProc);

    if (proc->unk_41 == 0)
    {
        proc->unk_41 = proc->activeLordCount - 1;
    }
    else
    {
        proc->unk_41--;
    }

    proc->unk_32 = (0x100 - sub_80A8B60() * proc->unk_41) << 4;

    sub_80A9064(proc, proc->unk_43[proc->unk_41]);

    if (proc->unk_32 < proc->unk_30)
    {
        proc->unk_32 += 0x1000;
    }

    return;
}

void ModeSelect_RotateLeft(struct ModeSelectProc * proc)
{
    proc->unk_34 = 1;
    proc->rotateTimer = 0;

    StartFaceFadeOut(proc->pFaceProc);

    if (proc->unk_41 < (proc->activeLordCount - 1))
    {
        proc->unk_41++;
    }
    else
    {
        proc->unk_41 = 0;
    }

    proc->unk_32 = (0x100 - sub_80A8B60() * proc->unk_41) << 4;

    sub_80A9064(proc, proc->unk_43[proc->unk_41]);

    if (proc->unk_32 > proc->unk_30)
    {
        proc->unk_30 += 0x1000;
    }

    return;
}

void ModeSelect_Loop_RotateCarousel(struct ModeSelectProc * proc)
{
    s32 a;
    s32 b;
    s32 c;
    u16 d;
    s32 r9;

    a = (proc->unk_32 - proc->unk_30) * proc->unk_34;
    r9 = 0x100;
    proc->rotateTimer++;

    b = a >> 2;

    c = b * (0x1e - proc->rotateTimer) * (0x1e - proc->rotateTimer) / 900;
    d = (proc->unk_30 + proc->unk_34 * 4 * (b - c));

    if (proc->rotateTimer == 0xd)
    {
        LoadModeSelectChapterGfx(proc->unk_49[proc->unk_41]);
    }

    if (proc->rotateTimer == 0xe)
    {
        proc->pFaceProc = StartModeSelectFace(proc->unk_49[proc->unk_41]);
    }

    if (proc->rotateTimer == 0x14)
    {
        PutModeSelectCharacterText(proc->unk_49[proc->unk_41]);
    }

    if (proc->rotateTimer == 0x1e)
    {
        d = proc->unk_32 & 0xfff;
        proc->unk_30 = proc->unk_32 & 0xfff;
        Proc_Break(proc);
    }

    SetObjAffineAuto(0, 0, r9, r9);

    sub_80A8B1C(d);

    return;
}

void ModeSelect_End(struct ModeSelectProc * proc)
{
    EndModeSelectAnims(proc->activeLordCount);
    EndEfxAnimeDrvProc();
    EndFaceById(0);

    if (!(proc->unk_42 & 1))
    {
        StartBgmVolumeChange(0x100, 0xc0, 0x10, 0);
    }
    else
    {
        SetOnHBlankA(NULL);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ModeSelect[] =
{
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,

    PROC_CALL(ModeSelect_InitGfxMaybe),
    PROC_YIELD,

    PROC_CALL(ModeSelect_Init),
    PROC_YIELD,

    PROC_REPEAT(ModeSelect_TransitionSplitOpen),

PROC_LABEL(0),
    PROC_REPEAT(ModeSelect_Loop_KeyHandler),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(ModeSelect_RotateLeft),
    PROC_REPEAT(ModeSelect_Loop_RotateCarousel),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(ModeSelect_RotateRight),
    PROC_REPEAT(ModeSelect_Loop_RotateCarousel),

    PROC_GOTO(0),

PROC_LABEL(3),
    PROC_SLEEP(60),

PROC_LABEL(4),
    PROC_REPEAT(ModeSelect_TransitionSplitClose),

    PROC_CALL(ModeSelect_End),

    PROC_END,
};

// clang-format on

void sub_80A9578(ProcPtr parent)
{
    struct ModeSelectProc * proc = Proc_StartBlocking(ProcScr_ModeSelect, parent);
    proc->unk_42 = 0;
    return;
}

void StartModeSelect(ProcPtr parent)
{
    if (sub_809F40C() > 7)
    {
        struct ModeSelectProc * proc = Proc_StartBlocking(ProcScr_ModeSelect, parent);
        proc->unk_42 = 1;
    }

    return;
}
