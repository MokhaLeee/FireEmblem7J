#pragma once

#include "global.h"

int CountFactionMoveableUnits(int faction);
int CountFactionUnitsWithoutFlags(int faction, int prohibited_flags);
bool AreUnitIdsAllied(int uidA, int uidB);
bool AreUnitIdsSameFaction(int uidA, int uidB);
int GetActiveFactionAlliance();
int GetActiveFactionOpposingAlliance();