#pragma once

enum
{
    // window_theme (including PlaySt::config_window_theme)

    UI_WINDOW_THEME_BLUE,
    UI_WINDOW_THEME_RED,
    UI_WINDOW_THEME_GRAY,
    UI_WINDOW_THEME_GREEN,
};

enum
{
    // PutUiWindowFrame param window_kind

    UI_WINDOW_REGULAR,
    UI_WINDOW_FILL,
    UI_WINDOW_SABLE,
};

void ApplyUiWindowFramePal(int palid);
// UnpackUiWindowFrameImg
void ApplyUiStatBarPal(int palid);
// UnpackUiWindowFrameGraphics2
// PutUiWindowFrame
// sub_804A4CC
void PutUiHand(int x, int y);
// sub_804A7B0
// sub_804A7EC
int GetUiHandPrevX(void);
int GetUiHandPrevY(void);
// ClearUi
// sub_804A84C
// sub_804A8B0
// sub_804A930
// sub_804A95C
// sub_804A9D0
void UnpackUiWindowFrameGraphics(void);

// ??? gUnk_08C09944
// ??? gUnk_08C09B0C
extern u16 const * CONST_DATA gUiWindowFrameModelLut[];
extern u16 const * CONST_DATA gUiWindowFramePalLut[];
extern u8 const * CONST_DATA gUiWindowFrameImgLut[];
extern u16 const * CONST_DATA gUiStatBarPalLut[];
// ??? gUnk_08C09BB4
// ??? gUnk_08C09BBC
// ??? gUnk_08C09BDC
// ??? gUnk_08C09BF4
// ??? gUnk_08C09C34
// ??? gUnk_08C09C3C
// ??? gUnk_08C09C54
// ??? gUnk_08C09C64
// ??? gUnk_08C09C74
// ??? gUnk_08C09C80
// ??? gUnk_08C09CB0
