#include "gbafe.h"

EWRAM_OVERLAY(0) u16 gChapterIntroMotifTmBuf_pad = 0;
EWRAM_OVERLAY(0) u16 gChapterIntroMotifTmBuf[0x400] = {};

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg3Scroll[] = {
    PROC_REPEAT(ChapterIntro_Bg3Scroll_Loop),
    PROC_END,
};

void ChapterIntro_Bg3Scroll_Loop(ProcPtr proc)
{
    int offset = (GetGameTime()/2) % 0x100;

    SetBgOffset(3, offset, offset);
}

struct ProcCmd CONST_DATA ProcScr_ChapterIntroDeamon[] = {
    PROC_CALL(ChapterIntroDeamon_Init),
    PROC_REPEAT(ChapterIntroDeamon_Loop),
    PROC_END,
};

void ChapterIntroDeamon_Init(struct ProcChapterIntroDeamon * proc)
{
    proc->skipped = proc->proc_parent->skipped = false;
}

void ChapterIntroDeamon_Loop(struct ProcChapterIntroDeamon * proc)
{
    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        if (proc->proc_parent->fasten != 0)
            proc->skipped = true;
        else
            proc->proc_parent->fasten = true;
    }

    if (proc->skipped != 0)
    {
        struct ProcChapterIntrofx * parent = proc->proc_parent;

        if (parent->skipped)
        {
            Proc_Goto(parent, parent->skipped);
            Proc_End(proc);
        }
    }
}

struct ProcCmd CONST_DATA ProcScr_ChapterIntrofx[] = {
    PROC_CALL(LockBmDisplay),
    PROC_CALL(ChapterIntro_Init),
    PROC_START_CHILD(ProcScr_ChapterIntro_Bg3Scroll),
    PROC_START_CHILD(ProcScr_ChapterIntroDeamon),
    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 1),
    PROC_CALL(ChapterIntro_BeginFadeIn),
    PROC_REPEAT(ChapterIntro_LoopFadeIn),
    PROC_CALL_ARG(ChapterIntro_SetTimer, 40),
    PROC_REPEAT(ChapterIntro_TickTimer),
    PROC_CALL(ChapterIntro_BeginMotifFadeIn),
    PROC_REPEAT(ChapterIntro_LoopMotifFadeIn),
    PROC_CALL_ARG(ChapterIntro_SetTimer, 80),
    PROC_REPEAT(ChapterIntro_TickTimer),
    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 0),
    PROC_CALL(ChapterIntro_BeginHOpenText),
    PROC_REPEAT(ChapterIntro_LoopHOpenText),
    PROC_CALL(ChapterIntro_BeginVOpenText),
    PROC_REPEAT(ChapterIntro_LoopVOpenText),
    PROC_CALL(ChapterIntro_SetFasten),
    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 1),
    PROC_CALL(ChapterIntro_Begin_0801FE98),
    PROC_REPEAT(ChapterIntro_Loop_0801E1F8),
    PROC_SLEEP(120),
    PROC_CALL(ChapterIntro_Begin_0801FF18),
    PROC_REPEAT(ChapterIntro_Loop_0801FF3C),
    PROC_END_EACH(ProcScr_ChapterIntro_Bg3Scroll),
    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 0),
    PROC_CALL(ChapterIntro_0801FFD0),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFadeToMap),
    PROC_REPEAT(ChapterIntro_LoopFadeToMap),
    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 2),
    PROC_SLEEP(90),
    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 0),
    PROC_CALL(ChapterIntro_BeginCloseText),
    PROC_REPEAT(ChapterIntro_LoopCloseText),
    PROC_SLEEP(30),
    PROC_GOTO(99),
PROC_LABEL(1),
    PROC_CALL(ChapterIntro_BeginFadeOut),
    PROC_REPEAT(ChapterIntro_LoopFadeOut),
    PROC_CALL(ChapterIntro_0801FFD0),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFastFadeToMap),
    PROC_REPEAT(ChapterIntro_LoopFastFadeToMap),
    PROC_GOTO(99),
PROC_LABEL(2),
    PROC_CALL(ChapterIntro_BeginFastCloseText),
    PROC_REPEAT(ChapterIntro_LoopFastCloseText),
PROC_LABEL(99),
    PROC_END,
};

