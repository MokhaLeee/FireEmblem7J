#pragma once

#include "global.h"

enum proc_label_atmenu {
	PL_ATMENU_01 = 1,
	PL_ATMENU_02,
	PL_ATMENU_03,
	PL_ATMENU_04,
	PL_ATMENU_05,
	PL_ATMENU_06,
	PL_ATMENU_07,
	PL_ATMENU_08,
	PL_ATMENU_09,
	PL_ATMENU_0A,
	PL_ATMENU_0B,
	PL_ATMENU_0C,
	PL_ATMENU_0D,
	PL_ATMENU_0E,
	PL_ATMENU_0F,
	PL_ATMENU_10,
};

struct ProcAtMenu {
    PROC_HEADER;
    /* 29 */ u8 unit_count;
    /* 2A */ u8 max_counter; // Total unit number can be on battle
    /* 2B */ u8 cur_counter; // Total unit number to be on battle

    /* 2C */ u8 unk_2C;

    /* 2D */ u8 cur_cmd;
    /* 2E */ u8 hand_pos;     // related to the displayed line maybe (also for handle sprite)
    /* 2F */ u8 cmd_mask;

    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;

    /* 33 */ u8 state;
    /* 34 */ u8 do_help;     // 1 if helpBox on

    /* 35 */ u8 unk_35;

    /* 36 */ bool8 end_prep;

    /* 38 */ u8 unk_38[0x3C - 0x38];

    /* 3C */ u16 yDiff; // y Pos offset of Unit SMS

    /* 3E */ u16 unk3E;

    /* 40 */ u32 xDiff;
};

struct SioPidPool {
    u8 pids[8];
};

extern EWRAM_DATA struct SioPidPool gSioPidPool;

struct PrepUnitList {
    struct Unit *units[0x40];
    int max_num;        /* A counter maybe related to the amount of units in team */
    int latest_pid;     /* Last unit char-id when you leave the prep-unit-screen */
};

extern EWRAM_OVERLAY(0) struct PrepUnitList gPrepUnitList;

