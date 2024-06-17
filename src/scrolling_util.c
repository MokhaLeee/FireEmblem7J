#include "gbafe.h"

int sub_80A95B4(int a, int b, int c, int d, int e)
{
    u64 accum;

    u64 tmpA = (e - 0x400) * (e - 0x400) * (e * 2 + 0x400);
    u64 tmpB = e * e * (0xc00 - e * 2);
    u64 tmpC = (0x400 - e) * (0x400 - e) * e;
    u64 tmpD = e * (e - 0x400) * e;

    accum = (tmpA * b)
        + (tmpB * c)
        + (tmpC * ((c - a) >> 1))
        + (tmpD * ((d - b) >> 1));

    return accum >> 30;
}

int sub_80A968C(int a, int b, int c, int d, int e)
{
    u64 accum;

    u64 tmpA = e * 6 * e - e * 0x1800;
    u64 tmpB = e * 0x1800 - e * 6 * e;
    u64 tmpC = e * 3 * e - e * 0x1000 + 0x100000;
    u64 tmpD = e * 3 * e - e * 0x800;

    accum = (tmpA * b)
        + (tmpB * c)
        + (tmpC * ((c - a) >> 1))
        + (tmpD * ((d - b) >> 1));

    return accum >> 20;
}

void sub_80A974C(u16 * buf, int xBase, int yBase, int bg, int xOffset, int yOffset, int xMax, int yMax)
{
    int ix;
    int iy;

    u16 * bgBuf = GetBgTilemap(bg & 3);
    buf = buf + TM_OFFSET(xBase, yBase);

    if (xOffset < 0)
    {
        xMax = xMax + xOffset;
        buf = buf - xOffset;
        xOffset = 0;
    }

    if (yOffset < 0)
    {
        yMax = yMax + yOffset;
        buf = buf - yOffset * 0x20;
        yOffset = 0;
    }

    for (iy = 0; yOffset + iy < 0x20 && iy < yMax; iy++)
        for (ix = 0; xOffset + ix < 0x20 && ix < xMax; ix++)
            bgBuf[TM_OFFSET((xOffset + ix) & 0x1f, (yOffset + iy) & 0x1f)] = buf[TM_OFFSET(ix, iy)];
}
