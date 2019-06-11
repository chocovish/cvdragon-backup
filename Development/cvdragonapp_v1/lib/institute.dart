import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
class Institutes extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Institutes();
  }
}

class _Institutes extends State <Institutes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: TopMenuBar(),
       // bottomNavigationBar: BottomBar(),
        drawer: SideMenu(),
      body: Center(child: Text("Institutes",style: TextStyle(fontSize: 50.0),)),
    );
  }
}
