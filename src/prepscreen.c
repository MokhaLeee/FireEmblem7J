#include "gbafe.h"

EWRAM_DATA struct SioPidPool gSioPidPool = {};
EWRAM_OVERLAY(0) struct Text gPrepMainMenuTexts[10] = {};
EWRAM_OVERLAY(0) u8 gPrepUnitPool[0x1000] = {};
EWRAM_OVERLAY(0) struct PrepUnitList gPrepUnitList = {};
EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenItemList[400] = {};
EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenExtraItemList[400] = {};
EWRAM_OVERLAY(0) u16 Unk_Prep_02012464 = 0;
EWRAM_OVERLAY(0) u16 Unk_Prep_02012466 = 0;

CONST_DATA int Msgs_PrepMainMenuHelpbox[][3] = {
	{ MSG_3E8, MSG_3E9, MSG_3F5 },
	{ MSG_3EA, MSG_3EB, MSG_3F6 },
	{ MSG_3F0, MSG_3F1,       0 },
	{       0,       0, MSG_3F7 },
	{ MSG_3EC, MSG_3ED,       0 },
	{       0,       0,       0 },
	{       0,       0,       0 },
	{ MSG_3EE, MSG_3EF,       0 },
	{ MSG_3F2, MSG_3F3,       0 },
};

int GetPrepMainMenuInfoxMsg(void)
{
	int index = GetActivePrepMenuItemIndex();

	if (CheckInLinkArena())
		return Msgs_PrepMainMenuHelpbox[index][2];

	if (gPlaySt.chapterIndex == 0x2E && index == 7)
		return MSG_3F4;

	if (gPlaySt.chapterModeIndex == CHAPTER_MODE_LYN)
		return Msgs_PrepMainMenuHelpbox[index][0];
	else
		return Msgs_PrepMainMenuHelpbox[index][1];
}

int PrepOptionCountToRealIndexByMask(int target, int mask)
{
    int i;
    int count = 0;

    for (i = 0; i < 4; i++)
    {
        if (((mask >> i) & 1) != 0)
        {
            if (target == count)
            {
                return i;
            }

            count++;
        }
    }

    return -1;
}

int GetPrepOptionCount(int mask)
{
    int i;
    int count = 0;

    for (i = 0; i < 4; i++)
    {
        if (((mask >> i) & 1) != 0)
        {
            count++;
        }
    }

    return count;
}

void PutPrepMenuUiImg(int vram, int palId)
{
    const u16 * palettes[4] =
    {
        Pal_0841F774,
        Pal_0841F814,
        Pal_0841F8B4,
        Pal_0841F954,
    };

    Decompress(Img_PrepWindow, (void *)BG_VRAM + vram);
    ApplyPalette(palettes[gPlaySt.config_window_theme], palId);
}

void sub_808E454(u16 * tm, int b, u32 c, int d)
{
    int i;

    TmApplyTsa(tm, TSA_0842162C, (u16)TILEREF((c / 2 & 0xffff) / 0x10, 1));

    for (i = 0; i < b; i++)
        TmApplyTsa(
            (i * 0x40) + tm + 0x20, TSA_08421644, (u16)TILEREF((c / 2 & 0xffff) / 0x10, 1));

    TmApplyTsa(
        i * 0x40 + tm + 0x20, TSA_08421684, (u16)(d * 0x1000 + ((c / 2) & 0xffff) / 0x10));
}

void PrepScreenMenu_OnPickUnits(struct ProcAtMenu * proc)
{
    proc->state = 1;
    Proc_Goto(proc, PL_ATMENU_0A);
}

void PrepScreenMenu_OnItems(struct ProcAtMenu * proc)
{
    proc->state = 2;
    Proc_Goto(proc, PL_ATMENU_0A);
}

void PrepScreenMenu_OnSupport(struct ProcAtMenu * proc)
{
	Proc_Goto(proc, PL_ATMENU_0C);
	PlaySoundEffect(0x38A);
}

void PrepScreenMenu_OnSave(struct ProcAtMenu * proc)
{
    PlaySoundEffect(0x38A);
    proc->state = 3;
    Proc_Goto(proc, PL_ATMENU_08);
}

int PrepScreenMenu_OnStartPress(struct ProcAtMenu * proc)
{
    if(0 == proc->cur_counter)
        return 0;

    PrepSpecialChar_BlinkButtonStart();
    Proc_Goto(proc, PL_ATMENU_0B);
    return 1;    
}

void PrepScreenMenu_808E57C(struct ProcAtMenu* proc)
{
    Proc_Goto(proc, PL_ATMENU_05);
}

