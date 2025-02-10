#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_ViewCounter[] = {
    PROC_19,
    PROC_YIELD,
    PROC_REPEAT(ViewCounter_Loop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_PrepHelpboxListener[] = {
    PROC_SLEEP(1),
    PROC_REPEAT(PrepHbKeyListener_Loop),
    PROC_END,
};

struct PrepItemTypePageEnt CONST_DATA gPrepItemTypePageLut[] = {
    [0] = { ITYPE_SWORD,  ITYPE_SWORD },
    [1] = { ITYPE_LANCE,  ITYPE_LANCE },
    [2] = { ITYPE_AXE,    ITYPE_AXE   },
    [3] = { ITYPE_BOW,    ITYPE_BOW   },
    [4] = { ITYPE_STAFF,  ITYPE_STAFF },
    [5] = { ITYPE_ANIMA,  ITYPE_ANIMA },
    [6] = { ITYPE_LIGHT,  ITYPE_LIGHT },
    [7] = { ITYPE_DARK,   ITYPE_DARK  },
    [8] = { ITYPE_ITEM,   ITYPE_12    },
};

