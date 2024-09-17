#include "gbafe.h"

struct ProcCmd ProcScr_MineFx[] = {
	PROC_SLEEP(24),
	PROC_CALL(ProcMineFxFunc),
	PROC_END,
};

void ProcMineFxFunc()
{
	if (!gPlaySt.cfgDisableSoundEffects)
	{
		m4aSongNumStart(0x2F9);
	}
}

#if NONMATCHING

void StartMineAnim(ProcPtr proc, int x_target, int y_target)
{
	int _x = (x_target << 4) - gBmSt.camera.x + 8;
	int _y = (y_target << 4) - gBmSt.camera.y + 4;

	sub_80149B4(proc, 0x20);
	Decompress(Img_MineFx, (void*)(VRAM + 0x13000));
	ApplyPaletteExt(Pal_MineFx, 0x2A0, 0x20);
	StartSpriteAnimProc(SpritAnim_MineFx, _x, _y, 0x5180, 0, 0);
	Proc_Start(ProcScr_MineFx, proc);
}

#else

NAKEDFUNC
void StartMineAnim(ProcPtr proc, int x_target, int y_target)
{
	asm("\n\
	.syntax unified\n\
	push {r4, r5, r6, lr}\n\
	sub sp, #8\n\
	adds r4, r0, #0\n\
	adds r5, r1, #0\n\
	adds r6, r2, #0\n\
	lsls r0, r5, #4\n\
	ldr r2, _080217D4 @ =gBmSt\n\
	movs r3, #0xc\n\
	ldrsh r1, [r2, r3]\n\
	subs r0, r0, r1\n\
	adds r5, r0, #0\n\
	adds r5, #8\n\
	lsls r0, r6, #4\n\
	movs r3, #0xe\n\
	ldrsh r1, [r2, r3]\n\
	subs r0, r0, r1\n\
	adds r6, r0, #4\n\
	adds r0, r4, #0\n\
	movs r1, #0x20\n\
	bl sub_80149B4\n\
	ldr r0, _080217D8 @ =Img_MineFx\n\
	ldr r1, _080217DC @ =0x06013000\n\
	bl Decompress\n\
	ldr r0, _080217E0 @ =Pal_MineFx\n\
	movs r1, #0xa8\n\
	lsls r1, r1, #2\n\
	movs r2, #0x20\n\
	bl ApplyPaletteExt\n\
	ldr r0, _080217E4 @ =SpritAnim_MineFx\n\
	movs r3, #0xa3\n\
	lsls r3, r3, #7\n\
	movs r1, #0\n\
	str r1, [sp]\n\
	str r1, [sp, #4]\n\
	adds r1, r5, #0\n\
	adds r2, r6, #0\n\
	bl StartSpriteAnimProc\n\
	ldr r0, _080217E8 @ =ProcScr_MineFx\n\
	adds r1, r4, #0\n\
	bl Proc_Start\n\
	add sp, #8\n\
	pop {r4, r5, r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080217D4: .4byte gBmSt\n\
_080217D8: .4byte Img_MineFx\n\
_080217DC: .4byte 0x06013000\n\
_080217E0: .4byte Pal_MineFx\n\
_080217E4: .4byte SpritAnim_MineFx\n\
_080217E8: .4byte ProcScr_MineFx\n\
	.syntax divided\n\
");
}

#endif
