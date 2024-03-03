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
