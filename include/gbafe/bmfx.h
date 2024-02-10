#pragma once

#include "global.h"
#include "proc.h"

struct ProcBmFx {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];

    /* 4C */ s16 counter;

    /* 4E */ u8 _pad_4E[0x64 - 0x4E];

    /* 64 */ s16 xPos;
    /* 66 */ s16 yPos;
};
