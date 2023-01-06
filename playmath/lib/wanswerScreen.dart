import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playmath/HomeScreen.dart';

class WAnswerScreen extends StatefulWidget {
  const WAnswerScreen({Key? key}) : super(key: key);

  @override
  State<WAnswerScreen> createState() => _WAnswerScreenState();
}

class _WAnswerScreenState extends State<WAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wrong Answer..!!",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Color(0xffEE8B60)),),
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
                  Navigator.pop(context);                },
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
    ));
  }
}
