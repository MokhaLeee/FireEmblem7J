#pragma once

#include "global.h"
#include "bm.h"
#include "bonusclaim.h"

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

struct BonusClaimSaveData {
    /* 000 */ struct BonusClaimEnt bonus[0x20];
    /* 280 */ u16 cksum16;
    /* 282 */ u16 unk282;
};

struct SoundRoomSaveData {
    /* 00 */ u32 flags[0x8];
    /* 20 */ u16 magic1;
    /* 22 */ u16 magic2;
};

struct bmsave_unkstruct2 {
    /* 00 */ u32 unk[0x4];
    /* 10 */ u16 magic1;
    /* 12 */ u16 magic2;
};

struct GameSavePackedUnit {
    /* 00 */ u32 jid        : 7;
             u32 level      : 5;
             u32 exp        : 7;
             u32 xPos       : 6;
             u32 yPos       : 6;

             u32 flag       : 13;

             u32 max_hp     : 6;
             u32 pow        : 5;
             u32 skl        : 5;
             u32 spd        : 5;
             u32 def        : 5;
             u32 res        : 5;
             u32 lck        : 5;
             u32 con_bonus  : 5;
             u32 mov_bonus  : 5;
             u32 item1      : 14;
             u32 item2      : 14;
             u32 item3      : 14;
             u32 item4      : 14;
             u32 item5      : 14;

    /* 14 */ u8 pid;
    /* 15 */ u8 wpnRanks[0x8];
    /* 1D */ u8 supports[7];
    /* 24 */
} BITPACKED;

enum packed_unit_state_bits {
    PACKED_US_DEAD       = 1 << 0,
    PACKED_US_UNDEPLOYED = 1 << 1,
    PACKED_US_SOLO_ANIM1 = 1 << 2,
    PACKED_US_SOLO_ANIM2 = 1 << 3,
    PACKED_US_METIS_TOME = 1 << 4,
    PACKED_US_B4         = 1 << 5,
    PACKED_US_B5         = 1 << 6,
    PACKED_US_NEW_FRIEND = 1 << 7,
};

// Written by FE6 (Binding Blade) when linked
struct Fe6LinkSaveInfo {
    /* 00 */ u8 unk00[0x20];
    /* 20 */ u16 unk20;
    /* 22 */ u16 checksum;
};

struct GameRankSaveData {
    /* 00 */ u32 valid : 0x01;
             u32 unk00_01 : 0x03; // overall rank
             u32 tacticsRank : 0x03;
             u32 survivalRank : 0x03;
             u32 fundsRank : 0x03;
             u32 expRank : 0x03;
             u32 combatRank : 0x03;

             u32 chapter_mode : 0x02;
             u32 chapter_stat : 0x01;
             u32 unk00_16 : 0x01;
             u32 unk00_17 : 0x08;
             u32 cuteguy : 0x08;

             u32 hours : 0x0A;
             u32 minutes : 0x06;
             u32 seconds : 0x06;
             u32 gold : 0x18;

    /* 08 */ u32 unk08_15 : 0x06;
             u32 unk08_1F : 0x01;

    /* 0C */ char tactician_name[0xB];

    /* 17 */ u8 luckydog;
} BITPACKED;

