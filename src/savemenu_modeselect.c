#include "gbafe.h"

struct ModeSelectProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ s32 unk_2c;
    /* 30 */ u16 unk_30;
    /* 32 */ u16 unk_32;
    /* 34 */ s32 unk_34;
    /* 38 */ void * unk_38;
    /* 3C */ void * unk_3c; // pFaceProc
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u8 unk_42;
    /* 43 */ u8 unk_43[3];
    /* 46 */ STRUCT_PAD(0x46, 0x49);
    /* 49 */ u8 unk_49[3];
    /* 4C */ u8 unk_4c;
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

extern struct AnimBuffer gUnk_0201E8D4[];

struct AnimMagicFxBuffer
{
    /* 00 */ u16 magic_func_idx;
    /* 02 */ u16 x_offset_bg;
    /* 04 */ u16 y_offset_bg;
    /* 06 */ u16 x_offset_obj;
    /* 08 */ u16 y_offset_obj;
    /* 0A */ u16 bg_chr;
    /* 0C */ u16 bg_pal_id;
    /* 0E */ u16 obj_chr;
    /* 10 */ u16 obj_pal_id;
    /* 12 */ u16 bg;
    /* 14 */ u16 * bg_tm_buf;
    /* 18 */ void * bg_img_buf;
    /* 1C */ void * bg_tsa_buf;
    /* 20 */ void * obj_img_buf;
    /* 24 */ void (*reset_callback)(void);
};

extern struct AnimMagicFxBuffer gUnk_0201E97C[];

s32 sub_809F40C(void);
void sub_80A9CAC(s32);
s32 sub_80A8B60(void);
void sub_80A9034(struct ModeSelectProc *);
void sub_80A8618(struct ModeSelectProc *);
void sub_8055474(struct AnimBuffer *);

void sub_80A5B20(s32, s32);
void sub_80A8B38(u8, u8);
void sub_80A8A90(void);
void sub_8055644(struct AnimBuffer *);
void sub_80046C4(s32); // Proc_LockEachMarked
void sub_8055670(void);
void sub_80647C8(void);
void sub_80A8AF0(s32, s32);
s32 sub_809F40C(void);
void sub_80A8AC8(s32);
void sub_80A838C(s32, u8 *);
void sub_80A8774(s32);
void sub_80A8AAC(void);
void sub_80A9BE8(ProcPtr);
void sub_80A9BFC(s32, s32, s32);
void sub_80A9C84(s32, s32, s32, s32);
void sub_80A9C68(s32);

void * sub_80A86D4(s32);

void sub_80A84FC(void);

void sub_80A870C(s32);
void sub_80A856C(s32);
void sub_80A8B1C(u16);
void sub_80A84D8(s32);
void sub_8055690(void); // EndEfxAnimeDrvProc
void sub_80A5B44(void);

void sub_804A95C(s32 x, s32 y, u32 objTileOffset); // DisplayUiHandExt
void sub_804A9D0(s32 x, s32 y, u32 objTileOffset); // DisplayFrozenUiHandExt
void sub_80555F8(struct AnimBuffer *, s16, s16);
void sub_80A8850(s32, s32);
void sub_80A8304(s32);
void sub_80A87A4(s32, s32);
void sub_80556D8(struct AnimBuffer *);
void sub_80556B0(struct AnimBuffer *);

extern u8 gUnk_Savemenu_02000000;

extern u8 gUnk_08434DD0[]; // img
extern u16 gUnk_084352DC[]; // pal
extern u8 gUnk_08434468[]; // tsa

extern u8 gUnk_084352FC[]; // tsa
extern u16 gUnk_08434448[]; // pal
extern u8 gUnk_08433CC8[]; // img
extern u16 gUnk_08436460[]; // pal

struct Unk_020000A4
{
    struct Font unk_00;
    struct Text unk_18[7];
};
extern struct Unk_020000A4 gUnk_020000A4;

extern u16 gUnk_0201E9F4[];

u8 * CONST_DATA gUnk_08DADFF8[] =
{
    (u8 *)0x020000F4,
    (u8 *)0x020020F4,
    (u8 *)0x020040F4,
};

