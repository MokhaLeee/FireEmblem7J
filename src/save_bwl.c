#include "gbafe.h"

// TODO: becomes the non-static inline GetPidStats once the whole file is decompiled
static inline struct PidStats * GetPidStats_(u8 pid)
{
    if (pid >= PID_STATS_COUNT)
        return NULL;
    else if (GetCharacterData(pid)->affinity == 0)
        return NULL;
    else
        return &gPidStatsData[pid - 1];
}

void ClearPidChStatsSaveData(void * sram_dest)
{
    int i;

    CpuFill16(0, gPidStatsData, sizeof(gPidStatsData));
    CpuFill16(0, gChapterStats, sizeof(gChapterStats));

    for (i = 0; i < PID_STATS_COUNT; i++)
    {
        gPidStatsData[i].favval = 0x2000;
        WriteAndVerifySramFast(gPidStatsData, (struct PidStats *)(sram_dest + 0x860) + i, sizeof(struct PidStats));
    }

    for (i = 0; i < CHAPTER_STATS_COUNT; i++)
        WriteAndVerifySramFast(gChapterStats, (struct ChapterStats *)(sram_dest + 0xCC0) + i, sizeof(struct ChapterStats));

    gPidStatsSaveLoc = sram_dest + 0x860;
}

void ClearPidStats_ret(void)
{
    gPlaySt.unk2C_04 = 0;
    SetGold(0);
    ClearPidStats();
}

void ClearPidStats(void)
{
    CpuFill16(0, gPidStatsData, sizeof(gPidStatsData));
    gPlaySt.unk_38_2 = 0;
    gPlaySt.unk_34_14 = 0;
    gPlaySt.unk_38_1 = 0;
    gPlaySt.unk_34_00 = 0;
    gPlaySt.total_gold = GetPartyTotalGoldValue();
}

void ReadPidStats(void * sram_src)
{
    ReadSramFast(sram_src, gPidStatsData, sizeof(gPidStatsData));
    gPidStatsSaveLoc = sram_src;
}

void ReadChapterStats(void * sram_src)
{
    ReadSramFast(sram_src, gChapterStats, sizeof(gChapterStats));
}

void WritePidStats(void * sram_dest)
{
    WriteAndVerifySramFast(gPidStatsData, sram_dest, sizeof(gPidStatsData));
    gPidStatsSaveLoc = sram_dest;
}

void WriteChapterStats(void * sram_dest)
{
    WriteAndVerifySramFast(gChapterStats, sram_dest, sizeof(gChapterStats));
}

struct ChapterStats * GetChapterStats(int index)
{
    return &gChapterStats[index];
}

bool IsChapterStatsValid(struct ChapterStats * stats)
{
    return stats->chapter_turn != 0;
}

int GetNextChapterStatsSlot(void)
{
    struct ChapterStats * stats = GetChapterStats(0);
    int i;

    for (i = 0; stats->chapter_turn != 0; i++, stats++)
        ;

    return i;
}

int GetCurCompleteChapters(void)
{
    struct ChapterStats * stats = GetChapterStats(0);
    int count = 0;

    for (; stats->chapter_turn != 0; stats++)
    {
        if (IsChapterCountedForCompletion(stats->chapter_index))
            count++;
    }

    return count;
}

int GetNextChapterStatsEntry(void)
{
    int index = GetNextChapterStatsSlot();

    if (index == 0)
        return -1;
    else
        return GetChapterStats(index - 1)->chapter_index;
}

void RegisterChapterStats(struct PlaySt * play_st)
{
    struct ChapterStats * stats = GetChapterStats(GetNextChapterStatsSlot());
    int time, turn;

    time = (GetGameTime() - play_st->time_chapter_started) / 180;
    if (time > 60000)
        time = 60000;

    turn = play_st->chapterTurnNumber;
    if (turn > 500)
        turn = 500;

    stats->chapter_index = play_st->chapterIndex;
    stats->chapter_turn = turn;
    stats->chapter_time = time;
}

int GetGameTotalTime_unused(void)
{
    int time = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;

    if (time < index)
        for (; i < index; i++)
            time += GetChapterStats(i)->chapter_time * 180;

    return time;
}

int GetGameTotalTurnCount(void)
{
    int ret = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;

    if (ret < index)
        for (; i < index; i++)
            ret += GetChapterStats(i)->chapter_turn;

    return ret;
}

bool IsChapterCountedForCompletion(int chapter)
{
    switch (gPlaySt.chapterModeIndex)
    {
    case 1:
        if (chapter <= 0xB)
            return true;

        break;

    case 2:
    case 3:
        if (chapter > 0xB)
            return true;

        break;
    }

    return false;
}

u32 GetGameTotalTime(void)
{
    int time = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;
    struct ChapterStats * cur;

    for (; i < index; i++)
    {
        cur = GetChapterStats(i);

        if (IsChapterCountedForCompletion(cur->chapter_index))
            time += cur->chapter_time * 180;
    }

    return time;
}

int GetGameTotalTurnCount2(void)
{
    int count = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;
    struct ChapterStats * cur;

    for (; i < index; i++)
    {
        cur = GetChapterStats(i);

        if (IsChapterCountedForCompletion(cur->chapter_index))
            count += cur->chapter_turn;
    }

    return count;
}

