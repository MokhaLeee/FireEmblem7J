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
void sub_809F098(void);
void EraseBonusContentData(void);
void * SramOffsetToAddr(u16 off);
u16 SramAddrToOffset(void * addr);
bool ReadSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
void WriteSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
// ??? EraseSaveBlockInfo
void * GetSaveWriteAddr(int save_id);
void * GetSaveReadAddr(int save_id);
// ??? sub_809F344
// ??? sub_809F364
// ??? sub_809F384
// ??? sub_809F3AC
// ??? sub_809F3D4
// ??? sub_809F3EC
s32 sub_809F40C(void);
// ??? sub_809F468
// ??? sub_809F48C
// ??? sub_809F490
// ??? sub_809F4C8
// ??? sub_809F4F0
// ??? sub_809F50C
// ??? sub_809F588
// ??? sub_809F5B0
// ??? sub_809F5FC
// ??? sub_809F660
// ??? sub_809F688
// ??? sub_809F6CC
// ??? sub_809F70C
// ??? sub_809F770
// ??? sub_809F88C
// ??? sub_809F908
// ??? sub_809F950
// ??? sub_809F994
// ??? nullsub_82
// ??? nullsub_83
bool IsGamePlayedThrough(void);
int sub_809F9F8(void);
// ??? sub_809FA3C
void sub_809FA94(void * buf);
// ??? sub_809FAC0
// ??? sub_809FADC
// ??? sub_809FAF4
// ??? sub_809FB0C
// ??? sub_809FB10
// ??? LoadAndVerfyRankData
// ??? LoadBonusContentData
void SaveBonusContentData(void * buf);
// ??? sub_809FC00
// ??? sub_809FC30
// ??? sub_809FC54
// ??? sub_809FC60
// ??? sub_809FCC4
// ??? sub_809FD04
// ??? sub_809FDC4
// ??? sub_80A0054
// ??? sub_80A00A4
// ??? LoadAndVerifySoundRoomData
// ??? WriteSoundRoomSaveData
// ??? IsSoundRoomSongUnlocked
// ??? UnlockSoundRoomSong
// ??? sub_80A01C8
// ??? sub_80A01EC
// ??? sub_80A0244
// ??? sub_80A0270
// ??? sub_80A02A8
// ??? LoadAndVerifySramSaveData

