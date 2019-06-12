import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
class MyProfiles extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyProfiles();
  }
}

class _MyProfiles extends State <MyProfiles> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text("My Profiles",style: TextStyle(fontSize: 50.0),)),
    );

  }
}
