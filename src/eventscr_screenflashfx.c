#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_ScreenFlashing[] = {
    PROC_YIELD,
    PROC_CALL(ScreenFlash_Init),
    PROC_REPEAT(ScreenFlash_FadeIn),
    PROC_REPEAT(ScreenFlash_FadeOut),
    PROC_END,
};

void ScreenFlash_Init(struct ProcScreenFlashing * proc)
{
    proc->timer = 0;
    ArchiveCurrentPalettes();
}

void ScreenFlash_FadeIn(struct ProcScreenFlashing * proc)
{
    int r, b, g;
    proc->timer += proc->speed_fadein;

    if (proc->timer < 0x100)
    {
        r = (((0x100 - proc->timer) * 0x100) + proc->timer * proc->r) / 0x100;
        g = (((0x100 - proc->timer) * 0x100) + proc->timer * proc->g) / 0x100;
        b = (((0x100 - proc->timer) * 0x100) + proc->timer * proc->b) / 0x100;
    }
    else
    {
        r = (proc->r * (0x200 - proc->timer) + ((proc->timer - 0x100) * 0x100)) / 0x100;
        g = (proc->g * (0x200 - proc->timer) + ((proc->timer - 0x100) * 0x100)) / 0x100;
        b = (proc->b * (0x200 - proc->timer) + ((proc->timer - 0x100) * 0x100)) / 0x100;
    }

    WriteFadedPaletteFromArchive(r, g, b, proc->mask);

    if (proc->timer == 0x100)
    {
        proc->duration--;

        if (proc->duration < 1)
        {
            proc->timer = 0;
            Proc_Break(proc);
        }
    }
    else if (proc->timer == 0x200)
        proc->timer = 0;
}

void ScreenFlash_FadeOut(struct ProcScreenFlashing * proc)
{
    proc->timer += proc->speed_fadeout;

    WriteFadedPaletteFromArchive(
        ((0x100 - proc->timer) * proc->r + (proc->timer * 0x100)) / 0x100,
        ((0x100 - proc->timer) * proc->g + (proc->timer * 0x100)) / 0x100,
        ((0x100 - proc->timer) * proc->b + (proc->timer * 0x100)) / 0x100,
        proc->mask
    );

    if (proc->timer == 0x100)
        Proc_Break(proc);
}

void StartScreenFlashing(int mask, int duration, int speed_fadein, int speed_fadeout, int r, int g, int b, ProcPtr parent)
{
    struct ProcScreenFlashing * proc = Proc_StartBlocking(ProcScr_ScreenFlashing, parent);

    proc->duration = duration;
    proc->mask = mask;
    proc->speed_fadein  = speed_fadein;
    proc->speed_fadeout = speed_fadeout;
    proc->r = r;
    proc->g = g;
    proc->b = b;
}
