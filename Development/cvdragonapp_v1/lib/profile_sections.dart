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
import './create_section.dart';

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
                      height: 75.0,
                      width: 75.0)),
            )
          : Container(
              padding: EdgeInsets.only(
                  top: 0.0, bottom: 15.0, right: 10.0, left: 10.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
              child: Scrollbar(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(//alignment: FractionalOffset.topLeft,

                      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.transparent.withOpacity(0.2)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.transparent.withOpacity(0.2),
                      child: Row(
//
                        children: <Widget>[



                            Container(

                            padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 30.0,bottom: 30.0),
                            child: Image(
                                image: new AssetImage("assets/" +
                                    data[index]['sectionName'].toString() +
                                    ".png"),
                                color: null,
                                height: 50,
                                width: 50,
                                fit: BoxFit.fitHeight),
                          ),



                          Container(
                              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data[index]['sectionName'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          //padding:EdgeInsets.only(top: 10.0),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "1",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          alignment: FractionalOffset.bottomLeft,
                                          padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),

                                          // padding: EdgeInsets.only(
                                          //     left: 15.0),
                                          child: InkWell(
                                            child: Container(
                                              alignment: FractionalOffset.centerLeft,
                                              padding:
                                                  EdgeInsets.only(left: 11.0),
                                              height: 35.0,
                                              width: 100.0,
                                              //alignment: FractionalOffset.bottomRight,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff232882),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  border: new Border.all(
                                                      color: Colors.white)),
//                                            child: Padding(
//                                              padding: const EdgeInsets.only(top: 1.0),
                                              child: InkWell(
                                                onTap: (
                                                    ) {
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => (CreateSection())));
                                                },
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 5),
                                                      child: Icon(Icons.add_circle,size: 20,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "Create",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1.0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                                          alignment:
                                          FractionalOffset.bottomRight,
                                          //padding: EdgeInsets.only(left: 40),
                                          // padding: EdgeInsets.only(
                                          //     left: 15.0),
                                          child: InkWell(
                                            child: Container(
                                              padding:
                                              EdgeInsets.only(left: 15.0),
                                              height: 35.0,
                                              width: 100.0,
                                              //alignment: FractionalOffset.bottomRight,
                                              decoration: BoxDecoration(
                                                  color: Colors.pink[500]
                                                      .withOpacity(0.90),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      30.0),
                                                  border: new Border.all(
                                                      color: Colors.white)),
//                                            child: Padding(
//                                              padding: const EdgeInsets.only(top: 1.0),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 5),
                                                      child: Icon(Icons.edit,size: 20,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "Edit",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          letterSpacing: 1.0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ])),
                                      ],
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
