#include "gbafe.h"

char const SaveMarker[] = "AGB-FE7";

CONST_DATA struct SramMain * gSramMain = CART_SRAM;
extern bool EWRAM_DATA gIsSramWorking;

void SramInit(void)
{
    u32 buf[2];

    buf[0] = 0x12345678;
    buf[1] = 0x87654321;

    SetSramFastFunc();

    REG_IE |= INTR_FLAG_GAMEPAK;

    WriteSramFast(&buf[0], (void *)gSramMain + 0x73B8, sizeof(u32));
    ReadSramFast((void *)gSramMain + 0x73B8, &buf[1], sizeof(u32));

    gIsSramWorking = (buf[1] == buf[0]) ? TRUE : FALSE;
}

bool IsSramWorking(void)
{
    return gIsSramWorking;
}

void WipeSram(void)
{
    u32 buf[0x10];
    int i;

    for (i = 0; i < (int) ARRAY_COUNT(buf); i++)
        buf[i] = 0xFFFFFFFF;

    for (i = 0; i < CART_SRAM_SIZE / (int) sizeof(buf); i++)
        WriteAndVerifySramFast(buf, (void *)gSramMain + i * sizeof(buf), sizeof(buf));
}

u16 Checksum16(void const * data, int size)
{
    u16 const * data_u16 = data;

    int i;

    u32 add_acc = 0;
    u32 xor_acc = 0;

    for (i = 0; i < size / 2; ++i)
    {
        add_acc += data_u16[i];
        xor_acc ^= data_u16[i];
    }

    return add_acc + xor_acc;
}

bool ReadGlobalSaveInfo(struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;

    if (!IsSramWorking())
        return FALSE;

    if (info == NULL)
        info = &local_info;

    ReadSramFast(&gSramMain->head, info, sizeof(struct GlobalSaveInfo));

    if (!StringEquals(info->name, SaveMarker))
        return FALSE;

    if (info->magic32 == SAVE_MAGIC32 && info->magic16 == SAVE_MAGIC16 && info->checksum == Checksum16(info, GLOBALSIZEINFO_SIZE_FOR_CHECKSUM))
        return TRUE;

    return FALSE;
}

void WriteGlobalSaveInfo(struct GlobalSaveInfo * info)
{
    info->checksum = Checksum16(info, GLOBALSIZEINFO_SIZE_FOR_CHECKSUM);
    WriteAndVerifySramFast(info, &gSramMain->head, sizeof(struct GlobalSaveInfo));
}

void WriteGlobalSaveInfoNoChecksum(struct GlobalSaveInfo * info)
{
    WriteAndVerifySramFast(info, &gSramMain->head, sizeof(struct GlobalSaveInfo));
}

void InitGlobalSaveInfo(void)
{
    struct GlobalSaveInfo info;
    int i;

    WipeSram();
    StringCopy(info.name, SaveMarker);

    info.magic32 = SAVE_MAGIC32;
    info.magic16 = SAVE_MAGIC16;

    info.completed  = 0;
    info.flag0E_1 = 0;
    info.Eirk_mode_easy = 0;
    info.Eirk_mode_norm = 0;
    info.Eirk_mode_hard = 0;
    info.Ephy_mode_easy = 0;
    info.Ephy_mode_norm = 0;
    info.Ephy_mode_hard = 0;

    info.game_end = 0;

    info.unk10_00 = 0;
    info.unk10_08 = 0;
    info.unk10_18 = 0;

    info.last_suspend_slot = 0;
    info.last_game_save_id = 0;

    for (i = 0; i < 0xC; i++)
        info.cleared_playthroughs[i] = 0;

    for (i = 0; i < 0x20; i++)
        info.SuppordRecord[i] = 0;

    for (i = 0; i < 0x20; i++)
        info.charKnownFlags[i] = 0;

    WriteGlobalSaveInfo(&info);
}

void ResetFe6LinkSaveInfo(void)
{
    struct Fe6LinkSaveInfo buf;
    CPU_FILL(0, &buf, sizeof(buf), 16);
    WriteFe6LinkSaveInfo(&buf);
}

void EraseBonusContentData(void)
{
    u8 * buf = gBuf;
    CPU_FILL(0, buf, 0x284, 16);
    SaveBonusContentData(buf);
}

void * SramOffsetToAddr(u16 off)
{
    return ((void *) gSramMain) + off;
}

