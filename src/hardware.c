#include "gbafe.h"

static u8 sBgSyncBits;
static bool sPalSyncFlag;
static u16 keyStIgnoredMask;
static unsigned sGameTime;
static u8 sUnk_03000014;
static u8 sUnk_03000015;

u8 EWRAM_DATA gBuf[0x2100] = { 0 };
s8 EWRAM_DATA gFadeComponentStep[0x20] = { 0 };
s8 EWRAM_DATA gFadeComponents[0x600] = { 0 };
u16 EWRAM_DATA gPal[0x200] = { 0 };
u16 EWRAM_DATA gBg0Tm[0x400] = { 0 };
u16 EWRAM_DATA gBg1Tm[0x400] = { 0 };
u16 EWRAM_DATA gBg2Tm[0x400] = { 0 };
u16 EWRAM_DATA gBg3Tm[0x400] = { 0 };
void *EWRAM_DATA gBgMapVramTable[4] = { 0 };
static Func EWRAM_DATA MainFunc = NULL;
static int EWRAM_DATA _pad_ = 0;
static struct KeySt EWRAM_DATA gKeyStObj = { 0 };

CONST_DATA struct KeySt *gpKeySt = &gKeyStObj;

unsigned GetGameTime(void)
{
    return sGameTime;
}

void SetGameTime(unsigned time)
{
    sGameTime = time;
}

void IncGameTime(void)
{
    sGameTime++;

    if (sGameTime >= 1000 * FRAMES_PER_HOUR) {
        sGameTime = 990 * FRAMES_PER_HOUR;
        return;
    }
}

bool FormatTime(unsigned time, u16 * hours, u16 * minutes, u16 * seconds)
{
    *seconds = (time / FRAMES_PER_SECOND) % 60;
    *minutes = (time / FRAMES_PER_MINUTE) % 60;
    *hours   = (time / FRAMES_PER_HOUR);

    return (time / 30) & 1; // clock `:` on/off boolean
}

inline void EnableBgSync(int bits)
{
    sBgSyncBits |= bits;
}

inline void EnableBgSyncById(int bgid)
{
    sBgSyncBits |= (1 << bgid);
}

inline void DisableBgSync(int bits)
{
    sBgSyncBits &= ~bits;
}

inline void EnablePalSync(void)
{
    sPalSyncFlag = TRUE;
}

inline void DisablePalSync(void)
{
    sPalSyncFlag = FALSE;
}

void ApplyPaletteExt(void const * data, int startOffset, int size)
{
    if (size & 0x1F) // size is not a multiple of 32
        CpuCopy16(data, gPal + (startOffset >> 1), size);
    else
        CpuFastCopy(data, gPal + (startOffset >> 1), size);

    EnablePalSync();
}

#define RED_MASK 0x1F
#define GREEN_MASK (0x1F << 5)
#define BLUE_MASK (0x1F << 10)

void sub_80010CC(u16 *a, int b, int size, int d)
{
    int i;
    u16 *dest = gPal + (b >> 1);
    u16 *src = a;

    for (i = 0; i < size; i++) {
        *dest = ((((*src & RED_MASK) * d) >> 6) & RED_MASK)
                + ((((*src & GREEN_MASK) * d) >> 6) & GREEN_MASK)
                + ((((*src & BLUE_MASK) * d) >> 6) & BLUE_MASK);
        dest++, src++;
    }
    EnablePalSync();
}

#if 1

