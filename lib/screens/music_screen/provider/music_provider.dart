import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class music_provider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;

  void intiAudio() {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(
      Audio("assets/music/Oo Antava Oo Oo Antava.mp3"),
      autoStart: false,
      showNotification: true,
    );
  }

  Future<void> startAudio() async {
    await assetsAudioPlayer!.play();
  }

  Future<void> stopAudio() async {
    await assetsAudioPlayer!.pause();
  }
}
