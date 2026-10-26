#include "gbafe.h"

void UiSpinningArrows_Init(struct SpinningArrowProc * proc)
{
    proc->kind = 0;
    proc->oam2 = 0;

    proc->unk_4c[0] = 0;
    proc->unk_44[0] = 0;
    proc->y[0] = 0;
    proc->x[0] = 0;

    proc->unk_4c[1] = 0;
    proc->unk_44[1] = 0;
    proc->y[1] = 0;
    proc->x[1] = 0;

    proc->flags = 0;
}

void UiSpinningArrows_Loop(struct SpinningArrowProc * proc)
{
    int i;

    int xOam1_a = proc->x[0];
    int yOam0_a = proc->y[0];

    int xOam1_b = proc->x[1];
    int yOam0_b = proc->y[1];

    proc->unk_44[0]++;
    proc->unk_44[1]++;

    for (i = 0; i < 2; i++)
    {
        if (proc->unk_4c[i] != 0)
        {
            proc->unk_44[i] += 3;
            proc->unk_4c[i]++;
        }

        if ((proc->unk_44[i] >> 3) > 5)
            proc->unk_44[i] = 0;
    }

    if (proc->kind == 0)
    {
        if (proc->unk_4c[0] != 0)
        {
            int offset = (proc->unk_4c[0] >> 3) - 4;
            xOam1_a = proc->x[0] + offset;
            if ((proc->unk_4c[0] >> 3) == 4)
                proc->unk_4c[0] = 0;
        }

        if (proc->unk_4c[1] != 0)
        {
            int offset = (proc->unk_4c[1] >> 3) - 4;
            xOam1_b = proc->x[1] - offset;
            if ((proc->unk_4c[1] >> 3) == 4)
                proc->unk_4c[1] = 0;
        }

        if (proc->flags & 1)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), Sprite_UiSpinningArrows_Horizontal,
                proc->oam2 + (proc->unk_44[0] >> 3));
        }

        if (proc->flags & 2)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_HFLIP, OAM0_Y(yOam0_b), Sprite_UiSpinningArrows_Horizontal,
                proc->oam2 + (proc->unk_44[1] >> 3));
        }
    }

    if (proc->kind == 1)
    {
        if (proc->unk_4c[0] != 0)
        {
            int offset = (proc->unk_4c[0] >> 3) - 4;
            yOam0_a = proc->y[0] + offset;
            if ((proc->unk_4c[0] >> 3) == 4)
                proc->unk_4c[0] = 0;
        }

        if (proc->unk_4c[1] != 0)
        {
            int offset = (proc->unk_4c[1] >> 3) - 4;
            yOam0_b = proc->y[1] - offset;
            if ((proc->unk_4c[1] >> 3) == 4)
                proc->unk_4c[1] = 0;
        }

        if (proc->flags & 1)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), Sprite_UiSpinningArrows_Vertical,
                proc->oam2 + (proc->unk_44[0] >> 3) * 2);
        }

        if (proc->flags & 2)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_VFLIP, OAM0_Y(yOam0_b), Sprite_UiSpinningArrows_Vertical,
                proc->oam2 + (proc->unk_44[1] >> 3) * 2);
        }
    }
}

ProcPtr StartUiSpinningArrows(ProcPtr parent)
{
    return Proc_Start(ProcScr_UiSpinningArrows, parent);
}

// Returns nothing, but must be non-void to match.
ProcPtr LoadUiSpinningArrowGfx(s32 kind, s32 chr, s32 palId)
{
    struct SpinningArrowProc * proc = Proc_Find(ProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        ApplyPalette(gUnk_08428A40, palId + 0x10);

        if (kind == 0)
            Decompress(gUnk_08427A48, (void *) (chr + (VRAM + 0x10000)));

        if (kind == 1)
            Decompress(gUnk_08427974, (void *) (chr + (VRAM + 0x10000)));

        proc->oam2 = (chr >> 5) + OAM2_PAL(palId);
        proc->kind = kind;
    }
}

void SetUiSpinningArrowConfig(s32 flags)
{
    struct SpinningArrowProc * proc = Proc_Find(ProcScr_UiSpinningArrows);

    if (proc != NULL)
        proc->flags = flags;
}

void SetUiSpinningArrowPositions(s32 x1, s32 y1, s32 x2, s32 y2)
{
    struct SpinningArrowProc * proc = Proc_Find(ProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        proc->x[0] = x1;
        proc->y[0] = y1;

        proc->x[1] = x2;
        proc->y[1] = y2;
    }
}

void SetUiSpinningArrowFastMaybe(s32 kind)
{
    struct SpinningArrowProc * proc = Proc_Find(ProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        if (kind == 0)
            proc->unk_4c[0] = 1;

        if (kind == 1)
            proc->unk_4c[1] = 1;

        if (kind == 2)
            proc->unk_4c[0] = 1;

        if (kind == 3)
            proc->unk_4c[1] = 1;
    }
}

void EndUiSpinningArrows(void)
{
    Proc_End(Proc_Find(ProcScr_UiSpinningArrows));
}
