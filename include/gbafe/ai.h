#pragma once

#include "global.h"
#include "proc.h"

// AiPhase_Begin
// sub_8034E24
// sub_8034E84
// sub_8034E94
// sub_8034EBC
// sub_8034F64
// sub_8034FA4
// sub_8035044
// sub_80350BC
// sub_803515C
// sub_80351C8
// sub_80351D4
// sub_8035208
// sub_8035308
// AiSetDecision
// sub_803536C
// sub_80353B4
// sub_8035418
// sub_80354C8
// sub_80354E4
// sub_803551C
// sub_8035578
// sub_80355BC
// sub_80355E4
// sub_80355FC
// sub_803569C
// sub_8035714
// sub_803576C
// sub_80357E4
// sub_8035824
// sub_8035870
// sub_80358F8
// sub_8035930
// sub_8035964
// sub_8035968
// sub_80359AC
// sub_80359D4
// sub_80359FC
// sub_8035B0C
// sub_8035BEC
// sub_8035C30
// sub_8035C68
// sub_8035C6C
// sub_8035C90
// sub_8035CC4
// sub_8035D10
// sub_8035D74
// sub_8035E64
// sub_8035F10
// sub_803602C
// sub_8036148
// AiReachesByBirdsEyeDistance
// sub_803627C
// sub_80362E4
// sub_8036300
// sub_803631C
// sub_8036420
// sub_8036478
// sub_80365C0
// sub_80367F4
// sub_8036868
// sub_80368E4
// sub_8036960
// sub_80369EC
// sub_8036A88
// sub_8036B28
// sub_8036BC8
// sub_8036C48
// sub_8036CE8
// sub_8036D64
// sub_8036D98
// sub_8036DD8
// sub_8036ECC
// sub_8036F64
void AiTryMoveTowards(short x, short y, u8 action, u8 maxDanger, u8 arg_4);
// sub_80371C4
// AiGetUnitClosestValidPosition
// sub_80374F8
// sub_8037530
// sub_803757C
// sub_80375C0
void SetupUnitInventoryAIFlags(void);
// sub_80376CC
// sub_8037714
// sub_8037760
// CharStoreAI
// sub_8037834
// sub_8037914
// sub_8037960
// sub_80379FC
// sub_8037A40
// sub_8037A6C
// sub_8037AC0
// sub_8037AFC
// sub_8037B50
// sub_8037B8C
// sub_8037BF8
// sub_8037C9C
// sub_8037CCC
// sub_8037D3C
// sub_8037DC8
// sub_8037DF8
// sub_8037E0C
// sub_8037E54
// sub_8037E9C
// sub_8037EDC
// sub_8037F1C
// sub_8037FB4
// sub_8038024
// sub_803802C
// sub_803808C
// sub_80380DC
// sub_80380F8
// sub_8038114
// sub_8038130
// sub_803817C
// sub_8038238
// sub_8038240
// sub_8038284
// sub_803837C
// sub_80383C0
// sub_8038440
// sub_80384C0
// sub_80384C8
// sub_80384D0
// sub_80384E4
// sub_8038508
// sub_803855C
// sub_80386CC
// sub_80387D0
// sub_8038894
// sub_8038910
// sub_803898C
// sub_80389A0
// sub_80389C0
// sub_80389F8
// sub_80389FC
// sub_8038A0C
// sub_8038C64
// AiFillReversedAttackRangeMap
// sub_8038E6C
// AiAttemptBallistaCombat
// sub_80390A0
// sub_80390F8
// sub_8039258
// AiSimulateBestBallistaBattleAgainstTarget
// sub_80393EC
// sub_8039454
// sub_8039458
// sub_80394C4
// sub_8039524
// sub_8039548
// sub_80395EC
// sub_8039620
// sub_8039638
// sub_8039698
// sub_80396D0
// sub_80396F4
// sub_8039768
// sub_80397B8
// sub_80397F8
// sub_8039870
// sub_803989C
// sub_80399C4
// sub_80399E8
void AiUpdateUnitsSeekHealing(void);
// sub_8039C10
// sub_8039C90
// sub_8039D48
// sub_8039DF0
// sub_8039E78
// sub_8039EAC
// sub_8039FB8
// sub_803A10C
// sub_803A158
// sub_803A180
// sub_803A1B8
// sub_803A1FC
// sub_803A228
// sub_803A254
// sub_803A28C
// sub_803A3B0
// sub_803A414
// sub_803A544
// sub_803A574
// sub_803A6B8
// sub_803A888
// sub_803A8A4
// sub_803A8D4
// sub_803A904
// sub_803A98C
// sub_803A9FC
// sub_803AA40
// sub_803AA70
// sub_803AB34
// sub_803AB70
// sub_803ABD0
// sub_803AC08
// sub_803AC7C
// sub_803ACDC
// sub_803AD28
// sub_803AD78
// sub_803AEF4
// sub_803AF14
// sub_803AF24
// sub_803AF8C
// sub_803B034
// sub_803B104
// sub_803B27C
// sub_803B44C
// sub_803B558
// sub_803B6B0
// sub_803B7F4
// sub_803B84C
// sub_803B8A0
// sub_803BA2C
// sub_803BBB0
// sub_803BCF0
// sub_803BE78
// sub_803BECC
// sub_803BF5C
// sub_803BFF4
// sub_803C0DC
// sub_803C144
// sub_803C19C
// sub_803C1F0
// sub_803C218
// sub_803C2B8
// sub_803C2F0
// sub_803C320
// sub_803C354
// sub_803C384
// sub_803C3B4
// sub_803C3E4
// sub_803C414
// sub_803C440
// sub_803C474
// sub_803C4A8
// sub_803C4D8
// sub_803C50C
// sub_803C540
// sub_803C57C
// AiMapFloodRangeFrom

