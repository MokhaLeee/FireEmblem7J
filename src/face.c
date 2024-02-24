#include "gbafe.h"
#include "gbafe/face.h"

struct FaceVramEnt CONST_DATA DefaultFaceConfig[FACE_SLOT_COUNT] = {
    [0] = { OBCHR_FACE_DEFAULT0 * CHR_SIZE, OBPAL_FACE_DEFAULT0 },
    [1] = { OBCHR_FACE_DEFAULT1 * CHR_SIZE, OBPAL_FACE_DEFAULT1 },
    [2] = { OBCHR_FACE_DEFAULT2 * CHR_SIZE, OBPAL_FACE_DEFAULT2 },
    [3] = { OBCHR_FACE_DEFAULT3 * CHR_SIZE, OBPAL_FACE_DEFAULT3 },
};

u16 CONST_DATA Sprite_Face64x80[] = {
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16,               OAM2_CHR(0x50),
};

u16 CONST_DATA Sprite_Face64x80_Flipped[] = {
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP,               OAM2_CHR(0x10),
};

u16 CONST_DATA Sprite_Face96x80[] = {
    6,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16,               OAM2_CHR(0x50),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_X(-48), OAM2_CHR(0x14),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_X(+32), OAM2_CHR(0x16),
};

u16 CONST_DATA Sprite_Face96x80_Flipped[] = {
    6,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x16),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_Face64x72[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8,                OAM2_CHR(0x50),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_X(-40), OAM2_CHR(0x15),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_X(+32), OAM2_CHR(0x16),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_X(-40), OAM2_CHR(0x55),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_X(+32), OAM2_CHR(0x56),
};

u16 CONST_DATA Sprite_Face64x72_Flipped[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_HFLIP + OAM1_X(-40), OAM2_CHR(0x16),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x15),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_HFLIP + OAM1_X(-40), OAM2_CHR(0x56),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x55),
};

u16 CONST_DATA Sprite_Face96x72[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8,                OAM2_CHR(0x50),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_X(-48), OAM2_CHR(0x14),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_X(+32), OAM2_CHR(0x16),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_X(-48), OAM2_CHR(0x54),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_X(+32), OAM2_CHR(0x56),
};

u16 CONST_DATA Sprite_Face96x72_Flipped[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x16),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x14),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x56),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x54),
};

struct FaceInfo const * GetFaceInfo(int fid)
{
    return FaceInfoTable + fid;
}

void InitFaces(void)
{
    int i;
    for (i = 0; i < FACE_SLOT_COUNT; ++i)
        EndFaceById(i);

    SetFaceConfig(NULL);
}

void SetFaceConfig(struct FaceVramEnt const * config)
{
    int i;

    if (config == NULL)
        config = DefaultFaceConfig;

    for (i = 0; i < FACE_SLOT_COUNT; ++i)
    {
        gFaceConfig[i].chr_off = config[i].chr_off;
        gFaceConfig[i].palid = config[i].palid;
    }
}

int GetFreeFaceSlot(void)
{
    int i;
    for (i = 0; i < FACE_SLOT_COUNT; ++i)
    {
        if (gFaces[i] == NULL)
            return i;
    }
    return -1;
}

void Face_OnInit(struct FaceProc * proc)
{
    Decompress(proc->info->img, gFaceConfig[proc->slot].chr_off + OBJ_VRAM0);
}

void Face_OnIdle(struct FaceProc * proc)
{
    int oam0;

    oam0 = (GetFaceDisp(proc) & FACE_DISP_BLEND) != 0 ? OAM0_BLEND : 0;
    oam0 += OAM0_Y(proc->y_disp);


    PutSpriteExt(
        proc->sprite_layer,
        OAM1_X(proc->x_disp),
        oam0,
        proc->sprite,
        proc->oam2
    );
}

struct FaceProc * StartFaceAuto(int fid, int x, int y, int disp)
{
    int slot = GetFreeFaceSlot();

    if (slot < 0)
        return NULL;

    return StartFace(slot, fid, x, y, disp);
}

struct ProcCmd CONST_DATA ProcScr_Face[] = {
    PROC_19,
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_YIELD,
    PROC_CALL(Face_OnInit),
    PROC_CALL(Face_OnIdle),
    PROC_REPEAT(Face_OnIdle),
    PROC_END,
};

