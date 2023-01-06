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
  AssetsAudioPlayer? assetsAudioPlayer;

  AudioProvider? homeproviderTrue;
  AudioProvider? homeproviderFalse;

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer = AssetsAudioPlayer();
    playAudio();
  }

  void playAudio() async {
    await assetsAudioPlayer!
        .open(Audio("assets/song/song.mp3"), autoStart: true);

    assetsAudioPlayer!.current.listen((event) {
      homeproviderFalse!.dura(event!.audio.duration);
    });
  }

  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of<AudioProvider>(context, listen: true);
    homeproviderFalse = Provider.of<AudioProvider>(context, listen: false);
    return SafeArea(child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
   SystemNavigator.pop();
      },
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
             child: Text("Math is Fun!",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w500,color: Color(0xffEE8B60)),),
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
                         homeproviderFalse!.play();

                         if (homeproviderFalse!.isPlay == false) {
                           assetsAudioPlayer!.play();
                         } else {
                           assetsAudioPlayer!.pause();
                         }
                       },
                       icon: homeproviderTrue?.isPlay == true
                           ? Container(
                         height: 70,
                         width: 70,
                         decoration: BoxDecoration(shape: BoxShape.circle),
                         child: Image.asset('assets/Image/Off.png'),
                       )
                           :Container(
                         height: 70,
                         width: 70,
                         decoration: BoxDecoration(shape: BoxShape.circle),
                         child: Image.asset('assets/Image/on.png'),
                       ),),
                 ),
               ),
             ],
           ),
           SizedBox(
             height: 80,
           ),
           Center(
             child: InkWell(
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder:(context)=> LevelScreen()));
               },
               child: Container(
                 height: 100,
                 width: 100,
                 decoration: BoxDecoration(shape: BoxShape.circle),
                 child: Image.asset('assets/Image/Vector.png'),
               ),
             ),
           ),
           Text("Let's Play",style: TextStyle(fontSize: 36,fontWeight: FontWeight.w500,color: Color(0xffEE8B60)),)
         ],
       ),
    ));
  }
}
