#pragma once

#include "global.h"

struct Glyph {
    struct Glyph const *next;

    u8 sjis_byte_1;
    u8 width;
    u32 bitmap[16];
};

struct Text {
    /* 00 */ u16 chr_position;
    /* 02 */ u8 x;
    /* 03 */ u8 color;
    /* 04 */ u8 tile_width;
    /* 05 */ bool8 db_enabled;
    /* 06 */ u8 db_id;
    /* 07 */ bool8 is_printing;
};

struct Font {
    /* 00 */ u8 *draw_dest;
    /* 04 */ struct Glyph const * const *glyphs;
    /* 08 */ void (* draw_glyph)(struct Text * text, struct Glyph const *glyph);
    /* 0C */ u8 * (* get_draw_dest)(struct Text *text);
    /* 10 */ u16 tileref;
    /* 12 */ u16 chr_counter;
    /* 14 */ u16 palid;
    /* 16 */ u8 lang;
};

void SetTextFont(struct Font *);
const char * Text_DrawCharacter(struct Text * text, const char * str);
void InitSpriteTextFont(struct Font * font, void * vramDest, int c);
void InitSpriteText(struct Text * text);
void SpriteText_DrawBackgroundExt(struct Text * text, u32 b);
void SetTextFontGlyphs(int a);
