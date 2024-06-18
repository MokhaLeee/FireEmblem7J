#include "gbafe.h"

void sub_80A5B44(void)
{
    InitBgs(BgConfig_SaveMenu);

    gDispIo.disp_ct.mode = DISPCNT_MODE_1;
    gDispIo.bg2_ct.size = BGCNT_SIZE_AFF256x256; /* in mode1, bg2 is not reg but *aff* */
    gDispIo.bg2_ct.wrap = false;

    gDispIo.bg0_ct.priority = 3;
    gDispIo.bg1_ct.priority = 0;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 2;

    EndAllMus();

    SetDispEnable(0, 0, 0, 0, 0);

    gUnk_Savemenu_02000001 = 10;
    gUnk_Savemenu_02000000 = 100;

    SetOnHBlankA(SaveMenuOnHBlank);

    ApplyPalettes(Pal_SaveMenuWindow, OBJPAL_SAVEMENU_WINDOW + 0x10, 8);
    ApplyPalettes(Pal_SaveMenuBackground, BGPAL_SAVEMENU_BG, 3);

    Decompress(Img_MuralBackground, (void *)BG_VRAM + GetBgChrOffset(BG_0));
    TmApplyTsa(gBg0Tm, Tsa_SaveMenuBackground, 0);

    Decompress(Img_SpinRotation, (void *)BG_VRAM + GetBgChrOffset(BG_2));
    sub_8001F14(gBg3Tm, Tsa_SpinRotation, 0, 5);

    EnableBgSync(BG3_SYNC_BIT);
}