u8 * CONST_DATA gUnk_08DAE004[] =
{
    (u8 *)0x020060F4,
    (u8 *)0x0200B8F4,
    (u8 *)0x020110F4,
};

u8 * CONST_DATA gUnk_08DAE010[] =
{
    (u8 *)0x020168F4,
    (u8 *)0x02016994,
    (u8 *)0x02016A34,
};

u8 * CONST_DATA gUnk_08DAE01C[] =
{
    (u8 *)0x02016AD4,
    (u8 *)0x020194D4,
    (u8 *)0x0201BED4,
};

u16 CONST_DATA gUnk_08DAE028[] =
{
    4,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0x40),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x44),
};

u16 CONST_DATA gUnk_08DAE042[] =
{
    6,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x8),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0xC),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(64), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0x60),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x64),
    OAM0_SHAPE_8x8 + OAM0_Y(16), OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x68),
};

u16 CONST_DATA gUnk_08DAE068[] =
{
    5,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x11),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8, OAM2_CHR(0x49),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x31),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x4D),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(64), OAM2_CHR(0x55),
};

u16 CONST_DATA gUnk_08DAE088[] =
{
    1,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x51),
};

u16 CONST_DATA gUnk_08DAE090[] =
{
    4,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16, OAM2_CHR(0x16),
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x1A),
    OAM0_SHAPE_16x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x1E),
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(80), OAM2_CHR(0x56),
};


void sub_80A838C(s32 count, u8 * arg_1)
{
    s32 gUnk_08439348[] = {
        0x0E,
        0x00,
        0x06,
    };

    s32 i;

    for (i = 0; i < count; i++)
    {
        gUnk_0201E8D4[i].xPos = 0x140;
        gUnk_0201E8D4[i].yPos = 0x58;
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

        sub_80556B0(&gUnk_0201E8D4[i]);
    }

    return;
}

const char gUnk_08439354[] = "使用武器：";
const char gUnk_08439360[] = "";
const char gUnk_08439364[] = "主人公：";
const char gUnk_08439370[] = "斧";
const char gUnk_08439374[] = "オスティア侯弟";
const char gUnk_08439384[] = "ヘクトル";
const char gUnk_08439390[] = "フェレ侯公子";
const char gUnk_084393A0[] = "エリウッド";
const char gUnk_084393AC[] = "剣";
const char gUnk_084393B0[] = "サカの剣士";
const char gUnk_084393BC[] = "リン";

