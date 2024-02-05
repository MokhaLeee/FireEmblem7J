#pragma once

#include "types.h"

#define MAX_ICON_COUNT 0xB0
#define MAX_ICON_DISPLAY_COUNT 0x20

struct IconSt {
    /* 00 */ u8 ref_count;
    /* 01 */ u8 disp_id;
};

extern u8 const Img_Icons[];
extern u16 const Pal_Icons[];

extern struct IconSt IconStTable[MAX_ICON_COUNT];
extern u8 IconDisplayList[MAX_ICON_DISPLAY_COUNT];

void InitIcons(void);
void ClearIcons(void);
void ApplyIconPalettes(int palid);
void ApplyIconPalette(int num, int palid);
int CountActiveIcons(void);
u16 IconSlot2Chr(int num);
int GetNewIconSlot(int icon);
int GetIconChr(int icon);
void PutIcon(u16 *tm, int icon, int tileref);
void ClearIcon(int icon);
void PutIconObjImg(int icon, int chr);
