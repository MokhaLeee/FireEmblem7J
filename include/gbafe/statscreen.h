#pragma once

#include "proc.h"
#include "text.h"

enum statscreen_frame_rect {
    PAGE_FRAME_SCREEN_X = 12,
    PAGE_FRAME_SCREEN_Y = 2,
};

enum statscreen_page_idx {
    STATSCREEN_PAGE_PERSONALINFO,
    STATSCREEN_PAGE_ITEMS,
    STATSCREEN_PAGE_WEXPANDSUPPORTS,

    STATSCREEN_PAGE_MAX
};

enum statscreen_text_index {
    STATSCREEN_TEXT_PNAME,
    STATSCREEN_TEXT_JNAME,
    STATSCREEN_TEXT_UNUSED,
    STATSCREEN_TEXT_POW,
    STATSCREEN_TEXT_SKL,
    STATSCREEN_TEXT_SPD,
    STATSCREEN_TEXT_LCK,
    STATSCREEN_TEXT_DEF,
    STATSCREEN_TEXT_RES,
    STATSCREEN_TEXT_MOV,
    STATSCREEN_TEXT_CON,
    STATSCREEN_TEXT_AID,
    STATSCREEN_TEXT_RESCUE,
    STATSCREEN_TEXT_AFFINITY,
    STATSCREEN_TEXT_STATUS,
    // TODO: assert that there are as many items here than in inv
    STATSCREEN_TEXT_ITEM_A,
    STATSCREEN_TEXT_ITEM_B,
    STATSCREEN_TEXT_ITEM_C,
    STATSCREEN_TEXT_ITEM_D,
    STATSCREEN_TEXT_ITEM_E,
    STATSCREEN_TEXT_EQUIPRANGE,
    STATSCREEN_TEXT_EQUIPATTACK,
    STATSCREEN_TEXT_EQUIPHIT,
    STATSCREEN_TEXT_EQUIPCRIT,
    STATSCREEN_TEXT_EQUIPAVOID,
    STATSCREEN_TEXT_WEXP_A,
    STATSCREEN_TEXT_WEXP_B,
    STATSCREEN_TEXT_WEXP_C,
    STATSCREEN_TEXT_WEXP_D,
    STATSCREEN_TEXT_SUPPORT_A,
    STATSCREEN_TEXT_SUPPORT_B,
    STATSCREEN_TEXT_SUPPORT_C,
    STATSCREEN_TEXT_SUPPORT_D,
    STATSCREEN_TEXT_SUPPORT_E,
    STATSCREEN_TEXT_BWL,

    MAX_STATSCREEN_TEXT,
};

struct HelpBoxInfo;

struct StatScreenSt {
    /* 00 */ u8 page;
    /* 01 */ u8 page_count;
    /* 02 */ u16 page_slide_key_bit;
    /* 04 */ s16 x_disp_off; // Note: Always 0, not properly taked into account by most things
    /* 06 */ s16 y_disp_off;
    /* 08 */ bool is_transitioning;
    /* 0C */ struct Unit * unit;
    /* 10 */ struct MuProc * mu;
    /* 14 */ struct HelpBoxInfo const * help;
    /* 18 */ struct Text text[MAX_STATSCREEN_TEXT];
};

extern struct StatScreenSt gStatScreenSt;
extern u16 gUiTmScratchA[];
extern u16 gUiTmScratchB[];
extern u16 gUiTmScratchC[];

void DrawUiGaugeBitmapEdgeColumn(u8 * bitmap, int pixels_per_line, int column);
void DrawUiGaugeBitmapBaseColumn(u8 * bitmap, int pixels_per_line, int column);
void DrawUiGaugeBitmapFilledColumn(u8 * bitmap, int pixels_per_line, int column);
void DrawUiGaugeBitmapBonusColumn(u8 * bitmap, int pixels_per_line, int column);
void DrawUiGauge(int chr, int dot_x, int chr_count, int dot_width, int dot_plain, int dot_bonus);
void PutDrawUiGauge(int chr, int width, u16 * tm, int tileref, int dot_width, int dot_plain, int dot_bonus);

struct MuralBackgroundProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 pad_29[0x4C - 0x29];
    /* 4C */ s16 offset;
};

