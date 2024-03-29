#include "gbafe.h"

static u16 sRandStA[3];
static int sRandStB;

int NextRN(void)
{
    // This generates a pseudorandom string of 16 bits
    // In other words, a pseudorandom integer that can range from 0 to 65535

    u16 rn = (sRandStA[1] << 11) + (sRandStA[0] >> 5);

    // Shift state[2] one bit
    sRandStA[2] = sRandStA[2] << 1;

    // "carry" the top bit of state[1] to state[2]
    if (sRandStA[1] & 0x8000)
        sRandStA[2]++;

    rn ^= sRandStA[2];

    // Shifting the whole state 16 bits
    sRandStA[2] = sRandStA[1];
    sRandStA[1] = sRandStA[0];
    sRandStA[0] = rn;

    return rn;
}

void RandInit(int seed)
{
    // This table is a collection of 8 possible initial rn state
    // 3 entries will be picked based of which "seed" was given

    u16 initTable[] =
    {
        0xA36E, 0x924E,
        0xB784, 0x4F67,
        0x8092, 0x592D,
        0x8E70, 0xA794,
    };

    int i = seed % 7, burnAmt;

    sRandStA[0] = initTable[i & 7]; i++;
    sRandStA[1] = initTable[i & 7]; i++;
    sRandStA[2] = initTable[i & 7];

    burnAmt = seed % 23;

    for (i = 0; i < burnAmt; i++)
        NextRN();
}

void RandSetSt(u16 const * st)
{
    sRandStA[0] = *st++;
    sRandStA[1] = *st++;
    sRandStA[2] = *st;
}

void RandGetSt(u16 * st)
{
    *st++ = sRandStA[0];
    *st++ = sRandStA[1];
    *st   = sRandStA[2];
}

int RandNext_100(void)
{
    return NextRN() * 100 / 0x10000;
}

int RandNext(int max)
{
    return NextRN() * max / 0x10000;
}

bool RandRoll(int threshold)
{
    return (threshold > RandNext_100());
}

bool RandRoll2Rn(int threshold)
{
    int rand;

    rand = RandNext_100();
    rand = rand + RandNext_100();
    rand = rand / 2;

    return (threshold > rand);
}

// the second implementation of RN is an LCG (Linear Congruental Generator),
// where sRandStB is set to a seed and then advanced and retrieved on demand.

void RandInitB(int seed)
{
    sRandStB = seed;
}

// The LCGRN state is advanced and retrieved here.
unsigned RandNextB(void)
{
    unsigned rand;

    rand = (sRandStB << 2) + 2;
    rand = rand * (rand + 1);
    rand = rand >> 2;

    sRandStB = rand;
    return rand;
}
