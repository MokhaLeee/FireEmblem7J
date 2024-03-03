#include "gbafe.h"

struct HelpBoxInfo EWRAM_DATA gMutableHelpBoxInfo = { 0 };
struct HelpBoxInfo const * EWRAM_DATA gLastHelpBoxInfo = NULL;
struct Vec2 EWRAM_DATA gHelpBoxOrigin = { 0 };

void UpdateHelpBoxDisplay(struct HelpBoxProc * proc, int interpolate_method)
{
    proc->x_box = Interpolate(interpolate_method, proc->x_box_init, proc->x_box_fini, proc->timer, proc->timer_end);
    proc->y_box = Interpolate(interpolate_method, proc->y_box_init, proc->y_box_fini, proc->timer, proc->timer_end);
    proc->w_box = Interpolate(interpolate_method, proc->w_box_init, proc->w_box_fini, proc->timer, proc->timer_end);
    proc->h_box = Interpolate(interpolate_method, proc->h_box_init, proc->h_box_fini, proc->timer, proc->timer_end);

    PutSpriteTalkBox(proc->x_box, proc->y_box, proc->w_box, proc->h_box, proc->unk_52);
}

void HelpBox_OnOpen(struct HelpBoxProc * proc)
{
    struct Proc * found = Proc_Find(ProcScr_HelpPromptSpr);

    if (found)
        found->proc_lockCnt = 1; // lock (disabled) proc

    if (proc->unk_52 == 0)
        PlaySoundEffect(0x390); // TODO: song ids
}

void HelpBox_OnLoop(struct HelpBoxProc * proc)
{
    UpdateHelpBoxDisplay(proc, INTERPOLATE_RCUBIC);

    if (proc->timer < proc->timer_end)
        proc->timer++;
}

void HelpBox_OnClose(struct HelpBoxProc * proc)
{
    struct Proc* found = Proc_Find(ProcScr_HelpPromptSpr);

    if (found)
        found->proc_lockCnt = 0; // unlock (enable) proc

    if (proc->unk_52 == 0)
    {
        PlaySoundEffect(0x391); // TODO: song ids

        ResetHelpBoxInitSize(proc);
        SetHelpBoxInitPosition(proc, proc->info->x, proc->info->y);
    }
}

