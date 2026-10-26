#include "gbafe.h"

void ApplyUiWindowFramePal(int palid)
{
    if (palid < 0)
        palid = BGPAL_WINDOWFRAME;

    ApplyPalette(gUiWindowFramePalLut[gPlaySt.config_window_theme], palid);
}

void UnpackUiWindowFrameImg(void * vram)
{
    if (vram == NULL)
        vram = (void *) VRAM + CHR_SIZE * BGCHR_WINDOWFRAME;

    Decompress(gUiWindowFrameImgLut[gPlaySt.config_window_theme], vram);
}

void ApplyUiStatBarPal(int palid)
{
    if (palid < 0)
        palid = BGPAL_UI_STATBAR;

    ApplyPalette(gUiStatBarPalLut[gPlaySt.config_window_theme], palid);
}

void UnpackUiWindowFrameGraphics2(int window_theme)
{
    void * buf;
    u32 len;

    if (window_theme < 0)
        window_theme = gPlaySt.config_window_theme;

    len = GetDataSize(gUiWindowFrameImgLut[window_theme]);
    buf = gBuf + ARRAY_COUNT(gBuf) - (len / sizeof (* gBuf));

    Decompress(gUiWindowFrameImgLut[window_theme], buf);
    RegisterVramMove(buf, CHR_SIZE * BGCHR_WINDOWFRAME, len);

    ApplyUiWindowFramePal(-1);
}

void PutUiWindowFrame(u16 * tm, int x, int y, int width, int height, int tilebase, int window_kind)
{
    u16 const * model = gUiWindowFrameModelLut[window_kind];

    int x_max = x + width - 1;
    int y_max = y + height - 1;

    int ix, iy;

    for (iy = y + 1; iy < y_max; iy += 2)
    {
        for (ix = x + 1; ix < x_max; ix += 2)
        {
            u16 offset = TM_OFFSET(ix, iy);

            tm[offset + TM_OFFSET(0, 0)] = model[5] + tilebase;
            tm[offset + TM_OFFSET(1, 0)] = model[6] + tilebase;
            tm[offset + TM_OFFSET(0, 1)] = model[9] + tilebase;
            tm[offset + TM_OFFSET(1, 1)] = model[10] + tilebase;
        }
    }

    for (ix = x + 1; ix < x_max; ix += 2)
    {
        tm[TM_OFFSET(ix + 0, y)] = model[1] + tilebase;
        tm[TM_OFFSET(ix + 1, y)] = model[2] + tilebase;
        tm[TM_OFFSET(ix + 0, y_max)] = model[13] + tilebase;
        tm[TM_OFFSET(ix + 1, y_max)] = model[14] + tilebase;
    }

    for (iy = y + 1; iy < y_max; iy += 2)
    {
        tm[TM_OFFSET(x, iy + 0)] = model[4] + tilebase;
        tm[TM_OFFSET(x_max, iy + 0)] = model[7] + tilebase;
        tm[TM_OFFSET(x, iy + 1)] = model[8] + tilebase;
        tm[TM_OFFSET(x_max, iy + 1)] = model[11] + tilebase;
    }

    tm[TM_OFFSET(x, y)] = model[0] + tilebase;
    tm[TM_OFFSET(x_max, y)] = model[3] + tilebase;
    tm[TM_OFFSET(x, y_max)] = model[12] + tilebase;
    tm[TM_OFFSET(x_max, y_max)] = model[15] + tilebase;
}

