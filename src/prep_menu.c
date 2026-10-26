#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_PrepScreenMenuDummyItem[] = {
    PROC_BLOCK,
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_PrepMenu[] = {
    PROC_CALL(PrepMenu_OnInit),
    PROC_SET_END_CB(PrepMenu_OnEnd),
    PROC_YIELD,
PROC_LABEL(0),
    PROC_REPEAT(PrepMenu_ShowActiveHand),
PROC_LABEL(1),
    PROC_REPEAT(PrepMenu_CtrlLoop),
PROC_LABEL(2),
    PROC_REPEAT(PrepMenu_ShowFrozenHand),
PROC_LABEL(10),
    PROC_END,
};

void sub_80903FC(int x, int y)
{
    int tile_x, sub_x, tile_y, sub_y;
    int sub_y_;
    int val1, val2, val3, val4;

    val1 = x - 56;
    if (val1 < 0)
    {
        tile_x = 0;
        sub_x = x;
    }
    else
    {
        val2 = x + 56;
        if (val2 > 240)
        {
            tile_x = 0xF;
            sub_x = x - 120;
        }
        else
        {
            tile_x = val1 >> 3;
            sub_x = x - ((val1 >> 3) << 3);
        }
    }

    val3 = y - 40;
    if (y + 48 > 160)
    {
        tile_y = 8;
        sub_y_ = y - 0x40;
    }
    else
    {
        val4 = val3;
        if (val4 < 0)
            val4 = y - 0x21;

        tile_y = val4 >> 3;
        sub_y_ = y - 8 * (val4 >> 3);
    }
    sub_y = sub_y_;

    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 0), TEXT_COLOR_SYSTEM_BLUE, tile_x);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 2), TEXT_COLOR_SYSTEM_BLUE, tile_y);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 4), TEXT_COLOR_SYSTEM_BLUE, sub_x);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 6), TEXT_COLOR_SYSTEM_BLUE, sub_y);

    EnableBgSync(BG0_SYNC_BIT);
}

void PrepMenu_OnInit(ProcPtr p)
{
    struct ProcPrepMenu * proc = p;
    int i;

    for (i = 0; i < 8; i++)
        proc->cmds[i] = 0;

    proc->cur_index = 0;
    proc->max_index = 0;

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    proc->on_PressB = NULL;
    proc->on_PressStart = NULL;
    proc->on_End = NULL;
    proc->do_help = false;
}

void PrepMenu_CtrlLoop(ProcPtr p)
{
    struct ProcPrepMenu * proc = p;
    struct ProcPrepMenuItem * cmd;
    int index = proc->cur_index;
    int xPos = (proc->xPos + 1) * 8 + 4;
    int yPos = (proc->yPos + 1) * 8 + proc->cur_index * 16;

    ShowSysHandCursor(xPos, yPos, 6, 0x400);

    cmd = proc->cmds[proc->cur_index];

    if (proc->do_help)
    {
        if ((R_BUTTON | B_BUTTON) & gpKeySt->pressed)
        {
            CloseHelpBox();
            proc->do_help = false;
            return;
        }
    }
    else
    {
        if (R_BUTTON & gpKeySt->pressed)
        {
            if (cmd->msg_rtext)
            {
                StartHelpBox(xPos, yPos, cmd->msg_rtext);
                proc->do_help = true;
            }
            return;
        }

        if (A_BUTTON & gpKeySt->pressed)
        {
            if ((1 & cmd->color) || (NULL == cmd->effect))
            {
                PlaySoundEffect(SONG_38C);
                return;
            }
            else
            {
                Proc_Goto(proc, 0);
                cmd->effect(proc->proc_parent);
                PlaySoundEffect(SONG_38A);
                return;
            }
        }

        if (B_BUTTON & gpKeySt->pressed)
        {
            if (proc->on_PressB != NULL)
            {
                if (proc->on_PressB(proc->proc_parent))
                {
                    Proc_Goto(proc, 0);
                    PlaySoundEffect(SONG_38B);
                }
                else
                {
                    PlaySoundEffect(SONG_38C);
                }
            }
            return;
        }

        if (START_BUTTON & gpKeySt->pressed)
        {
            if (proc->on_PressStart != NULL)
            {
                if (proc->on_PressStart(proc->proc_parent))
                {
                    PlaySoundEffect(SONG_38A);
                    Proc_Goto(proc, 0);
                }
                else
                {
                    PlaySoundEffect(SONG_38C);
                }
            }
            return;
        }
    }

    if (DPAD_UP & gpKeySt->repeated)
    {
        if (proc->cur_index)
            proc->cur_index = proc->cur_index - 1;
        else if (DPAD_UP & gpKeySt->pressed)
            proc->cur_index = proc->max_index - 1;
    }

    if (DPAD_DOWN & gpKeySt->repeated)
    {
        if (proc->cur_index < (proc->max_index - 1))
            proc->cur_index = proc->cur_index + 1;
        else if (DPAD_DOWN & gpKeySt->pressed)
            proc->cur_index = 0;
    }

    if (index != proc->cur_index)
    {
        PlaySoundEffect(SONG_386);

        if (proc->do_help)
        {
            StartHelpBox(
                (proc->xPos + 1) * 8 + 4, (proc->yPos + 1) * 8 + proc->cur_index * 16,
                (cmd = proc->cmds[proc->cur_index])->msg_rtext);
        }
    }
}

