#include "gbafe.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_BmMain[] =
{
    PROC_YIELD,
    PROC_19,
    PROC_19,
    PROC_MARK(2),
    PROC_YIELD,

PROC_LABEL(0),
    PROC_CALL(BmMain_StartIntroFx),
    PROC_YIELD,

    PROC_CALL(sub_8015918),
    PROC_CALL(SetFlag_145),
    PROC_CALL(sub_8018CC4),

    PROC_CALL_2(CallChapterStartEventMaybe),
    PROC_CALL(sub_8015988),

    PROC_START_CHILD_BLOCKING(ProcScr_SALLYCURSOR),
    PROC_START_CHILD_BLOCKING(ProcScr_BmMain_08C02D98),

    PROC_CALL(nullsub_38),

    // fallthrough

PROC_LABEL(9),
    PROC_CALL(ClearFlag_145),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL_2(BmMain_ChangePhase),
    PROC_CALL(BmMain_SuspendBeforePhase),

    // fallthrough

PROC_LABEL(7),
    PROC_START_CHILD(ProcScr_08C02920),
    PROC_START_CHILD_BLOCKING(ProcScr_BmMain_08C02A68),
    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_CALL(TickActiveFactionTurn),

    PROC_START_CHILD_BLOCKING(ProcScr_BmMain_08C05F30),
    PROC_START_CHILD_BLOCKING(ProcScr_BmMain_08C05E68),
    PROC_START_CHILD_BLOCKING(ProcScr_BmMain_08C05EC8),
    PROC_START_CHILD_BLOCKING(ProcScr_08C02920),

    PROC_CALL_2(sub_8015840),

    // fallthrough

PROC_LABEL(3),
    PROC_REPEAT(BmMain_StartPhase),

    PROC_START_CHILD_BLOCKING(ProcScr_08C0617C),
    PROC_CALL_2(BmMain_UpdateTraps),

    PROC_GOTO(1),

PROC_LABEL(2),
    PROC_CALL(RenderMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidLockingFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(3),

PROC_LABEL(4),
    PROC_CALL(RenderMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidLockingFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_REPEAT(BmMain_ResumePlayerPhase),
    PROC_START_CHILD_BLOCKING(ProcScr_08C0617C),

    PROC_GOTO(1),

PROC_LABEL(8),
    PROC_YIELD,
    PROC_REPEAT(BmMain_ResumePlayerPhase),
    PROC_START_CHILD_BLOCKING(ProcScr_08C0617C),

    PROC_GOTO(1),

PROC_LABEL(6),
    PROC_CALL(RenderMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidLockingFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(7),

PROC_LABEL(5),
    PROC_CALL(RenderMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidLockingFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_START_CHILD_BLOCKING(ProcScr_08C0617C),

    PROC_GOTO(1),

    PROC_END,
};

s8 CONST_DATA sDirKeysToOffsetLut[][2] =
{
    {  0,  0 }, // 0000 none
    { +1,  0 }, // 0001 right
    { -1,  0 }, // 0010 left
    {  0,  0 }, // 0011 right + left
    {  0, -1 }, // 0100 up
    { +1, -1 }, // 0101 up + right
    { -1, -1 }, // 0110 up + left
    {  0,  0 }, // 0111 up + right + left
    {  0, +1 }, // 1000 down
    { +1, +1 }, // 1001 down + right
    { -1, +1 }, // 1010 down + left
    {  0,  0 }, // 1011 down + right + left
    {  0,  0 }, // 1100 down + up
    {  0,  0 }, // 1101 down + up + right
    {  0,  0 }, // 1110 down + up + left
    {  0,  0 }, // 1111 down + up + right + left
};

u16 CONST_DATA Sprite_MapCursorA[] =
{
    4,
    OAM0_SHAPE_8x8 + OAM0_Y(-4), OAM1_SIZE_8x8 + OAM1_X(-2), 0,
    OAM0_SHAPE_8x8 + OAM0_Y(-4), OAM1_SIZE_8x8 + OAM1_X(+10) + OAM1_HFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+9), OAM1_SIZE_8x8 + OAM1_X(-2) + OAM1_VFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+9), OAM1_SIZE_8x8 + OAM1_X(+10) + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA Sprite_MapCursorB[] =
{
    4,
    OAM0_SHAPE_8x8 + OAM0_Y(-3), OAM1_SIZE_8x8 + OAM1_X(-1), 0,
    OAM0_SHAPE_8x8 + OAM0_Y(-3), OAM1_SIZE_8x8 + OAM1_X(+9) + OAM1_HFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+8), OAM1_SIZE_8x8 + OAM1_X(-1) + OAM1_VFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+8), OAM1_SIZE_8x8 + OAM1_X(+9) + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA Sprite_MapCursorC[] =
{
    4,
    OAM0_SHAPE_8x8 + OAM0_Y(-2), OAM1_SIZE_8x8, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(-2), OAM1_SIZE_8x8 + OAM1_X(+8) + OAM1_HFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+7), OAM1_SIZE_8x8 + OAM1_VFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+7), OAM1_SIZE_8x8 + OAM1_X(+8) + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA Sprite_MapCursorStretched[] =
{
    4,
    OAM0_SHAPE_8x8 + OAM0_Y(-8), OAM1_SIZE_8x8 + OAM1_X(-4), 0,
    OAM0_SHAPE_8x8 + OAM0_Y(-8), OAM1_SIZE_8x8 + OAM1_X(+12) + OAM1_HFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+10), OAM1_SIZE_8x8 + OAM1_X(-4) + OAM1_VFLIP, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(+10), OAM1_SIZE_8x8 + OAM1_X(+12) + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 * CONST_DATA sMapCursorSpriteLut[] =
{
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,
    Sprite_MapCursorA,

    Sprite_MapCursorB,

    Sprite_MapCursorC,
    Sprite_MapCursorC,
    Sprite_MapCursorC,
    Sprite_MapCursorC,

    Sprite_MapCursorB,
};

u16 CONST_DATA Sprite_SysUpArrowA[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x4C),
};

