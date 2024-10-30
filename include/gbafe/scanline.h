#pragma once

#include "global.h"

extern u16 EWRAM_DATA gManimScanlineBufA[DISPLAY_HEIGHT * 2];
extern u16 EWRAM_DATA gManimScanlineBufB[DISPLAY_HEIGHT * 2];
extern u16 * EWRAM_DATA gManimScanlineBufs[2];
extern u16 * EWRAM_DATA gManimActiveScanlineBuf;

void InitScanlineEffect(void);
// sub_807706C
// sub_807719C
void ResetScanLineHBlank(void);
// sub_80771E0
// sub_8077248
// sub_80772CC
// sub_8077350
// StartManimFrameGradientScanlineEffect1
// StartManimFrameGradientScanlineEffect2
// sub_807755C
// PrepareSineWaveScanlineBuf
// sub_8077694
// sub_8077714
// sub_8077794
// PrepareSineWaveScanlineBufExt
void SwapScanlineBufs(void);
void InitScanlineBuf(u16 * buf);
// SetScanlineBufWinL
// SetScanlineBufWinR
// MapAnimScanlineCore
// PrepareGradientScanlineBuf
// sub_8077BC0
// sub_8077BE0
// sub_8077C1C
u16 * GetScanlineBuf(int buf_id, int scanline);
// sub_8077D1C
// sub_8077E1C
// sub_8077E50
// sub_8077FB4
// sub_8078030
void HBlank_Scanline_8078098(void);
void sub_80780E0(int a, int b);
// sub_8078130
void ScanlineRotation(u16 *, s16, s16, s16, s16, s16, s16);
void HBlank_Scanline_80782AC(void);
// sub_8078344
// DragonGatefx_LightHBlank
// sub_8078474
void QuintessenceFx_OnHBlank(void);
// DragonGatefx_DragonHBlank
// sub_8078688
// sub_8078894
