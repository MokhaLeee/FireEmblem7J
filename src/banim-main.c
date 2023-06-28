#include "global.h"
#include "anime.h"
#include "ekrbattle.h"

// 0x08053C3C for FE7J
// https://decomp.me/scratch/zZx3j
#if NONMATCHING

void BattleAIS_ExecCommands(void)
{
    int i, state2, id1, id2, type;
    u16 state3;
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
                case 0:
                    break;

                case 1:
                    if (gEkrDebugUnk3 == 1)
                        anim->pScrCurrent = anim->pScrStart;
                    else if (anim->state3 & 0x4)
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    else if (anim->state3 & 0x8) {
                        if (sub_0804DD50() == 1) {
                            anim->state3 &= ~(0x1 | 0x4 | 0x8);
                            anim->pScrCurrent = anim->pScrCurrent + 1;

                            if (sub_08050FE4() != 0)
                                sub_08050FF0(0);
                        }
                    }
                    break;
                
                case 2:
                    state3 = anim->state3;
                    if (state3 & 0x01) {
                        state3 &= ~0x1;
                        anim->state3 = state3;
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
                        state3 &= ~0x20;
                        state3 &= ~0x40;
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
                        state3 &= ~0x20;
                        state3 &= ~0x40;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    
                        // R6 = 0 ?

                        state3 |= 0x9;
                        anim->state3 = state3;

                        /* [SP] = animc */
                        animc = GetCoreAIStruct(anim);
                    
                        /* R8 = type */
                        type = GetSomeAISRelatedIndexMaybe(anim);
                        if (EkrCheckHitOrMiss(type) == 1) {
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
                        state3 &= ~0x20;
                        state3 &= ~0x40;
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
                        } /* if (id1 != -1) */
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
                    } /* switch (anim->currentRoundType) */
                    break;
                
                case 19:
                    // _080541F0
                    state3 = anim->state3;
                    if ((state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                    } else if (Unk_02017758 == 1) {
                        Unk_02017758 = 0;
                        state3 &= ~0x20;
                        anim->state3 = state3;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break; /* case 19 */
                
                case 20:
                    // _08054220
                    if (GetAISLayerId(anim) == 0)
                        NewEfxQuake(3);
                    break;
                
                case 21:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxQuake(0);
                    break;
                
                case 24:
                    state3 = anim->state3;
                    if (state3 & 0x1) {
                        state3 &= ~0x1;
                        anim->state3 = state3;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                        anim->oam2Base = (0xF3FF & anim->oam2Base) | 0x400;
                        anim->drawLayerPriority = 0x8C;
                        AnimSort();
                    }
                    break;
                
                /* Maybe hit effect? */
                case 26:
                    if (GetAISLayerId(anim) == 0) {
                        animc = GetCoreAIStruct(anim);
                        if (animc) {
                            animc->state3 |= 0x9;
                            type = GetSomeAISRelatedIndexMaybe(anim);
                            StartBattleAnimHitEffectsDefault(animc, EkrCheckHitOrMiss(type));
                        }

                        if (sub_080684B0(animc) != 2) {
                            if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAISSubjectId(anim)))
                                    NewEfxChillEffect(animc);
                                else
                                    NewEfxNormalEffect(anim);
                        }
                    }
                    break;
                
                case 38:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxYushaSpinShield(anim, 0x0);
                    break;
                
                case 39:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxYushaSpinShield(anim, 0x1);
                    break;
                
                case 44:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxHurtmutEff00(anim);
                    break;
                
                case 45:
                    if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAISSubjectId(anim))) {
                        state3 = anim->state3;
                        if ((state3 & 0x20) == 0) {
                            state3 |= 0x20;
                            anim->state3 = state3;

                            if (GetAISLayerId(anim) == 0)
                                NewEfxChillAnime(anim, 0);
                        } else {
                            // _080544D6
                            if (state3 & 0x40) {
                                state3 &= ~0x20;
                                state3 &= ~0x40;
                                anim->state3 = state3;
                                anim->pScrCurrent = anim->pScrCurrent + 1;
                            }
                        }
                    } else {
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;
                
                case 46:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxMagfcast(anim, 0);
                    break;
                
                case 47:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxMagfcast(anim, 1);
                    break;
                
                case 48:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxSunakemuri(anim, 0);
                    break;
                
                case 49:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxSunakemuri(anim, 1);
                    break;
                
                case 50:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxSunakemuri(anim, 2);
                    break;
                
                case 57:
                    state3 = anim->state3;
                    if ((state3 & 0x20) == 0) {
                        state3 |= 0x20;
                        anim->state3 = state3;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxKingPika(anim);
                    } else {
                        // _080544D6
                        if (state3 & 0x40) {
                            state3 &= ~0x20;
                            state3 &= ~0x40;
                            anim->state3 = state3;
                            anim->pScrCurrent = anim->pScrCurrent + 1;
                        }
                    }
                    break;
                
                case 61:
                    state3 = anim->state3;
                    if ((state3 & 0x20) == 0) {
                        state3 |= 0x20;
                        anim->state3 = state3;
                        if (GetAISLayerId(anim) == 0)
                            sub_08050FF0(1);
                        
                        sub_08064458(anim);
                        NewEfxspdquake(anim);
                    }

                    state3 = anim->state3;
                    if (state3 & 0x40) {
                        state3 &= 0xFFDF;
                        state3 &= 0xFFBF;
                        anim->state3 = state3;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;
                
                case 71:
                    NewEfxMantBatabata(anim);
                    break;
                
                case 78:
                    NewEfxLokmsuna(anim);
                    break;
                
                case 25:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 40:
                case 41:
                case 42:
                case 43:
                case 51:
                case 52:
                case 53:
                case 54:
                case 55:
                case 56:
                case 58:
                case 59:
                case 60:
                case 62:
                case 63:
                case 64:
                case 65:
                case 66:
                case 67:
                case 68:
                case 69:
                case 70:
                case 72:
                case 73:
                case 74:
                case 75:
                case 76:
                case 77:
                case 79:
                    EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
                    break;

                case 80:
                    break;

                case 81:
                    state3 = anim->state3;
                    if ((state3 & 0x20) == 0) {
                        state3 |= 0x20;
                        anim->state3 = state3;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxFlashFX(anim);
                    } else {
                        // _080544D6
                        if (state3 & 0x40) {
                            state3 &= 0xFFDF;
                            state3 &= 0xFFBF;
                            anim->state3 = state3;
                            anim->pScrCurrent = anim->pScrCurrent + 1;
                        }
                    }
                    break;

                case 82:
                    if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAISSubjectId(anim))) {
                        state3 = anim->state3;
                        if ((state3 & 0x20) == 0) {
                            state3 |= 0x20;
                            anim->state3 = state3;
                            if (GetAISLayerId(anim) == 0)
                                NewEfxChillAnime(anim, 1);
                        } else {
                            // _080544D6
                            if (state3 & 0x40) {
                                state3 &= ~0x20;
                                state3 &= ~0x40;
                                anim->state3 = state3;
                                anim->pScrCurrent = anim->pScrCurrent + 1;
                            }
                        }
                    } else {
                        // _080544E8
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                default:
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
                state3 = anim1->state3 & (~0x2);
                anim1->state3 = state3 | 0x4;

                /* R6 = anim2 */
                anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];
                SwitchAISFrameDataFromBARoundType(anim2, id1);
                state3 = anim2->state3 & (~0x2);
                anim2->state3 = state3 | 0x4;

                anim1->nextRoundId = anim1->nextRoundId + 1;
                anim2->nextRoundId = anim2->nextRoundId + 1;

                sub_080546F0(anim1);
                sub_080546F0(anim2);
            } else {
                // _080545D4
                anim1 = gAnims[GetAISSubjectId(anim) * 2];
                anim1->state3 &= (~0x2);

                anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];
                anim2->state3 &= (~0x2);
            } /* if (id1 != -1) */
        } else {
            // _0805460C
            if (state3 & 0x8000) {
                id1 = GetSomeAnimIndex(anim);
                if (id1 != -1) {
                    /* [SP] = anim1 */
                anim1 = gAnims[GetAISSubjectId(anim) * 2];
                SwitchAISFrameDataFromBARoundType(anim1, id1);
                state3 = anim1->state3 & (~0x8000);
                anim1->state3 = state3 | 0x4;

                /* R6 = anim2 */
                anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];
                SwitchAISFrameDataFromBARoundType(anim2, id1);
                state3 = anim2->state3 & (~0x8000);
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
                        *(gBanimDoneFlag + GetAISSubjectId(anim)) == 1;
                }
            }
        } /* if (state3 & 0x2) */
    }
}

