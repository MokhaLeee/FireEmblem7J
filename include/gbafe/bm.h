#pragma once

#include "global.h"
#include "proc.h"

struct BmSt {
    /* 00 */ bool main_loop_ended;
    /* 01 */ s8 lock;
    /* 02 */ s8 lock_display;
    /* 03 */ u8 pad_03;
    /* 04 */ u8 flags;
    /* 05 */ // pad
    /* 06 */ u16 main_loop_end_scanline;
    /* 08 */ int pad_08;
    /* 0C */ struct Vec2 camera;
    /* 10 */ struct Vec2 camera_previous;
    /* 14 */ struct Vec2 cursor;
    /* 18 */ struct Vec2 cursor_previous;
    /* 1C */ struct Vec2 cursor_sprite_target;
    /* 20 */ struct Vec2 cursor_sprite;
    /* 24 */ struct Vec2 map_render_anchor;
    /* 28 */ struct Vec2 camera_max;
    /* 2C */ u16 inventory_item_overflow;
    /* 2E */ u16 convoy_item_overflow;
    /* 30 */ bool8 unk_30;
    /* 31 */ bool8 unk_31;
    /* 32 */ short unk_32;
    /* 34 */ short unk_34;
    /* 36 */ s8 unk_36;
    /* 37 */ s8 unk_37;
    /* 38 */ u8 alt_blend_a_ca;
    /* 39 */ u8 alt_blend_a_cb;
    /* 3A */ u8 alt_blend_b_ca;
    /* 3B */ u8 alt_blend_b_cb;
    /* 3C */ u8 just_resumed;
    /* 3D */ u8 partial_actions_taken;
    /* 3E */ u8 swap_action_range_count;
    /* 3F */ s8 unk_3F;
};

extern struct BmSt gBmSt;

enum BmSt_gameStateBits {
    BM_FLAG_0 = (1 << 0),
    BM_FLAG_1 = (1 << 1),
    BM_FLAG_2 = (1 << 2),
    BM_FLAG_3 = (1 << 3),
    BM_FLAG_4 = (1 << 4),
    BM_FLAG_5 = (1 << 5),
    BM_FLAG_LINKARENA = (1 << 6),
};

struct PlaySt {
    /* 00 */ u32 time_saved;
    /* 04 */ u32 time_chapter_started;
    /* 08 */ u32 partyGoldAmount;
    /* 0C */ u8  gameSaveSlot;
    /* 0D */ u8  chapterVisionRange; // 0 means no fog
    /* 0E */ s8  chapterIndex;
    /* 0F */ u8  faction; // 0x00 = Player phase, 0x40 = NPC phase, 0x80 = Enemy phase (0xC0 = link arena 4th team?)
    /* 10 */ u16 chapterTurnNumber;
    /* 12 */ u8  xCursor, yCursor; // map cursor position
    /* 14 */ u8  chapterStateBits; // +0x04 = postgame, +0x10 = in prep screen, +0x40 = difficult mode, +0x80 = link arena?
    /* 15 */ u8  chapterWeatherId;
    /* 16 */ u16 chapterTotalSupportGain;
    /* 18 */ u8 playthroughIdentifier;
    /* 19 */ u8 unk19;
    /* 1A */ u8 lastUnitSortType;
    /* 1B */ u8  chapterModeIndex; // 1 for tutorial (ch0-8), 2 for Eirika route, 3 for Ephraim route

    // character identifiers indexed by weapon type.
    // has to do with allowing unusable weapons to be used
    /* 1C */ u8  unk1C[2];
    /* 1E */ u8 unk1E;
    /* 1F */ u8 unk1F;

    /* 20 */ char playerName[0x2B - 0x20];
    /* 2B */ u8 tact_enabled : 0x01;
             u8 tact_blood : 0x03;
             u8 tact_birth : 0x04;

    u32 tact_gender : 0x01;
    u32 unk2C_01 : 0x03;
    u32 unk2C_04 : 0x09;
    u32 unk2C_0D : 0x03;
    u32 unk2C_10 : 0x07;
    u32 unk2C_17 : 0x05; // Used to lookup class reel stuff
    u32 unk2C_1C : 0x04;

    /* 30 */ int total_gold;
    /* 34 */ u32 unk_34_00 : 0x14;
             u32 unk_34_14 : 0x0C;

    u32 unk_38_1:8;
    u32 unk_38_2:20; // Used by bmdifficulty (Valni/Lagdou)
    u32 unk_38_3:4;

    /* 3C */ u32 unk_3C_00 : 6;
    /* 3C */ u32 combatRank : 3;
    /* 3D */ u32 expRank : 3;
    /* 3D */ u32 unk_3D_04 : 3;
    /* 3D */ u32 fundsRank : 3;
    /* 3E */ u32 tacticsRank : 3;
    /* 3E */ u32 survivalRank : 3;
    /* 3F */ u32 unk_3F_00 : 8;

    // option bits
    u32 cfgUnitColor:1; // 1
    u32 cfgDisableTerrainDisplay:1; // 1
    u32 cfgUnitDisplayType:2; // 2
    u32 cfgAutoCursor:1; // 1
    u32 cfgTextSpeed:2;
    u32 cfgGameSpeed:1; // 1
    u32 cfgDisableBgm:1; // 1
    u32 cfgDisableSoundEffects:1; // 1
    u32 config_window_theme:2;
    u32 unk41_5:1; // 1
    u32 unk41_6:1; // unk
    u32 cfgDisableAutoEndTurns:1; // 1
    u32 cfgNoSubtitleHelp:1; // 1
    u32 cfgDisableGoalDisplay:1; // unk
    u32 cfgAnimationType:2; // 2
    u32 cfgBattleForecastType:2; // 2
    u32 cfgController:1; // 1
    u32 cfgRankDisplay:1; // unk
    u32 debugControlRed:2; // 2 (!)
    u32 debugControlGreen:2; // 2
    u32 unk43_4:5; // unk
    u8  unk44[0x48 - 0x44];
};