struct FaceProc * StartFace(int slot, int fid, int x, int y, int disp)
{
    struct FaceProc * proc;
    const struct FaceInfo * info;

    if (gFaces[slot] != NULL)
        return NULL;

    proc = Proc_Start(ProcScr_Face, PROC_TREE_5);

    gFaces[slot] = proc;

    info = GetFaceInfo(fid);

    if (disp & FACE_DISP_BIT_13)
    {
        CpuFastFill(0, PAL_OBJ(0) + PAL_OFFSET(gFaceConfig[slot].palid), 0x20);
        EnablePalSync();
    }
    else
    {
        ApplyPalette(info->pal, gFaceConfig[slot].palid + 0x10);
    }

    proc->info = info;
    proc->slot= slot;
    proc->fid = fid;
    proc->sprite_layer = 5;

    proc->x_disp = x;
    proc->y_disp = y;

    if (disp & FACE_DISP_BIT_12)
    {
        proc->mouth_proc = NULL;
        proc->eye_proc   = NULL;
    }
    else
    {
        proc->mouth_proc = Proc_Start(ProcScr_FaceMouth, proc);
        proc->eye_proc   = Proc_Start(ProcScr_FaceEye, proc);
    }

    proc->disp = ~disp;

    SetFaceDisp(proc, disp);
    return proc;
}

void EndFace(struct FaceProc * proc)
{
    gFaces[proc->slot] = NULL;
    Proc_End(proc);
}

void EndFaceById(int slot)
{
    EndFace(gFaces[slot]);
}

u32 SetFaceDisp(struct FaceProc * proc, u32 disp)
{
    if (proc == NULL)
        return 0;

    proc->disp = disp;
    FaceRefreshSprite(proc);
    return proc->disp;
}

u32 SetFaceDispById(int slot, u32 disp)
{
    return SetFaceDisp(gFaces[slot], disp);
}

u32 GetFaceDisp(struct FaceProc * proc)
{
    return proc->disp;
}

u32 GetFaceDispById(int slot)
{
    return GetFaceDisp(gFaces[slot]);
}

void FaceRefreshSprite(struct FaceProc * proc)
{
    int oam2Layer;
    switch (proc->disp & 0x807) {
    case FACE_64x80:
        proc->sprite = Sprite_Face64x80;
        break;

    case FACE_64x80_FLIPPED:
        proc->sprite = Sprite_Face64x80_Flipped;
        break;

    case FACE_96x80:
        proc->sprite = Sprite_Face96x80;
        break;

    case FACE_96x80_FLIPPED:
        proc->sprite = Sprite_Face96x80_Flipped;
        break;

    case FACE_64x72:
        proc->sprite = Sprite_Face64x72;
        break;

    case FACE_64x72_FLIPPED:
        proc->sprite = Sprite_Face64x72_Flipped;
        break;

    case FACE_96x72:
        proc->sprite = Sprite_Face96x72;
        break;

    case FACE_96x72_FLIPPED:
        proc->sprite = Sprite_Face96x72_Flipped;
        break;
    }

    switch (proc->disp & FACE_DISP_HLAYER_MASK) {
    case FACE_DISP_HLAYER(FACE_HLAYER_0):
        oam2Layer = OAM2_LAYER(0);
        break;

    case FACE_DISP_HLAYER(FACE_HLAYER_1):
        oam2Layer = OAM2_LAYER(1);
        break;

    case FACE_DISP_HLAYER(FACE_HLAYER_3):
        oam2Layer = OAM2_LAYER(3);
        break;

    default:
        oam2Layer = OAM2_LAYER(2);
        break;
    }

    proc->oam2 = (gFaceConfig[proc->slot].chr_off / CHR_SIZE) + ((gFaceConfig[proc->slot].palid & 0xF) * 0x1000) + oam2Layer;
}

void PutFaceTm(u16 * tm, u8 const * data, int tileref, bool is_flipped)
{
    int width = *data++;
    int height = *data++;

    u8 const * it = data;

    int ix, iy;

    if (!is_flipped)
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = 0; ix < width; ++ix)
            {
                if (*it == 0xFF)
                {
                    it++;
                    continue;
                }

                tm[TM_OFFSET(ix, iy)] = *it++ + tileref;
            }
        }
    }
    else
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = width - 1; ix >= 0; --ix)
            {
                if (*it == 0xFF)
                {
                    it++;
                    continue;
                }

                tm[TM_OFFSET(ix, iy)] = *it++ + tileref + TILE_HFLIP;
            }
        }
    }
}