int GetPrepMainMenuInfoxMsg(void);
int PrepOptionCountToRealIndexByMask(int target, int mask);
int GetPrepOptionCount(int mask);
void PutPrepMenuUiImg(int vram, int palId);
void sub_808E454(u16 * tm, int b, u32 c, int d);
void PrepScreenMenu_OnPickUnits(struct ProcAtMenu * proc);
void PrepScreenMenu_OnItems(struct ProcAtMenu * proc);
void PrepScreenMenu_OnSupport(struct ProcAtMenu * proc);
void PrepScreenMenu_OnSave(struct ProcAtMenu * proc);
int PrepScreenMenu_OnStartPress(struct ProcAtMenu * proc);
// PrepScreenMenu_808E57C
int PrepScreenMenu_OnBPress(struct ProcAtMenu * proc);
void PrepScreenMenu_OnCheckMap(struct ProcAtMenu * proc);
// nullsub_74
// nullsub_75
void ResetSioPidPool(void);
void RegisterSioPid(u8 val);
void RemoveSioPid(u8 val);
struct Unit * GetUnitFromPrepList(int index);
void RegisterPrepUnitList(int index, struct Unit *);
int PrepGetUnitAmount();
void PrepSetUnitAmount(int);
int PrepGetLatestCharId();
void PrepSetLatestCharId(int val);
// IsCharacterForceDeployed
// CalcForceDeployedUnitCounts
// sub_808E7D4
// IsUnitInCurrentRoster
// AtMenu_AddPrepScreenSupportMenuItem
int CanPrepScreenCheckMap(void);
// InitPrepScreenMainMenu
// GetLatestUnitIndexInPrepListByUId
// PrepGetLatestUnitIndex
// ReorderPlayerUnitsBasedOnDeployment
// SortPlayerUnitsForPrepScreen
// RemoveSomeUnitItems
// MakePrepUnitList
// UnitGetIndexInPrepList
// PrepUpdateSMS
// sub_808ED24
// PrepRestartMuralBackground
// EndMuralBackground_
// nullsub_76
// Prep_DrawChapterGoal
// PrepAtMenu_OnInit
// ResetPrepMenuDescTexts
// ParsePrepMenuDescTexts
// DrawPrepMenuDescTexts
// PrepMenuDescOnInit
// PrepMenuDescOnParse
// PrepMenuDescOnDraw
// StartPrepMenuDescHandler
// StartPrepAtSubMenuUI
// DrawAtMenuUpfx
// AtMenu_Reinitialize
// EndPrepAtMenuIfNoUnitAvailable
// sub_808F2BC
// sub_808F2E4
// sub_808F368
// sub_808F394
// sub_808F3BC
// sub_808F5CC
// sub_808F604
// sub_808F670
// sub_808F6AC
// sub_808F740
// sub_808F7B4
// sub_808F7D4
// sub_808F7EC
// sub_808F804
// sub_808F818
// sub_808F834
// sub_808F8D0
// sub_808F938
// sub_808F970
// sub_808F9E0
// sub_808FCAC
// sub_808FCF8
// sub_808FD10
// sub_808FD7C
// sub_808FDE8
// sub_808FE6C
// sub_808FED8
// sub_808FEE0
// sub_808FF58
// sub_808FFD0
// NullExpForChar100AndResetScreen
// PrepPromoteDebugMaybe
// sub_80900E8
// sub_8090104
// sub_8090118
// sub_8090130
// sub_8090148
// sub_8090244
// nullsub_77
// sub_80902F0
// sub_8090388
// sub_809039C
void PrepSpecialChar_BlinkButtonStart(void);
// sub_80903C4
// EndPrepSpecialCharEffect
// sub_80903FC
// sub_8090494
// sub_80904D8
// sub_8090720
// sub_8090748
// sub_8090774
// StartPrepScreenMenu
// SetPrepScreenMenuOnBPress
// SetPrepScreenMenuOnStartPress
// sub_80907E4
// SetPrepScreenMenuItem
// SetPrepScreenMenuSelectedItem
int GetActivePrepMenuItemIndex(void);
// SetPrepScreenMenuPosition
// sub_80909DC
// EndPrepScreenMenu
// sub_8090A1C
// sub_8090A88
// sub_8090AA4
// sub_8090AC0
// sub_8090ADC
// sub_8090AF8
// sub_8090B2C
// sub_8090D84
// sub_8090DA0
// sub_8090DBC
// sub_8090DD0
// sub_8090DE4
// sub_8090E04
// sub_8090E38
// sub_8090E80
// sub_8090EC0
// sub_8090F14
// sub_8090FD4
// StartPrepMuralBackground
// sub_8091104
// sub_8091118
// sub_809115C
// sub_80912AC
// sub_8091370
// sub_809137C
// sub_809139C
// sub_809145C
// sub_8091588
// sub_809158C
// sub_809159C
// sub_80915D8
// TryLockProc
void TryUnlockProc(ProcPtr proc);
// sub_809163C
// sub_8091664
// sub_809169C
// sub_80916C4
// sub_80916F4
// sub_8091730
// sub_80917D4
// sub_8091828
// sub_809186C
// sub_80918A4
// sub_80918D8
// sub_8091A74
// sub_8091B48
// sub_8091B8C
// sub_8091BAC
// sub_8091BD4
// sub_8091C08
// sub_8091C28
// sub_8091C60
// sub_8091C90
// sub_8091CC8
// sub_8091D14
// sub_8091D38
// sub_8092150
// sub_8092194
// sub_80921FC
// sub_809221C
// sub_809223C
// sub_809225C
// sub_809228C
// sub_80922DC
// sub_8092310
// sub_8092420
// sub_809257C
// sub_80926A4
// sub_80926D0
// sub_80926F0
// sub_8092838
// sub_8092920
// sub_8092A1C
// sub_8092A9C
// sub_8092AF8
// sub_8092B30
// sub_8092E84
// sub_8092EDC
// sub_8093004
// sub_8093014
// sub_8093168
// sub_8093198
// sub_80931B0
// sub_80931C8
// sub_80931E0
// sub_80931F8
// sub_80932B0
// sub_80932C8
// sub_80932DC
// sub_80933F0
// sub_8093478
// sub_8093540
// sub_8093550
// sub_80935C4
// sub_80937E0
// sub_8093814
// sub_809385C
// sub_8093920
// sub_8093948
// sub_8093AB4
// sub_8093B14
// sub_8093B5C
// sub_8093BC8
// sub_8093C00
// sub_8093CC0
// sub_8093CD0
// sub_8093DC8
// sub_8093E9C
// sub_8093F10
// sub_8093F88
// sub_809402C
// sub_809408C
// sub_80940C4
// sub_809410C
// sub_8094138
// sub_8094178
// sub_8094374
// sub_8094398
// sub_809463C
// sub_8094684
// nullsub_11
// sub_80946D0
// sub_80946E8
// sub_8094714
// sub_8094774
// sub_80947A0
// sub_80947C0
// sub_80947E0
// sub_8094828
// sub_809484C
// sub_809486C
// sub_8094888
// sub_80948A0
// sub_80948CC
// sub_8094AC0
// sub_8094BA4
// sub_8094BE0
// sub_8094EC0
// sub_80951C0
// sub_80951D8
// sub_80951FC
// sub_809521C
// sub_80952B0
// sub_8095430
// sub_80955D0
// sub_8095750
// sub_8095800
// sub_8095824
// sub_8095830
// sub_8095B64
// sub_8095C90
// sub_8095CA8
// sub_8095D1C
// sub_8095D38
// sub_8095D58
// PrepItemUse_HandleItemEffect
// PrepItemUse_ExecPromotionItem
// PrepItemUse_WaitPromotionDone
// PrepItemUse_PostPromotion
// PrepItemUse_ResetBgmAfterPromo
// sub_80960C4
// StartPrepItemUseScreen
// PrepItemUseBooster_OnDraw
// sub_80961B8
// sub_8096330
// sub_8096374
// sub_80963FC
// sub_8096430
// sub_8096464
// sub_80964A0
// sub_80965B4
// sub_8096618
// sub_80966CC
// sub_8096708
// sub_8096784
// sub_80967C0
// sub_8096834
// sub_80968E8
// sub_8096938
// sub_8096970
// sub_80969A8
// sub_8096A38
// sub_8096A78
// sub_8096D88
// sub_8096DEC
// sub_8097020
// sub_80970D4
// sub_8097178
// sub_8097224
// sub_80972A8
// sub_809733C
// sub_80973E0
// sub_80973EC
// sub_809754C
// sub_80978D8
// sub_8097974
// sub_8097990
// sub_8097AB0
// sub_8097BBC
// sub_8097BF4
// sub_8097C10
// sub_8097C30
// sub_8097C54
// sub_8097C74
// sub_8097C94
// sub_8097CDC
// sub_8097D1C
// sub_8097DD4
// sub_8097E64
// sub_80981E0
// sub_8098210
// sub_80982D8
// sub_8098384
// sub_8098430
// sub_80984B4
// sub_8098558
// sub_80986C0
// sub_8098754
// sub_8098B60
// sub_8098C0C
// sub_8098C48
// sub_8098D04
// sub_8098E3C
// sub_8098E74
// sub_8098E8C
// sub_8098EC0
// sub_8098EF4
// sub_8098F2C
// sub_8098F3C
// sub_8098FDC
// sub_8099050
// sub_80990A4
// sub_8099128
// sub_8099168
// sub_80991C4
// sub_8099438
// sub_80994D4
// sub_8099534
// sub_8099688
// sub_80996D4
// sub_8099764
// sub_8099810
// sub_8099828
// sub_8099840
// nullsub_78
// nullsub_79
// sub_809987C
// sub_80998A8
// sub_809997C
// sub_8099A20
// sub_8099B2C
// sub_8099B50
// sub_8099B94
// sub_8099BB0
// sub_8099BF8
// sub_8099C28
// sub_8099C44
// sub_8099C60
// sub_8099C7C
// sub_8099C98
// sub_8099CB4
// sub_8099CDC
// sub_8099CF0
// sub_8099D00
// sub_8099D18
// sub_8099DC0
// sub_8099DC8
// sub_8099E1C
// sub_8099E34
// sub_8099FE8
// sub_809A044
// sub_809A0E8
// sub_809A214
// sub_809A270
// sub_809A294
// sub_809A2E4
// sub_809A324
// sub_809A404
// sub_809A47C
// sub_809A528
// sub_809A560
// sub_809A978
// sub_809A9FC
// sub_809AC5C
// sub_809AD54
// sub_809ADDC
// sub_809AEDC
// sub_809AF38
// sub_809B028
// sub_809B098
// sub_809B1FC
// sub_809B214
// sub_809B248
// sub_809B2A0
// sub_809B2BC
// sub_809B2FC
// sub_809B380
// sub_809B510
// sub_809B554
// sub_809B598
// sub_809B5F8
// sub_809B654
// sub_809B674
// sub_809B6D4
// sub_809B6F8
// sub_809B73C
// sub_809B798
// sub_809B7BC
// sub_809B818
// sub_809B858
// sub_809B874
// sub_809B890
// sub_809B8D0
// sub_809B968
// sub_809BA00

