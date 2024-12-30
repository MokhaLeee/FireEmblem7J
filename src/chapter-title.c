#include "gbafe.h"

EWRAM_DATA struct ChapTitleSt gChapTitleSt = {};

void PutChapterTitlePalette(int config, int pal_bank)
{
    const u16 * pal;

    if (config & 8)
    {
        ApplyPalette(Pal_08408CC8, pal_bank);
        return;
    }

    pal = (config & 1) ? Pal_08404D90 : Pal_08404ED0;

    if (config & 0x10)
        pal += 0x20;

    if (config & 0x20)
        pal += 0x40;

    if (config & 0x40)
        pal += 0x60;

    if (config & 0x80)
        pal += 0x80;

    if (config & 0x2)
        pal += 0x10;

    ApplyPalette(pal, pal_bank);
}

void PutChapterTitleGfx(int chr, u32 titleId)
{
    if (titleId > 0x4D)
        titleId = 0x4A;

    gChapTitleSt.chr_str = OAM2_CHR(chr);
    Decompress(gChapTitleConfig[titleId].img, (void *)BG_VRAM + chr * TILE_SIZE_4BPP);
}

void PutChapterTitleBG(int chr)
{
    gChapTitleSt.chr_bg = OAM2_CHR(chr);
    Decompress(Img_ChapterTitleBG, (void *)BG_VRAM + chr * TILE_SIZE_4BPP);
}

void PutChapterTitleUnkBG(int chr)
{
    gChapTitleSt.chr_bg = OAM2_CHR(chr);
    Decompress(Img_ChapterTitle_084086C4, (void *)BG_VRAM + chr * TILE_SIZE_4BPP);
}

void PutChapterTitleNameTsa(u16 * tm, int pal)
{
    int i;
    int tile = TILEREF(gChapTitleSt.chr_str, pal);

    for (i = 0; i < 0x40; i++)
        *tm++ = tile++;
}

void PutChapterTitleBgTsa(u16 * tm, int pal)
{
    int i;
    int tile = TILEREF(gChapTitleSt.chr_bg, pal);

    for (i = 0; i < 0x80; i++)
        *tm++ = tile++;
}

void PutChapterTitleBgUnkTsa(u16 * tm, int pal)
{
    TmApplyTsa(tm, Tsa_ChapterTitle_08408BD4, TILEREF(gChapTitleSt.chr_bg, pal));
}

int GetChapterTitle(struct PlaySt * playst)
{
    int chapter;

    if (playst == NULL)
        return 0x4A;

    chapter = playst->chapterIndex;

    if (chapter == 0x30)
        return 0x4C;

    if (playst->chapterStateBits & PLAY_FLAG_COMPLETE)
        return 0x4B;

    if (playst->chapterModeIndex == 3)
        return GetChapterInfo(chapter)->title_ids[1];
    else
        return GetChapterInfo(chapter)->title_ids[0];
}
