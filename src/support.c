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