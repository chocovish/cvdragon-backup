import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State <HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(appBar: TopMenuBar(),
      //bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      body: Center(child: Text("Home",style: TextStyle(fontSize: 40.0),)),
    );
  }
}
