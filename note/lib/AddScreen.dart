import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/HomeController.dart';
import 'package:note/database.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtname =TextEditingController();
  TextEditingController txtnote =TextEditingController();
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: txtname,
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
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: txtnote,
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
                  maxLines: 20,
                  minLines: 15
                  ,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  DbHelper db = DbHelper();
                  db.insertData(txtname.text, txtnote.text);
                  getData();
                  Get.back();
                },
                child: Text("Submint"),
                style: ElevatedButton.styleFrom(primary: Color(0xfff5ad1f)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