extern struct PlaySt gPlaySt;

enum PlaySt_chapterModeIndex {
    CHAPTER_MODE_LYN = 1,
    CHAPTER_MODE_ELIWOOD,
    CHAPTER_MODE_HECTOR,
};

enum PlaySt_chapterStateBits {
    PLAY_FLAG_STATSCREENPAGE0 = (1 << 0),
    PLAY_FLAG_STATSCREENPAGE1 = (1 << 1),
    PLAY_FLAG_POSTGAME        = (1 << 2),
    PLAY_FLAG_TUTORIAL        = (1 << 3),
    PLAY_FLAG_PREPSCREEN      = (1 << 4),
    PLAY_FLAG_COMPLETE        = (1 << 5),
    PLAY_FLAG_HARD            = (1 << 6),
    PLAY_FLAG_EXTRA_MAP       = (1 << 7),

    PLAY_FLAG_STATSCREENPAGE_SHIFT = 0,
    PLAY_FLAG_STATSCREENPAGE_MASK = PLAY_FLAG_STATSCREENPAGE0 | PLAY_FLAG_STATSCREENPAGE1,
};

enum PlaySt_Weather {
    WEATHER_FINE = 0,
    WEATHER_SNOW = 1,
    WEATHER_SNOWSTORM = 2,
    WEATHER_NIGHT = 3,
    WEATHER_RAIN = 4,
    WEATHER_FLAMES = 5,
    WEATHER_SANDSTORM = 6,
    WEATHER_CLOUDS = 7
};

struct ProcBmMain {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x3C);

    /* 3C */ u8 flag;

    STRUCT_PAD(0x3D, 0x46);

    /* 46 */ u8 unk_46;
};

struct CamMoveProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Vec2 to;
    /* 30 */ struct Vec2 from;
    /* 34 */ struct Vec2 watchedCoord;
    /* 38 */ short calibration;
    /* 3A */ short distance;
    /* 3C */ int frame;
    /* 40 */ bool8 xCalibrated;
};

struct UnkMapCursorProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Vec2 to;
    /* 30 */ struct Vec2 from;
    /* 34 */ int clock;
    /* 38 */ int duration;
};

enum
{
    MAP_CURSOR_DEFAULT,
    MAP_CURSOR_REGULAR,
    MAP_CURSOR_RED_MOVING,
    MAP_CURSOR_STRETCHED,
    MAP_CURSOR_RED_STATIC,
};

enum
{
    CAMERA_MARGIN_LEFT   = 16 * 3,
    CAMERA_MARGIN_RIGHT  = 16 * 11,
    CAMERA_MARGIN_TOP    = 16 * 2,
    CAMERA_MARGIN_BOTTOM = 16 * 7,
};

void OnVBlank(void);
void OnMain(void);
void LockGame(void);
void UnlockGame(void);
u8 GetGameLock(void);
void HandleChangePhase(void);
bool CallChapterStartEventMaybe(void);
bool BmMain_ChangePhase(void);
bool sub_8015840(void);
void BmMain_StartPhase(ProcPtr proc);
void BmMain_ResumePlayerPhase(ProcPtr proc);
bool BmMain_UpdateTraps(ProcPtr proc);
void BmMain_SuspendBeforePhase(void);
void sub_8015918(ProcPtr proc);
void BmMain_StartIntroFx(struct ProcBmMain * proc);
void sub_8015988(void);
void InitBmBgLayers(void);
void ApplySystemObjectsGraphics(void);
void ApplySystemGraphics(void);
void HandleMapCursorInput(u16 keys);
void HandleMoveMapCursor(int step);
void HandleMoveCameraWithMapCursor(int step);
u16 GetCameraAdjustedX(int x);
u16 GetCameraAdjustedY(int y);
u16 GetCameraCenteredX(int x);
u16 GetCameraCenteredY(int y);
void PutMapCursor(int x, int y, int kind);
void DisplayBmTextShadow(int x, int y);
void SetMapCursorPosition(int x, int y);
void PutSysArrow(int x, int y, u8 is_down);
void CamMove_Init(struct CamMoveProc * proc);
void CamMove_OnLoop(struct CamMoveProc * proc);
void StoreAdjustedCameraPositions(int xIn, int yIn, int * xOut, int * yOut);
bool EnsureCameraOntoCenteredPosition(ProcPtr parent, int x, int y);
bool EnsureCameraOntoPosition(ProcPtr parent, int x, int y);
bool IsCameraNotWatchingPosition(int x, int y);
bool CameraMove_801622C(ProcPtr parent);
void UnkMapCursor_OnLoop(struct UnkMapCursorProc * proc);
void sub_80162E0(int x, int y, int duration);
int GetActiveMapSong(void);
void StartMapSongBgm(void);
void sub_8016410(struct CamMoveProc * proc);
void nullsub_37(void);

extern s8 sDirKeysToOffsetLut[][2];
extern u16 Sprite_MapCursorStretched[];
extern u16 * sMapCursorSpriteLut[];
extern u16 * gSysUpArrowSpriteLut[];
extern u16 * gSysDownArrowSpriteLut[];
extern struct ProcCmd ProcScr_CamMove[];
extern struct ProcCmd ProcScr_UnkMapCursor[];
