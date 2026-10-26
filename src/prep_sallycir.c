#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_SallyCir[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(SallyCir_Init),
    PROC_REPEAT(SallyCir_Loop),
    PROC_CALL(SallyCir_OnEnd),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_Unk_08D8C934[] = {
    PROC_YIELD,
    PROC_YIELD,
    PROC_END,
};

void SallyCir_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount == 160)
    {
        struct Win1H * swap;

        vcount = 0;

        swap = gUnk_02012968[0];
        gUnk_02012968[0] = gUnk_02012968[1];
        gUnk_02012968[1] = swap;
    }
    else
    {
        if (vcount > 160)
            vcount = 0;
    }

    REG_WIN1H = ((*gUnk_02012968 + vcount)->left << 8) | (*gUnk_02012968 + vcount)->right;
}

void SallyCir_Init(struct SallyCirProc * proc)
{
    u16 i;

    gDispIo.disp_ct.win0_enable = 0;
    gDispIo.disp_ct.win1_enable = 1;
    gDispIo.disp_ct.objwin_enable = 0;

    if (proc->unk_2a < 0)
    {
        proc->unk_2c = 150;

        for (i = 0; i < 160; i++)
        {
            gUnk_02012468[0][i].left = 0;
            gUnk_02012468[0][i].right = 240;

            gUnk_02012468[1][i].left = 0;
            gUnk_02012468[1][i].right = 240;
        }

        gDispIo.win1_left = 0;
        gDispIo.win1_top = 0;
        gDispIo.win1_right = 240;
        gDispIo.win1_bottom = 160;
    }
    else
    {
        proc->unk_2c = 0;

        for (i = 0; i < 160; i++)
        {
            gUnk_02012468[0][i].left = 120;
            gUnk_02012468[0][i].right = 120;

            gUnk_02012468[1][i].left = 120;
            gUnk_02012468[1][i].right = 120;
        }

        gDispIo.win1_left = 120;
        gDispIo.win1_top = 0;
        gDispIo.win1_right = 120;
        gDispIo.win1_bottom = 160;
    }

    gDispIo.win_ct.win1_enable_bg0 = 1;
    gDispIo.win_ct.win1_enable_bg1 = 1;
    gDispIo.win_ct.win1_enable_bg2 = 1;
    gDispIo.win_ct.win1_enable_bg3 = 1;
    gDispIo.win_ct.win1_enable_obj = 1;

    gDispIo.win_ct.wout_enable_bg0 = 0;
    gDispIo.win_ct.wout_enable_bg1 = 0;
    gDispIo.win_ct.wout_enable_bg2 = 0;
    gDispIo.win_ct.wout_enable_bg3 = 0;
    gDispIo.win_ct.wout_enable_obj = 0;

    proc->unk_29 = 0;

    gUnk_02012968[0] = gUnk_02012468[0];
    gUnk_02012968[1] = gUnk_02012468[1];

    SetOnHBlankA(SallyCir_OnHBlank);
}

void SallyCir_Loop(struct SallyCirProc * proc)
{
    s16 i;

    proc->unk_2c += proc->unk_2a;

    if (proc->unk_2c > 150)
        proc->unk_2c = 150;

    if (proc->unk_2c < 0)
        proc->unk_2c = 0;

    for (i = 0; i < 160; i++)
    {
        s16 distance;
        int var;

        if (proc->unk_2c < 1 || (var = (proc->unk_2c * proc->unk_2c) - ((i - 80) * (i - 80))) < 0)
        {
            gUnk_02012968[1][i].left = 120;
            gUnk_02012968[1][i].right = 120;
            continue;
        }

        distance = Sqrt(var);

        if (distance > 120)
            distance = 120;

        gUnk_02012968[1][i].left = 120 - distance;
        gUnk_02012968[1][i].right = distance + 120;
    }

    proc->unk_29++;

    if (proc->unk_29 == 40)
        Proc_Break(proc);
}

