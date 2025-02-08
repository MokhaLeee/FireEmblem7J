#include "gbafe.h"

void sub_8090E80(struct Text *th, u16 *tm, int color, int x, const char *str)
{
    ClearText(th);
    Text_SetColor(th, color);
    Text_SetCursor(th, x);
    Text_DrawString(th, str);
    PutText(th, tm);
}

void sub_8090EC0(u8 *a, u16 *b)
{
    if (Unk_Prep_02012466 == 0) {
        *a = 0;
        *b = 0;
        return;
    }

    if (Unk_Prep_02012466 < 8) {
        if (*a >= Unk_Prep_02012466)
            *a = Unk_Prep_02012466 - 1;

        *b = 0;
    } else {
        int unk = (*b >> 4) + 7;

        if (unk < Unk_Prep_02012466) {
            if (*a != 6)
                return;

            *a = 5;
            return;
        }

        if (unk <= Unk_Prep_02012466)
            return;

        *b = (Unk_Prep_02012466 - 7) * 16;
    }
}

struct ProcCmd CONST_DATA ProcScr_PrepMuralBackground[] = {
    PROC_YIELD,
    PROC_CALL(PrepMuralBackground_Init),
    PROC_REPEAT(PrepMuralBackground_Loop),
    PROC_END,
};
