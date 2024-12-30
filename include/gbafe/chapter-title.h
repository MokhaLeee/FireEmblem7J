#pragma once

#include "global.h"

struct ChapTitleConfig {
    const u8 * img;
};

extern const struct ChapTitleConfig gChapTitleConfig[];

struct ChapTitleSt {
    u16 chr_bg;
    u16 chr_str;
};

extern struct ChapTitleSt gChapTitleSt;

void PutChapterTitlePalette(int config, int pal_bank);
void PutChapterTitleGfx(int chr, u32 titleId);
void PutChapterTitleBG(int chr);
void PutChapterTitleUnkBG(int chr);
void PutChapterTitleNameTsa(u16 * tm, int pal);
void PutChapterTitleBgTsa(u16 * tm, int pal);
void PutChapterTitleBgUnkTsa(u16 * tm, int pal);
int GetChapterTitle(struct PlaySt * playst);
