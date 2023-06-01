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

	}

	. = 0x03000000;
	IWRAM (NOLOAD) :
	ALIGN(4)
	{
	
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
		asm/irq.o(.text);
		asm/random.o(.text);
		asm/code.o(.text);
		asm/unit.o(.text);
		asm/fe7.o(.text);

		/* .data & .rodata */
		. = ALIGN(4); data/fe7.o(.data)
	}
}
