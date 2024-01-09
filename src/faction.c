#include "global.h"
#include "bm.h"
#include "unit.h"
#include "faction.h"


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