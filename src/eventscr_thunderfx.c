#include "gbafe.h"

void EventThunderfx_Init(struct ProcEventThunderfx * proc)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    SetBlendAlpha(0x10, 0x10);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    proc->unk30 = 0;

    StartBmBgfx(
        BmBgfxConf_EventThunder,
        BG_2,
        proc->x + 0x54,
        proc->y,
        0,
        0x2000,
        0xF,
        NULL, proc
    );
}

void EventThunderfx_End(struct ProcEventThunderfx * proc)
{
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
    InitBmBgLayers();
}

struct BmBgxConf CONST_DATA BmBgfxConf_EventThunder[] = {
    { BMFX_CONFT_PAL,        Pal_EventThunderfx,     0x1, 0 },
    { BMFX_CONFT_ZIMG,       Img_EventThunderfx1, 0x1000, 1 },
    { BMFX_CONFT_ZIMG,       Img_EventThunderfx2, 0x1000, 0 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx1,      0, 1 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx2,      0, 2 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx3,      0, 2 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx4,      0, 2 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx5,      0, 2 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx6,      0, 2 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx7,      0, 2 },
    { BMFX_CONFT_ZIMG,       Img_EventThunderfx3, 0x1000, 1 },
    { BMFX_CONFT_ZIMG,       Img_EventThunderfx4, 0x1000, 0 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx8,      0, 1 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx9,      0, 2 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx10,     0, 2 },
    { BMFX_CONFT_TSA,        Tsa_EventThunderfx11,     0, 2 },
    { BMFX_CONFT_END },
};

struct ProcCmd CONST_DATA ProcScr_EventThunderfx[] = {
    PROC_YIELD,
    PROC_CALL(EventThunderfx_Init),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_CALL(EventThunderfx_End),
    PROC_END,
};

int EventE2_Thunderfx(struct EventProc * proc)
{
    struct ProcEventThunderfx * procfx;
    const u32 * args = proc->script;

    int x = args[1];
    int y = args[2];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;
 
    procfx = Proc_StartBlocking(ProcScr_EventThunderfx, proc);
    procfx->x = x;
    procfx->y = y;
    return EVENT_CMDRET_YIELD;
}

bool EventThunderfxExists(void)
{
    if (Proc_Find(ProcScr_EventThunderfx))
        return true;

    return false;
}
