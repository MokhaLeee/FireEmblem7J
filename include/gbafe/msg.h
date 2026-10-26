#pragma once

struct MsgBuffer
{
    /* 0000 */ char buffer1[0x400];
    /* 0400 */ char buffer2[0x400];
    /* 0800 */ char buffer3[0x400];
    /* 0C00 */ char buffer4[0x200];
    /* 0E00 */ char buffer5[0x100];
    /* 0F00 */ char buffer6[0x100];
};

extern struct MsgBuffer sMsgString;
extern int sActiveMsg;
extern char const * CONST_DATA gMsgTable[];

char * DecodeMsg(int id);
char * DecodeMsgInBuffer(int id, char * buffer);
char * sub_8013374(void);
char * sub_8013488(void);
