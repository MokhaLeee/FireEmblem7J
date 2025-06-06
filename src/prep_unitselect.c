#include "gbafe.h"

u16 CONST_DATA Sprite_08D8CDA8[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
};

u16 CONST_DATA Sprite_08D8CDBC[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0xC),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x10),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_08D8CDD0[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0xC),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0x17),
};

struct ProcCmd CONST_DATA ProcScr_PrepUnitScreen[] = {
    PROC_YIELD,
    PROC_SET_END_CB(ProcPrepUnit_OnEnd),
PROC_LABEL(0),
    PROC_CALL(ProcPrepUnit_OnInit),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
PROC_LABEL(1),
    PROC_REPEAT(ProcPrepUnit_Idle),
PROC_LABEL(2),
    PROC_CALL(sub_80946D0),
    PROC_REPEAT(sub_809463C),
    PROC_REPEAT(sub_8094714),
    PROC_REPEAT(sub_8094684),
    PROC_CALL(sub_80946E8),
    PROC_GOTO(1),
PROC_LABEL(3),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_8094374),
    PROC_CALL(sub_80947C0),
    PROC_YIELD,
    PROC_CALL(sub_80947E0),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_YIELD,
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(1),
PROC_LABEL(4),
    PROC_CALL(PrepUnitDisableDisp),
    PROC_SLEEP(2),
    PROC_CALL(sub_8094374),
    PROC_CALL(sub_809486C),
    PROC_YIELD,
    PROC_CALL(sub_8094888),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_SLEEP(2),
    PROC_CALL(PrepUnitEnableDisp),
    PROC_GOTO(1),
PROC_LABEL(99),
    PROC_CALL(ProcPrepUnit_OnGameStart),
    PROC_SLEEP(30),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(100),
PROC_LABEL(10),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
PROC_LABEL(100),
    PROC_END,
};
