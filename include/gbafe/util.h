#include "global.h"

enum interpolate_method_idx {
    INTERPOLATE_LINEAR,
    INTERPOLATE_SQUARE,
    INTERPOLATE_CUBIC,
    INTERPOLATE_POW4,
    INTERPOLATE_RSQUARE,
    INTERPOLATE_RCUBIC,
};

int Interpolate(int method, int lo, int hi, int x, int end);
// ??? nullsub_33
bool StringEquals(char const * strA, char const * strB);
void StringCopy(char * dst, char const * src);
// ??? sub_8013614
// ??? sub_8013658
void Decompress(void const * src, void * dst);
int GetDataSize(void const * data);
// ??? sub_80136D0
// ??? sub_80136E8
// ??? sub_8013718
void Register2dChrMove(u8 const * img, u8 * vram, int width, int height);
void Copy2dChr(void const * src, u8 * dst, int width, int height);
void ApplyBitmap(u8 const * src, void * dst, int width, int height);
void ApplyBitmapLine(u8 const * src, void * dst, int width);
// ??? sub_80137F4
void PutAppliedBitmap(u16 * tm, int tileref, int width, int height);
// ??? PutDigits
// ??? sub_80138A0
// ??? sub_80138A8
// ??? sub_80138BC
// ??? sub_80138C8
// ??? sub_80138E8
// ??? sub_8013970
// ??? sub_8013A98
// ??? nullsub_34
// ??? sub_8013B24
// ??? sub_8013B44
// ??? sub_8013B4C
// ??? sub_8013B68
// ??? sub_8013B78
// ??? sub_8013B8C
// ??? sub_8013BA0
// ??? sub_8013BAC
// ??? sub_8013BBC
void ArchiveCurrentPalettes(void);
void ArchivePalette(int index);
void WriteFadedPaletteFromArchive(int red, int green, int blue, u32 mask);
// ??? sub_8013E84
// ??? sub_8013E8C
void sub_8013EF8(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent); // fe8u: sub_8013800
bool sub_8013F3C(void); // fe8u: sub_8013844
// ??? SpacialSeTest_OnInit
// ??? SpacialSeTest_OnLoop
// ??? StartSpacialSeTest
// ??? nullsub_35

struct PalFadeSt {
    /* 00 */ u16 from_colors[0x10];
    /* 20 */ u16 const * to_colors;
    /* 24 */ u16 * pal;
    /* 28 */ u16 clock;
    /* 2A */ u16 clock_end;
    /* 2C */ u16 clock_stop;
};

void StartPalFadeToBlack(int palid, int duration, ProcPtr parent);
void StartPalFadeToWhite(int palid, int duration, ProcPtr parent);
struct PalFadeSt * StartPalFade(u16 const * colors, int pal, int duration, ProcPtr parent);
// ??? sub_8014080
// ??? sub_8014090
// ??? sub_8014094
void SetBlackPal(int palid);
// ??? sub_801419C
// ??? sub_80141BC
// ??? sub_80141D4
// ??? sub_80141EC
// ??? sub_8014264
// ??? sub_80142A8
// ??? sub_8014334
// ??? sub_8014374
// ??? sub_80143A4
// ??? FadeExists
// ??? StartFadeFromBlack
// ??? StartLockingFadeToBlack
// ??? StartLockingFadeFromBlack
// ??? sub_8014470
// ??? sub_8014488
// ??? sub_80144A0
// ??? StartMidFadeFromBlack
// ??? StartSlowFadeFromBlack
// ??? StartFastFadeFromBlack
void StartMidLockingFadeToBlack(ProcPtr parent);
// ??? StartSlowLockingFadeToBlack
// ??? StartFastLockingFadeToBlack
void StartMidLockingFadeFromBlack(ProcPtr parent);
// ??? StartSlowLockingFadeFromBlack
// ??? StartFastLockingFadeFromBlack
// ??? sub_8014530
// ??? sub_8014540
// ??? sub_8014550
// ??? sub_8014560
// ??? sub_8014570
// ??? sub_8014580
// ??? sub_8014598
// ??? sub_80145B0
// ??? sub_80145C8
// ??? sub_80145E0
// ??? sub_80145F8
// ??? sub_801460C
// ??? sub_8014620
// ??? sub_8014634
// ??? sub_8014648
// ??? sub_8014660
// ??? sub_8014678
// ??? sub_8014690
// ??? sub_80146A8
// ??? sub_80146C0
// ??? sub_80146D4
// ??? sub_80146E8
// ??? sub_8014700
// ??? sub_8014714
// ??? sub_8014728
// ??? sub_801473C
// ??? sub_8014750
// ??? sub_8014764
// ??? sub_8014778
// ??? sub_801478C
// ??? sub_80147A0
// ??? WhileFadeExists
// ??? sub_80147D4
// ??? StartFadeCore
// ??? sub_8014834
// ??? sub_8014844
// ??? sub_8014850
// ??? sub_8014874
// ??? sub_80148C0
// ??? sub_80148D4
// ??? sub_80148E4
// ??? sub_8014900
// ??? sub_8014970
// ??? sub_80149B4
// ??? sub_80149D0
// ??? sub_80149EC
// ??? sub_8014AB0
// ??? sub_8014B14
// ??? sub_8014B58
// ??? sub_8014B68
// ??? sub_8014BA4
// ??? sub_8014BBC
// ??? sub_8014BD4
// ??? sub_8014C38
// ??? sub_8014CA0
// ??? sub_8014D78
// ??? sub_8014E24
// ??? sub_8014EE4
// ??? sub_8014F64
// ??? sub_8014F88
// ??? sub_8014FB0
// ??? sub_8014FCC
// ??? sub_8014FEC
// ??? sub_8015000
// ??? sub_8015010
// ??? sub_8015020
// ??? sub_8015044
// ??? sub_8015068
// ??? sub_80150A0
// ??? sub_80150CC
// ??? sub_80150F0
// ??? sub_801514C
// ??? sub_80151D4
// ??? sub_80151FC
// ??? sub_801525C
// ??? sub_8015274
// ??? sub_8015294
// ??? sub_80152A4
// ??? sub_80152B4
// ??? sub_801530C
// ??? sub_8015324
// ??? sub_8015374
// ??? sub_80153C0
// ??? sub_8015530
// ??? sub_8015550
// ??? sub_8015584
// ??? sub_80155D0
// ??? sub_8015618
// ??? nullsub_36
// ??? sub_8015664
// ??? sub_8015688
// ??? sub_80156C0
