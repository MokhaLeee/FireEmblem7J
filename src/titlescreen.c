#include "gbafe.h"

void HBlank_TitleScreen(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount >= DISPLAY_HEIGHT)
        vcount = 0;

    REG_BG0VOFS = -((1 & vcount) + vcount / 2);
}

void ResetTitleBgAffin(u8 bg)
{
    struct BgAffineSrcData data;
    struct BgAffineDstData * dst;

    data.texX = 0;
    data.texY = 0;
    data.scrX = 0;
    data.scrY = 0;
    data.sx = 0x100;
    data.sy = 0x100;
    data.alpha = 0;

    dst = &gDispIo.bg3affin;
    if (bg == BG_2)
        dst = &gDispIo.bg2affin;

    BgAffineSet(&data, dst, 1);
}
