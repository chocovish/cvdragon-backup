import 'dart:ui' as prefix0;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'dart:async';
import './localdatafetch.dart'as lfetch;
import 'package:http/http.dart' as http;
import 'main.dart' as main;

class Sections extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _Sections();
  }
}

class _Sections extends State<Sections> {
  int id = 1;
  int authkey = 1;
  bool _isLoading = true;
  List data;

  void get() {
    lfetch.getSections().then((List res) {
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
                   color: Colors.black),
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
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                               image: AssetImage('assets/AllSection/'+data[index]['section'].toString()+'-04.png'), fit: BoxFit.fitWidth)),
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 30),
                                  child: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        // Container(
                                        //   padding: EdgeInsets.only(right: 10),
                                        //   child: Image(
                                        //       // image: new AssetImage("assets/" +
                                        //       //     data[index]['sectionName']
                                        //       //         .toString() +
                                        //       //     ".png"),
                                        //       image: AssetImage("assets/Basic Info.png"),
                                        //       color: null,
                                        //       height: MediaQuery.of(context).size.height/22,
                                        //       width: MediaQuery.of(context).size.width/9,
                                        //       fit: BoxFit.fitHeight),
                                        // ),
                                        Container(
                                          child: Text(
                                              data[index]['sectionName']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ]),
                                      Padding(
                padding: EdgeInsets.all(10),
              ),
                                      Container(
                                        padding: EdgeInsets.only(
                                             bottom: 10.0),
                                        child: Text(
                                          data[index]['sectionContentApp'],
                                          style: TextStyle(
                                            color: Colors.white
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
