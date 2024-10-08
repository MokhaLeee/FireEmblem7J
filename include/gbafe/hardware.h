#pragma once

#include "global.h"

enum times_amt {
    FRAMES_PER_SECOND = 60,
    FRAMES_PER_MINUTE = 60 * FRAMES_PER_SECOND,
    FRAMES_PER_HOUR   = 60 * FRAMES_PER_MINUTE,
};

enum {
    /* DispCnt::obj_mapping */
    OBJ_MAPPING_2D = 0,
    OBJ_MAPPING_1D = 1,

    /* BgCnt::size */
    BGCNT_SIZE_TXT256x256   = BGCNT_TXT256x256 >> 14,
    BGCNT_SIZE_TXT512x256   = BGCNT_TXT512x256 >> 14,
    BGCNT_SIZE_TXT256x512   = BGCNT_TXT256x512 >> 14,
    BGCNT_SIZE_TXT512x512   = BGCNT_TXT512x512 >> 14,
    BGCNT_SIZE_AFF128x128   = BGCNT_AFF128x128 >> 14,
    BGCNT_SIZE_AFF256x256   = BGCNT_AFF256x256 >> 14,
    BGCNT_SIZE_AFF512x512   = BGCNT_AFF512x512 >> 14,
    BGCNT_SIZE_AFF1024x1024 = BGCNT_AFF1024x1024 >> 14,
};

#if MODERN
#  define IO_ALIGNED(n) ALIGNED(n)
#else
#  define IO_ALIGNED(n) ALIGNED(4)
#endif

struct IO_ALIGNED(2) DispCnt {
    /* bit  0 */ u16 mode : 3;
    /* bit  3 */ u16 : 1;
    /* bit  4 */ u16 bitmap_frame : 1;
    /* bit  5 */ u16 hblank_interval_free : 1;
    /* bit  6 */ u16 obj_mapping : 1;
    /* bit  7 */ u16 forced_blank : 1;
    /* bit  8 */ u16 bg0_enable : 1;
    /* bit  9 */ u16 bg1_enable : 1;
    /* bit 10 */ u16 bg2_enable : 1;
    /* bit 11 */ u16 bg3_enable : 1;
    /* bit 12 */ u16 obj_enable : 1;
    /* bit 13 */ u16 win0_enable : 1;
    /* bit 14 */ u16 win1_enable : 1;
    /* bit 15 */ u16 objwin_enable : 1;
};

struct IO_ALIGNED(2) DispStat {
    /* bit  0 */ u16 vblank : 1;
    /* bit  1 */ u16 hblank : 1;
    /* bit  2 */ u16 vcount : 1;
    /* bit  3 */ u16 vblank_int_enable : 1;
    /* bit  4 */ u16 hblank_int_enable : 1;
    /* bit  5 */ u16 vcount_int_enable : 1;
    /* bit  6 */ u16 : 2;
    /* bit  8 */ u16 vcount_compare : 8;
};

struct IO_ALIGNED(2) BgCnt {
    /* bit  0 */ u16 priority : 2;
    /* bit  2 */ u16 chr_block : 2;
    /* bit  4 */ u16 : 2;
    /* bit  6 */ u16 mosaic : 1;
    /* bit  7 */ u16 color_depth : 1;
    /* bit  8 */ u16 tm_block : 5;
    /* bit 13 */ u16 wrap : 1;
    /* bit 14 */ u16 size : 2;
};

struct IO_ALIGNED(4) WinCnt {
    u8 win0_enable_bg0 : 1;
    u8 win0_enable_bg1 : 1;
    u8 win0_enable_bg2 : 1;
    u8 win0_enable_bg3 : 1;
    u8 win0_enable_obj : 1;
    u8 win0_enable_blend : 1;
    u8 : 2;

    u8 win1_enable_bg0 : 1;
    u8 win1_enable_bg1 : 1;
    u8 win1_enable_bg2 : 1;
    u8 win1_enable_bg3 : 1;
    u8 win1_enable_obj : 1;
    u8 win1_enable_blend : 1;
    u8 : 2;

