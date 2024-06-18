#pragma once

#include "global.h"

struct BonusClaimEnt {
    /* 00 */ u8 unseen;
    /* 01 */ u8 kind;
    /* 02 */ u8 itemId;
    /* 03 */ char str[0x11]; // Only used in FE8
};

extern struct BonusClaimEnt gBonusClaimData[];
extern CONST_DATA struct BonusClaimEnt * gpBonusClaimData;
