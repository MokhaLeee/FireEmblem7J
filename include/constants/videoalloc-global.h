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

    BGPAL_STATSCREEN_6    = 6,
    BGPAL_MURALBACKGROUND = 14,
};

enum {
    BGCHR_ICON_END   = 0x300,
};

enum objchr_idx {
    OBCHR_FACE_DEFAULT2 = 0x200,
    OBCHR_FACE_DEFAULT1 = 0x280,
    OBCHR_FACE_DEFAULT0 = 0x300,
    OBCHR_FACE_DEFAULT3 = 0x380,
};

enum objpal_idx {
    OBPAL_FACE_DEFAULT0 = 6,
    OBPAL_FACE_DEFAULT1 = 7,
    OBPAL_FACE_DEFAULT2 = 8,
    OBPAL_FACE_DEFAULT3 = 9,
};
