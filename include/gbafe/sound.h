#pragma once

#include "global.h"
#include "m4a.h"

// GetCurrentBgmSong
// sub_80033D0
// sub_80033EC
// SetBgmVolume
// FadeBgmOut
// sub_8003550
void Sound_FadeOutSE(int speed);
// sub_8003684
// sub_80036F0
// sub_800376C
// sub_8003788
// sub_80037A8
// sub_8003858
// sub_800394C
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
// sub_800409C
// sub_80040C0
// sub_80040F8
// sub_8004110

#define PlaySoundEffect(id) \
    if (!gPlaySt.cfgDisableSoundEffects) \
        m4aSongNumStart((id))