u16 SramAddrToOffset(void * addr)
{
    return ((u8 *) addr) - ((u8 *) (void *) gSramMain);
}

bool ReadSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id)
{
    struct SaveBlockInfo local_block_info;
    u32 magic32;

    if (block_info == NULL)
        block_info = &local_block_info;

    ReadSramFast(&gSramMain->block_info[save_id], block_info, sizeof(struct SaveBlockInfo));

    if (block_info->magic16 != SAVE_MAGIC16)
        return FALSE;

    switch (save_id)
    {
        case SAVE_GAME0:
        case SAVE_GAME1:
        case SAVE_GAME2:
            magic32 = SAVE_MAGIC32_SAV;
            break;

        case SAVE_SUSPEND:
        case SAVE_SUSPEND_ALT:
            magic32 = SAVE_MAGIC32_SUS;
            break;

        case SAVE_MULTIARENA:
            magic32 = SAVE_MAGIC32_MULTIARENA;
            break;

        case SAVE_XMAP:
            magic32 = SAVE_MAGIC32_XMAP;
            break;

        default:
            return FALSE;
    }

    if (block_info->magic32 != magic32)
        return FALSE;

    return VerifySaveBlockChecksum(block_info);
}

void WriteSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id)
{
    block_info->magic16 = SAVE_MAGIC16;

#if BUGFIX
    chuck->offset = SramAddrToOffset(GetSaveWriteAddr(save_id));
#else
    block_info->offset = (uintptr_t)GetSaveWriteAddr(save_id);
#endif

    if (save_id >= SAVE_COUNT)
        return;

    switch (block_info->kind)
    {
        case SAVE_KIND_GAME:
            block_info->size = 0xD8C;
            break;

        case SAVE_KIND_SUSPEND:
            block_info->size = 0x1F2C;
            break;

        case SAVE_KIND_MULTIARENA:
            block_info->size = 0x874;
            break;

        case SAVE_KIND_XMAP:
            block_info->size = 0xC00;
            break;

        case SAVE_KIND_INVALID:
            block_info->size = 0;
            block_info->offset = 0;
            block_info->magic16 = 0;
            break;

        default:
            return;
    }

    PopulateSaveBlockChecksum(block_info);
    WriteAndVerifySramFast(block_info, &gSramMain->block_info[save_id], sizeof(struct SaveBlockInfo));
}

void EraseSaveBlockInfo(int index)
{
    struct SaveBlockInfo chunk;

    if (index < SAVE_COUNT) {
        CpuFill16(0xFFFF, &chunk, sizeof(struct SaveBlockInfo));
        WriteAndVerifySramFast(
            &chunk,
            &gSramMain->block_info[index],
            sizeof(struct SaveBlockInfo));
    }
}

void * GetSaveWriteAddr(int save_id)
{
    switch (save_id)
    {
        case SAVE_GAME0:
            return (void *)gSramMain + 0x3F2C;

        case SAVE_GAME1:
            return (void *)gSramMain + 0x4CB8;

        case SAVE_GAME2:
            return (void *)gSramMain + 0x5A44;

        case SAVE_SUSPEND:
            return (void *)gSramMain + 0x00D4;

        case SAVE_SUSPEND_ALT:
            return (void *)gSramMain + 0x2000;

        case SAVE_MULTIARENA:
            return (void *)gSramMain + 0x67D0;

        case SAVE_XMAP:
            return SRAM_XMAP_ADDR;

        default:
            return NULL;
    }
}

void * GetSaveReadAddr(int save_id)
{
    struct SaveBlockInfo block_info;
    ReadSaveBlockInfo(&block_info, save_id);
    return SramOffsetToAddr(block_info.offset);
}

void WriteChapterFlags(void * sram_dest)
{
    WriteAndVerifySramFast(GetChapterFlagBits(), sram_dest, GetChapterFlagBitsSize());
}

void WritePermanentFlags(void * sram_dest)
{
    WriteAndVerifySramFast(GetPermanentFlagBits(), sram_dest, GetPermanentFlagBitsSize());
}

void ReadChapterFlags(void * ewram_dest)
{
    ReadSramFast(ewram_dest, GetChapterFlagBits(), GetChapterFlagBitsSize());
}

void ReadPermanentFlags(void * ewram_dest)
{
    ReadSramFast(ewram_dest, GetPermanentFlagBits(), GetPermanentFlagBitsSize());
}

