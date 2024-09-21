#include "gbafe.h"

void UnlinkProcess(struct Proc *);
struct Proc * AllocateProcess();
void FreeProcess(struct Proc * proc);
void InsertRootProcess(struct Proc * proc, s32 parent);
void InsertChildProcess(struct Proc * proc, struct Proc * parent);
void sub_8004A60(ProcPtr proc);

#define PROC_COUNT 64

typedef bool (*BoolProcFunc)(ProcPtr);

extern EWRAM_DATA struct Proc Unk_02024E20[PROC_COUNT]; // sProcArray
extern EWRAM_DATA struct Proc * Unk_02026920[PROC_COUNT + 1]; // sProcAllocList
extern EWRAM_DATA struct Proc ** Unk_02026A24; // sProcAllocListHead
extern EWRAM_DATA struct Proc * Unk_02026A28[8]; // gProcTreeRootArray

void Proc_Init()
{
    int i;

    for (i = 0; i < PROC_COUNT; i++)
    {
        struct Proc * ptr = &Unk_02024E20[i];
        ptr->proc_script = 0;
        ptr->proc_scrCur = 0;
        ptr->proc_endCb = 0;
        ptr->proc_idleCb = 0;
        ptr->proc_name = 0;
        ptr->proc_parent = 0;
        ptr->proc_child = 0;
        ptr->proc_next = 0;
        ptr->proc_prev = 0;
        ptr->proc_sleepTime = 0;
        ptr->proc_mark = 0;
        ptr->proc_flags = 0;
        ptr->proc_lockCnt = 0;

        Unk_02026920[i] = ptr;
    }

    Unk_02026920[PROC_COUNT] = 0;
    Unk_02026A24 = Unk_02026920;

    for (i = 0; i < 8; i++)
    {
        Unk_02026A28[i] = 0;
    }
}

ProcPtr Proc_Start(const struct ProcCmd * script, ProcPtr parent)
{
    struct Proc * proc = AllocateProcess();
    proc->proc_script = script;
    proc->proc_scrCur = script;
    proc->proc_endCb = 0;
    proc->proc_idleCb = 0;
    proc->proc_parent = 0;
    proc->proc_child = 0;
    proc->proc_next = 0;
    proc->proc_prev = 0;
    proc->proc_sleepTime = 0;
    proc->proc_mark = 0;
    proc->proc_lockCnt = 0;
    proc->proc_flags = 8;

    if ((s32)parent < 8)
    {
        InsertRootProcess(proc, (s32)parent);
    }
    else
    {
        InsertChildProcess(proc, parent);
    }
    
    sub_8004A60(proc);
    proc->proc_flags &= 0xf7;

    return proc;
}

ProcPtr Proc_StartBlocking(const struct ProcCmd * script, ProcPtr parent)
{
    struct Proc * proc = Proc_Start(script, parent);

    if (!proc->proc_script)
    {
        return 0;
    }

    proc->proc_flags |= 2;
    ((struct Proc *)proc->proc_parent)->proc_lockCnt++;

    return proc;
}

void DeleteProcessRecursive(struct Proc * proc)
{
    if (proc->proc_prev)
    {
        DeleteProcessRecursive(proc->proc_prev);
    }

    if (proc->proc_child)
    {
        DeleteProcessRecursive(proc->proc_child);
    }

    if (!(proc->proc_flags & 1))
    {
        if (proc->proc_endCb)
        {
            proc->proc_endCb(proc);
        }

        FreeProcess(proc);

        proc->proc_script = 0;
        proc->proc_idleCb = 0;

        proc->proc_flags |= 1;

        if (proc->proc_flags & 2)
        {
            ((struct Proc *)proc->proc_parent)->proc_lockCnt--;
        }
    }
}

void Proc_End(ProcPtr proc)
{
    if (proc)
    {
        UnlinkProcess(proc);
        DeleteProcessRecursive(proc);
    }
}

struct Proc * AllocateProcess()
{
    ProcPtr proc = *Unk_02026A24;
    Unk_02026A24++;

    return proc;
}

void FreeProcess(struct Proc * proc)
{
    Unk_02026A24--;
    *Unk_02026A24 = proc;
}

void InsertRootProcess(struct Proc * proc, s32 parent)
{
    struct Proc * ptr = *(Unk_02026A28 + parent);

    if (ptr != 0)
    {
        ptr->proc_next = proc;
        proc->proc_prev = ptr;
    }

    proc->proc_parent = (ProcPtr)parent;
    Unk_02026A28[parent] = proc;
}

