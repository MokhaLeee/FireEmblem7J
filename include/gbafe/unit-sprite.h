#pragma once

#include "global.h"

// extern ??? sub_8025114
void ApplyUnitSpritePalettes(void);
// extern ??? sub_802516C
void ResetUnitSprites(void);
void ResetUnitSpritesB(void);
int UseUnitSprite(u32 id);
// extern ??? sub_8025278
// extern ??? sub_8025344
// extern ??? ApplyUnitSpriteImage16x16
// extern ??? ApplyUnitSpriteImage16x32
// extern ??? ApplyUnitSpriteImage32x32
void TornOutUnitSprite(struct Unit * unit, int timer);
// extern ??? sub_80259A4
// extern ??? sub_8025A0C
// extern ??? sub_8025A6C
// extern ??? sub_8025AE0
// extern ??? sub_8025B54
// extern ??? sub_8025B80
void RefreshUnitSprites(void);
// extern ??? AddUnitSprite
void PutUnitSpritesOam(void);
// extern ??? PutChapterMarkedTileIconOam
void PutUnitSpriteIconsOam(void);
// extern ??? sub_8026418
// extern ??? sub_8026428
void UnitSpriteHoverUpdate(void);
// extern ??? sub_80264F0
// extern ??? sub_8026540
// extern ??? sub_8026628
// extern ??? sub_80266DC
// extern ??? sub_8026794
// extern ??? sub_802682C
// extern ??? sub_8026908
// extern ??? sub_80269F4
void HideUnitSprite(struct Unit * unit);
void ShowUnitSprite(struct Unit * unit);
u8 GetUnitSpriteHiddenFlag(struct Unit * unit);
// extern ??? sub_8026A4C
