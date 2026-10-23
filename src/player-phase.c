#include "gbafe.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_PlayerPhase[] = {
    PROC_NAME_DEBUG("E_PLAYERPHASE"),
    PROC_MARK(2),
    PROC_YIELD,

PROC_LABEL(PL_PLAYERPHASE_BEGIN),
    PROC_CALL(PlayerPhase_Suspend),

    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RenderMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PlayerPhase_HandleAutoEnd),

    PROC_CALL(StartMapSongBgm),

PROC_LABEL(PL_PLAYERPHASE_IDLE),
    PROC_CALL(StartMapWindows),
    PROC_CALL(ResetUnitSpriteHover),

    PROC_REPEAT(PlayerPhase_MainIdle),

PROC_LABEL(PL_PLAYERPHASE_MOVE),
    PROC_CALL(EndPlayerPhaseSideWindows),

    PROC_WHILE(DoesBMXFADEExist),

    PROC_CALL(SetAllUnitNotBackSprite),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PlayerPhase_InitUnitMovementSelect),
    PROC_SLEEP(1),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),

    PROC_CALL(PlayerPhase_DisplayUnitMovement),
    PROC_REPEAT(PlayerPhase_WaitForUnitMovement),

PROC_LABEL(PL_PLAYERPHASE_ACTION_MENU),
    PROC_REPEAT(PlayerPhase_ApplyUnitMovement),

PROC_LABEL(PL_PLAYERPHASE_ACTION),
    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_CALL_2(PlayerPhase_PrepareAction),

    PROC_CALL_2(DoAction),
    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),

    PROC_CALL_2(EnsureCameraOntoActiveUnitPosition),

    PROC_CALL(PlayerPhase_FinishAction),

    PROC_GOTO(PL_PLAYERPHASE_BEGIN),

PROC_LABEL(PL_PLAYERPHASE_FADE_TO_MOVE),
    PROC_WHILE(DoesBMXFADEExist),

    PROC_GOTO(PL_PLAYERPHASE_MOVE),

PROC_LABEL(PL_PLAYERPHASE_AFTER_STATSCREEN),
    PROC_CALL(PlayerPhase_ReReadGameSaveGfx),

PROC_LABEL(PL_PLAYERPHASE_ADJUST_CAMERA),
    PROC_START_CHILD_BLOCKING(ProcScr_ADJUSTSFROMXI),

    PROC_GOTO(PL_PLAYERPHASE_IDLE),

PROC_LABEL(PL_PLAYERPHASE_RESUME_RANGE),
    PROC_CALL(PlayerPhase_ResumeRangeDisplay),

    PROC_GOTO(PL_PLAYERPHASE_MOVE),

PROC_LABEL(PL_PLAYERPHASE_AFTER_END_EVENT),
    PROC_YIELD,

    PROC_CALL(EndAllMus),

    PROC_GOTO(PL_PLAYERPHASE_BEGIN),

PROC_LABEL(PL_PLAYERPHASE_SEE_RANGE),
    PROC_CALL(EndPlayerPhaseSideWindows),

    PROC_WHILE(DoesBMXFADEExist),

    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),

    PROC_GOTO(PL_PLAYERPHASE_IDLE),

PROC_LABEL(PL_PLAYERPHASE_DANGER_ZONE),
    PROC_CALL(PlayerPhase_DisplayDangerZone),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),

    PROC_GOTO(PL_PLAYERPHASE_IDLE),

PROC_LABEL(PL_PLAYERPHASE_END),
    PROC_WHILE(DoesBMXFADEExist),

    PROC_END,
};

// clang-format on

const u8 * CONST_DATA gOpenLimitViewImgLut[] = {
    NULL,
    NULL,
    Img_LimitViewSquares + 0 * 4 * CHR_SIZE,
    Img_LimitViewSquares + 1 * 4 * CHR_SIZE,
    Img_LimitViewSquares + 2 * 4 * CHR_SIZE,
    Img_LimitViewSquares + 3 * 4 * CHR_SIZE,
    Img_LimitViewSquares + 4 * 4 * CHR_SIZE,
    Img_LimitViewSquareFull,
};

struct ProcCmd CONST_DATA ProcScr_MoveLimitViewChange[] = {
    PROC_NAME_DEBUG("MLVCHC"),
    PROC_MARK(1),

