#pragma once

#include "global.h"

struct BmSt {
    /* 00 */ s8  mainLoopEndedFlag;

    /* 01 */ s8  gameLogicSemaphore;
    /* 02 */ s8  gameGfxSemaphore;

    /* 03 */ u8  _unk04;

    /* 04 */ u8  gameStateBits;

    /* 05 */ u8  _unk05;

    /* 06 */ u16 prevVCount;

    /* 08 */ u32 _unk08;

    /* 0C */ struct Vec2 camera;
    /* 10 */ struct Vec2 cameraPrevious;
    /* 14 */ struct Vec2 playerCursor;
    /* 18 */ struct Vec2 cursorPrevious;
    /* 1C */ struct Vec2 cursorTarget;
    /* 20 */ struct Vec2 playerCursorDisplay;
    /* 24 */ struct Vec2u mapRenderOrigin;
    /* 28 */ struct Vec2 cameraMax;

    /* 2C */ u16 itemUnk2C;
    /* 2E */ u16 itemUnk2E;

    /* 30 */ u16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;
    /* 36 */ s8 unk36;
    /* 37 */ s8 unk37;
    /* 38 */ u8 altBlendACa;
    /* 39 */ u8 altBlendACb;
    /* 3A */ u8 altBlendBCa;
    /* 3B */ u8 altBlendBCb;
    /* 3C */ u8 just_resumed;
    /* 3D */ u8 unk3D;
    /* 3E */ u8 unk3E;
    /* 3F */ s8 unk3F;
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

    /* 20 */ char playerName[0x2B - 0x20]; // unused outside of link arena (was tactician name in FE7); Size unknown

    /* 2B */ u8 unk_2B_00 : 0x01;
             u8 unk_2B_01 : 0x07;

    u32 unk_2C_1:1;
    u32 unk_2C_01 : 0x03;
    u32 unk_2C_04 : 0x09;
    u32 unk_2C_0D : 0x0A;
    u32 unk_2C_2:5;
    u32 unk_2C_3:4;

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
    u32 cfgWindowColor:2;
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

    u16 unk48;

    u8 unk4A_1 : 1;
    u8 unk4A_2 : 3;
    u8 unk4A_5 : 4;
    u8 unk4B;
};

extern struct PlaySt gPlaySt;

/**
 * Use with PlaySt field chapterStateBits
 */

enum PlaySt_chapterStateBits {
    PLAY_FLAG_STATSCREENPAGE0 = (1 << 0),
    PLAY_FLAG_STATSCREENPAGE1 = (1 << 1),
    PLAY_FLAG_POSTGAME        = (1 << 2),
    PLAY_FLAG_TUTORIAL        = (1 << 3),
    PLAY_FLAG_PREPSCREEN      = (1 << 4),
    PLAY_FLAG_COMPLETE        = (1 << 5),
    PLAY_FLAG_HARD            = (1 << 6),
    PLAY_FLAG_7               = (1 << 7),

    PLAY_FLAG_STATSCREENPAGE_SHIFT = 0,
    PLAY_FLAG_STATSCREENPAGE_MASK = PLAY_FLAG_STATSCREENPAGE0 | PLAY_FLAG_STATSCREENPAGE1,
};
