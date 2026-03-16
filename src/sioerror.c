#include "gbafe.h"

void OnVBlank_SioError(void) {

	INTR_CHECK = 1;
	SyncDispIo();
	SyncBgsAndPal();
	ApplyDataMoves();
	m4aSoundVSync();
	m4aSoundMain();

	return;
}

void OnMain_SioErrorWait(void) {

	u16 key;
	u16 mask;

	RefreshKeySt(gpKeySt);
	key = gpKeySt->pressed;
	mask = 9 & key;

	if (mask != 0) {
		SoftReset(0xFF);
	}
		
	VBlankIntrWait();

	return;
}