void DrawUiFrame2(int x, int y, int width, int height, int window_kind)
{
    u16 offset;
    u16 const * model = gUiWindowFrameModelLut[window_kind];

    int x_max = x + width - 1;
    int y_max = y + height - 1;

    int ix, iy;

    for (iy = y + 1; iy < y_max; iy += 2)
    {
        for (ix = x + 1; ix < x_max; ix += 2)
        {
            offset = TM_OFFSET(ix, iy);

            gBg0Tm[offset] = 0;
            gBg1Tm[offset] = model[5];

            offset += TM_OFFSET(1, 0);

            gBg0Tm[offset] = 0;
            gBg1Tm[offset] = model[6];

            offset += TM_OFFSET(-1, 1);

            gBg0Tm[offset] = 0;
            gBg1Tm[offset] = model[9];

            offset += TM_OFFSET(1, 0);

            gBg0Tm[offset] = 0;
            gBg1Tm[offset] = model[10];
        }
    }

    for (ix = x + 1; ix < x_max; ix += 2)
    {
        gBg0Tm[TM_OFFSET(ix + 0, y)] = 0;
        gBg1Tm[TM_OFFSET(ix + 0, y)] = model[1];

        gBg0Tm[TM_OFFSET(ix + 1, y)] = 0;
        gBg1Tm[TM_OFFSET(ix + 1, y)] = model[2];

        gBg0Tm[TM_OFFSET(ix + 0, y_max)] = 0;
        gBg1Tm[TM_OFFSET(ix + 0, y_max)] = model[13];

        gBg0Tm[TM_OFFSET(ix + 1, y_max)] = 0;
        gBg1Tm[TM_OFFSET(ix + 1, y_max)] = model[14];
    }

    for (iy = y + 1; iy < y_max; iy += 2)
    {
        gBg0Tm[TM_OFFSET(x, iy + 0)] = 0;
        gBg1Tm[TM_OFFSET(x, iy + 0)] = model[4];

        gBg0Tm[TM_OFFSET(x_max, iy + 0)] = 0;
        gBg1Tm[TM_OFFSET(x_max, iy + 0)] = model[7];

        gBg0Tm[TM_OFFSET(x, iy + 1)] = 0;
        gBg1Tm[TM_OFFSET(x, iy + 1)] = model[8];

        gBg0Tm[TM_OFFSET(x_max, iy + 1)] = 0;
        gBg1Tm[TM_OFFSET(x_max, iy + 1)] = model[11];
    }

    gBg0Tm[TM_OFFSET(x, y)] = 0;
    gBg0Tm[TM_OFFSET(x_max, y)] = 0;
    gBg0Tm[TM_OFFSET(x, y_max)] = 0;
    gBg0Tm[TM_OFFSET(x_max, y_max)] = 0;

    gBg1Tm[TM_OFFSET(x, y)] = model[0];
    gBg1Tm[TM_OFFSET(x_max, y)] = model[3];
    gBg1Tm[TM_OFFSET(x, y_max)] = model[12];
    gBg1Tm[TM_OFFSET(x_max, y_max)] = model[15];

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PutUiHand(int x, int y)
{
    if ((GetGameTime() - 1) == sPrevHandClock)
    {
        x = (x + sPrevHandPosition.x) >> 1;
        y = (y + sPrevHandPosition.y) >> 1;
    }

    sPrevHandPosition.x = x;
    sPrevHandPosition.y = y;
    sPrevHandClock = GetGameTime();

    x += (sHandXOffsetLut[GetGameTime() % ARRAY_COUNT(sHandXOffsetLut)] - 14);
    PutSprite(2, x, y, Sprite_UiHand, 0);
}

void PutUnkUiHand(int x, int y)
{
    x += (sHandXOffsetLut[GetGameTime() % ARRAY_COUNT(sHandXOffsetLut)] - 14);
    PutSprite(2, x, y, Sprite_UiHand, 0);
}

void DisplayFrozenUiHand(int x, int y)
{
    x -= 12;
    PutSprite(3, x, y, Sprite_UiHand, 0);
}

int GetUiHandPrevX(void)
{
    return sPrevHandPosition.x;
}

int GetUiHandPrevY(void)
{
    return sPrevHandPosition.y;
}

void ClearUi(void)
{
    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void DrawUiItemHover(int x, int y, int width)
{
    int x_max = x + width - 1;
    y += 1;

    gBg1Tm[TM_OFFSET(x, y)] = TILEREF(0x6A, BGPAL_WINDOWFRAME);

    for (x += 1; x < x_max; x++)
        gBg1Tm[TM_OFFSET(x, y)] = TILEREF(0x76, BGPAL_WINDOWFRAME);

    gBg1Tm[TM_OFFSET(x, y)] = TILEREF(0x6B, BGPAL_WINDOWFRAME);

    EnableBgSync(BG1_SYNC_BIT);
}

void ClearUiItemHover(int x, int y, int width)
{
    int x_max = x + width - 1;
    y += 1;

    for (; x < x_max; x += 2)
    {
        gBg1Tm[TM_OFFSET(x + 0, y)] = gUiItemHoverModel[6];
        gBg1Tm[TM_OFFSET(x + 1, y)] = gUiItemHoverModel[7];
    }

    gBg1Tm[TM_OFFSET(x_max, y)] = (width % 2)
        ? gUiItemHoverModel[6]
        : gUiItemHoverModel[7];

    EnableBgSync(BG1_SYNC_BIT);
}

void sub_804A930(void * vram, int palid, int palcount)
{
    Decompress(gUnk_081DD7F4, vram);
    ApplyPalettes(gUnk_081DDA48, palid, palcount);
}

void DisplayUiHandExt(s32 x, s32 y, u32 objTileOffset)
{
    if ((GetGameTime() - 1) == sPrevHandClock)
    {
        x = (x + sPrevHandPosition.x) >> 1;
        y = (y + sPrevHandPosition.y) >> 1;
    }

    sPrevHandPosition.x = x;
    sPrevHandPosition.y = y;
    sPrevHandClock = GetGameTime();

    x += (sHandXOffsetLut[GetGameTime() % ARRAY_COUNT(sHandXOffsetLut)] - 14);
    PutSprite(2, x, y, Sprite_UiHand, objTileOffset << 15 >> 20);
}

void DisplayFrozenUiHandExt(s32 x, s32 y, u32 objTileOffset)
{
    x -= 12;
    PutSprite(3, x, y, Sprite_UiHand, objTileOffset << 15 >> 20);
}

void UnpackUiWindowFrameGraphics(void)
{
    UnpackUiWindowFrameImg(NULL);
    ApplyUiWindowFramePal(-1);
}
