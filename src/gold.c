#include "global.h"
#include "bm.h"

u32 GetGold() {
	return gPlaySt.partyGoldAmount;
}

void SetGold(s32 amount) {
	gPlaySt.partyGoldAmount = amount;
	if (amount > 999999) {
		gPlaySt.partyGoldAmount = 999999;
	}	
}

void AddGold(s32 amount) {
	s32 new_amount = gPlaySt.partyGoldAmount + amount;
	gPlaySt.partyGoldAmount = new_amount;
	if (new_amount > 999999) {
		gPlaySt.partyGoldAmount = 999999;
	}
}