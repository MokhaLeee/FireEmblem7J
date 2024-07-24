#include "gbafe.h"

// 0x1C941C
const char SwingSwordName_Unused[] = "重さ";

struct ProcCmd CONST_DATA ProcScr_SwingSwordfx[] = {
    PROC_CALL(SwingSwordfx_Init),
    PROC_SLEEP(6),
    PROC_REPEAT(SwingSwordfx_Loop),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(SwingSwordfx_End),
    PROC_END,
};

void SwingSwordfx_Init(struct ProcBmFx * proc)
{
    int i;
    for (i = 0x21; i <= 0x2F; i++)
        gPal[i] = RGB_WHITE;

    gPal[0] = RGB_WHITE;

    EnablePalSync();
    proc->timer = 0;
}

void SwingSwordfx_Loop(struct ProcBmFx * proc)
{
    int i;
    u16 pals[] = {
        RGB_WHITE, RGB_WHITE, RGB_WHITE, RGB_WHITE,
        RGB_WHITE, RGB_WHITE, RGB_WHITE, RGB_WHITE,
        RGB_WHITE, RGB_WHITE, RGB_WHITE, RGB_WHITE,
        RGB_WHITE, RGB_WHITE, RGB_WHITE, RGB_WHITE,
        RGB_WHITE, RGB_WHITE, RGB_WHITE,
        RGB(27, 27, 31),
        RGB(23, 23, 31),
        RGB(15, 15, 31),
        RGB(8, 8, 31),
        RGB(5, 5, 21),
        RGB(2, 2, 10),
        RGB_BLACK, RGB_BLACK, RGB_BLACK,
        RGB_BLACK, RGB_BLACK, RGB_BLACK, RGB_BLACK,
        RGB_BLACK, RGB_BLACK, RGB_BLACK, RGB_BLACK,
        RGB_BLACK, RGB_BLACK, RGB_BLACK, RGB_BLACK,
    };

    gPal[0] = 0;

    for (i = 1; i <= 0xF; i++)
    {
        gPal[0x30 - i] = pals[proc->timer + i - 1];
    }

    EnablePalSync();

    proc->timer += 3;
    if (proc->timer > 12)
        Proc_Break(proc);
}

void SwingSwordfx_End(struct ProcBmFx * proc)
{
    SetDispEnable(1, 1, 1, 1, 1);
    ClearUi();
}

void StartSwingSwordfx(ProcPtr proc)
{
    Decompress(Img_SwingSword, (void *)BG_VRAM + 0x5000);
    ApplyPalette(Pal_SwingSword, 2);
    Decompress(Tsa_SwingSword, gBuf);
    TmApplyTsa(gBg0Tm + 2, gBuf, 0x2280);
    EnableBgSync(BG0_SYNC_BIT);

    SetDispEnable(1, 0, 0, 0, 0);
    SetBlendBrighten(0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    Proc_StartBlocking(ProcScr_SwingSwordfx, proc);
}
