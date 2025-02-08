#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_SallyCir[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(SallyCir_Init),
    PROC_REPEAT(SallyCir_Loop),
    PROC_CALL(SallyCir_OnEnd),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_Unk_08D8C934[] = {
    PROC_YIELD,
    PROC_YIELD,
    PROC_END,
};
