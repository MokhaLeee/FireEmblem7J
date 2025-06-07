#include "gbafe.h"

struct ProcEventCutscene
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);
    s16 unk_4C;
};

void sub_807F9EC(struct ProcEventCutscene * proc)
{
    SetBlendAlpha(16, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    sub_807F590(1);
    sub_807F590(2);

    proc->unk_4C = 0;

    PlaySoundEffect(SONG_E5);
}

void sub_807FA64(struct ProcEventCutscene * proc)
{
    s32 bld_amt = proc->unk_4C++ >> 2;
    s32 bld_amt_b = bld_amt * 2;

    if (bld_amt_b > 16)
    {
        bld_amt_b = 16;
    }

    SetBlendConfig(BLEND_EFFECT_NONE, 16 - bld_amt, bld_amt_b, 0);

    if (bld_amt == 16)
    {
        RemoveFireDragonSpritefx(1);
        RemoveFireDragonSpritefx(2);

        SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);
        Proc_Break(proc);
    }
}

extern struct ProcCmd gUnk_08D87F68[];

void sub_807FAE8(ProcPtr proc)
{
    Proc_StartBlocking(gUnk_08D87F68, proc);
}

void ForceCenteredDragon(ProcPtr arg0)
{
    struct Unit * unit = GetUnitFromCharId(CHARACTER_FIREDRAGON);
    SetFlag(0x91);
    SetUnitHp(unit, 1);
    unit->state &= ~(US_UNSELECTABLE | US_DEAD);
    EnsureCameraOntoCenteredPosition(arg0, unit->xPos, unit->yPos);
}

void sub_807FB34(void)
{
    sub_807AA5C();
}

bool sub_807FB40(void)
{
    return gpKeySt->held & START_BUTTON;
}

bool sub_807FB54(void)
{
    return gpKeySt->held & SELECT_BUTTON;
}

bool sub_807FB68(void)
{
    return 0;
}

bool sub_807FB6C(void)
{
    return gpKeySt->held & B_BUTTON;
}

void sub_807FB80(void)
{
    MPlayVolumeControl(&gUnk_03005A30, 0xFFFF, 0x20);
}

void sub_807FB98(void)
{
    MPlayVolumeControl(&gUnk_03005CC0, 0xFFFF, 0x20);
}

void sub_807FBB0(void)
{
    MPlayVolumeControl(&gUnk_03005A30, 0xFFFF, 0x100);
}

void sub_807FBCC(void)
{
    MPlayVolumeControl(&gUnk_03005CC0, 0xFFFF, 0x100);
}

bool sub_807FBE8(void)
{
    if (gpKeySt->pressed & A_BUTTON)
    {
        return false;
    }

    return true;
}

bool GetLynModeDeathFlag(void)
{
    return CheckFlag(0x9D);
}

void SetLynModeDeathFlag(void)
{
    SetFlag(0x9D);
}

bool sub_807FC20(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_DORCAS)) == FACTION_BLUE;
}

bool sub_807FC3C(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_SERRA)) == FACTION_BLUE;
}

bool sub_807FC58(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_ERK)) == FACTION_BLUE;
}

bool sub_807FC74(void)
{
    return gPlaySt.chapterIndex == CHAPTER_04;
}

bool sub_807FC88(void)
{
    return gPlaySt.chapterIndex == CHAPTER_05;
}

bool sub_807FC9C(void)
{
    return gPlaySt.chapterIndex == CHAPTER_06;
}

bool sub_807FCB0(void)
{
    return gPlaySt.chapterIndex == CHAPTER_26;
}

bool sub_807FCC4(void)
{
    s16 actor_pid = gBattleActor.unit.pCharacterData->number;
    s16 target_pid = gBattleTarget.unit.pCharacterData->number;

    if (actor_pid == CHARACTER_ELIWOOD || actor_pid == CHARACTER_HECTOR ||
        gBattleActor.unit.pCharacterData->number == CHARACTER_LYN)
        return true;

    if (target_pid == CHARACTER_ELIWOOD || target_pid == CHARACTER_HECTOR ||
        gBattleTarget.unit.pCharacterData->number == CHARACTER_LYN)
        return true;

    return false;
}