void SyncDispIo(void)
{
    // TODO: rewrite the MODERN version of this function
    // this is a bit of a mess

    #if MODERN
    #  define SET_REG(type, reg, src) *((typeof((src)) volatile *) &REG_##reg) = (src)
    #else
    #  define SET_REG(type, reg, src) *((type*) &REG_##reg) = *((type*) &(src))
    #endif

    SET_REG(u16, DISPCNT,  gDispIo.disp_ct);
    SET_REG(u16, DISPSTAT, gDispIo.disp_stat);

    SET_REG(u16, BG0CNT,   gDispIo.bg0_ct);
    SET_REG(u16, BG1CNT,   gDispIo.bg1_ct);
    SET_REG(u16, BG2CNT,   gDispIo.bg2_ct);
    SET_REG(u16, BG3CNT,   gDispIo.bg3_ct);

    // set both HOFS and VOFS with a single 32-bit copy
    SET_REG(u32, BG0HOFS,  gDispIo.bg_off[0]);
    SET_REG(u32, BG1HOFS,  gDispIo.bg_off[1]);
    SET_REG(u32, BG2HOFS,  gDispIo.bg_off[2]);
    SET_REG(u32, BG3HOFS,  gDispIo.bg_off[3]);

#if MODERN
    REG_WIN0H = gDispIo.win0_right + (gDispIo.win0_left << 8);
    REG_WIN1H = gDispIo.win1_right + (gDispIo.win1_left << 8);
    REG_WIN0V = gDispIo.win0_bottom + (gDispIo.win0_top << 8);
    REG_WIN1V = gDispIo.win1_bottom + (gDispIo.win1_top << 8);
#else
    // set both WIN0H and WIN1H with a single 32-bit copy
    SET_REG(u32, WIN0H,    gDispIo.win0_right);
    // set both WIN0V and WIN1V with a single 32-bit copy
    SET_REG(u32, WIN0V,    gDispIo.win0_bottom);
#endif

    // set both WININ and WINOUT with a single 32-bit copy
    SET_REG(u32, WININ,    gDispIo.win_ct);

    SET_REG(u16, MOSAIC,   gDispIo.mosaic);
    SET_REG(u16, BLDCNT,   gDispIo.blend_ct);
#if MODERN
    REG_BLDALPHA = gDispIo.blend_coef_a + (gDispIo.blend_coef_b << 8);
#else
    SET_REG(u16, BLDALPHA, gDispIo.blend_coef_a);
#endif
    SET_REG(u8,  BLDY,     gDispIo.blend_y);

#if MODERN
    REG_BG2PA = gDispIo.bg2pa;
    REG_BG2PB = gDispIo.bg2pb;
    REG_BG2PC = gDispIo.bg2pc;
    REG_BG2PD = gDispIo.bg2pd;
#else
    // set both BG2PA and BG2PB with a single 32-bit copy
    SET_REG(u32, BG2PA,    gDispIo.bg2pa);
    // set both BG2PC and BG2PD with a single 32-bit copy
    SET_REG(u32, BG2PC,    gDispIo.bg2pc);
#endif

    SET_REG(u32, BG2X,     gDispIo.bg2x);
    SET_REG(u32, BG2Y,     gDispIo.bg2y);

#if MODERN
    REG_BG3PA = gDispIo.bg3pa;
    REG_BG3PB = gDispIo.bg3pb;
    REG_BG3PC = gDispIo.bg3pc;
    REG_BG3PD = gDispIo.bg3pd;
#else
    // set both BG3PA and BG3PB with a single 32-bit copy
    SET_REG(u32, BG3PA,    gDispIo.bg3pa);
    // set both BG3PC and BG3PD with a single 32-bit copy
    SET_REG(u32, BG3PC,    gDispIo.bg3pc);
#endif

    SET_REG(u32, BG3X,     gDispIo.bg3x);
    SET_REG(u32, BG3Y,     gDispIo.bg3y);

    #undef SET_REG
}
#endif

struct BgCnt *GetBgCt(u16 bgid)
{
    switch (bgid) {
    case 0: return &gDispIo.bg0_ct;
    case 1: return &gDispIo.bg1_ct;
    case 2: return &gDispIo.bg2_ct;
    case 3: return &gDispIo.bg3_ct;
    }

#if BUGFIX
    return NULL;
#endif
}

int GetBgChrOffset(int bg)
{
    struct BgCnt * bgCt = GetBgCt(bg);
    return bgCt->chr_block * 0x4000;
}

int GetBgChrId(int bg, int offset)
{
    offset &= 0xFFFF;
    return (offset - GetBgChrOffset(bg)) / 0x20;
}

int GetBgTilemapOffset(int bg)
{
    struct BgCnt * bgCt = GetBgCt(bg);
    return bgCt->tm_block * 0x800;
}

void SetBgChrOffset(int bg, int offset)
{
    struct BgCnt * bgCt = GetBgCt(bg);
    bgCt->chr_block = offset >> 14;
}

void SetBgTilemapOffset(int bg, int offset)
{
    struct BgCnt * bgCt = GetBgCt(bg);

    if ((offset & 0x7FF) != 0)  // must be aligned
        return;

    bgCt->tm_block = offset >> 11;
    gBgMapVramTable[bg] = (void *) (VRAM | offset);
}

void SetBgScreenSize(int bg, int size)
{
    struct BgCnt * bgCt = GetBgCt(bg);
    bgCt->size = size;
}

