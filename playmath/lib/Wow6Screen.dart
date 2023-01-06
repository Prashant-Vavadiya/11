import 'package:flutter/material.dart';
import 'package:playmath/HomeScreen.dart';
import 'package:playmath/Level7Screen.dart';

class Wow6Screen extends StatefulWidget {
  const Wow6Screen({Key? key}) : super(key: key);

  @override
  State<Wow6Screen> createState() => _Wow6ScreenState();
}

class _Wow6ScreenState extends State<Wow6Screen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
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
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> Level7Screen()));
                },

                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset('assets/Image/level7.png'),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
