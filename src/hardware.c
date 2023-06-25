#include "global.h"
#include "hardware.h"

static u8 sBgSyncBits;
static bool sPalSyncFlag;

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
#if 0
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