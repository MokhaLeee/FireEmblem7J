OUTPUT_ARCH(arm)
ENTRY(Init)

gNumMusicPlayers = 9;
gMaxLines = 0;

SECTIONS
{
	__ewram_overlay_beg = 0x02000000;
    __ewram_overlay_end = __ewram_overlay_beg;

	. = __ewram_overlay_beg;
    ewram_overlay_0 (NOLOAD) : ALIGN(4)
	{
		. = 0x0000F4; gBonusClaimData = .;

		. = 0x001F70;
		. = ALIGN(4); src/bmfx-chapterintrofx.o(ewram_overlay_0);

		. = 0x00310C; gStatScreenSt = .;
		. = 0x00323C; gUiTmScratchA = .;
		. = 0x00373C; gUiTmScratchB = .;
		. = 0x003C3C; gUiTmScratchC = .;

		. = 0x01068C; src/prepscreen.o(ewram_overlay_0);
		. = 0x0116DC; gPrepUnitList = .;
	}

	. = __ewram_overlay_beg;
    ewram_overlay_gamestart (NOLOAD) : ALIGN(4)
	{
		. = 0x000000;
		. = ALIGN(4); src/titlescreen.o(ewram_overlay_gamestart);

		. = 0x007014;
		. = ALIGN(4); src/opanim_scanline.o(ewram_overlay_gamestart);
		. = 0x007508; gUnkOpAnim_02007508 = .;
	}

    . = __ewram_overlay_beg;
    ewram_overlay_savemenu (NOLOAD) : ALIGN(4)
    {
        . = ALIGN(4); src/savemenu.o(ewram_overlay_savemenu);
		. = 0x0000A4; gUnk_020000A4 = .;
		. = 0x01E8D4; gUnk_0201E8D4 = .;
		. = 0x01E97C; gUnk_0201E97C = .;
		. = 0x01E9F4; gUnk_0201E9F4 = .;
    }
    __ewram_overlay_end = MAX(., __ewram_overlay_end);

	. = __ewram_overlay_beg;
    ewram_overlay_banim (NOLOAD) : ALIGN(4)
    {
		. = 0x000000; gAnims = .;
		. = 0x000024; gAnimC01Blocking = .;
		. = 0x000028; gEkrXPosReal = .;
		. = 0x00002C; gEkrYPosReal = .;
		. = 0x000030; gEkrXPosBase = .;
		. = 0x000034; gEkrYPosBase = .;
		. = 0x000038; gEkrBg0QuakeVec = .;
		. = 0x000054; gpEfxUnitPaletteBackup = .;
		. = 0x00005C; gpBanimModesLeft = .;
		. = 0x000060; gpBanimModesRight = .;
		. = 0x00006C; gpProcEkrDispUP = .;
		. = 0x004088; gBanimPaletteLeft = .;
		. = 0x004128; gBanimPaletteRight = .;
		. = 0x0041C8; gBanimOaml = .;
		. = 0x0099C8; gBanimOamr2 = .;
		. = 0x00F1C8; gBanimScrLeft = .;
		. = 0x011BC8; gBanimScrRight = .;
		. = 0x0165C8; gEfxPal = .;
		. = 0x017724; gEkrBattleEndFlag = .;
		. = 0x017728; gEkrHpBarCount = .;
		. = 0x01772C; gEfxSpellAnimExists = .;
		. = 0x017744; gEkrInitPosReal = .;
		. = 0x01774C; gEfxBgSemaphore = .;
		. = 0x017758; Unk_02017758 = .;
		. = 0x017760; gEkrBg2QuakeVec = .;
		. = 0x01776C; gpProcEfxStatusUnits = .;
		. = 0x017774; gpProcEfxWeaponIcon = .;
		. = 0x017778; gpProcEfxSpellCast = .;
		. = 0x01777C; gpProcEfxHpBarColorChange = .;
		. = 0x017780; gEkrHitEfxBool = .;
		. = 0x019784; gEkrTsaBuffer = .;
		. = 0x01D41C; gEfxFrameTmap = .;
		. = 0x01FAD0; EkrMainMiniConf_0201FAD0 = .;
		. = 0x01FAF8; gBanimDoneFlag = .;
		. = 0x01FB00; gEkrBgPosition = .;
		. = 0x01FB10; gpImgSheet = .;
		. = 0x01FB20; gEkrBg2ScrollFlip = .;
		. = 0x01FB24; gpBg2ScrollOffsetStart = .;
		. = 0x01FB28; gpBg2ScrollOffset = .;
		. = 0x01FB2C; gpBg2ScrollOffsetTable2 = .;
		. = 0x01FC6C; gpBg2ScrollOffsetTable1 = .;
		. = 0x01FDAC; gEkrBg1ScrollFlip = .;
		. = 0x01FDB0; gpBg1ScrollOffsetStart = .;
		. = 0x01FDB4; gpBg1ScrollOffset = .;
		. = 0x01FDB8; gpBg1ScrollOffsetList2 = .;
		. = 0x01FEF8; gpBg1ScrollOffsetList1 = .;
		. = 0x020040; gEkrDragonStatusLeft = .;
		. = 0x020050; gEkrDragonStatusRight = .;
		. = 0x020060; gEkrBgPaletteBackup = .;
		. = 0x0200D0; gpProcEfxPartsofScroll = .;
		. = 0x0200D4; gpProcEfxleveluphb = .;
		. = 0x02012C; gEkrLvupScrollPos1 = .;
		. = 0x02012E; gEkrLvupScrollPos2 = .;
    }
    __ewram_overlay_end = MAX(., __ewram_overlay_end);

	. = __ewram_overlay_beg;
	EWRAM (NOLOAD) :
	ALIGN(4)
	{
		. = 0x020140;
		. = ALIGN(4); src/hardware.o(ewram_data);
		. = ALIGN(4); src/move-data.o(ewram_data);
		. = 0x024E20; Unk_02024E20 = .;
		. = 0x026920; Unk_02026920 = .;
		. = 0x026A24; Unk_02026A24 = .;
		. = 0x026A28; gProcTreeRootArray = .;
		. = 0x026A48;
		. = ALIGN(4); src/icon.o(ewram_data);
		. = 0x028D68; gActiveFont = .;
		. = 0x028E6C;
		. = ALIGN(4); src/anime.o(ewram_data);
		. = ALIGN(4); src/sprite.o(ewram_data);
		. = 0x02A580; gFaceConfig = .;
		. = 0x02BBB4; gBmSt = .;
		. = 0x02BBF4; gPlaySt = .;
		. = 0x02BD44; gActiveUnitId = .;
		. = 0x02BD48; gActiveUnitMoveOrigin = .;
		. = 0x02BD4C; gUnitArrayBlue = .;
		. = 0x02CEBC; gUnitArrayRed = .;
		. = 0x02DCCC; gUnitArrayGreen = .;
		. = 0x02E26C; gUnitArrayPurple = .;
		. = 0x02E3D4; gBmMapSize = .;
		. = 0x02E3D8; gBmMapUnit = .;
		. = 0x02E3DC; gBmMapTerrain = .;
		. = 0x02E3E0; gBmMapMovement = .;
		. = 0x02E3E4; gBmMapRange = .;
		. = 0x02E3E8; gBmMapFog = .;
		. = 0x02E3EC; gBmMapHidden = .;
		. = 0x02E3F0; gBmMapOther = .;
		. = 0x033DFC; gWorkingMoveScr = .;
		. = 0x033E40; gUnitSpriteSlots = .;
		. = 0x039F10; gUnitSpriteSmallAllocCount = .;
		. = 0x039F14; gUnitSpriteLargeAllocCount = .;
		. = 0x039F18; gUnitSprites = .;
		. = 0x03A3CC; gUnitSpriteSyncRequest = .;

		. = 0x03A3D4;
		. = ALIGN(4); src/battle.o(ewram_data);

		. = 0x03A7F0; gArenaSt = .;
		. = 0x03A858; gActionSt = .;
		. = 0x03DFE0; gEkrDebugModeMaybe = .;
		. = 0x03DFE4; gEkrInitialHitSide = .;
		. = 0x03DFE8; gBanimValid = .;
		. = 0x03DFEC; Unk_0203DFEC = .;
		. = 0x03DFF4; gBanimUniquePal = .;
		. = 0x03DFF8; gBanimFactionPal = .;
		. = 0x03DFFC; gEkrSpellAnimIndex = .;
		. = 0x03E004; gEkrDistanceType = .;
		. = 0x03E00E; gAnimRoundData = .;
		. = 0x03E036; gEfxPairHpBufOffset = .;
		. = 0x03E03A; gEfxHpLut = .;
		. = 0x03E066; gBanimIdx = .;
		. = 0x03E06C; gpEkrBattleUnitLeft = .;
		. = 0x03E070; gpEkrBattleUnitRight = .;
		. = 0x03E074; gEkrPids = .;
		. = 0x03E078; gpEkrTriangleUnits = .;
		. = 0x03E080; gBanimTriAtkPalettes = .;
		. = 0x03E088; Unk_0203E088 = .;
		. = 0x03E090; gEkrPairHpInitial = .;
		. = 0x03E0A8; gEkrPairExpPrevious = .;
		. = 0x03E0AC; gEkrPairExpGain = .;
		. = 0x03E0C0; gBanimUniquePaletteDisabled = .;
		. = 0x03E0D4; gManimSt = .;
		. = 0x03E138; src/scanline.o(ewram_data);
		. = 0x03E648;
		. = ALIGN(4); src/statscreen.o(ewram_data);
		. = ALIGN(4); src/statscreen-helpbox.o(ewram_data);
		. = ALIGN(4); src/chapter-title.o(ewram_data);
		. = 0x03E760;
		. = ALIGN(4); src/prepscreen.o(ewram_data);
		. = 0x03E772; gIsSramWorking = .;
		. = 0x03EE28; gExtraMapSaveHead = .;
	}

	. = 0x03000000;
	IWRAM (NOLOAD) :
	ALIGN(4)
	{
		/* .bss */
		. = ALIGN(4); src/random.o(.bss);
		. = ALIGN(4); src/hardware.o(.bss);
		. = ALIGN(4); src/oam.o(.bss);
		. = 0x000040; sTalkStObj = .;
		. = 0x0000C8; sTalkText = .;
		. = 0x0000E0; sTalkChoiceResult = .;
		. = 0x0000E8; sTalkFont = .;
		. = 0x000110;
		. = ALIGN(4); src/sprite-anim.o(.bss);
		. = 0x002778; gArenaLevelBackup = .;
		. = 0x002780; gOamLoPutIt = .;
		. = 0x002790; gDispIo = .;
		. = 0x002800; gIrqFuncs = .;
		. = 0x00283C; gOamAffinePutId = .;
		. = 0x002844; gOnHBlankA = .;
		. = 0x002850; gOam = .;
		. = 0x002E54; gOamHiPutIt = .;
		. = 0x002E58; gOnHBlankB = .;
		. = 0x003868; gOamAffinePutIt = .;
		. = 0x003870; IntrMainRam = .;
		. = 0x0040B0; gSpriteAllocIt = .;
		. = 0x0040E0; gFaces = .;
		. = 0x0045B0; gActiveUnit = .;
		. = 0x004750; Unk_03004750 = .;
		. = 0x005D90; ReadSramFast = .;
	}

	. = 0x08000000;
	ROM :
	ALIGN(4)
	{
		/* .text */
		src/crt0.o(.text);
		src/armfunc.o(.text);
		src/arm.o(.text);
		asm/main.o(.text);
		src/irq.o(.text);
		src/random.o(.text);
		src/hardware.o(.text);
		src/move-data.o(.text);
		src/oam.o(.text);
		asm/sound.o(.text);
		asm/ram-funcs.o(.text);
		src/proc.o(.text);
		src/icon.o(.text);
		asm/debug-text.o(.text);
		asm/text.o(.text);
		src/anime.o(.text);
		asm/anim-drv.o(.text);
		src/sprite.o(.text);
		src/face.o(.text);
		asm/face.o(.text);
		src/talk.o(.text);
		src/talk-advance.o(.text);
		src/event.o(.text);
		asm/event-engine.o(.text);
		src/eventscr.o(.text);
		asm/eventscr.o(.text);
		asm/event-08010630.o(.text);
		src/eventscr_snowstormfx.o(.text);
		asm/eventscr_snowstorm.o(.text);
		src/eventscr_thunderfx.o(.text);
		src/eventscr_niniandisp.o(.text);
		src/eventscr_screenflashfx.o(.text);
		src/eventscr_fadefx.o(.text);
		src/eventscr_spriteanim.o(.text);
		asm/eventscr_08012378.o(.text);
		src/sprite-anim.o(.text);
		asm/game-ctrl.o(.text);
		asm/utils.o(.text);
		src/bm.o(.text);
		asm/bm.o(.text);
		asm/item.o(.text);
		src/unit.o(.text);
		asm/map.o(.text);
		asm/mapwork.o(.text);
		asm/debug-menu.o(.text);
		asm/player-phase.o(.text);
		asm/bmfx.o(.text);
		src/bmfx-chapterintrofx.o(.text);
		asm/bmfx_08020508.o(.text);
		src/bmfx-swingsword.o(.text);
		src/bmfx-minefx.o(.text);
		src/bmfx-niniantransform.o(.text);
		asm/map-menu.o(.text);
		src/faction.o(.text);
		src/gold.o(.text);
		asm/target-sel.o(.text);
		asm/unit-sprite.o(.text);
		src/support.o(.text);
		asm/support.o(.text);
		asm/item-use.o(.text);
		src/battle.o(.text);
		asm/trade-menu.o(.text);
		asm/trap.o(.text);
		asm/item-action.o(.text);
		asm/bmio.o(.text);

		asm/code1.o(.text);
		asm/code-ai.o(.text);
		asm/code-sio.o(.text);
		src/ui.o(.text);
		asm/uiutils.o(.text);
		asm/ui-menu.o(.text);
		asm/map-sel.o(.text);
		asm/banim-ekrbattle.o(.text);
		asm/banim-ekrgauge.o(.text);
		asm/banim-efxbattle.o(.text);
		asm/code-banim1.o(.text);
		src/banim-main.o(.text);
		src/banim-mainutils.o(.text);
		asm/code-banim.o(.text);
		src/banim-efxdrsmmoya.o(.text);
		asm/code-banim-08064458.o(.text);
		src/banim-ekrdragon.o(.text);
		src/banim-ekrdragonfx.o(.text);
		asm/code-banim2.o(.text);
		asm/mu.o(.text);
		asm/mapanim.o(.text);
		src/scanline.o(.text);
		asm/scanline.o(.text);
		asm/eventcall.o(.text);
		src/eventcall_quakefx.o(.text);
		asm/code_807B7C8.o(.text);
		src/eventcall_dragonflamefx.o(.text);
		asm/eventcall_dragonflamefx.o(.text);
		asm/eventcall_0807C66C.o(.text);
		src/quintessence-fx.o(.text);
		src/eventcall_unittornout.o(.text);
		src/eventcall_flamebreath.o(.text);
		asm/eventcall_flamebreath.o(.text);
		src/eventcall_icecrystal.o(.text);
		asm/eventcallfx.o(.text);
		src/eventcall_firedragonsprite.o(.text);
		asm/code_0807F9EC.o(.text);
		src/statscreenfx.o(.text);
		src/statscreen-util.o(.text);
		asm/statscreen-util.o(.text);
		src/statscreen.o(.text);
		src/statscreen-helpbox.o(.text);
		src/chapter-title.o(.text);
		asm/helpbox.o(.text);
		asm/mapui.o(.text);
		asm/sioerror.o(.text);
		asm/chapter-status.o(.text);
		asm/cgtext.o(.text);
		asm/unitlistscreen.o(.text);
		src/prepscreen.o(.text);
		asm/prepscreen.o(.text);
		src/prep_atmenu.o(.text);
		asm/prep_atmenu.o(.text);
		src/prepscreenfx.o(.text);
		src/prep_menu.o(.text);
		asm/prep.o(.text);
		src/save_core.o(.text);
		asm/save.o(.text);
		src/savemenu.o(.text);
		asm/savemenu.o(.text);
		src/savedraw.o(.text);
		asm/savedraw.o(.text);
		src/savedrawfx.o(.text);
		asm/savedrawfx.o(.text);
		asm/savemenu_difficulty.o(.text);
		src/savemenu_modeselect.o(.text);
		src/scrolling_util.o(.text);
		asm/cursor_hand.o(.text);
		asm/spinning_arrow.o(.text);
		src/sysutil.o(.text);
		asm/code_080AB6FC.o(.text);
		src/lord-select.o(.text);
		asm/code_080AFE38.o(.text);
		src/titlescreen.o(.text);
		src/opanim_scanline.o(.text);
		asm/opanim_scanline.o(.text);
		src/opanim.o(.text);
		asm/opanim.o(.text);

		asm/m4a_1.o(.text);
		asm/m4a.o(.text);
		asm/gba-syscall.o(.text);
		asm/agb-sram.o(.text);
		*libgcc.a:_ashldi3.o(.text);
		*libgcc.a:_call_via_rX.o(.text);
		*libgcc.a:_divsi3.o(.text);
		*libgcc.a:_dvmd_tls.o(.text);
		*libgcc.a:_modsi3.o(.text);
		*libgcc.a:_muldi3.o(.text);
		*libgcc.a:_udivsi3.o(.text);
		*libgcc.a:_umodsi3.o(.text);
		*libc.a:memcpy.o(.text);
		*libc.a:memset.o(.text);
		*libc.a:strcpy.o(.text);
		*libc.a:strlen.o(.text);
		src/arm-call.o(.text);

		/* .data & .rodata */
		. = ALIGN(4); data/const_data.o(.rodata)
		. = ALIGN(4); src/irq.o(.rodata)
		. = ALIGN(4); src/random.o(.rodata)
		. = ALIGN(4); src/hardware.o(.rodata)
		. = ALIGN(4); src/move-data.o(.rodata)
		. = ALIGN(4); src/oam.o(.rodata)
		. = ALIGN(4); data/const_data_080C1170.o(.rodata)
		. = ALIGN(4); data/const_data_icon.o(.rodata)
		. = ALIGN(4); data/const_data_080C7334.o(.rodata)
		. = ALIGN(4); src/face.o(.rodata)
		. = ALIGN(4); src/talk.o(.rodata)
		. = ALIGN(4); data/const_data_0818F93C.o(.rodata)
		. = ALIGN(4); data/EventCallfx_SpriteAnim_SpawnAssassin.o(.rodata)
		. = ALIGN(4); data/EventCallfx_SpriteAnim_SpawnAssassinAp.o(.rodata)
		. = ALIGN(4); data/const_data_081C83E8.o(.rodata)
		. = ALIGN(4); src/unit.o(.rodata)
		. = ALIGN(4); data/const_data_081C9238.o(.rodata)
		. = ALIGN(4); src/bmfx-swingsword.o(.rodata)
		. = ALIGN(4); data/const_data_081C9474.o(.rodata)
		. = ALIGN(4); src/battle.o(.rodata)
		. = ALIGN(4); data/const_data_081C94C8.o(.rodata)
		. = ALIGN(4); src/banim-mainutils.o(.rodata)
		. = ALIGN(4); data/const_data_banimekrmain.o(.rodata)
		. = ALIGN(4); src/banim-efxdrsmmoya.o(.rodata)
		. = ALIGN(4); data/const_data_081EF4AC.o(.rodata)
		. = ALIGN(4); data/const_data_ekrdragon.o(.rodata)
		. = ALIGN(4); data/const_data_082EB740.o(.rodata)
		. = ALIGN(4); src/eventcall_flamebreath.o(.rodata)
		. = ALIGN(4); data/const_data_084033A0.o(.rodata)
		. = ALIGN(4); src/eventcall_firedragonsprite.o(.rodata)
		. = ALIGN(4); data/const_data_0840343C.o(.rodata)
		. = ALIGN(4); data/statscreenfx-const.o(.rodata)
		. = ALIGN(4); src/statscreenfx.o(.rodata)
		. = ALIGN(4); src/statscreen-util.o(.rodata)
		. = ALIGN(4); src/statscreen.o(.rodata)
		. = ALIGN(4); data/const_data_0841CD8C.o(.rodata)
		. = ALIGN(4); src/prepscreen.o(.rodata)
		. = ALIGN(4); src/prep_atmenu.o(.rodata)
		. = ALIGN(4); data/const_prepscreen.o(.rodata)
		. = ALIGN(4); src/save_core.o(.rodata)
		. = ALIGN(4); data/const_data_0842D270.o(.rodata)
		. = ALIGN(4); src/savemenu_modeselect.o(.rodata)
		. = ALIGN(4); src/sysutil.o(.rodata)
		. = ALIGN(4); data/data_0843943C.o(.data)
		. = ALIGN(4); src/titlescreen.o(.rodata)
		. = ALIGN(4); data/const_data_086C44EC.o(.rodata)
		/* . = ALIGN(4); src/msg_data.o(.rodata) */
		. = ALIGN(4); data/const_data_msg.o(.rodata)
		. = ALIGN(4); data/const_data_main.o(.rodata)
		. = ALIGN(4); src/hardware.o(.data)
		. = ALIGN(4); data/sound.o(.data)
		. = ALIGN(4); src/proc.o(.data)
		. = ALIGN(4); data/data_08BBFD90.o(.data)
		. = ALIGN(4); src/sprite.o(.data)
		. = ALIGN(4); src/face.o(.data)
		. = ALIGN(4); data/data_08BFFB20.o(.data)
		. = ALIGN(4); src/talk-advance.o(.data)
		. = ALIGN(4); src/event.o(.data)
		. = ALIGN(4); data/data_event.o(.data)
		. = ALIGN(4); src/eventscr_snowstormfx.o(.data)
		. = ALIGN(4); data/data_08C012BC.o(.data)
		. = ALIGN(4); src/eventscr_thunderfx.o(.data)
		. = ALIGN(4); src/eventscr_niniandisp.o(.data)
		. = ALIGN(4); src/eventscr_screenflashfx.o(.data)
		. = ALIGN(4); src/eventscr_fadefx.o(.data)
		. = ALIGN(4); src/eventscr_spriteanim.o(.data)
		. = ALIGN(4); src/sprite-anim.o(.data)
		. = ALIGN(4); data/gamecontrol.o(.data)
		. = ALIGN(4); data/data.o(.data)
		. = ALIGN(4); data/data_08C01FE4.o(.data)
		. = ALIGN(4); src/bmfx-chapterintrofx.o(.data)
		. = ALIGN(4); data/data_08C02D98.o(.data)
		. = ALIGN(4); src/bmfx-swingsword.o(.data)
		. = ALIGN(4); src/bmfx-minefx.o(.data)
		. = ALIGN(4); src/bmfx-niniantransform.o(.data)
		. = ALIGN(4); data/data_08C03060.o(.data)
		. = ALIGN(4); src/battle.o(.data)
		. = ALIGN(4); data/data_08C03574.o(.data)
		. = ALIGN(4); data/data_ai.o(.data)
		. = ALIGN(4); src/banim-mainutils.o(.data)
		. = ALIGN(4); data/data_banim.o(.data)
		. = ALIGN(4); src/banim-efxdrsmmoya.o(.data)
		. = ALIGN(4); data/data_08C13A64.o(.data)
		. = ALIGN(4); src/banim-ekrdragon.o(.data)
		. = ALIGN(4); src/banim-ekrdragonfx.o(.data)
		. = ALIGN(4); src/banim-ekrdragonfx-data.o(.data)
		. = ALIGN(4); data/data_08C486EC.o(.data)
		. = ALIGN(4); src/eventcall_quakefx.o(.data)
		. = ALIGN(4); data/data_08D6F834.o(.data)
		. = ALIGN(4); src/eventcall_dragonflamefx.o(.data)
		. = ALIGN(4); asm/eventcall_dragonflamefx.o(.data)
		. = ALIGN(4); asm/eventcall_0807C66C.o(.data)
		. = ALIGN(4); src/quintessence-fx.o(.data)
		. = ALIGN(4); src/eventcall_unittornout.o(.data)
		. = ALIGN(4); src/eventcall_flamebreath.o(.data)
		. = ALIGN(4); src/eventcall_icecrystal.o(.data)
		. = ALIGN(4); data/spriteanimfx.o(.data)
		. = ALIGN(4); data/data_eventcall.o(.data)
		. = ALIGN(4); src/eventcall_data_08D83828.o(.data)
		. = ALIGN(4); data/data_eventcall_08D83828.o(.data)
		. = ALIGN(4); src/eventcall_firedragonsprite.o(.data)
		. = ALIGN(4); data/data_08D7C3BC.o(.data)
		. = ALIGN(4); src/statscreenfx.o(.data)
		. = ALIGN(4); src/statscreen-util.o(.data)
		. = ALIGN(4); src/statscreen.o(.data)
		. = ALIGN(4); src/statscreen-helpbox.o(.data)
		. = ALIGN(4); data/data_08D8A368.o(.data)
		. = ALIGN(4); src/prepscreen.o(.data)
		. = ALIGN(4); src/prep_atmenu.o(.data)
		. = ALIGN(4); src/prepscreenfx.o(.data)
		. = ALIGN(4); src/prep_menu.o(.data)
		. = ALIGN(4); data/prepscreen.o(.data)
		. = ALIGN(4); src/save_core.o(.data)
		. = ALIGN(4); data/data_08DAD284.o(.data)
		. = ALIGN(4); src/savemenu.o(.data)
		. = ALIGN(4); data/savemenu.o(.data)
		. = ALIGN(4); src/savedrawfx.o(.data)
		. = ALIGN(4); data/savedrawfx.o(.data)
		. = ALIGN(4); src/savemenu_modeselect.o(.data)
		. = ALIGN(4); data/cursor_hand.o(.data)
		. = ALIGN(4); src/sysutil.o(.data)
		. = ALIGN(4); data/data_08DAE4C4.o(.data)
		. = ALIGN(4); src/lord-select.o(.data)
		. = ALIGN(4); data/data_08DAF6B4.o(.data)
		. = ALIGN(4); src/titlescreen.o(.data)
		. = ALIGN(4); data/data_op.o(.data)
		. = ALIGN(4); src/opanim.o(.data)
		. = ALIGN(4); data/data_op2.o(.data)
		. = ALIGN(4); src/bmbgfx_data.o(.data)
		. = ALIGN(4); data/data_08DBAD14.o(.data)
	}
}