    PROC_CALL(MoveLimitViewChange_OnInit),
    PROC_REPEAT(MoveLimitViewChange_OnLoop),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_MoveLimitView[] = {
    PROC_NAME_DEBUG("E_MOVELIMITVIEW"),
    PROC_MARK(1),

    PROC_SET_END_CB(MoveLimitView_OnEnd),

    PROC_START_CHILD(ProcScr_MoveLimitViewChange),

    PROC_CALL(MoveLimitView_OnInit),
    PROC_REPEAT(MoveLimitView_OnLoop),

    PROC_END,
};

void PlayerPhase_Suspend(void)
{
    gActionSt.suspend_point = SUSPEND_POINT_PLAYER_PHASE;
    WriteSuspendSave(SAVE_SUSPEND);
}

void HandlePlayerCursorMovement(void)
{
    if ((gpKeySt->held & B_BUTTON) && !(gBmSt.cursor_sprite.x & 7) && !(gBmSt.cursor_sprite.y & 7))
    {
        HandleMapCursorInput(gpKeySt->pressed2);

        HandleMoveMapCursor(8);
        HandleMoveCameraWithMapCursor(8);
    }
    else
    {
        HandleMapCursorInput(gpKeySt->repeated);

        HandleMoveMapCursor(4);
        HandleMoveCameraWithMapCursor(4);
    }

    if ((gBmSt.cursor_sprite.x | gBmSt.cursor_sprite.y) & 0xF)
        gpKeySt->pressed &= ~(A_BUTTON | B_BUTTON | START_BUTTON | R_BUTTON | L_BUTTON);
}

bool CanShowUnitStatScreen(struct Unit * unit)
{
    if (UNIT_CLASS_ID(unit) == CLASS_CHILD)
        return false;

    if (UNIT_CHAR_ID(unit) == CHARACTER_NATALIE)
        return false;

    return true;
}

void PlayerPhase_MainIdle(ProcPtr proc)
{
    HandlePlayerCursorMovement();

    if (gpKeySt->pressed & L_BUTTON)
    {
        TrySwitchViewedUnit(gBmSt.cursor.x, gBmSt.cursor.y);
        PlaySoundEffect(SONG_38B);
    }
    else if (!DoesBMXFADEExist())
    {
        if (gpKeySt->pressed & R_BUTTON)
        {
            if (IsChapterSakaba())
                return;

            if (gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x] != 0 &&
                CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x])))
            {
                EndAllMus();
                EndPlayerPhaseSideWindows();

                SetStatScreenExcludedUnitFlags(STATSCREEN_CONFIG_NONDEAD |
                    STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                    STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
                StartStatScreen(GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]), proc);

                Proc_Goto(proc, PL_PLAYERPHASE_AFTER_STATSCREEN);
                return;
            }
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

            switch (GetPlayerSelectKind(unit))
            {
            case PLAYER_SELECT_NOUNIT:
            case PLAYER_SELECT_TURNENDED:
                if (IsChapterSakaba())
                    goto else_stmt;

                EndPlayerPhaseSideWindows();

                gPlaySt.xCursor = gBmSt.cursor.x;
                gPlaySt.yCursor = gBmSt.cursor.y;

                if (unit)
                {
                    EndAllMus();
                    ShowUnitSprite(unit);
                }

                StartAdjustedMenu(
                    &gMapMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 0x17);
                sub_8079890();

                Proc_Goto(proc, PL_PLAYERPHASE_IDLE);
                return;

            case PLAYER_SELECT_CONTROL:
                UnitBeginAction(unit);
                PidStatsAddActAmt(gActiveUnit->pCharacterData->number);

                Proc_Break(proc);
                break;

            case PLAYER_SELECT_NOCONTROL:
                UnitBeginAction(unit);
                gBmSt.swap_action_range_count = 0;

                Proc_Goto(proc, PL_PLAYERPHASE_SEE_RANGE);
                break;

            default:
                goto else_stmt;
            }
        }
        else
        {
else_stmt:
            if ((gpKeySt->pressed & SELECT_BUTTON) && gpKeySt->held == SELECT_BUTTON &&
                gPlaySt.chapterModeIndex == CHAPTER_MODE_LYN &&
                !(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

                if (unit)
                {
                    EndAllMus();
                    ShowUnitSprite(unit);
                }

                EndPlayerPhaseSideWindows();
                sub_8032CA0(proc);

                Proc_Goto(proc, PL_PLAYERPHASE_IDLE);
                return;
            }

            if ((gpKeySt->pressed & START_BUTTON) && !(gpKeySt->held & SELECT_BUTTON))
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

                if (unit)
                {
                    EndAllMus();
                    ShowUnitSprite(unit);
                }

                EndPlayerPhaseSideWindows();
                StartMinimapPlayerPhase();

                Proc_Goto(proc, PL_PLAYERPHASE_IDLE);
                return;
            }
        }
    }

    UnitSpriteHoverUpdate();

    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y,
        IsUnitSpriteHoverEnabledAt(gBmSt.cursor.x, gBmSt.cursor.y) ? MAP_CURSOR_STRETCHED
                                                                   : MAP_CURSOR_DEFAULT);
}

