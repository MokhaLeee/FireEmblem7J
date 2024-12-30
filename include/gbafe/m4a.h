#pragma once

#include "types.h"

void m4aSoundInit(void);
void m4aSoundMode(u32 mode);
void m4aSoundMain(void);
void m4aSoundVSync(void);
void m4aSoundVSyncOn(void);
void m4aSoundVSyncOff(void);
void m4aSongNumStart(u16 n);
void m4aSongNumStartOrChange(u16 n);
void m4aSongNumStartOrContinue(u16 n);
void m4aSongNumStop(u16 n);
void m4aMPlayAllStop(void);