u16 CONST_DATA Sprite_SysUpArrowB[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x4D),
};

u16 CONST_DATA Sprite_SysUpArrowC[] =
{
    1,
    OAM0_SHAPE_8x16 + OAM0_Y(-1), OAM1_SIZE_8x16, OAM2_CHR(0x4D),
};

u16 CONST_DATA Sprite_SysDownArrowA[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x4E),
};

u16 CONST_DATA Sprite_SysDownArrowB[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x4F),
};

u16 CONST_DATA Sprite_SysDownArrowC[] =
{
    1,
    OAM0_SHAPE_8x16 + OAM0_Y(+1), OAM1_SIZE_8x16, OAM2_CHR(0x4F),
};

u16 * CONST_DATA gSysUpArrowSpriteLut[] =
{
    Sprite_SysUpArrowA,
    Sprite_SysUpArrowB,
    Sprite_SysUpArrowC,
};

u16 * CONST_DATA gSysDownArrowSpriteLut[] =
{
    Sprite_SysDownArrowA,
    Sprite_SysDownArrowB,
    Sprite_SysDownArrowC,
};

struct ProcCmd CONST_DATA ProcScr_CamMove[] =
{
    PROC_19,
    PROC_YIELD,

    PROC_CALL(CamMove_Init),
    PROC_REPEAT(CamMove_OnLoop),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_UnkMapCursor[] =
{
    PROC_REPEAT(UnkMapCursor_OnLoop),
    PROC_END,
};

// clang-format on

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
        Proc_StartBlocking(ProcScr_PlayerPhase, proc);
        break;

    case FACTION_RED:
        Proc_StartBlocking(ProcScr_AiPhase, proc);
        break;

    case FACTION_GREEN:
        Proc_StartBlocking(ProcScr_AiPhase, proc);
        break;
    }

    Proc_Break(proc);
}

void BmMain_ResumePlayerPhase(ProcPtr proc)
{
    Proc_Goto(Proc_StartBlocking(ProcScr_PlayerPhase, proc), 7);
    Proc_Break(proc);
}

bool BmMain_UpdateTraps(ProcPtr proc)
{
    if (gPlaySt.faction != FACTION_GREEN)
        return true;

    Proc_StartBlocking(ProcScr_UpdateTraps, proc);
    DecayTraps();

    return false;
}

void BmMain_SuspendBeforePhase(void)
{
    gActionSt.suspend_point = SUSPEND_POINT_CHANGE_PHASE;
    WriteSuspendSave(SAVE_SUSPEND);
}