void DisplayUnitEffectRange(struct Unit * unit)
{
    int flags = LIMITVIEW_BLUE;

    GenerateUnitMovementMapExt(gActiveUnit, UNIT_MOV(gActiveUnit) - gActionSt.move_count);

    if (!(gActiveUnit->state & US_HAS_MOVED))
    {
        BmMapFill(gBmMapOther, 0);

        if (UnitHasMagicRank(unit))
            GenerateMagicSealMap(1);

        BmMapFill(gBmMapRange, 0);

        switch (GetUnitWeaponUsabilityBits(gActiveUnit))
        {
        case UNIT_USEBIT_WEAPON | UNIT_USEBIT_STAFF:
            if (gBmSt.swap_action_range_count & 1)
            {
                GenerateUnitCompleteStaffRange(gActiveUnit);
                flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;
            }
            else
            {
                GenerateUnitCompleteAttackRange(gActiveUnit);
                flags = LIMITVIEW_RED | LIMITVIEW_BLUE;
            }

            break;

        case UNIT_USEBIT_STAFF:
            GenerateUnitCompleteStaffRange(gActiveUnit);
            flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;
            break;

        case UNIT_USEBIT_WEAPON:
            GenerateUnitCompleteAttackRange(gActiveUnit);
            flags = LIMITVIEW_RED | LIMITVIEW_BLUE;
            break;
        }
    }

    DisplayMoveRangeGraphics(flags);
}

void PlayerPhase_InitUnitMovementSelect(void)
{
    if (!MuExists() && UNIT_FACTION(gActiveUnit) == gPlaySt.faction &&
        gActiveUnit->statusIndex != UNIT_STATUS_SLEEP &&
        gActiveUnit->statusIndex != UNIT_STATUS_BERSERK)
    {
        StartMu(gActiveUnit);
        HideUnitSprite(gActiveUnit);
    }

    MU_SetDefaultFacing_Auto();
    TryCallSelectEvents();

    gBmSt.flags |= BM_FLAG_1;

    DisplayUnitEffectRange(gActiveUnit);

    if (gActiveUnit->xPos == gBmSt.cursor.x && gActiveUnit->yPos == gBmSt.cursor.y)
    {
        PathArrowDisp_Init(0);
        PlaySoundEffect(SONG_389);
        return;
    }

    PathArrowDisp_Init(1);
}

void DisplayActiveUnitEffectRange(ProcPtr proc)
{
    PlaySoundEffect(SONG_388);

    gBmSt.flags &= ~BM_FLAG_1;
    DisplayUnitEffectRange(gActiveUnit);
}

void PlayerPhase_DisplayDangerZone(void)
{
    GenerateDangerZoneRange(gBmSt.swap_action_range_count & 1);

    BmMapFill(gBmMapMovement, -1);

    PlaySoundEffect(SONG_388);

    gBmSt.flags |= BM_FLAG_3;
    gBmSt.flags &= ~BM_FLAG_1;

    if (gBmSt.swap_action_range_count & 1)
        DisplayMoveRangeGraphics(LIMITVIEW_GREEN | LIMITVIEW_BLUE);
    else
        DisplayMoveRangeGraphics(LIMITVIEW_RED | LIMITVIEW_BLUE);
}

