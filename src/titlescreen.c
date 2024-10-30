#include "gbafe.h"

EWRAM_OVERLAY(gamestart) struct TitleSt gTitleSt = {0};

struct ProcCmd CONST_DATA ProcScr_TitleScreen[] = {
    PROC_YIELD,
    PROC_CALL(Title_Init),
    PROC_CALL(Title_InitDisp),
    PROC_CALL(sub_8014714),
    PROC_YIELD,
    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_YIELD,
    PROC_CALL(Title_StartBmBgfxAnim),
    PROC_REPEAT(Title_BmBgfxAnimIN),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_CALL(Title_ResetBmBgfxConf),
    PROC_REPEAT(Title_BmBgfxAnimOUT),
    PROC_CALL(Title_RefrainSprites),
PROC_LABEL(1),
    PROC_REPEAT(Title_IDLE),
PROC_LABEL(2),
    PROC_CALL(sub_8014690),
    PROC_YIELD,
    PROC_CALL(Title_End),
    PROC_END,
};

void HBlank_TitleScreen(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount >= DISPLAY_HEIGHT)
        vcount = 0;

    REG_BG0VOFS = -((1 & vcount) + vcount / 2);
}

void ResetTitleBgAffin(u8 bg)
{
    struct BgAffineSrcData data;
    struct BgAffineDstData * dst;

    data.texX = 0;
    data.texY = 0;
    data.scrX = 0;
    data.scrY = 0;
    data.sx = 0x100;
    data.sy = 0x100;
    data.alpha = 0;

    dst = &gDispIo.bg3affin;
    if (bg == BG_2)
        dst = &gDispIo.bg2affin;

    BgAffineSet(&data, dst, 1);
}

void Title_InitSpriteAnim(struct ProcTitle * proc, bool anim_en)
{
    int x;
    const u16 * ap_scr;

    x = anim_en ? 0 : 0x100;

    ApplyPalettes(Pal_TitleSprites, 0x10, 5);
    Decompress(Img_TitleSprites, OBJ_VRAM0);

    ap_scr = SpirteAnim_TitleScreen;

    proc->approcs[0] = StartSpriteAnimProc(ap_scr, x + 0x78, 0x48, 0x800, 0, 0xA);
    proc->approcs[1] = StartSpriteAnimProc(ap_scr, x + 0x78, 0x48, 0x400, 1, 0xA);
    proc->approcs[2] = StartSpriteAnimProc(ap_scr, x + 0x78, 0x30, 0x400, 3, 0xA);
    proc->approcs[3] = StartSpriteAnimProc(ap_scr, x + 0x78, 0x80, 0x400, 4, 0xA);
    proc->approcs[4] = StartSpriteAnimProc(ap_scr, x + 0x78, 0x68, 0x400, 5, 0xA);
    proc->approcs[5] = StartSpriteAnimProc(ap_scr, x + 0x78, 0x90, 0x400, 6, 0xA);
}


void Title_InitBg(struct ProcTitle * proc)
{
    ApplyPalette(Pal_TitleBg, 0xF);
    Decompress(Img_TitleBg, (void *)BG_VRAM + 0x8000);
    TmApplyTsa(gBg3Tm, Tsa_TitleBg, 0xF000);

    ApplyPalette(Pal_TitleAxe, 0xE);
    Decompress(Img_TitleAxe, (void *)BG_VRAM + 0xCC00);
    TmApplyTsa(gBg2Tm + TM_OFFSET(0, 1), Tsa_TitleAxe, 0xE260);

    ApplyPalette(Pal_TitleTextShadow, 0xD);
    Decompress(Img_TitleTextShadow, (void *)BG_VRAM + 0xDE00);
    TmApplyTsa(gBg1Tm, Tsa_TitleTextShadow, 0xD2F0);
}

