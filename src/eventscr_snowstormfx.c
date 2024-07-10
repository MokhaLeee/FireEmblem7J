#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_SnowStormWeather[] = {
    PROC_YIELD,
    PROC_CALL(SnowStormWeather_Init),
    PROC_YIELD,
    PROC_REPEAT(SnowStormWeather_Loop1),
    PROC_REPEAT(SnowStormWeather_Loop2),
    PROC_REPEAT(SnowStormWeather_Loop3),
    PROC_CALL(SnowStormWeather_End),
    PROC_END,
};