bool sub_807FCFC(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_NINO)) == FACTION_BLUE;
}

bool sub_807FD18(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_RATH)) == FACTION_BLUE;
}

bool sub_807FD34(void)
{
    s16 actor_pid = gBattleActor.unit.pCharacterData->number;
    s16 target_pid = gBattleTarget.unit.pCharacterData->number;

    if (actor_pid == CHARACTER_HECTOR || target_pid == CHARACTER_HECTOR)
        return true;

    return false;
}

void sub_807FD58(void)
{
    s32 gold = sub_8017574();

    if (gold > 29999)
    {
        SetFlag(0x85);

        if (gold > 32999)
        {
            SetFlag(0x84);
        }
    }
    else if (gold > 19999)
    {
        SetFlag(0x84);
    }
}

struct LynModeTransferEnt
{
    /* 00 */ u8 pid_old;
    /* 01 */ u8 pid_new;
    /* 04 */ u32 flag;
};

extern struct LynModeTransferEnt gUnk_08D68388[];

void sub_807FD9C(void)
{
    s32 i;
    u8 pid_old;
    struct LynModeTransferEnt * it;

    struct Unit * dest = NULL;
    s32 j = FACTION_BLUE + 1;

    RegisterChapterStats(&gPlaySt);
    sub_80B7880();
    sub_80A0054();

    sub_807FD58();

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        UnitLoadSupports(unit);

        it = gUnk_08D68388;

        while ((pid_old = it->pid_old) != 0)
        {
            if (unit->pCharacterData->number == it->pid_old)
            {
                if (unit->state & US_BIT16)
                    break;

                if (it->pid_new != pid_old)
                    unit->pCharacterData = GetCharacterData(it->pid_new);

                unit->state |= (US_NOT_DEPLOYED | US_BIT16);
                UnitClearInventory(unit);

                if (it->flag != 0)
                    ClearFlag(it->flag);

                if (unit->state & US_DEAD)
                {
                    ClearUnit(unit);
                    break;
                }

                for (; j < FACTION_GREEN; j++)
                {
                    dest = GetUnit(j);

                    if (dest->pCharacterData == NULL)
                        break;
                }

                CopyUnit(unit, dest);
                ClearUnit(unit);
                break;
            }

            it++;
        }
    }

    ClearPidStats_ret();

    gPlaySt.chapterIndex = CHAPTER_0C;

    CleanupUnitsBeforeChapter();
    SavePlayThroughData();
}

void sub_807FE8C(void)
{
    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_ELIWOOD:
            sub_8013214(CHAPTER_0C);
            gPlaySt.chapterIndex = CHAPTER_0C;
            return;
        case CHAPTER_MODE_HECTOR:
            sub_8013214(CHAPTER_0D);
            gPlaySt.chapterIndex = CHAPTER_0D;
            return;
    }
}

void sub_807FEBC(void)
{
    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetDispEnable(1, 1, 1, 1, 1);

    Decompress(gUnk_081C8610, (void *)0x06000800);
    ApplyPalette(gUnk_081C8AF8, 5);
    TmApplyTsa_thm(gBg0Tm, gUnk_081C8B18, TILEREF(0x40, 5));

    EnableBgSync(BG0_SYNC_BIT);
}

extern const char gUnk_0840343C[]; // スタッフロール（仮）
extern const char gUnk_08403454[]; // その後（仮）
extern const char gUnk_08403464[]; // おしまい（仮）
extern const char gUnk_08403474[]; // おしまい８ＨＸ（仮）
extern const char gUnk_0840348C[]; // 評価画面（仮）

void sub_807FF4C(void)
{
    sub_807C66C(gUnk_0840343C);
}

void sub_807FF5C(void)
{
    sub_807C66C(gUnk_08403454);
}

void sub_807FF6C(void)
{
    sub_807C66C(gUnk_08403464);
}

void sub_807FF7C(void)
{
    sub_807C66C(gUnk_08403474);
}

void sub_807FF8C(void)
{
    sub_807C66C(gUnk_0840348C);
}