void HelpBox_WaitClose(struct HelpBoxProc * proc)
{
    UpdateHelpBoxDisplay(proc, INTERPOLATE_LINEAR);

    proc->timer -= 3;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void StartHelpBox(int x, int y, int msg)
{
    gMutableHelpBoxInfo.adjacent_up = NULL;
    gMutableHelpBoxInfo.adjacent_down = NULL;
    gMutableHelpBoxInfo.adjacent_left = NULL;
    gMutableHelpBoxInfo.adjacent_right = NULL;
    gMutableHelpBoxInfo.x = x;
    gMutableHelpBoxInfo.y = y;
    gMutableHelpBoxInfo.msg = msg;
    gMutableHelpBoxInfo.redirect = NULL;
    gMutableHelpBoxInfo.populate = NULL;

    gHelpBoxOrigin.x = 0;
    gHelpBoxOrigin.y = 0;

    StartHelpBoxExt(&gMutableHelpBoxInfo, 0);
}

void StartHelpBox_Unk(int x, int y, int mid)
{
    if (x < 0 && y < 0)
    {
        x = GetUiHandPrevX();
        y = GetUiHandPrevY();
    }

    gMutableHelpBoxInfo.adjacent_up    = NULL;
    gMutableHelpBoxInfo.adjacent_down  = NULL;
    gMutableHelpBoxInfo.adjacent_left  = NULL;
    gMutableHelpBoxInfo.adjacent_right = NULL;

    gMutableHelpBoxInfo.x = x;
    gMutableHelpBoxInfo.y = y;
    gMutableHelpBoxInfo.msg      = mid;

    gMutableHelpBoxInfo.redirect = NULL;
    gMutableHelpBoxInfo.populate = NULL;

    gHelpBoxOrigin.x = 0;
    gHelpBoxOrigin.y = 0;

    StartHelpBoxExt(&gMutableHelpBoxInfo, TRUE);
}

void StartItemHelpBox(int x, int y, int item)
{
    gMutableHelpBoxInfo.adjacent_up = NULL;
    gMutableHelpBoxInfo.adjacent_down = NULL;
    gMutableHelpBoxInfo.adjacent_left = NULL;
    gMutableHelpBoxInfo.adjacent_right = NULL;
    gMutableHelpBoxInfo.x = x;
    gMutableHelpBoxInfo.y = y;
    gMutableHelpBoxInfo.msg = item;
    gMutableHelpBoxInfo.redirect = NULL;
    gMutableHelpBoxInfo.populate = HelpBoxPopulateAutoItem;

    gHelpBoxOrigin.x = 0;
    gHelpBoxOrigin.y = 0;

    StartHelpBoxExt(&gMutableHelpBoxInfo, 0);
}

struct ProcCmd CONST_DATA ProcScr_HelpBox[] = {
    PROC_YIELD,
    PROC_CALL(HelpBox_OnOpen),
    PROC_REPEAT(HelpBox_OnLoop),
PROC_LABEL(99),
    PROC_CALL(HelpBox_OnClose),
    PROC_REPEAT(HelpBox_WaitClose),
    PROC_END,
};

void StartHelpBoxExt(struct HelpBoxInfo const * info, int unk)
{
    struct HelpBoxProc * proc;
    int w_inner, h_inner;

    proc = Proc_Find(ProcScr_HelpBox);

    if (proc == NULL)
    {
        proc = Proc_Start(ProcScr_HelpBox, PROC_TREE_3);

        proc->unk_52 = unk;
        SetHelpBoxInitPosition(proc, info->x, info->y);
        ResetHelpBoxInitSize(proc);
    }
    else
    {
        proc->x_box_init = proc->x_box;
        proc->y_box_init = proc->y_box;
        proc->w_box_init = proc->w_box;
        proc->h_box_init = proc->h_box;
    }

    proc->info = info;
    proc->timer = 0;
    proc->timer_end = 12;
    proc->item = 0;
    proc->msg = info->msg;

    if (proc->info->populate != NULL)
        proc->info->populate(proc);

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);
    GetStringTextBox(DecodeMsg(proc->msg), &w_inner, &h_inner);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    ApplyHelpBoxContentSize(proc, w_inner, h_inner);
    ApplyHelpBoxPosition(proc, info->x, info->y);

    ClearHelpBoxText();
    StartHelpBoxTextInit(proc->item, proc->msg);

    gLastHelpBoxInfo = info;
}

void StartHelpBoxExt_Unk(int x, int y, int msg)
{
    struct HelpBoxProc * proc;
    int w_inner, h_inner;

    proc = Proc_Start(ProcScr_HelpBox, PROC_TREE_3);

    proc->unk_52 = TRUE;

    if (x < 0 && y < 0)
    {
        x = GetUiHandPrevX();
        y = GetUiHandPrevY();
    }

    proc->timer = 0;
    proc->timer_end = 12;
    proc->item = 0;
    proc->msg = msg;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);
    GetStringTextBox(DecodeMsg(proc->msg), &w_inner, &h_inner);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    ResetHelpBoxInitSize(proc);
    ApplyHelpBoxContentSize(proc, w_inner, h_inner);

    proc->x_box_init = x + 8;
    proc->y_box_init = y + 8;

    proc->x_box_fini = x + 8;
    proc->y_box_fini = y + 8;

    ClearHelpBoxText();
    StartHelpBoxTextInit(proc->item, proc->msg);
}

void CloseHelpBox(void)
{
    struct HelpBoxProc * proc = Proc_Find(ProcScr_HelpBox);

    if (proc != NULL)
    {
        ClearHelpBoxText();
        Proc_Goto(proc, 99);
    }
}

void KillHelpBox(void)
{
    struct HelpBoxProc * proc = Proc_Find(ProcScr_HelpBox);

    if (proc != NULL)
    {
        ClearHelpBoxText();
        Proc_End(proc);
    }
}

void HelpBoxMoveControl_OnInitBox(struct HelpBoxProc * proc)
{
    proc->move_key_bit = 0;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    StartHelpBoxExt(proc->info, FALSE);
}

