#include "gbafe.h"

u32 GetBonusContentClaimFlags(void)
{
    return gBonusContentClaimFlags;
}

void SetBonusContentClaimFlags(u32 flags)
{
    gBonusContentClaimFlags = flags;
}

void WriteBonusContentClaimFlags(void * sram_dest)
{
    WriteAndVerifySramFast(&gBonusContentClaimFlags, sram_dest + 0xD88, sizeof(gBonusContentClaimFlags));
}

void ReadBonusContentClaimFlags(void * sram_src)
{
    ReadSramFast(sram_src + 0xD88, &gBonusContentClaimFlags, sizeof(gBonusContentClaimFlags));
}

void WriteLastGameSaveId(int num)
{
    struct GlobalSaveInfo info;

    ReadGlobalSaveInfo(&info);
    info.last_game_save_id = num;
    WriteGlobalSaveInfoNoChecksum(&info);
}

int ReadLastGameSaveId(void)
{
    int ret;
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return 0;

    ret = info.last_game_save_id;

    if (ret > SAVE_GAME2)
        return SAVE_GAME0;
    else if (ret < 0)
        return SAVE_GAME0;
    else
        return ret;
}

void InvalidateGameSave(int index)
{
    struct SaveBlockInfo chunk;
    struct PlaySt play_st;

    if (IsValidSuspendSave(SAVE_SUSPEND))
    {
        ReadSuspendSavePlaySt(SAVE_SUSPEND, &play_st);

        if (play_st.gameSaveSlot == index)
            InvalidateSuspendSave(SAVE_SUSPEND);
    }

    chunk.kind = SAVE_KIND_INVALID;
    WriteSaveBlockInfo(&chunk, index);
}

void CopyGameSave(int index_src, int index_dest)
{
    struct SaveBlockInfo chunk;
    void * src = GetSaveReadAddr(index_src);
    void * dest = GetSaveWriteAddr(index_dest);

    ReadSramFast(src, gBuf, sizeof(struct GameSaveBlock));
    WriteAndVerifySramFast(gBuf, dest, sizeof(struct GameSaveBlock));

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index_dest);
}

void WriteNewGameSave(int index, int isDifficult, int mode)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GameSavePackedUnit unitp;

    struct GameSaveBlock * dest = GetSaveWriteAddr(index);

    if (mode == 0)
        mode = gPlaySt.chapterModeIndex;

    SetGameTime(0);
    InitPlayConfig(isDifficult);
    InitUnits();
    ClearSupplyItems();
    ResetPermanentFlags();
    InvalidateSuspendSave(SAVE_SUSPEND);

    gPlaySt.tact_gender = 0;
    gPlaySt.unk2C_04 = 0;
    CpuFill16(0, &gPlaySt.total_gold, 0x10);
    gPlaySt.unk2C_0D = 0;
    gPlaySt.chapterModeIndex = mode;
    gPlaySt.tact_enabled = 1;
    gPlaySt.playerName[0] = '\0';

    if (mode == 1)
        gPlaySt.chapterIndex = 0;

    if (mode == 2)
        gPlaySt.chapterIndex = 0xC;

    if (mode == 3)
        gPlaySt.chapterIndex = 0xD;

    gPlaySt.playthroughIdentifier = GetNewPlaythroughId();
    gPlaySt.gameSaveSlot = index;
    gPlaySt.unk2C_17 = GetGlobalCompletionCount();

    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    SetBonusContentClaimFlags(0);
    WriteBonusContentClaimFlags(dest);

    CpuFill16(0, &unitp, sizeof(unitp));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        WriteAndVerifySramFast(&unitp, &dest->units[i], sizeof(unitp));

    WriteSupplyItems(dest->supplyItems);
    ClearPidChStatsSaveData(dest);
    WritePermanentFlags(dest->permanentFlags);

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index);
    WriteLastGameSaveId(index);
}

void WriteGameSave(int slot)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GlobalSaveInfo info;

    struct GameSaveBlock * dest = GetSaveWriteAddr(slot);
    InvalidateSuspendSave(SAVE_SUSPEND);
    gPlaySt.gameSaveSlot = slot;
    gPlaySt.time_saved = GetGameTime();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        WriteGameSavePackedUnit(&gUnitArrayBlue[i], &dest->units[i]);

    ReadGlobalSaveInfo(&info);

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        SGM_SetCharacterKnown(UNIT_CHAR_ID(&gUnitArrayBlue[i]), &info);

    WriteGlobalSaveInfo(&info);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteBonusContentClaimFlags(dest);
    WritePermanentFlags(dest->permanentFlags);

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, slot);
    WriteLastGameSaveId(slot);
}

