#include "gbafe.h"

int GetUnitSupporterCount(struct Unit* unit) {

    if (!UNIT_SUPPORT_DATA(unit)) 
        return 0;

    return UNIT_SUPPORT_DATA(unit)->count;
}

u8 GetUnitSupportPid(struct Unit* unit, int num) {
    
    if (!UNIT_SUPPORT_DATA(unit))
        return 0;
    return UNIT_SUPPORT_DATA(unit)->pids[num];
}

struct Unit* GetUnitSupportUnit(struct Unit* unit, int num) {
    
    u8 pid = GetUnitSupportPid(unit, num);

    int i, last;
    
    for (i = UNIT_FACTION(unit) + 1, last = UNIT_FACTION(unit) + 0x40; i < last; ++i) {

        unit = GetUnit(i);

        if (!unit)
            continue;
        
        if (!unit->pCharacterData)
            continue;

        if (unit->pCharacterData->number == pid)
            return unit;
    }

    return NULL;

}

int GetUnitSupportLevel(struct Unit* unit, int num) {

    int exp = unit->supports[num];

    if (exp >= SUPPORT_EXP_A)
        return SUPPORT_LEVEL_A;
    
    if (exp >= SUPPORT_EXP_B)
        return SUPPORT_LEVEL_B;

    if (exp >= SUPPORT_EXP_C)
        return SUPPORT_LEVEL_C;

    return SUPPORT_LEVEL_NONE;
}

int GetUnitTotalSupportLevel(struct Unit* unit) {

    int i, count, result;
    
    count = GetUnitSupporterCount(unit);

    for (i = 0, result = 0; i < count; ++i) 
        result += GetUnitSupportLevel(unit, i);

    return result;
}

extern int gUnk_08C03440[];

void UnitGainSupportExp(struct Unit * unit, s32 num)
{
    if (gPlaySt.chapterModeIndex == 1)
        return;

    if (UNIT_SUPPORT_DATA(unit) != NULL)
    {
        int gain = UNIT_SUPPORT_DATA(unit)->exp_growth[num];
        int current_exp = unit->supports[num];
        int max_exp = gUnk_08C03440[GetUnitSupportLevel(unit, num)];

        if ((current_exp + gain) > max_exp)
        {
            gain = max_exp - current_exp;
        }

        unit->supports[num] = current_exp + gain;
        gPlaySt.chapterTotalSupportGain += gain;
    }
}

void sub_8026BD0(struct Unit * unit, int num)
{
    unit->supports[num]++;
    gPlaySt.chapterTotalSupportGain++;

    sub_8027028(unit->pCharacterData->number, GetUnitSupportPid(unit, num));
}

bool sub_8026C04(struct Unit * unit, int num)
{
    int exp;
    int max_exp;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return false;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return false;

    if (sub_8027078(unit, num))
        return false;

    if (GetUnitTotalSupportLevel(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT_PER_UNIT)
        return false;

    if (GetUnitTotalSupportLevel(GetUnitSupportUnit(unit, num)) >= MAX_SIMULTANEOUS_SUPPORT_COUNT_PER_UNIT)
        return false;

    exp = unit->supports[num];
    max_exp = gUnk_08C03440[GetUnitSupportLevel(unit, num)];

    if (exp == SUPPORT_EXP_A)
        return false;

    return (exp == max_exp) ? true : false;
}

int GetUnitSupporterInitialExp(struct Unit * unit, int num)
{
    if (UNIT_SUPPORT_DATA(unit) == NULL)
        return -1;

    return UNIT_SUPPORT_DATA(unit)->exp_base[num];
}

int sub_8026C98(struct Unit * unit, u8 pid)
{
    int i;
    int count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; i++)
    {
        if (GetUnitSupportPid(unit, i) == pid)
            return i;
    }

    return -1;
}

