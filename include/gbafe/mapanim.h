#pragma once

#include "global.h"
#include "mu.h"
#include "unit.h"
#include "battle.h"

struct MapAnimActor {
    /* 00 */ struct Unit * unit;
    /* 04 */ struct BattleUnit * bu;
    /* 08 */ struct MuProc * mu;
    /* 0C */ u8 hp_max;
    /* 0D */ u8 hp_cur;
    /* 0E */ u16 hp_displayed_q4;
    /* 10 */ u8 hp_info_x;
    /* 11 */ u8 hp_info_y;

    STRUCT_PAD(0x12, 0x14);
};

struct ManimSt {
    /* 00 */ struct MapAnimActor actor[4];
    /* 50 */ struct BattleHit * hit_it;
    /* 54 */ struct ProcScr const * special_proc_scr;
    /* 58 */ u8 attacker_actor;
    /* 59 */ u8 defender_actor;
    /* 5A */ u16 hit_attributes;
    /* 5C */ u8 hit_info;
    /* 5D */ s8 hit_damage;
    /* 5E */ u8 main_actor_count;
    /* 5F */ u8 hp_bar_busy;
    /* 60 */ u8 unk_60;
    /* 61 */ u8 unk_61;
    /* 62 */ u8 manim_kind;
};

extern struct ManimSt EWRAM_DATA gManimSt;

// Manim_StoleItemPopup
// Manim_WeaponBrokePopup
// ManimShouldBuDisplayWeaponBroke
// Manim_WeaponLevelGainedPopup
// ManimShouldBuDisplayWeaponLevelGained
// Manim_PrepareBattleTalk
// Manim_Finish
// sub_806EC98
// sub_806ED78
// sub_806EDC0
// sub_806EDE0
// sub_806EE30
// sub_806EE5C
// sub_806EE9C
// sub_806EF3C
// sub_806EFB0
// sub_806F0C4
// sub_806F280
// sub_806F2C8
// sub_806F2D8
// sub_806F30C
// InitManimActor
// sub_806F404
// InitManimActorFacings
// sub_806F598
// sub_806F7B0
// sub_806F83C
// sub_806F8C8
// sub_806F97C
// StartBattleManim
// InitManimHits
// InitManimActors
// GetFacingFromTo
// UnpackManimWindowDigits
// PutManimWindowNumber
// UnpackManimWindowGraphics
// PutManimWindowBarTile
// PutManimWindowBar
// EndManimInfoWindow
// StartManimInfoWindow
// ManimWindow_Clear
// sub_806FFE8
// sub_80700FC
// sub_8070258
// sub_8070338
// sub_8070390
// sub_8070534
// sub_8070620
// sub_8070704
// sub_8070774
// sub_8070828
// sub_8070858
// sub_80708F8
// sub_80709E8
// sub_8070AC4
// sub_8070AF8
// sub_8070B10
// sub_8070F70
// sub_807116C
// sub_807134C
// sub_8071874
// sub_8071960
// sub_8071BD8
// sub_8071C10
// sub_8071C8C
// sub_8071D08
// sub_8071D9C
// sub_8071DF8
// sub_8071E68
// sub_8071ECC
// sub_8071F3C
// sub_8072074
// sub_80721A4
// sub_80721C8
// sub_807224C
// sub_8072320
// sub_8072374
// sub_8072398
// sub_80723BC
// sub_807245C
// sub_8072514
// sub_807255C
// sub_8072638
// sub_80726B8
// sub_80727BC
// sub_8072884
// sub_80728F0
// sub_8072910
// sub_807296C
// sub_8072AAC
// sub_8072C10
// sub_8072D74
// sub_8072E0C
// sub_8072EAC
// sub_8072F18
// sub_8072F70
// sub_8073084
// sub_80730DC
// sub_8073204
// sub_80732FC
// sub_80733F8
// sub_807340C
// sub_807347C
// sub_80734FC
// sub_8073568
// sub_8073584
// sub_8073648
// sub_80736EC
// sub_80737AC
// sub_807384C
// sub_80738B4
// sub_80738E0
// sub_8073984
// sub_80739EC
// sub_8073A58
// sub_8073A98
// sub_8073AD4
// sub_8073B40
// sub_8073C24
// sub_8073CB0
// sub_8073D3C
// sub_8073DA4
// sub_8073ED8
// sub_8073FC4
// sub_8074064
// sub_80740CC
// sub_807419C
// sub_8074240
// sub_80742A8
// sub_80742DC
// sub_8074300
// sub_807443C
// sub_80744F8
// sub_807456C
// sub_80746E0
// sub_807475C
// sub_8074774
// sub_80747F4
// sub_8074968
// sub_80749F0
// sub_8074B68
// sub_8074C5C
// sub_8074C70
// sub_8074D38
// sub_8074D50
// sub_8074F40
// sub_8075098
// sub_80750CC
// sub_80751F0
// sub_8075224
// sub_80753F4
// sub_807540C
// sub_807549C
// sub_8075510
// sub_8075584
// sub_80756D0
// sub_80756F0
// sub_8075864
// sub_8075878
// sub_8075898
// sub_80758AC
// sub_80758E4
// sub_8075938
// sub_8075970
// sub_80759B0
// sub_80759C8
// sub_80759E8
// sub_8075A98
// sub_8075AC4
// sub_8075B1C
// sub_8075B7C
// sub_8075C18
// sub_8075CF8
// sub_8075DB0
// sub_8075DDC
// sub_8075E08
// sub_8075E34
// sub_8075E68
// sub_8075E9C
// sub_8075F68
// sub_8075FAC
// sub_8075FF0
// sub_807604C
// sub_8076080
// sub_8076164
// sub_8076248
// sub_80762CC
// sub_8076350
// sub_80763A0
// sub_80763F0
// sub_8076460
// sub_8076820
// sub_80768F4
// sub_8076920
// sub_8076950
// sub_8076980
// sub_80769B0
// sub_80769E0
// sub_8076A1C
// sub_8076A58
// sub_8076A94
// sub_8076AD0
// sub_8076B0C
// sub_8076B48
// sub_8076B84
// sub_8076C40
// sub_8076C80
// sub_8076CB0
// sub_8076CD8
// sub_8076D08
// sub_8076D38
// sub_8076D68
// sub_8076D98
// sub_8076DCC
// sub_8076E00
// sub_8076E34
// sub_8076EA8
// sub_8076F34
// sub_8076F68
// sub_8076FFC
// sub_8077014
