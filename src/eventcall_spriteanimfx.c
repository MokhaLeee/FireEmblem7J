#include "gbafe.h"

void EventDragonsSpritefx_Init(struct ProcEventDragonsSpritefx * proc)
{
    int i;
    proc->timer = 0;

    for (i = 0; i < 3; i++)
    {
        proc->approc[i] = NULL;
        proc->x_1[i] = -1;
        proc->oam0[i] = 0;
    }
}

void EventDragonsSpritefx_End(struct ProcEventDragonsSpritefx * proc)
{
    int i;
    for (i = 0; i < 3; i++)
    {
        if (proc->approc[i])
            EndSpriteAnimProc(proc->approc[i]);
    }
}

void EventDragonsSpritefx_Loop(struct ProcEventDragonsSpritefx * proc)
{
    int i;
    int x, y;
    int ret = 0;

    for (i = 0; i < 3; i++)
    {
        if (!proc->approc[i])
            continue;

        if (proc->x_1[i] != proc->x_2[i] || proc->y_1[i] != proc->y_2[i])
        {
            proc->progress[i] += proc->speed[i];
            if (proc->progress[i] > 0x100)
                proc->progress[i] = 0x100;

            if (proc->speed[i] == 0)
                proc->progress[i] = 0x100;


            x = ((proc->x_1[i] * (0x100 - proc->progress[i])) + (proc->x_2[i] * proc->progress[i])) / 0x100;
            y = ((proc->y_1[i] * (0x100 - proc->progress[i])) + (proc->y_2[i] * proc->progress[i])) / 0x100;

            if (proc->progress[i] == 0x100)
            {
                proc->x_1[i] = proc->x_2[i];
                proc->y_1[i] = proc->y_2[i];

                SetSpriteAnimId(
                    proc->approc[i]->anim,
                    proc->facing[i]);
            }

            ret = 1;
        }
        else
        {
            x = proc->x_1[i];
            y = proc->y_1[i];
        }

        x = x - gBmSt.camera.x;
        y = y - gBmSt.camera.y;

        if (y < -0x40)
            y = 0xCC;

        x = OAM1_X(x);
        y = OAM0_Y(y);

        SetSpriteAnimProcParameters(
            proc->approc[i],
            x,
            y + proc->oam0[i],
            -1
        );
    }

    if (ret != 0)
    {
        if (((proc->timer++) % 0x18) == 0)
        {
            PlaySoundEffect(0x2E0);
        }
    }
}

struct ProcCmd CONST_DATA ProcScr_EventDragonsSpritefx[] = {
    PROC_CALL(EventDragonsSpritefx_Init),
    PROC_SET_END_CB(EventDragonsSpritefx_End),
    PROC_REPEAT(EventDragonsSpritefx_Loop),
    PROC_END,
};

void StartEventDragonsSpriteDeamon(int kind, ProcPtr parent)
{
    struct ProcEventDragonsSpritefx * proc = Proc_Start(ProcScr_EventDragonsSpritefx, parent);
    proc->kind = kind;

    if (kind == 0)
        Decompress(Img_EventDragonsSpritefx1, OBJ_VRAM0 + 0x3000);

    if (kind == 1)
        Decompress(Img_EventDragonsSpritefx2, OBJ_VRAM0 + 0x3000);
}

void EndEventDragonsSpritefx(void)
{
    Proc_EndEach(ProcScr_EventDragonsSpritefx);
}

void PutFireDragonSpritefx(int index, int facing, int x, int y, int action, int speed)
{
    u16 * objs[] = {
        gUnk_081C5020,
        gUnk_081C673C
    };

    struct ProcEventDragonsSpritefx * proc = Proc_Find(ProcScr_EventDragonsSpritefx);

    if (proc)
    {
        proc->facing[index] = facing;
        action = action * 2 + facing;

        if (proc->approc[index] == NULL)
        {
            proc->approc[index] = StartSpriteAnimProc(objs[proc->kind], x, y, 0xA980, action, 0xD);
            proc->x_1[index] = proc->x_2[index] = x;
            proc->y_1[index] = proc->y_2[index] = y;
        }
        else if (speed == 0)
            SetSpriteAnimId(proc->approc[index]->anim, action);
        else
        {
            SetSpriteAnimId(proc->approc[index]->anim, action);
            if (proc->x_1[index] != x || proc->y_1[index] != y)
            {
                proc->progress[index] = 0;
                proc->speed[index] = speed;
                proc->x_2[index] = x;
                proc->y_2[index] = y;
            }
        }
    }
}

void RemoveFireDragonSpritefx(int idx)
{
    struct ProcEventDragonsSpritefx * proc = Proc_Find(ProcScr_EventDragonsSpritefx);
    if (proc && proc->approc[idx])
    {
        EndSpriteAnimProc(proc->approc[idx]);
        proc->x_1[idx] = -1;
        proc->approc[idx] = NULL;
    }
}

void sub_807F590(int idx)
{
    struct ProcEventDragonsSpritefx * proc = Proc_Find(ProcScr_EventDragonsSpritefx);
    if (proc && proc->approc[idx])
    {
        proc->oam0[idx] = 0x400;
    }
}

void EventCall_PutFireDragonSprite(ProcPtr proc)
{
    StartEventDragonsSpriteDeamon(0, proc);
    PutFireDragonSpritefx(0, FACING_LEFT,  0xC8, 0x48, 0, 0);
    PutFireDragonSpritefx(1, FACING_RIGHT, 0x98, 0x58, 0, 0);
    PutFireDragonSpritefx(2, FACING_LEFT,  0xF8, 0x58, 0, 0);
}

void Move2ndFireDragon(void)
{
    PutFireDragonSpritefx(1, FACING_RIGHT,  0xA8, 0x80, 2, 2);
}