void ReadGameSave(int slot)
{
    int i;
    struct GameSaveBlock * src = GetSaveReadAddr(slot);

    if (!(gBmSt.flags & BM_FLAG_LINKARENA))
        InvalidateSuspendSave(SAVE_SUSPEND);

    ReadSramFast(src, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);
    gPlaySt.gameSaveSlot = slot;

    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        LoadSavedUnit(src->units + i, &gUnitArrayBlue[i]);

    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadBonusContentClaimFlags(src);
    WriteLastGameSaveId(slot);
}

bool IsSaveValid(int slot)
{
    return ReadSaveBlockInfo(NULL, slot);
}

void ReadGameSavePlaySt(int slot, struct PlaySt * buf)
{
    struct GameSaveBlock * src = GetSaveReadAddr(slot);
    ReadSramFast(&src->playSt, buf, sizeof(struct PlaySt));
}

u32 LoadSavedBonusClaimFlags(int slot)
{
    u32 buf;
    struct GameSaveBlock * src = GetSaveReadAddr(slot);
    ReadSramFast(&src->bonusClaimFlags, &buf, sizeof(buf));
    return buf;
}

bool IsChapterPostLyn(struct PlaySt * play_st)
{
    if (play_st->chapterIndex > 0xD)
        return true;

    return false;
}

bool IsGameNotFirstChapter(struct PlaySt * play_st)
{
    if (play_st->chapterIndex <= 0xB)
    {
        if (play_st->chapterIndex > 0)
            return true;
    }
    else if (play_st->chapterIndex > 0xD)
        return true;

    return false;
}

bool IsGameSaveNotFirstChapter(int slot)
{
    struct PlaySt play_st;

    if (!IsSaveValid(slot))
        return false;

    ReadGameSavePlaySt(slot, &play_st);
    return IsGameNotFirstChapter(&play_st);
}

void WriteGameSavePackedUnit(struct Unit * unit, void * sram_dest)
{
    int i;
    struct GameSavePackedUnit unitp;

    unitp.pid = UNIT_CHAR_ID(unit);
    unitp.jid = unit->pClassData->number;

    if (unit->pCharacterData == NULL)
    {
        struct Unit tmp_unit;
        unit = &tmp_unit;
        ClearUnit(&tmp_unit);
        unitp.pid = 0;
        unitp.jid = 0;
    }

    unitp.level = unit->level;
    unitp.exp = unit->exp;
    unitp.xPos = unit->xPos;
    unitp.yPos = unit->yPos;

    unitp.max_hp = unit->maxHP;
    unitp.pow = unit->pow;
    unitp.skl = unit->skl;
    unitp.spd = unit->spd;
    unitp.def = unit->def;
    unitp.res = unit->res;
    unitp.lck = unit->lck;
    unitp.con_bonus = unit->conBonus;
    unitp.mov_bonus = unit->movBonus;

    unitp.item1 = unit->items[0];
    unitp.item2 = unit->items[1];
    unitp.item3 = unit->items[2];
    unitp.item4 = unit->items[3];
    unitp.item5 = unit->items[4];

    unitp.flag = 0;

    if (unit->state & US_DEAD)
        unitp.flag |= PACKED_US_DEAD;

    if (unit->state & US_NOT_DEPLOYED)
        unitp.flag |= PACKED_US_UNDEPLOYED;

    if (unit->state & US_SOLOANIM_1)
        unitp.flag |= PACKED_US_SOLO_ANIM1;

    if (unit->state & US_SOLOANIM_2)
        unitp.flag |= PACKED_US_SOLO_ANIM2;

    if (unit->state & US_GROWTH_BOOST)
        unitp.flag |= PACKED_US_METIS_TOME;

    if (unit->state & US_BIT16)
        unitp.flag |= PACKED_US_B4;

    if (unit->state & US_BIT25)
        unitp.flag |= PACKED_US_B5;

    for (i = 0; i < 8; i++)
        unitp.wpnRanks[i] = unit->ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unitp.supports[i] = unit->supports[i];

    WriteAndVerifySramFast(&unitp, sram_dest, sizeof(unitp));
}

