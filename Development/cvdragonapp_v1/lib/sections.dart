import 'dart:ui' as prefix0;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'dart:async';
<<<<<<< HEAD
import './fetch.dart'as fetch;
import 'package:http/http.dart' as http;
=======
import './urlgenerator.dart' as fetch;
>>>>>>> cd94056769dd8c1bfeb841bb35d25d85d324592b

class Sections extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Sections();
  }
}

class _Sections extends State<Sections> {
<<<<<<< HEAD
  int id=1;
  int authkey=1;
  bool _isLoading = true;
List data;
  void get() {
  fetch.getSectionData().then((List res){
  setState(() {
    data=res;
  _isLoading=false;
  });
   });
    }
=======
  int id = 1;
  int authKey = 1;
  String url = fetch.urlget(1, 1);
  List data;
  bool _isLoading = false;

  Future<String> getSWData() async {
    _isLoading = true;
    var res = await http.get(url);

    setState(() {
      _isLoading = false;
      var resBody = json.decode(res.body);
      data = resBody;
    });
    // _isLoading=false;
    return "Success!";
  }
>>>>>>> cd94056769dd8c1bfeb841bb35d25d85d324592b

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
          decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/cover.png"),fit: BoxFit.fill)),
                child: ListView.builder(
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.only(top: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          color: data[index]['defaultSection'].toString() == "0"
                              ? Colors.transparent
                              : Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(25),
                            child:Center(child:Text(data[index]['sectionName'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                )),)
                          ));
                    }),
              ));
  }

  @override
  void initState() {
    super.initState();
    this.get();
  }
}
