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

    /* 16 */ u16 song_blue_a;
    /* 18 */ u16 song_red_a;
    /* 1A */ u16 song_green_a;
    /* 1C */ u16 song_blue_b;
    /* 1E */ u16 song_red_b;
    /* 20 */ u16 song_green_b;
    /* 22 */ u16 song_alt_blue;
    /* 24 */ u16 song_alt_red;
    /* 26 */ u16 song_unk_26;
    /* 28 */ u16 song_unk_28;
    /* 2A */ u16 song_unk_2A;

    /* 2C */ u8 wall_hp;

    // all ranking parameters here
    STRUCT_PAD(0x2D, 0x70);

    /* 70 */ u16 msg_chapter_title_a;
    /* 72 */ u16 msg_chapter_title_b;

    // FEBuilder glitches out here

    STRUCT_PAD(0x74, 0x7A);
    // u8 asset_event_info; ?

    /* 7A */ u16 msg_augury_intro;
    /* 7C */ u16 msg_augury_a;
    /* 7E */ u16 msg_augury_b;
    /* 80 */ u16 msg_augury_outro;
    /* 82 */ u8 fid_augury;
    /* 83 */ u8 augury_price;
    /* 84 */ u8 number_id_a;
    /* 85 */ u8 number_id_b;
    /* 86 */ u8 tent_x[2];
    /* 88 */ u8 tent_y[2];
    /* 8A */ s8 victory_bgm_enemy_threshold;

    STRUCT_PAD(0x8B, 0x91);

    /* 91 */ u8 default_background;
};

const struct ChapterInfo * GetChapterInfo(u32 chIndex);
