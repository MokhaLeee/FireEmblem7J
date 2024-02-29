#include "gbafe.h"

/* sub_8085618 in FE8U */
void EventQuakefxHorizon_ViolentLoop(struct Proc * procfx)
{
    struct ProcEventQuakeHandler * proc;
    proc = procfx->proc_parent;
    if (-1 == proc->quake_type)
    {
        if (GetGameTime() % 2)
            gBmSt.camera.x ^= 2;
    } else
    {
        if (GetGameTime() % 2)
            SetBgOffset(BG_3, GetGameTime() & 2, 0);
    }
}

void EventQuakefxHorizon_SlightLoop(struct Proc * procfx)
{
    struct ProcEventQuakeHandler * proc;
    proc = procfx->proc_parent;
    if (-1 == proc->quake_type)
    {
        if (GetGameTime() % 2)
        {
            ((u16)gBmSt.camera.x) &= ~2;
            gBmSt.camera.x ^= 1;
        }
    } else
    {
        if (GetGameTime() % 2)
            SetBgOffset(BG_3, GetBgXOffset(BG_3) ^ 1, 0);
    }
}

void EventQuakefxVeritical_Loop(struct Proc * procfx)
{
    struct ProcEventQuakeHandler * proc;
    proc = procfx->proc_parent;
    if (0x61 == proc->quake_type)
    {
        if (GetGameTime() % 2)
        {
            SetBgOffset(BG_3, GetGameTime() & 1, 0);
        }
    }
    else
    {
        if (GetGameTime() % 2)
        {
            (u16)gBmSt.camera.y &= 0xFFFD;
            gBmSt.camera.y ^= 1;
        }
    }
}

struct ProcCmd CONST_DATA ProcScr_EventHorizontalQuakefx[] = {
    PROC_YIELD,
PROC_LABEL(0),
    PROC_REPEAT(EventQuakefxHorizon_ViolentLoop),
PROC_LABEL(1),
    PROC_REPEAT(EventQuakefxHorizon_SlightLoop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_EventVerticalQuakefx[] = {
    PROC_YIELD,
    PROC_REPEAT(EventQuakefxVeritical_Loop),
    PROC_END,
};

void StartEventVeriticalQuakefx(struct ProcEventQuakeHandler * parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventVerticalQuakefx);
    if (!proc)
        proc = Proc_Start(ProcScr_EventVerticalQuakefx, parent);

    Proc_Goto(proc, 0);
    PlaySoundEffect(0x26A);
}

void StartEventHorizontalQuakefxViolently(struct ProcEventQuakeHandler * parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
    {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 0);
}

void StartEventHorizontalQuakefxSlightly(struct ProcEventQuakeHandler * parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
    {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 1);
}

void StartEventHorizontalQuakefxViolentlyNoSound(struct ProcEventQuakeHandler * parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
    {
        // PlaySoundEffect(0x26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 0);
}

void StartEventHorizontalQuakefxSlightlyNoSound(struct ProcEventQuakeHandler * parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
    {
        // PlaySoundEffect(0x26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 1);
}

void EndEventHorizontalQuakefx(ProcPtr parent)
{
    (u16)gBmSt.camera.x &= 0xFFFC;
    Proc_EndEach(ProcScr_EventHorizontalQuakefx);
    Sound_FadeOutSE(4);
}

void EndEventVerticalQuakefx(ProcPtr parent)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Proc_EndEach(ProcScr_EventVerticalQuakefx);
    Sound_FadeOutSE(4);
}

void EventQuakefx_Init(struct ProcEventQuakefx * procfx)
{
    procfx->timer = 0;
}

void EventQuakefx_Loop(struct ProcEventQuakefx * procfx)
{
    struct ProcEventQuakeHandler * proc;
    proc = procfx->proc_parent;
    if (-1 == proc->quake_type)
    {
        if (GetGameTime() % 2)
        {
            (u16)gBmSt.camera.x &= 0xFFFD;
            gBmSt.camera.x ^= 1;
        }
    }
    else
    {
        if (GetGameTime() % 2)
        {
            SetBgOffset(BG_3, GetBgXOffset(BG_3) ^ 1, 0);
        }
    }

    if (0x10 == ++procfx->timer)
    {
        Proc_Break(procfx);
        Sound_FadeOutSE(4);
    }
}

struct ProcCmd CONST_DATA ProcScr_EventQuakefx[] = {
    PROC_YIELD,
    PROC_CALL(EventQuakefx_Init),
    PROC_REPEAT(EventQuakefx_Loop),
    PROC_END,
};

void StartEventQuakefx(struct ProcEventQuakeHandler * proc)
{
    Proc_Start(ProcScr_EventQuakefx, proc);
    PlaySoundEffect(0x26A);
}

void EndEventQuakefx(struct ProcEventQuakeHandler * proc)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Sound_FadeOutSE(4);
    Proc_EndEach(ProcScr_EventQuakefx);
}
