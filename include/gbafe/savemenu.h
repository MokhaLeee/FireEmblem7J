#pragma once

#include "global.h"
#include "proc.h"

#define REG_BLDY_16 (*(u16 volatile *) &REG_BLDY)

enum videoalloc_savemenu {
    BGPAL_SAVEMENU_BG = 0,

    OBJPAL_SAVEMENU_WINDOW = 1,
};

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

void SaveMenuOnHBlank(void);
void sub_80A3FC8(struct SaveMenuProc * proc);
u8 SaveMenuIndexToValidBitfile(u8 byte, int num);
u8 sub_80A4018(u8 byte1, u8 byte2);
u8 sub_80A4054(u8 byte);
void SaveMenu_StartHelpBox(struct SaveMenuProc * proc);
// ??? LoadSaveMenuHelpText
// ??? SaveMenuPostChapterHandleHelpBox
// ??? sub_80A4254
// ??? SaveMenu_Init
// ??? ProcSaveMenu_InitScreen
// ??? SaveMenu_LoadExtraMenuGraphics
// ??? SaveMenuInit
// ??? SaveMenuInitUnused
// ??? SaveMenu_080A465C
// ??? Loop6C_savemenu
// ??? SaveMenuWriteNewGame
// ??? sub_80A4924
// ??? sub_80A4B10
// ??? sub_80A4D64
// ??? sub_80A4D70
// ??? sub_80A4D80
// ??? sub_80A5058
// ??? sub_80A50A0
// ??? sub_80A50F0
// ??? sub_80A5138
// ??? sub_80A517C
// ??? sub_80A51CC
// ??? sub_80A5218
// ??? sub_80A53C4
// ??? sub_80A542C
// ??? sub_80A5464
// ??? sub_80A54A8
// ??? sub_80A54C8
// ??? sub_80A5688
// ??? SaveMenu_Finish
// ??? sub_80A5764
// ??? sub_80A577C
// ??? sub_80A57A8
// ??? sub_80A57BC
// ??? sub_80A5838
// ??? sub_80A5868
// ??? sub_80A58C4
// ??? sub_80A5920
// ??? sub_80A5980
// ??? sub_80A5A40
// ??? sub_80A5A60
// ??? sub_80A5A80
// ??? sub_80A5A94
// ??? StartMainMenu
// ??? sub_80A5AD8
void sub_80A5AF8(ProcPtr);
// ??? sub_80A5B0C
void sub_80A5B20(s32, s32);

/* savedraw */
void sub_80A5B44(void);
// ??? sub_80A5C60
// ??? sub_80A5D24
// ??? sub_80A5D6C
// ??? sub_80A5DB4
// ??? sub_80A5DF0
// ??? sub_80A5E04
// ??? sub_80A5E18
// ??? sub_80A5E30
// ??? sub_80A5EFC
// ??? SaveDraw_Init
// ??? sub_80A61B0
// ??? sub_80A61FC
// ??? sub_80A6278
// ??? sub_80A62F4
// ??? sub_80A6430
// ??? SaveDraw_Loop
// ??? StartSaveDraw

/* savedrawfx */
struct ProcSpinRotation {
    PROC_HEADER;

    /* 2A */ u16 ro;
    /* 2C */ int angle;
    /* 30 */ ProcPtr savedraw;

    /* 34 */ u8 unk_34;
    /* 34 */ u8 unk_35;
    /* 34 */ u8 unk_36;
    /* 34 */ u8 unk_37;
    /* 34 */ u8 unk_38;
    /* 34 */ u8 unk_39;
    /* 34 */ u8 unk_3A;
    /* 34 */ u8 unk_3B;
    /* 34 */ u8 unk_3C_unused;
    /* 34 */ u8 unk_3D;
};

void SpinRotation_Init(struct ProcSpinRotation * proc);
void SpinRotation_Loop(struct ProcSpinRotation * proc);
ProcPtr StartSpinRotation(ProcPtr parent);
// ??? SaveDrawCursor_Init
// ??? SaveDrawCursor_Loop
// ??? sub_80A6B4C
// ??? sub_80A6B6C
// ??? StartSaveDrawCursor
// ??? sub_80A6BB0
// ??? sub_80A6BD8
// ??? sub_80A6C3C
// ??? sub_80A6C74
// ??? sub_80A6CA8
// ??? sub_80A6CBC
// ??? sub_80A6CD0
// ??? SaveMenuModifySaveSlot
// ??? sub_80A6E44
// ??? sub_80A6EE0
// ??? sub_80A6EF8
// ??? sub_80A6FF4
// ??? sub_80A7028
// ??? StartSaveBgUp

/* savemenu_difficulty */
// ??? sub_80A7058
// ??? sub_80A715C
// ??? sub_80A71EC
// ??? SaveMenuGetValidMenuAmt
// ??? nullsub_84

/* savemenu */
extern CONST_DATA u16 BgConfig_SaveMenu[];
// ??? gUnk_08DAD354
// ??? gUnk_08DAD384
// ??? ProcScr_SaveMenu
// ??? gUnk_08DAD674
// ??? gUnk_08DAD784
// ??? gpBonusClaimData
// ??? gUnk_08DAD848
// ??? gUnk_08DAD8A8
// ??? gUnk_08DAD8C2
// ??? gUnk_08DAD8FC
// ??? gUnk_08DAD904
// ??? gUnk_08DAD90C
// ??? gUnk_08DAD9D6
// ??? gUnk_08DAD9E4
// ??? gUnk_08DADA10
// ??? ProcScr_SaveDraw
// ??? ProcScr_SpinRotation
// ??? ProcScr_SaveDrawCursor
// ??? gUnk_08DADAAC
// ??? gUnk_08DADAC8
// ??? ProcScr_SaveBgUp
