#pragma once

#include "global.h"

struct Anim {
    /* 00 */ u16 state;
    /* 02 */ short xPosition;
    /* 04 */ short yPosition;
    /* 06 */ short timer;
    /* 08 */ u16 oam2Base;
    /* 0A */ u16 drawLayerPriority;
    /* 0C */ u16 state2;
    /* 0E */ u16 nextRoundId;
    /* 10 */ u16 state3;
    /* 12 */ u8 currentRoundType;
    /* 13 */ u8 unk13;

    /* 14 */ u8 commandQueueSize;
    /* 15 */ u8 commandQueue[7];

    /* 1C */ u32 oamBase;

    /* 20 */ const u32 *pScrCurrent;
    /* 24 */ const u32 *pScrStart;
    /* 28 */ const void *pImgSheet;
    /* 2C */ void *pUnk2C;
    /* 30 */ const void *pSpriteDataPool; // aka "OAM data"

    /* 34 */ struct Anim *pPrev;
    /* 38 */ struct Anim *pNext;

    /* 3C */ const void *pSpriteData;
    /* 40 */ const void *pUnk40;
    /* 44 */ const void *pUnk44;
};

void AnimUpdateAll(void);
void AnimClearAll(void);
struct Anim* AnimCreate_unused(const void* script);
struct Anim* AnimCreate(const void* script, u16 displayPriority);
void AnimSort(void);
void AnimDelete(struct Anim* anim);
void AnimDisplay(struct Anim* anim);
