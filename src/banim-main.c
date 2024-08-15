#include "gbafe.h"

struct UnkStruct {
    const u32 *unk0;
    const u32 *unk1;
    u32 unk2;
};

void BattleAIS_ExecCommands(void)
{
    int state2, id1, id2, type;
    int queue;
    unsigned int i;
    const u32 *ptr;
    const u8* ptr_2;
    int *pmode, mode;
    struct Anim *anim, *animc, *anim1, *anim2;

    for (i = 0; i < 4; i++) {
        Unk_03004750 = i;

        /* R7 = anim */
        anim = gAnims[i];
        if (!anim)
            continue;

        /* R8 = state2 */
        state2 = anim->state2 & 0xF000;
        if (state2 == 0)
            continue;
        
        if (state2 & 0x1000) {
            while (1) {
                if (anim->commandQueueSize == 0)
                    goto break_queue;
                
                // _08053C8A
                switch (anim->commandQueue[anim->commandQueueSize - 1]) {
                case 0:
                    break;

                case 1:
                    if (gAnimC01Blocking == 1)
                        anim->pScrCurrent = anim->pScrStart;
                    else if (!(anim->state3 & 0x4))
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    else if (anim->state3 & 0x8) {
                        if (CheckEkrHitDone() == 1) {
                            anim->state3 &= ~(0x1 | 0x4 | 0x8);
                            anim->pScrCurrent = anim->pScrCurrent + 1;

                            if (sub_8050FE4() != 0)
                                sub_8050FF0(0);
                        }
                    }
                    break;
                
                case 2:
                    if (anim->state3 & 0x01) {
                        anim->state3 &= ~0x1;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;
                
                case 3:
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxSpecalEffect(anim);
                    }

                    if (anim->state3 & 0x40) {
                        anim->state3 &= ~0x20;
                        anim->state3 &= ~0x40;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;
                
                case 4:
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                        anim->state3 |= 0x40;
                    }

                    if (anim->state3 & 0x40) {
                        anim->state3 &= ~0x20;
                        anim->state3 &= ~0x40;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    
                        // R6 = 0 ?

                        anim->state3 |= 0x9;

                        /* [SP] = animc */
                        anim1 = GetAnimAnotherSide(anim);
                    
                        /* R8 = type */
                        state2 = GetAnimRoundTypeAnotherSide(anim);
                        if (CheckRoundMiss(state2) == 1) {
                            if (anim1) {
                                anim1->state3 |= 0x9;

                                if (GetAISLayerId(anim) == 0) {
                                    StartBattleAnimHitEffectsDefault(anim1, CheckRoundMiss(state2));
                                }
                            }
                        }
                    }
                    break;
                
                case 5:
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                        anim->state3 |= 0x40;
                    }

                    if (anim->state3 & 0x40) {
                        anim->state3 &= ~0x20;
                        anim->state3 &= ~0x40;
                        anim->pScrCurrent = anim->pScrCurrent + 1;

                        anim->state3 |= 0x9;

                        if (GetAISLayerId(anim) == 0) {
                            StartSpellAnimation(anim);

                            if (sub_8050FE4())
                                sub_8050FF0(0x2);
                        }
                    }
                    break;
                
                case 6:
                    anim1 = GetAnimAnotherSide(anim);
                    if (anim1) {
                        state2 = GetAnimNextRoundTypeAnotherSide(anim1);
                        if (state2 != -1) {
                            anim1->state3 |= 0x2;
                        }
                    }
                    break;
                
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                    if (GetAISLayerId(anim) == 0) {
                        anim1 = GetAnimAnotherSide(anim);
                        state2 = GetAnimRoundTypeAnotherSide(anim);
                        if (CheckRoundMiss(state2) == 0) {
                            type = sub_80684B0(anim1);
                            if (type != 2) {
                                if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim)))
                                    NewEfxChillEffect(anim1);
                                else
                                    NewEfxPierceCritical(anim1);
                            }
                        }

                        if (anim1) {
                            anim1->state3 |= 0x9;
                            state2 = GetAnimRoundTypeAnotherSide(anim);
                            StartBattleAnimHitEffectsDefault(anim1, CheckRoundMiss(state2));
                        }
                    }
                    break;
                
                case 13:
                    /* R8 = id1 */
                    state2 = GetAnimNextRoundType(anim);

                    /* [SP] = anim1 */
                    anim1 = gAnims[GetAnimPosition(anim) * 2];
                    
                    /* R6 = anim2 */
                    anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

                    // _08054078
                    switch (anim->currentRoundType) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 9:
                        if (state2 != -1) {
                            anim1->nextRoundId = anim1->nextRoundId + 1;
                            anim2->nextRoundId = anim2->nextRoundId + 1;

                            SwitchAISFrameDataFromBARoundType(anim1, state2);
                            SwitchAISFrameDataFromBARoundType(anim2, state2);

                            anim1->state3 |= 0x4;
                            anim2->state3 |= 0x4;

                            /* R8 = id1 */
                            state2 = BattleTypeToAnimModeEndOfDodge[gEkrDistanceType];

                            /* R4 = id2 */
                            id2 = BanimDefaultModeConfig[state2 * 4];

                            if (GetAnimPosition(anim) == 0)
                                mode = gpBanimModesLeft[id2];
                            else
                                mode = gpBanimModesRight[id2];

                            // _08054126
                            {
                                struct UnkStruct *unk = (void *)(mode + gBanimScrLeft + GetAnimPosition(anim) * 0x2A00);
                                register const void *_ptr asm("r4");
                                register u32 unk1 asm("r1");
                                anim1->pImgSheet = unk->unk1;

                                _ptr = anim1->pSpriteDataPool;
                                unk1 = unk->unk2;
                                _ptr += unk1;
                                anim1->pSpriteData = _ptr;
                            }
                            
                            mode = (int)(anim2->pSpriteDataPool);
                            mode += 0x57F0;
                            anim2->pSpriteData = (const void *)(mode);

                            if (Unk_0203E088[GetAnimPosition(anim)] == 0) {
                                if (gpImgSheet[GetAnimPosition(anim1)] != anim1->pImgSheet) {
                                    NewEkrChienCHR(anim1);
                                    gpImgSheet[GetAnimPosition(anim1)] = anim1->pImgSheet;
                                }
                            }

                            AnimScrAdvance(anim1);
                            AnimScrAdvance(anim2);
                            goto break_queue;
                        } /* if (id1 != -1) */
                    
                    case 4:
                    case 5:
                        state2 = BattleTypeToAnimModeEndOfDodge[gEkrDistanceType];

                    case 6:
                    case 7:
                    case 8:
                        SwitchAISFrameDataFromBARoundType(anim1, state2);
                        SwitchAISFrameDataFromBARoundType(anim2, state2);

                        AnimScrAdvance(anim1);
                        AnimScrAdvance(anim2);
                        goto break_queue;
                        break;
                    } /* switch (anim->currentRoundType) */
                    break;
                
                case 19:
                    // _080541F0
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                    } else if (Unk_02017758 == 1) {
                        Unk_02017758 = 0;
                        anim->state3 &= ~0x20;
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
                    if (anim->state3 & 0x1) {
                        anim->state3 &= ~0x1;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                        anim->oam2Base = (0xF3FF & anim->oam2Base) | 0x400;
                        anim->drawLayerPriority = 0x8C;
                        AnimSort();
                    }
                    break;
                
                /* Maybe hit effect? */
                case 26:
                    if (GetAISLayerId(anim) == 0) {
                        anim1 = GetAnimAnotherSide(anim);
                        if (anim1) {
                            anim1->state3 |= 0x9;
                            state2 = GetAnimRoundTypeAnotherSide(anim);
                            StartBattleAnimHitEffectsDefault(anim1, CheckRoundMiss(state2));
                        }

                        if (sub_80684B0(anim1) != 2) {
                            if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim)))
                                    NewEfxChillEffect(anim1);
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
                    if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim))) {
                        if ((anim->state3 & 0x20) == 0) {
                            anim->state3 |= 0x20;

                            if (GetAISLayerId(anim) == 0)
                                NewEfxChillAnime(anim, 0);
                        } else {
                            // _080544D6
                            if (anim->state3 & 0x40) {
                                anim->state3 &= ~0x20;
                                anim->state3 &= ~0x40;
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
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxKingPika(anim);
                    } else {
                        // _080544D6
                        if (anim->state3 & 0x40) {
                            anim->state3 &= ~0x20;
                            anim->state3 &= ~0x40;
                            anim->pScrCurrent = anim->pScrCurrent + 1;
                        }
                    }
                    break;
                
                case 61:
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                        if (GetAISLayerId(anim) == 0)
                            sub_8050FF0(1);

                        /* Show Nergal's dark aura animation */
                        NewEfxDrsmmoya(anim);
                        NewEfxspdquake(anim);
                    }

                    if (anim->state3 & 0x40) {
                        anim->state3 &= ~0x20;
                        anim->state3 &= ~0x40;
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
                    if ((anim->state3 & 0x20) == 0) {
                        anim->state3 |= 0x20;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxFlashFX(anim);
                    } else {
                        // _080544D6
                        if (anim->state3 & 0x40) {
                            anim->state3 &= ~0x20;
                            anim->state3 &= ~0x40;
                            anim->pScrCurrent = anim->pScrCurrent + 1;
                        }
                    }
                    break;

                case 82:
                    if (0x1000 & GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim))) {
                        if ((anim->state3 & 0x20) == 0) {
                            anim->state3 |= 0x20;
                            if (GetAISLayerId(anim) == 0)
                                NewEfxChillAnime(anim, 1);
                        } else {
                            // _080544D6
                            if (anim->state3 & 0x40) {
                                anim->state3 &= ~0x20;
                                anim->state3 &= ~0x40;
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
                anim->commandQueueSize--;
            } /* while (anim->commandQueueSize != 0) */

break_queue:
            anim->state2 &= ~(0x1000 | 0x800 | 0x80 | 0x40 | 0x20 | 0x10 | 0x8 | 0x4 | 0x2 | 0x1);
        } /* if (state2 & 0x1000) */

        // _0805450A
        if (state2 & 0x2000) {
            if (GetAISLayerId(anim) == 0) {
                if (Unk_0203E088[GetAnimPosition(anim)] == 0)
                    if (!(anim->state3 & 0x4000))
                        if (gpImgSheet[GetAnimPosition(anim)] != anim->pImgSheet) {
                            RegisterAISSheetGraphics(anim);
                            gpImgSheet[GetAnimPosition(anim)] = anim->pImgSheet;
                        }
            }

            anim->state2 &= ~(0x2000 | 0x800 | 0x80 | 0x40 | 0x20 | 0x10 | 0x8 | 0x4 | 0x2 | 0x1);
        }

        // _08054570
        if (!(state2 & 0x4000) && gAnimC01Blocking != 1)
            continue;
        
        if (anim->state3 & 0x2) {
            /* R8 = id1 */
            state2 = GetAnimNextRoundType(anim);
            if (state2 != -1) {
                /* [SP] = anim1 */
                anim1 = gAnims[GetAnimPosition(anim) * 2];
                SwitchAISFrameDataFromBARoundType(anim1, state2);
                anim1->state3 &= ~0x2;
                anim1->state3 |= 0x4;

                /* R6 = anim2 */
                anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];
                SwitchAISFrameDataFromBARoundType(anim2, state2);
                anim2->state3 &= ~0x2;
                anim2->state3 |= 0x4;

                anim1->nextRoundId = anim1->nextRoundId + 1;
                anim2->nextRoundId = anim2->nextRoundId + 1;

                AnimScrAdvance(anim1);
                AnimScrAdvance(anim2);
            } else {
                // _080545D4
                anim1 = gAnims[GetAnimPosition(anim) * 2];
                anim1->state3 &= (~0x2);

                anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];
                anim2->state3 &= (~0x2);
            } /* if (id1 != -1) */
        } else {
            // _0805460C
            if (anim->state3 & 0x8000) {
                state2 = GetAnimNextRoundType(anim);
                if (state2 != -1) {
                    /* [SP] = anim1 */
                    anim1 = gAnims[GetAnimPosition(anim) * 2];
                    SwitchAISFrameDataFromBARoundType(anim1, state2);
                    anim1->state3 &= ~0x8000;
                    anim1->state3 |= 0x4;
    
                    /* R6 = anim2 */
                    anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];
                    SwitchAISFrameDataFromBARoundType(anim2, state2);
                    anim2->state3 &= ~0x8000;
                    anim2->state3 |= 0x4;
    
                    anim1->nextRoundId = anim1->nextRoundId + 1;
                    anim2->nextRoundId = anim2->nextRoundId + 1;
    
                    AnimScrAdvance(anim1);
                    AnimScrAdvance(anim2);
                }
            } else {
                // _08054698
                if (GetAISLayerId(anim) == 0) {
                    state2 = GetBattleAnimRoundType(anim->nextRoundId * 2 + GetAnimPosition(anim));
                    if (state2 == -1)
                        gBanimDoneFlag[GetAnimPosition(anim)] = 1;
                }
            }
        } /* if (state3 & 0x2) */
    }
}
