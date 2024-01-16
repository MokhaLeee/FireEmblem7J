#pragma once

#include "global.h"

// extern ??? sub_08025114
void ApplyUnitSpritePalettes(void);
// extern ??? sub_0802516C
void ResetUnitSprites(void);
void ResetUnitSpritesB(void);
int UseUnitSprite(u32 id);
// extern ??? sub_08025278
// extern ??? sub_08025344
// extern ??? ApplyUnitSpriteImage16x16
// extern ??? ApplyUnitSpriteImage16x32
// extern ??? ApplyUnitSpriteImage32x32
// extern ??? sub_08025698
// extern ??? sub_080259A4
// extern ??? sub_08025A0C
// extern ??? sub_08025A6C
// extern ??? sub_08025AE0
// extern ??? sub_08025B54
// extern ??? sub_08025B80
void RefreshUnitSprites(void);
// extern ??? AddUnitSprite
void PutUnitSpritesOam(void);
// extern ??? PutChapterMarkedTileIconOam
void PutUnitSpriteIconsOam(void);
// extern ??? sub_08026418
// extern ??? sub_08026428
void UnitSpriteHoverUpdate(void);
// extern ??? sub_080264F0
// extern ??? sub_08026540
// extern ??? sub_08026628
// extern ??? sub_080266DC
// extern ??? sub_08026794
// extern ??? sub_0802682C
// extern ??? sub_08026908
// extern ??? sub_080269F4
void HideUnitSprite(struct Unit * unit);
void ShowUnitSprite(struct Unit * unit);
u8 GetUnitSpriteHiddenFlag(struct Unit * unit);
// extern ??? sub_08026A4C