void Move3rdFireDragon(void)
{
    PutFireDragonSpritefx(2, FACING_LEFT,   0xE8, 0x80, 2, 2);
}

void ReputFireDragonSprite(ProcPtr proc)
{
    StartEventDragonsSpriteDeamon(0, proc);
    PutFireDragonSpritefx(0, FACING_LEFT,  0xC8, 0x48, 0, 0);
    PutFireDragonSpritefx(1, FACING_RIGHT, 0xA8, 0x80, 0, 0);
    PutFireDragonSpritefx(2, FACING_LEFT,  0xE8, 0x80, 0, 0);
}

void FireDragonSpriteRetreated(void)
{
    PutFireDragonSpritefx(1, FACING_RIGHT, 0xA8, 0x68, 3, 8);
}

void sub_807F6B0(void)
{
    PutFireDragonSpritefx(2, FACING_LEFT,  0xE8, 0x68, 3, 8);
}

void sub_807F6D0(ProcPtr proc)
{
    StartEventDragonsSpriteDeamon(1, proc);
    PutFireDragonSpritefx(0, FACING_LEFT,  0xC8, 0x48, 0, 0);
    PutFireDragonSpritefx(1, FACING_RIGHT, 0xA8, 0x70, 0, 0);
    PutFireDragonSpritefx(2, FACING_LEFT,  0xE8, 0x70, 0, 0);
}

void sub_807F718(void)
{
    PutFireDragonSpritefx(1, FACING_RIGHT, 0, 0, 1, 0);
}

void sub_807F738(void)
{
    PutFireDragonSpritefx(2, FACING_LEFT,  0, 0, 1, 0);
}

void sub_807F758(ProcPtr proc)
{
    PlaySoundEffect(0x2FB);
    StartFlameBreathfx(0, -6, 8, proc);
}

void sub_807F78C(ProcPtr proc)
{
    PlaySoundEffect(0x2FC);
    StartFlameBreathfx(1, 2, 8, proc);
}

void StartEventDragonsSpriteMovefx(ProcPtr proc)
{
    PutFireDragonSpritefx(1, FACING_RIGHT, 0, 0, 0, 0);
    PutFireDragonSpritefx(2, FACING_LEFT,  0, 0, 0, 0);
}

struct ProcCmd CONST_DATA ProcScr_DragonFlameImpact[] = {
    PROC_CALL(DragonFlameImpact_Init),
    PROC_SET_END_CB(DragonFlameImpact_End),
    PROC_REPEAT(DragonFlameImpact_Loop),
    PROC_END,
};

void DragonFlameImpact_Init(struct ProcDragonFlameImpact * proc)
{
    proc->x = 0xC0;
    proc->y = 0x98;
    proc->timer = 0;

    Decompress(Img_DragonFlameImpact, (void *)BG_VRAM + 0x5000);
    ApplyPalette(Pal_DragonFlameImpact, 4);
    TmApplyTsa(gBg2Tm, Tsa_DragonFlameImpact, 0x4280);
    EnableBgSync(BG2_SYNC_BIT);
    SetBgOffset(BG_2, 0, 0);

    SetWinEnable(0, 0, 0);
    gDispIo.disp_ct.objwin_enable = 1;
    SetWOutLayers(1, 1, 0, 1, 1);
    SetWObjLayers(1, 1, 1, 1, 0);
}

void DragonFlameImpact_Loop(struct ProcDragonFlameImpact * proc)
{
    int x = proc->x - gBmSt.camera.x;
    int y = proc->y - gBmSt.camera.y + 8;

    proc->timer += 2;

    SetBgOffset(BG_2, 0, proc->timer);
    sub_80266DC(0xD, x, y, CLASS_ARCHSAGE);
}

void DragonFlameImpact_End(struct ProcDragonFlameImpact * proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);
}

void StartDragonFlameImpact(ProcPtr parent)
{
    Proc_Start(ProcScr_DragonFlameImpact, parent);
}

void EndDragonFlameImpact(void)
{
    Proc_EndEach(ProcScr_DragonFlameImpact);
}

void EventCall_FireDragonScreamingInPain(ProcPtr proc)
{
    PutFireDragonSpritefx(0, FACING_LEFT,  0, 0, FIREDRAGONSPRIT_ACTION_BARK, 0);
    PutFireDragonSpritefx(1, FACING_RIGHT, 0, 0, FIREDRAGONSPRIT_ACTION_BARK, 0);
    PutFireDragonSpritefx(2, FACING_LEFT,  0, 0, FIREDRAGONSPRIT_ACTION_BARK, 0);
}

void EventCall_FireDragonFellWeakly(ProcPtr proc)
{
    PutFireDragonSpritefx(0, FACING_LEFT,  0, 0, FIREDRAGONSPRIT_ACTION_FELL, 0);
    PutFireDragonSpritefx(1, FACING_RIGHT, 0, 0, FIREDRAGONSPRIT_ACTION_FELL, 0);
    PutFireDragonSpritefx(2, FACING_LEFT,  0, 0, FIREDRAGONSPRIT_ACTION_FELL, 0);

    StartEventQuakefx(proc);
}

void EventCall_FireDragonFadeOut(ProcPtr proc)
{
    PutFireDragonSpritefx(1, FACING_RIGHT, 0, 0, FIREDRAGONSPRIT_ACTION_FADEOUT, 0);
    PutFireDragonSpritefx(2, FACING_LEFT,  0, 0, FIREDRAGONSPRIT_ACTION_FADEOUT, 0);
}

void EventCall_FinalFireDragonReStandUp(ProcPtr proc)
{
    PutFireDragonSpritefx(0, FACING_LEFT,  0, 0, FIREDRAGONSPRIT_ACTION_RESTAND, 0);
}
