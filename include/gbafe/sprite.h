#include "global.h"
#include "proc.h"

struct SpriteProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int x;
    /* 30 */ int y;

    /* 34 */ u8 pad_34[0x50 - 0x34];

    /* 50 */ s16 layer;
    /* 52 */ u16 tileref;
    /* 54 */ u16 const * object;
};

extern u16 CONST_DATA Sprite_8x8[];
extern u16 CONST_DATA Sprite_16x16[];
extern u16 CONST_DATA Sprite_32x32[];
extern u16 CONST_DATA Sprite_64x64[];
extern u16 CONST_DATA Sprite_8x16[];
extern u16 CONST_DATA Sprite_16x32[];
extern u16 CONST_DATA Sprite_32x64[];
extern u16 CONST_DATA Sprite_16x8[];
extern u16 CONST_DATA Sprite_32x16[];
extern u16 CONST_DATA Sprite_64x32[];
extern u16 CONST_DATA Sprite_32x8[];
extern u16 CONST_DATA Sprite_8x32[];
extern u16 CONST_DATA Sprite_32x8_VFlipped[];
extern u16 CONST_DATA Sprite_8x16_HFlipped[];
extern u16 CONST_DATA Sprite_8x8_HFlipped[];
extern u16 CONST_DATA Sprite_8x8_VFlipped[];
extern u16 CONST_DATA Sprite_8x8_HFlipped_VFlipped[];
extern u16 CONST_DATA Sprite_16x16_VFlipped[];

void PutSpriteExt(int layer, int xOam1, int yOam0, const u16 * object, int oam2);
