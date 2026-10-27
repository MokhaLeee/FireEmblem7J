#include "gbafe.h"

struct MenuScrollBarProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 xBase;
    /* 2C */ u8 yBase;
    /* 2D */ u8 numSegments;
    /* 2E */ u16 currentSegment;
    /* 30 */ u16 prevSegment;
    /* 32 */ u16 numTotalRows;
    /* 34 */ u8 numVisibleRows;
    /* 36 */ u16 oam2Chr;
    /* 38 */ u16 oam2Pal;
    /* 3A */ u8 topArrowFrameIdx;
    /* 3B */ u8 bottomArrowFrameIdx;
};

u16 CONST_DATA Sprite_MenuScrollContainer[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
};

u16 CONST_DATA Sprite_08D8C744[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x9),
};

u16 CONST_DATA Sprite_08D8C74C[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_VFLIP, OAM2_CHR(0x9),
};

u16 CONST_DATA Sprite_08D8C754[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08D8C75C[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x2),
};

u16 CONST_DATA Sprite_08D8C764[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x3),
};

u16 CONST_DATA Sprite_08D8C76C[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x4),
};

u16 CONST_DATA Sprite_08D8C774[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x5),
};

u16 CONST_DATA Sprite_08D8C77C[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x6),
};

u16 CONST_DATA Sprite_08D8C784[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x7),
};

u16 CONST_DATA Sprite_08D8C78C[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x8),
};

u16 CONST_DATA *CONST_DATA Sprites_08D8C794[] = {
	NULL,
	Sprite_08D8C754,
	Sprite_08D8C75C,
	Sprite_08D8C764,
	Sprite_08D8C76C,
	Sprite_08D8C774,
	Sprite_08D8C77C,
	Sprite_08D8C784,
	Sprite_08D8C78C,
};

u16 CONST_DATA Sprite_08D8C7B8[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xA),
};

u16 CONST_DATA Sprite_08D8C7C0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xB),
};

u16 CONST_DATA Sprite_08D8C7C8[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xC),
};

u16 CONST_DATA Sprite_08D8C7D0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xD),
};

u16 CONST_DATA Sprite_08D8C7D8[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xE),
};

u16 CONST_DATA Sprite_08D8C7E0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xF),
};

u16 CONST_DATA *CONST_DATA Sprites_08D8C7E8[] = {
	Sprite_08D8C7B8,
	Sprite_08D8C7C0,
	Sprite_08D8C7C8,
	Sprite_08D8C7D0,
	Sprite_08D8C7D8,
	Sprite_08D8C7E0,
};

u16 CONST_DATA Sprite_08D8C800[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08D8C808[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08D8C810[] =
{
    1,
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08D8C818[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x15),
};

u16 CONST_DATA Sprite_08D8C820[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x16),
};

u16 CONST_DATA Sprite_08D8C828[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_08D8C830[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xC),
};

u16 CONST_DATA Sprite_08D8C838[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xD),
};

u16 CONST_DATA Sprite_08D8C840[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xE),
};

u16 CONST_DATA Sprite_08D8C848[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xF),
};

u16 CONST_DATA Sprite_08D8C850[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x10),
};

u16 CONST_DATA Sprite_08D8C858[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x11),
};

u16 CONST_DATA Sprite_08D8C860[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x12),
};

u16 CONST_DATA Sprite_08D8C868[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x13),
};

u16 CONST_DATA Sprite_08D8C870[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, 0,
};

u16 CONST_DATA Sprite_08D8C878[] =
{
    1,
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32, 0,
};

u16 CONST_DATA *CONST_DATA Sprites_08D8C880[] = {
	Sprite_08D8C828,
	Sprite_08D8C830,
	Sprite_08D8C838,
	Sprite_08D8C840,
	Sprite_08D8C848,
	Sprite_08D8C850,
	Sprite_08D8C858,
	Sprite_08D8C860,
	Sprite_08D8C868,
	Sprite_08D8C870,
	Sprite_08D8C878
};

struct ProcCmd CONST_DATA ProcScr_menu_scroll[] = {
    PROC_19,
    PROC_CALL(MenuScroll_Init),
PROC_LABEL(0),
    PROC_REPEAT(MenuScroll_Loop),
PROC_LABEL(1),
    PROC_BLOCK,
    PROC_END,
};

void MenuScroll_Init(ProcPtr p)
{
    struct MenuScrollBarProc * proc = p;

    proc->xBase = 0;
    proc->yBase = 0;
    proc->numSegments = 0;
    proc->currentSegment = 0;
    proc->numTotalRows = proc->currentSegment;
    proc->numVisibleRows = 0;
    proc->prevSegment = proc->currentSegment;
    proc->oam2Chr = 0x390;
    proc->oam2Pal = 0x1000;
    proc->topArrowFrameIdx = 0;
    proc->bottomArrowFrameIdx = 0;
}