void sub_8015918(ProcPtr proc)
{
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

void sub_8015988(void)
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

void HandleMapCursorInput(u16 keys)
{
    int dir = (keys >> 4) & (DPAD_ANY >> 4);

    struct Vec2 new_cursor =
    {
        gBmSt.cursor.x + sDirKeysToOffsetLut[dir][0],
        gBmSt.cursor.y + sDirKeysToOffsetLut[dir][1]
    };

    if (gBmSt.flags & BM_FLAG_1)
        if ((gBmMapMovement[gBmSt.cursor.y][gBmSt.cursor.x] < MAP_MOVEMENT_MAX))
            if (gBmMapMovement[new_cursor.y][new_cursor.x] >= MAP_MOVEMENT_MAX)
                if ((keys & DPAD_ANY) != (gpKeySt->pressed & DPAD_ANY))
                    return;

    if ((new_cursor.x >= 0) && (new_cursor.x < gBmMapSize.x))
    {
        gBmSt.cursor_sprite_target.x += sDirKeysToOffsetLut[dir][0] * 16;

        gBmSt.cursor_previous.x = gBmSt.cursor.x;
        gBmSt.cursor.x = new_cursor.x;
    }

    if ((new_cursor.y >= 0) && (new_cursor.y < gBmMapSize.y))
    {
        gBmSt.cursor_sprite_target.y += sDirKeysToOffsetLut[dir][1] * 16;

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

extern struct Vec2 sLastCoordMapCursorDrawn;
extern u32 sLastTimeMapCursorDrawn;

void PutMapCursor(int x, int y, int kind)
{
    int oam2 = 0;
    u16 const * sprite = NULL;

    int frame = (GetGameTime() / 2) % 16; // TODO: ARRAY_COUNT

    switch (kind)
    {
    case MAP_CURSOR_DEFAULT:
    case MAP_CURSOR_REGULAR:
        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x02) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = sMapCursorSpriteLut[frame];

        break;

    case MAP_CURSOR_RED_MOVING:
        if (GetGameTime() - 1 == sLastTimeMapCursorDrawn)
        {
            x = (x + sLastCoordMapCursorDrawn.x) >> 1;
            y = (y + sLastCoordMapCursorDrawn.y) >> 1;
        }

        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x24) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = sMapCursorSpriteLut[frame];

        sLastCoordMapCursorDrawn.x = x;
        sLastCoordMapCursorDrawn.y = y;
        sLastTimeMapCursorDrawn = GetGameTime();

        break;

    case MAP_CURSOR_STRETCHED:
        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x02) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = Sprite_MapCursorStretched;

        break;

    case MAP_CURSOR_RED_STATIC:
        oam2 = OAM2_CHR(OBCHR_SYSTEM_OBJECTS + 0x24) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS);
        sprite = sMapCursorSpriteLut[0];

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

    PutSprite(4, x, y, sMapCursorSpriteLut[frame], oam2);
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

void PutSysArrow(int x, int y, u8 is_down)
{
    int frame = (GetGameTime() / 8) % 3; // TODO: ARRAY_COUNT

    PutSprite(4, x, y,
        is_down ? gSysDownArrowSpriteLut[frame] : gSysUpArrowSpriteLut[frame],
        OAM2_CHR(OBCHR_SYSTEM_OBJECTS) + OAM2_PAL(OBPAL_SYSTEM_OBJECTS));
}

extern s8 sCameraAnimTable[0x100];

void CamMove_Init(struct CamMoveProc * proc)
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
            sCameraAnimTable[i] = dist;
            break;
        }

        dist -= (speed >> 1);
        sCameraAnimTable[i] = (speed >> 1);

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

    proc->distance -= sCameraAnimTable[proc->frame--];

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

bool IsCameraNotWatchingPosition(int x, int y)
{
    int x_target = GetCameraAdjustedX(x * 16);
    int y_target = GetCameraAdjustedY(y * 16);

    if (x_target == gBmSt.camera.x && y_target == gBmSt.camera.y)
        return false;

    return true;
}

bool CameraMove_801622C(ProcPtr parent)
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

void UnkMapCursor_OnLoop(struct UnkMapCursorProc * proc)
{
    // BUG: should this be proc->from.xy + ...?

    PutMapCursor(
        (proc->to.x - proc->from.x) * proc->clock / proc->duration,
        (proc->to.y - proc->from.y) * proc->clock / proc->duration,
        MAP_CURSOR_DEFAULT);

    proc->clock--;

    if (proc->clock < 0)
        Proc_Break(proc);
}

void sub_80162E0(int x, int y, int duration)
{
    struct UnkMapCursorProc * proc = Proc_Start(ProcScr_UnkMapCursor, PROC_TREE_3);

    proc->to.x = gBmSt.cursor.x * 16;
    proc->to.y = gBmSt.cursor.y * 16;

    proc->from.x = x * 16;
    proc->from.y = y * 16;

    proc->duration = duration;
    proc->clock = duration;
}

int GetActiveMapSong(void)
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

void StartMapSongBgm(void)
{
    StartBgm(GetActiveMapSong(), NULL);
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
