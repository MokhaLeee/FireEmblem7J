#pragma once

#include "global.h"
#include "proc.h"

#define FACE_SLOT_COUNT 4
#define FID_FACTION_CHIBI 0x7F00

struct FaceInfo {
    /* 00 */ void const * img;
    /* 04 */ void const * img_chibi;
    /* 08 */ u16 const * pal;
    /* 0C */ void const * img_mouth;
    /* 10 */ void const * img_card;
    /* 14 */ u8 x_mouth, y_mouth;
    /* 16 */ u8 x_eyes, y_eyes;
    /* 18 */ u8 blink_type;
};

extern struct FaceInfo FaceInfoTable[];

struct FaceVramEnt {
    /* 00 */ u32 chr_off;
    /* 04 */ u16 palid;
};

extern struct FaceVramEnt EWRAM_DATA gFaceConfig[FACE_SLOT_COUNT];

struct FaceBlinkProc;

struct FaceProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const struct FaceInfo * info;
    /* 30 */ u32 disp;
    /* 34 */ s16 x_disp;
    /* 36 */ s16 y_disp;

    /* 38 */ u16 const * sprite;

    /* 3C */ u16 oam2;
    /* 3E */ u16 fid;
    /* 40 */ u8 slot;
    /* 41 */ u8 sprite_layer;

    /* 44 */ ProcPtr mouth_proc;
    /* 48 */ struct FaceBlinkProc * blink_proc;
};

extern struct FaceProc * gFaces[FACE_SLOT_COUNT];

struct FaceBlinkProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct FaceProc * pFaceProc;

    /* 30 */ s16 blinkControl;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;

    /* 38 */ int unk_38;
    /* 3C */ u16 * unk_3c;

    /* 40 */ u16 tileId;
    /* 42 */ u16 palId;
    /* 44 */ u16 faceId;
};

enum {
    FACE_64x80,
    FACE_64x80_FLIPPED,
    FACE_96x80,
    FACE_96x80_FLIPPED,
    FACE_64x72,
    FACE_64x72_FLIPPED,

    FACE_96x72 = 0x800,
    FACE_96x72_FLIPPED = 0x801,
};

enum {
    FACE_HLAYER_DEFAULT,

    // why shifts?
    FACE_HLAYER_0 = 1 << 0,
    FACE_HLAYER_1 = 1 << 1,
    FACE_HLAYER_2 = 1 << 2,
    FACE_HLAYER_3 = 1 << 3,
};

#define FACE_DISP_FLIPPED (1 << 0)
#define FACE_DISP_KIND(kind) ((kind) & 807)
#define FACE_DISP_KIND_MASK FACE_DISP_KIND(-1)
#define FACE_DISP_SMILE (1 << 3)
#define FACE_DISP_TALK_1 (1 << 4)
#define FACE_DISP_TALK_2 (1 << 5)
#define FACE_DISP_HLAYER(layer) (((layer) & 0xF) << 6)
#define FACE_DISP_HLAYER_MASK FACE_DISP_HLAYER(-1)
#define FACE_DISP_BLEND (1 << 10)
#define FACE_DISP_BIT_12 (1 << 12)
#define FACE_DISP_BIT_13 (1 << 13)
#define FACE_DISP_BIT_14 (1 << 14)

struct FaceInfo const * GetFaceInfo(int fid);
void InitFaces(void);
void SetFaceConfig(struct FaceVramEnt const * config);
// GetFreeFaceSlot
void Face_OnInit(struct FaceProc * proc);
void Face_OnIdle(struct FaceProc * proc);
struct FaceProc * StartFaceAuto(int fid, int x, int y, int disp);
struct FaceProc * StartFace(int slot, int fid, int x, int y, int disp);
void EndFace(struct FaceProc * proc);
void EndFaceById(int slot);
u32 SetFaceDisp(struct FaceProc * proc, u32 disp);
u32 SetFaceDispById(int slot, u32 disp);
u32 GetFaceDisp(struct FaceProc * proc);
u32 GetFaceDispById(int slot);
void FaceRefreshSprite(struct FaceProc * proc);
// PutFaceTm
// UnpackFaceChibiGraphics
// PutFaceChibi
// UnpackFaceChibiSprGraphics
// FaceChibiSpr_OnIdle
// StartFaceChibiStr
// sub_8006FF0
// sub_8007000
// sub_8007054
// ShouldFaceBeRaised
// PutFace80x72_Core
// sub_8007220
// sub_800722C
// sub_8007254
// sub_8007354
// sub_8007388
// sub_8007394
// sub_80073AC
// sub_80073F4
u8 * GetFactionFaceImg(int);
void ApplyFactionFacePal(int, int);
// sub_8007490
// sub_800749C
// sub_80075F0
// sub_80076F8
// sub_800773C
// sub_8007774
// sub_80077E0
// sub_80077E8
// sub_800781C
// sub_8007824
// sub_8007858
// sub_8007860
// SetFaceBlinkControl
// SetFaceBlinkControlById
// FaceBlinkProc_GenBlinkInterval
// sub_800796C
// sub_8007974
// sub_800798C
// sub_8007A00
// sub_8007A5C
// sub_8007B80
// sub_8007B94
// sub_8007BB8
// sub_8007C10
// sub_8007C48
// sub_8007C64

// ??? gUnk_08BFF7B8
// ??? gUnk_08BFF7C0
// ??? gUnk_08BFF7C8
// ??? gUnk_08BFF7D0
// ??? gUnk_08BFF7D8
// ??? gUnk_08BFF7E0
// ??? gUnk_08BFF7E8
// ??? gUnk_08BFF7F0
// ??? gUnk_08BFF7F8
extern struct FaceVramEnt CONST_DATA DefaultFaceConfig[FACE_SLOT_COUNT];
extern u16 CONST_DATA Sprite_Face64x80[];
extern u16 CONST_DATA Sprite_Face64x80_Flipped[];
extern u16 CONST_DATA Sprite_Face96x80[];
extern u16 CONST_DATA Sprite_Face96x80_Flipped[];
extern u16 CONST_DATA Sprite_Face64x72[];
extern u16 CONST_DATA Sprite_Face64x72_Flipped[];
extern u16 CONST_DATA Sprite_Face96x72[];
extern u16 CONST_DATA Sprite_Face96x72_Flipped[];
extern CONST_DATA struct ProcCmd ProcScr_Face[];
// ??? FaceTm_Unk_08BFF9A8
extern u8 CONST_DATA FaceTm_Chibi[];
// ??? ProcScr_FaceChibiSpr
// ??? Sprite_FaceChibi
// ??? Sprite_FaceChibi_Flipped
// ??? gUnk_08BFFA20
// ??? gUnk_08BFFA50
extern CONST_DATA struct ProcCmd ProcScr_FaceMouth[];
extern CONST_DATA struct ProcCmd ProcScr_FaceEye[];
