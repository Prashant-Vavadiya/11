import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
          body: Stack(
            children:[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/image/back.jpg"), fit: BoxFit.cover,),
                ),
              ),
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Container(
                            height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                              ),
                              child: Image.asset('assets/image/LOGO.png')),
                    ],

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("    Quick WhatsApp \n message to any one..!",style: TextStyle(fontSize: 20),),
                  SizedBox(
                    height: 50,
                  ),
                   InkWell(
                     onTap: (){
                       Get.toNamed("second");
                     },
                     child: Container(
                       alignment: Alignment.center,
                       height: 50,
                     width: 150,
                       decoration: BoxDecoration(
                           color: Color(0xff000000),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Text("Send Now",style: TextStyle(fontSize: 20,color: Colors.white),),
                     ),
                   ),
                ],
              ),
            ),
         ] ),
    ));
  }
}
