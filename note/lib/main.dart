import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/HomeScreen.dart';
import 'package:note/SecondScreen.dart';
import 'package:note/tabbarScreen.dart';
void main()
{
  runApp(
  GetMaterialApp(
    debugShowCheckedModeBanner: false,
   routes: {
      '/':(context)=>TabbarScreen(),
      'note':(context)=>HomeScreen(),
      'second':(context)=>SecondScreen(),
   },
  )
  );
}