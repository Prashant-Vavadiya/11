import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note/AddScreen.dart';
import 'package:note/HomeController.dart';
import 'package:note/UpdateScreen.dart';
import 'package:note/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Obx(
            () => ListView.builder(
            itemCount: homeController.stdList.value.length,
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfffce3b3),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListTile(
                      leading: Text(
                          "${homeController.stdList.value[index]['name']}",style: TextStyle(fontSize: 20),),
                      title: Text(
                          "${homeController.stdList.value[index]['notes']}",style: TextStyle(fontSize: 20),),
                      trailing: IconButton(
                          onPressed: () {
                            utxtname = TextEditingController(
                                text:
                                "${homeController.stdList.value[index]['name']}");
                            utxtnote = TextEditingController(
                                text:
                                "${homeController.stdList.value[index]['notes']}");
                            Get.to(UpadteScreen());
                          },
                          icon: Icon(Icons.edit,color: Colors.green)),
                    ),
                  ),
                ),
              );
            }),
      )
    ));
  }
}
