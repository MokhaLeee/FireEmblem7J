#include "gbafe.h"

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
    PROC_REPEAT(sub_80BB29C),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_CALL(sub_80BB3EC),
    PROC_REPEAT(sub_80BB46C),
    PROC_CALL(sub_80BB510),
PROC_LABEL(1),
    PROC_REPEAT(Title_IDLE),
PROC_LABEL(2),
    PROC_CALL(sub_8014690),
    PROC_YIELD,
    PROC_CALL(sub_80BB5B0),
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

#if NONMATCHING
void Title_InitSpriteAnim(struct ProcTitle * proc, bool anim_en)
{
    register int  x asm("r8");
    register int _x asm("r4");
    const u16 * ap_scr;

    _x = 0;
    if (!anim_en)
        _x = 0x100;

    ApplyPalettes(Pal_TitleSprites, 0x10, 5);
    Decompress(Img_TitleSprites, OBJ_VRAM0);

    ap_scr = SpirteAnim_TitleScreen;
    x = _x + 0x78;

    proc->approc1 = StartSpriteAnimProc(ap_scr, x, 0x48, 0x800, 0, 0xA);
    proc->approc2 = StartSpriteAnimProc(ap_scr, x, 0x48, 0x400, 1, 0xA);
    proc->approc3 = StartSpriteAnimProc(ap_scr, x, 0x30, 0x400, 3, 0xA);
    proc->approc4 = StartSpriteAnimProc(ap_scr, x, 0x80, 0x400, 4, 0xA);
    proc->approc5 = StartSpriteAnimProc(ap_scr, x, 0x68, 0x400, 5, 0xA);
    proc->approc6 = StartSpriteAnimProc(ap_scr, x, 0x90, 0x400, 6, 0xA);
}
#else
NAKEDFUNC
void Title_InitSpriteAnim(struct ProcTitle * proc, bool anim_en)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    sub sp, #8\n\
    adds r7, r0, #0\n\
    lsls r1, r1, #0x18\n\
    movs r4, #0\n\
    cmp r1, #0\n\
    bne _080BAF4A\n\
    movs r4, #0x80\n\
    lsls r4, r4, #1\n\
_080BAF4A:\n\
    ldr r0, _080BAFF0 @ =Pal_TitleSprites\n\
    movs r1, #0x80\n\
    lsls r1, r1, #2\n\
    movs r2, #0xa0\n\
    bl ApplyPaletteExt\n\
    ldr r0, _080BAFF4 @ =Img_TitleSprites\n\
    ldr r1, _080BAFF8 @ =0x06010000\n\
    bl Decompress\n\
    ldr r6, _080BAFFC @ =SpirteAnim_TitleScreen\n\
    adds r4, #0x78\n\
    mov r8, r4\n\
    movs r3, #0x80\n\
    lsls r3, r3, #4\n\
    movs r0, #0\n\
    str r0, [sp]\n\
    movs r4, #0xa\n\
    str r4, [sp, #4]\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    movs r2, #0x48\n\
    bl StartSpriteAnimProc\n\
    str r0, [r7, #0x30]\n\
    movs r5, #0x80\n\
    lsls r5, r5, #3\n\
    movs r0, #1\n\
    str r0, [sp]\n\
    str r4, [sp, #4]\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    movs r2, #0x48\n\
    adds r3, r5, #0\n\
    bl StartSpriteAnimProc\n\
    str r0, [r7, #0x34]\n\
    movs r0, #3\n\
    str r0, [sp]\n\
    str r4, [sp, #4]\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    movs r2, #0x30\n\
    adds r3, r5, #0\n\
    bl StartSpriteAnimProc\n\
    str r0, [r7, #0x38]\n\
    movs r0, #4\n\
    str r0, [sp]\n\
    str r4, [sp, #4]\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    movs r2, #0x80\n\
    adds r3, r5, #0\n\
    bl StartSpriteAnimProc\n\
    str r0, [r7, #0x3c]\n\
    movs r0, #5\n\
    str r0, [sp]\n\
    str r4, [sp, #4]\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    movs r2, #0x68\n\
    adds r3, r5, #0\n\
    bl StartSpriteAnimProc\n\
    str r0, [r7, #0x40]\n\
    movs r0, #6\n\
    str r0, [sp]\n\
    str r4, [sp, #4]\n\
    adds r0, r6, #0\n\
    mov r1, r8\n\
    movs r2, #0x90\n\
    adds r3, r5, #0\n\
    bl StartSpriteAnimProc\n\
    str r0, [r7, #0x44]\n\
    add sp, #8\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080BAFF0: .4byte Pal_TitleSprites\n\
_080BAFF4: .4byte Img_TitleSprites\n\
_080BAFF8: .4byte 0x06010000\n\
_080BAFFC: .4byte SpirteAnim_TitleScreen\n\
    .syntax divided\n\
");
}
#endif

void Title_InitBg(struct ProcTitle * proc)
{
    ApplyPalette(Pal_Title_086B73E0, 0xF);
    Decompress(Img_Title_086B7400, (void *)BG_VRAM + 0x8000);
    TmApplyTsa(gBg3Tm, Tsa_Title_086BB234, 0xF000);

    ApplyPalette(Pal_Title_086BB6E8, 0xE);
    Decompress(Img_Title_086BB708, (void *)BG_VRAM + 0xCC00);
    TmApplyTsa(gBg2Tm + TM_OFFSET(0, 1), Tsa_Title_086BBF90, 0xE260);

    ApplyPalette(Pal_Title_086B6E70, 0xD);
    Decompress(Img_Title_086B6E90, (void *)BG_VRAM + 0xDE00);
    TmApplyTsa(gBg1Tm, Tsa_Title_086B7184, 0xD2F0);
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

    proc->unk_54 = 0;
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

void sub_80BB29C(struct ProcTitle * proc)
{
    u8 tmp;

    if (proc->timer == 8)
        SetTitleScreenAnimParamSync(proc->approc2, 0x78, 0x38, 0x78, 0x48, 0x10, proc);

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

            sub_80BDC2C(NULL, Pal_Title_086BB6E8, 0xE, 0x20, proc);
        }

        SetBlendAlpha(pa, 0x10 - pa);
        SetBgOffset(BG_2, 0, ((proc->timer - 0x30) >> 1) - 0x10);
    }

    if (proc->timer == 0x28)
        sub_80BBAA4(proc->approc1, 0, 0, 0x78, 0x48, 0x10, 0, proc);

    if (proc->timer == 0x50)
        SetTitleScreenAnimParamSync(proc->approc5, 0x78, 0x78, 0x78, 0x68, 0x10, proc);

    proc->timer++;
    if (proc->timer == 0x64)
        Proc_Break(proc);
}

void sub_80BB3EC(struct ProcTitle * proc)
{
    proc->timer = 0;
    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetDispEnable(1, 0, 1, 1, 1);
    SetBlendBackdropB(1);
}