struct GameRankSaveDataPacks {
    /* 00 */ struct GameRankSaveData pack[6];
    /* 90 */ u16 magic0;
    /* 92 */ u16 unk92;
};

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
void ResetFe6LinkSaveInfo(void);
void EraseBonusContentData(void);
void * SramOffsetToAddr(u16 off);
u16 SramAddrToOffset(void * addr);
bool ReadSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
void WriteSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
// ??? EraseSaveBlockInfo
void * GetSaveWriteAddr(int save_id);
void * GetSaveReadAddr(int save_id);
void WriteChapterFlags(void * sram_dest);
void WritePermanentFlags(void * sram_dest);
void ReadChapterFlags(void * ewram_dest);
void ReadPermanentFlags(void * ewram_dest);
void WriteSupplyItems(void * sram_dest);
void ReadSupplyItems(void * ewram_dest);
s32 sub_809F40C(void);
bool sub_809F468(void);
bool sub_809F48C(void);
bool sub_809F490(void);
bool sub_809F4C8(void);
bool sub_809F4F0(void);
u32 sub_809F50C(void);
bool sub_809F588(void);
bool sub_809F5B0(void);
int GetUnitsAverageSupportValue(int unitA, int unitB);
int GetTotalAverageSupportValue(void);
int GetTotalGlobalSupportValue(struct GlobalSaveInfo * info);
int GetTotalSupportCollection(void);
int GetGlobalBestSupport(int unitA, int unitB, struct GlobalSaveInfo * info);
void GetGlobalSupportListFromSave(int pid, u8 * data, struct GlobalSaveInfo * info);
bool UpdateBestGlobalSupportValue(int unitA, int unitB, int rank);
void SGM_SetCharacterKnown(int pid, struct GlobalSaveInfo * info);
bool GGM_IsCharacterKnown(int pid, struct GlobalSaveInfo * info);
int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo * info);
void nullsub_82(void);
void nullsub_83(void);
int IsGamePlayedThrough(void);
int CheckLinkedToFE6(void);
bool ReadFe6LinkSaveInfo(struct Fe6LinkSaveInfo * buf);
void WriteFe6LinkSaveInfo(struct Fe6LinkSaveInfo * buf);
void sub_809FAC0(struct Fe6LinkSaveInfo * buf);
bool sub_809FADC(u32 * bits, int bit);
void sub_809FAF4(u32 * bits, int bit);
void sub_809FB0C(struct Fe6LinkSaveInfo * buf, int value);
int sub_809FB10(struct Fe6LinkSaveInfo * buf);
bool LoadAndVerfyRankData(struct GameRankSaveDataPacks * buf);
bool LoadBonusContentData(void * buf);
void SaveBonusContentData(void * buf);
void SaveRankings(struct GameRankSaveDataPacks * buf);
void EraseSaveRankData(void);
int sub_809FC54(void);
bool GetRankDataEntry(struct GameRankSaveData * buf, int chapter_mode, int difficulty);
void SaveNewRankData(struct GameRankSaveData * buf, int chapter_mode, int difficulty);
u8 JudgeGameRankSaveData(struct GameRankSaveData * old, struct GameRankSaveData * new);
void GenerateGameRankSaveData(struct GameRankSaveData * buf, int chapter_mode, int difficulty);
void SaveEndgameRankings(void);
void EraseSoundRoomData(void);
bool LoadAndVerifySoundRoomData(struct SoundRoomSaveData * buf);
void WriteSoundRoomSaveData(struct SoundRoomSaveData * buf);
bool IsSoundRoomSongUnlocked(struct SoundRoomSaveData * buf, int song);
void UnlockSoundRoomSong(struct SoundRoomSaveData * buf, int song);
void EraseLinkArenaStruct2(void);
bool LoadAndVerfyLinkArenaStruct2(struct bmsave_unkstruct2 * buf);
void WriteLinkArenaStruct2(struct bmsave_unkstruct2 * buf);
bool ModifySaveLinkArenaStruct2A(struct bmsave_unkstruct2 * buf, int val);
void ModifySaveLinkArenaStruct2B(struct bmsave_unkstruct2 * buf, int val);
void LoadAndVerifySramSaveData(void);

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
} BITPACKED;

struct ChapterStats {
    /* 00 */ u16 chapter_index : 0x07;
             u16 chapter_turn  : 0x09;
             u16 chapter_time  : 0x10;
};

#define UNIT_SAVE_AMOUNT_BLUE 0x34

struct GameSaveBlock {
    /* 000 */ struct PlaySt playSt;
    /* 048 */ struct GameSavePackedUnit units[UNIT_SAVE_AMOUNT_BLUE];
    /* 798 */ u8 supplyItems[0xC8];
    /* 860 */ struct PidStats pidStats[0x46];
    /* CC0 */ struct ChapterStats chapterStats[0x30];
    /* D80 */ u8 permanentFlags[0x08];
    /* D88 */ u32 bonusClaimFlags;
};


#define PID_STATS_COUNT 0x46
#define CHAPTER_STATS_COUNT 0x30

extern struct PidStats gPidStatsData[PID_STATS_COUNT];
extern struct ChapterStats gChapterStats[CHAPTER_STATS_COUNT];
extern struct PidStats * gPidStatsSaveLoc;

