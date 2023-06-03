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

struct Vec2 {
    s16 x, y;
};

struct Vec2u {
    u16 x, y;
};

struct SMSHandle;
struct Unit;
struct UnitDefinition;
