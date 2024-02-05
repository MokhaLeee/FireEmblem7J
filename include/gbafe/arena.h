#pragma once

#include "global.h"

struct ArenaSt
{
    /* 00 */ struct Unit * player;
    /* 04 */ struct Unit * opponent;
    /* 08 */ short matchup_gold_value;
    /* 0A */ u8 result;
    /* 0B */ u8 unk_0B;
    /* 0C */ u8 range;
    /* 0D */ u8 player_weapon_kind;
    /* 0E */ u8 opponent_weapon_kind;
    /* 0F */ u8 player_jid;
    /* 10 */ u8 opponent_jid;
    /* 11 */ u8 player_level;
    /* 12 */ u8 opponent_level;
    /* 13 */ s8 player_is_magic;
    /* 14 */ s8 opponent_is_magic;
    /* 16 */ u16 player_power_ranking;
    /* 18 */ u16 opponent_power_ranking;
    /* 1A */ u16 player_weapon;
    /* 1C */ u16 opponent_weapon;
};

extern struct ArenaSt gArenaSt;