void sub_809F3D4(void * sram_dest)
{
    WriteAndVerifySramFast(sub_802EBCC(), sram_dest, 0xC8);
}

void sub_809F3EC(void * ewram_dest)
{
    ReadSramFast(ewram_dest, sub_802EBCC(), 0xC8);
}

s32 sub_809F40C(void)
{
    struct GlobalSaveInfo info;
    s32 ret = 0;
    int count;

    if (ReadGlobalSaveInfo(&info))
    {
        count = GetGlobalCompletionCntByInfo(&info);
        ret = CheckLinkedToFE6() ? 2 : 0;

        if (info.completed)
        {
            if (info.Eirk_mode_easy || info.Eirk_mode_norm)
                ret = 0xF;

            if (info.Eirk_mode_hard)
                ret |= 0x10;

            if (count > 4)
                ret |= 0x10;
        }
    }

    return ret;
}

bool sub_809F468(void)
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info))
        return info.Eirk_mode_hard;

    return false;
}

bool sub_809F48C(void)
{
    return true;
}

bool sub_809F490(void)
{
    int i;

    if (!IsSramWorking())
        return false;

    for (i = 0; i < 3; i++)
        if (sub_80A13B8(i))
            return true;

    return sub_80A294C();
}

bool sub_809F4C8(void)
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info) && (info.completed || info.flag0E_1))
        return true;

    return false;
}

bool sub_809F4F0(void)
{
    int known = GGM_IsAnyCharacterKnown(NULL);
    int played = IsGamePlayedThrough();
    return played & known;
}

u32 sub_809F50C(void)
{
    struct GameRankSaveDataPacks buf;
    u32 attr = 0;
    u8 played = IsGamePlayedThrough();

    if (!played)
        return 0;

    if (LoadAndVerfyRankData(&buf))
    {
        if (buf.pack[0].valid)
            attr = 1 << 0;

        if (buf.pack[1].valid)
            attr |= 1 << 1;

        if (buf.pack[2].valid)
            attr |= 1 << 2;

        if (buf.pack[3].valid)
            attr |= 1 << 3;

        if (buf.pack[4].valid)
            attr |= 1 << 4;

        if (buf.pack[5].valid)
            attr |= 1 << 5;
    }

    return attr;
}

bool sub_809F588(void)
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info) && IsExtraMapAvailable())
        return true;

    return false;
}

bool sub_809F5B0(void)
{
    u8 unused[0x48];
    struct BonusClaimEnt * ent;
    int i, ret;

    if (LoadBonusContentData(gBuf))
    {
        ret = false;
        ent = (void *)gBuf;

        for (i = 0x1F; i >= 0; ent++, i--)
        {
            if (!ent->unseen)
                continue;

            if (ent->kind == 0)
                ret = true;

            if (ent->kind == 2)
                ret = true;
        }

        if (ret)
            return true;
    }

    return false;
}

int GetUnitsAverageSupportValue(int unitA, int unitB)
{
    int i;

    for (i = 0; gUnk_08DAD284[i][0] != 0; i++)
    {
        if (gUnk_08DAD284[i][0] == unitA)
            if (gUnk_08DAD284[i][1] != unitB)
                return 2;

        if (gUnk_08DAD284[i][0] == unitB)
            if (gUnk_08DAD284[i][1] != unitA)
                return 2;

        if (gUnk_08DAD284[i][1] == unitA)
            if (gUnk_08DAD284[i][0] != unitB)
                return 2;

        if (gUnk_08DAD284[i][1] == unitB)
            if (gUnk_08DAD284[i][0] != unitA)
                return 2;
    }

    return 3;
}

int GetTotalAverageSupportValue(void)
{
    int ret = 0;
    struct SupportTalkEnt * ent;

    for (ent = gSupportTalkList; ent->unitA != 0; ent++)
        ret += GetUnitsAverageSupportValue(ent->unitA, ent->unitB);

    return ret;
}

int GetTotalGlobalSupportValue(struct GlobalSaveInfo * info)
{
    int i, j, tmp1, tmp2, ret = 0;
    struct GlobalSaveInfo local_info;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (i = 0; i < 0x20; i++)
    {
        for (j = 0; j < 4; j++)
        {
            tmp1 = 1 + i;
            tmp2 = info->SuppordRecord[tmp1 - 1];
            ret += (tmp2 >> (j << 1)) & 3;
        }
    }

    return ret;
}