void HelpBoxMoveControl_OnIdle(struct HelpBoxProc * proc)
{
    bool box_moved = FALSE;

    PutUiHand(
        gHelpBoxOrigin.x * 8 + proc->info->x,
        gHelpBoxOrigin.y * 8 + proc->info->y);

    if (gpKeySt->repeated & DPAD_UP)
        box_moved |= HelpBoxTryRelocateUp(proc);

    if (gpKeySt->repeated & DPAD_DOWN)
        box_moved |= HelpBoxTryRelocateDown(proc);

    if (gpKeySt->repeated & DPAD_LEFT)
        box_moved |= HelpBoxTryRelocateLeft(proc);

    if (gpKeySt->repeated & DPAD_RIGHT)
        box_moved |= HelpBoxTryRelocateRight(proc);

    if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
    {
        Proc_Break(proc);
        return;
    }

    if (box_moved)
    {
        PlaySoundEffect(0x387);
        Proc_Goto(proc, 0);
    }
}

void HelpBoxMoveControl_OnEnd(struct HelpBoxProc * proc)
{
    CloseHelpBox();
    Proc_End(proc);
}

struct ProcCmd CONST_DATA ProcScr_HelpBoxMoveControl[] = {
    PROC_SLEEP(1),
PROC_LABEL(0),
    PROC_CALL(HelpBoxMoveControl_OnInitBox),
    PROC_REPEAT(HelpBoxMoveControl_OnIdle),
    PROC_CALL(CloseHelpBox),
    PROC_END,
};

void StartMovingHelpBox(struct HelpBoxInfo const * info, ProcPtr parent)
{
    struct HelpBoxProc * proc = Proc_StartBlocking(ProcScr_HelpBoxMoveControl, parent);

    gHelpBoxOrigin.x = 0;
    gHelpBoxOrigin.y = 0;

    proc->info = info;
}

void StartMovingHelpBoxExt(struct HelpBoxInfo const * info, ProcPtr parent, int x, int y)
{
    struct HelpBoxProc * proc = Proc_StartBlocking(ProcScr_HelpBoxMoveControl, parent);

    gHelpBoxOrigin.x = x;
    gHelpBoxOrigin.y = y;

    proc->info = info;
}

void ApplyHelpBoxContentSize(struct HelpBoxProc * proc, int w_inner, int h_inner)
{
    w_inner = 0xE0 & (w_inner + 31); // align to 32 pixel multiple

    switch (GetHelpBoxItemInfoKind(proc->item)) {
    case HELPBOX_INFO_WEAPON:
        w_inner = 0xA0;
        h_inner += 0x20;
        break;

    case HELPBOX_INFO_STAFF:
        if (w_inner < 0x60)
            w_inner = 0x60;

        h_inner += 0x10;
        break;

    case HELPBOX_INFO_SAVE_MENU:
        w_inner = gPlaySt.unk_2B_00 ? 0xA0 : 0x40;
        h_inner += 0x10;
        break;
    }

    proc->w_box_fini = w_inner;
    proc->h_box_fini = h_inner;
}

void ApplyHelpBoxPosition(struct HelpBoxProc * proc, int x, int y)
{
    int x_span = proc->w_box_fini + 0x10;
    int y_span = proc->h_box_fini + 0x10;

    x += gHelpBoxOrigin.x * 8;
    y += gHelpBoxOrigin.y * 8;

    proc->x_box_fini = x - 0x10 - x_span / 6;

    if (proc->x_box_fini < 0)
        proc->x_box_fini = 0;

    if (proc->x_box_fini + x_span > DISPLAY_WIDTH)
        proc->x_box_fini = DISPLAY_WIDTH - x_span;

    proc->y_box_fini = y + 0x10;

    if (proc->y_box_fini + y_span > DISPLAY_HEIGHT)
        proc->y_box_fini = y - y_span;

    proc->x_box_fini += 8;
    proc->y_box_fini += 8;
}

void SetHelpBoxInitPosition(struct HelpBoxProc * proc, int x, int y)
{
    x += gHelpBoxOrigin.x * 8;
    y += gHelpBoxOrigin.y * 8;

    proc->x_box_init = x;
    proc->y_box_init = y;
}

void ResetHelpBoxInitSize(struct HelpBoxProc * proc)
{
    proc->w_box_init = 32;
    proc->h_box_init = 16;
}

