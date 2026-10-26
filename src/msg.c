#include "gbafe.h"

EWRAM_DATA struct MsgBuffer sMsgString = {};
EWRAM_DATA int sActiveMsg = 0;

char * DecodeMsg(int id)
{
    if (id == sActiveMsg)
        return sMsgString.buffer1;

    DecodeStringRam(gMsgTable[id], sMsgString.buffer1);
    sActiveMsg = id;

    return sMsgString.buffer1;
}

char * DecodeMsgInBuffer(int id, char * buffer)
{
    DecodeStringRam(gMsgTable[id], buffer);
    return buffer;
}

char * sub_8013374(void)
{
    char * src = sMsgString.buffer2;
    char * dst = sMsgString.buffer3;

    StringCopy(src, sMsgString.buffer1);

    while (*src != 0)
    {
        if (*src < 0x20)
        {
            *dst++ = *src++;
        }
        else if (*src != 0x80)
        {
            *dst++ = *src++;
            *dst++ = *src++;
        }
        else
        {
            int slot;

            src++;

            switch (*src)
            {
            case 0x12:
                slot = 0;
                break;

            case 0x13:
                slot = 1;
                break;

            case 0x14:
                slot = 2;
                break;

            case 0x15:
                slot = 3;
                break;

            case 0x20:
                StringCopy(dst, GetTacticianName());
                goto next;

            case 0x22:
                StringCopy(dst, GetItemName(gActionSt.arena_begin_rand_st[0]));
                goto next;

            default:
                *dst++ = 0x80;
                *dst++ = *src++;
                continue;
            }

            StringCopy(dst, DecodeMsg(GetCharacterData(gPlaySt.unk1C[slot])->nameTextId));

        next:
            while (*dst != 0)
                dst++;

            src++;
        }
    }

    *dst = 0;
    return sMsgString.buffer3;
}

char * sub_8013488(void)
{
    char * src = sMsgString.buffer5;
    char * dst = sMsgString.buffer6;

    StringCopy(src, sMsgString.buffer1);

    while (*src != 0)
    {
        if (*src < 0x20)
        {
            *dst++ = *src++;
        }
        else if (*src != 0x80)
        {
            *dst++ = *src++;
            *dst++ = *src++;
        }
        else
        {
            src++;

            switch (*src)
            {
            case 0x20:
                StringCopy(dst, GetTacticianName());
                break;

            default:
                *dst++ = 0x80;
                *dst++ = *src++;
                continue;
            }

            while (*dst != 0)
                dst++;

            src++;
        }
    }

    *dst = 0;
    return sMsgString.buffer6;
}
