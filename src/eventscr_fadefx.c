#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_EventFadefx[] = {
    PROC_YIELD,
    PROC_CALL(EventFadefx_Init),
    PROC_REPEAT(EventFadefx_Loop),
    PROC_END,
};

void EventFadefx_Init(struct ProcEventFade * proc)
{
    proc->timer = 0;
}

void EventFadefx_Loop(struct ProcEventFade * proc)
{
    int ref, r, g, b;

    proc->timer += proc->speed;
    if (proc->timer >= 0x100)
    {
        Proc_Break(proc);
        proc->timer = 0x100;
    }

    ref = 0x100 - proc->timer;

    r = (proc->r0 * (0x100 - proc->timer) + proc->r1 * proc->timer) / 0x100;
    g = (proc->g0 * (0x100 - proc->timer) + proc->g1 * proc->timer) / 0x100;
    b = (proc->b0 * (0x100 - proc->timer) + proc->b1 * proc->timer) / 0x100;

    WriteFadedPaletteFromArchive(r, g, b, proc->mask);
}

void NewEventFadefx(u32 mask, int speed, int r, int g, int b, ProcPtr parent)
{
    struct ProcEventFade * proc;
    int _speed;

    proc = Proc_StartBlocking(ProcScr_EventFadefx, parent);

    _speed = speed & 0xFF;
    if (_speed == 0x80)
        _speed = 0x100;

    proc->speed = _speed;

    proc->r0 = GetPalFadeStClkEnd1();
    proc->g0 = GetPalFadeStClkEnd2();
    proc->b0 = GetPalFadeStClkEnd3();

    proc->mask = mask;

    proc->r1 = r;
    proc->g1 = g;
    proc->b1 = b;
}

int EventE7_FadeSteps(struct EventProc * proc)
{
    struct ProcNinianAppear * procfx;
    u32 mask  = proc->script[1];
    int speed = proc->script[2];

    /* todo: add macro on color */
    int r = (proc->script[3] >> 00) & 0x3FF;
    int g = (proc->script[3] >> 10) & 0x3FF;
    int b = (proc->script[3] >> 20) & 0x3FF;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    NewEventFadefx(mask, speed, r, g, b, proc);
    return EVENT_CMDRET_YIELD;
}

int EventE6_StartFade(struct EventProc * proc)
{
    ArchiveCurrentPalettes();
    return EVENT_CMDRET_YIELD;
}

int EventE7_EndFade(struct EventProc * proc)
{
    WriteFadedPaletteFromArchive(0x100, 0x100, 0x100, -1);
    return EVENT_CMDRET_YIELD;
}