void InsertChildProcess(struct Proc * proc, struct Proc * parent)
{
    if (parent->proc_child)
    {
        ((struct Proc *)parent->proc_child)->proc_next = proc;
        proc->proc_prev = parent->proc_child;
    }

    parent->proc_child = proc;
    proc->proc_parent = parent;
}

void UnlinkProcess(struct Proc * proc)
{
    if (proc->proc_next)
    {
        ((struct Proc *)proc->proc_next)->proc_prev = proc->proc_prev;
    }

    if (proc->proc_prev)
    {
        ((struct Proc *)proc->proc_prev)->proc_next = proc->proc_next;
    }

    if ((s32)proc->proc_parent > 8)
    {
        if (((struct Proc *)proc->proc_parent)->proc_child == proc)
        {
            ((struct Proc *)proc->proc_parent)->proc_child = proc->proc_prev;
        }
    }
    else
    {
        s32 idx = (s32)proc->proc_parent;
        if (*(idx + Unk_02026A28) == proc)
        {
            Unk_02026A28[idx] = proc->proc_prev;
        }
    }

    proc->proc_next = 0;
    proc->proc_prev = 0;
}

void RunProcessRecursive(struct Proc * proc)
{
    if (proc->proc_prev)
    {
        RunProcessRecursive(proc->proc_prev);
    }

    if (proc->proc_lockCnt != 0 || (proc->proc_flags & 8))
    {
        goto skip_exec;
    }

    if (!proc->proc_idleCb)
    {
        sub_8004A60(proc);
    }

    if (proc->proc_idleCb)
    {
        proc->proc_idleCb(proc);
    }

    if (proc->proc_flags & 1)
    {
        return;
    }

skip_exec:
    if (proc->proc_child)
    {
        RunProcessRecursive(proc->proc_child);
    }
}

void Proc_Run(ProcPtr proc)
{
    if (proc)
    {
        RunProcessRecursive(proc);
    }
}

void Proc_Break(ProcPtr proc)
{
    ((struct Proc*)proc)->proc_idleCb = 0;
}

ProcPtr Proc_Find(const struct ProcCmd * script)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_script == script)
        {
            return ptr;
        }
    }

    return 0;
}

ProcPtr Proc_FindNonBlocked(const struct ProcCmd * script)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_script == script && ptr->proc_lockCnt == 0)
        {
            return ptr;
        }
    }

    return 0;
}

ProcPtr sub_80045D0(int mark)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_script && ptr->proc_mark == mark)
        {
            return ptr;
        }
    }

    return 0;
}

void Proc_Goto(ProcPtr proc, int label)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_script;
    while (cmd_ptr->opcode != 0)
    {
        if (cmd_ptr->opcode == 0xB && cmd_ptr->dataImm == label)
        {
            p->proc_scrCur = cmd_ptr;
            p->proc_idleCb = 0;
            return;
        }

        cmd_ptr++;
    }
}

void sub_8004634(ProcPtr proc, const struct ProcCmd * script)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_scrCur = script;
    p->proc_idleCb = 0;
}

void sub_800463C(ProcPtr proc, u8 mark)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_mark = mark;
}

void sub_8004644(ProcPtr proc, ProcFunc func)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_endCb = func;
}

void sub_8004648(ProcFunc func)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_script)
        {
            func(ptr);
        }
    }
}

void Proc_ForEach(const struct ProcCmd * script, ProcFunc func)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_script == script)
        {
            func(ptr);
        }
    }
}

void sub_8004698(int mark, ProcFunc func)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_mark == mark)
        {
            func(ptr);
        }
    }
}

void Proc_BlockEachMarked(int mark)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_mark == mark)
        {
            ptr->proc_lockCnt++;
        }
    }
}

void Proc_UnblockEachMarked(int mark)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_mark == mark)
        {
            if (ptr->proc_lockCnt)
            {
                ptr->proc_lockCnt--;
            }
        }
    }
}

void Proc_EndEachMarked(int mark)
{
    int i;
    struct Proc * ptr = Unk_02024E20;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_mark == mark)
        {
            Proc_End(ptr);
        }
    }
}

void EndProc(ProcPtr proc)
{
    Proc_End(proc);
}

void Proc_EndEach(const struct ProcCmd * script)
{
    Proc_ForEach(script, EndProc);
}

void ClearNativeCallback(ProcPtr proc)
{
    Proc_Break(proc);
}

void Proc_BreakEach(const struct ProcCmd * script)
{
    Proc_ForEach(script, ClearNativeCallback);
}

void ForAllFollowingProcs(ProcPtr proc, ProcFunc func)
{
    struct Proc * p = ((struct Proc*)proc);

    if (p->proc_prev)
    {
        ForAllFollowingProcs(p->proc_prev, func);
    }

    func(proc);

    if (p->proc_child)
    {
        ForAllFollowingProcs(p->proc_child, func);
    }
}

