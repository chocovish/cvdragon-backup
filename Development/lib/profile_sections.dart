import 'dart:ui' as prefix0;
import 'dart:convert';
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'dart:async';
import './fetch.dart' as fetch;
import 'package:http/http.dart' as http;
import './create_section.dart';
import './edit_section.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileSections extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileSections();
  }
}

class _ProfileSections extends State<ProfileSections> {
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
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
        backgroundColor: Colors.green,
        //label: Text("Add Profile"),
      ),
      appBar: TopMenuBar(),
      // bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      body: _isLoading
          ? DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
              child: Center(
                  child: Image(
                      image: AssetImage("assets/logocv.gif"),
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width / 6)),
            )
          : Container(
              padding:
                  EdgeInsets.only(top: 4.0, bottom: 4.0, right: 0.0, left: 0.0),
              decoration: BoxDecoration(color: Colors.black),
              child: Scrollbar(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      (EditSection(data[index]['section'].toString()))));
                        },
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              "assets/Profile Image.png",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              //heighaQuery.of(context).size.height,
                            ),
                            Center(child:
                            Container(
                              padding: new EdgeInsets.symmetric(
                                  vertical: 40, horizontal: MediaQuery.of(context).size.width/25),
                              alignment: Alignment.center,
//                      margin: EdgeInsets.only(top: MediaQuery
//                          .of(context)
//                          .size
//                          .height / 13, left: MediaQuery
//                          .of(context)
//                          .size
//                          .width / 33),
                              //alignment: Alignment.centerLeft,
                              //margin: new EdgeInsets.fromLTRB(12.0, 50.0, 40.0, 50.0),
                              child: Row(
                               // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AutoSizeText(
                                    data[index]['sectionName'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CircleAvatar(backgroundColor: Colors.black,radius: 21,
                                    child: Text("10"),),
                                ],
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.get();
  }
}
