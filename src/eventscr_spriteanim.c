#include "gbafe.h"

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

    if (proc->flags & EVENT_FLAG_SKIPPED)
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

int EventE9_EndEventSpriteAnim(void)
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

int EventEA_StartMixPalette(struct EventProc * proc)
{
    u16 * palA = (u16 *) proc->script[1];
    u16 * palB = (u16 *) proc->script[2];
    int conf = proc->script[3];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    StartMixPalette(palA, palB, conf & 0xFF, (conf >> 0x10) & 0xFF, (conf >> 0x18) & 0xFF, proc);

#if BUGFIX
    return EVENT_CMDRET_CONTINUE;
#endif
}

int EventEB_EndMixPalette(struct EventProc * proc)
{
    EndMixPalette();

#if BUGFIX
    return EVENT_CMDRET_CONTINUE;
#endif
}

void EventLoadUnit(int pid, int jid, int x_load, int y_load, int x_move, int y_move, int faction_id, void * unk)
{
    CpuFastFill(0, &sEventLoadUnitBuf, sizeof(sEventLoadUnitBuf));

    sEventLoadUnitBuf.faction_id = faction_id;
    sEventLoadUnitBuf.level = 1;

    sEventLoadUnitBuf.pid = pid;
    sEventLoadUnitBuf.jid = jid;
    sEventLoadUnitBuf.x_load = x_load;
    sEventLoadUnitBuf.y_load = y_load;
    sEventLoadUnitBuf.x_move = x_move;
    sEventLoadUnitBuf.y_move = y_move;

    LoadUnitCore(&sEventLoadUnitBuf, unk);
}

void sub_8012440(struct UnitDefinition const * def, int flag)
{
    CpuFastFill(0, &sEventLoadUnitBuf, sizeof(sEventLoadUnitBuf));

    sEventLoadUnitBuf.faction_id = def->faction_id;
    sEventLoadUnitBuf.level = def->level;

    sEventLoadUnitBuf.pid = def->pid;
    sEventLoadUnitBuf.jid = def->jid;

    if (flag)
    {
        sEventLoadUnitBuf.x_load = def->x_load;
        sEventLoadUnitBuf.y_load = def->y_load;
    }
    else
    {
        sEventLoadUnitBuf.x_load = def->x_move;
        sEventLoadUnitBuf.y_load = def->y_move;
    }

    sEventLoadUnitBuf.x_move = def->x_move;
    sEventLoadUnitBuf.y_move = def->y_move;

    LoadUnitCore(&sEventLoadUnitBuf, (void *) flag);
}

void sub_80124BC(ProcPtr p)
{
    struct ProcEventWarpLoad * proc = p;
    struct UnitDefinition const * def = proc->def;

    if (def->pid == 0)
    {
        Proc_End(proc);
        return;
    }

    proc->x = def->x_move;
    proc->y = def->y_move;

    if (gBmMapUnit[proc->y][proc->x] != 0)
    {
        int ix, iy;
        int best = 0xFF;
        int bestX = -1;
        int bestY = -1;

        GenerateExtendedMovementMap(proc->x, proc->y, gUnk_08C52B94);

        for (iy = 0; iy < gBmMapSize.y; iy++)
        {
            for (ix = 0; ix < gBmMapSize.x; ix++)
            {
                if (best <= gBmMapMovement[iy][ix])
                    continue;

                if (gBmMapUnit[iy][ix] != 0)
                    continue;

                best = gBmMapMovement[iy][ix];
                bestX = ix;
                bestY = iy;
            }
        }

        proc->x = bestX;
        proc->y = bestY;
    }

    EnsureCameraOntoPosition(proc, proc->x, proc->y);
}

void sub_80125A4(ProcPtr p)
{
    struct ProcEventWarpLoad * proc = p;
    struct UnitDefinition const * def = proc->def;
    struct UnitDefinition buf;

    StartEventWarpAnim(proc, proc->x, proc->y, 1, 1);

    buf = *def;

    buf.x_load = buf.x_move = proc->x;
    buf.y_load = buf.y_move = proc->y;

    LoadUnit(&buf);

    proc->def = def + 1;
}

int sub_80125EC(struct EventProc * proc)
{
    struct ProcEventWarpLoad * child;

    BmMapFill(gBmMapOther, 0);

    child = Proc_StartBlocking(ProcScr_Event_08C0169C, proc);
    child->def = (struct UnitDefinition const *) proc->script[1];
    child->skip = (proc->unk_4D || (proc->flags & EVENT_FLAG_SKIPPED)) ? TRUE : FALSE;

    return EVENT_CMDRET_YIELD;
}
