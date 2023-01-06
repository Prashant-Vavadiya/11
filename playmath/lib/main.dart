import 'package:flutter/material.dart';
import 'package:playmath/HomeScreen.dart';
import 'package:playmath/Level3SCreen.dart';
import 'package:playmath/LevelllScreen.dart';
import 'package:playmath/homeProvider.dart';
import 'package:playmath/levelIScreen.dart';
import 'package:playmath/wowScreen.dart';
import 'package:provider/provider.dart';
 void main()
 {
   runApp(
      ChangeNotifierProvider(
        create: (context) => AudioProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
           routes: {
            '/':(context)=>HomeScreen(),
            'levell':(context)=>LevelScreen(),
            'wow':(context)=>WowScreen(),
            'level2':(context)=>LevellScreen(),
            'level3':(context)=>Level3Screen(),
           },
        ),
      )
   );
 }