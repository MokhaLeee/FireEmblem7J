#include "gbafe.h"

u32 GetBonusContentClaimFlags(void)
{
    return gBonusContentClaimFlags;
}

void SetBonusContentClaimFlags(u32 flags)
{
    gBonusContentClaimFlags = flags;
}

void WriteBonusContentClaimFlags(void * sram_dest)
{
    WriteAndVerifySramFast(&gBonusContentClaimFlags, sram_dest + 0xD88, sizeof(gBonusContentClaimFlags));
}

void ReadBonusContentClaimFlags(void * sram_src)
{
    ReadSramFast(sram_src + 0xD88, &gBonusContentClaimFlags, sizeof(gBonusContentClaimFlags));
}

void WriteLastGameSaveId(int num)
{
    struct GlobalSaveInfo info;

    ReadGlobalSaveInfo(&info);
    info.last_game_save_id = num;
    WriteGlobalSaveInfoNoChecksum(&info);
}

int ReadLastGameSaveId(void)
{
    int ret;
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return 0;

    ret = info.last_game_save_id;

    if (ret > SAVE_GAME2)
        return SAVE_GAME0;
    else if (ret < 0)
        return SAVE_GAME0;
    else
        return ret;
}

void InvalidateGameSave(int index)
{
    struct SaveBlockInfo chunk;
    struct PlaySt play_st;

    if (IsValidSuspendSave(SAVE_SUSPEND))
    {
        ReadSuspendSavePlaySt(SAVE_SUSPEND, &play_st);

        if (play_st.gameSaveSlot == index)
            InvalidateSuspendSave(SAVE_SUSPEND);
    }

    chunk.kind = SAVE_KIND_INVALID;
    WriteSaveBlockInfo(&chunk, index);
}

void CopyGameSave(int index_src, int index_dest)
{
    struct SaveBlockInfo chunk;
    void * src = GetSaveReadAddr(index_src);
    void * dest = GetSaveWriteAddr(index_dest);

    ReadSramFast(src, gBuf, sizeof(struct GameSaveBlock));
    WriteAndVerifySramFast(gBuf, dest, sizeof(struct GameSaveBlock));

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index_dest);
}

void WriteNewGameSave(int index, int isDifficult, int mode)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GameSavePackedUnit unitp;

    struct GameSaveBlock * dest = GetSaveWriteAddr(index);

    if (mode == 0)
        mode = gPlaySt.chapterModeIndex;

    SetGameTime(0);
    InitPlayConfig(isDifficult);
    InitUnits();
    ClearSupplyItems();
    ResetPermanentFlags();
    InvalidateSuspendSave(SAVE_SUSPEND);

    gPlaySt.tact_gender = 0;
    gPlaySt.unk2C_04 = 0;
    CpuFill16(0, &gPlaySt.total_gold, 0x10);
    gPlaySt.unk2C_0D = 0;
    gPlaySt.chapterModeIndex = mode;
    gPlaySt.tact_enabled = 1;
    gPlaySt.playerName[0] = '\0';

    if (mode == 1)
        gPlaySt.chapterIndex = 0;

    if (mode == 2)
        gPlaySt.chapterIndex = 0xC;

    if (mode == 3)
        gPlaySt.chapterIndex = 0xD;

    gPlaySt.playthroughIdentifier = GetNewPlaythroughId();
    gPlaySt.gameSaveSlot = index;
    gPlaySt.unk2C_17 = GetGlobalCompletionCount();

    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    SetBonusContentClaimFlags(0);
    WriteBonusContentClaimFlags(dest);

    CpuFill16(0, &unitp, sizeof(unitp));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        WriteAndVerifySramFast(&unitp, &dest->units[i], sizeof(unitp));

    WriteSupplyItems(dest->supplyItems);
    ClearPidChStatsSaveData(dest);
    WritePermanentFlags(dest->permanentFlags);

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index);
    WriteLastGameSaveId(index);
}

void WriteGameSave(int slot)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GlobalSaveInfo info;

    struct GameSaveBlock * dest = GetSaveWriteAddr(slot);
    InvalidateSuspendSave(SAVE_SUSPEND);
    gPlaySt.gameSaveSlot = slot;
    gPlaySt.time_saved = GetGameTime();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        WriteGameSavePackedUnit(&gUnitArrayBlue[i], &dest->units[i]);

    ReadGlobalSaveInfo(&info);

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        SGM_SetCharacterKnown(UNIT_CHAR_ID(&gUnitArrayBlue[i]), &info);

    WriteGlobalSaveInfo(&info);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteBonusContentClaimFlags(dest);
    WritePermanentFlags(dest->permanentFlags);

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, slot);
    WriteLastGameSaveId(slot);
}

