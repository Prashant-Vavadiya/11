import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      return Get.offAllNamed('home');

    });
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfffafafa),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 300,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.asset('assets/image/LOGO.png'),
                ),
                Text("Quick WhatsApp...!",style: TextStyle(fontSize: 20),),
                ],
            ),
          ),
        ));
  }
}