// ??? gUnk_081D83B0
// ??? gUnk_081D83D0
// ??? gUnk_081D8E2C
// ??? gUnk_081D8EEC
// ??? gUnk_081D8EF8
// ??? gUnk_081D8F04
// ??? gUnk_081D8F0C
// ??? gUnk_081D8F88
extern u32 const AiItemConfigTable[];
// ??? gUnk_081D93F8
// ??? gUnk_081D93FC
// ??? gUnk_081D9408
// ??? gUnk_081D940C
// ??? gUnk_081D9470
// ??? gUnk_081D9474
// ??? gUnk_081D9490
// ??? gUnk_081D94A0
// ??? gUnk_081DABC8
// ??? gUnk_081DACFE
// ??? gUnk_081DADEC

extern struct ProcCmd ProcScr_AiOrder[];
// ??? gUnk_08C061C0
// ??? gUnk_08C061E0
// ??? gUnk_08C061E8
// ??? gUnk_08C06218
// ??? gUnk_08C06250
// ??? gUnk_08C06270
// ??? gUnk_08C062F0
// ??? gUnk_08C06308
// ??? gUnk_08C0636C
// ??? gUnk_08C06370
// ??? gUnk_08C06378
// ??? gUnk_08C06388
// ??? gUnk_08C06398
// ??? gUnk_08C0639C
// ??? gUnk_08C063D4
// ??? gUnk_08C06494
// ??? gUnk_08C06550
// ??? gUnk_08C06564
// ??? gUnk_08C065BC
// ??? gUnk_08C07CA4
// ??? gUnk_08C07CB0
// ??? gUnk_08C07CBC
// ??? gUnk_08C07D20
// ??? gUnk_08C07D84
// ??? gUnk_08C07D88
// ??? gUnk_08C07DA8
// ??? gUnk_08C07DAA
// ??? gSioSt
// ??? gUnk_08C07DB0
// ??? gUnk_08C07DD0
// ??? gUnk_08C07DF8
// ??? gUnk_08C07E20
// ??? gUnk_08C07E48
// ??? gUnk_08C07E68
// ??? gUnk_08C07E80
// ??? gUnk_08C07E98
// ??? gUnk_08C07EB0
// ??? gUnk_08C07EC0
// ??? gUnk_08C07ED0
// ??? gUnk_08C07F80
// ??? gUnk_08C07F8C
// ??? gUnk_08C07F98
// ??? ProcScr_TacticianNameSelection
// ??? gUnk_08C081B8
// ??? gUnk_08C081C8
// ??? gUnk_08C081D8
// ??? gUnk_08C08258
// ??? gUnk_08C08348
// ??? gUnk_08C08368
// ??? gUnk_08C08844
// ??? gUnk_08C088E4
// ??? gUnk_08C08904
