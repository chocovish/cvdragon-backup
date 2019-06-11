import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './topmenu.dart';
import './bottombar_home.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}
class _MyApp extends State<MyApp>{
  var hometext="Home";
  void _bottompressed(String t){
     setState(() {
      hometext=t;
     });
   }
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
   
    return MaterialApp(
      theme: ThemeData( 
        primaryColor: Colors.green,
      ),
      home:Scaffold(appBar: TopMenuBar(),
        bottomNavigationBar: BottomBar(_bottompressed),
        drawer: SideMenu(),
        body: Center(child: Text(hometext,style: TextStyle(fontSize: 50.0),)),
        endDrawer: PreviewPane(),
      )
    );
  }
}
