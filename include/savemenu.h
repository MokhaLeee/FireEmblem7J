#pragma once

#include "global.h"
#include "proc.h"

#define REG_BLDY_16 (*(u16 volatile *) &REG_BLDY)

enum save_menu_action_flag_bitfile {
    SAVEMENU_ACTION_BITFILE_0 = 1 << 0,
    SAVEMENU_ACTION_BITFILE_1 = 1 << 1,
    SAVEMENU_ACTION_BITFILE_2 = 1 << 2,
    SAVEMENU_ACTION_BITFILE_3 = 1 << 3,
    SAVEMENU_ACTION_BITFILE_4 = 1 << 4,
    SAVEMENU_ACTION_BITFILE_5 = 1 << 5,
    SAVEMENU_ACTION_BITFILE_6 = 1 << 6, // save screen
    SAVEMENU_ACTION_BITFILE_7 = 1 << 7,
};

struct SaveMenuUnkProc1 {
    PROC_HEADER;

    /* 29 */
};

struct SaveMenuUnkProc2 {
    PROC_HEADER;

    /* 29 */
};

struct SaveMenuProc {
    PROC_HEADER;

    /* 29 */ u8 anim_clock;
    /* 2A */ u8 unk_2A;
    /* 2B */ u8 selected_id;
    /* 2C */ u8 copy_from_id;
    /* 2D */ u8 unk_2D; // proc label
    /* 2E */ u8 unk_2E;
    /* 2F */ u8 unk_2F;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u8 unk_36;
    /* 37 */ u8 unk_37[3]; // unsure of length
    /* 3A */ u8 unk_3A[3];
    /* 3D */ u8 unk_3D;
    /* 3E */ u8 in_rtext;
    /* 3F */ u8 unk_3F;
    /* 40 */ u16 unk_40;
    /* 42 */ u16 action_flag;
    /* 44 */ u32 unk_44[3]; // time value
    /* 50 */ u32 unk_50; // time value
    /* 54 */ struct SaveMenuUnkProc1 * proc1;
    /* 58 */ struct SaveMenuUnkProc2 * proc2;
    /* 5C */ ProcPtr proc3; // sprite anim proc
};

extern u8 gUnk_Savemenu_02000000;
extern u8 gUnk_Savemenu_02000001;