void UnpackFaceChibiGraphics(int fid, int chr, int pal)
{
    if (fid >= FID_FACTION_CHIBI)
    {
        RegisterDataMove(GetFactionFaceImg(fid), (void *)(((chr * CHR_SIZE + VRAM) & 0x1FFFF) + VRAM), 0x200);
        ApplyFactionFacePal(fid, pal);
    }
    else
    {
        const struct FaceInfo * info = GetFaceInfo(fid);

        Decompress(info->img_chibi, (void *)(chr * CHR_SIZE + VRAM));
        ApplyPalette(info->pal, pal);
    }
}

u8 CONST_DATA FaceTm_Unk_08BFF9A8[] =
{
    25, 0,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x08, 0x00, 0x00, 0x00, 0xF4, 0x20,
    0xC0, 0x08, 0x0E, 0x00, 0x01, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
    0x00, 0x00, 0x2D, 0x6A, 0x00, 0x08,
    0x02, 0x00, 0x00, 0x00, 0x55, 0x6A,
    0x00, 0x08, 0x03, 0x00, 0x00, 0x00,
    0x55, 0x6A, 0x00, 0x08, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

u8 CONST_DATA FaceTm_Chibi[] =
{
    4, 4,
    0x00, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0A, 0x0B,
    0x0C, 0x0D, 0x0E, 0x0F,

    /* pad */
    0x00, 0x00,
};

void PutFaceChibi(int fid, u16 * tm, int chr, int pal, bool is_flipped)
{
    UnpackFaceChibiGraphics(fid, chr, pal);

    chr &= 0x3FF;
    PutFaceTm(tm, FaceTm_Chibi, TILEREF(chr, pal), is_flipped);
}

void UnpackFaceChibiSprGraphics(int fid, int chr, int pal)
{
    chr += 0x800; // chr relative to obj chr base

    if (fid >= FID_FACTION_CHIBI)
    {
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 0,  (chr + 0x00) * CHR_SIZE, 4 * CHR_SIZE);
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 4,  (chr + 0x20) * CHR_SIZE, 4 * CHR_SIZE);
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 8,  (chr + 0x04) * CHR_SIZE, 4 * CHR_SIZE);
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 12, (chr + 0x24) * CHR_SIZE, 4 * CHR_SIZE);

        ApplyFactionFacePal(fid, 0x10 + pal);
    }
    else
    {
        u8 buf[0x200];
        struct FaceInfo const * info = GetFaceInfo(fid);

        Decompress(info->img_chibi, buf);

        CpuFastCopy(buf + CHR_SIZE * 0,  (void *)VRAM + (chr + 0x00) * CHR_SIZE, 4 * CHR_SIZE);
        CpuFastCopy(buf + CHR_SIZE * 4,  (void *)VRAM + (chr + 0x20) * CHR_SIZE, 4 * CHR_SIZE);
        CpuFastCopy(buf + CHR_SIZE * 8,  (void *)VRAM + (chr + 0x04) * CHR_SIZE, 4 * CHR_SIZE);
        CpuFastCopy(buf + CHR_SIZE * 12, (void *)VRAM + (chr + 0x24) * CHR_SIZE, 4 * CHR_SIZE);

        ApplyPalette(info->pal, 0x10 + pal);
    }
}

void FaceChibiSpr_OnIdle(struct FaceProc * proc)
{
    PutSprite(5,
        proc->x_disp - gDispIo.bg_off[0].x,
        proc->y_disp - gDispIo.bg_off[0].y,
        proc->sprite, proc->oam2);
}

struct ProcCmd CONST_DATA ProcScr_FaceChibiSpr[] = {
    PROC_REPEAT(FaceChibiSpr_OnIdle),
    PROC_END,
};

u16 CONST_DATA Sprite_FaceChibi[] = 
{
    2,
    OAM0_SHAPE_32x16,               OAM1_SIZE_32x16, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_Y(+16), OAM1_SIZE_32x16, OAM2_CHR(4),
};

u16 CONST_DATA Sprite_FaceChibi_Flipped[] =
{
    2,
    OAM0_SHAPE_32x16,               OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_Y(+16), OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(4),
};

