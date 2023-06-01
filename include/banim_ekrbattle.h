#pragma once

#include "common.h"
#include "banim_sprite.h"

struct ProcEkrBattle {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ i16 timer;
    /* 2E */ i16 end;
    /* 30 */ STRUCT_PAD(0x30, 0x44);
    /* 44 */ int side;
    /* 48 */ int counter;
    /* 4C */ STRUCT_PAD(0x4C, 0x54);
    /* 54 */ int quote;
    /* 58 */ int unk58;
    /* 5C */ struct BaSprite *bas;
};

extern struct ProcEkrBattle * EWRAM_DATA gUnk_Banim_0200005C;

extern int EWRAM_DATA gUnk_Banim_02000010;
extern int EWRAM_DATA gUnk_Banim_02000014;
extern int EWRAM_DATA gUnk_Banim_02000018;
extern int EWRAM_DATA gUnk_Banim_0200001C;
extern int EWRAM_DATA gUnk_Banim_0201771C;
extern struct ProcScr CONST_DATA gUnk_085CB508[];
extern struct ProcScr CONST_DATA gUnk_085CB528[];

void func_fe6_08042660(void);
