#include "gbafe.h"

bool IsTalkLocked();
bool IsEventRunning();
void ResumeTalk();
void EndTalk();
void sub_800515C(signed char, int);
void sub_800A3A4(struct Proc*);
void StartTalkMsg(int, int, int);
void sub_8005234(int, int, int, int);
void TalkBgSync(int bits);
void SetTalkFlag(int);
void sub_800EC84(int);
void sub_8007F68(int);
int sub_8007F58(int);

void sub_8014FB0(void (*)(), int);

extern struct ProcCmd gUnk_08BFFE18;

void sub_8009F8C()
{
    SetOnHBlankA(0);
}

void sub_8009F98()
{
    sub_8014FB0(&sub_8009F8C, 1);
}

NAKEDFUNC
int sub_8009FAC(char const * str, bool isBubbleOpen)
{
    asm("\n\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sb\n\
    mov r6, r8\n\
    push {r6, r7}\n\
    sub sp, #0x24\n\
    adds r4, r0, #0\n\
    lsls r1, r1, #0x18\n\
    lsrs r1, r1, #0x18\n\
    mov r8, r1\n\
    ldr r0, _08009FE0 @ =sTalkSt\n\
    ldr r0, [r0]\n\
    movs r1, #0xf\n\
    ldrsb r1, [r0, r1]\n\
    mov sb, r1\n\
    ldrb r5, [r0, #0x11]\n\
    movs r6, #0\n\
    movs r7, #0x18\n\
_08009FCE:\n\
    ldrb r0, [r4]\n\
    cmp r0, #0x81\n\
    bls _08009FD6\n\
    b _0800A342\n\
_08009FD6:\n\
    lsls r0, r0, #2\n\
    ldr r1, _08009FE4 @ =_08009FE8\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08009FE0: .4byte sTalkSt\n\
_08009FE4: .4byte _08009FE8\n\
_08009FE8: @ jump table\n\
    .4byte _0800A1F0 @ case 0\n\
    .4byte _0800A1FA @ case 1\n\
    .4byte _0800A1FA @ case 2\n\
    .4byte _0800A206 @ case 3\n\
    .4byte _0800A202 @ case 4\n\
    .4byte _0800A202 @ case 5\n\
    .4byte _0800A202 @ case 6\n\
    .4byte _0800A202 @ case 7\n\
    .4byte _0800A20A @ case 8\n\
    .4byte _0800A20A @ case 9\n\
    .4byte _0800A20A @ case 10\n\
    .4byte _0800A20A @ case 11\n\
    .4byte _0800A20A @ case 12\n\
    .4byte _0800A20A @ case 13\n\
    .4byte _0800A20A @ case 14\n\
    .4byte _0800A20A @ case 15\n\
    .4byte _0800A210 @ case 16\n\
    .4byte _0800A22E @ case 17\n\
    .4byte _0800A234 @ case 18\n\
    .4byte _0800A234 @ case 19\n\
    .4byte _0800A234 @ case 20\n\
    .4byte _0800A234 @ case 21\n\
    .4byte _0800A202 @ case 22\n\
    .4byte _0800A202 @ case 23\n\
    .4byte _0800A23C @ case 24\n\
    .4byte _0800A23C @ case 25\n\
    .4byte _0800A23C @ case 26\n\
    .4byte _0800A23C @ case 27\n\
    .4byte _0800A202 @ case 28\n\
    .4byte _0800A342 @ case 29\n\
    .4byte _0800A342 @ case 30\n\
    .4byte _0800A342 @ case 31\n\
    .4byte _0800A342 @ case 32\n\
    .4byte _0800A342 @ case 33\n\
    .4byte _0800A342 @ case 34\n\
    .4byte _0800A342 @ case 35\n\
    .4byte _0800A342 @ case 36\n\
    .4byte _0800A342 @ case 37\n\
    .4byte _0800A342 @ case 38\n\
    .4byte _0800A342 @ case 39\n\
    .4byte _0800A342 @ case 40\n\
    .4byte _0800A342 @ case 41\n\
    .4byte _0800A342 @ case 42\n\
    .4byte _0800A342 @ case 43\n\
    .4byte _0800A342 @ case 44\n\
    .4byte _0800A342 @ case 45\n\
    .4byte _0800A342 @ case 46\n\
    .4byte _0800A342 @ case 47\n\
    .4byte _0800A342 @ case 48\n\
    .4byte _0800A342 @ case 49\n\
    .4byte _0800A342 @ case 50\n\
    .4byte _0800A342 @ case 51\n\
    .4byte _0800A342 @ case 52\n\
    .4byte _0800A342 @ case 53\n\
    .4byte _0800A342 @ case 54\n\
    .4byte _0800A342 @ case 55\n\
    .4byte _0800A342 @ case 56\n\
    .4byte _0800A342 @ case 57\n\
    .4byte _0800A342 @ case 58\n\
    .4byte _0800A342 @ case 59\n\
    .4byte _0800A342 @ case 60\n\
    .4byte _0800A342 @ case 61\n\
    .4byte _0800A342 @ case 62\n\
    .4byte _0800A342 @ case 63\n\
    .4byte _0800A342 @ case 64\n\
    .4byte _0800A342 @ case 65\n\
    .4byte _0800A342 @ case 66\n\
    .4byte _0800A342 @ case 67\n\
    .4byte _0800A342 @ case 68\n\
    .4byte _0800A342 @ case 69\n\
    .4byte _0800A342 @ case 70\n\
    .4byte _0800A342 @ case 71\n\
    .4byte _0800A342 @ case 72\n\
    .4byte _0800A342 @ case 73\n\
    .4byte _0800A342 @ case 74\n\
    .4byte _0800A342 @ case 75\n\
    .4byte _0800A342 @ case 76\n\
    .4byte _0800A342 @ case 77\n\
    .4byte _0800A342 @ case 78\n\
    .4byte _0800A342 @ case 79\n\
    .4byte _0800A342 @ case 80\n\
    .4byte _0800A342 @ case 81\n\
    .4byte _0800A342 @ case 82\n\
    .4byte _0800A342 @ case 83\n\
    .4byte _0800A342 @ case 84\n\
    .4byte _0800A342 @ case 85\n\
    .4byte _0800A342 @ case 86\n\
    .4byte _0800A342 @ case 87\n\
    .4byte _0800A342 @ case 88\n\
    .4byte _0800A342 @ case 89\n\
    .4byte _0800A342 @ case 90\n\
    .4byte _0800A342 @ case 91\n\
    .4byte _0800A342 @ case 92\n\
    .4byte _0800A342 @ case 93\n\
    .4byte _0800A342 @ case 94\n\
    .4byte _0800A342 @ case 95\n\
    .4byte _0800A342 @ case 96\n\
    .4byte _0800A342 @ case 97\n\
    .4byte _0800A342 @ case 98\n\
    .4byte _0800A342 @ case 99\n\
    .4byte _0800A342 @ case 100\n\
    .4byte _0800A342 @ case 101\n\
    .4byte _0800A342 @ case 102\n\
    .4byte _0800A342 @ case 103\n\
    .4byte _0800A342 @ case 104\n\
    .4byte _0800A342 @ case 105\n\
    .4byte _0800A342 @ case 106\n\
    .4byte _0800A342 @ case 107\n\
    .4byte _0800A342 @ case 108\n\
    .4byte _0800A342 @ case 109\n\
    .4byte _0800A342 @ case 110\n\
    .4byte _0800A342 @ case 111\n\
    .4byte _0800A342 @ case 112\n\
    .4byte _0800A342 @ case 113\n\
    .4byte _0800A342 @ case 114\n\
    .4byte _0800A342 @ case 115\n\
    .4byte _0800A342 @ case 116\n\
    .4byte _0800A342 @ case 117\n\
    .4byte _0800A342 @ case 118\n\
    .4byte _0800A342 @ case 119\n\
    .4byte _0800A342 @ case 120\n\
    .4byte _0800A342 @ case 121\n\
    .4byte _0800A342 @ case 122\n\
    .4byte _0800A342 @ case 123\n\
    .4byte _0800A342 @ case 124\n\
    .4byte _0800A342 @ case 125\n\
    .4byte _0800A342 @ case 126\n\
    .4byte _0800A342 @ case 127\n\
    .4byte _0800A240 @ case 128\n\
    .4byte _0800A336 @ case 129\n\
_0800A1F0:\n\
    cmp r6, r7\n\
    bgt _0800A1F6\n\
    b _0800A368\n\
_0800A1F6:\n\
    adds r7, r6, #0\n\
    b _0800A368\n\
_0800A1FA:\n\
    cmp r6, r7\n\
    ble _0800A200\n\
    adds r7, r6, #0\n\
_0800A200:\n\
    movs r6, #0\n\
_0800A202:\n\
    adds r4, #1\n\
    b _08009FCE\n\
_0800A206:\n\
    adds r6, #0xc\n\
    b _0800A202\n\
_0800A20A:\n\
    ldrb r5, [r4]\n\
    subs r5, #8\n\
    b _0800A202\n\
_0800A210:\n\
    ldrb r0, [r4]\n\
    cmp r0, #8\n\
    bge _0800A218\n\
    b _08009FCE\n\
_0800A218:\n\
    cmp r0, #0xf\n\
    ble _0800A222\n\
    cmp r0, #0x10\n\
    beq _0800A22A\n\
    b _08009FCE\n\
_0800A222:\n\
    adds r5, r0, #0\n\
    subs r5, #8\n\
    adds r4, #1\n\
    b _0800A210\n\
_0800A22A:\n\
    adds r4, #3\n\
    b _0800A210\n\
_0800A22E:\n\
    cmp r5, sb\n\
    beq _0800A1F0\n\
    b _0800A202\n\
_0800A234:\n\
    mov r2, r8\n\
    cmp r2, #0\n\
    beq _0800A1F0\n\
    b _0800A202\n\
_0800A23C:\n\
    adds r6, #0x80\n\
    b _0800A202\n\
_0800A240:\n\
    adds r4, #1\n\
    ldrb r0, [r4]\n\
    cmp r0, #0x25\n\
    bls _0800A24A\n\
    b _08009FCE\n\
_0800A24A:\n\
    lsls r0, r0, #2\n\
    ldr r1, _0800A254 @ =_0800A258\n\
    adds r0, r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_0800A254: .4byte _0800A258\n\
_0800A258: @ jump table\n\
    .4byte _0800A202 @ case 0\n\
    .4byte _0800A202 @ case 1\n\
    .4byte _0800A202 @ case 2\n\
    .4byte _0800A202 @ case 3\n\
    .4byte _0800A202 @ case 4\n\
    .4byte _0800A2F0 @ case 5\n\
    .4byte _0800A316 @ case 6\n\
    .4byte _0800A202 @ case 7\n\
    .4byte _0800A202 @ case 8\n\
    .4byte _0800A202 @ case 9\n\
    .4byte _0800A330 @ case 10\n\
    .4byte _0800A330 @ case 11\n\
    .4byte _0800A330 @ case 12\n\
    .4byte _0800A330 @ case 13\n\
    .4byte _0800A330 @ case 14\n\
    .4byte _0800A330 @ case 15\n\
    .4byte _0800A330 @ case 16\n\
    .4byte _0800A330 @ case 17\n\
    .4byte _08009FCE @ case 18\n\
    .4byte _08009FCE @ case 19\n\
    .4byte _08009FCE @ case 20\n\
    .4byte _08009FCE @ case 21\n\
    .4byte _0800A202 @ case 22\n\
    .4byte _0800A202 @ case 23\n\
    .4byte _0800A202 @ case 24\n\
    .4byte _0800A202 @ case 25\n\
    .4byte _0800A202 @ case 26\n\
    .4byte _0800A202 @ case 27\n\
    .4byte _0800A202 @ case 28\n\
    .4byte _0800A202 @ case 29\n\
    .4byte _0800A202 @ case 30\n\
    .4byte _0800A202 @ case 31\n\
    .4byte _0800A30C @ case 32\n\
    .4byte _0800A202 @ case 33\n\
    .4byte _08009FCE @ case 34\n\
    .4byte _08009FCE @ case 35\n\
    .4byte _0800A202 @ case 36\n\
    .4byte _0800A202 @ case 37\n\
_0800A2F0:\n\
    ldr r0, _0800A308 @ =sTalkSt\n\
    ldr r0, [r0]\n\
    ldr r0, [r0, #0x3c]\n\
    mov r1, sp\n\
    bl sub_80149EC\n\
    mov r0, r8\n\
    lsls r1, r0, #0x18\n\
    asrs r1, r1, #0x18\n\
    mov r0, sp\n\
    b _0800A322\n\
    .align 2, 0\n\
_0800A308: .4byte sTalkSt\n\
_0800A30C:\n\
    bl sub_802EBB0\n\
    bl GetStringTextLen\n\
    b _0800A326\n\
_0800A316:\n\
    ldr r0, _0800A32C @ =sTalkSt\n\
    ldr r0, [r0]\n\
    adds r0, #0x60\n\
    mov r2, r8\n\
    lsls r1, r2, #0x18\n\
    asrs r1, r1, #0x18\n\
_0800A322:\n\
    bl sub_8009FAC\n\
_0800A326:\n\
    adds r6, r6, r0\n\
    b _0800A202\n\
    .align 2, 0\n\
_0800A32C: .4byte sTalkSt\n\
_0800A330:\n\
    ldrb r5, [r4]\n\
    subs r5, #0xa\n\
    b _0800A202\n\
_0800A336:\n\
    ldrb r0, [r4, #1]\n\
    cmp r0, #0x40\n\
    bne _0800A342\n\
    adds r4, #2\n\
    adds r6, #6\n\
    b _08009FCE\n\
_0800A342:\n\
    cmp r5, sb\n\
    beq _0800A358\n\
    cmp r5, #0xff\n\
    beq _0800A358\n\
    mov r1, r8\n\
    cmp r1, #0\n\
    beq _0800A352\n\
    b _0800A1F0\n\
_0800A352:\n\
    movs r2, #1\n\
    mov r8, r2\n\
    mov sb, r5\n\
_0800A358:\n\
    add r1, sp, #0x20\n\
    adds r0, r4, #0\n\
    bl GetCharTextLen\n\
    adds r4, r0, #0\n\
    ldr r0, [sp, #0x20]\n\
    adds r6, r6, r0\n\
    b _08009FCE\n\
_0800A368:\n\
    adds r0, r7, #0\n\
    add sp, #0x24\n\
    pop {r3, r4}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    pop {r4, r5, r6, r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n\
");
}