const char * CONST_DATA gUnk_08DAE0AC[][3] =
{
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

void sub_80A84D8(s32 count)
{
    s32 i;

    for (i = 0; i < count; i++)
    {
        sub_80556D8(&gUnk_0201E8D4[i]);
    }

    return;
}

void sub_80A84FC(void)
{
    ClearText(&gUnk_020000A4.unk_18[5]);
    ClearText(&gUnk_020000A4.unk_18[6]);

    PutDrawText(&gUnk_020000A4.unk_18[5], gBg1Tm + 0x14E, 0, 0, 0, gUnk_08DAE0AC[3][0]);
    PutDrawText(&gUnk_020000A4.unk_18[6], gBg1Tm + 0x1CE, 0, 0, 0, gUnk_08DAE0AC[3][2]);

    EnableBgSync(2);

    return;
}

void sub_80A856C(s32 index)
{
    ClearText(&gUnk_020000A4.unk_18[2]);
    ClearText(&gUnk_020000A4.unk_18[3]);
    ClearText(&gUnk_020000A4.unk_18[4]);

    PutDrawText(&gUnk_020000A4.unk_18[2], gBg1Tm + 0x152, 2, 0, 0, gUnk_08DAE0AC[index][0]);
    PutDrawText(&gUnk_020000A4.unk_18[3], gBg1Tm + 0x18E, 2, 0, 0, gUnk_08DAE0AC[index][1]);
    PutDrawText(&gUnk_020000A4.unk_18[4], gBg1Tm + 0x1D3, 2, 0, 0, gUnk_08DAE0AC[index][2]);

    EnableBgSync(2);

    return;
}

void sub_80A8618(struct ModeSelectProc * proc)
{
    s32 unk = proc->unk_43[proc->unk_41];

    ClearText(&gUnk_020000A4.unk_18[0]);
    ClearText(&gUnk_020000A4.unk_18[1]);

    PutDrawText(&gUnk_020000A4.unk_18[0], gBg1Tm + 0xcf, unk == 0 ? 3 : 1, 0, 0, "ノーマル");

    EnableBgSync(2);

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

    PutDrawText(&gUnk_020000A4.unk_18[1], gBg1Tm + 0x10F, unk == 1 ? 3 : 1, 0, 0, "ハード");

    return;
}

void * sub_80A86D4(s32 index)
{
    s32 gUnk_084393D8[3] = {
        0x16,
        0x02,
        0x0C,
    };

    struct FaceProc * pFaceProc = StartBmFace(0, gUnk_084393D8[index], 0xcc, 0x48, 0x42);
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

void sub_80A870C(s32 index)
{
    void * gUnk_084393E4[3][4] = {
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

#if NONMATCHING

/* https://decomp.me/scratch/n2sFX */

void sub_80A87A4(s32 param_1, s32 param_2)
{
    s32 i;

    u16 * r5 = (gPal + (param_1 + 0xd) * 0x10 + 0x101);

    if (param_2 > 0x40)
    {
        param_2 = 0x40;
    }

    param_2 = param_2 + (gUnk_Savemenu_02000001 - 10) * 2;

    for (i = 0; i < 0xf; i++)
    {
        s32 accum = 0;
        s32 r;
        s32 g;
        s32 b;

        r = (param_2 * (gUnk_0201E9F4[i + param_1 * 0xf] & (0x1f << 0))) >> 6;

        if (r <= 0x1f)
        {
            if (r < 0)
                r = 0;

            accum += r & 0x1f;
        }
        else
            accum += 0x1f;

        g = (param_2 * (gUnk_0201E9F4[i + param_1 * 0xf] & 0x3e0)) >> 6;

        if (g <= 0x3e0)
        {
            if (g < 0)
                g = 0;

            accum += g & 0x3e0;
        }
        else
            accum += 0x3e0;

        b = (param_2 * (gUnk_0201E9F4[i + param_1 * 0xf] & 0x7c00)) >> 6;

        if (b <= 0x7c00)
        {
            if (b < 0)
                b = 0;

            accum += b & 0x7c00;
        }
        else
        {
            accum += 0x7c00;
        }

        *r5 = accum;
        r5++;
    }

    EnablePalSync();

    return;
}

#else

NAKEDFUNC
void sub_80A87A4(s32 param_1, s32 param_2)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r2, r0, #0\n\
        adds r4, r1, #0\n\
        adds r0, #0xd\n\
        lsls r0, r0, #5\n\
        ldr r1, _080A87EC @ =gPal + 0x202\n\
        adds r5, r0, r1\n\
        cmp r4, #0x40\n\
        ble _080A87B8\n\
        movs r4, #0x40\n\
    _080A87B8:\n\
        ldr r0, _080A87F0 @ =gUnk_Savemenu_02000001\n\
        ldrb r0, [r0]\n\
        subs r0, #0xa\n\
        lsls r0, r0, #1\n\
        adds r4, r4, r0\n\
        lsls r0, r2, #4\n\
        ldr r1, _080A87F4 @ =0x0201E9F4\n\
        subs r0, r0, r2\n\
        movs r2, #0x1f\n\
        mov ip, r2\n\
        lsls r0, r0, #1\n\
        adds r3, r0, r1\n\
        movs r6, #0xe\n\
    _080A87D2:\n\
        mov r0, ip\n\
        ldrh r7, [r3]\n\
        ands r0, r7\n\
        muls r0, r4, r0\n\
        asrs r0, r0, #6\n\
        cmp r0, #0x1f\n\
        bgt _080A87F8\n\
        cmp r0, #0\n\
        bge _080A87E6\n\
        movs r0, #0\n\
    _080A87E6:\n\
        mov r1, ip\n\
        ands r1, r0\n\
        b _080A87FA\n\
        .align 2, 0\n\
    _080A87EC: .4byte gPal + 0x202\n\
    _080A87F0: .4byte gUnk_Savemenu_02000001\n\
    _080A87F4: .4byte 0x0201E9F4\n\
    _080A87F8:\n\
        movs r1, #0x1f\n\
    _080A87FA:\n\
        movs r2, #0xf8\n\
        lsls r2, r2, #2\n\
        adds r0, r2, #0\n\
        ldrh r7, [r3]\n\
        ands r0, r7\n\
        muls r0, r4, r0\n\
        asrs r0, r0, #6\n\
        cmp r0, r2\n\
        bgt _080A8818\n\
        cmp r0, #0\n\
        bge _080A8812\n\
        movs r0, #0\n\
    _080A8812:\n\
        ands r0, r2\n\
        adds r1, r1, r0\n\
        b _080A881A\n\
    _080A8818:\n\
        adds r1, r1, r2\n\
    _080A881A:\n\
        movs r2, #0xf8\n\
        lsls r2, r2, #7\n\
        adds r0, r2, #0\n\
        ldrh r7, [r3]\n\
        ands r0, r7\n\
        muls r0, r4, r0\n\
        asrs r0, r0, #6\n\
        cmp r0, r2\n\
        bgt _080A8838\n\
        cmp r0, #0\n\
        bge _080A8832\n\
        movs r0, #0\n\
    _080A8832:\n\
        ands r0, r2\n\
        adds r0, r1, r0\n\
        b _080A883A\n\
    _080A8838:\n\
        adds r0, r1, r2\n\
    _080A883A:\n\
        strh r0, [r5]\n\
        adds r5, #2\n\
        adds r3, #2\n\
        subs r6, #1\n\
        cmp r6, #0\n\
        bge _080A87D2\n\
        bl EnablePalSync\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif

void sub_80A8850(s32 palId, s32 b)
{
    s32 b_ = (b & 0xff);
    s32 tmp = (((b_ >= 0x81) ? b_ - 0x80 : 0x80 - b_) * 0x30 >> 7);
    sub_80A87A4(palId, tmp + 0x10);

    return;
}

void sub_80A8880(struct ModeSelectSpriteDrawProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_3e = 0;
    proc->unk_3c = 0;
    proc->unk_34 = 0x78;
    proc->unk_38 = 0xa0;
    proc->unk_40 = 0;
    proc->unk_44 = 0;
    proc->unk_3c = 0;
    proc->unk_48 = 0;
    proc->unk_4c = 0;
    proc->unk_2c = 0;
    proc->unk_4e = 0;

    return;
}

void sub_80A88B8(struct ModeSelectSpriteDrawProc * proc)
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
        sub_804A9D0(0x6c, (proc->unk_4d & 1) * 0x10 + 0x38, 0xbc0);
    }
    else
    {
        sub_804A95C(0x6c, proc->unk_4d * 0x10 + 0x38, 0xbc0);
    }

    PutSpriteExt(0xd, 0, 8, gUnk_08DAE028, 0xb000);
    PutSpriteExt(0xd, 0x14, 0x1c, gUnk_08DAE042, 0xb000);
    PutSpriteExt(0xd, 0x28, 0x40, gUnk_08DAE088, 0xb000);

    if ((proc->unk_2c >> 2 & 1) == 0)
    {
        PutSpriteExt(0xd, 8, 0x82, gUnk_08DAE068, 0xb000);
    }

    if (proc->unk_2c != 0)
    {
        proc->unk_2c++;
    }

    PutSpriteExt(0xd, 0x6c, 0x18, gUnk_08DAE090, 0xa000);

    sub_80A8304(proc->unk_30);
    proc->unk_30++;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnk_08DAE0DC[] =
{
    PROC_CALL(sub_80A8880),
    PROC_YIELD,

    PROC_REPEAT(sub_80A88B8),

    PROC_END,
};

// clang-format on

void sub_80A8A90(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(gUnk_08DAE0DC);

    if (proc != NULL)
    {
        proc->unk_2c = 1;
    }

    return;
}

void sub_80A8AAC(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(gUnk_08DAE0DC);

    if (proc != NULL)
    {
        proc->unk_3c = 1;
    }

    return;
}

void sub_80A8AC8(s32 arg_0)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(gUnk_08DAE0DC);

    if (proc != NULL)
    {
        proc->unk_40 = arg_0;
        proc->unk_44 = 0x100 / arg_0;
    }

    return;
}

void sub_80A8AF0(s32 arg_0, s32 arg_1)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(gUnk_08DAE0DC);

    if (proc != NULL)
    {
        proc->unk_34 = arg_0;
        proc->unk_38 = arg_1;
    }

    gUnk_Savemenu_02000000 = arg_1 - 0x3c;

    return;
}

void sub_80A8B1C(u16 arg_0)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(gUnk_08DAE0DC);

    if (proc != NULL)
    {
        proc->unk_3e = arg_0;
    }

    return;
}