void SetBgBpp(int bg, int bpp)
{
    struct BgCnt * bgCt = GetBgCt(bg);
    bgCt->color_depth = (bpp == 8) ? BG_COLORDEPTH_8BPP : BG_COLORDEPTH_4BPP;
}

void ApplyColorAddition_ClampMax(int a)
{
    u16 *src = gPal;
    u16 *dest = (u16 *)PLTT;
    int i;

    for (i = 0; i < 0x200; i++) {
        int r = RED_VALUE(*src) + a;
        int g = GREEN_VALUE(*src) + a;
        int b = BLUE_VALUE(*src) + a;

        if (r > 31)
            r = 31;
        if (g > 31)
            g = 31;
        if (b > 31)
            b = 31;

        *dest = (b << 10) + (g << 5) + r;

        src++;
        dest++;
    }
}

void ApplyColorAddition_ClampMin(int a)
{
    u16 *src = gPal;
    u16 *dest = (u16 *)PLTT;
    int i;

    for (i = 0; i < 0x200; i++) {
        int r = RED_VALUE(*src) + a;
        int g = GREEN_VALUE(*src) + a;
        int b = BLUE_VALUE(*src) + a;

        if (r < 0)
            r = 0;
        if (g < 0)
            g = 0;
        if (b < 0)
            b = 0;

        *dest = (b << 10) + (g << 5) + r;

        src++;
        dest++;
    }
}

void SyncBgsAndPal(void)
{
    if (sBgSyncBits & BG0_SYNC_BIT)
        CpuFastCopy(gBg0Tm, gBgMapVramTable[0], sizeof gBg0Tm);

    if (sBgSyncBits & BG1_SYNC_BIT)
        CpuFastCopy(gBg1Tm, gBgMapVramTable[1], sizeof gBg1Tm);

    if (sBgSyncBits & BG2_SYNC_BIT)
        CpuFastCopy(gBg2Tm, gBgMapVramTable[2], sizeof gBg2Tm);

    if (sBgSyncBits & BG3_SYNC_BIT)
        CpuFastCopy(gBg3Tm, gBgMapVramTable[3], sizeof gBg3Tm);

    sBgSyncBits = 0;

    if (sPalSyncFlag == true) {
        sPalSyncFlag = false;

        if (gDispIo.color_addition == 0)
            CpuFastCopy(gPal, (void *) PLTT, sizeof gPal);
        else if (gDispIo.color_addition > 0)
            ApplyColorAddition_ClampMax(gDispIo.color_addition);
        else
            ApplyColorAddition_ClampMin(gDispIo.color_addition);
    }
}

void TmFill(u16 * dest, int tileref)
{
    tileref = tileref + (tileref << 16);
    CpuFastFill(tileref, dest, sizeof gBg0Tm);
}

void SetBlankChr(int chr)
{
    RegisterDataFill(0, (void *)(VRAM + 0x20 * chr), 0x20);
}

void SetOnVBlank(IrqFunc func)
{
    if (func != NULL) {
        gDispIo.disp_stat.vblank_int_enable = TRUE;

        SetIrqFunc(INT_VBLANK, func);
        REG_IE |= INTR_FLAG_VBLANK;
    } else {
        gDispIo.disp_stat.vblank_int_enable = FALSE;
        REG_IE &= ~INTR_FLAG_VBLANK;
    }
}

void SetOnVMatch(IrqFunc func)
{
    if (func != NULL) {
        gDispIo.disp_stat.vcount_int_enable = TRUE;

        SetIrqFunc(INT_VCOUNT, func);
        REG_IE |= INTR_FLAG_VCOUNT;
    } else {
        gDispIo.disp_stat.vcount_int_enable = FALSE;
        REG_IE &= ~INTR_FLAG_VCOUNT;

        gDispIo.disp_stat.vcount_compare = 0;
    }
}

void SetNextVCount(int vcount)
{
    u16 disp_stat;

    disp_stat = REG_DISPSTAT;
    disp_stat = disp_stat & 0xFF;
    disp_stat = disp_stat | (vcount << 8);

    REG_DISPSTAT = disp_stat;
}

void SetVCount(int vcount)
{
    gDispIo.disp_stat.vcount_compare = vcount;
}

void SetMainFunc(Func func)
{
    MainFunc = func;
}

void RunMainFunc(void)
{
    if (MainFunc)
        MainFunc();
}

