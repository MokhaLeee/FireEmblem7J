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
// sub_804A2AC
void ApplyUiStatBarPal(int palid);
// sub_804A30C
// sub_804A360
// sub_804A4CC
// DisplayUiHand
// sub_804A7B0
// sub_804A7EC
// sub_804A810
// sub_804A81C
// ClearUi
// sub_804A84C
// sub_804A8B0
// sub_804A930
// sub_804A95C
// sub_804A9D0
void UnpackUiWindowFrameGraphics(void);
