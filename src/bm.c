#include "gbafe.h"

void OnVBlank(void)
{
    INTR_CHECK = INTR_FLAG_VBLANK;

    IncGameTime();
    m4aSoundVSync();

    Proc_Run(gProcTreeRootArray[0]);

    SyncLoOam();

    if (gBmSt.main_loop_ended)
    {
        gBmSt.main_loop_ended = FALSE;

        SyncDispIo();
        SyncBgsAndPal();
        ApplyDataMoves();
        SyncHiOam();
    }

    m4aSoundMain();
}

void OnMain(void)
{
    RefreshKeySt(gpKeySt);

    ClearSprites();

    Proc_Run(gProcTreeRootArray[1]);

    if (GetGameLock() == 0)
        Proc_Run(gProcTreeRootArray[2]);

    Proc_Run(gProcTreeRootArray[3]);

    Proc_Run(gProcTreeRootArray[5]);
    PutSpriteLayerOam(0);

    Proc_Run(gProcTreeRootArray[4]);
    PutSpriteLayerOam(13);

    gBmSt.main_loop_ended = TRUE;
    gBmSt.main_loop_end_scanline = REG_VCOUNT;

    VBlankIntrWait();
}

void LockGame(void)
{
    gBmSt.lock++;
}

void UnlockGame(void)
{
    gBmSt.lock--;
}

u8 GetGameLock(void)
{
    return gBmSt.lock;
}

void HandleChangePhase(void)
{
    switch (gPlaySt.faction) {
    case FACTION_BLUE:
        gPlaySt.faction = FACTION_RED;
        break;

    case FACTION_RED:
        gPlaySt.faction = FACTION_GREEN;
        break;

    case FACTION_GREEN:
        gPlaySt.faction = FACTION_BLUE;

        if (gPlaySt.chapterTurnNumber < 999)
            gPlaySt.chapterTurnNumber++;

        DoTurnSupportExp();
        break;
    }
}

#if 0
void BmMain_StartIntroFx(ProcPtr proc)
{
    if (gPlaySt.chapterIndex == 0x2F)
    {
        SetBlendDarken(0x10);
        return;
    }

    Proc_StartBlocking(ProcScr_ChapterIntrofx, proc);
}
#endif