int GetTotalSupportCollection(void)
{
    int tmp0 = GetTotalGlobalSupportValue(NULL);
    int tmp1 = GetTotalAverageSupportValue();

    if ((tmp0 > 0) && (0 == ((tmp0 * 100) / tmp1)))
        tmp0 = 1;
    else
        tmp0 = (tmp0 * 100) / tmp1;

    if (tmp0 > 100)
        tmp0 = 100;

    return tmp0;
}

int GetGlobalBestSupport(int unitA, int unitB, struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;
    int i = 0;
    int tmp0, tmp1;
    u8 * record;
    struct SupportTalkEnt * ent = gSupportTalkList;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    record = info->SuppordRecord;

    for (; ent->unitA != 0; i++, ent++)
    {
        if (ent->unitA == unitA && ent->unitB == unitB)
            break;

        if (ent->unitA == unitB && ent->unitB == unitA)
            break;
    }

    tmp0 = i >> 2;
    tmp1 = (3 & i) << 1;
    return 3 & record[tmp0] >> tmp1;
}

void GetGlobalSupportListFromSave(int pid, u8 * data, struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;
    struct SupportTalkEnt * ent;
    int i;
    int j;

    if (gCharacterData[pid - 1].pSupportData == NULL)
    {
        for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; data++, i++)
            *data = 0;

        return;
    }

    j = 0;
    ent = gSupportTalkList;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (; ; j++, ent++)
    {
        int tmp1, tmp2;

        if (ent->unitA == 0)
            break;

        if ((ent->unitA != pid) && (ent->unitB != pid))
            continue;

        tmp1 = j >> 2;
        tmp2 = (j & 3) << 1;

        for (i = 0; i < gCharacterData[pid - 1].pSupportData->count; i++)
        {
            if ((ent->unitA != gCharacterData[pid - 1].pSupportData->pids[i]) &&
                (ent->unitB != gCharacterData[pid - 1].pSupportData->pids[i]))
                continue;

            data[i] = (info->SuppordRecord[tmp1] >> tmp2) & 3;
            break;
        }
    }

    for (i = gCharacterData[pid - 1].pSupportData->count; i < UNIT_SUPPORT_MAX_COUNT; i++)
        data[i] = 0;
}

bool UpdateBestGlobalSupportValue(int unitA, int unitB, int rank)
{
    int convo;
    int var0;
    int var1;
    struct GlobalSaveInfo info;
    struct SupportTalkEnt * ent;

    rank = rank & 3;

    if (!ReadGlobalSaveInfo(&info))
        return false;

    convo = 0;

    for (ent = gSupportTalkList; ; ent++)
    {
        if (ent->unitA == 0)
            break;

        if ((ent->unitA == unitA) && (ent->unitB == unitB))
            break;

        if ((ent->unitA == unitB) && (ent->unitB == unitA))
            break;

        convo++;
    }

    var0 = convo >> 2;
    var1 = (convo & 3) << 1;

    if (((info.SuppordRecord[var0] >> var1) & 3) >= rank)
        return false;

    info.SuppordRecord[var0] &= ~(3 << var1);
    info.SuppordRecord[var0] += (rank << var1);

    WriteGlobalSaveInfo(&info);

    return true;
}

void SGM_SetCharacterKnown(int pid, struct GlobalSaveInfo * info)
{
    int loaded = false;
    struct GlobalSaveInfo local_info;

    if (pid > 0x100)
        return;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
        loaded = true;
    }

    info->charKnownFlags[pid >> 3] |= 1 << (pid & 7);

    if (loaded)
        WriteGlobalSaveInfo(info);
}

bool GGM_IsCharacterKnown(int pid, struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;
    u32 _pid = pid;

    if (pid > 0x100)
        return false;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(&local_info);
    }

    if (1 & info->charKnownFlags[pid >> 3] >> (_pid % 8))
        return true;
    else
        return false;
}

int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo * info)
{
    int i;
    struct GlobalSaveInfo local_info;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(&local_info);
    }

    for (i = 0; i < 0x20; i++)
    {
        if (info->charKnownFlags[i] != 0)
            return true;
    }

    return false;
}

void nullsub_82(void)
{
}

void nullsub_83(void)
{
}

int IsGamePlayedThrough(void)
{
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return false;

    if (info.completed == 0)
        return false;
    else
        return true;
}

