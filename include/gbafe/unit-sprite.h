#pragma once

#include "global.h"

// ??? sub_8025114
void ApplyUnitSpritePalettes(void);
// ??? sub_802516C
void ResetUnitSprites(void);
void ResetUnitSpritesB(void);
int UseUnitSprite(u32 id);
// ??? sub_8025278
// ??? sub_8025344
// ??? ApplyUnitSpriteImage16x16
// ??? ApplyUnitSpriteImage16x32
// ??? ApplyUnitSpriteImage32x32
void TornOutUnitSprite(struct Unit * unit, int timer);
// ??? sub_80259A4
// ??? ForceSyncUnitSpriteSheet
// ??? sub_8025A6C
// ??? sub_8025AE0
// ??? sub_8025B54
// ??? sub_8025B80
void RefreshUnitSprites(void);
// ??? AddUnitSprite
void PutUnitSpritesOam(void);
// ??? PutChapterMarkedTileIconOam
void PutUnitSpriteIconsOam(void);
// ??? sub_8026418
// ??? sub_8026428
void UnitSpriteHoverUpdate(void);
// ??? sub_80264F0
// ??? sub_8026540
// ??? sub_8026628
void sub_80266DC(int layer, int x, int y, int jid);
// ??? sub_8026794
// ??? sub_802682C
// ??? sub_8026908
// ??? sub_80269F4
void HideUnitSprite(struct Unit * unit);
void ShowUnitSprite(struct Unit * unit);
u8 GetUnitSpriteHiddenFlag(struct Unit * unit);
// ??? sub_8026A4C