void PlayerPhase_RangeDisplayIdle(ProcPtr proc)
{
    enum {
        ACT_FAIL = 0,
        ACT_MOVE = 1,
        ACT_CANCEL = 2,
        ACT_INFOSCREEN = 3,
        ACT_RESET_CURSOR = 4,
        ACT_EVENT = 5,
        ACT_SWAP_RANGES = 6,
    };

    u8 uid;
    u8 action = -1;

    HandlePlayerCursorMovement();

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (!gActiveUnit)
        {
            if (GetCombinedEnemyWeaponUsabilityBits() == (UNIT_USEBIT_WEAPON | UNIT_USEBIT_STAFF))
                action = ACT_SWAP_RANGES;
            else
                action = ACT_CANCEL;
        }
        else if (StartDestSelectedEvent())
            action = ACT_EVENT;
        else if (GetPlayerSelectKind(gActiveUnit) != PLAYER_SELECT_CONTROL &&
            !(gActiveUnit->state & US_HAS_MOVED))
        {
            if (GetUnitWeaponUsabilityBits(gActiveUnit) == (UNIT_USEBIT_WEAPON | UNIT_USEBIT_STAFF))
                action = ACT_SWAP_RANGES;
            else
                action = ACT_CANCEL;
        }
        else if (!CanMoveActiveUnitTo(gBmSt.cursor.x, gBmSt.cursor.y))
            action = ACT_FAIL;
        else
        {
            action = ACT_MOVE;
            goto else_stmt;
        }
    }
    else
    {
else_stmt:
        if (gpKeySt->pressed & B_BUTTON)
        {
            if (gActiveUnit->state & US_HAS_MOVED)
                action = ACT_FAIL;
            else
                action = ACT_CANCEL;
        }
        else if (gpKeySt->pressed & R_BUTTON)
            action = ACT_INFOSCREEN;
        else if (gpKeySt->pressed & L_BUTTON)
            action = ACT_RESET_CURSOR;
    }

    switch (action)
    {
    case ACT_FAIL:
        PlaySoundEffect(SONG_38C);
        break;

    case ACT_MOVE:
        EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
        HideMoveRangeGraphics();
        Proc_Break(proc);
        return;

    case ACT_CANCEL:
        if (gActiveUnit)
        {
            EndAllMus();

            gActiveUnit->state &= ~US_HIDDEN;

            if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
            {
                EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                SetMapCursorPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            }
        }

        gBmSt.flags &= ~BM_FLAG_3;

        HideMoveRangeGraphics();

        RefreshEntityMaps();
        RefreshUnitSprites();

        PlaySoundEffect(SONG_38B);

        Proc_Goto(proc, PL_PLAYERPHASE_IDLE);
        return;

    case ACT_INFOSCREEN:
        if (Proc_Find(ProcScr_UnkEvt))
            break;

        uid = gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x];

        if (gActiveUnitMoveOrigin.x == gBmSt.cursor.x && gActiveUnitMoveOrigin.y == gBmSt.cursor.y)
            uid = gActiveUnit->index;

        if (uid == 0 || !CanShowUnitStatScreen(GetUnit(uid)))
            break;

        EndAllMus();
        SetStatScreenExcludedUnitFlags(STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED |
            STATSCREEN_CONFIG_NONUNK9 | STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
        StartStatScreen(GetUnit(uid), proc);

        Proc_Goto(proc, PL_PLAYERPHASE_RESUME_RANGE);
        return;

    case ACT_RESET_CURSOR:
        if (!gActiveUnit)
            break;

        EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
        SetMapCursorPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
        PlaySoundEffect(SONG_38B);
        break;

    case ACT_EVENT:
        break;

    case ACT_SWAP_RANGES:
        gBmSt.swap_action_range_count++;

        HideMoveRangeGraphics();

        if (gBmSt.flags & BM_FLAG_3)
            Proc_Goto(proc, PL_PLAYERPHASE_DANGER_ZONE);
        else
            Proc_Goto(proc, PL_PLAYERPHASE_SEE_RANGE);

        break;
    }

    if (GetPlayerSelectKind(gActiveUnit) == PLAYER_SELECT_CONTROL)
        DrawUpdatedPathArrow();

    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y, MAP_CURSOR_REGULAR);
}

void PlayerPhase_CancelAction(ProcPtr proc)
{
    gActionSt.id = ACTION_NONE;
    Proc_Goto(proc, PL_PLAYERPHASE_ACTION_MENU);
}