void sub_80A8B38(u8 arg_0, u8 arg_1)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(gUnk_08DAE0DC);

    if (proc != NULL)
    {
        proc->unk_4d = arg_0;
        proc->unk_4e = arg_1;
    }

    return;
}

s32 sub_80A8B60(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(gUnk_08DAE0DC);
    return proc->unk_44;
}

struct UnkProc
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x34);
    s16 unk_34;
    s16 unk_36;
};

void sub_80A8B74(struct UnkProc * proc, s32 arg_1, s32 arg_2)
{
    if (proc != 0)
    {
        proc->unk_34 = arg_1;
        proc->unk_36 = arg_2;
    }

    return;
}

void sub_80A8B80(struct ModeSelectProc * proc)
{
    if (proc->unk_42 & 1)
    {
        sub_80A5B44();
    }

    return;
}

struct FaceVramEnt CONST_DATA gUnk_08DAE0FC[] =
{
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

void sub_80A8B98(struct ModeSelectProc * proc)
{
    s32 i;

    ApplySystemObjectsGraphics();

    SetBgOffset(1, 8, -8);

    sub_80046C4(0xC);
    sub_80046C4(0xD);

    gUnk_Savemenu_02000000 = 100;

    SetFaceConfig(gUnk_08DAE0FC);

    ApplyPaletteExt(gUnk_084352DC, 0x1e0, 0x20);

    Decompress(gUnk_08434DD0, (void *)(0x6000000 + GetBgChrOffset(1)));
    TmApplyTsa_thm(gBg0Tm, gUnk_08434468, 0);
    TmApplyTsa_thm(gBg1Tm, gUnk_084352FC, 0xf000); // this loads the "claw menu" and bg of the chapters
    ApplyPaletteExt(gUnk_08434448, 0x360, 0x20);

    Decompress(gUnk_08433CC8, (void *)0x6010000);
    ApplyPaletteExt(gUnk_08436460, 0x340, 0x20);

    sub_8055670();
    sub_80647C8();

    proc->unk_38 = Proc_Start(gUnk_08DAE0DC, proc);
    sub_80A8AF0(0, 0x70);

    proc->unk_41 = 0;
    proc->unk_4c = 0;

    proc->unk_40 = sub_809F40C();

    if ((proc->unk_42 & 1) != 0)
    {
        s32 gUnk_08439414[] = {
            4,
            0x10,
        };

        proc->unk_4c = 2;
        proc->unk_49[0] = 1;
        proc->unk_49[1] = 2;

        for (i = 0; i < proc->unk_4c; i++)
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
        proc->unk_4c++;

        if ((proc->unk_40 & 2) != 0)
        {
            proc->unk_49[proc->unk_4c] = 1;
            proc->unk_4c++;
        }

        if ((proc->unk_40 & 8) != 0)
        {
            proc->unk_49[proc->unk_4c] = 2;
            proc->unk_4c++;
        }

        for (i = 0; i < proc->unk_4c; i++)
        {
            proc->unk_43[i] = 0;
        }
    }

    sub_80A8AC8(proc->unk_4c);
    sub_80A838C(proc->unk_4c, proc->unk_49);

    for (i = 0; i < proc->unk_4c; i++)
    {
        sub_80A8774(i);
    }

    sub_80A8AAC();
    sub_80A9BE8(proc);
    sub_80A9BFC(0, 0xd20, 9);
    sub_80A9BFC(0, 0xd20, 9);
    sub_80A9C84(30, 61, 68, 61);
    sub_80A9C68(3);

    InitTextFont(&gUnk_020000A4.unk_00, (void *)0x600E000, 0x100, 0xe);

    InitText(&gUnk_020000A4.unk_18[0], 5);
    InitText(&gUnk_020000A4.unk_18[1], 9);
    InitText(&gUnk_020000A4.unk_18[2], 5);
    InitText(&gUnk_020000A4.unk_18[3], 8);
    InitText(&gUnk_020000A4.unk_18[4], 2);
    InitText(&gUnk_020000A4.unk_18[5], 4);
    InitText(&gUnk_020000A4.unk_18[6], 5);

    proc->unk_30 = proc->unk_41 * sub_80A8B60() * 0x10;

    proc->unk_3c = (void *)sub_80A86D4(proc->unk_49[proc->unk_41]);
    sub_80A84FC();
    sub_80A856C(proc->unk_49[proc->unk_41]);
    sub_80A8618(proc);
    sub_80A8B38(proc->unk_43[proc->unk_41], proc->unk_42);
    sub_80A8B1C(proc->unk_30);

    EnableBgSync(3);

    proc->unk_2c = 0;
    proc->unk_50 = 0;

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin0Box(0, 0x50, 0xf0, 0x50);
    SetWOutLayers(0, 0, 0, 0, 0);

    sub_80A870C(proc->unk_49[proc->unk_41]);

    // clang-format off
    SetObjAffine(
        0,
        Div(+COS_Q12(0) * 16, 0x100),
        Div(-SIN_Q12(0) * 16, 0x100),
        Div(+SIN_Q12(0) * 16, 0x100),
        Div(+COS_Q12(0) * 16, 0x100)
    );
    // clang-format on

    return;
}

void sub_80A8F68(struct ModeSelectProc * proc)
{
    s32 tmp;
    s32 unk_2c;

    unk_2c = proc->unk_2c + 1;
    proc->unk_2c = unk_2c;

    SetDispEnable(1, 1, 1, 1, 1);

    tmp = 0x48 - (((0x10 - unk_2c) * 0x48) * (0x10 - unk_2c) / 256);

    SetWin0Box(0, 0x50 - tmp, 0xf0, (tmp) + 0x50);

    if (unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

void sub_80A8FD8(struct ModeSelectProc * proc)
{
    s32 tmp;
    s32 unk_2c;

    unk_2c = proc->unk_2c + 1;
    proc->unk_2c = unk_2c;

    tmp = 0x48 - (((0x10 - unk_2c) * 0x48) * (0x10 - unk_2c) / 256);

    SetWin0Box(0, tmp + 8, 0xf0, -0x68 - (tmp));

    if (unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

void sub_80A9034(struct ModeSelectProc * proc)
{
    s32 i;

    for (i = 0; i < proc->unk_4c; i++)
    {
        sub_8055644(&gUnk_0201E8D4[i]);
    }

    proc->unk_50 = 0;

    return;
}

void sub_80A9064(struct ModeSelectProc * proc, s32 arg_1)
{
    proc->unk_43[proc->unk_41] = arg_1;

    sub_80A8618(proc);
    sub_80A8B38(arg_1, proc->unk_42);

    return;
}

void sub_80A9090(struct ModeSelectProc * proc)
{
    if (((gpKeySt->repeated & 0x40) != 0) && (proc->unk_43[proc->unk_41]) == 1)
    {
        PlaySoundEffect(0x386);
        sub_80A9064(proc, 0);
        return;
    }

    if ((gpKeySt->repeated & 0x80) != 0)
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

    if ((gpKeySt->held & 0x220) != 0)
    {
        Proc_Goto(proc, 1);

        sub_80A9CAC(0);

        PlaySoundEffect(0x387);

        sub_80A9034(proc);

        return;
    }

    if ((gpKeySt->held & 0x110) != 0)
    {
        Proc_Goto(proc, 2);

        sub_80A9CAC(1);

        PlaySoundEffect(0x387);

        sub_80A9034(proc);

        return;
    }

    if ((gpKeySt->pressed & 9) != 0)
    {
        proc->unk_2c = 0;

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
                gPlaySt.chapterStateBits |= 0x40;
            }
            else
            {
                gPlaySt.chapterStateBits &= 0xbf;
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

    if (((gpKeySt->pressed & 2) != 0) && ((proc->unk_42 & 1) == 0))
    {
        proc->unk_2c = 0;
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

void sub_80A9338(struct ModeSelectProc * proc)
{
    proc->unk_34 = -1;
    proc->unk_2c = 0;

    StartFaceFadeOut(proc->unk_3c);

    if (proc->unk_41 == 0)
    {
        proc->unk_41 = proc->unk_4c - 1;
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

void sub_80A93A0(struct ModeSelectProc * proc)
{
    proc->unk_34 = 1;
    proc->unk_2c = 0;

    StartFaceFadeOut(proc->unk_3c);

    if (proc->unk_41 < (proc->unk_4c - 1))
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

void sub_80A940C(struct ModeSelectProc * proc)
{
    s32 a;
    s32 b;
    s32 c;
    u16 d;
    s32 r9;

    a = (proc->unk_32 - proc->unk_30) * proc->unk_34;
    r9 = 0x100;
    proc->unk_2c++;

    b = a >> 2;

    c = b * (0x1e - proc->unk_2c) * (0x1e - proc->unk_2c) / 900;
    d = (proc->unk_30 + proc->unk_34 * 4 * (b - c));

    if (proc->unk_2c == 0xd)
    {
        sub_80A870C(proc->unk_49[proc->unk_41]);
    }

    if (proc->unk_2c == 0xe)
    {
        proc->unk_3c = sub_80A86D4(proc->unk_49[proc->unk_41]);
    }

    if (proc->unk_2c == 0x14)
    {
        sub_80A856C(proc->unk_49[proc->unk_41]);
    }

    if (proc->unk_2c == 0x1e)
    {
        d = proc->unk_32 & 0xfff;
        proc->unk_30 = proc->unk_32 & 0xfff;
        Proc_Break(proc);
    }

    SetObjAffineAuto(0, 0, r9, r9);

    sub_80A8B1C(d);

    return;
}

void sub_80A9538(struct ModeSelectProc * proc)
{
    sub_80A84D8(proc->unk_4c);
    sub_8055690();
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

struct ProcCmd CONST_DATA ProcScr_DifficultyMenuSprites[] = {
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,
    PROC_CALL(sub_80A8B80),
    PROC_YIELD,
    PROC_CALL(sub_80A8B98),
    PROC_YIELD,
    PROC_REPEAT(sub_80A8F68),
PROC_LABEL(0),
    PROC_REPEAT(sub_80A9090),
PROC_LABEL(1),
    PROC_CALL(sub_80A93A0),
    PROC_REPEAT(sub_80A940C),
    PROC_GOTO(0),
PROC_LABEL(2),
    PROC_CALL(sub_80A9338),
    PROC_REPEAT(sub_80A940C),
    PROC_GOTO(0),
PROC_LABEL(3),
    PROC_SLEEP(60),
PROC_LABEL(4),
    PROC_REPEAT(sub_80A8FD8),
    PROC_CALL(sub_80A9538),
    PROC_END,
};

// clang-format on

void sub_80A9578(ProcPtr parent)
{
    struct ModeSelectProc * proc = Proc_StartBlocking(ProcScr_DifficultyMenuSprites, parent);
    proc->unk_42 = 0;
    return;
}

void StartDrawDifficultyMenuSprites(ProcPtr parent)
{
    if (sub_809F40C() > 7)
    {
        struct ModeSelectProc * proc = Proc_StartBlocking(ProcScr_DifficultyMenuSprites, parent);
        proc->unk_42 = 1;
    }

    return;
}