void PrepMenu_ShowFrozenHand(ProcPtr p)
{
    struct ProcPrepMenu * proc = p;
    DisplayFrozenUiHand((proc->xPos + 1) * 8 + 4, (proc->yPos + 1) * 8 + proc->cur_index * 16);
}

void PrepMenu_ShowActiveHand(ProcPtr p)
{
    struct ProcPrepMenu * proc = p;
    ShowSysHandCursor((proc->xPos + 1) * 8 + 4, (proc->yPos + 1) * 8 + proc->cur_index * 16, 6, 0x400);
}

void PrepMenu_OnEnd(ProcPtr p)
{
    struct ProcPrepMenu * proc = p;

    if (proc->on_End)
        proc->on_End(proc->proc_parent);
}

void StartPrepScreenMenu(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_PrepMenu));
    Proc_Start(ProcScr_PrepMenu, parent);
}

void SetPrepScreenMenuOnBPress(const void * func)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        proc->on_PressB = func;
}

void SetPrepScreenMenuOnStartPress(const void * func)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        proc->on_PressStart = func;
}

void SetPrepScreenMenuOnEnd(const void * func)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        proc->on_End = func;
}

void SetPrepScreenMenuItem(int index, const void * func, int color, int msg, int msg_rtext)
{
    int i;
    struct ProcPrepMenu * proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (!proc->cmds[i])
                continue;

            if (proc->cmds[i]->index == index)
            {
                proc->cmds[i]->effect = func;
                proc->cmds[i]->color = color;
                proc->cmds[i]->msg = msg;
                proc->cmds[i]->msg_rtext = msg_rtext;
                return;
            }
        }

        i = proc->max_index;
        proc->cmds[i] = Proc_Start(ProcScr_PrepScreenMenuDummyItem, proc);
        proc->cmds[i]->index = index;
        proc->cmds[i]->effect = func;
        proc->cmds[i]->color = color;
        proc->cmds[i]->msg = msg;
        proc->cmds[i]->msg_rtext = msg_rtext;
        InitText(&proc->cmds[i]->text, 7);
        proc->max_index++;
    }
}

void SetPrepScreenMenuSelectedItem(int index)
{
    int i, cur = 0;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (proc->cmds[i] == NULL)
                continue;

            if (proc->cmds[i]->index == index)
            {
                proc->cur_index = cur;
                return;
            }
            cur++;
        }
    }
}

int GetActivePrepMenuItemIndex(void)
{
    int i, cur = 0;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (!proc->cmds[i])
                continue;

            if (proc->cur_index == cur)
                return proc->cmds[i]->index;

            cur++;
        }
    }
    return 0;
}

void DrawPrepScreenMenuFrameAt(int x, int y)
{
    int i;
    struct ProcPrepMenuItem * cmd;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        proc->xPos = x;
        proc->yPos = y;

        DrawUiFrame2(x, y, 10, proc->max_index * 2 + 2, 0);

        if (proc->max_index > 1)
        {
            for (i = 0; i < proc->max_index; i++)
            {
                cmd = proc->cmds[i];
                ClearText(&cmd->text);

                PutDrawText(&cmd->text, gBg0Tm + TM_OFFSET(x + 2, y + 2 * i + 1), 1 & cmd->color, 0, 0, DecodeMsg(cmd->msg));
            }
        }

        EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
    }
}

int GetPrepMenuItemAmt(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        return proc->max_index;
    else
        return 0;
}

void EndPrepScreenMenu(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        ResetPrepMenuScreen();
        Proc_Goto(proc, 10);
    }
}

void ResetPrepMenuScreen(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        TmFillRect_thm(gBg0Tm + TM_OFFSET(proc->xPos, proc->yPos), 9, proc->max_index * 2 + 2, 0);
        TmFillRect_thm(gBg1Tm + TM_OFFSET(proc->xPos, proc->yPos), 9, proc->max_index * 2 + 2, 0);

        EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
    }
}

int PrepScreenMenuExists(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        return true;
    else
        return false;
}

void ShowPrepScreenMenuFrozenHand(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        Proc_Goto(proc, 2);
}

void ShowPrepScreenMenuActiveHand(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        Proc_Goto(proc, 0);
}

void EnablePrepScreenMenu(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        Proc_Goto(proc, 1);
}
