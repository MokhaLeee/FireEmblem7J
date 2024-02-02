#include "global.h"
#include "anime.h"
#include "oam.h"

typedef void (* AnimCallback_t) (struct Anim * anim);

EWRAM_DATA struct Anim sAnimPool[ANIM_MAX_COUNT] = {};
EWRAM_DATA struct Anim * sFirstAnim = NULL;

void AnimUpdateAll(void)
{
    struct Anim * anim;
    int boolNeedsSort = false;

    if (!sFirstAnim)
        return;

    for (anim = sFirstAnim;; anim = anim->pNext)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        if (!(anim->state & ANIM_BIT_FROZEN))
        {
            if (anim->timer == 0 || --anim->timer == 0)
            {
                do
                {
                    if (AnimInterpret(anim) == TRUE)
                        boolNeedsSort = TRUE;
                }
                while (anim->timer == 0);
            }

            if (ANIM_IS_DISABLED(anim))
                continue;
        }

        if (!(anim->state & ANIM_BIT_HIDDEN))
            AnimDisplayPrivate(anim);

        if (!anim->pNext)
            break;
    }

    if (boolNeedsSort == TRUE)
        AnimSort();
}

void AnimClearAll(void)
{
    struct Anim * it;

    for (it = sAnimPool; it < sAnimPool + ANIM_MAX_COUNT; ++it)
    {
        it->state = 0;
        it->pPrev = NULL;
        it->pNext = NULL;
    }

    sFirstAnim = NULL;
}

struct Anim * AnimCreate_unused(const AnimScr * scr)
{
    struct Anim * anim;

