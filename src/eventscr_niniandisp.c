#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_NinianAppearfx[] = {
    PROC_YIELD,
    PROC_CALL(NinianAppear_Init),
    PROC_CALL(NinianAppear_Anim1),
    PROC_REPEAT(NinianAppear_LoopAnim1),
    PROC_CALL(NinianAppear_EndAnim1),
    PROC_CALL(NinianAppear_Anim2),
    PROC_REPEAT(NinianAppear_LoadUnit),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_CALL(NinianAppear_End),
    PROC_END,
};