void Title_Init(struct ProcTitle * proc)
{
    int i;
    u16 * tm;

    u16 bg_config[12] =
    {
        0x0000, 0x7800, 0,
        0x8000, 0x6000, 0,
        0x8000, 0x6800, 0,
        0x8000, 0x7000, 0,
    };

    proc->timer = 0;
    SetWinEnable(0, 0, 0);

    InitBgs(bg_config);

    gDispIo.disp_ct.mode = 0;
    SetDispEnable(0, 0, 0, 0, 0);

    gDispIo.bg0_ct.priority = 3;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, -8, -0x30);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);
    TmFill(gBg3Tm, 0);

    ResetTitleBgAffin(BG_2);


    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
    SetBlendNone();

    EnableBgSync(BG3_SYNC_BIT | BG2_SYNC_BIT | BG1_SYNC_BIT | BG0_SYNC_BIT);

    if (proc->mode != 0)
        Proc_Goto(proc, 0);

    proc->timer_idle = 0;
}

void Title_InitDisp(struct ProcTitle * proc)
{
    Title_InitSpriteAnim(proc, true);
    Title_InitBg(proc);

    EnableBgSync(BG3_SYNC_BIT | BG2_SYNC_BIT | BG1_SYNC_BIT);

    Title_StartFlameAnim(proc);
}

void Title_StartBmBgfxAnim(struct ProcTitle * proc)
{
    SetOnHBlankA(HBlank_TitleScreen);
    Title_InitSpriteAnim(proc, false);
    Title_InitBg(proc);

    StartBmBgfx(
        BmBgfxConf_GameTitle,
        BG_0,
        0, 0,
        0, 0x2800, 0xA,
        NULL, proc
    );

    SetDispEnable(1, 0, 0, 0, 1);
    EnableBgSync(BG3_SYNC_BIT | BG2_SYNC_BIT | BG1_SYNC_BIT);
    PlaySoundEffect(0x63);
    proc->timer = 0;
}

void Title_BmBgfxAnimIN(struct ProcTitle * proc)
{
    u8 tmp;

    if (proc->timer == 8)
        TitleSpriteBlendIN(proc->approcs[1], 0x78, 0x38, 0x78, 0x48, 0x10, proc);

    tmp = proc->timer - 0x30;
    if (tmp <= 0x20)
    {
        int pa = (proc->timer - 0x30) / 2;

        if (proc->timer == 0x30)
        {
            SetBlendAlpha(0, 0x10);
            SetBlendTargetA(0, 0, 1, 0, 0);
            SetBlendTargetB(1, 1, 1, 1, 1);
            SetDispEnable(1, 0, 1, 0, 1);

            sub_80BDC2C(NULL, Pal_TitleAxe, 0xE, 0x20, proc);
        }

        SetBlendAlpha(pa, 0x10 - pa);
        SetBgOffset(BG_2, 0, ((proc->timer - 0x30) >> 1) - 0x10);
    }

    if (proc->timer == 0x28)
        TitleSpriteBlendOUT(proc->approcs[0], 0, 0, 0x78, 0x48, 0x10, 0, proc);

    if (proc->timer == 0x50)
        TitleSpriteBlendIN(proc->approcs[4], 0x78, 0x78, 0x78, 0x68, 0x10, proc);

    proc->timer++;
    if (proc->timer == 0x64)
        Proc_Break(proc);
}

void Title_ResetBmBgfxConf(struct ProcTitle * proc)
{
    proc->timer = 0;
    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetDispEnable(1, 0, 1, 1, 1);
    SetBlendBackdropB(1);
}