void PutChapterIntroMotif(void)
{
    int ix, iy;
    int tile = 0;

    TmFill(gBg2Tm, 0);

    Decompress(Tm_ChapterIntroMotif, gChapterIntroMotifTmBuf);

    for (iy = 0; iy < 18; ++iy)
        for (ix = 0; ix < 24; ++ix)
            gBg2Tm[TM_OFFSET(3 + ix, 1 + iy)] = TILEREF(1 + gChapterIntroMotifTmBuf[tile++], BGPAL_CHAPTERINTRO_MOTIF);
}

void PutScreenFogEffect(void)
{
    int ix, iy;

    int tilerefA = TILEREF(0x3FF & (BGCHR_CHAPTERINTRO_FOG+0x00), BGPAL_CHAPTERINTRO_FOG);
    int tilerefB = TILEREF(0x3FF & (BGCHR_CHAPTERINTRO_FOG+0x10), BGPAL_CHAPTERINTRO_FOG);

    for (iy = 0; iy < 8; ++iy)
    {
        for (ix = 0; ix < 16; ++ix)
        {
            gBg3Tm[TM_OFFSET(0x00+ix, iy+0x00)] = tilerefA;
            gBg3Tm[TM_OFFSET(0x10+ix, iy+0x00)] = tilerefA;
            gBg3Tm[TM_OFFSET(0x00+ix, iy+0x10)] = tilerefA;
            gBg3Tm[TM_OFFSET(0x10+ix, iy+0x10)] = tilerefA;

            gBg3Tm[TM_OFFSET(0x00+ix, iy+0x08)] = tilerefB;
            gBg3Tm[TM_OFFSET(0x10+ix, iy+0x08)] = tilerefB;
            gBg3Tm[TM_OFFSET(0x00+ix, iy+0x18)] = tilerefB;
            gBg3Tm[TM_OFFSET(0x10+ix, iy+0x18)] = tilerefB;

            tilerefA += 1;
            tilerefB += 1;
        }

        tilerefA += 0x10;
        tilerefB += 0x10;
    }
}

void PutScreenFogEffectOverlayed(void)
{
    int ix, iy;

    int tilerefA = TILEREF(0x3FF & (BGCHR_CHAPTERINTRO_FOG+0x00), BGPAL_CHAPTERINTRO_FOG);
    int tilerefB = TILEREF(0x3FF & (BGCHR_CHAPTERINTRO_FOG+0x10), BGPAL_CHAPTERINTRO_FOG);

    for (iy = 0; iy < 8; ++iy)
    {
        for (ix = 0; ix < 16; ++ix)
        {
            gBg2Tm[TM_OFFSET(0x0F-ix, iy+0x00)] = tilerefA + TILE_HFLIP;
            gBg2Tm[TM_OFFSET(0x1F-ix, iy+0x00)] = tilerefA + TILE_HFLIP;
            gBg2Tm[TM_OFFSET(0x0F-ix, iy+0x10)] = tilerefA + TILE_HFLIP;
            gBg2Tm[TM_OFFSET(0x1F-ix, iy+0x10)] = tilerefA + TILE_HFLIP;

            gBg2Tm[TM_OFFSET(0x0F-ix, iy+0x08)] = tilerefB + TILE_HFLIP;
            gBg2Tm[TM_OFFSET(0x1F-ix, iy+0x08)] = tilerefB + TILE_HFLIP;
            gBg2Tm[TM_OFFSET(0x0F-ix, iy+0x18)] = tilerefB + TILE_HFLIP;
            gBg2Tm[TM_OFFSET(0x1F-ix, iy+0x18)] = tilerefB + TILE_HFLIP;

            tilerefA += 1;
            tilerefB += 1;
        }

        tilerefA += 0x10;
        tilerefB += 0x10;
    }
}

