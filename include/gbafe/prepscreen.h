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

struct PrepScreenItemListEnt {
    /* 00 */ u8 pid; // 0 if item is in Supply inventory
    /* 01 */ u8 itemSlot;
    /* 02 */ u16 item;
};

extern EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenItemList[400];
extern EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenExtraItemList[400];

extern EWRAM_OVERLAY(0) u16 Unk_Prep_02012464;
extern EWRAM_OVERLAY(0) u16 Unk_Prep_02012466;

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
bool sub_808E7D4(struct Unit *unit);
bool IsUnitInCurrentRoster(struct Unit *unit);
// AtMenu_AddPrepScreenSupportMenuItem
int CanPrepScreenCheckMap(void);
void InitPrepScreenMainMenu(struct ProcAtMenu *proc);
int GetLatestUnitIndexInPrepListByUId(void);
int PrepGetLatestUnitIndex(void);
void ReorderPlayerUnitsBasedOnDeployment(void);
void SortPlayerUnitsForPrepScreen(void);
void RemoveSomeUnitItems(void);
void MakePrepUnitList(void);
int UnitGetIndexInPrepList(int pid);
void PrepUpdateSMS(void);
void PrepAutoCapDeployUnits(struct ProcAtMenu *proc);
void PrepRestartMuralBackground(void);
void EndMuralBackground_(void);
// nullsub_76
void Prep_DrawChapterGoal(int vram_offset, int pal_bank);
void PrepAtMenu_OnInit(struct ProcAtMenu *proc);

struct ProcPrepMenuDesc {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ u16 unk4C;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int msg;
};

