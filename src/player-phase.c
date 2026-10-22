#include "gbafe.h"

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
