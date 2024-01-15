#pragma once

#include "global.h"

enum save_chunk_idx {
    SAVE_GAME0,
    SAVE_GAME1,
    SAVE_GAME2,
    SAVE_SUSPEND,
    SAVE_SUSPEND_ALT,
    SAVE_MULTIARENA,
    SAVE_XMAP,
    SAVE_COUNT,
};

enum save_kind_idx {
    SAVE_KIND_GAME,
    SAVE_KIND_SUSPEND,
    SAVE_KIND_MULTIARENA,
    SAVE_KIND_XMAP,

    SAVE_KIND_INVALID = UINT8_MAX,
};

enum save_chunk_magics {
    SAVE_MAGIC32 = 0x30317,
    SAVE_MAGIC32_SAV = 0x11217,
    SAVE_MAGIC32_SUS = 0x20509,
    SAVE_MAGIC32_MULTIARENA = 0x20112,
    SAVE_MAGIC32_XMAP = 0x20223,
    SAVE_MAGIC16 = 0x200A,
};

#define MAX_CLEARED_PLAYTHROUGHS 12

struct GlobalSaveInfo {
    /* 00 */ char name[0x8];
    /* 08 */ u32 magic32;
    /* 0C */ u16 magic16;

    /* 0E */ u8 completed  : 1;
             u8 flag0E_1 : 1;
             u8 Eirk_mode_easy : 1;
             u8 Eirk_mode_norm : 1;
             u8 Eirk_mode_hard : 1;
             u8 Ephy_mode_easy : 1;
             u8 Ephy_mode_norm : 1;
             u8 Ephy_mode_hard : 1;

    /* 0F */ u8 game_end;

    /* 10 */ u32 unk10_00 : 8;
             u32 unk10_08 : 16;
             u32 unk10_18 : 5;
             u32 unk10_1D : 3;

    /* 14 */ u8 cleared_playthroughs[MAX_CLEARED_PLAYTHROUGHS];
    /* 20 */ u8 SuppordRecord[0x40 - 0x20];
    /* 40 */ u8 charKnownFlags[0x60 - 0x40];

    /* 60 */ u16 checksum;
    /* 62 */ u8 last_game_save_id;
    /* 63 */ u8 last_suspend_slot;
};

struct SaveBlockInfo {
    /* 00 */ u32 magic32;
    /* 04 */ u16 magic16;
    /* 06 */ u8 kind;
    /* 08 */ u16 offset;
    /* 0A */ u16 size;
    /* 0C */ u32 checksum32;
};

struct SramMain {
    struct GlobalSaveInfo head;
    struct SaveBlockInfo block_info[SAVE_COUNT];

    /* Todo */
};

#define GLOBALSIZEINFO_SIZE_FOR_CHECKSUM 0x50

#define SRAM_XMAP_SIZE 0xC00u
#define SRAM_XMAP_ADDR (CART_SRAM + CART_SRAM_SIZE - SRAM_XMAP_SIZE)

