#include "gbafe.h"

u16 EWRAM_DATA gManimScanlineBufA[DISPLAY_HEIGHT * 2] = { 0 };
u16 EWRAM_DATA gManimScanlineBufB[DISPLAY_HEIGHT * 2] = { 0 };
u16 * EWRAM_DATA gManimScanlineBufs[2] = { 0 };
u16 * EWRAM_DATA gManimActiveScanlineBuf = NULL;
