import 'package:exam11/provider/HomeProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../model/ApiNews.dart';

class newsApi_FirstScreen extends StatefulWidget {
  const newsApi_FirstScreen({Key? key}) : super(key: key);

  @override
  State<newsApi_FirstScreen> createState() => _newsApi_FirstScreenState();
}

class _newsApi_FirstScreenState extends State<newsApi_FirstScreen> {
  @override
  void initState() {
    super.initState();   }

  final blue = const Color(0xff69695f);
  final backgroundLightFont = const Color(0xFF090909);
  Api_Provider? apiproviderT;
  Api_Provider? apiproviderF;

  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<Api_Provider>(context, listen: false);
    apiproviderT = Provider.of<Api_Provider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: FutureBuilder<ApiNews>(
                      future: apiproviderF!
                          .Apifactory("${apiproviderT!.searchdata}"), //
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          ApiNews apimodel = snapshot.data!;
                          return ListView.builder(
                            itemCount: apimodel.articles!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                height: 77,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.45,
                                                child: Text(
                                                  "${apimodel.articles![index].title}",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                height: 77,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.45,
                                                child: Text(
                                                  "${apimodel.articles![index].description}",
                                                  style: TextStyle(
                                                      color: Colors.white60),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network("${apimodel.articles![index].urlToImage}"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 12),
                                      height: 1,
                                      width: double.infinity,
                                      color: Colors.white54,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.share,
                                                color: Colors.white54,
                                              ),
                                              label: Text(
                                                "share",
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                ),
                                              )),
                                          TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.bookmark_outline,
                                                color: Colors.white54,
                                              ),
                                              label: Text(
                                                "save",
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 1.5,
                                      width: double.infinity,
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget Button(String text) {
    return InkWell(
      onTap: () {
        apiproviderF!.changeData(text);
      },
      child: Container(
        height: 30,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        child: Text(
          "$text",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: text == apiproviderF!.searchdata ? blue : backgroundLightFont,
        ),
      ),
    );
  }
}
