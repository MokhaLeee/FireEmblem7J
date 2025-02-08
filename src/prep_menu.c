#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_PrepScreenMenuDummyItem[] = {
    PROC_BLOCK,
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_PrepMenu[] = {
    PROC_CALL(PrepMenu_OnInit),
    PROC_SET_END_CB(PrepMenu_OnEnd),
    PROC_YIELD,
PROC_LABEL(0),
    PROC_REPEAT(PrepMenu_ShowActiveHand),
PROC_LABEL(1),
    PROC_REPEAT(PrepMenu_CtrlLoop),
PROC_LABEL(2),
    PROC_REPEAT(PrepMenu_ShowFrozenHand),
PROC_LABEL(10),
    PROC_END,
};