void ChapterIntro_Init(struct ProcChapterIntrofx * proc)
{
    InitBmBgLayers();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);
    TmFill(gBg3Tm, 0);

    SetBgChrOffset(2, CHR_SIZE*BGCHR_CHAPTERINTRO_MOTIF);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetWin0Box(0, 0, 0, 0);

    PutChapterTitlePalette(8, BGPAL_CHAPTERINTRO_0);
    PutChapterTitlePalette(0, BGPAL_CHAPTERINTRO_1);

    PutChapterTitleUnkBG(BGCHR_CHAPTERINTRO_80);
    PutChapterTitleGfx(BGCHR_CHAPTERINTRO_100, GetChapterTitle(&gPlaySt));

    PutChapterTitleBgUnkTsa(gBg1Tm + TM_OFFSET(0, 8), BGPAL_CHAPTERINTRO_0);
    PutChapterTitleNameTsa(gBg0Tm + TM_OFFSET(3, 9), BGPAL_CHAPTERINTRO_1);

    ColorFadeInit();
    sub_80021F0(BGPAL_CHAPTERINTRO_0, 2, 0x40, -1);
    ColorFadeTick();

    EnablePalSync();

    Decompress(Img_ChapterIntroFog, (u8 *) VRAM + CHR_SIZE*BGCHR_CHAPTERINTRO_FOG);
    ApplyPalette(Pal_ChapterIntroFog, BGPAL_CHAPTERINTRO_FOG);

    Decompress(Img_ChapterIntroMotif, (u8 *) VRAM + CHR_SIZE*(BGCHR_CHAPTERINTRO_MOTIF+1));
    ApplyPalette(Pal_ChapterIntroMotif, BGPAL_CHAPTERINTRO_MOTIF);

    SetBlankChr(BGCHR_CHAPTERINTRO_MOTIF);

    gPal[0] = 0;

    PutChapterIntroMotif();
    PutScreenFogEffect();

    EnableBgSync(BG0_SYNC_BIT + BG1_SYNC_BIT + BG2_SYNC_BIT + BG3_SYNC_BIT);

    proc->fasten = false;
}

void ChapterIntro_BeginFadeIn(struct ProcChapterIntrofx * proc)
{
    SetDispEnable(0, 0, 0, 1, 1);
    SetBlendTargetA(0, 0, 0, 1, 1);

    proc->timer = 12;

    FadeBgmOut(2);
}

void ChapterIntro_LoopFadeIn(struct ProcChapterIntrofx * proc)
{
    SetBlendDarken(proc->timer);

    if (proc->skipped != 3 && (GetGameTime() % 4) != 0)
        return;

    if (proc->fasten != false)
        proc->timer -= 4;
    else
        proc->timer -= 1;

    if (proc->timer < 0)
    {
        SetBlendDarken(0);
        Proc_Break(proc);
    }
}

void ChapterIntro_BeginMotifFadeIn(struct ProcChapterIntrofx * proc)
{
    SetDispEnable(0, 0, 1, 1, 1);

    proc->timer = 0x10;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    PlaySoundEffect(SONG_60);
}

void ChapterIntro_LoopMotifFadeIn(struct ProcChapterIntrofx * proc)
{
     SetBlendAlpha(0x10 - proc->timer, 0x10);

    if (proc->skipped != 3 && (GetGameTime() % 4) != 0)
        return;

    if (proc->fasten != false)
        proc->timer -= 4;
    else
        proc->timer -= 1;

    if (proc->timer < 0)
    {
        SetBlendAlpha(0x10, 0x10);
        Proc_Break(proc);
    }
}

void ChapterIntro_BeginHOpenText(struct ProcChapterIntrofx * proc)
{
    proc->timer = 0;

    SetDispEnable(1, 1, 1, 1, 1);
    PlaySoundEffect(SONG_61);
}

void ChapterIntro_LoopHOpenText(struct ProcChapterIntrofx * proc)
{
    int val = Interpolate(INTERPOLATE_RSQUARE, 0, DISPLAY_WIDTH/2, proc->timer, 0x10);

    SetWin0Box(DISPLAY_WIDTH/2 - val, 78, DISPLAY_WIDTH/2 + val, 81);
    if (proc->fasten != 0 && proc->timer & 2)
        proc->timer += 2;
    else
        proc->timer += 1;

    if (proc->timer > 0x10)
        Proc_Break(proc);
}

void ChapterIntro_BeginVOpenText(struct ProcChapterIntrofx * proc)
{
    proc->timer = 1;
}

void ChapterIntro_LoopVOpenText(struct ProcChapterIntrofx * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 3);

    SetWin0Box(0, DISPLAY_HEIGHT/2 - val, DISPLAY_WIDTH, DISPLAY_HEIGHT/2 + val);
    proc->timer++;

    if (proc->timer > 3)
        Proc_Break(proc);
}

void ChapterIntro_Begin_0801FE98(struct ProcChapterIntrofx * proc)
{
    proc->timer = 0x20;

    SetBlendAlpha(0x10, 0x10);

    SetBlendTargetA(0, 1, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);
}

