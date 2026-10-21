#include "gbafe.h"

void PlayerPhase_Suspend(void)
{
    gActionSt.suspend_point = SUSPEND_POINT_PLAYER_PHASE;
    WriteSuspendSave(SAVE_SUSPEND);
}
