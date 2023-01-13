import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/AddScreen.dart';
import 'package:note/HomeController.dart';
import 'package:note/UpdateScreen.dart';
import 'package:note/database.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController txtname =TextEditingController();
  TextEditingController txtnote =TextEditingController();
  TextEditingController utxtname =TextEditingController();
  TextEditingController utxtnote =TextEditingController();
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    DbHelper db = DbHelper();
    homeController.stdList.value = await db.readData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xfff5ad1f),
          onPressed: (){
            Get.to(AddScreen());
          },
          child: Icon(Icons.add,size: 20,),
        ),
        body:Obx(
          ()=>GridView.builder(
      itemCount: homeController.stdList.value.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2 ),
      itemBuilder: (BuildContext context, int index) {
          return  GridTile(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: InkWell(
                onLongPress: (){
                  utxtname = TextEditingController(
                      text:
                      "${homeController.stdList.value[index]['name']}");
                  utxtnote = TextEditingController(
                      text:
                      "${homeController.stdList.value[index]['notes']}");
                 Get.to(UpadteScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfffce3b3),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                       Container(
                         alignment: Alignment.center,
                         height: 40,
                         width: 160,
                         decoration: BoxDecoration(
                             color: Color(0xfff8c259),
                             borderRadius: BorderRadius.circular(45)
                         ),
                         child: Text(
                          "${homeController.stdList.value[index]['name']}",style: TextStyle(fontSize: 30),),
                       ),
                       Text(
                        "${homeController.stdList.value[index]['notes']}",style: TextStyle(fontSize: 20),),

                    ],
                  ),
                ),
              ),
            ),
          );
      },
    ),
        )));
  }
}