void PidStatsAddBattleAmt(struct Unit * unit)
{
    u32 pid;
    struct PidStats * bwl;

    if (UNIT_FACTION(unit) != FACTION_BLUE)
        return;

    pid = UNIT_CHAR_ID(unit);

    bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    if (bwl->battle_count < 4000)
        bwl->battle_count++;

    PidStatsAddFavval(UNIT_CHAR_ID(unit), 4);
}

void PidStatsAddWinAmt(u8 pid)
{
    struct PidStats * bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    if (bwl->win_count < 1000)
        bwl->win_count++;

    PidStatsAddFavval(pid, 0x10);
}

void PidStatsRecordLoseData(u8 pid)
{
    struct SaveBlockInfo buf;
    int chunk_index;
    struct { u8 _pad[0x19EC]; struct PidStats pidStats[PID_STATS_COUNT]; } * ssb;
    struct { u8 _pad[0x860]; struct PidStats pidStats[PID_STATS_COUNT]; } * gsb;

    if (IsSramWorking())
    {
        struct PidStats * bwl = GetPidStats_(pid);
        if (bwl == NULL)
            return;

        if (gBmSt.just_resumed == true)
            return;

        if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
            return;

        if (gBmSt.flags & BM_FLAG_LINKARENA)
            return;

        if (gBmSt.flags & BM_FLAG_5)
            return;

        if (gPlaySt.chapterStateBits & 0x80)
            return;

        if (bwl->loss_count >= 200)
            return;

        bwl->loss_count++;

        PidStatsAddFavval(pid, -0x80);

        chunk_index = GetLastSuspendSaveId() + SAVE_SUSPEND;

        ssb = GetSaveWriteAddr(chunk_index);
        WriteAndVerifySramFast(bwl, &ssb->pidStats[pid - 1], 1);

        ReadSaveBlockInfo(&buf, chunk_index);
        WriteSaveBlockInfo(&buf, chunk_index);

        gsb = GetSaveWriteAddr(gPlaySt.gameSaveSlot);
        WriteAndVerifySramFast(bwl, &gsb->pidStats[pid - 1], 3);

        ReadSaveBlockInfo(&buf, gPlaySt.gameSaveSlot);
        WriteSaveBlockInfo(&buf, gPlaySt.gameSaveSlot);
    }
}

void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause)
{
    struct PidStats * bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    bwl->defeat_chapter = gPlaySt.chapterIndex;
    bwl->defeat_turn = gPlaySt.chapterTurnNumber;
    bwl->killer_pid = killerPid;
    bwl->defeat_cause = deathCause;
}

void PidStatsAddActAmt(u8 pid)
{
    struct PidStats * bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    if (bwl->act_count < 200)
        bwl->act_count++;

    PidStatsAddFavval(pid, 2);
}

void PidStatsAddStatView(u8 pid)
{
    struct PidStats * bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    if (bwl->stat_view_count < 200)
        bwl->stat_view_count++;

    PidStatsAddFavval(pid, 2);
}

void PidStatsAddDeployAmt(u8 pid)
{
    struct PidStats * bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    if (bwl->deploy_count < 60)
        bwl->deploy_count++;

    PidStatsAddFavval(pid, 0x40);
}

void PidStatsAddMove(u8 pid, int amount)
{
    int move_count;
    struct PidStats * bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    move_count = bwl->move_count + amount;
    if (move_count > 1000)
        move_count = 1000;

    bwl->move_count = move_count;

    PidStatsAddFavval(pid, 2);
}

void PidStatsAddExpGained(u8 pid, int expGain)
{
    int exp;
    struct PidStats * bwl = GetPidStats_(pid);
    if (bwl == NULL)
        return;

    exp = bwl->exp_gained + expGain;
    if (exp > 4000)
        exp = 4000;

    bwl->exp_gained = exp;

    PidStatsAddFavval(pid, expGain);
}

void PidStatsSubFavval08(u8 pid)
{
    PidStatsAddFavval(pid, -0x08);
}

void PidStatsSubFavval100(u8 pid)
{
    PidStatsAddFavval(pid, -0x100);
}

int PidStatsGetTotalBattleAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < PID_STATS_COUNT; i++)
        ret += gPidStatsData[i].battle_count;

    return ret;
}

int PidStatsGetTotalWinAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < PID_STATS_COUNT; i++)
        ret += gPidStatsData[i].win_count;

    return ret;
}

int PidStatsGetTotalLossAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < PID_STATS_COUNT; i++)
        ret += gPidStatsData[i].loss_count;

    return ret;
}

int PidStatsGetTotalLevel(void)
{
    int i, ret = 0;

    for (i = 0; i < PID_STATS_COUNT; i++)
        ret += gPidStatsData[i].exp_gained / 100;

    return ret;
}

int PidStatsGetTotalExpGain(void)
{
    int i, ret = 0;

    for (i = 0; i < PID_STATS_COUNT; i++)
        ret += gPidStatsData[i].exp_gained;

    return ret;
}
