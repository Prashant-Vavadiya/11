import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:playmath/homeProvider.dart';
import 'package:playmath/levelIScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioProvider? homeproviderTrue;
  AudioProvider? homeproviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<AudioProvider>(context, listen: false).playAudio();
    if (Provider.of<AudioProvider>(context, listen: false).isPlay == true) {
      Provider.of<AudioProvider>(context, listen: false)
          .assetsAudioPlayer!
          .play();
      Provider.of<AudioProvider>(context, listen: false).play();
    }
  }

  @override
  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of<AudioProvider>(context, listen: true);
    homeproviderFalse = Provider.of<AudioProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAlertDialog,
        backgroundColor: Color(0xffEE8B60),
        child: Icon(Icons.exit_to_app),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 130,
            width: double.infinity,
            color: Color(0xffFBDAB1),
            child: Text(
              "Math is Fun!",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffEE8B60)),
            ),
          ),
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
                    icon: homeproviderFalse!.isPlay == false
                        ? Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset('assets/Image/on.png'),
                          )
                        : Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset('assets/Image/Off.png'),
                          ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LevelScreen()));
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset('assets/Image/Vector.png'),
              ),
            ),
          ),
          Text(
            "Let's Play",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Color(0xffEE8B60)),
          )
        ],
      ),
    ));
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to exit a App?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    homeproviderTrue!.assetsAudioPlayer!.pause();
  }
}
