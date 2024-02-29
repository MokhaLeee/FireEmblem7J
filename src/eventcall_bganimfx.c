#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_EventBgAnimfx[] = {
    PROC_CALL(EventBgAnimfx_Init),
    PROC_SET_END_CB(EventBgAnimfx_End),
    PROC_REPEAT(EventBgAnimfx_Loop),
    PROC_END,
};
