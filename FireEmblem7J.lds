OUTPUT_ARCH(arm)
ENTRY(Init)

gNumMusicPlayers = 9;
gMaxLines = 0;

SECTIONS
{
	. = 0x02000000;
	EWRAM (NOLOAD) :
	ALIGN(4)
	{
		. = 0x02BBF4; gPlaySt = .;
	}

	. = 0x03000000;
	IWRAM (NOLOAD) :
	ALIGN(4)
	{
		/* .bss */
		. = ALIGN(4); src/random.o(.bss);
		. = 0x002800; gIrqFuncs = .;
		. = 0x003870; IntrMainRam = .;
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
		asm/code.o(.text);
		asm/evt-utils.o(.text);
		asm/sprite-anim.o(.text);
		asm/game-ctrl.o(.text);
		asm/utils.o(.text);
		asm/bm.o(.text);
		asm/item.o(.text);
		src/unit.o(.text);
		asm/unit.o(.text);
		asm/fe7.o(.text);

		/* .data & .rodata */
		. = ALIGN(4); data/const_data.o(.rodata)
		. = 0x0C0C78; src/irq.o(.rodata)
		. = ALIGN(4); src/random.o(.rodata);
		. = ALIGN(4); data/data.o(.data)
	}
}
