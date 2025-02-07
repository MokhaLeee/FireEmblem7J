#include "gbafe.h"

u16 CONST_DATA Sprite_08D8C4EC[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x380) + OAM2_LAYER(1) + OAM2_PAL(7),
};

u16 CONST_DATA Sprite_08D8C4F4[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x3C0) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x3C4) + OAM2_LAYER(1) + OAM2_PAL(7),
};

u16 CONST_DATA Sprite_08D8C502[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_VFLIP, OAM2_CHR(0x398) + OAM2_LAYER(1) + OAM2_PAL(6),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32) + OAM1_VFLIP, OAM2_CHR(0x39C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

u16 CONST_DATA Sprite_08D8C510[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32) + OAM1_HFLIP, OAM2_CHR(0x398) + OAM2_LAYER(1) + OAM2_PAL(6),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(0x39C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

u16 CONST_DATA Sprite_08D8C51E[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x398) + OAM2_LAYER(1) + OAM2_PAL(6),
};

u16 CONST_DATA Sprite_08D8C526[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x39C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

u16 CONST_DATA Sprite_08D8C52E[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_LAYER(1),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(32), OAM2_CHR(0x4) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C53C[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xF) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C544[] =
{
    4,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_LAYER(1) + OAM2_PAL(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(16), OAM2_CHR(0x1) + OAM2_LAYER(1) + OAM2_PAL(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(32), OAM2_CHR(0x1) + OAM2_LAYER(1) + OAM2_PAL(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(48), OAM2_CHR(0xE) + OAM2_LAYER(1) + OAM2_PAL(1),
};

u16 CONST_DATA Sprite_08D8C55E[] =
{
    4,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_LAYER(1) + OAM2_PAL(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(16), OAM2_CHR(0x1) + OAM2_LAYER(1) + OAM2_PAL(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(32), OAM2_CHR(0x1) + OAM2_LAYER(1) + OAM2_PAL(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(48), OAM2_CHR(0x10) + OAM2_LAYER(1) + OAM2_PAL(1),
};

u16 CONST_DATA Sprite_08D8C578[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x5) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C580[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x6) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C588[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x7) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C590[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x8) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C598[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x9) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C5A0[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xA) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C5A8[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xB) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C5B0[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xC) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C5B8[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xD) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C5C0[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xE) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C5C8[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x11) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C5D0[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x10) + OAM2_LAYER(1),
};

u16 CONST_DATA *Sprites_08D8C5D8[] =
{
    Sprite_08D8C578,
    Sprite_08D8C580,
    Sprite_08D8C588,
    Sprite_08D8C590,
    Sprite_08D8C598,
    Sprite_08D8C5A0,
    Sprite_08D8C5A8,
    Sprite_08D8C5B0,
    Sprite_08D8C5B8,
    Sprite_08D8C5C0,
    Sprite_08D8C5C8,
    Sprite_08D8C5D0
};

u16 CONST_DATA Sprite_08D8C608[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_BLEND, OAM1_SIZE_32x32, OAM2_CHR(0x240) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08D8C610[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16, OAM2_CHR(0x24E) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x252) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x256) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(96), OAM2_CHR(0x25A) + OAM2_LAYER(3),
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_X(128), OAM2_CHR(0x25E) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08D8C630[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x29B) + OAM2_LAYER(1),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(32), OAM2_CHR(0x29F) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08D8C63E[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_BLEND, OAM1_SIZE_32x32, OAM2_CHR(0x80) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08D8C646[] =
{
    3,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x94) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(72), OAM2_CHR(0x98) + OAM2_LAYER(3),
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_X(104), OAM2_CHR(0x9C) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08D8C65A[] =
{
    4,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x94) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0xC4) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(80), OAM2_CHR(0xC8) + OAM2_LAYER(3),
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_X(112), OAM2_CHR(0xCC) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08D8C674[] =
{
    4,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16, OAM2_CHR(0x84) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x88) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8C) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(96), OAM2_CHR(0x90) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08D8C68E[] =
{
    2,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0x94) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(88), OAM2_CHR(0xCE) + OAM2_LAYER(3),
};

u16 CONST_DATA *Sprites_08D8C69C[] =
{
    Sprite_08D8C646,
    Sprite_08D8C65A,
    Sprite_08D8C674,
    Sprite_08D8C68E
};

struct ProcCmd CONST_DATA ProcScr_PrepSpecialCharEff[] = {
    PROC_YIELD,
    PROC_CALL(ProcPrepSpChar_OnInit),
    PROC_SET_END_CB(ProcPrepSpChar_OnEnd),
    PROC_REPEAT(ProcPrepSpChar_Idle),
    PROC_END,
};

void sub_8090148(int xOam1, int yOam0, int config, u16 oam2)
{
    int val;

    if (config & 1) {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 0x02, yOam0 + 0x02, Sprite_08D8C55E, oam2);
        PutSpriteExt(4, xOam1 + 0x38, yOam0 + 0x00, Sprites_08D8C5D8[10], oam2);
    } else {
        PutSpriteExt(4, xOam1 + 0x02, yOam0 + 0x02, Sprite_08D8C544, oam2);
        PutSpriteExt(4, xOam1 + 0x38, yOam0 + 0x00, Sprite_08D8C53C, oam2);
    }

    PutSpriteExt(4, xOam1, yOam0, Sprite_08D8C52E, oam2);

    val = config >> 1;
    if (val < 10)
        PutSpriteExt(4, xOam1 + 0x28, yOam0, Sprites_08D8C5D8[11], oam2);
    else
        PutSpriteExt(4, xOam1 + 0x28, yOam0, Sprites_08D8C5D8[val / 10], oam2);

    PutSpriteExt(4, xOam1 + 0x30, yOam0, Sprites_08D8C5D8[val % 10], oam2);
}

void PrepScreenSprite_OnDraw(struct ProcPrepSpecialChar *proc)
{
    if (!CheckInLinkArena()) {
        int i;

        if (proc->config != 0)
            sub_8090148(0x70, 4, proc->config, 0x6380);

        for (i = 0; i < 3; i++)
            PutSpriteExt(4, 0x80 + i * 0x20, 0x14, Sprite_32x16, 0xB680 + i * 4);

        if (proc->blink_n || (1 & (proc->timer >> 2)))
            PutSpriteExt(4, 6, 0x80, Sprite_08D8CDBC, 0x0300);
    } else
        PutSpriteExt(4, 6, 0x80, Sprite_08D8CDD0, 0x0300);
}

void nullsub_77(void) {}

void ProcPrepSpChar_OnInit(struct ProcPrepSpecialChar *proc)
{
    proc->unk_2A = 0;
    proc->timer = 0;

    ForceSyncUnitSpriteSheet();

    if (CheckInLinkArena())
        proc->approc = StartSpriteAnimProc(SpriteAnim_0841ECD0, 0x78, 0x418, 0x2E40, 1, 0xD);
    else {
        proc->approc = StartSpriteAnimProc(SpriteAnim_0841ECD0, 0x78, 0x418, 0x2E40, 0, 0xD);
        proc->config = GetChapterInfo(gPlaySt.chapterIndex)->prepScreenNumber[gPlaySt.chapterModeIndex != 3 ? 0 : 1];
    }

    proc->unk_2B = 0;
    proc->blink_n = true;
}

void ProcPrepSpChar_Idle(struct ProcPrepSpecialChar *proc)
{
    PrepScreenSprite_OnDraw(proc);
    proc->timer++;
}

void ProcPrepSpChar_OnEnd(struct ProcPrepSpecialChar *proc)
{
    EndSpriteAnimProc(proc->approc);
}

void PrepSpecialChar_BlinkButtonStart(void)
{
    struct ProcPrepSpecialChar *proc = Proc_Find(ProcScr_PrepSpecialCharEff);

    if (proc)
        proc->blink_n = false;
}

ProcPtr StartPrepSpecialCharEffect(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_PrepSpecialCharEff));
    return Proc_Start(ProcScr_PrepSpecialCharEff, parent);
}

void EndPrepSpecialCharEffect(void)
{
    Proc_End(Proc_Find(ProcScr_PrepSpecialCharEff));
}