    u8 wout_enable_bg0 : 1;
    u8 wout_enable_bg1 : 1;
    u8 wout_enable_bg2 : 1;
    u8 wout_enable_bg3 : 1;
    u8 wout_enable_obj : 1;
    u8 wout_enable_blend : 1;
    u8 : 2;

    u8 wobj_enable_bg0 : 1;
    u8 wobj_enable_bg1 : 1;
    u8 wobj_enable_bg2 : 1;
    u8 wobj_enable_bg3 : 1;
    u8 wobj_enable_obj : 1;
    u8 wobj_enable_blend : 1;
    u8 : 2;
};

struct IO_ALIGNED(2) BlendCnt {
    u16 target1_enable_bg0 : 1;
    u16 target1_enable_bg1 : 1;
    u16 target1_enable_bg2 : 1;
    u16 target1_enable_bg3 : 1;
    u16 target1_enable_obj : 1;
    u16 target1_enable_bd : 1;
    u16 effect : 2;
    u16 target2_enable_bg0 : 1;
    u16 target2_enable_bg1 : 1;
    u16 target2_enable_bg2 : 1;
    u16 target2_enable_bg3 : 1;
    u16 target2_enable_obj : 1;
    u16 target2_enable_bd : 1;
};

struct DispIo {
    /* 00 */ struct DispCnt disp_ct;
    /* 04 */ struct DispStat disp_stat;
    /* 08 */ STRUCT_PAD(0x08, 0x0C);
    /* 0C */ struct BgCnt bg0_ct;
    /* 10 */ struct BgCnt bg1_ct;
    /* 14 */ struct BgCnt bg2_ct;
    /* 18 */ struct BgCnt bg3_ct;
    /* 1C */ struct Vec2u bg_off[4];
    /* 2C */ u8 win0_right, win0_left, win1_right, win1_left;
    /* 30 */ u8 win0_bottom, win0_top, win1_bottom, win1_top;
    /* 34 */ struct WinCnt win_ct;
    /* 38 */ u16 mosaic;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ struct BlendCnt blend_ct;
    /* 40 */ STRUCT_PAD(0x40, 0x44);
    /* 44 */ u8 blend_coef_a;
    /* 45 */ u8 blend_coef_b;
    /* 46 */ u8 blend_y;
    /* 48 */ struct BgAffineDstData bg2affin;
    /* 58 */ struct BgAffineDstData bg3affin;
    /* 68 */ s8 color_addition;
};

struct KeySt {
    /* 00 */ u8 repeat_delay;    // initial delay before generating auto-repeat presses
    /* 01 */ u8 repeat_interval; // time between auto-repeat presses
    /* 02 */ u8 repeat_clock;    // (decreased by one each frame, reset to repeat_delay when Presses change and repeat_interval when reaches 0)
    /* 04 */ u16 held;           // keys that are currently held down
    /* 06 */ u16 repeated;       // auto-repeated keys
    /* 08 */ u16 pressed;        // keys that went down this frame
    /* 0A */ u16 previous;       // keys that were held down last frame
    /* 0C */ u16 last;
    /* 0E */ u16 ablr_pressed; // 1 for Release (A B L R Only), 0 Otherwise
    /* 10 */ u16 pressed2;
    /* 12 */ u16 time_since_start_select; // Time since last Non-Start Non-Select Button was pressed
};

enum bg_sync_bitfile {
    BG0_SYNC_BIT = (1 << 0),
    BG1_SYNC_BIT = (1 << 1),
    BG2_SYNC_BIT = (1 << 2),
    BG3_SYNC_BIT = (1 << 3),
};

enum bg_index {
    BG_0 = 0,
    BG_1,
    BG_2,
    BG_3,

    BG_INVALID = -1,
};

extern struct KeySt CONST_DATA * gpKeySt;
extern struct KeySt EWRAM_DATA gKeyStObj;

struct MoveStats {
    /* 00 */ int count;
    /* 04 */ int totalSize;
};

struct MoveEntry {
    /* 00 */ void const *src;
    /* 04 */ void *dest;
    /* 08 */ u16 size;
    /* 0A */ u16 mode;
};

#define DATA_MOV_LIST_MAX 0x20

