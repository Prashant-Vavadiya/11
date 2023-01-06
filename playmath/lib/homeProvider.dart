import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier
{
  bool isPlay = false;

  Duration endDuration = Duration(seconds: 0);

  void dura(Duration d1)
  {
    endDuration = d1;
    notifyListeners();
  }

  void play()
  {
    isPlay = !isPlay;
    notifyListeners();
  }
}