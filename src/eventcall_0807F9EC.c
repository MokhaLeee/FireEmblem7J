#include "gbafe.h"

void sub_807FB34(void)
{
    sub_807AA5C();
}

bool IsStartButtonHeld(void)
{
    return gpKeySt->held & START_BUTTON;
}

bool IsSelectButtonHeld(void)
{
    return gpKeySt->held & SELECT_BUTTON;
}

bool sub_807FB68(void)
{
    return false;
}

bool IsBButtonHeld(void)
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

bool IsDorcasRecruited(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_DORCAS)) == FACTION_BLUE;
}

bool IsSerraRecruited(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_SERRA)) == FACTION_BLUE;
}

bool IsErkRecruited(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_ERK)) == FACTION_BLUE;
}

bool IsChapterInOccupationsShadow(void)
{
    return gPlaySt.chapterIndex == CHAPTER_04;
}

bool IsChapterBeyondTheBorders(void)
{
    return gPlaySt.chapterIndex == CHAPTER_05;
}

bool IsChapterBloodOfPride(void)
{
    return gPlaySt.chapterIndex == CHAPTER_06;
}

bool IsChapterNightOfFarewells(void)
{
    return gPlaySt.chapterIndex == CHAPTER_26;
}

bool IsAnyLordInCombat(void)
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

bool IsNinoRecruited(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_NINO)) == FACTION_BLUE;
}

bool IsRathRecruited(void)
{
    return UNIT_FACTION(GetUnitFromCharId(CHARACTER_RATH)) == FACTION_BLUE;
}

bool IsHectorInCombat(void)
{
    s16 actor_pid = gBattleActor.unit.pCharacterData->number;
    s16 target_pid = gBattleTarget.unit.pCharacterData->number;

    if (actor_pid == CHARACTER_HECTOR || target_pid == CHARACTER_HECTOR)
        return true;

    return false;
}

void sub_807FD58(void)
{
    s32 gold = GetPartyTotalGoldValue();

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

extern struct LynModeTransferEnt gLynModeTransferList[];

void TransferLynModeUnits(void)
{
    s32 i;
    u8 pid_old;
    struct LynModeTransferEnt * it;

    struct Unit * dest = NULL;
    s32 j = FACTION_BLUE + 1;

    RegisterChapterStats(&gPlaySt);
    ComputeChapterRankings();
    SaveEndgameRankings();

    sub_807FD58();

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        UnitLoadSupports(unit);

        it = gLynModeTransferList;

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

void SetPostLynModeChapter(void)
{
    switch (gPlaySt.chapterModeIndex)
    {
    case CHAPTER_MODE_ELIWOOD:
        SetNextChapterId(CHAPTER_0C);
        gPlaySt.chapterIndex = CHAPTER_0C;
        return;

    case CHAPTER_MODE_HECTOR:
        SetNextChapterId(CHAPTER_0D);
        gPlaySt.chapterIndex = CHAPTER_0D;
        return;
    }
}

void LoadOneYearLaterCg(void)
{
    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetDispEnable(1, 1, 1, 1, 1);

    Decompress(Img_OneYearLater, (void *)0x06000800);
    ApplyPalette(Pal_OneYearLater, 5);
    TmApplyTsa_thm(gBg0Tm, Tsa_OneYearLater, TILEREF(0x40, 5));

    EnableBgSync(BG0_SYNC_BIT);
}

void sub_807FF4C(void)
{
    sub_807C66C(JTEXT("スタッフロール（仮）"));
}

void sub_807FF5C(void)
{
    sub_807C66C(JTEXT("その後（仮）"));
}

void sub_807FF6C(void)
{
    sub_807C66C(JTEXT("おしまい（仮）"));
}

void sub_807FF7C(void)
{
    sub_807C66C(JTEXT("おしまい８ＨＸ（仮）"));
}

void sub_807FF8C(void)
{
    sub_807C66C(JTEXT("評価画面（仮）"));
}

void NilsEpilogueIntro_Init(void)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    SetDispEnable(1, 0, 1, 1, 1);
}

void NilsEpilogueIntro_CopyBg3ToBg1(void)
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

void NilsEpilogueIntro_LoadCg(struct ProcEventCutscene * proc)
{
    sub_80B7980(gBg3Tm, 0x8000, 0, 6, 0x2C);

    SetDispEnable(1, 1, 1, 1, 1);
    EnableBgSync(BG3_SYNC_BIT);

    proc->unk_4C = 0;
}

void NilsEpilogueIntro_Loop_BlendCg(struct ProcEventCutscene * proc)
{
    s32 bld_amt = proc->unk_4C++ >> 2;

    SetBlendAlpha(bld_amt, 16 - bld_amt);

    if (bld_amt == 16)
    {
        SetDispEnable(1, 0, 0, 1, 1);
        Proc_Break(proc);
    }
}

void NilsEpilogueIntro_ClearBg1Bg2(ProcPtr proc)
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

void NilsEpilogueIntro_ReloadCg(void)
{
    sub_80B7980(gBg3Tm, 0x8000, 8, 6, 0x2C);
    EnableBgSync(BG3_SYNC_BIT);
    SetDispEnable(1, 1, 1, 1, 1);
}

extern struct ProcCmd ProcScr_NilsEpilogueIntro[];

void StartNilsEpilogueIntro(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_NilsEpilogueIntro, proc);
}

void NilsEpilogueOutro_Init(void)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    // Load Nils CG on BG0
    sub_80B7980(gBg0Tm, 0x800, 0, 6, 0x2C);
    EnableBgSync(BG0_SYNC_BIT);

    SetBlendAlpha(16, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
}

void NilsEpilogueOutro_LoadNilsInDragonsGate(struct ProcEventCutscene * proc)
{
    ApplyPalette(Pal_NilsInDragonsGate, 7);
    Decompress(Img_NilsInDragonsGate, (void *)0x06005800);
    TmApplyTsa_thm(gBg2Tm, Tsa_NilsInDragonsGate, TILEREF(0x2C0, 7));

    Decompress(Img_DragonsGate, (void *)(GetBgChrOffset(BG_3) + (void *)0x06000000));
    TmApplyTsa_thm(gBg3Tm, Tsa_DragonsGate, TILEREF(0x0, 8));
    ApplyPalettes(Pal_DragonsGate, 8, 8);

    EnableBgSync(BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->unk_4C = 0;
}

void NilsEpilogueOutro_Loop_BlendCgs(struct ProcEventCutscene * proc)
{
    s32 bld_amt = proc->unk_4C++ >> 2;

    SetBlendAlpha(16 - bld_amt, bld_amt);

    if (bld_amt == 16)
    {
        SetDispEnable(0, 1, 1, 1, 1);
        Proc_Break(proc);
    }
}

void NilsEpilogueOutro_ClearBg0(void)
{
    TmFill(gBg0Tm, TILEREF(0x0, 0));
    EnableBgSync(BG0_SYNC_BIT);
}

void NilsEpilogueOutro_FadeNilsToWhite(ProcPtr proc)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetBlendNone();

    ArchiveCurrentPalettes();
    sub_8013EF8(0x100, 0x100, 0x100, 0x200, 0x200, 0x200, 0x80, 4, proc);
}

void NilsEpilogueOutro_FadeDragonsGateToBlack(ProcPtr proc)
{
    ArchiveCurrentPalettes();
    sub_8013EF8(0x100, 0x100, 0x100, 0, 0, 0, 0x80, 2, proc);
}

extern struct ProcCmd ProcScr_NilsEpilogueOutro[];

void StartNilsEpilogueOutro(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_NilsEpilogueOutro, proc);
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