void ChapterIntro_Loop_0801E1F8(struct ProcChapterIntrofx * proc)
{
    ColorFadeTick();
    EnablePalSync();

    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void ChapterIntro_Begin_0801FF18(struct ProcChapterIntrofx * proc)
{
    proc->timer = 13;

    ColorFadeInit();
    sub_80020CC(gPal + 0x10*BGPAL_CHAPTERINTRO_FOG, BGPAL_CHAPTERINTRO_FOG, 2, -1);
}

void ChapterIntro_Loop_0801FF3C(struct ProcChapterIntrofx * proc)
{
    if ((GetGameTime() % 4) == 0)
    {
        ColorFadeTick();
        EnablePalSync();

        proc->timer--;

        if (proc->timer < 0)
        {
            SetDispEnable(1, 1, 0, 0, 0);
            SetBgChrOffset(2, 0);
            SetBackdropColor(0);
            Proc_Break(proc);
        }
    }
}

void ChapterIntro_801FFA8(void)
{
    InitBgs(NULL);
    ApplySystemGraphics();
    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
    InitSystemTextFont();
}

void ChapterIntro_0801FFD0(struct ProcChapterIntrofx * proc)
{
    gBmSt.camera.y = 40*16;
}

void ChapterIntro_InitMapDisplay(struct ProcChapterIntrofx * proc)
{
    int val;

    SetDispEnable(1, 1, 1, 1, 1);

    SetBlendAlpha(0x10, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1); SetBlendBackdropB(1);

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    DisableTilesetPalAnim();

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);
    ApplyUnitSpritePalettes();
    ApplySystemObjectsGraphics();

    val = GetChapterInfo(gPlaySt.chapterIndex)->unk_0F;
    val = GetCameraCenteredX(val*16);
    val = (val + 15) & 0x1F0;
    gBmSt.camera.x = val;

    val = GetChapterInfo(gPlaySt.chapterIndex)->unk_10;
    val = GetCameraCenteredY(val*16);
    val = (val + 15) & 0x3F0;
    gBmSt.camera.y = val;

    RefreshEntityMaps();
    RenderMap();
}

void ChapterIntro_BeginFadeToMap(struct ProcChapterIntrofx * proc)
{
    ColorFadeInit();

    sub_80020CC(gPal + 0x10*BGPAL_TILESET, 6, 10, +1);
    sub_80020CC(gPal + 0x10*(0x10+OBPAL_CHAPTERINTRO_10), 0x10+OBPAL_CHAPTERINTRO_10, 6, +1);
    sub_80020CC(gPal + 0x10*(0x10+OBPAL_SYSTEM_OBJECTS), 0x10+OBPAL_SYSTEM_OBJECTS, 2, +1);
    sub_80020CC(gPal + 0x10*(0x10+OBPAL_CHAPTERINTRO_7), 0x10+OBPAL_CHAPTERINTRO_7, 1, +1);

    ColorFadeTick();
    EnablePalSync();

    proc->timer = 30;

    if (GetChapterInfo(gPlaySt.chapterIndex)->weather == WEATHER_FLAMES)
        ApplyFlamesWeatherGradient();
}

// aka: ChapterIntro_LoopFadeToMap in FE8
void ChapterIntro_LoopFadeToMap(struct ProcChapterIntrofx * proc)
{
    if ((GetGameTime() % 2) == 0)
    {
        ColorFadeTick();

        if (GetChapterInfo(gPlaySt.chapterIndex)->weather == WEATHER_FLAMES)
            ApplyFlamesWeatherGradient();

        if (GetChapterInfo(gPlaySt.chapterIndex)->fadeToBlack)
        {
            if (GetChapterInfo(gPlaySt.chapterIndex)->song_openning[gPlaySt.chapterModeIndex != 3 ? 0 : 1] != 0xFFFF)
                StartBgm(GetChapterInfo(gPlaySt.chapterIndex)->song_openning[gPlaySt.chapterModeIndex != 3 ? 0 : 1], 0);

            proc->timer = 0;
            SetDispEnable(1, 1, 1, 0, 0);
        }
        else
        {
            int val;

            EnablePalSync();

            val = (proc->timer + 7) / 8;
            SetBlendAlpha(12 + val, 4 - val);
        }

        proc->timer--;
        if (proc->timer == 24)
            if (GetChapterInfo(gPlaySt.chapterIndex)->song_openning[gPlaySt.chapterModeIndex != 3 ? 0 : 1] != 0xFFFF)
                StartBgm(GetChapterInfo(gPlaySt.chapterIndex)->song_openning[gPlaySt.chapterModeIndex != 3 ? 0 : 1], 0);

        if (proc->timer < 0)
        {
            EnableTilesetPalAnim();
            Proc_Break(proc);
        }
    }
}