void PlayerPhase_BackToMove(ProcPtr proc)
{
    gActiveUnit->xPos = gActiveUnitMoveOrigin.x;
    gActiveUnit->yPos = gActiveUnitMoveOrigin.y;

    UnitSyncMovement(gActiveUnit);

    gActiveUnit->state &= ~US_HIDDEN;

    RefreshEntityMaps();
    RenderMap();
    RefreshUnitSprites();

    if (!(gActiveUnit->state & US_HAS_MOVED))
        UnitBeginAction(gActiveUnit);
    else
        UnitBeginCantoAction(gActiveUnit);

    HideUnitSprite(gActiveUnit);
    EndAllMus();
    StartMu(gActiveUnit);

    Proc_Goto(proc, PL_PLAYERPHASE_MOVE);
}

s8 PlayerPhase_PrepareAction(ProcPtr proc)
{
    s8 cameraReturn = EnsureCameraOntoPosition(
        proc, GetUnit(gActionSt.instigator)->xPos, GetUnit(gActionSt.instigator)->yPos);
    cameraReturn ^= 1;

    switch (gActionSt.id)
    {
    case ACTION_NONE:
        if (gBmSt.partial_actions_taken != 0)
        {
            gActionSt.id = ACTION_FORCE_WAIT;
            break;
        }
        PlayerPhase_BackToMove(proc);
        return 1;

    case ACTION_TRADED:
        gBmSt.partial_actions_taken |= PARTIAL_ACTION_TRADE;
        PlayerPhase_CancelAction(proc);
        return 1;

    case ACTION_TRADED_SUPPLY:
        gBmSt.partial_actions_taken |= PARTIAL_ACTION_SUPPLY;
        PlayerPhase_CancelAction(proc);
        return 1;

    case ACTION_TAKE:
    case ACTION_GIVE:
        gBmSt.partial_actions_taken |= PARTIAL_ACTION_TAKE;
        PlayerPhase_CancelAction(proc);
        return 1;

    case ACTION_RIDE_BALLISTA:
    case ACTION_EXIT_BALLISTA:
        gBmSt.partial_actions_taken |= PARTIAL_ACTION_BALLISTA;
        PlayerPhase_CancelAction(proc);
        return 1;

    case ACTION_TRADED_NOCHANGES:
        PlayerPhase_CancelAction(proc);
        return 1;
    }

    if (gActionSt.id != ACTION_WAIT && gBmSt.just_resumed == 0)
    {
        gActionSt.suspend_point = SUSPEND_POINT_DURING_ACTION;
        WriteSuspendSave(SAVE_SUSPEND);
    }
    return cameraReturn;
}

bool TryMakeCantoUnit(ProcPtr proc)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO))
        return false;

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16))
        return false;

    if (gActionSt.id == ACTION_COMBAT || gActionSt.id == ACTION_STAFF)
        return false;

    if (UNIT_MOV(gActiveUnit) <= gActionSt.move_count)
        return false;

    if (!CanActiveUnitStillMove())
        return false;

    BmMapFill(gBmMapRange, 0);

    UnitBeginCantoAction(gActiveUnit);

    gActiveUnit->state |= US_HAS_MOVED;
    gActiveUnit->state &= ~US_UNSELECTABLE;

    EndAllMus();
    StartMu(gActiveUnit);
    MU_SetDefaultFacing_Auto();

    if (gPlaySt.chapterVisionRange != 0)
        Proc_Goto(proc, PL_PLAYERPHASE_FADE_TO_MOVE);
    else
        Proc_Goto(proc, PL_PLAYERPHASE_MOVE);

    return true;
}

bool RunPotentialWaitEvents(void)
{
    if (CheckForWaitEvents())
    {
        RunWaitEvents();
        return false;
    }

    return true;
}

bool EnsureCameraOntoActiveUnitPosition(ProcPtr proc)
{
    return !EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void PlayerPhase_FinishAction(ProcPtr proc)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderMapForFade();

        MoveActiveUnit(gActionSt.x_move, gActionSt.y_move);

        RefreshEntityMaps();
        RenderMap();

        StartMapFade(0);

        RefreshUnitSprites();
    }
    else
    {
        MoveActiveUnit(gActionSt.x_move, gActionSt.y_move);

        RefreshEntityMaps();
        RenderMap();
    }

    SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    gPlaySt.xCursor = gBmSt.cursor.x;
    gPlaySt.yCursor = gBmSt.cursor.y;

    if (TryMakeCantoUnit(proc))
    {
        HideUnitSprite(gActiveUnit);
        return;
    }

    if (ShouldCallEndEvent())
    {
        EndAllMus();

        RefreshEntityMaps();
        RenderMap();
        RefreshUnitSprites();

        MaybeCallEndEvent_();

        Proc_Goto(proc, PL_PLAYERPHASE_AFTER_END_EVENT);
        return;
    }

    EndAllMus();
}

