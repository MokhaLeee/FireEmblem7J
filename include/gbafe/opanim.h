#pragma once

#include "global.h"
#include "proc.h"

void sub_80BBAEC(void);
void InitOpScanlineBuf(void);
void SwapOpScanlineBufs(void);
void sub_80BBB5C(void);
// sub_80BBD28
// sub_80BBD98
// sub_80BBDA8
void HBlank_80BBDD0(void);
void sub_80BBF64(struct Proc * proc);
void sub_80BBFA0(struct Proc * proc);
void sub_80BBFAC(struct Proc * proc);
// sub_80BC1E8
void sub_80BC240(struct Proc * proc);
void sub_80BC398(struct Proc * proc);
void sub_80BC448(struct Proc * proc);
void OpAnim_DrawWater(struct Proc * proc);
void sub_80BC53C(struct Proc * proc);
void sub_80BC5B0(struct Proc * proc);
void sub_80BC5C4(struct Proc * proc);
// sub_80BC664
// sub_80BC688
// sub_80BC730
// sub_80BC7D8
// sub_80BC848
// sub_80BC858
// sub_80BC884
void sub_80BC8B8(struct Proc * proc);
void sub_80BCAAC(struct Proc * proc);
void sub_80BCACC(struct Proc * proc);
// sub_80BCB00
void sub_80BCB0C(struct Proc * proc);
void sub_80BCB6C(struct Proc * proc);
void sub_80BCC0C(struct Proc * proc);
void sub_80BCC9C(struct Proc * proc);
// nullsub_92
// sub_80BCD00
void OpAnim_DrawCloud(struct Proc * proc);
void sub_80BCE9C(struct Proc * proc);
void sub_80BCEBC(struct Proc * proc);
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
void sub_80BD36C(struct Proc * proc);
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
// Proc_08DB9398_Loop
void sub_80BDC2C(void * a, const u16 * pal, int pal_bank, int size, ProcPtr parent);
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

struct OpScanlineSt {
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ int unk_08;
    /* 0C */ int unk_0C;
    /* 10 */ int unk_10;
    /* 14 */ int unk_14;
    /* 18 */ int unk_18;
};

extern struct OpScanlineSt OpScanlineSt;

extern u8 OpScanlineBuf[];
extern u8 * gpOpScanlineBufs[2];

struct Struct_02007508 {
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ int unk_08;
    /* 0C */ int unk_0C;
};

extern struct Struct_02007508 gUnkOpAnim_02007508;

// ??? gUnk_08DB8FC0
// ??? gUnk_08DB8FC4
// ??? gUnk_08DB8FC8
// ??? gUnk_08DB8FCC
// ??? gUnk_08DB8FD0
// ??? gUnk_08DB9010
extern struct ProcCmd CONST_DATA ProcScr_08DB9030[];
extern struct ProcCmd CONST_DATA ProcScr_OpeningSeqence[];
extern struct ProcCmd CONST_DATA ProcScr_08DB91A8[];
extern struct ProcCmd CONST_DATA ProcScr_08DB91C0[];
extern struct ProcCmd CONST_DATA ProcScr_08DB9208[];
// ??? gUnk_08DB9228
// ??? gUnk_08DB9248
// ??? gUnk_08DB92C8
// ??? gUnk_08DB9320
// ??? ProcScr_08DB9378
// ??? ProcScr_08DB9398
// ??? gUnk_08DB93B0
// ??? ProcScr_08DB93D0
// ??? gUnk_08DB93F0
// ??? gUnk_08DB941C
// ??? gUnk_08DB947C
// ??? gUnk_08DB9548
// ??? gUnk_08DB95D8
// ??? gUnk_08DB9674
// ??? gUnk_08DB9794
// ??? gUnk_08DB9A7C
