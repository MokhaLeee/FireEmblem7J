#include "gbafe.h"

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

void ApplyIconPalettes(int palid)
{
    ApplyPalettes(Pal_Icons, palid, 2);
}

void ApplyIconPalette(int num, int palid)
{
    ApplyPalette(Pal_Icons + 0x10 * num, palid);
}

int CountActiveIcons(void)
{ 
    int i, result = 0;

    for (i = MAX_ICON_DISPLAY_COUNT - 1; i >= 0; i--) {
        if (IconDisplayList[i] != 0)
            result++;
    }

    return result;
}

u16 IconSlot2Chr(int num)
{
    return BGCHR_ICON_END - num * 4;
}

int GetNewIconSlot(int icon)
{
    int i;

    for (i = 0; i < MAX_ICON_DISPLAY_COUNT; ++i) {
        if (IconDisplayList[i] == 0) {
            IconDisplayList[i] = icon + 1;
            return i;
        }
    }

    return -1;
}

int GetIconChr(int icon)
{
    if (IconStTable[icon].disp_id != 0) {
        if (IconStTable[icon].ref_count < UINT8_MAX)
            IconStTable[icon].ref_count++;

        return IconSlot2Chr(IconStTable[icon].disp_id);
    }

    IconStTable[icon].ref_count++;
    IconStTable[icon].disp_id = GetNewIconSlot(icon) + 1;

    RegisterVramMove(
        Img_Icons + (icon * CHR_SIZE * 4),
        VRAM + CHR_SIZE * IconSlot2Chr(IconStTable[icon].disp_id), CHR_SIZE * 4);

    return IconSlot2Chr(IconStTable[icon].disp_id);
}

void PutIcon(u16 * tm, int icon, int tileref)
{
    if (icon < 0) {
        tm[0x00] = 0;
        tm[0x01] = 0;
        tm[0x20] = 0;
        tm[0x21] = 0;
    } else {
        u16 tile = GetIconChr(icon) + tileref;

        tm[0x00] = tile++;
        tm[0x01] = tile++;
        tm[0x20] = tile++;
        tm[0x21] = tile;
    }
}

void ClearIcon(int icon)
{
    IconDisplayList[IconStTable[icon].disp_id - 1] = 0;
    IconStTable[icon].disp_id = 0;
}

void PutIconObjImg(int icon, int chr)
{
    u8 const * src;
    u8 * dst;

    dst = OBJ_VRAM0;
    dst += CHR_SIZE * (chr & 0x3FF);

    if (icon < 0) {
        RegisterDataFill(0, dst,         CHR_SIZE * 2);
        RegisterDataFill(0, dst + 0x400, CHR_SIZE * 2);
    } else {
        src = Img_Icons;
        src += CHR_SIZE * 4 * icon;

        RegisterDataMove(src,                dst,         CHR_SIZE * 2);
        RegisterDataMove(src + CHR_SIZE * 2, dst + 0x400, CHR_SIZE * 2);
    }
}
