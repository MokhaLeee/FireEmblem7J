#pragma once

#include "global.h"
#include "proc.h"

typedef uintptr_t EventScr;

enum event_evbit_idx {
    EVENT_FLAG_UNITCAM = 1 << 0,
    EVENT_FLAG_TEXTSKIPPED = 1 << 1,
    EVENT_FLAG_SKIPPED = 1 << 2,
    EVENT_FLAG_DISABLESKIP = 1 << 3,
    EVENT_FLAG_DISABLETEXTSKIP = 1 << 4,
    EVENT_FLAG_ENDMAPMAIN = 1 << 5,
    EVENT_FLAG_NOAUTOCLEAR = 1 << 6,
};

struct EventProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ EventScr const * script_start;
    /* 30 */ EventScr const * script;

    STRUCT_PAD(0x34, 0x5E);

    /* 5E */ u16 evbits;
};

enum event_func_ret_idx {
    EVENT_CMDRET_CONTINUE,
    EVENT_CMDRET_JUMPED,
    EVENT_CMDRET_YIELD,
    EVENT_CMDRET_REPEAT,
};