void BackgroundSlide_Init(struct MuralBackgroundProc * proc);
void BackgroundSlide_Loop(struct MuralBackgroundProc * proc);
ProcPtr StartMuralBackgroundAlt(ProcPtr parent, void * vram, int pal);
ProcPtr StartMuralBackgroundExt(ProcPtr parent, void * vram, int pal, u8 type);
void EndMuralBackground(void);

struct StatScreenInfo {
    /* 00 */ u8 _pad_;

    /* 01 */ u8 unit_id;
    /* 02 */ u16 excluded_unit_flags;
};

enum statscreen_flag_bitfile {
    // StatScreenInfo::excluded_unit_flags
    STATSCREEN_CONFIG_NONDEAD    = (1 << 0),
    STATSCREEN_CONFIG_NONBENCHED = (1 << 1),
    STATSCREEN_CONFIG_NONUNK9    = (1 << 2),
    STATSCREEN_CONFIG_NONROOFED  = (1 << 3),
    STATSCREEN_CONFIG_NONUNK16   = (1 << 4),
    STATSCREEN_CONFIG_NONSUPPLY  = (1 << 5),
};

extern struct StatScreenInfo gStatScreenInfo;

int GetLastStatScreenUnitId(void);
void SetStatScreenLastUnitId(int unit_id);
void SetStatScreenExcludedUnitFlags(int flags);

struct StatScreenTextInfo {
    /* 00 */ struct Text * text;
    /* 04 */ u16 * tm;
    /* 08 */ u8 color;
    /* 09 */ u8 x_offset;
    /* 0C */ char const * const * str_list;
};

void InitStatScreenText(void);
void PutStatScreenText(struct StatScreenTextInfo const * list);
void PutStatScreenLeftPanelInfo(void);
void DisplayBwl(void);
void PutStatScreenStatWithBar(int num, int x, int y, int base, int total, int max);
void PutStatScreenPersonalInfoPage(void);
void PutStatScreenItemsPage(void);
void PutStatScreenSupportList(void);
void PutStatScreenWeaponExpBar(int num, int x, int y, int item_kind);
void PutStatScreenWeaponExpAndSupportsPage(void);
void PutStatScreenPage(int page_id);
struct Unit * FindNextStatScreenUnit(struct Unit * current_unit, int iter_step);

struct StatScreenPageSlideProc {
    /* 00 */ PROC_HEADER;

    STRUCT_PAD(0x29, 0x4A);

    /* 4A */ s16 new_page;
    /* 4C */ s16 clock;

    STRUCT_PAD(0x4E, 0x52);

    /* 52 */ u16 key_bit;
};

void StatScreenPageSlide_Loop(struct StatScreenPageSlideProc * proc);
void StatScreenPageSlide_End(struct StatScreenPageSlideProc * proc);
void StartStatScreenPageSlide(u16 key_bit, int new_page, ProcPtr parent);

struct StatScreenUnitSlideProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad_29[0x38 - 0x29];
    /* 38 */ int direction;
    /* 3C */ int y_disp_init;
    /* 40 */ int y_disp_fini;
    /* 44 */ u8 pad_44[0x4A - 0x44];
    /* 4A */ s16 new_unit_id;
    /* 4C */ s16 clock;
};

void StatScreenUnitSlide_FadeOutInit(struct StatScreenUnitSlideProc * proc);
void StatScreenUnitSlide_FadeOutLoop(struct StatScreenUnitSlideProc * proc);
void StatScreenUnitSlide_FadeInInit(struct StatScreenUnitSlideProc * proc);
void StatScreenUnitSlide_FadeInLoop(struct StatScreenUnitSlideProc * proc);
void StatScreenUnitSlide_ChangeUnit(struct StatScreenUnitSlideProc * proc);
void StatScreenUnitSlide_End(struct StatScreenUnitSlideProc * proc);
void StartStatScreenUnitSlide(struct Unit * unit, int direction, ProcPtr parent);

#define STATSCREEN_PAGE_NAME_SCALE_STEPS 6

struct StatScreenSpritesProc
{
    /* 00 */ PROC_HEADER;

    // sprites proc only
    /* 2A */ s16 x_left;
    /* 2C */ s16 x_right;
    /* 2E */ u16 clock_left;
    /* 30 */ u16 clock_right;
    /* 32 */ s16 anim_speed_left;
    /* 34 */ s16 anim_speed_right;

    // name sprite proc only
    /* 36 */ u8 page_id;
    /* 38 */ s16 vertical_scale; // int 6 == 1:1 (1.0) scale
};

