import 'package:flutter/material.dart';
import 'package:playmath/HomeScreen.dart';
import 'package:playmath/Level5Screen.dart';

class Wow4Screen extends StatefulWidget {
  const Wow4Screen({Key? key}) : super(key: key);

  @override
  State<Wow4Screen> createState() => _Wow4ScreenState();
}

class _Wow4ScreenState extends State<Wow4Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("    Wow \n Wel Done",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Color(0xffEE8B60)),),
            SizedBox(
              height: 20,
            ),
            Text("🌟 🌟 🌟",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Color(0xfff8d702)),),
            Padding(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> HomeScreen()));                },
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
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> Level5Screen()));
                },

                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset('assets/Image/level5.png'),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
  }
