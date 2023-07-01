#pragma once

#define CHR_SIZE 0x20
#define CHR_LINE 0x20

enum {
    BGPAL_TEXT_DEFAULT    = 0,
    BGPAL_WINDOWFRAME     = 1,
    BGPAL_TALK            = 2,
    BGPAL_TALK_BUBBLE     = 3,
    BGPAL_ICONS           = 4, // .. 5
    BGPAL_TILESET         = 6, // .. 15
};

enum {
    BGCHR_ICON_END   = 0x300,
};
