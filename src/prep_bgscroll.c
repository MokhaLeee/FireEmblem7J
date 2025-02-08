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

#if 0
void PrepMuralBackground_Init(struct ProcPrepMuralBackground *proc)
{
	u16 iy;

	TmFill(gBg3Tm, 0);

	(void)GetGameTime();
	proc->timer = 0;

	for (iy = 0; iy < 0x20; iy++) {
		u16 ix;

		for (ix = 0; ix < 0x1E; ix++) {
			u32 r4 = iy + proc->timer / 8;
			int r1 = 0x27 - (r4 % 0x28);

			gBg3Tm[(r4 & 0x1F) * 0x20 + ix] = TsaConfig_PrepMuralBackground[r1 * 30 + ix] + proc->pal_bank * 0x1000;
		}
	}

	EnableBgSync(BG3_SYNC_BIT);
	proc->unk_2C = 0;
	SetBgOffset(BG_3, 0, proc->timer & 0xFF);
	REG_BG3VOFS = proc->timer & 0xFF;
}

void PrepMuralBackground_Loop(struct ProcPrepMuralBackground *proc)
{
	if (proc->unk_2C == 3) {
		if (++proc->timer == 0x500)
			proc->timer = 0;

		SetBgOffset(BG_3, 0, proc->timer & 0xFF);
		REG_BG3VOFS = proc->timer & 0xFF;
		proc->unk_2C = 0;
	}

	proc->unk_2C++;

	if ((proc->timer & 7) == 0) {
		int r4 = (proc->timer / 8 - 1) & 0x1F;
		int r0 = (proc->timer / 8 + 0x1F) % 0x28;
		u16 ix = 0;

		for (; ix < 0x1E; ix++) {
			gBg3Tm[ix + r4 * 0x20] = TsaConfig_PrepMuralBackground[(0x27 - r0) * 30 + ix] + proc->pal_bank * 0x1000;
		}

		CpuFastCopy(gBg3Tm + r4 * 0x20, (void *)(VRAM + GetBgTilemapOffset(3)), 0x20);
	}
}
#endif
