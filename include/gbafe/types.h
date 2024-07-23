#pragma once

#include "gba/types.h"
#include <limits.h>

#ifndef __STDBOOL_H__
typedef s8 bool;
enum { false, true };
#define false	false
#define true	true
#define __bool_true_false_are_defined	1
#endif /* bool */

typedef void (* Func)(void);
typedef void * ProcPtr;
typedef void(* ProcFunc)(ProcPtr proc);

struct Vec2 {
    s16 x, y;
};

struct Vec2u {
    u16 x, y;
};

enum glb_pos {
    POS_L = 0,
    POS_R = 1,
    POS_INVALID = -1
};

struct ProcCmd;
struct SMSHandle;
struct Unit;
struct UnitDefinition;
struct BattleHit;
struct SupportBonuses;
struct BattleAnimDef;
struct BmBgxConf;
