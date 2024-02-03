#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "util.h"
#include "bm.h"
#include "map.h"
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
    proc->finished = false;
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
        proc->finished = true;
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
    proc->finished = false;
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
        proc->finished = true;
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
    proc->finished = false;
    return proc;
}

void EkrDragonTunkFace_Loop(struct ProcEkrDragonFx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->x;
    anim->yPosition = proc->y;

    if (proc->finished == true)
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

struct ProcCmd CONST_DATA ProcScr_EkrDragonStatusFlashing[] = {
    PROC_19,
    PROC_REPEAT(EkrDragonStatusFlashing_Loop),
    PROC_END,
};

ProcPtr NewEkrDragonStatusFlashing(struct Anim * anim)
{
    const AnimScr * scr;
    struct Anim * anim2;
    struct ProcEkrDragonFx * proc;

    proc = Proc_Start(ProcScr_EkrDragonStatusFlashing, PROC_TREE_4);
    proc->finished = false;
    proc->anim = anim;
    proc->round_cur = anim->currentRoundType;
    return proc;
}
