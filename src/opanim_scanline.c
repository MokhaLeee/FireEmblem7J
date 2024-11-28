#include "gbafe.h"

EWRAM_OVERLAY(gamestart) struct OpScanlineSt OpScanlineSt = {};
EWRAM_OVERLAY(gamestart) u8 OpScanlineBuf[0x280] = {};
EWRAM_OVERLAY(gamestart) u8 * gpOpScanlineBufs[2] = {};

void sub_80BBAEC(void)
{
    gUnkOpAnim_02007508.unk_00 = 0xF8;
    gUnkOpAnim_02007508.unk_04 = 0x04;
}

void InitOpScanlineBuf(void)
{
    CpuFastFill(0, OpScanlineBuf, 0x280);

    gpOpScanlineBufs[0] = OpScanlineBuf;
    gpOpScanlineBufs[1] = OpScanlineBuf + 0x140;

    OpScanlineSt.unk_00 = 0;
    OpScanlineSt.unk_04 = 0x300;
    OpScanlineSt.unk_08 = 0x200;
    OpScanlineSt.unk_0C = 0x200;
    OpScanlineSt.unk_10 = 0x300;
    OpScanlineSt.unk_18 = 0;
    OpScanlineSt.unk_14 = 0;
}

void SwapOpScanlineBufs(void)
{
    u8 * buf = gpOpScanlineBufs[0];

    gpOpScanlineBufs[0] = gpOpScanlineBufs[1];
    gpOpScanlineBufs[1] = buf;
}

#if 0
void sub_80BBB5C(void)
{
    int i;
    int r8;

    signed long long __unk_00 = OpScanlineSt.unk_04;
    signed long long __unk_08 = OpScanlineSt.unk_00;
    signed long long __unk_10 = OpScanlineSt.unk_0C;
    signed long long __unk_18 = OpScanlineSt.unk_10;

    if (OpScanlineSt.unk_18 == 0)
    {
        for (i = 1; i < 0xA0; i = i + 2)
        {
            int val = i * __unk_00 + __unk_08;

            gpOpScanlineBufs[0][i + 0x00] = ((SIN_Q12(val + 0x00) + 0xFFF) * __unk_10) >> 20;
            gpOpScanlineBufs[0][i + 0xA0] = ((SIN_Q12(val + 0x40) + 0xFFF) * __unk_18) >> 20;
        }
    }
    else
    {
        for (i = 9; i < 0x80; i = i + 2)
        {
            r8 = ((OpScanlineSt.unk_14 - i) * (OpScanlineSt.unk_14 - i) * 0x100) / (OpScanlineSt.unk_18 * OpScanlineSt.unk_18);

            if (r8 > 0)
            {
                int val = i * __unk_00 + __unk_08;

                gpOpScanlineBufs[0][i + 0x00] = ((SIN_Q12(val + 0x00) + 0xFFF) * __unk_18 * r8) >> 20;
                gpOpScanlineBufs[0][i + 0xA0] = ((SIN_Q12(val + 0x40) + 0xFFF) * __unk_10 * r8) >> 20;
            }
        }
    }

    SwapOpScanlineBufs();
    OpScanlineSt.unk_00 += OpScanlineSt.unk_08;
}
#endif