void PutUpdateStatScreenPageName(int page_id);
void StatScreenPageName_Init(struct StatScreenSpritesProc * proc);
void StatScreenPageName_Main(struct StatScreenSpritesProc * proc);
void StatScreenPageName_CloseMain(struct StatScreenSpritesProc * proc);
void StatScreenPageName_OpenMain(struct StatScreenSpritesProc * proc);

void StatScreenSprites_Init(struct StatScreenSpritesProc * proc);
void StatScreenSprites_BumpCheck(struct StatScreenSpritesProc * proc);
void StatScreenSprites_PutArrows(struct StatScreenSpritesProc * proc);
void StatScreenSprites_PutNumberLabel(struct StatScreenSpritesProc * proc);
void StatScreenSprites_PutMuAreaSprites(struct StatScreenSpritesProc * proc);
void StatScreenSprites_PutRescueMarkers(struct StatScreenSpritesProc * proc);

void StatScreen_DisableScreen(ProcPtr proc);
void StatScreen_Init(ProcPtr proc);
void StatScreen_InitUnit(ProcPtr proc);
void StatScreen_Main(ProcPtr proc);
void StatScreen_BackUpStatus(ProcPtr proc);
void StatScreen_UpdateLastHelpInfo(ProcPtr proc);
void SyncStatScreenBgOffset(void);
void StatScreen_CleanUp(ProcPtr proc);
void StartStatScreen(struct Unit * unit, ProcPtr parent);

enum helpbox_info_idx {
    HELPBOX_INFO_NONE,
    HELPBOX_INFO_WEAPON,
    HELPBOX_INFO_STAFF,
    HELPBOX_INFO_SAVE_MENU,
};

struct HelpBoxInfo;

struct HelpBoxProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct HelpBoxInfo const *info;

    /* 30 */ s16 x_box;
    /* 32 */ s16 y_box;
    /* 34 */ s16 w_box;
    /* 36 */ s16 h_box;
    /* 38 */ s16 x_box_init;
    /* 3A */ s16 y_box_init;
    /* 3C */ s16 x_box_fini;
    /* 3E */ s16 y_box_fini;
    /* 40 */ s16 w_box_init;
    /* 42 */ s16 h_box_init;
    /* 44 */ s16 w_box_fini;
    /* 46 */ s16 h_box_fini;
    /* 48 */ s16 timer;
    /* 4A */ s16 timer_end;

    /* 4C */ u16 msg;
    /* 4E */ u16 item;

    /* 50 */ u16 move_key_bit; // move ctrl proc only

    /* 52 */ u8 unk_52;

    // NOTE: there's likely more, need to decompile more files
};

void StartStatScreenHelp(int page_id, ProcPtr proc);
void HelpBoxPopulateStatScreenItem(struct HelpBoxProc * proc);
void HelpBoxPopulateStatScreenStatus(struct HelpBoxProc * proc);
void HelpBoxPopulateStatScreenPower(struct HelpBoxProc * proc);
void HelpBoxRedirectStatScreenItem(struct HelpBoxProc * proc);
void HelpBoxPopulateStatScreenWeaponExp(struct HelpBoxProc * proc);
void HelpBoxPopulateStatScreenPInfo(struct HelpBoxProc * proc);
void HelpBoxPopulateStatScreenJInfo(struct HelpBoxProc * proc);
void HelpBoxRedirectStatScreenSupports(struct HelpBoxProc * proc);

void UpdateHelpBoxDisplay(struct HelpBoxProc * proc, int interpolate_method);
void HelpBox_OnOpen(struct HelpBoxProc * proc);
void HelpBox_OnLoop(struct HelpBoxProc * proc);
void HelpBox_OnClose(struct HelpBoxProc * proc);
void HelpBox_WaitClose(struct HelpBoxProc * proc);
void StartHelpBox(int x, int y, int msg);
void StartHelpBox_Unk(int x, int y, int mid);
void StartItemHelpBox(int x, int y, int item);
void StartHelpBoxExt(struct HelpBoxInfo const * info, int unk);
void StartHelpBoxExt_Unk(int x, int y, int mid);
void CloseHelpBox(void);
void KillHelpBox(void);
void HelpBoxMoveControl_OnInitBox(struct HelpBoxProc * proc);
void HelpBoxMoveControl_OnIdle(struct HelpBoxProc * proc);

