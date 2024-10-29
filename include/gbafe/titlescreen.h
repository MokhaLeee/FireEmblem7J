#pragma once

#include "global.h"
#include "proc.h"

struct ProcTitle {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x30);

    /* 30 */ ProcPtr approc1, approc2, approc3, approc4, approc5, approc6;

    STRUCT_PAD(0x48, 0x64);

    /* 64 */ s16 timer;
};

// HBlank_TitleScreen
// ResetTitleBgAffin
// void Title_InitSpriteAnim(struct ProcTitle * proc, bool anim_en);
// Title_InitBg
// Title_Init
// Title_InitDisp
// sub_80BB210
// sub_80BB29C
// sub_80BB3EC
// sub_80BB46C
// sub_80BB510
// Title_IDLE
// sub_80BB5B0
// StartTitleScreen_WithMusic
// StartTitleScreen_FlagFalse
// StartTitleScreen_FlagTrue
// sub_80BB62C
// sub_80BB7D8
// sub_80BB7FC
// sub_80BB8CC
// sub_80BB940
// sub_80BBA64
// sub_80BBAA4
// sub_80BBAEC
// sub_80BBAFC
// sub_80BBB4C
// sub_80BBB5C
// sub_80BBD28
// sub_80BBD98
// sub_80BBDA8
// sub_80BBDD0
// sub_80BBF64
// sub_80BBFA0
// sub_80BBFAC
// sub_80BC1E8
// sub_80BC240
// sub_80BC398
// sub_80BC448
// sub_80BC4D0
// sub_80BC53C
// sub_80BC5B0
// sub_80BC5C4
// sub_80BC664
// sub_80BC688
// sub_80BC730
// sub_80BC7D8
// sub_80BC848
// sub_80BC858
// sub_80BC884
// sub_80BC8B8
// sub_80BCAAC
// sub_80BCACC
// sub_80BCB00
// sub_80BCB0C
// sub_80BCB6C
// sub_80BCC0C
// sub_80BCC9C
// nullsub_92
// sub_80BCD00
// sub_80BCD34
// sub_80BCE9C
// sub_80BCEBC
// sub_80BCF98
// sub_80BCFC4
// sub_80BCFD8
// sub_80BCFEC
// sub_80BD000
// sub_80BD0B4
// sub_80BD19C
// sub_80BD1F0
// sub_80BD2CC
// sub_80BD304
// sub_80BD358
// sub_80BD36C
// sub_80BD3A0
// sub_80BD3B0
// sub_80BD464
// sub_80BD47C
// sub_80BD48C
// sub_80BD4E0
// sub_80BD4F4
// sub_80BD534
// sub_80BD54C
// sub_80BD614
// sub_80BD6DC
// sub_80BD70C
// sub_80BD7C8
// sub_80BD7EC
// sub_80BD830
// sub_80BD83C
// sub_80BD850
// sub_80BD884
// sub_80BD904
// sub_80BD928
// sub_80BD96C
// sub_80BD978
// sub_80BD98C
// sub_80BD9B8
// sub_80BDB24
// sub_80BDB40
// sub_80BDBE4
// sub_80BDC2C
// sub_80BDCC0
// sub_80BDCFC
// sub_80BDD34
// sub_80BDE68
// sub_80BDEBC
// sub_80BDF7C
// sub_80BE01C
// sub_80BE04C
// sub_80BE0A0
// sub_80BE0B4
// sub_80BE0CC
// sub_80BE1CC
// sub_80BE1D0
// sub_80BE1DC
// sub_80BE2A8
