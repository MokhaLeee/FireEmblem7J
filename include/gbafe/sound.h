#pragma once

#include "global.h"
#include "m4a.h"
#include "gba/m4a_internal.h"

// GetCurrentBgmSong
// sub_80033D0
// sub_80033EC
// SetBgmVolume
// FadeBgmOut
// sub_8003550
void Sound_FadeOutSE(int speed);
// sub_8003684
void StartOrChangeBgm(int song, int speed, struct MusicPlayer * music_player);
void StartBgm(int song, struct MusicPlayer * music_player);
void StartBgmExt(int song, int speed, struct MusicPlayer * music_player);
// MusicFi_OnLoop
// sub_8003858
void OverrideBgm(int song);
// RestoreBgm
// sub_8003A68
// MakeBgmOverridePersist
// StartBgmVolumeChange
// MusicVc_OnLoop
// DelaySong_OnLoop
// sub_8003D7C
// PlaySongCore
// sub_8003E48
// sub_8003E68
// sub_8003E9C
// sub_8003F04
// sub_8003F28
// sub_8003F94
// CallSomeSoundMaybe
// MusicProc4Exists
// sub_80040C0
// sub_80040F8
// sub_8004110

#define PlaySoundEffect(id) \
    if (!gPlaySt.cfgDisableSoundEffects) \
        m4aSongNumStart((id))
