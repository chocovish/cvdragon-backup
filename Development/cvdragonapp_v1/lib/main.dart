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
<<<<<<< HEAD
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
=======
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
>>>>>>> 5a729bc8ce067a26e4d07111c221544ca5c1cd5e
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
        primaryColor: Colors.deepPurple,
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
