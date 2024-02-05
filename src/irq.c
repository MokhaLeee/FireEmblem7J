#include "gbafe.h"

extern IrqFunc gIrqFuncs[INT_COUNT];
extern u32 IntrMainRam[0x200];

void DummyIrqRoutine(void);

void IrqInit(void)
{
    int i;

    for (i = 0; i < INT_COUNT; ++i)
        gIrqFuncs[i] = DummyIrqRoutine;

    CpuFastCopy(IrqMain, IntrMainRam, sizeof IntrMainRam);
    INTR_VECTOR = IntrMainRam;
}

void DummyIrqRoutine(void)
{
}

void SetIrqFunc(int num, IrqFunc func)
{
    gIrqFuncs[num] = func;
}
