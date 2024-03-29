#include "global.h"
#include "proc.h"

struct SpriteEntry {
    /* 00 */ struct SpriteEntry * next;
    /* 04 */ s16 oam1;
    /* 06 */ s16 oam0;
    /* 08 */ u16 oam2;
    /* 0A */ // pad
    /* 0C */ u16 const * object;
};

extern struct SpriteEntry * gSpriteAllocIt;
extern struct SpriteEntry EWRAM_DATA SpritePool[0x80];
extern struct SpriteEntry EWRAM_DATA SpriteLayers[0x10];

extern u16 CONST_DATA Sprite_8x8[];
extern u16 CONST_DATA Sprite_16x16[];
extern u16 CONST_DATA Sprite_32x32[];
extern u16 CONST_DATA Sprite_64x64[];
extern u16 CONST_DATA Sprite_8x16[];
extern u16 CONST_DATA Sprite_16x32[];
extern u16 CONST_DATA Sprite_32x64[];
extern u16 CONST_DATA Sprite_16x8[];
extern u16 CONST_DATA Sprite_16x8_VFlipped[];
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
extern struct ProcCmd CONST_DATA ProcSrc_SpriteRefresher[];

void PutSpriteAffine(int id, short pa, short pb, short pc, short pd);
void ClearSprites(void);
void PutSprite(int layer, int x, int y, u16 const * object, int oam2);
void PutSpriteExt(int layer, int x_oam1, int y_oam0, u16 const * object, int oam2);
void PutSpriteLayerOam(int layer);

struct SpriteProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int x;
    /* 30 */ int y;

    /* 34 */ u8 pad_34[0x50 - 0x34];

    /* 50 */ s16 layer;
    /* 52 */ u16 tileref;
    /* 54 */ u16 const * object;
};

void SpriteRefresher_OnIdle(struct SpriteProc * proc);
struct SpriteProc * StartSpriteRefresher(ProcPtr parent, int layer, int x, int y, u16 const * object, int tileref);
void MoveSpriteRefresher(struct SpriteProc * proc, int x, int y);
