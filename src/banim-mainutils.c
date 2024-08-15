#include "gbafe.h"

CONST_DATA AnimScr AnimScr_DefaultAnim[] = {
    ANIMSCR_FRAME(1, NULL, 0x57F0),
    ANIMSCR_BLOCKED
};

CONST_DATA void * TsaConfs_BanimTmA[] =
{
    TsaConf_BanimTmA1,
    TsaConf_BanimTmA2,
    TsaConf_BanimTmA3,
    TsaConf_BanimTmA4,
    TsaConf_BanimTmA3,
    TsaConf_BanimTmA4,
    TsaConf_BanimTmA3,
    TsaConf_BanimTmA4,
    TsaConf_BanimTmA1,
    TsaConf_BanimTmA2,
};

const u8 BanimDefaultModeConfig[ANIM_ROUND_MAX * 4] = {
    /**
     * 00: front mode
     * 01: front priority
     * 02: back mode
     * 03: back priority
    */

    /* ANIM_ROUND_HIT_CLOSE */
    BANIM_MODE_NORMAL_ATK, 0x64, BANIM_MODE_NORMAL_ATK_PRIORITY_L, 0x3C,

    /* ANIM_ROUND_CRIT_CLOSE */
    BANIM_MODE_CRIT_ATK, 0x64, BANIM_MODE_CRIT_ATK_PRIORITY_L, 0x3C,

    /* ANIM_ROUND_NONCRIT_FAR */
    BANIM_MODE_RANGED_ATK, 0x64, BANIM_MODE_INVALID, 0x3C,

    /* ANIM_ROUND_CRIT_FAR */
    BANIM_MODE_RANGED_CRIT_ATK, 0x64, BANIM_MODE_INVALID, 0x3C,

    /* ANIM_ROUND_TAKING_MISS_CLOSE */
    BANIM_MODE_CLOSE_DODGE, 0x28, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_MISS_FAR */
    BANIM_MODE_RANGED_DODGE, 0x28, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_HIT_CLOSE */
    BANIM_MODE_STANDING, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_STANDING */
    BANIM_MODE_STANDING2, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_HIT_FAR */
    BANIM_MODE_RANGED_STANDING, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_MISS_CLOSE */
    BANIM_MODE_MISSED_ATK, 0x64, BANIM_MODE_INVALID, 0x28,
};

const u8 BattleTypeToAnimModeEndOfDodge[5] = {
    [EKR_DISTANCE_CLOSE]      = BANIM_MODE_CLOSE_DODGE,
    [EKR_DISTANCE_FAR]        = BANIM_MODE_STANDING,
    [EKR_DISTANCE_FARFAR]     = BANIM_MODE_STANDING,
    [EKR_DISTANCE_MONOCOMBAT] = BANIM_MODE_CLOSE_DODGE,
    [EKR_DISTANCE_PROMOTION]  = BANIM_MODE_CLOSE_DODGE
};

const u8 BanimTypesPosLeft[5] = {
    [EKR_DISTANCE_CLOSE]      = 0x5C,
    [EKR_DISTANCE_FAR]        = 0x44,
    [EKR_DISTANCE_FARFAR]     = 0x44,
    [EKR_DISTANCE_MONOCOMBAT] = 0x78,
    [EKR_DISTANCE_PROMOTION]  = 0x5C
};

const u8 BanimTypesPosRight[5] = {
    [EKR_DISTANCE_CLOSE]      = 0x94,
    [EKR_DISTANCE_FAR]        = 0xAC,
    [EKR_DISTANCE_FARFAR]     = 0xAC,
    [EKR_DISTANCE_MONOCOMBAT] = 0x78,
    [EKR_DISTANCE_PROMOTION]  = 0x94
};

void AnimScrAdvance(struct Anim * anim)
{
    u32 inst;

    if (CheckRound1(anim->currentRoundType) == false)
        return;

    if (anim->pScrCurrent == AnimScr_DefaultAnim)
        return;

    while (1) {
        inst = ANINS_GET_TYPE(*anim->pScrCurrent);

        if (inst == ANIM_INS_TYPE_STOP) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == ANIM_INS_TYPE_COMMAND) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == ANIM_INS_TYPE_FRAME)
            anim->pScrCurrent += 3;
    }
}

struct ProcCmd CONST_DATA ProcScr_EkrChienCHR[] =
{
    PROC_19,
    PROC_REPEAT(EkrChienCHRMain),
    PROC_END,
};

