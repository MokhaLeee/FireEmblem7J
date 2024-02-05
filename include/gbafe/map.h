#pragma once

#include "global.h"

enum {
    // Magic values for gBmMapMovement

    MAP_MOVEMENT_MAX = 120,
    MAP_MOVEMENT_EXTENDED = 124,
};

enum {
    // For use with gBmMapHidden

    HIDDEN_BIT_UNIT = (1 << 0),
    HIDDEN_BIT_TRAP = (1 << 1),
};

extern EWRAM_DATA struct Vec2 gBmMapSize;
extern EWRAM_DATA u8** gBmMapUnit;
extern EWRAM_DATA u8** gBmMapTerrain;
extern EWRAM_DATA u8** gBmMapMovement;
extern EWRAM_DATA u8** gBmMapRange;
extern EWRAM_DATA u8** gBmMapFog;
extern EWRAM_DATA u8** gBmMapHidden;
extern EWRAM_DATA u8** gBmMapOther;

void GenerateExtendedMovementMap(int x, int y, const s8 mct[]);
void UnpackChapterMapGraphics(int chapterId);