int CheckLinkedToFE6(void)
{
    struct Fe6LinkSaveInfo fe6;
    struct GlobalSaveInfo info;
    int count;

    if (ReadGlobalSaveInfo(&info))
    {
        count = GetGlobalCompletionCntByInfo(&info);

        if (count > 9)
            return 2;

        if (count > 7)
            return 1;
    }

    if (ReadFe6LinkSaveInfo(&fe6))
        return fe6.unk20;

    return 0;
}

bool ReadFe6LinkSaveInfo(struct Fe6LinkSaveInfo * buf)
{
    struct Fe6LinkSaveInfo tmp;

    if (!IsSramWorking())
        return false;

    if (buf == NULL)
        buf = &tmp;

    ReadSramFast((void *)gSramMain + 0x70D8, buf, sizeof(struct Fe6LinkSaveInfo));

    if (buf->checksum != Checksum16(buf, sizeof(struct Fe6LinkSaveInfo) - 2))
        return false;
    else
        return true;
}

void WriteFe6LinkSaveInfo(struct Fe6LinkSaveInfo * buf)
{
    buf->checksum = Checksum16(buf, sizeof(struct Fe6LinkSaveInfo) - 2);
    WriteAndVerifySramFast(buf, (void *)gSramMain + 0x70D8, sizeof(struct Fe6LinkSaveInfo));
}

void sub_809FAC0(struct Fe6LinkSaveInfo * buf)
{
    CpuFastFill(0, buf, sizeof(struct Fe6LinkSaveInfo));
}

bool sub_809FADC(u32 * bits, int bit)
{
    bits += bit >> 5;
    return *bits & (1 << (bit & 0x1F));
}

void sub_809FAF4(u32 * bits, int bit)
{
    bits += bit >> 5;
    *bits |= 1 << (bit & 0x1F);
}

void sub_809FB0C(struct Fe6LinkSaveInfo * buf, int value)
{
    buf->unk20 = value;
}

int sub_809FB10(struct Fe6LinkSaveInfo * buf)
{
    return buf->unk20;
}

bool LoadAndVerfyRankData(struct GameRankSaveDataPacks * buf)
{
    if (!IsSramWorking())
        return false;

    if (buf == NULL)
        buf = (void *)gBuf;

    ReadSramFast((void *)gSramMain + 0x7044, buf, sizeof(struct GameRankSaveDataPacks));

    if (buf->magic0 != Checksum16(buf, 0x90))
        return false;
    else
        return true;
}

bool LoadBonusContentData(void * buf)
{
    struct BonusClaimSaveData * _buf = buf;

    if (!IsSramWorking())
        return false;

    if (_buf == NULL)
        _buf = (void *)gBuf;

    ReadSramFast((void *)gSramMain + 0x7134, _buf, sizeof(struct BonusClaimSaveData));

    if (_buf->cksum16 != Checksum16(_buf, sizeof(_buf->bonus)))
        return false;
    else
        return true;
}

void SaveBonusContentData(void * buf)
{
    struct BonusClaimSaveData * _buf = buf;
    _buf->cksum16 = Checksum16(_buf, sizeof(_buf->bonus));
    WriteAndVerifySramFast(buf, (void *)gSramMain + 0x7134, sizeof(struct BonusClaimSaveData));
}

void SaveRankings(struct GameRankSaveDataPacks * buf)
{
    buf->magic0 = Checksum16(buf, 0x90);
    WriteAndVerifySramFast(buf, (void *)gSramMain + 0x7044, sizeof(struct GameRankSaveDataPacks));
}

void EraseSaveRankData(void)
{
    u16 buf[sizeof(struct GameRankSaveDataPacks) / 2];

    CpuFill16(0, buf, sizeof(struct GameRankSaveDataPacks));
    SaveRankings((void *)buf);
}

int sub_809FC54(void)
{
    return gPlaySt.chapterModeIndex - 1;
}

bool GetRankDataEntry(struct GameRankSaveData * buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks packs;

    CpuFill16(0, buf, sizeof(struct GameRankSaveData));
    CpuFill16(0, &packs, sizeof(packs));

    if (LoadAndVerfyRankData(&packs))
    {
        *buf = packs.pack[chapter_mode + difficulty * 3];
        return true;
    }

    return false;
}

void SaveNewRankData(struct GameRankSaveData * buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks packs;

    if (LoadAndVerfyRankData(&packs))
    {
        packs.pack[chapter_mode + difficulty * 3] = *buf;
        SaveRankings(&packs);
    }
}
