#include "gbafe.h"

#if 0
void SwingSwordfx_Init(struct ProcBmFx * proc)
{
    int i;
    u16 * pal = gPal;
    for (i = 0; i < 0xF; i++)
        gPal[0x13 + i] = RGB_WHITE;

    gPal[0] = RGB_WHITE;

    EnablePalSync();
    proc->timer = 0;
}
#endif
