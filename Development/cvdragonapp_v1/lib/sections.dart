import 'dart:ui' as prefix0;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'dart:async';
import './fetch.dart' as fetch;
import 'package:http/http.dart' as http;
import './my_flutter_app_icons.dart';

class Sections extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Sections();
  }
}

class _Sections extends State<Sections> {
  int id = 1;
  int authkey = 1;
  bool _isLoading = true;
  List data;

  void get() {
    fetch.getSectionData().then((List res) {
      setState(() {
        data = res;
        _isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopMenuBar(),
        // bottomNavigationBar: BottomBar(),
        drawer: SideMenu(),
        body: _isLoading
            ? DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cover.png"),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Image(
                        image: AssetImage("assets/logocv.gif"),
                        height: 75.0,
                        width: 75.0)),
              )
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cover.png"),
                        fit: BoxFit.fill)),
                child: ListView.builder(
                    padding: EdgeInsets.all(5.0),
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          margin: EdgeInsets.only(top: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: data[index]['defaultSection'].toString() == "0"
                              ? Colors.red
                              : Colors.green,
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Image(
                                          image: new AssetImage("assets/" +
                                              data[index]['sectionName']
                                                  .toString() +
                                              ".png"),
                                          color: null,
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.fitHeight),
                                      //new Tab(icon: new Image.asset("assets/Position of Responsibility.png")),
                                    ),
                                    Container(
                                      child: Text(
                                          data[index]['sectionName'].toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          )),
                                    ),
                                  ]),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 50.0, bottom: 25.0),
                                    child: Text(
                                      "Enter details about all the responsibilities you have handled and is worth mentioning in your resume",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                            height: 40.0,
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                color: Colors.green),
                                            child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 18.0,
                                                ),
                                                Text(
                                                  "Create",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      letterSpacing: 1.0),
                                                ),
                                              ],
                                            )),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                            height: 40.0,
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                color: Colors.green),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                  size: 18.0,
                                                ),
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      letterSpacing: 1.0),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              )));
                    }),
              ));
  }

  @override
  void initState() {
    super.initState();
    this.get();
  }
}