struct HelpBoxInfo
{
    /* 00 */ struct HelpBoxInfo const *adjacent_up;
    /* 04 */ struct HelpBoxInfo const *adjacent_down;
    /* 08 */ struct HelpBoxInfo const *adjacent_left;
    /* 0C */ struct HelpBoxInfo const *adjacent_right;
    /* 10 */ u8 x, y;
    /* 12 */ u16 msg;
    /* 14 */ void (* redirect)(struct HelpBoxProc *proc);
    /* 18 */ void (* populate)(struct HelpBoxProc *proc);
};

void HelpBoxMoveControl_OnEnd(struct HelpBoxProc * proc);
void StartMovingHelpBox(struct HelpBoxInfo const * info, ProcPtr parent);
void StartMovingHelpBoxExt(struct HelpBoxInfo const * info, ProcPtr parent, int x, int y);
void ApplyHelpBoxContentSize(struct HelpBoxProc * proc, int w_inner, int h_inner);
void ApplyHelpBoxPosition(struct HelpBoxProc * proc, int x, int y);
void SetHelpBoxInitPosition(struct HelpBoxProc * proc, int x, int y);
void ResetHelpBoxInitSize(struct HelpBoxProc * proc);
int GetHelpBoxItemInfoKind(int item);
void HelpBoxPopulateAutoItem(struct HelpBoxProc * proc);
int HelpBoxTryRelocateUp(struct HelpBoxProc *proc);
int HelpBoxTryRelocateDown(struct HelpBoxProc *proc);
int HelpBoxTryRelocateLeft(struct HelpBoxProc *proc);
int HelpBoxTryRelocateRight(struct HelpBoxProc *proc);
void HelpBoxLockHelper_Loop(ProcPtr proc);
int StartLockingHelpBox(int msg, ProcPtr parent);

struct HelpPromptSprProc
{
    PROC_HEADER;

    /* 2C */ int x, y;
};

void HelpPrompt_OnIdle(struct HelpPromptSprProc * proc);
ProcPtr StartHelpPromptSprite(int x, int y, ProcPtr parent);
ProcPtr StartHelpPromptSpriteBlocking(int x, int y, ProcPtr parent);
void EndHelpPromptSprite(void);
void MoveHelpPromptSprite(int x, int y);
struct HelpBoxInfo const * GetLastHelpBoxInfo(void);

extern struct ProcCmd ProcScr_BackgroundSlide[];
extern struct TextInitInfo gStatScreenTextList[];
// ??? gStatScreenPageSlideOffsetLut
extern struct ProcCmd ProcScr_StatScreenPageSlide[];
extern struct ProcCmd ProcScr_StatScreenUnitSlide[];
extern u16 CONST_DATA Sprite_StatScreenPageName[];
extern u16 CONST_DATA gStatScreenPageNameChrOffsetLut[];
extern u16 CONST_DATA Sprite_StatScreenMuAreaBackground[];
extern u16 CONST_DATA Sprite_StatScreenFaceSideWindow[];
extern struct ProcCmd CONST_DATA ProcScr_StatScreenPageName[];
extern struct ProcCmd CONST_DATA ProcScr_StatScreenSprites[];
extern struct ProcCmd ProcScr_StatScreen[];
// ??? ProcScr_HelpBox
// ??? ProcScr_HelpBoxMoveControl
// ??? ProcScr_HelpBoxLockHelper
// ??? Sprite_MetaHelp
extern struct ProcCmd CONST_DATA ProcScr_HelpPromptSpr[];
extern struct HelpBoxInfo CONST_DATA HelpInfo_StatScreenPersonalInfo_Pow;
extern struct HelpBoxInfo CONST_DATA HelpInfo_StatScreenItems_ItemA;
extern struct HelpBoxInfo CONST_DATA HelpInfo_StatScreenWeaponExp_WExpA;

// ??? gUnk_0841CB54
extern struct StatScreenTextInfo const gStatScreenPersonalInfoLabelsInfo[];
extern struct StatScreenTextInfo const gStatScreenEquipmentLabelsInfo[];
extern struct StatScreenTextInfo const gStatScreenWeaponExpLabelsPhysicalInfo[];
extern struct StatScreenTextInfo const gStatScreenWeaponExpLabelsMagicalInfo[];

