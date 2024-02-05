#pragma once

#include "global.h"
#include "m4a.h"

#define PlaySoundEffect(id) \
    if (!gPlaySt.cfgDisableSoundEffects) \
        m4aSongNumStart((id))
