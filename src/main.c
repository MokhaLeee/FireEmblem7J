#include "gbafe.h"

void AgbMain(void)
{
    // clear RAM
    DmaFill32(3, 0, (void *)IWRAM_START, IWRAM_SIZE - 0x80);
    CpuFastFill(0, (void *)EWRAM_START, EWRAM_SIZE);

    REG_WAITCNT = WAITCNT_SRAM_4 | WAITCNT_WS0_N_3 | WAITCNT_WS0_S_1 | WAITCNT_WS1_N_3 | WAITCNT_WS1_S_1 |
        WAITCNT_WS2_N_3 | WAITCNT_WS2_S_1 | WAITCNT_PHI_OUT_NONE | WAITCNT_PREFETCH_ENABLE;

    IrqInit();
    SetOnVBlank(NULL);

    REG_DISPSTAT = 8;
    REG_IME = 1;

    InitKeySt(gpKeySt);
    RefreshKeySt(gpKeySt);

    InitRamFuncs();
    SramInit();
    Proc_Init();
    InitSpriteAnims();
    MU_Init();

    RandInitB(0x42D690E9);
    RandInit(RandNextB());

    LoadAndVerifySramSaveData();
    m4aSoundInit();
    sub_8003E48();
    SetOnVBlank(OnVBlank);

    StartGame();

    for (;;)
    {
        RunMainFunc();
        SoftResetIfKeyCombo();
    }
}

void DebugPutStr(u16 * tm, char const * str);

void PutBuildInfo(u16 * tm)
{
    DebugPutStr(tm + TM_OFFSET(0, 0), "2003/03/29(SAT) 11:59:17");
    DebugPutStr(tm - TM_OFFSET(0, 1), "katayama");
}