int PrepScreenMenu_OnBPress(struct ProcAtMenu * proc)
{
    if (CheckInLinkArena() != false || CanPrepScreenCheckMap() != false)
	{
        Proc_Goto(proc, 0x5);
        return true;
    }

    return false;
}

void PrepScreenMenu_OnCheckMap(struct ProcAtMenu* proc)
{
    Proc_Goto(proc, PL_ATMENU_05);
}

void nullsub_74(void) {}
void nullsub_75(void) {}

void ResetSioPidPool()
{
    int i;
    for (i = 0; i < 5; i++)
        gSioPidPool.pids[i] = 0;
}

void RegisterSioPid(u8 pid)
{
    int i;
    for (i = 0; i < 5; i++)
        if (0 == gSioPidPool.pids[i]) {
            gSioPidPool.pids[i] = pid;
            return;
        }
}

void RemoveSioPid(u8 pid)
{
    int i, j;
    for (i = 0; i < 5; i++) {
        if (gSioPidPool.pids[i] != pid)
            continue;

        j = i;
        if (i <= 3) {
            while (j <= 3) {
                gSioPidPool.pids[j] = gSioPidPool.pids[j + 1];
                j++;
            }
        }

        gSioPidPool.pids[4] = 0;
        break;
    }
}

struct Unit *GetUnitFromPrepList(int index)
{
    return gPrepUnitList.units[index];
}

void RegisterPrepUnitList(int index, struct Unit *unit)
{
    gPrepUnitList.units[index] = unit;
}

int PrepGetUnitAmount()
{
    return gPrepUnitList.max_num;
}

void PrepSetUnitAmount(int val)
{
    gPrepUnitList.max_num = val;
}

int PrepGetLatestCharId()
{
    return gPrepUnitList.latest_pid;
}

void PrepSetLatestCharId(int val)
{
    gPrepUnitList.latest_pid = val;
}

bool IsCharacterForceDeployed(int pid)
{
    if (CheckInLinkArena())
        return false;

    switch (gPlaySt.chapterModeIndex)
    {
    case CHAPTER_MODE_LYN:
        if (pid == CHARACTER_LYN_TUTORIAL)
            return true;

        break;

    case CHAPTER_MODE_ELIWOOD:
        if (pid == CHARACTER_ELIWOOD)
            return true;

        break;

    case CHAPTER_MODE_HECTOR:
        if (pid == CHARACTER_HECTOR)
            return true;

        break;
    }

    switch (gPlaySt.chapterIndex)
    {
    case CHAPTER_1B:
        if (pid == CHARACTER_ELIWOOD)
            return true;

        break;

    case CHAPTER_1E:
        if (pid == CHARACTER_HAWKEYE)
            return true;

        break;

    case CHAPTER_26:
        if (pid == CHARACTER_NINO)
            return true;

        break;

    case CHAPTER_1A:
    case CHAPTER_1C:
    case CHAPTER_22:
    case CHAPTER_2A:
        if (pid == CHARACTER_LYN)
            return true;

        if (pid == CHARACTER_ELIWOOD)
            return true;

        if (pid == CHARACTER_HECTOR)
            return true;

        break;

    case CHAPTER_2C:
        if (pid == CHARACTER_NILS)
            return true;

        break;

    case CHAPTER_2E:
        if (pid == CHARACTER_LYN)
            return true;

        if (pid == CHARACTER_ELIWOOD)
            return true;

        if (pid == CHARACTER_HECTOR)
            return true;

        if (pid == CHARACTER_NILS)
            return true;

        if (pid == CHARACTER_ATHOS)
            return true;

        break;
    }

    return false;
}

s32 CalcForceDeployedUnitCounts(void)
{
    s32 i;
    s32 count = 0;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if (!IsCharacterForceDeployed(unit->pCharacterData->number))
            continue;

        count++;
    }

    return count;
}

bool sub_808E7D4(struct Unit * unit)
{
    switch (gPlaySt.chapterIndex)
    {
    case CHAPTER_09:
        if (unit->pCharacterData->number == CHARACTER_MATTHEW)
            return true;

        break;

    case CHAPTER_29:
        if (unit->pCharacterData->number == CHARACTER_OSWIN)
            return true;

        break;

    case CHAPTER_2A:
    case CHAPTER_2B:
        if (unit->pCharacterData->number == CHARACTER_NILS)
            return true;

        break;
    }

    return false;
}

bool IsUnitInCurrentRoster(struct Unit * unit)
{
    if (unit->state & (US_DEAD | US_BIT16))
        return false;

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
    {
        unit->state = US_NOT_DEPLOYED;
        return false;
    }

    return true;
}