void Title_BmBgfxAnimOUT(struct ProcTitle * proc)
{
    proc->timer++;

    if (proc->timer <= 0x20)
    {
        if (proc->timer == 0x20)
        {
            TitleSpriteBlendIN(proc->approcs[2], 0xA0, 0x2C, 0x78, 0x2C, 0x10, proc);
            TitleSpriteBlendIN(proc->approcs[3], 0x78, 0x80, 0x78, 0x80, 0x10, proc);
            TitleSpriteBlendIN(proc->approcs[5], 0x78, 0x90, 0x78, 0x90, 0x10, proc);
        }
        else
        {
            u8 pa = proc->timer / 2;
            SetBlendAlpha(pa, 0x10 - pa);
        }
    }

    if (proc->timer == 0x3C)
        Proc_Break(proc);
}

void Title_RefrainSprites(struct ProcTitle * proc)
{
    SetOnHBlankA(NULL);
    Title_StartFlameAnim(proc);
}

void Title_IDLE(struct ProcTitle * proc)
{
    u8 time;

    proc->timer_idle++;
    proc->timer = (++proc->timer & 0x3f);

    ApplyPaletteExt(Pal_TitleFlameIdle + proc->timer / 4, 0x230, 2);

    if (gpKeySt->pressed & (A_BUTTON | START_BUTTON))
    {
        PlaySoundEffect(0x38D);
        SetNextGameAction(GAME_ACTION_EVENT_RETURN);
        Proc_Break(proc);
    }
    else if (proc->timer_idle == 0x1E0)
    {
        SetNextGameAction(GAME_ACTION_CLASS_REEL);
        Proc_Break(proc);
    }
}

void Title_End(struct ProcTitle * proc)
{
    int i;

    EndAllProcChildren(proc);

    for (i = 0; i < 6; i++)
        EndSpriteAnimProc(proc->approcs[i]);

    EndEachSpriteAnimProc();
    SetOnHBlankA(NULL);
}

void StartTitleScreen_WithMusic(ProcPtr parent)
{
    struct ProcTitle * proc;

    proc = Proc_StartBlocking(ProcScr_TitleScreen, parent);
    proc->mode = 0;

    StartBgmExt(0x5A, 0, 0);
}

void StartTitleScreen_FlagFalse(ProcPtr parent)
{
    struct ProcTitle * proc;

    proc = Proc_StartBlocking(ProcScr_TitleScreen, parent);
    proc->mode = 0;
}

void StartTitleScreen_FlagTrue(ProcPtr parent)
{
    struct ProcTitle * proc;

    proc = Proc_StartBlocking(ProcScr_TitleScreen, parent);
    proc->mode = 1;
}

struct ProcCmd CONST_DATA ProcScr_TitleFlame[] = {
    PROC_SET_END_CB(ResetScanLineHBlank),
    PROC_CALL(TitleFlame_Init),
    PROC_REPEAT(TitleFlame_Loop),
    PROC_END,
};