int GetHelpBoxItemInfoKind(int item)
{
    if (item == 0xFFFF)
        return HELPBOX_INFO_SAVE_MENU;

    if (GetItemAttributes(item) & IA_LOCK_3)
        return HELPBOX_INFO_NONE;

    if (GetItemAttributes(item) & IA_WEAPON)
        return HELPBOX_INFO_WEAPON;

    if (GetItemAttributes(item) & IA_STAFF)
        return HELPBOX_INFO_STAFF;

    return HELPBOX_INFO_NONE;
}

void HelpBoxPopulateAutoItem(struct HelpBoxProc * proc)
{
    int item = proc->info->msg;

    proc->item = item;

    if (GetHelpBoxItemInfoKind(proc->item) == HELPBOX_INFO_SAVE_MENU)
        proc->msg = 0;
    else
        proc->msg = GetItemDescMsg(item);
}

int HelpBoxTryRelocateUp(struct HelpBoxProc* proc)
{
    if (proc->info->adjacent_up == NULL)
        return FALSE;

    proc->info = proc->info->adjacent_up;
    proc->move_key_bit = DPAD_UP;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

int HelpBoxTryRelocateDown(struct HelpBoxProc* proc)
{
    if (proc->info->adjacent_down == NULL)
        return FALSE;

    proc->info = proc->info->adjacent_down;
    proc->move_key_bit = DPAD_DOWN;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

int HelpBoxTryRelocateLeft(struct HelpBoxProc* proc)
{
    if (proc->info->adjacent_left == NULL)
        return FALSE;

    proc->info = proc->info->adjacent_left;
    proc->move_key_bit = DPAD_LEFT;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

int HelpBoxTryRelocateRight(struct HelpBoxProc * proc)
{
    if (proc->info->adjacent_right == NULL)
        return FALSE;

    proc->info = proc->info->adjacent_right;
    proc->move_key_bit = DPAD_RIGHT;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

void HelpBoxLockHelper_Loop(ProcPtr proc)
{
    if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_HelpBoxLockHelper[] = {
    PROC_REPEAT(HelpBoxLockHelper_Loop),
    PROC_END,
};

/* unused */
int StartLockingHelpBox(int msg, ProcPtr parent)
{
    LoadHelpBoxGfx(NULL, -1);
    StartHelpBox(GetUiHandPrevX(), GetUiHandPrevY(), msg);
    Proc_StartBlocking(ProcScr_HelpBoxLockHelper, parent);

    return TRUE;
}

u16 CONST_DATA Sprite_MetaHelp[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0xB),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(32), OAM2_CHR(0xF),
};

void HelpPrompt_OnIdle(struct HelpPromptSprProc * proc)
{
    PutSprite(0,
        proc->x,
        proc->y,
        Sprite_MetaHelp, 0);
}

struct ProcCmd CONST_DATA ProcScr_HelpPromptSpr[] = {
    PROC_YIELD,
    PROC_REPEAT(HelpPrompt_OnIdle),
    PROC_END,
};

ProcPtr StartHelpPromptSprite(int x, int y, ProcPtr parent)
{
    struct HelpPromptSprProc * proc = Proc_Find(ProcScr_HelpPromptSpr);
    if (!proc)
        proc = Proc_Start(ProcScr_HelpPromptSpr, parent);

    proc->x = x;
    proc->y = y;
    return proc;
}

ProcPtr StartHelpPromptSpriteBlocking(int x, int y, ProcPtr parent)
{
    struct HelpPromptSprProc * proc = Proc_Find(ProcScr_HelpPromptSpr);
    if (!proc)
        proc = Proc_StartBlocking(ProcScr_HelpPromptSpr, parent);

    proc->x = x;
    proc->y = y;
    return proc;
}

void EndHelpPromptSprite(void)
{
    ProcPtr proc = Proc_Find(ProcScr_HelpPromptSpr);
    if (proc)
        Proc_End(proc);
}

void MoveHelpPromptSprite(int x, int y)
{
    struct HelpPromptSprProc * proc = Proc_Find(ProcScr_HelpPromptSpr);
    if (proc)
    {
        proc->x = x;
        proc->y = y;
    }
}

struct HelpBoxInfo const * GetLastHelpBoxInfo(void)
{
    return gLastHelpBoxInfo;
}
