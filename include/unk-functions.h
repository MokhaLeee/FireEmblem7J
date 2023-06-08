#pragma once

#include "global.h"

int GetPlayerLeaderUnitId(void);
int GetItemIndex(int item);
void UnitHideIfUnderRoof(struct Unit *unit);
void CharStoreAI(struct Unit *unit, const struct UnitDefinition *uDef);
int GetUnitSupporterCount(struct Unit *unit);
int GetUnitSupporterInitialExp(struct Unit *unit, int num);
int GetAutoleveledStatIncrease(int growth, int levelCount);
int GetCurrentPromotedLevelBonus(void);
int GetStatIncrease(int growth);
void ClearUnitSupports(struct Unit *unit);
void sub_0802A21C(void);
void PidStatsAddMove(u8 pid, int amount);
void PidStatsSubFavval08(u8 pid);
void BeginTargetList(int x, int y);
void EnlistTarget(int x, int y, int uid, int extra);
void RenderMap(void);
void RenderMapForFade(void);
void RefreshEntityMaps(void);
void StartMapFade(bool locksGame);
void RefreshUnitSprites(void);
void sub_0807B32C(void);
void sub_080799E4(void);
char *DecodeMsg(int id);
void EnableAllLightRunes(void);
void DisableAllLightRunes(void);
void PidStatsRecordBattleResult(void);
void PidStatsAddBattleAmt(struct Unit *unit);
int GetBallistaItemAt(int xPos, int yPos);
int GetUnitSupportBonuses(struct Unit *unit, struct SupportBonuses *bonuses);
bool sub_08028620(struct Unit *unit);
