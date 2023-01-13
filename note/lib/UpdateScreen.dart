import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/HomeController.dart';
import 'package:note/database.dart';

class UpadteScreen extends StatefulWidget {
  const UpadteScreen({Key? key}) : super(key: key);

  @override
  State<UpadteScreen> createState() => _UpadteScreenState();
}

class _UpadteScreenState extends State<UpadteScreen> {
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
      body:  ListView.builder(itemCount: 1,itemBuilder: (context,index){
        return Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              controller: utxtname,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Name"
              ),
              textAlign: TextAlign.center,
              obscureText: false,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              cursorColor: Colors.black,
              controller: utxtnote,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Notes"
              ),
              textAlign: TextAlign.center,
              obscureText: false,
              style: TextStyle(fontSize: 20),
              maxLines: 3,
              minLines: 3,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    DbHelper db = DbHelper();
                    db.deleteData(
                        "${homeController.stdList.value[index]['id']}");
                    getData();
                    Get.back();
                  },
                  child: Text("Delete"),
                  style: ElevatedButton.styleFrom(primary: Color(0xfff5ad1f)),
                ),
                ElevatedButton(
                  onPressed: () {
                    DbHelper db = DbHelper();
                    db.updateData(
                        "${homeController.stdList.value[index]['id']}",
                        utxtname.text,
                        utxtnote.text);
                    getData();
                    Get.back();
                  },
                  child: Text("Upadate"),
                  style: ElevatedButton.styleFrom(primary: Color(0xfff5ad1f)),
                ),
              ],
            ),
          ],
        );
      })
    ),);
  }
}
