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

bool CallChapterStartEventMaybe(void)
{
    StartEvent(GetChapterEventInfo(gPlaySt.chapterIndex)->beginningSceneEvents);
    return false;
}

bool BmMain_ChangePhase(void)
{
    ClearActiveFactionGrayedStates();
    RefreshUnitSprites();
    HandleChangePhase();

    if (CheckAvailableTurnEvent() == true)
    {
        StartAvailableTurnEvents();
        return false;
    }

    return true;
}

bool sub_8015840(void)
{
    if (sub_80798D4() == true)
    {
        sub_8079894();
        return false;
    }

    return true;
}

void BmMain_StartPhase(ProcPtr proc)
{
    switch (gPlaySt.faction)
    {
    case FACTION_BLUE:
        Proc_StartBlocking(gUnk_08C02630, proc);
        break;

    case FACTION_RED:
        Proc_StartBlocking(gUnk_08C06154, proc);
        break;

    case FACTION_GREEN:
        Proc_StartBlocking(gUnk_08C06154, proc);
        break;
    }

    Proc_Break(proc);
}

void sub_80158B0(ProcPtr proc)
{
    Proc_Goto(Proc_StartBlocking(gUnk_08C02630, proc), 7);
    Proc_Break(proc);
}

bool sub_80158D4(ProcPtr proc)
{
    if (gPlaySt.faction != FACTION_GREEN)
        return true;

    Proc_StartBlocking(gUnk_08C03834, proc);
    sub_802C70C();

    return false;
}

void sub_8015900(void)
{
    gActionSt.suspend_point = 9;
    WriteSuspendSave(3);
}

void sub_8015918(ProcPtr proc) {
    if (!GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
        Proc_Goto(proc, 9);
}

void BmMain_StartIntroFx(struct ProcBmMain * proc)
{
    if (gPlaySt.chapterIndex == CHAPTER_2F)
    {
        SetBlendDarken(0x10);
        return;
    }

    Proc_StartBlocking(ProcScr_ChapterIntrofx, proc);
}

void BmMain_SuspendBeforePhase(void)
{
    sub_807B2A8();
    ClearFlag(0x91);
}

void InitBmBgLayers(void)
{
    if (gPlaySt.chapterWeatherId == WEATHER_CLOUDS)
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg2_ct.priority = 2;
        gDispIo.bg3_ct.priority = 2;
    }
    else
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg2_ct.priority = 2;
        gDispIo.bg3_ct.priority = 3;
    }
}

void ApplySystemObjectsGraphics(void)
{
    Decompress(Gfx_MiscUiGraphics, gBuf);
    Copy2dChr(gBuf, (u8 *)0x06010000, 18, 4);
    ApplyPalettes(Pal_MiscUiGraphics, 0x10, 2);
}

void ApplySystemGraphics(void)
{
    ResetText();
    UnpackUiWindowFrameGraphics();
    InitFaces();
    InitIcons();
    ApplyIconPalettes(4);
    ApplySystemObjectsGraphics();
}

extern s8 gUnk_08C01FE4[][2];