void SallyCir_OnEnd(struct SallyCirProc * proc)
{
    SetOnHBlankA(NULL);
}

ProcPtr StartSallyCirProc(ProcPtr parent, u8 unk)
{
    struct SallyCirProc * proc = Proc_StartBlocking(ProcScr_SallyCir, parent);
    proc->unk_2a = unk;

    return proc;
}

void sub_809139C(struct SallyCirProc * proc)
{
    proc->unk_29 = 0;

    gDispIo.disp_ct.bg0_enable = 1;
    gDispIo.disp_ct.bg1_enable = 1;
    gDispIo.disp_ct.bg2_enable = 1;
    gDispIo.disp_ct.bg3_enable = 1;
    gDispIo.disp_ct.obj_enable = 1;

    gDispIo.disp_ct.win0_enable = 0;
    gDispIo.disp_ct.win1_enable = 1;
    gDispIo.disp_ct.objwin_enable = 0;

    gDispIo.win_ct.win1_enable_bg0 = 1;
    gDispIo.win_ct.win1_enable_bg1 = 1;
    gDispIo.win_ct.win1_enable_bg2 = 1;
    gDispIo.win_ct.win1_enable_bg3 = 1;
    gDispIo.win_ct.win1_enable_obj = 1;

    gDispIo.win_ct.wout_enable_bg0 = 0;
    gDispIo.win_ct.wout_enable_bg1 = 0;
    gDispIo.win_ct.wout_enable_bg2 = 0;
    gDispIo.win_ct.wout_enable_bg3 = 0;
    gDispIo.win_ct.wout_enable_obj = 0;

    if (proc->unk_2a > 0)
    {
        gDispIo.win1_left = 0;
        gDispIo.win1_top = 0;
        gDispIo.win1_right = 240;
        gDispIo.win1_bottom = 160;
    }
    else
    {
        gDispIo.win1_left = 120;
        gDispIo.win1_top = 80;
        gDispIo.win1_right = 120;
        gDispIo.win1_bottom = 80;
    }
}

void sub_809145C(struct SallyCirProc * proc)
{
    int a;
    int t;

    proc->unk_29++;

    gDispIo.disp_ct.win0_enable = 0;
    gDispIo.disp_ct.win1_enable = 1;
    gDispIo.disp_ct.objwin_enable = 0;

    a = (15 - proc->unk_29);
    t = (640 - (a * 640 * a) / 225) >> 4;

    if (proc->unk_2a > 0)
    {
        gDispIo.win1_left = t * 3;
        gDispIo.win1_top = t * 2;
        gDispIo.win1_right = -16 - t * 3;
        gDispIo.win1_bottom = -96 - t * 2;
    }
    else
    {
        gDispIo.win1_left = 120 - t * 3;
        gDispIo.win1_top = 80 - t * 2;
        gDispIo.win1_right = 120 + t * 3;
        gDispIo.win1_bottom = 80 + t * 2;
    }

    gDispIo.win_ct.win1_enable_bg0 = 1;
    gDispIo.win_ct.win1_enable_bg1 = 1;
    gDispIo.win_ct.win1_enable_bg2 = 1;
    gDispIo.win_ct.win1_enable_bg3 = 1;
    gDispIo.win_ct.win1_enable_obj = 1;

    gDispIo.win_ct.wout_enable_bg0 = 0;
    gDispIo.win_ct.wout_enable_bg1 = 0;
    gDispIo.win_ct.wout_enable_bg2 = 0;
    gDispIo.win_ct.wout_enable_bg3 = 0;
    gDispIo.win_ct.wout_enable_obj = 0;

    if (t >= 40)
    {
        Proc_Break(proc);

        if (proc->unk_2a > 0)
        {
            gDispIo.disp_ct.bg0_enable = 0;
            gDispIo.disp_ct.bg1_enable = 0;
            gDispIo.disp_ct.bg2_enable = 0;
            gDispIo.disp_ct.bg3_enable = 0;
            gDispIo.disp_ct.obj_enable = 0;
        }
    }
}