extern struct MoveStats EWRAM_DATA gMoveStats;
extern struct MoveEntry EWRAM_DATA gMoveList[DATA_MOV_LIST_MAX];

enum data_move_mode {
    MOVE_MODE_COPY,
    MOVE_MODE_COPY_FAST,
    MOVE_MODE_FILL_FAST,
};

enum {
    BG_SIZE_256x256 = 0,
    BG_SIZE_512x256 = 1,
    BG_SIZE_256x512 = 2,
    BG_SIZE_512x512 = 3,
};

enum softreset_arg {
    GBA_RESET_EWRAM    = 1 << 0,
    GBA_RESET_IWRAM    = 1 << 1,
    GBA_RESET_PALETTE  = 1 << 2,
    GBA_RESET_VRAM     = 1 << 3,
    GBA_RESET_OAM      = 1 << 4,
    GBA_RESET_SIO_IO   = 1 << 5,
    GBA_RESET_SOUND_IO = 1 << 6,
    GBA_RESET_IO       = 1 << 7,
    GBA_RESET_ALL      = (1 << 8) - 1,
};

extern u8 EWRAM_DATA gBuf[0x2100];
extern u16 EWRAM_DATA gPal[0x200];
extern u16 EWRAM_DATA gBg0Tm[0x400];
extern u16 EWRAM_DATA gBg1Tm[0x400];
extern u16 EWRAM_DATA gBg2Tm[0x400];
extern u16 EWRAM_DATA gBg3Tm[0x400];
extern void *EWRAM_DATA gBgMapVramTable[4];
extern Func EWRAM_DATA MainFunc;
extern struct DispIo gDispIo;
extern s16 gSinLut[0x40];

extern Func gOnHBlankA;
extern Func gOnHBlankB;

#define RGB_GET_RED(color) ((color) & 0x1F)
#define RGB_GET_GREEN(color) (((color) >> 5) & 0x1F)
#define RGB_GET_BLUE(color) (((color) >> 10) & 0x1F)

#define TM_OFFSET_(x, y) ((x) + ((y) << 5))
#define TM_OFFSET(x, y) (((y) * 0x20) + (x))

#define TILE_CHR_SAFE(chr) ((chr) & 0x3FF)
#define TILE_PAL_SAFE(pal) (((pal) & 0xF) << 12)
#define TILEREF(chr, pal) ((chr) + ((pal) << 12))
#define TILE_HFLIP 0x0400
#define TILE_VFLIP 0x0800

#define RED_MASK 0x1F
#define GREEN_MASK (0x1F << 5)
#define BLUE_MASK (0x1F << 10)

#define PAL_COLOR_OFFSET(palid, colornum) (palid) * 0x10 + (colornum)
#define PAL_OFFSET(palid) PAL_COLOR_OFFSET((palid), 0)
#define BGPAL_OFFSET(bgpal) PAL_OFFSET(0x00 + (bgpal))
#define OBPAL_OFFSET(obpal) PAL_OFFSET(0x10 + (obpal))

#define PAL_BUF_COLOR(buf, palid, colornum) buf[PAL_COLOR_OFFSET((palid), (colornum))]
#define PAL_COLOR(palid, colornum) PAL_BUF_COLOR(gPal, palid, colornum)
#define PAL_BG_COLOR(palid, colornum) PAL_COLOR(palid, colornum)
#define PAL_OBJ_COLOR(palid, colornum) PAL_COLOR((palid) + 0x10, colornum)

#define PAL_BG(palid) (&PAL_BG_COLOR(palid, 0))
#define PAL_OBJ(palid) (&PAL_OBJ_COLOR(palid, 0))

#define SIN_Q12(angle) (gSinLut[(angle) & 0xFF])
#define COS_Q12(angle) (gSinLut[0x40 + ((angle) & 0xFF)])

#define ApplyPalettes(src, num, count) ApplyPaletteExt((src), 0x20 * (num), 0x20 * (count))
#define ApplyPalette(src, num) ApplyPalettes((src), (num), 1)