void EventApplyPlayerUnitMove(void)
{
    if (gPlaySt.faction == FACTION_BLUE)
    {
        MoveActiveUnit(gActionSt.x_move, gActionSt.y_move);
        RefreshEntityMaps();
        RenderMap();
        RefreshUnitSprites();
        EndAllMus();
    }
}

void PlayerPhase_OpenActionMenu(ProcPtr proc)
{
    if (gActionSt.id != ACTION_TRAPPED)
        StartSemiCenteredOrphanMenu(
            &gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 0x16);

    Proc_Break(proc);
}

void PlayerPhase_ApplyUnitMovement(ProcPtr proc)
{
    gActiveUnit->xPos = gActionSt.x_move;
    gActiveUnit->yPos = gActionSt.y_move;

    UnitSyncMovement(gActiveUnit);

    if (!(gActiveUnit->state & US_HAS_MOVED) && gActionSt.id == ACTION_NONE &&
        gBmSt.partial_actions_taken == 0)
        gActionSt.move_count = gBmMapMovement[gActionSt.y_move][gActionSt.x_move];

    ResetTextFont();

    if (StartAfterUnitMovedEvent() == 1)
    {
        Proc_SetRepeatCb(proc, PlayerPhase_OpenActionMenu);
        return;
    }

    if (gActionSt.id != ACTION_TRAPPED)
        StartSemiCenteredOrphanMenu(
            &gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 0x16);

    Proc_Break(proc);
}

int GetPlayerSelectKind(struct Unit * unit)
{
    u8 faction = gPlaySt.faction;

    if (!unit)
        return PLAYER_SELECT_NOUNIT;

    if (gBmSt.flags & BM_FLAG_PREPSCREEN)
    {
        if (!CanCharacterBePrepMoved(unit->pCharacterData->number))
            return PLAYER_SELECT_4;

        faction = FACTION_BLUE;
    }

    if (!unit)
        return PLAYER_SELECT_NOUNIT;

    if (UNIT_FACTION(unit) != faction)
        return PLAYER_SELECT_NOCONTROL;

    if ((unit->state & US_UNSELECTABLE) || (UNIT_CATTRIBUTES(unit) & CA_UNSELECTABLE))
        return PLAYER_SELECT_TURNENDED;

    if (unit->statusIndex != UNIT_STATUS_SLEEP && unit->statusIndex != UNIT_STATUS_BERSERK)
        return PLAYER_SELECT_CONTROL;

    return PLAYER_SELECT_NOCONTROL;
}

bool CanMoveActiveUnitTo(int x, int y)
{
    struct Trap * trap;

    if (gBmMapUnit[y][x] != 0 || gBmMapMovement[y][x] >= MAP_MOVEMENT_MAX)
        return false;

    if (!(gActiveUnit->state & US_IN_BALLISTA))
        return true;

    trap = GetTrapAt(x, y);

    if (x == gActiveUnitMoveOrigin.x && y == gActiveUnitMoveOrigin.y)
        return true;

    if (!trap)
        return true;

    if (trap->type != TRAP_BALLISTA)
        return true;

    return false;
}

void PlayerPhase_DisplayUnitMovement(void)
{
    GetMovementScriptFromPath();
    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);
    SetAutoMuMoveScript(gWorkingMoveScr);
}

void PlayerPhase_WaitForUnitMovement(ProcPtr proc)
{
    if (!MuExistsActive())
        Proc_Break(proc);
}