void LoadSavedUnit(const void * sram_src, struct Unit * unit)
{
    int i;
    struct GameSavePackedUnit unitp;

    ReadSramFast(sram_src, &unitp, sizeof(unitp));

    unit->pCharacterData = GetCharacterData(unitp.pid);
    unit->pClassData = GetClassData(unitp.jid);
    unit->level = unitp.level;
    unit->exp = unitp.exp;
    unit->xPos = unitp.xPos;
    unit->yPos = unitp.yPos;

    unit->maxHP = unitp.max_hp;
    unit->pow = unitp.pow;
    unit->skl = unitp.skl;
    unit->spd = unitp.spd;
    unit->def = unitp.def;
    unit->res = unitp.res;
    unit->lck = unitp.lck;
    unit->conBonus = unitp.con_bonus;
    unit->movBonus = unitp.mov_bonus;

    unit->items[0] = unitp.item1;
    unit->items[1] = unitp.item2;
    unit->items[2] = unitp.item3;
    unit->items[3] = unitp.item4;
    unit->items[4] = unitp.item5;

    if (unit->exp > 99)
        unit->exp = -1;

    unit->state = 0;

    if (unitp.flag & PACKED_US_DEAD)
        unit->state = US_HIDDEN | US_DEAD;

    if (unitp.flag & PACKED_US_UNDEPLOYED)
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

    if (unitp.flag & PACKED_US_SOLO_ANIM1)
        unit->state |= US_SOLOANIM_1;

    if (unitp.flag & PACKED_US_SOLO_ANIM2)
        unit->state |= US_SOLOANIM_2;

    if (unitp.flag & PACKED_US_METIS_TOME)
        unit->state |= US_GROWTH_BOOST;

    if (unitp.flag & PACKED_US_B4)
        unit->state |= US_BIT16;

    if (unitp.flag & PACKED_US_B5)
        unit->state |= US_BIT25;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unitp.wpnRanks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unitp.supports[i];

    SetUnitHp(unit, GetUnitMaxHp(unit));
    unit->supportBits = 0;

    if (unit->exp == 0x7F)
        unit->exp = -1;

    if (unit->xPos == 0x3F)
        unit->xPos = -1;

    if (unit->yPos == 0x3F)
        unit->yPos = -1;
}

void InvalidateSuspendSave(int slot)
{
    struct SaveBlockInfo chunk;
    chunk.kind = SAVE_KIND_INVALID;

    WriteSaveBlockInfo(&chunk, slot);

    if (slot == SAVE_SUSPEND)
        WriteSaveBlockInfo(&chunk, SAVE_SUSPEND_ALT);
}

