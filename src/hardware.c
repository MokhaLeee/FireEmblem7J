#include "global.h"
#include "hardware.h"
#include "irq.h"

static u8 sBgSyncBits;
static bool sPalSyncFlag;
static u16 keyStBak;
static unsigned sGameTime;

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

void sub_080010CC(u16 *a, int b, int size, int d)
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
#if 0
void RefreshKeySt(struct KeySt *keySt)
{
    u16 keys = ~REG_KEYINPUT;

    keys &= KEYS_MASK;
    if ((keys & (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) != (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON))
        keys &= ~keyStBak;

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
}
#endif