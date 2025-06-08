#pragma once

#include "global.h"
#include "proc.h"

enum
{
    PROCLABEL_LORD_SELECT_4 = 4,
    PROCLABEL_LORD_SELECT_5 = 5,
};

enum
{
    LORD_SELECT_STAT_1 = 1,
    LORD_SELECT_STAT_2 = 2,
    LORD_SELECT_STAT_3 = 3,
};

struct ProcLordSelect {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ u8 stat;

    STRUCT_PAD(0x2D, 0x32);

    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;

    /* 38 */ int unk_38;
    /* 3C */ int unk_3C;

    STRUCT_PAD(0x40, 0x4C);

    /* 4C */ int unk_4C;
};

void sub_80AFC3C(struct ProcLordSelect * proc);
// sub_80AFCC4
void sub_80AFD28(struct ProcLordSelect * proc);
// sub_80AFDAC
// SetLordSelectState
void sub_80AFDF8(struct ProcLordSelect * proc);
void sub_80AFE04(struct ProcLordSelect * proc);
void StartLordSelect(u8, ProcPtr);

extern struct ProcCmd CONST_DATA ProcScr_LordSelect[];