void ReadGameSave(int slot)
{
    int i;
    struct GameSaveBlock * src = GetSaveReadAddr(slot);

    if (!(gBmSt.flags & BM_FLAG_LINKARENA))
        InvalidateSuspendSave(SAVE_SUSPEND);

    ReadSramFast(src, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);
    gPlaySt.gameSaveSlot = slot;

    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        LoadSavedUnit(src->units + i, &gUnitArrayBlue[i]);

    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadBonusContentClaimFlags(src);
    WriteLastGameSaveId(slot);
}

bool IsSaveValid(int slot)
{
    return ReadSaveBlockInfo(NULL, slot);
}

void ReadGameSavePlaySt(int slot, struct PlaySt * buf)
{
    struct GameSaveBlock * src = GetSaveReadAddr(slot);
    ReadSramFast(&src->playSt, buf, sizeof(struct PlaySt));
}

u32 LoadSavedBonusClaimFlags(int slot)
{
    u32 buf;
    struct GameSaveBlock * src = GetSaveReadAddr(slot);
    ReadSramFast(&src->bonusClaimFlags, &buf, sizeof(buf));
    return buf;
}

bool IsChapterPostLyn(struct PlaySt * play_st)
{
    if (play_st->chapterIndex > 0xD)
        return true;

    return false;
}

bool IsGameNotFirstChapter(struct PlaySt * play_st)
{
    if (play_st->chapterIndex <= 0xB)
    {
        if (play_st->chapterIndex > 0)
            return true;
    }
    else if (play_st->chapterIndex > 0xD)
        return true;

    return false;
}

bool IsGameSaveNotFirstChapter(int slot)
{
    struct PlaySt play_st;

    if (!IsSaveValid(slot))
        return false;

    ReadGameSavePlaySt(slot, &play_st);
    return IsGameNotFirstChapter(&play_st);
}

void WriteGameSavePackedUnit(struct Unit * unit, void * sram_dest)
{
    int i;
    struct GameSavePackedUnit unitp;

    unitp.pid = UNIT_CHAR_ID(unit);
    unitp.jid = unit->pClassData->number;

    if (unit->pCharacterData == NULL)
    {
        struct Unit tmp_unit;
        unit = &tmp_unit;
        ClearUnit(&tmp_unit);
        unitp.pid = 0;
        unitp.jid = 0;
    }

    unitp.level = unit->level;
    unitp.exp = unit->exp;
    unitp.xPos = unit->xPos;
    unitp.yPos = unit->yPos;

    unitp.max_hp = unit->maxHP;
    unitp.pow = unit->pow;
    unitp.skl = unit->skl;
    unitp.spd = unit->spd;
    unitp.def = unit->def;
    unitp.res = unit->res;
    unitp.lck = unit->lck;
    unitp.con_bonus = unit->conBonus;
    unitp.mov_bonus = unit->movBonus;

    unitp.item1 = unit->items[0];
    unitp.item2 = unit->items[1];
    unitp.item3 = unit->items[2];
    unitp.item4 = unit->items[3];
    unitp.item5 = unit->items[4];

    unitp.flag = 0;

    if (unit->state & US_DEAD)
        unitp.flag |= PACKED_US_DEAD;

    if (unit->state & US_NOT_DEPLOYED)
        unitp.flag |= PACKED_US_UNDEPLOYED;

    if (unit->state & US_SOLOANIM_1)
        unitp.flag |= PACKED_US_SOLO_ANIM1;

    if (unit->state & US_SOLOANIM_2)
        unitp.flag |= PACKED_US_SOLO_ANIM2;

    if (unit->state & US_GROWTH_BOOST)
        unitp.flag |= PACKED_US_METIS_TOME;

    if (unit->state & US_BIT16)
        unitp.flag |= PACKED_US_B4;

    if (unit->state & US_BIT25)
        unitp.flag |= PACKED_US_B5;

    for (i = 0; i < 8; i++)
        unitp.wpnRanks[i] = unit->ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unitp.supports[i] = unit->supports[i];

    WriteAndVerifySramFast(&unitp, sram_dest, sizeof(unitp));
}

