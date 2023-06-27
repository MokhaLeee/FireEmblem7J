#include "global.h"
#include "anime.h"
#include "ekrbattle.h"

extern int Unk_03004750;
extern int Unk_0203E088[2];

void _BattleAIS_ExecCommands(void)
{
    int i, state2, state3, id1, id2, type;
    const u32 *ptr;
    int *pmode, mode;
    struct Anim *anim, *animc, *anim1, *anim2;

    for (i = 0; i < 4; i++) {
        Unk_03004750 = 0;

        /* R7 = anim */
        anim = gAnims[i];
        if (!anim)
            continue;

        /* R8 = state2 */
        state2 = anim->state2 & 0xF000;
        if (state2 == 0)
            continue;
        
        if (state2 & 0x1000) {
            while (anim->commandQueueSize != 0) {
                // _08053C8A
                switch (anim->commandQueue[anim->commandQueueSize - 1]) {
                case 1:
                    if (gEkrDebugUnk3 == 1)
                        anim->pScrCurrent = anim->pScrStart;
                    else if (anim->state3 & 0x4)
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    else if (anim->state3 & 0x8) {
                        if (sub_0804DD50() == 1) {
                            anim->state3 &= 0xFFF2;
                            anim->pScrCurrent = anim->pScrCurrent + 1;

                            if (sub_08050FE4() != 0)
                                sub_08050FF0(0);
                        }
                    }
                    break;
                
                case 2:
                    if (anim->state3 & 0x01) {
                        anim->state3 &= 0xFFFE;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;
                
                case 3:
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxSpecalEffect(anim);
                    }

                    state3 = anim->state3;
                    if (state3 & 0x40) {
                        state3 &= 0xFFDF;
                        state3 &= 0xFFBF;
                        anim->state3 = state3;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;
                
                case 4:
                    state3 = anim->state3;
                    if ((state3 & 0x20) == 0) {
                        state3 |= 0x20;
                        state3 |= 0x40;
                        anim->state3 = state3;
                    }

                    state3 = anim->state3;
                    if (state3 & 0x40) {
                        state3 &= 0xFFDF;
                        state3 &= 0xFFBF;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    
                        // R6 = 0 ?
                        state3 |= 0x9;
                        anim->state3 = state3;

                        /* [SP] = animc */
                        animc = GetCoreAIStruct(anim);
                    
                        /* R8 = type */
                        type = GetSomeAISRelatedIndexMaybe(anim);
                        if (EkrCheckHitOrMiss(type)) {
                            if (animc) {
                                animc->state3 |= 0x9;

                                if (GetAISLayerId(anim) == 0) {
                                    StartBattleAnimHitEffectsDefault(animc, EkrCheckHitOrMiss(type));
                                }
                            }
                        }
                    }
                    break;
                
                case 5:
                    state3 = anim->state3;
                    if ((state3 & 0x20) == 0) {
                        state3 |= 0x20;
                        state3 |= 0x40;
                        anim->state3 = state3;
                    }

                    state3 = anim->state3;
                    if (state3 & 0x40) {
                        state3 &= 0xFFDF;
                        state3 &= 0xFFBF;
                        anim->pScrCurrent = anim->pScrCurrent + 1;

                        state3 |= 0x9;
                        anim->state3 = state3;

                        if (GetAISLayerId(anim) == 0) {
                            StartSpellAnimation(anim);

                            if (sub_08050FE4())
                                sub_08050FF0(0x2);
                        }
                    }
                    break;
                
                case 6:
                    animc = GetCoreAIStruct(anim);
                    if (animc) {
                        type = sub_08055010(animc);
                        if (type != -1) {
                            animc->state3 |= 0x2;
                        }
                    }
                    break;
                
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                    if (GetAISLayerId(anim) == 0) {
                        animc = GetCoreAIStruct(anim);
                        id1 = GetSomeAISRelatedIndexMaybe(anim);
                        if (EkrCheckHitOrMiss(id1) == 0) {
                            type = sub_080684B0(animc);
                            if (type != 2) {
                                if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAISSubjectId(anim)))
                                    NewEfxChillEffect(animc);
                                else
                                    NewEfxPierceCritical(animc);
                            }
                        }

                        if (animc) {
                            animc->state3 |= 0x9;
                            type = GetSomeAISRelatedIndexMaybe(anim);
                            StartBattleAnimHitEffectsDefault(animc, EkrCheckHitOrMiss(type));
                        }
                    }
                    break;
                
                case 13:
                    /* R8 = id1 */
                    id1 = GetSomeAnimIndex(anim);

                    /* [SP] = anim1 */
                    anim1 = gAnims[GetAISSubjectId(anim) * 2];
                    
                    /* R6 = anim2 */
                    anim1 = gAnims[GetAISSubjectId(anim) * 2 + 1];

                    // _08054078
                    switch (anim->currentRoundType) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 9:
                        if (id1 != -1) {
                            anim1->nextRoundId = anim1->nextRoundId + 1;
                            anim2->nextRoundId = anim2->nextRoundId + 1;

                            SwitchAISFrameDataFromBARoundType(anim1, id1);
                            SwitchAISFrameDataFromBARoundType(anim2, id1);

                            anim1->state3 |= 0x4;
                            anim2->state3 |= 0x4;

                            /* R8 = id1 */
                            id1 = gBanimScr_81DE208[gEkrDistanceType];

                            /* R4 = id2 */
                            id2 = gBanimRoundScripts[id1 * 4];

                            if (GetAISSubjectId(anim) == 0)
                                mode = gpBanimModesLeft[id2];
                            else
                                mode = gpBanimModesRight[id2];
                            
                            // _08054126
                            ptr = (const u32 *)(gBanimScrLeft + GetAISSubjectId(anim) * 0x2A00 + mode);
                            anim1->pImgSheet = (void *)ptr[1];
                            anim1->pSpriteData = (const void *)(anim1->pSpriteDataPool + ptr[2]);
                            anim2->pSpriteData = (const void *)(anim2->pSpriteDataPool + 0x57F0);

                            if (Unk_0203E088[GetAISSubjectId(anim1)] == 0) {
                                if (gpImgSheet[GetAISSubjectId(anim1)] != anim1->pImgSheet) {
                                    NewEkrChienCHR(anim1);
                                    gpImgSheet[GetAISSubjectId(anim1)] = anim->pImgSheet;
                                }
                            }

                            sub_080546F0(anim1);
                            sub_080546F0(anim2);
                            goto break_queue;
                        }
                        break;
                    
                    case 4:
                    case 5:
                        id1 = gBanimScr_81DE208[gEkrDistanceType];

                    case 6:
                    case 7:
                    case 8:
                        SwitchAISFrameDataFromBARoundType(anim1, id1);
                        SwitchAISFrameDataFromBARoundType(anim2, id1);

                        sub_080546F0(anim1);
                        sub_080546F0(anim2);
                        goto break_queue;
                        break;
                    }
                    break;
                } /* switch */

                // def_8054080
                anim->commandQueueSize = anim->commandQueueSize - 1;
            } /* while (anim->commandQueueSize != 0) */

break_queue:
            anim->state2 &= 0xE700;
        } /* if (state2 & 0x1000) */

        // _0805450A
        if (state2 & 0x2000) {
            if (GetAISLayerId(anim) == 0) {
                if (Unk_0203E088[GetAISSubjectId(anim)] == 0)
                    if (anim->state3 & 0x4000)
                        if (gpImgSheet[GetAISSubjectId(anim)] != anim->pImgSheet) {
                            RegisterAISSheetGraphics(anim);
                            gpImgSheet[GetAISSubjectId(anim)] = anim->pImgSheet;
                        }
            }

            anim->state2 &= 0xD700;
        }

        // _08054570
        if (0 == (state2 & 0x8000) && gEkrDebugUnk3 != 1)
            continue;
        
        state3 = anim->state3;
        if (state3 & 0x2) {
            /* R8 = id1 */
            id1 = GetSomeAnimIndex(anim);
            if (id1 != -1) {
                /* [SP] = anim1 */
                anim1 = gAnims[GetAISSubjectId(anim) * 2];
                SwitchAISFrameDataFromBARoundType(anim1, id1);
                state3 = anim1->state3 & 0xFFFD;
                anim1->state3 = state3 | 0x4;

                /* R6 = anim2 */
                anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];
                SwitchAISFrameDataFromBARoundType(anim2, id1);
                state3 = anim2->state3 & 0xFFFD;
                anim2->state3 = state3 | 0x4;

                anim1->nextRoundId = anim1->nextRoundId + 1;
                anim2->nextRoundId = anim2->nextRoundId + 1;

                sub_080546F0(anim1);
                sub_080546F0(anim2);
            } else {
                // _080545D4
                anim1 = gAnims[GetAISSubjectId(anim) * 2];
                anim1->state3 &= 0xFFFD;

                anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];
                anim2->state3 &= 0xFFFD;
            } /* if (id1 != -1) */
        } else {
            // _0805460C
            if (state3 & 0x8000) {
                id1 = GetSomeAnimIndex(anim);
                if (id1 != -1) {
                    /* [SP] = anim1 */
                anim1 = gAnims[GetAISSubjectId(anim) * 2];
                SwitchAISFrameDataFromBARoundType(anim1, id1);
                state3 = anim1->state3 & 0x7FFF;
                anim1->state3 = state3 | 0x4;

                /* R6 = anim2 */
                anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];
                SwitchAISFrameDataFromBARoundType(anim2, id1);
                state3 = anim2->state3 & 0x7FFF;
                anim2->state3 = state3 | 0x4;

                anim1->nextRoundId = anim1->nextRoundId + 1;
                anim2->nextRoundId = anim2->nextRoundId + 1;

                sub_080546F0(anim1);
                sub_080546F0(anim2);
                }
            } else {
                // _08054698
                if (GetAISLayerId(anim) == 0) {
                    id1 = GetBattleAnimRoundType(anim->nextRoundId * 2 + GetAISSubjectId(anim));
                    if (id1 == -1)
                        gBanimDoneFlag[GetAISSubjectId(anim)] == 1;
                }
            }
        } /* if (state3 & 0x2) */
    }
}
