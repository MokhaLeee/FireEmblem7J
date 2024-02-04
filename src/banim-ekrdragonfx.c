#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "util.h"
#include "bm.h"
#include "map.h"
#include "unit.h"
#include "anime.h"
#include "banim.h"
#include "banim_ekrdragon.h"

struct ProcCmd CONST_DATA ProcScr_EkrDragonBaseHide[] = {
    PROC_NAME_DEBUG("ekrDragonBaseHide"),
    PROC_REPEAT(EkrDragonBaseHide_Loop),
    PROC_REPEAT(EkrDragonBaseHide_Nop),
    PROC_END,
};

ProcPtr NewEkrDragonBaseHide(struct Anim * anim)
{
    struct ProcEkrDragonFx * proc =
        Proc_Start(ProcScr_EkrDragonBaseHide, PROC_TREE_3);

    proc->anim = anim;
    proc->done = false;
    proc->timer = 0;
    return proc;
}

void EkrDragonBaseHide_Loop(struct ProcEkrDragonFx * proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0, 0x10, proc->timer, 8);
    CpuFastCopy(gEkrBgPaletteBackup, PAL_BG(4), sizeof(gEkrBgPaletteBackup));
    EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
    EnablePalSync();

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        proc->done = true;
        Proc_Break(proc);
    }
}

void EkrDragonBaseHide_Nop(struct ProcEkrDragonFx * proc)
{
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_EkrDragonBaseAppear[] = {
    PROC_NAME_DEBUG("ekrDragonBaseAppear"),
    PROC_REPEAT(EkrDragonBaseAppear_Loop),
    PROC_REPEAT(EkrDragonBaseAppear_Nop),
    PROC_END
};

ProcPtr NewEkrDragonBaseAppear(struct Anim * anim)
{
    struct ProcEkrDragonFx * proc =
        Proc_Start(ProcScr_EkrDragonBaseAppear, PROC_TREE_3);

    proc->anim = anim;
    proc->done = false;
    proc->timer = 0;
    FillBGRect(gBg2Tm, 0x20, 0x20, 0, 0);
    sub_8055718(&EkrMainMiniConf_0201FAD0);
    CpuFastCopy(PAL_BG(4), gEkrBgPaletteBackup, 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, 0x10);
    return proc;
}

void EkrDragonBaseAppear_Loop(struct ProcEkrDragonFx * proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0x10, 0, proc->timer, 8);
    CpuFastCopy(gEkrBgPaletteBackup, PAL_BG(4), 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
    EnablePalSync();

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        proc->done = true;
        Proc_Break(proc);
    }
}