void RefreshKeyStFromKeys(struct KeySt *keySt, short keys)
{
    keySt->previous = keySt->held;
    keySt->held = keys;

    // keys that are pressed now, but weren't pressed before
    keySt->pressed =
        (keySt->repeated = (keySt->held ^ keySt->previous) & keySt->held) &~ 0;

    if (keySt->pressed)
        keySt->last = keySt->held;

    keySt->ablr_pressed = 0;

    if (keySt->held == 0) {
        if (keySt->last && keySt->last == (keySt->previous & (L_BUTTON | R_BUTTON | B_BUTTON | A_BUTTON)))
            keySt->ablr_pressed = keySt->previous;
    }

    // keys are being held
    if (keySt->held && keySt->held == keySt->previous) {
        keySt->repeat_clock--;

        if (keySt->repeat_clock == 0) {
            keySt->repeated = keySt->held;
            keySt->repeat_clock = keySt->repeat_interval; // reset repeat timer
        }
    } else {
        // held key combination has changed. reset timer
        keySt->repeat_clock = keySt->repeat_delay;
    }

    keySt->pressed2 = (keySt->held ^ keySt->pressed2) & keySt->held;

    if (keys & (A_BUTTON | B_BUTTON | DPAD_ANY | R_BUTTON | L_BUTTON)) // any button other than start and select
        keySt->time_since_start_select = 0;
    else if (keySt->time_since_start_select < UINT16_MAX)
        keySt->time_since_start_select++;
}