void SetGold(s32 amount);
void ClearPidChStatsSaveData(void * sram_dest);
void ClearPidStats_ret(void);
void ClearPidStats(void);
void ReadPidStats(void * sram_src);
void ReadChapterStats(void * sram_src);
void WritePidStats(void * sram_dest);
void WriteChapterStats(void * sram_dest);
struct ChapterStats * GetChapterStats(int index);
bool IsChapterStatsValid(struct ChapterStats * stats);
int GetNextChapterStatsSlot(void);
int GetCurCompleteChapters(void);
int GetNextChapterStatsEntry(void);
void RegisterChapterStats(struct PlaySt *);
int GetGameTotalTime_unused(void);
int GetGameTotalTurnCount(void);
bool IsChapterCountedForCompletion(int chapter);
u32 GetGameTotalTime(void);
int GetGameTotalTurnCount2(void);
void PidStatsAddBattleAmt(struct Unit * unit);
void PidStatsAddWinAmt(u8 pid);
void PidStatsRecordLoseData(u8 pid);
void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause);
void PidStatsAddActAmt(u8 pid);
void PidStatsAddStatView(u8 pid);
void PidStatsAddDeployAmt(u8 pid);
void PidStatsAddMove(u8 pid, int amount);
void PidStatsAddExpGained(u8 pid, int expGain);
void PidStatsSubFavval08(u8 pid);
void PidStatsSubFavval100(u8 pid);
int PidStatsGetTotalBattleAmt(void);
int PidStatsGetTotalWinAmt(void);
int PidStatsGetTotalLossAmt(void);
int PidStatsGetTotalLevel(void);
int PidStatsGetTotalExpGain(void);
int PidStatsGetExpGain(u8 pid);
int PidStatsGetFavval(u8 pid);
void PidStatsAddFavval(u8 pid, int amount);
void PidStatsRecordBattleRes(void);
bool IsPlaythroughIdUnique(int index);
int GetNewPlaythroughId(void);
int GetGlobalCompletionCntByInfo(struct GlobalSaveInfo * info);
int GetGlobalCompletionCount(void);
bool RegisterCompletedPlaythrough(struct GlobalSaveInfo * info, int index);
void SavePlayThroughData(void);
int GetCurrentGameMode(void);
void WriteCompletedPlaythroughSaveData(void);
struct PidStats * GetPidStats(u8 pid);
extern u32 gBonusContentClaimFlags;
u32 GetBonusContentClaimFlags(void);
void SetBonusContentClaimFlags(u32 flags);
void WriteBonusContentClaimFlags(void * sram_dest);
void ReadBonusContentClaimFlags(void * sram_src);
void WriteLastGameSaveId(int num);
int ReadLastGameSaveId(void);
void InvalidateGameSave(int index);
void CopyGameSave(int index_src, int index_dest);
void WriteNewGameSave(int index, int isDifficult, int mode);
void WriteGameSave(int slot);
void ReadGameSave(int slot);
bool IsSaveValid(int);
void ReadGameSavePlaySt(s32, struct PlaySt *);
u32 LoadSavedBonusClaimFlags(int slot);
bool IsChapterPostLyn(struct PlaySt * play_st);
bool IsGameNotFirstChapter(struct PlaySt * play_st);
bool IsGameSaveNotFirstChapter(int slot);
void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest);
void LoadSavedUnit(const void *sram_src, struct Unit *unit);
void InvalidateSuspendSave(int);
void WriteSuspendSave(int saveBlockId);
void ReadSuspendSave(int slot);
u8 IsValidSuspendSave(int);
void ReadSuspendSavePlaySt(int index, struct PlaySt * buf);
// ??? EncodeSuspendSavePackedUnit
// ??? ReadSuspendSavePackedUnit
// ??? WriteTraps
// ??? ReadTraps
int GetLastSuspendSaveId(void);
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
bool sub_80A294C(void);
bool LoadAndVerfySuspendSave(void);
// ??? ReadExtraMapSaveHead
// ??? GetExtraMapMapReadAddr
// ??? GetExtraMapMapSize
// ??? GetExtraMapInfoReadAddr
// ??? GetExtraMapInfoSize
// ??? ExtraMapChecksum
bool IsExtraMapAvailable(void);
// ??? ReadExtraMapInfo
// ??? sub_80A2BE0
// ??? sub_80A2BE8
// ??? sub_80A2BF4
// ??? sub_80A2BF8
void sub_80A2BFC(void); // NullBmMapHidden_
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
