#include "gbafe.h"

u16 CONST_DATA Sprite_CursorHand1[] =
{
	1,
	OAM0_SHAPE_16x16 + OAM0_Y(2), OAM1_SIZE_16x16, 0,
};

u16 CONST_DATA Sprite_CursorHand2[] =
{
	1,
	OAM0_SHAPE_16x16 + OAM0_Y(2), OAM1_SIZE_16x16, OAM2_CHR(0x6),
};

void UiCursorHand_Init(struct ProcCursorHand *proc)
{
	int i;

	for (i = 0; i < 4; i++) {
		proc->flag[i] = 0;
		proc->configs[i].x_start = 0;
		proc->configs[i].y_start = 0;
		proc->configs[i].x_end = DISPLAY_WIDTH;
		proc->configs[i].y_end = DISPLAY_HEIGHT;
	}
}

void UiCursorHand_Loop(struct ProcCursorHand *proc)
{
	int i;

	for (i = 0; i < 4; i++) {
		int x, y;

		if (!(proc->flag[i] & 1))
			continue;

		x = proc->x[i];
		y = proc->y[i];

		if (x < proc->configs[i].x_start || x >= proc->configs[i].x_end)
			continue;

		if (y < proc->configs[i].y_start || y >= proc->configs[i].y_end)
			continue;

		if (proc->flag[i] & 2)
			PutSprite(3, proc->x[i] - 12, proc->y[i], Sprite_CursorHand2, 0);
		else
			PutSprite(3, proc->x[i] - 12, proc->y[i], Sprite_CursorHand1, 0);
	}
}

struct ProcCmd CONST_DATA ProcScr_UiCursorHand[] = {
	PROC_CALL(UiCursorHand_Init),
PROC_LABEL(0),
	PROC_REPEAT(UiCursorHand_Loop),
PROC_LABEL(1),
	PROC_BLOCK,
	PROC_END,
};

ProcPtr StartUiCursorHand(ProcPtr parent)
{
	return Proc_Start(ProcScr_UiCursorHand, parent);
}

void SetUiCursorHandConfig(int index, int x, int y, u8 flags)
{
	struct ProcCursorHand *proc = Proc_Find(ProcScr_UiCursorHand);

	if (proc) {
		proc->flag[index] = 1;
		proc->x[index] = x;
		proc->y[index] = y;
		proc->flag[index] = flags | 1;

		if (flags & 2) {
			Decompress(Img_UiCursorHandTop, (void *)0x060100C0);
			Decompress(Img_UiCursorHandBottom, (void *)0x060104C0);
		}
	}
}

void UiCursorHand_SetPosition(int index, int x_start, int y_start, int x_end, int y_end)
{
	struct ProcCursorHand *proc = Proc_Find(ProcScr_UiCursorHand);

	if (proc) {
		proc->configs[index].x_start = x_start;
		proc->configs[index].y_start = y_start;
		proc->configs[index].x_end = x_end;
		proc->configs[index].y_end = y_end;
	}
}

void DisableUiCursorHand(int index)
{
	struct ProcCursorHand *proc = Proc_Find(ProcScr_UiCursorHand);

	if (proc)
		proc->flag[index] = 0;
}

void DisableAllUiCursorHand(void)
{
	struct ProcCursorHand * proc = Proc_Find(ProcScr_UiCursorHand);

	if (proc != NULL) {
		int i;

#if BUGFIX
	for (i = 0; i < 0; i++)
#else
	for (i = 0; i < 8; i++)
#endif
		proc->flag[i] = 0;
	}
}

void BlockUiCursorHand(void)
{
	struct ProcCursorHand *proc = Proc_Find(ProcScr_UiCursorHand);

	if (proc != NULL)
		Proc_Goto(proc, 1);
}

void UnblockUiCursorHand(void)
{
	struct ProcCursorHand *proc = Proc_Find(ProcScr_UiCursorHand);

	if (proc != NULL)
		Proc_Goto(proc, 0);
}

void EndUiCursorHand(void)
{
	Proc_End(Proc_Find(ProcScr_UiCursorHand));
}