void EkrDragonBaseAppear_Nop(struct ProcEkrDragonFx * proc)
{
    Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonTunkFace[] = {
    PROC_NAME_DEBUG("ekrDragonTunkFace"),
    PROC_REPEAT(EkrDragonTunkFace_Loop),
    PROC_END,
};

ProcPtr NewEkrDragonTunkFace(struct Anim * anim)
{
    struct Anim * face_anim;
    struct ProcEkrDragonFx * proc =
        Proc_Start(ProcScr_EkrDragonTunkFace, PROC_TREE_3);

    proc->anim = anim;

    SpellFx_RegisterObjGfx(Img_EkrDragonTunkFace, 0x2000);
    SpellFx_RegisterObjPal(Pal_EkrDragonHead, 0x20);

    face_anim = AnimCreate(AnimScr_EkrDragonHead, 20);
    face_anim->oam2Base = 0x2840;

    proc->x = 0x180;
    face_anim->xPosition = 0x180;

    proc->y = 0x180;
    face_anim->yPosition = 0x180;

    proc->anim2 = face_anim;
    proc->done = false;
    return proc;
}

void EkrDragonTunkFace_Loop(struct ProcEkrDragonFx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->x;
    anim->yPosition = proc->y;

    if (proc->done == true)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_EfxDragonDeadFallBody[] = {
    PROC_19,
    PROC_SET_END_CB(EfxDragonDeadFallBody_CallBack),
    PROC_REPEAT(EfxDragonDeadFallBody_Loop1),
    PROC_REPEAT(EfxDragonDeadFallBody_Loop2),
    PROC_REPEAT(EfxDragonDeadFallBody_Blocking),
    PROC_END,
};

ProcPtr NewEfxDragonDeadFallBody(struct Anim * anim)
{
    const AnimScr * scr;
    struct Anim * anim2;
    struct ProcEkrDragonFx * proc;

    proc = Proc_Start(ProcScr_EfxDragonDeadFallBody, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScr_EfxDragonDeadFallBody;
    SpellFx_RegisterObjPal(Pal_EkrDragonHead, 0x20);
    SpellFx_RegisterObjGfx(Img_EkrDragonTunkFace, 0x2000);

    anim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;
    proc->timer = 0;
    return proc;
}

void EfxDragonDeadFallBody_CallBack(struct ProcEkrDragonFx * proc)
{
    AnimDelete(proc->anim2);
}

void EfxDragonDeadFallBody_Loop1(struct ProcEkrDragonFx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->x;
    anim->yPosition = proc->y;

    if (++proc->timer == 0x10C)
    {
        proc->timer = 0;

        anim->pScrStart = AnimScr_EfxDragonDeadFallBody2;
        anim->pScrCurrent = AnimScr_EfxDragonDeadFallBody2;
        anim->timer = 0;

        SpellFx_RegisterObjPal(Pal_EkrDragonHead, 0x20);
        SpellFx_RegisterObjGfx(Img_EkrDragonSpark, 0x2000);
        Proc_Break(proc);
    }
}

void EfxDragonDeadFallBody_Loop2(struct ProcEkrDragonFx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->x;
    anim->yPosition = proc->y;

    if (++proc->timer == 0x2E)
    {
        SpellFx_RegisterObjPal(Pal_EkrDragonHead, 0x20);
        SpellFx_RegisterObjGfx(Img_EkrDragonTunkFace, 0x2000);
        Proc_Break(proc);
    }
}

void EfxDragonDeadFallBody_Blocking(struct ProcEkrDragonFx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->x;
    anim->yPosition = proc->y;
}

struct ProcCmd CONST_DATA ProcScr_EfxDragonDeadFallHeadFx[] = {
    PROC_19,
    PROC_SET_END_CB(EfxDragonDeadFallHead_CallBack),
    PROC_REPEAT(EfxDragonDeadFallHead_Loop1),
    PROC_REPEAT(EfxDragonDeadFallHead_Loop2),
    PROC_END,
};

ProcPtr NewEfxDragonDeadFallHeadFx(struct Anim * anim)
{
    const AnimScr * scr;
    struct Anim * anim2;
    struct ProcEkrDragonFx * proc;

    proc = Proc_Start(ProcScr_EfxDragonDeadFallHeadFx, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScr_EfxDragonDeadFallHeadFx;
    SpellFx_RegisterObjPal(Pal_EkrDragonHead, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDragonDeadFallHead, 0x2000);

    anim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;
    proc->timer = 0;
    return proc;
}

void EfxDragonDeadFallHead_CallBack(struct ProcEkrDragonFx * proc)
{
    AnimDelete(proc->anim2);
}

void EfxDragonDeadFallHead_Loop1(struct ProcEkrDragonFx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->x;
    anim->yPosition = proc->y;

    if (++proc->timer == 0x32)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxDragonDeadFallHead_Loop2(struct ProcEkrDragonFx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->x;
    anim->yPosition = proc->y;

    if (++proc->timer == 0x4)
    {
        proc->timer = 0;

        anim->pScrStart = AnimScr_EfxDragonDeadFallHeadFx;
        anim->pScrCurrent = AnimScr_EfxDragonDeadFallHeadFx;
        anim->timer = 0;
    }
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonFlashingWingBg[] = {
    PROC_19,
    PROC_REPEAT(EkrDragonFlashingWingBg_Loop),
    PROC_END,
};

ProcPtr NewEkrDragonFlashingWingBg(struct Anim * anim)
{
    struct ProcEkrDragonStatusFlashing * proc;

    proc = Proc_Start(ProcScr_EkrDragonFlashingWingBg, PROC_TREE_4);
    proc->fxtype = 0;
    proc->anim = anim;
    proc->round_cur = anim->currentRoundType;
    return proc;
}

void EkrDragonFlashingWingBg_Loop(struct ProcEkrDragonStatusFlashing * proc)
{
    s16 ret;

    if (GetEkrDragonStatusAttr(proc->anim) & EKRDRGON_ATTR_BANIMFX_PREPARED && GetUnitEfxDebuff(proc->anim) != UNIT_STATUS_NONE)
        return;

    switch (proc->fxtype) {
    case 0:
        proc->timer = 0;
        proc->frame = 0;
        proc->conf = FrameLut_EkrDragonWingFlashingNormalAtk;
        proc->pal = Pals_EkrDragonFlashingWingBg;
        proc->fxtype = 100;
        break;

    /* Critical attack ? */
    case 1:
        proc->timer = 0;
        proc->frame = 0;
        proc->conf = FrameLut_EkrDragonWingFlashingCriticalAtk;
        proc->pal = Pals_EkrDragonFlashingWingBg;
        proc->fxtype = 100;
        StartSpellThing_MagicQuake(proc->anim, 60, 10);
        break;

    default:
        break;
    }

    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, (const s16 *)proc->conf);
    if (ret >= 0)
    {
        const u16 * pal = proc->pal;
        CpuFastCopy(&PAL_BUF_COLOR(pal, ret, 0), PAL_BG(6), 0x20);
        EnablePalSync();
    }
    else if (ret == -6)
    {
        proc->fxtype = 0;
    }
    else if (ret == -5)
    {
        NewEfxFlashBgWhite(proc->anim, 5);
        proc->frame++;
    }

    if (proc->anim->currentRoundType != proc->round_cur)
    {
        register int rtype asm("r0");

        rtype = proc->anim->currentRoundType;
        /* Config round switch */
        switch (rtype) {
        case ANIM_ROUND_CRIT_CLOSE:
        case ANIM_ROUND_CRIT_FAR:
            proc->fxtype = 1;
            break;

        default:
            proc->fxtype = 0;
            break;
        }
    }
    proc->round_cur = proc->anim->currentRoundType;
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonFlashingWingObj[] = {
    PROC_19,
    PROC_REPEAT(EkrDragonFlashingWingObj_Loop),
    PROC_END,
};

ProcPtr NewEkrDragonFlashingWingObj(struct Anim * anim)
{
    struct ProcEkrDragonStatusFlashing * proc;

    proc = Proc_Start(ProcScr_EkrDragonFlashingWingObj, PROC_TREE_4);
    proc->fxtype = 0;
    proc->anim = anim;
    proc->round_cur = anim->currentRoundType;
    return proc;
}

void EkrDragonFlashingWingObj_Loop(struct ProcEkrDragonStatusFlashing * proc)
{
    s16 ret;

    if (GetEkrDragonStatusAttr(proc->anim) & EKRDRGON_ATTR_BANIMFX_PREPARED && GetUnitEfxDebuff(proc->anim) != UNIT_STATUS_NONE)
        return;

    switch (proc->fxtype) {
    case 0:
        proc->timer = 0;
        proc->frame = 0;
        proc->conf = FrameLut_EkrDragonFlashingWingObjNormalAtk;
        proc->pal = Pals_EkrDragonFlashingWingObj;
        proc->fxtype = 100;
        break;

    /* Critical attack ? */
    case 1:
        proc->timer = 0;
        proc->frame = 0;
        proc->conf = FrameLut_EkrDragonFlashingWingObjCriticalAtk;
        proc->pal = Pals_EkrDragonFlashingWingObj;
        proc->fxtype = 100;
        break;

    default:
        break;
    }

    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, (const s16 *)proc->conf);
    if (ret >= 0)
    {
        const u16 * pal = proc->pal;
        CpuFastCopy(&PAL_BUF_COLOR(pal, ret, 0), PAL_OBJ(7), 0x20);
        EnablePalSync();
    }
    else if (ret == -6)
    {
        proc->fxtype = 0;
    }
    else if (ret == -5)
    {
        NewEfxFlashBgWhite(proc->anim, 5);
        proc->frame++;
    }

    if (proc->anim->currentRoundType != proc->round_cur)
    {
        register int rtype asm("r0");

        rtype = proc->anim->currentRoundType;
        /* Config round switch */
        switch (rtype) {
        case ANIM_ROUND_CRIT_CLOSE:
        case ANIM_ROUND_CRIT_FAR:
            proc->fxtype = 1;
            break;

        default:
            proc->fxtype = 0;
            break;
        }
    }
    proc->round_cur = proc->anim->currentRoundType;
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonFireBG2[] = {
    PROC_19,
    PROC_SET_END_CB(EkrDragonFireBG2_CallBackNop),
    PROC_REPEAT(EkrDragonFireBG2_Blocking),
    PROC_END,
};

ProcPtr NewEkrDragonFireBG2(struct Anim * anim)
{
    struct ProcEkrDragonFx * proc;

    proc = Proc_Start(ProcScr_EkrDragonFireBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    LZ77UnCompVram(Img_EkrDragonFireBG2, (void *)0x06005000);
    LZ77UnCompWram(Tsa_EkrDragonFireBG2, gEkrTsaBuffer);
    CpuFastCopy(Pal_EkrDragonFireBG2, PAL_BG(4), 0x20);
    TmFill(gBg2Tm, 0x1F);
    EfxTmCpyBG(gEkrTsaBuffer, gBg2Tm, 0x20, 0x20, 4, 0x280);
    EnableBgSync(BG2_SYNC_BIT);
    return proc;
}

void EkrDragonFireBG2_CallBackNop(struct ProcEkrDragonFx * proc)
{
    return;
}

void EkrDragonFireBG2_Blocking(struct ProcEkrDragonFx * proc)
{
    return;
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonBg2ScrollHandler[] = {
    PROC_19,
    PROC_REPEAT(EkrDragonBg2ScrollHandler_Loop),
    PROC_END,
};

ProcPtr NewEkrDragonBg2ScrollHandler(void)
{
    struct ProcEkrDragonFx * proc;

    proc = Proc_Start(ProcScr_EkrDragonBg2ScrollHandler, PROC_TREE_3);
    proc->timer = 0;
}

void EkrDragonBg2ScrollHandler_Loop(struct ProcEkrDragonFx * proc)
{
    u32 i;
    u16 * buf;

    if (gEkrBg2ScrollFlip == 0)
        buf = gpBg2ScrollOffsetTable1;
    else
        buf = gpBg2ScrollOffsetTable2;

    for (i = 0; i < 160; i++)
    {
        int val = SIN_Q12(i * 2 + proc->timer);
        *buf++ = (val >> 10) + 4;
    }
    proc->timer = proc->timer + 2;
}

void EkrDragonBg2Scroll_OnVBlank(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
    {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
    }
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonBg2ScrollExt[] = {
    PROC_19,
    PROC_SET_END_CB(EkrDragonBg2ScrollExt_CallBack),
    PROC_REPEAT(EkrDragonBg2ScrollExt_Loop),
    PROC_END,
};

/* Quite strange: https://decomp.me/scratch/be5w2 */
#if NONMATCHING

ProcPtr NewEkrDragonBg2ScrollExt(struct Anim * anim)
{
    u32 i;
    u16 * buf;
    struct ProcEkrDragonFx * proc;

    buf = gpBg2ScrollOffsetTable2;
    for (i = 0; i < 160; buf++, i++)
        *buf = 0;

    buf = gpBg2ScrollOffsetTable1;
    for (i = 0; i < 160; buf++, i++)
        *buf = 0;

    gEkrBg2ScrollFlip = 0;
    gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
    gpBg2ScrollOffset = gpBg2ScrollOffsetTable2;

    SetOnHBlankA(EkrDragonBg2Scroll_OnVBlank);

    proc = Proc_Start(ProcScr_EkrDragonBg2ScrollExt, PROC_TREE_VSYNC);
    proc->timer = 0;
    return proc;
}

#else

NAKEDFUNC
ProcPtr NewEkrDragonBg2ScrollExt(struct Anim * anim)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	ldr r2, _08066464 @ =gpBg2ScrollOffsetTable2\n\
	movs r1, #0\n\
	adds r0, r2, #0\n\
	ldr r4, _08066468 @ =gpBg2ScrollOffsetTable1\n\
	ldr r5, _0806646C @ =gEkrBg2ScrollFlip\n\
	ldr r6, _08066470 @ =gpBg2ScrollOffsetStart\n\
	ldr r7, _08066474 @ =gpBg2ScrollOffset\n\
	ldr r3, _08066478 @ =EkrDragonBg2Scroll_OnVBlank\n\
	mov ip, r3\n\
	movs r3, #0\n\
_0806642A:\n\
	strh r3, [r2]\n\
	adds r2, #2\n\
	adds r1, #1\n\
	cmp r1, #0x9f\n\
	bls _0806642A\n\
	adds r2, r4, #0\n\
	movs r1, #0\n\
	movs r3, #0\n\
_0806643A:\n\
	strh r3, [r2]\n\
	adds r2, #2\n\
	adds r1, #1\n\
	cmp r1, #0x9f\n\
	bls _0806643A\n\
	movs r4, #0\n\
	str r4, [r5]\n\
	str r0, [r6]\n\
	str r0, [r7]\n\
	mov r0, ip\n\
	bl SetOnHBlankA\n\
	ldr r0, _0806647C @ =ProcScr_EkrDragonBg2ScrollExt\n\
	movs r1, #0\n\
	bl Proc_Start\n\
	strh r4, [r0, #0x2c]\n\
	pop {r4, r5, r6, r7}\n\
	pop {r1}\n\
	bx r1\n\
	.align 2, 0\n\
_08066464: .4byte gpBg2ScrollOffsetTable2\n\
_08066468: .4byte gpBg2ScrollOffsetTable1\n\
_0806646C: .4byte gEkrBg2ScrollFlip\n\
_08066470: .4byte gpBg2ScrollOffsetStart\n\
_08066474: .4byte gpBg2ScrollOffset\n\
_08066478: .4byte EkrDragonBg2Scroll_OnVBlank\n\
_0806647C: .4byte ProcScr_EkrDragonBg2ScrollExt\n\
	.syntax divided\n\
");
}

#endif

void EkrDragonBg2ScrollExt_CallBack(void)
{
    SetOnHBlankA(NULL);
}

void EkrDragonBg2ScrollExt_Loop(void)
{
    if (gEkrBg2ScrollFlip == 1)
    {
        gEkrBg2ScrollFlip = 0;
        gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
    }
    else
    {
        gEkrBg2ScrollFlip = 1;
        gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
    }
    gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonBg3HfScrollHandler[] = {
    PROC_19,
    PROC_REPEAT(EkrDragonBg3HfScrollHandler_Loop),
    PROC_END,
};

ProcPtr NewEkrDragonBg3HfScrollHandler(int duration, int step , int speed, int d)
{
    struct ProcEkrDragonIntroFx * proc;

    proc = Proc_Start(ProcScr_EkrDragonBg3HfScrollHandler, PROC_TREE_3);
    proc->timer = 0;
    proc->timer2 = 0;

    proc->duration = duration;
    proc->step = step;
    proc->speed = speed;
    proc->unk50 = d;
    return proc;
}

void EkrDragonBg3HfScrollHandler_Loop(struct ProcEkrDragonIntroFx * proc)
{
    u32 i, k;
    u16 * buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList1;
    else
        buf = gpBg1ScrollOffsetList2;

    proc->timer2 = proc->timer2 + proc->unk50;

    k = 0;
    for (i = 0; i < 120; i++)
    {
        int ix;
        u8 _k;

        k = k + proc->step;
        _k = k >> 8;
        ix = gUnk_08C4A008[_k] * proc->speed;
        ix = ix >> 8;

        *buf++ = ix + 4 + gDispIo.bg_off[3].x;
    }

    if (++proc->timer == proc->duration)
        Proc_End(proc);
}

void EkrDragonBg3HfScroll_OnVBlank(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
    {
        REG_BG3HOFS = *gpBg1ScrollOffset++;
    }
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonBg3HfScroll[] = {
    PROC_19,
    PROC_REPEAT(EkrDragonBg3HfScroll_Nop),
    PROC_REPEAT(EkrDragonBg3HfScroll_Loop),
    PROC_END,
};

#if NONMATCHING

void NewEkrDragonBg3HfScroll(int duration, u16 off_base)
{
    u32 i;
    u16 * buf;
    struct ProcEkrDragonIntroFx * proc;

    buf = gpBg1ScrollOffsetList2;
    for (i = 0; i < 160; buf++, i++)
        *buf = off_base;

    buf = gpBg1ScrollOffsetList1;
    for (i = 0; i < 160; buf++, i++)
        *buf = off_base;

    gEkrBg1ScrollFlip = 0;
    gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
    gpBg1ScrollOffset = gpBg1ScrollOffsetList2;

    SetOnHBlankA(EkrDragonBg3HfScroll_OnVBlank);

    proc = Proc_Start(ProcScr_EkrDragonBg3HfScroll, PROC_TREE_VSYNC);
    proc->timer = 0;
    proc->frame = duration;
}

#else

NAKEDFUNC
void NewEkrDragonBg3HfScroll(int a, u16 b)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	mov r8, r0\n\
	lsls r1, r1, #0x10\n\
	lsrs r1, r1, #0x10\n\
	ldr r3, _08066618 @ =gpBg1ScrollOffsetList2\n\
	movs r2, #0\n\
	adds r0, r3, #0\n\
	ldr r4, _0806661C @ =gpBg1ScrollOffsetList1\n\
	ldr r7, _08066620 @ =gEkrBg1ScrollFlip\n\
	ldr r5, _08066624 @ =gpBg1ScrollOffsetStart\n\
	mov ip, r5\n\
	ldr r5, _08066628 @ =gpBg1ScrollOffset\n\
	ldr r6, _0806662C @ =EkrDragonBg3HfScroll_OnVBlank\n\
_080665D6:\n\
	strh r1, [r3]\n\
	adds r3, #2\n\
	adds r2, #1\n\
	cmp r2, #0x9f\n\
	bls _080665D6\n\
	adds r3, r4, #0\n\
	movs r2, #0\n\
_080665E4:\n\
	strh r1, [r3]\n\
	adds r3, #2\n\
	adds r2, #1\n\
	cmp r2, #0x9f\n\
	bls _080665E4\n\
	movs r4, #0\n\
	str r4, [r7]\n\
	mov r1, ip\n\
	str r0, [r1]\n\
	str r0, [r5]\n\
	adds r0, r6, #0\n\
	bl SetOnHBlankA\n\
	ldr r0, _08066630 @ =ProcScr_EkrDragonBg3HfScroll\n\
	movs r1, #0\n\
	bl Proc_Start\n\
	strh r4, [r0, #0x2c]\n\
	mov r5, r8\n\
	str r5, [r0, #0x44]\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08066618: .4byte gpBg1ScrollOffsetList2\n\
_0806661C: .4byte gpBg1ScrollOffsetList1\n\
_08066620: .4byte gEkrBg1ScrollFlip\n\
_08066624: .4byte gpBg1ScrollOffsetStart\n\
_08066628: .4byte gpBg1ScrollOffset\n\
_0806662C: .4byte EkrDragonBg3HfScroll_OnVBlank\n\
_08066630: .4byte ProcScr_EkrDragonBg3HfScroll\n\
	.syntax divided\n\
");
}

#endif

void EkrDragonBg3HfScroll_Nop(struct ProcEkrDragonIntroFx * proc)
{
    Proc_Break(proc);
}

void EkrDragonBg3HfScroll_Loop(struct ProcEkrDragonIntroFx * proc)
{
    if (gEkrBg1ScrollFlip == 1)
    {
        gEkrBg1ScrollFlip = 0;
        gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
    }
    else
    {
        gEkrBg1ScrollFlip = 1;
        gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
    }
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart;

    if (++proc->timer == proc->duration)
    {
        SetOnHBlankA(NULL);
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_EkrDragonFxMain[] = {
    PROC_19,
    PROC_REPEAT(EkrDragonFxMainHandler),
    PROC_END,
};

CONST_DATA const u16 * Tsas_EkrDragon_08C48874[] = {
    (u16 *) Tsa_EkrDragon_MainBg,
    (u16 *) Tsa_EkrDragon_082E7170,
};

ProcPtr NewEkrDragonFxMain(struct Anim * anim)
{
    struct ProcEkrDragonFx * proc;
    proc = Proc_Start(ProcScr_EkrDragonFxMain, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->duration = 0;
    proc->frame = 0;
    proc->conf = NULL;
    proc->fx = Tsas_EkrDragon_08C48874;
    proc->round_cur = 0x1000;
}
