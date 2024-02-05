#include "gbafe.h"

int CountFactionMoveableUnits(int faction) {

	int i, count = 0;
	
	for (i = faction + 1; i < faction + 0x40; ++i) {

		struct Unit* unit = GetUnit(i);
		
		if (!unit) 
			continue;

		if (!unit -> pCharacterData)
			continue;

		if (unit->state & (US_UNSELECTABLE | US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_UNDER_A_ROOF | US_BIT16))
			continue;
		
		if (unit->statusIndex == UNIT_STATUS_SLEEP || unit->statusIndex == UNIT_STATUS_BERSERK)
			continue;
		
		if (UNIT_CATTRIBUTES(unit) & CA_UNSELECTABLE)
			continue;

		count++;
	}
	return count;
}

int CountFactionUnitsWithoutFlags(int faction, int prohibited_flags) {

	int i, count = 0;

	for (i = faction + 1; i < faction + 0x40; ++i) {

		struct Unit* unit = GetUnit(i);

		if (!unit)
			continue;

		if (!unit->pCharacterData)
			continue;

		if (unit->state & prohibited_flags)
			continue;

		count++;
	}
	return count;
}

bool AreUnitIdsAllied(int uidA, int uidB) {
	
	uidA &= 0x80;
	uidB &= 0x80;
	
	return uidA == uidB;
}

bool AreUnitIdsSameFaction(int uidA, int uidB) {

	uidA &= 0xC0;
	uidB &= 0xC0;

	return uidA == uidB;
}

int GetActiveFactionAlliance() {

	return gPlaySt.faction & 0x80;
}

int GetActiveFactionOpposingAlliance() {
	
	return (gPlaySt.faction & 0x80) ^ 0x80;
}