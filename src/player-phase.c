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