void WriteSuspendSave(int slot)
{
    struct SuspendSaveBlock * dest;
    struct SaveBlockInfo chunk;
    u8 list[0x10];
    int i;
    struct SuspendSavePackedUnit * buf;

    if (sub_8031B40())
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return;

    if (!IsSramWorking())
        return;

    slot += GetNextSuspendSaveId();
    dest = GetSaveWriteAddr(slot);
    gPlaySt.time_saved = GetGameTime();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    StoreRNStateToActionStruct();
    WriteAndVerifySramFast(&gActionSt, &dest->action, sizeof(dest->action));

    buf = (void *)gBuf;

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayBlue[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayRed[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayGreen[i], buf++);

    WriteSramFast(gBuf, dest->blueUnits,
        (UNIT_SAVE_AMOUNT_BLUE + UNIT_SAVE_AMOUNT_RED + UNIT_SAVE_AMOUNT_GREEN) * sizeof(struct SuspendSavePackedUnit));

    WritePermanentFlags(dest->permanentFlags);
    WriteChapterFlags(dest->chapterFlags);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteTraps(dest->traps);

    GetForceDisabledMenuItems(list);
    WriteAndVerifySramFast(list, dest->menuOverride, sizeof(list));

    chunk.magic32 = SAVE_MAGIC32_SUS;
    chunk.kind = SAVE_KIND_SUSPEND;
    WriteSaveBlockInfo(&chunk, slot);

    gBmSt.just_resumed = false;
    WriteSwappedSuspendSaveId();
}

void ReadSuspendSave(int slot)
{
    int i;
    u8 list[0x10];
    struct SuspendSaveBlock * src = GetSaveReadAddr(slot + gSuspendSaveIdOffset);

    ReadSramFast(&src->playSt, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);

    ReadSramFast(&src->action, &gActionSt, sizeof(src->action));
    LoadRNStateFromActionStruct();
    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        ReadSuspendSavePackedUnit(&src->blueUnits[i], &gUnitArrayBlue[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        ReadSuspendSavePackedUnit(&src->redUnits[i], &gUnitArrayRed[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        ReadSuspendSavePackedUnit(&src->greenUnits[i], &gUnitArrayGreen[i]);

    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadChapterFlags(src->chapterFlags);
    ReadTraps(src->traps);

    ReadSramFast(src->menuOverride, list, sizeof(list));
    SetForceDisabledMenuItems(list);

    SetBonusContentClaimFlags(LoadSavedBonusClaimFlags(gPlaySt.gameSaveSlot));
}

bool IsValidSuspendSave(int slot)
{
    if (!IsSramWorking())
        return false;

    if (slot != SAVE_SUSPEND)
        return false;

    gSuspendSaveIdOffset = GetLastSuspendSaveId();

    if (ReadSaveBlockInfo(NULL, SAVE_SUSPEND + gSuspendSaveIdOffset))
        return true;

    gSuspendSaveIdOffset = GetNextSuspendSaveId();

    if (ReadSaveBlockInfo(NULL, SAVE_SUSPEND + gSuspendSaveIdOffset))
        return true;

    gSuspendSaveIdOffset = 0x7F;
    return false;
}

void ReadSuspendSavePlaySt(int slot, struct PlaySt * buf)
{
    ReadGameSavePlaySt(slot + gSuspendSaveIdOffset, buf);
}

#if NONMATCHING
void EncodeSuspendSavePackedUnit(struct Unit * unit, void * buf)
{
    int i;
    struct SuspendSavePackedUnit * unit_su = buf;

    if (unit->pCharacterData == NULL)
    {
        unit_su->pid = 0;
        return;
    }

    unit_su->pid = UNIT_CHAR_ID(unit);
    unit_su->jid = unit->pClassData->number;
    unit_su->level = unit->level;
    unit_su->exp = unit->exp;
    unit_su->state = unit->state;
    unit_su->xPos = unit->xPos;
    unit_su->yPos = unit->yPos;
    unit_su->maxHP = unit->maxHP;
    unit_su->curHP = unit->curHP;
    unit_su->pow = unit->pow;
    unit_su->skl = unit->skl;
    unit_su->spd = unit->spd;
    unit_su->def = unit->def;
    unit_su->res = unit->res;
    unit_su->lck = unit->lck;
    unit_su->conBonus = unit->conBonus;
    unit_su->statusIndex_l = unit->statusIndex;
    unit_su->statusDuration = unit->statusDuration;
    unit_su->torchDuration = unit->torchDuration;
    unit_su->barrierDuration = unit->barrierDuration;
    unit_su->rescue = unit->rescue;
    unit_su->movBonus = unit->movBonus;

    unit_su->ballistaIndex =
        (0x7F & unit->ballistaIndex) | (0x01 & unit->supportBits) << 0x07;
    unit_su->item1 = (0x3FFF & unit->items[0]) | (0x06 & unit->supportBits) << 0x0D;
    unit_su->item2 = (0x3FFF & unit->items[1]) | (0x18 & unit->supportBits) << 0x0B;
    unit_su->item3 = (0x3FFF & unit->items[2]) | (0x60 & unit->supportBits) << 0x09;
    unit_su->item4 = unit->items[3];
    unit_su->item5 = unit->items[4];

    for (i = 0; i < 8; i++)
        unit_su->ranks[i] = unit->ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit_su->supports[i] = unit->supports[i];

    unit_su->aiFlags = unit->aiFlags;
    unit_su->ai1 = unit->ai1;
    unit_su->ai1data = unit->ai1data;
    unit_su->ai2 = unit->ai2;
    unit_su->ai2data = unit->ai2data;
    unit_su->ai3And4 = unit->ai3And4;
    unit_su->ai_counter = unit->_u46;
}
#else
NAKEDFUNC
void EncodeSuspendSavePackedUnit(struct Unit * unit, void * buf)
{
	asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, sl\n\
	mov r6, sb\n\
	mov r5, r8\n\
	push {r5, r6, r7}\n\
	sub sp, #0x20\n\
	adds r6, r0, #0\n\
	mov ip, r1\n\
	ldr r0, [r6]\n\
	cmp r0, #0\n\
	bne _080A1D9A\n\
	strb r0, [r1]\n\
	b _080A2024\n\
	_080A1D9A:\n\
	ldrb r0, [r0, #4]\n\
	mov r1, ip\n\
	strb r0, [r1]\n\
	ldr r0, [r6, #4]\n\
	ldrb r0, [r0, #4]\n\
	strb r0, [r1, #1]\n\
	movs r1, #8\n\
	ldrsb r1, [r6, r1]\n\
	mov r2, ip\n\
	adds r2, #0x24\n\
	movs r4, #0x1f\n\
	ands r1, r4\n\
	movs r3, #0x20\n\
	rsbs r3, r3, #0\n\
	adds r0, r3, #0\n\
	ldrb r5, [r2]\n\
	ands r0, r5\n\
	orrs r0, r1\n\
	strb r0, [r2]\n\
	ldrb r0, [r6, #9]\n\
	mov r7, ip\n\
	strb r0, [r7, #0x10]\n\
	ldr r0, [r6, #0xc]\n\
	str r0, [r7, #4]\n\
	movs r1, #0x10\n\
	ldrsb r1, [r6, r1]\n\
	movs r0, #0x3f\n\
	ands r1, r0\n\
	lsls r1, r1, #5\n\
	ldr r0, _080A2034 @ =0xFFFFF81F\n\
	ldrh r2, [r7, #0x24]\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strh r0, [r7, #0x24]\n\
	movs r1, #0x3f\n\
	ldrb r5, [r6, #0x11]\n\
	ands r1, r5\n\
	lsls r1, r1, #0xb\n\
	ldr r0, [r7, #0x24]\n\
	ldr r2, _080A2038 @ =0xFFFE07FF\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	str r0, [r7, #0x24]\n\
	ldrb r0, [r6, #0x12]\n\
	strb r0, [r7, #0xe]\n\
	ldrb r0, [r6, #0x13]\n\
	strb r0, [r7, #0xf]\n\
	movs r1, #0x14\n\
	ldrsb r1, [r6, r1]\n\
	mov r2, ip\n\
	adds r2, #0x26\n\
	ands r1, r4\n\
	lsls r1, r1, #1\n\
	movs r0, #0x3f\n\
	rsbs r0, r0, #0\n\
	ldrb r7, [r2]\n\
	ands r0, r7\n\
	orrs r0, r1\n\
	strb r0, [r2]\n\
	movs r1, #0x15\n\
	ldrsb r1, [r6, r1]\n\
	movs r2, #0x1f\n\
	ands r1, r2\n\
	lsls r1, r1, #6\n\
	ldr r0, _080A203C @ =0xFFFFF83F\n\
	mov r5, ip\n\
	ldrh r5, [r5, #0x26]\n\
	ands r0, r5\n\
	orrs r0, r1\n\
	mov r7, ip\n\
	strh r0, [r7, #0x26]\n\
	movs r1, #0x16\n\
	ldrsb r1, [r6, r1]\n\
	movs r0, #0x27\n\
	add r0, ip\n\
	mov r8, r0\n\
	lsls r1, r1, #3\n\
	movs r5, #7\n\
	mov sb, r5\n\
	movs r0, #7\n\
	mov r7, r8\n\
	ldrb r7, [r7]\n\
	ands r0, r7\n\
	orrs r0, r1\n\
	mov r1, r8\n\
	strb r0, [r1]\n\
	movs r0, #0x17\n\
	ldrsb r0, [r6, r0]\n\
	mov r1, ip\n\
	adds r1, #0x28\n\
	ands r0, r4\n\
	ldrb r5, [r1]\n\
	ands r3, r5\n\
	orrs r3, r0\n\
	strb r3, [r1]\n\
	movs r1, #0x18\n\
	ldrsb r1, [r6, r1]\n\
	ands r1, r2\n\
	lsls r1, r1, #5\n\
	ldr r0, _080A2040 @ =0xFFFFFC1F\n\
	mov r7, ip\n\
	ldrh r7, [r7, #0x28]\n\
	ands r0, r7\n\
	orrs r0, r1\n\
	mov r1, ip\n\
	strh r0, [r1, #0x28]\n\
	movs r1, #0x19\n\
	ldrsb r1, [r6, r1]\n\
	mov r2, ip\n\
	adds r2, #0x29\n\
	ands r1, r4\n\
	lsls r1, r1, #2\n\
	movs r0, #0x7d\n\
	rsbs r0, r0, #0\n\
	ldrb r3, [r2]\n\
	ands r0, r3\n\
	orrs r0, r1\n\
	strb r0, [r2]\n\
	movs r2, #0x1a\n\
	ldrsb r2, [r6, r2]\n\
	movs r3, #0x1f\n\
	ands r2, r3\n\
	lsls r2, r2, #0xf\n\
	mov r4, ip\n\
	ldr r0, [r4, #0x28]\n\
	ldr r1, _080A2044 @ =0xFFF07FFF\n\
	ands r0, r1\n\
	orrs r0, r2\n\
	str r0, [r4, #0x28]\n\
	adds r0, r6, #0\n\
	adds r0, #0x30\n\
	ldrb r2, [r0]\n\
	lsls r1, r2, #0x1c\n\
	lsrs r1, r1, #0x1c\n\
	adds r4, #0x2a\n\
	mov r5, sb\n\
	ands r1, r5\n\
	lsls r1, r1, #4\n\
	movs r0, #0x71\n\
	rsbs r0, r0, #0\n\
	ldrb r7, [r4]\n\
	ands r0, r7\n\
	orrs r0, r1\n\
	strb r0, [r4]\n\
	lsls r2, r2, #0x18\n\
	lsrs r2, r2, #0x1c\n\
	movs r0, #7\n\
	ands r2, r0\n\
	lsls r2, r2, #7\n\
	ldr r0, _080A2048 @ =0xFFFFFC7F\n\
	mov r1, ip\n\
	ldrh r1, [r1, #0x2a]\n\
	ands r0, r1\n\
	orrs r0, r2\n\
	mov r2, ip\n\
	strh r0, [r2, #0x2a]\n\
	adds r0, r6, #0\n\
	adds r0, #0x31\n\
	ldrb r2, [r0]\n\
	lsls r1, r2, #0x1c\n\
	lsrs r1, r1, #0x1c\n\
	adds r4, #1\n\
	ands r1, r5\n\
	lsls r1, r1, #2\n\
	movs r0, #0x1d\n\
	rsbs r0, r0, #0\n\
	ldrb r5, [r4]\n\
	ands r0, r5\n\
	orrs r0, r1\n\
	lsrs r2, r2, #4\n\
	lsls r2, r2, #5\n\
	ands r0, r3\n\
	orrs r0, r2\n\
	strb r0, [r4]\n\
	ldrb r0, [r6, #0x1b]\n\
	mov r7, ip\n\
	strb r0, [r7, #3]\n\
	movs r1, #0x1d\n\
	ldrsb r1, [r6, r1]\n\
	mov r2, ip\n\
	adds r2, #0x2c\n\
	movs r0, #0xf\n\
	ands r1, r0\n\
	movs r0, #0x10\n\
	rsbs r0, r0, #0\n\
	ldrb r3, [r2]\n\
	ands r0, r3\n\
	orrs r0, r1\n\
	strb r0, [r2]\n\
	movs r1, #0x7f\n\
	ldrb r4, [r6, #0x1c]\n\
	ands r1, r4\n\
	adds r0, r6, #0\n\
	adds r0, #0x39\n\
	ldrb r3, [r0]\n\
	movs r0, #1\n\
	ands r0, r3\n\
	lsls r0, r0, #7\n\
	orrs r1, r0\n\
	mov r0, ip\n\
	adds r0, #0x30\n\
	strb r1, [r0]\n\
	ldr r2, _080A204C @ =0x00003FFF\n\
	adds r1, r2, #0\n\
	ldrh r5, [r6, #0x1e]\n\
	ands r1, r5\n\
	movs r0, #6\n\
	ands r0, r3\n\
	lsls r0, r0, #0xd\n\
	orrs r1, r0\n\
	strh r1, [r7, #8]\n\
	adds r1, r2, #0\n\
	ldrh r7, [r6, #0x20]\n\
	ands r1, r7\n\
	movs r0, #0x18\n\
	ands r0, r3\n\
	lsls r0, r0, #0xb\n\
	orrs r1, r0\n\
	mov r0, ip\n\
	strh r1, [r0, #0xa]\n\
	adds r1, r2, #0\n\
	ldrh r4, [r6, #0x22]\n\
	ands r1, r4\n\
	movs r0, #0x60\n\
	ands r0, r3\n\
	lsls r0, r0, #9\n\
	orrs r1, r0\n\
	mov r5, ip\n\
	strh r1, [r5, #0xc]\n\
	ldrh r7, [r6, #0x24]\n\
	ands r2, r7\n\
	lsls r2, r2, #4\n\
	ldr r0, [r5, #0x2c]\n\
	ldr r1, _080A2050 @ =0xFFFC000F\n\
	ands r0, r1\n\
	orrs r0, r2\n\
	str r0, [r5, #0x2c]\n\
	ldrh r0, [r6, #0x26]\n\
	lsls r1, r0, #2\n\
	movs r0, #3\n\
	ldrh r2, [r5, #0x2e]\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strh r0, [r5, #0x2e]\n\
	movs r2, #0\n\
	adds r5, #0x1a\n\
	adds r7, r6, #0\n\
	adds r7, #0x32\n\
	movs r3, #0x42\n\
	adds r3, r3, r6\n\
	mov r8, r3\n\
	adds r4, r6, #0\n\
	adds r4, #0x43\n\
	str r4, [sp, #0xc]\n\
	movs r0, #0x21\n\
	add r0, ip\n\
	mov sb, r0\n\
	adds r1, r6, #0\n\
	adds r1, #0x44\n\
	str r1, [sp, #0x10]\n\
	movs r3, #0x22\n\
	add r3, ip\n\
	mov sl, r3\n\
	adds r4, #2\n\
	str r4, [sp, #0x14]\n\
	mov r0, ip\n\
	adds r0, #0x23\n\
	str r0, [sp]\n\
	subs r1, #4\n\
	str r1, [sp, #8]\n\
	adds r3, r6, #0\n\
	adds r3, #0x46\n\
	str r3, [sp, #0x18]\n\
	mov r4, ip\n\
	adds r4, #0x31\n\
	str r4, [sp, #4]\n\
	ldrb r1, [r6, #0xa]\n\
	mov r0, sp\n\
	strb r1, [r0, #0x1c]\n\
	subs r4, #0x1f\n\
	subs r3, #0x1e\n\
	_080A1FCC:\n\
	adds r0, r4, r2\n\
	adds r1, r3, r2\n\
	ldrb r1, [r1]\n\
	strb r1, [r0]\n\
	adds r2, #1\n\
	cmp r2, #7\n\
	ble _080A1FCC\n\
	movs r2, #0\n\
	adds r4, r5, #0\n\
	adds r3, r7, #0\n\
	_080A1FE0:\n\
	adds r0, r4, r2\n\
	adds r1, r3, r2\n\
	ldrb r1, [r1]\n\
	strb r1, [r0]\n\
	adds r2, #1\n\
	cmp r2, #6\n\
	ble _080A1FE0\n\
	mov r2, r8\n\
	ldrb r0, [r2]\n\
	mov r3, ip\n\
	strb r0, [r3, #2]\n\
	ldr r4, [sp, #0xc]\n\
	ldrb r0, [r4]\n\
	mov r5, sb\n\
	strb r0, [r5]\n\
	ldr r7, [sp, #0x10]\n\
	ldrb r0, [r7]\n\
	mov r1, sl\n\
	strb r0, [r1]\n\
	ldr r2, [sp, #0x14]\n\
	ldrb r0, [r2]\n\
	ldr r3, [sp]\n\
	strb r0, [r3]\n\
	ldr r4, [sp, #8]\n\
	ldrh r0, [r4]\n\
	mov r5, ip\n\
	strh r0, [r5, #0x32]\n\
	ldr r7, [sp, #0x18]\n\
	ldrb r0, [r7]\n\
	ldr r1, [sp, #4]\n\
	strb r0, [r1]\n\
	mov r2, sp\n\
	ldrb r2, [r2, #0x1c]\n\
	strb r2, [r5, #0x11]\n\
	_080A2024:\n\
	add sp, #0x20\n\
	pop {r3, r4, r5}\n\
	mov r8, r3\n\
	mov sb, r4\n\
	mov sl, r5\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
	_080A2034: .4byte 0xFFFFF81F\n\
	_080A2038: .4byte 0xFFFE07FF\n\
	_080A203C: .4byte 0xFFFFF83F\n\
	_080A2040: .4byte 0xFFFFFC1F\n\
	_080A2044: .4byte 0xFFF07FFF\n\
	_080A2048: .4byte 0xFFFFFC7F\n\
	_080A204C: .4byte 0x00003FFF\n\
	_080A2050: .4byte 0xFFFC000F\n\
	.syntax divided\n\
	");
}
#endif