void StartFaceChibiStr(int x, int y, int fid, int chr, int pal, bool is_flipped, ProcPtr parent)
{
    struct FaceProc * proc;

    UnpackFaceChibiSprGraphics(fid, chr, pal);

    proc = Proc_Start(ProcScr_FaceChibiSpr, parent);

    proc->x_disp = x;
    proc->y_disp = y;

    proc->oam2 = chr + OAM2_PAL(pal);

    if (is_flipped)
        proc->sprite = Sprite_FaceChibi_Flipped;
    else
        proc->sprite = Sprite_FaceChibi;
}

void EndFaceChibiSpr(void)
{
    Proc_EndEach(ProcScr_FaceChibiSpr);
}

void PutFace80x72_Standard(u16 * tm, int tileref, const struct FaceInfo * info)
{
    int x = info->x_mouth - 1;
    int y = info->y_mouth;

    TmApplyTsa(tm, Tsa_Unk_081911D4, (u16)tileref);

    tm[TM_OFFSET(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TM_OFFSET(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;
}

//! FE8U = 0x08005BCC
void PutFace80x72_Raised(u16 * tm, int tileref, const struct FaceInfo * info)
{
    int x = info->x_mouth - 1;
    int y = info->y_mouth - 1;

    TmApplyTsa(tm, Tsa_Unk_0819128C, (u16)tileref);

    tm[TM_OFFSET(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TM_OFFSET(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;
}

bool ShouldFaceBeRaised(int fid)
{
    switch (fid) {
    case 0x1C:
    case 0x33:
    case 0x39:
    case 0x3E:
    case 0x3F:
    case 0x41:
        return 1;

    default:
        return 0;
    }
}

void PutFace80x72_Core(u16 * tm, int fid, int chr, int pal)
{
    const struct FaceInfo * info;

    if (fid == 0)
        return;

    info = GetFaceInfo(fid);

    ApplyPalette(info->pal, pal);

    if (info->img != NULL)
    {
        int i;

        Decompress(info->img, (void *)(chr * 0x20 + VRAM));
        ApplyPalette(info->pal, pal);

        if (ShouldFaceBeRaised(fid))
            PutFace80x72_Raised(tm, (pal << 12) + (0x3FF & chr), info);
        else
            PutFace80x72_Standard(tm, (pal << 12) + (0x3FF & chr), info);

        for (i = 0; i < 6; i++)
        {
            tm[i * 0x20 + 0] = 0;
            tm[i * 0x20 + 9] = 0;
        }
    }
    else
    {
        Decompress(info->img_card, (void*)(chr * CHR_SIZE + VRAM));
        PutAppliedBitmap(tm, (pal << 12) + (0x3FF & chr), 10, 9);
    }
}

struct ProcCmd CONST_DATA ProcScr_FaceFormatGenerate[] = {
    PROC_CALL(FaceFormat_Init),
PROC_LABEL(0),
    PROC_REPEAT(FaceFormat_Delay),
    PROC_REPEAT(FaceFormat_PutFace),
    PROC_GOTO(0),
    PROC_END,
};

void FaceFormat_Init(struct FaceFmtProc * proc)
{
    proc->face_proc = NULL;
    proc->dealy = 120;
    proc->unk_32 = 0;
}

void FaceFormat_Delay(struct FaceFmtProc * proc)
{
    if (--proc->dealy >= 0)
        return;

    proc->dealy = FaceFmtProc_GenBlinkInterval(proc);
    proc->timer = 0;

    Proc_Break(proc);
}

void FaceFormat_PutFace(struct FaceFmtProc * proc)
{
    const struct FaceInfo * info;
    u16 * tm1;
    u16 * tm2;
    int offset;

    int tileref = (proc->palId << 12) + (0x3FF & proc->tileId);

    info = GetFaceInfo(proc->faceId);
    offset = 0;

    switch (proc->timer) {
    case 3:
        offset = 88;
        break;

    case 0:
    case 6:
        offset = 24;
        break;

    case 9:
        PutFace80x72_Standard(proc->tm, (proc->palId << 12) + (0x3FF & proc->tileId), info);
        EnableBgSyncById(GetBgFromPtr(proc->tm));
        Proc_Break(proc);

        return;

    case 1:
    case 2:
    case 4:
    case 5:
    case 7:
    case 8:
        proc->timer++;
        return;
    }

    info = GetFaceInfo(proc->faceId);

    tm1 = ((info->y_eyes << 5) + proc->tm) + info->x_eyes;

    tm2 = tm1 - 1;

    *(tm2 + 0x00 + 0) = tileref + offset + 0x00 + 0;
    *(tm2 + 0x00 + 1) = tileref + offset + 0x00 + 1;
    *(tm2 + 0x00 + 2) = tileref + offset + 0x00 + 2;
    *(tm2 + 0x00 + 3) = tileref + offset + 0x00 + 3;

    *(tm1 + 0x20 - 1) = tileref + offset + 0x20 + 0;
    *(tm1 + 0x20 + 0) = tileref + offset + 0x20 + 1;
    *(tm1 + 0x20 + 1) = tileref + offset + 0x20 + 2;
    *(tm1 + 0x20 + 2) = tileref + offset + 0x20 + 3;

    EnableBgSyncById(GetBgFromPtr(tm2));
    proc->timer++;
}

void PutFace80x72(ProcPtr proc, u16 * tm, int fid, int chr, int pal)
{
    Proc_EndEach(ProcScr_FaceFormatGenerate);
    PutFace80x72_Core(tm, fid, chr, pal);
    GetFaceInfo(fid);
}

void EndFacePtr(struct Proc * proc)
{
    EndFace(proc->ptr);
    return;
}

struct ProcCmd CONST_DATA ProcScr_FaceEndIn8Frames[] = {
    PROC_SLEEP(8),
    PROC_CALL(EndFacePtr),
    PROC_END,
};

void EndFaceIn8Frames(struct FaceProc * proc)
{
    struct Proc * gproc;

    gproc = Proc_Start(ProcScr_FaceEndIn8Frames, PROC_TREE_3);
    gproc->ptr = proc;
}

void StartFaceFadeIn(struct FaceProc * proc)
{
    struct FaceInfo const * info = GetFaceInfo(proc->fid);

    SetBlackPal(0x10 + gFaceConfig[proc->slot].palid);
    StartPalFade(info->pal, 0x10 + gFaceConfig[proc->slot].palid, 12, proc);
}

void StartFaceFadeOut(struct FaceProc * proc)
{
    struct FaceInfo const * info = GetFaceInfo(proc->fid);

    StartPalFadeToBlack(0x10 + gFaceConfig[proc->slot].palid, 12, proc);
    EndFaceIn8Frames(proc);
}

u8 const * GetFactionFaceImg(int fid)
{
    const u8 * img_table[] =
    {
        Img_FactionMiniCard + 0xC00,
        Img_FactionMiniCard,
        Img_FactionMiniCard + 0x200,
        Img_FactionMiniCard + 0x400,
        Img_FactionMiniCard + 0x600,
        Img_FactionMiniCard + 0x800,
        Img_FactionMiniCard + 0xA00,
    };

    fid = fid - FID_FACTION_CHIBI;

    return img_table[fid];
}

void ApplyFactionFacePal(int fid, int pal)
{
    const u16 * pal_table[] =
    {
        Pal_FactionMiniCard,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
    };

    fid = fid - FID_FACTION_CHIBI;

    ApplyPalette(pal_table[fid], pal);
}

struct ProcCmd CONST_DATA ProcScr_FaceMouth[] = {
    PROC_CALL(FaceMouth_Init),
    PROC_REPEAT(FaceMouth_Loop),
    PROC_END,
};

void FaceMouth_Init(struct FaceMouthProc * proc)
{
    proc->face_proc = proc->proc_parent;
    proc->timer = 0;
}

void FaceMouth_Loop(struct FaceMouthProc * proc)
{
    int oam1;
    int oam0;

    if (!(GetFaceDisp(proc->face_proc) & (FACE_DISP_TALK_1 | FACE_DISP_TALK_2)))
    {
        int chr = (GetFaceDisp(proc->face_proc) & FACE_DISP_SMILE) ? 0 : 24;
        chr += 16;

        Register2dChrMove(
            proc->face_proc->info->img_mouth + chr * 0x20,
            ((proc->face_proc->oam2 + 28) & 0x3FF) * 0x20 + OBJ_VRAM0,
            4,
            2
        );
    }
    else
    {
        if (--proc->timer < 0)
        {
            int chr = (GetFaceDisp(proc->face_proc) & FACE_DISP_SMILE) ? 0 : 24;

            proc->timer = ((RandNextB() >> 16) & 7) + 1;
            proc->frame = (proc->frame + 1) & 3;

            switch (proc->frame) {
            case 1:
            case 3:
                chr += 8;
                break;

            case 2:
                chr += 16;
                break;

            case 0:
            default:
                chr += 0;
                break;
            }

            Register2dChrMove(
                proc->face_proc->info->img_mouth + chr * 0x20,
                ((proc->face_proc->oam2 + 28) & 0x3FF) * 0x20 + OBJ_VRAM0,
                4,
                2
            );
        }
    }

    oam1 = 4 - proc->face_proc->info->x_mouth;
    oam1 = (GetFaceDisp(proc->face_proc) & FACE_DISP_FLIPPED) ? oam1 : -oam1;
    oam1 = OAM1_X((oam1 * 8 + proc->face_proc->x_disp) - 16);

    if (GetFaceDisp(proc->face_proc) & FACE_DISP_FLIPPED)
        oam1 = oam1 + OAM1_HFLIP;

    if (GetFaceDisp(proc->face_proc) & FACE_DISP_BLEND)
        oam0 = OAM0_BLEND;
    else
        oam0 = 0;

    oam0 += (proc->face_proc->y_disp + (proc->face_proc->info->y_mouth * 8)) & 0xFF;

    PutSpriteExt(
        proc->face_proc->sprite_layer,
        oam1,
        oam0,
        Sprite_32x16,
        proc->face_proc->oam2 + 28
    );
}

struct ProcCmd CONST_DATA ProcScr_FaceEye[] = {
PROC_LABEL(0),
    PROC_CALL(FaceEye_80076F8),
PROC_LABEL(0),
    PROC_REPEAT(FaceEye_800773C),
PROC_LABEL(1),
    PROC_REPEAT(FaceEye_8007774),
PROC_LABEL(2),
    PROC_CALL(FaceEye_80077E0),
    PROC_REPEAT(FaceEye_80077E8),
    PROC_REPEAT(FaceEye_800773C),
PROC_LABEL(3),
    PROC_CALL(FaceEye_800781C),
    PROC_REPEAT(FaceEye_8007824),
    PROC_REPEAT(FaceEye_800773C),
PROC_LABEL(4),
    PROC_CALL(FaceEye_8007858),
    PROC_REPEAT(FaceEye_8007860),
PROC_LABEL(97),
    PROC_REPEAT(FaceEye_80077E8),
    PROC_END,
};

void PutFaceEyeSprite(struct FaceBlinkProc * proc, int chr)
{
    int oam1;
    int oam0;

    bool flip = 0;

    switch (chr) {
    case 0:
        chr = 88;
        break;

    case 1:
        chr = 24;
        break;

    case 0x80:
        chr = 88;
        flip = true;
        break;

    case 0x81:
        chr = 24;
        flip = true;
        break;

    default:
        return;
    }

    oam1 = 4 - proc->pFaceProc->info->x_eyes;

    oam1 = (GetFaceDisp(proc->pFaceProc) & FACE_DISP_FLIPPED) ? oam1 : -oam1;

    oam1 = ((oam1 * 8 + proc->pFaceProc->x_disp) - 16) & 0x1FF;

    if (GetFaceDisp(proc->pFaceProc) & 1)
        oam1 = oam1 + 0x1000;

    if (GetFaceDisp(proc->pFaceProc) & FACE_DISP_BLEND)
        oam0 = OAM0_BLEND;
    else
        oam0 = 0;

    oam0 += (proc->pFaceProc->y_disp + (proc->pFaceProc->info->y_eyes * 8)) & 0xff;

    if (flip)
    {
        if (!(GetFaceDisp(proc->pFaceProc) & FACE_DISP_FLIPPED))
            oam1 = oam1 + 16;

        PutSpriteExt(
            proc->pFaceProc->sprite_layer,
            oam1,
            oam0,
            Sprite_16x16,
            proc->pFaceProc->oam2 + chr + 2
        );
    }
    else
    {
        PutSpriteExt(
            proc->pFaceProc->sprite_layer,
            oam1,
            oam0,
            Sprite_32x16,
            proc->pFaceProc->oam2 + chr
        );
    }
}
