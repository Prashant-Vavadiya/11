import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsepp/Datmodel.dart';
import 'package:whatsepp/HomeController.dart';

class ChatSCreen extends StatefulWidget {
  const ChatSCreen({Key? key}) : super(key: key);

  @override
  State<ChatSCreen> createState() => _ChatSCreenState();
}

class _ChatSCreenState extends State<ChatSCreen> {

  HomeController homeController=Get.put(HomeController());
  TextEditingController txtmobail=TextEditingController();
  TextEditingController txtname=TextEditingController();
  TextEditingController txtcode=TextEditingController();
  void initState() {
    txtcode.text = "91"; //default text
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/image/back.jpg"), fit: BoxFit.cover,),
          ),
        ),

          Center(
          child: SingleChildScrollView(
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
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  SizedBox(
                  height: 60,
                  width: 60,
                  child: TextField(
                    controller: txtcode,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(10),
                        ),

                    ),
                      style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    obscureText: false,
                    keyboardType: TextInputType.number,

                  ),
                ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: TextField(
                        controller: txtmobail,
                   decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color(0xff000000)),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color(0xff000000)),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     hintText: "Mobail Number"
                   ),
                        textAlign: TextAlign.center,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 275,
                  child: TextField(
                    controller: txtname,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff000000)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff000000)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Your Massage"
                    ),
                    style: TextStyle(fontSize: 20),
                    maxLines: 3,
                    minLines: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap:()async{

                    homeController.dataModal=DataModal(mobile: txtmobail.text,name: txtname.text,code: txtcode.text);

                         await launch(
                        "https://wa.me/+${homeController.dataModal!.code}${homeController.dataModal!.mobile}?text=${homeController.dataModal!.name}");

                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Chat Now",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Back To Home",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
