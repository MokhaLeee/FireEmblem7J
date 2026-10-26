#include "gbafe.h"

void PrepItemUseBooster_OnDraw(struct ProcPrepItemUseBooster * proc, int x, int y, int msg, int item)
{
    char const * str = DecodeMsg(msg);
    int icon = GetItemIconId(item);
    int width = GetStringTextLen(str);

    if (icon != 0)
        PutIcon(gBg2Tm + TM_OFFSET(x, y), GetItemIconId(item), 0x4000);

    ClearText(&gPrepItemTexts[27]);

    PutDrawText(&gPrepItemTexts[27], gBg2Tm + TM_OFFSET(x + (icon != 0 ? 2 : 0), y), TEXT_COLOR_SYSTEM_WHITE, 0, 0, str);

    EnableBgSync(BG2_SYNC_BIT);

    proc->xpos = x * 8 - 4;
    proc->ypos = y * 8 - 4;

    proc->width = width / 8 + 1;

    if (icon != 0)
        proc->width += 2;

    proc->height = 2;
}

void PrepItemUseBooster_OnInit(struct ProcPrepItemUseBooster * proc)
{
    int i, item, msg;
    struct ProcPrepItemUse * parent = proc->proc_parent;

    sub_8074C70(0x1C0, 3, 0, proc);

    proc->status_pre[0] = GetUnitCurrentHp(parent->unit);
    proc->status_pre[1] = GetUnitPower(parent->unit);
    proc->status_pre[2] = GetUnitSkill(parent->unit);
    proc->status_pre[3] = GetUnitSpeed(parent->unit);
    proc->status_pre[4] = GetUnitLuck(parent->unit);
    proc->status_pre[5] = GetUnitDefense(parent->unit);
    proc->status_pre[6] = GetUnitResistance(parent->unit);
    proc->status_pre[7] = UNIT_CON(parent->unit);

    item = parent->unit->items[parent->slot];

    msg = sub_802D1E8(parent->unit, parent->slot);

    DrawPrepScreenItemUseStatBars(parent->unit, 0);
    sub_80955D0(parent->unit);

    proc->status_pst[0] = GetUnitCurrentHp(parent->unit);
    proc->status_pst[1] = GetUnitPower(parent->unit);
    proc->status_pst[2] = GetUnitSkill(parent->unit);
    proc->status_pst[3] = GetUnitSpeed(parent->unit);
    proc->status_pst[4] = GetUnitLuck(parent->unit);
    proc->status_pst[5] = GetUnitDefense(parent->unit);
    proc->status_pst[6] = GetUnitResistance(parent->unit);
    proc->status_pst[7] = UNIT_CON(parent->unit);

    PrepItemUseBooster_OnDraw(proc, 0x11, 0xE, msg, item);

    for (i = 0; i < 8; i++)
    {
        if (proc->status_pre[i] == proc->status_pst[i])
            continue;

        sub_8074F40((i >> 2) * 48 + 0xB8, (i & 3) * 16 + 0x32, proc->status_pst[i] - proc->status_pre[i]);
    }

    proc->timer = 0x78;
    PlaySoundEffect(SONG_37A);
}

void PrepItemUseBooster_IDLE(struct ProcPrepItemUseBooster * proc)
{
    PrepItemDrawPopupBox(proc->xpos, proc->ypos, proc->width, proc->height, 0xA580);

    if (--proc->timer == 0 || gpKeySt->pressed & (A_BUTTON | B_BUTTON))
        Proc_Break(proc);
}

void PrepItemUseBooster_OnEnd(struct ProcPrepItemUseBooster * proc)
{
    struct ProcPrepItemUse * parent = proc->proc_parent;
    int max = GetUnitItemCount(parent->unit);
    TmFillRect(gBg2Tm + TM_OFFSET(17, 14), 12, 1, 0);

    if (max == 0)
    {
        Proc_Goto(parent, 5);
    }
    else
    {
        if (parent->slot >= max)
            parent->slot--;

        ShowSysHandCursor(0x10, parent->slot * 0x10 + 0x48, 0xB, 0x800);
    }

    sub_8094AC0(gBg0Tm + TM_OFFSET(2, 9), &gPrepItemTexts[15], parent->unit, 1);

    sub_8095750(parent->unit, parent->slot);

    DisableUiCursorHand(0);
    sub_8074D38();
    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);
    LoadHelpBoxGfx((void *) (VRAM + 0x14000), -1);
}
