#pragma once

#include "global.h"
#include "proc.h"
#include "anime.h"

struct ProcEkrBattle {
    PROC_HEADER;

    /* 29 */ u8 speedup;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 end;
    /* 30 */ STRUCT_PAD(0x30, 0x44);
    /* 44 */ int side;
    /* 48 */ int counter;
    /* 4C */ STRUCT_PAD(0x4C, 0x54);
    /* 54 */ int quote;
    /* 58 */ int unk58;
    /* 5C */ struct BaSprite * anim;
};

extern struct ProcEkrBattle * gpProcEkrBattle;

void SetBanimLinkArenaFlag(int unk);
int GetBanimLinkArenaFlag(void);
void NewEkrBattleDeamon(void);
void EndEkrBattleDeamon(void);
s8 IsBattleDeamonActive(void);
void EkrBattleDeamon_OnEnd(void);
void EkrBattleDeamonMain(ProcPtr proc);
void NewEkrBattle(void);
void InBattleMainRoutine(void);
void MainUpdateEkrBattle(void);
void EkrBattle_End(struct ProcEkrBattle * proc);
void EkrBattle_Init(struct ProcEkrBattle * proc);
void EkrBattle_Main(struct ProcEkrBattle * proc);
void EkrBattleStartBattleQuote(struct ProcEkrBattle * proc);
void EkrBattleWaitBattleQuote(struct ProcEkrBattle * proc);
void EkrBattleWaitWindowAppear(struct ProcEkrBattle * proc);
void EkrBattlePreDragonIntro(struct ProcEkrBattle * proc);
void EkrBattleExecDragonIntro(struct ProcEkrBattle * proc);
void EkrBattleWaitDragonIntro(struct ProcEkrBattle * proc);
void EkrBattlePostDragonIntro(struct ProcEkrBattle * proc);
void sub_0804BE68(struct ProcEkrBattle * proc);
void sub_0804BE84(struct ProcEkrBattle * proc);
void sub_0804BED8(struct ProcEkrBattle * proc);
void sub_0804BF0C(struct ProcEkrBattle * proc);
void sub_0804BF34(struct ProcEkrBattle * proc);
void sub_0804BFB8(struct ProcEkrBattle * proc);
void sub_0804BFCC(struct ProcEkrBattle * proc);
void sub_0804C008(struct ProcEkrBattle * proc);
void sub_0804C034(struct ProcEkrBattle * proc);
void sub_0804C130(struct ProcEkrBattle * proc);
void sub_0804C144(struct ProcEkrBattle * proc);
void sub_0804C1C8(struct ProcEkrBattle * proc);
void sub_0804C20C(struct ProcEkrBattle * proc);
void sub_0804C3F4(struct ProcEkrBattle * proc);
void sub_0804C440(struct ProcEkrBattle * proc);
void sub_0804C4AC(struct ProcEkrBattle * proc);
void sub_0804C588(struct ProcEkrBattle * proc);
void sub_0804C5BC(struct ProcEkrBattle * proc);
void EkrBattleLvupHanlder(struct ProcEkrBattle * proc);
void EkrBattleExecEkrLvup(struct ProcEkrBattle * proc);
void EkrBattleWaitLvup(struct ProcEkrBattle * proc);
void EkrBattleExecPopup(struct ProcEkrBattle * proc);
void EkrBattleWaitPopup(struct ProcEkrBattle * proc);
void EkrBattlePrepareEnding(struct ProcEkrBattle * proc);
void EkrBattleStartDragonEnding(struct ProcEkrBattle * proc);
void EkrBattleWaitDragonEnding(struct ProcEkrBattle * proc);
void EkrBattlePostDragonEnding(struct ProcEkrBattle * proc);
void EkrBattlePostEndDelay(struct ProcEkrBattle * proc);
