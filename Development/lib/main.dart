import 'package:cvdragonapp_v1/demologin.dart';
import 'package:flutter/material.dart';


String name, email;

void main() {


  //Turning of landscape mode..
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var hometext = "Home";

  @override
  void initState() {
    super.initState();
    
}

  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]); //add for hiding navand status bar

    return MaterialApp(

        home: DemoLogin());
  }
}

