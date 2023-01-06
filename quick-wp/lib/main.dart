import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsepp/HomeScreen.dart';
import 'package:whatsepp/chatScreen.dart';
import 'package:whatsepp/spleshScreen.dart';

void main()
{
  runApp(
 GetMaterialApp(
   debugShowCheckedModeBanner: false,
   routes: {
     '/':(context)=>SplashScreen(),
     'home':(context)=>HomeScreen(),
     'second':(context)=>ChatSCreen(),
   },
 ),
  );
}