void ChapterIntro_BeginCloseText(struct ProcChapterIntrofx * proc)
{
    proc->timer = 0x10;
}

void ChapterIntro_LoopCloseText(struct ProcChapterIntrofx * proc)
{
    SetWin0Box(0, DISPLAY_HEIGHT/2 - proc->timer, DISPLAY_WIDTH, DISPLAY_HEIGHT/2 + proc->timer);

    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void ChapterIntro_BeginFastCloseText(struct ProcChapterIntrofx * proc)
{
    proc->timer = 8;
}

void ChapterIntro_LoopFastCloseText(struct ProcChapterIntrofx * proc)
{
    SetWin0Box(0, DISPLAY_HEIGHT/2 - proc->timer, DISPLAY_WIDTH, DISPLAY_HEIGHT/2 + proc->timer);

    proc->timer -= 2;

    if (proc->timer < 0)
        Proc_Break(proc);
}


void ChapterIntro_BeginFadeOut(struct ProcChapterIntrofx * proc)
{
    ColorFadeInit();
    sub_80020CC(gPal, 0, 6, -2);

    proc->timer = 15;

    Sound_FadeOutSE(1);
}

void ChapterIntro_LoopFadeOut(struct ProcChapterIntrofx * proc)
{
    ColorFadeTick();
    EnablePalSync();

    proc->timer--;

    if (proc->timer < 0)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        SetBgChrOffset(2, 0);
        Proc_Break(proc);
    }
}

void ChapterIntro_BeginFastFadeToMap(struct ProcChapterIntrofx * proc)
{
    ClearUi();

    ColorFadeInit();

    sub_80020CC(gPal + 0x10*BGPAL_TILESET, 6, 10, +2);
    sub_80020CC(gPal + 0x10*(0x10+OBPAL_CHAPTERINTRO_10), 0x10+OBPAL_CHAPTERINTRO_10, 6, +2);
    sub_80020CC(gPal + 0x10*(0x10+OBPAL_SYSTEM_OBJECTS), 0x10+OBPAL_SYSTEM_OBJECTS, 2, +2);
    sub_80020CC(gPal + 0x10*(0x10+OBPAL_CHAPTERINTRO_7), 0x10+OBPAL_CHAPTERINTRO_7, 1, +2);

    ColorFadeTick();
    EnablePalSync();

    proc->timer = 14;

    if (GetChapterInfo(gPlaySt.chapterIndex)->song_openning[gPlaySt.chapterModeIndex != 3 ? 0 : 1] != 0xFFFF)
        StartBgm(GetChapterInfo(gPlaySt.chapterIndex)->song_openning[gPlaySt.chapterModeIndex != 3 ? 0 : 1], 0);
}

void ChapterIntro_LoopFastFadeToMap(struct ProcChapterIntrofx * proc)
{
    ColorFadeTick();

    if (GetChapterInfo(gPlaySt.chapterIndex)->weather == WEATHER_FLAMES)
        ApplyFlamesWeatherGradient();

    if (GetChapterInfo(gPlaySt.chapterIndex)->fadeToBlack)
    {
        proc->timer = 0;

        SetDispEnable(1, 1, 1, 0, 0);
    }
    else
        EnablePalSync();

    proc->timer--;

    if (proc->timer < 0)
    {
        EnableTilesetPalAnim();
        Proc_Break(proc);
    }
}

void ChapterIntro_SetSkipTarget(int skip, struct ProcChapterIntrofx * proc)
{
    proc->skipped = skip;
}

void ChapterIntro_SetTimer(int timer, struct ProcChapterIntrofx * proc)
{
    proc->timer = timer;
}

void ChapterIntro_TickTimer(struct ProcChapterIntrofx * proc)
{
    if (proc->fasten != 0)
        Proc_Break(proc);
    else if (proc->timer-- < 0)
        Proc_Break(proc);
}

void ChapterIntro_SetFasten(struct ProcChapterIntrofx * proc)
{
    proc->fasten = 2;
}
