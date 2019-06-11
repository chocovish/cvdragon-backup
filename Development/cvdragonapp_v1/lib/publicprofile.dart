import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
class PublicProfile extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PublicProfile();
  }
}

class _PublicProfile extends State <PublicProfile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: TopMenuBar(),
        //bottomNavigationBar: BottomBar(),
        drawer: SideMenu(),
      body: Center(child: Text("My Public Profile",style: TextStyle(fontSize: 50.0),)),
    );
  }
}
