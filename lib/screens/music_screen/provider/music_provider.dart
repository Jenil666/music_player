import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class music_provider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;
  List<Audio> songs = [
    Audio("assets/music/Oo Antava Oo Oo Antava.mp3"),
    Audio("assets/music/monster.mp3",),
    Audio("assets/music/jago.mp3",),
    Audio("assets/music/falak tu.mp3",),
    Audio("assets/music/sultan.mp3",),
  ];
  Duration totalduration = Duration();
  void intiAudio() {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(
      Playlist(
        audios: songs
      ),
      autoStart: false,
      showNotification: true,
    );
    length();
  }

  Future<void> startAudio() async {
    await assetsAudioPlayer!.play();
  }

  Future<void> stopAudio() async {
    await assetsAudioPlayer!.pause();
  }

  bool mute = false;
  void muteorUnmute()
  {
    assetsAudioPlayer!.setVolume(mute?0:1);
    mute =!mute;
    notifyListeners();
  }

  Future<void> nextsong()
  async {
   await assetsAudioPlayer!.next();
  }

  Future<void> previoussong()
  async {
    await assetsAudioPlayer!.previous();
  }

  void length()
  {
    assetsAudioPlayer!.current.listen((event) {
      totalduration = event!.audio.duration;
    },) ;
  }
}