void MenuScroll_Loop(ProcPtr p)
{
    struct MenuScrollBarProc * proc = p;
    u32 r7;
    int r2;
    u32 sp04;
    u32 sp08;
    int oam2;
    int i;
    u16 currentSegment;
    u16 numTotalRows;

    oam2 = proc->oam2Chr + proc->oam2Pal;

    if (proc->numTotalRows <= proc->numVisibleRows)
        return;

    for (i = 0; i < proc->numSegments; i++)
        PutSpriteExt(4, proc->xBase, proc->yBase + 8 * i, Sprite_MenuScrollContainer, oam2);

    if (i != 0)
    {
        r7 = proc->numSegments << 0x13;
        currentSegment = proc->currentSegment;
        numTotalRows = proc->numTotalRows;

        if (numTotalRows > proc->numVisibleRows)
        {
            sp04 = r7 / numTotalRows;
            sp08 = r7 * proc->numVisibleRows / numTotalRows;

            if (currentSegment != 0)
            {
                PutSpriteExt(4, proc->xBase + OAM1_VFLIP + 1, proc->yBase - 8,
                    Sprites_08D8C7E8[(proc->topArrowFrameIdx >> 3)], oam2);
            }

            for (i = 0; i < sp08 >> 0x13; i++)
            {
                PutSpriteExt(4, proc->xBase + 1, proc->yBase + (sp04 * currentSegment >> 0x14) + i * 8,
                    Sprites_08D8C794[8], oam2);
            }

            if (((proc->currentSegment >> 4) + proc->numVisibleRows) == proc->numTotalRows)
            {
                u32 var = proc->numSegments * 8 - ((r2 = sp04 * currentSegment >> 0x14) + i * 8);

                if (var != 0)
                {
                    PutSpriteExt(4, proc->xBase + 1, proc->yBase + r2 + i * 8,
                        Sprites_08D8C794[var], oam2);
                }
            }
            else
            {
                if ((sp08 >> 0x10) & 7)
                {
                    PutSpriteExt(4, proc->xBase + 1, proc->yBase + (sp04 * currentSegment >> 0x14) + i * 8,
                        Sprites_08D8C794[(sp08 >> 0x10) & 7], oam2);
                }

                PutSpriteExt(4, proc->xBase + 1, proc->yBase + proc->numSegments * 8 + 1,
                    Sprites_08D8C7E8[proc->bottomArrowFrameIdx >> 3], oam2);
            }
        }

        PutSpriteExt(4, proc->xBase, proc->yBase - 8, Sprite_08D8C744, oam2);
        PutSpriteExt(4, proc->xBase, proc->yBase + proc->numSegments * 8, Sprite_08D8C74C, oam2);
    }

    if (proc->prevSegment != proc->currentSegment)
    {
        if (proc->prevSegment > proc->currentSegment)
            proc->topArrowFrameIdx += 3;

        if (proc->prevSegment < proc->currentSegment)
            proc->bottomArrowFrameIdx += 3;

        proc->prevSegment = proc->currentSegment;
    }

    proc->topArrowFrameIdx++;
    proc->bottomArrowFrameIdx++;

    if ((proc->topArrowFrameIdx >> 3) > 5)
        proc->topArrowFrameIdx = 0;

    if ((proc->bottomArrowFrameIdx >> 3) > 5)
        proc->bottomArrowFrameIdx = 0;
}

void LockMenuScrollBar(void)
{
    struct MenuScrollBarProc * proc = Proc_Find(ProcScr_menu_scroll);

    if (proc)
        Proc_Goto(proc, 1);
}

void TryHideMenuScrollBar(void)
{
    struct MenuScrollBarProc * proc = Proc_Find(ProcScr_menu_scroll);

    if (proc)
        Proc_Goto(proc, 0);
}

void EndMenuScrollBar(void)
{
    Proc_End(Proc_Find(ProcScr_menu_scroll));
}

ProcPtr StartMenuScrollBar(ProcPtr parent)
{
    return Proc_Start(ProcScr_menu_scroll, parent);
}

void PutMenuScrollBarAt(int x, int y)
{
    struct MenuScrollBarProc * proc = Proc_Find(ProcScr_menu_scroll);

    if (proc)
    {
        proc->xBase = x;
        proc->yBase = y;
    }
}

void UpdateMenuScrollBarConfig(u8 segments, u16 currentSegment, u16 totalRows, u8 visibleRows)
{
    struct MenuScrollBarProc * proc = Proc_Find(ProcScr_menu_scroll);

    if (proc)
    {
        proc->numSegments = segments;
        proc->currentSegment = currentSegment;
        proc->numTotalRows = totalRows;
        proc->numVisibleRows = visibleRows;
    }
}

void InitMenuScrollBarImg(int chr, int pal)
{
    struct MenuScrollBarProc * proc;

    ApplyPalette(Pal_MenuScrollBar, pal + 0x10);
    Decompress(Img_MenuScrollBar, (void *) ((VRAM + 0x10000) + chr));

    proc = Proc_Find(ProcScr_menu_scroll);

    if (proc)
    {
        proc->oam2Chr = chr >> 5;
        proc->oam2Pal = pal << 0xc;
    }
}
