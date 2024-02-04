#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "util.h"
#include "bm.h"
#include "map.h"
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
    PROC_NAME_DEBUG("ekrDragon"),
    PROC_REPEAT(EkrDragon_Preparefx),
    PROC_REPEAT(EkrDragon_CustomBgFadeIn),
    PROC_REPEAT(EkrDragon_StartDragonTailIntro),
    PROC_REPEAT(EkrDragon_DragonTailDisplay),
    PROC_REPEAT(EkrDragon_StartMainBodyIntro),
    PROC_REPEAT(EkrDragon_PreMainBodyIntro),
    PROC_REPEAT(EkrDragon_StartMainBodyFallIn),
    PROC_REPEAT(EkrDragon_WaitMainBodyFallIn),
    PROC_REPEAT(EkrDragon_PreBattleSpark),
    PROC_REPEAT(EkrDragon_TriggerIntroDone),
    PROC_REPEAT(EkrDragon_InBattleIDLE),
    PROC_REPEAT(EkrDragon_WaitForFadeOut),
    PROC_REPEAT(EkrDragon_ReloadTerrainEtc),
    PROC_REPEAT(EkrDragon_ReloadCustomBgAndFadeOut),
    PROC_REPEAT(EkrDragon_TriggerEnding),
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

void SetEfxDragonDeadFallHead(struct Anim * anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_DEAD);
}

bool CheckEfxDragonDeadFallHead(struct Anim * anim)
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

void BanimSetFrontPaletteForDragon(struct Anim * anim)
{
    if (CheckInEkrDragon() != false)
    {
        if (GetAnimPosition(anim) == EKR_POS_L)
            CpuFastCopy(Pals_EkrDragonFlashingWingBg, PAL_BG(0x6), 0x20);
        else
            CpuFastCopy(Pals_EkrDragonFlashingWingBg, PAL_BG(0x7), 0x20);

        EnablePalSync();
    }
}

void EkrDragonUpdatePal_08065510(int ref)
{
    CpuFastCopy(Pal_EkrDragonFireBG2, PAL_BG(0x4), 0x20);
    EfxPalBlackInOut(gPal, 4, 1, ref);
}

void EkrDragon_Preparefx(struct ProcEkrDragon * proc)
{
    EkrPrepareBanimfx(proc->anim, 0x8A);    /* battle anim idx */
    NewEkrDragonBaseHide(proc->anim);
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

void EkrDragon_StartDragonTailIntro(struct ProcEkrDragon * proc)
{
    /* Display a tail */
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg3_ct.priority = 2;
    gDispIo.bg2_ct.priority = 3;

    LZ77UnCompVram(Img_EkrDragon_082E445C, (void *)0x06008000);
    LZ77UnCompWram(Tsa_EkrDragon_DragonTail, gEkrTsaBuffer);
    CpuFastCopy(Pals_EkrDragonFlashingWingBg, PAL_BG(6), 0x20);

    EfxTmFill(0x001F001F);
    TmFill(gBg3Tm, 0x1F);
    EkrDragonTmCpyHFlip(0, 0x78);
    EkrDragonTmCpyExt(-0xF8, 0);
    EnablePalSync();
    proc->procfx = NewEkrDragonBg3HfScrollHandler(0x78, 0x400, 0x60, 2);
    NewEkrDragonBg3HfScroll(0x78, 0);

    proc->timer = 0;
    proc->terminator = 60;
    Proc_Break(proc);
}

void EkrDragon_DragonTailDisplay(struct ProcEkrDragon * proc)
{
    int x = Interpolate(INTERPOLATE_RSQUARE, -0xF8, -0x18, proc->timer, proc->terminator);
    int y = Interpolate(INTERPOLATE_RSQUARE,     0, 0x140, proc->timer, proc->terminator);

    EkrDragonTmCpyExt(x, y);

    if (++proc->timer == (proc->terminator + 1))
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    if (proc->timer == 15)
        PlaySFX(0xE6, 0x100, 0x78, 0);
}

void EkrDragon_StartMainBodyIntro(struct ProcEkrDragon * proc)
{
    if (++proc->timer != 0x3C)
        return;

    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
    {
        Proc_Break(proc);
        return;
    }

    proc->timer = 0;
    proc->procfx = NewEkrDragonTunkFace(proc->anim);

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        proc->procfx->y = 0x38 - (u16)gEkrBgPosition;
        break;

    case EKR_DISTANCE_FAR:
        proc->procfx->y = -(u16)gEkrBgPosition;
        break;

    default:
        break;
    }

    proc->procfx->unk3C = 0x4C;
    Proc_Break(proc);
}

