#include "gbafe.h"

struct ProcCmd ProcScr_NinianTransformToHunman[] = {
    PROC_YIELD,
    PROC_LABEL(0),
    PROC_CALL(sub_8021820),
    PROC_REPEAT(sub_80218F8),
    PROC_GOTO(0),
    PROC_CALL(ClearUi),
    PROC_LABEL(0x63),
    PROC_CALL(sub_8021954),
    PROC_END,
};

#if NONMATCHING

// different order of instructions for the outer loop

void sub_80217EC(u16 * tilemap, int x, int y)
{
    int i, j;
    for (i = 0; i < 4; i++)
    {
        int value = TM_OFFSET((x * 4) + 3, i) + y;
        for (j = 3; j >= 0; j--)
        {
            tilemap[TM_OFFSET(j, i)] = value--;
        }
    }
}

#else

NAKEDFUNC
void sub_80217EC(u16 * tilemap, int x, int y)
{
    asm("\n\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    adds r7, r0, #0\n\
    adds r6, r2, #0\n\
    movs r2, #0\n\
    lsls r5, r1, #2\n\
_080217F6:\n\
    lsls r0, r2, #5\n\
    adds r4, r2, #1\n\
    movs r1, #3\n\
    adds r0, r0, r5\n\
    adds r0, r0, r6\n\
    adds r3, r0, #3\n\
    lsls r0, r2, #6\n\
    adds r0, r0, r7\n\
    adds r0, #6\n\
_08021808:\n\
    strh r3, [r0]\n\
    subs r3, #1\n\
    subs r0, #2\n\
    subs r1, #1\n\
    cmp r1, #0\n\
    bge _08021808\n\
    adds r2, r4, #0\n\
    cmp r2, #3\n\
    ble _080217F6\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
");
}

#endif

void sub_8021820(struct Proc * proc)
{
    if (proc->unk4A == 6)
    {
        Proc_Goto(proc, 0x63);
    }
    else
    {
        ClearUi();
        sub_80217EC(&gBg0Tm[TM_OFFSET(proc->x, proc->y)], proc->unk4A, 0xA2 << 7);
        sub_80217EC(&gBg1Tm[TM_OFFSET(proc->x, proc->y)], ++proc->unk4A, 0xA2 << 7);

        SetWinEnable(0, 0, 0);
        SetBlendAlpha(16, 0);

        SetBlendTargetA(1, 0, 0, 0, 0);
        SetBlendTargetB(0, 1, 1, 1, 1);

        proc->unk4C = 0;
    }
}

#if NONMATCHING

// r4 and r5 are swapped

void sub_80218F8(struct Proc * proc)
{
    if ((GetGameTime() & 1) == 0)
    {
        SetBlendConfig(1, 16 - proc->unk4C, proc->unk4C, 1);

        if (++proc->unk4C > 16)
        {
            Proc_Break(proc);
        }
    }
}

#else

NAKEDFUNC
void sub_80218F8(struct Proc * proc)
{
    asm("\n\
    .syntax unified\n\
    push {r4, r5, lr}\n\
    adds r5, r0, #0\n\
    bl GetGameTime\n\
    adds r4, r0, #0\n\
    movs r0, #1\n\
    ands r4, r0\n\
    cmp r4, #0\n\
    bne _08021948\n\
    ldr r0, _08021950 @ =gDispIo\n\
    mov ip, r0\n\
    mov r2, ip\n\
    adds r2, #0x3c\n\
    movs r0, #0x3f\n\
    ldrb r1, [r2]\n\
    ands r0, r1\n\
    movs r1, #0x40\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    adds r3, r5, #0\n\
    adds r3, #0x4c\n\
    ldrh r1, [r3]\n\
    movs r0, #0x10\n\
    subs r0, r0, r1\n\
    adds r2, #8\n\
    strb r0, [r2]\n\
    mov r0, ip\n\
    adds r0, #0x45\n\
    strb r1, [r0]\n\
    adds r0, #1\n\
    strb r4, [r0]\n\
    adds r1, #1\n\
    strh r1, [r3]\n\
    lsls r1, r1, #0x10\n\
    asrs r1, r1, #0x10\n\
    cmp r1, #0x10\n\
    ble _08021948\n\
    adds r0, r5, #0\n\
    bl Proc_Break\n\
_08021948:\n\
    pop {r4, r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08021950: .4byte gDispIo\n\
    .syntax divided\n\
");
}

#endif

void sub_8021954()
{
    TmFill(gBg0Tm, 0);
    EnableBgSync(1);
}

void NinianStartTransformToHunman(struct Proc * parent, int x, int y)
{
    struct Proc * proc;

    Decompress(gUnk_081C2358, (void*)(VRAM + 0x2000));
    ApplyPalettes(&gPal[480], 5, 1);
    proc = Proc_StartBlocking(ProcScr_NinianTransformToHunman, parent);
    proc->x = x * 2 - 1;
    proc->y = y * 2 - 2;
    proc->unk4A = 0;
}
