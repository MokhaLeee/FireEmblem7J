#pragma once

#include "global.h"
#include "m4a.h"
#include "gba/m4a_internal.h"

struct MusicProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 pad29;
    /* 2A */ s16 filler2A[16];
    /* 4A */ s16 songId;
    /* 4C */ s16 delayCounter;
    /* 4E */ s16 unk4E;
    /* 50 */ s16 filler50[2];
    /* 54 */ struct MusicPlayerInfo * player;
    /* 58 */ s32 unk58;
    /* 5C */ s32 unk5C;
    /* 60 */ s16 filler60[2];
    /* 64 */ s16 vc_init_volume;
    /* 66 */ s16 vc_end_volume;
    /* 68 */ s16 vc_clock;
    /* 6A */ s16 vc_time_end;
};

int GetCurrentBgmSong(void);
s8 sub_80033D0(void);
void sub_80033EC(int volume);
void SetBgmVolume(int volume);
void FadeBgmOut(int speed);
void sub_8003550(int speed);
void Sound_FadeOutSE(int speed);
void StartBgmCore(int song, struct MusicPlayer * music_player);
void StartOrChangeBgm(int song, int speed, struct MusicPlayer * music_player);
void StartBgm(int song, struct MusicPlayer * music_player);
void StartBgmExt(int song, int speed, struct MusicPlayer * music_player);
void MusicFi_OnLoop(struct MusicProc * proc);
void sub_8003858(int song, int duration, struct MusicPlayerInfo * player);
void OverrideBgm(int song);
void RestoreBgm(void);
void sub_8003A68(u16 speed);
void MakeBgmOverridePersist(void);
void StartBgmVolumeChange(int volume_from, int volume_to, int duration, ProcPtr parent);
void MusicVc_OnLoop(struct MusicProc * proc);
void DelaySong_OnLoop(struct MusicProc * proc);
void sub_8003D7C(int song, int delay, struct MusicPlayerInfo * player);
void PlaySongCore(int song, struct MusicPlayerInfo * player);
void sub_8003E48(void);
void sub_8003E68(int maxchn);
void sub_8003E9C(int song);
int IsMusicProc2Running(void);
void sub_8003F28(struct MusicProc * proc);
void sub_8003F94(struct MusicProc * proc);
void CallSomeSoundMaybe(int songId, int b, int c, int d, ProcPtr parent);
bool MusicProc4Exists(void);
void sub_80040C0(int song);
void sub_80040F8(void);
void sub_8004110(void);

struct SoundSt {
    /* 00 */ u8 filler0[2];
    /* 02 */ u16 unk2;
    /* 04 */ u16 songId;
    /* 06 */ s8 is_song_playing;
    /* 07 */ s8 unk7;
    /* 08 */ s8 maxChannels;
};

extern struct SoundSt EWRAM_DATA gSoundSt;

extern struct MusicPlayerInfo gMPlayInfo_BGM1;
extern struct MusicPlayerInfo gMPlayInfo_BGM2;
extern struct MusicPlayerInfo gMPlayInfo_SE1;
extern struct MusicPlayerInfo gMPlayInfo_SE2;
extern struct MusicPlayerInfo gMPlayInfo_SE3;
extern struct MusicPlayerInfo gMPlayInfo_SE4;
extern struct MusicPlayerInfo gMPlayInfo_SE5;
extern struct MusicPlayerInfo gMPlayInfo_SE6;
extern struct MusicPlayerInfo gMPlayInfo_SE7;

extern struct ProcCmd ProcScr_MusicFadeIn[];
extern struct ProcCmd ProcScr_MusicVolumeChange[];
extern struct ProcCmd gUnk_08BBFCD8[];
extern struct ProcCmd ProcScr_MusicChange[];

#define PlaySoundEffect(id) \
    if (!gPlaySt.cfgDisableSoundEffects) \
        m4aSongNumStart((id))