void HandleMapCursorInput(u16 keys)
{
    int dir = (keys >> 4) & (DPAD_ANY >> 4);

    struct Vec2 new_cursor =
    {
        gBmSt.cursor.x + gUnk_08C01FE4[dir][0],
        gBmSt.cursor.y + gUnk_08C01FE4[dir][1]
    };

    if (gBmSt.flags & BM_FLAG_1)
        if ((gBmMapMovement[gBmSt.cursor.y][gBmSt.cursor.x] < MAP_MOVEMENT_MAX))
            if (gBmMapMovement[new_cursor.y][new_cursor.x] >= MAP_MOVEMENT_MAX)
                if ((keys & DPAD_ANY) != (gpKeySt->pressed & DPAD_ANY))
                    return;

    if ((new_cursor.x >= 0) && (new_cursor.x < gBmMapSize.x))
    {
        gBmSt.cursor_sprite_target.x += gUnk_08C01FE4[dir][0] * 16;

        gBmSt.cursor_previous.x = gBmSt.cursor.x;
        gBmSt.cursor.x = new_cursor.x;
    }

    if ((new_cursor.y >= 0) && (new_cursor.y < gBmMapSize.y))
    {
        gBmSt.cursor_sprite_target.y += gUnk_08C01FE4[dir][1] * 16;

        gBmSt.cursor_previous.y = gBmSt.cursor.y;
        gBmSt.cursor.y = new_cursor.y;
    }

    if (!(gBmSt.flags & BM_FLAG_2))
    {
        if (gBmSt.cursor.x == gBmSt.cursor_previous.x && gBmSt.cursor.y == gBmSt.cursor_previous.y)
            return;

        PlaySoundEffect(SONG_385);
        gBmSt.flags |= BM_FLAG_2;
    }
    else
    {
        gBmSt.flags &= ~BM_FLAG_2;
    }
}

void HandleMoveMapCursor(int step)
{
    if (gBmSt.cursor_sprite.x < gBmSt.cursor_sprite_target.x)
        gBmSt.cursor_sprite.x += step;

    if (gBmSt.cursor_sprite.x > gBmSt.cursor_sprite_target.x)
        gBmSt.cursor_sprite.x -= step;

    if (gBmSt.cursor_sprite.y < gBmSt.cursor_sprite_target.y)
        gBmSt.cursor_sprite.y += step;

    if (gBmSt.cursor_sprite.y > gBmSt.cursor_sprite_target.y)
        gBmSt.cursor_sprite.y -= step;
}

void HandleMoveCameraWithMapCursor(int step)
{
    bool is_updated = false;

    int cursor_sprite_x = gBmSt.cursor_sprite.x;
    int cursor_sprite_y = gBmSt.cursor_sprite.y;

    if (gBmSt.camera.x + CAMERA_MARGIN_LEFT > cursor_sprite_x)
    {
        if (cursor_sprite_x - CAMERA_MARGIN_LEFT < 0)
        {
            gBmSt.camera.x = 0;
        }
        else
        {
            is_updated = true;

            gBmSt.camera.x -= step;
            gBmSt.unk_36 = -step;

            gBmSt.unk_32 = gBmSt.camera.x & 0xf;
        }
    }

    if (gBmSt.camera.x + CAMERA_MARGIN_RIGHT < cursor_sprite_x)
    {
        if (cursor_sprite_x - CAMERA_MARGIN_RIGHT > gBmSt.camera_max.x)
        {
            gBmSt.camera.x = gBmSt.camera_max.x;
        }
        else
        {
            is_updated = true;

            gBmSt.camera.x += step;
            gBmSt.unk_36 = step;

            gBmSt.unk_32 = gBmSt.camera.x & 0xf;
        }
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_TOP > cursor_sprite_y)
    {
        if (cursor_sprite_y - CAMERA_MARGIN_TOP < 0)
        {
            gBmSt.camera.y = 0;
        }
        else
        {
            is_updated = true;
            gBmSt.camera.y -= step;
            gBmSt.unk_37 = -step;

            gBmSt.unk_34 = gBmSt.camera.y & 15;
        }
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_BOTTOM < cursor_sprite_y)
    {
        if (cursor_sprite_y - CAMERA_MARGIN_BOTTOM > gBmSt.camera_max.y)
        {
            gBmSt.camera.y = gBmSt.camera_max.y;
        }
        else
        {
            is_updated = 1;

            gBmSt.camera.y += step;
            gBmSt.unk_37 = step;

            gBmSt.unk_34 = gBmSt.camera.y & 15;
        }
    }

    if (!is_updated)
    {
        if (gBmSt.unk_32 != 0)
        {
            gBmSt.unk_32 = (gBmSt.unk_32 + gBmSt.unk_36) & 15;
            gBmSt.camera.x += gBmSt.unk_36;
        }

        if (gBmSt.unk_34 != 0)
        {
            gBmSt.unk_34 = (gBmSt.unk_34 + gBmSt.unk_37) & 15;
            gBmSt.camera.y += gBmSt.unk_37;
        }
    }
}

