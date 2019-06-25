import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './topmenu.dart';
import './bottombar_home.dart';
import './sidemenu.dart';
import 'package:flutter/rendering.dart';
import './rightpreviewpane.dart';
import './login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './earlyfetch.dart' as efetch;
import './sharedfetch.dart' as sfetch;
import 'package:flutter/rendering.dart';

String name, email;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var hometext = "Home";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.get();
}
  void get(){
      efetch.DatabaseFetch();
      sfetch.readname().then((String n){
      setState(() {
        name = n;
      });
    });
    sfetch.readmail().then((String mail) {
      setState(() {
        email = mail;
      });
    });
  }

  void _bottompressed(String t) {
    setState(() {
      hometext = t;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(

        home: LoginPage());
  }
}