bool sub_800A378()
{
	return Proc_Exists(&gUnk_08BFFE18);
}

void sub_800A390()
{
	Proc_Start(&gUnk_08BFFE18, (void*)3);
}

void sub_800A3A4(struct Proc* proc)
{
	proc->unk34 = 1;
}

void StartTalkDebug()
{
	DisplayBackground(0x1c);
}

void sub_800A3B8(struct Proc* proc)
{
	proc->x = 0;
	sub_800A3A4(proc);
}

void sub_800A3C8(struct Proc* proc)
{
	int x = proc->x;
	if (IsTalkLocked())
	{
		ResumeTalk();
	}

	if (IsEventRunning())
	{
		return;
	}

	if (!proc->unk34)
	{
		sub_800515C(-1, 9);
		sub_800A3A4(proc);
	}

	sub_8005234(0x70, 0x64, x, 4);

	if ((gpKeySt->pressed & 4) != 0)
	{
		Proc_Break(proc);
	}
	else
	{
		if ((gpKeySt->repeated & DPAD_UP) != 0)
		{
			x++;
		}
		if ((gpKeySt->repeated & DPAD_DOWN) != 0)
		{
			x--;
		}
		if ((gpKeySt->repeated & DPAD_RIGHT) != 0)
		{
			x += 10;
		}
		if ((gpKeySt->repeated & DPAD_LEFT) != 0)
		{
			x -= 10;
		}
		if ((gpKeySt->repeated & R_BUTTON) != 0)
		{
			x += 100;
		}
		if ((gpKeySt->repeated & L_BUTTON) != 0)
		{
			x -= 100;
		}
		if (x < 0)
		{
			x = 0;
		}

		if (x > 0x1234)
		{
			x = 0x1234;
		}

		if (x != proc->x)
		{
			ClearTalk();
			EndTalk();
			sub_800515C(-1, 9);
			proc->x = x;
			InitTalk(0x80, 2, 1);
			StartTalkMsg(1, 1, proc->x);
			SetTalkFlag(1);
			SetTalkFlag(2);
			SetTalkFlag(4);
			sub_8007F68(-1);
			TalkBgSync(1);
		}
		else
		{
			if (gpKeySt->pressed & 1)
			{
				ClearTalk();
				EndTalk();
				proc->unk34 = 0;
				sub_800EC84(proc->x);
			}
		}
	}
}

void TalkBgSync(int bits)
{
	if (!sub_8007F58(0x20))
	{
		EnableBgSync(bits);
	}
}