#define SetDispEnable(bg0, bg1, bg2, bg3, obj) \
    gDispIo.disp_ct.bg0_enable = (bg0); \
    gDispIo.disp_ct.bg1_enable = (bg1); \
    gDispIo.disp_ct.bg2_enable = (bg2); \
    gDispIo.disp_ct.bg3_enable = (bg3); \
    gDispIo.disp_ct.obj_enable = (obj)

#define SetWinEnable(win0, win1, objwin) \
    gDispIo.disp_ct.win0_enable = (win0); \
    gDispIo.disp_ct.win1_enable = (win1); \
    gDispIo.disp_ct.objwin_enable = (objwin)

#define SetWin0Box(left, top, right, bottom) \
    gDispIo.win0_left = (left); \
    gDispIo.win0_top = (top); \
    gDispIo.win0_right = (right); \
    gDispIo.win0_bottom = (bottom)

#define SetWin1Box(left, top, right, bottom) \
    gDispIo.win1_left = (left); \
    gDispIo.win1_top = (top); \
    gDispIo.win1_right = (right); \
    gDispIo.win1_bottom = (bottom)

#define SetWin0Layers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.win0_enable_bg0 = (bg0); \
    gDispIo.win_ct.win0_enable_bg1 = (bg1); \
    gDispIo.win_ct.win0_enable_bg2 = (bg2); \
    gDispIo.win_ct.win0_enable_bg3 = (bg3); \
    gDispIo.win_ct.win0_enable_obj = (obj)

#define SetWin1Layers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.win1_enable_bg0 = (bg0); \
    gDispIo.win_ct.win1_enable_bg1 = (bg1); \
    gDispIo.win_ct.win1_enable_bg2 = (bg2); \
    gDispIo.win_ct.win1_enable_bg3 = (bg3); \
    gDispIo.win_ct.win1_enable_obj = (obj)

#define SetWObjLayers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.wobj_enable_bg0 = (bg0); \
    gDispIo.win_ct.wobj_enable_bg1 = (bg1); \
    gDispIo.win_ct.wobj_enable_bg2 = (bg2); \
    gDispIo.win_ct.wobj_enable_bg3 = (bg3); \
    gDispIo.win_ct.wobj_enable_obj = (obj)

#define SetWOutLayers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.wout_enable_bg0 = (bg0); \
    gDispIo.win_ct.wout_enable_bg1 = (bg1); \
    gDispIo.win_ct.wout_enable_bg2 = (bg2); \
    gDispIo.win_ct.wout_enable_bg3 = (bg3); \
    gDispIo.win_ct.wout_enable_obj = (obj)

#define SetBlendConfig(eff, ca, cb, cy) \
    gDispIo.blend_ct.effect = (eff); \
    gDispIo.blend_coef_a = (ca); \
    gDispIo.blend_coef_b = (cb); \
    gDispIo.blend_y = (cy)

#define SetBlendAlpha(ca, cb) \
    SetBlendConfig(BLEND_EFFECT_ALPHA, (ca), (cb), 0)

#define SetBlendBrighten(cy) \
    SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 0, 0, (cy))

#define SetBlendDarken(cy) \
    SetBlendConfig(BLEND_EFFECT_DARKEN, 0, 0, (cy))

#define SetBlendNone() \
    SetBlendConfig(BLEND_EFFECT_NONE, 0x10, 0, 0)

#if BUGFIX

// fixes violation of strict aliasing rules

#define SetBlendTargetA(bg0, bg1, bg2, bg3, obj) \
    gDispIo.blend_ct.target1_enable_bg0 = (bg0); \
    gDispIo.blend_ct.target1_enable_bg1 = (bg1); \
    gDispIo.blend_ct.target1_enable_bg2 = (bg2); \
    gDispIo.blend_ct.target1_enable_bg3 = (bg3); \
    gDispIo.blend_ct.target1_enable_obj = (obj)

#define SetBlendTargetB(bg0, bg1, bg2, bg3, obj) \
    gDispIo.blend_ct.target2_enable_bg0 = (bg0); \
    gDispIo.blend_ct.target2_enable_bg1 = (bg1); \
    gDispIo.blend_ct.target2_enable_bg2 = (bg2); \
    gDispIo.blend_ct.target2_enable_bg3 = (bg3); \
    gDispIo.blend_ct.target2_enable_obj = (obj)

