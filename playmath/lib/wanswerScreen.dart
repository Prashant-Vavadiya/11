import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playmath/HomeScreen.dart';
import 'package:playmath/homeProvider.dart';
import 'package:provider/provider.dart';

class WAnswerScreen extends StatefulWidget {
  const WAnswerScreen({Key? key}) : super(key: key);

  @override
  State<WAnswerScreen> createState() => _WAnswerScreenState();
}

class _WAnswerScreenState extends State<WAnswerScreen> {
  AssetsAudioPlayer? assetsAudioPlayer=AssetsAudioPlayer();

  AudioProvider? homeproviderTrue;
  AudioProvider? homeproviderFalse;

  @override
  void initState() {
    super.initState();
    playAudio();
  }
  void playAudio() async {
    await assetsAudioPlayer!
        .open(Audio("assets/song/GameOver.mp3"), autoStart: true);

    assetsAudioPlayer!.current.listen((event) {
      homeproviderFalse!.dura(event!.audio.duration);
    });
  }



  @override
  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of<AudioProvider>(context, listen: true);
    homeproviderFalse = Provider.of<AudioProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: IconButton(
                    onPressed: () {
                     homeproviderTrue!.playpuse();
                    },
                    icon: homeproviderTrue?.isPlay == true
                        ? Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset('assets/Image/Off.png'),
                          )
                        : Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset('assets/Image/on.png'),
                          ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wrong Answer..!!",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffEE8B60)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/Image/Home.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/Image/replay.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