void ClearUnitSupports(struct Unit * unit)
{
    int i;
    int count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; i++)
    {
        struct Unit * other = GetUnitSupportUnit(unit, i);

        if (other == NULL)
            continue;

        other->supports[sub_8026C98(other, unit->pCharacterData->number)] = 0;
        unit->supports[i] = 0;
    }
}

void DoTurnSupportExp(void)
{
    int i;
    int j;
    int j_max;

    if (gPlaySt.chapterTurnNumber == 1)
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        if (GetUnitTotalSupportLevel(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT_PER_UNIT)
            continue;

        j_max = GetUnitSupporterCount(unit);

        for (j = 0; j < j_max; j++)
        {
            struct Unit * other = GetUnitSupportUnit(unit, j);

            if (other == NULL)
                continue;

            if (other->state & US_UNAVAILABLE)
                continue;

            if (UNIT_FACTION(other) != FACTION_BLUE)
                continue;

            switch (RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos))
            {
            case 0:
                if (!(unit->rescue == other->index))
                    break;

                goto add_support_points;

            case 1:
                if ((unit->state & US_RESCUED) || (other->state & US_RESCUED))
                    break;

            add_support_points:
                if (GetUnitTotalSupportLevel(other) < MAX_SIMULTANEOUS_SUPPORT_COUNT_PER_UNIT)
                    UnitGainSupportExp(unit, j);

                break;
            }
        }
    }
}

extern struct SupportBonuses gUnk_08D61E78[];

const struct SupportBonuses * sub_8026E1C(int affinity)
{
    const struct SupportBonuses * it;

    for (it = gUnk_08D61E78; it->affinity; it++)
    {
        if (it->affinity == affinity)
            return it;
    }

#if BUGFIX
    return NULL;
#endif
}

void sub_8026E3C(struct SupportBonuses * bonuses, int affinity, int level)
{
    const struct SupportBonuses * added = sub_8026E1C(affinity);

    bonuses->bonus_attack += level * added->bonus_attack;
    bonuses->bonus_defense += level * added->bonus_defense;
    bonuses->bonus_hit += level * added->bonus_hit;
    bonuses->bonus_avoid += level * added->bonus_avoid;
    bonuses->bonus_crit += level * added->bonus_crit;
    bonuses->bonus_dodge += level * added->bonus_dodge;
}

void sub_8026E94(struct SupportBonuses * bonuses)
{
    bonuses->bonus_attack = 0;
    bonuses->bonus_defense = 0;
    bonuses->bonus_hit = 0;
    bonuses->bonus_avoid = 0;
    bonuses->bonus_crit = 0;
    bonuses->bonus_dodge = 0;
}

#define SUPPORT_BONUSES_MAX_DISTANCE 3

int GetUnitSupportBonuses(struct Unit * unit, struct SupportBonuses * bonuses)
{
    int i;
    int count;

    int result = 0;

    sub_8026E94(bonuses);

    count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; i++)
    {
        struct Unit * other;
        int level1;
        int level2;

        result = result >> 1;
        other = GetUnitSupportUnit(unit, i);

        if (other == NULL)
            continue;

        if (!(gBmSt.flags & BM_FLAG_LINKARENA))
        {
            if (RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos) > SUPPORT_BONUSES_MAX_DISTANCE)
                continue;
        }

        if (other->state & (US_UNAVAILABLE | US_RESCUED))
            continue;

        level1 = GetUnitSupportLevel(other, sub_8026C98(other, unit->pCharacterData->number));
        sub_8026E3C(bonuses, other->pCharacterData->affinity, level1);

        level2 = GetUnitSupportLevel(unit, i);
        sub_8026E3C(bonuses, unit->pCharacterData->affinity, level2);

        if (level1 != 0 && level2 != 0)
            result += 1 << (count - 1);
    }

    bonuses->bonus_attack /= 2;
    bonuses->bonus_defense /= 2;
    bonuses->bonus_hit /= 2;
    bonuses->bonus_avoid /= 2;
    bonuses->bonus_crit /= 2;
    bonuses->bonus_dodge /= 2;

    return result;
}

