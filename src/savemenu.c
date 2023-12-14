#include "global.h"
#include "savemenu.h"
#include "proc.h"

EWRAM_OVERLAY(savemenu) u8 gUnk_Savemenu_02000000 = 0;
EWRAM_OVERLAY(savemenu) u8 gUnk_Savemenu_02000001 = 0;

void SaveMenuOnHBlank(void)
{
    int ret;
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount & 1)
        return;

    if (vcount < gUnk_Savemenu_02000000)
    {
        REG_BLDCNT = 0xC1;

        if (gUnk_Savemenu_02000000 != 0)
            ret = ((gUnk_Savemenu_02000000 - vcount) * 0x10) / gUnk_Savemenu_02000000;
        else
            ret = 0;

        REG_BLDY_16 = ret;
    }
    else
    {
        REG_BLDCNT = 0x144;
        REG_BLDALPHA = 0x1000 | gUnk_Savemenu_02000001;
    }
}

void sub_080A3FC8(struct SaveMenuProc * proc)
{
    Proc_Goto(proc, 0x12);
    StartBgmVolumeChange(0xC0, 0x00, 0x10, NULL);
}

u8 SaveMenuIndexToValidBitfile(u8 byte, int num)
{
    int i, count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte >> i) & 1) != 0)
        {
            if (num == count)
                return 1 << i;

            count++;
        }
    }
    return UINT8_MAX;
}

u8 sub_080A4018(u8 byte1, u8 byte2)
{
    int i;
    int count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte1 >> i) & 1) != 0)
        {
            if (((byte2 >> i) & 1) != 0)
            {
                return count;
            }
            count++;
        }
    }
    return UINT8_MAX;
}

u8 sub_080A4054(u8 byte)
{
    int i, count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte >> i) & 1) != 0)
            return i;
    }

    return UINT8_MAX;
}

void SaveMenu_StartHelpBox(struct SaveMenuProc * proc)
{
    if ((proc->unk_3F == 0xFF) || (proc->unk_36 == 0))
    {
        CloseHelpBox();
        proc->in_rtext = 0;
        return;
    }

    switch (proc->action_flag) {
    case SAVEMENU_ACTION_BITFILE_1:
    case SAVEMENU_ACTION_BITFILE_4:
    case SAVEMENU_ACTION_BITFILE_5:
        if (proc->unk_36 != 0 && proc->in_rtext == false)
        {
            LoadHelpBoxGfx((void *)0x06013800, 9);
            StartHelpBoxExt_Unk(0x30, 0x30, 0x3B7);
            proc->in_rtext = true;
        }
        break;

    default:
        break;
    }
}
