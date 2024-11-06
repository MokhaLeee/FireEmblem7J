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
