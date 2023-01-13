import 'package:exam11/homeScreen.dart';
import 'package:exam11/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
    runApp(
        MultiProvider(
          providers: [
            ListenableProvider<Api_Provider>(create: (context)=>Api_Provider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/':(context)=>HomeScreen(),
            },
          ),
        )
    );
}