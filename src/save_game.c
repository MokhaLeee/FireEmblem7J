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