// ResetPrepMenuDescTexts
// ParsePrepMenuDescTexts
// DrawPrepMenuDescTexts
void PrepMenuDescOnInit(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnParse(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnDraw(void);
void StartPrepMenuDescHandler(int msg, ProcPtr parent);
// StartPrepAtSubMenuUI
// DrawAtMenuUpfx
void AtMenu_Reinitialize(struct ProcAtMenu *proc);
void EndPrepAtMenuIfNoUnitAvailable(struct ProcAtMenu *proc);
void AtMenu_UpdateDesc(struct ProcAtMenu *proc);
// sub_808F2E4
// sub_808F368
void AtMenu_SetupCtrlUI(struct ProcAtMenu *proc);
void AtMenu_CtrlLoop(struct ProcAtMenu *proc);
void AtMenuSetUnitStateAndEndFlag(struct ProcAtMenu *proc);
void AtMenu_ResetScreenEffect(struct ProcAtMenu *proc);
void AtMenu_ResetBmUiEffect(struct ProcAtMenu *proc);
void AtMenu_StartSubmenu(struct ProcAtMenu *proc);
void AtMenu_OnSubmenuEnd(struct ProcAtMenu *proc);
// sub_808F7B4
void AtMenu_LockGame(struct ProcAtMenu *proc);
void AtMenu_UnlockGame(struct ProcAtMenu *proc);
// sub_808F804
// sub_808F818
bool HasConvoyAccess_(void);
// sub_808F8D0
// sub_808F938
// sub_808F970
void AtUnkMenu_Reinitialize(struct ProcAtMenu *proc);
void sub_808FCAC(struct ProcAtMenu *proc);
void sub_808FCF8(struct ProcAtMenu *proc);
void sub_808FD10(struct ProcAtMenu *proc);
void sub_808FD7C(struct ProcAtMenu *proc);
void sub_808FDE8(struct ProcAtMenu *proc);
void sub_808FE6C(struct ProcAtMenu *proc);
void sub_808FED8(struct ProcAtMenu *proc);
void sub_808FEE0(struct ProcAtMenu *proc);
void ConvoyPromotion_Init(ProcPtr proc);
void sub_808FFD0(ProcPtr proc);
void NullExpForChar100AndResetScreen(ProcPtr proc);
void PrepPromoteDebugMaybe(struct ProcAtMenu *proc);
void sub_80900E8(struct ProcAtMenu *proc);
// sub_8090104
// sub_8090118
// sub_8090130
// sub_8090148
// PrepScreenSprite_OnDraw
// nullsub_77

struct ProcPrepSpecialChar {
    PROC_HEADER;

    u8 unk_29;
    u8 unk_2A;
    u8 unk_2B;

    STRUCT_PAD(0x2C, 0x2F);

    /* 2F */ u8 config;

    STRUCT_PAD(0x30, 0x32);

    /* 32 */ u8 blink_n;
    /* 34 */ u16 timer;
    /* 38 */ ProcPtr approc;
};

void ProcPrepSpChar_OnInit(struct ProcPrepSpecialChar *proc);
void ProcPrepSpChar_Idle(struct ProcPrepSpecialChar *proc);
void ProcPrepSpChar_OnEnd(struct ProcPrepSpecialChar *proc);
void PrepSpecialChar_BlinkButtonStart(void);
ProcPtr StartPrepSpecialCharEffect(ProcPtr parent);
void EndPrepSpecialCharEffect(void);

// sub_80903FC
void PrepMenu_OnInit(ProcPtr proc);
void PrepMenu_CtrlLoop(ProcPtr proc);
void PrepMenu_ShowFrozenHand(ProcPtr proc);
void PrepMenu_ShowActiveHand(ProcPtr proc);
void PrepMenu_OnEnd(ProcPtr proc);
// PrepMenu_OnEnd
// StartPrepScreenMenu
// SetPrepScreenMenuOnBPress
// SetPrepScreenMenuOnStartPress
// SetPrepScreenMenuOnEnd
// SetPrepScreenMenuItem
// SetPrepScreenMenuSelectedItem
int GetActivePrepMenuItemIndex(void);
// DrawPrepScreenMenuFrameAt
// GetPrepMenuItemAmt
void EndPrepScreenMenu(void);
// sub_8090A1C
// sub_8090A88
// sub_8090AA4
// sub_8090AC0
void EnablePrepScreenMenu(void);
void MenuScroll_Init(ProcPtr proc);
void MenuScroll_Loop(ProcPtr proc);
// LockMenuScrollBar
// TryHideMenuScrollBar
// EndMenuScrollBar
// StartMenuScrollBar
// PutMenuScrollBarAt
// UpdateMenuScrollBarConfig
// InitMenuScrollBarImg
// sub_8090E80
// sub_8090EC0

struct ProcPrepMuralBackground {
    PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ u8 unk_2C;
    /* 2D */ u8 pal_bank;
};

void PrepMuralBackground_Init(struct ProcPrepMuralBackground *proc);
void PrepMuralBackground_Loop(struct ProcPrepMuralBackground *proc);
void StartPrepMuralBackground(void *vram, int pal_bank);
void EndPrepMuralBackground(void);
// sub_8091118

struct SallyCirProc {
    PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2C */ int unk_2c;
};

void SallyCir_Init(struct SallyCirProc *proc);
void SallyCir_Loop(struct SallyCirProc *proc);
void SallyCir_OnEnd(struct SallyCirProc *proc);
ProcPtr StartSallyCirProc(ProcPtr parent, u8 unk);
// sub_809139C
// sub_809145C
// sub_8091588
// GetConvoyItemCount_
void ViewCounter_Loop(ProcPtr proc);
// StartViewCounter
void TryLockProc(ProcPtr proc);
void TryUnlockProc(ProcPtr proc);
void PrepHbKeyListener_Loop(ProcPtr proc);
// StartPrepErrorHelpbox
// IsWeaponUsable
// CountUnitUsableWeapons
// sub_80916F4
// CheckValidLinkArenaItemSwap
// CheckValidLinkArenaItemSupply
// sub_8091828
// sub_809186C

struct PrepItemTypePageEnt {
    /* 00 */ u8 lowerBound;
    /* 01 */ u8 upperBound;
};

// GetPrepPageForItem
// sub_80918D8
// SomethingPrepListRelated
// sub_8091B48
// sub_8091B8C
// sub_8091BAC
// sub_8091BD4
// sub_8091C08
// CanUnitPrepScreenUse

struct PrepItemScreenProc {
    PROC_HEADER;
};

void PrepItemScreen_OnHBlank(void);
void PrepItemScreen_Init(struct PrepItemScreenProc * proc);
void PrepItemScreen_DrawFunds(void);
void PrepItemScreen_HideFunds(void);
void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc);
void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc);
// sub_8092194
// sub_80921FC
// sub_809221C
// sub_809223C
// sub_809225C
// sub_809228C
// sub_80922DC
void PrepItemScreen_Reinit(struct PrepItemScreenProc * proc);
// sub_8092420
// sub_809257C
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc * proc);
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc * proc);
void sub_80926F0(struct PrepItemScreenProc * proc);
// sub_8092838
// sub_8092920
void sub_8092A1C(struct PrepItemScreenProc * proc);
void sub_8092A9C(struct PrepItemScreenProc * proc);
void sub_8092AF8(struct PrepItemScreenProc * proc);
void sub_8092B30(struct PrepItemScreenProc * proc);
// sub_8092E84
void sub_8092EDC(struct PrepItemScreenProc * proc);
void sub_8093004(struct PrepItemScreenProc * proc);
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc * proc);
void StartPrepItemTradeScreen(struct PrepItemScreenProc * proc);
void sub_8093198(struct PrepItemScreenProc * proc);
void sub_80931B0(struct PrepItemScreenProc * proc);
void StartPrepArmory(struct PrepItemScreenProc * proc);
void sub_80931E0(struct PrepItemScreenProc * proc);
// UpdatePrepItemScreenFace
// EndPrepItemScreenFace
// StartPrepItemScreen
// sub_80932DC
// sub_80933F0
// sub_8093478
// sub_8093540
// PrepItem_DrawSMS
// PrepItemDrawPopupBox
// sub_80937E0
// PrepItemScreen_GiveAll