// ??? Msgs_PrepMainMenuHelpbox
// ??? ProcScr_PrepMenuDescHandler
// ??? gUnk_08D8C154
extern struct ProcCmd ProcScr_PrepPromoteDebug[];
// ??? gUnk_08D8C3A4
// ??? gUnk_08D8C52E
// ??? gUnk_08D8C53C
// ??? gUnk_08D8C544
// ??? gUnk_08D8C55E
// ??? gUnk_08D8C5D8
// ??? gUnk_08D8C6AC
// ??? gUnk_08D8C6D4
// ??? gUnk_08D8C6E4
// ??? gUnk_08D8C73C
// ??? gUnk_08D8C744
// ??? gUnk_08D8C74C
// ??? gUnk_08D8C794
// ??? gUnk_08D8C7E8
// ??? gUnk_08D8C8AC
// ??? gUnk_08D8C8E4
// ??? gUnk_08D8C904
// ??? gUnk_08D8C94C
// ??? gUnk_08D8C96C
// ??? gUnk_08D8C984
// ??? gUnk_08D8C9A8
// ??? gUnk_08D8C9C0
// ??? gUnk_08D8CDA8
// ??? gUnk_08D8CDBC
// ??? gUnk_08D8CDD0
// ??? gUnk_08D8CDE4
// ??? gUnk_08D8CF74
extern struct ProcCmd ProcScr_PrepItemUseScreen[];
// ??? gUnk_08D8D10C
// ??? gUnk_08D8D118
// ??? gUnk_08D8D120
// ??? gUnk_08D8D1F0
// ??? gUnk_08D8D318
// ??? gUnk_08D8D410
// ??? gUnk_08D8D418
// ??? gUnk_08D8D4E8
// ??? gUnk_08D8D4F8
// ??? gUnk_08D8D51C
// ??? gUnk_08D8D538
// ??? gUnk_08D8D5F8
// ??? gUnk_08D8D60C
// ??? gUnk_08D8D620
// ??? gUnk_08D8D634
// ??? gUnk_08D8D674
// ??? gUnk_08D8D688
// ??? gUnk_08D8D720
// ??? gUnk_08D8D738
// ??? gUnk_08D8D744
// ??? gUnk_08D8D84C
// ??? gUnk_08D8DCD4
// ??? gUnk_08D8DD0C
// ??? gUnk_08D8DD68
// ??? gUnk_08D8DE48
// ??? gUnk_08D8DEB0
// ??? gUnk_08D8DEB8
// ??? gUnk_08D8DEC6
// ??? gUnk_08D8DED4
// ??? gUnk_08D8DEE2
// ??? gUnk_08D8DEF8
// ??? gUnk_08D8E040
// ??? gUnk_08D8E084
// ??? gUnk_08DA4190
// ??? gUnk_08DA41B0
// ??? gUnk_08DA9A98
// ??? gUnk_08DA9AB8
// ??? gUnk_08DA9AD8
// ??? gUnk_08DA9AF8
// ??? gUnk_08DA9B78
// ??? gUnk_08DA9B98
// ??? gUnk_08DA9BB8
// ??? gUnk_08DA9D18
// ??? gUnk_08DA9D38
// ??? gUnk_08DAD284
// ??? gpSramExtraData
// ??? gExtraMapInfo
// ??? gUnk_08DAD29C
