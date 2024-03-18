#include "gbafe.h"
#include "gbafe/sio.h"

void sub_803F638(struct ProcTactician * proc)
{
    int i, j;

    for (i = 0; i < 5; i++)
    {
        ClearText(gSioTexts1 + (i + proc->text_idx * 5));
        Text_SetColor(gSioTexts1 + (i + proc->text_idx * 5), TEXT_COLOR_SYSTEM_WHITE);

        for (j = 0; j < 0xF; j++)
        {
            int idx = gUnk_081DACFE[i * 15 + j];
            const struct TacticianTextConf * conf = gTacticianTextConf + idx;
            u8 * str = conf->str[proc->line_idx * 3];

            if (*str != '\0')
            {
                Text_SetCursor(gSioTexts1 + (i + proc->text_idx * 5), conf->xpos);
                Text_DrawString(
                    gSioTexts1 + (i + proc->text_idx * 5),
                    conf->str[proc->line_idx * 3]
                );
            }
        }

        PutText(
            gSioTexts1 + (i + proc->text_idx * 5),
            gBg1Tm + TM_OFFSET(0, i * 2 + 9)
        );
    }
}

void TacticianDrawCharacters(struct ProcTactician * proc)
{
    int x;
    struct Text * text;
    const char * str = proc->str;

    ClearText(&gSioTexts3);

    if (*str != '\0')
    {
        text = &gSioTexts3;
        x = 0;
    
        while (*str != '\0')
        {
            Text_SetCursor(text, x);
            str = Text_DrawCharacter(text, str);
            x = x + 9;
        }
    }
    PutText(&gSioTexts3, gBg0Tm + TM_OFFSET(12, 5));
    EnableBgSync(BG0_SYNC_BIT);
}

int SioStrLen(u8 * buf)
{
    int i = 0;
    while (*buf != '\0')
    {
        i++;
        buf += 2; /* In FE8U, sizeof char is 1, FE7J use sizeof shiftJIS */
    }
    return i;
}
