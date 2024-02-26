#include "gbafe.h"

struct EventSpriteAnimConf {
    /* 00 */ const u16 * pal;
    /* 04 */ const u8  * img;
    /* 08 */ const u8  * ap_conf;
    /* 0C */ u16 oam0, oam2;
    /* 10 */ u8 pal_bank, pal_size;

    /* 12 */ u8 _pad_[2];
};

struct ProcEventSpriteAnim {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ ProcPtr approc;
    /* 38 */ const struct EventSpriteAnimConf * priv;
};

void EventSpriteAnim_Init(struct ProcEventSpriteAnim * proc)
{
    int x = proc->x - gBmSt.camera.x + 8;
    int y = proc->y - gBmSt.camera.y + 8;
    const struct EventSpriteAnimConf * priv = proc->priv;

    proc->approc = StartSpriteAnimfx(
        priv->img,
        priv->pal,
        priv->ap_conf,
        OAM1_X(x),
        OAM0_Y(y) + priv->oam0,
        0,
        priv->pal_bank,
        priv->pal_size,
        priv->oam2,
        4
    );
}

void EventSpriteAnim_Loop(struct ProcEventSpriteAnim * proc)
{
    struct Proc * approc = proc->approc;
    if (approc->proc_script != NULL)
    {
        int x = proc->x - gBmSt.camera.x + 8;
        int y = proc->y - gBmSt.camera.y + 8;

        SetSpriteAnimProcParameters(approc, OAM1_X(x), OAM0_Y(y), -1);
    }
    else
    {
        Proc_Break(proc);
        proc->approc = NULL;
    }
}

void EventSpriteAnim_End(struct ProcEventSpriteAnim * proc)
{
    if (proc->approc != NULL)
        EndSpriteAnimProc(proc->approc);
}

struct ProcCmd CONST_DATA ProcScr_EventSpriteAnim[] = {
    PROC_YIELD,
    PROC_SET_END_CB(EventSpriteAnim_End),
    PROC_CALL(EventSpriteAnim_Init),
    PROC_REPEAT(EventSpriteAnim_Loop),
    PROC_END,
};

int EventE8_StartSpriteAnim(struct EventProc * proc)
{
    int ret, x, y;
    u16 _y;
    struct ProcEventSpriteAnim * procfx;
    const EventScr * args = proc->script;

    const struct EventSpriteAnimConf * conf = (const void *)args[1];

    u32 packed_vec = (u32)args[2];

    if (!(packed_vec & 0x8000))
        x = packed_vec & 0xFFFF;
    else
        x = -1;

    _y = (u16)EVT_CMD_ARGV(proc->script)[4];
    y = !(_y & 0x8000) ? _y : -1;

    if (proc->evbits & EVENT_FLAG_SKIPPED)
    {
        ret = EVENT_CMDRET_CONTINUE;
    }
    else
    {
        procfx = Proc_Start(ProcScr_EventSpriteAnim, proc);

#if BUGFIX
        ret = EVENT_CMDRET_YIELD;
#else
        ret = (int)procfx; /* Holly shit */
#endif
        procfx->x = x;
        procfx->y = y;
        procfx->priv = conf;
    }
    return ret;
}

int EndEventSpriteAnim()
{
#if BUGFIX
    Proc_End(Proc_Find(ProcScr_EventSpriteAnim));
    return true;
#else
    return ((int (*)(ProcPtr))Proc_End)(Proc_Find(ProcScr_EventSpriteAnim)); /* Holly shit */
#endif
}

bool EventSpriteAnimExists(void)
{
    struct ProcEventSpriteAnim * procfx;
    struct Proc * approc;
    
    procfx = Proc_Find(ProcScr_EventSpriteAnim);
    if (procfx == NULL)
        return true;

    approc = procfx->approc;
    if (approc == NULL)
        return false;

    if (approc->proc_script != NULL)
        return true;

    return false;
}

struct ProcCmd CONST_DATA ProcScr_Event_08C0169C[] = {
PROC_LABEL(0),
    PROC_YIELD,
    PROC_CALL(sub_80124BC),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(sub_80125A4),
    PROC_WHILE(sub_8020F20),
    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(RenderMap),
    PROC_GOTO(0),
    PROC_END,
};

u16 CONST_DATA gUnk_08C016F4[] = {
    0x403, 0x402, 0x400, 0x401
};