void sub_800479C(ProcPtr proc, ProcFunc func)
{
    struct Proc * p = ((struct Proc*)proc);

    func(proc);

    if (p->proc_child)
    {
        ForAllFollowingProcs(p->proc_child, func);
    }
}

int sub_80047B8(ProcPtr proc)
{
    Proc_End(proc);
    return 0;
}

int sub_80047C4(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_name = p->proc_scrCur->dataPtr;
    p->proc_scrCur++;

    return 1;
}

int sub_80047D4(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    ProcFunc func = p->proc_scrCur->dataPtr;
    p->proc_scrCur++;
    func(p);

    return 1;
}

bool sub_80047E8(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    BoolProcFunc func = p->proc_scrCur->dataPtr;
    p->proc_scrCur++;

    return func(p);
}

bool sub_8004800(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    short arg = p->proc_scrCur->dataImm;
    bool(* func)(short, ProcPtr) = p->proc_scrCur->dataPtr;
    p->proc_scrCur++;

    return func(arg, proc);
}

bool sub_8004820(ProcPtr proc)
{
    bool ret;
    struct Proc * p = ((struct Proc*)proc);

    BoolProcFunc func = p->proc_scrCur->dataPtr;
    p->proc_scrCur++;

    ret = func(p);
    if (ret == TRUE)
    {
        p->proc_scrCur--;
        return FALSE;
    }

    return TRUE;
}

int sub_800484C(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_idleCb = p->proc_scrCur->dataPtr;
    p->proc_scrCur++;

    return 0;
}

int sub_800485C(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    ProcFunc func = p->proc_scrCur->dataPtr;
    sub_8004644(p, func);
    p->proc_scrCur++;

    return 1;
}

int sub_8004878(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_scrCur->dataPtr;
    Proc_Start(cmd_ptr, p);
    p->proc_scrCur++;

    return 1;
}

int sub_8004894(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_scrCur->dataPtr;
    Proc_StartBlocking(cmd_ptr, p);
    p->proc_scrCur++;

    return 0;
}

int sub_80048B0(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_scrCur->dataPtr;
    Proc_Start(cmd_ptr, (ProcPtr)(s32)p->proc_sleepTime);
    p->proc_scrCur++;

    return 1;
}

int sub_80048D0(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_scrCur->dataPtr;
    s32 ret = (s32)Proc_Find(cmd_ptr);
    if (((0 - ret) | ret) < 0) // ???
    {
        return 0;
    }

    p->proc_scrCur++;
    return 1;
}

int sub_80048F8(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_scrCur->dataPtr;
    Proc_EndEach(cmd_ptr);

    p->proc_scrCur++;
    return 1;
}

int sub_8004914(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_scrCur->dataPtr;
    Proc_BreakEach(cmd_ptr);

    p->proc_scrCur++;
    return 1;
}

int sub_8004930(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_scrCur++;
    return 1;
}

int sub_800493C(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd * cmd_ptr = p->proc_scrCur->dataPtr;
    sub_8004634(proc, cmd_ptr);

    return 1;
}

int sub_800494C(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    Proc_Goto(proc, p->proc_scrCur->dataImm);

    return 1;
}

void sub_8004960(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    if (--p->proc_sleepTime == 0)
    {
        Proc_Break(p);
    }
}

int sub_800497C(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    const struct ProcCmd **proc_scrCur = &p->proc_scrCur;
    if ((*proc_scrCur)->dataImm)
    {
        p->proc_sleepTime = (*proc_scrCur)->dataImm;
        p->proc_idleCb = sub_8004960;
    }

    (*proc_scrCur)++;
    return 0;
}

int sub_80049A0(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_mark = p->proc_scrCur->dataImm;
    p->proc_scrCur++;

    return 1;
}

int sub_80049B4(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_scrCur++;

    return 1;
}

int sub_80049C0(ProcPtr proc)
{
    return 0;
}

int sub_80049C4(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);
    struct Proc * ptr = Unk_02024E20;
    int i, j;

    for (i = 0, j = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr->proc_script == p->proc_script)
        {
            j++;
        }
    }

    if (j > 1)
    {
        Proc_End(p);
        return 0;
    }
    else
    {
        p->proc_scrCur++;
        return 1;
    }
}

int sub_8004A04(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);
    struct Proc * ptr = Unk_02024E20;
    int i;

    for (i = 0; i < PROC_COUNT; i++, ptr++)
    {
        if (ptr != p && ptr->proc_script == p->proc_script)
        {
            Proc_End(ptr);
            break;
        }
    }

    p->proc_scrCur++;
    return 1;
}