void PlayerPhase_ResumeRangeDisplay(ProcPtr proc)
{
    if (!gActiveUnit)
    {
        RefreshBMapGraphics();
        Proc_Goto(proc, PL_PLAYERPHASE_DANGER_ZONE);
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    switch (GetPlayerSelectKind(gActiveUnit))
    {
    case PLAYER_SELECT_CONTROL:
        HideUnitSprite(gActiveUnit);
        break;

    case PLAYER_SELECT_NOCONTROL:
        Proc_Goto(proc, PL_PLAYERPHASE_SEE_RANGE);
        break;
    }
}

void PlayerPhase_ReReadGameSaveGfx(void)
{
    RefreshBMapGraphics();
    SetBlendNone();
}

void MoveLimitViewChange_OnInit(struct MoveLimitViewChangeProc * proc)
{
    RegisterDataMove(Img_LimitViewSquareFull, (u8 *)VRAM + 0x5080, 0x80);

    if (!(gBmSt.flags & BM_FLAG_0))
        proc->frame = 2;
    else
    {
        RegisterDataMove(Img_LimitViewSquareFull, (u8 *)VRAM + 0x5000, 0x80);
        Proc_End(proc);
    }
}

void MoveLimitViewChange_OnLoop(struct MoveLimitViewChangeProc * proc)
{
    RegisterDataMove(gOpenLimitViewImgLut[proc->frame], (u8 *)VRAM + 0x5000, 0x80);

    if (++proc->frame == (int)ARRAY_COUNT(gOpenLimitViewImgLut))
        Proc_Break(proc);
}

void MoveLimitView_OnInit(ProcPtr proc)
{
    int ix;
    int iy;

    SetWinEnable(0, 0, 0);

    gBmSt.flags |= BM_FLAG_0;
    RenderMap();

    for (iy = 9; iy >= 0; --iy)
        for (ix = 14; ix >= 0; --ix)
            DisplayMovementViewTile(
                gBg2Tm, gBmSt.map_render_anchor.x + ix, gBmSt.map_render_anchor.y + iy, ix, iy);

    EnableBgSync(BG2_SYNC_BIT);
    SetBgOffset(BG_2, 0, 0);

    SetBlendAlpha(10, 6);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    InitBmBgLayers();
}

void MoveLimitView_OnLoop(struct MoveLimitViewProc * proc)
{
    int frame = (GetGameTime() / 2) & 31;

    if (proc->flags & LIMITVIEW_BLUE)
        ApplyPaletteExt(Pal_LimitViewBlue + frame, 0x82, 0x20);

    if (proc->flags & LIMITVIEW_RED)
        ApplyPaletteExt(Pal_LimitViewRed + frame, 0xA2, 0x20);

    if (proc->flags & LIMITVIEW_GREEN)
        ApplyPaletteExt(Pal_LimitViewGreen + frame, 0xA2, 0x20);

    if (proc->flags & LIMITVIEW_UNK)
        ApplyPaletteExt(Pal_LimitViewBlue + frame, 0xA2, 0x20);
}

void MoveLimitView_OnEnd(struct MoveLimitViewProc * proc)
{
    if (proc->flags & (LIMITVIEW_BLUE | LIMITVIEW_UNK))
    {
        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);
    }

    gBmSt.flags &= ~(BM_FLAG_0 | BM_FLAG_1);

    InitBmBgLayers();
}

void DisplayMoveRangeGraphics(int flags)
{
    struct MoveLimitViewProc * proc = Proc_Find(ProcScr_MoveLimitView);

    if (proc)
    {
        MoveLimitView_OnInit(proc);
        MoveLimitViewChange_OnInit(NULL);
        return;
    }

    proc = Proc_Start(ProcScr_MoveLimitView, PROC_TREE_4);
    proc->flags = flags;
}

void HideMoveRangeGraphics(void)
{
    Proc_EndEach(ProcScr_MoveLimitView);
}

bool TrySetCursorOn(int unitId)
{
    ProcPtr proc;
    struct Unit * unit = GetUnit(unitId);

    if (!UNIT_IS_VALID(unit))
        return false;

    if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_BIT16))
        return false;

    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP)
        return false;

    proc = Proc_Find(ProcScr_PlayerPhase);

    if (!proc)
        proc = Proc_Find(ProcScr_SALLYCURSOR);

    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
    SetMapCursorPosition(unit->xPos, unit->yPos);

    return true;
}

void TrySwitchViewedUnit(int x, int y)
{
    int i;
    int unitId = gBmMapUnit[y][x];

    if ((unitId & 0xC0) != FACTION_BLUE)
        unitId = 0;

    unitId++;

    for (i = unitId; i < 0x3F; ++i)
        if (TrySetCursorOn(i))
            return;

    for (i = 1; i <= unitId; ++i)
        if (TrySetCursorOn(i))
            return;
}

void PlayerPhase_HandleAutoEnd(ProcPtr proc)
{
    if (!gPlaySt.cfgDisableAutoEndTurns && CountFactionMoveableUnits(gPlaySt.faction) == 0)
        Proc_Goto(proc, PL_PLAYERPHASE_END);
}
