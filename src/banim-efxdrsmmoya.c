#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_EfxDrsmmoya[] = {
    PROC_19,
    PROC_REPEAT(EfxDrsmmoya_Loop),
    PROC_END,
};

void NewEfxDrsmmoya(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_EfxDrsmmoya, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxDrsmmoya_Loop(struct ProcEfx * proc)
{
    struct Anim * anim2 = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1)
    {
        NewEfxDrsmmoyaBG(anim2);

        if (CheckRoundCrit(proc->anim) == true)
            PlaySFX(0x2E8, 0x100, proc->anim->xPosition, 1);
        else
            PlaySFX(0x2E3, 0x100, proc->anim->xPosition, 1);

        return;
    }

    if (proc->timer == 0x1A)
    {
        struct ProcEfxDrsmmoyaScroll * subproc;
        subproc = NewEfxDrsmmoyaScroll(proc->anim, 0x41);
        NewEfxDrsmmoyaScrollCOL(proc->anim, subproc, 10, 0x2D, 10);
        NewEfxRestWINH_(proc->anim, 0x41, 1);
        return;
    }

    if (proc->timer == 0x6F)
    {
        struct Anim * animf = gAnims[GetAnimPosition(proc->anim) * 2];
        struct Anim * animb = gAnims[GetAnimPosition(proc->anim) * 2 + 1];

        animf->state3 |= ANIM_BIT3_BLOCKEND;
        animb->state3 |= ANIM_BIT3_BLOCKEND;

        Proc_Break(proc);
        return;
    }
}

struct ProcCmd CONST_DATA ProcScr_EfxDrsmmoyaBG[] = {
    PROC_19,
    PROC_REPEAT(EfxDrsmmoyaBG_Loop),
    PROC_END,
};

CONST_DATA u16 * TsaSet_EfxDrsmmoyaBgLeft[] = {
    Tsa_EfxDrsmmoyaBgLeft1,
    Tsa_EfxDrsmmoyaBgLeft2,
    Tsa_EfxDrsmmoyaBgLeft3,
    Tsa_EfxDrsmmoyaBgLeft4,
    Tsa_EfxDrsmmoyaBgLeft5,
    Tsa_EfxDrsmmoyaBgLeft6,
    Tsa_EfxDrsmmoyaBgLeft7,
    Tsa_EfxDrsmmoyaBgLeft8,
    Tsa_EfxDrsmmoyaBgLeft9,
    Tsa_EfxDrsmmoyaBgLeft10,
    Tsa_EfxDrsmmoyaBgLeft11,
    Tsa_EfxDrsmmoyaBgLeft12,
    Tsa_EfxDrsmmoyaBgLeft13,
};

CONST_DATA u16 * TsaSet_EfxDrsmmoyaBgRight[] = {
    Tsa_EfxDrsmmoyaBgRight1,
    Tsa_EfxDrsmmoyaBgRight1,
    Tsa_EfxDrsmmoyaBgRight1,
    Tsa_EfxDrsmmoyaBgRight1,
    Tsa_EfxDrsmmoyaBgRight2,
    Tsa_EfxDrsmmoyaBgRight2,
    Tsa_EfxDrsmmoyaBgRight2,
    Tsa_EfxDrsmmoyaBgRight3,
    Tsa_EfxDrsmmoyaBgRight3,
    Tsa_EfxDrsmmoyaBgRight3,
    Tsa_EfxDrsmmoyaBgRight4,
    Tsa_EfxDrsmmoyaBgRight4,
    Tsa_EfxDrsmmoyaBgRight4,
};

void NewEfxDrsmmoyaBG(struct Anim * anim)
{
    struct ProcEfxDrsmmoyaBG * proc;
    proc = Proc_Start(ProcScr_EfxDrsmmoyaBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameLut_EfxDrsmmoya;
    proc->tsal = TsaSet_EfxDrsmmoyaBgLeft;
    proc->tsar = TsaSet_EfxDrsmmoyaBgLeft;
    proc->img = TsaSet_EfxDrsmmoyaBgRight;
    proc->img_bak = NULL;

    SpellFx_RegisterBgPal(Pal_EfxDrsmmoyaBg, 0x20);
    SpellFx_SetSomeColorEffect();

    SetBlendAlpha(11, 7);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == POS_L)
            SetBgOffset(BG_1, 0xE8, 0);
        else
            SetBgOffset(BG_1, 0x18, 0);
    }
}

void EfxDrsmmoyaBG_Loop(struct ProcEfxDrsmmoyaBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        if (proc->img_bak != *(img + ret))
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);

        proc->img_bak = *(img + ret);

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_EfxDrsmmoyaScroll[] = {
    PROC_19,
    PROC_REPEAT(EfxDrsmmoyaScroll_Loop),
    PROC_END,
};

ProcPtr NewEfxDrsmmoyaScroll(struct Anim * anim, int duration)
{
    struct ProcEfxDrsmmoyaScroll * proc;
    proc = Proc_Start(ProcScr_EfxDrsmmoyaScroll, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->duration = duration;
    proc->speed = 0x100;

    return proc;
}

void EfxDrsmmoyaScroll_Loop(struct ProcEfxDrsmmoyaScroll * proc)
{
    u32 i;
    u16 * buf;
    int duration;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList1;
    else
        buf = gpBg1ScrollOffsetList2;

    i = 0;
    for (; i < 0x50; i++)
    {
        u16 val0;
        s32 var = SIN_Q12(i * 2 + proc->step);

        val0 = (var >> 9) + 4;
        *buf++ = val0 * proc->speed >> 8;
    }

    proc->step += 2;
    if (++proc->timer == proc->duration)
        Proc_End(proc);
}

struct ProcCmd CONST_DATA ProcScr_EfxDrsmmoyaScrollCOL[] = {
    PROC_19,
    PROC_REPEAT(EfxDrsmmoyaScrollCOL_Loop1),
    PROC_REPEAT(EfxDrsmmoyaScrollCOL_Delay),
    PROC_REPEAT(EfxDrsmmoyaScrollCOL_Loop3),
    PROC_END,
};

void NewEfxDrsmmoyaScrollCOL(struct Anim * anim, struct ProcEfxDrsmmoyaScroll * procefx, int duration1, int duration2, int duration3)
{
    struct ProcEfxDrsmmoyaScrollCOL * proc;
    proc = Proc_Start(ProcScr_EfxDrsmmoyaScrollCOL, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->duration1 = duration1;
    proc->duration2 = duration2;
    proc->duration3 = duration3;
    proc->procefx = procefx;
}

void EfxDrsmmoyaScrollCOL_Loop1(struct ProcEfxDrsmmoyaScrollCOL * proc)
{
    struct ProcEfxDrsmmoyaScroll * procefx = proc->procefx;
    procefx->speed = Interpolate(INTERPOLATE_LINEAR, 0, 0x100, proc->timer, proc->duration1);

    if (++proc->timer > proc->duration1)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxDrsmmoyaScrollCOL_Delay(struct ProcEfxDrsmmoyaScrollCOL * proc)
{
    if (++proc->timer > proc->duration2)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxDrsmmoyaScrollCOL_Loop3(struct ProcEfxDrsmmoyaScrollCOL * proc)
{
    struct ProcEfxDrsmmoyaScroll * procefx = proc->procefx;
    procefx->speed = Interpolate(INTERPOLATE_LINEAR, 0x100, 0, proc->timer, proc->duration3);

    if (++proc->timer > proc->duration3)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

