OUTPUT_ARCH(arm)
ENTRY(Init)

gNumMusicPlayers = 9;
gMaxLines = 0;

SECTIONS
{
	__ewram_overlay_beg = 0x02000000;
    __ewram_overlay_end = __ewram_overlay_beg;

    . = __ewram_overlay_beg;
    ewram_overlay_savemenu (NOLOAD) : ALIGN(4)
    {
        . = ALIGN(4); src/savemenu.o(ewram_overlay_savemenu);
    }
    /* __ewram_overlay_end = MAX(., __ewram_overlay_end); */

	. = __ewram_overlay_end;
	EWRAM (NOLOAD) :
	ALIGN(4)
	{
		. = 0x000000; gAnims = .;
		. = 0x000024; gEkrDebugUnk3 = .;
		. = 0x00005C; gpBanimModesLeft = .;
		. = 0x000060; gpBanimModesRight = .;
		. = 0x00310C; gStatScreenSt = .;
		. = 0x00323C; gBmFrameTmap0 = .;
		. = 0x00F1C8; gBanimScrLeft = .;
		. = 0x017758; Unk_02017758 = .;
		. = 0x019784; gEkrTsaBuffer = .;
		. = 0x01FAF8; gBanimDoneFlag = .;
		. = 0x01FB10; gpImgSheet = .;
		. = 0x020140;
		. = ALIGN(4); src/hardware.o(ewram_data);
		. = ALIGN(4); src/move-data.o(ewram_data);
		. = 0x026A48;
		. = ALIGN(4); src/icon.o(ewram_data);
		. = 0x028D68; gActiveFont = .;
		. = 0x028E6C; sAnimPool = .;
		. = 0x029C7C; sFirstAnim = .;
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

		. = 0x03A3D4;
		. = ALIGN(4); src/battle.o(ewram_data);

		. = 0x03A7F0; gArenaSt = .;
		. = 0x03A858; gActionSt = .;
		. = 0x03DFEC; Unk_0203DFEC = .;
		. = 0x03E004; gEkrDistanceType = .;
		. = 0x03E00E; gAnimRoundData = .;
		. = 0x03E036; gEfxPairHpBufOffset = .;
		. = 0x03E03A; gEfxHpLut = .;
		. = 0x03E06C; gpEkrBattleUnitLeft = .;
		. = 0x03E070; gpEkrBattleUnitRight = .;
		. = 0x03E078; gpEkrTriangleUnits = .;
		. = 0x03E088; Unk_0203E088 = .;
		. = 0x03E090; gEkrPairHpInitial = .;
	}

	. = 0x03000000;
	IWRAM (NOLOAD) :
	ALIGN(4)
	{
		/* .bss */
		. = ALIGN(4); src/random.o(.bss);
		. = ALIGN(4); src/hardware.o(.bss);
		. = ALIGN(4); src/oam.o(.bss);
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
		. = 0x0045B0; gActiveUnit = .;
		. = 0x004750; Unk_03004750 = .;
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
		asm/proc.o(.text);
		src/icon.o(.text);
		asm/debug-text.o(.text);
		asm/text.o(.text);
		asm/anim-drv.o(.text);
		asm/sprite.o(.text);
		asm/face.o(.text);
		asm/talk.o(.text);
		asm/event.o(.text);
		asm/event-08010630.o(.text);
		asm/evt-utils.o(.text);
		asm/sprite-anim.o(.text);
		asm/game-ctrl.o(.text);
		asm/utils.o(.text);
		asm/bm.o(.text);
		asm/item.o(.text);
		src/unit.o(.text);
		asm/unit.o(.text);
		asm/map.o(.text);
		asm/mapwork.o(.text);
		asm/debug-menu.o(.text);
		asm/player-phase.o(.text);
		asm/bmfx.o(.text);
		asm/map-menu.o(.text);
		asm/faction.o(.text);
		asm/gold.o(.text);
		asm/target-sel.o(.text);
		asm/unit-sprite.o(.text);
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
		asm/uiutils.o(.text);
		asm/ui-menu.o(.text);
		asm/map-sel.o(.text);
		asm/banim-ekrbattle.o(.text);
		asm/banim-efxbattle.o(.text);
		asm/code-banim1.o(.text);
		src/banim-main.o(.text);
		asm/code.o(.text);
		src/savemenu.o(.text);
		asm/code2.o(.text);

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
		. = ALIGN(4); data/const_data3.o(.rodata)
		. = ALIGN(4); data/const_data_icon.o(.rodata)
		. = ALIGN(4); data/const_data1.o(.rodata)
		. = ALIGN(4); src/unit.o(.rodata)
		. = ALIGN(4); data/const_data2.o(.rodata)
		. = ALIGN(4); src/battle.o(.rodata)
		. = ALIGN(4); data/data1.o(.data)
		. = ALIGN(4); src/hardware.o(.data)
		. = ALIGN(4); data/data.o(.data)
		. = ALIGN(4); src/battle.o(.data)
		. = ALIGN(4); data/data2.o(.data)
	}
}
