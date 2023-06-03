#pragma once

int GetPlayerLeaderUnitId(void);
int GetItemIndex(int item);
void UnitHideIfUnderRoof(struct Unit *unit);
u16 GetUnitEquippedWeapon(struct Unit *unit);
int GetItemHpBonus(int item);
int MakeNewItem(int item);
void CharStoreAI(struct Unit *unit, const struct UnitDefinition *uDef);
int GetUnitSupporterCount(struct Unit *unit);
int GetUnitSupporterInitialExp(struct Unit *unit, int num);
