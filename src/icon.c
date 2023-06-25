#include "global.h"
#include "icon.h"
#include "hardware.h"

struct IconSt EWRAM_DATA IconStTable[MAX_ICON_COUNT] = {};
u8 EWRAM_DATA IconDisplayList[MAX_ICON_DISPLAY_COUNT] = {};

void InitIcons(void)
{
    ClearIcons();
}

void ClearIcons(void)
{
    CpuFill16(0, &IconStTable, sizeof IconStTable);
    CpuFill16(0, &IconDisplayList, sizeof IconDisplayList);
}
