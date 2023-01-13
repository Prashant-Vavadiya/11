import 'package:flutter/material.dart';
import 'package:note/HomeScreen.dart';
import 'package:note/SecondScreen.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "TODO",
              style: TextStyle(fontSize: 30),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Icon(Icons.tab),
                ),
                Tab(
                  child: Icon(Icons.note),
                ),
              ],
            ),
            backgroundColor: Color(0xfff5ad1f),
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              SecondScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
