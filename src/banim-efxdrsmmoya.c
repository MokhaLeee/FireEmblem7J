#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_EfxDrsmmoya[] = {
    PROC_19,
    PROC_REPEAT(EfxDrsmmoya_Loop),
    PROC_END,
};

void NewEfxDrsmmoya(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_ClearBG1Position();
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

/* https://decomp.me/scratch/WoB0r */
#if NONMATCHING

void EfxDrsmmoyaScroll_Loop(struct ProcEfxDrsmmoyaScroll * proc)
{
    u32 i;
    u16 * buf;
    int duration;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList2;
    else
        buf = gpBg1ScrollOffsetList1;

    for (i = 0; i < 0x50; i++)
    {
        s16 _val;
        int val0;
        int val1;

        val0 = SIN_Q12(i * 2 + proc->step) / 512u + 4;
        val1 = (u16)val0 * proc->speed;

        *buf++ = val1 >> 8;
    }

    proc->step += 2;
    if (++proc->timer == proc->duration)
        Proc_End(proc);
}

#else

NAKEDFUNC
void EfxDrsmmoyaScroll_Loop(struct ProcEfxDrsmmoyaScroll * proc)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    adds r2, r0, #0\n\
    ldr r0, _080646DC @ =gEkrBg1ScrollFlip\n\
    ldr r0, [r0]\n\
    ldr r4, _080646E0 @ =gpBg1ScrollOffsetList2\n\
    cmp r0, #0\n\
    bne _08064680\n\
    ldr r4, _080646E4 @ =gpBg1ScrollOffsetList1\n\
_08064680:\n\
    movs r3, #0\n\
    ldr r0, [r2, #0x44]\n\
    mov ip, r0\n\
    ldr r1, _080646E8 @ =gSinLut\n\
    mov r8, r1\n\
    movs r6, #0xff\n\
    ldr r5, [r2, #0x48]\n\
_0806468E:\n\
    lsls r0, r3, #1\n\
    movs r7, #0x2e\n\
    ldrsh r1, [r2, r7]\n\
    adds r0, r0, r1\n\
    ands r0, r6\n\
    lsls r0, r0, #1\n\
    add r0, r8\n\
    movs r1, #0\n\
    ldrsh r0, [r0, r1]\n\
    asrs r0, r0, #9\n\
    adds r0, #4\n\
    lsls r0, r0, #0x10\n\
    lsrs r0, r0, #0x10\n\
    muls r0, r5, r0\n\
    asrs r0, r0, #8\n\
    strh r0, [r4]\n\
    adds r4, #2\n\
    adds r3, #1\n\
    cmp r3, #0x4f\n\
    bls _0806468E\n\
    ldrh r0, [r2, #0x2e]\n\
    adds r0, #2\n\
    strh r0, [r2, #0x2e]\n\
    ldrh r0, [r2, #0x2c]\n\
    adds r0, #1\n\
    strh r0, [r2, #0x2c]\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    cmp r0, ip\n\
    bne _080646D0\n\
    adds r0, r2, #0\n\
    bl Proc_End\n\
_080646D0:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080646DC: .4byte gEkrBg1ScrollFlip\n\
_080646E0: .4byte gpBg1ScrollOffsetList2\n\
_080646E4: .4byte gpBg1ScrollOffsetList1\n\
_080646E8: .4byte gSinLut\n\
    .syntax divided\n\
");
}

#endif

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