void NewEkrChienCHR(struct Anim * anim)
{
    struct ProcEkrChienCHR * proc;
    proc = Proc_Start(ProcScr_EkrChienCHR, PROC_TREE_3);
    proc->anim = anim;
}

void EkrChienCHRMain(struct ProcEkrChienCHR * proc)
{
    RegisterAISSheetGraphics(proc->anim);
    Proc_Break(proc);
}

void RegisterAISSheetGraphics(struct Anim * anim)
{
    void * buf;
    buf = OBJ_VRAM0 + OAM2_CHR(anim->oam2Base) * CHR_SIZE;
    LZ77UnCompWram(anim->pImgSheet, anim->pImgSheetBuf);
    RegisterDataMove(anim->pImgSheetBuf, buf, 0x2000);
}

void ApplyBanimUniquePalette(u32 * buf, int pos)
{
    u32 i;
    if (gBanimUniquePaletteDisabled[pos] == 0)
        return;

    for (i = 0; i < 8; i++)
        buf[i] = buf[i + 0x20];
}

int GetBanimPalette(int banim_id, int pos)
{
    u32 jid;
    struct BattleUnit * bu;

    if (POS_L == pos)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    jid = UNIT_CLASS_ID(&bu->unit);
    switch (jid) {
    case CLASS_ARCHER:
        return 0x24;
    
    case CLASS_ARCHER_F:
        return 0x26;
    
    case CLASS_SNIPER:
        return 0x28;
    
    case CLASS_SNIPER_F:
        return 0x2A;
    
    default:
        return banim_id;
    }
}
#if 0
void UpdateBanimFrame(void)
{
    int val, bid, bid_pal, chara_pal;
    struct BattleAnim * _banim, * banim = banim_data;
    struct BattleAnimCharaPal * cbapt = character_battle_animation_palette_table;

    gpImgSheet[1] = NULL;
    gpImgSheet[0] = NULL;

    if (gBanimValid[POS_L] == true)
    {
        bid = gBanimIdx[EKR_POS_L];
        bid_pal = gBanimFactionPal[EKR_POS_L];
        chara_pal = gBanimUniquePal[EKR_POS_L];

        _banim = &banim[bid];
        LZ77UnCompWram(_banim->script, gBanimScrLeft);
        gpBanimModesLeft = _banim->modes;

        _banim = &banim[GetBanimPalette(bid, 0)];
        LZ77UnCompWram(_banim->pal, gBanimPaletteLeft);

        if (chara_pal != -1)
        {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteLeft);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteLeft, POS_L);
        }

        gpEfxUnitPaletteBackup[POS_L] = &PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0), PAL_OBJ(0x7), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[0], PAL_OBJ(0x8), 0x20);

        EnablePalSync();
        LZ77UnCompWram(banim[bid].oam_l, gBanimOaml);
        gBanimOaml[0x57F0 / 4] = 1;
    }

    if (gBanimValid[EKR_POS_R] == true)
    {
        bid = gBanimIdx[EKR_POS_R];
        bid_pal = gBanimFactionPal[EKR_POS_R];
        chara_pal = gBanimUniquePal[EKR_POS_R];

        LZ77UnCompWram(banim[bid].script, gBanimScrRight);
        gpBanimModesRight = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 1)].pal, gBanimPaletteRight);

        if (chara_pal != -1)
        {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteRight);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteRight, POS_R);
        }

        gpEfxUnitPaletteBackup[POS_R] = &PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0), PAL_OBJ(0x9), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[1], PAL_OBJ(0xA), 0x20);

        EnablePalSync();
        LZ77UnCompWram(banim[bid].oam_r, gBanimOamr2);
        gBanimOamr2[0x57F0 / 4] = 1;
    }

    if (gpEkrTriangleUnits[0] != NULL)
    {
        bid = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[POS_L], gpEkrTriangleUnits[POS_L]->pClassData->pBattleAnimDef, 0, &val);
        gBanimTriAtkPalettes[POS_L] = banim[bid].pal;

        bid = GetBattleAnimCharacterUniquePalIndex(gpEkrTriangleUnits[POS_L], val);
        if (bid != -1)
            gBanimTriAtkPalettes[POS_L] = cbapt[bid].pal;

        bid = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[POS_R], gpEkrTriangleUnits[POS_R]->pClassData->pBattleAnimDef, 0, &val);
        gBanimTriAtkPalettes[POS_R] = banim[bid].pal;

        bid = GetBattleAnimCharacterUniquePalIndex(gpEkrTriangleUnits[POS_R], val);
        if (bid != -1)
            gBanimTriAtkPalettes[POS_R] = cbapt[bid].pal;
    }
}
#endif