int sub_8004A3C(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_scrCur++;

    return 1;
}

int sub_8004A48(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    p->proc_flags |= 4;
    p->proc_scrCur++;

    return 1;
}

#if NONMATCHING

// seems to be a local static variable (cf StepProcScr in fe6j)
extern BoolProcFunc gUnk_08BBFD28[]; 

void sub_8004A60(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);

    if (p->proc_script
        && !p->proc_lockCnt
        && !p->proc_idleCb)
    {
        while (gUnk_08BBFD28[p->proc_scrCur->opcode](p))
        {
            if (p->proc_script == 0)
            {
                break;
            }
        }
    }
}

#else

NAKEDFUNC
void sub_8004A60(ProcPtr proc)
{
    asm("\n\
    .syntax unified\n\
    push {r4, r5, lr}\n\
    adds r4, r0, #0\n\
    ldr r0, [r4]\n\
    cmp r0, #0\n\
    beq _08004AA2\n\
    adds r0, r4, #0\n\
    adds r0, #0x28\n\
    ldrb r0, [r0]\n\
    cmp r0, #0\n\
    bne _08004AA2\n\
    ldr r0, [r4, #0xc]\n\
    cmp r0, #0\n\
    bne _08004AA2\n\
    ldr r5, _08004A80 @ =gUnk_08BBFD28\n\
    b _08004A8A\n\
    .align 2, 0\n\
_08004A80: .4byte gUnk_08BBFD28\n\
_08004A84:\n\
    ldr r0, [r4]\n\
    cmp r0, #0\n\
    beq _08004AA2\n\
_08004A8A:\n\
    ldr r0, [r4, #4]\n\
    movs r1, #0\n\
    ldrsh r0, [r0, r1]\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r5\n\
    ldr r1, [r0]\n\
    adds r0, r4, #0\n\
    bl _call_via_r1\n\
    lsls r0, r0, #0x18\n\
    cmp r0, #0\n\
    bne _08004A84\n\
_08004AA2:\n\
    pop {r4, r5}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
");
}

#endif

void nullsub_2(ProcPtr proc)
{
}

void sub_8004AAC(ProcPtr proc, int * a1)
{
    struct Proc * p = ((struct Proc*)proc);

    if (p->proc_prev)
    {
        sub_8004AAC(p->proc_prev, a1);
    }

    nullsub_2(proc);

    if (p->proc_child)
    {
        *a1 += 2;
        sub_8004AAC(p->proc_child, a1);
        *a1 -= 2;
    }
}

void sub_8004AE4(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);
    int i = 4;

    nullsub_2(p);

    if (p->proc_child)
    {
        i += 2;
        sub_8004AAC(p->proc_child, &i);
        i -= 2;
    }
}

void nullsub_22()
{
}

void sub_8004B1C(ProcPtr proc, ProcFunc func)
{
    struct Proc * p = ((struct Proc*)proc);
    p->proc_idleCb = func;
}

void sub_8004B20(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);
    p->proc_lockCnt++;
}

void sub_8004B2C(ProcPtr proc)
{
    struct Proc * p = ((struct Proc*)proc);
    p->proc_lockCnt--;
}

ProcPtr Proc_FindAfter(struct ProcCmd * script, struct Proc * proc)
{
    struct Proc * proc_ptr = proc;

    if (!proc_ptr)
    {
        proc_ptr = Unk_02024E20;
    }
    else
    {
        proc_ptr++;
    }

    while (proc_ptr < (struct Proc *)Unk_02026920)
    {
        if (proc_ptr->proc_script == script)
        {
            return proc_ptr;
        }

        proc_ptr++;
    }

    return 0;
}

struct Proc * Proc_FindAfterWithParent(struct Proc * proc, struct Proc * parent)
{
    struct Proc * proc_ptr = proc;

    if (!proc_ptr)
    {
        proc_ptr = Unk_02024E20;
    }
    else
    {
        proc_ptr++;
    }

    while (proc_ptr < (struct Proc *)Unk_02026920)
    {
        if (proc_ptr->proc_parent == parent)
        {
            return proc_ptr;
        }

        proc_ptr++;
    }

    return 0;
}

int sub_8004BA0()
{
    int i = PROC_COUNT;
    struct Proc * ptr = Unk_02024E20;
    s32 target = (s32)ptr + 0x00001A94;

    do
    {
        if (ptr->proc_script)
        {
            i--;
        }

        ptr++;
    }
    while ((s32)ptr <= target);

    return i;
}
