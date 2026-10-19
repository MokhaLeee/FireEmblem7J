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
