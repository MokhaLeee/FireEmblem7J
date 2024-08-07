#pragma once

#include "global.h"
#include "proc.h"
#include "unit.h"
#include "sprite-anim.h"

enum
{
    MU_STATE_NONE,
    MU_STATE_INACTIVE,
    MU_STATE_MOVEMENT,
    MU_STATE_SLEEPING,
    MU_STATE_UNK4,
    MU_STATE_BUMPING,
    MU_STATE_DISPLAY_UI,
    MU_STATE_DEATHFADE,
};

enum
{
    MU_FLASH_WHITE,
    MU_FLASH_BLACK,
    MU_FLASH_RED,
    MU_FLASH_GREEN,
    MU_FLASH_BLUE,
    MU_FLASH_5,
};

enum
{
    // MU command identifiers

    MOVE_CMD_END = -1, // end

    MOVE_CMD_MOVE_BASE,

    MOVE_CMD_MOVE_LEFT  = MOVE_CMD_MOVE_BASE + FACING_LEFT,
    MOVE_CMD_MOVE_RIGHT = MOVE_CMD_MOVE_BASE + FACING_RIGHT,
    MOVE_CMD_MOVE_DOWN  = MOVE_CMD_MOVE_BASE + FACING_DOWN,
    MOVE_CMD_MOVE_UP    = MOVE_CMD_MOVE_BASE + FACING_UP,

    MOVE_CMD_HALT,

    MOVE_CMD_FACE_BASE,

    MOVE_CMD_FACE_LEFT  = MOVE_CMD_FACE_BASE + FACING_LEFT,
    MOVE_CMD_FACE_RIGHT = MOVE_CMD_FACE_BASE + FACING_RIGHT,
    MOVE_CMD_FACE_DOWN  = MOVE_CMD_FACE_BASE + FACING_DOWN,
    MOVE_CMD_FACE_UP    = MOVE_CMD_FACE_BASE + FACING_UP,

    MOVE_CMD_SLEEP,
    MOVE_CMD_BUMP,
    MOVE_CMD_UNK11,
    MOVE_CMD_SET_SPEED,

    MOVE_CMD_CAMERA_ON,
    MOVE_CMD_CAMERA_OFF,

    MOVE_SCRIPT_MAX_LENGTH = 0x40,
};

struct MuInfo
{
    u8 const * img;
    u16 const * anim;
};

struct MuConfig;

struct MuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ struct SpriteAnim * sprite_anim;
    /* 34 */ struct MuConfig * config;

    /* 38 */ u8 cam_b;
    /* 39 */ u8 state;
    /* 3A */ u8 hidden_b;
    /* 3B */ u8 jid;
    /* 3C */ s8 facing;
    /* 3D */ u8 step_sound_clock;
    /* 3E */ u8 fast_walk_b;
    /* 3F */ // pad
    /* 40 */ u16 move_clock_q4;
    /* 42 */ s16 move_config;
    /* 44 */ s16 x_q4, y_q4;
    /* 48 */ s16 x_offset_q4, y_offset_q4;
};

struct MuConfig
{
    /* 00 */ u8 id;
    /* 01 */ u8 pal;
    /* 02 */ u16 chr;
    /* 04 */ u8 pc;
    /* 05 */ s8 movescr[0x40];
    /* 45 */ // 3 byte padding
    /* 48 */ struct MuProc * mu;
};

// MU_Init
// sub_806C274
// StartMu
// sub_806C398
// EnableMuCamera
// DisableMuCamera
struct MuProc * StartUiMu(struct Unit * unit, int x, int y);
// sub_806C474
// StartMuInternal
// SetMuFacing
// sub_806C790
// MU_SetDefaultFacing_Auto
// sub_806C7F8
// sub_806C82C
// sub_806C850
// IsMuActive
// SetMuMoveScript
// StartMuScripted
// MuStepSe_Init
// MuStepSe_PlaySeA
// MuStepSe_PlaySeB
// StartPlayMuStepSe
// PlayMuStepSe
// EndMuMovement
// RunMuMoveScript
// StartMuFogBump
// sub_806CDA8
// sub_806CE68
// sub_806CF4C
// sub_806CF90
// sub_806CFB4
// sub_806CFE8
// sub_806D010
// sub_806D06C
// sub_806D07C
// sub_806D08C
// UpdateMuStepSounds
// sub_806D3F8
// sub_806D47C
void EndAllMus(void);
// EndMu
// sub_806D4D4
// HaltMu
void LockMus(void);
void ReleaseMus(void);
void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * move_script);
bool CanStartMu(void);
// ResetMuAnims
// sub_806D6A0
// sub_806D744
// sub_806D7E8
// sub_806D934
// sub_806DA3C
// sub_806DB6C
// sub_806DCB8
// sub_806DD10
// sub_806DD40
// GetMuAnimForJid
// sub_806DD98
// sub_806DEC4
// sub_806DF58
// sub_806DFF0
// sub_806E07C
// sub_806E154
// sub_806E204
// sub_806E2A0
// sub_806E2C8
void SetMuScreenPosition(struct MuProc * mu, int x, int y);
// sub_806E334
// sub_806E380
// sub_806E400
// sub_806E450
// sub_806E4A0
// sub_806E4F4
// sub_806E51C
// sub_806E564
// sub_806E5C0
// sub_806E608
