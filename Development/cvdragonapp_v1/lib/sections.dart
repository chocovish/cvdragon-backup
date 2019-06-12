import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import './urlgenerator.dart'as fetch;

class Sections extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Sections();
  }
}

class _Sections extends State<Sections> {
  var id=1,authKey=1;
  final String url = fetch.urlget(id,authKey);
  List data;
  bool _isLoading = false;
  Future<String> getSWData() async {
    _isLoading =true;
    var res = await http.get(url);

    setState(() {
      _isLoading=false;
      var resBody = json.decode(res.body);
      data = resBody;
    });
   // _isLoading=false;
    return "Success!";
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopMenuBar(),
       // bottomNavigationBar: BottomBar(),
        drawer: SideMenu(),
        body: _isLoading?Center(child: CircularProgressIndicator(backgroundColor: Color(0xff232882),)):
        ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: data[index]['defaultSection'].toString() == "0"
                    ? Colors.green
                    : Colors.red,
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text(data[index]['sectionName'].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                                )
              );
  }),
    );
}

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}
