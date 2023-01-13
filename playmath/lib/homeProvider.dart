import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  bool isPlay = false;

  Duration endDuration = Duration(seconds: 0);

  void dura(Duration d1) {
    endDuration = d1;
    notifyListeners();
  }

  void play() {
    isPlay = !isPlay;
    notifyListeners();
  }

  AssetsAudioPlayer? assetsAudioPlayer = AssetsAudioPlayer();

  void playAudio() async {
    await assetsAudioPlayer!
        .open(Audio("assets/song/Gameplayground.mp3"), autoStart: true);

    assetsAudioPlayer!.current.listen((event) {
      dura(event!.audio.duration);
    });
  }

  void playpuse() {
    if (isPlay == true) {
      assetsAudioPlayer!.play();
    } else {
      assetsAudioPlayer!.pause();
    }
    play();
  }


}