struct PidStats
{
    u32 loss_count      : 8;
    u32 favval          : 16;
    u32 act_count       : 8;
    u32 stat_view_count : 8;
    u32 defeat_chapter  : 6;
    u32 defeat_turn     : 10;
    u32 deploy_count    : 6;
    u32 move_count      : 10;
    u32 defeat_cause    : 4;
    u32 exp_gained      : 12;
    u32 win_count       : 10;
    u32 battle_count    : 12;
    u32 killer_pid      : 9;
    u32 : 0; // unused/padding (15 bits)
};

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
// ??? sub_80A053C
// ??? sub_80A0580
// ??? RegisterChapterStats
// ??? sub_80A05FC
// ??? sub_80A0628
// ??? sub_80A0654
// ??? sub_80A067C
// ??? sub_80A06BC
// ??? PidStatsAddBattleAmt
// ??? sub_80A0768
// ??? PidStatsRecordLoseData
// ??? PidStatsRecordDefeatInfo
// ??? sub_80A0938
void PidStatsAddStatView(u8 pid);
// ??? sub_80A09B8
// ??? PidStatsAddMove
// ??? PidStatsAddExpGained
// ??? PidStatsSubFavval08
// ??? sub_80A0ADC
// ??? sub_80A0AF0
// ??? sub_80A0B14
// ??? sub_80A0B44
// ??? sub_80A0B5C
// ??? sub_80A0B88
// ??? sub_80A0BA8
// ??? sub_80A0BDC
// ??? sub_80A0C14
void PidStatsRecordBattleRes(void);
bool IsPlaythroughIdUnique(int index);
int GetNewPlaythroughId(void);
int GetGlobalCompletionCntByInfo(struct GlobalSaveInfo * info);
int GetGlobalCompletionCount(void);
bool RegisterCompletedPlaythrough(struct GlobalSaveInfo * info, int index);
void SavePlayThroughData(void);
// ??? sub_80A0DFC
// ??? WriteCompletedPlaythroughSaveData
struct PidStats * GetPidStats(u8 pid);
// ??? sub_80A0F08
// ??? sub_80A0F14
// ??? sub_80A0F20
// ??? sub_80A0F3C
void WriteLastGameSaveId(int num);
int ReadLastGameSaveId(void);
// ??? sub_80A0FA8
void CopyGameSave(int index_src, int index_dest);
void WriteNewGameSave(int index, int isDifficult, int mode, int isTutorial);
void WriteGameSave(int slot);
void ReadGameSave(int slot);
bool IsSaveValid(int);
// ??? ReadGameSavePlaySt
// ??? sub_80A135C
// ??? sub_80A1384
// ??? sub_80A1398
// ??? sub_80A13B8
void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest);
void LoadSavedUnit(const void *sram_src, struct Unit *unit);
void InvalidateSuspendSave(int);
void WriteSuspendSave(int saveBlockId);
void ReadSuspendSave(int slot);
u8 IsValidSuspendSave(int);
// ??? ReadSuspendSavePlaySt
// ??? EncodeSuspendSavePackedUnit
// ??? ReadSuspendSavePackedUnit
// ??? WriteTraps
// ??? ReadTraps
// ??? sub_80A22AC
// ??? sub_80A22CC
// ??? WriteSwappedSuspendSaveId
int SramChecksum32(void const * sram_src, int size);
bool VerifySaveBlockChecksum(struct SaveBlockInfo * block_info);
void PopulateSaveBlockChecksum(struct SaveBlockInfo * block_info);
// ??? sub_80A236C
// ??? sub_80A2440
// ??? sub_80A2448
// ??? sub_80A245C
// ??? sub_80A25A4
// ??? sub_80A25D8
// ??? sub_80A261C
// ??? sub_80A2658
// ??? sub_80A26AC
// ??? sub_80A2724
// ??? sub_80A27C0
// ??? sub_80A2820
// ??? sub_80A2884
// ??? sub_80A28C0
// ??? sub_80A28E8
// ??? sub_80A2924
// ??? sub_80A294C
// ??? LoadAndVerfySuspendSave
// ??? ReadExtraMapSaveHead
// ??? GetExtraMapMapReadAddr
// ??? GetExtraMapMapSize
// ??? GetExtraMapInfoReadAddr
// ??? GetExtraMapInfoSize
// ??? ExtraMapChecksum
// ??? IsExtraMapAvailable
// ??? ReadExtraMapInfo
// ??? sub_80A2BE0
// ??? sub_80A2BE8
// ??? sub_80A2BF4
// ??? sub_80A2BF8
// ??? sub_80A2BFC
// ??? sub_80A2C10
// ??? sub_80A2C64
// ??? sub_80A2CB8
// ??? sub_80A2CD0
// ??? sub_80A2D64
// ??? sub_80A2D80
// ??? sub_80A2E14
// ??? sub_80A2EB8
// ??? sub_80A2FE0
// ??? sub_80A3020
// ??? sub_80A304C
// ??? sub_80A30C8
// ??? sub_80A32B4
// ??? sub_80A32C8
// ??? sub_80A3318
// ??? sub_80A3540
// ??? sub_80A3580
// ??? sub_80A35BC
// ??? sub_80A35D4
// ??? sub_80A36F8
// ??? sub_80A38A4
// ??? sub_80A3930
// ??? sub_80A3AE0
// ??? sub_80A3B20
// ??? sub_80A3BAC
// ??? sub_80A3BE8
// ??? sub_80A3C2C
// ??? sub_80A3C78
// ??? sub_80A3CF4
// ??? sub_80A3DBC
// ??? sub_80A3DDC
// ??? sub_80A3E18
// ??? sub_80A3EF8
// ??? sub_80A3F0C
