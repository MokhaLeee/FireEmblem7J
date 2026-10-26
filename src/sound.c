#include "gbafe.h"

extern struct Proc * sMusicProc1;
extern struct Proc * sMusicProc2;

int GetCurrentBgmSong(void)
{
    return gSoundSt.songId;
}

s8 sub_80033D0(void)
{
    return gSoundSt.is_song_playing;
}

void sub_80033EC(int volume)
{
    MPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE4, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE5, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE6, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE7, 0xFFFF, volume);
}

void SetBgmVolume(int volume)
{
    MPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, volume);
}

void FadeBgmOut(int speed)
{
    if (speed < 0)
        speed = 6;

    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }

    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }

    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = FALSE;
}

void sub_8003550(int speed)
{
    if (speed < 0)
        speed = 6;

    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }

    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }

    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOutPause(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = FALSE;
    gSoundSt.unk7 = 1;
}

void Sound_FadeOutSE(int speed)
{
    if (speed == 0)
        speed = 6;

    m4aMPlayFadeOut(&gMPlayInfo_SE1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE2, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE3, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE4, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE5, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE6, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE7, speed);
}

void StartBgmCore(int song, struct MusicPlayer * music_player)
{
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = song;
    PlaySongCore(song, (struct MusicPlayerInfo *) music_player);
    m4aMPlayImmInit(&gMPlayInfo_BGM1);
    m4aMPlayImmInit(&gMPlayInfo_BGM2);
}

void StartOrChangeBgm(int song, int speed, struct MusicPlayer * music_player)
{
    if (gSoundSt.is_song_playing && GetCurrentBgmSong() == song)
        return;

    if (gPlaySt.cfgDisableBgm)
        return;

    sub_80040F8();

    if (gSoundSt.is_song_playing)
    {
        FadeBgmOut(speed);
        sub_8003D7C(song, speed * 16, (struct MusicPlayerInfo *) music_player);
    }
    else
    {
        StartBgmCore(song, music_player);
    }
}

void StartBgm(int song, struct MusicPlayer * music_player)
{
    StartOrChangeBgm(song, 3, music_player);
}

void StartBgmExt(int song, int speed, struct MusicPlayer * music_player)
{
    StartOrChangeBgm(song, speed, music_player);
}

void MusicFi_OnLoop(struct MusicProc * proc)
{
    int volume = Interpolate(0, 0, 0x100, proc->delayCounter, proc->unk4E);

    MPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, volume);

    proc->delayCounter++;

    if (proc->delayCounter >= proc->unk4E)
    {
        Proc_Break(proc);
        sMusicProc1 = NULL;
    }
}

void sub_8003858(int song, int duration, struct MusicPlayerInfo * player)
{
    struct MusicProc * proc;

    if (gPlaySt.cfgDisableBgm)
        return;

    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = song;

    proc = Proc_Start(ProcScr_MusicFadeIn, PROC_TREE_3);

    MPlayStop_rev01(&gMPlayInfo_BGM1);
    MPlayStop_rev01(&gMPlayInfo_BGM2);
    PlaySongCore(song, player);
    m4aMPlayImmInit(&gMPlayInfo_BGM1);
    m4aMPlayImmInit(&gMPlayInfo_BGM2);
    MPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, 0);
    MPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, 0);

    proc->delayCounter = 0;
    proc->unk4E = duration * 16;
    sMusicProc1 = (struct Proc *) proc;
}

void OverrideBgm(int song)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    gSoundSt.unk2 = gSoundSt.songId;

    if (gSoundSt.unk7 == 0)
        m4aMPlayFadeOutPause(&gMPlayInfo_BGM2, 3);

    gSoundSt.is_song_playing = FALSE;
    gSoundSt.unk7 = 0;

    if (song != 0)
        sub_8003D7C(song, 32, &gMPlayInfo_BGM1);
}

void RestoreBgm(void)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    if (gSoundSt.unk2 == 0)
        return;

    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
    m4aMPlayFadeInContinue(&gMPlayInfo_BGM2, 6);
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = gSoundSt.unk2;
    gSoundSt.unk2 = 0;
}

void sub_8003A68(u16 speed)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    if (gSoundSt.unk2 == 0)
        return;

    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
    m4aMPlayFadeInContinue(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = gSoundSt.unk2;
    gSoundSt.unk2 = 0;
}

void MakeBgmOverridePersist(void)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    gSoundSt.songId = gSoundSt.unk2;
    gSoundSt.unk2 = 0;
}

void StartBgmVolumeChange(int volume_from, int volume_to, int duration, ProcPtr parent)
{
    struct MusicProc * proc;

    if (parent)
        proc = Proc_StartBlocking(ProcScr_MusicVolumeChange, parent);
    else
        proc = Proc_Start(ProcScr_MusicVolumeChange, PROC_TREE_3);

    proc->vc_init_volume = volume_from;
    proc->vc_end_volume = volume_to;
    proc->vc_clock = 0;
    proc->vc_time_end = duration;

    if (volume_from == 0)
        volume_from = 1;

    SetBgmVolume(volume_from);
    sMusicProc2 = (struct Proc *) proc;
}