void RefreshKeySt(struct KeySt *keySt)
{
    u32 keys = (u16)~REG_KEYINPUT;

    keys &= KEYS_MASK;
    if ((keys & (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) != (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON))
        keys &= ~keyStIgnoredMask;

    RefreshKeyStFromKeys(keySt, keys);
}

void ClearKeySt(struct KeySt * keySt)
{
    keySt->pressed = 0;
    keySt->repeated = 0;
    keySt->held = 0;
}

void InitKeySt(struct KeySt * keySt)
{
    keySt->repeat_delay = 12;
    keySt->repeat_interval = 4;

    keySt->previous = 0;
    keySt->held = 0;
    keySt->pressed = 0;

    keySt->repeat_clock = 0;
    keySt->time_since_start_select = 0;

    keyStIgnoredMask = 0;
}

void SetkeyStIgnoredMask(int mask)
{
    keyStIgnoredMask = mask;
}

struct KeyProc {
    PROC_HEADER
    /*0x2A*/ STRUCT_PAD(0x29, 0x64);
    /*0x64*/ s16 keys;
};

void KeyProcMain(struct KeyProc *kproc)
{
    gpKeySt->pressed = kproc->keys;
    gpKeySt->repeated = kproc->keys;
    gpKeySt->held = kproc->keys;
}

CONST_DATA struct ProcCmd ProcScr_KeyStSetter[] =
{
    PROC_SLEEP(1),
    PROC_CALL(KeyProcMain),
    PROC_END,
};

void NewKeyStSetter(int keys)
{
    struct KeyProc *proc;
    proc = Proc_Start(ProcScr_KeyStSetter, PROC_TREE_1);
    proc->keys = keys;
}

void SetBgOffset(u16 bgid, u16 x_offset, u16 y_offset)
{
    switch (bgid) {
    case 0:
        gDispIo.bg_off[0].x = x_offset;
        gDispIo.bg_off[0].y = y_offset;
        break;

    case 1:
        gDispIo.bg_off[1].x = x_offset;
        gDispIo.bg_off[1].y = y_offset;
        break;

    case 2:
        gDispIo.bg_off[2].x = x_offset;
        gDispIo.bg_off[2].y = y_offset;
        break;

    case 3:
        gDispIo.bg_off[3].x = x_offset;
        gDispIo.bg_off[3].y = y_offset;
        break;
    }
}

void sub_8001E6C(void)
{
    sUnk_03000014 = sUnk_03000015 = 0;

    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
}

void sub_8001EA0(u8 a, u8 b)
{
    sUnk_03000014 = a;
    sUnk_03000015 = b;
}

void sub_8001ED4(u16 *dst, u16 *src)
{
    int i;

    for (i = 0x27F; i >= 0; i--)
        *dst++ = *src++;
}

void sub_8001F14(void *tm, void const *in_data, u8 base, u8 linebits)
{
    u8 const *it = (u8 const *) in_data + 2;
    u8 *out;

    u8 x_size = (*(u32 const *) in_data);
    u8 y_size = (*(u32 const *) in_data) >> 8;

    s8 ix, iy;

    for (iy = y_size; iy >= 0; iy--)
    {
        out = (u8 *) tm + (iy << linebits);

        for (ix = x_size; ix >= 0; ix--)
            *out++ = *it++ + base;
    }
}

void sub_8001FF0(u16 *tm, short const *in_data, int unused)
{
    int x_size = (in_data[0]) & 0xFF;
    int y_size = (in_data[0] >> 8) & 0xFF;

    int ix, iy;

    int acc = 0;

    in_data = in_data + 1;

    for (iy = 0; iy < y_size; ++iy) {
        u16 * out = tm + (iy << 5);

        for (ix = 0; ix < x_size; ++ix) {
            acc += *in_data++;
            *out++ = acc;
        }
    }
}

void ColorFadeInit(void)
{
    int i;

    for (i = 31; i >= 0; i--)
        gFadeComponentStep[i] = 0;
}

void sub_80020CC(u16 const * in_pal, int bank, int count, int component_step)
{
    int pal_idx, color_idx;

    int add = (component_step < 0) ? 0x20 : 0;
    int component_idx = bank * 0x30;

    for (pal_idx = 0; pal_idx < count; ++pal_idx) {
        gFadeComponentStep[bank + pal_idx] = component_step;

        for (color_idx = 0; color_idx < 0x10; ++color_idx) {
            gFadeComponents[component_idx++] = RGB_GET_RED(*in_pal)   + add;
            gFadeComponents[component_idx++] = RGB_GET_GREEN(*in_pal) + add;
            gFadeComponents[component_idx++] = RGB_GET_BLUE(*in_pal)  + add;

            in_pal++;
        }
    }
}

void sub_80021F0(int a, int b, int c, int d)
{
    int pal_idx;
    int color_idx;
    int dst_offset = a * 16;

    u16 const * src = gPal + dst_offset;

    for (pal_idx = 0; pal_idx < b; ++pal_idx) {
        gFadeComponentStep[a + pal_idx] = d;

        for (color_idx = 0; color_idx < 16; ++color_idx) {
            gFadeComponents[dst_offset++] = RGB_GET_RED(*src) + c;
            gFadeComponents[dst_offset++] = RGB_GET_GREEN(*src) + c;
            gFadeComponents[dst_offset++] = RGB_GET_BLUE(*src) + c;

            src++;
        }
    }
}

void sub_8002310(int a, int b, int c)
{
    int i;

    for (i = a; i < a + b; i++)
        gFadeComponentStep[i] = c;
}

void ColorFadeSetupFromColorToBlack(s8 component_step)
{
    int i, j;

    for (i = 0x1F; i >= 0; i--) {
        gFadeComponentStep[i] = component_step;

        for (j = 0; j < 0x10; j++) {
            gFadeComponents[(i * 0x10 + j) * 3 + 0] = RGB_GET_RED(PAL_COLOR(i, j)) + 0x20;
            gFadeComponents[(i * 0x10 + j) * 3 + 1] = RGB_GET_GREEN(PAL_COLOR(i, j)) + 0x20;
            gFadeComponents[(i * 0x10 + j) * 3 + 2] = RGB_GET_BLUE(PAL_COLOR(i, j)) + 0x20;
        }
    }
}

void ColorFadeSetupFromBlack(s8 component_step)
{
    int i, j;

    for (i = 0x1F; i >= 0; i--) {
        gFadeComponentStep[i] = component_step;

        for (j = 0; j < 0x10; j++) {
            gFadeComponents[(i * 0x10 + j) * 3 + 0] = RGB_GET_RED(PAL_COLOR(i, j));
            gFadeComponents[(i * 0x10 + j) * 3 + 1] = RGB_GET_GREEN(PAL_COLOR(i, j));
            gFadeComponents[(i * 0x10 + j) * 3 + 2] = RGB_GET_BLUE(PAL_COLOR(i, j));
        }
    }
}

void ColorFadeSetupFromColorToWhite(s8 component_step)
{
    int i, j;

    for (i = 0x1F; i >= 0; i--) {
        gFadeComponentStep[i] = component_step;

        for (j = 0; j < 0x10; j++) {
            gFadeComponents[(i * 0x10 + j) * 3 + 0] = RGB_GET_RED(PAL_COLOR(i, j)) + 0x20;
            gFadeComponents[(i * 0x10 + j) * 3 + 1] = RGB_GET_GREEN(PAL_COLOR(i, j)) + 0x20;
            gFadeComponents[(i * 0x10 + j) * 3 + 2] = RGB_GET_BLUE(PAL_COLOR(i, j)) + 0x20;
        }
    }
}

void ColorFadeSetupFromWhite(s8 component_step)
{
    int i, j;

    for (i = 0x1F; i >= 0; i--) {
        gFadeComponentStep[i] = component_step;

        for (j = 0; j < 0x10; j++) {
            gFadeComponents[(i * 0x10 + j) * 3 + 0] = RGB_GET_RED(PAL_COLOR(i, j)) + 0x40;
            gFadeComponents[(i * 0x10 + j) * 3 + 1] = RGB_GET_GREEN(PAL_COLOR(i, j)) + 0x40;
            gFadeComponents[(i * 0x10 + j) * 3 + 2] = RGB_GET_BLUE(PAL_COLOR(i, j)) + 0x40;
        }
    }
}

void ColorFadeTick2(void)
{
    // This is a C implementation of the handwritten ARM function ColorFadeTick
    // with the addition of EnablePalSync at the end

    int i, j;
    short red, green, blue;

    for (i = 0x1F; i >= 0; i--) {
        if (gFadeComponentStep[i] == 0)
            continue;

        for (j = 15; j >= 0; j--) {
            int num = i * 0x10 + j;

            gFadeComponents[num * 3 + 0] += gFadeComponentStep[i];
            gFadeComponents[num * 3 + 1] += gFadeComponentStep[i];
            gFadeComponents[num * 3 + 2] += gFadeComponentStep[i];

            red = gFadeComponents[num*3 + 0] - 0x20;

            if (red > 31)
                red = 31;

            if (red < 0)
                red = 0;

            green = gFadeComponents[num*3 + 1] - 0x20;

            if (green > 31)
                green = 31;

            if (green < 0)
                green = 0;

            blue = gFadeComponents[num*3 + 2] - 0x20;

            if (blue > 31)
                blue = 31;

            if (blue < 0)
                blue = 0;

            gPal[num] = (blue << 10) + (green << 5) + red;
        }
    }

    EnablePalSync();
}

void InitBgs(u16 const * config)
{
    u16 default_config[] = {
        // tile offset  map offset  size id
        0x0000,         0x6000,     BG_SIZE_256x256, // BG 0
        0x0000,         0x6800,     BG_SIZE_256x256, // BG 1
        0x0000,         0x7000,     BG_SIZE_256x256, // BG 2
        0x8000,         0x7800,     BG_SIZE_256x256, // BG 3
    };

    int i;

    if (config == NULL)
        config = default_config;

#if MODERN
    gDispIo.bg0_ct = (struct BgCnt){ 0 };
    gDispIo.bg1_ct = (struct BgCnt){ 0 };
    gDispIo.bg2_ct = (struct BgCnt){ 0 };
    gDispIo.bg3_ct = (struct BgCnt){ 0 };
#else
    *(u16 *) &gDispIo.bg0_ct = 0;
    *(u16 *) &gDispIo.bg1_ct = 0;
    *(u16 *) &gDispIo.bg2_ct = 0;
    *(u16 *) &gDispIo.bg3_ct = 0;
#endif

    for (i = 0; i < 4; i++) {
        SetBgChrOffset(i, *config++);
        SetBgTilemapOffset(i, *config++);
        SetBgScreenSize(i, *config++);

        SetBgOffset(i, 0, 0);
        TmFill(GetBgTilemap(i), 0);
        CpuFastFill16(0, (void *)(VRAM + GetBgChrOffset(i)), 64);
    }

    InitBmBgLayers();

    EnableBgSync(BG0_SYNC_BIT + BG1_SYNC_BIT + BG2_SYNC_BIT + BG3_SYNC_BIT);

    InitOam(0);

    PAL_COLOR(0, 0) = 0;
    EnablePalSync();

    gDispIo.disp_ct.forced_blank = FALSE;
    gDispIo.disp_ct.mode = 0;

    SetWinEnable(0, 0, 0);
    SetDispEnable(1, 1, 1, 1, 1);
}

u16 * GetBgTilemap(int bg)
{
    static u16 *lut[] = {
        gBg0Tm,
        gBg1Tm,
        gBg2Tm,
        gBg3Tm,
    };

    return lut[bg];
}

void SoftResetIfKeyCombo(void)
{
    if (gpKeySt->held == (L_BUTTON | R_BUTTON | A_BUTTON | B_BUTTON)) {
        SoftReset(GBA_RESET_ALL);
        return;
    }

    if (gpKeySt->held == (A_BUTTON | B_BUTTON | SELECT_BUTTON | START_BUTTON)) {
        SoftReset(GBA_RESET_ALL);
        return;
    }
}

void sub_8002C24(int unk)
{
    u16 ie = REG_IE;

    REG_KEYCNT = unk - 0x4000;
    REG_IE &= ~(INTR_FLAG_SERIAL | INTR_FLAG_GAMEPAK);
    REG_IE |= INTR_FLAG_KEYPAD;
    REG_DISPCNT |= 1 << 7; // DISPCNT_FORCE_BLANK;

    SoundBiasReset();
    asm("swi 3"); // enter sleep mode
    SoundBiasSet();

    REG_IE = ie;
}

void OnHBlankBoth(void)
{
    if (gOnHBlankA)
        gOnHBlankA();

    if (gOnHBlankB)
        gOnHBlankB();
}

void RefreshOnHBlank(void)
{
    int st = 0;

    if (gOnHBlankA != NULL)
        st += 1;

    if (gOnHBlankB != NULL)
        st += 2;

    switch (st) {
    case 0:
        // no funcs
        gDispIo.disp_stat.hblank_int_enable = 0;
        REG_IE &= ~INTR_FLAG_HBLANK;
        break;

    case 1:
        // only func A
        gDispIo.disp_stat.hblank_int_enable = 1;
        SetIrqFunc(INT_HBLANK, gOnHBlankA);
        REG_IE |= INTR_FLAG_HBLANK;
        break;

    case 2:
        // only func B
        gDispIo.disp_stat.hblank_int_enable = 1;
        SetIrqFunc(INT_HBLANK, gOnHBlankB);
        REG_IE |= INTR_FLAG_HBLANK;
        break;

    case 3:
        // both funcs
        gDispIo.disp_stat.hblank_int_enable = 1;
        SetIrqFunc(INT_HBLANK, OnHBlankBoth);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    }
}

void SetOnHBlankA(Func func)
{
    gOnHBlankA = func;
    RefreshOnHBlank();
}

void SetOnHBlankB(Func func)
{
    gOnHBlankB = func;
    RefreshOnHBlank();
}

int GetBgFromPtr(u16 *ptr)
{
    if (ptr >= gBg0Tm && ptr < gBg0Tm + 0x400)
        return BG_0;

    if (ptr >= gBg1Tm && ptr < gBg1Tm + 0x400)
        return BG_1;

    if (ptr >= gBg2Tm && ptr < gBg2Tm + 0x400)
        return BG_2;

    if (ptr >= gBg3Tm && ptr < gBg3Tm + 0x400)
        return BG_3;

    return BG_INVALID;
}

const s16 gSinLut[0x40] = {
    0x0000, 0x0064, 0x00C8, 0x012D,
    0x0191, 0x01F5, 0x0259, 0x02BC,
    0x031F, 0x0381, 0x03E3, 0x0444,
    0x04A5, 0x0504, 0x0563, 0x05C2,
    0x061F, 0x067B, 0x06D7, 0x0731,
    0x078A, 0x07E2, 0x0839, 0x088F,
    0x08E3, 0x0936, 0x0987, 0x09D7,
    0x0A26, 0x0A73, 0x0ABE, 0x0B08,
    0x0B50, 0x0B96, 0x0BDA, 0x0C1D,
    0x0C5E, 0x0C9D, 0x0CD9, 0x0D14,
    0x0D4D, 0x0D84, 0x0DB9, 0x0DEB,
    0x0E1C, 0x0E4A, 0x0E76, 0x0EA0,
    0x0EC8, 0x0EED, 0x0F10, 0x0F31,
    0x0F4F, 0x0F6B, 0x0F85, 0x0F9C,
    0x0FB1, 0x0FC3, 0x0FD3, 0x0FE1,
    0x0FEC, 0x0FF4, 0x0FFB, 0x0FFE,
};

const s16 gCosLut[0x100] = {
    0x1000, 0x0FFE, 0x0FFB, 0x0FF4,
    0x0FEC, 0x0FE1, 0x0FD3, 0x0FC3,
    0x0FB1, 0x0F9C, 0x0F85, 0x0F6B,
    0x0F4F, 0x0F31, 0x0F10, 0x0EED,
    0x0EC8, 0x0EA0, 0x0E76, 0x0E4A,
    0x0E1C, 0x0DEB, 0x0DB9, 0x0D84,
    0x0D4D, 0x0D14, 0x0CD9, 0x0C9D,
    0x0C5E, 0x0C1D, 0x0BDA, 0x0B96,
    0x0B50, 0x0B08, 0x0ABE, 0x0A73,
    0x0A26, 0x09D7, 0x0987, 0x0936,
    0x08E3, 0x088F, 0x0839, 0x07E2,
    0x078A, 0x0731, 0x06D7, 0x067B,
    0x061F, 0x05C2, 0x0563, 0x0504,
    0x04A5, 0x0444, 0x03E3, 0x0381,
    0x031F, 0x02BC, 0x0259, 0x01F5,
    0x0191, 0x012D, 0x00C8, 0x0064,
    0x0000, 0xFF9C, 0xFF38, 0xFED3,
    0xFE6F, 0xFE0B, 0xFDA7, 0xFD44,
    0xFCE1, 0xFC7F, 0xFC1D, 0xFBBC,
    0xFB5B, 0xFAFC, 0xFA9D, 0xFA3E,
    0xF9E1, 0xF985, 0xF929, 0xF8CF,
    0xF876, 0xF81E, 0xF7C7, 0xF771,
    0xF71D, 0xF6CA, 0xF679, 0xF629,
    0xF5DA, 0xF58D, 0xF542, 0xF4F8,
    0xF4B0, 0xF46A, 0xF426, 0xF3E3,
    0xF3A2, 0xF363, 0xF327, 0xF2EC,
    0xF2B3, 0xF27C, 0xF247, 0xF215,
    0xF1E4, 0xF1B6, 0xF18A, 0xF160,
    0xF138, 0xF113, 0xF0F0, 0xF0CF,
    0xF0B1, 0xF095, 0xF07B, 0xF064,
    0xF04F, 0xF03D, 0xF02D, 0xF01F,
    0xF014, 0xF00C, 0xF005, 0xF002,
    0xF000, 0xF002, 0xF005, 0xF00C,
    0xF014, 0xF01F, 0xF02D, 0xF03D,
    0xF04F, 0xF064, 0xF07B, 0xF095,
    0xF0B1, 0xF0CF, 0xF0F0, 0xF113,
    0xF138, 0xF160, 0xF18A, 0xF1B6,
    0xF1E4, 0xF215, 0xF247, 0xF27C,
    0xF2B3, 0xF2EC, 0xF327, 0xF363,
    0xF3A2, 0xF3E3, 0xF426, 0xF46A,
    0xF4B0, 0xF4F8, 0xF542, 0xF58D,
    0xF5DA, 0xF629, 0xF679, 0xF6CA,
    0xF71D, 0xF771, 0xF7C7, 0xF81E,
    0xF876, 0xF8CF, 0xF929, 0xF985,
    0xF9E1, 0xFA3E, 0xFA9D, 0xFAFC,
    0xFB5B, 0xFBBC, 0xFC1D, 0xFC7F,
    0xFCE1, 0xFD44, 0xFDA7, 0xFE0B,
    0xFE6F, 0xFED3, 0xFF38, 0xFF9C,
    0x0000, 0x0064, 0x00C8, 0x012D,
    0x0191, 0x01F5, 0x0259, 0x02BC,
    0x031F, 0x0381, 0x03E3, 0x0444,
    0x04A5, 0x0504, 0x0563, 0x05C2,
    0x061F, 0x067B, 0x06D7, 0x0731,
    0x078A, 0x07E2, 0x0839, 0x088F,
    0x08E3, 0x0936, 0x0987, 0x09D7,
    0x0A26, 0x0A73, 0x0ABE, 0x0B08,
    0x0B50, 0x0B96, 0x0BDA, 0x0C1D,
    0x0C5E, 0x0C9D, 0x0CD9, 0x0D14,
    0x0D4D, 0x0D84, 0x0DB9, 0x0DEB,
    0x0E1C, 0x0E4A, 0x0E76, 0x0EA0,
    0x0EC8, 0x0EED, 0x0F10, 0x0F31,
    0x0F4F, 0x0F6B, 0x0F85, 0x0F9C,
    0x0FB1, 0x0FC3, 0x0FD3, 0x0FE1,
    0x0FEC, 0x0FF4, 0x0FFB, 0x0FFE,
};
