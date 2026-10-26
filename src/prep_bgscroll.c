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

void PrepMuralBackground_Init(struct ProcPrepMuralBackground *proc)
{
    u16 iy, ix;
    u16 * tsa = TsaConfig_PrepMuralBackground;

    TmFill(gBg3Tm, 0);
    GetGameTime();

    proc->timer = 0;

    for (iy = 0; iy < 0x20; iy++) {
        for (ix = 0; ix < 0x1E; ix++) {
            int y = iy + proc->timer / 8;
            int row = 0x27 - (y % 0x28);
            ((u16 (*)[0x20])gBg3Tm)[y & 0x1F][ix] = ((u16 (*)[30])tsa)[row][ix] + proc->pal_bank * 0x1000;
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

    if ((proc->timer % 8) == 0) {
        u16 * tsa = TsaConfig_PrepMuralBackground;
        int y = (proc->timer / 8 - 1) & 0x1F;
        u8 row = (proc->timer / 8 + 0x1F) % 0x28;
        u16 ix;

        for (ix = 0; ix < 0x1E; ix++)
            ((u16 (*)[0x20])gBg3Tm)[y][ix] = ((u16 (*)[30])tsa)[0x27 - row][ix] + proc->pal_bank * 0x1000;

        CpuFastCopy(gBg3Tm + y * 0x20, (void *)(VRAM + GetBgTilemapOffset(3) + y * 0x40), 0x3C);
    }
}

struct ProcPrepMuralBackground * StartPrepMuralBackground(ProcPtr parent, int pal_bank)
{
    struct ProcPrepMuralBackground *proc;

    Decompress(Img_PrepMuralBackground, (void *)(BG_VRAM + GetBgChrOffset(3)));
    ApplyPalette(Pal_PrepMuralBackground, pal_bank);

    Proc_End(Proc_Find(ProcScr_PrepMuralBackground));
    proc = Proc_Start(ProcScr_PrepMuralBackground, parent);
    proc->pal_bank = pal_bank;

    return proc;
}

void EndPrepMuralBackground(void)
{
    Proc_End(Proc_Find(ProcScr_PrepMuralBackground));
}