#else

#define SetBlendTargetA(bg0, bg1, bg2, bg3, obj) \
    *((u16 *) &gDispIo.blend_ct) &= ~BLDCNT_TARGETA(1, 1, 1, 1, 1); \
    *((u16 *) &gDispIo.blend_ct) |= BLDCNT_TARGETA((bg0), (bg1), (bg2), (bg3), (obj))

#define SetBlendTargetB(bg0, bg1, bg2, bg3, obj) \
    *((u16 *) &gDispIo.blend_ct) &= ~BLDCNT_TARGETB(1, 1, 1, 1, 1); \
    *((u16 *) &gDispIo.blend_ct) |= BLDCNT_TARGETB((bg0), (bg1), (bg2), (bg3), (obj))

#endif

#define SetBlendBackdropA(enable) \
    gDispIo.blend_ct.target1_enable_bd = (enable)

#define SetBlendBackdropB(enable) \
    gDispIo.blend_ct.target2_enable_bd = (enable)

#define SetBackdropColor(color) \
    gPal[0] = (color); \
    EnablePalSync()

#define RegisterVramMove(src, offset, size) \
    RegisterDataMove( \
        (src), \
        (void *) VRAM + (0x1FFFF & (offset)), \
        (size))

#define RegisterVramFill(value, offset, size) \
    RegisterDataFill( \
        (value), \
        (void *) VRAM + (0x1FFFF & (offset)), \
        (size))

unsigned GetGameTime(void);
void SetGameTime(unsigned time);
void IncGameTime(void);
bool FormatTime(unsigned time, u16 * hours, u16 * minutes, u16 * seconds);
void EnableBgSync(int bits);
void EnableBgSyncById(int bgid);
void DisableBgSync(int bits);
void EnablePalSync(void);
void DisablePalSync(void);
void ApplyPaletteExt(void const * data, int startOffset, int size);
void SyncDispIo(void);
int GetBgChrOffset(int bg);
int GetBgChrId(int bg, int offset);
int GetBgTilemapOffset(int bg);
void SetBgChrOffset(int bg, int offset);
void SetBgTilemapOffset(int bg, int offset);
void SetBgScreenSize(int bg, int size);
void SetBgBpp(int bg, int bpp);
void SyncBgsAndPal(void);
void TmFill(u16 * dest, int tileref);
void SetBlankChr(int chr);
void SetOnVBlank(Func func);
void SetOnVMatch(Func func);
void SetNextVCount(int vcount);
void SetVCount(int vcount);
void SetMainFunc(Func func);
void RunMainFunc(void);
void RefreshKeySt(struct KeySt * keySt);
void ClearKeySt(struct KeySt * keySt);
void InitKeySt(struct KeySt * keySt);
void SetBgOffset(u16 bgid, u16 x_offset, u16 y_offset);
void sub_8001E6C(void);
void sub_8001EA0(u8 a, u8 b);
void sub_8001ED4(u16 *dst, u16 *src);
void sub_8001F14(void *tm, void const *in_data, u8 base, u8 linebits);
void sub_8001FF0(u16 * tm, short const * in_data, int unused);
void ColorFadeInit(void);
void sub_80020CC(u16 const * in_pal, int bank, int count, int unk);
void sub_80021F0(int a, int b, int c, int d);
void sub_8002310(int a, int b, int c);
void ColorFadeSetupFromColorToBlack(s8 component_step);
void ColorFadeSetupFromBlack(s8 component_step);
void ColorFadeSetupFromColorToWhite(s8 component_step);
void ColorFadeSetupFromWhite(s8 component_step);
void ColorFadeTick2(void);
void InitBgs(u16 const * config);
u16 * GetBgTilemap(int bg);
void SoftResetIfKeyCombo(void);
void sub_8002C24(int unk);
void SetOnHBlankA(Func func);
void SetOnHBlankB(Func func);
int GetBgFromPtr(u16 *ptr);
void RegisterDataMove(void const * src, void * dst, int size);
void RegisterDataFill(u32 value, void * dst, int size);
void ApplyDataMoves(void);
