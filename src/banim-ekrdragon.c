#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "util.h"
#include "anime.h"
#include "banim.h"
#include "banim_ekrdragon.h"

void ResetEkrDragonStatus(void)
{
    struct EkrDragonStatus * dstat;

    dstat = &gEkrDragonStatusLeft;
    dstat->type = 0;
    dstat->attr = 0;
    dstat->proc = NULL;
    dstat->unk08 = 0;
    dstat->anim = NULL;

    dstat = &gEkrDragonStatusRight;
    dstat->type = 0;
    dstat->attr = 0;
    dstat->proc = NULL;
    dstat->unk08 = 0;
    dstat->anim = NULL;
}

struct EkrDragonStatus * GetEkrDragonStatus(struct Anim * anim)
{
    if (GetAnimPosition(anim) == EKR_POS_L)
        return &gEkrDragonStatusLeft;
    else
        return &gEkrDragonStatusRight;
}

u16 GetEkrDragonStatusAttr(struct Anim * anim)
{
    return GetEkrDragonStatus(anim)->attr;
}

void AddEkrDragonStatusAttr(struct Anim * anim, u16 attr_bitfile)
{
    GetEkrDragonStatus(anim)->attr |= attr_bitfile;
}

u32 GetEkrDragonStatusType(struct Anim * anim)
{
    return GetEkrDragonStatusType_(anim);
}

u32 GetEkrDragonStatusType_(struct Anim * anim)
{
    return GetEkrDragonStatus(anim)->type;
}

void AddEkrDragonStatusType(struct Anim * anim, u16 type_bitfile)
{
    GetEkrDragonStatus(anim)->type |= type_bitfile;
}

int CheckInEkrDragon(void)
{
    if (GetEkrDragonStatusType(gEkrDragonStatusLeft.anim) != 0)
        return true;

    if (GetEkrDragonStatusType(gEkrDragonStatusRight.anim) != 0)
        return true;

    return false;
}

void EkrDragonTmCpyHFlip(int x, int y)
{
    int ix, iy;

    if (CheckInEkrDragon() == false)
        return;

    ix = x >> 3;
    iy = y >> 3;

    EfxTmCpyExtHFlip(gEkrTsaBuffer, -1,
        EFX_TILEMAP_LOC(gEfxFrameTmap, ix, iy),
        EFX_BG_WIDTH,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, 6, 0);
}

void EkrDragonTmCpyExt(int x, int y)
{
    int _x, _y;
    int tmp1, tmp2, tmp3;
    u16 * buf;

    if (CheckInEkrDragon() == false)
        return;

    _x = x >> 3;
    tmp3 = 7;
    _y = y >> 3;

    SetBgOffset(BG_3, x & tmp3, y & tmp3);

    buf = gEfxFrameTmap + 0x21 + _x;
    buf += 66 * _y;

    EfxTmCpyExt(
        buf,
        EFX_BG_WIDTH,
        gBg3Tm,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, 32, -1, -1);

    EnableBgSync(BG3_SYNC_BIT);
}

void EkrDragonTmCpyWithDistance(void)
{
    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        EkrDragonTmCpyHFlip(0xF8, 0);
        break;

    case EKR_DISTANCE_FAR:
        EkrDragonTmCpyHFlip(0xC0, 0);
        break;

    case EKR_DISTANCE_FARFAR:
        EkrDragonTmCpyHFlip(-0x10, 0);
        break;

    default:
        break;
    }
}

bool EkrDragonIntroDone(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_BANIMFX_PREPARED)
        return true;
    else
        return false;
}

bool CheckEkrDragonEndingDone(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_END)
        return true;
    else
        return false;
}

/**
 * EkrDragonFx
 */

struct ProcCmd CONST_DATA ProcScr_EkrDragon[] = {
    PROC_19,
    PROC_REPEAT(EkrDragon_Preparefx),
    PROC_REPEAT(EkrDragon_CustomBgFadeIn),
    PROC_REPEAT(EkrDragon_080655A0),
    PROC_REPEAT(EkrDragon_08065660),
    PROC_REPEAT(EkrDragon_080656D8),
    PROC_REPEAT(EkrDragon_0806574C),
    PROC_REPEAT(EkrDragon_080657D4),
    PROC_REPEAT(EkrDragon_080658F8),
    PROC_REPEAT(EkrDragon_08065AB0),
    PROC_REPEAT(EkrDragon_08065BA0),
    PROC_REPEAT(EkrDragon_08065BC0),
    PROC_REPEAT(EkrDragon_08065C14),
    PROC_REPEAT(EkrDragon_08065C34),
    PROC_REPEAT(EkrDragon_08065CC8),
    PROC_REPEAT(EkrDragon_08065D20),
    PROC_END,
};

void NewEkrDragon(struct Anim * anim)
{
    struct EkrDragonStatus * dstat = GetEkrDragonStatus(anim);
    struct ProcEkrDragon * proc = Proc_Start(ProcScr_EkrDragon, PROC_TREE_3);

    dstat->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    dstat->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
}

void SetEkrDragonExit(struct Anim * anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_BANIMFINISH);
}

void SetEkrDragonDead(struct Anim * anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_DEAD);
}

bool CheckEkrDragonDead(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);
    if (attr & EKRDRGON_ATTR_DEAD)
        return true;
    else
        return false;
}

void InitEkrDragonStatus(void)
{
    if (CheckInEkrDragon() != false)
        SetAnimStateHidden(POS_L);
}

void EkrDragonUpdateFlashingUnit(struct Anim * anim)
{
    if (CheckInEkrDragon() != false)
    {
        if (GetAnimPosition(anim) == EKR_POS_L)
            CpuFastCopy(Pal_EkrDragon, PAL_BG(0x6), 0x20);
        else
            CpuFastCopy(Pal_EkrDragon, PAL_BG(0x7), 0x20);

        EnablePalSync();
    }
}

void EkrDragonUpdatePal_080654C8(struct Anim * anim)
{
    if (CheckInEkrDragon() != false)
    {
        if (GetAnimPosition(anim) == EKR_POS_L)
            CpuFastCopy(Pal_EkrDragon_082E6C60, PAL_BG(0x6), 0x20);
        else
            CpuFastCopy(Pal_EkrDragon_082E6C60, PAL_BG(0x7), 0x20);

        EnablePalSync();
    }
}

void EkrDragonUpdatePal_08065510(int ref)
{
    CpuFastCopy(Pal_EkrDragon_082EB510, PAL_BG(0x4), 0x20);
    EfxPalBlackInOut(gPal, 4, 1, ref);
}

void EkrDragon_Preparefx(struct ProcEkrDragon * proc)
{
    EkrPrepareBanimfx(proc->anim, 0x8A);    /* battle anim idx */
    sub_08065D38(proc->anim);
    gEkrSpellAnimIndex[POS_L] = 0x13;       /* spell anim idx */
    Proc_Break(proc);
}

void EkrDragon_CustomBgFadeIn(struct ProcEkrDragon * proc)
{
    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