void Title_StartFlameAnim(struct ProcTitle * proc)
{
    SetDispEnable(1, 1, 1, 1, 1);
    StartSpriteAnimProc(SpirteAnim_TitleScreen, 0x78, 0x848, 0, 0x7, 0xA);
    SetWinEnable(0, 0, 1);
    SetWin0Layers(0, 0, 0, 0, 0);
    SetWObjLayers(1, 0, 0, 0, 1);
    SetWOutLayers(0, 1, 1, 1, 1);

    gDispIo.win_ct.wobj_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(1, 1, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBgOffset(BG_1, -8, -0x30);

    ApplyPalette(Pal_Title_086C3CF8, 0xC);
    Decompress(Img_Title_086C3D18, (void *)BG_VRAM + 0x5000);
    TmApplyTsa(gBg0Tm, Tsa_Title_086C40D0, 0xC280);
    EnableBgSync(BG0_SYNC_BIT);

    InitScanlineEffect();
    SetOnHBlankA(HBlank_Scanline_80782AC);
    Proc_Start(ProcScr_TitleFlame, proc);
}

void TitleFlame_Init(struct Proc * proc)
{
    proc->unk64 = 0;
    proc->unk66 = 0;

    gTitleSt.unk_00 = 3;
    gTitleSt.unk_04 = 3;
    gTitleSt.unk_08 = 3;
    gTitleSt.unk_0C = 4;
    gTitleSt.unk_10 = 0;
}

void TitleFlame_Loop(struct Proc * proc)
{
    if ((proc->unk66 >> 1) <= 0x10)
    {
        proc->unk66++;

        if (proc->unk66 <= 0x10)
            SetBgOffset(BG_1, -8 - (proc->unk66 >> 3), -0x30 - (proc->unk66 >> 2));

        SetBlendAlpha(proc->unk66 >> 1, 0x10 - (proc->unk66 >> 2));
    }

    sub_8077794(GetScanlineBuf(1, 0x00), proc->unk64, gTitleSt.unk_04, gTitleSt.unk_00, 0);
    sub_8077794(GetScanlineBuf(1, 0xA0), proc->unk64, gTitleSt.unk_0C, gTitleSt.unk_08, 0);
    SwapScanlineBufs();

    SetBgOffset(BG_0, 0, gTitleSt.unk_10);
    proc->unk64++;
}

struct ProcCmd CONST_DATA ProcScr_TitleAnimSpriteCtrl[] = {
    PROC_YIELD,
    PROC_CALL(TitleSprite_Init),
    PROC_REPEAT(TitleSprite_Loop),
    PROC_END,
};

void TitleSprite_Init(struct ProcTitleSpriteCtrl * proc)
{
    if (proc->mode != 0)
    {
        SetBlendAlpha(0, 0x10);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendTargetB(1, 1, 1, 1, 1);
        SetBlendBackdropA(0);
        SetBlendBackdropB(1);
    }

    proc->timer = 0;
}

void TitleSprite_Loop(struct ProcTitleSpriteCtrl * proc)
{
    int diff, x, y, pa;

    proc->timer++;

    if (proc->callback)
        proc->callback(proc);

    if (proc->timer >= proc->duration)
    {
        Proc_Break(proc);
        SetSpriteAnimProcParameters(proc->approc, proc->x, proc->y, -1);
        return;
    }

    diff = proc->duration - proc->timer;

    x = OAM1_X((diff * proc->x_step + proc->x * proc->timer) / proc->duration);
    y = OAM0_Y((diff * proc->y_step + proc->y * proc->timer) / proc->duration);
    pa = (proc->timer * 0x10) / proc->duration;

    switch (proc->mode) {
    case 1:
        SetBlendAlpha(pa, 0x10 - pa);
        SetSpriteAnimProcParameters(proc->approc, x, y + 0x400, -1);
        break;

    case 2:
        SetBlendAlpha(0x10 - pa, pa);
        SetSpriteAnimProcParameters(proc->approc, x, y + 0x400, -1);
        break;

    case 0:
        SetSpriteAnimProcParameters(proc->approc, x, y, -1);
        break;

    default:
        break;
    }
}

void TitleSpriteBlendIN(ProcPtr approc, int x_step, int y_step, int x, int y, int duration, ProcPtr parent)
{
    struct ProcTitleSpriteCtrl * proc = Proc_Start(ProcScr_TitleAnimSpriteCtrl, parent);

    proc->approc = approc;
    proc->x_step = x_step;
    proc->y_step = y_step;
    proc->x = x;
    proc->y = y;
    proc->duration = duration;
    proc->callback = NULL;
    proc->mode = 1;
}

void TitleSpriteBlendOUT(ProcPtr approc, int x_step, int y_step, int x, int y, int duration, void (* callback)(ProcPtr proc), ProcPtr parent)
{
    struct ProcTitleSpriteCtrl * proc = Proc_Start(ProcScr_TitleAnimSpriteCtrl, parent);

    proc->approc = approc;
    proc->x_step = x_step;
    proc->y_step = y_step;
    proc->x = x;
    proc->y = y;
    proc->callback = callback;
    proc->duration = duration;
    proc->mode = 0;
}