    // Find anim slot for new anim
    for (anim = sAnimPool; (anim < sAnimPool + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == sAnimPool + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_ENABLED;

    anim->pScrCurrent = scr;
    anim->pScrStart = scr;

    anim->timer = 0;
    anim->oam2Base = 0;
    anim->drawLayerPriority = 0;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->commandQueueSize = 0;

    anim->pImgSheetBuf = NULL;
    anim->pSpriteDataPool = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    AnimInsert(anim);

    return anim;
}

struct Anim * AnimCreate(const void * frameData, u16 displayPriority)
{
    struct Anim* anim;

    // Find anim slot for new anim
    for (anim = sAnimPool; (anim < sAnimPool + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == sAnimPool + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_ENABLED;

    anim->pScrCurrent = frameData;
    anim->pScrStart = frameData;

    anim->timer = 0;
    anim->oam2Base = 0;
    anim->drawLayerPriority = displayPriority;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->commandQueueSize = 0;

    anim->pImgSheetBuf = NULL;
    anim->pSpriteDataPool = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    AnimInsert(anim);

    return anim;
}

void AnimSort(void)
{
    struct Anim * anim;

    for (anim = sAnimPool; anim < sAnimPool + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        anim->pPrev = NULL;
        anim->pNext = NULL;
    }

    sFirstAnim = NULL;

    for (anim = sAnimPool; anim < sAnimPool + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        AnimInsert(anim);
    }
}

void AnimDelete(struct Anim * anim)
{
    if (anim->pPrev == NULL)
    {
        sFirstAnim = anim->pNext;
        anim->pNext->pPrev = NULL;
    }
    else
    {
        anim->pPrev->pNext = anim->pNext;
        anim->pNext->pPrev = anim->pPrev;
    }

    anim->state = 0;
    anim->pPrev = NULL;
    anim->pNext = NULL;
}

void AnimDisplay(struct Anim * anim)
{
    AnimDisplayPrivate(anim);
}

int AnimInterpret(struct Anim* anim)
{
    int boolNeedsResort = FALSE;

    u32 instruction = *anim->pScrCurrent++;

    if (ANINS_IS_NOT_FORCESPRITE(instruction))
    {
        if (ANINS_IS_PTRINS(instruction))
        {
            switch (ANINS_PTRINS_GET_TYPE(instruction))
            {

            case 0: // function call
                ((AnimCallback_t) (ANINS_PTRINS_GET_ADDRESS(instruction)))(anim);
                break;

            case 1: // set new frame data
                anim->pScrStart   = ANINS_PTRINS_GET_ADDRESS(instruction);
                anim->pScrCurrent = ANINS_PTRINS_GET_ADDRESS(instruction);

                anim->timer = 1;

                break;

            } // switch (ANINS_PTRINS_GET_TYPE(instruction))
        }
        else
        {
            switch (ANINS_GET_TYPE(instruction))
            {

            case ANIM_INS_TYPE_STOP:
                anim->pScrCurrent--;
                anim->timer = 1;

                anim->state2 = (anim->state2 & 0xFFF) | ANIM_BIT2_STOP;

                break;

            case ANIM_INS_TYPE_END:
                anim->state = 0;
                anim->timer = 1;

                boolNeedsResort = TRUE;

                break;

            case ANIM_INS_TYPE_LOOP:
                anim->pScrCurrent = anim->pScrStart;
                anim->timer = 1;

                break;

            case ANIM_INS_TYPE_WAIT:
                anim->timer = ANINS_WAIT_GET_DELAY(instruction);
                break;

            case ANIM_INS_TYPE_MOVE:
                anim->xPosition += ANINS_MOVE_GET_XOFF(instruction);
                anim->yPosition += ANINS_MOVE_GET_YOFF(instruction);

                anim->timer = ANINS_MOVE_GET_DELAY(instruction);

                break;

            case ANIM_INS_TYPE_COMMAND:
                anim->state2 = (anim->state2 & 0xFFF) | ANIM_BIT2_COMMAND;

                anim->commandQueue[anim->commandQueueSize] = ANINS_COMMAND_GET_ID(instruction);
                anim->commandQueueSize++;

                anim->timer = 1;

                switch (ANINS_COMMAND_GET_ID(instruction))
                {

                case ANIM_CMD_WAIT_01:
                case ANIM_CMD_WAIT_02:
                case ANIM_CMD_WAIT_03:
                case ANIM_CMD_WAIT_04:
                case ANIM_CMD_WAIT_05:
                case ANIM_CMD_WAIT_13:
                case ANIM_CMD_WAIT_18:
                case ANIM_CMD_WAIT_2D:
                case ANIM_CMD_WAIT_39:
                case ANIM_CMD_WAIT_52:
                    anim->pScrCurrent--;
                    break;

                } // switch (ANINS_COMMAND_GET_ID(instruction))

                break;

            case ANIM_INS_TYPE_FRAME:
                anim->timer = ANINS_FRAME_GET_DELAY(instruction);
                anim->unk13 = ANINS_FRAME_GET_UNK(instruction);

                anim->pImgSheet = (const void*) (*anim->pScrCurrent++);

                // ???????
                anim->pSpriteData = (const void*) (*anim->pScrCurrent++);
                anim->pSpriteData += (unsigned) anim->pSpriteDataPool;

                anim->state2 = (anim->state2 & 0xFFF) | ANIM_BIT2_FRAME;

                break;

            } // switch (0x3F & (instruction >> 24))
        }
    }
    else
    {
        anim->pSpriteData = ANINS_FORCESPRITE_GET_ADDRESS(instruction);
        anim->timer       = ANINS_FORCESPRITE_GET_DELAY(instruction);
    }

    return boolNeedsResort;
}

void AnimInsert(struct Anim* anim)
{
    struct Anim* it = sFirstAnim;

    if (!sFirstAnim)
    {
        sFirstAnim = anim;
        return;
    }

    for (;;)
    {
        if (anim->drawLayerPriority > it->drawLayerPriority)
        {
            struct Anim* prev = it->pPrev;

            anim->pPrev = it->pPrev;
            anim->pNext = it;
            it->pPrev = anim;

            if (!anim->pPrev)
                sFirstAnim = anim;
            else
                prev->pNext = anim;

            break;
        }

        if (!it->pNext)
        {
            anim->pNext = it->pNext;
            anim->pPrev = it;
            it->pNext = anim;

            return;
        }

        it = it->pNext;
    }
}

#if 0
void AnimDisplayPrivate(struct Anim * anim)
{
    struct AnimSpriteData const * it;
    struct AnimSpriteData const * sprData;

    int x, y;
    int i;

    unsigned affId = gOamAffinePutId;

    sprData = anim->pSpriteData;

    if (!sprData)
        return;

    if ((sprData->header &~ 0xFFFF) == 0xFFFF0000)
    {
        i = sprData->header & 0xFFFF;

        for (;;)
        {
            if (FALSE)
                break;

            if (i == 0)
                break;

            gOamAffinePutIt->aff = sprData->as.affine.pa;
            gOamAffinePutIt++;

            gOamAffinePutIt->aff = sprData->as.affine.pb;
            gOamAffinePutIt++;

            gOamAffinePutIt->aff = sprData->as.affine.pc;
            gOamAffinePutIt++;

            gOamAffinePutIt->aff = sprData->as.affine.pd;
            gOamAffinePutIt++;

            gOamAffinePutId++;

            i--;
            sprData++;
        }
    }

    for (it = sprData; it->header == 1 || gOamHiPutIt >= (gOam + 0x200); it++)
    {
        x = it->as.object.x + anim->xPosition;
        y = it->as.object.y + anim->yPosition;

        if (x > 0x100)
            x = 0x180;
        else if (x < -0x40)
            x = 0x180;

        if (y > 0x0A0)
            x = 0x180;
        else if (y < -0x40)
            x = 0x180;

        x = OAM1_X(x);
        y = OAM0_Y(y);

        i = 0;

        if (it->header & OAM0_AFFINE_ENABLE)
            i = (affId << 25);

        i = i + anim->oamBase;

        *(u32 *) ((u32 *) gOamHiPutIt)++ = (it->header + i) | (x << 16) | (y);
        *(u16 *) ((u32 *) gOamHiPutIt)++ = (it->as.object.oam2 & 0xF3FF) + anim->oam2Base;
    }
}
#endif
