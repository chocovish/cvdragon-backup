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
import 'main.dart' as main;

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
                        height: MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width/6)),
              )
            : Container(
                padding: EdgeInsets.only(
                    top: 0.0, bottom: 15.0, right: 10.0, left: 10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cover.png"),
                        fit: BoxFit.fill)),
                child: Scrollbar(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: data == null ? 0 : data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              margin: EdgeInsets.only(top: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              color: Colors.white,
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 30),
                                  child: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Image(
                                              // image: new AssetImage("assets/" +
                                              //     data[index]['sectionName']
                                              //         .toString() +
                                              //     ".png"),
                                              image: AssetImage("assets/Basic Info.png"),
                                              color: null,
                                              height: MediaQuery.of(context).size.height/22,
                                              width: MediaQuery.of(context).size.width/9,
                                              fit: BoxFit.fitHeight),
                                        ),
                                        Container(
                                          child: Text(
                                              data[index]['sectionName']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Color(0xffff1e50),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ]),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 50.0, bottom: 10.0),
                                        child: Text(
                                          "Enter details about all\n the responsibilities you\n have \nhandled and is worth mentioning in your resume",
                                          style: TextStyle(
                                            color: Color(0xff232882),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )));
                        })),
              ));
  }

  @override
  void initState() {
    super.initState();
    this.get();
  }
}