struct ProcPrepUnit {
    PROC_HEADER;
};

void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line);
void PrepUpdateMenuTsaScroll(int val);
void PrepUnit_DrawSMSAndObjs(struct ProcPrepUnit *proc);
void PrepUnit_InitTexts(void);
void PrepUnit_InitGfx(void);
// sub_8093B5C
void PrepUnit_InitSMS(struct ProcPrepUnit *proc);
void PrepUnit_DrawLeftUnitName(struct Unit *unit);
void PrepUnit_DrawLeftUnitNameCur(struct ProcPrepUnit *proc);
void PrepUnit_DrawUnitItems(struct Unit *unit);
void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit *proc, s8 val);
bool PrepCheckCanSelectUnit(struct ProcPrepUnit *proc, struct Unit *unit);
bool PrepCheckCanUnselectUnit(struct ProcPrepUnit *proc, struct Unit *unit);
bool PrepUnit_HandlePressA(struct ProcPrepUnit *proc);
// sub_809402C
bool ShouldPrepUnitMenuScroll(struct ProcPrepUnit *proc);
// sub_80940C4
// sub_809410C
void ProcPrepUnit_OnInit(struct ProcPrepUnit *proc);
void ProcPrepUnit_InitScreen(struct ProcPrepUnit *proc);
void sub_8094374(struct ProcPrepUnit *proc);
void ProcPrepUnit_Idle(struct ProcPrepUnit *proc);
void sub_809463C(struct ProcPrepUnit *proc);
void sub_8094684(struct ProcPrepUnit *proc);
// nullsub_11
void sub_80946D0(struct ProcPrepUnit *proc);
void sub_80946E8(struct ProcPrepUnit *proc);
void sub_8094714(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnEnd(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnGameStart(struct ProcPrepUnit *proc);
void sub_80947C0(struct ProcPrepUnit *proc);
void sub_80947E0(struct ProcPrepUnit *proc);
void PrepUnitDisableDisp(struct ProcPrepUnit *proc);
void PrepUnitEnableDisp(struct ProcPrepUnit *proc);
void sub_809486C(struct ProcPrepUnit *proc);
void sub_8094888(struct ProcPrepUnit *proc);

// PrepItemTrade_ApplyItemSwap
// PrepItemTrade_DpadKeyHandler
// sub_8094AC0
// sub_8094BA4
// sub_8094BE0
// sub_8094EC0
// PrepItemTrade_OnEnd
// StartPrepItemTradeScreenProc
// sub_80951FC
// PrepItemUseTryMoveHand
// DrawPrepScreenItemUseStatLabels
// DrawPrepScreenItemUseStatBars
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
// PrepItemUseBooster_OnInit
// PrepItemUseBooster_IDLE
// PrepItemUseBooster_OnEnd
// sub_80963FC
// sub_8096430
// StoreConvoyWeaponIconGraphics
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
// StartPrepItemSupplyProc
// sub_8097C10
// sub_8097C30
// StartBmSupply
// MaybeStartSelectConvoyItemProc
// PrepItemList_Init
// sub_8097CDC
// PrepItemList_DrawCurrentOwnerText
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
// PrepItemList_StartTradeScreen
// StartPrepItemListScreenProc
// WmSell_DrawSupplyDialogueSpriteText
// sub_8098EC0
// sub_8098EF4
// WmSell_Init
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
// WmSell_OnEnd
// StartWorldMapSellScreen
// sub_8099840
// FortuneSubMenu_Init_Null
// nullsub_79
// FortuneSubMenu_Unused_SetAvailableOptions
// FortuneSubMenu_Unused_SetupText
// sub_809997C
// sub_8099A20
// sub_8099B2C
// sub_8099B50
// StartFortuneSubMenu
// sub_8099BB0
// GetChapterDivinationTextIdHectorStory
// GetChapterDivinationTextIdBeginning
// sub_8099C44
// sub_8099C60
// GetChapterDivinationPortrait
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

extern EWRAM_DATA struct SioPidPool gSioPidPool;
extern EWRAM_OVERLAY(0) struct Text gPrepMainMenuTexts[10];

extern CONST_DATA u16 gBgConfig_PrepScreen[];
extern CONST_DATA int Msgs_PrepMainMenuHelpbox[][3];
extern struct ProcCmd ProcScr_PrepMenuDescHandler[];
// ??? ProcScr_AtMenu
extern struct ProcCmd ProcScr_PrepPromoteDebug[];
// ??? ProcScr_AtUnkMenu
// ??? Sprite_08D8C52E
// ??? Sprite_08D8C53C
// ??? Sprite_08D8C544
// ??? Sprite_08D8C55E
// ??? Sprites_08D8C5D8
// ??? ProcScr_PrepSpecialCharEff
// ??? ProcScr_PrepScreenMenuDummyItem
// ??? ProcScr_PrepMenu
// ??? Sprite_MenuScrollContainer
// ??? Sprite_08D8C744
// ??? Sprite_08D8C74C
// ??? Sprites_08D8C794
// ??? Sprites_08D8C7E8
// ??? ProcScr_menu_scroll
// ??? ProcScr_PrepMuralBackground
// ??? ProcScr_SallyCir
// ??? ProcScr_ViewCounter
// ??? ProcScr_PrepHelpboxListener
// ??? gPrepItemTypePageLut
// ??? gHelpTextIds_PrepItemScreen
// ??? ProcScr_PrepItemScreen
// ??? Sprite_08D8CDA8
extern u16 Sprite_08D8CDBC[];
extern u16 Sprite_08D8CDD0[];
// ??? ProcScr_PrepUnitScreen
// ??? ProcScr_PrepItemTradeScreen
extern struct ProcCmd ProcScr_PrepItemUseScreen[];
// ??? gUnk_08D8D10C
// ??? gUnk_08D8D118
// ??? ProcScr_PrepItemSupplyScreen
// ??? ProcScr_BmSupplyScreen
// ??? ProcScr_PrepItemListScreen
// ??? gUnk_08D8D410
// ??? gProcScr_PrepWMShopSell
// ??? gUnk_08D8D4E8
// ??? gUnk_08D8D4F8
// ??? gUnk_08D8D51C
// ??? ProcScr_FortuneSubMenu
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
// ??? sSupportScreenUnits
// ??? ProcScr_SupportScreen
// ??? gUnk_08D8DE48
// ??? gUnk_08D8DEB0
// ??? gUnk_08D8DEB8
// ??? gUnk_08D8DEC6
// ??? gUnk_08D8DED4
// ??? gUnk_08D8DEE2
// ??? gProcScr_SupportUnitSubScreen
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