u16 GetCameraAdjustedX(int x)
{
    int result = gBmSt.camera.x;

    if (gBmSt.camera.x + CAMERA_MARGIN_LEFT > x)
    {
        result = (x - CAMERA_MARGIN_LEFT) < 0
            ? 0 : (x - CAMERA_MARGIN_LEFT);
    }

    if (gBmSt.camera.x + CAMERA_MARGIN_RIGHT < x)
    {
        result = (x - CAMERA_MARGIN_RIGHT) > gBmSt.camera_max.x
            ? gBmSt.camera_max.x : (x - CAMERA_MARGIN_RIGHT);
    }

    return result;
}

u16 GetCameraAdjustedY(int y)
{
    int result = gBmSt.camera.y;

    if (gBmSt.camera.y + CAMERA_MARGIN_TOP > y)
    {
        result = (y - CAMERA_MARGIN_TOP) < 0
            ? 0 : (y - CAMERA_MARGIN_TOP);
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_BOTTOM < y)
    {
        result = (y - CAMERA_MARGIN_BOTTOM) > gBmSt.camera_max.y
            ? gBmSt.camera_max.y : (y - CAMERA_MARGIN_BOTTOM);
    }

    return result;
}

u16 GetCameraCenteredX(int x)
{
    int result = x - DISPLAY_WIDTH / 2;

    if (result < 0)
        result = 0;

    if (result > gBmSt.camera_max.x)
        result = gBmSt.camera_max.x;

    return result &~ 15;
}

u16 GetCameraCenteredY(int y)
{
    int result = y - DISPLAY_HEIGHT / 2;

    if (result < 0)
        result = 0;

    if (result > gBmSt.camera_max.y)
        result = gBmSt.camera_max.y;

    return result &~ 15;
}

extern struct Vec2 gUnk_0202BC3C;
extern u32 gUnk_0202BC40;

void sub_8015DE8(int x, int y, int kind)
{
    int oam2 = 0;
    u16 const * sprite = NULL;

    int frame = (GetGameTime() / 2) % 16; // TODO: ARRAY_COUNT

    switch (kind)
    {

    case MAP_CURSOR_DEFAULT:
    case MAP_CURSOR_REGULAR:
        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x02) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = gUnk_08C0206C[frame];

        break;

    case MAP_CURSOR_RED_MOVING:
        if (GetGameTime() - 1 == gUnk_0202BC40)
        {
            x = (x + gUnk_0202BC3C.x) >> 1;
            y = (y + gUnk_0202BC3C.y) >> 1;
        }

        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x24) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = gUnk_08C0206C[frame];

        gUnk_0202BC3C.x = x;
        gUnk_0202BC3C.y = y;
        gUnk_0202BC40 = GetGameTime();

        break;

    case MAP_CURSOR_STRETCHED:
        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x02) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = gUnk_08C02052;

        break;

    case MAP_CURSOR_RED_STATIC:
        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x24) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = gUnk_08C0206C[0];

        break;

    }

    x = x - gBmSt.camera.x;
    y = y - gBmSt.camera.y;

    PutSprite(4, x, y, sprite, oam2);
}

void DisplayBmTextShadow(int x, int y)
{
    int frame = (GetGameTime() / 2) % 16; // TODO: ARRAY_COUNT
    u32 oam2 = OAM2_CHR(0x2);

    PutSprite(4, x, y, gUnk_08C0206C[frame], oam2);
    return;
}

void SetMapCursorPosition(int x, int y)
{
    gBmSt.cursor.x = x;
    gBmSt.cursor.y = y;

    gBmSt.cursor_sprite_target.x = x * 16;
    gBmSt.cursor_sprite_target.y = y * 16;

    gBmSt.cursor_sprite.x = x * 16;
    gBmSt.cursor_sprite.y = y * 16;
}