void LoadSavedUnit(const void * sram_src, struct Unit * unit)
{
    int i;
    struct GameSavePackedUnit unitp;

    ReadSramFast(sram_src, &unitp, sizeof(unitp));

    unit->pCharacterData = GetCharacterData(unitp.pid);
    unit->pClassData = GetClassData(unitp.jid);
    unit->level = unitp.level;
    unit->exp = unitp.exp;
    unit->xPos = unitp.xPos;
    unit->yPos = unitp.yPos;

    unit->maxHP = unitp.max_hp;
    unit->pow = unitp.pow;
    unit->skl = unitp.skl;
    unit->spd = unitp.spd;
    unit->def = unitp.def;
    unit->res = unitp.res;
    unit->lck = unitp.lck;
    unit->conBonus = unitp.con_bonus;
    unit->movBonus = unitp.mov_bonus;

    unit->items[0] = unitp.item1;
    unit->items[1] = unitp.item2;
    unit->items[2] = unitp.item3;
    unit->items[3] = unitp.item4;
    unit->items[4] = unitp.item5;

    if (unit->exp > 99)
        unit->exp = -1;

    unit->state = 0;

    if (unitp.flag & PACKED_US_DEAD)
        unit->state = US_HIDDEN | US_DEAD;

    if (unitp.flag & PACKED_US_UNDEPLOYED)
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

    if (unitp.flag & PACKED_US_SOLO_ANIM1)
        unit->state |= US_SOLOANIM_1;

    if (unitp.flag & PACKED_US_SOLO_ANIM2)
        unit->state |= US_SOLOANIM_2;

    if (unitp.flag & PACKED_US_METIS_TOME)
        unit->state |= US_GROWTH_BOOST;

    if (unitp.flag & PACKED_US_B4)
        unit->state |= US_BIT16;

    if (unitp.flag & PACKED_US_B5)
        unit->state |= US_BIT25;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unitp.wpnRanks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unitp.supports[i];

    SetUnitHp(unit, GetUnitMaxHp(unit));
    unit->supportBits = 0;

    if (unit->exp == 0x7F)
        unit->exp = -1;

    if (unit->xPos == 0x3F)
        unit->xPos = -1;

    if (unit->yPos == 0x3F)
        unit->yPos = -1;
}

void InvalidateSuspendSave(int slot)
{
    struct SaveBlockInfo chunk;
    chunk.kind = SAVE_KIND_INVALID;

    WriteSaveBlockInfo(&chunk, slot);

    if (slot == SAVE_SUSPEND)
        WriteSaveBlockInfo(&chunk, SAVE_SUSPEND_ALT);
}

void WriteSuspendSave(int slot)
{
    struct SuspendSaveBlock * dest;
    struct SaveBlockInfo chunk;
    u8 list[0x10];
    int i;
    struct SuspendSavePackedUnit * buf;

    if (sub_8031B40())
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return;

    if (!IsSramWorking())
        return;

    slot += GetNextSuspendSaveId();
    dest = GetSaveWriteAddr(slot);
    gPlaySt.time_saved = GetGameTime();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    StoreRNStateToActionStruct();
    WriteAndVerifySramFast(&gActionSt, &dest->action, sizeof(dest->action));

    buf = (void *)gBuf;

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayBlue[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayRed[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayGreen[i], buf++);

    WriteSramFast(gBuf, dest->blueUnits,
        (UNIT_SAVE_AMOUNT_BLUE + UNIT_SAVE_AMOUNT_RED + UNIT_SAVE_AMOUNT_GREEN) * sizeof(struct SuspendSavePackedUnit));

    WritePermanentFlags(dest->permanentFlags);
    WriteChapterFlags(dest->chapterFlags);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteTraps(dest->traps);

    GetForceDisabledMenuItems(list);
    WriteAndVerifySramFast(list, dest->menuOverride, sizeof(list));

    chunk.magic32 = SAVE_MAGIC32_SUS;
    chunk.kind = SAVE_KIND_SUSPEND;
    WriteSaveBlockInfo(&chunk, slot);

    gBmSt.just_resumed = false;
    WriteSwappedSuspendSaveId();
}

void ReadSuspendSave(int slot)
{
    int i;
    u8 list[0x10];
    struct SuspendSaveBlock * src = GetSaveReadAddr(slot + gSuspendSaveIdOffset);

    ReadSramFast(&src->playSt, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);

    ReadSramFast(&src->action, &gActionSt, sizeof(src->action));
    LoadRNStateFromActionStruct();
    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        ReadSuspendSavePackedUnit(&src->blueUnits[i], &gUnitArrayBlue[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        ReadSuspendSavePackedUnit(&src->redUnits[i], &gUnitArrayRed[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        ReadSuspendSavePackedUnit(&src->greenUnits[i], &gUnitArrayGreen[i]);

    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadChapterFlags(src->chapterFlags);
    ReadTraps(src->traps);

    ReadSramFast(src->menuOverride, list, sizeof(list));
    SetForceDisabledMenuItems(list);

    SetBonusContentClaimFlags(LoadSavedBonusClaimFlags(gPlaySt.gameSaveSlot));
}
