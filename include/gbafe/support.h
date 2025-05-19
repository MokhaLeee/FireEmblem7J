#pragma once

#include "global.h"

#include "unit.h"

enum { MAX_SIMULTANEOUS_SUPPORT_COUNT_PER_UNIT = 5 };

enum
{
    SUPPORT_LEVEL_NONE,
    SUPPORT_LEVEL_C,
    SUPPORT_LEVEL_B,
    SUPPORT_LEVEL_A,
};

enum
{
    SUPPORT_EXP_C = 81,
    SUPPORT_EXP_B = 161,
    SUPPORT_EXP_A = 241,
};

enum
{
    AFFINITY_1 = 1,
    AFFINITY_2 = 2,
    AFFINITY_3 = 3,
    AFFINITY_4 = 4,
    AFFINITY_5 = 5,
    AFFINITY_6 = 6,
    AFFINITY_7 = 7,
};

struct SupportData
{
    /* 00 */ u8 pids[UNIT_SUPPORT_MAX_COUNT];
    /* 0A */ u8 exp_base[UNIT_SUPPORT_MAX_COUNT];
    /* 14 */ u8 exp_growth[UNIT_SUPPORT_MAX_COUNT];
    /* 1E */ u8 count;
};

struct SupportBonuses {
    /* 00 */ u8 affinity;

    /* 01 */ u8 bonus_attack;
    /* 02 */ u8 bonus_defense;
    /* 03 */ u8 bonus_hit;
    /* 04 */ u8 bonus_avoid;
    /* 05 */ u8 bonus_crit;
    /* 06 */ u8 bonus_dodge;
};

int GetUnitSupporterCount(struct Unit * unit);
u8 GetUnitSupportPid(struct Unit * unit, int num);
struct Unit * GetUnitSupportUnit(struct Unit * unit, int num);
int GetUnitSupportLevel(struct Unit * unit, int num);
int GetUnitTotalSupportLevel(struct Unit * unit);
void UnitGainSupportExp(struct Unit * unit, int num);
void UnitGainSupportLevel(struct Unit * unit, int num);
bool CanUnitSupportNow(struct Unit * unit, int num);
int GetUnitInitialSupportExp(struct Unit * unit, int num);
int GetUnitSupportNumByPid(struct Unit * unit, u8 pid);
void sub_8026BD0(struct Unit * unit, int num);
bool sub_8026C04(struct Unit * unit, int num);
int GetUnitSupporterInitialExp(struct Unit * unit, int num);
int sub_8026C98(struct Unit * unit, u8 pid);
void ClearUnitSupports(struct Unit * unit);
void DoTurnSupportExp(void);
const struct SupportBonuses * sub_8026E1C(int affinity);
void sub_8026E3C(struct SupportBonuses * bonuses, int affinity, int level);
void sub_8026E94(struct SupportBonuses * bonuses);
int GetUnitSupportBonuses(struct Unit * unit, struct SupportBonuses * bonuses);
int GetUnitAffinityIcon(struct Unit * unit);
int GetAffinityIconByPid(int pid);
int GetSupportLevelSpecialChar(int level);
char const * GetAffinityName(int affinity);
void sub_8027028(u8 pid_a, u8 pid_b);
bool sub_8027078(struct Unit * unit, int num);
bool sub_8027090(u8 pid_a, u8 pid_b);
void SwapUnitStats(struct Unit * unit_a, struct Unit * unit_b);
