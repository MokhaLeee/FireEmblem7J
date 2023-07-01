#pragma once

#include "proc.h"
#include "text.h"

enum statscreen_text_index {
    STATSCREEN_TEXT_PNAME,
    STATSCREEN_TEXT_JNAME,
    STATSCREEN_TEXT_UNUSED,
    STATSCREEN_TEXT_POW,
    STATSCREEN_TEXT_SKL,
    STATSCREEN_TEXT_SPD,
    STATSCREEN_TEXT_LCK,
    STATSCREEN_TEXT_DEF,
    STATSCREEN_TEXT_RES,
    STATSCREEN_TEXT_MOV,
    STATSCREEN_TEXT_CON,
    STATSCREEN_TEXT_AID,
    STATSCREEN_TEXT_RESCUE,
    STATSCREEN_TEXT_AFFINITY,
    STATSCREEN_TEXT_STATUS,
    // TODO: assert that there are as many items here than in inv
    STATSCREEN_TEXT_ITEM_A,
    STATSCREEN_TEXT_ITEM_B,
    STATSCREEN_TEXT_ITEM_C,
    STATSCREEN_TEXT_ITEM_D,
    STATSCREEN_TEXT_ITEM_E,
    STATSCREEN_TEXT_EQUIPRANGE,
    STATSCREEN_TEXT_EQUIPATTACK,
    STATSCREEN_TEXT_EQUIPHIT,
    STATSCREEN_TEXT_EQUIPCRIT,
    STATSCREEN_TEXT_EQUIPAVOID,
    STATSCREEN_TEXT_WEXP_A,
    STATSCREEN_TEXT_WEXP_B,
    STATSCREEN_TEXT_WEXP_C,
    STATSCREEN_TEXT_WEXP_D,
    STATSCREEN_TEXT_SUPPORT_A,
    STATSCREEN_TEXT_SUPPORT_B,
    STATSCREEN_TEXT_SUPPORT_C,
    STATSCREEN_TEXT_SUPPORT_D,
    STATSCREEN_TEXT_SUPPORT_E,
    STATSCREEN_TEXT_BWL,

    MAX_STATSCREEN_TEXT,
};

struct HelpBoxInfo;

struct HelpBoxProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct HelpBoxInfo const *info;

    /* 30 */ s16 x_box;
    /* 32 */ s16 y_box;
    /* 34 */ s16 w_box;
    /* 36 */ s16 h_box;
    /* 38 */ s16 x_box_init;
    /* 3A */ s16 y_box_init;
    /* 3C */ s16 x_box_fini;
    /* 3E */ s16 y_box_fini;
    /* 40 */ s16 w_box_init;
    /* 42 */ s16 h_box_init;
    /* 44 */ s16 w_box_fini;
    /* 46 */ s16 h_box_fini;
    /* 48 */ s16 timer;
    /* 4A */ s16 timer_end;

    /* 4C */ u16 msg;
    /* 4E */ u16 item;

    /* 50 */ u16 move_key_bit; // move ctrl proc only

    /* 52 */ u8 unk_52;

    // NOTE: there's likely more, need to decompile more files
};

struct HelpBoxInfo
{
    /* 00 */ struct HelpBoxInfo const *adjacent_up;
    /* 04 */ struct HelpBoxInfo const *adjacent_down;
    /* 08 */ struct HelpBoxInfo const *adjacent_left;
    /* 0C */ struct HelpBoxInfo const *adjacent_right;
    /* 10 */ u8 x, y;
    /* 12 */ u16 msg;
    /* 14 */ void (* redirect)(struct HelpBoxProc *proc);
    /* 18 */ void (* populate)(struct HelpBoxProc *proc);
};

struct StatScreenSt {
    /* 00 */ u8 page;
    /* 01 */ u8 page_count;
    /* 02 */ u16 page_slide_key_bit;
    /* 04 */ s16 x_disp_off; // Note: Always 0, not properly taked into account by most things
    /* 06 */ s16 y_disp_off;
    /* 08 */ bool8 is_transitioning;
    /* 0C */ struct Unit * unit;
    /* 10 */ struct MuProc * mu;
    /* 14 */ struct HelpBoxInfo const * help;
    /* 18 */ struct Text text[MAX_STATSCREEN_TEXT];
};

extern struct StatScreenSt gStatScreenSt;
extern u16 gBmFrameTmap0[];

void DisplayBwl(void);
int HelpBoxTryRelocateUp(struct HelpBoxProc *proc);
int HelpBoxTryRelocateDown(struct HelpBoxProc *proc);
int HelpBoxTryRelocateLeft(struct HelpBoxProc *proc);
int HelpBoxTryRelocateRight(struct HelpBoxProc *proc);
