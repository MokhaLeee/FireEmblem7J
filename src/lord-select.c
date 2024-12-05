#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_LordSelect[] = {
    PROC_19,
    PROC_YIELD,
    PROC_CALL(sub_80AFC3C),
    PROC_REPEAT(sub_80AFD28),
PROC_LABEL(PROCLABEL_LORD_SELECT_4),
    PROC_CALL(sub_80AFDF8),
    PROC_SLEEP(60),
PROC_LABEL(5),
    PROC_CALL(sub_80AFE04),
    PROC_SLEEP(30),
    PROC_END,
};

void sub_80AFC3C(struct ProcLordSelect * proc)
{
    gDispIo.disp_ct.mode = DISPCNT_MODE_0;

    InitBgs(NULL);

    NewEfxAnimeDrvProc();
    sub_80647C8();

    proc->unk_38 = 0;
    proc->unk_3C = 0;

    SetDispEnable(0, 0, 0, 0, 0);

    SetBgOffset(BG_0, 0, 0);
    SetBgOffset(BG_1, 0, 0);
    SetBgOffset(BG_2, 0, 0);
    SetBgOffset(BG_3, 0, 0);

    proc->unk_34 = 0;
    proc->stat = LORD_SELECT_STAT_2;
    proc->unk_32 = 0;
}

void sub_80AFCC4(struct ProcLordSelect * proc)
{
    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_BmFadeOUT));
    EndAllProcChildren(proc);

    FadeBgmOut(1);
    SetDispEnable(0, 0, 0, 0, 0);

    SetNextGameAction(GAME_ACTION_EVENT_RETURN);

    Proc_Goto(proc, PROCLABEL_LORD_SELECT_5);
}

void sub_80AFD28(struct ProcLordSelect * proc)
{
    switch (proc->stat) {
    case LORD_SELECT_STAT_2:
        proc->unk_4C = sub_80B10D4(proc->unk_33, proc->unk_34);

        if (proc->unk_4C == 0)
        {
            SetNextGameAction(GAME_ACTION_CLASS_REEL);
            Proc_Goto(proc, PROCLABEL_LORD_SELECT_4);
            return;
        }

        proc->unk_34++;
        proc->stat = LORD_SELECT_STAT_1;
        sub_80B0170(proc, proc->unk_4C);
        break;

    case LORD_SELECT_STAT_3:
        sub_80B0EBC(proc, proc->unk_4C);
        proc->stat = LORD_SELECT_STAT_1;
        break;

    case LORD_SELECT_STAT_1:
        if (gpKeySt->held & (A_BUTTON | B_BUTTON | START_BUTTON))
            sub_80AFCC4(proc);

        break;

    default:
        break;
    }
}

bool sub_80AFDAC(void)
{
    struct ProcLordSelect * proc = Proc_Find(ProcScr_LordSelect);

    if (proc && sub_80B10D4(proc->unk_33, proc->unk_34) == 0)
        return true;

    return false;
}

void SetLordSelectState(int stat)
{
    struct ProcLordSelect * proc = Proc_Find(ProcScr_LordSelect);

    if (proc)
        proc->stat = stat;
}

void sub_80AFDF8(struct ProcLordSelect * proc)
{
    FadeBgmOut(3);
}

void sub_80AFE04(struct ProcLordSelect * proc)
{
    EndAllProcChildren(proc);
    EndEfxAnimeDrvProc();

    sub_8012D60(0);
    sub_80647F8();
}

void StartLordSelect(u8 unk_33, ProcPtr parent)
{
    struct ProcLordSelect * proc = Proc_StartBlocking(ProcScr_LordSelect, parent);

    proc->unk_33 = unk_33;
}