void SramInit(void);
bool IsSramWorking(void);
void WipeSram(void);
u16 Checksum16(void const * data, int size);
bool ReadGlobalSaveInfo(struct GlobalSaveInfo * info);
void WriteGlobalSaveInfo(struct GlobalSaveInfo * info);
void WriteGlobalSaveInfoNoChecksum(struct GlobalSaveInfo * info);
void InitGlobalSaveInfo(void);
void sub_0809F098(void);
void EraseBonusContentData(void);
void * SramOffsetToAddr(u16 off);
u16 SramAddrToOffset(void * addr);
bool ReadSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
void WriteSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
// ??? EraseSaveBlockInfo
void * GetSaveWriteAddr(int save_id);
void * GetSaveReadAddr(int save_id);
// ??? sub_0809F344
// ??? sub_0809F364
// ??? sub_0809F384
// ??? sub_0809F3AC
// ??? sub_0809F3D4
// ??? sub_0809F3EC
// ??? sub_0809F40C
// ??? sub_0809F468
// ??? sub_0809F48C
// ??? sub_0809F490
// ??? sub_0809F4C8
// ??? sub_0809F4F0
// ??? sub_0809F50C
// ??? sub_0809F588
// ??? sub_0809F5B0
// ??? sub_0809F5FC
// ??? sub_0809F660
// ??? sub_0809F688
// ??? sub_0809F6CC
// ??? sub_0809F70C
// ??? sub_0809F770
// ??? sub_0809F88C
// ??? sub_0809F908
// ??? sub_0809F950
// ??? sub_0809F994
// ??? nullsub_082
// ??? nullsub_083
// ??? sub_0809F9D0
// ??? sub_0809F9F8
// ??? sub_0809FA3C
void sub_0809FA94(void * buf);
// ??? sub_0809FAC0
// ??? sub_0809FADC
// ??? sub_0809FAF4
// ??? sub_0809FB0C
// ??? sub_0809FB10
// ??? sub_0809FB14
// ??? sub_0809FB70
void SaveBonusContentData(void * buf);
// ??? sub_0809FC00
// ??? sub_0809FC30
// ??? sub_0809FC54
// ??? sub_0809FC60
// ??? sub_0809FCC4
// ??? sub_0809FD04
// ??? sub_0809FDC4
// ??? sub_080A0054
// ??? sub_080A00A4
// ??? sub_080A00C8
// ??? sub_080A0120
// ??? sub_080A014C
// ??? sub_080A0184
// ??? sub_080A01C8
// ??? sub_080A01EC
// ??? sub_080A0244
// ??? sub_080A0270
// ??? sub_080A02A8
// ??? LoadAndVerifySramSaveData
// ??? ClearPidChStatsSaveData
// ??? ClearPidStats_ret
// ??? ClearPidStats
// ??? ReadPidStats
// ??? ReadChapterStats
// ??? WritePidStats
// ??? WriteChapterStats
// ??? GetChapterStats
// ??? IsChapterStatsValid
// ??? GetNextChapterStatsSlot
// ??? sub_080A053C
// ??? sub_080A0580
// ??? sub_080A05A0
// ??? sub_080A05FC
// ??? sub_080A0628
// ??? sub_080A0654
// ??? sub_080A067C
// ??? sub_080A06BC
// ??? PidStatsAddBattleAmt
// ??? sub_080A0768
// ??? sub_080A07C8
// ??? sub_080A08B4
// ??? sub_080A0938
// ??? sub_080A0978
// ??? sub_080A09B8
// ??? PidStatsAddMove
// ??? PidStatsAddExpGained
// ??? PidStatsSubFavval08
// ??? sub_080A0ADC
// ??? sub_080A0AF0
// ??? sub_080A0B14
// ??? sub_080A0B44
// ??? sub_080A0B5C
// ??? sub_080A0B88
// ??? sub_080A0BA8
// ??? sub_080A0BDC
// ??? sub_080A0C14
// ??? PidStatsRecordBattleResult
// ??? sub_080A0CE8
// ??? sub_080A0D38
// ??? sub_080A0D58
// ??? sub_080A0D74
// ??? sub_080A0D94
// ??? sub_080A0DCC
// ??? sub_080A0DFC
// ??? sub_080A0E48
// ??? GetPidStats
// ??? sub_080A0F08
// ??? sub_080A0F14
// ??? sub_080A0F20
// ??? sub_080A0F3C
// ??? sub_080A0F60
// ??? ReadLastGameSaveId
// ??? sub_080A0FA8
// ??? CopyGameSave
// ??? WriteNewGameSave
// ??? WriteGameSave
// ??? ReadGameSave
// ??? IsSaveValid
// ??? ReadGameSavePlaySt
// ??? sub_080A135C
// ??? sub_080A1384
// ??? sub_080A1398
// ??? sub_080A13B8
// ??? WriteGameSavePackedUnit
// ??? LoadSavedUnit
// ??? sub_080A1A60
// ??? WriteSuspendSave
// ??? ReadSuspendSave
// ??? IsValidSuspendSave
// ??? ReadSuspendSavePlaySt
// ??? EncodeSuspendSavePackedUnit
// ??? ReadSuspendSavePackedUnit
// ??? WriteTraps
// ??? ReadTraps
// ??? sub_080A22AC
// ??? sub_080A22CC
// ??? sub_080A22DC
// ??? sub_080A2304
bool VerifySaveBlockChecksum(struct SaveBlockInfo * block_info);
void PopulateSaveBlockChecksum(struct SaveBlockInfo * block_info);
// ??? sub_080A236C
// ??? sub_080A2440
// ??? sub_080A2448
// ??? sub_080A245C
// ??? sub_080A25A4
// ??? sub_080A25D8
// ??? sub_080A261C
// ??? sub_080A2658
// ??? sub_080A26AC
// ??? sub_080A2724
// ??? sub_080A27C0
// ??? sub_080A2820
// ??? sub_080A2884
// ??? sub_080A28C0
// ??? sub_080A28E8
// ??? sub_080A2924
// ??? sub_080A294C
// ??? sub_080A2984
// ??? sub_080A29DC
// ??? sub_080A2A50
// ??? sub_080A2A6C
// ??? sub_080A2A88
// ??? sub_080A2AA4
// ??? sub_080A2AC0
// ??? sub_080A2AE0
// ??? sub_080A2B50
// ??? sub_080A2BE0
// ??? sub_080A2BE8
// ??? sub_080A2BF4
// ??? sub_080A2BF8
// ??? sub_080A2BFC
// ??? sub_080A2C10
// ??? sub_080A2C64
// ??? sub_080A2CB8
// ??? sub_080A2CD0
// ??? sub_080A2D64
// ??? sub_080A2D80
// ??? sub_080A2E14
// ??? sub_080A2EB8
// ??? sub_080A2FE0
// ??? sub_080A3020
// ??? sub_080A304C
// ??? sub_080A30C8
// ??? sub_080A32B4
// ??? sub_080A32C8
// ??? sub_080A3318
// ??? sub_080A3540
// ??? sub_080A3580
// ??? sub_080A35BC
// ??? sub_080A35D4
// ??? sub_080A36F8
// ??? sub_080A38A4
// ??? sub_080A3930
// ??? sub_080A3AE0
// ??? sub_080A3B20
// ??? sub_080A3BAC
// ??? sub_080A3BE8
// ??? sub_080A3C2C
// ??? sub_080A3C78
// ??? sub_080A3CF4
// ??? sub_080A3DBC
// ??? sub_080A3DDC
// ??? sub_080A3E18
// ??? sub_080A3EF8
// ??? sub_080A3F0C