void MusicVc_OnLoop(struct MusicProc * proc)
{
    int volume = Interpolate(4, proc->vc_init_volume, proc->vc_end_volume, proc->vc_clock++, proc->vc_time_end);

    SetBgmVolume(volume);

    if (proc->vc_clock >= proc->vc_time_end)
    {
        if (proc->vc_end_volume == 0)
        {
            m4aSongNumStop(GetCurrentBgmSong());
            gSoundSt.is_song_playing = FALSE;
            gSoundSt.is_song_playing = FALSE;
            gSoundSt.unk2 = 0;
            gSoundSt.songId = 0;
        }
        else
        {
            gSoundSt.is_song_playing = TRUE;
        }

        Proc_Break(proc);
        sMusicProc2 = NULL;
    }
}

void DelaySong_OnLoop(struct MusicProc * proc)
{
    proc->delayCounter--;

    if (proc->delayCounter >= 0)
        return;

    gSoundSt.is_song_playing = TRUE;
    gSoundSt.songId = proc->songId;
    PlaySongCore(proc->songId, proc->player);
    Proc_End(proc);
}

void sub_8003D7C(int song, int delay, struct MusicPlayerInfo * player)
{
    struct MusicProc * proc;

    if (gPlaySt.cfgDisableBgm)
        return;

    proc = Proc_Start(gUnk_08BBFCD8, PROC_TREE_3);
    proc->delayCounter = delay;
    proc->songId = song;
    proc->player = player;
}

void PlaySongCore(int song, struct MusicPlayerInfo * player)
{
    if (song < 0x80)
    {
        sub_8003E9C(song);
        UnlockSoundRoomSong(NULL, song);
    }

    if (player != NULL)
        MPlayStart_rev01(player, gSongTable[song].header);
    else
        m4aSongNumStart(song);
}

void sub_8003E48(void)
{
    sub_8003E68(7);
    gSoundSt.maxChannels = -1;
}

void sub_8003E68(int maxchn)
{
    gSoundSt.maxChannels = maxchn;
    SoundMode_rev01(maxchn << SOUND_MODE_MAXCHN_SHIFT);
}

void sub_8003E9C(int song)
{
    switch (song)
    {
    case 0x29:
    case 0x2A:
    case 0x5A:
    case 0x5C:
    case 0x5F:
    case 0x74:
        if (gSoundSt.maxChannels != 8)
            sub_8003E68(8);
        break;

    default:
        if (gSoundSt.maxChannels != -1)
            sub_8003E48();
        break;
    }
}

int IsMusicProc2Running(void)
{
    if (Proc_Find(ProcScr_MusicVolumeChange) != NULL)
        return TRUE;

    return FALSE;
}

void sub_8003F28(struct MusicProc * proc)
{
    if (sub_80033D0() != 0 && proc->vc_init_volume != 0)
    {
        if (proc->unk5C == -1)
            StartBgmVolumeChange(proc->vc_init_volume, proc->vc_end_volume, proc->unk58, proc);
        else
            StartBgmVolumeChange(proc->vc_init_volume, 0, proc->unk58, proc);
    }
}

void sub_8003F94(struct MusicProc * proc)
{
    if (proc->unk5C > 0)
    {
        StartBgm(proc->unk5C, NULL);
        SetBgmVolume(proc->vc_end_volume);
    }
    else
    {
        Proc_Goto(proc, 0);
    }
}

void CallSomeSoundMaybe(int songId, int b, int c, int d, ProcPtr parent)
{
    struct MusicProc * proc;

    if (sub_80033D0() != 0 && songId == gSoundSt.songId && b == c)
        return;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_MusicChange, parent);
    else
        proc = Proc_Start(ProcScr_MusicChange, PROC_TREE_3);

    proc->unk58 = d;

    if (sub_80033D0() != 0 && songId == gSoundSt.songId)
        proc->unk5C = -1;
    else
        proc->unk5C = songId;

    proc->vc_init_volume = b;
    proc->vc_end_volume = c;
}

bool MusicProc4Exists(void)
{
    if (Proc_Find(ProcScr_MusicChange) != NULL)
        return TRUE;

    return FALSE;
}

void sub_80040C0(int song)
{
    if (song != gSoundSt.songId)
    {
        if (sub_80033D0() != 0)
            SetBgmVolume(0);

        StartBgmCore(song, NULL);
    }
}

void sub_80040F8(void)
{
    Proc_EndEach(gUnk_08BBFCD8);
}

void sub_8004110(void)
{
    sub_80040F8();
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 1);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, 1);
    gSoundSt.unk2 = 0;
    gSoundSt.songId = 0;
}