void PutSysArrow(int x, int y, u8 isDown)
{
    int frame = (GetGameTime() / 8) % 3; // TODO: ARRAY_COUNT

    PutSprite(4, x, y,
        isDown ? gUnk_08C020E8[frame] : gUnk_08C020DC[frame],
        OAM2_CHR(OBCHR_SYSTEM_OBJECTS) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS));
}

extern s8 gUnk_0202BC44[0x100];

void sub_8015F6C(struct CamMoveProc * proc)
{
    int i;
    int dist;

    s8 speed = 1;

    int x_diff = ABS(proc->to.x - proc->from.x);
    int y_diff = ABS(proc->to.y - proc->from.y);

    if (x_diff > y_diff)
    {
        proc->xCalibrated = 1;
        proc->calibration = x_diff;
    }
    else
    {
        proc->xCalibrated = 0;
        proc->calibration = y_diff;
    }

    dist = proc->calibration;
    i = 0;

    while (true)
    {
        if (dist - (speed >> 1) < 0)
        {
            gUnk_0202BC44[i] = dist;
            break;
        }

        dist -= (speed >> 1);
        gUnk_0202BC44[i] = (speed >> 1);

        if (speed < 16)
        {
            speed++;
        }

        i++;
    }

    proc->frame = i;
    proc->distance = proc->calibration;
}

void CamMove_OnLoop(struct CamMoveProc * proc)
{
    if (proc->frame == 0)
    {
        proc->to.x = gBmSt.camera.x;
        proc->to.y = gBmSt.camera.y;

        Proc_End(proc);

        return;
    }

    proc->distance -= gUnk_0202BC44[proc->frame--];

    gBmSt.camera.x = proc->to.x + (proc->from.x - proc->to.x) * proc->distance / proc->calibration;
    gBmSt.camera.y = proc->to.y + (proc->from.y - proc->to.y) * proc->distance / proc->calibration;
}

void StoreAdjustedCameraPositions(int xIn, int yIn, int * xOut, int * yOut)
{
    *xOut = xIn - 7;
    *yOut = yIn - 5;

    if (*xOut < 0)
        *xOut = 0;

    if (*yOut < 0)
        *yOut = 0;

    if (*xOut + 8 > gBmMapSize.x - 1)
        *xOut = gBmMapSize.x - 15;

    if (*yOut + 4 > gBmMapSize.y - 1)
        *yOut = gBmMapSize.y - 10;
}

bool EnsureCameraOntoCenteredPosition(ProcPtr parent, int x, int y)
{
    struct CamMoveProc * proc;

    int x_target;
    int y_target;

    StoreAdjustedCameraPositions(x, y, &x_target, &y_target);

    x_target = x_target * 16;
    y_target = y_target * 16;

    if ((x_target == gBmSt.camera.x) && (y_target == gBmSt.camera.y))
        return false;

    if (Proc_Find(ProcScr_CamMove) != NULL)
        return false;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_CamMove, parent);
    else
        proc = Proc_Start(ProcScr_CamMove, PROC_TREE_3);

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = x_target;
    proc->to.y = y_target;

    proc->watchedCoord.x = x;
    proc->watchedCoord.y = y;

    return true;
}

bool EnsureCameraOntoPosition(ProcPtr parent, int x, int y)
{
    struct CamMoveProc * proc;

    int x_target = GetCameraAdjustedX(x * 16);
    int y_target = GetCameraAdjustedY(y * 16);

    if ((x_target == gBmSt.camera.x && y_target == gBmSt.camera.y) || Proc_Find(ProcScr_CamMove) != NULL)
        return false;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_CamMove, parent);
    else
        proc = Proc_Start(ProcScr_CamMove, PROC_TREE_3);

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = x_target;
    proc->to.y = y_target;

    proc->watchedCoord.x = x;
    proc->watchedCoord.y = y;

    return true;
}

