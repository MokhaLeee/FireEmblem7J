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

void sub_809F098(void)
{
    u8 buf[0x24];
    CPU_FILL(0, buf, sizeof(buf), 16);
    sub_809FA94(buf);
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