int GetUnitAffinityIcon(struct Unit * unit)
{
    int affinity = unit->pCharacterData->affinity;

    if (affinity == 0)
        return -1;

    return 0x79 + affinity; // TODO: Icon constants
}

int GetAffinityIconByPid(int pid)
{
    int affinity = GetCharacterData(pid)->affinity;

    if (affinity == 0)
        return -1;

    return 0x79 + affinity; // TODO: Icon constants
}

extern u8 gUnk_081C947C[];

int GetSupportLevelSpecialChar(int level)
{
    u8 chars[4] =
    {
        TEXT_SPECIAL_DASH,
        TEXT_SPECIAL_C,
        TEXT_SPECIAL_B,
        TEXT_SPECIAL_A
    };

    return chars[level];
}

char const * GetAffinityName(int affinity)
{
    char const * lut[] =
    {
        [0] = JTEXT("ー"),
        [AFFINITY_1] = JTEXT("炎"),
        [AFFINITY_2] = JTEXT("雷"),
        [AFFINITY_3] = JTEXT("風"),
        [AFFINITY_4] = JTEXT("氷"),
        [AFFINITY_5] = JTEXT("闇"),
        [AFFINITY_6] = JTEXT("光"),
        [AFFINITY_7] = JTEXT("理"),
    };

    return lut[affinity];
}

void sub_8027028(u8 pid_a, u8 pid_b)
{
    struct Unit * unit = GetUnitFromCharId(pid_a);
    int num = sub_8026C98(unit, pid_b);

    unit->supportBits |= (1 << num);

    unit = GetUnitFromCharId(pid_b);
    num = sub_8026C98(unit, pid_a);

    unit->supportBits |= (1 << num);
}

bool sub_8027078(struct Unit * unit, int num)
{
    bool result = unit->supportBits & (1 << num);
    return result ? true : false;
}

bool sub_8027090(u8 pid_a, u8 pid_b)
{
    struct Unit * unit = GetUnitFromCharId(pid_a);

    if (GetUnitSupportLevel(unit, sub_8026C98(unit, pid_b)) > SUPPORT_LEVEL_B)
        return true;

    return false;
}

void SwapUnitStats(struct Unit * unit_a, struct Unit * unit_b)
{
    if (unit_a != NULL && unit_b != NULL)
    {
        // clang-format off
        #define SWAP(aType, aLValueA, aLValueB) \
        do { \
            aType tmp; \
            tmp = (aLValueA); \
            (aLValueA) = (aLValueB); \
            (aLValueB) = tmp; \
        } while (0)
        // clang-format on

        SWAP(u8, unit_a->level, unit_b->level);
        SWAP(u8, unit_a->exp, unit_b->exp);

        SWAP(u8, unit_a->maxHP, unit_b->maxHP);
        SWAP(u8, unit_a->curHP, unit_b->curHP);
        SWAP(u8, unit_a->pow, unit_b->pow);
        SWAP(u8, unit_a->skl, unit_b->skl);
        SWAP(u8, unit_a->spd, unit_b->spd);
        SWAP(u8, unit_a->def, unit_b->def);
        SWAP(u8, unit_a->res, unit_b->res);
        SWAP(u8, unit_a->lck, unit_b->lck);
        SWAP(u8, unit_a->conBonus, unit_b->conBonus);
        SWAP(u8, unit_a->movBonus, unit_b->movBonus);

        SWAP(u16, unit_a->items[0], unit_b->items[0]);
        SWAP(u16, unit_a->items[1], unit_b->items[1]);
        SWAP(u16, unit_a->items[2], unit_b->items[2]);
        SWAP(u16, unit_a->items[3], unit_b->items[3]);
        SWAP(u16, unit_a->items[4], unit_b->items[4]);

#undef SWAP
    }
}