bool sub_80161EC(int x, int y)
{
    int x_target = GetCameraAdjustedX(x * 16);
    int y_target = GetCameraAdjustedY(y * 16);

    if (x_target == gBmSt.camera.x && y_target == gBmSt.camera.y)
        return false;

    return true;
}

bool sub_801622C(ProcPtr parent)
{
    struct CamMoveProc * proc;

    if ((gBmSt.camera.y <= gBmSt.camera_max.y) || Proc_Find(ProcScr_CamMove) != NULL)
        return false;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_CamMove, parent);
    else
        proc = Proc_Start(ProcScr_CamMove, PROC_TREE_3);

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = gBmSt.camera.x;
    proc->to.y = gBmSt.camera_max.y;

    return true;
}

void sub_8016290(struct UnkMapCursorProc * proc)
{
    // BUG: should this be proc->from.xy + ...?

    sub_8015DE8(
        (proc->to.x - proc->from.x) * proc->clock / proc->duration,
        (proc->to.y - proc->from.y) * proc->clock / proc->duration,
        MAP_CURSOR_DEFAULT);

    proc->clock--;

    if (proc->clock < 0)
        Proc_Break(proc);
}

void sub_80162E0(int x, int y, int duration)
{
    struct UnkMapCursorProc * proc = Proc_Start(gUnk_08C0211C, PROC_TREE_3);

    proc->to.x = gBmSt.cursor.x * 16;
    proc->to.y = gBmSt.cursor.y * 16;

    proc->from.x = x * 16;
    proc->from.y = y * 16;

    proc->duration = duration;
    proc->clock = duration;
}

int sub_8016318(void)
{
    u8 base_bgm_index = gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR ? MAP_BGM_BLUE_HECTOR : MAP_BGM_BLUE;

    u8 blue_bgm_index = !CheckFlag(4) ? base_bgm_index + 0 : MAP_BGM_BLUE_GREEN_ALT;
    u8 red_bgm_index = !CheckFlag(4) ? base_bgm_index + 1 : MAP_BGM_RED_ALT;
    u8 green_bgm_index = !CheckFlag(4) ? base_bgm_index + 2 : MAP_BGM_BLUE_GREEN_ALT;

    switch (gPlaySt.faction)
    {
    case FACTION_RED:
        return GetChapterInfo(gPlaySt.chapterIndex)->map_bgm_ids[red_bgm_index];

    case FACTION_GREEN:
        return GetChapterInfo(gPlaySt.chapterIndex)->map_bgm_ids[green_bgm_index];

    case FACTION_BLUE:
        if (GetChapterInfo(gPlaySt.chapterIndex)->victorySongEnemyThreshold != 0)
        {
            int aliveUnits = CountFactionUnitsWithoutFlags(FACTION_RED, US_UNAVAILABLE);

            if (aliveUnits <= GetChapterInfo(gPlaySt.chapterIndex)->victorySongEnemyThreshold)
                return SONG_09;
        }

        return GetChapterInfo(gPlaySt.chapterIndex)->map_bgm_ids[blue_bgm_index];
    }

#if BUGFIX
    return GetChapterInfo(gPlaySt.chapterIndex)->map_bgm_ids[0];
#endif
}

void sub_8016400(void)
{
    StartBgm(sub_8016318(), NULL);
}

void sub_8016410(struct CamMoveProc * proc)
{
    int x = Interpolate(INTERPOLATE_LINEAR, proc->from.x, proc->to.x, proc->frame, proc->distance);
    int y = Interpolate(INTERPOLATE_LINEAR, proc->from.y, proc->to.y, proc->frame, proc->distance);

    gBmSt.camera.x = x;
    gBmSt.camera.y = y;

    proc->frame++;

    if (proc->frame >= proc->distance)
        Proc_End(proc);
}

void nullsub_37(void)
{
}
