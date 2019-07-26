import 'package:cvdragonapp_v1/demologin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import './login_page.dart';


String name, email;

void main() {

  //Turning of landscape mode..
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
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
    this.get();
}
  void get()async {
//  efetch.DatabaseFetch().get().then((onValue){
//       print("Done");
//     });

  }

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(

        home: DemoLogin());
  }
}