void EkrDragon_PreMainBodyIntro(struct ProcEkrDragon * proc)
{
    struct ProcEkrDragonIntroFx * procfx = proc->procfx;

    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
    {
        proc->timer = 0;
        NewEfxFlashBgWhite(proc->anim, 10);
        Proc_Break(proc);
        return;
    }

    procfx->x = Interpolate(
        INTERPOLATE_SQUARE,
        procfx->y - 0x30,
        procfx->y,
        proc->timer,
        16);

    procfx->unk3A = Interpolate(
        INTERPOLATE_SQUARE,
        procfx->unk3C - 0x80,
        procfx->unk3C,
        proc->timer,
        16);

    if (++proc->timer == 0x11)
    {
        proc->procfx->unk29 = true;
        proc->timer = 0;
        NewEfxFlashBgWhite(proc->anim, 10);
        Proc_Break(proc);
    }
}

void EkrDragon_StartMainBodyFallIn(struct ProcEkrDragon * proc)
{
    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
    {
        proc->sproc_flashingbg = NewEkrDragonFlashingWingBg(proc->anim);
        proc->sproc_flashingobj = NewEkrDragonFlashingWingObj(proc->anim);
        proc->sproc_bg2scroll = NewEkrDragonBg2ScrollExt(proc->anim);
        proc->sproc_bg2scrollhandle = NewEkrDragonBg2ScrollHandler();
        proc->sproc_bg2fx = NewEkrDragonFireBG2(proc->anim);
        Proc_Break(proc);
        return;
    }

    if (++proc->timer == 10)
    {
        proc->timer = 0;
        proc->terminator = 0x80;
        proc->y_lo = 0x20;
        proc->y_hi = 0;
        proc->procfx = NewEfxDragonDeadFallBody(proc->anim);
        proc->procfx->x = proc->anim->xPosition;
        proc->procfx->unk3A = proc->anim->yPosition - proc->y_lo;
        proc->proc54 = NewEfxQuakePure(8, 0);
        sub_8066CAC(proc->anim, 0x13A);
        LZ77UnCompWram(Tsa_EkrDragon_MainBg, gEkrTsaBuffer);
        CpuFill32(0x001F001F, gEkrTsaBuffer + 0x3C0, 0x80);
        EfxTmFill(0x001F001F);
        TmFill(gBg3Tm, 0x1F);

        EkrDragonTmCpyWithDistance();
        EkrDragonTmCpyExt(gEkrBgPosition, proc->y_lo);

        proc->sproc_flashingbg = NewEkrDragonFlashingWingBg(proc->anim);
        proc->sproc_flashingobj = NewEkrDragonFlashingWingObj(proc->anim);
        proc->sproc_bg2scroll = NewEkrDragonBg2ScrollExt(proc->anim);
        proc->sproc_bg2scrollhandle = NewEkrDragonBg2ScrollHandler();
        proc->sproc_bg2fx = NewEkrDragonFireBG2(proc->anim);

        PlaySFX(0x2F0, 0x100, 0x78, 0);
        Proc_Break(proc);
    }
}