void sub_807FF9C(void)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    SetDispEnable(1, 0, 1, 1, 1);
}

void sub_807FFE4(void)
{
    SetDispEnable(1, 0, 1, 1, 1);

    CpuFastCopy((void *)0x06008000, (void *)0x06000000, 0x4000);
    CpuFastCopy(gBg3Tm, gBg1Tm, 0x800);

    EnableBgSync(BG1_SYNC_BIT);

    SetDispEnable(1, 1, 1, 0, 1);

    SetBlendAlpha(0, 16);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
}

void sub_8080090(struct ProcEventCutscene * proc)
{
    sub_80B7980(gBg3Tm, 0x8000, 0, 6, 0x2C);

    SetDispEnable(1, 1, 1, 1, 1);
    EnableBgSync(BG3_SYNC_BIT);

    proc->unk_4C = 0;
}

void sub_80800E0(struct ProcEventCutscene * proc)
{
    s32 bld_amt = proc->unk_4C++ >> 2;

    SetBlendAlpha(bld_amt, 16 - bld_amt);

    if (bld_amt == 16)
    {
        SetDispEnable(1, 0, 0, 1, 1);
        Proc_Break(proc);
    }
}

void sub_808014C(ProcPtr proc)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    EndDragonGatefx(proc);

    TmFill(gBg1Tm, TILEREF(0x0, 0));
    TmFill(gBg2Tm, TILEREF(0x0, 0));

    EnableBgSync(BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void sub_80801D0(void)
{
    sub_80B7980(gBg3Tm, 0x8000, 8, 6, 0x2C);
    EnableBgSync(BG3_SYNC_BIT);
    SetDispEnable(1, 1, 1, 1, 1);
}

extern struct ProcCmd gUnk_08D8977C[];

void sub_8080214(ProcPtr proc)
{
    Proc_StartBlocking(gUnk_08D8977C, proc);
}

void sub_8080228(void)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    sub_80B7980(gBg0Tm, 0x800, 0, 6, 0x2C);
    EnableBgSync(BG0_SYNC_BIT);

    SetBlendAlpha(16, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
}

void sub_80802C4(struct ProcEventCutscene * proc)
{
    ApplyPalette(gUnk_0818BC3C, 7);
    Decompress(gUnk_0818B408, (void *)0x06005800);
    TmApplyTsa_thm(gBg2Tm, gUnk_0818B760, TILEREF(0x2C0, 7));

    Decompress(gUnk_08187B5C, (void *)(GetBgChrOffset(BG_3) + (void *)0x06000000));
    TmApplyTsa_thm(gBg3Tm, gUnk_0818AE2C, TILEREF(0x0, 8));
    ApplyPalettes(gUnk_0818B308, 8, 8);

    EnableBgSync(BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->unk_4C = 0;
}

void sub_808034C(struct ProcEventCutscene * proc)
{
    s32 bld_amt = proc->unk_4C++ >> 2;

    SetBlendAlpha(16 - bld_amt, bld_amt);

    if (bld_amt == 16)
    {
        SetDispEnable(0, 1, 1, 1, 1);
        Proc_Break(proc);
    }
}

void sub_80803B8(void)
{
    TmFill(gBg0Tm, TILEREF(0x0, 0));
    EnableBgSync(BG0_SYNC_BIT);
}

void sub_80803D0(ProcPtr proc)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetBlendNone();

    ArchiveCurrentPalettes();
    sub_8013EF8(0x100, 0x100, 0x100, 0x200, 0x200, 0x200, 0x80, 4, proc);
}

void sub_808043C(ProcPtr proc)
{
    ArchiveCurrentPalettes();
    sub_8013EF8(0x100, 0x100, 0x100, 0, 0, 0, 0x80, 2, proc);
}

extern struct ProcCmd gUnk_08D897EC[];

void sub_808046C(ProcPtr proc)
{
    Proc_StartBlocking(gUnk_08D897EC, proc);
}

void sub_8080480(ProcPtr proc)
{
    if (CheckFlag(0x98))
    {
        return;
    }

    SetFlag(0x98);
    sub_80A5AF8(proc);
}
