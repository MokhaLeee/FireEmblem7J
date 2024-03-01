#pragma once

#include "proc.h"
#include "text.h"

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

struct StatScreenSt {
    /* 00 */ u8 page;
    /* 01 */ u8 page_count;
    /* 02 */ u16 page_slide_key_bit;
    /* 04 */ s16 x_disp_off; // Note: Always 0, not properly taked into account by most things
    /* 06 */ s16 y_disp_off;
    /* 08 */ bool8 is_transitioning;
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

// BackgroundSlide_Init
// BackgroundSlide_Loop
// StartMuralBackgroundAlt
// StartMuralBackgroundExt
// EndMuralBackground

struct StatScreenInfo {
    /* 00 */ u8 _pad_;

    /* 01 */ u8 unit_id;
    /* 02 */ u16 excluded_unit_flags;
};

extern struct StatScreenInfo gStatScreenInfo;

// GetLastStatScreenUnitId
// SetStatScreenLastUnitId
// SetStatScreenExcludedUnitFlags
// InitStatScreenText

struct StatScreenTextInfo {
    /* 00 */ struct Text * text;
    /* 04 */ u16 * tm;
    /* 08 */ u8 color;
    /* 09 */ u8 x_offset;
    /* 0C */ char const * const * str_list;
};

void PutStatScreenText(struct StatScreenTextInfo const * list);
// PutStatScreenLeftPanelInfo
void DisplayBwl(void);
// PutStatScreenStatWithBar
// DisplayPage0
// sub_8080E04
// sub_8080FB8
// sub_80810A8
// sub_808116C
// sub_8081224
// sub_808125C
// sub_8081278
// sub_8081334
// sub_808144C
// sub_8081458
// sub_80814C4
// sub_8081554
// sub_80815D4
// sub_808164C
// sub_80816C8
// sub_80816F8
// sub_808178C
// sub_80817C8
// sub_8081834
// sub_80818CC
// sub_8081900
// sub_80819C8
// sub_8081A98
// sub_8081AB0
// sub_8081AE4
// sub_8081BCC
// sub_8081C40
// sub_8081CB0
// sub_8081D7C
// sub_8081DE4
// sub_8081EF8
// sub_8081FD8
// sub_8082168
// sub_80821A0
// sub_80821B4
// sub_80821EC
// sub_80821F8
// StartStatScreenHelp
// sub_80822B0
// sub_80822DC
// sub_8082394
// sub_80823C8
// sub_808241C
// sub_808245C
// sub_8082484
// sub_8082498
// UpdateHelpBoxDisplay
// sub_8082580
// sub_80825C4
// sub_80825EC
// sub_8082644
// sub_808266C
// sub_80826A0
// sub_80826EC
// sub_8082728
// StartHelpBoxExt_Unk
// CloseHelpBox
// sub_80828C8
// sub_80828EC
// sub_8082914
// sub_80829E0
// sub_80829F4
// sub_8082A18
// sub_8082A3C
// sub_8082AA0
// sub_8082B2C
// sub_8082B50
// sub_8082B60
// HelpBoxPopulateAutoItem
int HelpBoxTryRelocateUp(struct HelpBoxProc *proc);
int HelpBoxTryRelocateDown(struct HelpBoxProc *proc);
int HelpBoxTryRelocateLeft(struct HelpBoxProc *proc);
int HelpBoxTryRelocateRight(struct HelpBoxProc *proc);
// sub_8082CA4
// sub_8082CC8
// sub_8082D00
// sub_8082D1C
// sub_8082D48
// EndHelpPromptSprite
// sub_8082D8C
// sub_8082DAC
// sub_8082DB8
// sub_8082E2C
// sub_8082E6C
// sub_8082E9C
// sub_8082ECC
// sub_8082EEC
// sub_8082F0C
// sub_8082F30
// LoadHelpBoxGfx
// sub_8083000
// sub_8083088
// sub_8083268
// sub_80832E0
// sub_808335C
// sub_80833B4
// sub_808341C
// sub_80834D8
// sub_808356C
// sub_80835D8
// sub_808364C
// sub_808368C
// sub_808377C
// sub_8083798
// sub_80837E0
// sub_8083808
// sub_8083838
// sub_8083860
// sub_8083880
// sub_8083950
// sub_8083980
// sub_80839A4
// sub_80839C4
// sub_80839D8
// sub_80839F0
// sub_8083A08
// sub_8083A48
// sub_8083AC0
// sub_8083AC8
// sub_8083AD8
// sub_8083B28
// sub_8083B48
// sub_8083B80
// sub_8083B9C
// sub_8083BA8
// sub_8083BB4
// sub_8083C54
// sub_8083DAC
// sub_8083E34
// sub_8083E44
// sub_8083E78
// sub_8083EA8
// sub_8083EE0
// sub_8083F70
// sub_8083F98
// sub_8083FBC
// sub_8083FEC
// sub_8084000
// sub_8084068
// sub_80840D8
// sub_8084194
// sub_8084208
// sub_80842F8
// sub_8084608
// sub_8084640
// sub_8084664
// sub_8084688
// sub_80846E4
// sub_8084CEC
// sub_8084D1C
// sub_8084D68
// sub_8084DA8
// sub_8084DD4
// sub_8084E68
// sub_8084E8C
// sub_8084FC4
// sub_8085008
// sub_80850A8
// sub_80850BC
// sub_80850D8
// sub_8085110
// sub_808512C
// sub_8085170
// sub_8085188
// sub_80851C4
// sub_80851F0
// sub_8085254
// sub_80853CC
// sub_8085530
// sub_8085658
// sub_808578C
// sub_80857E0
// sub_8085824
// sub_808586C
// sub_808588C
// sub_80858B0
// sub_80858D8
// sub_80859B0
// sub_8085B0C
// sub_8085C4C
// sub_8085C8C
// sub_8085DF4
// sub_8085E6C
// sub_8086044
// sub_808606C
// sub_8086110
// sub_80861B4
// sub_80861DC
// sub_8086288
// sub_8086368
// sub_80863B4
// sub_80863E0
// sub_80864DC
// sub_8086668
// sub_808667C
// sub_80866DC
// sub_80866FC
// sub_8086748
// sub_80867D8
// sub_8086960
// sub_80869F8
// sub_8086BB8
// sub_8086C00
// nullsub_71
// nullsub_72
// nullsub_73
// sub_8086C68
// sub_8086CFC
// sub_8086D58
// sub_8086D88
// sub_8086E0C
// sub_8086E98
// sub_8086ED4
// sub_8086F18
// sub_8086FC0
// sub_8087004
// sub_8087028
// sub_8087054
// sub_80870E8
// sub_80871AC
// sub_80871E4
// sub_8087208
// sub_8087230
// sub_808726C
// sub_80872A4
// sub_80872E4
// sub_808734C
// sub_8087380
// sub_80873B4
// sub_80875FC
// sub_80877FC
// sub_808781C
// sub_8087864
// sub_80878A8
// sub_80879E4
// sub_8087B00
// sub_8087B2C
// sub_8087B48
// sub_8087B80
// sub_8087B98
// sub_8087C6C
// sub_8087E2C
// sub_8087E44
// sub_8087E70
// sub_8087E90
// sub_8087E9C
// sub_8087EBC
// sub_8087EC8
// sub_8087EE0
// sub_8087EEC
// sub_8087F60
// sub_8088024
// sub_80883C0
// sub_80883C8
// sub_8088404
// sub_8088464
// sub_80884A8
// sub_80884E0
// sub_8088520
// sub_8088548
// sub_8088584
// EndCgText
// sub_80886E0
// sub_80886FC
// sub_8088718
// sub_8088768
// sub_80887B4
// sub_8088834
// sub_8088884
// sub_8088A20
// sub_8088C78
// sub_8088D08
// sub_808929C
// sub_8089308
// sub_8089310
// sub_8089394
// sub_80893BC
// sub_80893E0
// sub_80893F4
// sub_808940C
// sub_80894EC
// sub_808954C
// sub_80895BC
// sub_8089638
// sub_80896EC
// sub_8089720
// sub_80897E0
// sub_808989C
// sub_8089998
// sub_8089AA8
// sub_8089B34
// sub_8089B60
// sub_8089B80
// sub_8089BDC
// nullsub_21
// sub_8089EBC
// sub_8089FCC
// sub_808A074
// sub_808A0F4
// sub_808A4F8
// sub_808A55C
// sub_808A604
// sub_808A6AC
// sub_808A730
// sub_808A7CC
// sub_808AB70
// sub_808AE64
// sub_808AF78
// sub_808B038
// sub_808B0CC
// sub_808B288
// sub_808B450
// sub_808B468
// sub_808B4C0
// sub_808B4F0
// sub_808B520
// sub_808B5E4
// sub_808B654
// sub_808BF14
// sub_808BF20
// sub_808E344
// sub_808E3B0
// sub_808E3E0
// sub_808E404
// sub_808E454
// sub_808E4D4
// sub_808E4E8
// sub_808E4FC
// sub_808E524
// sub_808E558
// sub_808E57C
// sub_808E588
// sub_808E5B4
// nullsub_74
// nullsub_75
// sub_808E5C8
// sub_808E5DC
// sub_808E604
// sub_808E644
// sub_808E654
// sub_808E664
// sub_808E674
// sub_808E684
// sub_808E694
// sub_808E6A4
// sub_808E794
// sub_808E7D4
// sub_808E81C
// sub_808E84C
// sub_808E8C8
// sub_808E8DC
// sub_808EA20
// sub_808EA54
// sub_808EA84
// sub_808EAF4
// sub_808EBEC
// sub_808EC70
// sub_808ECB0
// sub_808ECDC
// sub_808ED24
// sub_808ED8C
// EndMuralBackground_
// nullsub_76
// sub_808EDD0
// sub_808EE54
// sub_808EEAC
// sub_808EEE0
// sub_808EF10
// sub_808EF44
// sub_808EF54
// sub_808EF60
// sub_808EF6C
// sub_808EF98
// sub_808EFBC
// sub_808F010
// sub_808F24C
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
// sub_80903A8
// sub_80903C4
// sub_80903E8
// sub_80903FC
// sub_8090494
// sub_80904D8
// sub_8090720
// sub_8090748
// sub_8090774
// sub_8090788
// sub_80907AC
// sub_80907C8
// sub_80907E4
// sub_8090800
// sub_80908A8
// sub_80908E8
// sub_8090930
// sub_80909DC
// sub_80909F8
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
// sub_80910B0
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
// TryUnlockProc
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
// sub_8095E8C
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
// sub_809BA14
// sub_809BA20
// sub_809BA38
// sub_809BA48
// sub_809BA60
// sub_809BA78
// sub_809BA94
// sub_809BAB8
// sub_809BACC
// sub_809BAE0
// sub_809BB30
// sub_809BB58
// sub_809BB98
// sub_809BE18
// sub_809BE88
// sub_809BEC4
// sub_809BF40
// sub_809BFB8
// sub_809BFCC
// sub_809C038
// sub_809C0C8
// sub_809C3EC
// sub_809C410
// sub_809C448
// sub_809C7B4
// sub_809C7CC
// sub_809C808
// sub_809C820
// sub_809C838
// sub_809C92C
// sub_809C948
// sub_809C980
// sub_809C9F8
// sub_809CAFC
// sub_809CB24
// sub_809CD78
// sub_809CDA0
// sub_809CDD0
// sub_809CE20
// sub_809CEA8
// sub_809CEC8
// sub_809CFD8
// sub_809D1C8
// InitSupportSubScreenPartners
// sub_809D420
// sub_809D450
// sub_809D4D0
// sub_809D528
// sub_809D5A4
// sub_809D5F0
// sub_809D648
// sub_809D850
// sub_809DA10
// sub_809DAD4
// sub_809DB74
// sub_809DC44
// sub_809DCEC
// sub_809DD98
// sub_809DE40
// sub_809DEEC
// sub_809DFE8
// sub_809E0C0
// sub_809E0E0
// sub_809E134
// sub_809E16C
// sub_809E190
// sub_809E1A8
// sub_809E1B8
// sub_809E1CC
// sub_809E218
// sub_809E244
// sub_809E25C
// sub_809E298
// sub_809E32C
// sub_809E3BC
// sub_809E3FC
// sub_809E4D0
// sub_809E5F0
// sub_809E6C0
// sub_809E794
// sub_809E7C4
// sub_809E7FC
// sub_809E8F0
// sub_809E9DC
// sub_809EAAC
// sub_809EB74
// sub_809EC74
// nullsub_80
// sub_809EDC0
// sub_809EDF0
// sub_809EE0C
// nullsub_81

extern struct ProcCmd ProcScr_BackgroundSlide[];
extern struct TextInitInfo gStatScreenTextList[];
// ??? gUnk_08D8A358
// ??? gUnk_08D8A368
// ??? gUnk_08D8A380
// ??? gUnk_08D8A3C0
// ??? gUnk_08D8A3D4
// ??? gUnk_08D8A41C
// ??? gUnk_08D8A466
// ??? gUnk_08D8A530
// ??? gUnk_08D8A5D8