#else

__attribute__((naked))
void BattleAIS_ExecCommands(void)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sb\n\
    mov r6, r8\n\
    push {r6, r7}\n\
    sub sp, #4\n\
    movs r2, #0\n\
_08053C48:\n\
    ldr r0, _08053CA8 @ =Unk_03004750\n\
    str r2, [r0]\n\
    ldr r1, _08053CAC @ =gAnims\n\
    lsls r0, r2, #2\n\
    adds r0, r0, r1\n\
    ldr r7, [r0]\n\
    adds r2, #1\n\
    mov sb, r2\n\
    cmp r7, #0\n\
    bne _08053C60\n\
    bl _080546D2\n\
_08053C60:\n\
    movs r0, #0xf0\n\
    lsls r0, r0, #8\n\
    ldrh r1, [r7, #0xc]\n\
    ands r1, r0\n\
    mov r8, r1\n\
    cmp r1, #0\n\
    bne _08053C72\n\
    bl _080546D2\n\
_08053C72:\n\
    movs r0, #0x80\n\
    lsls r0, r0, #5\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08053C80\n\
    bl _0805450A\n\
_08053C80:\n\
    ldrb r0, [r7, #0x14]\n\
    cmp r0, #0\n\
    bne _08053C8A\n\
    bl _08054500\n\
_08053C8A:\n\
    subs r1, r0, #1\n\
    adds r2, r7, #0\n\
    adds r2, #0x15\n\
    adds r1, r2, r1\n\
    ldrb r1, [r1]\n\
    adds r3, r0, #0\n\
    cmp r1, #0x52\n\
    bls _08053C9E\n\
    bl _080544EE\n\
_08053C9E:\n\
    lsls r0, r1, #2\n\
    ldr r1, _08053CB0 @ =_08053CB4\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08053CA8: .4byte Unk_03004750\n\
_08053CAC: .4byte gAnims\n\
_08053CB0: .4byte _08053CB4\n\
_08053CB4: @ jump table\n\
    .4byte _080544EE @ case 0\n\
    .4byte _08053E00 @ case 1\n\
    .4byte _08053E54 @ case 2\n\
    .4byte _08053E68 @ case 3\n\
    .4byte _08053E8E @ case 4\n\
    .4byte _08053F14 @ case 5\n\
    .4byte _08053F78 @ case 6\n\
    .4byte _080544EE @ case 7\n\
    .4byte _08053FA8 @ case 8\n\
    .4byte _08053FA8 @ case 9\n\
    .4byte _08053FA8 @ case 10\n\
    .4byte _08053FA8 @ case 11\n\
    .4byte _08053FA8 @ case 12\n\
    .4byte _08054042 @ case 13\n\
    .4byte _080544EE @ case 14\n\
    .4byte _080544EE @ case 15\n\
    .4byte _080544EE @ case 16\n\
    .4byte _080544EE @ case 17\n\
    .4byte _080544EE @ case 18\n\
    .4byte _080541F0 @ case 19\n\
    .4byte _08054220 @ case 20\n\
    .4byte _08054234 @ case 21\n\
    .4byte _080544EE @ case 22\n\
    .4byte _080544EE @ case 23\n\
    .4byte _08054248 @ case 24\n\
    .4byte _08054460 @ case 25\n\
    .4byte _08054284 @ case 26\n\
    .4byte _08054460 @ case 27\n\
    .4byte _08054460 @ case 28\n\
    .4byte _08054460 @ case 29\n\
    .4byte _08054460 @ case 30\n\
    .4byte _08054460 @ case 31\n\
    .4byte _08054460 @ case 32\n\
    .4byte _08054460 @ case 33\n\
    .4byte _08054460 @ case 34\n\
    .4byte _08054460 @ case 35\n\
    .4byte _08054460 @ case 36\n\
    .4byte _08054460 @ case 37\n\
    .4byte _08054304 @ case 38\n\
    .4byte _0805431A @ case 39\n\
    .4byte _08054460 @ case 40\n\
    .4byte _08054460 @ case 41\n\
    .4byte _08054460 @ case 42\n\
    .4byte _08054460 @ case 43\n\
    .4byte _08054330 @ case 44\n\
    .4byte _08054344 @ case 45\n\
    .4byte _0805438E @ case 46\n\
    .4byte _080543A4 @ case 47\n\
    .4byte _080543BA @ case 48\n\
    .4byte _080543D0 @ case 49\n\
    .4byte _080543E6 @ case 50\n\
    .4byte _08054460 @ case 51\n\
    .4byte _08054460 @ case 52\n\
    .4byte _08054460 @ case 53\n\
    .4byte _08054460 @ case 54\n\
    .4byte _08054460 @ case 55\n\
    .4byte _08054460 @ case 56\n\
    .4byte _080543FA @ case 57\n\
    .4byte _08054460 @ case 58\n\
    .4byte _08054460 @ case 59\n\
    .4byte _08054460 @ case 60\n\
    .4byte _0805441E @ case 61\n\
    .4byte _08054460 @ case 62\n\
    .4byte _08054460 @ case 63\n\
    .4byte _08054460 @ case 64\n\
    .4byte _08054460 @ case 65\n\
    .4byte _08054460 @ case 66\n\
    .4byte _08054460 @ case 67\n\
    .4byte _08054460 @ case 68\n\
    .4byte _08054460 @ case 69\n\
    .4byte _08054460 @ case 70\n\
    .4byte _08054450 @ case 71\n\
    .4byte _08054460 @ case 72\n\
    .4byte _08054460 @ case 73\n\
    .4byte _08054460 @ case 74\n\
    .4byte _08054460 @ case 75\n\
    .4byte _08054460 @ case 76\n\
    .4byte _08054460 @ case 77\n\
    .4byte _08054458 @ case 78\n\
    .4byte _08054460 @ case 79\n\
    .4byte _080544EE @ case 80\n\
    .4byte _0805446E @ case 81\n\
    .4byte _08054492 @ case 82\n\
_08053E00:\n\
    ldr r0, _08053E0C @ =gEkrDebugUnk3\n\
    ldr r0, [r0]\n\
    cmp r0, #1\n\
    bne _08053E10\n\
    ldr r0, [r7, #0x24]\n\
    b _080544EC\n\
    .align 2, 0\n\
_08053E0C: .4byte gEkrDebugUnk3\n\
_08053E10:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r0, #4\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08053E1C\n\
    b _080544E8\n\
_08053E1C:\n\
    movs r0, #8\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08053E26\n\
    b _080544EE\n\
_08053E26:\n\
    bl sub_0804DD50\n\
    cmp r0, #1\n\
    beq _08053E30\n\
    b _080544EE\n\
_08053E30:\n\
    ldr r0, _08053E50 @ =0x0000FFF2\n\
    ldrh r2, [r7, #0x10]\n\
    ands r0, r2\n\
    strh r0, [r7, #0x10]\n\
    ldr r0, [r7, #0x20]\n\
    adds r0, #4\n\
    str r0, [r7, #0x20]\n\
    bl sub_08050FE4\n\
    cmp r0, #0\n\
    bne _08053E48\n\
    b _080544EE\n\
_08053E48:\n\
    movs r0, #0\n\
    bl sub_08050FF0\n\
    b _080544EE\n\
    .align 2, 0\n\
_08053E50: .4byte 0x0000FFF2\n\
_08053E54:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r0, #1\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08053E60\n\
    b _080544EE\n\
_08053E60:\n\
    ldr r0, _08053E64 @ =0x0000FFFE\n\
    b _080544E4\n\
    .align 2, 0\n\
_08053E64: .4byte 0x0000FFFE\n\
_08053E68:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08053E8A\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _08053E8A\n\
    adds r0, r7, #0\n\
    bl NewEfxSpecalEffect\n\
_08053E8A:\n\
    ldrh r1, [r7, #0x10]\n\
    b _080544D6\n\
_08053E8E:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08053EA4\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    movs r1, #0x40\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
_08053EA4:\n\
    ldrh r2, [r7, #0x10]\n\
    movs r0, #0x40\n\
    ands r0, r2\n\
    cmp r0, #0\n\
    bne _08053EB0\n\
    b _080544EE\n\
_08053EB0:\n\
    ldr r1, _08053F0C @ =0x0000FFDF\n\
    ands r1, r2\n\
    ldr r0, _08053F10 @ =0x0000FFBF\n\
    ands r1, r0\n\
    ldr r0, [r7, #0x20]\n\
    adds r0, #4\n\
    str r0, [r7, #0x20]\n\
    movs r5, #9\n\
    movs r6, #0\n\
    orrs r1, r5\n\
    strh r1, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetCoreAIStruct\n\
    adds r2, r0, #0\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetSomeAISRelatedIndexMaybe\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    mov r4, r8\n\
    adds r0, r4, #0\n\
    bl EkrCheckHitOrMiss\n\
    ldr r2, [sp]\n\
    cmp r0, #1\n\
    beq _08053EEC\n\
    b _080544EE\n\
_08053EEC:\n\
    cmp r2, #0\n\
    bne _08053EF2\n\
    b _080544EE\n\
_08053EF2:\n\
    ldrh r0, [r2, #0x10]\n\
    orrs r0, r5\n\
    strh r0, [r2, #0x10]\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08053F06\n\
    b _080544EE\n\
_08053F06:\n\
    adds r0, r4, #0\n\
    b _08054032\n\
    .align 2, 0\n\
_08053F0C: .4byte 0x0000FFDF\n\
_08053F10: .4byte 0x0000FFBF\n\
_08053F14:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08053F2A\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    movs r1, #0x40\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
_08053F2A:\n\
    ldrh r2, [r7, #0x10]\n\
    movs r0, #0x40\n\
    ands r0, r2\n\
    cmp r0, #0\n\
    bne _08053F36\n\
    b _080544EE\n\
_08053F36:\n\
    ldr r1, _08053F70 @ =0x0000FFDF\n\
    ands r1, r2\n\
    ldr r0, _08053F74 @ =0x0000FFBF\n\
    ands r1, r0\n\
    ldr r0, [r7, #0x20]\n\
    adds r0, #4\n\
    str r0, [r7, #0x20]\n\
    movs r0, #9\n\
    orrs r1, r0\n\
    strh r1, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08053F56\n\
    b _080544EE\n\
_08053F56:\n\
    adds r0, r7, #0\n\
    bl StartSpellAnimation\n\
    bl sub_08050FE4\n\
    cmp r0, #0\n\
    bne _08053F66\n\
    b _080544EE\n\
_08053F66:\n\
    movs r0, #2\n\
    bl sub_08050FF0\n\
    b _080544EE\n\
    .align 2, 0\n\
_08053F70: .4byte 0x0000FFDF\n\
_08053F74: .4byte 0x0000FFBF\n\
_08053F78:\n\
    adds r0, r7, #0\n\
    bl GetCoreAIStruct\n\
    adds r2, r0, #0\n\
    cmp r2, #0\n\
    bne _08053F86\n\
    b _080544EE\n\
_08053F86:\n\
    str r2, [sp]\n\
    bl sub_08055010\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    movs r0, #1\n\
    rsbs r0, r0, #0\n\
    ldr r2, [sp]\n\
    cmp r8, r0\n\
    bne _08053F9E\n\
    b _080544EE\n\
_08053F9E:\n\
    movs r0, #2\n\
    ldrh r3, [r2, #0x10]\n\
    orrs r0, r3\n\
    strh r0, [r2, #0x10]\n\
    b _080544EE\n\
_08053FA8:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08053FB4\n\
    b _080544EE\n\
_08053FB4:\n\
    adds r0, r7, #0\n\
    bl GetCoreAIStruct\n\
    adds r2, r0, #0\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetSomeAISRelatedIndexMaybe\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    bl EkrCheckHitOrMiss\n\
    ldr r2, [sp]\n\
    cmp r0, #0\n\
    bne _08054016\n\
    adds r0, r2, #0\n\
    bl sub_080684B0\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    ldr r2, [sp]\n\
    cmp r0, #2\n\
    beq _08054016\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    adds r1, r0, #0\n\
    ldrh r0, [r7, #0xe]\n\
    subs r0, #1\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r1\n\
    bl GetBattleAnimRoundTypeFlags\n\
    movs r1, #0x80\n\
    lsls r1, r1, #5\n\
    ands r1, r0\n\
    ldr r2, [sp]\n\
    cmp r1, #0\n\
    beq _0805400C\n\
    adds r0, r2, #0\n\
    bl NewEfxChillEffect\n\
    b _08054014\n\
_0805400C:\n\
    adds r0, r2, #0\n\
    str r2, [sp]\n\
    bl NewEfxPierceCritical\n\
_08054014:\n\
    ldr r2, [sp]\n\
_08054016:\n\
    cmp r2, #0\n\
    bne _0805401C\n\
    b _080544EE\n\
_0805401C:\n\
    movs r0, #9\n\
    ldrh r1, [r2, #0x10]\n\
    orrs r0, r1\n\
    strh r0, [r2, #0x10]\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetSomeAISRelatedIndexMaybe\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
_08054032:\n\
    bl EkrCheckHitOrMiss\n\
    adds r1, r0, #0\n\
    ldr r2, [sp]\n\
    adds r0, r2, #0\n\
    bl StartBattleAnimHitEffectsDefault\n\
    b _080544EE\n\
_08054042:\n\
    adds r0, r7, #0\n\
    bl GetSomeAnimIndex\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    ldr r4, _08054084 @ =gAnims\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #3\n\
    adds r0, r0, r4\n\
    ldr r2, [r0]\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #1\n\
    adds r0, #1\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r4\n\
    ldr r6, [r0]\n\
    ldrb r0, [r7, #0x12]\n\
    ldr r2, [sp]\n\
    cmp r0, #9\n\
    bls _08054078\n\
    b _080544EE\n\
_08054078:\n\
    lsls r0, r0, #2\n\
    ldr r1, _08054088 @ =_0805408C\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08054084: .4byte gAnims\n\
_08054088: .4byte _0805408C\n\
_0805408C: @ jump table\n\
    .4byte _080540B4 @ case 0\n\
    .4byte _080540B4 @ case 1\n\
    .4byte _080540B4 @ case 2\n\
    .4byte _080540B4 @ case 3\n\
    .4byte _080541B8 @ case 4\n\
    .4byte _080541B8 @ case 5\n\
    .4byte _080541C6 @ case 6\n\
    .4byte _080541C6 @ case 7\n\
    .4byte _080541C6 @ case 8\n\
    .4byte _080540B4 @ case 9\n\
_080540B4:\n\
    movs r0, #1\n\
    rsbs r0, r0, #0\n\
    cmp r8, r0\n\
    bne _080540BE\n\
    b _080541B8\n\
_080540BE:\n\
    ldrh r0, [r2, #0xe]\n\
    adds r0, #1\n\
    strh r0, [r2, #0xe]\n\
    ldrh r0, [r6, #0xe]\n\
    adds r0, #1\n\
    strh r0, [r6, #0xe]\n\
    adds r0, r2, #0\n\
    mov r1, r8\n\
    str r2, [sp]\n\
    bl SwitchAISFrameDataFromBARoundType\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    bl SwitchAISFrameDataFromBARoundType\n\
    movs r1, #4\n\
    ldr r2, [sp]\n\
    ldrh r0, [r2, #0x10]\n\
    orrs r0, r1\n\
    strh r0, [r2, #0x10]\n\
    ldrh r0, [r6, #0x10]\n\
    orrs r0, r1\n\
    strh r0, [r6, #0x10]\n\
    ldr r1, _08054114 @ =gBanimScr_81DE208\n\
    ldr r0, _08054118 @ =gEkrDistanceType\n\
    movs r3, #0\n\
    ldrsh r0, [r0, r3]\n\
    adds r0, r0, r1\n\
    ldrb r0, [r0]\n\
    mov r8, r0\n\
    ldr r1, _0805411C @ =gBanimRoundScripts\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r1\n\
    ldrb r4, [r0]\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetAISSubjectId\n\
    ldr r2, [sp]\n\
    cmp r0, #0\n\
    bne _08054124\n\
    ldr r0, _08054120 @ =gpBanimModesLeft\n\
    b _08054126\n\
    .align 2, 0\n\
_08054114: .4byte gBanimScr_81DE208\n\
_08054118: .4byte gEkrDistanceType\n\
_0805411C: .4byte gBanimRoundScripts\n\
_08054120: .4byte gpBanimModesLeft\n\
_08054124:\n\
    ldr r0, _080541A4 @ =gpBanimModesRight\n\
_08054126:\n\
    ldr r1, [r0]\n\
    lsls r0, r4, #2\n\
    adds r0, r0, r1\n\
    ldr r4, [r0]\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetAISSubjectId\n\
    lsls r1, r0, #2\n\
    adds r1, r1, r0\n\
    lsls r1, r1, #2\n\
    adds r1, r1, r0\n\
    lsls r1, r1, #9\n\
    ldr r0, _080541A8 @ =gBanimScrLeft\n\
    adds r1, r1, r0\n\
    adds r1, r4, r1\n\
\n\
    ldr r0, [r1, #4]\n\
    ldr r2, [sp]\n\
    str r0, [r2, #0x28]\n\
\n\
    ldr r4, [r2, #0x30]\n\
    ldr r1, [r1, #8]\n\
    adds r4, r4, r1\n\
    str r4, [r2, #0x3c]\n\
\n\
    ldr r4, [r6, #0x30]\n\
    ldr r0, _080541AC @ =0x000057F0\n\
    adds r4, r4, r0\n\
    str r4, [r6, #0x3c]\n\
\n\
    ldr r4, _080541B0 @ =Unk_0203E088\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r4\n\
    ldr r0, [r0]\n\
    ldr r2, [sp]\n\
    cmp r0, #0\n\
    bne _080541DA\n\
    ldr r4, _080541B4 @ =gpImgSheet\n\
    adds r0, r2, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r4\n\
    ldr r1, [r0]\n\
    ldr r2, [sp]\n\
    ldr r0, [r2, #0x28]\n\
    cmp r1, r0\n\
    beq _080541DA\n\
    adds r0, r2, #0\n\
    bl NewEkrChienCHR\n\
    ldr r2, [sp]\n\
    adds r0, r2, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r4\n\
    ldr r2, [sp]\n\
    ldr r1, [r2, #0x28]\n\
    str r1, [r0]\n\
    b _080541DA\n\
    .align 2, 0\n\
_080541A4: .4byte gpBanimModesRight\n\
_080541A8: .4byte gBanimScrLeft\n\
_080541AC: .4byte 0x000057F0\n\
_080541B0: .4byte Unk_0203E088\n\
_080541B4: .4byte gpImgSheet\n\
_080541B8:\n\
    ldr r1, _080541E8 @ =gBanimScr_81DE208\n\
    ldr r0, _080541EC @ =gEkrDistanceType\n\
    movs r3, #0\n\
    ldrsh r0, [r0, r3]\n\
    adds r0, r0, r1\n\
    ldrb r0, [r0]\n\
    mov r8, r0\n\
_080541C6:\n\
    adds r0, r2, #0\n\
    mov r1, r8\n\
    str r2, [sp]\n\
    bl SwitchAISFrameDataFromBARoundType\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    bl SwitchAISFrameDataFromBARoundType\n\
    ldr r2, [sp]\n\
_080541DA:\n\
    adds r0, r2, #0\n\
    bl sub_080546F0\n\
    adds r0, r6, #0\n\
    bl sub_080546F0\n\
    b _08054500\n\
    .align 2, 0\n\
_080541E8: .4byte gBanimScr_81DE208\n\
_080541EC: .4byte gEkrDistanceType\n\
_080541F0:\n\
    ldrh r2, [r7, #0x10]\n\
    movs r1, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r2\n\
    cmp r0, #0\n\
    bne _08054204\n\
    adds r0, r1, #0\n\
    orrs r0, r2\n\
    strh r0, [r7, #0x10]\n\
    b _080544EE\n\
_08054204:\n\
    ldr r1, _08054218 @ =Unk_02017758\n\
    ldr r0, [r1]\n\
    cmp r0, #1\n\
    beq _0805420E\n\
    b _080544EE\n\
_0805420E:\n\
    movs r0, #0\n\
    str r0, [r1]\n\
    ldr r0, _0805421C @ =0x0000FFDF\n\
    ands r0, r2\n\
    b _080544E6\n\
    .align 2, 0\n\
_08054218: .4byte Unk_02017758\n\
_0805421C: .4byte 0x0000FFDF\n\
_08054220:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _0805422C\n\
    b _080544EE\n\
_0805422C:\n\
    movs r0, #3\n\
    bl NewEfxQuake\n\
    b _080544EE\n\
_08054234:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08054240\n\
    b _080544EE\n\
_08054240:\n\
    movs r0, #0\n\
    bl NewEfxQuake\n\
    b _080544EE\n\
_08054248:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r0, #1\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _08054254\n\
    b _080544EE\n\
_08054254:\n\
    ldr r0, _0805427C @ =0x0000FFFE\n\
    ands r0, r1\n\
    strh r0, [r7, #0x10]\n\
    ldr r0, [r7, #0x20]\n\
    adds r0, #4\n\
    str r0, [r7, #0x20]\n\
    ldr r0, _08054280 @ =0x0000F3FF\n\
    ldrh r1, [r7, #8]\n\
    ands r0, r1\n\
    movs r2, #0x80\n\
    lsls r2, r2, #3\n\
    adds r1, r2, #0\n\
    orrs r0, r1\n\
    strh r0, [r7, #8]\n\
    movs r0, #0x8c\n\
    strh r0, [r7, #0xa]\n\
    bl AnimSort\n\
    b _080544EE\n\
    .align 2, 0\n\
_0805427C: .4byte 0x0000FFFE\n\
_08054280: .4byte 0x0000F3FF\n\
_08054284:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08054290\n\
    b _080544EE\n\
_08054290:\n\
    adds r0, r7, #0\n\
    bl GetCoreAIStruct\n\
    adds r2, r0, #0\n\
    cmp r2, #0\n\
    beq _080542C2\n\
    movs r0, #9\n\
    ldrh r3, [r2, #0x10]\n\
    orrs r0, r3\n\
    strh r0, [r2, #0x10]\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetSomeAISRelatedIndexMaybe\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    bl EkrCheckHitOrMiss\n\
    adds r1, r0, #0\n\
    ldr r2, [sp]\n\
    adds r0, r2, #0\n\
    bl StartBattleAnimHitEffectsDefault\n\
    ldr r2, [sp]\n\
_080542C2:\n\
    adds r0, r2, #0\n\
    str r2, [sp]\n\
    bl sub_080684B0\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    cmp r0, #2\n\
    bne _080542D4\n\
    b _080544EE\n\
_080542D4:\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    adds r1, r0, #0\n\
    ldrh r0, [r7, #0xe]\n\
    subs r0, #1\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r1\n\
    bl GetBattleAnimRoundTypeFlags\n\
    movs r1, #0x80\n\
    lsls r1, r1, #5\n\
    ands r1, r0\n\
    ldr r2, [sp]\n\
    cmp r1, #0\n\
    beq _080542FC\n\
    adds r0, r2, #0\n\
    bl NewEfxChillEffect\n\
    b _080544EE\n\
_080542FC:\n\
    adds r0, r7, #0\n\
    bl NewEfxNormalEffect\n\
    b _080544EE\n\
_08054304:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08054310\n\
    b _080544EE\n\
_08054310:\n\
    adds r0, r7, #0\n\
    movs r1, #0\n\
    bl NewEfxYushaSpinShield\n\
    b _080544EE\n\
_0805431A:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08054326\n\
    b _080544EE\n\
_08054326:\n\
    adds r0, r7, #0\n\
    movs r1, #1\n\
    bl NewEfxYushaSpinShield\n\
    b _080544EE\n\
_08054330:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _0805433C\n\
    b _080544EE\n\
_0805433C:\n\
    adds r0, r7, #0\n\
    bl NewEfxHurtmutEff00\n\
    b _080544EE\n\
_08054344:\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    adds r1, r0, #0\n\
    ldrh r0, [r7, #0xe]\n\
    subs r0, #1\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r1\n\
    bl GetBattleAnimRoundTypeFlags\n\
    movs r1, #0x80\n\
    lsls r1, r1, #5\n\
    ands r1, r0\n\
    cmp r1, #0\n\
    bne _08054364\n\
    b _080544E8\n\
_08054364:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _08054372\n\
    b _080544D6\n\
_08054372:\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _08054384\n\
    b _080544EE\n\
_08054384:\n\
    adds r0, r7, #0\n\
    movs r1, #0\n\
    bl NewEfxChillAnime\n\
    b _080544EE\n\
_0805438E:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _0805439A\n\
    b _080544EE\n\
_0805439A:\n\
    adds r0, r7, #0\n\
    movs r1, #0\n\
    bl NewEfxMagfcast\n\
    b _080544EE\n\
_080543A4:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _080543B0\n\
    b _080544EE\n\
_080543B0:\n\
    adds r0, r7, #0\n\
    movs r1, #1\n\
    bl NewEfxMagfcast\n\
    b _080544EE\n\
_080543BA:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _080543C6\n\
    b _080544EE\n\
_080543C6:\n\
    adds r0, r7, #0\n\
    movs r1, #0\n\
    bl NewEfxSunakemuri\n\
    b _080544EE\n\
_080543D0:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    beq _080543DC\n\
    b _080544EE\n\
_080543DC:\n\
    adds r0, r7, #0\n\
    movs r1, #1\n\
    bl NewEfxSunakemuri\n\
    b _080544EE\n\
_080543E6:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _080544EE\n\
    adds r0, r7, #0\n\
    movs r1, #2\n\
    bl NewEfxSunakemuri\n\
    b _080544EE\n\
_080543FA:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _080544D6\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _080544EE\n\
    adds r0, r7, #0\n\
    bl NewEfxKingPika\n\
    b _080544EE\n\
_0805441E:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _0805442C\n\
    b _08053E8A\n\
_0805442C:\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _08054442\n\
    movs r0, #1\n\
    bl sub_08050FF0\n\
_08054442:\n\
    adds r0, r7, #0\n\
    bl sub_08064458\n\
    adds r0, r7, #0\n\
    bl NewEfxspdquake\n\
    b _08053E8A\n\
_08054450:\n\
    adds r0, r7, #0\n\
    bl NewEfxMantBatabata\n\
    b _080544EE\n\
_08054458:\n\
    adds r0, r7, #0\n\
    bl NewEfxLokmsuna\n\
    b _080544EE\n\
_08054460:\n\
    subs r0, r3, #1\n\
    adds r0, r2, r0\n\
    ldrb r1, [r0]\n\
    adds r0, r7, #0\n\
    bl EfxPlaySEwithCmdCtrl\n\
    b _080544EE\n\
_0805446E:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _080544D6\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _080544EE\n\
    adds r0, r7, #0\n\
    bl NewEfxFlashFX\n\
    b _080544EE\n\
_08054492:\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    adds r1, r0, #0\n\
    ldrh r0, [r7, #0xe]\n\
    subs r0, #1\n\
    lsls r0, r0, #1\n\
    adds r0, r0, r1\n\
    bl GetBattleAnimRoundTypeFlags\n\
    movs r1, #0x80\n\
    lsls r1, r1, #5\n\
    ands r1, r0\n\
    cmp r1, #0\n\
    beq _080544E8\n\
    ldrh r1, [r7, #0x10]\n\
    movs r2, #0x20\n\
    movs r0, #0x20\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    bne _080544D6\n\
    adds r0, r2, #0\n\
    orrs r0, r1\n\
    strh r0, [r7, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _080544EE\n\
    adds r0, r7, #0\n\
    movs r1, #1\n\
    bl NewEfxChillAnime\n\
    b _080544EE\n\
_080544D6:\n\
    movs r0, #0x40\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _080544EE\n\
    ldr r0, _080544F8 @ =0x0000FFDF\n\
    ands r0, r1\n\
    ldr r1, _080544FC @ =0x0000FFBF\n\
_080544E4:\n\
    ands r0, r1\n\
_080544E6:\n\
    strh r0, [r7, #0x10]\n\
_080544E8:\n\
    ldr r0, [r7, #0x20]\n\
    adds r0, #4\n\
_080544EC:\n\
    str r0, [r7, #0x20]\n\
_080544EE:\n\
    ldrb r0, [r7, #0x14]\n\
    subs r0, #1\n\
    strb r0, [r7, #0x14]\n\
    bl _08053C80\n\
    .align 2, 0\n\
_080544F8: .4byte 0x0000FFDF\n\
_080544FC: .4byte 0x0000FFBF\n\
_08054500:\n\
    movs r0, #0xe7\n\
    lsls r0, r0, #8\n\
    ldrh r1, [r7, #0xc]\n\
    ands r0, r1\n\
    strh r0, [r7, #0xc]\n\
_0805450A:\n\
    movs r0, #0x80\n\
    lsls r0, r0, #6\n\
    mov r2, r8\n\
    ands r0, r2\n\
    cmp r0, #0\n\
    beq _08054570\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _08054566\n\
    ldr r4, _080545C0 @ =Unk_0203E088\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r4\n\
    ldr r0, [r0]\n\
    cmp r0, #0\n\
    bne _08054566\n\
    movs r0, #0x80\n\
    lsls r0, r0, #7\n\
    ldrh r3, [r7, #0x10]\n\
    ands r0, r3\n\
    cmp r0, #0\n\
    bne _08054566\n\
    ldr r4, _080545C4 @ =gpImgSheet\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r4\n\
    ldr r1, [r0]\n\
    ldr r0, [r7, #0x28]\n\
    cmp r1, r0\n\
    beq _08054566\n\
    adds r0, r7, #0\n\
    bl RegisterAISSheetGraphics\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r4\n\
    ldr r1, [r7, #0x28]\n\
    str r1, [r0]\n\
_08054566:\n\
    movs r0, #0xd7\n\
    lsls r0, r0, #8\n\
    ldrh r1, [r7, #0xc]\n\
    ands r0, r1\n\
    strh r0, [r7, #0xc]\n\
_08054570:\n\
    movs r0, #0x80\n\
    lsls r0, r0, #7\n\
    mov r2, r8\n\
    ands r2, r0\n\
    cmp r2, #0\n\
    bne _08054586\n\
    ldr r0, _080545C8 @ =gEkrDebugUnk3\n\
    ldr r0, [r0]\n\
    cmp r0, #1\n\
    beq _08054586\n\
    b _080546D2\n\
_08054586:\n\
    ldrh r1, [r7, #0x10]\n\
    movs r0, #2\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _0805460C\n\
    adds r0, r7, #0\n\
    bl GetSomeAnimIndex\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    movs r0, #1\n\
    rsbs r0, r0, #0\n\
    cmp r8, r0\n\
    beq _080545D4\n\
    ldr r6, _080545CC @ =gAnims\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #3\n\
    adds r0, r0, r6\n\
    ldr r2, [r0]\n\
    adds r0, r2, #0\n\
    mov r1, r8\n\
    str r2, [sp]\n\
    bl SwitchAISFrameDataFromBARoundType\n\
    ldr r4, _080545D0 @ =0x0000FFFD\n\
    b _08054644\n\
    .align 2, 0\n\
_080545C0: .4byte Unk_0203E088\n\
_080545C4: .4byte gpImgSheet\n\
_080545C8: .4byte gEkrDebugUnk3\n\
_080545CC: .4byte gAnims\n\
_080545D0: .4byte 0x0000FFFD\n\
_080545D4:\n\
    ldr r5, _08054604 @ =gAnims\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #3\n\
    adds r0, r0, r5\n\
    ldr r2, [r0]\n\
    ldr r4, _08054608 @ =0x0000FFFD\n\
    adds r0, r4, #0\n\
    ldrh r1, [r2, #0x10]\n\
    ands r0, r1\n\
    strh r0, [r2, #0x10]\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #1\n\
    adds r0, #1\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r5\n\
    ldr r6, [r0]\n\
    ldrh r2, [r6, #0x10]\n\
    ands r4, r2\n\
    strh r4, [r6, #0x10]\n\
    b _080546D2\n\
    .align 2, 0\n\
_08054604: .4byte gAnims\n\
_08054608: .4byte 0x0000FFFD\n\
_0805460C:\n\
    movs r0, #0x80\n\
    lsls r0, r0, #8\n\
    ands r0, r1\n\
    cmp r0, #0\n\
    beq _08054698\n\
    adds r0, r7, #0\n\
    bl GetSomeAnimIndex\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    movs r0, #1\n\
    rsbs r0, r0, #0\n\
    cmp r8, r0\n\
    beq _080546D2\n\
    ldr r6, _08054690 @ =gAnims\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #3\n\
    adds r0, r0, r6\n\
    ldr r2, [r0]\n\
    adds r0, r2, #0\n\
    mov r1, r8\n\
    str r2, [sp]\n\
    bl SwitchAISFrameDataFromBARoundType\n\
    ldr r4, _08054694 @ =0x00007FFF\n\
_08054644:\n\
    adds r0, r4, #0\n\
    ldr r2, [sp]\n\
    ldrh r3, [r2, #0x10]\n\
    ands r0, r3\n\
    movs r5, #4\n\
    orrs r0, r5\n\
    strh r0, [r2, #0x10]\n\
    adds r0, r7, #0\n\
    str r2, [sp]\n\
    bl GetAISSubjectId\n\
    lsls r0, r0, #1\n\
    adds r0, #1\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r6\n\
    ldr r6, [r0]\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    bl SwitchAISFrameDataFromBARoundType\n\
    ldrh r0, [r6, #0x10]\n\
    ands r4, r0\n\
    orrs r4, r5\n\
    strh r4, [r6, #0x10]\n\
    ldr r2, [sp]\n\
    ldrh r0, [r2, #0xe]\n\
    adds r0, #1\n\
    strh r0, [r2, #0xe]\n\
    ldrh r0, [r6, #0xe]\n\
    adds r0, #1\n\
    strh r0, [r6, #0xe]\n\
    adds r0, r2, #0\n\
    bl sub_080546F0\n\
    adds r0, r6, #0\n\
    bl sub_080546F0\n\
    b _080546D2\n\
    .align 2, 0\n\
_08054690: .4byte gAnims\n\
_08054694: .4byte 0x00007FFF\n\
_08054698:\n\
    adds r0, r7, #0\n\
    bl GetAISLayerId\n\
    cmp r0, #0\n\
    bne _080546D2\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    adds r1, r0, #0\n\
    ldrh r2, [r7, #0xe]\n\
    lsls r0, r2, #1\n\
    adds r0, r0, r1\n\
    bl GetBattleAnimRoundType\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    movs r0, #1\n\
    rsbs r0, r0, #0\n\
    cmp r8, r0\n\
    bne _080546D2\n\
    adds r0, r7, #0\n\
    bl GetAISSubjectId\n\
    ldr r1, _080546EC @ =gBanimDoneFlag\n\
    lsls r0, r0, #2\n\
    adds r0, r0, r1\n\
    movs r1, #1\n\
    str r1, [r0]\n\
_080546D2:\n\
    mov r2, sb\n\
    cmp r2, #3\n\
    bhi _080546DC\n\
    bl _08053C48\n\
_080546DC:\n\
    add sp, #4\n\
    pop {r3, r4}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080546EC: .4byte gBanimDoneFlag\n\
    .syntax divided\n\
");
}

#endif