void EkrDragon_WaitMainBodyFallIn(struct ProcEkrDragon * proc)
{
    s16 x, y;
    int ret;

    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
    {
        Proc_Break(proc);
        return;
    }

    ret = Interpolate(
        INTERPOLATE_LINEAR,
        proc->y_lo,
        proc->y_hi,
        proc->timer,
        proc->terminator);

    proc->procfx->x = proc->anim->xPosition;
    proc->procfx->unk3A = proc->anim->yPosition - ret;

    proc->procfx->x = proc->procfx->x - gEkrBg2QuakeVec.x;
    proc->procfx->unk3A = proc->procfx->unk3A - gEkrBg2QuakeVec.y;

    x = (gEkrXPosReal[POS_R] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    y = gEkrYPosReal[POS_R] - gEkrBg2QuakeVec.y;
    SetEkrFrontAnimPostion(POS_R, x, y);

    EkrDragonTmCpyExt(
        gEkrBgPosition + gEkrBg2QuakeVec.x,
        ret + gEkrBg2QuakeVec.y);

    SetBgOffset(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    SetBgOffset(
        BG_0,
        gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
        gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_0804CC8C(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    if (++proc->timer == (proc->terminator + 1))
    {
        proc->procfx->x = proc->anim->xPosition;
        proc->procfx->unk3A = proc->anim->yPosition - ret;

        SetEkrFrontAnimPostion(
            POS_R,
            gEkrXPosReal[POS_R] - gEkrBgPosition,
            gEkrYPosReal[POS_R]);

        EkrDragonTmCpyExt(gEkrBgPosition, ret);
        SetBgOffset(BG_2, 0, 0);
        SetBgOffset(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        EkrGauge_0804CC8C(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        Proc_End(proc->proc54);
        Proc_Break(proc);
    }
}

void EkrDragon_PreBattleSpark(struct ProcEkrDragon * proc)
{
    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
    {
        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        LZ77UnCompWram(Tsa_EkrDragon_MainBg, gEkrTsaBuffer);
        EfxTmFill(0x001F001F);
        TmFill(gBg3Tm, 0x1F);
        EkrDragonTmCpyWithDistance();
        EkrDragonTmCpyExt(gEkrBgPosition, 0);
        Proc_Break(proc);
        return;
    }

    if (++proc->timer == 0x10D)
    {
        sub_8066DA0(proc->procfx, 60, 9);
        PlaySFX(0x2F1, 0x100, 0x78, 0);
    }

    if (proc->timer == 0x195)
    {
        proc->timer = 0;
        Proc_End(proc->procfx);

        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        LZ77UnCompWram(Tsa_EkrDragon_MainBg, gEkrTsaBuffer);
        EfxTmFill(0x001F001F);
        TmFill(gBg3Tm, 0x1F);
        EkrDragonTmCpyWithDistance();
        EkrDragonTmCpyExt(gEkrBgPosition, 0);
        Proc_Break(proc);
    }
}

void EkrDragon_TriggerIntroDone(struct ProcEkrDragon * proc)
{
    proc->mainfxproc = NewEkrDragonFxMain(proc->anim);
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

void EkrDragon_InBattleIDLE(struct ProcEkrDragon * proc)
{
    u16 attr = GetEkrDragonStatusAttr(proc->anim);
    if (attr & EKRDRGON_ATTR_BANIMFINISH)
    {
        proc->timer = 0;
        Proc_End(proc->sproc_flashingbg);
        Proc_End(proc->sproc_flashingobj);
        Proc_End(proc->mainfxproc);

        if (!CheckEfxDragonDeadFallHead(proc->anim))
            proc->mainfxproc = NewEkrDragonBodyBlack(proc->anim);
        else
            proc->mainfxproc = NewEkrDragonTunk(proc->anim);

        Proc_Break(proc);
    }
}

void EkrDragon_WaitForFadeOut(struct ProcEkrDragon * proc)
{
    if (proc->mainfxproc->done == true)
    {
        Proc_End(proc->mainfxproc);
        Proc_Break(proc);
    }
}

void EkrDragon_ReloadTerrainEtc(struct ProcEkrDragon * proc)
{
    Proc_End(proc->sproc_bg2scroll);
    Proc_End(proc->sproc_bg2scrollhandle);
    Proc_End(proc->sproc_bg2fx);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetAnimStateHidden(GetAnimPosition(proc->anim));
    gEkrPairSideVaild[GetAnimPosition(proc->anim)] = false;

    NewEkrDragonBaseAppear(proc->anim);
    TmFill(gBg3Tm, 0x601F);
    EnableBgSync(BG3_SYNC_BIT);
    EfxChapterMapFadeOUT(0x10);
    Proc_Break(proc);
}

void EkrDragon_ReloadCustomBgAndFadeOut(struct ProcEkrDragon * proc)
{
    if (proc->timer == 0)
    {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderMap();
    }

    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_RSQUARE, 0x10, 4, proc->timer, 8));

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrDragon_TriggerEnding(struct ProcEkrDragon * proc)
{
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);
    Proc_Break(proc);
}
