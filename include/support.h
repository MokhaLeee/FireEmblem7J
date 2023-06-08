#pragma once

#include "global.h"

struct SupportBonuses {
    /* 00 */ u8 affinity;

    /* 01 */ u8 bonus_attack;
    /* 02 */ u8 bonus_defense;
    /* 03 */ u8 bonus_hit;
    /* 04 */ u8 bonus_avoid;
    /* 05 */ u8 bonus_crit;
    /* 06 */ u8 bonus_dodge;
};
