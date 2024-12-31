#pragma once

#include "global.h"

struct ChapterMap {
    u8  obj1Id;
    u8  obj2Id;
    u8  paletteId;
    u8  tileConfigId;
    u8  mainLayerId;
    u8  objAnimId;
    u8  paletteAnimId;
    u8  changeLayerId;
};

enum {
    MAP_BGM_BLUE            =  0,
    MAP_BGM_RED             =  1,
    MAP_BGM_GREEN           =  2,
    MAP_BGM_BLUE_HECTOR     =  3,
    MAP_BGM_RED_HECTOR      =  4,
    MAP_BGM_GREEN_HECTOR    =  5,
    MAP_BGM_BLUE_GREEN_ALT  =  6,
    MAP_BGM_RED_ALT         =  7,
    MAP_BGM_PROLOGUE_LYN    =  8,
    MAP_BGM_PROLOGUE        =  9,
    MAP_BGM_PROLOGUE_HECTOR = 10,

    MAP_BGM_MAX
};

struct ChapterInfo {
    /* 00 */ char const * debug_name;

    /* 04 */ u8 asset_img_a;
    /* 05 */ u8 asset_img_b;
    /* 06 */ u8 asset_pal;
    /* 07 */ u8 asset_tileset;
    /* 08 */ u8 asset_map;
    /* 09 */ u8 asset_img_anims;
    /* 0A */ u8 asset_pal_anims;
    /* 0B */ u8 asset_map_changes;

    /* 0C */ u8 fog;
    /* 0D */ u8 has_prep;
    /* 0E */ u8 title_ids[2];
    /* 10 */ u8 unk_0F;
    /* 11 */ u8 unk_10;
    /* 12 */ u8 weather;
    /* 13 */ u8 banim_terrain_id;
    /* 14 */ u8 hard_bonus_levels;

    ALIGN_PAD(0x15, 0x16);

    /* 16 */ u16 song_blue;
    /* 18 */ u16 song_red;
    /* 1A */ u16 song_green;
    /* 1C */ u16 song_blue_hector;
    /* 1E */ u16 song_red_hector;
    /* 20 */ u16 song_green_hector;
    /* 22 */ u16 song_blue_green_alt;
    /* 24 */ u16 song_red_alt;
    /* 26 */ u16 song_prologue_lyn;
    /* 28 */ u16 song_openning[2];

    /* 2C */ u8 wall_hp;

    /* 2D */ u8 turnsForTacticsRankAInEliwoodStory[2]; // FE7
    /* 2F */ u8 turnsForTacticsRankAInHectorStory[2]; // FE7
    /* 31 */ u8 turnsForTacticsRankBInEliwoodStory[2]; // FE7
    /* 33 */ u8 turnsForTacticsRankBInHectorStory[2]; // FE7
    /* 35 */ u8 turnsForTacticsRankCInEliwoodStory[2]; // FE7
    /* 37 */ u8 turnsForTacticsRankCInHectorStory[2]; // FE7
    /* 39 */ u8 turnsForTacticsRankDInEliwoodStory[2]; // FE7
    /* 3B */ u8 turnsForTacticsRankDInHectorStory[2]; // FE7

    /* 3D */ u8 unk3D; // padding?

    /* 3E */ u16 gainedExpForExpRankAInEliwoodStory[2]; // FE7
    /* 42 */ u16 gainedExpForExpRankAInHectorStory[2]; // FE7
    /* 46 */ u16 gainedExpForExpRankBInEliwoodStory[2]; // FE7
    /* 4A */ u16 gainedExpForExpRankBInHectorStory[2]; // FE7
    /* 4E */ u16 gainedExpForExpRankCInEliwoodStory[2]; // FE7
    /* 52 */ u16 gainedExpForExpRankCInHectorStory[2]; // FE7
    /* 56 */ u16 gainedExpForExpRankDInEliwoodStory[2]; // FE7
    /* 5A */ u16 gainedExpForExpRankDInHectorStory[2]; // FE7

    /* 5E */ u16 unk5E; // padding?

    /* 60 */ u32 goldForFundsRankInEliwoodStory[2]; // FE7
    /* 68 */ u32 goldForFundsRankInHectorStory[2]; // FE7

    /* 70 */ u16 msg_chapter_title_a;
    /* 72 */ u16 msg_chapter_title_b;

    /* 74 */ u8 mapEventDataId;
    /* 75 */ u8 gmapEventId;

    /* 76 */ u16 divinationTextIdBeginning; // FE7
    /* 78 */ u16 divinationTextIdInEliwoodStory; // FE7
    /* 7A */ u16 divinationTextIdInHectorStory; // FE7
    /* 7C */ u16 divinationTextIdEnding; // FE7
    /* 7E */ u8 divinationPortrait; // FE7
    /* 7F */ u8 divinationFee; // FE7

    /* 80 */ u8 prepScreenNumber;
    /* 81 */ u8 prepScreenNumberInHectorStory; // FE7
    /* 82 */ u8 merchantPosX;
    /* 83 */ u8 merchantPosXInHectorStory; // FE7
    /* 84 */ u8 merchantPosY;
    /* 85 */ u8 merchantPosYInHectorStory; // FE7

    /* 86 */ s8 victorySongEnemyThreshold;
    /* 87 */ bool8 fadeToBlack;

    /* 88 */ u16 statusObjectiveTextId;
    /* 8A */ u16 goalWindowTextId;
    /* 8C */ u8 goalWindowDataType;
    /* 8D */ u8 protectCharacterIndex;

    /* 8E */ u8 destPosX;
    /* 8F */ u8 destPosY;

    /* 90 */ u8 unk90; // ?
    /* 91 */ u8 default_background;
    /* 92 */ u8 unk92; // ?
    /* 93 */ u8 unk93; // ?
};

const struct ChapterInfo * GetChapterInfo(u32 chIndex);
