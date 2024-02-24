#include "gbafe.h"

struct SpriteEntry EWRAM_DATA SpritePool[0x80] = {};
struct SpriteEntry EWRAM_DATA SpriteLayers[0x10] = {};

u16 CONST_DATA Sprite_8x8[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
};

u16 CONST_DATA Sprite_16x16[] =
{
    1, OAM0_SHAPE_16x16, OAM1_SIZE_16x16, 0,
};

u16 CONST_DATA Sprite_32x32[] =
{
    1, OAM0_SHAPE_32x32, OAM1_SIZE_32x32, 0,
};

u16 CONST_DATA Sprite_64x64[] =
{
    1, OAM0_SHAPE_64x64, OAM1_SIZE_64x64, 0,
};

u16 CONST_DATA Sprite_8x16[] =
{
    1, OAM0_SHAPE_8x16, OAM1_SIZE_8x16, 0,
};

u16 CONST_DATA Sprite_16x32[] =
{
    1, OAM0_SHAPE_16x32, OAM1_SIZE_16x32, 0,
};

u16 CONST_DATA Sprite_32x64[] =
{
    1, OAM0_SHAPE_32x64, OAM1_SIZE_32x64, 0,
};

u16 CONST_DATA Sprite_16x8[] =
{
    1, OAM0_SHAPE_16x8, OAM1_SIZE_16x8, 0,
};

u16 CONST_DATA Sprite_16x8_VFlipped[] =
{
    1, OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_VFLIP, 0,
};

u16 CONST_DATA Sprite_32x16[] =
{
    1, OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
};

u16 CONST_DATA Sprite_64x32[] =
{
    1, OAM0_SHAPE_64x32, OAM1_SIZE_64x32, 0,
};

u16 CONST_DATA Sprite_32x8[] =
{
    1, OAM0_SHAPE_32x8, OAM1_SIZE_32x8, 0,
};

u16 CONST_DATA Sprite_8x32[] =
{
    1, OAM0_SHAPE_8x32, OAM1_SIZE_8x32, 0,
};

u16 CONST_DATA Sprite_32x8_VFlipped[] =
{
    1, OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_VFLIP, 0,
};

u16 CONST_DATA Sprite_8x16_HFlipped[] =
{
    1, OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_HFLIP, 0,
};

u16 CONST_DATA Sprite_8x8_HFlipped[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_HFLIP, 0,
};

u16 CONST_DATA Sprite_8x8_VFlipped[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_VFLIP, 0,
};

u16 CONST_DATA Sprite_8x8_HFlipped_VFlipped[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA Sprite_16x16_VFlipped[] =
{
    1, OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_VFLIP, 0,
};

void PutSpriteAffine(int id, short pa, short pb, short pc, short pd)
{
    gOam[id*0x10 + 0x03] = pa;
    gOam[id*0x10 + 0x07] = pb;
    gOam[id*0x10 + 0x0B] = pc;
    gOam[id*0x10 + 0x0F] = pd;
}

void ClearSprites(void)
{
    int i;

    for (i = 15; i >= 0; i--)
    {
        SpriteLayers[i].next = &SpriteLayers[i + 1];
        SpriteLayers[i].object = NULL;
    }

    SpriteLayers[15].next = NULL;
    SpriteLayers[12].next = NULL;

    gSpriteAllocIt = SpritePool;
}

void PutSprite(int layer, int x, int y, u16 const * object, int oam2)
{
    gSpriteAllocIt->next = SpriteLayers[layer].next;
    gSpriteAllocIt->oam1 = OAM1_X(x);
    gSpriteAllocIt->oam0 = OAM0_Y(y);
    gSpriteAllocIt->oam2 = oam2;
    gSpriteAllocIt->object = object;

    SpriteLayers[layer].next = gSpriteAllocIt;
    gSpriteAllocIt++;
}

void PutSpriteExt(int layer, int x_oam1, int y_oam0, u16 const * object, int oam2)
{
    gSpriteAllocIt->next = SpriteLayers[layer].next;
    gSpriteAllocIt->oam1 = x_oam1;
    gSpriteAllocIt->oam0 = y_oam0;
    gSpriteAllocIt->oam2 = oam2;
    gSpriteAllocIt->object = object;

    SpriteLayers[layer].next = gSpriteAllocIt;
    gSpriteAllocIt++;
}

void PutSpriteLayerOam(int layer)
{
    struct SpriteEntry * it = SpriteLayers + layer;

    while (it)
    {
        if (!it->object)
        {
            it = it->next;
            continue;
        }

        PutOamHi(it->oam1, it->oam0, it->object, it->oam2);
        it = it->next;
    }
}

void SpriteRefresher_OnIdle(struct SpriteProc * proc)
{
    PutSprite(proc->layer, proc->x, proc->y, proc->object, proc->tileref);
}

struct ProcCmd CONST_DATA ProcSrc_SpriteRefresher[] = {
    PROC_REPEAT(SpriteRefresher_OnIdle),
    PROC_END,
};

struct SpriteProc * StartSpriteRefresher(ProcPtr parent, int layer, int x, int y, u16 const * object, int tileref)
{
    struct SpriteProc * proc;

    if (parent)
        proc = Proc_Start(ProcSrc_SpriteRefresher, parent);
    else
        proc = Proc_Start(ProcSrc_SpriteRefresher, PROC_TREE_3);

    proc->x = x;
    proc->y = y;
    proc->layer = layer;
    proc->object = object;
    proc->tileref = tileref;

    return proc;
}

void MoveSpriteRefresher(struct SpriteProc * proc, int x, int y)
{
    if (proc == NULL)
        proc = Proc_Find(ProcSrc_SpriteRefresher);

    proc->x = x;
    proc->y = y;
}
